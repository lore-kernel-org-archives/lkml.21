Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037819;
	b=MPsmeLMmPatEh+6oab9m+E1MXdX6SbfZJqAYKSvmeLLowd7lOsdNZ2QJjj/z4Hm1mCnU
	 V13AKfp8ftSJ+sl0/TtwZKWF4ADNkyN/SHifx06xK1UglwmkCsRdYJZdUqnnLNpqWX/TU
	 xCuqvC7MEB+tHsnVTDflZAgQcokhMGAGgEENGDnKFYXi5uiYsjXbthUyOgk+zofM6fmJp
	 Vh3KV1MtxlSkA3TCaqxGF4OqLamhw/UhZGhRBQxRkrqgNhIxggzZkBmEjMqslLkrqMIRC
	 LCUI/az3xLD6CmnfIgUE6a+pdnfVoOPNFMb9mLO3dQ1lIu8ZMaOTxWmbPmyDaqEzt/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jueD/zAqTRryGAU3lxXfF2kbgJjijJ/SU4DUI0J/kBI=;
	b=nKEEOXwxmdM1uejDuv4NeZ0VeRREo86VlLjGKjLbCD9gmB0pAcCY9nnRc+V2rJlrwPA3
	 oR8nl9Mh6ZtCduhBiPk5ZLl4oB3dIWGRA0feZU8Oginllc1Y2Sw3NXpnwx2w5/OxysGx6
	 BUiDOd2VqM66p5LzOx/P80BhDyqoTRDVVpcdS9Wg6R1227jgx6YinzwqQQete3BlmPGeW
	 VyXXsHWoi11e8GpZS3hQKl6DDEQjbw57XLncM+SFLSml3FeZwShZqZapnsCY5LZ6hZcAF
	 dLyTYOa6y+HQR842hpbBSEoCXKYlFm93BzZLZLPCEvObeEhm6UubOipKMoGW25VdfHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kd35MRoP;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081FF606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 081FF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kd35MRoP
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so10897497b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795037818; x=1795642618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jueD/zAqTRryGAU3lxXfF2kbgJjijJ/SU4DUI0J/kBI=;
        b=kd35MRoPhV6UjbBCYoV5xSI9T2dhERdJy1I6fnT4ahToqoPZ4dSiGYP5GMGQknzGcZ
         h2BrNnp0Ht7qUEtTFMlLYJBBcgt6oSsZr6lU2/hi1U1NB2JTooLrxo/p6yktPB+iWgbQ
         RmiJoe8IJdiIfuo/V0ZQPQbqZlSH3sRbz0WmOBeWxHqyYEZxvMfzkS6DTBoGsFirdFvR
         A97Ux6282CmVNpj4eJm8lno9ZWDJ5snB89KUsp43TZJhIp5R/BdYG9cXguPfKIdO2Gcv
         GfeMqMAMzeP3Jgqbn3QDbrvpHDKGaNtHQs6QW3umNPp0Q/GCM8vyRixMk4OZMTK3lNIQ
         qyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037818; x=1795642618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jueD/zAqTRryGAU3lxXfF2kbgJjijJ/SU4DUI0J/kBI=;
        b=bH6obqjgs0r132Kbirzs39q7qa49hEeK6bRW++fMENjtuLDXFQYEo57xOQJHwXdR0p
         FofWPaZeflRTKz5ArKu+wteOkpSbSsNEqKhSnLRMld4QQdWJQDJDUVGFWd/81K2yuDdL
         59zUIVFhLSy5b3l1cafSQN+DM5TBzkLLTsClvH6BbeIoDXxIKx3ur0IMVcZRhLgcovB+
         NCQkewJe09a90wj+pHrtzv2FMoxt2dv7C7vyvxFJ7IJQNdtJ6r5ja5PUHeNzOFF9v6ea
         j6dvCDzgRW6xhH67ai6FxC55yV7otRpQdR2+pEg2yps+UkMuoAAYrKXSn6Rwtga7f2p9
         36vQ==
X-Forwarded-Encrypted: i=1; AL+hErErjDHMTYECuIZkVrcAJ5lloU09Nl/OAKdJPQONmOWXpov1cMDvt8t6o0/csWo9PkMYw87yLeuewJLrWOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZJZxKf8Gwm1cAkKW9wv6OWXDzbs9S1ANTCi0IG8v/Rr3fJSar
	hibolauYraQ1hjhZc9PgKI1u9EY7rtlf8CQ0+p3ZUrIc6uA8rXHoV+sk
X-Gm-Gg: AZFdTZcNDypXoZMUkto9MXFtWGjb3oaMCEDJbyjG4nRcMoBS2qm1mmLVqTVm7sjUc+a
	Aq235og1r3I//ds2wE0FKNRrDnbeZYFPHvSfdH5cDerLDsDxhdVEwzhF12R5OEWzlquMJnyF1Uo
	RUHHg2Mtq5qwLr0H0RPw5YQ5A9vezzVFXx00RuzaadZIH1a5PZO0n5YxmgrXBzqZuDqqrjJ+yAl
	vvqqbFWb7caXa8LtivhiwYOVfwuCm4Z2RFystsnTdOy9mTTfMEONv5v56oVnf8LYO3dy+lYXuZ2
	eYWpRwMBhCoQ1IU+rj7HYvLclddIi2lQ8aKQ3VDCFXTNJ+0F7E5pV+DTCkoJd1/SCGL3+ZInT+A
	K5ch7iYP5TITschi8+n2Sy/hKVpvE+XnGGIPxB2C6R4h6TMm1Jo+vbc2u7Pgegd7BncoXt924a0
	YWN1s4rlEGubA+37PjpMjNpcD5FqXrlvw+MsgnC9ePh4fLX8pKm6WTGvqUpJ3L8EkkUfZR97QsU
	ZFi5ePZUnTBXLooEu7fxZBFHFBV2tgfGa+GtfN7ijZB7PQCgUyAQCC6uEbVvAFXXm5bfTOH+Fux
	d/NR6eOAO8pFJVPQMpA9mmZWPDF8Ovt2O0XRR+k7Z7B0GM+ERVJRzLx5pipBCv9dWei2/8sB+h/
	Jwg==
X-Received: by 2002:a05:690c:498a:b0:8b3:22c:b40c with SMTP id 00721157ae682-8b4febcd465mr17414927b3.7.1795037817800;
        Wed, 18 Nov 2026 13:36:57 -0800 (PST)
Received: from 5163NRD-SPrabh2.ssi.samsung.com ([50.205.20.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe030be2sm24565697b3.10.2026.11.18.13.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:36:57 -0800 (PST)
From: Swarna Prabhu <sw.prabhu6@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	viro@zeniv.linux.org.uk
Cc: linux-mm@kvack.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dave@stgolabs.net,
	riel@surriel.com,
	yeoreum.yun@arm.com,
	hch@lst.de,
	Swarna Prabhu <s.prabhu@samsung.com>
Subject: [PATCH 2/5] mm/gup: make the slow path walkers record into struct gup_out
Date: Wed, 18 Nov 2026 13:34:55 -0800
Message-ID: <20261118213458.377258-3-sw.prabhu6@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118213458.377258-1-sw.prabhu6@gmail.com>
References: <20261118213458.377258-1-sw.prabhu6@gmail.com>
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

From: Swarna Prabhu <s.prabhu@samsung.com>

Pass 'struct gup_out' down the slow path in place of the pages array.

For PMD/PUD leaves, receive the first page in a local variable and
append the run through 'gup_fill_pages' after unlocking.
'gup_grab_folio_pages()' appends PTE runs under the page table lock
and 'gup_flush_pages()' flushes the newly recorded pages once
the lock has been dropped.

Descriptor based appending removes the pages[] pointer bumping in
'__get_user_pages_locked()'. !CONFIG_MMU walker records through the
descriptor as well.

Retain the existing array-based interface as wrappers around the new
*_out variants. With FOLL_LONGTERM a retry restores the descriptor
to where it was before, discarding what the failed attempt recorded.

No functional change.

Signed-off-by: Swarna Prabhu <s.prabhu@samsung.com>
Assisted-by: LLM
---
 mm/gup.c | 214 ++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 131 insertions(+), 83 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 0433579ed618..0b8dd3fde06b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -749,36 +749,40 @@ static inline bool gup_must_unshare(struct vm_area_struct *vma,
 	return gup_pages_not_requiring_unshare(vma, flags, folio, page, 1) != 1;
 }
 
+/* Record @nr pages starting at @page in @out, and flush their caches. */
 static void gup_fill_pages(struct vm_area_struct *vma, unsigned long address,
-		struct page *page, unsigned long nr, struct page **pages)
+		struct page *page, unsigned long nr, struct gup_out *out)
 {
 	unsigned long i;
 
-	if (!pages)
+	if (!out)
 		return;
 
+	gup_out_add_range(out, page_folio(page), page, nr);
+
 	for (i = 0; i < nr; i++) {
 		struct page *subpage = page + i;
 
-		pages[i] = subpage;
 		flush_anon_page(vma, subpage, address + i * PAGE_SIZE);
 		flush_dcache_page(subpage);
 	}
 }
 
 /*
- * Flush the caches for @nr pages stored in @pages. The caller already
- * holds folio references, so the pages cannot go away; this runs
- * without any page table lock held.
+ * Flush the caches for the @nr pages most recently recorded in @out, the first
+ * of which is mapped at @address. The caller already holds folio references,
+ * so the pages cannot go away; this runs without any page table lock held.
  */
 static void gup_flush_pages(struct vm_area_struct *vma, unsigned long address,
-		struct page **pages, unsigned long nr)
+		struct gup_out *out, unsigned long nr)
 {
+	struct page **pages;
 	unsigned long i;
 
-	if (!pages)
+	if (!out)
 		return;
 
+	pages = out->pages + out->nr_pages - nr;
 	for (i = 0; i < nr; i++) {
 		flush_anon_page(vma, pages[i], address + i * PAGE_SIZE);
 		flush_dcache_page(pages[i]);
@@ -972,9 +976,8 @@ static inline bool can_follow_write_pte(pte_t pte, struct page *page,
  */
 static long gup_grab_folio_pages(struct folio *folio,
 		struct page *page, unsigned long nr, bool dirty,
-		unsigned int flags, struct page **pages)
+		unsigned int flags, struct gup_out *out)
 {
-	unsigned long i;
 	long ret;
 
 	/* try_grab_folio() does nothing unless FOLL_GET or FOLL_PIN is set. */
@@ -1005,10 +1008,8 @@ static long gup_grab_folio_pages(struct folio *folio,
 		folio_mark_accessed(folio);
 	}
 
-	if (pages) {
-		for (i = 0; i < nr; i++)
-			pages[i] = page + i;
-	}
+	if (out)
+		gup_out_add_range(out, folio, page, nr);
 
 	return 0;
 }
@@ -1100,7 +1101,7 @@ static unsigned long gup_pte_batch_len(struct vm_area_struct *vma,
  */
 static long follow_page_pte(struct vm_area_struct *vma,
 		unsigned long address, unsigned long end, pmd_t *pmd,
-		unsigned int flags, struct page **pages)
+		unsigned int flags, struct gup_out *out)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	bool need_no_page_table = false;
@@ -1143,8 +1144,7 @@ static long follow_page_pte(struct vm_area_struct *vma,
 		batch = gup_pte_batch_len(vma, address, walk_end, folio,
 					 ptep, &batch_pte, flags);
 		ret = gup_grab_folio_pages(folio, page, batch,
-						     pte_dirty(batch_pte), flags,
-						     pages ? pages + nr : NULL);
+						     pte_dirty(batch_pte), flags, out);
 		if (ret)
 			break;
 		nr += batch;
@@ -1158,7 +1158,7 @@ static long follow_page_pte(struct vm_area_struct *vma,
 	pte_unmap_unlock(orig_ptep, ptl);
 
 	if (nr) {
-		gup_flush_pages(vma, base, pages, nr);
+		gup_flush_pages(vma, base, out, nr);
 		return nr;
 	}
 	if (need_no_page_table)
@@ -1168,9 +1168,10 @@ static long follow_page_pte(struct vm_area_struct *vma,
 
 static long follow_pmd_mask(struct vm_area_struct *vma,
 		unsigned long address, unsigned long end, pud_t *pudp,
-		unsigned int flags, struct page **pages)
+		unsigned int flags, struct gup_out *out)
 {
 	pmd_t *pmd, pmdval;
+	struct page *page;
 	spinlock_t *ptl;
 	long ret;
 	struct mm_struct *mm = vma->vm_mm;
@@ -1182,7 +1183,7 @@ static long follow_pmd_mask(struct vm_area_struct *vma,
 	if (!pmd_present(pmdval))
 		return no_page_table(vma, flags, address);
 	if (likely(!pmd_leaf(pmdval)))
-		return follow_page_pte(vma, address, end, pmd, flags, pages);
+		return follow_page_pte(vma, address, end, pmd, flags, out);
 
 	if (pmd_protnone(pmdval) && !gup_can_follow_protnone(vma, flags))
 		return no_page_table(vma, flags, address);
@@ -1195,33 +1196,34 @@ static long follow_pmd_mask(struct vm_area_struct *vma,
 	}
 	if (unlikely(!pmd_leaf(pmdval))) {
 		spin_unlock(ptl);
-		return follow_page_pte(vma, address, end, pmd, flags, pages);
+		return follow_page_pte(vma, address, end, pmd, flags, out);
 	}
 	if (pmd_trans_huge(pmdval) && (flags & FOLL_SPLIT_PMD)) {
 		spin_unlock(ptl);
 		split_huge_pmd(vma, pmd, address);
 		/* If pmd was left empty, stuff a page table in there quickly */
 		return pte_alloc(mm, pmd) ? -ENOMEM :
-			follow_page_pte(vma, address, end, pmd, flags, pages);
+			follow_page_pte(vma, address, end, pmd, flags, out);
 	}
-	ret = follow_huge_pmd(vma, address, end, pmd, flags, pages);
+	ret = follow_huge_pmd(vma, address, end, pmd, flags, &page);
 	spin_unlock(ptl);
 
 	/*
-	 * The ref is already held, so the page cannot go away: fill the
-	 * array and flush caches without the pmd lock.
+	 * The ref is already held, so the page cannot go away: record the
+	 * pages and flush caches without the pmd lock.
 	 */
-	if (ret > 0 && pages)
-		gup_fill_pages(vma, address, pages[0], ret, pages);
+	if (ret > 0)
+		gup_fill_pages(vma, address, page, ret, out);
 
 	return ret;
 }
 
 static long follow_pud_mask(struct vm_area_struct *vma,
 		unsigned long address, unsigned long end, p4d_t *p4dp,
-		unsigned int flags, struct page **pages)
+		unsigned int flags, struct gup_out *out)
 {
 	pud_t *pudp, pud;
+	struct page *page;
 	spinlock_t *ptl;
 	long ret;
 	struct mm_struct *mm = vma->vm_mm;
@@ -1232,16 +1234,16 @@ static long follow_pud_mask(struct vm_area_struct *vma,
 		return no_page_table(vma, flags, address);
 	if (pud_leaf(pud)) {
 		ptl = pud_lock(mm, pudp);
-		ret = follow_huge_pud(vma, address, end, pudp, flags, pages);
+		ret = follow_huge_pud(vma, address, end, pudp, flags, &page);
 		spin_unlock(ptl);
 		/*
-		 * The ref is already held, so the page cannot go away: fill
-		 * the array and flush caches without the lock. A 1 GB folio
+		 * The ref is already held, so the page cannot go away: record
+		 * the pages and flush caches without the lock. A 1 GB folio
 		 * can be up to HPAGE_PUD_NR pages, too long to flush under a
 		 * spinlock.
 		 */
-		if (ret > 0 && pages)
-			gup_fill_pages(vma, address, pages[0], ret, pages);
+		if (ret > 0)
+			gup_fill_pages(vma, address, page, ret, out);
 		if (ret)
 			return ret;
 		return no_page_table(vma, flags, address);
@@ -1249,12 +1251,12 @@ static long follow_pud_mask(struct vm_area_struct *vma,
 	if (unlikely(pud_bad(pud)))
 		return no_page_table(vma, flags, address);
 
-	return follow_pmd_mask(vma, address, end, pudp, flags, pages);
+	return follow_pmd_mask(vma, address, end, pudp, flags, out);
 }
 
 static long follow_p4d_mask(struct vm_area_struct *vma,
 		unsigned long address, unsigned long end, pgd_t *pgdp,
-		unsigned int flags, struct page **pages)
+		unsigned int flags, struct gup_out *out)
 {
 	p4d_t *p4dp, p4d;
 
@@ -1265,7 +1267,7 @@ static long follow_p4d_mask(struct vm_area_struct *vma,
 	if (!p4d_present(p4d) || p4d_bad(p4d))
 		return no_page_table(vma, flags, address);
 
-	return follow_pud_mask(vma, address, end, p4dp, flags, pages);
+	return follow_pud_mask(vma, address, end, p4dp, flags, out);
 }
 
 /**
@@ -1274,9 +1276,9 @@ static long follow_p4d_mask(struct vm_area_struct *vma,
  * @address: virtual address to look up
  * @end: virtual address at which to stop batching contiguous pages
  * @flags: flags modifying lookup behaviour
- * @pages: array to receive the pages, refcounted per @flags, or NULL to
- *         walk the page tables (e.g. to fault pages in) without collecting
- *         or refcounting them
+ * @out: output descriptor to receive the pages, refcounted per @flags, or
+ *       NULL to walk the page tables (e.g. to fault pages in) without
+ *       collecting or refcounting them
  *
  * @flags can have FOLL_ flags set, defined in <linux/mm.h>
  *
@@ -1286,14 +1288,14 @@ static long follow_p4d_mask(struct vm_area_struct *vma,
  * relevant with FOLL_PIN and !FOLL_WRITE.
  *
  * Return: the number of contiguous pages starting at @address that were
- * placed into @pages (if non-NULL), which may be fewer than the pages
+ * recorded in @out (if non-NULL), which may be fewer than the pages
  * requested via @end; 0 if no mapping exists at @address; or a negative
  * errno for a mapping to something not represented by a page descriptor
  * (see also vm_normal_page()).
  */
 static long follow_page_mask(struct vm_area_struct *vma,
 		unsigned long address, unsigned long end,
-		unsigned int flags, struct page **pages)
+		unsigned int flags, struct gup_out *out)
 {
 	pgd_t *pgd;
 	struct mm_struct *mm = vma->vm_mm;
@@ -1306,7 +1308,7 @@ static long follow_page_mask(struct vm_area_struct *vma,
 	if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
 		ret = no_page_table(vma, flags, address);
 	else
-		ret = follow_p4d_mask(vma, address, end, pgd, flags, pages);
+		ret = follow_p4d_mask(vma, address, end, pgd, flags, out);
 
 	vma_pgtable_walk_end(vma);
 
@@ -1589,9 +1591,8 @@ static struct vm_area_struct *gup_vma_lookup(struct mm_struct *mm,
  * @start:	starting user address
  * @nr_pages:	number of pages from start to pin
  * @gup_flags:	flags modifying pin behaviour
- * @pages:	array that receives pointers to the pages pinned.
- *		Should be at least nr_pages long. Or NULL, if caller
- *		only intends to ensure the pages are faulted in.
+ * @out:	output descriptor receiving the pinned pages, or NULL if the
+ *		caller only intends to ensure the pages are faulted in.
  * @locked:     whether we're still with the mmap_lock held
  *
  * Returns either number of pages pinned (which may be less than the
@@ -1639,7 +1640,7 @@ static struct vm_area_struct *gup_vma_lookup(struct mm_struct *mm,
  */
 static long __get_user_pages(struct mm_struct *mm,
 		unsigned long start, unsigned long nr_pages,
-		unsigned int gup_flags, struct page **pages,
+		unsigned int gup_flags, struct gup_out *out,
 		int *locked)
 {
 	long ret = 0, i = 0;
@@ -1650,7 +1651,7 @@ static long __get_user_pages(struct mm_struct *mm,
 
 	start = untagged_addr_remote(mm, start);
 
-	VM_WARN_ON_ONCE(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
+	VM_WARN_ON_ONCE(!!out != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
 
 	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
 	VM_WARN_ON_ONCE((gup_flags & (FOLL_PIN | FOLL_GET)) ==
@@ -1682,11 +1683,10 @@ static long __get_user_pages(struct mm_struct *mm,
 			if (!vma && in_gate_area(mm, start)) {
 				ret = get_gate_page(mm, start & PAGE_MASK,
 						gup_flags, &vma,
-						pages ? &page : NULL);
+						out ? &page : NULL);
 				if (ret)
 					goto out;
-				gup_fill_pages(vma, start, page, 1,
-					       pages ? pages + i : NULL);
+				gup_fill_pages(vma, start, page, 1, out);
 				i++;
 				start += PAGE_SIZE;
 				nr_pages--;
@@ -1713,7 +1713,7 @@ static long __get_user_pages(struct mm_struct *mm,
 		cond_resched();
 
 		nr = follow_page_mask(vma, start, start + nr_pages * PAGE_SIZE,
-				      gup_flags, pages ? &pages[i] : NULL);
+				      gup_flags, out);
 		if (!nr || nr == -EMLINK) {
 			ret = faultin_page(vma, start, gup_flags,
 					   nr == -EMLINK, locked);
@@ -1733,12 +1733,12 @@ static long __get_user_pages(struct mm_struct *mm,
 		} else if (nr == -EEXIST) {
 			/*
 			 * Proper page table entry exists, but no corresponding
-			 * struct page. If the caller expects **pages to be
-			 * filled in, bail out now, because that can't be done
+			 * struct page. If the caller expects the pages to be
+			 * reported, bail out now, because that can't be done
 			 * for this page. Otherwise advance by the one page
 			 * follow_page_mask() looked at.
 			 */
-			if (pages) {
+			if (out) {
 				ret = nr;
 				goto out;
 			}
@@ -1896,10 +1896,10 @@ static bool gup_signal_pending(unsigned int flags)
  * Please note that this function, unlike __get_user_pages(), will not return 0
  * for nr_pages > 0, unless FOLL_NOWAIT is used.
  */
-static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
+static __always_inline long __get_user_pages_locked_out(struct mm_struct *mm,
 						unsigned long start,
 						unsigned long nr_pages,
-						struct page **pages,
+						struct gup_out *out,
 						int *locked,
 						unsigned int flags)
 {
@@ -1934,12 +1934,12 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
 	 * FOLL_PIN always expects pages to be non-null, but no need to assert
 	 * that here, as any failures will be obvious enough.
 	 */
-	if (pages && !(flags & FOLL_PIN))
+	if (out && !(flags & FOLL_PIN))
 		flags |= FOLL_GET;
 
 	pages_done = 0;
 	for (;;) {
-		ret = __get_user_pages(mm, start, nr_pages, flags, pages,
+		ret = __get_user_pages(mm, start, nr_pages, flags, out,
 				       locked);
 		if (!(flags & FOLL_UNLOCKABLE)) {
 			/* VM_FAULT_RETRY couldn't trigger, bypass */
@@ -1965,12 +1965,7 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
 				pages_done = ret;
 			break;
 		}
-		/*
-		 * VM_FAULT_RETRY triggered, so seek to the faulting offset.
-		 * For the prefault case (!pages) we only update counts.
-		 */
-		if (likely(pages))
-			pages += ret;
+		/* VM_FAULT_RETRY triggered, so seek to the faulting offset. */
 		start += ret << PAGE_SHIFT;
 
 		/* The lock was temporarily dropped, so we must unlock later */
@@ -2000,7 +1995,7 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
 
 		*locked = 1;
 		ret = __get_user_pages(mm, start, 1, flags | FOLL_TRIED,
-				       pages, locked);
+				       out, locked);
 		if (!*locked) {
 			/* Continue to retry until we succeeded */
 			VM_WARN_ON_ONCE(ret != 0);
@@ -2016,8 +2011,6 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
 		pages_done++;
 		if (!nr_pages)
 			break;
-		if (likely(pages))
-			pages++;
 		start += PAGE_SIZE;
 	}
 	if (must_unlock && *locked) {
@@ -2040,6 +2033,19 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
 	return pages_done;
 }
 
+static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
+						unsigned long start,
+						unsigned long nr_pages,
+						struct page **pages,
+						int *locked,
+						unsigned int flags)
+{
+	struct gup_out out = GUP_OUT_PAGES(pages);
+
+	return __get_user_pages_locked_out(mm, start, nr_pages,
+					   pages ? &out : NULL, locked, flags);
+}
+
 /**
  * populate_vma_page_range() -  populate a range of pages in the vma.
  * @vma:   target vma
@@ -2230,8 +2236,8 @@ int __mm_populate(unsigned long start, unsigned long len, int ignore_errors)
 	return ret;	/* 0 or negative error code */
 }
 #else /* CONFIG_MMU */
-static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
-		unsigned long nr_pages, struct page **pages,
+static long __get_user_pages_locked_out(struct mm_struct *mm, unsigned long start,
+		unsigned long nr_pages, struct gup_out *out,
 		int *locked, unsigned int foll_flags)
 {
 	struct vm_area_struct *vma;
@@ -2255,7 +2261,7 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 	}
 
 	/* See the MMU variant: support the traditional behavior. */
-	if (pages && !(foll_flags & FOLL_PIN))
+	if (out && !(foll_flags & FOLL_PIN))
 		foll_flags |= FOLL_GET;
 
 	/* calculate required read or write permissions.
@@ -2276,16 +2282,19 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 		    !(vm_flags & vma->vm_flags))
 			break;
 
-		if (pages) {
-			pages[i] = virt_to_page((void *)start);
-			if (!pages[i])
+		if (out) {
+			struct page *page = virt_to_page((void *)start);
+			struct folio *folio;
+
+			if (!page)
 				break;
-			ret = try_grab_folio(page_folio(pages[i]), 1, foll_flags);
+			folio = page_folio(page);
+			ret = try_grab_folio(folio, 1, foll_flags);
 			if (unlikely(ret)) {
-				pages[i] = NULL;
 				err = ret;
 				break;
 			}
+			gup_out_add_range(out, folio, page, 1);
 		}
 
 		start = (start + PAGE_SIZE) & PAGE_MASK;
@@ -2298,6 +2307,17 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 
 	return i ? : err;
 }
+
+static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
+		unsigned long nr_pages, struct page **pages,
+		int *locked, unsigned int foll_flags)
+{
+	struct gup_out out = GUP_OUT_PAGES(pages);
+
+	return __get_user_pages_locked_out(mm, start, nr_pages,
+					   pages ? &out : NULL, locked,
+					   foll_flags);
+}
 #endif /* !CONFIG_MMU */
 
 /**
@@ -2722,37 +2742,65 @@ static long check_and_migrate_movable_folios(unsigned long nr_folios,
  * __gup_longterm_locked() is a wrapper for __get_user_pages_locked which
  * allows us to process the FOLL_LONGTERM flag.
  */
-static long __gup_longterm_locked(struct mm_struct *mm,
+static long __gup_longterm_locked_out(struct mm_struct *mm,
 				  unsigned long start,
 				  unsigned long nr_pages,
-				  struct page **pages,
+				  struct gup_out *out,
 				  int *locked,
 				  unsigned int gup_flags)
 {
+	unsigned long nr_pages_done;
 	unsigned int flags;
 	long rc, nr_pinned_pages;
 
 	if (!(gup_flags & FOLL_LONGTERM))
-		return __get_user_pages_locked(mm, start, nr_pages, pages,
-					       locked, gup_flags);
+		return __get_user_pages_locked_out(mm, start, nr_pages, out,
+						   locked, gup_flags);
+
+	if (WARN_ON_ONCE(!out))
+		return -EINVAL;
+
+	/*
+	 * We might have to start over, in which case everything recorded by
+	 * this call has to be discarded again.
+	 */
+	nr_pages_done = out->nr_pages;
 
 	flags = memalloc_pin_save();
 	do {
-		nr_pinned_pages = __get_user_pages_locked(mm, start, nr_pages,
-							  pages, locked,
-							  gup_flags);
+		out->nr_pages = nr_pages_done;
+
+		nr_pinned_pages = __get_user_pages_locked_out(mm, start,
+							      nr_pages, out,
+							      locked,
+							      gup_flags);
 		if (nr_pinned_pages <= 0) {
 			rc = nr_pinned_pages;
 			break;
 		}
 
 		/* FOLL_LONGTERM implies FOLL_PIN */
-		rc = check_and_migrate_movable_pages(nr_pinned_pages, pages);
+		rc = check_and_migrate_movable_pages(nr_pinned_pages,
+						     out->pages + nr_pages_done);
 	} while (rc == -EAGAIN);
 	memalloc_pin_restore(flags);
 	return rc ? rc : nr_pinned_pages;
 }
 
+static long __gup_longterm_locked(struct mm_struct *mm,
+				  unsigned long start,
+				  unsigned long nr_pages,
+				  struct page **pages,
+				  int *locked,
+				  unsigned int gup_flags)
+{
+	struct gup_out out = GUP_OUT_PAGES(pages);
+
+	return __gup_longterm_locked_out(mm, start, nr_pages,
+					 pages ? &out : NULL, locked,
+					 gup_flags);
+}
+
 #define INTERNAL_GUP_FLAGS (FOLL_TOUCH | FOLL_TRIED | FOLL_REMOTE | FOLL_PIN | \
 			    FOLL_FAST_ONLY | FOLL_UNLOCKABLE | \
 			    FOLL_MADV_POPULATE)
-- 
2.53.0

