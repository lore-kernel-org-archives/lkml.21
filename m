Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351211;
	b=JR2XYew1ZSYV9ffTq4fa3QyoPDJEzoGD/ocX2HlOJ2O3V8JflTHXOa2e63M5GxaXUYBf
	 Te61Oqldeyh6T8+p4r2EbNV6dM4V0GF21RMdSo0BFbCQRvn3niAUQdUvGIHf96qQb10Fi
	 HW33Qy/IHsgNWh7mGccqXaSFd3W97gilk0q8mnSNvRgrt0RCwWOwc5hUEfKiuFABCCXPh
	 Iay2XDbjak1MycLklL0lwl2wQeCR4gu6z/aPIB2tkAfgCrGDc5yEGHDTp+hi71YDPgTR6
	 vMMC7Bbh4udJTrDUwgafuRODfkWd9Vhns0e5mnGPDmlOj3m6Ael6TOqy7auLSgWgSJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351211;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=yBBVgvVNenWZBOiguDfU2Z0fCx1JK0UcLCVPe4+6boE=;
	b=NR+04Ci5ife4gyEFJosKNpDcqtRtGXJgs+eVZyRi8yagZdCkeV756WqVuq8nudugcf7v
	 kcyNM6XcSajVlmSTPbopRtEtBx4jPaI1u/Dl33MTjQJzYkxLyhnaWJS4DB0fSGzQ2oQ3Q
	 nzI9UAFwKyRMRAZrSJg0SgkW//nDSK+ExdzUS+YDeuZGF7DLovtGWR2diyPZ2Zdn/TB6p
	 6ikVeuhwSKj8p4IOXXmU6WJicOoDoQnKKC4mhBtL/NOt1s6u6ZUizivURRf6T1x09OtDe
	 Zkdar+8/v6C/8rJC2BtFAAn4Jl7Lvqok/GWeGfG7tPrmFLxfdTi6G7P5SCalTpqK2Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oe7uY7V3;
	arc=none smtp.remote-ip=95.215.58.119
Received: from mta1.migadu.com (out-119.mta1.migadu.com [95.215.58.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2638A606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2638A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oe7uY7V3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=t8dNexkpfpO63QAtjHtgcWbqG6+WgxHV0278zBeSYhs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795351209; v=1; x=1795956009;
 b=oe7uY7V3/vVlGeUvRiKeWaEf3FEbz8vrk6ZK5i+KvDLmMXrT14noeZi5j6tMzWEPiKCsjvge
 X3C89LWUai9VsY/ZvcfoRLWO2FB9OKF9IDbE57fqFkeN5cdvXDrbklqxZ7jKsqvD+8Pn6tfmFgL
 lf8MBckHZLuCbYIjQGc5gaPk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id f2dc6aa7f95876d3;
	Sun, 22 Nov 2026 12:40:07 +0000
X-Mizu-Trace-ID: f2dc6aa7f95876d3
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
Subject: [PATCH v6 04/14] mm, swap: use a VM_SPARSE cluster array for xswap devices
Date: Sun, 22 Nov 2026 20:39:08 +0800
Message-ID: <20261122123918.3486916-5-baoquan.he@linux.dev>
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

Add CONFIG_XSWAP and the per-device state for the sparse cluster array.

An xswap device does not have to allocate cluster_info for its whole
address space at once.  Create the array as a VM_SPARSE | VM_ALLOC area,
which reserves the whole range but lets vmalloc allocate and track the
backing pages, and map only the first chunk at setup.  The map helper
extends the mapped range as clusters become visible, and a failed grow
leaves the previous backing in place.

Setup, free and the two cluster_info scans must change together; free
uses vfree(), which drops the mapping and the pages together.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |   6 ++
 mm/Kconfig           |   9 ++
 mm/swapfile.c        | 203 +++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 209 insertions(+), 9 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 9073d29377d8..4a30cf7ee186 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -242,6 +242,12 @@ struct swap_info_struct {
 	signed char	type;		/* strange name for an index */
 	unsigned int	max;		/* size of this swap device */
 	struct swap_cluster_info *cluster_info; /* array, one entry per cluster */
+#ifdef CONFIG_XSWAP
+	struct vm_struct	*cluster_vm;	/* VM_SPARSE | VM_ALLOC area */
+	unsigned long		nr_clusters_max;/* total clusters in the xswap address space */
+	unsigned long		nr_clusters_mapped; /* currently mapped cluster count */
+	struct mutex		xswap_lock;	/* serialize map/unmap operations */
+#endif
 	struct list_head free_clusters; /* free clusters list */
 	struct list_head full_clusters; /* full clusters list */
 	struct list_head nonfull_clusters[SWAP_NR_ORDERS];
diff --git a/mm/Kconfig b/mm/Kconfig
index 18c0beafd4b8..a8707bbd8d62 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -122,6 +122,15 @@ config ZSWAP_COMPRESSOR_DEFAULT
        default "zstd" if ZSWAP_COMPRESSOR_DEFAULT_ZSTD
        default ""
 
+config XSWAP
+	bool "Extendable (virtual) swap device"
+	depends on SWAP && 64BIT && ZSWAP
+	help
+	  Adds support for extendable swap devices (xswap) that decouple
+	  PTE swap entries from physical backing storage. The cluster_info
+	  array is backed by a sparse vmalloc area that is mapped lazily
+	  in chunks, avoiding static pre-allocation overhead.
+
 config ZSMALLOC
 	tristate
 
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 35a079f2bb76..de2feaa2a628 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -49,6 +49,15 @@
 #include "internal.h"
 #include "swap.h"
 
+#ifdef CONFIG_XSWAP
+/*
+ * Clusters mapped per grow: one page worth of cluster_info, so the
+ * vmalloc page table overhead stays proportional to the mapped range.
+ */
+#define XSWAP_GROW_CLUSTERS \
+	max_t(unsigned long, PAGE_SIZE / sizeof(struct swap_cluster_info), 16)
+#endif
+
 static void swap_range_alloc(struct swap_info_struct *si,
 			     unsigned int nr_entries);
 static bool folio_swapcache_freeable(struct folio *folio);
@@ -1983,6 +1992,20 @@ struct swap_info_struct *get_swap_device(swp_entry_t entry)
 	offset = swp_offset(entry);
 	if (offset >= si->max)
 		goto put_out;
+#ifdef CONFIG_XSWAP
+	if (si->flags & SWP_XSWAP) {
+		/* Pairs with the release store in xswap_map_clusters(). */
+		unsigned long mapped = smp_load_acquire(&si->nr_clusters_mapped);
+
+		/*
+		 * xswap maps cluster_info lazily.  A stale entry can point
+		 * past nr_clusters_mapped; reject it before anything
+		 * dereferences cluster_info.
+		 */
+		if (offset / SWAPFILE_CLUSTER >= mapped)
+			goto put_out;
+	}
+#endif
 
 	return si;
 bad_nofile:
@@ -2863,10 +2886,27 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 					unsigned int prev)
 {
 	struct swap_cluster_info *ci;
-	unsigned long i, end;
+	unsigned long i, cluster_end, end;
 	unsigned int ci_off;
 	unsigned long swp_tb;
 
+	end = si->max;
+#ifdef CONFIG_XSWAP
+	/*
+	 * An xswap device maps its cluster_info in chunks as it grows, so
+	 * the tail past nr_clusters_mapped has nothing behind it.
+	 */
+	if (si->flags & SWP_XSWAP) {
+		unsigned long mapped_end;
+
+		/* Pairs with the smp_store_release() in xswap_map_clusters(). */
+		mapped_end = smp_load_acquire(&si->nr_clusters_mapped) *
+			     SWAPFILE_CLUSTER;
+		if (mapped_end < end)
+			end = mapped_end;
+	}
+#endif
+
 	/*
 	 * No need for swap_lock here: we're just looking
 	 * for whether an entry is in use, not modifying it; false
@@ -2874,11 +2914,11 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 	 * allocations from this area (while holding swap_lock).
 	 */
 	i = prev + 1;
-	while (i < si->max) {
+	while (i < end) {
 		ci = __swap_offset_to_cluster(si, i);
-		end = min_t(unsigned long,
-			    ALIGN_DOWN(i, SWAPFILE_CLUSTER) + SWAPFILE_CLUSTER,
-			    si->max);
+		cluster_end = min_t(unsigned long,
+				    ALIGN_DOWN(i, SWAPFILE_CLUSTER) + SWAPFILE_CLUSTER,
+				    end);
 
 		/*
 		 * An empty cluster has no slot in use, so skip it whole.
@@ -2888,13 +2928,13 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 		 * enough, unlike in every other cluster_is_empty() caller.
 		 */
 		if (!READ_ONCE(ci->count)) {
-			i = end;
+			i = cluster_end;
 			cond_resched();
 			continue;
 		}
 
 		ci_off = i % SWAPFILE_CLUSTER;
-		for (; i < end; ci_off++, i++) {
+		for (; i < cluster_end; ci_off++, i++) {
 			swp_tb = swap_table_get(ci, ci_off);
 			if (!swp_tb_is_null(swp_tb) && !swp_tb_is_bad(swp_tb))
 				return i;
@@ -2904,7 +2944,6 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 
 	return 0;
 }
-
 static int try_to_unuse(unsigned int type)
 {
 	struct mm_struct *prev_mm;
@@ -3202,6 +3241,14 @@ static void wait_for_allocation(struct swap_info_struct *si)
 
 	BUG_ON(si->flags & SWP_WRITEOK);
 
+#ifdef CONFIG_XSWAP
+	if (si->flags & SWP_XSWAP) {
+		/* Pairs with the smp_store_release() in xswap_map_clusters(). */
+		end = min(end, smp_load_acquire(&si->nr_clusters_mapped) *
+			  SWAPFILE_CLUSTER);
+	}
+#endif
+
 	for (offset = 0; offset < end; offset += SWAPFILE_CLUSTER) {
 		ci = swap_cluster_lock(si, offset);
 		swap_cluster_unlock(ci);
@@ -3213,11 +3260,38 @@ static void free_swap_cluster_info(struct swap_info_struct *si)
 	struct swap_cluster_info *cluster_info = si->cluster_info;
 	unsigned long maxpages = si->max;
 	struct swap_cluster_info *ci;
-	int i, nr_clusters;
+	unsigned long i, nr_clusters;
 
 	if (!cluster_info)
 		return;
 
+#ifdef CONFIG_XSWAP
+	if (si->flags & SWP_XSWAP) {
+		unsigned long nr_mapped;
+
+		/*
+		 * Cluster 0 keeps the bad header slot, so it never empties
+		 * and __free_cluster() never frees its table.
+		 */
+		/* Pairs with the smp_store_release() in xswap_map_clusters(). */
+		nr_mapped = smp_load_acquire(&si->nr_clusters_mapped);
+		for (i = 0; i < nr_mapped; i++) {
+			ci = &cluster_info[i];
+			spin_lock(&ci->lock);
+			if (cluster_table_is_alloced(ci)) {
+				swap_cluster_assert_empty(ci, 0, SWAPFILE_CLUSTER, true);
+				swap_cluster_free_table(ci);
+			}
+			spin_unlock(&ci->lock);
+		}
+		vfree(si->cluster_info);
+		si->cluster_vm = NULL;
+		si->cluster_info = NULL;
+		si->nr_clusters_mapped = 0;
+		return;
+	}
+#endif
+
 	nr_clusters = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
 	for (i = 0; i < nr_clusters; i++) {
 		ci = cluster_info + i;
@@ -3715,6 +3789,54 @@ static unsigned long read_swap_header(struct swap_info_struct *si,
 	return maxpages;
 }
 
+#ifdef CONFIG_XSWAP
+static int xswap_map_clusters(struct swap_info_struct *si,
+			      unsigned long start_idx, unsigned long nr)
+{
+	/* vm_area_grow_pages() takes an offset into the area, not an address. */
+	unsigned long vm_end = PAGE_ALIGN((size_t)(start_idx + nr) *
+					  sizeof(struct swap_cluster_info));
+	unsigned int noreclaim_flags;
+	unsigned long i;
+	int err;
+
+	mutex_lock(&si->xswap_lock);
+
+	/* Refuse a stale range: the boundary moved since the caller read it. */
+	if (start_idx != READ_ONCE(si->nr_clusters_mapped)) {
+		mutex_unlock(&si->xswap_lock);
+		return -EAGAIN;
+	}
+	if (start_idx + nr > si->nr_clusters_max) {
+		mutex_unlock(&si->xswap_lock);
+		return -EAGAIN;
+	}
+
+	/* Prevent recursive reclaim during page table allocation. */
+	noreclaim_flags = memalloc_noreclaim_save();
+	/* __GFP_ZERO: cluster_info pointer fields must start NULL. */
+	err = vm_area_grow_pages(si->cluster_vm, vm_end,
+				 GFP_KERNEL | __GFP_ZERO |
+				 __GFP_HIGH | __GFP_NOMEMALLOC);
+	memalloc_noreclaim_restore(noreclaim_flags);
+	if (err) {
+		mutex_unlock(&si->xswap_lock);
+		return err;
+	}
+
+	for (i = start_idx; i < start_idx + nr; i++)
+		spin_lock_init(&si->cluster_info[i].lock);
+
+	/*
+	 * Publish the new mappings and cluster lock initialization before
+	 * the count; walkers without xswap_lock use smp_load_acquire().
+	 */
+	smp_store_release(&si->nr_clusters_mapped, start_idx + nr);
+	mutex_unlock(&si->xswap_lock);
+	return 0;
+}
+#endif /* CONFIG_XSWAP */
+
 static int setup_swap_clusters_info(struct swap_info_struct *si,
 				    union swap_header *swap_header,
 				    unsigned long maxpages)
@@ -3724,6 +3846,69 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 	int err = -ENOMEM;
 	unsigned long i;
 
+#ifdef CONFIG_XSWAP
+	if (si->flags & SWP_XSWAP) {
+		unsigned long size = PAGE_ALIGN(nr_clusters * sizeof(*cluster_info));
+		struct vm_struct *vm;
+
+		vm = get_vm_area(size, VM_SPARSE | VM_ALLOC);
+		if (!vm)
+			goto err;
+
+		cluster_info = vm->addr;
+		si->cluster_vm = vm;
+		si->nr_clusters_max = nr_clusters;
+		si->cluster_info = cluster_info;
+
+		/* Must be initialized before xswap_map_clusters() locks it. */
+		mutex_init(&si->xswap_lock);
+
+		err = xswap_map_clusters(si, 0, min_t(unsigned long,
+					XSWAP_GROW_CLUSTERS, nr_clusters));
+		if (err)
+			goto err_free_vm;
+
+		/* xswap: only cluster 0 slot 0 is bad */
+		err = swap_cluster_setup_bad_slot(si, cluster_info, 0, false);
+		if (err)
+			goto err_free_vm;
+
+		INIT_LIST_HEAD(&si->free_clusters);
+		INIT_LIST_HEAD(&si->full_clusters);
+		INIT_LIST_HEAD(&si->discard_clusters);
+		for (i = 0; i < SWAP_NR_ORDERS; i++) {
+			INIT_LIST_HEAD(&si->nonfull_clusters[i]);
+			INIT_LIST_HEAD(&si->frag_clusters[i]);
+		}
+
+		/*
+		 * Cluster 0 holds the header slot, which is marked bad, so it
+		 * is not entirely free.  si->max is cluster aligned, so no
+		 * cluster holds a slot past the end of the device.
+		 */
+		for (i = 0; i < si->nr_clusters_mapped; i++) {
+			struct swap_cluster_info *ci = &cluster_info[i];
+
+			if (ci->count) {
+				ci->flags = CLUSTER_FLAG_NONFULL;
+				list_add_tail(&ci->list, &si->nonfull_clusters[0]);
+			} else {
+				ci->flags = CLUSTER_FLAG_FREE;
+				list_add_tail(&ci->list, &si->free_clusters);
+			}
+		}
+
+		return 0;
+
+err_free_vm:
+		vfree(si->cluster_info);
+		si->cluster_vm = NULL;
+		si->cluster_info = NULL;
+		si->nr_clusters_mapped = 0;
+		return err;
+	}
+#endif /* CONFIG_XSWAP */
+
 	cluster_info = kvzalloc_objs(*cluster_info, nr_clusters);
 	if (!cluster_info)
 		goto err;
-- 
2.54.0

