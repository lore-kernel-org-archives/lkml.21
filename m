Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463787;
	b=2G2PK3T8E59v604OTP+xD9u9B337VyN0Altp56GSTS24I+X/VeRxMOthJP94I/vn8EsH
	 OUqqUQilc0u9s2Osmv6tAX6go+EoQdaj9z/+D+o6klhvrs7i2WXYeryLXqb5ZuuxOqQd2
	 ydW+KEIlwtq/eQmfGzWpZsqdXCQ6XecdxjV8IxjV2+ex/M4LN671/c0n2vV8EpXfzvOJ4
	 gwS/rPEQkT7AszPX25y+pXZQ/0DEpyU1Xu0Q2LKj99Q/32mysDVs5aoZSI46aX5u0JWhp
	 HUgiBQe5Mlbx90zu/ITqGC84pvnT26P+Tp1h/PDeWD95tv+m3vgdrsb7WwSJdan0iRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463787;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=09Qoe43PT4Iegq/2tV6EDeu/7nFFELs7zlPH6GSP538=;
	b=xnXpBWtxsEj/ruKV8BUUb52NyH2PnZQEMbJgbiWL2GWRWJRlUcHvMCVcjC3vXo2g4fCR
	 7DPW15gLtN1hv8X93lrOKKPfJVZOUflB9/owGO9PW/rV1RcJRsD7zyJWVTqXEZ5wGzUTM
	 8M5Dls0ZGRnSZkLY7HwtZkbG/xmAtJKY2/l4RuJe+CmGjj19amErn4ZbW52BoknXFqnOn
	 khtoBkdYyPKX3LVpcI4yqylup0OFbUWFwEHeqnnHfu/ZB6MGa5LJA13J0vxL1zPfm7ESn
	 5cZadNyTJeTO8OuSmIfzFU0xYdvW5Imq7gdmrDV0dX5lZ4+ZZls9AELdaedi/D4noEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=QkrF3T6H;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E78C606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E78C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=QkrF3T6H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=09Qoe43PT4Iegq/2tV6EDeu/7nFFELs7zlPH6GSP538=; b=QkrF3T
	6HtDiNETIOIWuNnNM+k2VV+lrscYx8EBpB8UbzgK2LkJMNLscxpwc8shZjJGh6FqgwRd3e4UggVET
	L/ferf0OlEwqveWg/SHG6gHVp3nSbUSn85IEr4m7B2uITaWwVCGbpUIXOEb/NnOQY7/g94VTz8WDZ
	ARCr6/+FPy7P6eh44Nj3swzrIEJH6Z88KV+wnxq4fnQFYrbVIBSZ6C/qmtia34ZAkH/rRlKEmZ7hV
	83oF7bV1jyR/6HhTZFNKVCBnkGKeE6Vo2y0nul6jx+mNwMc03p9YoYPzj1FqDPGUXJY7+dlgENgsy
	JPgtnHM3PVw5kvFWwbACoFuJrV4A==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xVa99-00000006IU7-1zAH;
	Mon, 23 Nov 2026 19:56:15 +0000
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Peter Xu <peterx@redhat.com>,
	Rik van Riel <riel@surriel.com>
Subject: [PATCH 7/9] mm/gup: walk multiple PTEs per follow_page_pte() call
Date: Mon, 23 Nov 2026 14:56:07 -0500
Message-ID: <20261123195609.4115244-8-riel@surriel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123195609.4115244-1-riel@surriel.com>
References: <20261123195609.4115244-1-riel@surriel.com>
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

Slow GUP resolves and commits one PTE per follow_page_pte() call, so
__get_user_pages() restarts the pgd/p4d/pud/pmd descent and retakes
the PTE lock for every page.

Walk the PTEs from the start address to the end of this page table or
VMA, whichever comes first, and commit every page found. The walk end
is computed from the inclusive end like folio_pte_range() does, not
via pmd_addr_end(), which does not clamp on 2-level page tables and
can wrap on unsigned-long overflow. A none PTE in a hugetlbfs VMA can
only be resolved to the page cache outside the PTE lock, so it is
deferred until after unlock.

A failure on the first PTE is returned to the caller. A failure after
that is a short read; __get_user_pages() retrying the read gets the
error.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 95 ++++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 61 insertions(+), 34 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 57faf0165385..b5747f2c2ca3 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -792,7 +792,7 @@ static long follow_huge_pud(struct vm_area_struct *vma,
 	if (ret)
 		return ret;
 
-	gup_fill_pages(pages, page, 1);
+	gup_fill_pages(pages, page, nr);
 	return nr;
 }
 
@@ -861,7 +861,7 @@ static long follow_huge_pmd(struct vm_area_struct *vma,
 
 	page += off;
 
-	gup_fill_pages(pages, page, 1);
+	gup_fill_pages(pages, page, nr);
 
 	return nr;
 }
@@ -1011,41 +1011,69 @@ static long gup_lookup_pte(struct vm_area_struct *vma, unsigned long address,
 	return 0;
 }
 
+/*
+ * Walk the PTEs from the start address to the end of this page table or VMA,
+ * whichever comes first, and commit every page found.
+ *
+ * A failure on the first PTE is returned to the caller. A failure after that
+ * is a short read; __get_user_pages() retrying the read will get the error.
+ *
+ * Return: the number of pages stored in @pages, 0 when no mapping exists at
+ * the start address, or a negative errno for a failure on the first PTE.
+ */
 static long follow_page_pte(struct vm_area_struct *vma,
-		unsigned long address, pmd_t *pmd, unsigned int flags,
-		struct page **pages)
+		unsigned long address, unsigned long end, pmd_t *pmd,
+		unsigned int flags, struct page **pages)
 {
 	struct mm_struct *mm = vma->vm_mm;
-	struct page *page;
+	bool pte_is_none = false;
+	pte_t *ptep, *orig_ptep;
+	unsigned long walk_end;
+	unsigned long nr = 0;
 	spinlock_t *ptl;
-	pte_t *ptep, pte;
-	long ret;
+	long ret = 0;
 
-	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
+	orig_ptep = ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
 	/* The PMD entry is empty. */
 	if (!ptep)
 		return no_page_table(vma, flags, address);
-	pte = ptep_get(ptep);
 
-	/*
-	 * no_page_table() may access the page cache for a hugetlb VMA,
-	 * which cannot be done under the PTL, so defer it until the
-	 * lock is dropped.
-	 */
-	if (pte_none(pte)) {
-		pte_unmap_unlock(ptep, ptl);
-		return no_page_table(vma, flags, address);
-	}
+	/* Clamp the walk to the VMA end or PMD boundary. */
+	walk_end = min((address & PMD_MASK) + PTRS_PER_PTE * PAGE_SIZE,
+		       vma->vm_end);
+	if (end > address && walk_end > end)
+		walk_end = end;
+
+	for (; address < walk_end; address += PAGE_SIZE, ptep++) {
+		pte_t pte = ptep_get(ptep);
+		struct page *page;
 
-	ret = gup_lookup_pte(vma, address, ptep, pte, flags, &page);
-	if (!ret && page) {
-		ret = gup_grab_fill_folio_pages(page_folio(page), page,
-						     1, pte_dirty(pte), flags, pages);
-		if (!ret)
-			ret = 1;
+		/*
+		 * no_page_table() may access the page cache for a
+		 * hugetlb VMA, which cannot be done under the PTL,
+		 * so defer it until the lock is dropped.
+		 */
+		if (pte_none(pte)) {
+			pte_is_none = true;
+			break;
+		}
+
+		ret = gup_lookup_pte(vma, address, ptep, pte, flags, &page);
+		if (ret || !page)
+			break;
+		ret = gup_grab_fill_folio_pages(page_folio(page), page, 1,
+					     pte_dirty(pte), flags,
+					     pages ? pages + nr : NULL);
+		if (ret)
+			break;
+		nr++;
 	}
+	pte_unmap_unlock(orig_ptep, ptl);
 
-	pte_unmap_unlock(ptep, ptl);
+	if (nr)
+		return nr;
+	if (pte_is_none)
+		return no_page_table(vma, flags, address);
 	return ret;
 }
 
@@ -1068,7 +1096,7 @@ static long follow_pmd_mask(struct vm_area_struct *vma,
 	if (!pmd_present(pmdval))
 		return no_page_table(vma, flags, address);
 	if (likely(!pmd_leaf(pmdval)))
-		return follow_page_pte(vma, address, pmd, flags, pages);
+		return follow_page_pte(vma, address, end, pmd, flags, pages);
 
 	if (pmd_protnone(pmdval) && !gup_can_follow_protnone(vma, flags))
 		return no_page_table(vma, flags, address);
@@ -1081,14 +1109,14 @@ static long follow_pmd_mask(struct vm_area_struct *vma,
 	}
 	if (unlikely(!pmd_leaf(pmdval))) {
 		spin_unlock(ptl);
-		return follow_page_pte(vma, address, pmd, flags, pages);
+		return follow_page_pte(vma, address, end, pmd, flags, pages);
 	}
 	if (pmd_trans_huge(pmdval) && (flags & FOLL_SPLIT_PMD)) {
 		spin_unlock(ptl);
 		split_huge_pmd(vma, pmd, address);
 		/* If pmd was left empty, stuff a page table in there quickly */
 		return pte_alloc(mm, pmd) ? -ENOMEM :
-			follow_page_pte(vma, address, pmd, flags, pages);
+			follow_page_pte(vma, address, end, pmd, flags, pages);
 	}
 	ret = follow_huge_pmd(vma, address, end, pmd, flags, pages);
 	spin_unlock(ptl);
@@ -1625,14 +1653,13 @@ static long __get_user_pages(struct mm_struct *mm,
 
 	fill_flush:
 		/*
-		 * The first page is already stored and references on the
-		 * whole run are held; fill the rest of the array and flush
-		 * the caches without any page table lock held.
+		 * The run is already stored and references on all of it are
+		 * held; the array may span several folios, so it cannot be
+		 * re-derived from the first page here. Only flush the caches
+		 * without any page table lock held.
 		 */
-		if (pages) {
-			gup_fill_pages(pages + i, pages[i], nr);
+		if (pages)
 			gup_flush_pages(vma, start, pages + i, nr);
-		}
 
 		i += nr;
 		start += nr * PAGE_SIZE;
-- 
2.56.0

