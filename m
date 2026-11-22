Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373102;
	b=bonQNYJv8Xd2ECmGaAgG+F/t8x2vZMWl3nLN65wMcIZJNG7EIsnPnXN8+3+GTdz8b9ZQ
	 61hMVYMax/YgST4v8/0CbrBR/8aHgqQebc1Wxr8BGy0dg/CW9FEpPDnGY7M4ULM/Bxnfq
	 EVT85qI5CP23WoRRkq2HU+l6L1NL97QDlDjEZDS3B703xlb4OdAxZcIPoM/UCFsX2Q9Ju
	 +ZlV/VgeHKogizR11D4nforYwSKB0sXavWiQCzuFK93Q7zZR/rB5rKlS/rE3inzhyN/Ai
	 VWobwCprr45esj/TiS069/vW3vKjbonHMlKDsJgcCJnpUtO1BSTNGRs+zacrfZTtg/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=reL9mYJK/1m1y+g0uNeijZFVaLlYnX3xPlUy2DZTb6U=;
	b=1NHdu6EBrua41J8AfjgljPgqkvIQT2oCE7LwJOdgdR8tRyI2OOCifMMhv3Lr47v7E7vO
	 M5e3ERDk85AbSFYIlWebOCvgaIC/MeiC3Uuml3nu/QtLvJgDY4rHTTE15GkJmqhY5oIHX
	 1+E2bZHqHrD5q7B21E0LfBBnwP0FY7KwIGtS0b8mCV+GnL07Elz/M6o8h4ZXfPCT1h5gP
	 JK9/C1y7FRSKxmBPOMucPsp00S9OIVzlkM5M8rtkTByUz7haGdfSaDMnbPd4WY0Un3axO
	 eDc2dCcaDFQ5kFgO5AgJSR1Sj8Mt3He9ME/IoNgTlCctZ2LZ/RAY/nSRgCSE+msdRmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BcsMi7FS;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A876606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A876606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BcsMi7FS
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f040056fd0so14983825ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373102; x=1795977902; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=reL9mYJK/1m1y+g0uNeijZFVaLlYnX3xPlUy2DZTb6U=;
        b=BcsMi7FSQ7LRDxxM7x3FT5CwV4mI5T2h3X6bNoiZKQYsAUh5PbOPqEh0Z0L2vg+sxE
         JRnjVmiduyJZZHj5VFEhJBQe4FVtYMYP7aM+TlNI4VxXYJBDvGZ20KYXR8lc0Zaq9E/N
         i6r38K9mQ6xULDJzoh8ICC/daCeE0QnN61+ztj31Gn3uhQ0hGjW6U3teiBxT/ze9w2sn
         64g0GJXgEaDMdDvle0bsRpvaNpyICYUD+CoB8AJ1zN9ma7+aGj5uDeqLZWeO04mWmdEt
         hjAmGge/zdyg4F6sDZ1uL2OisCW+/LEwsxRr9EPYF7040U7M9REPDUCFi7ThWQrgSzeo
         P+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373102; x=1795977902;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reL9mYJK/1m1y+g0uNeijZFVaLlYnX3xPlUy2DZTb6U=;
        b=D6CbwFcEDnp5zIniW1CePO9aE5GaJinzAp7iQ+jCa2N9eww+fypGycUBydNJW5CfZQ
         B8rwnEzf6aGYb2iJZQVIZL+jf5N84bsQyicMa1WQ3IQwESJTPb/mSg0/qrk2nC9czi0t
         n156MtEHtQzFYt1Nfai7lswRPDo8NdwXMvg9aKxPfe9GkfSS17LNsxVu5j88/BS2TbiR
         w3JlXDr3oMeqA7DtAOUQDjjE9K12ckZT5cTX7tb0xP5PJgZQ1l8tZDe7i8Ujc8akCa4I
         ronX0k/unNzN8XvFj3WYUagMfjVvVYGBu/1LgIsEJuVdrVq5AfoX6Hm5uK6nmsvgUxqD
         8GLw==
X-Forwarded-Encrypted: i=1; AL+hErFDW8tEJVxp96cAhU2GryS0MKlz7GZcbJSVO4hCXs3U5z3BvqzCHUTYJJ8itNoWuf1ZpPe5ioRp2ejJc8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/RUH8xlPbLK47fk5F7dIkQjd1s5DaEY3DoJDgHY88IcR1H9wN
	pCNcwqiu2jfbxSoqmK12zcZI3akVVFAkgitabIXjC3gHoT+KbdUH/mgAdXUEEHAnD7roOYqid+q
	KEustPmuprORZQSFvm8wY8w==
X-Received: from pjbqa11.prod.google.com ([2002:a17:90b:4fcb:b0:3b3:d1d1:2aef])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4483:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3b41c7bc7ccmr5465023a91.2.1795373101199;
 Sun, 22 Nov 2026 10:45:01 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:37 +0000
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
Message-ID: <20261122184453.2668189-4-jthoughton@google.com>
Subject: [PATCH v3 03/19] hugetlb_vmemmap: Leave pages partially HVOed upon
 restore failure
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

Right now it is assumed that the restore routine in vmemmap_remap_free()
will not fail; that is, if we fail to fully optimize a folio, it is
assumed that restoring the folio to its pre-HVO state is guaranteed to
succeed.

Although vmemmap restoration may never fail in practice, properly handle
such failure cases now. This will leave folios in a partially HVOed
state. In a follow-up patch, failure certainly becomes possible.

In the event we end up with partially-HVOed folios, make sure to:
  1. Leave the HVO page flag in place.
  2. Free any unused vmemmap pages.

Always pass the vmemmap_tail page to the restore routine to avoid
leaking the non-optimized vmemmap pages for a partially HVOed page.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb_vmemmap.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 7be08c68c2f1..2e9cf8d39c89 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -274,12 +274,22 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 {
 	const struct page *page = (const struct page *)addr;
 	const struct folio *folio = page_folio(page);
-	struct page *src = pte_page(ptep_get(pte)), *dst;
+	struct page *src = pte_page(ptep_get(pte)), *dst, *tail;
 
 	if (unlikely(!vmemmap_optimizable_pfn(page_to_pfn(page), folio_order(folio))))
 		return 0;
 
-	VM_WARN_ON_ONCE(folio_vmemmap_shared_tail_page(folio) != src);
+	tail = folio_vmemmap_shared_tail_page(folio);
+	if (WARN_ON_ONCE(!tail))
+		return -EINVAL;
+
+	/*
+	 * The folio may be only partially optimized, so restore only PTEs
+	 * currently pointing at the shared tail page.
+	 */
+	if (src != tail)
+		return 0;
+
 	dst = vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
 	set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
 
@@ -325,6 +335,7 @@ static int vmemmap_pteify_folio(const struct folio *folio, unsigned long flags)
 	return vmemmap_remap_range(start, end, &walk);
 }
 
+#define VMEMMAP_REMAP_INCOMPLETE 1
 /**
  * vmemmap_optimize_folio - optimize the vmemmap backing of a folio
  * @folio:	folio whose vmemmap pages should be optimized.
@@ -340,7 +351,8 @@ static int vmemmap_pteify_folio(const struct folio *folio, unsigned long flags)
  * Note: The caller must hold vmemmap_remap_rwsem. If TLB flushing is deferred,
  * the lock must remain held until the final TLB flush.
  *
- * Return: %0 on success, negative error code otherwise.
+ * Return: %0 on success, VMEMMAP_REMAP_INCOMPLETE if the folio is incompletely
+ *         optimized, negative error code otherwise.
  */
 static int vmemmap_optimize_folio(const struct folio *folio,
 		struct list_head *vmemmap_pages, unsigned long flags)
@@ -372,7 +384,8 @@ static int vmemmap_optimize_folio(const struct folio *folio,
 		return ret;
 
 	end = start + walk.nr_walked * PAGE_SIZE;
-	vmemmap_restore_range(start, end, vmemmap_pages, 0);
+	if (vmemmap_restore_range(start, end, vmemmap_pages, 0))
+		return VMEMMAP_REMAP_INCOMPLETE;
 
 	return ret;
 }
@@ -402,7 +415,12 @@ static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
 		return ret;
 
 	guard(rwsem_read)(&vmemmap_remap_rwsem);
-	return vmemmap_restore_range(start, end, &vmemmap_pages, flags);
+	ret = vmemmap_restore_range(start, end, &vmemmap_pages, flags);
+
+	/* Not all pages may have been consumed */
+	free_vmemmap_page_list(&vmemmap_pages);
+
+	return ret;
 }
 
 static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
@@ -526,7 +544,11 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 */
 	folio_set_hugetlb_vmemmap_optimized(folio);
 	ret = vmemmap_optimize_folio(folio, vmemmap_pages, flags);
-	if (ret)
+	/*
+	 * If ret == VMEMMAP_REMAP_INCOMPLETE, the folio might be partially
+	 * HVOed. Leave the HVO page folio flag in place.
+	 */
+	if (ret < 0)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
 
 	return ret;
-- 
2.56.1.809.ga0b61035b5-goog

