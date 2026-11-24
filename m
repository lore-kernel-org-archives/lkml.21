Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.77.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526138;
	b=am+fH75Esd9hwVFRa/uiLvsUMhHbTskhYAtJNfcsHfuGMeyg8pPacUJjkVzFGVMEVNjj
	 JnKarKHrXoa/UAqRdmI1dO/QGtrp5yZWxk4cJTuM1gmo4LTQVCRBW30dY/VLifor6UmCl
	 pwNF8lVWg99Y/GfPhITefy8yz1jzAEFn3puKerfnBsYXStT3yfQg8m50m/LJ9JwNpTJ3e
	 Zo6rWV8HMNmy1YpMnQDKXltyDGQsN6BHhhruG7VNzImVY06XZ9JWSCli6/+W43jcY9U6D
	 5nM19U3hQCv4zYU6uWbnCGe9GLkzuxmYjnjdhMbSnGFQ9UXZv4XggyKLAKz7eNTTFVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526138;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=VgurLvvvr384y9MTeNkWPXzxaojRL6Dxy37I+cewcWs=;
	b=PWRDijmV85xcExTc9rPKhs96QvsDv05v9j7qvu9EROFoUonuWrOXpviYXPpqW9VIDgUM
	 YQsSTheCGfbZpjXyFvBAdTpreKssBEUjppN/v596gyWeur6p/YNp1Cpa9ByjJpGs4FcDY
	 M+Ngf11kx+Kl5mL8vJEzn+iek5DY6K67ZxcKNhmPBsK8k49VhhPQGnbo+42jJs/gIVYt0
	 l3QFb7xNzUEJLslI808+NXB1PZOWfmJwd8WG8gpVTih68GWM95rVyBOFb+rh8Mru5M2BC
	 n/3aLFY2eRtLppSF08p0aumAGQnM/aWpVW5xqm//nSUty9jUkdlJ/LhKCa7PCpdVMgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=n7O8C2wN;
	arc=none smtp.remote-ip=44.246.77.92
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E696606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E696606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=n7O8C2wN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795526137; x=1827062137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VgurLvvvr384y9MTeNkWPXzxaojRL6Dxy37I+cewcWs=;
  b=n7O8C2wN1hP7Wl87h6X/k50ff0f9H6aWy7QhGa6KsfMYV4g63v4YPyET
   Hg/+kuOlG8eHBrkNcfyH1BzlLWIuo8aI9Ejd+0vzztNo1Uemzgi5GaW63
   jCe/lGbdlVpsEoi6agxF4hNSyZlU2k+ezU0ijrXwwpb6Nv/p0q6y4Lvus
   LP4P+JOaMomUSOuzgxzKhBACshYioKA8dDdb1PvLKms8WTYqNqwKXVxzG
   YbjlxrmW/PvpUjpbBcRfh8V97tqDghJSrg7BYqaejrfmbzZ0dqo3rlOIX
   PZyKG/zHbkorAjd0gTOwNkPzheO/CQmzfnudmqcekQToE7x91EUny5sv5
   A==;
X-CSE-ConnectionGUID: kRW0/GftRmmhwwxUhQIPtg==
X-CSE-MsgGUID: +akRYXerQSiy5hQixpRXGQ==
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="34958837"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 13:15:28 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:9651]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.27.99:2525] with esmtp (Farcaster)
 id e3a81d02-342e-46b8-bf3e-664c775bc11f; Tue, 24 Nov 2026 13:15:28 +0000 (UTC)
X-Farcaster-Flow-ID: e3a81d02-342e-46b8-bf3e-664c775bc11f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Tue, 24 Nov 2026 13:15:27 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57; Tue, 24 Nov 2026
 13:15:24 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zi Yan
	<ziy@nvidia.com>
CC: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn
	<jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, "Ryan
 Roberts" <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
	<baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
	<usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Eliav Farber
	<farbere@amazon.com>
Subject: [PATCH v3 3/5] mm: add vmf_insert_pfn_order()
Date: Tue, 24 Nov 2026 13:15:08 +0000
Message-ID: <20261124131510.38745-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124131510.38745-1-farbere@amazon.com>
References: <20261124131510.38745-1-farbere@amazon.com>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

mm offers a ->huge_fault handler a PUD first, then a PMD, then ->fault
for a PTE. A VM_PFNMAP handler wanting huge mappings therefore dispatches
on the order itself, guarding the huge two with
CONFIG_ARCH_SUPPORTS_{PMD,PUD}_PFNMAP. vfio-pci open-codes that dispatch.

Add vmf_insert_pfn_order() to do the dispatch instead.

It maps a write fault writable at every order, as the huge DAX and DRM
handlers do; vfio-pci passes false. No order-0 PFNMAP insert took a write
flag before. vmf_insert_pfn_prot() keeps its signature, with its body
moved to a static helper that takes the write flag.

/dev/mem and UIO, later in this series, are the first users.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---

Changes in v3:
- Dropped vmf_pfn_order_ok(). Patch 2 checks the window and the pfn now,
  so this helper only dispatches on the order.

Changes in v2:
- Pass the write flag at order 0 too. An ->access caller that does not
  retry the fault was left with a read-only pte.
- vmf_insert_pfn_prot() keeps its signature; its body moved to a static
  helper that takes the flag.
- Dropped the claim that uffd-wp can write-protect such a mapping.

 include/linux/mm.h |   2 +
 mm/memory.c        | 102 ++++++++++++++++++++++++++++++++++-----------
 2 files changed, 80 insertions(+), 24 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index cab58a403a3d..263689ded155 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5069,6 +5069,8 @@ vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
 			unsigned long pfn);
 vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
 		unsigned long addr, unsigned long pfn);
+vm_fault_t vmf_insert_pfn_order(struct vm_fault *vmf, unsigned long pfn,
+				unsigned int order);
 int vm_iomap_memory(struct vm_area_struct *vma, phys_addr_t start, unsigned long len);
 
 static inline vm_fault_t vmf_insert_page(struct vm_area_struct *vma,
diff --git a/mm/memory.c b/mm/memory.c
index 3d5706f8a7bf..7deff9c18acb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2931,6 +2931,36 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 	return VM_FAULT_NOPAGE;
 }
 
+static vm_fault_t __vmf_insert_pfn_prot(struct vm_area_struct *vma,
+					unsigned long addr, unsigned long pfn,
+					pgprot_t pgprot, bool mkwrite)
+{
+	/*
+	 * Technically, architectures with pte_special can avoid all these
+	 * restrictions (same for remap_pfn_range).  However we would like
+	 * consistency in testing and feature parity among all, so we should
+	 * try to keep these invariants in place for everybody.
+	 */
+	BUG_ON(!(vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP)));
+	BUG_ON((vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP)) ==
+						(VM_PFNMAP|VM_MIXEDMAP));
+	BUG_ON((vma->vm_flags & VM_PFNMAP) && vma_is_cow_mapping(vma));
+	BUG_ON((vma->vm_flags & VM_MIXEDMAP) && pfn_valid(pfn));
+
+	if (unlikely(is_zero_pfn(pfn)))
+		return VM_FAULT_SIGBUS;
+
+	if (addr < vma->vm_start || addr >= vma->vm_end)
+		return VM_FAULT_SIGBUS;
+
+	if (!pfn_modify_allowed(pfn, pgprot))
+		return VM_FAULT_SIGBUS;
+
+	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
+
+	return insert_pfn(vma, addr, pfn, pgprot, mkwrite);
+}
+
 /**
  * vmf_insert_pfn_prot - insert single pfn into user vma with specified pgprot
  * @vma: user vma to map to
@@ -2967,30 +2997,7 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
 			unsigned long pfn, pgprot_t pgprot)
 {
-	/*
-	 * Technically, architectures with pte_special can avoid all these
-	 * restrictions (same for remap_pfn_range).  However we would like
-	 * consistency in testing and feature parity among all, so we should
-	 * try to keep these invariants in place for everybody.
-	 */
-	BUG_ON(!(vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP)));
-	BUG_ON((vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP)) ==
-						(VM_PFNMAP|VM_MIXEDMAP));
-	BUG_ON((vma->vm_flags & VM_PFNMAP) && vma_is_cow_mapping(vma));
-	BUG_ON((vma->vm_flags & VM_MIXEDMAP) && pfn_valid(pfn));
-
-	if (unlikely(is_zero_pfn(pfn)))
-		return VM_FAULT_SIGBUS;
-
-	if (addr < vma->vm_start || addr >= vma->vm_end)
-		return VM_FAULT_SIGBUS;
-
-	if (!pfn_modify_allowed(pfn, pgprot))
-		return VM_FAULT_SIGBUS;
-
-	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
-
-	return insert_pfn(vma, addr, pfn, pgprot, false);
+	return __vmf_insert_pfn_prot(vma, addr, pfn, pgprot, false);
 }
 EXPORT_SYMBOL(vmf_insert_pfn_prot);
 
@@ -3021,6 +3028,53 @@ vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 }
 EXPORT_SYMBOL(vmf_insert_pfn);
 
+/**
+ * vmf_insert_pfn_order - insert a pfn mapping at a given fault order
+ * @vmf: The fault being handled.
+ * @pfn: The pfn to map at the start of the order-aligned fault window.
+ * @order: The fault order, as passed to ->huge_fault (0 for ->fault).
+ *
+ * For ->fault and ->huge_fault handlers of VM_PFNMAP mappings, which must not
+ * be COW. Maps @pfn with a PTE, PMD or PUD as @order and the architecture
+ * allow. A write fault is mapped writable, so the first write does not call
+ * ->pfn_mkwrite.
+ *
+ * Return: vm_fault_t value; %VM_FAULT_FALLBACK if the fault cannot be mapped
+ * at @order, so that it is retried at a smaller order. @order 0 never returns
+ * %VM_FAULT_FALLBACK.
+ */
+vm_fault_t vmf_insert_pfn_order(struct vm_fault *vmf, unsigned long pfn,
+				unsigned int order)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	bool write = vmf->flags & FAULT_FLAG_WRITE;
+
+	/*
+	 * Pass write at order 0 too: vm_page_prot is read-only while soft-dirty
+	 * is armed, and .access has no second fault to upgrade the pte.
+	 */
+	if (!order)
+		return __vmf_insert_pfn_prot(vma, vmf->address, pfn,
+					     vma->vm_page_prot, write);
+
+	/* vmf_insert_pfn_pmd() rejects the huge zero pfn; order 0 does not */
+	if (is_huge_zero_pfn(pfn))
+		return VM_FAULT_FALLBACK;
+
+	/* vmf_insert_pfn_pmd() and vmf_insert_pfn_pud() do not check L1TF */
+	if (!pfn_modify_allowed(pfn, vma->vm_page_prot))
+		return VM_FAULT_FALLBACK;
+
+	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) && order == PMD_ORDER)
+		return vmf_insert_pfn_pmd(vmf, pfn, write);
+
+	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PUD_PFNMAP) && order == PUD_ORDER)
+		return vmf_insert_pfn_pud(vmf, pfn, write);
+
+	return VM_FAULT_FALLBACK;
+}
+EXPORT_SYMBOL_GPL(vmf_insert_pfn_order);
+
 static bool vm_mixed_ok(struct vm_area_struct *vma, unsigned long pfn,
 			bool mkwrite)
 {
-- 
2.47.3

