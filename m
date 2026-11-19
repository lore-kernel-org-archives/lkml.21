Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089762;
	b=yPUXx1v6v9yDMYecOnXRc10f2oqzQqiNeCzavCRWwfKP6EY7+AYzw0C+xVtZ5W5/DTH8
	 Io9w57i0mN0V+xcliQWE3q2e7FuR2U+EjJc9nJ/yyc8wqnAWqOs009liNs/BT/RvX3k7I
	 hxKzk69AXIuxdXn7E9tAfBHFnri+QoRmGd0+rNKjuQjA/1Du6BUQphUwGTUP3j5C/6YL0
	 wYrUN7cNIa96f7FGfCDV1zlz3Sn9yaKToTTwkeAv945PLghPbyyxPZIGZe5SZCAJwNZH0
	 zhSrgkqA1z/fgNAfumrVnjliyrMfeP/mWRgptLpFrFwTgFwhVah1hMhq2/rmUosIVIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089762;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=AJpa1vQKPwsA3exeR0zFQL8OS++YNOFFgxas0w1fwx0=;
	b=rBK9bl2dHPWlfSGODCRHJ7N9pbxG0GAU/i9JnegYJvf8JH63EfHt11gLAHn0Ad5meZtx
	 tRhkF/FgMVan2M1gy0qVuZUo6o4WRLXzQi1TJoKWIfTp6974QksdmwHhCsWXJ7TI4wkec
	 DJlDZsXkTO2JJ/cYwczQmyoYXjXQ6Kd9m4xEQnCepy4LtmfYXZPYcpSX6N6HoqRIumxNC
	 ekvU1DvSfdgGyebhLgNYs8cYNTiRcBJhDP5q6rt1TvdCPYOId3ZMNzUfsDY0xXxACJIe+
	 eMccHxfDzHZgcBUqiBkhs6hyyEUj/kdolwacrRmXTjBrKpFMCucLfJL6uSoSsqeYmNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=by09xiPx;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dvlpHo8G;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863C4606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 863C4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=by09xiPx;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dvlpHo8G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795089760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJpa1vQKPwsA3exeR0zFQL8OS++YNOFFgxas0w1fwx0=;
	b=by09xiPx0rlQRszqpW2PoVyoeT5shdAZxUJ9FwTkO7sFUV5FiGs1z5Mej2a6RJYcbTpMcM
	Za79AhUHBjApAz9FbQU6Yqnw/dt5BK/4qhCl/ujyrtwLflW6FL9193KhMXPdk+hBhU1nUm
	oEfcq4Z20aIAJ8XJVxGTEt5ME4S6kdI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-Hd3_vROoOMKosuBPwL5uBQ-1; Thu, 19 Nov 2026 07:02:38 -0500
X-MC-Unique: Hd3_vROoOMKosuBPwL5uBQ-1
X-Mimecast-MFC-AGG-ID: Hd3_vROoOMKosuBPwL5uBQ_1795089758
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-49034831bb3so1459470f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795089757; x=1795694557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJpa1vQKPwsA3exeR0zFQL8OS++YNOFFgxas0w1fwx0=;
        b=dvlpHo8Gi3ligNXtGkye91mw22Lut4ZcjhhcfSUu87NxsHjauJgEINvOLkHRn2dt3G
         cgZbeyRUjEXrpLgFa1Hg6M2TaEH6jZdOIT9mYZ31+/Gc5AtgmMujvzR8IK29CcnqQanz
         y9H1YGfq80uftwxuDNf6qhQL2LokKWP0wDKbqqekAfn/63hOA/yFBp5jfe76Ixad5MfB
         AmXpjSigjkAQq9ogbTCO0OmQQ8rsGmn0Vu0L4NcyjSz2iYYs0VNkNWiiVPG+62Ds/rJ7
         wcea9iOovlYDfrCcJu2u5nf37WSE0S7iIg3rEU7m0knPOHbjw0gFZdHYL6yClXUq79D/
         WLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089757; x=1795694557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJpa1vQKPwsA3exeR0zFQL8OS++YNOFFgxas0w1fwx0=;
        b=gtb4b9vNkBFub59KSpHrXcvLcbXr3Le5Nmh3FeecxcEyY8hxhkbzA9Er32ZwB3C4bU
         RhuLltYhLXkzgUNm2XSnC6fuZSN3KSW55V/VMnUlOz0L5jXGZKpwh8DZdZunhRFCewxW
         igQH9wlQD++6GqkwGcuHiq0/muriw5QMSGcUejBLBG+0UZ6SuNvnWbqgAJifQC8XIhn5
         pjfV+znueIPmOXkxsVuZO2JOhqWfelmvSKvpnFZKfw+fYqduEPqDN52jo/RvB8ChLsfX
         i74sh466Z3iQHi1iWfCs+bgxRbeRLqgbkMt/8GJGpxYlAYc3JKs6IWIWW9wILQHOC5vM
         gSvw==
X-Gm-Message-State: APuU4Z+CG+iZnKTShoLuGuOABn3eiml8bUEkM8Mxx+S7FBUDwUBQqFbN
	N7FJYmMLCCXI/TQIFDfRhbwZxHafiDgV4/aloEhNbSadDtYlCnF8Td50Us1KVZ/feewi7QuINvJ
	/BGpPqaHIKVf2Q56w4eoinFksNtlR3XNIHwVvfUdhScXl1fib6otAWZrT9k68K9pYOAchOlZNd8
	3n/ds8/8y9uc/wPK+b9ToPnhf5hJz5/gnUb0UMVxn/u9U=
X-Gm-Gg: AZFdTZcSBxnTjYtrVB8NvtTOaaGNWNhNBpNFRWBomJWVIX4i65fImvkTt5jARiKmPJy
	1DEGJq4q1X9zSrHR6xZfAuqXFcLd2G0M+CT0KnyJ9jZoRC0EDMM1jtL5BnGI7zu0EK2vIPq+9bq
	HLlvsWyglUNzyB3zJLSSqdoC/cJtPdkzG4hRe9dx9krLVySF4/Xb2Js5Z1LSPXvXsaZNUZm8JCT
	1Ir3egm/NE4HDPbrm17VXqd3dgA9Afr9/up3K6fbYb6Z8ElYZoUE3WpCiBkkHJiMX316/I2feiy
	aseoXIXHcUCIvygV4Sa87Hgz4LiTnYdCkr0ZofG0NyhsIPMmc0QEtMuh3TYVLJnlTYQAHzEVRJV
	pfS9D+Nt4OSUyaQ6xdL8siPLCoty3XQ6yc98DCCs5eaI=
X-Received: by 2002:a05:6000:2602:b0:48d:f470:6b3e with SMTP id ffacd0b85a97d-4a63ae56784mr10952440f8f.13.1795089757064;
        Thu, 19 Nov 2026 04:02:37 -0800 (PST)
X-Received: by 2002:a05:6000:2602:b0:48d:f470:6b3e with SMTP id ffacd0b85a97d-4a63ae56784mr10952307f8f.13.1795089755989;
        Thu, 19 Nov 2026 04:02:35 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1520:4400:d78d:7b2d:2f5d:e08f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2f682sm9896560f8f.6.2026.11.19.04.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:02:35 -0800 (PST)
Date: Thu, 19 Nov 2026 07:02:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>, Dev Jain <dev.jain@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Gregory Price <gourry@gourry.net>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Lance Yang <lance.yang@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Miaohe Lin <linmiaohe@huawei.com>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org, virtualization@lists.linux.dev,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>
Subject: [PATCH v11 1/7] mm: add PG_zeroed page flag and buddy merge tracking
Message-ID: <a98c8a49744d30a5e603228d9cb17509261add90.1795089715.git.mst@redhat.com>
References: <cover.1795089715.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795089715.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

Add PG_zeroed (aliased to PG_private_2) to track pages whose contents
are known to be zero.  Propagate it through buddy merges and splits.
Upon folio allocation, PG_zeroed is cleared and its value is transferred
to BIT(2) in lru.next.

This bit, in turn, is tested by the new folio_init_user(). If clear, the
helper zero-initializes the folio. If set, it skips clearing the
contents.

Clear the aliased flag on free so filesystem state cannot be mistaken
for zeroed contents.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Assisted-by: LLM
---
 include/linux/highmem.h    | 21 +++++++++++++++++++++
 include/linux/mm.h         | 32 +++++++++++++++++++++++++++-----
 include/linux/page-flags.h | 15 ++++++++++++++-
 mm/page_alloc.c            | 38 ++++++++++++++++++++++++++++++++------
 4 files changed, 94 insertions(+), 12 deletions(-)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index d7aac9de1c8a4..70bbe93b8d669 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -303,6 +303,27 @@ static inline void clear_user_highpages(struct page *page, unsigned long vaddr,
 #endif
 }
 
+/**
+ * folio_init_user - Initialize a freshly allocated folio for userspace.
+ * @folio: The folio freshly allocated from the buddy allocator.
+ * @addr_hint: The address accessed by the user or the base address.
+ *
+ * The caller must not have written to the folio or repurposed folio->lru
+ * since allocation: the pre-zeroed marker is only valid until then.
+ * Preserve known-zero contents, but initialize KMSAN metadata that the
+ * allocator may have poisoned. Otherwise, clear the folio if required.
+ */
+static inline void folio_init_user(struct folio *folio, unsigned long addr_hint)
+{
+	if (folio_is_zeroed(folio)) {
+		kmsan_unpoison_memory(folio_address(folio), folio_size(folio));
+		return;
+	}
+
+	if (user_alloc_needs_zeroing())
+		folio_zero_user(folio, addr_hint);
+}
+
 #ifndef vma_alloc_zeroed_movable_folio
 /**
  * vma_alloc_zeroed_movable_folio - Allocate a zeroed page for a VMA.
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6af3b7008f1ad..7c9ada8273815 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3325,6 +3325,26 @@ static inline void clear_page_pfmemalloc(struct page *page)
 	page->lru.next = NULL;
 }
 
+static inline bool page_is_zeroed(const struct page *page)
+{
+	return (uintptr_t)page->lru.next & BIT(2);
+}
+
+static inline bool folio_is_zeroed(const struct folio *folio)
+{
+	return (uintptr_t)folio->lru.next & BIT(2);
+}
+
+static inline void set_page_zeroed(struct page *page)
+{
+	page->lru.next = (void *)((uintptr_t)page->lru.next | BIT(2));
+}
+
+static inline void clear_page_zeroed(struct page *page)
+{
+	page->lru.next = (void *)((uintptr_t)page->lru.next & ~BIT(2));
+}
+
 /*
  * Can be called by the pagefault handler when it gets a VM_FAULT_OOM.
  */
@@ -5544,8 +5564,9 @@ enum mf_action_page_type {
 	MF_MSG_UNKNOWN,
 };
 
-#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
 void folio_zero_user(struct folio *folio, unsigned long addr_hint);
+
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
 int copy_user_large_folio(struct folio *dst, struct folio *src,
 			  unsigned long addr_hint,
 			  struct vm_area_struct *vma);
@@ -5693,11 +5714,12 @@ int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
 
 /* Mask used for checking in page_pool_page_is_pp() below. page->pp_magic is
  * OR'ed with PP_SIGNATURE after the allocation in order to preserve bit 0 for
- * the head page of compound page and bit 1 for pfmemalloc page, as well as the
- * bits used for the DMA index. page_is_pfmemalloc() is checked in
- * __page_pool_put_page() to avoid recycling the pfmemalloc page.
+ * the head page of compound page, bit 1 for pfmemalloc page, and bit 2 for
+ * zeroed page, as well as the bits used for the DMA index.
+ * page_is_pfmemalloc() is checked in __page_pool_put_page() to avoid
+ * recycling the pfmemalloc page.
  */
-#define PP_MAGIC_MASK ~(PP_DMA_INDEX_MASK | 0x3UL)
+#define PP_MAGIC_MASK ~(PP_DMA_INDEX_MASK | 0x7UL)
 
 #ifdef CONFIG_PAGE_POOL
 static inline bool page_pool_page_is_pp(const struct page *page)
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index b0ddc652e76cc..39cd5911a2188 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -153,6 +153,9 @@ enum pageflags {
 	 */
 	PG_fscache = PG_private_2,	/* page backed by cache */
 
+	/* Page contents are known to be zero (host-zeroed or balloon) */
+	PG_zeroed = PG_private_2,
+
 	/* XEN */
 	/* Pinned in Xen as a read-only pagetable page. */
 	PG_pinned = PG_owner_priv_1,
@@ -686,6 +689,16 @@ FOLIO_FLAG_FALSE(idle)
  */
 __PAGEFLAG(Reported, reported, PF_NO_COMPOUND)
 
+/*
+ * PageZeroed() tracks pages whose contents are known to be zero.
+ * Set on free-list pages by the balloon driver or page reporting.
+ * The allocator uses this to skip redundant zeroing.
+ */
+__PAGEFLAG(Zeroed, zeroed, PF_HEAD)
+SETPAGEFLAG(Zeroed, zeroed, PF_NO_COMPOUND)
+CLEARPAGEFLAG(Zeroed, zeroed, PF_NO_COMPOUND)
+#define __PG_ZEROED (1UL << PG_zeroed)
+
 #ifdef CONFIG_MEMORY_HOTPLUG
 PAGEFLAG(VmemmapSelfHosted, vmemmap_self_hosted, PF_ANY)
 #else
@@ -1189,7 +1202,7 @@ static __always_inline void __ClearPageAnonExclusive(struct page *page)
  * alloc-free cycle to prevent from reusing the page.
  */
 #define PAGE_FLAGS_CHECK_AT_PREP	\
-	((PAGEFLAGS_MASK & ~__PG_HWPOISON) | LRU_GEN_MASK | LRU_REFS_MASK)
+	((PAGEFLAGS_MASK & ~(__PG_HWPOISON | __PG_ZEROED)) | LRU_GEN_MASK | LRU_REFS_MASK)
 
 /*
  * Flags stored in the second page of a compound page.  They may overlap
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 6624293e4d787..927a288eb419b 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -986,10 +986,21 @@ static inline void __free_one_page(struct page *page,
 			change_pageblock_range(buddy, order, migratetype);
 		}
 
-		combined_pfn = buddy_pfn & pfn;
-		page = page + (combined_pfn - pfn);
-		pfn = combined_pfn;
-		order++;
+		{
+			bool page_zeroed = PageZeroed(page);
+			bool buddy_zeroed = PageZeroed(buddy);
+
+			__ClearPageZeroed(page);
+			__ClearPageZeroed(buddy);
+
+			combined_pfn = buddy_pfn & pfn;
+			page = page + (combined_pfn - pfn);
+			pfn = combined_pfn;
+			order++;
+
+			if (page_zeroed && buddy_zeroed)
+				__SetPageZeroed(page);
+		}
 	}
 
 done_merging:
@@ -1378,7 +1389,7 @@ static __always_inline bool __free_pages_prepare(struct page *page,
 					continue;
 				}
 			}
-			tail_page->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
+			tail_page->flags.f &= ~(PAGE_FLAGS_CHECK_AT_PREP | __PG_ZEROED);
 		}
 	}
 	if (folio_test_anon(folio)) {
@@ -1397,7 +1408,8 @@ static __always_inline bool __free_pages_prepare(struct page *page,
 	}
 
 	page_cpupid_reset_last(page);
-	page->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
+	/* Clear the aliased PG_private_2 bit when freeing allocated pages. */
+	page->flags.f &= ~(PAGE_FLAGS_CHECK_AT_PREP | __PG_ZEROED);
 	page->private = 0;
 	reset_page_owner(page, order);
 	page_table_check_free(page, order);
@@ -1507,6 +1519,7 @@ static void split_large_buddy(struct zone *zone, struct page *page,
 			      unsigned long pfn, int order, fpi_t fpi)
 {
 	unsigned long end = pfn + (1 << order);
+	bool zeroed = PageZeroed(page);
 
 	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn, 1 << order));
 	/* Caller removed page from freelist, buddy info cleared! */
@@ -1518,6 +1531,8 @@ static void split_large_buddy(struct zone *zone, struct page *page,
 	do {
 		int mt = get_pfnblock_migratetype(page, pfn);
 
+		if (zeroed)
+			__SetPageZeroed(page);
 		__free_one_page(page, pfn, zone, order, mt, fpi);
 		pfn += 1 << order;
 		if (pfn == end)
@@ -1705,6 +1720,7 @@ static inline unsigned int expand(struct zone *zone, struct page *page, int low,
 {
 	unsigned int size = 1 << high;
 	unsigned int nr_added = 0;
+	bool zeroed = PageZeroed(page);
 
 	while (high > low) {
 		high--;
@@ -1722,6 +1738,8 @@ static inline unsigned int expand(struct zone *zone, struct page *page, int low,
 
 		__add_to_free_list(&page[size], zone, high, migratetype, false);
 		set_buddy_order(&page[size], high);
+		if (zeroed)
+			__SetPageZeroed(&page[size]);
 		nr_added += size;
 	}
 
@@ -1880,6 +1898,13 @@ static void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags
 		set_page_pfmemalloc(page);
 	else
 		clear_page_pfmemalloc(page);
+
+	if (PageZeroed(page)) {
+		__ClearPageZeroed(page);
+		set_page_zeroed(page);
+	} else {
+		clear_page_zeroed(page);
+	}
 }
 
 /*
@@ -3144,6 +3169,7 @@ int __isolate_free_page(struct page *page, unsigned int order)
 	}
 
 	del_page_from_free_list(page, zone, order, mt);
+	__ClearPageZeroed(page);
 
 	/*
 	 * Set the pageblock if the isolated page is at least half of a
-- 
MST

