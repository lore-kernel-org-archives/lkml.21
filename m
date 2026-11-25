Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610214;
	b=nE8c5oyJqy/mJheAxWNrhxL64UWinVWAAzW/FcFMuDIiRxbG270+r3sOO5ltfnq6rZyL
	 omKOKV52c3pvJsXrWGsydkuBcK6fVHMNH+haMUh5GYj/ysiOad+LoQ95ODWNGkZi/DTCu
	 UnbODcixkqld+8fzF58YM0c7AVN0dHuQ7cNbWLXelgXy/u6JpzktHJCAxg0pMtpaCuQOF
	 mMdFyInK0iL/p2JpJueyNOEQIeiKeKgl9+rwHbTkYHlu60ZB3syk3t45XdI6jlupgNtKI
	 p1renJtxXNokHhgtH42XUSJorPr10H/GQix/6pLV1Y2T1VDO5STjXtUdlQ9l+fhA1rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=C9PVTO+o8vn+uvMZF31e4GKIg2ZTnIwjzGlvqUNqLkI=;
	b=Mm8MTr5OMj6iS1abHcHN3dt7EmuXCEnBSkUYFOLOxfSaAklW6ZGNjOoDzfAXZ+xJyIKT
	 SV0Gt3UdzUVeATJof8EW00RG5VdjZDoxpdPawMi9qWKtOz0ibQfihDvCkRqhT3Unf66m8
	 HE5OaFt9TbuZNmrqBraiP1hmS3fB8rk+FMJL8rJStaCK6p2uyKiHO0reCGTNwUPmmDpF7
	 nq0ex+K4FrnD0AkE8j6SglhfSuE9bqkB2iUw5vsA1z5HajIICYS6eckxOykkKrEcYKZDT
	 tJhnMoSguzxW9Ag/aFchRpJB4B5GIjk2vJUfskzN6oR0KqLLXbqcogCybEKrKgh3OmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cgWye7nm;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F572606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F572606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cgWye7nm
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso3416230a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795610213; x=1796215013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C9PVTO+o8vn+uvMZF31e4GKIg2ZTnIwjzGlvqUNqLkI=;
        b=cgWye7nmGEeQCJ02htB6NCDHNxrCRPPNwmuW2CvDXqdzOpHNCLquxaWfw3s02W3NFT
         i5B7w/IMIozfYA+ncOzHwp2wuceY9o6lBQa7Oa/uZQcBJfmdJrx/VHYSTLKNMpB+lpbR
         oCt1myEhWXESxpfb02tFkYeKEQkHma8tsAkA3avc5Bg5E3/RW4d2DBXuwfqIRZSoL8Le
         WppVcdJy0b1qKWRFEGMCGv8WInvsuvcY2EZGgWR/o/VCVNmxJ255ecmUvIKKCN+h/hsy
         BQYZYDrMWAvcgcLw+seXLWv3yWO7orjzo+CwjYM8mNq65DBo/caj6EeBPVNw8z3QZqLc
         eACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610213; x=1796215013;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9PVTO+o8vn+uvMZF31e4GKIg2ZTnIwjzGlvqUNqLkI=;
        b=va+loMroCvbcYRB3SGRWtNf0JQLV1eIizIErtw6Z3qH0acMRz0z7Jsy0cBe9zbUcHw
         pisu/MALwFfFZS7immeQ03AkAaBWEmlYg7mjdoZEpV0u8V4hySt+JlQktQT5DbOzlLTP
         Esc7PS6myDfmn1snqUd52TdtO/qFUgn2gapUeODwIsx7SjxsYtOUCQYZPsCJrrKT9I2+
         FBK2jWSWKjhVxqScZVHdMiwxXrGW1Xnu2igZrmXS4/XhXg5S0mhrBtBJFQE9aazVX0ML
         OCF0Iaqm2VReeeMR6ZFfG5Eu/l7W+5+Wl4Qwg/ltnN8pSif26t0yKInAXAJFc6dOKpbm
         UzoQ==
X-Forwarded-Encrypted: i=1; AL+hErGeyA47R2l6t3tfBOv9ahjuUoAHBfSUzUoCMzCL1sw9awp1iIA9oRO0S+Kl9mFuoWed+Bw+oO2sWMxHNv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pwfI4CBBWDRqfG/+QfdxfWx6ArJJ9cjtPpomYe3PvPkdnJxYC
	N/6XqDHl7QwI9twBpJnDQZUo6lUgrmY6dpVQdEYqjohkpOrmCnYGJ5gO
X-Gm-Gg: AZFdTZf63u4Bg6iGlQEiLXm2ULLJxIGKqVGCB/3IpI0cy1YJ9FzhTp8SSD83QhKgqmf
	rsFUfWyCmIKFNGtJNveR7BQjO16y2Fz+au7N40ZT7E72R2GnEpy2kd1EE+kRsFQkpmWK8nLqan6
	RSX4c6lBvhkIH2g+qwTcIJS1apfLDdDkav+tidhsBJjdjWVtiDkE+OxCyZEe2UUkdzIXpGQRlvX
	mfqJ4QTX6pqVv0rwvcG894C5F9iz87Tcc2MzZez/keBpmnvkypwcpGVrQ+owO/186jzNk5wjQH/
	qRZLb2WetXhaGls09GI7AIg2Z4GsUMAaQG+2iLDm6716uHCmj1HxVlWpjOZ1HK7dNqEXPRfTUgQ
	QKmCrdsd/CMOV1IKy2WCCwlbRlpzP9dIQUDNyISCZasym1J+aXWTmmVPolGBEerKttxoGA9lQNs
	AC0mqryvYdKnmpomkrxUfFKA9kft2ij/1IT5ZkXXF+1CjRreOH2v70F1BT6BqglXbvw0Se73kRp
	Nz5j5yHcjjQ3YtXlpsLOpE/gOX6CqC6zn6AGsQjW/F/dPKPm/QLcy1HYvxVKq2pPKp2k4dz8jIb
	1/f8frKN1oFY6/ZFFu3VoZnaNkuvGpeER0DkY1twrubNKsTwZJXh5011bCrVQnIzZ5fHrvA=
X-Received: by 2002:a17:90b:4a48:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3b41c7b60b5mr15844816a91.6.1795610212712;
        Wed, 25 Nov 2026 04:36:52 -0800 (PST)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm30933094a91.10.2026.11.25.04.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:36:52 -0800 (PST)
Date: Wed, 25 Nov 2026 20:36:36 +0800
From: Kairui Song <ryncsn@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: kasong@tencent.com, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, SJ Park <sj@kernel.org>, 
	David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, Vernon Yang <vernon2gm@gmail.com>, 
	Zicheng Wang <wangzicheng@honor.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Subject: Re: [PATCH v6 08/18] mm/mglru: make folio lru referenced times count
 a generic API
Message-ID: <awa30hwg6x82REoo@KASONG-MC4>
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-8-8ffea39934a6@tencent.com>
 <e85a2666-9722-420b-9a60-9d4251fc3d4c@kernel.org>
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
In-Reply-To: <e85a2666-9722-420b-9a60-9d4251fc3d4c@kernel.org>

On Wed, Nov 25, 2026 at 11:15:33AM +0800, David Hildenbrand (Arm) wrote:
> On 11/23/26 19:53, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> > 
> > Pure code shuffle, no behavior change.
> > 
> > Make the folio LRU refs helpers available regardless of CONFIG_LRU_GEN.
> > Without MGLRU the extra bits are never set, so they are inert. Move the
> > lru_gen_* helpers into the CONFIG_LRU_GEN section.  This prepares for
> > unifying the API for checking folio referenced and workingset status.
> > 
> > folio_migrate_lru_refs() now migrates the complete refs count,
> > including PG_workingset (bit 1 of the encoding), bitwise identical to
> > the direct copy dropped from folio_migrate_flags().
> > 
> > lru_set_refs_flags() skips the nonexistent mask bits when
> > LRU_REFS_WIDTH collapses to 0, preserving the two independent flags for
> > !CONFIG_LRU_GEN builds.
> > 
> > Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> > Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> > Tested-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  include/linux/mm_inline.h | 55 ++++++++++++++++++++++++-----------------------
> 
> I'm starting to feel like all of these mglru/reclaim thingies should go into a
> dedicated helper.

Hi David

I saw your comment on other patches too, about the header mm_inline.h,
about ~690 / 860 lines of code in it is for MGLRU / CLRU only. The
rest ~200 are for VMA / TLB / MMU.

> 
> Can you do that as a prio cleanup in this series, so we don't have to mess with
> mm_inline.h in later patches anymore?

Perhaps we can instead move the non LRU helpers in it?
These helpers:

  - anon_vma_name_get
  - anon_vma_name_put
  - anon_vma_name_reuse
  - dup_anon_vma_name
  - free_anon_vma_name
  - anon_vma_name_eq
  - pfnmap_track_ctx_release
  - init_tlb_flush_pending
  - inc_tlb_flush_pending
  - dec_tlb_flush_pending
  - mm_tlb_flush_pending
  - mm_tlb_flush_nested
  - copy_pte_marker
  - num_pages_contiguous

All other helper in mm_inline.h are for LRU. So we rename mm_inline.h
to mm_lru.h?

Like the patch below, zero behavior change, pure code shuffle:

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d8bafcd92791..2eb0e2fc8c2d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1903,6 +1903,90 @@ static inline bool vma_is_anon_shmem(const struct vm_area_struct *vma) { return
 
 int vma_is_stack_for_current(const struct vm_area_struct *vma);
 
+static inline void init_tlb_flush_pending(struct mm_struct *mm)
+{
+	atomic_set(&mm->tlb_flush_pending, 0);
+}
+
+static inline void inc_tlb_flush_pending(struct mm_struct *mm)
+{
+	atomic_inc(&mm->tlb_flush_pending);
+	/*
+	 * The only time this value is relevant is when there are indeed pages
+	 * to flush. And we'll only flush pages after changing them, which
+	 * requires the PTL.
+	 *
+	 * So the ordering here is:
+	 *
+	 *	atomic_inc(&mm->tlb_flush_pending);
+	 *	spin_lock(&ptl);
+	 *	...
+	 *	set_pte_at();
+	 *	spin_unlock(&ptl);
+	 *
+	 *				spin_lock(&ptl)
+	 *				mm_tlb_flush_pending();
+	 *				....
+	 *				spin_unlock(&ptl);
+	 *
+	 *	flush_tlb_range();
+	 *	atomic_dec(&mm->tlb_flush_pending);
+	 *
+	 * Where the increment if constrained by the PTL unlock, it thus
+	 * ensures that the increment is visible if the PTE modification is
+	 * visible. After all, if there is no PTE modification, nobody cares
+	 * about TLB flushes either.
+	 *
+	 * This very much relies on users (mm_tlb_flush_pending() and
+	 * mm_tlb_flush_nested()) only caring about _specific_ PTEs (and
+	 * therefore specific PTLs), because with SPLIT_PTE_PTLOCKS and RCpc
+	 * locks (PPC) the unlock of one doesn't order against the lock of
+	 * another PTL.
+	 *
+	 * The decrement is ordered by the flush_tlb_range(), such that
+	 * mm_tlb_flush_pending() will not return false unless all flushes have
+	 * completed.
+	 */
+}
+
+static inline void dec_tlb_flush_pending(struct mm_struct *mm)
+{
+	/*
+	 * See inc_tlb_flush_pending().
+	 *
+	 * This cannot be smp_mb__before_atomic() because smp_mb() simply does
+	 * not order against TLB invalidate completion, which is what we need.
+	 *
+	 * Therefore we must rely on tlb_flush_*() to guarantee order.
+	 */
+	atomic_dec(&mm->tlb_flush_pending);
+}
+
+static inline bool mm_tlb_flush_pending(const struct mm_struct *mm)
+{
+	/*
+	 * Must be called after having acquired the PTL; orders against that
+	 * PTLs release and therefore ensures that if we observe the modified
+	 * PTE we must also observe the increment from inc_tlb_flush_pending().
+	 *
+	 * That is, it only guarantees to return true if there is a flush
+	 * pending for _this_ PTL.
+	 */
+	return atomic_read(&mm->tlb_flush_pending);
+}
+
+static inline bool mm_tlb_flush_nested(const struct mm_struct *mm)
+{
+	/*
+	 * Similar to mm_tlb_flush_pending(), we must have acquired the PTL
+	 * for which there is a TLB flush pending in order to guarantee
+	 * we've seen both that PTE modification and the increment.
+	 *
+	 * (no requirement on actually still holding the PTL, that is irrelevant)
+	 */
+	return atomic_read(&mm->tlb_flush_pending) > 1;
+}
+
 /* flush_tlb_range() takes a vma, not a mm, and can care about flags */
 #define TLB_FLUSH_VMA(mm,flags) { .vm_mm = (mm), .vm_flags = (flags) }
 
@@ -2887,6 +2971,42 @@ static inline unsigned long memdesc_section(const memdesc_flags_t *mdf)
 }
 #endif /* SECTION_IN_PAGE_FLAGS */
 
+/**
+ * num_pages_contiguous() - determine the number of contiguous pages
+ *			    that represent contiguous PFNs
+ * @pages: an array of page pointers
+ * @nr_pages: length of the array, at least 1
+ *
+ * Determine the number of contiguous pages that represent contiguous PFNs
+ * in @pages, starting from the first page.
+ *
+ * In some kernel configs contiguous PFNs will not have contiguous struct
+ * pages. In these configurations num_pages_contiguous() will return a num
+ * smaller than ideal number. The caller should continue to check for pfn
+ * contiguity after each call to num_pages_contiguous().
+ *
+ * Returns the number of contiguous pages.
+ */
+static inline size_t num_pages_contiguous(struct page **pages, size_t nr_pages)
+{
+	struct page *cur_page = pages[0];
+	unsigned long section = memdesc_section(&cur_page->flags);
+	size_t i;
+
+	for (i = 1; i < nr_pages; i++) {
+		if (++cur_page != pages[i])
+			break;
+		/*
+		 * In unproblematic kernel configs, page_to_section() == 0 and
+		 * the whole check will get optimized out.
+		 */
+		if (memdesc_section(&cur_page->flags) != section)
+			break;
+	}
+
+	return i;
+}
+
 /**
  * folio_pfn - Return the Page Frame Number of a folio.
  * @folio: The folio.
diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index f6f4bc9a704f..d7f1d3e4fa4c 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -6,9 +6,6 @@
 #include <linux/huge_mm.h>
 #include <linux/mm_types.h>
 #include <linux/swap.h>
-#include <linux/string.h>
-#include <linux/userfaultfd_k.h>
-#include <linux/leafops.h>
 
 /**
  * folio_is_file_lru - Should the folio be on a file LRU or anon LRU?
@@ -500,181 +497,7 @@ void lruvec_del_folio(struct lruvec *lruvec, struct folio *folio)
 			-folio_nr_pages(folio));
 }
 
-#ifdef CONFIG_ANON_VMA_NAME
-/* mmap_lock should be read-locked */
-static inline void anon_vma_name_get(struct anon_vma_name *anon_name)
-{
-	if (anon_name)
-		kref_get(&anon_name->kref);
-}
-
-static inline void anon_vma_name_put(struct anon_vma_name *anon_name)
-{
-	if (anon_name)
-		kref_put(&anon_name->kref, anon_vma_name_free);
-}
-
-static inline
-struct anon_vma_name *anon_vma_name_reuse(struct anon_vma_name *anon_name)
-{
-	/* Prevent anon_name refcount saturation early on */
-	if (kref_read(&anon_name->kref) < REFCOUNT_MAX) {
-		anon_vma_name_get(anon_name);
-		return anon_name;
-
-	}
-	return anon_vma_name_alloc(anon_name->name);
-}
-
-static inline void dup_anon_vma_name(struct vm_area_struct *orig_vma,
-				     struct vm_area_struct *new_vma)
-{
-	struct anon_vma_name *anon_name = anon_vma_name(orig_vma);
-
-	if (anon_name)
-		new_vma->anon_name = anon_vma_name_reuse(anon_name);
-}
-
-static inline void free_anon_vma_name(struct vm_area_struct *vma)
-{
-	/*
-	 * Not using anon_vma_name because it generates a warning if mmap_lock
-	 * is not held, which might be the case here.
-	 */
-	anon_vma_name_put(vma->anon_name);
-}
-
-static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
-				    struct anon_vma_name *anon_name2)
-{
-	if (anon_name1 == anon_name2)
-		return true;
-
-	return anon_name1 && anon_name2 &&
-		!strcmp(anon_name1->name, anon_name2->name);
-}
-
-#else /* CONFIG_ANON_VMA_NAME */
-static inline void anon_vma_name_get(struct anon_vma_name *anon_name) {}
-static inline void anon_vma_name_put(struct anon_vma_name *anon_name) {}
-static inline void dup_anon_vma_name(struct vm_area_struct *orig_vma,
-				     struct vm_area_struct *new_vma) {}
-static inline void free_anon_vma_name(struct vm_area_struct *vma) {}
-
-static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
-				    struct anon_vma_name *anon_name2)
-{
-	return true;
-}
-
-#endif  /* CONFIG_ANON_VMA_NAME */
-
-void pfnmap_track_ctx_release(struct kref *ref);
-
-static inline void init_tlb_flush_pending(struct mm_struct *mm)
-{
-	atomic_set(&mm->tlb_flush_pending, 0);
-}
-
-static inline void inc_tlb_flush_pending(struct mm_struct *mm)
-{
-	atomic_inc(&mm->tlb_flush_pending);
-	/*
-	 * The only time this value is relevant is when there are indeed pages
-	 * to flush. And we'll only flush pages after changing them, which
-	 * requires the PTL.
-	 *
-	 * So the ordering here is:
-	 *
-	 *	atomic_inc(&mm->tlb_flush_pending);
-	 *	spin_lock(&ptl);
-	 *	...
-	 *	set_pte_at();
-	 *	spin_unlock(&ptl);
-	 *
-	 *				spin_lock(&ptl)
-	 *				mm_tlb_flush_pending();
-	 *				....
-	 *				spin_unlock(&ptl);
-	 *
-	 *	flush_tlb_range();
-	 *	atomic_dec(&mm->tlb_flush_pending);
-	 *
-	 * Where the increment if constrained by the PTL unlock, it thus
-	 * ensures that the increment is visible if the PTE modification is
-	 * visible. After all, if there is no PTE modification, nobody cares
-	 * about TLB flushes either.
-	 *
-	 * This very much relies on users (mm_tlb_flush_pending() and
-	 * mm_tlb_flush_nested()) only caring about _specific_ PTEs (and
-	 * therefore specific PTLs), because with SPLIT_PTE_PTLOCKS and RCpc
-	 * locks (PPC) the unlock of one doesn't order against the lock of
-	 * another PTL.
-	 *
-	 * The decrement is ordered by the flush_tlb_range(), such that
-	 * mm_tlb_flush_pending() will not return false unless all flushes have
-	 * completed.
-	 */
-}
-
-static inline void dec_tlb_flush_pending(struct mm_struct *mm)
-{
-	/*
-	 * See inc_tlb_flush_pending().
-	 *
-	 * This cannot be smp_mb__before_atomic() because smp_mb() simply does
-	 * not order against TLB invalidate completion, which is what we need.
-	 *
-	 * Therefore we must rely on tlb_flush_*() to guarantee order.
-	 */
-	atomic_dec(&mm->tlb_flush_pending);
-}
-
-static inline bool mm_tlb_flush_pending(const struct mm_struct *mm)
-{
-	/*
-	 * Must be called after having acquired the PTL; orders against that
-	 * PTLs release and therefore ensures that if we observe the modified
-	 * PTE we must also observe the increment from inc_tlb_flush_pending().
-	 *
-	 * That is, it only guarantees to return true if there is a flush
-	 * pending for _this_ PTL.
-	 */
-	return atomic_read(&mm->tlb_flush_pending);
-}
-
-static inline bool mm_tlb_flush_nested(const struct mm_struct *mm)
-{
-	/*
-	 * Similar to mm_tlb_flush_pending(), we must have acquired the PTL
-	 * for which there is a TLB flush pending in order to guarantee
-	 * we've seen both that PTE modification and the increment.
-	 *
-	 * (no requirement on actually still holding the PTL, that is irrelevant)
-	 */
-	return atomic_read(&mm->tlb_flush_pending) > 1;
-}
-
 #ifdef CONFIG_MMU
-/*
- * Computes the pte marker to copy from the given source entry into dst_vma.
- * If no marker should be copied, returns 0.
- * The caller should insert a new pte created with make_pte_marker().
- */
-static inline pte_marker copy_pte_marker(
-		softleaf_t entry, struct vm_area_struct *dst_vma)
-{
-	const pte_marker srcm = softleaf_to_marker(entry);
-	/* Always copy error entries. */
-	pte_marker dstm = srcm & (PTE_MARKER_POISONED | PTE_MARKER_GUARD);
-
-	/* Only copy PTE markers if UFFD register matches. */
-	if ((srcm & PTE_MARKER_UFFD_WP) && userfaultfd_wp(dst_vma))
-		dstm |= PTE_MARKER_UFFD_WP;
-
-	return dstm;
-}
-
 static inline bool vma_has_recency(const struct vm_area_struct *vma)
 {
 	if (vma->vm_flags & (VM_SEQ_READ | VM_RAND_READ))
@@ -687,40 +510,4 @@ static inline bool vma_has_recency(const struct vm_area_struct *vma)
 }
 #endif
 
-/**
- * num_pages_contiguous() - determine the number of contiguous pages
- *			    that represent contiguous PFNs
- * @pages: an array of page pointers
- * @nr_pages: length of the array, at least 1
- *
- * Determine the number of contiguous pages that represent contiguous PFNs
- * in @pages, starting from the first page.
- *
- * In some kernel configs contiguous PFNs will not have contiguous struct
- * pages. In these configurations num_pages_contiguous() will return a num
- * smaller than ideal number. The caller should continue to check for pfn
- * contiguity after each call to num_pages_contiguous().
- *
- * Returns the number of contiguous pages.
- */
-static inline size_t num_pages_contiguous(struct page **pages, size_t nr_pages)
-{
-	struct page *cur_page = pages[0];
-	unsigned long section = memdesc_section(&cur_page->flags);
-	size_t i;
-
-	for (i = 1; i < nr_pages; i++) {
-		if (++cur_page != pages[i])
-			break;
-		/*
-		 * In unproblematic kernel configs, page_to_section() == 0 and
-		 * the whole check will get optimized out.
-		 */
-		if (memdesc_section(&cur_page->flags) != section)
-			break;
-	}
-
-	return i;
-}
-
 #endif
diff --git a/mm/internal.h b/mm/internal.h
index de4593b3e3b6..b52647a2442b 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -16,7 +16,9 @@
 #include <linux/pagemap.h>
 #include <linux/pagewalk.h>
 #include <linux/rmap.h>
+#include <linux/string.h>
 #include <linux/swap.h>
+#include <linux/userfaultfd_k.h>
 #include <linux/leafops.h>
 #include <linux/tracepoint-defs.h>
 
@@ -281,12 +283,104 @@ static inline int mmap_file(struct file *file, struct vm_area_struct *vma)
 /* unmap_vmas is in mm/memory.c */
 void unmap_vmas(struct mmu_gather *tlb, struct unmap_desc *unmap);
 
+#ifdef CONFIG_ANON_VMA_NAME
+/* mmap_lock should be read-locked */
+static inline void anon_vma_name_get(struct anon_vma_name *anon_name)
+{
+	if (anon_name)
+		kref_get(&anon_name->kref);
+}
+
+static inline void anon_vma_name_put(struct anon_vma_name *anon_name)
+{
+	if (anon_name)
+		kref_put(&anon_name->kref, anon_vma_name_free);
+}
+
+static inline
+struct anon_vma_name *anon_vma_name_reuse(struct anon_vma_name *anon_name)
+{
+	/* Prevent anon_name refcount saturation early on */
+	if (kref_read(&anon_name->kref) < REFCOUNT_MAX) {
+		anon_vma_name_get(anon_name);
+		return anon_name;
+
+	}
+	return anon_vma_name_alloc(anon_name->name);
+}
+
+static inline void dup_anon_vma_name(struct vm_area_struct *orig_vma,
+				     struct vm_area_struct *new_vma)
+{
+	struct anon_vma_name *anon_name = anon_vma_name(orig_vma);
+
+	if (anon_name)
+		new_vma->anon_name = anon_vma_name_reuse(anon_name);
+}
+
+static inline void free_anon_vma_name(struct vm_area_struct *vma)
+{
+	/*
+	 * Not using anon_vma_name because it generates a warning if mmap_lock
+	 * is not held, which might be the case here.
+	 */
+	anon_vma_name_put(vma->anon_name);
+}
+
+static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
+				    struct anon_vma_name *anon_name2)
+{
+	if (anon_name1 == anon_name2)
+		return true;
+
+	return anon_name1 && anon_name2 &&
+		!strcmp(anon_name1->name, anon_name2->name);
+}
+
+#else /* CONFIG_ANON_VMA_NAME */
+static inline void anon_vma_name_get(struct anon_vma_name *anon_name) {}
+static inline void anon_vma_name_put(struct anon_vma_name *anon_name) {}
+static inline void dup_anon_vma_name(struct vm_area_struct *orig_vma,
+				     struct vm_area_struct *new_vma) {}
+static inline void free_anon_vma_name(struct vm_area_struct *vma) {}
+
+static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
+				    struct anon_vma_name *anon_name2)
+{
+	return true;
+}
+
+#endif  /* CONFIG_ANON_VMA_NAME */
+
+#ifdef __HAVE_PFNMAP_TRACKING
+void pfnmap_track_ctx_release(struct kref *ref);
+#endif
+
 #ifdef CONFIG_MMU
 
 bool cond_install_uffd_wp_ptes(struct vm_area_struct *vma,
 		unsigned long addr, pte_t *ptep, pte_t pte,
 		unsigned long nr_ptes);
 
+/*
+ * Computes the pte marker to copy from the given source entry into dst_vma.
+ * If no marker should be copied, returns 0.
+ * The caller should insert a new pte created with make_pte_marker().
+ */
+static inline pte_marker copy_pte_marker(
+		softleaf_t entry, struct vm_area_struct *dst_vma)
+{
+	const pte_marker srcm = softleaf_to_marker(entry);
+	/* Always copy error entries. */
+	pte_marker dstm = srcm & (PTE_MARKER_POISONED | PTE_MARKER_GUARD);
+
+	/* Only copy PTE markers if UFFD register matches. */
+	if ((srcm & PTE_MARKER_UFFD_WP) && userfaultfd_wp(dst_vma))
+		dstm |= PTE_MARKER_UFFD_WP;
+
+	return dstm;
+}
+
 static inline void get_anon_vma(struct anon_vma *anon_vma)
 {
 	atomic_inc(&anon_vma->refcount);
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 6e83ce3801b8..61a0c0d4b47d 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -7,6 +7,7 @@
  *  Copyright (C) 2010  Linus Torvalds
  */
 
+#include <linux/mm.h>
 #include <linux/pagemap.h>
 #include <linux/hugetlb.h>
 #include <linux/pgtable.h>
