Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169399;
	b=pyJYpD8BmgtBKx5TYwaSrh7W6cGz0N/zqW9sTYKGWidhKQ0hpjkD4i18xZ/beoC/9TiB
	 F7e6L3jqcU+XOLSDJVDwXtMlJUQ+fv2H6bc+dyUxWWiuinlzFLNgjg9E9srPUw/5kJbrQ
	 s2x5NQGfx8fBkHNJx61syzGAlr5t5tEOanME2GKv+pwenRkm3HB+CGScBdfH19dklZefy
	 r2AGI6vT6J0jPSgeB51O+Q9ZGPgIgIFCaME6+3f25L4qec08k7oyQ3EFeuYCGDj8NFsY8
	 5arX+p22HGyOk0kBd6U/fjvzCDtIMFHtrYhnKd01wX1n6Yko4lnxe9OfVpD6KBa2SdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4GPsM8bktQd8MlThnrS64jbcTKdAdxXsvnC3sXwF88w=;
	b=IXJNUU65OfW65L78jN3JJyaM4QHh6mQexPdV8uk87LqSSXMIXSJ38y2HqR0FTFS8KqV6
	 uDngqAjOuaAUnXYZLVFwl0Y6CKoJQ3HdOPyEuydUjizV6NMbE8+yOTvtBM3BeqM5Abeww
	 qPRrnbM0Mu1wSzJFXqbNZIUd2ssiyaIwhyk4v4Q7ZMsrntIU9v3scBMQlpHBUzNpb7/8g
	 w3ZsCNHgyaQqWOEwdyyn1VVIBAdqY/YrGyGGuU0LyK4nOOLTp5f14TXVHQWEOUEKTUuef
	 L+3A9i4Y5lUQrlzyZVRqiuyDFJTQXuBOKfyF+rGHFvdCUbjmHTkBRzRGXz4Z+HNLH0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KECDitdV;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424F9606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 424F9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KECDitdV
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so254305a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795169399; x=1795774199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4GPsM8bktQd8MlThnrS64jbcTKdAdxXsvnC3sXwF88w=;
        b=KECDitdVSS68URVoOd+NKp6XEU/+YhPKdXByyjuDhLl4Do74RP7/2XAfNsJ4vusPQ1
         bhFvD2DpNFO9M++yxkqyPAwBIybVEKiyI2C4ZWGrBcJiLE0yedHSuRPHRuAd0gq9yNyO
         vvso3Tuwqd4DsgOGFt8j32tfuJuSqYZPRnZDnsB/qhAdvCwsEhBFngGU0RgAHqSrQIyT
         kAlaHXQ32wFBV3Gbim1Iy5JdKto2NUpC93bk9r81DqVfa1OgeMEq7RrLm1b5GUJWZDo5
         oMzbQBuF43leUdkFoFON+AJohA6PwyN2HXxUw2NCY05QLMxj/xbuQZFE0TeQBYiYvSoT
         r+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169399; x=1795774199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4GPsM8bktQd8MlThnrS64jbcTKdAdxXsvnC3sXwF88w=;
        b=rZPJhGzcT0G7kgXBdypP8UkRDqaG3P7J0HDbV1DoujwPajEWYi/qF8HFJ6NCTmBp+y
         u1ZM4qMnBA44A86JfJd9CDZbwiU6oeoppCNXDWvmTm6cowyAzdXJizmmv5I9nu6TGaP/
         /z0qD3Km5bo9U4JcBq2+E/OsTmpRZLFWtPRfTnhiXB8Q5e+kOHPsTligz+Jc2SDTwHUa
         H9SoqJm0YvxucTkbY9cnCVvF2kMFjEVkG79z3vtF30v3y9PYRbamW99Hqu4Ao4Q1KlVy
         IWKvTz1Llxnk1j9bq7SUCqqAB1/c5zWVw0OW/yZdNRH3esX08Vl2zoIKjNTxpi8beP/y
         uh9g==
X-Forwarded-Encrypted: i=1; AL+hErEz6becLtZZ+AYIEeC1Jg1UCrYI3hg3xgULeliNvoal1HFrQczqYFGFv15jHW1YAhsGPaN+aLCS9oZRYHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OSVg8jPRZJvnO9pRDbb1ftyB9cTT56kMmJ0a9Mb9iK7ZwrwNv
	Lnw8rLcPPcjMWek2iSAaMEejuPAIJK8YpFP1FieEMLhdBUhwgLpWWxZwGtTTkXv/xDA=
X-Gm-Gg: AZFdTZf2nhz16gZnBlvkmUQBulI/6fgnatdh4FwkDw4ehiT9xBcL1vpKcvhDAIAl4kN
	teOoZxyhFDrOposxwvExEYnri9f0CgELuYJ17AyWd4y0vBppzzfiN9t4HuFOtIeUNLnoRWXav+m
	jBPRNQtm9wq0E+hMhdCyIWf8JewDms1s+Xsdd9AwZNN5qN24s0CS5MhN7eiWES5pd9xmFlKbDyu
	GA0b9YxQAtxLw3aPfTe+x2KdZ65Kzo5ZImrGkm/GRq5jbAjA80RINTHy7DUB4Czsd0hvsj2EHhB
	2Ei0oJgW+GV1K1nIJbknYd21NZWcIuS78b3jkXb4MI/HHGd73qk/HhOSL2Bt+jM3VbvFQxGWGBi
	OmJLE+Y5pxpqpKi3158iX02en3sx3tGOCH6e4ATJEjpn6y4JpmBaBxtQfCqG9BlBsOcq1nnxzOF
	SZ9b7dj3y+UE/q12OqGtc+JTJTOyc8EcEK5jJE9XuE4xCsd5Ah4TraEmW7NTjVvBdzoK1QXOW6X
	z4ZmJPlHlEmgiyr35CpVwxBMdDuMi/4vfWNameOIoHe0Hj5bGUcKsr8yIKtep4uDu3QyHgvV6Fe
	44FYZT5LKPcEUk1A8DtqVrSYyYuDeGZqsmWjAW3F6LT5nMfPihn2Yx/D2Mj9/+iGabW+3g==
X-Received: by 2002:a17:90a:c10e:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3b41c911c91mr2319623a91.22.1795169398552;
        Fri, 20 Nov 2026 02:09:58 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([203.208.167.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm3727321a91.17.2026.11.20.02.09.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 02:09:58 -0800 (PST)
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
Subject: [PATCH v3 06/11] mm/hugetlb: initialize all struct pages for bootmem hugepages
Date: Fri, 20 Nov 2026 18:08:51 +0800
Message-ID: <20261120100856.16929-7-songmuchun@bytedance.com>
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

Boot-time gigantic hugepages currently leave the head struct page to
the generic memmap initialization path while the HugeTLB code
initializes the remaining struct pages itself.

Mark the full hugepage noinit and initialize the head struct page in
hugetlb_folio_init_vmemmap() as well, so the whole compound-page setup
is handled in one place.

This can also reduce memblock metadata overhead when many boot-time
HugeTLB pages are reserved, because physically contiguous hugepages
can be covered by fewer noinit regions.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v3:
- Defer the HugeTLB template-copy optimization to the common helper
  switch after integrating the series (suggested by Mike Rapoport)
---
 mm/hugetlb.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 8b2bf571e781..2a94f8f60870 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3313,15 +3313,7 @@ static bool __init alloc_bootmem_huge_page(struct hstate *h, int nid)
 		list_add_tail(&m->list, &huge_boot_pages[nid]);
 		m->flags |= HUGE_BOOTMEM_ZONES_VALID;
 		hugetlb_vmemmap_optimize_bootmem_page(pfn, huge_page_order(h));
-		/*
-		 * Only initialize the head struct page in memmap_init_reserved_pages,
-		 * rest of the struct pages will be initialized by the HugeTLB
-		 * subsystem itself.
-		 * The head struct page is used to get folio information by the HugeTLB
-		 * subsystem like zone id and node id.
-		 */
-		memblock_reserved_mark_noinit(__pa((void *)m + PAGE_SIZE),
-				huge_page_size(h) - PAGE_SIZE);
+		memblock_reserved_mark_noinit(__pa(m), huge_page_size(h));
 	}
 
 	return true;
@@ -3352,22 +3344,23 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 }
 
 static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
+					      unsigned long pfn,
 					      struct hstate *h,
+					      enum zone_type zone, int nid,
 					      unsigned long nr_pages)
 {
-	int ret;
+	struct page *head = &folio->page;
 
 	/*
 	 * This is an open-coded prep_compound_page() whereby we avoid
 	 * walking pages twice by initializing/preparing+freezing them in the
 	 * same go.
 	 */
-	__folio_clear_reserved(folio);
+	__init_single_page(head, pfn, zone, nid);
 	__folio_set_head(folio);
-	ret = folio_ref_freeze(folio, 1);
-	VM_BUG_ON(!ret);
+	set_page_count(head, 0);
 	hugetlb_folio_init_tail_vmemmap(folio, h, 1, nr_pages);
-	prep_compound_head(&folio->page, huge_page_order(h));
+	prep_compound_head(head, huge_page_order(h));
 }
 
 /*
@@ -3425,8 +3418,9 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 	list_for_each_entry_safe(m, tm, &huge_boot_pages[nid], list) {
 		struct page *page = virt_to_page(m);
 		struct folio *folio = (void *)page;
-		const unsigned long pfn = folio_pfn(folio);
+		const unsigned long pfn = PHYS_PFN(__pa(m));
 		const unsigned long nr_pages = pages_per_huge_page(m->hstate);
+		const enum zone_type zone = zone_idx(pfn_to_zone(pfn, nid));
 		unsigned long nr_struct_pages = nr_pages;
 
 		h = m->hstate;
@@ -3439,11 +3433,10 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		prev_h = h;
 
 		VM_BUG_ON(!hstate_is_gigantic(h));
-		WARN_ON(folio_ref_count(folio) != 1);
 
 		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
 			nr_struct_pages = VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
-		hugetlb_folio_init_vmemmap(folio, h, nr_struct_pages);
+		hugetlb_folio_init_vmemmap(folio, pfn, h, zone, nid, nr_struct_pages);
 		init_new_hugetlb_folio(folio);
 
 		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-- 
2.54.0

