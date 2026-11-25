Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604186;
	b=M6rZkowOQrkJ3UdGeU8dJ/XMZODKCfQZ3rtLPWZN9FhXV16K+B98uuDxNy5tC6z2jGcF
	 NO81zUttv4zFxeNIgk+g/2t8fVrAVk4iTgDZ/CCFf+i3RGIG61FI4tyEOYw5XoetmtcbE
	 dD+TAFW5fDeHGKGLrF6TqhmDsq/3VcKunMEWGYry83gQCYKx8JHBZUQtmBYBDv8n+5S/i
	 wdWVO64pKcq2sNQOjZgjXC88hsbRWXZZbHGRrf/SibQt9jRnzV6WAcSXyGVySwu3BDAPh
	 2Q46/4T80RFkRJ6UVDYcwxowmjfQWyqYGIDyVuFAoqoqa3Evd9/9rZwXdE0SnG0gYJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FJOKwoI4nZDDgERDFtfVbeF2wwjtESDm04yE6n76iXo=;
	b=NP3Yv6BzkyGCPfm+6nLv869cqNpeyDEYu86q0euQOq+AndjsqJvNIM8zAJ9Rhhxq27Sx
	 3ZvhE5r7fekz+3tZ0fckTj32hqQUA3ASqUEK2an1o3RiV0JUphL/VKSEgNq9THbYa+iQz
	 4vx6xZhXJBASd4VCNnmTAKPEOyG9ESkn+FnshW5iKvr/6zueXZAfyXVc13SJZwoHrRm03
	 FgV6LD2yqeXtMecGd5CxPCOEmqCkJsRhvAj9/YC4gKQH9NbK4XKQvW5Sd4fZmwdJEe1Io
	 hU5Tq+HwkebeuTe36HKmuWDYt+I9CMJ446F4UXDu3xTnNp8wd8iUZaETJwDE7ZAARsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uG5AoejD;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E61F606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E61F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uG5AoejD
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso2564882f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604185; x=1796208985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJOKwoI4nZDDgERDFtfVbeF2wwjtESDm04yE6n76iXo=;
        b=uG5AoejDVEKJJavEqPbereLnAU8Ll13LSLVcUCL8eUYTpcVslYfWhSmEKwt3SBWjpb
         VUej4R5ove27BFmFWqgQEZgW/kNzN+bjCGHdXUE6tlC3w1o/eV4p90WX8hWQ7/io+dGL
         jGL5Hxye9Fr95U//0dvbKmKG3R3BhilpHedV9TYyzzK/SLE5Jzw1GJ48+/fvs5P+NO7D
         ygpvvQqTVAqqYwj06Vm97w0l+mh9kFaniPhDAltvmCyfpSaxzMMCeeRBgu8KDy5YBCBB
         lz35EdmvGAKf+duNIkwMxGLr3fa9S3bdVs0MDReCCjIPJ5iM7R3Ww5vdAOX+H6Y6YMst
         1dgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604185; x=1796208985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJOKwoI4nZDDgERDFtfVbeF2wwjtESDm04yE6n76iXo=;
        b=Rq4Cm/p821hbNQTk+t1QMTXpcGWevmtGh06qZEoZvlPvLcS0ZKHFq2j1Q7YF5J0O3G
         vPGAA/7RI8h6jPZLq2S0EuuTDG9iYJDoVZL7pDVrvQfhxzf4Ca0zmnFV4n7KuWYVKHxU
         KZ1InODcJPvU6YA85TNTAykS9MV9AwaQnkE1g53T3W/Zg3mTvggV1XzGj3Ln6QzzRs4+
         dNnoCTMe4Ps8Tjw1MTiwUkhMViPF9w4cim9mhc4wBGVL6e0vh0XqjMq4PV07AwhfMnZU
         t3YQL7prNX857VABQy/T9J5l+SkaQS67JthcZy/BOOV4kzp6A/ghExZ0uR/UgD/woMUC
         /2wQ==
X-Forwarded-Encrypted: i=1; AL+hErFIe7829YREzhbyVCChJ4MOk4oRxn3WK02Sg/tT2XS4NwxyvMK92OinY5Kgu8W+ZQyO21T9bFGYi8ms+O8=@vger.kernel.org
X-Gm-Message-State: APuU4Z91j2mEMgiIPbcdFqwoTgvzhkOwBEMMNYvlSsSEfKPYBjNzah2E
	mlxa68IXu2pZOuUZZYqRy599q8BMtwumMF9B7jtTJ64MkMRtCy1elRF9
X-Gm-Gg: AZFdTZcW4nzRmmIpRWAgUwSZ85VXM/eKzGYIy5aizgijG6ikFQeXTFVw2R5YX+9lHOp
	r3T3U7ABnrpyZA+d4jj25+6IRxHz3pQT1RLghqhJEUsdOo0peXu3QQHojcWR9Ym5P4sM46/0qFJ
	oaWIpYJa5L+UngCw21TnaowmYku46XEMY/oXwsCJq7YEMYy4wY3SwozufFSd/3PhlRLFQQy5skA
	odL5umNR+SfPZFMAbuo/2iG4s9n1ekazzYGqjPRG3YGuamYdWudgnM9cenfWIcGmzO6uC6Bf1Fq
	ePxVgfmgxVTLzb77jsRHTpsLRavFTfk5VUuwXdZFsBzOMOXlfWmAGw8+WAvLRXhX3NsdTAZBxEs
	xA71bYUGEM8Uoi3JGivFVbV+/eFiXtuD0P77k2p0usvrShq4Cjk743SIaPKQpKYPbzYV9aGRg8I
	eB4hxkPjwg1MSf4UvhcOADGMukv6++TA9AdIaWdmZA14E9fcHbzvUBEGo+L3mgfLXayKEOHmlgN
	WiZfUa+PVRB0lwI/nAT1Lbjjr9hHDHIUWzieZ9jqBzOTx+09nzYSZ0eUUyeyegGh9/W0beBhlel
	qESZqD5hlhUk+VVrOuOA2F6MzlE189AsFh2GG25gutrANbwkxTddyPCiG+0LvOPd+ZgFsjb8lTQ
	gYC26+zNkEzTY/A==
X-Received: by 2002:a5d:6f13:0:b0:491:3fdd:af42 with SMTP id ffacd0b85a97d-4abb5cc19b5mr30289182f8f.37.1795604184433;
        Wed, 25 Nov 2026 02:56:24 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm33988993f8f.58.2026.11.25.02.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:56:24 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	linusw@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: mali-c55: Serialise the ISP enable in the params and stats paths
Date: Wed, 25 Nov 2026 10:56:06 +0000
Message-ID: <20261125105621.239518-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Only the capture devices hold isp->capture_lock around the
mali_c55_pipeline_ready() check and the ISP enable or disable. When the
last two queues to start are on different video devices, both can see
a ready pipeline and both enable the ISP. The second call fails with
-EALREADY and its queue's start_streaming_called flag is cleared, so
the ISP is never disabled again and every later start fails.

Take capture_lock in the params and stats paths too, and assert that it
is held in mali_c55_pipeline_ready().

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: David Carlier <devnexen@gmail.com>
---
v2:
- Add lockdep_assert_held() in mali_c55_pipeline_ready() (Jacopo)
- Collect Linus's Reviewed-by
 drivers/media/platform/arm/mali-c55/mali-c55-core.c   | 3 +++
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 4 ++++
 drivers/media/platform/arm/mali-c55/mali-c55-stats.c  | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 241a625f7284..bf80935c20d2 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -13,6 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/ioport.h>
+#include <linux/lockdep.h>
 #include <linux/of.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
@@ -510,6 +511,8 @@ bool mali_c55_pipeline_ready(struct mali_c55 *mali_c55)
 	struct mali_c55_params *params = &mali_c55->params;
 	struct mali_c55_stats *stats = &mali_c55->stats;
 
+	lockdep_assert_held(&mali_c55->isp.capture_lock);
+
 	/* Only wait for queues connected through enabled media links. */
 	return (!media_pad_remote_pad_first(&fr->pad) ||
 		vb2_start_streaming_called(&fr->queue)) &&
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 16e895e3488e..6515c78c1bb2 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -762,6 +762,8 @@ static int mali_c55_params_start_streaming(struct vb2_queue *q,
 	struct mali_c55 *mali_c55 = params->mali_c55;
 	int ret;
 
+	guard(mutex)(&mali_c55->isp.capture_lock);
+
 	ret = pm_runtime_resume_and_get(mali_c55->dev);
 	if (ret)
 		goto err_return_buffers;
@@ -796,6 +798,8 @@ static void mali_c55_params_stop_streaming(struct vb2_queue *q)
 	struct mali_c55 *mali_c55 = params->mali_c55;
 	struct mali_c55_isp *isp = &mali_c55->isp;
 
+	guard(mutex)(&isp->capture_lock);
+
 	if (mali_c55_pipeline_ready(mali_c55)) {
 		if (v4l2_subdev_is_streaming(&isp->sd))
 			v4l2_subdev_disable_streams(&isp->sd,
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
index a9c28b090b2a..cbd2a2f77da3 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
@@ -146,6 +146,8 @@ static int mali_c55_stats_start_streaming(struct vb2_queue *q,
 	struct mali_c55 *mali_c55 = stats->mali_c55;
 	int ret;
 
+	guard(mutex)(&mali_c55->isp.capture_lock);
+
 	ret = pm_runtime_resume_and_get(mali_c55->dev);
 	if (ret)
 		goto err_return_buffers;
@@ -180,6 +182,8 @@ static void mali_c55_stats_stop_streaming(struct vb2_queue *q)
 	struct mali_c55 *mali_c55 = stats->mali_c55;
 	struct mali_c55_isp *isp = &mali_c55->isp;
 
+	guard(mutex)(&isp->capture_lock);
+
 	if (mali_c55_pipeline_ready(mali_c55)) {
 		if (v4l2_subdev_is_streaming(&isp->sd))
 			v4l2_subdev_disable_streams(&isp->sd,
-- 
2.55.0

