Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037825;
	b=cO3OISEApGHkCkZ1AnzEoX+zqrE/CI4f2ptKR0vL9O0ZS5nhFg93IUr6RxEyEbhmv0ch
	 iNKWFAVXTLUG57UGeYF4IqF+Q65cnB3C0ub6Bisf+aU+eINIvcpalLST1+pzPrNNnt4Ui
	 kJSZbg2mnke+6x16x6zV2ZXHmxUQXF0NavaBjTC+jRXhODtJMRVHMDINR1nMNj2zVkswJ
	 ihrkZAEiD6zD1wqnl+W4m0QNgsLVDgHzr8psB1MDelEUNeR56DyjkX4Vtv9pM7gYuXTLV
	 6/UmXev6G7IcBAvaU6S0uJdMKz33a+gh/GqVwMsQaRzfKdRAOfrkzgBHAPZs9aiWESg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0UBwsLS/EBzbzU7QpPz3uyEft8mQKTdSfQyTUVJf5Oc=;
	b=ocO0F8lvI4WtAcNyaFZXjdUZf4UQM2JltkZ0Z5yyMps5RC12w3/hhPi/brszxzhp1QEi
	 nAxwv7kmcr3F9Nzft47rRLUGSJJMWGe2VNEu0xgmWqHRuGONLKlBTPWwHCqXuha0y2fRe
	 3pqMz4IfxhM1wVYBaa+AG8VLfMzBGc//CkWGtf2qxCb3CIx/GHDdmKIRyJK3oKlLdoezJ
	 gHj5syXvAsulFMAdO/EgeQRWB+TAN0ZYzixq1M95peQ0A38cl9bEXlz+UitHGZW5xoOfR
	 B+ueq5sUmzmnabwIJ18+PnlgzrHUpH92evuVAXeEC25r+V/eE/ynma4q68PVuylVB7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UKBR2IqG;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC82A606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC82A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UKBR2IqG
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b503e2a87bso11340127b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795037823; x=1795642623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UBwsLS/EBzbzU7QpPz3uyEft8mQKTdSfQyTUVJf5Oc=;
        b=UKBR2IqGEDpQuvzVKoXUAv4Gr2vaLysiy8NOyCVVcxpAuSHut/Ldcc4JxuU9Hcfmcc
         A5rgJsbFOp0m7V5xsBo0tqNa62Jpuy8Ldv6pUVzwWXKn1P7dxeWb4erGpeRwtr8gr1kE
         KGrYvtgKwc3wh1/2eDFNl/GzlQXvDyexpGidjkPiPWKEbgELAKOeIwwTOdof3RszhmTj
         v7RtqH1J4AoK0QozI8ncxSs94cosYu6nEwIrOljdfVmw0mWj8WY3csQk+C4fKhFh4G4Y
         +u+LrAoD8hKitsTD5GwRppCsMhoRau0UDrFm9K1Hr3ocQAqOyGVa6pjTB23B7a13TBgY
         TA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037823; x=1795642623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0UBwsLS/EBzbzU7QpPz3uyEft8mQKTdSfQyTUVJf5Oc=;
        b=ibzXowpoHgGuR4v38Jyo2a0L+WVFWUN/WCPn//md+u7nY2oFK/1RxxV990Qoif0Ein
         bLKEqNkC1kLK8+O/COZdXnFFxzEBKgLCF5fOmUs1TRzDQNYwIsuKYIjJR5niS/G0sKDB
         tzA0BKfsO1BvZ94VfllHi8M3Edhwco84IDI5rA70TDLzesMzQuayAKo9nXrSfPf1v1oW
         WxrDD1MaDpwGCXzFT/iZhX2QM0EMwm3t1HjnsHk1qn8nqh37OYZXjeZkR9FT1khWmccE
         wi/wHg4d4YZxD3we0gl85dv4Q3u46zxuy4L/d8jFQcrCc4JXrv5O6eDwxw2DO8887tnn
         gIfQ==
X-Forwarded-Encrypted: i=1; AL+hErFu2uWhwzsbwsobB+w4huT4dJwpfJrfims4wy1hRjj+w1zsCB77BjxB967aW2jlnrVBOp9rA6HQ86UZHTc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rvqhz6gYTFM3n9EUChwNF4gKn7x8aI1Z2Jyd4haNjmSkVMTbn
	OOIa6CvJdIWbByRgaEn6jeEoIbq8vI5vF0JGvkvIKNlkyJNeMpr8rKWu
X-Gm-Gg: AZFdTZc+m0aCt2jQoMpgRb4NCsvaFEjTBhbTiJIs+YcOunw7BEbdyWMXegQsJaBVREy
	hjWyNbUc+HruDklGgxkUf65R53sqJKJKJxjQlSYWcG4LXLYAEKq0nM3aKPF3tickERcDnII7eIT
	NK/Zt6CKll0iy9YZXkHF0zXC4h+eZ+qPOsePpDL6Vlm8Fok6Yp6+AvMfqKc+9hjpUE6X0m8Gv7H
	1rPknT2Veh6Kc6E6OtHy0szMmF7WVp9ITzKXgZwQof4tBUsBDIZQi9AT4tj0fe2uNT8e7Ifj62T
	dCGXAIkIspWV1jqWYAo9gmEBSCaE6f9+zSKb4Liv8BnhkNaCCZBzcf4fvJjpMimMUb4xTI79Byf
	A9/tXPaCGNdprtfqO6D+j76iPe1H1Ak1NUwKgNazjJfTcUKy+W3cx8HahCjOSe/+3FCRpvLZt/x
	vuwINUDZqG6Rt9DetHSl8hZmGvborQEiDpFELhcBm9NMMEBLb8HizFojPxR93yxpGpqg8beKsEw
	XOenEV5CaLtYIJRe4RevNoFLewNk0KrkDu37pxa/k+PowY9KrIawexISikXt6VoxgfRMc54HsAZ
	HjBY8aAoPzXlgN/Ve1LAqdXFSnecFv9q5e1tllCWT4scusq4ktrdBbk=
X-Received: by 2002:a05:690c:34c9:b0:8b0:cc41:a124 with SMTP id 00721157ae682-8b4fed8df52mr15909757b3.49.1795037823316;
        Wed, 18 Nov 2026 13:37:03 -0800 (PST)
Received: from 5163NRD-SPrabh2.ssi.samsung.com ([50.205.20.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe030be2sm24565697b3.10.2026.11.18.13.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:37:03 -0800 (PST)
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
Subject: [PATCH 3/5] mm/gup: make the GUP-fast walkers record into struct gup_out
Date: Wed, 18 Nov 2026 13:34:56 -0800
Message-ID: <20261118213458.377258-4-sw.prabhu6@gmail.com>
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

Pass 'struct gup_out' down the GUP-fast walkers and record acquired
pages through 'gup_out_add_range()' replacing pages array indexing and
pointer advancement. Record each existing PTE batch with one append.

Retain the walker's page-count return value so that callers can detect
short walks. Have gup_fast() obtain its result from the descriptor and
reset the count after releasing pins when a concurrent fork is detected.

Move fallback handling into gup_fast_fallback_out(), sharing the
descriptor with the slow path so recording continues after the pages
acquired by GUP-fast. Keep gup_fast_fallback() as an array-based wrapper
that initializes an empty descriptor.

No functional change.

Signed-off-by: Swarna Prabhu <s.prabhu@samsung.com>
Assisted-by: LLM
---
 mm/gup.c | 94 +++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 56 insertions(+), 38 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 0b8dd3fde06b..43b92058a213 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3146,7 +3146,7 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
  */
 static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 		unsigned long addr, unsigned long end,
-		unsigned int flags, struct page **pages)
+		unsigned int flags, struct gup_out *out)
 {
 	unsigned long nr_pages = 0, nr_batch;
 	struct folio *folio = NULL;
@@ -3158,7 +3158,6 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 	do {
 		pte_t pte = ptep_get_lockless(ptep);
 		struct page *page;
-		unsigned long i;
 
 		nr_batch = 1;
 
@@ -3229,8 +3228,7 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 			nr_batch = 1;
 
 		folio_set_referenced(folio);
-		for (i = 0; i < nr_batch; i++)
-			pages[nr_pages + i] = page + i;
+		gup_out_add_range(out, folio, page, nr_batch);
 		nr_pages += nr_batch;
 		folio = NULL;
 	} while (ptep += nr_batch, addr += nr_batch * PAGE_SIZE, addr != end);
@@ -3254,7 +3252,7 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
  */
 static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 		unsigned long addr, unsigned long end,
-		unsigned int flags, struct page **pages)
+		unsigned int flags, struct gup_out *out)
 {
 	return 0;
 }
@@ -3262,11 +3260,11 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 
 static unsigned long gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp,
 		unsigned long addr, unsigned long end,
-		unsigned int flags, struct page **pages)
+		unsigned int flags, struct gup_out *out)
 {
 	struct page *mapped_page, *page;
 	struct folio *folio;
-	unsigned long nr_pages, i;
+	unsigned long nr_pages;
 
 	/* See gup_fast_pte_range() */
 	if (pmd_protnone(orig))
@@ -3301,19 +3299,18 @@ static unsigned long gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp,
 		return 0;
 	}
 
-	for (i = 0; i < nr_pages; i++)
-		*(pages++) = page++;
+	gup_out_add_range(out, folio, page, nr_pages);
 	folio_set_referenced(folio);
 	return nr_pages;
 }
 
 static unsigned long gup_fast_pud_leaf(pud_t orig, pud_t *pudp,
 		unsigned long addr, unsigned long end,
-		unsigned int flags, struct page **pages)
+		unsigned int flags, struct gup_out *out)
 {
 	struct page *mapped_page, *page;
 	struct folio *folio;
-	unsigned long nr_pages, i;
+	unsigned long nr_pages;
 
 	if (!pud_access_permitted(orig, flags & FOLL_WRITE))
 		return 0;
@@ -3345,15 +3342,14 @@ static unsigned long gup_fast_pud_leaf(pud_t orig, pud_t *pudp,
 		return 0;
 	}
 
-	for (i = 0; i < nr_pages; i++)
-		*(pages++) = page++;
+	gup_out_add_range(out, folio, page, nr_pages);
 	folio_set_referenced(folio);
 	return nr_pages;
 }
 
 static unsigned long gup_fast_pmd_range(pud_t *pudp, pud_t pud,
 		unsigned long addr, unsigned long end,
-		unsigned int flags, struct page **pages)
+		unsigned int flags, struct gup_out *out)
 {
 	unsigned long next, nr_pages = 0, chunk_nr_pages;
 	pmd_t *pmdp;
@@ -3369,12 +3365,12 @@ static unsigned long gup_fast_pmd_range(pud_t *pudp, pud_t pud,
 		if (unlikely(pmd_leaf(pmd))) {
 			chunk_nr_pages = gup_fast_pmd_leaf(pmd, pmdp, addr,
 							   next, flags,
-							   &pages[nr_pages]);
+							   out);
 
 		} else
 			chunk_nr_pages = gup_fast_pte_range(pmd, pmdp, addr,
 							    next, flags,
-							    &pages[nr_pages]);
+							    out);
 		nr_pages += chunk_nr_pages;
 		if (chunk_nr_pages != (next - addr) >> PAGE_SHIFT)
 			break;
@@ -3385,7 +3381,7 @@ static unsigned long gup_fast_pmd_range(pud_t *pudp, pud_t pud,
 
 static unsigned long gup_fast_pud_range(p4d_t *p4dp, p4d_t p4d,
 		unsigned long addr, unsigned long end,
-		unsigned int flags, struct page **pages)
+		unsigned int flags, struct gup_out *out)
 {
 	unsigned long next, nr_pages = 0, chunk_nr_pages;
 	pud_t *pudp;
@@ -3400,11 +3396,11 @@ static unsigned long gup_fast_pud_range(p4d_t *p4dp, p4d_t p4d,
 		if (unlikely(pud_leaf(pud)))
 			chunk_nr_pages = gup_fast_pud_leaf(pud, pudp, addr,
 							   next, flags,
-							   &pages[nr_pages]);
+							   out);
 		else
 			chunk_nr_pages = gup_fast_pmd_range(pudp, pud, addr,
 							    next, flags,
-							    &pages[nr_pages]);
+							    out);
 		nr_pages += chunk_nr_pages;
 		if (chunk_nr_pages != (next - addr) >> PAGE_SHIFT)
 			break;
@@ -3414,7 +3410,7 @@ static unsigned long gup_fast_pud_range(p4d_t *p4dp, p4d_t p4d,
 }
 
 static unsigned long gup_fast_p4d_range(pgd_t *pgdp, pgd_t pgd, unsigned long addr,
-		unsigned long end, unsigned int flags, struct page **pages)
+		unsigned long end, unsigned int flags, struct gup_out *out)
 {
 	unsigned long next, nr_pages = 0, chunk_nr_pages;
 	p4d_t *p4dp;
@@ -3428,7 +3424,7 @@ static unsigned long gup_fast_p4d_range(pgd_t *pgdp, pgd_t pgd, unsigned long ad
 			break;
 		BUILD_BUG_ON(p4d_leaf(p4d));
 		chunk_nr_pages = gup_fast_pud_range(p4dp, p4d, addr, next,
-						    flags, &pages[nr_pages]);
+						    flags, out);
 		nr_pages += chunk_nr_pages;
 		if (chunk_nr_pages != (next - addr) >> PAGE_SHIFT)
 			break;
@@ -3439,7 +3435,7 @@ static unsigned long gup_fast_p4d_range(pgd_t *pgdp, pgd_t pgd, unsigned long ad
 
 static unsigned long gup_fast_pgd_range(unsigned long addr,
 		unsigned long end, unsigned int flags,
-		struct page **pages)
+		struct gup_out *out)
 {
 	unsigned long next, nr_pages = 0, chunk_nr_pages;
 	pgd_t *pgdp;
@@ -3453,7 +3449,7 @@ static unsigned long gup_fast_pgd_range(unsigned long addr,
 			break;
 		BUILD_BUG_ON(pgd_leaf(pgd));
 		chunk_nr_pages = gup_fast_p4d_range(pgdp, pgd, addr, next,
-						    flags, &pages[nr_pages]);
+						    flags, out);
 		nr_pages += chunk_nr_pages;
 		if (chunk_nr_pages != (next - addr) >> PAGE_SHIFT)
 			break;
@@ -3464,7 +3460,7 @@ static unsigned long gup_fast_pgd_range(unsigned long addr,
 #else
 static inline unsigned long gup_fast_pgd_range(unsigned long addr,
 		unsigned long end, unsigned int flags,
-		struct page **pages)
+		struct gup_out *out)
 {
 	return 0;
 }
@@ -3481,12 +3477,27 @@ static bool gup_fast_permitted(unsigned long start, unsigned long end)
 }
 #endif
 
+/*
+ * Undo what GUP-fast recorded in @out.
+ *
+ * Don't perform any sanity checks because we might have raced with fork() and
+ * some anonymous pages might now actually be shared -- which is why we're
+ * unpinning after all.
+ */
+static void gup_fast_unpin(struct gup_out *out)
+{
+	gup_fast_unpin_user_pages(out->pages, out->nr_pages);
+	out->nr_pages = 0;
+}
+
 static unsigned long gup_fast(unsigned long start, unsigned long end,
-		unsigned int gup_flags, struct page **pages)
+		unsigned int gup_flags, struct gup_out *out)
 {
-	unsigned long flags, nr_pinned;
+	unsigned long flags;
 	unsigned seq;
 
+	VM_WARN_ON_ONCE(out->nr_pages);
+
 	if (!IS_ENABLED(CONFIG_HAVE_GUP_FAST) ||
 	    !gup_fast_permitted(start, end))
 		return 0;
@@ -3508,7 +3519,7 @@ static unsigned long gup_fast(unsigned long start, unsigned long end,
 	 * that come from callers of tlb_remove_table_sync_one().
 	 */
 	local_irq_save(flags);
-	nr_pinned = gup_fast_pgd_range(start, end, gup_flags, pages);
+	gup_fast_pgd_range(start, end, gup_flags, out);
 	local_irq_restore(flags);
 
 	/*
@@ -3517,22 +3528,22 @@ static unsigned long gup_fast(unsigned long start, unsigned long end,
 	 */
 	if (gup_flags & FOLL_PIN) {
 		if (read_seqcount_retry(&current->mm->write_protect_seq, seq)) {
-			gup_fast_unpin_user_pages(pages, nr_pinned);
+			gup_fast_unpin(out);
 			return 0;
 		} else {
-			sanity_check_pinned_pages(pages, nr_pinned);
+			sanity_check_pinned_pages(out->pages, out->nr_pages);
 		}
 	}
-	return nr_pinned;
+	return out->nr_pages;
 }
 
-static int gup_fast_fallback(unsigned long start, unsigned long nr_pages,
-		unsigned int gup_flags, struct page **pages)
+static long gup_fast_fallback_out(unsigned long start, unsigned long nr_pages,
+		unsigned int gup_flags, struct gup_out *out)
 {
 	unsigned long len, end;
 	unsigned long nr_pinned;
 	int locked = 0;
-	int ret;
+	long ret;
 
 	if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM |
 				       FOLL_FORCE | FOLL_PIN | FOLL_GET |
@@ -3553,16 +3564,15 @@ static int gup_fast_fallback(unsigned long start, unsigned long nr_pages,
 	if (end > TASK_SIZE_MAX)
 		return -EFAULT;
 
-	nr_pinned = gup_fast(start, end, gup_flags, pages);
+	nr_pinned = gup_fast(start, end, gup_flags, out);
 	if (nr_pinned == nr_pages || gup_flags & FOLL_FAST_ONLY)
 		return nr_pinned;
 
 	/* Slow path: try to get the remaining pages with get_user_pages */
 	start += nr_pinned << PAGE_SHIFT;
-	pages += nr_pinned;
-	ret = __gup_longterm_locked(current->mm, start, nr_pages - nr_pinned,
-				    pages, &locked,
-				    gup_flags | FOLL_TOUCH | FOLL_UNLOCKABLE);
+	ret = __gup_longterm_locked_out(current->mm, start,
+					nr_pages - nr_pinned, out, &locked,
+					gup_flags | FOLL_TOUCH | FOLL_UNLOCKABLE);
 	if (ret < 0) {
 		/*
 		 * The caller has to unpin the pages we already pinned so
@@ -3575,6 +3585,14 @@ static int gup_fast_fallback(unsigned long start, unsigned long nr_pages,
 	return ret + nr_pinned;
 }
 
+static int gup_fast_fallback(unsigned long start, unsigned long nr_pages,
+		unsigned int gup_flags, struct page **pages)
+{
+	struct gup_out out = GUP_OUT_PAGES(pages);
+
+	return gup_fast_fallback_out(start, nr_pages, gup_flags, &out);
+}
+
 /**
  * get_user_pages_fast_only() - pin user pages in memory
  * @start:      starting user address
-- 
2.53.0

