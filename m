Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795035837;
	b=gcVV1srlMr/Z52c0DV382ailZJJpm8BnmLKKo74st23jbur0MXTv5Iklct31E8rk1WFr
	 nh5R+bKNE2m8GHfpoql5T9AcCIzJR+CzZB5osoGL/MuXrfUmS0AMi/gTqpfwS9JGMHy6e
	 5fnND44/73jcpvxSAYJ2l3qdWniiT9tL+Sb3S6tMbl9ou/pLI/jLiP+5jERHqdEBQMPnx
	 +HzGE/DSOYWmiTR+ERoF8kuOyr062M9WRyKVELOXQG3qSWbfX59RC7tTFg8D8tQwvCvJi
	 FdMX5jJKqcjd82FVTlre1PfMwYrr+53nzJ0JXsbvCVpaO9cvJ1N6eOMXz6tyCV+H78w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035837;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KYyINE7jQPx2L1Va5b9g3LdqA+A1T8KDOMXxQcugP40=;
	b=g2TgDF7iMrxZQ+YxeY/TYIXUiK7rqNqtwcKxT4XdKAuy4c4UWP2+0lAa+J6AhHa3CsD9
	 9yoVZgsJM7U8pVTHQ6vsB9G+gqoRdLDf2/AIwrlvdd8LNtJgus3Xocz/R22gS2tyHR4qD
	 xF28oVas6TtBNfRwGzd4DRI1RDh/IIQyWpF1ZfkHFz97o/CHQLFlltfcUEulqY4X3E+gH
	 FI7LLEll56h21NRyUj46Jhy0lkAZlbcGkegL/FPbt8zAPCSQrvHyhAbrtCs8N8G5hr7A7
	 guuNfC66IjIg0AKUsk/IrfyLfGecECMTEeRAfAFPM6PD204k/f7IS2KelA9CxikCocw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CSylUliF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7A260A3804
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CSylUliF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795035836;
	b=Kyu9uKMlDCYKUxzGcN984R4QMNwoJUHLOrj0tjNUGbeclbnEwvTj/c4X2WvuPk2IyOvk
	 JBUqB28q/6NxtcN0gQeSsTrmLBer52QpIySGk6t+gwCpCOEK52HAPXv4IZhGjV8AvJDyu
	 SIEgPT2WadI7Y2ZZDGEku8ONQAdtmCJmSJy3CGJNZv/1q1huSQS1AMAUEDrbHylvFGb0/
	 +kcTUP5uvAtADm3fbCjPkbEDOTLUtKKit+w8xnXestMRM0CV9ut7tDitKT+VLHnSQc3kt
	 z+kmr1JTnQMHRZ5lEm/LU0PSgm9/AJVdwgISKP5+tRjhsbM7OYtnk6J4HNMdJPKFW9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795035836;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KYyINE7jQPx2L1Va5b9g3LdqA+A1T8KDOMXxQcugP40=;
	b=P8eR/j5SOo4zF0jarnf+Nm8/cNmlnwJ/aTckMFs4TeKcS4RXCKwv2uZWJdUnjCrUrnEm
	 zaqEhQDPDyEUogfe0NR+puJ/EmJDY8mIO5pE3WMZkRqKtzTpoZpZYc+aLDCbN6b2ONXrR
	 FuFi5FwHrKXE0cBKgpupo4FSQ6TerpDR5Nb1Zl5xmxcMjo8W4IQhi3SCyXYOPdfFmt5Hi
	 v2lfCZRlIN6Xs7yp0wMGlM7ACQ/GLNSSVF7euAbjSDWHgmBZu+l3rZvY8w+eSR88P+tqw
	 21M+B7p5ITex+u6aE0Af5ezPFTHh1mhq9LMZD96gTiVf+ggcGbd81En2d4VNjppacWw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54C381F000CB;
	Wed, 18 Nov 2026 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795035836;
	bh=KYyINE7jQPx2L1Va5b9g3LdqA+A1T8KDOMXxQcugP40=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CSylUliF/mcBfRuYvO+Se45cSzybxtFrVjQ70oshdKZKzqfWVQtB7L7accYoluIiN
	 1KP49H009EVA5fZ2P1px69QQLS6cCavWHR0BGwkwSPlD4vzi4yxy2YuaGsH3AdbyIl
	 hsQaIKtXhj2cye18BIqEnakx8cpcJJxMDVCZ9LP4zFiDin3hTLho9YLIW7R5QVT93m
	 p33zj2aP6dSjK4AUiYlRhk/uzXNumyqc7TOW8c7hV0RwWNoqRrQLAG86ub4cGnf9xA
	 /LtKMuNtZHPPAx42RQm8oqCAfIzc4/2Ny5x1VNi3oThVPsXhkUvXzHMFm2gs5woVZS
	 1ZrT5OattpBbA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1FC7D4AFAC;
	Wed, 18 Nov 2026 21:03:44 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Thu, 19 Nov 2026 05:03:42 +0800
Subject: [PATCH v5 10/17] mm/mglru, smaps: convert to LRU refs based
 operations for MGLRU
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
Message-Id: <20261119-mglru-fg-v5-10-9eee2fe97a2d@tencent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795035820; l=3775;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=VfESysdUSKNXugn/NNka7t20akprAGwUFTR67FoqbQg=;
 b=H/mlewAs5YjJbFgVwQ+pifGag4czhOpjZorx0B42RAmT7qz/Hj/bOIhUZb9NbEASZ65gD+Ksk
 v1bQBrilAKvAWuGJBDPUYmCJ52LsSbiUmfk07pf4LJFpIAUy3Pk/ugH
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com
Content-Transfer-Encoding: 7bit

From: Kairui Song <kasong@tencent.com>

PG_referenced is only the lowest bit of the folio LRU refs count
(LRU_REFS_FLAGS) now, and MGLRU never kept it stable: promotion used to
clear it, and now it toggles as the count grows. But with the LRU
referenced count as a stable API now, we can use two helpers to provide
in-kernel users a stable and sane reading of the referenced status of
an LRU managed folio.

Add folio_check_lru_refs() and folio_clear_lru_refs(), which use the refs
count when MGLRU is enabled and PG_referenced otherwise, and switch the
smaps paths over to them. The lru_gen_enabled() test stays inside the
helpers, so its static key is not splattered over the few call sites.

Convert smaps as the first user of them. MGLRU now reports every folio
with a nonzero count, so the reading no longer flickers and clearing no
longer results in an ambiguous status.

The classical LRU case is unchanged.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 fs/proc/task_mmu.c        |  6 +++---
 include/linux/mm_inline.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 22361607020d..f76a37d052b1 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -889,7 +889,7 @@ static void smaps_account(struct mem_size_stats *mss, struct page *page,
 
 	mss->resident += size;
 	/* Accumulate the size in pages that have been accessed. */
-	if (young || folio_test_young(folio) || folio_test_referenced(folio))
+	if (young || folio_test_young(folio) || folio_check_lru_refs(folio))
 		mss->referenced += size;
 
 	/*
@@ -1686,7 +1686,7 @@ static int clear_refs_pte_range(pmd_t *pmd, unsigned long addr,
 		/* Clear accessed and referenced bits. */
 		pmdp_test_and_clear_young(vma, addr, pmd);
 		folio_test_clear_young(folio);
-		folio_clear_referenced(folio);
+		folio_clear_lru_refs(folio);
 out:
 		spin_unlock(ptl);
 		return 0;
@@ -1715,7 +1715,7 @@ static int clear_refs_pte_range(pmd_t *pmd, unsigned long addr,
 		/* Clear accessed and referenced bits. */
 		ptep_test_and_clear_young(vma, addr, pte);
 		folio_test_clear_young(folio);
-		folio_clear_referenced(folio);
+		folio_clear_lru_refs(folio);
 	}
 	pte_unmap_unlock(pte - 1, ptl);
 	cond_resched();
diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index 3323a3c7336b..14aab2b1ed08 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -508,6 +508,37 @@ static __always_inline void folio_inc_lru_refs_fast(struct folio *folio)
 	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
 }
 
+/**
+ * folio_check_lru_refs - Test if an LRU managed folio has been referenced.
+ * @folio: The folio to test.
+ *
+ * Returns true if the MGLRU refs count is nonzero, or PG_referenced is set,
+ * which is also correct for the non-MGLRU case. Kept as a separate helper,
+ * to avoid splattering the lru_gen_enabled() static key.
+ */
+static inline bool folio_check_lru_refs(const struct folio *folio)
+{
+	if (lru_gen_enabled())
+		return folio_lru_refs(folio) > 0;
+	return folio_test_referenced(folio);
+}
+
+/**
+ * folio_clear_lru_refs - Clear the referenced state of an LRU managed folio.
+ * @folio: The folio to clear.
+ *
+ * Reset the MGLRU refs count to zero, or clear PG_referenced, leaving
+ * PG_workingset alone for the non-MGLRU case. Kept as a separate helper
+ * just like folio_check_lru_refs().
+ */
+static inline void folio_clear_lru_refs(struct folio *folio)
+{
+	if (lru_gen_enabled())
+		folio_set_lru_refs(folio, 0);
+	else
+		folio_clear_referenced(folio);
+}
+
 static __always_inline
 void lruvec_add_folio(struct lruvec *lruvec, struct folio *folio)
 {

-- 
2.56.1


