Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795035833;
	b=uTcI8QbLafkjnMEV7aCgE5V+0t0++xkl8/30WEnE0ApHZXZgywqUXAea1R6ucOviTcQz
	 vbpJmSIXi2K8CjolJ8IOSAh66eBUnANyRYa/SwL7p0fPZOOEI4HF7SoIMFKlxfMLkVe19
	 8Ews1yxfvrWNvpMEwvpR0ywQWftkhPuR+dOYjIq3FuyiOWdN2iQ66VHCqeSbNzSfqzWzj
	 hmK1d9vDPBJ0TbuZYP7LWhggUWiiFhGTyyQXpGiizHmS1IH/fdMsbTIMwCOZ9t+QVLZ4M
	 7wXMem2+dQhtStgCaZ5ADOs4npgaecd4ctQ3+QA1+IIrS2xsSUEEEMwFTTS/iQrNUJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035833;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LrlGQLEEtnfHmiKobaFWc1jYAzCVcr+GQMXlFd622xo=;
	b=uoVhK6ez/FepPXN46sjXHIsM2BOJ7kXBM9+wbHc6T9IX85nS78j62kQ57c3VbkVGwbXN
	 ur79dBC06B9n+5m8lkqW1SDRHRMZ9z6YPwrh6U239PzCfp91O2hxVsobUs492UbQaNO3z
	 J6UFyz1/LInYF8AD9/bzSEwL5EOdIIw1BXUim2O+XWIsiElbCxo4JVgB/Qjy2LsO8G6N9
	 0JyHL8DvfgW56H7Aesm6Ga7Po9TcV85At7n4EbeC+m5A+rHXiEtEHKUGwoV/nM5ax7pql
	 AF0Pw/twhUrP961NgFxULOrBFxrgt25r3zI+C2wkufqGsozi3myVDYZ5aVpPWwOTNQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VKI2sk6w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F90D60A2615
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VKI2sk6w
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795035833;
	b=u+fLhtA2VDpypeue8yG04BUv7W22cVnYFI0QquqPYWyqZimvfFHpN14/kstpKZTVnAOf
	 rfndp2BbjOAUgo5/28jT6398tHQrsU4nfWxahbvSGUgLRdufoLamiO0BUvm9d3XPgH4Nq
	 l5PWRXTpH3d5BBcvae+bsHE6gfTS+aUlGv232nY3DkwlaucoJyRmuSV8ewBQxw/AXwAS0
	 TvCDAlKEEX3DdxNsW/4q572lgl2t8tObDnd8MtifvStVQNWABjUoDD7SKu7U4ZMHQnTdy
	 TsgjFwMbx92vgdUyviKB/zjr3ot3KJqpXfUK735qqNlGwgvQl1k3Zxj5lT6wkb1tYTw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795035833;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LrlGQLEEtnfHmiKobaFWc1jYAzCVcr+GQMXlFd622xo=;
	b=oaE70r90qWfh50KtUsMvVZwg48UihYm9ZoHRAc6f5PxIjZw9ADy5VCYLvQJw8ARTZc79
	 +1/j9gUlUttgmNTM6VbEdo1EzIWHUowEBJ25TedD06UBF48nAabjrAlNRW2RqECGlEZNw
	 nXoKcIu4TlHfRk+F04u2rxWhbyl9VH8lzlpzKIbMQrm7g5H9zqe1ZKtr83TCPQGA+irbB
	 q0IC1B4GZ2eMEJOy9mrq//zWgggxa/Ma0EwHau3Ry5QjyHKVzCZ6ERXIC9vc9umW0svnN
	 6D2gF94DtokCM4kqFUMXvSwnYmXcg7QTzI59fV6dxMxF/slkIBgBVqxf/JIeEO2heZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DAA731F01575;
	Wed, 18 Nov 2026 21:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795035833;
	bh=LrlGQLEEtnfHmiKobaFWc1jYAzCVcr+GQMXlFd622xo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VKI2sk6wqtEsnvhjLsxLOQKe3I2YDe+9rFoKM6VjZCl5v2mvpWSliPfwO7FrWw2So
	 OUTMEOASsK1XP3wQD0+g/Q9ca20ee5zz05Mms7ttiyL1bM4u5n5C5Bj+D/Yhkn0w3A
	 DSHbm0NR1qlmct+aVgpfkGtGlt3mWr6UMXL0lmeFPCazMQckAhcHi1kzkRN1sjqFg0
	 QU9NmmeJFjqrGtjVFYOqtWY/Sjp67f880LnQeCespOlvvtJud8w+xF4uxeeYepP0ej
	 +mlKVh/cEKEVgCjbSonZWOmPrHpWmFO9Y+yNdWRZrrWrgIbQERwqhqRwng2OUwgcPY
	 drwLPcEc5cWRw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0801E4AFA8;
	Wed, 18 Nov 2026 21:03:44 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Thu, 19 Nov 2026 05:03:41 +0800
Subject: [PATCH v5 09/17] mm/mglru, gup: mark folios referenced via a fast
 helper
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
Message-Id: <20261119-mglru-fg-v5-9-9eee2fe97a2d@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795035820; l=2914;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=aPuSORUuSGb6n/3Hg5v3XmLoMlSfc/wD/Eg7ayRbx9Q=;
 b=mVjH56jPWf+UzjInxmZy/kp7O4dv1XnzWnKS+bF0j0IGWoAWH0R5LwmaXMcMGUyzWt6KLBOP8
 z48pHs21UafDLh+OKHavVo75L7jSb1isIoBYLuM8ZJ5b8C9AkCuLktY
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com
Content-Transfer-Encoding: 7bit

From: Kairui Song <kasong@tencent.com>

Introduce folio_inc_lru_refs_fast(): raise refs from 0 to
LRU_REFS_REFERENCED via cmpxchg, or just set PG_referenced for the
classical LRU as before. No counter update or promotion is needed,
nonzero refs are left unchanged.

This helper only aims to be fast, it exists so the gup fast path can
stay a fast path. The new helper doesn't account refs above
LRU_REFS_REFERENCED but that's fine for now as GUP never used that
or anything similar for CLRU either.

Convert the gup fast-path sites. No behavior change for classical LRU.
There isn't any regression for MGLRU either.

Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/mm_inline.h | 25 +++++++++++++++++++++++++
 mm/gup.c                  |  6 +++---
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index b15c3618a1f2..3323a3c7336b 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -483,6 +483,31 @@ static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio *folio,
 }
 #endif /* CONFIG_LRU_GEN */
 
+/**
+ * folio_inc_lru_refs_fast - Bump folio refs count without promotion.
+ * @folio: the folio
+ *
+ * Raise refs from 0 to LRU_REFS_REFERENCED and leave hotter folios
+ * untouched. For the classical LRU, a plain PG_referenced set.
+ */
+static __always_inline void folio_inc_lru_refs_fast(struct folio *folio)
+{
+	unsigned long new_flags, old_flags;
+
+	if (!lru_gen_enabled()) {
+		folio_set_referenced(folio);
+		return;
+	}
+
+	old_flags = READ_ONCE(*folio_flags(folio, 0));
+	do {
+		if (lru_get_refs_flags(old_flags))
+			break;
+		new_flags = old_flags;
+		lru_set_refs_flags(&new_flags, LRU_REFS_REFERENCED);
+	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
+}
+
 static __always_inline
 void lruvec_add_folio(struct lruvec *lruvec, struct folio *folio)
 {
diff --git a/mm/gup.c b/mm/gup.c
index 2b405cce2ca5..596e62954659 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2911,7 +2911,7 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 			gup_put_folio(folio, 1, flags);
 			goto pte_unmap;
 		}
-		folio_set_referenced(folio);
+		folio_inc_lru_refs_fast(folio);
 		pages[nr_pages] = page;
 		nr_pages++;
 	} while (ptep++, addr += PAGE_SIZE, addr != end);
@@ -2980,7 +2980,7 @@ static unsigned long gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp,
 
 	for (i = 0; i < nr_pages; i++)
 		*(pages++) = page++;
-	folio_set_referenced(folio);
+	folio_inc_lru_refs_fast(folio);
 	return nr_pages;
 }
 
@@ -3022,7 +3022,7 @@ static unsigned long gup_fast_pud_leaf(pud_t orig, pud_t *pudp,
 
 	for (i = 0; i < nr_pages; i++)
 		*(pages++) = page++;
-	folio_set_referenced(folio);
+	folio_inc_lru_refs_fast(folio);
 	return nr_pages;
 }
 

-- 
2.56.1


