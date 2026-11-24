Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537808;
	b=Ddfo4L6ivLZQ+AD81iv9lQSQVS9q6wFG2kyajuCNVps2Ujswc8jjVhHCh3rQ5o9qjQ5S
	 sx2cD4SWwAkPIQ9PXT2qm4pw6/JUrryS2s/v9UxlbOCoBWb6EwsF99VbBXjEKchFD5kJ0
	 G6im9d0FxRBfT11Pb6LOyLz/ZPCnqSD8YeSXanQq7pkAsWg3DX3+5cdlQ1yOnyATbezQd
	 YHmemm0AmidPc9wqYPFD4PfN1IS3LDmx4PHZ519la5SJP0s9ebbAlQGTnbpv1w8gapuQd
	 APbMxE7ns1l1n6yB7ofEVUN1sU9DjiRwh3zpJJyKWx5lGk7FNLtrc+l6usxAo+/yVng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537808;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=ZhbY7Xc0nV3cRc+NgXYsDmY8cyLnSQJaGENKgPMR27Q=;
	b=zMlt2U4i41Do/W+m/pb2NeTTA88N7vPKlgPaKq6tM5hwRducyjBptCfmJrDaCXZzmjfg
	 17/sORITNJ6NiuZq2GJBLxDX1+5SmpFbkUMGKKIJ6SR9mHHOFREmVSAgFnXwnuZfcSqBc
	 VU2akF9T5yTHr8M26Alz5XuVYlEgH0ntdPVpC/sHHJIwv+sx4ByHPh00RYWclcBLSe0yZ
	 dp3QLaYpo5ry8aooL7D8ALiuZHRiXKewdDCXKU8uhQkjCMIV+ArriQ1a6KtjpEEWrVRNv
	 nCU/9FYS44xYeCn2stN/6S/DJlr3+YDS8DSpYVrjHkMdqAt/WDSD0lqQlTOLnxdy6Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MjRJGdz1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4D7606A329
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MjRJGdz1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60FB1F000ED;
	Tue, 24 Nov 2026 16:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795537807;
	bh=ZhbY7Xc0nV3cRc+NgXYsDmY8cyLnSQJaGENKgPMR27Q=;
	h=From:Subject:Date:To:Cc;
	b=MjRJGdz17ItqM7Q+FLdr9kmwkqitpLrCB+59pW36Jmc3xmDAJ/TpInLSMasM9MUq0
	 GXcZEhyaZUdxwXHjc5+IzKj7hNkr4D3q3vqZ4d5Xexr4py8oMiXJ3lBJXmcHi0x2EQ
	 VSzH/qOwU/Yk1ngXrCAeiSDmcV8y7tciyojV2BHzUK8i3N/Jg/GZEW+Yqgl5YgccLg
	 3Yva4RsI/60eURMgbkVquy4LInBdFZwyFqPQ14hDNPbhg+zFQIf+inGQjT1mGs/rQn
	 eQdgZoRJOXDlMJ2FTOppnCBWsNm4ykiXAihWAPi4fxZCVIY+Gf1EosULt3Ot+gcyoX
	 SA6SgPzJRJE2w==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: [PATCH 0/3] kmem_buckets entry point rework
Date: Tue, 24 Nov 2026 17:30:01 +0100
Message-Id: <20261124-kmalloc-entry-rework-v1-0-37b1631a67b5@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIm7BWsC/yXMQQ6CMBBA0auQWTtJp4tGvIpxUcqgI9iaKSiE9
 O5WXb7F/ztkVuEMp2YH5ZdkSbGCDg2Em49XRumrwRrriMjh+PDTlAJynHVD5XfSEb0hZ1uyrTt
 2UNOn8iDrb3u+/J2X7s5h/r6glA9bsnBueAAAAA==
X-Change-ID: 20261116-kmalloc-entry-rework-a0162912968b
To: Harry Yoo <harry@kernel.org>
Cc: Chris Down <chris@chrisdown.name>, Kees Cook <kees@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0

When pondering the boot-time slab hardening features patchset [1] it
occured to me that the kmem_buckets handling could be redone in a way
that there are no kmem_buckets pointers in kmalloc_node() and two more
functions, and we can drop some of the tedious parameter declaring and
passing macros (except those for randomizing tokens).

So instead add own entry points for kmem_buckets enabled allocations.

The first patch is a preparatory cleanup that also makes the new entry
points cheaper (in terms of binary size) by making a bet that one extra
call in the allocation fastpath is better than many functions inlining
the same code. If that bet is wrong (I haven't measured it yet) we can
add an inline there (it still removes some duplicated code) and pay the
binary size of the new entry points, but it shouldn't compromise the
whole idea.

If this is accepted, [1] should be rebased on it as it makes the
slab_buckets boot-time handling really straightforward. In fact
CONFIG_SLAB_BUCKETS could be repurposed to only control the default
behavior, while the code is always compiled in.

[1] https://lore.kernel.org/all/cover.1794506262.git.chris@chrisdown.name/

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
Vlastimil Babka (SUSE) (3):
      mm/slab: add ___do_kmalloc_node() to deduplicate code
      mm/slab: add own entry points for kmem_buckets_alloc() family
      mm/slab: drop BUCKET_PARAMS and KMALLOC_PARAMS macros

 include/linux/slab.h |  53 +++++++-----------
 mm/slub.c            | 152 ++++++++++++++++++++++++++++++++++++---------------
 2 files changed, 128 insertions(+), 77 deletions(-)
---
base-commit: 0b4d8fca3d41123c2419b8e489ea7dba34d5b7e0
change-id: 20261116-kmalloc-entry-rework-a0162912968b

