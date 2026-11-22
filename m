Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361469;
	b=DoORgY0oIWiq0EKbEBAH3kSiESCp+wKOTG6ov/K4AzQkClOhRBktC1kRZ9ogSriIynUU
	 DMDde//MlJtyKzvqjP8Q9dZUfZdjMSNu4Xkszwe+rtZBoV6OeGJpKfMkhpgIMWTI0ttZn
	 +syb15YpG5ztUODVgJF0wkzd80seuZkD+KFeKYzF2JGdmLN9d9+u3/apgy3Lix9TOahtP
	 vtW4ls6oaFJ6tRJt2IiRoHy9a8Fp5SORCvQXjS6iE+1OjtKesRYCgbOvDeFhpHgk0iacq
	 8VMCM6reo8fd9l6YRbrrfFcPi12kLuzAuBFMKpOPzroPzPdYXpjLQ4KQQ/irNt8FTQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=da6eqqr5+mNyqLPiJjh9XR2U6FENUUFBFqpSoPRBQAU=;
	b=mJL+AevIuQSSc3wAAgmW4GZ9E64FOa5VckH1udb9O9odaWHaLRjD84WMsg0sz3BvxrEy
	 ma97qoN+EqX9JrtepZdqAEbecN82fPq/WLbgbrPW0S+gf86eXPsUCBjQwQ2gR7iV1M0IR
	 psxnHALA9OqkGWOsIqOuL+YFWbIb1OW9EskqcbC3LvD3uRP7znmZfSS/UzK93SrBNQ04c
	 +ERL7ya1I2Q3zCnSYVdAjKdgpqhk7nyJoJlBayGe3wYFmCF/bdxWKD7RF1XcnIbcXvBZf
	 J+YtJSSi0Fg6P2PK/RZmXiIKRvmmyXkMJNBjiT9i0RyB78nez/lxj4Uf+/hMYX3Dbhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=cbp+f5jJ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EDB606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20EDB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=cbp+f5jJ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so22552935e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361467; x=1795966267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=da6eqqr5+mNyqLPiJjh9XR2U6FENUUFBFqpSoPRBQAU=;
        b=cbp+f5jJSkCkGNSShuu8WBlUDC1UzcBlgav/gG2fwaCxnd1P8MXWbA/PA5ZZOQGkO4
         mdDS7JTzgzANJW/QaLxLpoyp4AJRD+wLKx+h2aJVuvkqcp6XrbXJ33hy58l5MBNJRih7
         q4O9KpuGZxsH4DWBMivxTBiB0XSpjK8IViLkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361467; x=1795966267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=da6eqqr5+mNyqLPiJjh9XR2U6FENUUFBFqpSoPRBQAU=;
        b=e92ertlE+tgJnVA/h0Xz/1wy6SJczyCbbzipUghJPVNW42DVsHNXyPbemRbLxOWlml
         Nk6jIqFoCRKsj4QLQgjVioOedfisWViLPyp0CdJ0q2YFKrHDNMtEbXQx3cIvdtSb6YnQ
         /b9aZpPOSrSkjA9nLz/AKRxjU+++0IRicu1tuorN1NnKbTGYKMbWz8wtD0JbkjutZDgh
         VAy5ewcbRIJFarwJqWoW/ACVziQ5OF7EqadWj4lRn+8MwMwVnrzJ0rAgG990wTayIy6n
         WikuJY87pyJeQqgngIXQLY929mpAZLQhNkcex8mpt9fbAgBmSsJ8ggVhu1eq/1eR1Qyv
         P2hA==
X-Forwarded-Encrypted: i=1; AL+hErH62FhIfftNlCYxJqUZoaoFll1v8c2DDxhuEnMvsOlMkSiMtktpzoZ9/XwBOEVyAwG7b0ZZVhQ9Y2LuveY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/jq8fl6Px9baWf6Kyn/WQ9XI324UjnptVrG1hv5xVK7bduhhn
	5pEx3vEJBSoChmI0oLiwt22szy/Q71g031vUrg8DG1hgM5FTIX55MJjf7BDdADUPsD8=
X-Gm-Gg: AZFdTZdW0TNO3/jZA4n9a9SawnPAk53aBSAhNXEc8zzUZkmJFVH2HBPcit1YX/gzEb0
	vTklSUb+j6tMnCD5+YS9HbGvA7lZX9bghLXTZDv7VQbPxQiszp6O8NzQqY3n3loyqlTypKdCUAS
	TdBZ4UzumtGGSCmRa08lKOfSD7KX71Z9Htdkk8ioYHm0YNsRF+cUAmLMqu+WiiKCJSJctuINlFK
	EWMiYll41ep+04TXBu+P6ndJkyacZIc12vbdal+imaDGnca9fy4r5Uioc/fqE+0Vk0Y+Q/LvRCW
	dQip/uK71CZjiepoQTiy9D45hBDvanSmeYS+JfjMAqSjnKRU3w+9pRln6R3qSBhHpoY1yjwjcY/
	ld3s3lYe+xsWSsfch16HTAR3OnJOoVSEIzIGQ69RX+FzOIFhNcvnxj+/JhrsmvHMmUqloLml5fB
	6q8Yi3vIX3GTn/eucIcymHmHt1BYOEo6aw1XeGo5TzBtuSwYLo/fJNCaHQ4zTo5YNrW7zoGt+rK
	YWUfL1RxXVXu0Qo26S6mbwQeXdhipqUO1n2hjMWzrhYKaMuGPuq+2UKAIXpd5JUEhoi3VliW/2r
	WZP9N6lCF23J2X5sflLxFwDzJf8bAODKmWXtZvB1nO10hUwh/NcAtqdF3ubTJYE4SzDgNENTJVb
	AKsDzRL9C3V65dwbLDVgLJy/ez9+4mt8aWQAkQ+4/DBMXrHX6uWWLFBKEoGRcYsXcevo06k4b8l
	5v3fCgNij3lUsboY91kjuxeHddS87yH70J+hp7A/KEpGvBQa8=
X-Received: by 2002:a05:600c:8287:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb887e064dmr198299585e9.1.1795361467514;
        Sun, 22 Nov 2026 07:31:07 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:31:06 -0800 (PST)
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
Subject: [RFC PATCH 5/8] drm/mxsfb: Stop the controller in hw_reset
Date: Sun, 22 Nov 2026 16:30:05 +0100
Message-ID: <20261122153032.2782768-6-dario.binacchi@amarulasolutions.com>
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

When the hardware state can't be read out, a controller left running
by the bootloader is reprogrammed while running on the first enable.
Stop it in the hw_reset hook.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/mxsfb/mxsfb_drv.c |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 33 ++++++++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index c8bc79264361..ef4a47d238ed 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -31,6 +31,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mode_config.h>
+#include <drm/drm_modeset_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -110,6 +111,7 @@ static const struct drm_mode_config_funcs mxsfb_mode_config_funcs = {
 	.fb_create		= mxsfb_fb_create,
 	.atomic_check		= drm_atomic_helper_check,
 	.atomic_commit		= drm_atomic_helper_commit,
+	.hw_reset		= drm_mode_config_helper_hw_reset,
 };
 
 static const struct drm_mode_config_helper_funcs mxsfb_mode_config_helpers = {
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index bbc2a2df9f16..96cd80c6e76c 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -35,6 +35,18 @@
 /* 1 second delay should be plenty of time for block reset */
 #define RESET_TIMEOUT		1000000
 
+static void mxsfb_hw_get(struct mxsfb_drm_private *mxsfb)
+{
+	pm_runtime_get_sync(mxsfb->drm->dev);
+	mxsfb_enable_axi_clk(mxsfb);
+}
+
+static void mxsfb_hw_put(struct mxsfb_drm_private *mxsfb)
+{
+	mxsfb_disable_axi_clk(mxsfb);
+	pm_runtime_put_sync(mxsfb->drm->dev);
+}
+
 /* -----------------------------------------------------------------------------
  * CRTC
  */
@@ -205,7 +217,7 @@ static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
 	writel(CTRL_RUN, mxsfb->base + LCDC_CTRL + REG_SET);
 }
 
-static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
+static void mxsfb_stop_controller(struct mxsfb_drm_private *mxsfb)
 {
 	u32 reg;
 
@@ -221,6 +233,11 @@ static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
 	reg = readl(mxsfb->base + LCDC_VDCTRL4);
 	reg &= ~VDCTRL4_SYNC_SIGNALS_ON;
 	writel(reg, mxsfb->base + LCDC_VDCTRL4);
+}
+
+static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
+{
+	mxsfb_stop_controller(mxsfb);
 
 	clk_disable_unprepare(mxsfb->clk);
 	if (mxsfb->clk_disp_axi)
@@ -433,6 +450,19 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 	pm_runtime_put_sync(drm->dev);
 }
 
+static void mxsfb_crtc_hw_reset(struct drm_crtc *crtc)
+{
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+
+	mxsfb_hw_get(mxsfb);
+
+	/* The bootloader may have left the controller running */
+	if (readl(mxsfb->base + LCDC_CTRL) & CTRL_RUN)
+		mxsfb_stop_controller(mxsfb);
+
+	mxsfb_hw_put(mxsfb);
+}
+
 static int mxsfb_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
@@ -493,6 +523,7 @@ static const struct drm_crtc_helper_funcs mxsfb_crtc_helper_funcs = {
 	.atomic_flush = mxsfb_crtc_atomic_flush,
 	.atomic_enable = mxsfb_crtc_atomic_enable,
 	.atomic_disable = mxsfb_crtc_atomic_disable,
+	.hw_reset = mxsfb_crtc_hw_reset,
 };
 
 static const struct drm_crtc_funcs mxsfb_crtc_funcs = {
-- 
2.43.0

