Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.218.115.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526124;
	b=mWDLs/yjo4no1wlIOfqy9zF+UB8Ko4Wh3GkbKRoA0f3ibNca/V67N/1pycKEgd8x56La
	 xnXXhiqfnYl8sCiRBGqIyPu4aO0wIFuuzCPrCQnOJ/jpNC4uC7NWGoyrzLLUO8hpYOW0E
	 HnLNhVDtbC6yg5TEqX8EWi+gS+jzIeOBHPrjM4czYwSdG0qiYxHpadOMgRehQUWtOEMEG
	 EUdZ9FEQw71ui6S7BJ9JOd8ralxrzSMz+64+Me9fKalT3gnX06NCG/noFu+L5kL6nFmza
	 GecGFp7rvISRXoAhlPvoxz3Y+gEcj7ukK0G5oEuVtFGZoyLlM2kuGrXnu8FH+eJIslQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526124;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=LgREQ6GozZUiaFaBbn49VJmR+sfNNw4LA+XKY2boE5g=;
	b=kpf8fObl4RRVwOxrLiQ6LZ74n2eDFsSwKgIO3LqMwssIMNwxqhNJsr9+ihggvt1yZcD/
	 AmsPxEehpw1Cog6TjvPknmPjXMM/cmOtCn3N6F6koO7eOVcjGTlAW4bUhSGUt0LQK0sZI
	 voaxh+ETCiugBDgJNenD0q/TvvXGGv7+ZCm+tIOlziCW3MiQfCBs+uwK6TJn4x27EsreF
	 BRTY+ANgNPkqaykEEoTI/TtkVH7XKiG4SCFT/o8KJmKkIBBUofqgmpVE90BIXo1tZIZ75
	 cOGQZDfV2RSwCnqGV/Kvi6S8hMnkDW0vZstWIv7iY4CNsso75NgPhYa2l0O6LevwqsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=dNr6eeOu;
	arc=none smtp.remote-ip=34.218.115.239
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C2C606A333
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C2C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=dNr6eeOu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795526124; x=1827062124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LgREQ6GozZUiaFaBbn49VJmR+sfNNw4LA+XKY2boE5g=;
  b=dNr6eeOuYtIv87gBtznTAjjdHt2a7QAEZoH7rDoz/4BSpFvGmD0wAk9d
   kaQ+F2ZDEHPCrfk9+ygvA2l/xPBhVnVvy4XD9ANkNxF4Ckc6ZTRcS9z64
   WRNPc6c8GB0LDlNjCstDrWBkaxjc1stgYjKHH1i9lwBhvsuAgBee7FOGz
   3NO6vZDjw9L58AKrQgm6LqsfteVubxq5Ydt/GHlrASl7J+P7BDvV4Kl3a
   t7FffQeC1i5sT2hMt2NICnul+AZDT8uTK8+dx2Un6aHsfVqMaR8Z8zvNX
   PBW9I55idclF4GL0WN7f25KgLd2Z4cebMxTPU5lp5bztUJZ5R40yaBGkd
   g==;
X-CSE-ConnectionGUID: fAp7Ec0TRdaEPqhRmadFUw==
X-CSE-MsgGUID: oMowRQjST8uNiXdvgKQFIA==
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="34810235"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 13:15:21 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:16676]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.13.177:2525] with esmtp (Farcaster)
 id f0e75d5b-9b2e-4e73-b2ab-d80ec00b33f2; Tue, 24 Nov 2026 13:15:21 +0000 (UTC)
X-Farcaster-Flow-ID: f0e75d5b-9b2e-4e73-b2ab-d80ec00b33f2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Tue, 24 Nov 2026 13:15:21 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57; Tue, 24 Nov 2026
 13:15:17 +0000
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
Subject: [PATCH v3 1/5] mm: add MMAP_TRACK_PFN action and track_pfn_range() for lazy PFN maps
Date: Tue, 24 Nov 2026 13:15:06 +0000
Message-ID: <20261124131510.38745-2-farbere@amazon.com>
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

remap_pfn_range() populates a PFN mapping and, on x86, reserves the
range's memory type, so a later conflicting mapping of the same range is
rejected or coerced. A driver that populates from a fault handler gets no
such reservation: vmf_insert_pfn() and friends only look the memory type
up, so a conflict goes undetected.

Add track_pfn_range(). It sets the VMA flags remap_pfn_range() would set
and reserves the whole VMA's PFN range for its lifetime, but populates
nothing: that is left to the caller's fault handler. COW mappings are
rejected, as vmf_insert_pfn*() cannot populate them.

For drivers that use ->mmap_prepare, where no VMA exists yet, add an
MMAP_TRACK_PFN action that describes the range as MMAP_REMAP_PFN does and
tracks it on completion. It must cover the whole VMA, as that is what
gets reserved.

The /dev/mem and UIO handlers later in this series are the first users.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---

Changes in v3:
- Renamed pfn_range_track() to track_pfn_range(), and MMAP_PFN_TRACK to
  MMAP_TRACK_PFN, to read like remap_pfn_range() and MMAP_REMAP_PFN.
- Dropped the addr and size arguments. The range is always the whole VMA.

 include/linux/mm.h              | 16 +++++++
 include/linux/mm_types.h        |  1 +
 mm/internal.h                   |  3 ++
 mm/memory.c                     | 80 +++++++++++++++++++++++++++++++++
 mm/util.c                       |  7 +++
 tools/testing/vma/include/dup.h |  1 +
 6 files changed, 108 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 040cff64381b..cab58a403a3d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4814,6 +4814,21 @@ static inline void mmap_action_ioremap_full(struct vm_area_desc *desc,
 	mmap_action_ioremap(desc, desc->start, start_pfn, vma_desc_size(desc));
 }
 
+/**
+ * mmap_action_track_pfn - helper for mmap_prepare hook to specify that the PFN
+ * range backing the entirety of a VMA should be tracked, but not mapped.
+ * @desc: The VMA descriptor for the VMA.
+ * @start_pfn: The first PFN in the range.
+ *
+ * Population is left to the driver's fault handler. Not for COW mappings.
+ */
+static inline void mmap_action_track_pfn(struct vm_area_desc *desc,
+					 unsigned long start_pfn)
+{
+	mmap_action_remap_full(desc, start_pfn);
+	desc->action.type = MMAP_TRACK_PFN;
+}
+
 /**
  * mmap_action_simple_ioremap - helper for mmap_prepare hook to specify that the
  * physical range in [start_phys_addr, start_phys_addr + size) should be I/O
@@ -5035,6 +5050,7 @@ struct vm_area_struct *find_extend_vma_locked(struct mm_struct *,
 		unsigned long addr);
 int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
 		    unsigned long pfn, unsigned long size, pgprot_t pgprot);
+int track_pfn_range(struct vm_area_struct *vma, unsigned long pfn);
 
 int vm_insert_page(struct vm_area_struct *, unsigned long addr, struct page *);
 int vm_insert_pages(struct vm_area_struct *vma, unsigned long addr,
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 1ed35d258d2e..f9f1866ad772 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -821,6 +821,7 @@ enum mmap_action_type {
 	MMAP_SIMPLE_IO_REMAP,		/* I/O remap with guardrails. */
 	MMAP_KERNEL_PAGES,		/* Map kernel page range from array. */
 	MMAP_DISCONTIG_KERNEL_PAGES,	/* Map kernel discontig page range. */
+	MMAP_TRACK_PFN,			/* Track PFN range, map on fault. */
 };
 
 enum discontig_kernel_page_action {
diff --git a/mm/internal.h b/mm/internal.h
index 85cf7becf858..5a599402c57d 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1548,6 +1548,9 @@ int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm);
 int remap_pfn_range_prepare(struct vm_area_desc *desc);
 int remap_pfn_range_complete(struct vm_area_struct *vma,
 			     struct mmap_action *action);
+int track_pfn_range_prepare(struct vm_area_desc *desc);
+int track_pfn_range_complete(struct vm_area_struct *vma,
+			     struct mmap_action *action);
 int simple_ioremap_prepare(struct vm_area_desc *desc);
 int map_kernel_pages_prepare(struct vm_area_desc *desc);
 int map_kernel_pages_complete(struct vm_area_struct *vma,
diff --git a/mm/memory.c b/mm/memory.c
index 7f019afc35ca..3d5706f8a7bf 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3439,6 +3439,86 @@ int remap_pfn_range_complete(struct vm_area_struct *vma,
 	return do_remap_pfn_range(vma, start, pfn, size, prot);
 }
 
+#ifdef __HAVE_PFNMAP_TRACKING
+static int do_track_pfn_range(struct vm_area_struct *vma, unsigned long pfn)
+{
+	const unsigned long size = vma->vm_end - vma->vm_start;
+	struct pfnmap_track_ctx *ctx;
+
+	if (vma->pfnmap_track_ctx)
+		return -EINVAL;
+
+	ctx = pfnmap_track_ctx_alloc(pfn, size, &vma->vm_page_prot);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	vma->pfnmap_track_ctx = ctx;
+	return 0;
+}
+#else
+static int do_track_pfn_range(struct vm_area_struct *vma, unsigned long pfn)
+{
+	return 0;
+}
+#endif
+
+/**
+ * track_pfn_range - reserve a VMA's PFN range without populating it
+ * @vma: user vma to track the range for
+ * @pfn: page frame number at vma->vm_start
+ *
+ * Sets the VMA flags remap_pfn_range() would set and reserves the memory type
+ * of the whole VMA's PFN range for its lifetime. Creates no page table
+ * entries: the caller's fault handler populates the range, and must not map
+ * outside it.
+ *
+ * vma cannot be a COW mapping.
+ *
+ * Note: this is only safe if the mmap lock is held for writing when called.
+ *
+ * Return: %0 on success, negative error code otherwise.
+ */
+int track_pfn_range(struct vm_area_struct *vma, unsigned long pfn)
+{
+	int err;
+
+	if (vma_is_cow_mapping(vma))
+		return -EINVAL;
+
+	err = remap_pfn_range_prepare_vma(vma, vma->vm_start, pfn,
+					  vma->vm_end - vma->vm_start);
+	if (err)
+		return err;
+
+	return do_track_pfn_range(vma, pfn);
+}
+EXPORT_SYMBOL_GPL(track_pfn_range);
+
+int track_pfn_range_prepare(struct vm_area_desc *desc)
+{
+	const struct mmap_action *action = &desc->action;
+
+	/* COW mappings cannot be populated on fault */
+	if (vma_desc_is_cow_mapping(desc))
+		return -EINVAL;
+
+	/* do_track_pfn_range() anchors start_pfn at the VMA start */
+	if (action->remap.start != desc->start)
+		return -EINVAL;
+
+	/* do_track_pfn_range() reserves the whole VMA, so the action must */
+	if (action->remap.size != vma_desc_size(desc))
+		return -EINVAL;
+
+	return remap_pfn_range_prepare(desc);
+}
+
+int track_pfn_range_complete(struct vm_area_struct *vma,
+			     struct mmap_action *action)
+{
+	return do_track_pfn_range(vma, action->remap.start_pfn);
+}
+
 static int __simple_ioremap_prep(unsigned long vm_len, pgoff_t vm_pgoff,
 				 phys_addr_t start_phys, unsigned long size,
 				 unsigned long *pfnp)
diff --git a/mm/util.c b/mm/util.c
index 80f6c714844f..5fad246b7a58 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1554,6 +1554,8 @@ int mmap_action_prepare(struct vm_area_desc *desc)
 		return map_kernel_pages_prepare(desc);
 	case MMAP_DISCONTIG_KERNEL_PAGES:
 		return map_discontig_kernel_pages_prepare(desc);
+	case MMAP_TRACK_PFN:
+		return track_pfn_range_prepare(desc);
 	}
 
 	WARN_ON_ONCE(1);
@@ -1589,6 +1591,9 @@ int mmap_action_complete(struct vm_area_struct *vma,
 	case MMAP_DISCONTIG_KERNEL_PAGES:
 		err = map_discontig_kernel_pages_complete(vma, action);
 		break;
+	case MMAP_TRACK_PFN:
+		err = track_pfn_range_complete(vma, action);
+		break;
 	case MMAP_IO_REMAP_PFN:
 	case MMAP_SIMPLE_IO_REMAP:
 		/* Should have been delegated. */
@@ -1611,6 +1616,7 @@ int mmap_action_prepare(struct vm_area_desc *desc)
 	case MMAP_SIMPLE_IO_REMAP:
 	case MMAP_KERNEL_PAGES:
 	case MMAP_DISCONTIG_KERNEL_PAGES:
+	case MMAP_TRACK_PFN:
 		WARN_ON_ONCE(1); /* nommu cannot handle these. */
 		break;
 	}
@@ -1633,6 +1639,7 @@ int mmap_action_complete(struct vm_area_struct *vma,
 	case MMAP_SIMPLE_IO_REMAP:
 	case MMAP_KERNEL_PAGES:
 	case MMAP_DISCONTIG_KERNEL_PAGES:
+	case MMAP_TRACK_PFN:
 		WARN_ON_ONCE(1); /* nommu cannot handle this. */
 
 		err = -EINVAL;
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index dc4927d26296..1bbcb92ab5a6 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -455,6 +455,7 @@ enum mmap_action_type {
 	MMAP_SIMPLE_IO_REMAP,		/* I/O remap with guardrails. */
 	MMAP_KERNEL_PAGES,		/* Map kernel page range from array. */
 	MMAP_DISCONTIG_KERNEL_PAGES,	/* Map kernel discontig page range. */
+	MMAP_TRACK_PFN,			/* Track PFN range, map on fault. */
 };
 
 /*
-- 
2.47.3

