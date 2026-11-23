Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463786;
	b=Iig4OQA1Akxi3sVHkWT7kgv/V5z6IM4LzbITYGypxtAVeif1oLCyQZEgT6a7SC6EYfXt
	 NFgRZTvdDQcbyC/KGzOTnu22FNn+K/mC05OFVuIXeeFdbWAM5mdEwh8qmEYBezJC4bUAh
	 G+J4+lIFr20q1lJJcpSNFltMQCBPuNdHlKpKb6Bsvq4xGW+wT1lFZJuJCCdyOIJjBrdW9
	 IV9PWVKI9udiOti4h0eJh3DnHO/8Qcv18n1LLj8+g+PNd4V+aqWsl5qvfZ4IIZIsS4Sx1
	 LJx5nVN9+D/mBqd0DKeAI9jIGdNmVEDx9vbHh0DXQrs4d+MNHC4itMA2WPejFqHe5Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463786;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Can82GwJLZ6xNFloN0UvipHW26+kIvgtH3oyrupC710=;
	b=qDJkX9Nz+rcRvPC2dj6zklHfDTlXFPmd1nncydfqOisDSuWSbmuw//a4Y0xxE2OwUv2S
	 9M3HK5/JFdip1tHmHWq0Ir0MSbZ2IsXztKEiqdrwPIhkl7JVNODNvSp6FALRld1KAhmoX
	 tnSPdX45JAKjubJ1ou5KnOeqTbe+aaqdGNZ1BU+m42IJhyRZdB8vZeDFaDyNR+r4rC4t/
	 46R8foVg5C/uyKAo6z+skjQCSznx/pEa91rKPaoxLHslRnJNwx0HUh0jDICAQKT+8VQIv
	 LzYE7uDFKDzU2+uNHk5mMBtXI6Z46vjZcJfhYka/ryJB7n9uEr8zmKIxT4/gkuubD7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=GyCi9MXd;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6D1606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E6D1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=GyCi9MXd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=Can82GwJLZ6xNFloN0UvipHW26+kIvgtH3oyrupC710=; b=GyCi9M
	XdMGJPLYKb681Mul/PozoVN4IhEIQlzk2y4fhyibojn2D4rnbJztGxsCKbCamUO2H0/aBjW13Af+R
	QGtBTPfimG+/LUIug75QleEtpH5Cg9MfRHuWX1Zn3eYjBEwiIQMfAXji5jZ2b26Py2H/AlKMJ+NDS
	UUhuoSPpmM8jImd+IMld6fQUGG7MHXTgolYiF56a/qAaqz5x2iV199RbmOayWnco7zhJbUsfLsA5p
	k2lYz08oYTnxS3p5CIbBAUMNM24gCv/TdIGhPLJ0RzmSj/i6MkBS3msbIqqCv5rPsJM2XKMBNdUTT
	IeLUsWP1pOaImNhHX/YTPMXEgwKg==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xVa99-00000006IU7-25zi;
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
Subject: [PATCH 8/9] mm/gup: batch contiguous same-folio PTEs into one refcount grab
Date: Mon, 23 Nov 2026 14:56:08 -0500
Message-ID: <20261123195609.4115244-9-riel@surriel.com>
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

follow_page_pte() now walks a whole page table in one call, but still
resolves and commits each PTE on its own, so a PTE-mapped large folio
(mTHP) pays one try_grab_folio() per subpage.

Add gup_pte_batch_len() and give gup_grab_folio_pages() a run
length. Each run starts with a full per-PTE resolve, then
gup_pte_batch_len() finds how many more PTEs extend it with a pte_same()
scan rather than a re-derivation of each page, and the run is committed
with one refcount grab. Runs stop at folio boundaries, so plain base
pages are unaffected.

Gather the dirty bits from all the PTEs in a batch, in order to mark
the folio dirty for FOLL_WRITE.

Same benchmark as the previous change, with before again taken at the
base of the series:

  gup_test -L -m 256 -n 65536 -r 16 -t
                        before      after
  64 kB mTHP           2946 us      231 us  (12.8x)
  4 kB base (control)  2753 us     1198 us   (2.3x)
  2 MB THP (control)     72 us       71 us

The 4 kB column is the previous change's 2.3x, unchanged: base pages
share no folio, so there is nothing to batch. 64 kB mTHP goes from that
change's 2.2x to 12.8x, a further 5.9x from committing a run with one
refcount grab instead of one per subpage.

With FOLL_TOUCH, folio_mark_accessed() runs once per run instead of
once per page: 512 calls before and 32 after over 2 MB of 64 kB
folios, leaving them referenced but inactive after the first call.
That matches the huge-page and fast paths, which mark once
per folio. (Measured by Yuan-Hao Hsu.)

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 95 ++++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 76 insertions(+), 19 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index b5747f2c2ca3..886a413b8233 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1011,6 +1011,46 @@ static long gup_lookup_pte(struct vm_area_struct *vma, unsigned long address,
 	return 0;
 }
 
+/*
+ * Return how many PTEs map consecutive pages of the same folio and can be
+ * committed as one run. Always at least 1.
+ *
+ * The write-fault and unshare checks in gup_lookup_pte() are per PTE, but a
+ * writable run needs no repeat: a writable anon page is exclusive. A
+ * read-only run under FOLL_WRITE or FOLL_PIN does need the per-page check,
+ * so it stays one page at a time.
+ *
+ * @fpb_flags selects the scan: slow GUP merges young/dirty so
+ * folio_mark_dirty() sees any dirty PTE in the run; fast GUP scans
+ * locklessly and revalidates the run after grabbing it. @vma is only
+ * needed for FPB_MERGE_WRITE and may be NULL otherwise.
+ */
+static unsigned long gup_pte_batch_len(struct vm_area_struct *vma,
+		unsigned long address, unsigned long walk_end,
+		struct folio *folio, pte_t *ptep, pte_t *batch_pte,
+		unsigned int flags, fpb_t fpb_flags)
+{
+	unsigned long max, nr = 1;
+
+	if (folio_test_large(folio)) {
+		max = (walk_end - address) >> PAGE_SHIFT;
+		if (max > 1)
+			nr = folio_pte_batch_flags(folio, vma, ptep,
+						   batch_pte, max, fpb_flags);
+	}
+
+	/*
+	 * Read-only runs are trimmed to the leading pages that need no
+	 * unsharing; a zero return means even the head page needs
+	 * unsharing, and the caller must fault it in instead. Writable
+	 * runs need no repeat: a writable anon page is exclusive.
+	 */
+	if (!pte_write(*batch_pte))
+		nr = gup_pages_not_requiring_unshare(vma, flags, folio,
+						     pte_page(*batch_pte), nr);
+	return nr;
+}
+
 /*
  * Walk the PTEs from the start address to the end of this page table or VMA,
  * whichever comes first, and commit every page found.
@@ -1046,7 +1086,10 @@ static long follow_page_pte(struct vm_area_struct *vma,
 
 	for (; address < walk_end; address += PAGE_SIZE, ptep++) {
 		pte_t pte = ptep_get(ptep);
+		struct folio *folio;
 		struct page *page;
+		unsigned long batch;
+		pte_t batch_pte;
 
 		/*
 		 * no_page_table() may access the page cache for a
@@ -1061,12 +1104,33 @@ static long follow_page_pte(struct vm_area_struct *vma,
 		ret = gup_lookup_pte(vma, address, ptep, pte, flags, &page);
 		if (ret || !page)
 			break;
-		ret = gup_grab_fill_folio_pages(page_folio(page), page, 1,
-					     pte_dirty(pte), flags,
+		folio = page_folio(page);
+		batch_pte = pte;
+
+		batch = gup_pte_batch_len(vma, address, walk_end, folio,
+					 ptep, &batch_pte, flags,
+					 FPB_RESPECT_WRITE |
+					 FPB_MERGE_YOUNG_DIRTY);
+		/*
+		 * Break out if the helper says the pages are not
+		 * usable as-is.
+		 */
+		if (!batch) {
+			ret = 0;
+			break;
+		}
+		ret = gup_grab_fill_folio_pages(folio, page, batch,
+					     pte_dirty(batch_pte), flags,
 					     pages ? pages + nr : NULL);
 		if (ret)
 			break;
-		nr++;
+		nr += batch;
+		/*
+		 * The loop's own increment covers one PTE; skip
+		 * the rest of the batch.
+		 */
+		ptep += batch - 1;
+		address += (batch - 1) * PAGE_SIZE;
 	}
 	pte_unmap_unlock(orig_ptep, ptl);
 
@@ -3021,8 +3085,6 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 		pte_t pte = ptep_get_lockless(ptep);
 		struct page *page;
 
-		nr_batch = 1;
-
 		/*
 		 * Always fallback to ordinary GUP on PROT_NONE-mapped pages:
 		 * pte_access_permitted() better should reject these pages
@@ -3062,20 +3124,15 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 		if (!gup_fast_folio_allowed(folio, flags))
 			goto out;
 
-		if (folio_test_large(folio))
-			/*
-			 * The reference acquired above keeps the folio stable
-			 * for the following checks.
-			 */
-			nr_batch = folio_pte_batch_flags(folio, NULL, ptep, &pte,
-							 (end - addr) >> PAGE_SHIFT,
-							 FPB_LOCKLESS | FPB_RESPECT_WRITE);
-
-		if (!pte_write(pte)) {
-			nr_batch = gup_pages_not_requiring_unshare(NULL, flags, folio, page, nr_batch);
-			if (!nr_batch)
-				goto out;
-		}
+		/*
+		 * The reference acquired above keeps the folio stable
+		 * for the following checks.
+		 */
+		nr_batch = gup_pte_batch_len(NULL, addr, end, folio,
+					     ptep, &pte, flags,
+					     FPB_LOCKLESS | FPB_RESPECT_WRITE);
+		if (!nr_batch)
+			goto out;
 
 		/*
 		 * We need to make the page accessible if and only if we are
-- 
2.56.0

