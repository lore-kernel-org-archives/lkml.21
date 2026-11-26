Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658392;
	b=eONQwZNl1vv7ns+cAFHJhaJdZ0CrBipddLGzSkHjRVzfgxxbJ3hIQ3W6/i24fxZUeErs
	 arvyV5lwjE7PLLd9QTZ8cwIOnXSm4ao3PEfBNspNg1oLcSqmhyf3u2DIi4WTkHwmVYYTl
	 2SabQjhgaASpfCRcySg058nmmwuUwKg1C5fXBZYpeoRN7y96hOtL+ixVPywq12VVv8Yb1
	 wp84NM5bX24uvc+pwgFe4m0czzm/XbS49lDo8cLSDD36EQsmDiCLSMrDKB33pfkVAwzqd
	 fh/gbjkKnBNyurpYnJJ9C5LkvoTgmmAd9JN3ibKdXap7plp7A673e567y6tbgpvgs1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cwYQ9S4xNOhgMpsr/2Fw0/uwY52gpltHLNu3ahogehA=;
	b=xMR4MfrQAlDWxXHo97MAmkpOT3UMaGGJXL+2xMuF/7mBK57rdvFCiOXfJIXqyfM7hvtx
	 nlzX9J2IYb3nW3ej6TEYiyRYxuyfYHm+yUSnB5XF9RgJ8hCUvN12KzGd5EJq/2GUZb+ul
	 zens2kveRACUi+cwU5bGmS6Oiy4zbBIb4sunQJd8FsNaXgZqgkNyo2MUhkjWTIa+YZECw
	 /aTx93fCmiDDVwAhb4J3GWi91TgXLsebK687olXmgDXYKC9/a+G6iVWlyWBtF+mAQKTZ0
	 fcVbOQel7lGAiPUXL3LAl7pc3Hk3e1xT2mxbwzvI10gSBlN2jouhPtudpCavMF5wx3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="VyH5ZPW/";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF2B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF2B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VyH5ZPW/
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso4488103a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795658391; x=1796263191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwYQ9S4xNOhgMpsr/2Fw0/uwY52gpltHLNu3ahogehA=;
        b=VyH5ZPW/di937qaf+QYD6ib8MkxkHDc4mCHkWBpY5RY/jGABHw8rWQPHapKW9puJc2
         e4mWvTsOemVXHeDlvCrgsq6qVEmCsMr/nZboKPp5HvfoHlb97Ogg2y8/TvYCLtb+vnCd
         NJ5PIaSEMKROT/sUMLWAaTAAXEWwR4IgEKnS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658391; x=1796263191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwYQ9S4xNOhgMpsr/2Fw0/uwY52gpltHLNu3ahogehA=;
        b=X4Sp0yCSYkQXZEh2vpnNbBcy7jdAvTEFKi8OR/HyZQlO6K9o0MrbPjUfjDLRyYCLja
         1gInOhfjjZUQv7pmNtLIitAOWWxVLrRxyXEWjZDHbU01O60dILkKxhGL/fINN/dpKtFh
         wH+w5JCDjmOh6ESvbADx3HO5QyS4CPkqjUTBA6ubE2omHU9B5HgaHxo9x7nilMji+BcQ
         bqKZbwrTbI5Rz9T7el8/WcZ6Lk0HtwjedHUxd367GVQS9+SZ6hDasVfLHxzTAxtLLl6X
         B9l+SS2T7mQIPm00xmtyhHX2O9P9JlzrHyMRkuYIVV1MFw0aTUDeeae0BRH6rK7qnUTa
         Rgxw==
X-Forwarded-Encrypted: i=1; AL+hErEeKlg+9HOv6s2C6pHEOzsSLE8+gP7fGdzt8qDA02SpnoTe6kHgyO6BAdQRl9szzKfCQZbALT7plJhM6Xg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HdBQ3ZgZCVuOWBimJNnypTKBL5gizV53VoYSqyegJ6+/hnpO5
	PhkFobdowNvf8K+2AsvNbBUjfoBaz8XzYwkMr+H3RDXHtTS5M6WKGzXNjB1FfbFACXZzrSZDpam
	LRw4=
X-Gm-Gg: AZFdTZfNasJ8xSrpQD6vvvRunxPzp57l34WWDHo0phI+cq7UrIEoC5hxQAzMbdCUovz
	LJBGVRByKHLhAtiOIsRYIDwP8FGWkc9Wpq+b9f/Xay9C6Fpzp4HA0O9MWVuj8R7T+TUrDkis+5I
	btnCYT1cpk3o5b3S4CKqlSCQhGjIR2AuGImIb9pn4UgTFA7QSRnb6P2fiGV/LkUubtb6CfTJzVN
	uSyqdq516hbBfMc1OVxUGnosCkgjV0PolKrmlgvkE4FsJy8HvifTYLrM8Vq8gOd0WPDi6rHGoYV
	Wl/n14okVHsV37TunlOeU6aplYrwl5kIKUdrmEuLwszFdeANvyKnQcD22X1dSiI67KDIJypWT0k
	OP59pTyi8AIJdTqnvls5j+FijfPnScD2tLUHFLsT+BAcvIvhlJv5xIdPGgxaQtolkoP1u6tMawo
	9l1uFnvzZA18qgxMpD6FLa7dQTaUrECmQmo7uF6qUqHk643pq8r/+1WotowjdxybkbfEzJGaB1h
	undUprNvE1H9oyC8q0yG1RETIQa+uXb5NsFbJyqaBYu6xGzYix1kkKPe30LFcVGgj5zFxGw5riQ
	rHx2PiJ2/42qiDn9wBYfGaeeHFXtsFOdJURuWWxKmZrdPUNJWdApn9PCapQfLXjBJhNcPfqOLsF
	139/JJJFSFfge1A==
X-Received: by 2002:a17:90a:ec86:b0:3b4:889:883a with SMTP id 98e67ed59e1d1-3b41c9bacbbmr19770542a91.66.1795658390973;
        Wed, 25 Nov 2026 17:59:50 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:59ac:90a:64:4bd7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm14344902a91.10.2026.11.25.17.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:59:50 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH] zram: do not modify cont sysfs store buffers
Date: Thu, 26 Nov 2026 10:45:07 +0900
Message-ID: <20261126014518.1318583-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
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

zram sysfs handlers that accept key=value arguments (e.g.
algorithm_params_store(), etc.) pass their const char *buf
parameter through skip_spaces(), discarding const, and then
mutate it in-place via next_arg().  This is not dangerous
per se because kernfs_fop_write_iter() passes a temp copy
of user string to zram, however it is still probably worth
fixing, just for the sake of correctness.

Allocate a temp non-const buffer for args tokenisation.

Link: https://lore.kernel.org/all/awcpkJD6K1xtx_Pe@devuan/
Reported-by: Alejandro Colomar <alx@kernel.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 96b135e3f727..ca12c1918aec 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1279,10 +1279,15 @@ static ssize_t writeback_store(struct device *dev,
 	unsigned long lo = 0, hi;
 	struct zram_pp_ctl *pp_ctl = NULL;
 	struct zram_wb_ctl *wb_ctl = NULL;
+	char *kbuf __free(kfree) = NULL;
 	char *args, *param, *val;
 	ssize_t ret = len;
 	int err, mode = 0;
 
+	kbuf = kstrndup(buf, len, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
 	guard(rwsem_write)(&zram->dev_lock);
 	if (!init_done(zram))
 		return -EINVAL;
@@ -1303,7 +1308,7 @@ static ssize_t writeback_store(struct device *dev,
 		goto out;
 	}
 
-	args = skip_spaces(buf);
+	args = skip_spaces(kbuf);
 	while (*args) {
 		args = next_arg(args, &param, &val);
 
@@ -1779,12 +1784,17 @@ static ssize_t algorithm_params_store(struct device *dev,
 	char *args, *param, *val, *algo = NULL, *dict_path = NULL;
 	struct deflate_params deflate_params;
 	struct zram *zram = dev_to_zram(dev);
+	char *kbuf __free(kfree) = NULL;
 	bool prio_param = false;
 	int ret;
 
 	deflate_params.winbits = ZCOMP_PARAM_NOT_SET;
 
-	args = skip_spaces(buf);
+	kbuf = kstrndup(buf, len, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	args = skip_spaces(kbuf);
 	while (*args) {
 		args = next_arg(args, &param, &val);
 
@@ -1899,12 +1909,17 @@ static ssize_t recomp_algorithm_store(struct device *dev,
 				      size_t len)
 {
 	struct zram *zram = dev_to_zram(dev);
+	char *kbuf __free(kfree) = NULL;
 	int prio = ZRAM_SECONDARY_COMP;
 	char *args, *param, *val;
 	char *alg = NULL;
 	int ret;
 
-	args = skip_spaces(buf);
+	kbuf = kstrndup(buf, len, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	args = skip_spaces(kbuf);
 	while (*args) {
 		args = next_arg(args, &param, &val);
 
@@ -2578,6 +2593,7 @@ static ssize_t recompress_store(struct device *dev,
 	struct zram *zram = dev_to_zram(dev);
 	char *args, *param, *val, *algo = NULL;
 	u64 num_recomp_pages = ULLONG_MAX;
+	char *kbuf __free(kfree) = NULL;
 	struct zram_pp_ctl *ctl = NULL;
 	s32 prio = ZRAM_SECONDARY_COMP;
 	u32 mode = 0, threshold = 0;
@@ -2586,7 +2602,11 @@ static ssize_t recompress_store(struct device *dev,
 	bool prio_param = false;
 	ssize_t ret;
 
-	args = skip_spaces(buf);
+	kbuf = kstrndup(buf, len, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	args = skip_spaces(kbuf);
 	while (*args) {
 		args = next_arg(args, &param, &val);
 
-- 
2.56.1.839.g22a8290db9-goog

