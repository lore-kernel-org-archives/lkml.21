Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795035839;
	b=WYEj/sAaWhbWTZUcLS5307aG0Jp0q9x8D4Qx1mt+CwJFvHNO4CtV1kg/ZeF8kIxnFQ/p
	 vBHpF/qWSwqkxnb3GEf53zA6JTig5YzjB65QneixkXn6vE2tyWnrFXElw8PCi4UH7vblS
	 OWGndCXsvRIigNcdvTyvaWgWWa+pRCh3czJ02PbbjyNI4TzKvJhHncnzZwKTsqFciPTQN
	 S/jCwIhbq9BUI6v9HQVXFhkVShSnaVIM4O/EXk6ngX+1CWR1meIOWkh8xRVLmE0LOvDEa
	 fPlqgYAEMm4M3BwajZuM3papsWkq9goF8qQZ3yoI/IVMoDPNxjUXDI3D8dYEx28CaKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035839;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9lfMIxrq3hRipEynq2/JnfZMxHCxW1AecXQL4pdwryY=;
	b=0SkZ+XiWg7asM+PlmfmJrKGbNo8AlfwnZ0MNOQErUi0lAIjbjCvyDvCbJC4rmGoM7HhC
	 eKmivEgdzMXMZNc6AjWHnOlX1Xb2cVDAUgAk1NFJlAo3HEyGTkl8h92Fms1pZM84kXLFC
	 PD8IWh8pRCHOkgVm6mx+CekOddZXPtKC7KOSoRbMqX1nKByX+TorHKUSG9I9eRJcyx+DA
	 N8pTuCmE3KhTiXo9pXMDYUPMmh0eh+wfPI4jMbVN5Ul38qJ11D9iV666DepWD5vx7oYwf
	 l9StNRBdJjVKaiB+wH8YhgUi55CbqOZJp3Bw8ERYTBCwOl7uEHRFhDdIaz3RQH4Wcow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSa0kDGY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E4E60A2619
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSa0kDGY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795035839;
	b=Kd6xZqsGtcFsw0R31zlzoxc8Y0QvECLrdIkOR0KIaKnefEVaDPCWF++69BVJ3JMBVXwl
	 hik0UZ+H6GcZIzXDr3vfjurdIGAR+BAc0l1MSIAk8IQGqOav35Np4+74pdAQOPhHBQIuq
	 dZLfVXZXTL2RcryWgCFWBdd2aPK/ZJ8TLAxcap8+EYttTCFcR2xt0LIdrDOiRdku0Uek8
	 1+nGBwRq2DFKlG2rZ8/OttU3tzbIoMNJcQ310Sq4VZzyKSRLV+77W3gaYWxOLO59/jYxk
	 EClI9W0X/NFkl2rFlP0K4KLb9DUAwvCl8iXFdZQAyoN1eRcH6WD3Q9w5uc67yvqqjuA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795035839;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9lfMIxrq3hRipEynq2/JnfZMxHCxW1AecXQL4pdwryY=;
	b=1i9JuTmnzAFwUTpAtWTsoyQi3m1b0XQsEBUmnRN6unolazzkVkQr9PmFH0iSY/L6lvGk
	 bVtneKdqpC7WLdVynNDkK4EO0ezC1wFYkQcwpTjHBqGT0cAuFp7dpGBZ8CF2nrXJIZnVK
	 mKzwG6zaef4KcQPuZYgqqY9P72TS7Rvr1HMC0PCZsd/dmdZg07x3BjZE9yW0s6uzbhtV3
	 NIXR2s0zZ4rDZOFB4U5JSWGFmNxId34kJ82GeY5i3d1Z5daCOKmAfPUZqtnaTaiU65mtp
	 WqW4zi1/i8BWSSceGimgnS1WRjqTe6bS3jfnnV7my2vGYKymkv98U9nxq7DaJMinPIw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 159D31F00AE3;
	Wed, 18 Nov 2026 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795035839;
	bh=9lfMIxrq3hRipEynq2/JnfZMxHCxW1AecXQL4pdwryY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XSa0kDGYWSr4n/jluGDc0g29FN2o5rQ5D6lvEZJwvES1jGduStfpPpbg1zKnE7igL
	 WdFJU++ZmWLzmEhks91GVASS1I15vae3eWcJ2RLSXh+2s80z9YJoQ5x6ofDS63BCKN
	 nECHgg6r7mvGdaVYjsx7iEQWfzwHiggTEQoflMLhQR+KvWo51zxaAsz+aR7Vr6C8Hl
	 9eFZEONOosMXO8ROem7w8ln42qSZDr20v/rO4LWQjny5xxhJKh4w1DwD53X/DnGvXn
	 rLzP0p5f8l6ob9IvUnGZjmoGIwMexNFn1MhVU/m1eBMidiMPPECbiXOSruGZrI7dYY
	 5QyCYOCv2peYA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6CAC64AFB8;
	Wed, 18 Nov 2026 21:03:44 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Thu, 19 Nov 2026 05:03:45 +0800
Subject: [PATCH v5 13/17] mm/madvise: adapt for LRU refs based operations
 for MGLRU
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
Message-Id: <20261119-mglru-fg-v5-13-9eee2fe97a2d@tencent.com>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
 Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
 Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
 Zi Yan <ziy@nvidia.com>, Gregory Price <gourry@gourry.net>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
 SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
 Yu Zhao <yuzhao@google.com>, Vernon Yang <vernon2gm@gmail.com>, 
 Zicheng Wang <wangzicheng@honor.com>, Chen Ridong <chenridong@xiaomi.com>, 
 Tal Zussman <tz2294@columbia.edu>, Kairui Song <ryncsn@gmail.com>, 
 Xiang Liu <liuxiang.277@bytedance.com>, 
 Ehab Ababneh <ehab.ababneh@intel.com>, 
 Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
 Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
 Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
 damon@lists.linux.dev, linux-doc@vger.kernel.org, 
 Kairui Song <kasong@tencent.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795035820; l=4228;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=e2/wJGzz7UG796pvpeTdS9931gFtuVmfWc7pwiPH3QE=;
 b=+qZfN5m6KQraLSxPw2LvM1FrBRrXilTuqXKSet3TJOUvO75N6rGPtiesIIjGUXb2O85Wj3jA2
 F91Iy7qUcOWDYAZfWjd36BhpmJykCLiDEadB3E+6w5bq5f9AbyMuM1i
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com
Content-Transfer-Encoding: 7bit

From: Kairui Song <kasong@tencent.com>

For the active/inactive LRU, madvise clears PG_referenced so that one more
access is not enough to reactivate a folio, and keeps PG_workingset on a
folio demoted out of the active list so its refault is still accounted as
a workingset refault (PSI).

MGLRU keeps that history in the folio's refs count instead, which now
lives in PG_referenced, PG_workingset and LRU_REFS_MASK, so writing to
those bits directly corrupts the count. The two hints want different
things:

- MADV_COLD resets the count in folio_deactivate(), which also requests
  deactivation.
- MADV_PAGEOUT clears non-workingset refs and caps the rest at
  LRU_REFS_WORKINGSET after isolation, before handing the folio to
  reclaim_pages(). The hint marks the folio as cold, so the
  eviction shadow records the capped count and does not inflate the
  eviction/refault counters of the hot tiers that drive aging, while
  folios at or above the workingset threshold keep their PSI
  classification.

PG_young is cleared for both LRUs as before, so the referenced walk does
not count stale history as a recent access.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/madvise.c | 54 ++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 14 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 2d54cb9863ea..7486c492f437 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -360,6 +360,42 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
 				     FPB_MERGE_YOUNG_DIRTY);
 }
 
+static void madvise_cold_prep_folio(struct folio *folio)
+{
+	/*
+	 * VM couldn't reclaim the folio unless we clear PG_young.
+	 * As a side effect, idle-page tracking loses recent referenced history.
+	 */
+	folio_test_clear_young(folio);
+
+	/*
+	 * For the active/inactive LRU, a folio demoted out of the active
+	 * list should have PG_workingset so its refault is still accounted
+	 * as a workingset refault, and the referenced bit always needs to
+	 * be cleared even for inactive folios. For MGLRU, MADV_COLD clears
+	 * refs in folio_deactivate(); MADV_PAGEOUT handles refs after isolation.
+	 */
+	if (!lru_gen_enabled()) {
+		folio_clear_referenced(folio);
+		if (folio_test_active(folio))
+			folio_set_workingset(folio);
+	}
+}
+
+static void madvise_pageout_prep_folio(struct folio *folio)
+{
+	unsigned int refs = folio_lru_refs(folio);
+
+	/*
+	 * For MGLRU, clear refs below LRU_REFS_WORKINGSET and cap
+	 * the rest at it: MADV suggests the folio is cold, so the eviction shadow
+	 * should not record its hotness in the high tier counters, but
+	 * the workingset classification is preserved for PSI.
+	 */
+	if (lru_gen_enabled())
+		folio_set_lru_refs(folio, refs >= LRU_REFS_WORKINGSET ? LRU_REFS_WORKINGSET : 0);
+}
+
 static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 				unsigned long addr, unsigned long end,
 				struct mm_walk *walk)
@@ -434,12 +470,10 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 			tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
 		}
 
-		folio_clear_referenced(folio);
-		folio_test_clear_young(folio);
-		if (folio_test_active(folio))
-			folio_set_workingset(folio);
+		madvise_cold_prep_folio(folio);
 		if (pageout) {
 			if (folio_isolate_lru(folio)) {
+				madvise_pageout_prep_folio(folio);
 				if (folio_test_unevictable(folio))
 					folio_putback_lru(folio);
 				else
@@ -544,18 +578,10 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 			tlb_remove_tlb_entries(tlb, pte, nr, addr);
 		}
 
-		/*
-		 * We are deactivating a folio for accelerating reclaiming.
-		 * VM couldn't reclaim the folio unless we clear PG_young.
-		 * As a side effect, it makes confuse idle-page tracking
-		 * because they will miss recent referenced history.
-		 */
-		folio_clear_referenced(folio);
-		folio_test_clear_young(folio);
-		if (folio_test_active(folio))
-			folio_set_workingset(folio);
+		madvise_cold_prep_folio(folio);
 		if (pageout) {
 			if (folio_isolate_lru(folio)) {
+				madvise_pageout_prep_folio(folio);
 				if (folio_test_unevictable(folio))
 					folio_putback_lru(folio);
 				else

-- 
2.56.1


