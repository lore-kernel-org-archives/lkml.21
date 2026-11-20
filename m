Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169368;
	b=RUHhtxg3AGZe/rPEnHGjFUJ2xNAqU3qoLZGbqCqV6gRcmsxgWy7QGXaclCKyveAnVZ2T
	 Lvo7fKfkuqoR0SYRAhO9XkHhQUh55204s7uWolAs8jIGf806uSm9Y0f1+gruLcRsEx5H2
	 qUqv1lq43KKsrMbZHIrcDVjrvk+sQOunzJnMoTaoPBEXlGpwdnPNYuRFcl0QBy/4jKx/4
	 U8m4EVDP1E3NVWao0fxIafO4N3+ou91kznDmwK9fNzaozVw4VMGWRMTWBiwG0jn+bVJCX
	 og36iAdWhvTtc2gEU/cbaMpe3tlGV8aorVuL6b6uXTh4Db/IaXeiix69ZqpUAd6Mmcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oLGKyu23Muo1nOyFWHF0XtwpUfanp0noPFTk0HaDvb0=;
	b=KxSO3OUKgQCbuYkMioFGDjnJd7fspd8SF35fT/QZ1yhg4Zqh487zqXQwe0BeU83BE/bO
	 wUIq6Rp5uND3fw06shkGPYS4lgndwwtbd70dSLTDAG781q5K1zzVwzGqSxLn238QSyqbP
	 RZTkjjj/FS+D27519U9bmgmh10NXCH6wOAUujGmFqDEScY3LNffnqbphPRzdm2CtvATDX
	 tJHtQJt/R/eStn9BpE2+TJMGVg3IG5V+LzMdV0NTStdeB9DivK2gU89Llbgh+fTHGgKfZ
	 XBgvqtqVLFJh/7ivqVErq6tknifGK4Bmhw0F/e2k0/6FIpCee6sqqNSWc63T7E5chIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=K0hYEMDz;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F17606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F17606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=K0hYEMDz
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so254147a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795169367; x=1795774167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLGKyu23Muo1nOyFWHF0XtwpUfanp0noPFTk0HaDvb0=;
        b=K0hYEMDz+uVpCAu1n6wlUODm5uVrujqgaqfrxxJG0HUlU9dyDSwN2HpM8x+R6chls0
         SWN3Z13eaQjCkHawIVt3bMTNIw1tz08L0MYT3WwQtHalcybKiseOz5CN+hg7C6/43RtE
         VTLB15gFiUbC5yDabt61gSEldBoWSJI+wirf3wlfjaQ6mjyNIJ/tJV+nvGa8hl7aTZQd
         7rxz3CLuBGaCjZ0I/BUuJwOaIPDciY6yqfdkZ3KC3fJsPxQGQJhAdcXa/1TipkA+UsBW
         UOICBCEuWHbPvkvHd4YA+39KVTAcpLl+B6K+hnaTDggAiYlsUeZC90INAMtBlCekNy+0
         wDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169367; x=1795774167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLGKyu23Muo1nOyFWHF0XtwpUfanp0noPFTk0HaDvb0=;
        b=AIAGzb+lKQBrfx/GqLRg3dxO1F0p4rppbXHvFoaHpc9UMTNuneK4a6b8QfWBQQM0Sb
         oe0aeGhoFg4KE/Hgoxea+9TLJyKDIJV8QOG7xEq/V04XPC3PEvFuzz2SGmAievgN6Tg2
         QGT8GQH4WYzNk3TqClDlgXN3jlkhePUatO2fHjloCPqCNV6FvxpY2C8kVeXVbvLiIPOB
         3kf52hBXjRVfajKB2YtyR74PA+vExhJFWexLtwPx8vRnMZxjSt/3fH7FFjYlv1DuwQcb
         KAty16Yhp8+sLyyAP2iT++mkBPOI+RufLm1WesFv4GtjGpVdJtVWXNgrhj6/5fAQnRLG
         rJRQ==
X-Forwarded-Encrypted: i=1; AL+hErHk4UkviJi8UEGuyQS3xKprbKd4w9lG4MX7DpICBBFZyPJRBmDwIZc7zNrC0tEeY76kRfpMWemd2LxaROw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PFObHm/NLR1ye5CLLHfr7sJPQtdZKxHy4Ql2t7QmXw8CplVAA
	aUC/i1Cn97Wip11Q5un80cS/1YBz7xPE48KCe0QqZ2CvEfg5fndSXsyGY22UOkX5JC0=
X-Gm-Gg: AZFdTZf2Mka42e36exGZM/BRH6D/eOcb1iS78U3EYQUkBl6W+DTSnfbWcDMRmcv4O6X
	nZhBSe0J0LGy4nGWNzMTsHoTBqgTRBMM2UBAMpbiamSOidXXa1YZCluygBAmm2eBGIBwOmaOZGa
	45eQuFnXgOSRvWr2+idD+fOT4msvgZDmndK3swjWpZZtQINbxgJq/eMjv0H50CZ8izx3VqKwWjX
	AOiBONc/L6TsUZZbIDKzCgm9uy5LBGX0ONM7vzDsGzGn5oFC8bQLVwNJ2HgSfXcXlM3+/NtP40E
	gECONQ9XSwM5HE55kZRU4V2lrzyQKJ1WYs6TjGxQmGPiR3B7BXyTlcKOaL+KMMRQxeQfTr+M2ke
	NXuvRcgQxEavkSjMn05b8Z1J8c3vGJUc804eoFkTOHd2HzmnNkiDCHxNryLXTZSfP+RrAci1Oyn
	LpP7yxW2CK7jO7BfVi+ANUIc/Ap+DxDeAWjVZ2qlApYvi5DbxiOW6KLc5z27UgrQqZBN+YIi/Gr
	CW0mQO1uLSOjGJWpvgN4JGuKJULi+C2X5rR/kIzBtSMuEISYNVK85B6q09p/O2x+467wY0dN8P+
	3XJlIGBxdqVHgjAdMohFaybZW/77mxkSsvUXXUGQSWvMk0ux+1JxZAzGoLa/8qh2JpMblvHPr4h
	s6esTh6jUhk1SO2Q=
X-Received: by 2002:a17:90b:2ecb:b0:3ac:8446:c1a5 with SMTP id 98e67ed59e1d1-3b41c988620mr2221952a91.48.1795169367038;
        Fri, 20 Nov 2026 02:09:27 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([203.208.167.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm3727321a91.17.2026.11.20.02.09.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 02:09:26 -0800 (PST)
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
Subject: [PATCH v3 02/11] mm/mm_init: factor out common struct page initialization
Date: Fri, 20 Nov 2026 18:08:47 +0800
Message-ID: <20261120100856.16929-3-songmuchun@bytedance.com>
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

Several struct page fields have the same initial values for every page in
a zone. __init_single_page() initializes this state as part of its
per-page setup, while the shared vmemmap tail path open-codes only a
subset.

Factor the PFN-independent state into memmap_init_page() and use it for
both regular and shared tail struct pages. Keep section-, PFN- and
instance-specific initialization in __init_single_page().

This also initializes the last cpupid and KASAN tag for shared tail
struct pages consistently with regular struct pages. Since
memmap_init_page() marks ZONE_DEVICE pages reserved, remove the redundant
update from the memory hotplug path.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v3:
- Rename memmap_init_page_common() to memmap_init_page() (suggested by
  Mike Rapoport)
- Remove redundant ZONE_DEVICE reserved-page initialization (suggested by
  Mike Rapoport)

v2:
- Remove __meminit from memmap_init_page_common() so HVO shared tail
  pages can call it after init text is freed (reported by Sashiko).
---
 include/linux/mm.h  |  8 --------
 mm/mm_init.c        | 37 +++++++++++++++++++++----------------
 mm/mm_init.h        |  1 +
 mm/sparse-vmemmap.c |  7 +------
 4 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8883b780b76d..d8bafcd92791 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3096,14 +3096,6 @@ static inline void set_page_node(struct page *page, unsigned long node)
 	page->flags.f |= (node & NODES_MASK) << NODES_PGSHIFT;
 }
 
-static inline void set_page_links(struct page *page, enum zone_type zone,
-	unsigned long node, unsigned long pfn)
-{
-	set_page_zone(page, zone);
-	set_page_node(page, node);
-	set_page_section_from_pfn(page, pfn);
-}
-
 /**
  * folio_nr_pages - The number of pages in the folio.
  * @folio: The folio.
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 0129152b74d8..08d6e47bde22 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -602,15 +602,27 @@ static inline void vmemmap_optimization_verify_zone(struct page *page)
 			page_zone_id(page));
 }
 
-void __meminit __init_single_page(struct page *page, unsigned long pfn,
-				unsigned long zone, int nid)
+/* Initialize PFN-independent fields common to pages in the same zone. */
+void memmap_init_page(struct page *page, enum zone_type zone, int nid)
 {
 	mm_zero_struct_page(page);
-	set_page_links(page, zone, nid, pfn);
-	init_page_count(page);
-	atomic_set(&page->_mapcount, -1);
+	set_page_zone(page, zone);
+	set_page_node(page, nid);
 	page_cpupid_reset_last(page);
 	page_kasan_tag_reset(page);
+	atomic_set(&page->_mapcount, -1);
+#ifdef CONFIG_ZONE_DEVICE
+	if (zone == ZONE_DEVICE)
+		__SetPageReserved(page);
+#endif
+}
+
+void __meminit __init_single_page(struct page *page, unsigned long pfn,
+		unsigned long zone, int nid)
+{
+	memmap_init_page(page, zone, nid);
+	set_page_section_from_pfn(page, pfn);
+	init_page_count(page);
 
 	INIT_LIST_HEAD(&page->lru);
 #ifdef WANT_PAGE_VIRTUAL
@@ -891,11 +903,11 @@ void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone
 {
 	unsigned long pfn, end_pfn = start_pfn + size;
 	struct page *page;
+	const struct zone *z = &NODE_DATA(nid)->node_zones[zone];
 
 	if (highest_memmap_pfn < end_pfn - 1)
 		highest_memmap_pfn = end_pfn - 1;
 
-#ifdef CONFIG_ZONE_DEVICE
 	/*
 	 * Honor reservation requested by the driver for this ZONE_DEVICE
 	 * memory. We limit the total number of pages to initialize to just
@@ -903,7 +915,7 @@ void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone
 	 * ZONE_DEVICE page initialization until after we have released
 	 * the hotplug lock.
 	 */
-	if (zone == ZONE_DEVICE) {
+	if (zone_is_zone_device(z)) {
 		if (!altmap)
 			return;
 
@@ -911,7 +923,6 @@ void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone
 			start_pfn += altmap->reserve;
 		end_pfn = altmap->base_pfn + vmem_altmap_offset(altmap);
 	}
-#endif
 
 	for (pfn = start_pfn; pfn < end_pfn; ) {
 		const unsigned int order = pfn_to_section_compound_order(pfn);
@@ -938,14 +949,8 @@ void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone
 
 		page = pfn_to_page(pfn);
 		__init_single_page(page, pfn, zone, nid);
-		if (context == MEMINIT_HOTPLUG) {
-#ifdef CONFIG_ZONE_DEVICE
-			if (zone == ZONE_DEVICE)
-				__SetPageReserved(page);
-			else
-#endif
-				__SetPageOffline(page);
-		}
+		if (context == MEMINIT_HOTPLUG && !zone_is_zone_device(z))
+			__SetPageOffline(page);
 
 		if (pageblock_aligned(pfn))
 			cond_resched();
diff --git a/mm/mm_init.h b/mm/mm_init.h
index 0034e37dbabd..dec22844f41e 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -109,6 +109,7 @@ extern bool mirrored_kernelcore;
 bool memblock_has_mirror(void);
 void memblock_free_all(void);
 
+void memmap_init_page(struct page *page, enum zone_type zone, int nid);
 void __meminit __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid);
 
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 9b80dd7326f7..51fa77982ca5 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -212,12 +212,7 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 
 	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++) {
 		page = (struct page *)addr + i;
-		mm_zero_struct_page(page);
-		atomic_set(&page->_mapcount, -1);
-		set_page_node(page, zone_to_nid(zone));
-		set_page_zone(page, zone_idx(zone));
-		if (zone_is_zone_device(zone))
-			__SetPageReserved(page);
+		memmap_init_page(page, zone_idx(zone), zone_to_nid(zone));
 		prep_compound_tail(page, NULL, order);
 	}
 
-- 
2.54.0

