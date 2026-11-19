Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117019;
	b=H83+Sux4GfTlAgQdjfc3J9XD9nkhHK/xLokZZBW47/+91nfpyrRb+wexBwgTY0jUwqbD
	 UqqAGYlO/w8rdfEt0Q9Cc1fPFKGg6SzGisvDPr/Li3mH2t7WNyENubsfykG7Vu9wj1ELu
	 tzChJW6h5LMywUg4ZSVz+AlWK3S+wxjvJ9/ytSVt8jzt1jj8W6jyGetnwe/8tzYzQcxKL
	 e0Fo6EiDJmnhPiXwBtjDSeiPLv7aT4xesJFDU99liW5kgxyDwIFKOye39i2pbOXi+5edw
	 BGVbEV+jF8xYU71kvQlSIsQVNMLX+znYjehWu5BLTN0h+KA8Q87ei8gUbVDUUZbCtgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117019;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=O/ZXkIjF5XTu7eQiBKvbnoC4LxM4S1aXcMO1zwi7ppQ=;
	b=F/kY5rojsyj4xUYoY7YvhLproIgoq/sRKT9T9wWJvULl3kgllm+wWeZde/Iris0uNU/M
	 KuBBOfHanIevAh7kHschEUKBmvr6k3P3LQdfcHwCAz9z2LMtIDLVNycffIgB1a3ghtngA
	 pjrX7av/4xVVaqmUnOnyfb1tD/1eAWSklCGI75rtAYBk5ODEPP2ePKbWM2fVVrSpP5ojP
	 mH0jMvN/Zr4SFrKo571c7hzIFXmzIdwPXTVJTv62ui3ILq0EDKwozHF7Xmp8sSDTF69O2
	 kt2Oi4eR5noX4C8G2EvpdFcYSJSnmf5Uk2biCaJZvEwxtCr3s/CNPFfOuB3APcf7xMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ton06EtT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DC1606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ton06EtT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE8B1F000C5;
	Thu, 19 Nov 2026 19:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117018;
	bh=O/ZXkIjF5XTu7eQiBKvbnoC4LxM4S1aXcMO1zwi7ppQ=;
	h=From:To:Subject:Date;
	b=Ton06EtT8gHbK6c/0HqHkaZiOGQATLUK+NZgUH5+xIzr8uD7Kli8XpT71wEPCcjn6
	 Jn3q7wQvDL3aRFOfKrcN7IgXzBoHoeohqHPJNRfj6cVrHDgGnqOp8STwi6IyLWfOR0
	 p5v6FyfcicDyJ9jXxtfYiTM9LZNE7GHfYW6A6q9+frbAcsGvQsDDo2C3sqVERPIvnP
	 7LNANE2iD79QpOyFPSQmg3NokwoPFYdKSSnoZvmEcLqE6O0dGWxPUr57LVrN0v0gVd
	 11ji14tavjIuovTYcG3CVtGayidMECvSLMpOhGiZBZsUlR8Zo8PyQk4ogkq6T10c5s
	 Cs1wRyQQtsvkw==
From: Chris Mason <mason@kernel.org>
To: hughd@google.com,
	david@kernel.org,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	qi.zheng@linux.dev,
	qinyuntan@linux.alibaba.com,
	shakeel.butt@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] mm/shmem: don't use the memcg of an uncharged folio
Date: Thu, 19 Nov 2026 14:36:56 -0500
Message-ID: <20261119193656.88678-1-mason@kernel.org>
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

This is relatively niche, but actually new with 7.4-rc1, and I would expect it
to trigger under heavy load with huge=always on tmpfs. We'd need to run out of
room in the tmpfs or reclaim memory while huge folios are migrated.

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

This is on top of v7.4-rc3.

Chris Mason (1):
  mm/shmem: don't use the memcg of an uncharged folio

 mm/shmem.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

--
2.55.0

