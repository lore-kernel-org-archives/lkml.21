Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795035833;
	b=Ch4LYq1y6wQgewZxQSMHpYHmuURhCPblFDoCqEaOUjkaxvecCu4R1sWaNBWO9btUhqy7
	 KuPNw2zPLCdUvax7jaUnHJGLltiTcFmHKXzMpRrCL7Tfa5vlgV8311k1Tr1I3UHnIOuZN
	 EGo2h0zNHr4bEcEDqaUqX7KMGQyg74Cux1h0QiWMkGYkMe6IqL/W+i3EwAs9GCiFYQOJD
	 ys8fL1nYq0U8cBKnpopwMuxuILAW29jhr/Si1Y4GB10qWbByYWmrU6ycYGtcH/1VEQck2
	 54Rh5NnjXJ4Rs5MfOqctqYGvFwhTzhA2ZI1co4frTGcqBTVwIGgDabq2IVPC4GhyPnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035833;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/khA+oF1NJDS5uVoY78aHVaoSy/kwoqmB5M2SwuXaHA=;
	b=OluSdErqGnf2SyCLGknlYctJPbvOvoZccP98PLB47EmuSLq1Eq7Tkl4oiCYKDxo02Xv2
	 2Ch76GoNX1txX9qMw8Qjakgo5mERLeClvLoE4uUilA9Ee+di5HK9JjV6hzXbRWqsidBPf
	 rJv0Qq0sZC+JrLVtnx6cHsjIcI+ennUWGDs2th66nViQWZJwuXgT7m6EI/5eMPBmHi5AY
	 18hF1ESsuMrSJYRtRd44gMG2t4kcCnJ13Sl4f334BK1lShfsmxJDn1VkBhM4XYRWqLbFq
	 UbXzKm28NvklrFYz/q2WXJG97RGOJfVcssTUgIqVCckvYE0GPL6iGFLavR507trw3wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="K/8ve1nV";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A6760A3818
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K/8ve1nV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795035833;
	b=bJRJ31CPFsjqj21vNvz8TLxc7JbZ5Jc+r/JhDqlCo68dlMFTEH6LIOh9BH11roILIBRg
	 ti6hponHnF+MVnDxtgQNLcBvhutDWmKy5jFIRLrFbxrhluW+6NOW+c7HWEL3hJpKKhhL1
	 Taipfh5U9Z5y7WaaoAKpuxYRZ25ZsX8DvT/GTTA6vUmSSKIRZFlGhmwkO6aPLnlRAsE5R
	 EwKmkalDw+sU2hYP1BsTf/u2+AjiQfE0blkbsHWPOhoAe3lBmq4HozvPLjMK6lpZi0Lah
	 glNxozgkykRyvcY6vl/Zz1RRFy8lpu9tet6gVpyiWOovDuQx6c/2gvFJDJ9QFFrbqgQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795035833;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/khA+oF1NJDS5uVoY78aHVaoSy/kwoqmB5M2SwuXaHA=;
	b=uWvgjUEqQX4Cp+46f24MlfmkK3jbQf+11tvM5Dd9Ep/aTMv4eMvClV4ld8RjkXxUcgrG
	 LLKx8C+tyrVd6GT/GyHDewlIiLlaE8AyyEHtrUcDLyyqs/33hntlGP/oBCeCD1ghCDLDM
	 GKjMrrrBgofAvwOFhOCQzs2Fy+olO+GNOtc4TvOk4JEEERE/n+BxwkfrEnX6YSic5pUd0
	 erkWT35TOoz5Kp6szSoCAxUsPvv6OjYnyeZxxZ0Bouzob/ohh9xYOGdJOdBNkvzGjltpa
	 Ox+JsFAK39ZhnlNafqEc179kqdtG6fnfUhLNFKpAHx8ptTb/rUIjmoAUTKq1bgufTag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E9011F00936;
	Wed, 18 Nov 2026 21:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795035833;
	bh=/khA+oF1NJDS5uVoY78aHVaoSy/kwoqmB5M2SwuXaHA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=K/8ve1nVb3/mksU5T6ngdGnJfla/q7QFp8/oYy8kx+rsRz8PMoKC62RPYS5TI+Q+2
	 nDYyj1KRHXovqjIO9T5QDzvJvItSBZg5GLZ0bCYwAisBhqfcwXa9T2DOFGKB35l70E
	 OuOK/aIrjKRaCCUuqJoKh6eIA9vjnDo3nfO6XQg7Bcy1s88fIqIhSyzw3XrAWowZbi
	 pXtFZUSLOxrMZw/Xk+nBLiB3JgLQ91xWu6iE4+mHObfvRwqUTB+lfrrUIAMMtoGzWZ
	 G35fXbwh87FIzlpoevcAySPOQM77fCVGsbTTPX7BtT9+hunEXzsuBFwXmy28Qa7Axo
	 YzS0hRJtCzDyg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E4AFD4AFA4;
	Wed, 18 Nov 2026 21:03:43 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Thu, 19 Nov 2026 05:03:40 +0800
Subject: [PATCH v5 08/17] mm/mglru: move add/del LRU size accounting out of
 lru_gen_update_size()
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
Message-Id: <20261119-mglru-fg-v5-8-9eee2fe97a2d@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795035820; l=3201;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=IMx6xZ1UYdgH8/pT8EECvr4VEPMQIFmzT2ojfi7j6eM=;
 b=5efdLIptwvbgkU2KOfLszIx7r/dpPWPZvzbfRP4VYmt9+JKNeYASC6zRHEvWm4MXQ2GGkSK2H
 EP1AAwudZXQB3k7st+uKT1b9Nc6IWqzONeHGo92DEWSw1p97bWfZDUw
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com
Content-Transfer-Encoding: 7bit

From: Kairui Song <kasong@tencent.com>

Pure code shuffle, no behavior change.  lru_gen_update_size() now only
updates the per-generation counters plus the promotion move; the
addition and deletion active/inactive accounting move to
lru_gen_add_folio() and lru_gen_del_folio(), which know the generation
and can apply the active-window test directly.

The unevictable case is untouched: unevictable folios never enter
lru_gen_add_folio() and keep being accounted by lruvec_add_folio() as
before.

Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/mm_inline.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index 180db43c3a85..b15c3618a1f2 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -322,21 +322,9 @@ static inline void lru_gen_update_size(struct lruvec *lruvec, struct folio *foli
 	if (new_gen >= 0)
 		atomic_long_add(delta, &lrugen->nr_pages[new_gen][type][zone]);
 
-	/* addition */
-	if (old_gen < 0) {
-		if (lru_gen_is_active(lruvec, new_gen))
-			lru += LRU_ACTIVE;
-		__update_lru_size(lruvec, lru, zone, delta);
+	/* return now if not a promotion */
+	if (old_gen < 0 || new_gen < 0)
 		return;
-	}
-
-	/* deletion */
-	if (new_gen < 0) {
-		if (lru_gen_is_active(lruvec, old_gen))
-			lru += LRU_ACTIVE;
-		__update_lru_size(lruvec, lru, zone, -delta);
-		return;
-	}
 
 	/* promotion */
 	if (!lru_gen_is_active(lruvec, old_gen) && lru_gen_is_active(lruvec, new_gen)) {
@@ -391,6 +379,8 @@ static inline bool __lru_gen_add_folio(struct lruvec *lruvec, struct folio *foli
 	int gen = folio_lru_gen(folio);
 	int type = folio_is_file_lru(folio);
 	int zone = folio_zonenum(folio);
+	int delta = folio_nr_pages(folio);
+	enum lru_list lru = type * LRU_INACTIVE_FILE;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 
 	BUILD_BUG_ON(BIT(LRU_GEN_WIDTH - 1) != MAX_NR_GENS);
@@ -408,6 +398,10 @@ static inline bool __lru_gen_add_folio(struct lruvec *lruvec, struct folio *foli
 	set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK | BIT(PG_active), flags);
 
 	lru_gen_update_size(lruvec, folio, -1, gen);
+	if (lru_gen_is_active(lruvec, gen))
+		lru += LRU_ACTIVE;
+	__update_lru_size(lruvec, lru, zone, delta);
+
 	/* for folio_rotate_reclaimable() */
 	if (reclaiming)
 		list_add_tail(&folio->lru, &lrugen->folios[gen][type][zone]);
@@ -432,6 +426,9 @@ static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio *folio,
 {
 	unsigned long flags;
 	int gen = folio_lru_gen(folio);
+	int zone = folio_zonenum(folio);
+	int delta = folio_nr_pages(folio);
+	enum lru_list lru = folio_is_file_lru(folio) * LRU_INACTIVE_FILE;
 
 	if (gen < 0)
 		return false;
@@ -445,6 +442,9 @@ static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio *folio,
 	gen = ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
 
 	lru_gen_update_size(lruvec, folio, gen, -1);
+	if (lru_gen_is_active(lruvec, gen))
+		lru += LRU_ACTIVE;
+	__update_lru_size(lruvec, lru, zone, -delta);
 	list_del(&folio->lru);
 
 	return true;

-- 
2.56.1


