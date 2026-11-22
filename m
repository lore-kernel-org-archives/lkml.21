Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351229;
	b=iefaEsmM5HZ+8b3oEF0g8IedT8NHGFt2Ua7ZOjdwEy5q5y6OOHEw07koT+Loj7vSe9Ua
	 nAN1KHS5PLWO/ub9aLSbGUTuPyKWKO3Bx8RiuNdbOr/D5qmhA8472VORR4wMQWE8+Opnp
	 XCeGsUwvImE5vveYFgtwf/1DuEa6yCOD0P87WGRoA8N70QU9/iXr6CCTxu7TpcoSeX1Ad
	 UN5rGSLifzSut/A9tqN9pRoHcGbJHkgLqrnP/Das6DztdEHZ2d5PHyM6rGCoQWqzFyAxu
	 swIV9rngkkBpdLtbuBojToeCw6xzF3nKfw8fO4z9Plt6WDj3iIpNz30ScE5jj9cyUaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351229;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=bmuX2nULtaCu0DlZk7+Ehu05Yz7Br28oRANfAi7CAao=;
	b=GqtzNQKhpmrX+zAg2KiqsWynHvi7YomYGVpqMSDAfOYD+ajzFdW+z6dpDIqlZzewsGOn
	 O1uWuVXzoCHosK5PbWtKFAH5pAKOpJwTIUe2y6xfKYqbqzEa202MFm9ctWGLXpVB00i1i
	 6iFLwaCTBgiU2SCt1yZ+LrN6kkuAMEEuAuG0nQ7900iKWTIkcUbbAYnOoHaVU8ige3+q8
	 6VjCZLpRdkGfHSZmlFh77pClgQWq/3WJstc/1qFcE5B6WxgwD2PRnXJa846+/2CJu8glY
	 ZcgEp1F9giGCCiqjS0UU2YzrPylNNbOjpyJMJMt/Fg9ecc6dzoc5uCl7yh1P8voD6bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bcCsLTMy;
	arc=none smtp.remote-ip=91.218.175.38
Received: from mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26735606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26735606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bcCsLTMy
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mJoRwEwPu4sOHEs8+cS+QIvfYy4EQvodVZryXdseOYo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795351227; v=1; x=1795956027;
 b=bcCsLTMyL+HB9dw5mcQxnTT7Vg5ruwlu35tNMvOB8lbU/VcEMV+71lY7footXv3qjAqXEAKt
 VDPl/PNEK7CHp65fuXCRw1niTaPnMQd81vXOpR5Ta18ePIiRkLoKTUcpwnPrrTyfNjnprkMha8p
 r0klLHs6r7DlJ5SYsOAzTlig=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 93b88276732dad48;
	Sun, 22 Nov 2026 12:40:24 +0000
X-Mizu-Trace-ID: 93b88276732dad48
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
Subject: [PATCH v6 06/14] mm, swap: create the xswap device from swapon(2)
Date: Sun, 22 Nov 2026 20:39:10 +0800
Message-ID: <20261122123918.3486916-7-baoquan.he@linux.dev>
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

An xswap device has no backing file, so it has no path for swapon(2) to
open, and it needs a way to be activated.  Give swapon(2) a name that
says exactly that:

	swapon("xswap", SWAP_FLAG_PREFER | prio);

The name is not a path: swapon(2) opens specialfile the usual way first
and falls back to the device only when that fails with -ENOENT.  A file
or directory called "xswap" therefore keeps precedence, and only the
exact string matches, so "./xswap" and absolute paths are files as
usual.  This is the same rule swapoff(2) uses.  There is no separate
flag and no second way to create it.

The call is still an activation: it takes a priority, it fails with
-EBUSY when the device exists, and /proc/swaps shows it as the fixed
"xswap" next to the real devices.  Discard flags are rejected: there is
no storage to discard.

The device is sized at twice RAM, and its cluster array is mapped
lazily, so only the part that is used costs memory.

Hibernation device discovery skips xswap devices: there is no bdev to
store a resume image.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |   1 -
 mm/swapfile.c        | 187 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 172 insertions(+), 16 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 6747b577c405..02c3861a336d 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -21,7 +21,6 @@
 #define SWAP_FLAG_DISCARD	0x10000 /* enable discard for swap */
 #define SWAP_FLAG_DISCARD_ONCE	0x20000 /* discard swap area at swapon-time */
 #define SWAP_FLAG_DISCARD_PAGES 0x40000 /* discard page-clusters after use */
-
 #define SWAP_FLAGS_VALID	(SWAP_FLAG_PRIO_MASK | SWAP_FLAG_PREFER | \
 				 SWAP_FLAG_DISCARD | SWAP_FLAG_DISCARD_ONCE | \
 				 SWAP_FLAG_DISCARD_PAGES)
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 912cfa68ba01..4e598ab8da65 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -48,6 +48,16 @@
 #include "swap_table.h"
 #include "internal.h"
 #include "swap.h"
+#define DEF_SWAP_PRIO  -1
+
+/*
+ * Highest priority: xswap must take the page before a real device does.
+ * At equal priority the list is FIFO, so an earlier real device wins.
+ */
+#define DEF_XSWAP_PRIO	SWAP_FLAG_PRIO_MASK
+
+/* File-less, so /proc/swaps shows this name; swapoff -a passes it back. */
+#define XSWAP_NAME	"xswap"
 
 #ifdef CONFIG_XSWAP
 /*
@@ -56,7 +66,18 @@
  */
 #define XSWAP_GROW_CLUSTERS \
 	max_t(unsigned long, PAGE_SIZE / sizeof(struct swap_cluster_info), 16)
-#endif
+
+static int xswap_create(int prio);
+static int xswap_create_by_name(const char *name, int swap_flags);
+
+/* Serializes create and destroy: at most one xswap device exists. */
+static DEFINE_MUTEX(xswap_ctl_lock);
+#else /* !CONFIG_XSWAP */
+static inline int xswap_create_by_name(const char *name, int swap_flags)
+{
+	return -ENOENT;
+}
+#endif /* CONFIG_XSWAP */
 
 static void swap_range_alloc(struct swap_info_struct *si,
 			     unsigned int nr_entries);
@@ -84,7 +105,6 @@ atomic_t nr_real_swapfiles;
 EXPORT_SYMBOL_GPL(nr_swap_pages);
 /* protected with swap_lock. reading in vm_swap_full() doesn't need lock */
 long total_swap_pages;
-#define DEF_SWAP_PRIO  -1
 unsigned long swapfile_maximum_size;
 #ifdef CONFIG_MIGRATION
 bool swap_migration_ad_supported;
@@ -2334,6 +2354,9 @@ static int __find_hibernation_swap_type(dev_t device, sector_t offset)
 
 		if (!(sis->flags & SWP_WRITEOK))
 			continue;
+		/* xswap has no bdev to match a resume device */
+		if (sis->flags & SWP_XSWAP)
+			continue;
 
 		if (device == sis->bdev->bd_dev) {
 			struct swap_extent *se = first_se(sis);
@@ -2521,6 +2544,8 @@ int find_first_swap(dev_t *device)
 
 		if (!(sis->flags & SWP_WRITEOK))
 			continue;
+		if (sis->flags & SWP_XSWAP)
+			continue;
 		*device = sis->bdev->bd_dev;
 		spin_unlock(&swap_lock);
 		return type;
@@ -3497,7 +3522,8 @@ static void *swap_start(struct seq_file *swap, loff_t *pos)
 		return SEQ_START_TOKEN;
 
 	for (type = 0; (si = swap_type_to_info(type)); type++) {
-		if (!(si->swap_file))
+		if (!si->swap_file &&
+		    !((si->flags & SWP_XSWAP) && (si->flags & SWP_WRITEOK)))
 			continue;
 		if (!--l)
 			return si;
@@ -3518,7 +3544,8 @@ static void *swap_next(struct seq_file *swap, void *v, loff_t *pos)
 
 	++(*pos);
 	for (; (si = swap_type_to_info(type)); type++) {
-		if (!(si->swap_file))
+		if (!si->swap_file &&
+		    !((si->flags & SWP_XSWAP) && (si->flags & SWP_WRITEOK)))
 			continue;
 		return si;
 	}
@@ -3560,7 +3587,13 @@ static int swap_show(struct seq_file *swap, void *v)
 	inuse = K(swap_usage_in_pages(si));
 
 	file = si->swap_file;
-	len = seq_file_path(swap, file, " \t\n\\");
+	if (file) {
+		len = seq_file_path(swap, file, " \t\n\\");
+	} else {
+		/* The file-less xswap device; one per system. */
+		len = strlen(XSWAP_NAME);
+		seq_puts(swap, XSWAP_NAME);
+	}
 	seq_printf(swap, "%*s%s\t%lu\t%s%lu\t%s%d\n",
 			len < 40 ? 40 - len : 1, " ",
 			swap_type_str(si),
@@ -3874,7 +3907,7 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 		/* xswap: only cluster 0 slot 0 is bad */
 		err = swap_cluster_setup_bad_slot(si, cluster_info, 0, false);
 		if (err)
-			goto err_free_vm;
+			goto err_unmap;
 
 		INIT_LIST_HEAD(&si->free_clusters);
 		INIT_LIST_HEAD(&si->full_clusters);
@@ -3903,6 +3936,9 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 
 		return 0;
 
+err_unmap:
+		/* swap_cluster_setup_bad_slot() allocates cluster 0's table. */
+		swap_cluster_free_table(&si->cluster_info[0]);
 err_free_vm:
 		vfree(si->cluster_info);
 		si->cluster_vm = NULL;
@@ -3985,6 +4021,117 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 	return err;
 }
 
+#ifdef CONFIG_XSWAP
+/*
+ * Create the file-less xswap device, sized at twice RAM.  Called from
+ * swapon(2) with SWAP_FLAG_XSWAP; there is at most one device per system.
+ */
+static int xswap_create(int prio)
+{
+	struct swap_info_struct *si;
+	unsigned long ram, maxpages;
+	unsigned int type;
+	int error;
+
+	mutex_lock(&xswap_ctl_lock);
+
+	spin_lock(&swap_lock);
+	for (type = 0; type < nr_swapfiles; type++) {
+		struct swap_info_struct *q = swap_info[type];
+
+		if (q && (q->flags & SWP_XSWAP)) {
+			spin_unlock(&swap_lock);
+			error = -EBUSY;
+			goto out;
+		}
+	}
+	spin_unlock(&swap_lock);
+
+	si = alloc_swap_info();
+	if (IS_ERR(si)) {
+		error = PTR_ERR(si);
+		goto out;
+	}
+
+	INIT_WORK(&si->discard_work, swap_discard_work);
+	INIT_WORK(&si->reclaim_work, swap_reclaim_work);
+
+	ram = totalram_pages();
+	maxpages = min_t(unsigned long, ram * 2, swapfile_maximum_size);
+	/* A cluster index is an unsigned int, so cap the cluster count. */
+	if (maxpages / SWAPFILE_CLUSTER > UINT_MAX)
+		maxpages = (unsigned long)UINT_MAX * SWAPFILE_CLUSTER;
+	/* Cluster-aligned, so no cluster holds a slot past si->max. */
+	if (maxpages > SWAPFILE_CLUSTER)
+		maxpages = rounddown(maxpages, SWAPFILE_CLUSTER);
+	if (maxpages < 2)
+		maxpages = 2;
+
+	si->bdev = NULL;
+	si->swap_file = NULL;
+	si->flags |= SWP_XSWAP | SWP_SOLIDSTATE;
+	si->max = maxpages;
+	si->pages = maxpages - 1;
+	/*
+	 * setup_swap_extents() is file-only, so set ops here; only
+	 * ops->flags is used, and the IO methods are never called.
+	 */
+	si->ops = &swap_bdev_ops;
+
+	error = setup_swap_clusters_info(si, NULL, maxpages);
+	if (error)
+		goto bad_swap;
+
+	error = zswap_swapon(si->type, si->max);
+	if (error)
+		goto bad_swap;
+
+	mutex_lock(&swapon_mutex);
+	si->prio = prio;
+	si->list.prio = -si->prio;
+	si->avail_list.prio = -si->prio;
+	enable_swap_info(si);
+	pr_info("xswap: adding extendable swap device %s (prio %d, %lu pages)\n",
+		XSWAP_NAME, prio, si->pages);
+	mutex_unlock(&swapon_mutex);
+	atomic_inc(&proc_poll_event);
+	wake_up_interruptible(&proc_poll_wait);
+
+	error = 0;
+out:
+	mutex_unlock(&xswap_ctl_lock);
+	return error;
+
+bad_swap:
+	kfree(si->global_cluster);
+	si->global_cluster = NULL;
+	destroy_swap_extents(si, NULL);	/* safe: xswap never sets SWP_ACTIVATED */
+	free_swap_cluster_info(si);
+	si->cluster_info = NULL;
+	spin_lock(&swap_lock);
+	si->flags = 0;
+	spin_unlock(&swap_lock);
+	goto out;
+}
+
+/* A name, not a path: only -ENOENT from opening it gets here. */
+static int xswap_create_by_name(const char *name, int swap_flags)
+{
+	int prio = DEF_XSWAP_PRIO;
+
+	if (strcmp(name, XSWAP_NAME))
+		return -ENOENT;
+
+	if (swap_flags & (SWAP_FLAG_DISCARD | SWAP_FLAG_DISCARD_ONCE |
+			  SWAP_FLAG_DISCARD_PAGES))
+		return -EINVAL;
+	if (swap_flags & SWAP_FLAG_PREFER)
+		prio = swap_flags & SWAP_FLAG_PRIO_MASK;
+
+	return xswap_create(prio);
+}
+#endif /* CONFIG_XSWAP */
+
 SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 {
 	struct swap_info_struct *si;
@@ -4007,26 +4154,36 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
+	CLASS(filename, name)(specialfile);
+	if (IS_ERR(name))
+		return PTR_ERR(name);
+
+	swap_file = file_open_name(name, O_RDWR | O_LARGEFILE | O_EXCL, 0);
+	if (IS_ERR(swap_file)) {
+		error = PTR_ERR(swap_file);
+		/*
+		 * Only -ENOENT is the request name; a file of that name
+		 * keeps precedence, as it does for swapoff.
+		 */
+		if (error == -ENOENT)
+			return xswap_create_by_name(name->name, swap_flags);
+		return error;
+	}
+
 	/*
 	 * Allocate or reuse existing !SWP_USED swap_info. The returned
 	 * si will stay in a dying status, so nothing will access its content
 	 * until enable_swap_info resurrects its percpu ref and expose it.
 	 */
 	si = alloc_swap_info();
-	if (IS_ERR(si))
+	if (IS_ERR(si)) {
+		filp_close(swap_file, NULL);
 		return PTR_ERR(si);
+	}
 
 	INIT_WORK(&si->discard_work, swap_discard_work);
 	INIT_WORK(&si->reclaim_work, swap_reclaim_work);
 
-	CLASS(filename, name)(specialfile);
-	swap_file = file_open_name(name, O_RDWR | O_LARGEFILE | O_EXCL, 0);
-	if (IS_ERR(swap_file)) {
-		error = PTR_ERR(swap_file);
-		swap_file = NULL;
-		goto bad_swap;
-	}
-
 	mapping = swap_file->f_mapping;
 	dentry = swap_file->f_path.dentry;
 	inode = mapping->host;
-- 
2.54.0

