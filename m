Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463786;
	b=x9x+yF3fle7+Ld1VANUWX5T3VWE2f8btHAFJIWu9n2G7FZDxStaMF6UL29zVUbgHybd0
	 FdZAXhMca+KDuHTiAnPUTLJPT9aQk2DVHU3hLwUrUwbOjC1Ubryk0ZyG1WGHXDRzf0k3O
	 5vB3BhEAw094tTKhLTaNOXuJjQIELSRuwf4uFqT/07HpJwK7527eZf4zICEdCDcTgj99N
	 LpkD3ccvFqgL5TAO6m5nX+bO/C1p7CgjtdErccsQvR2hzRvuBYx1i0k5u0Q3V5v3qIlP3
	 I/kW3NkojC3Ui9AxkihslM4X8CG1E7p4a3Do4FBQ5QfYu++uWLxkSGWR1K8KlvWDmkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463786;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SNg/eN30d+0BFvF9t/QYVmNoDb1lzvAqSarbFDg/MKE=;
	b=IX9850k45pi9tZYpllIrYUgJvc+65dPzY5Zo4xrKmU4pCm7ku0xUM79BQEbEubgS6xfx
	 9RNTlYCPJpGHiSK33wnyZxvXo+wzB8YE/mMDbvTdz7tjLRvCFgIGXL8ccdzLr63rPiKko
	 wO8FJNMhkmvVlwOJV9iT/Wh9pqCT5bmj/c8fgCKTnnpwPwLO4ERQFNp779Ss7sjs8FgF9
	 UTW+P2w/kU67v9ewMN/o1WQwTGwyq7wvJQwX/clWTQCSUyC8yXtpJuo9CPAHRsIMuLseC
	 9zzyCJGgUDyOC9Ad0MyL7k1vAcgxbuXRUWBpSBMdOJCRKAM9g9qJyHyVNp8TpMrh5rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b="TWxZm/dZ";
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7B8606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E7B8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=TWxZm/dZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=SNg/eN30d+0BFvF9t/QYVmNoDb1lzvAqSarbFDg/MKE=; b=TWxZm/
	dZ0v63E06eHlklmT+WDHwGP1hIkYnKx0guN4mDEWWcSeIAqqxdy5PUKUA9Rg8yUTHZDQm2BzNDC8S
	OSA5I2Ujbl8238wuBeAokM++MnPwzvB+l67E2hBhRQ3GGAYkmmkcfh55yLghR9moWtAtPVtJ0fai3
	yQzzeED5w41VzXmZnFsHjRCtCiMDQaM/vO+GWnkqda5iAX3sSszBvCISQmwG7iBHynple/qEcKSFM
	rgH5RM2FRXEP7ungdCDhsQTCMtE5QxMljgMU6RBY85sGan9KKUTmVbZ98NO8BPdf4zaLRbEmp8UCC
	ZxkhoaHtZyWr39sOgEg7c1KpH7nA==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xVa99-00000006IU7-1JJ4;
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
Subject: [PATCH 2/9] mm/gup: break out gup_flush_pages() helper
Date: Mon, 23 Nov 2026 14:56:02 -0500
Message-ID: <20261123195609.4115244-3-riel@surriel.com>
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

__get_user_pages() flushes each page's caches in an open-coded loop
right after filling the array.

Move it into a gup_flush_pages() helper.

No functional changes intended.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index e0698d2075b4..d35fedbce7e1 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -729,6 +729,24 @@ static void gup_fill_pages(struct page **pages, struct page *page,
 		pages[i] = page + i;
 }
 
+/*
+ * Flush the caches for @nr_pages pages stored in @pages. The caller
+ * already holds folio references on the pages.
+ */
+static void gup_flush_pages(struct vm_area_struct *vma, unsigned long address,
+		struct page **pages, unsigned long nr_pages)
+{
+	unsigned long i;
+
+	if (!pages)
+		return;
+
+	for (i = 0; i < nr_pages; i++) {
+		flush_anon_page(vma, pages[i], address + i * PAGE_SIZE);
+		flush_dcache_page(pages[i]);
+	}
+}
+
 #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
 /* FOLL_FORCE can write to even unwritable PUDs in COW mappings. */
 static inline bool can_follow_write_pud(pud_t pud, struct page *page,
@@ -1566,9 +1584,6 @@ static long __get_user_pages(struct mm_struct *mm,
 			page_increm = nr_pages;
 
 		if (pages) {
-			struct page *subpage;
-			unsigned int j;
-
 			/*
 			 * This must be a large folio (and doesn't need to
 			 * be the whole folio; it can be part of it), do
@@ -1599,11 +1614,7 @@ static long __get_user_pages(struct mm_struct *mm,
 			}
 
 			gup_fill_pages(pages + i, page, page_increm);
-			for (j = 0; j < page_increm; j++) {
-				subpage = page + j;
-				flush_anon_page(vma, subpage, start + j * PAGE_SIZE);
-				flush_dcache_page(subpage);
-			}
+			gup_flush_pages(vma, start, pages + i, page_increm);
 		}
 
 		i += page_increm;
-- 
2.56.0

