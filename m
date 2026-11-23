Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463784;
	b=u1itd1QF51Pnn/bhW9J5BIb+6/ZvsdbV85unFEDmGA+f3QPxdv0qTEshLlrv/Es4iQhR
	 86w6QlR305SuPU7yRmVDxhlgNjeQNE8rkKwJGOh7XM1n3J/DfdAVPOE6FQazwuChwP7uN
	 1+QBN/ngdn+E1wkdPx8Ivv/59OIazSUJn6XSnnewX3OLRQGFMjBbdBOGzq/9UeRWoTRLq
	 E0CVaD4bJ0cMK/xHFQOBPEcvFDKTn5WAGlvvZeBxzc6mcenp1Bj8a1KPM9EqfovrrRs3y
	 tJ6BR5VOlcmbHfB2NcwHqdYiuLQL7Y6/RoSEoZUiL83l+csVtY4jU6An6ma9+RAV65Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463784;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0l0hI0hPW7np4LU+X+ck4bAX6L3V8X+HfM8xQdpCOOc=;
	b=Aj/Dgw1DMtYKamPMaZndRjEH78xPXq1roVH/53dhz731gEaPVUr1zLGNLAWtL9SZs68s
	 Fzi+hIbVSKclmwaN/24u+NTM5LfXVZpEnNmm/GAStb+09aBpuC+chnPkGsViL3TYASsk+
	 UF1a6sjks77/32XnyBahA2x+DaRs3xTcCzprJ3kjNHRsCgyYobrRpO0jAdF6IHt3Hkeaf
	 ucQlo6/QH+p+c+Xbsud4YFZp+mOeG3MO8E1A3uLEaT6etD6qYJrvQNM76W1iHz4gIZx2S
	 a4CGZBgRynLON6T9h9pbCxcNAUdnmB2Rh0kWKVc0syHWl7RqpHUt3NRATRhTxpZIcog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=FCqETidW;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023C7606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 023C7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=FCqETidW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=0l0hI0hPW7np4LU+X+ck4bAX6L3V8X+HfM8xQdpCOOc=; b=FC
	qETidWA4RKNXtqQZJF/Ja0utDNejMx4YoeL0Jy31s8JWa0lHCEwVBWKz4TIwu2fxC7+szCLKIcKiq
	Vcr6devcAEeBjI/nsSOywlJqFYzJWJ6JAKym7x3YVRHhAjbqKSTnTHTABrBNcfOXZDS4NGKIBibiq
	W7z55h7VKp9vWFC+1bGn8XfsKwCGRL3ExaAvtMl8ZpgF6LilcKG7rvqr6oiBrut/POboUFKqVZUHh
	LxMDHyXsuzS5TUBmRZ0W+XODBVNSyq12GTTEKvD/h99mE7oJ6tM+hpQFNYsulqfwLhMFCXIR2EcGl
	YteFdaL6C8I6LDDo6qOSlZfAQaQIHERg==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xVa99-00000006IU7-13XX;
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
	Peter Xu <peterx@redhat.com>
Subject: [PATCH v6 0/9] mm/gup: walk and batch whole PTE tables in slow GUP
Date: Mon, 23 Nov 2026 14:56:00 -0500
Message-ID: <20261123195609.4115244-1-riel@surriel.com>
X-Mailer: git-send-email 2.56.0
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
the PTE lock for every page, and a PTE-mapped large folio (mTHP) pays
one try_grab_folio() per subpage. The fast path already batches
PTE-mapped large folios; the slow path does not.

This series brings the slow path to the same shape in reviewable
steps: three no-functional-change refactors (store, flush, return
type), two splits of follow_page_pte(), huge-page count reporting,
the multi-PTE walk, the same-folio batch commit, and the unshare
check every batched write run needs. The
batch-length helper is shared with GUP-fast through an fpb_flags
parameter selecting the scan.

Patches:
 1. break out gup_fill_pages() helper
 2. break out gup_flush_pages() helper
 3. convert follow_page_mask() to return a long
 4. split out folio grab-and-store helper
 5. break out gup_lookup_pte() helper
 6. return a huge page's full count from follow_page_mask()
 7. walk multiple PTEs per follow_page_pte() call
 8. batch contiguous same-folio PTEs into one refcount grab
 9. unshare-check every page of a pte batch

Measured with tools/mm/gup_bench.c (PIN_LONGTERM_BENCHMARK), median get
time over 16 iterations on a 256 MB MADV_HUGEPAGE region in a 4 CPU
VM, folio sizes confirmed through the anon_fault_alloc counters
(4100 folios at 64 kB, 128 at 2 MB):

  gup_bench -L -m 256 -n 65536 -r 16 -t
                        before      after
  4 kB base pages      2753 us     1178 us   (2.3x, patch 7)
  64 kB mTHP           2946 us      231 us  (12.8x, patch 8)
  2 MB THP (control)     72 us       71 us

Patch 7's gain is the page-table descent that no longer restarts per
page; patch 8 adds a further 5.9x on mTHP by committing each run with
one refcount grab. Base pages share no folio and are unaffected by
patch 8; 2 MB THP never reaches follow_page_pte(). With FOLL_TOUCH,
folio_mark_accessed() drops from 512 calls to 32 over 2 MB of 64 kB
folios (measured by Yuan-Hao Hsu), matching the huge-page and fast
paths, which mark once per folio.

This is based on 102d6c3d5892 (merge of "mm: gup: batch PTE-mapped
large folios in gup_fast_pte_range()" from the gup-7.5-ptebatch branch
of mm-core.git)

 gup.c |  589 ++++++++++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 359 insertions(+), 230 deletions(-)

Suggested-by: David Hildenbrand <david@kernel.org>

Changelog
---------
v5 -> v6:
- Moved some dead-in-patch-5 code to patch 7 (Lorenzo)
- Clean up some comments and variable names (Lorenzo)
- A few more comment cleanups elsewhere in the series
- Changes gup_pages_not_requiring_unshare() so slow GUP
  FOLL_WRITE writes to shared anonymous pages don't get lost.
- Clamp the follow_page_pte() walk to the page table end without
  using pmd_addr_end(), which is a noop with 2 level page tables.
v4 -> v5:
- Rebased onto 102d6c3d5892 (landed GUP-fast batching and the
  folio-based unshare helpers); adapted to the store-only
  gup_fill_pages() and gup_must_unshare(vma, flags, folio, page).
- Split the store/flush extraction in two: new patch 2 breaks out
  gup_flush_pages()
- Dropped the "fill the pages array outside the pud/pmd lock" patch.
  Separating of the fill and flush helpers made it possible to just
  keep the (fast) fills inline, while keeping the (slow) flush
  out of the loop, at the tail end of __get_user_pages()
- Rewrote patch 8 around a shared gup_pte_batch_len() with an
  fpb_flags scan selector; GUP-fast uses the same helper instead
  of its inline scan and trim. (David Hildenbrand)
- Read-only runs are trimmed to the pages needing no unsharing
  instead of refused; the trim also covers runs of one page, which
  the fast path relies on as its per-page unshare gate.
- Renamed gup_grab_folio_pages() to gup_grab_fill_folio_pages().
- Re-measured the benchmarks.

Link: https://lore.kernel.org/r/20261116210127.3837898-1-riel@surriel.com [v5]
Link: https://lore.kernel.org/r/20261102193026.3860700-1-riel@surriel.com [v4]
Link: https://lore.kernel.org/r/20260811025157.1632867-1-riel@surriel.com [v3]
Link: https://lore.kernel.org/r/20260801031540.2742891-1-riel@surriel.com [v2]
Link: https://lore.kernel.org/r/20260730035350.1fc95dd8@fangorn [v1]
