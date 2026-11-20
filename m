Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169376;
	b=eTtI+wOFpDoPbwcG8xohLVASRb0b8HYTaLUNu7S3Xjzpkc1QB3lA5xDPQzm++cRw2+Y9
	 Qrtaq6SkabmZ6wZ1kefYpa+mBaPE7qSheI1E8fFbadeKtxLu1CFxrMuroA8mfmOFkH/zi
	 Za+bkBaRf3qXHe1+Ov1MFilr4yRLgz0l/gqP9IZq+P6EGBCrbFpP8audqTxLdAgxeQpsu
	 +Z9CYfo5XliEQ5X9g2hMdXqT+UKxZJbP/kPQcF8zs/jBBXd+gMo91L4ZphpRvWOSffcDP
	 IMhEWksMiW3UAbctRtYXJFXW7Lyhpm2qBJhXFzTRaXVMbJRbuJn3BTostY1+aqzE8NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n0M97I6v0mM+QmRgb7kh7Im8w/4SIvsqvU/x63FN1U0=;
	b=4yuBNoOXVIt8rACaMzPwJ439cTXhoEup3QKUVe/wwlBZ9Jj5J1tw+LQQiRlcZC+Z/+oA
	 eWM+PXmxdng+8dEM3sm0vnJraHdleLnQgP8w03RrGXGEzDWFkGB4gLopiGSPXDIRDLOvA
	 bkKLV0oH64VSGwjnF+rWV8tchYNEoXu8as+WFH9+fNjz+A3E2RQFnglaOiL05TMbdLdj3
	 JEGN+3hEG/k46EZgEU76sXGxvFwnKawAD7sDuOtVaISanrwjsxg4fH9Pt8kHJXiOHa9HB
	 JApibqlPB6El70RDRCyqntChEnF1ywDri93CM0EdIDq0Qm1ocMm+ikhaK42n7r7G1YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gg4ky2Bw;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B130360A2613
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B130360A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gg4ky2Bw
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso468720a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795169375; x=1795774175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0M97I6v0mM+QmRgb7kh7Im8w/4SIvsqvU/x63FN1U0=;
        b=gg4ky2Bw+QDk4gqtBxwH3EDn+H9kD6xj/YjCAs8UR17omfS71Xm6hTLOwdDHgfJsRs
         V46xeA6ZVvYp4x7Sho6/aRvHwyRcfXlIw8fkvzd7Qavyj46bLtgxdwtfrLoZuKfivjX5
         cUslSICIojMr1iEPmXWTJd5VLgAqvCzu9Ti4C9DkWchY3477vqwet8H0o/Gb0Y7JIx8v
         LivFi9RMVShGp+7oRWUg65OFPy8sBRrXbZa9ADTiYKsdNXTot52db4Opr3+p4WjjEQEh
         nVMHM5UV7SRJGle7SVIn0xJ+PRANIHDYgG1bpZMCIKSWJOxMj1o9GIJNaF9vGm7S/5y8
         kViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169375; x=1795774175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0M97I6v0mM+QmRgb7kh7Im8w/4SIvsqvU/x63FN1U0=;
        b=DZdWbpA55q6K+D7+97D6bQUbqC7+xE12D5JWTtA3h2q8G+rnEWyApy86brSiXQswEV
         GZ/SkzTo/ZKZn0+KTXBuOvrZf3sa/XOIzRG1K0DYNBS95mWs47+8Wu4qHvSWipl37cW0
         QfCXW0v+tfYi45JITEsRCV+crqks5+J0ojtwCVn9j9YzFwn2nqTnzN5OsWLLRisWD3no
         nM6wpLsTdD2HUopUNOAsA8Ws0a9kul/Q9XeM20BvSpscgl1OgPL+y9lUS/vTrPMOihmf
         FjbDSLcOWbaZqGV7TX0QBDScAC5cxBJLer6Kd1hAGqpSDCU9uWhuhMCWcdspYi02ju74
         tbOA==
X-Forwarded-Encrypted: i=1; AL+hErEnGa8qBAY60KwHW6rqTqNZ8l0BFnBEJSdoF9R0BkyKefkSnkpfqQoVh/wwYr2PDletoY8GNV3uQq1cmBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V/mL9LXieRo4eOmnXfvUTMYmvD0SJLpMhEKgAUnCJQN3iH7XP
	ZZ/CSkzH4DSbr4pcLbm59xjAlr7L6vCksWjswZVgk2mgS7uKC4Ja2p67uf24gTQ+cQ0=
X-Gm-Gg: AZFdTZcgQQcHa155KcZdS9X+PRQN45EFpc2l9iTB0uB/6lZZtztrXuMEX91rq3W/z+i
	k1m3P/2y9BUbr/iXJbyqrrxBMfDayTmL0iodNXNU+mNY7J+FUE4nN5I79+M6IDMbbH3qX5dFVs+
	ziN4E+/xS54TjnsSX9rgP8ypoTSys78swueOYdWDespjxfrvfH+efbJYuub7Wfq1SCmlapOtWu2
	HKip5xSDPkOVEHBR2sPMCCT0RjMHKdE4e8QoZgAHEvWDswBsF+Gnrmhjb6c6q4A9qeLKzc5pcKn
	3S3RBnP7Gm2O3yl8QbPobh6SLjgLGG1CCrEOvD8iXhIAc1xJS+YJSXfKAWGV/StUCHkmYOtlE1C
	oz6gAhbUQJynEoyJw9GI7B5v/1Duh62MG8rQUpdFx1cQVr1vlCpGI2d+JGi/+u0iBk4SXBHYUn6
	nwAf1WGTACK8lnjWU2o6wLJt127jC3pFE8bjjja3baEiFYz9eayLFlkIiKCYAWW7VsJ1juyVdtP
	7WeX6dbtXsygaq/CCNlPaj+WWdEYUDBKAi/2LOdxb8T6HpRHKP/dT1WqSkw7eYNxNCga3PehDNC
	2dSAewE3c9IvG936Pf5YAIUrOfoVS/iJ/FGaLVOPmRZgmYdojOohKVPmnfmfMyaUUkJsJQ==
X-Received: by 2002:a17:90b:442c:b0:3b4:a90:7f30 with SMTP id 98e67ed59e1d1-3b41c9802e1mr2330494a91.55.1795169374795;
        Fri, 20 Nov 2026 02:09:34 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([203.208.167.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm3727321a91.17.2026.11.20.02.09.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 02:09:34 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: "Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Li Zhe <lizhe.67@bytedance.com>,
	Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 03/11] mm/mm_init: simplify zone device page initialization
Date: Fri, 20 Nov 2026 18:08:48 +0800
Message-ID: <20261120100856.16929-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261120100856.16929-1-songmuchun@bytedance.com>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
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

memmap_init_zone_device() currently seeds its reusable head and tail
templates by fully initializing the first real struct page and copying
it back into a stack object. This keeps the first page outside the
common loops and leaves __init_zone_device_page() only for template
construction.

Build both templates directly from the PFN-independent state. Add the
head-specific pgmap and refcount state to the head template and the
compound metadata to the tail template, then initialize every page
through zone_device_page_init_from_template().

This removes the special handling for the first head and tail pages
without changing their final state.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v3:
- Rebase on zone_device_page_init_from_template() after integrating the
  template helper series (suggested by Mike Rapoport)

v2:
- Rebase on memmap_init_page_from_template().
---
 mm/mm_init.c | 94 ++++++++--------------------------------------------
 1 file changed, 14 insertions(+), 80 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 08d6e47bde22..75d8d17601ed 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1036,48 +1036,6 @@ static void __init memmap_init(void)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
-					  unsigned long zone_idx, int nid,
-					  struct dev_pagemap *pgmap)
-{
-
-	__init_single_page(page, pfn, zone_idx, nid);
-
-	/*
-	 * Mark page reserved as it will need to wait for onlining
-	 * phase for it to be fully associated with a zone.
-	 *
-	 * We can use the non-atomic __set_bit operation for setting
-	 * the flag as we are still initializing the pages.
-	 */
-	__SetPageReserved(page);
-
-	/*
-	 * ZONE_DEVICE pages union ->lru with a ->pgmap back pointer
-	 * and zone_device_data.  It is a bug if a ZONE_DEVICE page is
-	 * ever freed or placed on a driver-private list.
-	 */
-	page_folio(page)->pgmap = pgmap;
-	page->zone_device_data = NULL;
-
-	/*
-	 * MEMORY_DEVICE_GENERIC pages regain a refcount of 1 in the free
-	 * path. The remaining ZONE_DEVICE types start from 0 here and raise
-	 * the count again when the allocator or driver hands the page out.
-	 */
-	switch (pgmap->type) {
-	case MEMORY_DEVICE_FS_DAX:
-	case MEMORY_DEVICE_PRIVATE:
-	case MEMORY_DEVICE_COHERENT:
-	case MEMORY_DEVICE_PCI_P2PDMA:
-		set_page_count(page, 0);
-		break;
-
-	case MEMORY_DEVICE_GENERIC:
-		break;
-	}
-}
-
 static void zone_device_page_init_from_template(struct page *page,
 		unsigned long pfn, struct page *template)
 {
@@ -1118,30 +1076,13 @@ static void __ref memmap_init_compound(struct page *head,
 	unsigned long pfn, end_pfn = head_pfn + nr_pages;
 	unsigned int order = pgmap->vmemmap_shift;
 	struct page template;
-	struct page *page;
 
-	/*
-	 * We have to initialize the pages, including setting up page links.
-	 * prep_compound_page() does not take care of that, so instead we
-	 * open-code prep_compound_page() so we can take care of initializing
-	 * the pages in the same go.
-	 */
-	__SetPageHead(head);
-
-	/*
-	 * All tails of the same compound page share the state established by
-	 * prep_compound_tail(). Reuse one tail template for the whole range and
-	 * refresh only the PFN-dependent fields in that template before each copy.
-	 */
-	pfn = head_pfn + 1;
-	page = pfn_to_page(pfn);
-	__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
-	prep_compound_tail(page, head, order);
-	set_page_count(page, 0);
-	memcpy(&template, page, sizeof(*page));
+	memmap_init_page(&template, zone_idx, nid);
+	prep_compound_tail(&template, head, order);
 
-	/* Initialize the remaining tail pages from template. */
-	for (pfn = head_pfn + 2; pfn < end_pfn; pfn++)
+	__SetPageHead(head);
+	/* Initialize the tail pages from template. */
+	for (pfn = head_pfn + 1; pfn < end_pfn; pfn++)
 		zone_device_page_init_from_template(pfn_to_page(pfn), pfn,
 						    &template);
 	prep_compound_head(head, order);
@@ -1175,27 +1116,20 @@ void __ref memmap_init_zone_device(struct zone *zone,
 		nr_pages = end_pfn - start_pfn;
 	}
 
-	if (!nr_pages)
-		return;
-
 	VM_WARN_ON(!IS_ALIGNED(start_pfn | nr_pages, pfns_per_compound));
 
+	memmap_init_page(&template, zone_idx, nid);
+	page_folio(&template)->pgmap = pgmap;
 	/*
-	 * Seed the reusable head-page template from the first real struct
-	 * page. The normal page-init and refcount helpers must operate on
-	 * a real memmap entry rather than a stack object.
+	 * MEMORY_DEVICE_GENERIC pages regain a refcount of one in the free
+	 * path. The remaining ZONE_DEVICE types start from zero here and raise
+	 * the count again when the allocator or driver hands the page out.
 	 */
-	pfn = start_pfn;
-	page = pfn_to_page(pfn);
-	__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
-	memcpy(&template, page, sizeof(*page));
-	if (pfns_per_compound != 1)
-		memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
-				     compound_nr_pages(pfn, pgmap));
-	pfn += pfns_per_compound;
+	if (pgmap->type == MEMORY_DEVICE_GENERIC)
+		atomic_set(&template._refcount, 1);
 
-	/* Initialize the remaining head pages from template. */
-	for (; pfn < end_pfn; pfn += pfns_per_compound) {
+	/* Initialize the head pages from template. */
+	for (pfn = start_pfn; pfn < end_pfn; pfn += pfns_per_compound) {
 		page = pfn_to_page(pfn);
 
 		zone_device_page_init_from_template(page, pfn, &template);
-- 
2.54.0

