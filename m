Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463788;
	b=wKPoF/rF+q0CGzC6eQEHTZoa0BKkMd5EiUPl2zRa5Yq2FGQK/UcEdlB0X6UBanEeoBGn
	 aojvH+MlmfQbQLqWUQaYU2jnIjln1O8yaH6vMIT2oUWztPu9pSdQIkp7JPKbZpRDz9jAi
	 ZmFu5847qi4MFVDp4w4M7S3Dm/Y1rS5t8BeojnvESc+sOHK5pbWuKCWcJ1Es7jAdK05ad
	 clAs4t0M3bFzPrN3GiQMCGej6ihq1P+EaUzoYRZo1MScrLk9vayamRM7FXSXhvRGX8ITE
	 N37w0PnkSXO88ds6hNF4NtFmx/VtT5aasqF2JdVU1Fzsb2oLTtx6K5jwRMVqqr6+UTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463788;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FIdriMJqvNi8Sms/WZB3l4qxJPg/qzey4m5IhEpr/rA=;
	b=iJjfZWKfV+yoGc9ULJAXC4e+sv46q+8T/zBXrWLyGcDL/9ThaW6qykFraXCgL9Fg1Dba
	 eAtU1yEvknDBbIDjcE7RIsid7IhMB7GQGaMWeMyZ11ryXc5gnuWNiiXqCi5vwOQaJy6tv
	 U9BzpBuzKSUVN0z2Oqi3AsYklQR3qWGY201cC8RJd/PpEyfVbgfvL0A3j3DEVQakIkQD7
	 WVA53TXAy81YMOVqW61l92NHrpUzzn8AuMBoy1Zd0DJ1gW4YxnPTqi2+wrXPLjA8DNQVn
	 x78jKKx9rO4BOpd5dBv1+hGNQSLxM2F3bfnUQq+IV/LNwvDIPttf8wK5+g7RMn8ZkBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=lAfq26yC;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C90606A339
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C90606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=lAfq26yC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=FIdriMJqvNi8Sms/WZB3l4qxJPg/qzey4m5IhEpr/rA=; b=lAfq26
	yCLesStGS1Da8QiWVoFQx7z2GofwOGGAdcZFuVH3KpQb0KJlcM2KQQr2NHgjFqrzfXsslrYYvYoNS
	zGnJF6RqKpI7ED0DiP1Vgf/yT/eWsmvzAPrOQr0y0oTOw5ZAVOV+etuWGzry9K+mGkqKHcLzv9oR2
	SI4tZPrK21c10BjhTj31f88xs9qDsX5pQpWHLgqwUP1Dx1J386vebspdL2IgMPcj1TiqoY/oN9tMB
	7ouK6H89vDnLumiApdqNKzeeCWjtY7btqnt/7wrBu3wXMgyiXY+7JW//hl9V1p0TnT9AmLfLg2uK1
	dOjeOhgL2TJFfgX9YZLAOa4K1XSQ==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xVa99-00000006IU7-2C0i;
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
Subject: [PATCH 9/9] mm/gup: unshare-check every page of a pte batch
Date: Mon, 23 Nov 2026 14:56:09 -0500
Message-ID: <20261123195609.4115244-10-riel@surriel.com>
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

A slow GUP write pin over a PTE batch can hand back pages that a later
write fault replaces under the pin holder: the process writes to
the copy, the holder keeps the old page:

    pin holder                          process (mm owner)
    pin all 16 for write
      batch passes unchecked
                                        write to a page
                                          fault copies it elsewhere
    read pinned page -> stale

With GUP-fast, FOLL_WRITE | FOLL_PIN can never reach
gup_pages_not_requiring_unshare, but slow GUP can reach it
with a read-only head PTE.

Only pure reads skip the per-page check now; anything else is
vetted page by page, so GUP pins the pages the process owns
exclusively and faults in the rest one by one.

Without this fix, the pin holder can see stale page content,
with it the pin and program address map the same page.

Tested by faulting a 64K mTHP, shaping it (fork+exit, head
write, mprotect read-only), then pinning all 16 with
FOLL_FORCE|FOLL_WRITE: before, the pin takes the whole batch
with no faults but the program's writes can COW the pages
later; with the fix, the pin unshares every page first
and the writes land in place.
---
 mm/gup.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 886a413b8233..ec39e489e131 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -640,11 +640,12 @@ static unsigned long gup_pages_not_requiring_unshare(
 	unsigned int i;
 
 	/*
-	 * FOLL_WRITE is implicitly handled correctly as the page table entry
-	 * has to be writable -- and if it references (part of) an anonymous
-	 * folio, that part is required to be marked exclusive.
+	 * A read-only PTE can map a shared anonymous page. Pinning
+	 * one without unsharing it first leaves the pin holder behind on
+	 * the old page once a later write fault copies it elsewhere.
+	 * Only short term read accesses can skip the per-page check below.
 	 */
-	if ((flags & (FOLL_WRITE | FOLL_PIN)) != FOLL_PIN)
+	if (!(flags & (FOLL_WRITE | FOLL_PIN)))
 		return nr_pages;
 
 	/* folio_test_anon(folio) is stable until folio gets freed. */
@@ -1015,10 +1016,11 @@ static long gup_lookup_pte(struct vm_area_struct *vma, unsigned long address,
  * Return how many PTEs map consecutive pages of the same folio and can be
  * committed as one run. Always at least 1.
  *
- * The write-fault and unshare checks in gup_lookup_pte() are per PTE, but a
- * writable run needs no repeat: a writable anon page is exclusive. A
- * read-only run under FOLL_WRITE or FOLL_PIN does need the per-page check,
- * so it stays one page at a time.
+ * The scan covers PTE bits only; a read-only run is then trimmed to the
+ * leading pages that need no unsharing, so a mixed-exclusivity batch
+ * commits its exclusive prefix and the fault path unshares each
+ * remaining follower in turn. A zero return means even the head page
+ * needs unsharing, and the caller must fault it in instead.
  *
  * @fpb_flags selects the scan: slow GUP merges young/dirty so
  * folio_mark_dirty() sees any dirty PTE in the run; fast GUP scans
-- 
2.56.0

