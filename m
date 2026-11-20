Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169383;
	b=GPKBS9ZzEXOofmp4GjINWNN7A04wRdalwxyHiKo4EXnWujGKsxR0OL/08aN+y5faemkh
	 AkKeQ3CT7qmrlX5AVw6zze/VpGej6PW/mGRzOKtRxIzc40qCRthS2iu9jCJmnuj+uaPCh
	 RHNmQXmWe/f1pWys/EfjrWqXJ8btzDLtNVi45yA+RFZOLSBfvMH3wAS/DpxzfwwXtk2pH
	 MFS7culh1ReyyPvMX8f3ZdKe188OxfmIXBU5BAKGbTSspwMGkUuR9/JgIlCxnI3x1ccXl
	 aSOtfRGgjDUEMDFjieubhbUTc2MZN5brKM8mpbgQfz9vPZv7QD21ZC4UFxj/VSj0GVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l3g3NXCa5Yy8bnm/1QaNvVaog3uFqXSNcnEfqktH+0w=;
	b=nKnUgZXlJBY9qFfxcwLsjxtJXQQcCANxiSxTDhIcdP1kzNa3IDsjtfMHaaVlZwThnc2S
	 2C9wNeNIGtkaaeFafS74blQsw5xqhQqrKtdwVMvazravEmblxEHH/jLJ+AoOM6+djcD0j
	 qFm4AMroJirxnMVeEhqrc4szLdO0To2rphxJdbzWZMTMhYOANRzneJK6iI6SKaG6Vrhhm
	 6/8AZ5Z6uadKOD06giQTd7aAf62J1SWbo2qA73CnOPcBtju4lWEkPrKI6d5b3Nx7Qr9IU
	 UzdpZn8kUi9USnMvCSLsz813ByFv6aBpRdoWclVFYxwWAdTkkcUDEqqTYuZ9Mw8YgQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=FGIE+Y6s;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDAC606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDAC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=FGIE+Y6s
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso339081a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795169383; x=1795774183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3g3NXCa5Yy8bnm/1QaNvVaog3uFqXSNcnEfqktH+0w=;
        b=FGIE+Y6skwDcG93sN+TuFBXPeHdHmsZG7sbGy1tCR8lI7RBLGX0xnpq/esFhipDsIb
         9ALOh0gspVJiCi4aHKJeW7+oN0qBOB5iJKWEyjXCAGdRKJVbdGrToN3CZgSOMvoSm+uz
         PfCFCbKq02hZXZyqrAA2FznEil+Niop214VpJ44Zsz0/Dint7qlsu3g7brFHVQ2o0O3o
         lK6FCgfWPgLCykP7TMzHi9NjyG51m0mbdsStxAUmxr4FzWn2Te9G/zwI8L0Lx8m0v7xo
         /l942LrbFXzbY/VWob2Ojy1OJMSj4H5mYjjPtga9XQmLAvUhgYYv05OvDGtts74QSTOF
         Sihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169383; x=1795774183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l3g3NXCa5Yy8bnm/1QaNvVaog3uFqXSNcnEfqktH+0w=;
        b=mLEyG6HHkuiD4NTSIxEJphPuGJfsvyNmd/YXMWmB7kEHMLed+PFUFk/TtPBWxgfxcQ
         yrt2P0tWlmV+jcc7OeDevMeNsKbkOryn0jvjdqxTPfuwgcaaC1H/cLOKsNimkGa3rAK5
         S5AWpB05vuD6zz0erRpfjdADWKWwWaWG2K5113hWerI5ZuINfQ6pl+/LmMP3uqO53kfG
         6br+TNuoBcPBF3SG8r9YejsjuJ7L38SFa8wA0FycDiV0p4g+GD2T0UDuhgUiIm4JDusc
         DN9H5Gv9u1tGsiVLqATQoiyE2ysgr84MhBVH+fYYr/TUF/j2p0A/Q1hpkS2oQesLjopK
         m4fA==
X-Forwarded-Encrypted: i=1; AL+hErGD/TTo09zQvsTILrUNciHuugLkPtkMjk6Q/tZQpWElFcpqa1EizTIdDi97wnlt01E6HnKBzV1A0CEXegI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yumdsCwe/lw0Jc8VFYvKkeoLOLMrzLxKPe5Om5EtvvIdTuuOz
	KSY/jxTG1H5efG8ijPy1Vm/RQxktqzc3iGY7qMjbS0lSZY4UQzwwgUybfWuzufZO4CE=
X-Gm-Gg: AZFdTZe9NaxLiQN9ITgLcue0cB0AOllzdtJ55bMssWig3EzhGbygdCuSZ81QTGNkL+n
	ZuhVJeAEbfj5nci/f6mMQ5yR62IH5O+3us+RwpYjdNtsIRcZ/KIbqLYoW/ZJmfTzsjtoN/uvlMp
	slV3zTo3vlSKcNWOTFObYV9uBb/pY2mjcR9r/mLH2ZHkF6VpNt2WawmmjKRQ5MNg3pJ2z9Kwfmy
	pEdR4sb4tos7voZH5JJHTU+RLBZBMMbi8lgYTTkztttd2Tx/z2LAD/CaK3UFlGGmSEXXB7DTR7C
	JmXPclzGld5YzGstsGFdofeCl0HKWGhGw2rB52zK7Jo1Un35+Yzee4FHPNAQZ+LN+IIQgjHvEdj
	X/wLm1rk2mLAt/82BUttMjg/GXsX0z/L/aPuPpmNq6JWXj4rmSsO6zAgLN6Ry82rr4e3D+IPFXt
	pC5+F7ZRZM8DANWZwKH9shZwk35zjxkdSkZzCBu6zTkMmskSXw6Grk7zxIGdns51balFftN4+oZ
	S55vPiz3qBf3j8mgYT4sFZeUipnURTrtWxlsZ6UPw//VgFUQDlmv6F4hGhuQa/7LQptZCo0U0OU
	pjv01BqSqoK+VpfYhijW8P+U/r+ml396Fwr1rGs5PozUYft6X6Y3ZGMuPOi/te3sFkJ0uw==
X-Received: by 2002:a17:90b:39a7:b0:3b0:e388:d9c9 with SMTP id 98e67ed59e1d1-3b41c8e0cf0mr1533477a91.12.1795169382626;
        Fri, 20 Nov 2026 02:09:42 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([203.208.167.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm3727321a91.17.2026.11.20.02.09.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 02:09:42 -0800 (PST)
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
Subject: [PATCH v3 04/11] mm/mm_init: factor out compound page initialization
Date: Fri, 20 Nov 2026 18:08:49 +0800
Message-ID: <20261120100856.16929-5-songmuchun@bytedance.com>
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

ZONE_DEVICE initializes compound struct pages while their refcounts remain
frozen. The setup is open-coded in memmap_init_compound(), including the
per-page initialization and compound tail preparation.

Factor the common setup into memmap_init_compound_page(). Keep the pgmap
association and MEMORY_DEVICE_GENERIC refcount handling in the
ZONE_DEVICE-specific path.

This provides an MM-internal helper for other early memmap users to
share.

No functional change is intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v3:
- Fold memmap_init_page_from_template() into this patch and make it
  static (suggested by Mike Rapoport)
- Remove the _frozen suffix from memmap_init_compound_page() (suggested
  by Mike Rapoport)
- Rename the ZONE_DEVICE head helper to
  memmap_init_zone_device_folio() and pass a folio (suggested by Mike
  Rapoport)
- Rename memmap_init_zone_device_basepages() to
  memmap_init_zone_device_pages() (suggested by Mike Rapoport)

v2:
- Rebase on memmap_init_page_from_template().
- Rename memmap_init_zone_device_head_page to memmap_init_zone_device_head_fields.
---
 mm/mm_init.c | 143 ++++++++++++++++++++++++++-------------------------
 mm/mm_init.h |   2 +
 2 files changed, 76 insertions(+), 69 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 75d8d17601ed..3e645302377e 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -718,6 +718,45 @@ static __meminit void pageblock_migratetype_init_range(unsigned long pfn,
 	}
 }
 
+static void __meminit memmap_init_page_from_template(struct page *page,
+		unsigned long pfn, const struct zone *zone, struct page *template)
+{
+	/*
+	 * Refresh PFN-dependent fields in the template before the non-temporal
+	 * copy, so the destination page does not need cached stores after
+	 * memcpy_nontemporal().
+	 */
+	set_page_section_from_pfn(template, pfn);
+#ifdef WANT_PAGE_VIRTUAL
+	if (!is_highmem_idx(zone_idx(zone)))
+		set_page_address(template, __va(pfn << PAGE_SHIFT));
+#endif
+	memcpy_nontemporal(page, template, sizeof(*page));
+	vmemmap_optimization_verify_zone(page);
+}
+
+void __meminit memmap_init_compound_page(struct page *head, unsigned long pfn,
+		const struct zone *zone, unsigned int order)
+{
+	unsigned long nr_pages = 1UL << order;
+	struct page template;
+
+	memmap_init_page(&template, zone_idx(zone), zone_to_nid(zone));
+	prep_compound_tail(&template, head, order);
+
+	/* Initialize the head page. */
+	__init_single_page(head, pfn, zone_idx(zone), zone_to_nid(zone));
+	set_page_count(head, 0);
+	__SetPageHead(head);
+
+	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
+		nr_pages = VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
+	/* Initialize the tail pages from PFN-independent template page. */
+	for (unsigned long i = 1; i < nr_pages; i++)
+		memmap_init_page_from_template(head + i, pfn + i, zone, &template);
+	prep_compound_head(head, order);
+}
+
 struct zone __meminit *pfn_to_zone(unsigned long pfn, int nid)
 {
 	pg_data_t *pgdat = NODE_DATA(nid);
@@ -1036,56 +1075,39 @@ static void __init memmap_init(void)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-static void zone_device_page_init_from_template(struct page *page,
-		unsigned long pfn, struct page *template)
+static void memmap_init_zone_device_folio(struct folio *folio,
+		struct dev_pagemap *pgmap)
 {
-	set_page_section_from_pfn(template, pfn);
-#ifdef WANT_PAGE_VIRTUAL
-	if (!is_highmem_idx(ZONE_DEVICE))
-		set_page_address(template, __va(pfn << PAGE_SHIFT));
-#endif
-	memcpy_nontemporal(page, template, sizeof(*page));
-	vmemmap_optimization_verify_zone(page);
-}
-
-/*
- * With compound page geometry and when struct pages are stored in ram most
- * tail pages are reused. Consequently, the amount of unique struct pages to
- * initialize is a lot smaller that the total amount of struct pages being
- * mapped. This is a paired / mild layering violation with explicit knowledge
- * of how the sparse_vmemmap internals handle compound pages in the lack
- * of an altmap.
- */
-static inline unsigned long compound_nr_pages(unsigned long pfn,
-					      struct dev_pagemap *pgmap)
-{
-	const struct mem_section *ms = __pfn_to_section(pfn);
-
-	if (!section_vmemmap_optimizable(ms))
-		return pgmap_vmemmap_nr(pgmap);
-
-	return VMEMMAP_OPTIMIZATION_PAGES * (PAGE_SIZE / sizeof(struct page));
+	/*
+	 * MEMORY_DEVICE_GENERIC pages start with a refcount of one; other
+	 * ZONE_DEVICE pages raise it when handed out. Use atomic_set() because
+	 * @folio may be a stack template, while init_page_count() expects a
+	 * memmap-backed page.
+	 */
+	if (pgmap->type == MEMORY_DEVICE_GENERIC)
+		atomic_set(&folio->_refcount, 1);
+	/*
+	 * ZONE_DEVICE pages union ->lru with a ->pgmap back pointer and
+	 * zone_device_data. It is a bug if a ZONE_DEVICE page is ever freed
+	 * or placed on a driver-private list.
+	 */
+	folio->pgmap = pgmap;
+	folio->page.zone_device_data = NULL;
 }
 
-static void __ref memmap_init_compound(struct page *head,
-				       unsigned long head_pfn,
-				       unsigned long zone_idx, int nid,
-				       struct dev_pagemap *pgmap,
-				       unsigned long nr_pages)
+static void memmap_init_zone_device_pages(unsigned long start, unsigned long end,
+		const struct zone *zone, struct dev_pagemap *pgmap)
 {
-	unsigned long pfn, end_pfn = head_pfn + nr_pages;
-	unsigned int order = pgmap->vmemmap_shift;
 	struct page template;
 
-	memmap_init_page(&template, zone_idx, nid);
-	prep_compound_tail(&template, head, order);
+	memmap_init_page(&template, zone_idx(zone), zone_to_nid(zone));
+	memmap_init_zone_device_folio(page_folio(&template), pgmap);
 
-	__SetPageHead(head);
-	/* Initialize the tail pages from template. */
-	for (pfn = head_pfn + 1; pfn < end_pfn; pfn++)
-		zone_device_page_init_from_template(pfn_to_page(pfn), pfn,
-						    &template);
-	prep_compound_head(head, order);
+	for (unsigned long pfn = start; pfn < end; pfn++) {
+		memmap_init_page_from_template(pfn_to_page(pfn), pfn, zone, &template);
+		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
+			cond_resched();
+	}
 }
 
 void __ref memmap_init_zone_device(struct zone *zone,
@@ -1094,16 +1116,11 @@ void __ref memmap_init_zone_device(struct zone *zone,
 				   struct dev_pagemap *pgmap)
 {
 	unsigned long pfn, end_pfn = start_pfn + nr_pages;
-	struct pglist_data *pgdat = zone->zone_pgdat;
 	struct vmem_altmap *altmap = pgmap_altmap(pgmap);
 	unsigned int pfns_per_compound = pgmap_vmemmap_nr(pgmap);
-	unsigned long zone_idx = zone_idx(zone);
 	unsigned long start = jiffies;
-	int nid = pgdat->node_id;
-	struct page template;
-	struct page *page;
 
-	if (WARN_ON_ONCE(!pgmap || zone_idx != ZONE_DEVICE))
+	if (WARN_ON_ONCE(!pgmap || !zone_is_zone_device(zone)))
 		return;
 
 	/*
@@ -1118,32 +1135,20 @@ void __ref memmap_init_zone_device(struct zone *zone,
 
 	VM_WARN_ON(!IS_ALIGNED(start_pfn | nr_pages, pfns_per_compound));
 
-	memmap_init_page(&template, zone_idx, nid);
-	page_folio(&template)->pgmap = pgmap;
-	/*
-	 * MEMORY_DEVICE_GENERIC pages regain a refcount of one in the free
-	 * path. The remaining ZONE_DEVICE types start from zero here and raise
-	 * the count again when the allocator or driver hands the page out.
-	 */
-	if (pgmap->type == MEMORY_DEVICE_GENERIC)
-		atomic_set(&template._refcount, 1);
+	if (pfns_per_compound == 1) {
+		memmap_init_zone_device_pages(start_pfn, end_pfn, zone, pgmap);
+		goto out;
+	}
 
-	/* Initialize the head pages from template. */
 	for (pfn = start_pfn; pfn < end_pfn; pfn += pfns_per_compound) {
-		page = pfn_to_page(pfn);
-
-		zone_device_page_init_from_template(page, pfn, &template);
+		struct page *head = pfn_to_page(pfn);
 
+		memmap_init_compound_page(head, pfn, zone, pgmap->vmemmap_shift);
+		memmap_init_zone_device_folio(page_folio(head), pgmap);
 		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
 			cond_resched();
-
-		if (pfns_per_compound == 1)
-			continue;
-
-		memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
-				     compound_nr_pages(pfn, pgmap));
 	}
-
+out:
 	pageblock_migratetype_init_range(start_pfn, nr_pages, MIGRATE_MOVABLE,
 					 /* isolate */ false, /* atomic */ false);
 
diff --git a/mm/mm_init.h b/mm/mm_init.h
index dec22844f41e..1e6d2f78afdd 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -112,5 +112,7 @@ void memblock_free_all(void);
 void memmap_init_page(struct page *page, enum zone_type zone, int nid);
 void __meminit __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid);
+void __meminit memmap_init_compound_page(struct page *head, unsigned long pfn,
+		const struct zone *zone, unsigned int order);
 
 #endif /* __MM_MM_INIT_H */
-- 
2.54.0

