Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103844;
	b=X9kBVbl9m0YpjwdZnX0r6YWQdQALH692KPyCKng/4Z/o2qu8v06nGHSruOqzvAir2nSo
	 6T2MpGP7fUQHcj1WhKnMXSGx1/Be6EpVxlqecAOyrb1R1F4SG+56vhJcoc/DdiU5Owvzw
	 +wa4p8SmMjJIe9X07p+a9aB2p8nMXuLrSlBRfnt3Xl7NhNwGEKzVoQ5n4yUOZwTQVN8So
	 mN87scueRW1haJfsr3lU+RmrFOlCIfh6Bf/nLG3+qZ938BETgp5sYRCvgv5yXIQnvB6Qk
	 elH0klbiR9coiY3uCSDIP5/aI7P0NCFA1UIj2YtxignHLG1SWL3k7MKbktDiIQ73W9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103844;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wL9zRdjFVzJ6psamOgPyoRa5vDWjyqfaLzG25PcBd7c=;
	b=PUC/rgEBw39Lkaw2dy64t9BDy93Odv44Nbuq4Fous7HtxUKtBT9QfOneI1yhO4Zy27YI
	 XxMoQ3gilOFqXABiwzlvAwDWxrppCUYRNT6vCju34Bbh6A7kZ3HYwYrOjY1jVgxNc91MF
	 yzG15D9evJVfVz/TleYYCoG3/Ia3nsrbLhfCLnJE9oE5UbbNb6H5bwh6K3VwqCuDAaqqy
	 Omn8YF2m8xu0PMuQU01dlVrIeRcpGZCF99CIGuWuKu1ZCeHQG66buBVq2vimPN995S8R2
	 Uawask9p1Ln2zjMJ6St1/UmU1SndBL7m+QYysodmBg9iEfmHOuH3sx52e7X3LNL5Lgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=b7biwU9a;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88404606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88404606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=b7biwU9a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=wL9zRdjFVzJ6psamOgPyoRa5vDWjyqfaLzG25PcBd7c=; b=b7
	biwU9atXWkfGHRDy9IQKAM74YE2OHdt0FTL8f2EerLj33tga+sRKjHR0LB8BaxNVVph1T50++h+dX
	5u5M9hoBaL0KfC/jfrgDRj9T7/wRtJrwmSo23gp/vnO+Ik4xNpZYmL9KsZ+TLHCucloLETqBDnbDc
	XfBFApDeoDTNjsdxCZBQuy5kKQWOq3s0sKRK+mtYZday6jScF5i6VbP6+3rbV8Id69y4DVn/Pg2FH
	fHYGPN8ev7ydD6FOcTo7b7ZhDwEDm41KwkK17ylat6jQ2od9Qd9PXcs4DNONLC2hlp2VIVW4GpezA
	Dli9MRIfaoE1GjEIsO9+Qh1f2b0OxBDw==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xU4VS-00000005VOH-1Ol8;
	Thu, 19 Nov 2026 15:57:02 +0000
Date: Thu, 19 Nov 2026 10:57:01 -0500
From: Rik van Riel <riel@surriel.com>
To: David Hildenbrand <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, John
 Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Peter Xu <peterx@redhat.com>, "Liam R.
 Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, Michal
 Hocko <mhocko@suse.com>
Subject: [PATCH] mm/gup: unshare-check every page of a pte batch
Message-ID: <20261119105701.3f57ac54@fangorn>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

A write pin over a PTE batch can hand back pages that a later
write fault replaces under the pin holder: the process writes to
the copy, the holder keeps the old page:

    pin holder                          process (mm owner)
    pin all 16 for write
      batch passes unchecked
                                        write to a tail page
                                          fault copies it elsewhere
    read pinned page -> stale

For every FOLL_WRITE call the helper returns the whole run on
the head page's credentials, never reaching the per-page loop below.
After fork, a FOLL_FORCE write unsharing only the head leaves
the tail pages read-only and non-exclusive behind identical
PTEs, which batching (PTE bits only, never the exclusivity flag)
covers at once.

A page pinned for write must be exclusive to the pinning process,
and one vetted PTE proves that for one page only. FOLL_GET and
single-page FOLL_WRITE keep the shortcut; multi-page callers run
the per-page check. Writable batches and GUP-fast are unchanged.

Without this fix, the pin holder sees stale page content,
with it the pin and program address map the same page.

Signed-off-by: Rik van Riel <riel@surriel.com>
---
This fix applies on gup-7.5-ptebatch in mm/core.git

 mm/gup.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index b0a0019de80a..6b6e4c6f8144 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -639,15 +639,25 @@ static unsigned long gup_pages_not_requiring_unshare(
 {
 	unsigned int i;
 
+	/* A short term reference does not need the pages to be exclusive. */
+	if (!(flags & FOLL_PIN))
+		return nr_pages;
+
 	/*
-	 * FOLL_WRITE is implicitly handled correctly as the page table entry
-	 * has to be writable -- and if it references (part of) an anonymous
-	 * folio, that part is required to be marked exclusive.
+	 * FOLL_WRITE for a single page is checked by the caller, which
+	 * checked that the page table entry is writable, or FOLL_FORCE
+	 * on an exclusive anonymous page; if it references (part of) an
+	 * anonymous folio, that is exclusive.
 	 */
-	if ((flags & (FOLL_WRITE | FOLL_PIN)) != FOLL_PIN)
+	if ((flags & FOLL_WRITE) && nr_pages == 1)
 		return nr_pages;
 
-	/* folio_test_anon(folio) is stable until folio gets freed. */
+	/*
+	 * Check each page for suitability below. The caller may have
+	 * only checked the page tables.
+	 *
+	 * folio_test_anon(folio) is stable until folio gets freed.
+	 */
 	if (!folio_test_anon(folio)) {
 		/*
 		 * We only care about R/O long-term pining: R/O short-term
-- 
2.56.0

