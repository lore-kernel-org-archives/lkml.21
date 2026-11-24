Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.12.53.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526134;
	b=Aqde+2yHdC5m4PKnus7Wlyi4mkPHb7KHFDDjz3xNr4lHXg9Sko2YqeuhBjiQlzmYG/YO
	 Idsrtoq6nDP9+Nwl+4nZhXBrNMGdno7O5czxJTCqPq3jmvXqdubYrcz9FFeWvHDp/FCOd
	 iICkFbsqAuJ42YZ6X9ezGvGdxmxqfbK/n7BDSvTL+C7oEDKhgYKfKiUKL2fYWtZXkxaPZ
	 QVbDb80yq7C3+i3ud1AKz0qwYsGd6DrRY3aCt5Ym/5A1rkD0Q1QFB35NOY0jPq7ObtIUU
	 S8QcysEpnP/9E4IGZWrTKN6416Hadv196DVtcD3jiTDRecEEUH6/fNYakwrlmJ+RtTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526134;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=wXlgIqpcSYGINvhQ3k7390QHQGDaKd3fFZ6n6AkmfLA=;
	b=RrgJgoB40P2p/v0QDBHXb2BmNZhzFpZPFnQkPYN9GjskF4Vp3+LqdFzJDL3J7l6osLF9
	 6u+w9++xyde9nve295AGvAFWDlFezJ0xQcDvfOiSv15qDVB+nBO87jQ49aIrVTNU6L9yo
	 b+p4011bzEGxMmUh7DSNePE6srRWJkmk6wzEtJ3j+6jho0TwutyL8LITFgjzIaC99BczX
	 vngWMftN6jQQlfzjjNbfB2E517YgytxgCVcDf0WqgYDTi00N2E1rsacDdhs+OrDZND69Y
	 EdvMAAJ6i8en8RdbzdhcPvuZpSErk9avcrt7bZ7TB/E4PdXIXRGYiyZnVBp3M028J8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Er5yR4si;
	arc=none smtp.remote-ip=52.12.53.23
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4159A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4159A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Er5yR4si
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795526134; x=1827062134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wXlgIqpcSYGINvhQ3k7390QHQGDaKd3fFZ6n6AkmfLA=;
  b=Er5yR4si/oWnekSEYxNe3fcRaQouobXeXiQ1s1mBByciXFH3gyL/6qNw
   35n/TO2y2eRgMrEW65fPSScVSOPby0WEc3dNtcLFJs3ARUXC7zjXrf5gg
   jUEYYKYhEqh/AQld1R+bw8Gy7/wBe2UX7UBJta+vEC3XBTjOekOMgFnPJ
   Ap8GfRDJbPsUGv/pxALQhhqHFi1hOikIk7Ei/bplRLiUe9kEVWtmpA7zJ
   YAoWGMzMJ2l0Bpp1IkWS9IW3oqyJbUj6Z7T/s5xftDrus4v0fYIX2jelm
   6G110JGZKnSJbxEAFpp2NztvuAdhhMP5eSd7ZzS7p9KtgWULNxPCCJCNo
   Q==;
X-CSE-ConnectionGUID: rtEDJBx8ScKDsM4wFWboOQ==
X-CSE-MsgGUID: uxFdIkepTleQEfWqhopzzg==
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="34834369"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 13:15:31 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:5445]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.13.177:2525] with esmtp (Farcaster)
 id d553cf85-9979-4820-b45b-f44d2c8bdc90; Tue, 24 Nov 2026 13:15:31 +0000 (UTC)
X-Farcaster-Flow-ID: d553cf85-9979-4820-b45b-f44d2c8bdc90
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Tue, 24 Nov 2026 13:15:31 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57; Tue, 24 Nov 2026
 13:15:27 +0000
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
Subject: [PATCH v3 4/5] mm/char-mem: implement huge_fault support for /dev/mem
Date: Tue, 24 Nov 2026 13:15:09 +0000
Message-ID: <20261124131510.38745-5-farbere@amazon.com>
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

mmap_mem_prepare() maps /dev/mem at mmap() time with 4KiB PTEs, however
large and aligned the region is. Populate on fault instead, as vfio-pci
does since commit f9e54c3a2f5b ("vfio/pci: implement huge_fault
support"): request MMAP_TRACK_PFN rather than an eager remap, and add
->fault and ->huge_fault handlers using vmf_insert_pfn_order(). A large
enough aligned region is then mapped with PMD or PUD entries.

Two cases keep the eager remap: COW, which vmf_insert_pfn*() cannot
populate, and CONFIG_IO_STRICT_DEVMEM, where a fault can race
revoke_iomem() and leave a claimed range mapped.

ptrace and /proc/pid/mem keep working, because .access faults the page
in first. They now fail on a mapping with no VM_READ. The eager remap
used to leave a present pte for them to follow.

The order-0 insert refuses the zero pfn, which remap_pfn_range() mapped.
With CONFIG_STRICT_DEVMEM on, mmap() of that pfn fails with -EPERM.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---

Changes in v3:
- Keep the eager mapping when CONFIG_IO_STRICT_DEVMEM is set, instead of
  re-checking range_is_allowed() on every fault.
- Return fixup_user_fault()'s error from .access instead of ignoring it.

Changes in v2:
- Give COW mappings their own vm_operations_struct, rather than test for
  COW inside the fault handler.
- Corrected the L1TF claim in the commit message.

 mm/char-mem.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 77 insertions(+), 4 deletions(-)

diff --git a/mm/char-mem.c b/mm/char-mem.c
index c5761ddedbd7..283531645f18 100644
--- a/mm/char-mem.c
+++ b/mm/char-mem.c
@@ -318,9 +318,68 @@ static inline int private_mapping_ok(struct vm_area_desc *desc)
 }
 #endif
 
+#ifdef CONFIG_MMU
+/* Populate /dev/mem on fault, huge where the arch and alignment allow */
+static vm_fault_t mmap_mem_huge_fault(struct vm_fault *vmf, unsigned int order)
+{
+	unsigned long addr = vmf->address & ~((PAGE_SIZE << order) - 1);
+	struct vm_area_struct *vma = vmf->vma;
+	unsigned long pfn;
+
+	/* An order-aligned addr below the VMA would wrap the subtraction */
+	if (addr < vma->vm_start)
+		return VM_FAULT_FALLBACK;
+
+	pfn = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
+
+	return vmf_insert_pfn_order(vmf, pfn, order);
+}
+
+static vm_fault_t mmap_mem_fault(struct vm_fault *vmf)
+{
+	return mmap_mem_huge_fault(vmf, 0);
+}
+#endif /* CONFIG_MMU */
+
+#ifdef CONFIG_HAVE_IOREMAP_PROT
+/* generic_access_phys() needs a present PTE; a lazy mapping may have none */
+static int mmap_mem_access(struct vm_area_struct *vma, unsigned long addr,
+			   void *buf, int len, int write)
+{
+	unsigned int fault_flags = FAULT_FLAG_REMOTE;
+	int ret;
+
+	if (write)
+		fault_flags |= FAULT_FLAG_WRITE;
+
+	/* unlocked == NULL keeps the mmap lock held and the vma valid */
+	ret = fixup_user_fault(vma->vm_mm, addr, fault_flags, NULL);
+	if (ret)
+		return ret;
+
+	return generic_access_phys(vma, addr, buf, len, write);
+}
+#endif
+
+/*
+ * vm_ops for an eagerly populated mapping. Must exist even when empty: a NULL
+ * vm_ops would make the VMA anonymous.
+ */
+static const struct vm_operations_struct mmap_mem_eager_vm_ops = {
+#ifdef CONFIG_HAVE_IOREMAP_PROT
+	.access = generic_access_phys,
+#endif
+};
+
 static const struct vm_operations_struct mmap_mem_ops = {
+#ifdef CONFIG_MMU
+	.fault = mmap_mem_fault,
+#endif
+#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
+	.huge_fault = mmap_mem_huge_fault,
+#endif
 #ifdef CONFIG_HAVE_IOREMAP_PROT
-	.access = generic_access_phys
+	.access = mmap_mem_access,
 #endif
 };
 
@@ -355,11 +414,25 @@ static int mmap_mem_prepare(struct vm_area_desc *desc)
 					       size,
 					       desc->page_prot);
 
+	desc->action.error_override = -EAGAIN;
+
+	/*
+	 * COW can't be populated on fault: vmf_insert_pfn*() BUG_ON() it. And
+	 * with IO_STRICT_DEVMEM a fault can install an entry after
+	 * revoke_iomem() has zapped it, so keep the revoke final.
+	 */
+	if (IS_ENABLED(CONFIG_IO_STRICT_DEVMEM) ||
+	    vma_desc_is_cow_mapping(desc)) {
+		/* Remap-pfn-range will mark the range with the I/O flag. */
+		desc->vm_ops = &mmap_mem_eager_vm_ops;
+		mmap_action_remap_full(desc, desc->pgoff);
+		return 0;
+	}
+
 	desc->vm_ops = &mmap_mem_ops;
 
-	/* Remap-pfn-range will mark the range with the I/O flag. */
-	mmap_action_remap_full(desc, desc->pgoff);
-	desc->action.error_override = -EAGAIN;
+	/* Tracking reserves the memory type, for PAT conflict detection */
+	mmap_action_track_pfn(desc, desc->pgoff);
 
 	return 0;
 }
-- 
2.47.3

