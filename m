Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605960;
	b=NNGD4i69GwGhjmEwezrXgsybLZMIXByoCAj3R+oOT4QfxqfPZNLW8kgiXGljO3Z1cjn3
	 +SBTrkZarrdqmOLP30WQOq31KCKMsgVXZPIrH6tQ5W5U4+0ncbozHue75Zgr5v2AEmAzX
	 NXsGvl8Er7C+oUf9TVtmEFTCfxh1bHtmLq40JvrVjvp2zHYApr4ssUmk5k3WuFiDEzw0S
	 EGEcc9AB9FBboz25bLpqPLzoCU9fbVgHuVc/2GOCd/RCzGGZfN0dXvqwr5Gss2uFx+TDK
	 632ThOHPn+E+F9+qAMTA4ZI/pJeSGqI8T8bSvktS91turTiLGkaOMM5tjPP7GLVFb3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605960;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YaMpE8mwgKIgU6RCzVSB7gVQuVXkm54ZA+zzWDgxsQY=;
	b=jIRcsuBCkjEFmESos3bk9jre6it2GHRhTPBcWbnZLmQ+Rcmlk4rsPuJqU5AwzDrWp5Ac
	 s6/Tzr9HkmbVOo0TQLQELTM4HD3CgH0kskiro4a5k13cpWc971twTJpMVfflrjyOTeXSn
	 mCAnczC7Ri4/8YxMT3xRGc/OXzxftFk8J4YfzOjj8g6XBb6QnmnkIwv9DZ7kL0mny5vmZ
	 Ircf42uEd3mwnvr5alz4VlOA1lA6MDWs+EUvG+vC1QDBRg8hQgCdKGLhhh+Ga/Kzk1c4j
	 ex7bhGIa7hqjDKP2yqskRU5UNj6xNVtKlXekEBXoxr9waEqDFiXsC6bx1s3oED3AtMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NpWuesNd;
	arc=none smtp.remote-ip=95.215.58.84
Received: from mta1.migadu.com (out-84.mta1.migadu.com [95.215.58.84])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22EC606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D22EC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NpWuesNd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tsWkXInLa1MfUdAiJPkw5Dvzk94Lc8spqVEpz2z7/KQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795605957; v=1; x=1796210757;
 b=NpWuesNdStD+2gc6JjO6Qp8XKsRCnSlzWpRraXZi7gj+eX2M1EssoNz55h7b63+iejSmDrne
 Dfzuuq9Ll4R3jDk4ZjiXtAiNepr6Pj7h+LytBLozalGUqmizvcAUP9g2VCTpx8oYvNfx0024lYC
 AgZe6y9gwILb2PakybXTI3rw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 604b38b9ccd6a9d9;
	Wed, 25 Nov 2026 11:25:57 +0000
X-Mizu-Trace-ID: 604b38b9ccd6a9d9
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH] mm/mglru: skip redundant bitmap store in lru_gen_use_mm()
Date: Wed, 25 Nov 2026 19:25:35 +0800
Message-Id: <20261125112535.4022171-1-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

lru_gen_use_mm() is called from context_switch() on every switch to a
user task and unconditionally sets mm->lru_gen.bitmap to -1. The bitmap
is only cleared by the page table walkers in get_next_mm() during aging,
so between aging passes it is already all ones and the store is
redundant.

The store is not free when the mm_struct is shared: every CPU running a
thread of the same process must take the cacheline in exclusive state,
so the line bounces between CPUs on every context switch. On x86,
switch_mm_irqs_off() returns early when switching between threads of
the same mm, which can make this the only shared write on that path.

Read the bitmap first and only write it when it is not already set.
The semantics are unchanged: the plain WRITE_ONCE() had no ordering
guarantees, and a walker clearing a bit concurrently can be missed in
either version.

Tested on an i7-13700HX (8P+8E cores, 24 threads), with turbo disabled
and the performance governor. On each CPU two tasks sched_yield() to
each other, either as threads of one process (shared mm) or as one
process per CPU (private mm, control). Context switches per second per
CPU, median of 5 runs, averaged over 2 boots of each kernel:

  CPUs   shared mm              private mm
         base     patched       base     patched
     1   1114766  1106870 -0.7% 1104512  1109284 +0.4%
     2   1086513  1110204 +2.2% 1110334  1112209 +0.2%
     4   1085872  1112258 +2.4% 1113146  1112467 -0.1%
     8   1085945  1111371 +2.3% 1111662  1111876 +0.0%
    16    660870   666748 +0.9%  665470   667058 +0.2%
    24    579382   596472 +2.9%  596177   598500 +0.4%

The 16 CPU case uses both SMT siblings of each P-core, which share the
L1/L2, so less of the traffic crosses cores. With the patch, the shared
mm case is within noise of the private mm case.

will-it-scale context_switch1 and sched_yield do not show a difference
(within 1% for both threads and processes): sched_yield runs one task
per CPU and never switches, and context_switch1 leaves the pipe peer
unpinned, so most switches stay on one CPU and the line does not move.

Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
Changes since RFC [1]:
- Split out of the RFC series and sent on its own; it is independent of
  the other two patches. Patch 2 of the RFC is in mm-new as part of
  MGLRU-FG, patch 3 will be reworked separately.
- Rebased onto mm-new, no code change. The numbers above were measured
  on next-20261023; lru_gen_use_mm() and its callers have not changed
  since.

The test program is a small C file; I can post it if that helps.

[1] https://lore.kernel.org/20261105132220.2233677-2-ridong.chen@linux.dev
 include/linux/mm_types.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 4c576e24ce42..7812b36fefff 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1541,7 +1541,8 @@ static inline void lru_gen_use_mm(struct mm_struct *mm)
 	 * used since the last time it cleared the bitmap. So it might be worth
 	 * walking the page tables of this mm_struct to clear the accessed bit.
 	 */
-	WRITE_ONCE(mm->lru_gen.bitmap, -1);
+	if (READ_ONCE(mm->lru_gen.bitmap) != -1UL)
+		WRITE_ONCE(mm->lru_gen.bitmap, -1UL);
 }
 
 #else /* !CONFIG_LRU_GEN_WALKS_MMU */

base-commit: a036649714c3446abfdc36d0ae483046432b16c5
-- 
2.34.1

