Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351220;
	b=o3efAKl87uCasuXqJ6Vg6hB3Z0W0MFkqhMih+JWS6zClmj/3NmfEkj76tfFWsNlw7p1D
	 HI78YQDYOM1QLib+KOg1Y2vPlT4GA5YmtdFI9YOBVA+8Wn8eM/GSQET53yxW6ukEk5q6d
	 meVszXuRZH1FWfp1bja9/FjtcMKd8WXcJpqvTe2wu5kXjH9IxDVBxLnOiHYFGRssn6wnh
	 RyOXV313J6o9WtsJHuqdnNd0kGzqhh5fjBLFG6NlM7Wmzgte7pcOka5D3VC4xsfEwpzIJ
	 fB5IkRBVpVPlFLSdYS7eFKwTaguOSd3Laf8dWfDNpuiUJzsQIaEd8QzPIe2eNQToSGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351220;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=3jicttz2Tug0UUdMEWKxEL9xaUFc72lSiLZb3dvi//0=;
	b=DCh3VuEycwhfZAJv0c2adnQFXUo0NYUq0JCryIFKtnq3+iq03O+rj2NzkHCP8CiYk6UW
	 iOtqlBbfcsDJrmfdQc+1+DHadxocN2+ZTo+48wI4M9Ytfy7NCMEmSqciLwSDqVFBlvylP
	 pAxfAuVBrRN6JRTp8W6QRtd9sAiI1KYaGjuLeXwbeshhfuWV0HF/kF3eEPl5J0dnYWEdd
	 /mrypMeSTf72T8bWq4tZk2dyFHnN7H3hDQs17fHSaHHotfbBhbhTPb5wX25r2pgNgrnEW
	 dr7+Xm7F0603iD5jZszzTeiEzhtPcO1SxhTxh+dJydqth4XbN65gAxheL1pwBGFWb7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NI6ICxEi;
	arc=none smtp.remote-ip=91.218.175.31
Received: from mta0.migadu.com (out-31.mta0.migadu.com [91.218.175.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61130606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61130606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NI6ICxEi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lU3NtvInReBUN7t36yriG8+GIjDSPYq4yW2yNxHwl2Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795351217; v=1; x=1795956017;
 b=NI6ICxEifkvVz15JSa2vcrzPI1NZdx7UcvTGbckscY/36ndz/paAOEFdRQSnPmHdkRxrDyYa
 JpaJR4temHfDmouXrbTbtSbOiph6Q9076vvoAh+dh2sRx0v/t6GvBUYIxukmkMB8t3B6OtuMqaZ
 wyzwUU5VSxXuUdVNumMXzy+o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 4c85a421546913a1;
	Sun, 22 Nov 2026 12:40:15 +0000
X-Mizu-Trace-ID: 4c85a421546913a1
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
Subject: [PATCH v6 05/14] mm, swap: widen swap_info_struct max/pages to unsigned long
Date: Sun, 22 Nov 2026 20:39:09 +0800
Message-ID: <20261122123918.3486916-6-baoquan.he@linux.dev>
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

si->max and si->pages are unsigned int. With 4 KiB pages, this limits
an xswap device to 16 TB, and xswap may need a larger address space.
Change both fields to unsigned long, together with the offsets and
indexes that carry them.

A real swap device is still limited by swap_header.info.last_page,
which is __u32, so this only widens the xswap address space. The old
overflow clamp in read_swap_header() is no longer needed; the header
check still limits real devices.

count_swap_pages() returns unsigned int and is only used by
hibernation, which never selects an xswap device. If that ever
changes, WARN and return 0 instead of silently truncating the value.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |  4 ++--
 mm/swapfile.c        | 57 +++++++++++++++++++++++---------------------
 2 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 4a30cf7ee186..6747b577c405 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -240,7 +240,7 @@ struct swap_info_struct {
 	signed short	prio;		/* swap priority of this type */
 	struct plist_node list;		/* entry in swap_active_head */
 	signed char	type;		/* strange name for an index */
-	unsigned int	max;		/* size of this swap device */
+	unsigned long	max;		/* size of this swap device */
 	struct swap_cluster_info *cluster_info; /* array, one entry per cluster */
 #ifdef CONFIG_XSWAP
 	struct vm_struct	*cluster_vm;	/* VM_SPARSE | VM_ALLOC area */
@@ -254,7 +254,7 @@ struct swap_info_struct {
 					/* list of cluster that contains at least one free slot */
 	struct list_head frag_clusters[SWAP_NR_ORDERS];
 					/* list of cluster that are fragmented or contented */
-	unsigned int pages;		/* total of usable pages of swap */
+	unsigned long pages;		/* total of usable pages of swap */
 	atomic_long_t inuse_pages;	/* number of those currently in use */
 	struct swap_sequential_cluster *global_cluster; /* Use one global cluster for rotating device */
 	spinlock_t global_cluster_lock;	/* Serialize usage of global cluster */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index de2feaa2a628..912cfa68ba01 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -412,10 +412,10 @@ static inline unsigned int cluster_index(struct swap_info_struct *si,
 	return ci - si->cluster_info;
 }
 
-static inline unsigned int cluster_offset(struct swap_info_struct *si,
-					  struct swap_cluster_info *ci)
+static inline unsigned long cluster_offset(struct swap_info_struct *si,
+					   struct swap_cluster_info *ci)
 {
-	return cluster_index(si, ci) * SWAPFILE_CLUSTER;
+	return (unsigned long)cluster_index(si, ci) * SWAPFILE_CLUSTER;
 }
 
 static void swap_cluster_free_table_folio_rcu_cb(struct rcu_head *head)
@@ -863,7 +863,7 @@ static int swap_cluster_setup_bad_slot(struct swap_info_struct *si,
 
 	/* si->max may got shrunk by swap swap_activate() */
 	if (offset >= si->max && !mask) {
-		pr_debug("Ignoring bad slot %u (max: %u)\n", offset, si->max);
+		pr_debug("Ignoring bad slot %u (max: %lu)\n", offset, si->max);
 		return 0;
 	}
 	/*
@@ -1045,11 +1045,12 @@ static bool swap_prefer_free_cluster(struct swap_info_struct *si)
 }
 
 /* Try use a new cluster for current CPU and allocate from it. */
-static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
-					    struct swap_cluster_info *ci,
-					    struct folio *folio, unsigned long offset)
+static unsigned long alloc_swap_scan_cluster(struct swap_info_struct *si,
+					     struct swap_cluster_info *ci,
+					     struct folio *folio,
+					     unsigned long offset)
 {
-	unsigned int next = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
+	unsigned long next = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
 	unsigned long start = ALIGN_DOWN(offset, SWAPFILE_CLUSTER);
 	unsigned int order = likely(folio) ? folio_order(folio) : 0;
 	unsigned long end = start + SWAPFILE_CLUSTER;
@@ -1096,12 +1097,12 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 	return found;
 }
 
-static unsigned int alloc_swap_scan_list(struct swap_info_struct *si,
-					 struct list_head *list,
-					 struct folio *folio,
-					 bool scan_all)
+static unsigned long alloc_swap_scan_list(struct swap_info_struct *si,
+					  struct list_head *list,
+					  struct folio *folio,
+					  bool scan_all)
 {
-	unsigned int found = SWAP_ENTRY_INVALID;
+	unsigned long found = SWAP_ENTRY_INVALID;
 
 	do {
 		struct swap_cluster_info *ci = isolate_lock_cluster(si, list);
@@ -1184,7 +1185,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 {
 	struct swap_cluster_info *ci;
 	unsigned int order = likely(folio) ? folio_order(folio) : 0;
-	unsigned int offset = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
+	unsigned long offset = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
 
 	/*
 	 * Swapfile is not block device so unable
@@ -1454,7 +1455,7 @@ static bool swap_alloc_fast(struct folio *folio)
 	unsigned int order = folio_order(folio);
 	struct swap_cluster_info *ci;
 	struct swap_info_struct *si;
-	unsigned int offset;
+	unsigned long offset;
 
 	/*
 	 * Once allocated, swap_info_struct will never be completely freed,
@@ -2559,9 +2560,15 @@ unsigned int count_swap_pages(int type, int free)
 
 		spin_lock(&sis->lock);
 		if (sis->flags & SWP_WRITEOK) {
-			n = sis->pages;
-			if (free)
-				n -= swap_usage_in_pages(sis);
+			/* Hibernation only; it never selects an xswap device. */
+			if (unlikely(sis->flags & SWP_XSWAP)) {
+				WARN_ON_ONCE(1);
+				n = 0;
+			} else {
+				n = sis->pages;
+				if (free)
+					n -= swap_usage_in_pages(sis);
+			}
 		}
 		spin_unlock(&sis->lock);
 	}
@@ -2882,8 +2889,8 @@ static int unuse_mm(struct mm_struct *mm, unsigned int type)
  * Return 0 if there are no inuse entries after prev till end of
  * the map.
  */
-static unsigned int find_next_to_unuse(struct swap_info_struct *si,
-					unsigned int prev)
+static unsigned long find_next_to_unuse(struct swap_info_struct *si,
+					unsigned long prev)
 {
 	struct swap_cluster_info *ci;
 	unsigned long i, cluster_end, end;
@@ -2953,7 +2960,7 @@ static int try_to_unuse(unsigned int type)
 	struct swap_info_struct *si = swap_info[type];
 	struct folio *folio;
 	swp_entry_t entry;
-	unsigned int i;
+	unsigned long i;
 
 	if (!swap_usage_in_pages(si))
 		goto success;
@@ -3767,12 +3774,8 @@ static unsigned long read_swap_header(struct swap_info_struct *si,
 		pr_warn("Truncating oversized swap area, only using %luk out of %luk\n",
 			K(maxpages), K(last_page));
 	}
-	if (maxpages > last_page) {
+	if (maxpages > last_page)
 		maxpages = last_page + 1;
-		/* p->max is an unsigned int: don't overflow it */
-		if ((unsigned int)maxpages == 0)
-			maxpages = UINT_MAX;
-	}
 
 	if (!maxpages)
 		return 0;
@@ -4086,7 +4089,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		goto bad_swap_unlock_inode;
 	}
 	if (si->pages != si->max - 1) {
-		pr_err("swap:%u != (max:%u - 1)\n", si->pages, si->max);
+		pr_err("swap:%lu != (max:%lu - 1)\n", si->pages, si->max);
 		error = -EINVAL;
 		goto bad_swap_unlock_inode;
 	}
-- 
2.54.0

