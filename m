Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.213
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351719;
	b=mOKmqykCO3vYJStXhc4cyy0Krva/tBFGd2CzEY66t/35bvW15nnVO+FKd0UxC427B9ow
	 xsbExinWJDKjLhveEcx/Q4aegrIjjeB4OtYqeXVaabja6rqqlYIm1EjFfI3JTHu5Z0+G5
	 GEUvw9a2uoP1rOXCWCjMTJ0URL4AdUobQHlfqw49R9l8zONwkNs+prJgWBOjF2u0LroF5
	 h74e7l9wP/nxw08TiTF6kUuH2mLsAAaGWqHY1fcq6seHY1Lm2kerKB6iy1UEBNl1Efl2M
	 cjD/7K4XhYUzfYKsSsu4lVt8wDDC8OUx2T4oEOnMi7LfLJCm87R9/rTivqWYsqSXJbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351719;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=F5mb4gMdHpZJzXBSqlC9XMwKzG9tss4cXHWRmV8y1PM=;
	b=1J0LH8wHPjW05LiQwuS52eAcliUGl7euOy5kcUR3DF2dRmIksTpZItH8OfcH2I8pUL6u
	 89U93GKp9ySHuc8zeATeFKXSi5rAEtOpez1X+tSHq2V5aDHRZhgw6Lv3tSXs7cNLU8tsX
	 g26s4wSgYQANTsrTMagtJObhHKLqg7fG8BhSqlSq3I/4L2pEP0/s/HWQLblWN9xGQuWbO
	 jeORLYWeJA1nsyx+Ad+ZHgFJHxAelVGn2Ib4j/K+wplXnAVOuaP/LdNdYa0/iZJIwI9vi
	 7gOWATRm+uNIBGfD1I1FIngYnpYEUkWEFUP7hClxbkMv6j1ylRkg0m35rzhuBihu+bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wIv8JrBS;
	arc=none smtp.remote-ip=95.215.58.213
Received: from mta1.migadu.com (out-213.mta1.migadu.com [95.215.58.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CDB606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76CDB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wIv8JrBS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YOz2z0C4QkUvUxcWScNP+zuGI/wOQjQ7nmeOF1TvXg4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795351715; v=1; x=1795956515;
 b=wIv8JrBSzJbYyBqX16QI25gcj6x5fvvB4IF5tqqDY8a6ZPCh6K1z3aZmw6W+ZS4SduaN/ulf
 oL5QJ4iKlUsiEBn3rK2DGOXRrIDEP3qlqAswVLC2QVM6WObAfN4oOesN8xGVSUfyTjALbTqKHWQ
 e07Dg9LGlgDkbwMQcmhdOOLk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 6a9c451795a40c91;
	Sun, 22 Nov 2026 12:48:34 +0000
X-Mizu-Trace-ID: 6a9c451795a40c91
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
Subject: [PATCH v6 12/14] mm, swap: add debugfs counters for xswap
Date: Sun, 22 Nov 2026 20:48:12 +0800
Message-ID: <20261122124814.3489077-3-baoquan.he@linux.dev>
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

The mapped range and the grow count are not visible from userspace.
This makes it hard to check if the grow thresholds work: we cannot see
how large the mapped range is, how much it grows, or how much free tail
it keeps.

Put this information in debugfs. It is a debugging aid, not a stable
interface, so it does not belong in sysfs or the ABI:

  # cat /sys/kernel/debug/xswap/xswap.stats
  type 0
  clusters_max 2038783
  clusters_mapped 255
  usage_pages 91456
  tail_free 16
  grows 3

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |  1 +
 mm/swapfile.c        | 69 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 5d9e5b6f2bd6..9daf0ac40c39 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -246,6 +246,7 @@ struct swap_info_struct {
 	unsigned long		nr_clusters_max;/* total clusters in the xswap address space */
 	unsigned long		nr_clusters_mapped; /* currently mapped cluster count */
 	struct mutex		xswap_lock;	/* serialize map/unmap operations */
+	struct dentry		*xswap_debugfs;	/* mapped range and counters */
 	atomic_long_t		xswap_grows;	/* grow operations so far */
 #endif
 	struct list_head free_clusters; /* free clusters list */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 213b66bb1d6d..462efeef887a 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -43,12 +43,14 @@
 #include <linux/suspend.h>
 #include <linux/zswap.h>
 #include <linux/plist.h>
+#include <linux/debugfs.h>
 
 #include <asm/tlbflush.h>
 #include <linux/leafops.h>
 #include "swap_table.h"
 #include "internal.h"
 #include "swap.h"
+
 #define DEF_SWAP_PRIO  -1
 
 /*
@@ -79,6 +81,7 @@
 
 static bool xswap_should_grow(struct swap_info_struct *si);
 static unsigned long xswap_grow(struct swap_info_struct *si);
+static void xswap_debugfs_del(struct swap_info_struct *si);
 static int xswap_map_clusters(struct swap_info_struct *si,
 			      unsigned long start_idx, unsigned long nr,
 			      bool link_free);
@@ -3455,6 +3458,7 @@ static void free_swap_cluster_info(struct swap_info_struct *si)
 			}
 			spin_unlock(&ci->lock);
 		}
+		xswap_debugfs_del(si);
 		vfree(si->cluster_info);
 		si->cluster_vm = NULL;
 		si->cluster_info = NULL;
@@ -4087,6 +4091,7 @@ static int xswap_map_clusters(struct swap_info_struct *si,
 	mutex_unlock(&si->xswap_lock);
 	return 0;
 }
+
 static bool xswap_should_grow(struct swap_info_struct *si)
 {
 	unsigned long mapped = READ_ONCE(si->nr_clusters_mapped);
@@ -4138,6 +4143,68 @@ static unsigned long xswap_grow(struct swap_info_struct *si)
 	return nr_new;
 }
 
+static ssize_t xswap_debugfs_read(struct file *file, char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	struct swap_info_struct *si = file->private_data;
+	struct swap_cluster_info *ci;
+	unsigned long mapped, tail = 0;
+	char tmp[192];
+	int len;
+
+	/*
+	 * Count the free clusters at the end of the mapped range.  The
+	 * xswap_lock keeps the range from moving under the scan.
+	 */
+	mutex_lock(&si->xswap_lock);
+	mapped = READ_ONCE(si->nr_clusters_mapped);
+	if (si->cluster_info) {
+		while (mapped - tail > 1) {
+			ci = &si->cluster_info[mapped - tail - 1];
+			if (READ_ONCE(ci->count) ||
+			    READ_ONCE(ci->flags) != CLUSTER_FLAG_FREE)
+				break;
+			tail++;
+		}
+	}
+	len = scnprintf(tmp, sizeof(tmp),
+			"type %d\nclusters_max %lu\nclusters_mapped %lu\nusage_pages %lu\ntail_free %lu\ngrows %lu\n",
+			si->type, READ_ONCE(si->nr_clusters_max), mapped,
+			swap_usage_in_pages(si), tail,
+			atomic_long_read(&si->xswap_grows));
+	mutex_unlock(&si->xswap_lock);
+
+	return simple_read_from_buffer(buf, count, ppos, tmp, len);
+}
+
+static const struct file_operations xswap_debugfs_fops = {
+	.read	= xswap_debugfs_read,
+	.open	= simple_open,
+	.llseek	= default_llseek,
+};
+
+static struct dentry *xswap_debugfs_root;
+
+static void xswap_debugfs_add(struct swap_info_struct *si)
+{
+	if (!xswap_debugfs_root)
+		xswap_debugfs_root = debugfs_create_dir("xswap", NULL);
+	if (IS_ERR_OR_NULL(xswap_debugfs_root))
+		return;
+
+	/* One device, so one file: /sys/kernel/debug/xswap/xswap.stats. */
+	si->xswap_debugfs = debugfs_create_file("xswap.stats", 0444,
+						xswap_debugfs_root, si,
+						&xswap_debugfs_fops);
+	if (IS_ERR(si->xswap_debugfs))
+		si->xswap_debugfs = NULL;
+}
+
+static void xswap_debugfs_del(struct swap_info_struct *si)
+{
+	debugfs_remove(si->xswap_debugfs);
+	si->xswap_debugfs = NULL;
+}
 #endif /* CONFIG_XSWAP */
 
 static int setup_swap_clusters_info(struct swap_info_struct *si,
@@ -4360,6 +4427,7 @@ static int xswap_create(int prio)
 	 */
 	si->ops = &swap_bdev_ops;
 
+	si->xswap_debugfs = NULL;
 	atomic_long_set(&si->xswap_grows, 0);
 
 	error = setup_swap_clusters_info(si, NULL, maxpages);
@@ -4371,6 +4439,7 @@ static int xswap_create(int prio)
 		goto bad_swap;
 
 	mutex_lock(&swapon_mutex);
+	xswap_debugfs_add(si);
 	si->prio = prio;
 	si->list.prio = -si->prio;
 	si->avail_list.prio = -si->prio;
-- 
2.54.0

