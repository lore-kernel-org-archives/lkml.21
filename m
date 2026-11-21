Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267987;
	b=OB/7Ig53AbsloBeeqDYrU3mc40BY/bn5SK+9/87tmZECztUFHgGsKHk1d8j7G28oZEVg
	 fxJaxNqvp0iVqIq3rdKysA/ZcJyd4QMZHO3CQhKjxns/M5Lm5+BrE29/bwXNCIIfdG59z
	 I9B/MRIKg5BUNyh+jVY9Dt2qwgoVFWZI8prhm4EaG6ZmMC40zRkogxgLMNV+H4l2hqWdq
	 JG95XwW/uBK2Y43O9i6EuWaP8nf+TF1tqUSlUE5bWZoZk0PscrxagXZxv5mZB9w4oGleJ
	 cmmzwFlxzv+/tfifOQ5qqjDACu11H+Ak82zmP8sBTai+zFUvrft3797+d+hPseWZSgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=COKVH5wZADoiDSOnu/wHJ1WRXeKgTfEOkipgkyGWzIU=;
	b=D7DaevLl2FZ7X6jTtran9RHkCEZuG8GwVdXPVEqIVdJyQzBPwUTzC68fMcyZGpvV84hp
	 57xSCbogvCcY61qr69yxsyk7toHT471kwNkb7bBEkXgjhOsIr/PyYGHGG6voEFReukB2m
	 0Tjg2LBDTNDjSnSk2l9XvlDP2N0mUIm38RMwIu/FZZXcy23DrAXhEl/JP8iF/F697rEYW
	 Yj/VQDPDSaTgW7fNKi6ssHR+mUGcCf5dh5mAEe2UdjTac5ubRYpUyYLmpv7ayfFaODyF3
	 r+sPik+x2nKgpULlzU8kjqBIfN3f2+cQvW1M9oMUUXXWNfqC5XwmV4emUnXrpxA9nwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aGH1ZH0Z;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC52606A685
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC52606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aGH1ZH0Z
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so12687025e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267986; x=1795872786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COKVH5wZADoiDSOnu/wHJ1WRXeKgTfEOkipgkyGWzIU=;
        b=aGH1ZH0ZzOPWBWXFuyT4Ylfm+aYDNtA/NAOWD2F/qpWxWUeR3rLEFmcGT/QJ2Aul0N
         LUn8ur9LUGfOCiYCGaDJjmIW7TZdMVTWgPdqlahyjVnvtuaxgqA/UmNjBoankaeimi+X
         8oh+DLfW9Ezl/AagslQYytZyKefI9Qxr6mDuJSCZJJhexJPRmrt1a9h8tErGsbg/EuMh
         WR7TtjojMpwFsm94et36UMUExfjP+0L9a4gRRaFuWYeuOkLrExAG7DIWR2tLaxC+vmSJ
         1qNtiVOEywN8w882T9DNio6NCYVrzwF4HPXhh8hBk87CTXb0rJHStalSe6/O1XOr4R5Z
         ffOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267986; x=1795872786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=COKVH5wZADoiDSOnu/wHJ1WRXeKgTfEOkipgkyGWzIU=;
        b=f+k4Cb5562VCAgz8ubBeL6jX74LLrl3n59ilyAz/G5taWBzlEqb0Z4ImGfpZ48tVXY
         8jiu02GH37XTy1WKarfLpOyOuoy4BvqZx/4mVb2Xb8mZ5A9yqqB8CBTcgci91WQScJ3D
         ZfJpNvYNnd/yPF7hfO5pFlWlnE20taUQ9qOES0KL3zAfk0rqvSgSdB4qvL0G1A1ANavH
         oNifkTsSYxIEigeZQB3/ZuPI64wyxhe0H6tOw8+fWUrLb6ooUgAtq7H25iG8A1rMuDiG
         mXLLxPDDd0DS18rsN1SrFCts05IQ7jtolDqTB1WjIl3+BpBLZBu9GS7mwSFH9/I9DuaQ
         E2dw==
X-Forwarded-Encrypted: i=1; AL+hErG8gVAFDo3XTpX9C6FWSPl6ebzKOKWL4oGGSFnhoufyj+qsAML7cRnzvm2l2vdTAb9TXZvi6c5mMfVJZB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IL3dGYtBsJIJxi64rbFUnBFeoKvpYNFq5+c12ywYE7N0uzKUh
	I/kbvWG45B8z4KlWtmOneXSiTFznKDRF8n7vrl3Eg2bzD64ADuF9AxYD
X-Gm-Gg: AZFdTZcNHvgL4KIAtkTBPWTOlbK9LEQbet15rmEzwWZxeQHUdB8QfPi8M+3WEW8q+x1
	qL4HxqGtiG0CfVEIdwUskbdObOeMKH6Z9CPY01OT8cwf+Wke6+KNn5YrH7hxoFlN8F6aaLR+Oce
	ssY2uSqFE8T91upavVDvmgd9gdkntgZyJW9qWk7c8TVvspCTsZkhjESUQXXNJUBM4ixhvVkNfJn
	S9PdvH2cBDsmznQ288ottnl+o1g8QUiUfW5qPVKUqeCBp2I24vearXNECqT1QZ78XQzYiNnibQh
	G5OhIVsckUw/+yAt4So2GBEIYI6UrLx45Ug0vNcVl2HDh0EzYXf1TSvP2xYuvQSEMFi1aZwuld6
	HDbGk7w2HsZQTjqaE7niFd/A/pAWevXYSlgNxe2TTUY3Ftlmh3VtvdBMKtkmk5VO6nSBBtrUTXu
	QZ4EctI7Rz+iie9sVyIpAHjTVM7SkfLugNqKzRLOir5dILu+sj4n8lNuWBAsL3JY3I7TBZqfoyH
	F+SJbqz6p92Gvvh9ysSI0o+XY9Tuk7OQybOHZkyv435iahfV230gghpWAHKl7OUzXHP3dds410x
	Y9l4jbHG/A+kw/v/ruJgjbeidd4CIZoxbzzhEOuojscVf5vq23MNytUAtsnBk+42whTRbjN1HlC
	T4Besztj7iKCp
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr148396385e9.26.1795267985838;
        Sat, 21 Nov 2026 05:33:05 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:04 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 09/14] media: atomisp: Derive CSI-2 timing from the sensor link frequency
Date: Sat, 21 Nov 2026 14:31:39 +0100
Message-ID: <2070d23e030ce5ddb27402caa3672490e058b84d.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

The ISP2401 CSI-2 receiver timing depends on the sensor link frequency.
Query it through v4l2_get_link_freq() instead of reading a 32-bit
control value directly.

Keep the frequency as s64 to avoid an arbitrary S32_MAX limit. Use
div64_s64() so 32-bit builds use the kernel division helper. Fall
back to the default timings when the frequency query or divisor is
invalid.

Sashiko identified the 32-bit division issue. Codex reproduced it
and drafted the division helper change.

Link: https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/X3S2EI4364O5ARJK5JLDHTTXCW6TPSLE/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_csi2.c  | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 71df4ef62..f72fd0c3c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -5,6 +5,9 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  */
 
+#include <linux/math64.h>
+
+#include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mediabus.h>
 #include "atomisp_cmd.h"
@@ -210,7 +213,7 @@ int atomisp_mipi_csi2_register_entities(struct atomisp_mipi_csi2_device *csi2,
 static const int LIMIT_SHIFT = 6;	/* Limit numeric range into 31 bits */
 
 static int
-atomisp_csi2_configure_calc(const short int coeffs[2], int mipi_freq, int def)
+atomisp_csi2_configure_calc(const short int coeffs[2], s64 mipi_freq, int def)
 {
 	/* Delay counter accuracy, 1/0.0625 for ANN/CHT, 1/0.125 for BXT */
 	static const int accinv = 16;		/* 1 / COUNT_ACC */
@@ -220,7 +223,7 @@ atomisp_csi2_configure_calc(const short int coeffs[2], int mipi_freq, int def)
 		return def;
 
 	r = accinv * coeffs[1] * (500000000 >> LIMIT_SHIFT);
-	r /= mipi_freq >> LIMIT_SHIFT;
+	r = div64_s64(r, mipi_freq >> LIMIT_SHIFT);
 	r += accinv * coeffs[0];
 
 	return r;
@@ -289,18 +292,18 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	int dat_termen;
 	int dat_settle;
 
-	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
-	int mipi_freq = 0;
 	enum atomisp_camera_port port;
+	struct v4l2_subdev *sensor;
+	s64 mipi_freq;
 	int n;
 
 	port = isp->inputs[asd->input_curr].port;
 
-	ctrl.id = V4L2_CID_LINK_FREQ;
-	if (v4l2_g_ctrl
-	    (isp->inputs[asd->input_curr].sensor->ctrl_handler, &ctrl) == 0)
-		mipi_freq = ctrl.value;
+	sensor = isp->inputs[asd->input_curr].sensor;
+	mipi_freq = v4l2_get_link_freq(&sensor->entity.pads[0], 0, 0);
+	if (mipi_freq < 0)
+		mipi_freq = 0;
 
 	clk_termen = atomisp_csi2_configure_calc(coeff_clk_termen, mipi_freq,
 						 TERMEN_DEFAULT);
@@ -311,6 +314,11 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	dat_settle = atomisp_csi2_configure_calc(coeff_dat_settle, mipi_freq,
 						 SETTLE_DEFAULT);
 
+	dev_dbg(isp->dev,
+		"CSI port %u link frequency %lld Hz, clk timing %d/%d, data timing %d/%d\n",
+		port, mipi_freq, clk_termen, clk_settle,
+		dat_termen, dat_settle);
+
 	for (n = 0; n < csi2_port_lanes[port] + 1; n++) {
 		hrt_address base = csi2_port_base[port] + csi2_lane_base[n];
 
-- 
2.53.0


