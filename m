Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645651;
	b=fpGkKRWs+BLR0kb9hIDNBDBHirvXz4iK+rfk0pM+hnGe5rEjq9LvDIhGYmBtH5Lezwd0
	 /zc+XBO8Tk3E1LjkNWSaJ0o0tLiy9ZdEIsGdikskrPK70QZgiquJmm85ZFnxrMiy+xHN3
	 OX7ENP0wqIBKt7HbAMF2N5mQKY3MHUh2ntHmZEJtGOm1eSPmEb7lxnbTNH/1EiMiBORWj
	 Mi3Pf4dIb1+pBPO+XSGSGNzpzeTZ9DyJniuyfzFg/pRzGNFlx5Xm72fAqjkYUv4F0pvyR
	 A8Xk5JFGFF0inrD/xYL1LpEVcHJyvFpABiLGi4Jy9WLsQGiW3YqPJVQ39Stponl8xDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=RiNM9OF5vBLtGgFl62pfxBUQi+W1VLFdVJFedeCHig4=;
	b=gvSwtHEHdJ7W/6sMDuyQRSNP10SWhoR30/zK2VZF7+bSalley5MxJ322PZJcgMd+r591
	 W+MKTTu/xSvmQkA17dRV6MOVboL1Id95cdey0lyUyPkvtreSUKXoLfHgTCJfl73qb3GIn
	 TdN72PeUP1Uk4/uHQ3CqbD/2nxQPrqio1oJu0Wyrvm+QZY9nVxNEJR8/cBhlS5oC3/Jep
	 mb7eNqY5VolRtFKsQ3d217lmfniBLUOywuo2ZqegYCKbErx9bq1av/jtCvAug+1GIAM7m
	 sYZ3U+HiIo7IbRHFt4+/VEAE2bSgO9OJ1OyFVOAxUGdroVt2aOKkYzHMgiHARCORhkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nZp8zMxx;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45EA606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E45EA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nZp8zMxx
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869865a304so490596eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645649; x=1796250449; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RiNM9OF5vBLtGgFl62pfxBUQi+W1VLFdVJFedeCHig4=;
        b=nZp8zMxx+xiHgR6o7ArSyLmlUC+8TFeTxpnjim/CeWqQULhssE6GK2uwFqCuFnwfEp
         +I6a+WEfjTzj0vXnutB0nbx4TAUlRbWMV/yRzaqYdqpFIs1U39lclRIQZAL+YoKnNsvs
         RBK6o9DiZ1u/Zy8fQSwOPlFVGH7dkTMwbWex2vyr/3e/1F+pXUNQ1Zx4cli2XQ/g8iMu
         Br6Ur8/b1cKyVXPDoyB4Ryn/s/QSxo/Qm05sq6TQ9hPtBuj3Yat4Fmn7q8ZumG6fAMwd
         RmJrvPHQvnfcc9397M3PhZjbMDr9w6kQcA7/CshHdCKrzAWgSYGbP10bFp4v2TLjU9QL
         WC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645649; x=1796250449;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiNM9OF5vBLtGgFl62pfxBUQi+W1VLFdVJFedeCHig4=;
        b=dMnLUNzSdoG4MCfTLV3JZFxOWZ3+1O5ACVdp8Xajs54KkIzz4JqxCSZCKclDW4TNR3
         Ox9ZLZgN3p8LPzFHqxRzCaDpCGTErrEuCjf9YmBTS1O0kKLCpg0qLH/QM8d0QFC4BGVT
         MmixJq+Hh72OO/49/6WlOCqWNtq+NjLD1prM/Z6p6gjP7bFYUO8bgSoLQRXKoVZftvtr
         MIVCOtO6bPfpZBW9O10fzeHNOFHcEiOuz550c69M32BPgQSEWJG3ATfgbN5bdjNoNJrE
         XJmRGdAhpMCdX5r7vbyUuLT0Wu4zIwSFtyH99AKEN8+6S1EJIwtPZZgi9phfGONAyeGk
         /qhw==
X-Forwarded-Encrypted: i=1; AL+hErHnPzOYGHA33HAGgImdQhOz+a3WgW5Z0GADSjSc4gvbkuQu8YBXiXFKIq12N1qx282bcZfVytB+bvNvJDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bPwp7MFRyOYoxlruUOyaoUyUcoH9OsLYfDSNJaXsGbHvPktDj
	jlQuApViS+c0H7tBzw9vMYRNCrHsxX+IVLo05Qill9HSlNmAt47H5S5ENDEMcvRKwNf5YN2ADFe
	ETg==
X-Received: from dyp12.prod.google.com ([2002:a05:693c:65cc:b0:381:fb4c:34e1])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:4710:b0:378:314:4042
 with SMTP id 5a478bee46e88-385702587c5mr17876713eec.14.1795645648594; Wed, 25
 Nov 2026 14:27:28 -0800 (PST)
Date: Wed, 25 Nov 2026 22:27:13 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222713.1450385-1-elkin@google.com>
Subject: [PATCH] mm/migrate_device: use locked folio in migrate_device_{range,pfns}()
From: Elkin Cruz <elkin@google.com>
To: David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

migrate_device_range() and migrate_device_pfns() read a speculative
folio pointer via page_folio() prior to taking a reference or lock in
migrate_device_pfn_lock(). If the page splits or changes compound state
before lock acquisition, folio_nr_pages(folio) inspects stale state and
the nr > npages - i error path calls unpin_anon_rmap(), folio_unlock(),
and folio_put() on the unowned speculative pointer while leaking the
reference and lock on the folio actually locked by
migrate_device_pfn_lock().

Return the referenced, locked folio directly from
migrate_device_pfn_lock() and skip unlocked entries cleanly.

Fixes: dc41e961a269 ("mm/migrate_device: avoid out-of-bounds writes for compound folios")
Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 mm/migrate_device.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index a953e7acbea6..a599d5baa340 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -1416,11 +1416,13 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
 
-static unsigned long migrate_device_pfn_lock(unsigned long pfn)
+static unsigned long migrate_device_pfn_lock(unsigned long pfn,
+					     struct folio **foliop)
 {
 	unsigned long src_pfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
 	struct folio *folio;
 
+	*foliop = NULL;
 	folio = folio_get_nontail_page(pfn_to_page(pfn));
 	if (!folio)
 		return 0;
@@ -1436,6 +1438,7 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 		return 0;
 	}
 
+	*foliop = folio;
 	return src_pfn;
 }
 
@@ -1464,18 +1467,18 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 	unsigned long i, j, pfn;
 
 	for (pfn = start, i = 0; i < npages; pfn++, i++) {
-		struct page *page = pfn_to_page(pfn);
-		struct folio *folio = page_folio(page);
-		unsigned int nr = 1;
+		struct folio *folio;
+		unsigned int nr;
+
+		src_pfns[i] = migrate_device_pfn_lock(pfn, &folio);
+		if (!folio)
+			continue;
 
-		src_pfns[i] = migrate_device_pfn_lock(pfn);
 		nr = folio_nr_pages(folio);
 		if (nr > npages - i) {
-			if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
-				unpin_anon_rmap(folio, src_pfns[i]);
-				folio_unlock(folio);
-				folio_put(folio);
-			}
+			unpin_anon_rmap(folio, src_pfns[i]);
+			folio_unlock(folio);
+			folio_put(folio);
 			memset(&src_pfns[i], 0,
 			       (npages - i) * sizeof(*src_pfns));
 			break;
@@ -1508,18 +1511,18 @@ int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
 	unsigned long i, j;
 
 	for (i = 0; i < npages; i++) {
-		struct page *page = pfn_to_page(src_pfns[i]);
-		struct folio *folio = page_folio(page);
-		unsigned int nr = 1;
+		struct folio *folio;
+		unsigned int nr;
+
+		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i], &folio);
+		if (!folio)
+			continue;
 
-		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
 		nr = folio_nr_pages(folio);
 		if (nr > npages - i) {
-			if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
-				unpin_anon_rmap(folio, src_pfns[i]);
-				folio_unlock(folio);
-				folio_put(folio);
-			}
+			unpin_anon_rmap(folio, src_pfns[i]);
+			folio_unlock(folio);
+			folio_put(folio);
 			memset(&src_pfns[i], 0,
 			       (npages - i) * sizeof(*src_pfns));
 			break;
-- 
2.56.1.839.g22a8290db9-goog

