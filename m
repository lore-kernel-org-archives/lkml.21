Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950649;
	b=ogo7YN6cPstU8rC/7ZXyZr/oAgIyxQKfi0QTxtgYoIVOfU8WnbCrsjs3jAs0lXohaldq
	 g0EJAgd8WVVxceW2TjIe8Lva4RD+B0Xc4pR3Wlzwq5vpQWg6Lqr7pXhSmx5QUn1L5rBQ+
	 kqNNbkoGHkLIIpvfBZChg2su9oJsR4XZNZT6aTpNPUlhgJCV5WyUgi3C5HZZIb1ejqknu
	 MX5jzq0e1TQx92FsgiOm9TdgsjqJx/AXptgL/goNmIyzo81AIEPVCTIliIMM9Lg78L/lK
	 ETih5OnkWcLFf5HLwJwjoDT7ieI0k0hTrMJlilcsXi6A8MUZ6LIGjERh9nHBGTEv3rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KUVSK4y9hdOD3jl6p+wHE+ISXrH307K2mWbZg23Omjc=;
	b=a/pnlXKrlDFNHc6kkoVqhUtvHR9nbZ4t46UI6bg+xuEPKuzTJLWJZI2jGvhJ29Os7xFQ
	 Vpi80qVuFbWDLQmrHy2hryZIZYiRRR30/1LxF5eA9xkZekQsNudMJLOTzb+6Y54lSDn3y
	 nfO2QyHGi/eXeEYC2BBhJaiCP6jl/MiRgvbD8ItDagTnxTSlymSb9X7og1tz6z8DNwgZv
	 t5qwZWKbSX5qW9XAol/3rsEMNIhz2UOFGUH9DZTC0SdMiqUqWCuCM3g3AVSeVgShfgX7c
	 jnz7JkgMktGhvb1T38vUT9iKgmzMgdYzdbC+Rphxus6Dj3G+V8Ao+fxS3p/Dc6tvARg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZVxKvjUR;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73BC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B73BC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZVxKvjUR
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso130600b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950648; x=1795555448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUVSK4y9hdOD3jl6p+wHE+ISXrH307K2mWbZg23Omjc=;
        b=ZVxKvjUR9Tjwk/Ra18u6rc82WPQEVIbM3si+ct1vrGaQ7GGN9ovpWGjypI5utADlcx
         3ZF2aqLljnU1sZyCv2vvtgzVqxtBOOUy0SczTktiLFB8Ol4Nle5+pM8jM5TKJuVbbS9J
         qnBGp07NsTvbI5dILB7/iWCLaqevWxzG2yWrfj3qXiFsLa+rXj00c1t9pTGzCvXjE/m/
         uvTZWZwoG4gTPd64DE1wpmXfihkzrFD0rruzapz+A5mhpCacaz20kLjTuhyN3ljBIqVV
         pnL/AOyttx/dkb9LuLQbOvb90/x0mkSP2iiZ6PSVJOF6l8uLQGigcrUTPA8IWe91JctP
         HUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950648; x=1795555448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUVSK4y9hdOD3jl6p+wHE+ISXrH307K2mWbZg23Omjc=;
        b=2zI5kUh4ZUjciAxIWJ84kep/Wki3JFxkXP4wFGGMO/7c7MgtC4kIEPdNiEZGzLFxn3
         i1lJE3tJuAR2g/jEz+kOcIUFm+WACldntudP/RoclGQVkLDb7obQWz260kBGI03CUcrk
         1qdgoC3t4ji8G6sAWxtJrT7dHvTvZ0152126Q/60ft4Nfqyc4/nWLLuI7TR30f22oJOW
         jxTdTaWdWpTw9UkwW1R+5LQUoewXALMZM2LdRZiKI9EMbwtTo3PtkfnElFxZfFOZYpEX
         fXdYaEh02ZgE71ZLanYBpVycC7E4VuSqSoCfB9FhyLjDskVOtDK7FuzqEl5V4VL/AWgs
         jNsA==
X-Forwarded-Encrypted: i=1; AL+hErEmWj1I6dmeM5DK8MAaM+sqknbSTbHZL/VWDvCS1YKbRGDnGabh11UEjUVkZ84Xw5v9Q1Z75HfPlpUTNsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DhK/8NDQ0EIOt3jdNed9k4VpEOPIjlkzFTlxrkra4rVL+YSUZ
	miBOnPiSY/+0am2dM1ETf2XFVAhtwecb2Jdfy8KSkBT8EkrF/1+PjVVZ
X-Gm-Gg: AYBFou2/Z2CkoHq+EjB1SLX2EM9GoKixuyIfMzA89jragFd7E0akoIIIqd14iAD+/3c
	l2TeCYxp86TROdae11d9CXQuorJPfKy5c1Mgdno+ckCMxC1qgFx0yijLmDlJaiYj1NRx9w9TY4p
	woN66YohOtLpu+g9VF8oZ5WxiWDqlJkU8+NaC9tO/f/1yEO0D6KWUT/5Ld8ZnDNu/6SJPIjBNL+
	M1ai5y4qvR/8f4LCkolZCNXgT8nESr+KTlSA5NoJ2NQasaOi2p50pDTDfEIX8cPuQCY1efibWLZ
	DkRQikooVXDbq9uli8Kaos5DZai8zEnNMjlPBNfj8oyW7EWS9od2tqSn8hdBIQiBo3PU7eZcbGh
	ARxuimHBC0QGYKgGc6dJlUcWbO0DYDYoNduVAP3Y4fcUaskVQcFXOA9Z+6jFD4WG0xkkWqOM8Jp
	M9d8zTFFif4uKJsAX/YzQTKzPjnMSgfrFXBR5ToM2fp5JQo+pbgSBOqKbRz7iwpyXa+O9JpDwxc
	PpDsS0zq33F6tWaanSLBqCBnp1SV8vEM3foM6HSo+9DynlTynuVBkL3gAgx5WSQ4gpLt/+gPPQk
	ScSRSDgS2iDQQu2dyTuJFlBLi9CY0wLwGYV/E83Ro5wQuscXfzxYLQFZ2wMr4DEhmQfJ
X-Received: by 2002:a05:6a20:5491:b0:3e2:168b:d317 with SMTP id adf61e73a8af0-3fe97fed6femr539981637.44.1794950647990;
        Tue, 17 Nov 2026 13:24:07 -0800 (PST)
Received: from naki-PC.localdomain ([203.175.14.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3bba8a50sm76865a12.14.2026.11.17.13.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:24:07 -0800 (PST)
From: Eric Li <nakixii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Kairui Song <kasong@tencent.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mm/userfaultfd: check exclusivity of the page being moved
Date: Wed, 18 Nov 2026 05:24:00 +0800
Message-ID: <20261117212400.1890820-1-nakixii@gmail.com>
X-Mailer: git-send-email 2.43.0
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

move_pages_ptes() gets the folio of a present source PTE and then checks
PageAnonExclusive() on the first page of that folio.  PG_anon_exclusive
is per page, so for a PTE-mapped large folio this can give the wrong
answer for the page that is actually being moved.

This happens after fork().  fork() clears the flag on every page of the
folio.  Once the child exits, a write fault in the parent can reuse the
large folio, and do_wp_page() sets the flag again only on the faulting
page.  This case only exists since commit 1da190f4d0a6 ("mm:
Copy-on-Write (COW) reuse support for PTE-mapped THP").  Before that,
the same state could already come from fork() after MADV_DONTFORK on
part of the folio, or from reclaim when try_to_unmap() replaces the
earlier pages with swap entries and then fails on a later one.

Moving that page with UFFDIO_MOVE then fails with -EBUSY, even though
the folio could be split and the page moved.  Callers that fall back to
UFFDIO_COPY on -EBUSY end up copying instead.  It also goes wrong the
other way: if the first page is exclusive and the page being moved is
not, the folio is split for nothing before the retry sees the shared
page and returns -EBUSY.

Check the flag on the page mapped by the source PTE and get the folio
from that page.  Locking, refcounting and the split-and-retry path stay
the same.  The batched path only handles small folios and the PMD path
already checks the page the PMD maps, so they don't need this.

Tested in an x86_64 KVM guest on mm-unstable with only 64K anonymous
mTHP enabled: map a 64K-aligned region backed by one large folio, fork,
let the child exit, write to the sixth page and move it.  Without this
patch all 20 moves failed with -EBUSY.  With it all 20 worked and the
data was correct.  Moving the first page right after fork() still fails
with -EBUSY, as it should.  Writing to the first page instead and moving
the sixth fails with -EBUSY either way, but without this patch the folio
was also split all 20 times.  The move tests in uffd-unit-tests pass
with and without the patch (the two swap tests were skipped, there is
no swap in the guest).  I didn't reproduce the MADV_DONTFORK or reclaim
cases and didn't test arm64.

I found this with Claude Code while debugging an out-of-tree swap
backend, and it wrote the first version of the fix.  This version, the
changelog and the reproducer were also done with AI help.  I've reviewed
all of it.

Fixes: adef440691ba ("userfaultfd: UFFDIO_MOVE uABI")
Link: https://lore.kernel.org/all/20261116110122.309748-1-nakixii@gmail.com/
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Eric Li <nakixii@gmail.com>
---

Notes:
    v2:
    - Say in the changelog that the fork() case only exists since
      1da190f4d0a6, and describe the needless split when only the first
      page is exclusive (Mike)
    - Mention fork() after MADV_DONTFORK on part of the folio as an older
      way to get there (David)
    - Check the page before taking its folio (Mike)
    - Sign off with my real name (Mike)
    - Add Mike's Acked-by
    
    v1: https://lore.kernel.org/all/20261117191853.1314834-1-nakixii@gmail.com/

 mm/userfaultfd.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index d65184d9a..e270b5722 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1557,6 +1557,7 @@ static long move_pages_ptes(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd
 		 */
 		if (!src_folio) {
 			struct folio *folio;
+			struct page *page;
 			bool locked;
 
 			/*
@@ -1570,13 +1571,20 @@ static long move_pages_ptes(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd
 				goto out;
 			}
 
-			folio = vm_normal_folio(src_vma, src_addr, orig_src_pte);
-			if (!folio || !PageAnonExclusive(&folio->page)) {
+			/*
+			 * PG_anon_exclusive is per page. The first page of a
+			 * large folio can be shared while the page mapped here
+			 * is still exclusive, so check the page being moved.
+			 */
+			page = vm_normal_page(src_vma, src_addr, orig_src_pte);
+			if (!page || !PageAnonExclusive(page)) {
 				spin_unlock(src_ptl);
 				ret = -EBUSY;
 				goto out;
 			}
 
+			folio = page_folio(page);
+
 			locked = folio_trylock(folio);
 			/*
 			 * We avoid waiting for folio lock with a raised

base-commit: 81188836663676f8503f3603cfe56e88264c4d50
-- 
2.43.0

