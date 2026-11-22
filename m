Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373105;
	b=k2WvZcPKHVDJSPZsT/nEucyLXz3OwIEuI8UKo1wq6FSRMwz+6sguuqXctnDC0LIa5kBt
	 YbMISsgerVFjJYLQtE4VpEa/yKS5IyTb+0vL2VXCKwPPRB3izSd6TsjSemMbDraSOcyA6
	 CbAY/QwFC/bvN5SoUxgLXh9D/Qz3ptO1RRXsi3SvISt5grl4GR1bHxMUUZfzYIwR8xoov
	 s0T6LWjT0oi6gjor4xR53PDuF5pg86gQ3Jp0zI9khIGxrGU9XZPP91nzycv2o5bUGrpDn
	 YxIG/damT3wewRuM69qtb5k2nXeJQlCf+bhuvjd6VQvNMSLDYYTiZYdxlBUHqnONE9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1tWrOtic/buTkSk/2DlTQdnpgTD163OrV0WQJdUCLJE=;
	b=Ck5f3Ur5nqYCt+Odnv3MDdNm8lsee1nUc47yLLV5TnPNqzP9fpj8q52/ADsC4IFyHrwZ
	 0RayZqorJhLz3sJUtsxUHiK+t3bJM5MW7CTIxPIk2UROjk0YNjpaAzRBwyCDf76nT5UQ6
	 htiWjV2xkXzNHtDF1YsbzDLFCtE/ZnB797MMAdyr6rF8JPW1wGl8yIWGamOpULg0iExra
	 KF0D/p4i4lpKz00bg9dJZltiFNcP7yj69R80i/qLqlu6DDFyjicy4oBym9wSSMypGBkm5
	 NpL1ArQNXInToDnH3uX6Ic4JMaFphVAGNKXCf44TdBt3WVxEbXm/G9azzjeCz+zZLkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aHRxbV9r;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC01606A6AB
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC01606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aHRxbV9r
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f08196b148so5294035ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373104; x=1795977904; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1tWrOtic/buTkSk/2DlTQdnpgTD163OrV0WQJdUCLJE=;
        b=aHRxbV9r4BzYhkFbhHNpBKSqkrFnNo16qHWituW9R0wHt7vxmA3WfQbqsDRV2pJqG2
         xkzgyd5qHO8nBmEhlsx8V3VqV/KTXPmBNnwuYBMqJwZ61vHcPngkhOwU7NdwNt7HFLCC
         CWr8ivIbPH7aDhq8IkW1tVkwv4IhvgM8LS57fD3MQAQ0owhtrESH8vx/OMnUMrVaRu4y
         kiyfU+4+OVQkt8supKubi6Pzy3++cTq/nY9UqCp5HyttKEc3XzZPNBH0ajHRB2Ki8a7n
         xGzL4Rlml5Yb0iq1Kh4LeZ4klaGnuBNyE2WjKKGLZV3NxXwV4QJRucX+BNhQaKfzOsQG
         aHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373104; x=1795977904;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1tWrOtic/buTkSk/2DlTQdnpgTD163OrV0WQJdUCLJE=;
        b=Dz3StXc0XUTNEhCmpBhEpKdOBgHLADoPVM6Sq4utL1MQWltKFCJsLUH35rf+VeVjz0
         VwhO/3AV06zRfrk3FO1ffuzkX+ME4+sorAI3BUJFQStDFVCA3DiAibU3HDHxE618bGka
         gFOlzsbdNVTvNrCQqQJzXLGDnNW92HnRTfCKBKffpUYxBUsQCcz6OHdLrIXWqbH3LNFT
         2uZz2z19gyCAPxHgKd5DWfckU54hzrJv2+eGZUkXDP6PXSlYrM3m/hQAM49ByoqZZE+Q
         HRBah3iUU2VuN1pHtC6LShOwVirVjxOWQUnXYtTHGuAPtv0teaIZ8+ivgRBJga34cqSg
         vwCA==
X-Forwarded-Encrypted: i=1; AL+hErGMfecgOQz9HlDBZK1OQ13yFK6Qcsz/n8p6PkTZwsmLZo+I5ytHgV5L2a1hvgpAjwrgGbcKi6LczNfqcbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+ympn0jqCaD86rpFXXNC14aPkqsT5j9WVzpIabq+hOgTTQco5
	+SsGBfAz3tW6XxuovKqKXntqTUX+OF11t2GxmL2jUWt4fUlr2acGvqH4fU0TObXNZUppmMun3fr
	xvGLNJUzy920NTpWrQFB3ww==
X-Received: from plbmq8.prod.google.com ([2002:a17:902:fd48:b0:2f0:4f32:d57d])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ef45:b0:2ef:d7ed:80dc with SMTP id d9443c01a7336-2f03f1e0d55mr91461845ad.49.1795373103813;
 Sun, 22 Nov 2026 10:45:03 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:38 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-5-jthoughton@google.com>
Subject: [PATCH v3 04/19] hugetlb_vmemmap: Use try_update_vmemmap_pte to
 update in-use PTEs
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

set_pte_at() cannot be used to replace in-use vmemmap PTEs on arm64, so
replace it with a more specific routine, try_update_vmemmap_pte().

try_update_vmemmap_pte() is used for modifying page table entries such
that there is a guarantee that no fault will be taken.

For the generic implementation, please note one difference: set_pte()
does not invoke page_table_check_ptes_set(), but set_pte_at(), the call
we are about to replace, does. However, this is a functional no-op
because page_table_check_ptes_set() does nothing for init_mm PTEs, which
vmemmap PTEs are.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/loongarch/include/asm/pgtable.h |  2 ++
 arch/riscv/include/asm/pgtable.h     |  2 ++
 arch/x86/include/asm/pgtable.h       |  2 ++
 include/linux/pgtable.h              | 22 +++++++++++++++++++
 mm/hugetlb_vmemmap.c                 | 32 +++++++++++++++++++++++-----
 5 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index f87603135131..123eda3f6035 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -633,6 +633,8 @@ static inline long pmd_protnone(pmd_t pmd)
 #define pmd_leaf(pmd)		((pmd_val(pmd) & _PAGE_HUGE) != 0)
 #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+
 /*
  * We provide our own get_unmapped area to cope with the virtual aliasing
  * constraints placed on us by the cache architecture.
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2ebd5fa5adc5..c8d05bc12cc8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1172,6 +1172,8 @@ static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
 
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+
 /*
  * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
  * are !pte_none() && !pte_present().
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 000fc6c1ca37..271cdc61de3a 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1372,6 +1372,8 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 }
 #endif
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static inline pud_t pudp_establish(struct vm_area_struct *vma,
 		unsigned long address, pud_t *pudp, pud_t pud)
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index bc1353f03b08..ab33df268955 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -458,6 +458,28 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 #endif
 #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
 
+#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+/*
+ * try_update_vmemmap_pte - Remap PTEs used by the vmemmap.
+ * @addr: Base address of the remapped PTE.
+ * @ptep: Page table pointer to be overwritten.
+ * @pte: Page table entry to write.
+ *
+ * This function is only to be used to update PTEs that map the vmemmap. The
+ * only valid transitions supported by this function are: leaf-level
+ * (PAGE_SIZE), valid-to-valid. The pfn and prot bits may be changed.
+ *
+ * Implementations of this function must ensure that, while the update is taking
+ * place, CPUs will not fault on the remapped virtual address.
+ */
+static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
+					 pte_t pte)
+{
+	set_pte(ptep, pte);
+	return 0;
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 extern int ptep_set_access_flags(struct vm_area_struct *vma,
 				 unsigned long address, pte_t *ptep,
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 2e9cf8d39c89..b4d0311bcc4a 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -218,15 +218,19 @@ static int alloc_vmemmap_page_list(struct list_head *head,
 	return -ENOMEM;
 }
 
+/*
+ * Copy @src into the first page on @vmemmap_pages and return it. The page is
+ * left on the list; the caller must remove it only once it has successfully
+ * been installed in the vmemmap.
+ */
 static struct page *vmemmap_dup_page_from_list(const struct page *src,
 		struct list_head *vmemmap_pages)
 {
 	struct page *dst = list_first_entry(vmemmap_pages, struct page, lru);
 
-	list_del(&dst->lru);
 	copy_page(page_address(dst), page_address(src));
 
-	/* Ensure updates to @dst page are visible before set_pte_at(). */
+	/* Ensure updates to @dst page are visible before try_update_vmemmap_pte(). */
 	smp_wmb();
 
 	return dst;
@@ -248,6 +252,8 @@ static int vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
 	const struct page *page = (const struct page *)addr;
 	const struct folio *folio = page_folio(page);
 	struct page *src = pte_page(ptep_get(pte)), *dst;
+	bool dup = false;
+	int ret;
 
 	if (likely(vmemmap_optimizable_pfn(page_to_pfn(page), folio_order(folio)))) {
 		dst = folio_vmemmap_shared_tail_page(folio);
@@ -255,16 +261,27 @@ static int vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
 			return -ENOMEM;
 	} else {
 		dst = vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
+		dup = true;
 	}
 
-	list_add(&src->lru, walk->vmemmap_pages);
 	/*
 	 * Map the shared tail page writable intentionally. A lockless get that
 	 * read a non-zero refcount before the remap can still do its cmpxchg
 	 * after it. The refcount is zero, so the cmpxchg fails and leaves the
 	 * page unchanged.
 	 */
-	set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
+	ret = try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
+	if (ret)
+		return ret;
+
+	/*
+	 * We successfully overwrote the vmemmap PTE, so the page that was just
+	 * unmapped can be freed, and if we mapped a duplicated page, remove it
+	 * from the list so that it doesn't get freed later.
+	 */
+	if (dup)
+		list_del(&dst->lru);
+	list_add(&src->lru, walk->vmemmap_pages);
 
 	return 0;
 }
@@ -275,6 +292,7 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 	const struct page *page = (const struct page *)addr;
 	const struct folio *folio = page_folio(page);
 	struct page *src = pte_page(ptep_get(pte)), *dst, *tail;
+	int ret;
 
 	if (unlikely(!vmemmap_optimizable_pfn(page_to_pfn(page), folio_order(folio))))
 		return 0;
@@ -291,7 +309,11 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 		return 0;
 
 	dst = vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
-	set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
+	ret = try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
+	if (ret)
+		return ret;
+
+	list_del(&dst->lru);
 
 	return 0;
 }
-- 
2.56.1.809.ga0b61035b5-goog

