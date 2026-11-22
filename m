Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351257;
	b=YkbD40kYsvmcEn1J3YrriSjdmWmNKNCPRmV38nxY7oBOGBN7YZz6VdUaiCZcLXbnx18S
	 v66JxNtMNcDatEqlXyXgB3TEvnq10cbKEJxOsEu5ZoCk3VIlDvE/gLH2MN6mK8XTFfoNH
	 C4WAstg5mqXI5uNebpii0CG0wh3HCvlKSxIK6duqCQ1VLspar19KMccbkJvJ03DYROptt
	 2Okz7VlhiCEIuHpDeGFolHX2m94iwkMPDp4vPtfGckp2xkVDlEhdA5hu9kYhyszrb44MU
	 WE16TnSldXIlkMVSVl0xUTrq4OcOmSFndvHzVc1gWGvx/iq8AbTzC8Cf1Z9O4406txA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351257;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=xpa97AJSETU/USrlzLhbXofN2h+6mzWI9qJO3gzBWbY=;
	b=et/+Ukj5bZKOCFAvD1pBNcMQBrBqt0F4hDJZ9bYpad73vzc/8vzPkFHOY6T/XU0sjohR
	 1DZPiwwjQtGHrNAH/RUM8G7/qdLtLvLd4TWSU0tQ/sfpmB1ookOjSboGM0E27SsAiNF6d
	 xJ71CKRPHmbya7XM47uGyC1ZzAZ4yip93zY/36RSJNacahoCwci3xdKH8ygNvuorAIKWF
	 HEgD/od+/uZIRzGmTl4SUikegyL4MVk0E8YWid6PoUKCgAgROTSGATvy7p945nJtHZ8zB
	 K/zKNiwwBv1Y/9WhVRAboEQBqp64sUeCPAGqqedVDeXFGQw+DJCXZkxgLZiKWtLi0XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="t/E3vIXm";
	arc=none smtp.remote-ip=95.215.58.150
Received: from mta1.migadu.com (out-150.mta1.migadu.com [95.215.58.150])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BEA606A332
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15BEA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t/E3vIXm
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YVRaYa2pvbDkVtOXVPQLtBRt3ZcLmHbUK9ZifXUzKRg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795351254; v=1; x=1795956054;
 b=t/E3vIXma+K0xuC2Bf08Mg3sEUhToG+VPykE6O8bkBGPI21FD7htDyIpZWERXF0AsMkBK1ox
 C3csbZctlrlhmGtK97ljJQigORedfsuD85sr2P5z9pBO5tKCa0QRlNPGUklZ9+8yguVtiwLQL6z
 X3IK2JGA59s/H2//KZlcQ4H8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 2b4268fdca5fad66;
	Sun, 22 Nov 2026 12:40:54 +0000
X-Mizu-Trace-ID: 2b4268fdca5fad66
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
Subject: [PATCH v6 09/14] mm, swap: let the command line set the xswap device size
Date: Sun, 22 Nov 2026 20:39:13 +0800
Message-ID: <20261122123918.3486916-10-baoquan.he@linux.dev>
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

By default, a new xswap device is 200% of RAM, which is twice RAM.
Add xswap.max= to set the size of devices created after it:

  xswap.max=300%      three times RAM
  xswap.max=8G        eight GiB
  xswap.max=max       the largest size the device can address

The default is fine for most users. But a machine with a lot of RAM
and a small working set can get a SwapTotal much larger than it needs.

The size is resolved at device creation, not at parameter parsing,
because a percentage depends on RAM, which is not known yet when the
parameters are parsed.

An explicit size that is too large or overflows is refused; the default
is clamped instead. A size below one cluster is also refused.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 .../admin-guide/kernel-parameters.txt         |   7 +
 mm/swapfile.c                                 | 135 ++++++++++++++++--
 2 files changed, 130 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec..9928f0937514 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8731,3 +8731,10 @@ Kernel parameters
 				memory, and other data can't be written using
 				xmon commands.
 			off	xmon is disabled.
+
+	xswap.max=	[KNL,SWAP]
+			Maximum size of a new xswap device. The value is a
+			size in bytes with an optional KMGTPE suffix, a
+			percentage of RAM, or "max" for the largest size
+			the device can address.
+			Format: <size>[KMGTPE] | <percent>% | max
diff --git a/mm/swapfile.c b/mm/swapfile.c
index ba899e349e99..6ce5dbb3b103 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -14,6 +14,7 @@
 #include <linux/mman.h>
 #include <linux/slab.h>
 #include <linux/kernel_stat.h>
+#include <linux/overflow.h>
 #include <linux/swap.h>
 #include <linux/vmalloc.h>
 #include <linux/pagemap.h>
@@ -74,6 +75,102 @@ static int xswap_destroy_by_name(const char *name);
 
 /* Serializes create and destroy: at most one xswap device exists. */
 static DEFINE_MUTEX(xswap_ctl_lock);
+
+/*
+ * Size of a new device: xswap.max= if given, otherwise the built-in
+ * default.  A percentage unless bytes is set; "max" asks for the largest
+ * size the device can address.
+ */
+static unsigned int xswap_size_pct = 200;
+static unsigned long xswap_size_bytes;
+static bool xswap_size_max;
+static bool xswap_size_set;	/* xswap.max= was given */
+
+/*
+ * Parse "200%", "2T" or "max".  @str is not modified.
+ */
+static int __init xswap_parse_size(const char *str, const char *what)
+{
+	const char *pct;
+	char buf[16];
+	unsigned int pct_val;
+	unsigned long bytes;
+	char *end;
+
+	pct = strchr(str, '%');
+	if (!strcmp(str, "max")) {
+		xswap_size_max = true;
+		xswap_size_pct = 0;
+		xswap_size_bytes = 0;
+	} else if (pct) {
+		size_t len = pct - str;
+
+		if (pct[1] || !len || len >= sizeof(buf))
+			goto bad;
+		memcpy(buf, str, len);
+		buf[len] = '\0';
+		if (kstrtouint(buf, 0, &pct_val) || !pct_val)
+			goto bad;
+		xswap_size_pct = pct_val;
+		xswap_size_bytes = 0;
+		xswap_size_max = false;
+	} else {
+		bytes = memparse(str, &end);
+		if (*end || bytes < PAGE_SIZE)
+			goto bad;
+		xswap_size_bytes = bytes;
+		xswap_size_pct = 0;
+		xswap_size_max = false;
+	}
+
+	xswap_size_set = true;
+	return 0;
+bad:
+	pr_err("xswap: bad %s=%s\n", what, str);
+	return -EINVAL;
+}
+
+static int __init xswap_max_setup(char *str)
+{
+	xswap_parse_size(str, "xswap.max");
+	return 1;
+}
+__setup("xswap.max=", xswap_max_setup);
+
+/*
+ * The most a device can address, whatever xswap.max= asked for.  An xswap
+ * slot is still a swap entry, so the swap offset limit applies even though
+ * the data never goes through a physical address.
+ */
+static unsigned long xswap_size_limit(void)
+{
+	unsigned long limit = swapfile_maximum_size;
+
+	/* A cluster index is an unsigned int. */
+	if (limit / SWAPFILE_CLUSTER > UINT_MAX)
+		limit = (unsigned long)UINT_MAX * SWAPFILE_CLUSTER;
+
+	return limit;
+}
+
+static unsigned long xswap_size_pages(void)
+{
+	unsigned long long pages;
+
+	if (xswap_size_max)
+		return xswap_size_limit();
+
+	if (xswap_size_bytes)
+		return xswap_size_bytes >> PAGE_SHIFT;
+
+	/* Let xswap_create() refuse a size that does not fit in the type. */
+	if (check_mul_overflow((unsigned long long)totalram_pages(),
+			       (unsigned long long)xswap_size_pct, &pages))
+		return ULONG_MAX;
+
+	return div_u64(pages, 100);
+}
+
 #else /* !CONFIG_XSWAP */
 static inline int xswap_create_by_name(const char *name, int swap_flags)
 {
@@ -4079,13 +4176,15 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 
 #ifdef CONFIG_XSWAP
 /*
- * Create the file-less xswap device, sized at twice RAM.  Called from
- * swapon(2) with SWAP_FLAG_XSWAP; there is at most one device per system.
+ * Create the file-less xswap device, sized by xswap.max= or the built-in
+ * default.  Called from swapon(2) with SWAP_FLAG_XSWAP; there is at most
+ * one device per system.
  */
 static int xswap_create(int prio)
 {
 	struct swap_info_struct *si;
-	unsigned long ram, maxpages;
+	unsigned long maxpages;
+	unsigned long limit;
 	unsigned int type;
 	int error;
 
@@ -4093,6 +4192,26 @@ static int xswap_create(int prio)
 	if (!zswap_is_enabled())
 		return -EOPNOTSUPP;
 
+	/*
+	 * Refuse an explicitly requested size the device cannot address;
+	 * clamp the default size, which nobody asked for.
+	 */
+	limit = xswap_size_limit();
+	maxpages = xswap_size_pages();
+	if (xswap_size_set && maxpages > limit) {
+		pr_err("xswap: xswap.max is larger than the device can address\n");
+		return -EINVAL;
+	}
+	maxpages = min(maxpages, limit);
+	/*
+	 * Below one cluster, si->max is not cluster-aligned and a slot in
+	 * the only cluster would be past the end of the device.
+	 */
+	if (maxpages < SWAPFILE_CLUSTER) {
+		pr_err("xswap: the configured size is smaller than one cluster\n");
+		return -EINVAL;
+	}
+
 	mutex_lock(&xswap_ctl_lock);
 
 	spin_lock(&swap_lock);
@@ -4116,16 +4235,8 @@ static int xswap_create(int prio)
 	INIT_WORK(&si->discard_work, swap_discard_work);
 	INIT_WORK(&si->reclaim_work, swap_reclaim_work);
 
-	ram = totalram_pages();
-	maxpages = min_t(unsigned long, ram * 2, swapfile_maximum_size);
-	/* A cluster index is an unsigned int, so cap the cluster count. */
-	if (maxpages / SWAPFILE_CLUSTER > UINT_MAX)
-		maxpages = (unsigned long)UINT_MAX * SWAPFILE_CLUSTER;
 	/* Cluster-aligned, so no cluster holds a slot past si->max. */
-	if (maxpages > SWAPFILE_CLUSTER)
-		maxpages = rounddown(maxpages, SWAPFILE_CLUSTER);
-	if (maxpages < 2)
-		maxpages = 2;
+	maxpages = rounddown(maxpages, SWAPFILE_CLUSTER);
 
 	si->bdev = NULL;
 	si->swap_file = NULL;
-- 
2.54.0

