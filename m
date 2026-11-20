Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169439;
	b=FH46qfBa0Acv+OBFGtxH+RxaSIKH44EGL3VliBlUTAyqby/QwonhR9YPexLC3hmD/uvU
	 tjvBCMoQr3ssZjkoBxNWeXo0EbZJ+ntpgfHuV9F8wkpEJfW4+Qv1TjU3PG5ghinhyYR2K
	 fYaGETX/5R2g21YPK7tVMmEqUTNorq5enShBTZfI3rCq3/oMRJ0PQZHtdydpOj4vrmCYy
	 cXIl7ud3fWPyjKKL1GR9NcJ/uvYzrx0W05T6+MKts+vC4B8Ase/zRp4VtO5GUTVr60hMq
	 QEGip513gNpqJvJw44cA47Lwq4km6TLAuk2R8Ecbdf02xw4YOau78WJe2wTD0B/qung==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WMd2ZKHygottbgUutQoHwDYpPTm4RywCiNppj+OXuXU=;
	b=SP/H9s0ubJU40OsEGYNB58HuLPDQgULrUJRAlKLxZJtFwMAwYgjm/x0XpQi+Zw+Rhw13
	 5DOFypVVkPcbqpqwJeJSuOlez6kxmGqcvFA0IxOCzyzWoDG0kaJVSntDxZpQsJ41g1w2e
	 KJtDd6PV7fDFEbhXJ2iMVzs91zcqp0pltlk/TEbU4rpHAd/yedUGWQXXmFUPtCRp9bDVK
	 dh3k7oAO76q/lKfHbJ/6ixvz2EWB9bg8QkExVjDdud8lqDxCe+ALQAqMf+kkGObCmayEG
	 HUd9nPUt0eClOnilM4HYPSL4bhKpt2uDLyI5/dDW/tg6zUA4g+kBkzD5djKPKdbeqOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cb4bZzSw;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C471606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C471606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cb4bZzSw
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc751eddf25so542387a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795169439; x=1795774239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WMd2ZKHygottbgUutQoHwDYpPTm4RywCiNppj+OXuXU=;
        b=cb4bZzSw/oXpCvBiZkYxI8aUfNPbXP83E0fT9SJOkEEOzQyciiRAxC2sQJI3fmTcRN
         F1zFwvvRQNS3Ym1Y4cZqtJvpZbNq97UIyzuW2AXPjDn16kJgoQigbY0/7tB+xogo6kph
         mOJhNfOh5CePmLZYX//PY+mpSrSi7hoYpCND601y/waWq74mK2GHV2zHkBa4NoCJgFA+
         YnNm9aIJOE30vFMgZ6k5BBuuy5R4FjbbRDYtdrdWHjG1xexWktdDILjNT7rfd7wI+QGZ
         BZzzbkcB41rTiTFUdSqpdxp6dngGeY7bGBNUvT3+kwSWJ9GHq2ycpxw7GRMu8sW/8Hdt
         hx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169439; x=1795774239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WMd2ZKHygottbgUutQoHwDYpPTm4RywCiNppj+OXuXU=;
        b=p88QdXve0XUYiJvBn+eWg/pE8a9c/J0ay+IOy5GFY64+7I2Jdz9delOkZ5gamzhqDT
         kEsb+Dz0iJru6Vtz9XpegOJmK1DkH8vfu2IXlM5ep1HsqV2TDckcfD3BSPPJnqz+fgMz
         yIkgIjkOvoTZ375tyO2CJ/xc4Wdp0TZO+u+j2RClvEEUJm3aA2foOHUwZU4lyBcuheko
         VIC5rWwrOssUv9CpUhvVM4m89K685uwheOf0deqF+c+D9oo0n4WR95VEZb5/aIga473w
         OccEUJXMj/QaOAJa75Vjwv9MNrVQ7ICo6DyvIqD7gj1Txk1eMjZ2KmpKoGN/zg8AZAb/
         Pqxg==
X-Forwarded-Encrypted: i=1; AL+hErGNVwajHuPJJHicaWqHIcppdWauUeetyahuEsGyjCilyixrlW5ORtYdNuCRHM1lnB5gJxvTnjnyCQWHBbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KV2mor6Dnn22RSOdqVMkpC3HOCDOxTX7BnhI+EfvkomoULJER
	fPHH5Ts+kjRv1OA+TmI363wElBhsARMFKV1yHzbhJi6um/kTOXVopsX4x4is7vbyPB8=
X-Gm-Gg: AZFdTZdPPKO+UC8zG+BeBpuoN6gmt6e1yx2xFdLNv8OmGDBdwyucMfgjr+8k0+fLXSU
	tb9gBkicHBTKBgCFDPjU5KeniqfDTZMGjYs/TiEYOIxtHCI+LQirH3d5OR+1nkeozIw/8cXDcER
	orrc5Pn5p+pcWVjm5rKHJYZ8jhywkKefxr+/4f5GBgq9ur640aFjlM2fkjEO932GtGj84l9U2eW
	p9UpgEt3wPh+/WPXLr6x2xNzW1ycQOutVvwseHcMWq19+gASIXEdWwnDrV17ubDcxwr+8rKV/OA
	HjCgloqvsTIx1PFgZs5ezZWc4D43H8neq4f2P+thPg+DDKhCWfzSnFIYbnJGTkQ5+qMWScwHFAG
	7QHg8lg2vEdvhvY0cWe+T78dV51/j4N1Be9KMlj5gDrdW3RFiSDHlh20OYlEaBqYCi5uFSwHbDO
	HRwofwr8zr9jCV6v6zjb/FWfJq1FEroud5yc0cKobaOcokghJQ4YvfrDjRVrEB2JZ3ChUk+PcU2
	0lCCVC6piYYjNDrTcRJ2eJ6eKitYZEp/WInVyKS+3+UzAXXxHyPR5GDV4EEM5wItQriHzHJ7oHl
	Y3zQ//O/11xHfgboKRTMilHOgA/JXR8l4FrZgbjExZ/xKUH00K48qcI6i2tsqvD0tcKEqWYpj3V
	1+T3PXbYN4KySAuI=
X-Received: by 2002:a17:90b:1dcd:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3b41c8d9bdfmr2328610a91.15.1795169438641;
        Fri, 20 Nov 2026 02:10:38 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([203.208.167.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm3727321a91.17.2026.11.20.02.10.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 02:10:38 -0800 (PST)
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
Subject: [PATCH v3 11/11] mm/mm_init: move pageblock migratetype init to memmap helpers
Date: Fri, 20 Nov 2026 18:08:56 +0800
Message-ID: <20261120100856.16929-12-songmuchun@bytedance.com>
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

ZONE_DEVICE memmap initialization already initializes pageblock
migratetype after all struct pages have been initialized, while hugetlb
bootmem folios have their own duplicate bootmem-specific initialization.

Move the MIGRATE_MOVABLE pageblock initialization into the frozen memmap
initialization helpers instead, so the ZONE_DEVICE and hugetlb bootmem
paths can share the same initialization.

The old hugetlb_bootmem_init_migratetype() skipped CMA folios via
folio_test_hugetlb_cma(), but the shared helper always initializes
pageblocks as MIGRATE_MOVABLE. This is safe because cma_activate_area()
later overrides the migratetype for CMA pageblocks.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Fix the helper name in the commit message (reported by Sashiko).
---
 mm/hugetlb.c | 25 -------------------------
 mm/mm_init.c | 11 ++++++-----
 2 files changed, 6 insertions(+), 30 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 7de65b540438..72839e98f998 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3319,30 +3319,6 @@ static bool __init alloc_bootmem_huge_page(struct hstate *h, int nid)
 	return true;
 }
 
-/*
- * memblock-allocated pageblocks might not have the migrate type set
- * if marked with the 'noinit' flag. Set it to the default (MIGRATE_MOVABLE)
- * here, or MIGRATE_CMA if this was a page allocated through an early CMA
- * reservation.
- *
- * In case of vmemmap optimized folios, the tail vmemmap pages are mapped
- * read-only, but that's ok - for sparse vmemmap this does not write to
- * the page structure.
- */
-static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
-							  struct hstate *h)
-{
-	unsigned long nr_pages = pages_per_huge_page(h), i;
-
-	WARN_ON_ONCE(!pageblock_aligned(folio_pfn(folio)));
-
-	for (i = 0; i < nr_pages; i += pageblock_nr_pages) {
-		if (!folio_test_hugetlb_cma(folio))
-			init_pageblock_migratetype(folio_page(folio, i),
-					  MIGRATE_MOVABLE, false);
-	}
-}
-
 static void __init prep_and_add_bootmem_folios(struct hstate *h,
 					struct list_head *folio_list)
 {
@@ -3350,7 +3326,6 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	struct folio *folio, *tmp_f;
 
 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
-		hugetlb_bootmem_init_migratetype(folio, h);
 		/* Subdivide locks to achieve better parallel performance */
 		spin_lock_irqsave(&hugetlb_lock, flags);
 		account_new_hugetlb_folio(h, folio);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index e0686b87fdb1..a340ba7f0a74 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -757,6 +757,9 @@ void __meminit memmap_init_compound_page(struct page *head, unsigned long pfn,
 	for (unsigned long i = 1; i < nr_pages; i++)
 		memmap_init_page_from_template(head + i, pfn + i, zone, &template);
 	prep_compound_head(head, order);
+
+	pageblock_migratetype_init_range(pfn, 1UL << order, MIGRATE_MOVABLE,
+					 /* isolate */ false, /* atomic */ false);
 }
 
 struct zone __meminit *pfn_to_zone(unsigned long pfn, int nid)
@@ -1110,6 +1113,9 @@ static void memmap_init_zone_device_pages(unsigned long start, unsigned long end
 		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
 			cond_resched();
 	}
+
+	pageblock_migratetype_init_range(start, end - start, MIGRATE_MOVABLE,
+					 /* isolate */ false, /* atomic */ false);
 }
 
 void __ref memmap_init_zone_device(struct zone *zone,
@@ -1147,13 +1153,8 @@ void __ref memmap_init_zone_device(struct zone *zone,
 
 		memmap_init_compound_page(head, pfn, zone, pgmap->vmemmap_shift);
 		memmap_init_zone_device_folio(page_folio(head), pgmap);
-		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
-			cond_resched();
 	}
 out:
-	pageblock_migratetype_init_range(start_pfn, nr_pages, MIGRATE_MOVABLE,
-					 /* isolate */ false, /* atomic */ false);
-
 	pr_debug("%s initialised %lu pages in %ums\n", __func__,
 		nr_pages, jiffies_to_msecs(jiffies - start));
 }
-- 
2.54.0

