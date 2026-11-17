Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943261;
	b=f9KV8euPfDrj7joiRRN1Gdfhaac1pHNSEY+MiqRoIghYmttvQijLfmfI+HkrG5Yg41PQ
	 dtnlj+qqybJRajvD3Ndmr2Wf7keD0wb4xRr7kWAiK8KowTBsXkWi051XLxG3KqoxnMuUE
	 fMWQt6M6ctQEcouMkqw2F8LcdeB9op+xddYlnKaHb8EgRyJs49dSf+fJDGrM3KS3lNmGA
	 TeAJrmhvEAHQGEj9Kxy1ezclT39dlKE0YWpMnhTNOsk0V2AXddUyKAN54pKurv06dF3TW
	 rwTTGRhEORPpOW+bKlxOuGnpdj/r8lstlGlLhw9raXlZL1xv9NjPxdgOIW45jBWG7mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w1pP5hK5c0Kpgq7UYf5wVXth8KsJQzGv3dmC2VFyJ6c=;
	b=rB6IO9J3A618tpJFU8xfBsI+NIyWXrTZCBgjg78iOcLMDe5/PMeE5X1cP0ob/LsPEGH+
	 UN/mzWlnqPbZXukNmKMVSiq4sKif6WHQcxUSPLjna6tdFOJBRkJClZMlt3qXCofJbxPlC
	 Jw/vJrj+R1SONDxGHshV554gpN98l0RL8hu2QGuha2GSMhzdc1OrWW2W3ZsPZvfF0TD0n
	 c6CLxcj7Zk2LguzstKUabVSwi6NZ/ttyqEPStlfStv3F6bZ4mPR9gC6+lcuPbtnIVP2qF
	 y22ViNjZDBSBCvydr8NjKniFoOVkAXEFKadxqiwaMAKpGNBxUprJxpC0G9GEUeiQxtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kMTqJQT+;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173D6606A881
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 173D6606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kMTqJQT+
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2761c69fbso389383c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943259; x=1795548059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w1pP5hK5c0Kpgq7UYf5wVXth8KsJQzGv3dmC2VFyJ6c=;
        b=kMTqJQT+LoSRtjZi2k0tEqiRHH8NJI1aVjqctpGPa0j/PYVQfJMRQcXASvEocIcOf5
         QZEllLtBbQ/VBz8TTJYYn/smBoi9Cu6kgi2YqfRFOdChbPJa/tO08pmOKCirwnAt5pV0
         +SySbaQQZZiX6e9vFDGhI/9biiojgoxSZlqDirOkHjLmRcl5s9BjOSsTPcmS5WaKOq5O
         E+d3nsyVlhG5v/ZTOse8+n9Th7LadsLGgwTW5ctoI4uHzlJqqEvTDCa8fX4c0BUJNrVM
         sb32AgTVsKbxes8TGSpYjBC/VWEcFPHzs4iy6ZHsdJqbsA3QgyJhs6jZrB1u/dQQPh5X
         KAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943259; x=1795548059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1pP5hK5c0Kpgq7UYf5wVXth8KsJQzGv3dmC2VFyJ6c=;
        b=OIMBfKFRL7I6pnJI0VvhbTNOQr7oiLcscoZu0N79cTHbdxi2rzh4uY5Iv/p3yTc8x1
         G6TjF3LA3I8Zmt6NRGU9wzAJBLYvfTjvpOamEu+TNThEwMibe+7R2etKfTYb83xqh4KB
         IeqTIflTwfUbl50xmRMkQX8nzyI7hmNqZ6D/wwF5YyeVFj8p9gubpXdFBh45+rfRtJ3j
         gjsS94wtcg0m+AvhZixc0hBSgi+rU54D7kq6yM/w2F06lvFDOhi3+ngpZEFZnTURBSQu
         IL9ByeSb3/q7m9MWTOBKzqHaDaXfskLc2trqnT7YleUvPRo5Hnuq+SvkzDKpj9Zpf8l1
         uNMw==
X-Forwarded-Encrypted: i=1; AL+hErEdiKGPtgYvEXN6tqyU2kbJ2xyruyzjk1/fHjWVgW8e5qCEzEhJ1Y3fcQbJEcujkmFWtAtuI+W5cwIUwQ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rNyUmz3HbRliBKCU8hh9EN2VfA5P7OXzJO1UtpYJvrks2BMyc
	KCaebc31pEba9yjiWD+KFts1yigXMWtB3BGzPChRqcPeRb/0H/CZfd12
X-Gm-Gg: AYBFou0fOmovQ3ptUCO7+7xGy9FOmdIPdbR3flyZ7GJHs90r20DPdbQkiVUtCVMt6Ug
	SE3AO6LHImvUh1E2SWJL7zDr4yU/LQ50XcD4cJP7q8O253K3++HvqKb4jKsXfw/v3nLJd7N5Jnt
	iOccMW3BDPAbNXVGE8z2Moch1k4jKSiPV1uvCWMRttYYt5F09bRKVvNiRSWKj0zovCFEIqsOIOX
	rxRZJk9HgCKyd0Sa4X9WQelcjGUPWgf7sKt1S5XOaGY/ONjJjoHRAJkffaT1VjWWqGEFm3oJs+m
	T1JeQqWUX66ZJi12Vp0skPHFkZep5bkLB2JwzSq33pFEYwkJN4cLyNiAxrUp5ds4fPK1DxKgzyH
	2535scZji7F9BauTq53crObPQhfhYXWNNdMfHSjajZRNSXwYNdbQ0CBJXZwQboP9Ar395eOCHNA
	QlF3dQEGgHnIILpTKhTDaYHo9MJwzeeSO+G1GJKdh9ote+6Ltc94ljCHz9x/Ic6SVec1vGOCiZ3
	joMv3UEMmzP/mccOkTi5YR1lq9/LZPYnHrgihTTCXskRhc32U+qe57EW0DZ01XSPYeQdBtGi2j1
	syJQGWX5sxzyOmWyi6mlNvnuwzcGDJvvy/EXkIz0AXtfnxo=
X-Received: by 2002:a05:701a:cca2:20b0:1b5:31db:cc3e with SMTP id a92af1059eb24-1b543be92bcmr520505c88.11.1794943259060;
        Tue, 17 Nov 2026 11:20:59 -0800 (PST)
Received: from naki-PC.localdomain ([203.175.14.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm368230c88.11.2026.11.17.11.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:20:58 -0800 (PST)
From: nakixii <nakixii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Kairui Song <kasong@tencent.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/userfaultfd: check exclusivity of the page being moved
Date: Wed, 18 Nov 2026 03:18:53 +0800
Message-ID: <20261117191853.1314834-1-nakixii@gmail.com>
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
page.  Reclaim can leave the same state behind when try_to_unmap()
replaces the earlier pages with swap entries and then fails on a later
one.

Moving that page with UFFDIO_MOVE then fails with -EBUSY, even though
the folio could be split and the page moved.  Callers that fall back to
UFFDIO_COPY on -EBUSY end up copying instead.

Check the flag on the page mapped by the source PTE and get the folio
from that page.  Locking, refcounting and the split-and-retry path stay
the same.  The batched path only handles small folios and the PMD path
already checks the page the PMD maps, so they don't need this.

Tested in an x86_64 KVM guest on mm-unstable with only 64K anonymous
mTHP enabled: map a 64K-aligned region backed by one large folio, fork,
let the child exit, write to the sixth page and move it.  Without this
patch all 20 moves failed with -EBUSY.  With it all 20 worked and the
data was correct.  Moving the first page right after fork() still fails
with -EBUSY, as it should.  The move tests in uffd-unit-tests pass with
and without the patch (the two swap tests were skipped, there is no
swap in the guest).  I didn't reproduce the reclaim case and didn't
test arm64.

I found this with Claude Code while debugging an out-of-tree swap
backend, and it wrote the first version of the fix.  This version, the
changelog and the reproducer were also done with AI help.  I've reviewed
all of it.

Fixes: adef440691ba ("userfaultfd: UFFDIO_MOVE uABI")
Link: https://lore.kernel.org/all/20261116110122.309748-1-nakixii@gmail.com/
Signed-off-by: nakixii <nakixii@gmail.com>
---

Notes:
    Split out of the RFC linked above, as Kairui suggested, and rebased
    onto mm-unstable (81188836663676f8).  The code is the same as in the
    RFC; I rewrote the comment and the changelog.

 mm/userfaultfd.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index d65184d9a..ae9ee210b 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1557,6 +1557,7 @@ static long move_pages_ptes(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd
 		 */
 		if (!src_folio) {
 			struct folio *folio;
+			struct page *page;
 			bool locked;
 
 			/*
@@ -1570,8 +1571,14 @@ static long move_pages_ptes(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd
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
+			folio = page ? page_folio(page) : NULL;
+			if (!folio || !PageAnonExclusive(page)) {
 				spin_unlock(src_ptl);
 				ret = -EBUSY;
 				goto out;

base-commit: 81188836663676f8503f3603cfe56e88264c4d50
-- 
2.43.0

