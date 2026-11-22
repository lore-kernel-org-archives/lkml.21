Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351706;
	b=AsGdF8o3/DMF1eWx/NYklbyxgt0wC7upm7ty3AnAFNAH7QUDD5ZAPUdiiYe8RVDIdOzH
	 Wzo+kjdj0kaP4ecETSrr5he5+DWg6lUJbzVNwz1pSOtv7SEJdV7nf6ASbZy04n+hvYcY2
	 RWYStxjayFPh0R6PheUQIcF97Kwt+bYWe9bnkhbvmlYHf4i1udO4XjCLhFR8/83+zGZr1
	 Z1/Xp0spIHH+b6BxTQ/5UPga/6Y1W3AQrp14SODJ/HQwSYnYtecpi4c3nTdG0CBjJoHou
	 H8CX/AhaFxnEVqNyvoTg/yR1rHGEZR7cRppGZsUhQdyjPWLsVukNAaD9v+tDIyKQBqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351706;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=SKq4d78n01SVC2VW19hE1ndR5ln/BxTtcRQujOEifIQ=;
	b=J69jBA6CEY6gwSnRK9L7RhzPCFZ+UfcMFC0YFdv0BMWV1oBevMyE1dLcn54yM+lT2yJo
	 AnFqf91Yw4hCSutPrUvOv/fitgnaDayqMMWTyJZSFJWQsyQBZCm0oBveFHHkSkT66qMr5
	 dbgctIFQVeixWcD11jM3eZFc1tbokLIlwxye4J+UqQV1tjtW6+OJ+9b3VZ4gICyQrsCeT
	 wLt0iQOrXBTmB9Bi55uucgqSEIHSEMl2oJNpK7ug0H9IPBMYfjjJWKZrxyvCG5f5b0dLV
	 yKecsRFJSfnXEpapLvGEvCylULrDsNN3p+im1rzYkXl6LIjqv5mzcYTRYk6dSwP1ohw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SvdpW7rk;
	arc=none smtp.remote-ip=95.215.58.204
Received: from mta1.migadu.com (out-204.mta1.migadu.com [95.215.58.204])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A94606A684
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A94606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SvdpW7rk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ujquToUOLxKJlHHoO0pZiNh3GDpoieF8dRRQL2lLvKg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795351703; v=1; x=1795956503;
 b=SvdpW7rk2TsOJZhrK1pwrudM8iJbm3T238k/Cdbw82s6bz5PRZde/dfs+MTaYrCy45CBwXHj
 31DsW/LdjeHmm7AwpsFD6OSdxtnRAqwjiyIjqRtGMkkssLKmIB00dxMtTLNZ1gb0g8eRLump2pd
 bahFe4WtbcyRaKVLgUwe7n6Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 92e1b5d813bb7811;
	Sun, 22 Nov 2026 12:48:23 +0000
X-Mizu-Trace-ID: 92e1b5d813bb7811
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
Subject: [PATCH v6 10/14] mm, swap: add CONFIG_XSWAP_DEFAULT_MAX
Date: Sun, 22 Nov 2026 20:48:10 +0800
Message-ID: <20261122124814.3489077-1-baoquan.he@linux.dev>
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

Add a build-time default for the size of a new xswap device.  The value
can be a percentage of RAM, a size in bytes, or "max".  "max" means the
largest size the device can address.  xswap.max= on the command line
overrides this default.

The build-time default is clamped to the device limit.  An explicit
xswap.max= that is too large is refused.

If the build-time default cannot be parsed, or is a byte size below one
cluster, use 200% instead.  A percentage default can still be below one
cluster after RAM is known.  In that case, device creation fails.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 .../admin-guide/kernel-parameters.txt         |  6 ++--
 mm/Kconfig                                    | 11 ++++++
 mm/swapfile.c                                 | 34 ++++++++++++-------
 3 files changed, 37 insertions(+), 14 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 9928f0937514..06d37212399f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8733,8 +8733,10 @@ Kernel parameters
 			off	xmon is disabled.
 
 	xswap.max=	[KNL,SWAP]
-			Maximum size of a new xswap device. The value is a
+			Maximum size of a new xswap device, which is created
+			with swapon(2) and the spec "xswap". The value is a
 			size in bytes with an optional KMGTPE suffix, a
 			percentage of RAM, or "max" for the largest size
-			the device can address.
+			the device can address. The default is set by
+			CONFIG_XSWAP_DEFAULT_MAX.
 			Format: <size>[KMGTPE] | <percent>% | max
diff --git a/mm/Kconfig b/mm/Kconfig
index a8707bbd8d62..f13639a811e2 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -131,6 +131,17 @@ config XSWAP
 	  array is backed by a sparse vmalloc area that is mapped lazily
 	  in chunks, avoiding static pre-allocation overhead.
 
+config XSWAP_DEFAULT_MAX
+	string "Default maximum size of a new xswap device"
+	depends on XSWAP
+	default "200%"
+	help
+	  The maximum size of a newly created xswap device. It accepts a
+	  percentage of RAM (for example "200%"), a size (for example "2T"),
+	  or "max" for the largest size the device can address.
+
+	  xswap.max= on the kernel command line overrides this value.
+
 config ZSMALLOC
 	tristate
 
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 6ce5dbb3b103..074c5114d129 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -77,9 +77,9 @@ static int xswap_destroy_by_name(const char *name);
 static DEFINE_MUTEX(xswap_ctl_lock);
 
 /*
- * Size of a new device: xswap.max= if given, otherwise the built-in
- * default.  A percentage unless bytes is set; "max" asks for the largest
- * size the device can address.
+ * Size of a new device: xswap.max= if given, otherwise
+ * CONFIG_XSWAP_DEFAULT_MAX.  A percentage unless bytes is set; "max" asks
+ * for the largest size the device can address.
  */
 static unsigned int xswap_size_pct = 200;
 static unsigned long xswap_size_bytes;
@@ -87,9 +87,12 @@ static bool xswap_size_max;
 static bool xswap_size_set;	/* xswap.max= was given */
 
 /*
- * Parse "200%", "2T" or "max".  @str is not modified.
+ * Parse "200%", "2T" or "max". @str is not modified. @cmdline tells an
+ * explicit xswap.max= from the build-time default, which is clamped
+ * instead of refused when it is too large.
  */
-static int __init xswap_parse_size(const char *str, const char *what)
+static int __init xswap_parse_size(const char *str, const char *what,
+				   bool cmdline)
 {
 	const char *pct;
 	char buf[16];
@@ -118,12 +121,16 @@ static int __init xswap_parse_size(const char *str, const char *what)
 		bytes = memparse(str, &end);
 		if (*end || bytes < PAGE_SIZE)
 			goto bad;
+		/* A default below one cluster would fail every create. */
+		if (!cmdline && bytes < (unsigned long)SWAPFILE_CLUSTER * PAGE_SIZE)
+			goto bad;
 		xswap_size_bytes = bytes;
 		xswap_size_pct = 0;
 		xswap_size_max = false;
 	}
 
-	xswap_size_set = true;
+	if (cmdline)
+		xswap_size_set = true;
 	return 0;
 bad:
 	pr_err("xswap: bad %s=%s\n", what, str);
@@ -132,7 +139,7 @@ static int __init xswap_parse_size(const char *str, const char *what)
 
 static int __init xswap_max_setup(char *str)
 {
-	xswap_parse_size(str, "xswap.max");
+	xswap_parse_size(str, "xswap.max", true);
 	return 1;
 }
 __setup("xswap.max=", xswap_max_setup);
@@ -4175,11 +4182,7 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 }
 
 #ifdef CONFIG_XSWAP
-/*
- * Create the file-less xswap device, sized by xswap.max= or the built-in
- * default.  Called from swapon(2) with SWAP_FLAG_XSWAP; there is at most
- * one device per system.
- */
+/* Create the file-less xswap device from swapon(2). */
 static int xswap_create(int prio)
 {
 	struct swap_info_struct *si;
@@ -4694,6 +4697,13 @@ static int __init swapfile_init(void)
 {
 	swapfile_maximum_size = arch_max_swapfile_size();
 
+#ifdef CONFIG_XSWAP
+	/* xswap.max= on the command line overrides the build-time default. */
+	if (!xswap_size_set)
+		xswap_parse_size(CONFIG_XSWAP_DEFAULT_MAX,
+				 "CONFIG_XSWAP_DEFAULT_MAX", false);
+#endif
+
 	/*
 	 * Once a cluster is freed, it's swap table content is read
 	 * only, and all swap cache readers (swap_cache_*) verifies
-- 
2.54.0

