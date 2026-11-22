Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351713;
	b=0JEsoiInaJ5x+aRgML/DvOjY5QxN8TCCxhuQaKYFffgH95RujJlC3bmgDu6xKaMIKfDl
	 L9CbzecJbi0/w5yZeCkkD81b844DOD7eJbozHNUbJbigqpRJTeEEiTaablkvR2mcVCvPw
	 LLxeCCbdtIycMetqXo+FJQYtHxEI9mTaE5X5ET8EzQTX3dUnXjICpjQZltWkOIWmuBm6j
	 CM/DSrnciLZziQ9T20CnEBNj8hskBZJpoY03SnZG6LELywL/3M3b+E8jSp7rZwBkO2wfT
	 QZlhbkrNK8HNOb8pmwNOkstfaUCnT071jjrv4rTN7Os0uYdBu+oitp6XGYKt5vtOjOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351713;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=fWpHC929BGRiYzSAL7uFn6Yn75mqyH04ZOQRNnEh5E4=;
	b=uNOWvq9KcUain99erzvurr62R7NhB60OBjNvcIMe+HdPcmJIbaLi9fJmmFtRVbrqpAnH
	 fqql9E9Linv8xAskwIhTsSMhedTkjzLSth4a4NwMG3aP7+ZAhZwcDwtNnwM1yB1obTZtk
	 GIDSi3T8tdAx8P290dInarv6xeuKKDvLOT8z6kcOT85IvAockMtM1R6zjP6LZD6fb+ACU
	 k3TFYTVgGD9w/5EzawW6TD0AZ5YhOgnD6scpveWSn4MJvh5tZuILfxj97KTL3PLgdvM+t
	 E6wns/ZyDYAGJdrZWaZB2Hvn9grG3rxtC7lWerSUG5toCgbgd99s7WjqMYBcMIPJnHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sqoBuSux;
	arc=none smtp.remote-ip=91.218.175.104
Received: from mta0.migadu.com (out-104.mta0.migadu.com [91.218.175.104])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFF9606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CFF9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sqoBuSux
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6v8sTTf6pcb85Lo4OtoCE2QJ+satgIKb50EQR+2ySec=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795351710; v=1; x=1795956510;
 b=sqoBuSux8Js1l1iFt02kPszQ1/xsLzn1M0RlCTmyNjqog8l3SdbUabO2IA2gfwQMZ0m8BNB1
 AI38qLrYfjZ/LYu9y+lDsia6A/F7/KhO4mC9h7WbDLdJGyFKvUGoYZR+cL/4UWYTW5gzoTHKDVv
 KPcp6MPlfGvMdihBLgH27uRk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id adc6a1e29aeff931;
	Sun, 22 Nov 2026 12:48:30 +0000
X-Mizu-Trace-ID: adc6a1e29aeff931
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
Subject: [PATCH v6 11/14] mm, swap: add xswap grow trigger on cluster allocation
Date: Sun, 22 Nov 2026 20:48:11 +0800
Message-ID: <20261122124814.3489077-2-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261122124814.3489077-1-baoquan.he@linux.dev>
References: <20261122123918.3486916-1-baoquan.he@linux.dev>
 <20261122124814.3489077-1-baoquan.he@linux.dev>
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

Grow the mapped xswap range before it runs out. When usage reaches 85%
of the mapped range, map more clusters from cluster_alloc_swap_entry().

Grow to about 65% usage. This leaves free space in the mapped range
before the next grow at 85%, so one grow is not immediately followed by
another.

Mapping pages can sleep. Grow before the allocation that needs them,
not after it fails.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |   1 +
 mm/swapfile.c        | 124 ++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 118 insertions(+), 7 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 02c3861a336d..5d9e5b6f2bd6 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -246,6 +246,7 @@ struct swap_info_struct {
 	unsigned long		nr_clusters_max;/* total clusters in the xswap address space */
 	unsigned long		nr_clusters_mapped; /* currently mapped cluster count */
 	struct mutex		xswap_lock;	/* serialize map/unmap operations */
+	atomic_long_t		xswap_grows;	/* grow operations so far */
 #endif
 	struct list_head free_clusters; /* free clusters list */
 	struct list_head full_clusters; /* full clusters list */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 074c5114d129..213b66bb1d6d 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -68,6 +68,21 @@
 #define XSWAP_GROW_CLUSTERS \
 	max_t(unsigned long, PAGE_SIZE / sizeof(struct swap_cluster_info), 16)
 
+/*
+ * Grow thresholds, as a percentage of the mapped range in use.  The target
+ * sits below the next grow trigger, so a grow that follows a rise in usage
+ * does not immediately trigger another one.
+ */
+#define XSWAP_GROW_UNTIL	65
+#define XSWAP_GROW_WHEN		85
+#define XSWAP_GROW_CHUNKS	4
+
+static bool xswap_should_grow(struct swap_info_struct *si);
+static unsigned long xswap_grow(struct swap_info_struct *si);
+static int xswap_map_clusters(struct swap_info_struct *si,
+			      unsigned long start_idx, unsigned long nr,
+			      bool link_free);
+
 static int xswap_create(int prio);
 static int xswap_create_by_name(const char *name, int swap_flags);
 static int xswap_destroy(void);
@@ -1325,6 +1340,13 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 	if (order && !(si->flags & SWP_BLKDEV))
 		return 0;
 
+#ifdef CONFIG_XSWAP
+	/* Grow before allocating: mapping pages can sleep. */
+	if ((si->flags & SWP_XSWAP) && (si->flags & SWP_WRITEOK) &&
+	    xswap_should_grow(si))
+		xswap_grow(si);
+#endif
+
 	if (!(si->flags & SWP_SOLIDSTATE)) {
 		/* Serialize HDD SWAP allocation for each device. */
 		spin_lock(&si->global_cluster_lock);
@@ -1397,6 +1419,12 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 		if (found)
 			goto done;
 	}
+
+#ifdef CONFIG_XSWAP
+	/* A concurrent free or grow may have added clusters; retry once. */
+	if (!found && (si->flags & SWP_XSWAP))
+		found = alloc_swap_scan_list(si, &si->free_clusters, folio, false);
+#endif
 done:
 	if (!(si->flags & SWP_SOLIDSTATE))
 		spin_unlock(&si->global_cluster_lock);
@@ -3986,8 +4014,39 @@ static unsigned long read_swap_header(struct swap_info_struct *si,
 }
 
 #ifdef CONFIG_XSWAP
+/*
+ * Link the new clusters and publish the larger range in one si->lock
+ * section: linking first makes a cluster visible to an allocator only
+ * after it is on the free list.  @link_free is false for the first
+ * chunk, whose free list is not initialized yet.
+ */
+static void xswap_publish_clusters(struct swap_info_struct *si,
+				   unsigned long start_idx, unsigned long nr,
+				   bool link_free)
+{
+	unsigned long i;
+
+	spin_lock(&si->lock);
+	if (link_free) {
+		for (i = start_idx; i < start_idx + nr; i++) {
+			struct swap_cluster_info *ci = &si->cluster_info[i];
+
+			/* A concurrent grower cannot take these: xswap_lock. */
+			if (ci->flags != CLUSTER_FLAG_NONE)
+				continue;
+			list_add_tail(&ci->list, &si->free_clusters);
+			WRITE_ONCE(ci->flags, CLUSTER_FLAG_FREE);
+			ci->order = 0;
+		}
+	}
+	/* Pairs with the smp_load_acquire() in the readers of the range. */
+	smp_store_release(&si->nr_clusters_mapped, start_idx + nr);
+	spin_unlock(&si->lock);
+}
+
 static int xswap_map_clusters(struct swap_info_struct *si,
-			      unsigned long start_idx, unsigned long nr)
+			      unsigned long start_idx, unsigned long nr,
+			      bool link_free)
 {
 	/* vm_area_grow_pages() takes an offset into the area, not an address. */
 	unsigned long vm_end = PAGE_ALIGN((size_t)(start_idx + nr) *
@@ -4023,14 +4082,62 @@ static int xswap_map_clusters(struct swap_info_struct *si,
 	for (i = start_idx; i < start_idx + nr; i++)
 		spin_lock_init(&si->cluster_info[i].lock);
 
-	/*
-	 * Publish the new mappings and cluster lock initialization before
-	 * the count; walkers without xswap_lock use smp_load_acquire().
-	 */
-	smp_store_release(&si->nr_clusters_mapped, start_idx + nr);
+	/* The mappings and the locks are in place; make them visible. */
+	xswap_publish_clusters(si, start_idx, nr, link_free);
 	mutex_unlock(&si->xswap_lock);
 	return 0;
 }
+static bool xswap_should_grow(struct swap_info_struct *si)
+{
+	unsigned long mapped = READ_ONCE(si->nr_clusters_mapped);
+
+	if (mapped >= READ_ONCE(si->nr_clusters_max))
+		return false;
+
+	return swap_usage_in_pages(si) * 100 >=
+	       mapped * SWAPFILE_CLUSTER * XSWAP_GROW_WHEN;
+}
+
+/*
+ * Map more of the cluster_info array, up to GROW_UNTIL in use.  The caller
+ * holds percpu_swap_cluster.lock, which this drops while it sleeps.
+ */
+static unsigned long xswap_grow(struct swap_info_struct *si)
+{
+	unsigned long mapped = READ_ONCE(si->nr_clusters_mapped);
+	unsigned long nr_new, want;
+	int ret;
+
+	lockdep_assert_held(&this_cpu_ptr(&percpu_swap_cluster)->lock);
+
+	want = DIV_ROUND_UP(swap_usage_in_pages(si) * 100,
+			    XSWAP_GROW_UNTIL * SWAPFILE_CLUSTER);
+	if (want <= mapped)
+		return 0;
+
+	nr_new = rounddown(want - mapped, XSWAP_GROW_CLUSTERS);
+	if (!nr_new)
+		nr_new = XSWAP_GROW_CLUSTERS;
+	if (nr_new > XSWAP_GROW_CHUNKS * XSWAP_GROW_CLUSTERS)
+		nr_new = XSWAP_GROW_CHUNKS * XSWAP_GROW_CLUSTERS;
+	nr_new = min(nr_new, READ_ONCE(si->nr_clusters_max) - mapped);
+	if (!nr_new)
+		return 0;
+
+	/*
+	 * Mapping pages can sleep.  The lock only guards the per-cpu
+	 * cluster cache, which this path does not touch.
+	 */
+	local_unlock(&percpu_swap_cluster.lock);
+	ret = xswap_map_clusters(si, mapped, nr_new, true);
+	local_lock(&percpu_swap_cluster.lock);
+	if (ret)
+		return 0;
+
+	atomic_long_inc(&si->xswap_grows);
+	return nr_new;
+}
+
 #endif /* CONFIG_XSWAP */
 
 static int setup_swap_clusters_info(struct swap_info_struct *si,
@@ -4060,7 +4167,8 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 		mutex_init(&si->xswap_lock);
 
 		err = xswap_map_clusters(si, 0, min_t(unsigned long,
-					XSWAP_GROW_CLUSTERS, nr_clusters));
+					XSWAP_GROW_CLUSTERS, nr_clusters),
+					false);
 		if (err)
 			goto err_free_vm;
 
@@ -4252,6 +4360,8 @@ static int xswap_create(int prio)
 	 */
 	si->ops = &swap_bdev_ops;
 
+	atomic_long_set(&si->xswap_grows, 0);
+
 	error = setup_swap_clusters_info(si, NULL, maxpages);
 	if (error)
 		goto bad_swap;
-- 
2.54.0

