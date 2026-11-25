Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607546;
	b=C8QPnT2UIXc4g2WhOf43d1tQvFHV/za9mtB+yjExpBJANg5fj/Zrvv7ncz+jXlsOa5ap
	 bmffFHflG+b9OngtYMYa2eZ9ejBPm4jlOJ0wj3cl/RZ3apmyfoCGyIpnw8NF2ptg8zimt
	 KRsbH+0MYIKGamXWpKNjOOiV27jEaDs6Fd3znmv+/S5vG5Zd2xSUpnmc0NwVjPAS8pcxl
	 iCBbOASxjAGkCTSKDnTx8oRAfQsGyirwA2HnEpW35Svapn8GK4FiS7NlhS7du7rXnLsNH
	 fJY/klIFezPHLAAlGNOzSoCmcN5ut+142vn1b7z0VRDMKtgtTmDVG1cYxSXJENTJpIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607546;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=liDtjMCYWCVrpCiVXsPu6BPJfflyuRnHj5CWksRn/08=;
	b=TPRIwO1BJ/oEBZa+C2s5dcEzBT61dyLEkV+MSScjV5k2ew77Z/8BA0buYdpW9/jA4nX6
	 413LiUkuMopm5aI/shbd9Lo08KM40Fii63lPytKT4i/5SK+nVQPek02ffKD7nTGFQkKzK
	 dQjotBfOPgIVi7ixut2JeOnQFpNRzmK/eo2fyM2ZKkW3eJNlHgGMebXnw8brXGajwuMQw
	 cWDIRKxQC5sR60MvqDFEaeL9lqTfO3kaeQptyfqG48DovWxxiQkCw1egRbfLem2ruFoxz
	 aCjPp8ShvF/P+UTZToxb+i0d62DX+ZdbcA8oyPonRaiutouFZdrJWJuz35MlSsGyA2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qsV0H+Du;
	arc=none smtp.remote-ip=91.218.175.69
Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524D1606A683
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 524D1606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qsV0H+Du
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=x1fNkb2uruRr6K+ePqbhT3N1TY6nC237qiyCXj/fHh0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795607543; v=1; x=1796212343;
 b=qsV0H+Du1bSLyjc/3uRBuEtZ5JX5kwPH/tVg2Qq6WFrvNJCK9y3+RYZ2oeZVLpPyIoF/Ga0X
 EqGJK4NPXVejWAG+sRUeS0OuvSkDj5KYYKOteH7kqy8TYlQFVQeVgjLxjpEIuV4deI6m+fgT6cB
 7cxDgRcQIyTqLQMozAnyroL8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 7eece8749f71e3f0;
	Wed, 25 Nov 2026 11:52:23 +0000
X-Mizu-Trace-ID: 7eece8749f71e3f0
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	apopple@nvidia.com,
	byungchul@sk.com,
	david@kernel.org,
	gourry@gourry.net,
	jannh@google.com,
	joshua.hahnjy@gmail.com,
	liam@infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	matthew.brost@intel.com,
	mhocko@suse.com,
	pfalcato@suse.de,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev
Cc: Usama Arif <usama.arif@linux.dev>,
	stable@vger.kernel.org
Subject: [PATCH v4 2/3] fs/proc/task_mmu: don't read young/dirty from a non-present PMD in smaps
Date: Wed, 25 Nov 2026 03:49:58 -0800
Message-ID: <20261125115014.4014507-3-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261125115014.4014507-1-usama.arif@linux.dev>
References: <20261125115014.4014507-1-usama.arif@linux.dev>
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

smaps_pmd_entry() passes pmd_young() and pmd_dirty() to smaps_account()
for every PMD, including softleaf entries (migration and device-private),
where those bits encode the entry rather than accessed/dirty state.
smaps_pte_entry() only reads them when the entry is present.

On x86_64 the entry's offset is stored inverted across bits 9-58, which
overlap _PAGE_SAVED_DIRTY, so pmd_dirty() returns garbage: a clean 2MB
device-private mapping is accounted as 2048 kB dirty, and lazyfree
accounting is suppressed. pgtable_64.h also warns that the hardware can
set the accessed and dirty bits on non-present entries by mistake.

Only read the bits when the PMD is present.

Fixes: c94b6923fa0a ("/proc/PID/smaps: Add PMD migration entry parsing")
Cc: stable@vger.kernel.org
Signed-off-by: Usama Arif <usama.arif@linux.dev>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 fs/proc/task_mmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index cb5e335bf05da4..cf1732935c73df 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1020,7 +1020,7 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 	struct vm_area_struct *vma = walk->vma;
 	bool locked = !!(vma->vm_flags & VM_LOCKED);
 	struct page *page = NULL;
-	bool present = false;
+	bool present = false, young = false, dirty = false;
 	struct folio *folio;
 	const pmd_t pmdval = pmdp_get(pmd);
 
@@ -1028,6 +1028,8 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 		return;
 	if (pmd_present(pmdval)) {
 		page = vm_normal_page_pmd(vma, addr, pmdval);
+		young = pmd_young(pmdval);
+		dirty = pmd_dirty(pmdval);
 		present = true;
 	} else if (unlikely(thp_migration_supported())) {
 		const softleaf_t entry = softleaf_from_pmd(pmdval);
@@ -1047,8 +1049,7 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 	else
 		mss->file_thp += HPAGE_PMD_SIZE;
 
-	smaps_account(mss, page, true, pmd_young(pmdval), pmd_dirty(pmdval),
-		      locked, present);
+	smaps_account(mss, page, true, young, dirty, locked, present);
 }
 #else
 static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
-- 
2.53.1-Meta

