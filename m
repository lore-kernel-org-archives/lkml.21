Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463787;
	b=WUTC6yxCSbb8c7zXd7BdDVfxLwsEY6JaPBbxDJigSMIL7GOXd1WA/HMuh8xNdnzsRueT
	 I3lCx5s3mycUBvi3DkWxggKVTUmlYXfS47juToH9uTAVnSdyG81VhsCy3H2BAz57ehwSh
	 0xhEU72zhVg56LJg3UiDDkp5RlOwfRw2SlSqXad1xW4pTRVq9te3QStp2cve1JtUwho3v
	 5Wncdg4xVUYEflPquJRl3DPX/qEhK2g14rixYPjova0mKSU9JtpYXtkX/axgRMjeC7oNU
	 sD7HXtmXNb3oigZ+pHy6JTZ5hLPRiJjHQnxa8XGj9Xe4rQe8tae0Xh8zCoMFcsdufrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463787;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N3nyf5W47UgYpP4B9F86Yz8ZQ6TUVBJoCHj4TQFdYoU=;
	b=CKgqimx39efKyLRXq4/aV3n3KcqvhffJ3EYEK7O5pvO4l2WasNLbbd1aas+oUVn5OpSD
	 pXacnQh1Q2xsHFoK2uhTqLxeGcBMuoYNhyYkAQKWAZFzzeIm4j1oT7WCARu6VbCKuGAf4
	 ZRb3bTvW0S5eLequp576LMNEyvsNvkJCxufSlTlUn3HQwY94twSetABe1/ExPI4UxMluM
	 7UqDILkhPTKSu+BqoRYP1u1BqU/58tLQEdGlDekNxr/XbrEYs5w3hCHtZhvR/npc/1XRn
	 J8c1PDGfIIXwybAcsf3fHgMiVGBkLV4ty2wd8BydOecyjpf1BDzJOH16g6OsXibOG3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b="O/Cr/Jpc";
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BB7606A336
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2BB7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=O/Cr/Jpc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=N3nyf5W47UgYpP4B9F86Yz8ZQ6TUVBJoCHj4TQFdYoU=; b=O/Cr/J
	pcnrcCOeJU4KglvusKc3MxzjYXyI2+j2R+hIPxRRd45J/Xozq6YBmtZmjyrnVMjfCt/k64Jf5+1lF
	hyMI7GoHv7FEyf4uKFXV20bGK73x0gN/PHAI9m3nQdkSvjJlV6LZcpexVuOxuxxaGwDG2e/l089dJ
	FAZ7f5nr3cJgr2uG6fWzz9vEGRUGuE2lmOdsf076j6rsexZNVGer9sDbymGyGHHEi9aZEpq12z/96
	JjgOMQsHcRfsSTAcsx0d71OVlC01X9QExgnCTgDoByPt4UvG0ZtclHHp+cXP41TxOa+AIBZ1qaZon
	QYriNr74Pjv1WhtjMHNeBVpx/0qA==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xVa99-00000006IU7-1i1D;
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
Subject: [PATCH 5/9] mm/gup: break out gup_lookup_pte() helper
Date: Mon, 23 Nov 2026 14:56:05 -0500
Message-ID: <20261123195609.4115244-6-riel@surriel.com>
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

follow_page_pte() does two things: resolve one present PTE to the
page it maps, then grab a folio reference and hand the page back.

Split the first part into gup_lookup_pte(), which returns no page
and no error when the PTE cannot be followed but the caller may
fault it in, and a negative errno when the caller must report the
failure. A none PTE in a hugetlbfs VMA can only be resolved to the
page cache outside the PTE lock, so it is deferred until after
unlock.

No functional changes intended.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 102 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 58 insertions(+), 44 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index d2097ecd1576..54a710f1a843 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -965,74 +965,88 @@ static long gup_grab_fill_folio_pages(struct folio *folio,
 	return 0;
 }
 
-static long follow_page_pte(struct vm_area_struct *vma,
-		unsigned long address, pmd_t *pmd, unsigned int flags,
-		struct page **pages)
+/*
+ * Resolve one present PTE to the page it maps. Returns no page and no error
+ * when the PTE cannot be followed but the caller may fault it in, and a
+ * negative errno when the caller must report the failure.
+ */
+static long gup_lookup_pte(struct vm_area_struct *vma, unsigned long address,
+		pte_t *ptep, pte_t pte, unsigned int flags, struct page **pagep)
 {
-	struct mm_struct *mm = vma->vm_mm;
-	struct folio *folio;
 	struct page *page;
-	spinlock_t *ptl;
-	pte_t *ptep, pte;
-	long ret;
 
-	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
-	if (!ptep)
-		return no_page_table(vma, flags, address);
-	pte = ptep_get(ptep);
+	*pagep = NULL;
+
 	if (!pte_present(pte))
-		goto no_page;
+		return 0;
 	if (pte_protnone(pte) && !gup_can_follow_protnone(vma, flags))
-		goto no_page;
+		return 0;
 
 	page = vm_normal_page(vma, address, pte);
 
 	/*
 	 * We only care about anon pages in can_follow_write_pte().
 	 */
-	if ((flags & FOLL_WRITE) &&
-	    !can_follow_write_pte(pte, page, vma, flags)) {
-		ret = 0;
-		goto out;
-	}
+	if ((flags & FOLL_WRITE) && !can_follow_write_pte(pte, page, vma, flags))
+		return 0;
 
 	if (unlikely(!page)) {
 		if (flags & FOLL_DUMP) {
 			/* Avoid special (like zero) pages in core dumps */
-			ret = -EFAULT;
-			goto out;
-		}
-
-		if (is_zero_pfn(pte_pfn(pte))) {
-			page = pte_page(pte);
-		} else {
-			ret = follow_pfn_pte(vma, address, ptep, flags);
-			goto out;
+			return -EFAULT;
 		}
+		if (!is_zero_pfn(pte_pfn(pte)))
+			return follow_pfn_pte(vma, address, ptep, flags);
+		page = pte_page(pte);
 	}
-	folio = page_folio(page);
 
-	if (!pte_write(pte) && gup_must_unshare(vma, flags, folio, page)) {
-		ret = -EMLINK;
-		goto out;
-	}
+	if (!pte_write(pte) &&
+	    gup_must_unshare(vma, flags, page_folio(page), page))
+		return -EMLINK;
 
 	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
 			     !PageAnonExclusive(page), page);
 
-	ret = gup_grab_fill_folio_pages(folio, page, 1,
-			pte_dirty(pte), flags, pages);
-	if (ret)
-		goto out;
-	ret = 1;
-out:
+	*pagep = page;
+	return 0;
+}
+
+static long follow_page_pte(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmd, unsigned int flags,
+		struct page **pages)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	struct page *page;
+	spinlock_t *ptl;
+	pte_t *ptep, pte;
+	long ret;
+
+	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
+	/* The PMD entry is empty. */
+	if (!ptep)
+		return no_page_table(vma, flags, address);
+	pte = ptep_get(ptep);
+
+	/*
+	 * no_page_table() may access the page cache for a hugetlb VMA,
+	 * which cannot be done under the PTL, so defer it until the
+	 * lock is dropped.
+	 */
+	if (pte_none(pte)) {
+		pte_unmap_unlock(ptep, ptl);
+		return no_page_table(vma, flags, address);
+	}
+
+	ret = gup_lookup_pte(vma, address, ptep, pte, flags, &page);
+	if (!ret && page) {
+		ret = gup_grab_fill_folio_pages(page_folio(page), page,
+						     1, pte_dirty(pte), flags, pages);
+		if (!ret)
+			ret = 1;
+	}
+
 	pte_unmap_unlock(ptep, ptl);
 	return ret;
-no_page:
-	pte_unmap_unlock(ptep, ptl);
-	if (!pte_none(pte))
-		return 0;
-	return no_page_table(vma, flags, address);
 }
 
 static long follow_pmd_mask(struct vm_area_struct *vma,
-- 
2.56.0

