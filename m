Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451600;
	b=Sf4njbZol2d1YnOdy1dL7ShrkqHVZBxEfetJ6S/n5jKsfBYuAl46qIEIWtxo/VaoBd+J
	 PczdPt6bpEcUaQB9Ad0zHLKbX1m46O249f8awVDWMwpNio2X/lQ7TBSpDtc8QOdx8jCcZ
	 DLMJtFZwTja/PSdi+rpq24v5fEqLFEur++p/jSKbFOfLb0C3BzIR5PaE3bQxMHE/dlHvg
	 yeRZd3yP3qTXz2L+K+K0+DEgyvEVieGOatDPq8qdToDswnyysu1iqBc3g39nxEzpffeBK
	 yKzEbMqJ/dSTcPDNRGh7CapbwkflOgSHdG/Y21ihpnpal7+DiLNTH/beH3CgtsZRCtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451600;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iHqXIb026uSXJYBJhjPjkt86/V6MV/kI2DuMRyyjh6o=;
	b=1v2P8mQ3SVvfOHbnUNiKspVVnAc+ebosHn1b4R64yzdQh2NRsgdFv5/HhjZkWtnMb1bM
	 63V+NEA5gSAq21VEnahnMV74OY2yRJjQRLoUeyrMhUB2/tw22M3dZNlYbsG8vMGXCwAmr
	 z+G3tYzbg0m6TdK8gwYNq2Jrq+wbOH4en31r1Q5UdRMLa1+BhSY7p2w9DoHaV9CwjzWtR
	 7/C8RAbFawakAAOWwEihnqe8Ye/xK/jPlooYr/K2IwWH6Rqgj1Eq5qs8ZDLmaQ9g410xk
	 LqB7froERZ0nptDVv7/CG2kTwF4pFGh+j3LYZOLRoCfFVhh7h9tnzjtHFedjt9rQ3DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HBNjAsOO;
	arc=none smtp.remote-ip=91.218.175.219
Received: from mta0.migadu.com (out-219.mta0.migadu.com [91.218.175.219])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490A0606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 490A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HBNjAsOO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/0wwfmfO3rHlK4K6Y0qZ9SSTUSTnaQnx867yqHOwqOQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795451598; v=1; x=1796056398;
 b=HBNjAsOOaPHvdroCzQmNe6NTzDbrPQpVhzQBiXl2pjpCuUueWeUfh3iXjMRP7seoS+zpOfBX
 w6tLFKQoxsSRcZM03lqSsACdSzS3Wiy4H4wZjHNRT/0LubEl444am3rmwfKDBfDxu5d70or3z2m
 lCkOfMPBGODGQW+npAwtbBKE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 82a19ca6e1a70be8;
	Mon, 23 Nov 2026 16:33:18 +0000
X-Mizu-Trace-ID: 82a19ca6e1a70be8
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
Cc: Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v3 3/5] fs/proc/task_mmu: read the PMD once in smaps_pmd_entry()
Date: Mon, 23 Nov 2026 08:32:09 -0800
Message-ID: <20261123163301.1568240-4-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261123163301.1568240-1-usama.arif@linux.dev>
References: <20261123163301.1568240-1-usama.arif@linux.dev>
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

smaps_pmd_entry() dereferences the pmd pointer six times. Read it once
into a local with pmdp_get(), the way smaps_pte_entry() already does
with ptep_get(), so that every test sees the same value.

No functional change intended.

Suggested-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 fs/proc/task_mmu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 540c936aad4714..105c4998eef48f 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1022,14 +1022,15 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 	struct page *page = NULL;
 	bool present = false;
 	struct folio *folio;
+	pmd_t pmdval = pmdp_get(pmd);
 
-	if (pmd_none(*pmd))
+	if (pmd_none(pmdval))
 		return;
-	if (pmd_present(*pmd)) {
-		page = vm_normal_page_pmd(vma, addr, *pmd);
+	if (pmd_present(pmdval)) {
+		page = vm_normal_page_pmd(vma, addr, pmdval);
 		present = true;
 	} else if (unlikely(thp_migration_supported())) {
-		const softleaf_t entry = softleaf_from_pmd(*pmd);
+		const softleaf_t entry = softleaf_from_pmd(pmdval);
 
 		if (softleaf_has_pfn(entry))
 			page = softleaf_to_page(entry);
@@ -1046,7 +1047,7 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 	else
 		mss->file_thp += HPAGE_PMD_SIZE;
 
-	smaps_account(mss, page, true, pmd_young(*pmd), pmd_dirty(*pmd),
+	smaps_account(mss, page, true, pmd_young(pmdval), pmd_dirty(pmdval),
 		      locked, present);
 }
 #else
-- 
2.53.1-Meta

