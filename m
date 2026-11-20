Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204260;
	b=sFyVDPRir/nWDdKtWh+FpQeIxLSVEqm6+4u5AmJmQjwSEtb6+dpqrd68Efoc1LdWCoYm
	 Qw32DTOuFlmFj4/uNLqgwzcVKd0lIhiNPOD8rP6snlvn3/AnIRYRo94yNQnAutrp4HXiH
	 RSAAL7jg2EOSJ5kEi5bCbFK8i6NQfxo3gHtR11tJSZgA1KCKYLK00EeaNIOJ/paDpf6ev
	 C1ChKGVnZ58dVjFaK/deG+2kan/Kky5bzcRcntfPXGO/zXq2N3fYI7fynlkDSvtYmW7B3
	 AoS4zD2sQLOahJs0W6kPPf2f9lHT25egmoIti9d469LMHY/pNoPwV2hlmEYYZbV6/1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204260;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=qvtZxwS6aBvafq8naMZLaT6JY43Ysb0JUYqUGkLxZes=;
	b=RsCphOaunnOCA71PWYYvfeMf2LfK3EL4f+MpsW2yUizXNUEgcYkOFN8vZYd+Uns4ZyE/
	 eehCRHOi7G5sxkstuEX0R3+zKsU2+R/AR1HvESPSBhbEyOeS34yMogNZAeF51DJrXGjci
	 uqnpCLuzySX//7FMs8wvufBopTYBVkWYI6BD9Z+3zc9PyVzYJiMF6zTwRH+0bqefuyMsP
	 aXl6fD1FyLWwVTItlGevYFrhVFEpvClq9rM41lBYgxovVg9ATrWulm1mN9bvaL51VILP0
	 R6DepGZGaWVC9OdNX8zYsevsbRyHzgcnLH5kES4O7DPmznMiabzG+n62U8L26RvNloA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tv5T4EdS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B9C60A2614
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tv5T4EdS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D897A1F000C6;
	Fri, 20 Nov 2026 19:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795204260;
	bh=qvtZxwS6aBvafq8naMZLaT6JY43Ysb0JUYqUGkLxZes=;
	h=From:To:Subject:Date;
	b=Tv5T4EdS8xlnjAqJgA+EoHWrBpxllAI25gggFzEvImjd95LdGAimVeUv94M+YAodg
	 Mn3kirTrVTk8M2LHAmlW3baCLW1zTRHgDFcvwGivleEykgLrmJgnwm7hvzoISwPUHi
	 f87bTP9tpgE++wnAUkgZ1hsADpVHGqLkzGmuu5LYmrRluoW1AwEnIn5Dv/eQg3jysf
	 bYJc2n1jMO6ilgvSLB1gmO+P3jQA60onJDruxwVp1dbrMwePuja7pxUgfZ5zIvMrog
	 E2WTK7vuot7W+bLhVHkXJ7OyTQ5Yt5Ido9MN+Aeez2xA/nq/sPNErrh/DiZDchVk9a
	 Gc2ANcwhiE8DQ==
From: Chris Mason <mason@kernel.org>
To: hughd@google.com,
	david@kernel.org,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	qi.zheng@linux.dev,
	qinyuntan@linux.alibaba.com,
	shakeel.butt@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	mason@kernel.org
Subject: [PATCH v2 0/1] mm/shmem: don't use the memcg of an uncharged folio
Date: Fri, 20 Nov 2026 14:50:57 -0500
Message-ID: <20261120195057.50031-1-mason@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi everyone,

This is relatively niche, but actually new with 7.4-rc1, and I would
expect it to trigger under heavy load with huge=always on tmpfs. We'd
need to run out of room in the tmpfs or reclaim memory while huge folios
are migrated.

Qinyun Tan's pending series fixes the oops:

  [PATCH v4 RESEND 2/5] mm: memcontrol: drop kmemcg_id and use
  mem_cgroup_id() for list_lru indexing
  https://lore.kernel.org/all/20261105092233.3558950-3-qinyuntan@linux.alibaba.com/

It makes memcg_list_lru_allocated() accept a NULL memcg, but I think we
can still race and corrupt lists instead:

    shmem_unused_huge_requeue()         __migrate_folio()
    ===========================         =================
    folio_memcg_list_lru_alloc()
      folio_memcg() is NULL
      no lists are allocated
                                        mem_cgroup_migrate()
                                          commit_charge(newfolio)
    get_obj_cgroup_from_folio()
      returns the objcg of memcg M
    list_lru_add(M)
      if M has no lists, the inode
      goes on the parent's list

    [ later, M gets lists of its own ]

    list_lru_del(M)
      locks M's list
      unlinks from the parent's list

I haven't tried to reproduce on top of the kmemcg_id series, so that's
all just guessing from the code.

v1->v2: adopt Qi Zheng's suggestion to return early in the failure path

v1: https://lore.kernel.org/all/20261119193656.88678-1-mason@kernel.org/

This is on top of v7.4-rc3.

Chris Mason (1):
  mm/shmem: don't use the memcg of an uncharged folio

 mm/shmem.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

-- 
2.55.0

