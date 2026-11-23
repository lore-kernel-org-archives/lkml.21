Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463787;
	b=NzweJAK3ynuGa7BSZ0AhP0ET0B9bZiSIEVora+nNarESpcibuBMJZr7nZDaMycfdMp5r
	 8Vti5COnCpEKjHiVcOQjXy5uGkWFFdoP8apO68DxJYneUH/jOJ162lG64QPV6FOJT4lA1
	 3KG0bVBcarTuNlXwxr56to+hZj3+2GbEiRVq63Ct5lkmYgCODvisMPPm6DbUA3yLQAj3v
	 Zg3A6kZxFS//CxYvsmPxJHQ0LomGl3Epp7x2P+B4q0+R541+obLhH1jQalmktfXoDUG06
	 Zb/njjTOtH2MDaMkaPobiqznISv7GZegIEWiHvb4vsAt01MjoqJBIVr9NXFI1Fgaq3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463787;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IiLEpxFdp/GdWWLhE2SRceq2aNaPLrmH4fAKh/8siQw=;
	b=E4tbEGo07ToqgLagrhPOmauA3hvnksfz2GIcrvZQ7NrAhtdWSPphkCbdymxuj3xtfzlf
	 Ar6Q2f0p5PxEo/xXWagfSieCfUyDiumkPx2epN/FPNBcMYBxbpEpC9nEYmHQO0PTGk1Fp
	 Fy92J13M5/n4p8oCEzjA2Og3MKGBj4WzVfpn9MLpSvsUlLcI7trTWmc4NBfdx+0JsWX9X
	 zTQwNe1Ke8MQ9TYM8SMBsobshGC/g2Ay1hGzRATFyS4A4CWN/HqkomJ4sL+PvxQTrKMj9
	 NbDM08PM1GoDbS2vnlZzBMo8ZMKXakTIGRIdkpEmPojMh2ASzRPUpBmo+OB9rz92RRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=dW5Cdkk4;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C72606A338
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C72606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=dW5Cdkk4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=IiLEpxFdp/GdWWLhE2SRceq2aNaPLrmH4fAKh/8siQw=; b=dW5Cdk
	k4L9Y2JmljporTezPw+aHpEUtoacoF7UfrA6w4xnXXKKfOKtaqurjnUfV4qUaSCulnTbfxhVMT7Qc
	Yz59Ao45rw+bHu+b0IS/Q70xoZBfxsgBxNQKGamwYNt9nlYYNRv0F/Ak/Lromoa3CugZN7tQHo7MA
	bdebbrRHXNiBALSwLRI7b7ctpAeMI9ylA3ycftgdtpObfVG4dPSla7HUEvAXIPce7UL4oMTi6EGni
	q1RJODhMyPqFPmZAOeLQfuJRjGsd0rDkgy6WGWBzfuQjB6XYztkstieGzn7mtc6LkIkGYax20nnGz
	AXHMdJZ50tEcn7qVZSaX5p6UIRrA==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xVa99-00000006IU7-1aVr;
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
Subject: [PATCH 4/9] mm/gup: split out folio grab-and-store helper
Date: Mon, 23 Nov 2026 14:56:04 -0500
Message-ID: <20261123195609.4115244-5-riel@surriel.com>
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

follow_page_pte() does two things once it has resolved a present PTE
to a page: run the per-PTE safety checks (write-fault, unshare), then
grab a folio reference and hand the page back: fault it in if pinning,
mark it dirty/accessed, and store the caller's array slot.

Split the second part into gup_grab_fill_folio_pages(), which stores the
pages with gup_fill_pages(). The cache flushes stay with the caller in
__get_user_pages(), which runs gup_flush_pages() without any page
table lock held. Storing one slot under the lock is cheap; flushing is
not, and needs no lock once the folio reference is held.

No functional changes intended.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 76 +++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 47 insertions(+), 29 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 963c09b955d9..d2097ecd1576 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -921,6 +921,50 @@ static inline bool can_follow_write_pte(pte_t pte, struct page *page,
 	return !userfaultfd_pte_wp(vma, pte);
 }
 
+/*
+ * Grab a folio reference for @nr pages starting at @page, mark the folio
+ * accessed (and dirty for FOLL_WRITE), and store the pages for the caller.
+ * The caller (__get_user_pages()) flushes the caches with gup_flush_pages().
+ */
+static long gup_grab_fill_folio_pages(struct folio *folio,
+		struct page *page, unsigned long nr, bool dirty,
+		unsigned int flags, struct page **pages)
+{
+	long ret;
+
+	/* try_grab_folio() does nothing unless FOLL_GET or FOLL_PIN is set. */
+	ret = try_grab_folio(folio, nr, flags);
+	if (unlikely(ret))
+		return ret;
+
+	/*
+	 * We need to make the page accessible if and only if we are going
+	 * to access its content (the FOLL_PIN case).  Please see
+	 * Documentation/core-api/pin_user_pages.rst for details.
+	 */
+	if (flags & FOLL_PIN) {
+		ret = arch_make_folio_accessible(folio);
+		if (ret) {
+			gup_put_folio(folio, nr, flags);
+			return ret;
+		}
+	}
+	if (flags & FOLL_TOUCH) {
+		if ((flags & FOLL_WRITE) && !dirty && !folio_test_dirty(folio))
+			folio_mark_dirty(folio);
+		/*
+		 * pte_mkyoung() would be more correct here, but atomic care
+		 * is needed to avoid losing the dirty bit: it is easier to use
+		 * folio_mark_accessed().
+		 */
+		folio_mark_accessed(folio);
+	}
+
+	gup_fill_pages(pages, page, nr);
+
+	return 0;
+}
+
 static long follow_page_pte(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmd, unsigned int flags,
 		struct page **pages)
@@ -976,36 +1020,10 @@ static long follow_page_pte(struct vm_area_struct *vma,
 	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
 			     !PageAnonExclusive(page), page);
 
-	/* try_grab_folio() does nothing unless FOLL_GET or FOLL_PIN is set. */
-	ret = try_grab_folio(folio, 1, flags);
-	if (unlikely(ret))
+	ret = gup_grab_fill_folio_pages(folio, page, 1,
+			pte_dirty(pte), flags, pages);
+	if (ret)
 		goto out;
-
-	/*
-	 * We need to make the page accessible if and only if we are going
-	 * to access its content (the FOLL_PIN case).  Please see
-	 * Documentation/core-api/pin_user_pages.rst for details.
-	 */
-	if (flags & FOLL_PIN) {
-		ret = arch_make_folio_accessible(folio);
-		if (ret) {
-			gup_put_folio(folio, 1, flags);
-			goto out;
-		}
-	}
-	if (flags & FOLL_TOUCH) {
-		if ((flags & FOLL_WRITE) &&
-		    !pte_dirty(pte) && !folio_test_dirty(folio))
-			folio_mark_dirty(folio);
-		/*
-		 * pte_mkyoung() would be more correct here, but atomic care
-		 * is needed to avoid losing the dirty bit: it is easier to use
-		 * folio_mark_accessed().
-		 */
-		folio_mark_accessed(folio);
-	}
-
-	gup_fill_pages(pages, page, 1);
 	ret = 1;
 out:
 	pte_unmap_unlock(ptep, ptl);
-- 
2.56.0

