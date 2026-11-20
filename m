Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169391;
	b=qN8edh0QAYAELqQGq8b27k5ywhBIWSjvxPxyR78ZcFjquAr244FPcqFGM1Kg+jL2F6Sb
	 eBm2u4Y3EAFlwxMvqtNUTxwl59Ir+DuFPwFj72wr39VeVVoVTeWgnCPigXAOfL10VRyBt
	 EPMyDL9jgJO5o/zEMMvFuyQcUFlhNg4ZGF5RZZ3oI9wiFZUOgrJPOvengR7tWDJ73AmzK
	 5pfATesOJHx0tV/FGEdwh5REJZmyKxspEOU0oocyWgfv5+bHoKtbs6Ct+CE2JdHBJ/U5j
	 A/M+V44JvfSVb3Jpt5In3BCVdJThNz4vq8Lm/obPB+AHdSCTImBC8eWRguT7qCHfzgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bWd0+k3NeF/ERhQrwDikiXwm9apd9cQ0pzw+sZaX1u0=;
	b=KmMLE15RBMaRvtP0L6GGN9Q2rqCHDcnfw8Qd689XKWQx2RQfjqPdKefe2nhlYdYIG2Ae
	 xPod/uD0nQIEFRLoNiI4+5IVjWvgfLXMI9qW94bW3buWxGqFCA7ASb1ltYKLN0+jLbdzW
	 i9adHr8/ac4ABUdsqBtMG8r1x57rX8R2xcyWfGOONB+XIA3FTpknaX8MaJdiBERCM+pwd
	 zdD/Q6RepMwuQGhanC95qzV2CsxKaluzWSkTX+hPQholRC/42Ps7VLIessk4/SBBjvpbk
	 UKL5lcGfPFgHiZCfjGQ49fmtLKOFqynKjJHnMJSsAtIig7Ta/5QOXwOXU2mj60a4vEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gyVKIfX3;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2B1606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D2B1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gyVKIfX3
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f03f3631b2so3960785ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795169391; x=1795774191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bWd0+k3NeF/ERhQrwDikiXwm9apd9cQ0pzw+sZaX1u0=;
        b=gyVKIfX3380uPrjL9MY6LoSNCbDea5moUJu2UrViE1NeR8FK0sAryOEgCXTTZRKnhy
         shPYL/MAN13roz2bpmumPMw61j4Ddks8zHjdIFWh3dLYuMODXkB2Vfy+qvVqwo6gY7aa
         hXHNt314IHWXTWwlTO36bzbNsSjzfQ0/8SedlW5/ZoNVfPQxwDZeV5Fym7cxijZ8Mt0P
         GLI2IOZ8rg4Xq5m+JU7rFTp/lDVI7cO6wWGPLEhzYjuwjUEURyBUE0wljIW05V/uzy89
         zADJPtF+DUQS6+03IV5WqYGw/CbCXRK7I/G8D8lJaCHegUZPw92fX31HgJLuRFgra6Eb
         NzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169391; x=1795774191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bWd0+k3NeF/ERhQrwDikiXwm9apd9cQ0pzw+sZaX1u0=;
        b=Kuu+1Hn7qbz6Ak1JyDHOXjkV2ORXsGMN6f/zUuTXdzWQsC0mPZ0EXH1pULASN3GmP6
         bv2sfzUZGkMzhcD+SOsWhvEUNW8XP5DVe8RrOX2SZ2ZcaX6C44IE5t8mkykuGxfvzVDD
         MciexxWC9PWoTsFQB55vr/Z3RjMOM6PP9cBhcw1ynysfbqEt4RkdOHv9FIUaAcRxY5m8
         s1fgcSEYgOppRiFFX8/aO8P8pQK+tpx4gFW6i6NBVehvxW8h60dI28wMSFS/YSyZdvB5
         +ES3IC4RvGcroxLCVdNRJ2zIQy7j9NMQGdxuKNqz1HUsfzSI4Sfa4MNvIisQJ1mwAL2+
         U6Lw==
X-Forwarded-Encrypted: i=1; AL+hErHr3e8sZ3MDHU0TIVA+dy8R+QlkJp6ooLks2sxxpdRpPGM3Y/z1b+zQKj2rLVn10dgwt32MzZTFMENRjUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WcF0jv1e/hq5zlhoxVksgs0pxiWoBHZBIa4/KD96DMx1mzqc7
	hecGVMdQEy+oF4g29F2er/2+8zzRcaRNuLTZjMKw4Z6OtJ0rKfsFubSQ8Qn6dmGu+o0=
X-Gm-Gg: AZFdTZdFJC2RaJN+2dkdib3LOn7AHH5g8EGr8YlYM+wxdgdMVSIIJp5GImAOXMHgIT9
	VyYxXV45cnODfbejfpqLYiL4U+wUtF1i6hQrAnXhJncBp664qj99CYlkE+77wkS9PjdLZl1uTmt
	G23GDVxa5r+uxtl5g/Qj14mmt51s8/uF/CFGIs14qdxaWyimYvsTfK03cA0W4tUTErxvSVrZRgq
	h6co04lhryMFKky3fi3qW4XeMkSDwuucPq9+33lhFT/nyaflcsfl2jNviSTW88QwXrR2hcuDH1p
	T9bOf4AGWwnVu8lFGFsxB2pOyg5In44ozAyza498fgFIB74oeR8fdRsi6Ab2dk8x1xihFzYCIvo
	cp5nWu+WDQ4cSSiVNwBPd405nZ8ylJVUkn5dUvKvQs+MbPxNO1nqaJSt+uFlZsxU0N0HE/qBvDm
	KUjrTG2tqQviyFtWSaVJImb+Nrg3BLWA98FyRL8ewzVI/19AwZ2WmuKZNIVH3vZZ4Hmwj3Vu6YO
	4tkpeEtwluZu7pXsbU1Hpl66nppwQ+4O1Spvftqdp16HAsu8fgfgmiTy3xCQXvpk4vE8+AFNEUr
	MlsC7lQ4ODB2XN6gvm0EDwOUfrRxD8WU2rVGI/N4XyGKC/CPiBWX9l8n3ViKRg6eAzmkhg==
X-Received: by 2002:a17:90b:384d:b0:3b3:be94:8dce with SMTP id 98e67ed59e1d1-3b41c9d2026mr2111415a91.31.1795169390766;
        Fri, 20 Nov 2026 02:09:50 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([203.208.167.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm3727321a91.17.2026.11.20.02.09.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 02:09:50 -0800 (PST)
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
Subject: [PATCH v3 05/11] mm/hugetlb: drop boot-time HVO handling for gigantic folios
Date: Fri, 20 Nov 2026 18:08:50 +0800
Message-ID: <20261120100856.16929-6-songmuchun@bytedance.com>
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

HugeTLB HVO is currently supported on x86-64, riscv64, and LoongArch.
On x86-64 and riscv64, gigantic HugeTLB pages are larger than the
section size, so the existing section-based vmemmap optimization
infrastructure is already sufficient to cover the whole folio.  On
LoongArch, HugeTLB HVO is supported without gigantic HugeTLB pages.

Therefore, boot-time HugeTLB HVO folios can rely on the section-based
vmemmap optimization infrastructure directly, without the extra bulk
optimization and fallback handling.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c         | 25 +++++++------------------
 mm/hugetlb_vmemmap.c | 19 +------------------
 2 files changed, 8 insertions(+), 36 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index c01ae4067e64..8b2bf571e781 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3402,21 +3402,7 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	unsigned long flags;
 	struct folio *folio, *tmp_f;
 
-	/* Send list for bulk vmemmap optimization processing */
-	hugetlb_vmemmap_optimize_folios(h, folio_list);
-
 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
-		if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
-			/*
-			 * If HVO fails, initialize all tail struct pages
-			 * We do not worry about potential long lock hold
-			 * time as this is early in boot and there should
-			 * be no contention.
-			 */
-			hugetlb_folio_init_tail_vmemmap(folio, h,
-					VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES,
-					pages_per_huge_page(h));
-		}
 		hugetlb_bootmem_init_migratetype(folio, h);
 		/* Subdivide locks to achieve better parallel performance */
 		spin_lock_irqsave(&hugetlb_lock, flags);
@@ -3440,6 +3426,8 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		struct page *page = virt_to_page(m);
 		struct folio *folio = (void *)page;
 		const unsigned long pfn = folio_pfn(folio);
+		const unsigned long nr_pages = pages_per_huge_page(m->hstate);
+		unsigned long nr_struct_pages = nr_pages;
 
 		h = m->hstate;
 		/*
@@ -3453,13 +3441,14 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		VM_BUG_ON(!hstate_is_gigantic(h));
 		WARN_ON(folio_ref_count(folio) != 1);
 
-		hugetlb_folio_init_vmemmap(folio, h,
-					   VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES);
+		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
+			nr_struct_pages = VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
+		hugetlb_folio_init_vmemmap(folio, h, nr_struct_pages);
 		init_new_hugetlb_folio(folio);
 
 		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
 			folio_set_hugetlb_vmemmap_optimized(folio);
-		section_set_compound_order_range(pfn, folio_nr_pages(folio), 0);
+		section_set_compound_order_range(pfn, nr_pages, 0);
 
 		list_add(&folio->lru, &folio_list);
 
@@ -3474,7 +3463,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		if (hugetlb_early_cma(h))
 			folio_set_hugetlb_cma(folio);
 		else
-			adjust_managed_page_count(page, pages_per_huge_page(h));
+			adjust_managed_page_count(page, nr_pages);
 		cond_resched();
 	}
 
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 5852b0a1c479..09b9fd83c198 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -565,7 +565,6 @@ static int hugetlb_vmemmap_pteify_folio(const struct hstate *h, struct folio *fo
 void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list)
 {
 	struct folio *folio;
-	unsigned long nr_to_optimize = 0;
 	LIST_HEAD(vmemmap_pages);
 	unsigned long flags = VMEMMAP_DEFER_TLB_FLUSH;
 
@@ -574,18 +573,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 
 	down_write(&vmemmap_remap_rwsem);
 	list_for_each_entry(folio, folio_list, lru) {
-		int ret;
-
-		/*
-		 * Bootmem gigantic folios may already be marked optimized when
-		 * their vmemmap layout was prepared earlier, so skip them here.
-		 */
-		if (folio_test_hugetlb_vmemmap_optimized(folio))
-			continue;
-
-		nr_to_optimize++;
-
-		ret = hugetlb_vmemmap_pteify_folio(h, folio, flags);
+		int ret = hugetlb_vmemmap_pteify_folio(h, folio, flags);
 
 		/*
 		 * Splitting the PMD requires allocating a page, thus let's fail
@@ -597,11 +585,6 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 			break;
 	}
 
-	if (!nr_to_optimize) {
-		up_write(&vmemmap_remap_rwsem);
-		return;
-	}
-
 	flush_tlb_all();
 	downgrade_write(&vmemmap_remap_rwsem);
 
-- 
2.54.0

