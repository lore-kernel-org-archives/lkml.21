Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361460;
	b=nd7OLm4SUFbJWVI3YfbVTul+z2Q0J0dDSyS9MSdENJco1kyH+Lnpxw4h4Wr+2nnQnPtU
	 YN1ZvJzLQbCn61lteODYgYDCokeBU2t5bTkfeNUtDGA/qs3lEJDaXvHF97tugOxiSjVpJ
	 1MjQrZ7Q/o3r7tlDa6qLoujT1Qvu21CAqDZX4g4UXFZ8emdO67Ub7oAFHqgExeodU0sEK
	 xj18/P6zIfCL/7c2uWfF3ibyYr0kAFgUcP35HbyFzW60tSb9OpwT++6tgNAH7djG/FO7u
	 atwZ9C5EKxZleAUXP3bflDL5sxShqmT7mUb0GCQR0p3iEkGZs8Kes/aXqCY6oJ+9Dyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7itunjG2J42PnC7jSB4jhKO5BUVvNkVP3J0t/6cOCWw=;
	b=vFqJT0JslAQowXlH6H/TGkggcAJTcqBgmhq/mEOlvV/rDptShyDIjehfqqI+XTZ6mOKs
	 JgOZ43iRlPyiM5qpuqd8mRdc8Qpwnf86mrCerWt/Az+I83b80cA955M7xc7UELFt/b+6w
	 4tCRN7guluZg8v2X8ZdYfm7mDp+9THEPKqIoQOFTIu0ifaRaYHsmHOp+1t1CGIYK5OQeY
	 iWhwtHTYWuU/GKddc5JHW1K+DGaz4KThDh3Dq3jBwKOq8hKkSQLjY+rFR2lwEeniDQYyk
	 ZeiXD56ZMjhNZ5EYGx/B3oV2aORs+DDfJOnTGQ4qkJ8pRiRwk+7oyDh9yO0yyfXsTNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=K++KFZFR;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B37606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B37606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=K++KFZFR
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso18612175e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361458; x=1795966258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7itunjG2J42PnC7jSB4jhKO5BUVvNkVP3J0t/6cOCWw=;
        b=K++KFZFR97lyZn37j3GbSIigg2JFKVBcDEiMnF57eYlBQHZuVaUmuoAz75RDNpeehk
         SoIm3mnTLx0OB6bZu0ZdEmubfQl38QXvvZ9i6xAATmr018jAVeGTeUdza5r93kmMk7KD
         SE17pi9HSM29fI/7JwEGbXF582A7RNh0+NiQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361458; x=1795966258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7itunjG2J42PnC7jSB4jhKO5BUVvNkVP3J0t/6cOCWw=;
        b=UzMHEL+EpcwVphgbLcQt9K83nNAQRT/29mE4jaYvOrl1hNDzm64GZSZyENrwMqdqG9
         AdP3Uu6axwZsvJ77rTn285uzW6n8MSwUpaLGibE2lil6f6hiSwRraii88nljHT0qpene
         tKRL+xBiVegQJcNnbfZdsjGYNZDKhGyNJK1lWLGr/RDWwGqxqF8kkqhXBWLiSMJQNj3y
         c4rPErC13I1vtNpuDUk/Vkij9S7+H9g7trciQ275NWer1JUqJOUeIA4y8oKomkoLL0oL
         +fkRJ3Nm74mZLaGSw/UvuNJTfry6Ts6PQH7JIBnPkohyHttM6RKkLTld71wARBG+cy+P
         9Icw==
X-Forwarded-Encrypted: i=1; AL+hErHSnsTk8qAZqMXLGhiuBIwkCTKKGzwzE8+0sLyeuHiwf7oNPwWKNQ+cjqNuqM1baaUcxacyu028DAc0Lto=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CNOg4bQQQ7JHF93u57XJpRgCu9b6DJa+0EVgLNHEVHtWiCvr3
	zW0S4ZUPStZls8laFVwUYgUQnpPiTHAVAbvU1CJKV+tbfue4MJRRPBNwiGS2Zcpc/FM=
X-Gm-Gg: AZFdTZex9KMVBFHJvDyacjwxEm2zYIBNvS/Q1kS9Syo2EHIFAtcZAi1zKbxgntg1C7V
	kh45DgBKRRfyzYILAZMCMXE/SMZAXh9nS8Qj8tTGn2Uzbw+NtepNtOaFz+R/DoWZHUIMV3A1qX7
	YTtG6R3XzPPTISxwNrKZlb84xlCuRwuwbTRe5YJxQppIirv5oxcHkQrgfzQmmvvOTUxTgI2eM5o
	HsBipPsDWbWTHNKihxAXFaE7OQ+Dka591IlW/AmIe6JmIl7lZJ7rBe6VN9b32ReBfHYz5H0ziiK
	TxwjnoSIR51qDbaYwhjWt7KF3Z5LJZYNi88Jx4vDy6wn6HGuEHVoksWNT5wO7E0wwcnlFCSe12a
	qBcKTgb292ZiMJ9HsKT1V58f/XxybQRx7Nq8epgsw4w7frS5EzI5zQALYm0dlVDSNQkQSQW8ndi
	qXjFL8hAejj+nUmQ8cqynP4V1veN90Oq60XL0GEK8Hkc9Z/+lPE3yAzM+ZPSL5UW2OcA9Ip/rzh
	8qW6HavJnLl8+HQIE33uaxddURdy1RC8qA6/PKbzHS3h3oIoMafUosgOOsEdwXLtLw1AORpjR72
	NPVxRvk1O6w3wT+97E5v6MZERuJBQBV2LmiES4/Z+YiXFQik36PGkaGjVXJWMlaslrNpH5gwX2W
	r5/cqa/GAWgJFq/zAsqW7efFU7S5m8cluaf0mpDBpvUq59V1+U5q8jSI/ldSrj1ydtNEepH1jpE
	lnZrhsc/dqVw58I5utoK9ilijhEw==
X-Received: by 2002:a05:600c:64c8:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb8881de62mr177878065e9.25.1795361458330;
        Sun, 22 Nov 2026 07:30:58 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:30:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/8] drm/mxsfb: Use the bridge connector
Date: Sun, 22 Nov 2026 16:30:03 +0100
Message-ID: <20261122153032.2782768-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
References: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
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

The state readout of a connector is implemented by the bridge
connector helper. Use it, as the LCDIF driver already does, in place
of the connector each bridge creates on its own.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---
The bridges used with this driver have not been checked one by one
for DRM_BRIDGE_ATTACH_NO_CONNECTOR support.

 drivers/gpu/drm/mxsfb/Kconfig     |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 20 ++++++++++----------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index 31db7a824a93..78e983b71ec0 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -15,6 +15,8 @@ config DRM_MXSFB
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL
 	select DRM_PANEL_BRIDGE
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	help
 	  Choose this option if you have an LCDIF or eLCDIF LCD controller.
 	  Those devices are found in various i.MX SoC (including i.MX23,
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 641691fc92c8..038f5c896dcb 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -23,6 +23,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
@@ -118,7 +119,7 @@ static const struct drm_mode_config_helper_funcs mxsfb_mode_config_helpers = {
 static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 {
 	struct drm_device *drm = mxsfb->drm;
-	struct drm_connector_list_iter iter;
+	struct drm_connector *connector;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 	int ret;
@@ -139,19 +140,18 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 	if (!bridge)
 		return -ENODEV;
 
-	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL, 0);
+	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
 
-	mxsfb->bridge = bridge;
+	connector = drm_bridge_connector_init(drm, &mxsfb->encoder);
+	if (IS_ERR(connector))
+		return dev_err_probe(drm->dev, PTR_ERR(connector),
+				     "Failed to init bridge connector\n");
 
-	/*
-	 * Get hold of the connector. This is a bit of a hack, until the bridge
-	 * API gives us bus flags and formats.
-	 */
-	drm_connector_list_iter_begin(drm, &iter);
-	mxsfb->connector = drm_connector_list_iter_next(&iter);
-	drm_connector_list_iter_end(&iter);
+	mxsfb->bridge = bridge;
+	mxsfb->connector = connector;
 
 	return 0;
 }
-- 
2.43.0

