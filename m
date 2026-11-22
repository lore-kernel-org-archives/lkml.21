Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351194;
	b=3BVZ5DWRgVYj9KO2tzIzMUfRYxcjb6csk5KkYLNMG+mx5S60hIT527QeYuFASYyperUN
	 8yilNbeWbmMZCk11OhE6zAekRARyhHY30gE4A6+8+f2I/u0TEqaweH58DIblwKZl27vr+
	 31oFbMQq1velFphbeBqu3KNGzcycrQaloljLkPMm7xZnr7gxvoXFqeNeptwGtJLeHmO6T
	 D3r+FPE9e7jL6Sjn8lIjeb5k8AARQOkdAR1MINxJD1+/jrFeCeBC1bWq41C60NDP3I8Op
	 nV7z8489TsOoeb6qSqDbD49N8zJjpZvAPHRP/uNWbN4tMAKPXNvukA7icMeY08TKgVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351194;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=RzvQnovZtrFEMPgZXasAfIWgMC+NCMM2whiEhl6NtVU=;
	b=3USbPR0FZwHL7olWp3kufQCj/wfMVQqRTQI9mQcNgkJvqHgz/6C6zd9dILb6TyNcg1+f
	 mUJ55TJQnnVr/d8JkfZCuzuuPsLxqvMdBSAvJhRZOoCCanWpdipPqPIrKV/AXiwGaFAE5
	 ce1frfsR06GqheQkL1sXRr11kciKFAEYOMikVkxiptgr8XSRLBDVdBV7LVU7WJ55oz38T
	 FkoPQVpGeWmBnx2rOikRJ7tM57PlbQjLOSBWQchGKsKJDLCZ97rxEQV+1INhVecuIDv+1
	 mI13hV0fhVVEjqXhVZUIhhVFtktYLNXec2HuY9iMO71cEM7AOwUl3d/sNLSmZmdKwlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T4ILRyin;
	arc=none smtp.remote-ip=91.218.175.8
Received: from mta0.migadu.com (out-8.mta0.migadu.com [91.218.175.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42700606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42700606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T4ILRyin
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UyaDXEYJfdQ0U95itr/GgGSIbf5fkoLgHgSVX6J0rX8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795351192; v=1; x=1795955992;
 b=T4ILRyinXCtBpyExnli4Y/mnoP2zd0CxCs7g8ikb147NIbLVl27bfC8FniyF4NO2Vey84N1J
 NP18L1fMlZb1JGCuTvgxGVujGMj64zBSiTNq9kB40IwWO3hlojE1MnPB4eqCFJnOhio0epkq/WZ
 ASIeLC7QzaMNlFEhMF9QuKws=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 6ff4581e564d427f;
	Sun, 22 Nov 2026 12:39:52 +0000
X-Mizu-Trace-ID: 6ff4581e564d427f
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	urezki@gmail.com,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	chengming.zhou@linux.dev,
	corbet@lwn.net,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	linux-kernel@vger.kernel.org,
	baoquan.he@linux.dev,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v6 01/14] mm/vmalloc: support vmalloc-backed VM_SPARSE areas
Date: Sun, 22 Nov 2026 20:39:05 +0800
Message-ID: <20261122123918.3486916-2-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261122123918.3486916-1-baoquan.he@linux.dev>
References: <20261122123918.3486916-1-baoquan.he@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Baoquan He <hebaoquan@kylinos.cn>

VM_SPARSE areas are created with get_vm_area() and filled in by the
caller via vm_area_map_pages(), so the caller need to allocate the pages,
keep the struct page array and free everything by itself.

Add vm_area_grow_pages() and vm_area_shrink_pages() for VM_SPARSE |
VM_ALLOC areas. Pages come from the page allocator and are tracked in
area->pages, so the area is released with a single vfree(). The backed
pages always start at the beginning of the area: growing maps
[nr_pages, end) and shrinking unmaps and frees [end, nr_pages). Callers
serialize the two helpers.

nr_pages keeps its existing meaning of "number of backed pages", as
with vrealloc() and vread_iter(), and is updated under the vmap node's
busy.lock so /proc/vmallocinfo never sees a page that is already gone.
Only areas populated through vm_area_map_pages() stay a memory hole.
vm_area_map_pages() now rejects VM_ALLOC areas, because vfree() owns
their pages, to avoid double frees; free_vm_area() warns for the same
combination but not for plain VM_ALLOC areas.

Suggested-by: Chris Li <chrisl@kernel.org>
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/vmalloc.h |   2 +
 mm/vmalloc.c            | 149 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 147 insertions(+), 4 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 034a693777ca..9f40edcddfa8 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -296,6 +296,8 @@ int vm_area_map_pages(struct vm_struct *area, unsigned long start,
 		      unsigned long end, struct page **pages);
 void vm_area_unmap_pages(struct vm_struct *area, unsigned long start,
 			 unsigned long end);
+int vm_area_grow_pages(struct vm_struct *area, unsigned long end, gfp_t gfp);
+void vm_area_shrink_pages(struct vm_struct *area, unsigned long end);
 void vunmap_range(unsigned long addr, unsigned long end);
 
 static inline void set_vm_flush_reset_perms(void *addr)
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 320e981188c9..0fe2f1c39b96 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -788,6 +788,8 @@ static int check_sparse_vm_area(struct vm_struct *area, unsigned long start,
 		return -EINVAL;
 	if (WARN_ON_ONCE(!(area->flags & VM_SPARSE)))
 		return -EINVAL;
+	if (WARN_ON_ONCE(area->flags & VM_ALLOC))
+		return -EINVAL;
 	if ((end - start) >> PAGE_SHIFT > totalram_pages())
 		return -E2BIG;
 	if (start < (unsigned long)area->addr ||
@@ -4174,6 +4176,135 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 	return NULL;
 }
 
+/**
+ * vm_area_grow_pages - back more of a sparse area with pages
+ * @area: area created with %VM_SPARSE | %VM_ALLOC
+ * @end: end of the range to back, %PAGE_SIZE aligned
+ * @gfp: gfp flags for the page allocation
+ *
+ * Allocate and map pages for [@area->nr_pages << PAGE_SHIFT, @end).  The
+ * pages are zeroed when %__GFP_ZERO is set.  The backed range always forms
+ * a prefix of the area, and growing to a range that is already backed is a
+ * no-op.  On failure nothing is mapped and @area->nr_pages is unchanged.
+ *
+ * The area must be released with vfree(@area->addr).  Callers must
+ * serialize calls to this function.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int vm_area_grow_pages(struct vm_struct *area, unsigned long end, gfp_t gfp)
+{
+	unsigned long start = (unsigned long)area->nr_pages << PAGE_SHIFT;
+	unsigned long addr = (unsigned long)area->addr;
+	unsigned long nr_pages, nr_allocated;
+	gfp_t nested_gfp = (gfp & GFP_RECLAIM_MASK) | __GFP_ZERO;
+	struct vmap_node *vn;
+	unsigned int flags;
+	int ret;
+
+	might_sleep();
+
+	if (WARN_ON_ONCE(!(area->flags & VM_ALLOC) ||
+			 !(area->flags & VM_SPARSE)))
+		return -EINVAL;
+	if (WARN_ON_ONCE(!IS_ALIGNED(end, PAGE_SIZE)))
+		return -EINVAL;
+	if (WARN_ON_ONCE(end > get_vm_area_size(area)))
+		return -EINVAL;
+	if (end <= start)
+		return 0;
+	if ((end - start) >> PAGE_SHIFT > totalram_pages())
+		return -E2BIG;
+
+	if (!area->pages) {
+		unsigned long max_pages = get_vm_area_size(area) >> PAGE_SHIFT;
+
+		area->pages = kvmalloc_array(max_pages, sizeof(*area->pages),
+					     nested_gfp);
+		if (!area->pages)
+			return -ENOMEM;
+	}
+
+	if (!(gfp & (GFP_DMA | GFP_DMA32)))
+		gfp |= __GFP_HIGHMEM;
+
+	nr_pages = (end - start) >> PAGE_SHIFT;
+	nr_allocated = vm_area_alloc_pages(vmalloc_gfp_adjust(gfp, 0),
+					   NUMA_NO_NODE, 0, nr_pages,
+					   area->pages + (start >> PAGE_SHIFT));
+	if (nr_allocated != nr_pages) {
+		vm_area_free_pages(area, start >> PAGE_SHIFT,
+				   (start >> PAGE_SHIFT) + nr_allocated);
+		return -ENOMEM;
+	}
+
+	flags = memalloc_apply_gfp_scope(gfp);
+	ret = __vmap_pages_range(addr + start, addr + end, PAGE_KERNEL,
+				 area->pages + (start >> PAGE_SHIFT),
+				 PAGE_SHIFT, nested_gfp);
+	memalloc_restore_scope(flags);
+	if (ret)
+		goto free_pages;
+
+	kasan_unpoison_vmalloc((void *)(addr + start), end - start,
+			       KASAN_VMALLOC_PROT_NORMAL |
+			       KASAN_VMALLOC_KEEP_TAG);
+
+	/*
+	 * Publish under busy.lock, like clear_vm_uninitialized_flag():
+	 * show_busy_info() reads nr_pages and pages[] under that lock.
+	 */
+	vn = addr_to_node(addr);
+	spin_lock(&vn->busy.lock);
+	WRITE_ONCE(area->nr_pages, end >> PAGE_SHIFT);
+	spin_unlock(&vn->busy.lock);
+	return 0;
+
+free_pages:
+	vunmap_range(addr + start, addr + end);
+	vm_area_free_pages(area, start >> PAGE_SHIFT, end >> PAGE_SHIFT);
+	return -ENOMEM;
+}
+
+/**
+ * vm_area_shrink_pages - release the pages backing the end of a sparse area
+ * @area: area created with %VM_SPARSE | %VM_ALLOC
+ * @end: new end of the backed range, %PAGE_SIZE aligned
+ *
+ * Unmap and free pages for [@end, @area->nr_pages << PAGE_SHIFT).  The
+ * released range can be backed again with vm_area_grow_pages().  Callers
+ * must serialize calls to this function.
+ */
+void vm_area_shrink_pages(struct vm_struct *area, unsigned long end)
+{
+	unsigned long start = (unsigned long)area->nr_pages << PAGE_SHIFT;
+	unsigned long addr = (unsigned long)area->addr;
+	struct vmap_node *vn;
+
+	might_sleep();
+
+	if (WARN_ON_ONCE(!(area->flags & VM_ALLOC) ||
+			 !(area->flags & VM_SPARSE)))
+		return;
+	if (WARN_ON_ONCE(!IS_ALIGNED(end, PAGE_SIZE)))
+		return;
+	if (end >= start)
+		return;
+
+	/*
+	 * Lower nr_pages under busy.lock before the pages go away: readers
+	 * walk pages[] up to nr_pages under that lock.
+	 */
+	vn = addr_to_node(addr);
+	spin_lock(&vn->busy.lock);
+	WRITE_ONCE(area->nr_pages, end >> PAGE_SHIFT);
+	spin_unlock(&vn->busy.lock);
+
+	kasan_poison_vmalloc((void *)(addr + end), start - end);
+	vunmap_range(addr + end, addr + start);
+	vm_area_free_pages(area, end >> PAGE_SHIFT, start >> PAGE_SHIFT);
+}
+
 /*
  * See __vmalloc_node_range() for a clear list of supported vmalloc flags.
  * This gfp lists all flags currently passed through vmalloc. Currently,
@@ -4983,12 +5114,18 @@ long vread_iter(struct iov_iter *iter, const char *addr, size_t count)
 		if (n > remains)
 			n = remains;
 
-		if (flags & VMAP_RAM)
+		if (flags & VMAP_RAM) {
 			copied = vmap_ram_vread_iter(iter, addr, n, flags);
-		else if (!(vm && (vm->flags & (VM_IOREMAP | VM_SPARSE))))
-			copied = aligned_vread_iter(iter, addr, n);
-		else /* IOREMAP | SPARSE area is treated as memory hole */
+		} else if (vm && (vm->flags & VM_IOREMAP)) {
+			/* Not backed by struct pages. */
+			copied = zero_iter(iter, n);
+		} else if (vm && (vm->flags & VM_SPARSE) &&
+			   !(vm->flags & VM_ALLOC)) {
+			/* Populated by the caller; treat as a memory hole. */
 			copied = zero_iter(iter, n);
+		} else {
+			copied = aligned_vread_iter(iter, addr, n);
+		}
 
 		addr += copied;
 		remains -= copied;
@@ -5104,6 +5241,10 @@ EXPORT_SYMBOL(remap_vmalloc_range);
 void free_vm_area(struct vm_struct *area)
 {
 	struct vm_struct *ret;
+
+	/* VM_SPARSE | VM_ALLOC areas own their pages and need vfree(). */
+	WARN_ON_ONCE((area->flags & (VM_ALLOC | VM_SPARSE)) ==
+		     (VM_ALLOC | VM_SPARSE));
 	ret = remove_vm_area(area->addr);
 	BUG_ON(ret != area);
 	kfree(area);
-- 
2.54.0

