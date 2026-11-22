Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361475;
	b=X9er1INrws2iwFY/3RJmPEMQrKPiAu0nJD0j+TRu6LSGF/wMHk+3rUvKDsQvVFQcQhrN
	 3UQ1CQbg81UEkHVmtMjbcT7yt4Avb+JPrpPHNkzUOpdOBRZ1DzJsqTWcpR/1SuY5CKcsc
	 y7r3o6xHyy73OZS9Pff5W/25Xob+aWrGA7XLRXmrxXhh4kph6a4kzXgMTEp2WL0LYxRxD
	 M5NEp1Ze7CvaVFYsTvSymQ97w8B8IOj5XC1nTSRFfm4f5ror+0TtbOApTtWSlqij2ojiJ
	 OCm29sxO+9f5D5sQibuXnOaDPUKjyxP6ttpphF3/Jeqjq0BD/bk09M5eu57z6ySVO7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U7jgIRAX0Cr/2+phjsNttZYf1mknb1CdJT8wOU5EptE=;
	b=HGV62HvZoF7VXGPtH+yXNPI4U3kV2GrmydbYhZgHBxAzJHyFUdmDXTCWKBhX51CCk/5M
	 hyIRlE0yphmhSbfbGP2OqfSi1+k979sxI8/iXhNd3cdA/9ZrZtrOPjAR3pVkM34L/stW4
	 Jz3DO4n2qtgfFPNfF0OkYdxxZ1ZPJShUOvZAn5dMhEXZDOrJaF+gqv6jzGtZOEJq7acaS
	 ebyNnmssIRevhfsDgG16/4NBEj9rWwOje8IZnY7DGXYKRLjCgvyAtUrSGs82ofdTyVr5/
	 Hec2mBIkbLVbYl9gfxt58KL6wLLvb1cD5DQEhGBZFKRmWGenTkZgz0idHzSbtjjW3IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=mKJMbMUO;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FAB606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09FAB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=mKJMbMUO
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb61185057so15815055e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361472; x=1795966272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7jgIRAX0Cr/2+phjsNttZYf1mknb1CdJT8wOU5EptE=;
        b=mKJMbMUOiap3hkIha0Jt0jNlTO4lYLH6puWy+TvJI3ivHcoNvjM/u61aJ/WPaBVKe3
         slSZTqbXaF520XJj4t7adqJiPYIxDS7irv3NuRuqjiAQH2o7zAiTAwTuYsuSygkfl3sK
         KSkuOXYCC3ur3a+eIcfGHPI3UyF+edSg6Ggdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361472; x=1795966272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7jgIRAX0Cr/2+phjsNttZYf1mknb1CdJT8wOU5EptE=;
        b=v6zivCodgI4sXSzkMiKPafSKBHmlXTE8V5eXj/py+PupyE68Zhrnqtj3Sc0/N9gd0Y
         AipkfUWebiJ8tpiyPOXmFjRyMTOYggFH7z4MEV3IM5tIblufXxlXMHdh7VZoabdSH38V
         VMe/z8nvjue/n8Pa9QuxT+ItAbphowLejm2DK8tRBm5PfDrFlriAmOicG/6KW8er7meC
         4ygprTuojJAJhWPxz4fEo3QEsoLuxB5Xjg1lmATC8ZAGdiI5ifa/Zg5+PMYJULwiYbmT
         kPRKeY0qnYg7ox3okleeP726x2aiwEqdZYVHz1i0MlLjXMb57G7P55eLTcwXgSDO87NR
         +uDA==
X-Forwarded-Encrypted: i=1; AL+hErG8ID9cQ+xsb8h/91PVrfddPzF7nWC3yDPnnqX+Ph/ghpkwPaEJ4wy8ijBufdXqg2d//QqYHioqW/R1Xn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6BeNJzT2uoCVa6HaDdNAuT9ENqvqWZoFy5vEIOdMfka8Mc/E0
	AGfYQNHr4pAV9GWu22WRMHhD7PyG40xUGQW2wOQORgpoEGjfiXIYI4PugSN71n/VHTs=
X-Gm-Gg: AZFdTZd5nbA+Gdd+ecmz2OWJSAuMFD09kz87GKZbiH6FXlRYHse2Y1uDHHv+Y+urmKb
	iHM7FSNyGDtwX+bLGlQgHF0DfMVhI1R9DJRQ8s2SZSbFrNN1OB2Cph9ijzXC3aVenS/kLLudXcQ
	qfkkCXZ7yxCj6/Pv3akUOiB7Jv6yIFFFLgWyQv4IqQrnDN8dUxpNr4g3h4w3orf+74tH3UMYoji
	BLR1iZK7psIN9lJanIiELE6S5PuBEHpQvFSDLyWbx8rbZbJqLahymO/+0eSdDsTxuPVzkNWfaBi
	xOFusV3IHrH1hbhcpTKZ/0BDYs9yXPcuiYjTg1JDU0HLpUT/18mJVZAR9VUYcDh0evuZ8UB/GTX
	bWeqLrL4x24rdRP8JKqzw6Le/QiCtMUCjP82QSZYTk+UR5QKpentUFGbWitiA3bdg2KcTwHbXdQ
	CZlzYoqZuUrb1veXWBqhkAVc1uRpUe+HpqVYqD9if+IQK8qtydFzgn3lVseHlqwywYH1ehZ4IvM
	9va0L6aZ0zn3np7Zs7IHMdqN6vwBmEjcy1oAyZ/PtdnkwOFCEKCoGHQ7GH6+Ma6pH0CWoKnMHNL
	tgAGZizEkUyXOsUFuGANV4kumWTA4oE5HRV2wcrsJ7TCaAgbNvBIpMvmeG5BVKBK6rz4Yr3PSFs
	gymZVLgrdE68HKzT5pXpoJGHE/sCtvLjOG/3PX4LCfwD6Dzv0HghjqVqqH4xvr2oZYKM1rECGQN
	8mXObOxRM7ob+GQV9MhUdoK0tzgQ==
X-Received: by 2002:a05:600c:a085:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb88811c75mr209309595e9.19.1795361472384;
        Sun, 22 Nov 2026 07:31:12 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:31:11 -0800 (PST)
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
Subject: [RFC PATCH 6/8] drm/mxsfb: Implement hw state readout
Date: Sun, 22 Nov 2026 16:30:06 +0100
Message-ID: <20261122153032.2782768-7-dario.binacchi@amarulasolutions.com>
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

Read out the state of the CRTC and of the planes from the hardware,
so that the first modeset can be skipped when the bootloader has
already set up the display.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/mxsfb/mxsfb_drv.c  |   3 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 361 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/mxsfb/mxsfb_regs.h |   3 +
 3 files changed, 360 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index ef4a47d238ed..6317a30f54ad 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -22,6 +22,7 @@
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_readout_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_connector.h>
@@ -112,10 +113,12 @@ static const struct drm_mode_config_funcs mxsfb_mode_config_funcs = {
 	.atomic_check		= drm_atomic_helper_check,
 	.atomic_commit		= drm_atomic_helper_commit,
 	.hw_reset		= drm_mode_config_helper_hw_reset,
+	.atomic_sro_readout_state = drm_atomic_helper_sro_readout_state,
 };
 
 static const struct drm_mode_config_helper_funcs mxsfb_mode_config_helpers = {
 	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+	.atomic_sro_build_state = drm_atomic_helper_sro_build_state,
 };
 
 static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 96cd80c6e76c..242b03a903a5 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -13,10 +13,14 @@
 #include <linux/iopoll.h>
 #include <linux/media-bus-format.h>
 #include <linux/pm_runtime.h>
+#include <linux/slab.h>
 #include <linux/spinlock.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_readout.h>
+#include <drm/drm_atomic_state_readout_helper.h>
+#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
@@ -47,6 +51,36 @@ static void mxsfb_hw_put(struct mxsfb_drm_private *mxsfb)
 	pm_runtime_put_sync(mxsfb->drm->dev);
 }
 
+/* The overlay plane starts 64 bytes within the framebuffer */
+#define MXSFB_AS_BUF_OFFSET	64
+
+/* Framebuffer read out from the hardware, without a GEM object */
+struct mxsfb_readout_fb {
+	struct drm_framebuffer base;
+	dma_addr_t dma_addr;
+};
+
+static void mxsfb_readout_fb_destroy(struct drm_framebuffer *fb)
+{
+	drm_framebuffer_cleanup(fb);
+	kfree(container_of(fb, struct mxsfb_readout_fb, base));
+}
+
+static const struct drm_framebuffer_funcs mxsfb_readout_fb_funcs = {
+	.destroy = mxsfb_readout_fb_destroy,
+};
+
+static dma_addr_t mxsfb_plane_get_dma_addr(struct drm_plane_state *pstate)
+{
+	struct drm_framebuffer *fb = pstate->fb;
+
+	if (fb->funcs == &mxsfb_readout_fb_funcs)
+		return container_of(fb, struct mxsfb_readout_fb,
+				    base)->dma_addr;
+
+	return drm_fb_dma_get_gem_addr(fb, pstate, 0);
+}
+
 /* -----------------------------------------------------------------------------
  * CRTC
  */
@@ -418,7 +452,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	mxsfb_crtc_mode_set_nofb(mxsfb, bridge_state, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
-	dma_addr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	dma_addr = mxsfb_plane_get_dma_addr(new_pstate);
 	if (dma_addr) {
 		writel(dma_addr, mxsfb->base + mxsfb->devdata->cur_buf);
 		writel(dma_addr, mxsfb->base + mxsfb->devdata->next_buf);
@@ -463,6 +497,114 @@ static void mxsfb_crtc_hw_reset(struct drm_crtc *crtc)
 	mxsfb_hw_put(mxsfb);
 }
 
+static bool mxsfb_is_running(struct mxsfb_drm_private *mxsfb)
+{
+	u32 mask = CTRL_RUN | CTRL_DOTCLK_MODE;
+
+	/* A controller being stopped keeps running until the end of frame */
+	return (readl(mxsfb->base + LCDC_CTRL) & mask) == mask;
+}
+
+static int mxsfb_readout_mode(struct mxsfb_drm_private *mxsfb,
+			      struct drm_display_mode *mode)
+{
+	const struct mxsfb_devdata *devdata = mxsfb->devdata;
+	u32 ctrl, vdctrl0, vdctrl2, vdctrl3, reg;
+	u16 hsync_len, vsync_len;
+
+	ctrl = readl(mxsfb->base + LCDC_CTRL);
+	if (!(ctrl & CTRL_DOTCLK_MODE) || !(ctrl & CTRL_MASTER))
+		return -EINVAL;
+
+	vdctrl0 = readl(mxsfb->base + LCDC_VDCTRL0);
+	if (!(vdctrl0 & VDCTRL0_ENABLE_PRESENT) ||
+	    !(vdctrl0 & VDCTRL0_VSYNC_PERIOD_UNIT) ||
+	    !(vdctrl0 & VDCTRL0_VSYNC_PULSE_WIDTH_UNIT))
+		return -EINVAL;
+
+	reg = readl(mxsfb->base + devdata->transfer_count);
+	mode->hdisplay = TRANSFER_COUNT_GET_HCOUNT(reg);
+	mode->vdisplay = TRANSFER_COUNT_GET_VCOUNT(reg);
+
+	mode->vtotal = readl(mxsfb->base + LCDC_VDCTRL1);
+
+	vdctrl2 = readl(mxsfb->base + LCDC_VDCTRL2);
+	mode->htotal = VDCTRL2_GET_HSYNC_PERIOD(vdctrl2);
+	hsync_len = (vdctrl2 >> devdata->hs_wdth_shift) & devdata->hs_wdth_mask;
+	vsync_len = VDCTRL0_GET_VSYNC_PULSE_WIDTH(vdctrl0);
+
+	vdctrl3 = readl(mxsfb->base + LCDC_VDCTRL3);
+	mode->hsync_start = mode->htotal - GET_HOR_WAIT_CNT(vdctrl3);
+	mode->hsync_end = mode->hsync_start + hsync_len;
+	mode->vsync_start = mode->vtotal - GET_VERT_WAIT_CNT(vdctrl3);
+	mode->vsync_end = mode->vsync_start + vsync_len;
+
+	if (!mode->hdisplay || !mode->vdisplay ||
+	    mode->hsync_start < mode->hdisplay ||
+	    mode->vsync_start < mode->vdisplay)
+		return -EINVAL;
+
+	mode->clock = DIV_ROUND_CLOSEST(clk_get_rate(mxsfb->clk), 1000);
+
+	/* An active low sync signal can't be told from an unspecified one */
+	if (vdctrl0 & VDCTRL0_HSYNC_ACT_HIGH)
+		mode->flags |= DRM_MODE_FLAG_PHSYNC;
+	if (vdctrl0 & VDCTRL0_VSYNC_ACT_HIGH)
+		mode->flags |= DRM_MODE_FLAG_PVSYNC;
+
+	mode->type |= DRM_MODE_TYPE_DRIVER;
+	drm_mode_set_name(mode);
+	drm_mode_set_crtcinfo(mode, 0);
+
+	return 0;
+}
+
+static int mxsfb_crtc_readout_state(struct drm_crtc *crtc,
+				    struct drm_atomic_sro_state *state,
+				    struct drm_crtc_state *crtc_state)
+{
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+	struct drm_display_mode mode = {};
+	int ret = 0;
+
+	mxsfb_hw_get(mxsfb);
+
+	if (!mxsfb_is_running(mxsfb))
+		goto out;
+
+	ret = mxsfb_readout_mode(mxsfb, &mode);
+	if (ret)
+		goto out;
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, &mode);
+	if (ret)
+		goto out;
+
+	drm_mode_copy(&crtc_state->adjusted_mode, &mode);
+	crtc_state->active = true;
+
+out:
+	mxsfb_hw_put(mxsfb);
+	return ret;
+}
+
+static void mxsfb_crtc_install_state(struct drm_crtc *crtc,
+				     struct drm_crtc_state *crtc_state)
+{
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+
+	if (!crtc_state->active)
+		return;
+
+	/* Take the references mxsfb_crtc_atomic_enable() would have taken */
+	mxsfb_hw_get(mxsfb);
+	if (mxsfb->clk_disp_axi)
+		clk_prepare_enable(mxsfb->clk_disp_axi);
+	clk_prepare_enable(mxsfb->clk);
+
+	drm_crtc_vblank_on(crtc);
+}
+
 static int mxsfb_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
@@ -535,6 +677,9 @@ static const struct drm_crtc_funcs mxsfb_crtc_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 	.enable_vblank = mxsfb_crtc_enable_vblank,
 	.disable_vblank = mxsfb_crtc_disable_vblank,
+	.atomic_sro_readout_state = mxsfb_crtc_readout_state,
+	.atomic_sro_install_state = mxsfb_crtc_install_state,
+	.atomic_sro_compare_state = drm_atomic_helper_crtc_compare_state,
 };
 
 static const struct drm_crtc_funcs mxsfb_crtc_with_crc_funcs = {
@@ -546,6 +691,9 @@ static const struct drm_crtc_funcs mxsfb_crtc_with_crc_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 	.enable_vblank = mxsfb_crtc_enable_vblank,
 	.disable_vblank = mxsfb_crtc_disable_vblank,
+	.atomic_sro_readout_state = mxsfb_crtc_readout_state,
+	.atomic_sro_install_state = mxsfb_crtc_install_state,
+	.atomic_sro_compare_state = drm_atomic_helper_crtc_compare_state,
 	.set_crc_source = mxsfb_crtc_set_crc_source,
 	.verify_crc_source = mxsfb_crtc_verify_crc_source,
 };
@@ -554,8 +702,17 @@ static const struct drm_crtc_funcs mxsfb_crtc_with_crc_funcs = {
  * Encoder
  */
 
+static struct drm_crtc *
+mxsfb_encoder_get_current_crtc(struct drm_encoder *encoder)
+{
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(encoder->dev);
+
+	return &mxsfb->crtc;
+}
+
 static const struct drm_encoder_funcs mxsfb_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
+	.atomic_sro_get_current_crtc = mxsfb_encoder_get_current_crtc,
 };
 
 /* -----------------------------------------------------------------------------
@@ -587,7 +744,7 @@ static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
 									    plane);
 	dma_addr_t dma_addr;
 
-	dma_addr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	dma_addr = mxsfb_plane_get_dma_addr(new_pstate);
 	if (dma_addr)
 		writel(dma_addr, mxsfb->base + mxsfb->devdata->next_buf);
 }
@@ -603,7 +760,7 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 	dma_addr_t dma_addr;
 	u32 ctrl;
 
-	dma_addr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	dma_addr = mxsfb_plane_get_dma_addr(new_pstate);
 	if (!dma_addr) {
 		writel(0, mxsfb->base + LCDC_AS_CTRL);
 		return;
@@ -615,7 +772,7 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 	 * is understood, live with the 16 initial invalid pixels on the first
 	 * line and start 64 bytes within the framebuffer.
 	 */
-	dma_addr += 64;
+	dma_addr += MXSFB_AS_BUF_OFFSET;
 
 	writel(dma_addr, mxsfb->base + LCDC_AS_NEXT_BUF);
 
@@ -663,6 +820,182 @@ static void mxsfb_plane_overlay_atomic_disable(struct drm_plane *plane,
 	writel(0, mxsfb->base + LCDC_AS_CTRL);
 }
 
+static int mxsfb_plane_readout_state(struct drm_plane *plane,
+				     struct drm_atomic_sro_state *state,
+				     struct drm_plane_state *plane_state,
+				     u32 format, dma_addr_t dma_addr)
+{
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
+	struct drm_crtc *crtc = &mxsfb->crtc;
+	struct drm_crtc_state *crtc_state;
+	struct mxsfb_readout_fb *rfb;
+	struct drm_framebuffer *fb;
+	u32 reg;
+	int ret;
+
+	crtc_state = drm_atomic_sro_get_crtc_state(state, crtc);
+	if (!crtc_state)
+		return -ENODEV;
+
+	rfb = kzalloc_obj(*rfb);
+	if (!rfb)
+		return -ENOMEM;
+
+	/* The planes can be neither scaled nor positioned */
+	reg = readl(mxsfb->base + mxsfb->devdata->transfer_count);
+
+	rfb->dma_addr = dma_addr;
+	fb = &rfb->base;
+	fb->dev = plane->dev;
+	fb->format = drm_format_info(format);
+	fb->width = TRANSFER_COUNT_GET_HCOUNT(reg);
+	fb->height = TRANSFER_COUNT_GET_VCOUNT(reg);
+	fb->pitches[0] = fb->width * fb->format->cpp[0];
+
+	ret = drm_framebuffer_init(plane->dev, fb, &mxsfb_readout_fb_funcs);
+	if (ret) {
+		kfree(rfb);
+		return ret;
+	}
+
+	plane_state->fb = fb;
+	plane_state->crtc = crtc;
+	plane_state->visible = true;
+	plane_state->crtc_w = fb->width;
+	plane_state->crtc_h = fb->height;
+	plane_state->src_w = fb->width << 16;
+	plane_state->src_h = fb->height << 16;
+	plane_state->src.x2 = plane_state->src_w;
+	plane_state->src.y2 = plane_state->src_h;
+	plane_state->dst.x2 = plane_state->crtc_w;
+	plane_state->dst.y2 = plane_state->crtc_h;
+
+	crtc_state->plane_mask |= drm_plane_mask(plane);
+
+	return 0;
+}
+
+static int
+mxsfb_plane_primary_readout_state(struct drm_plane *plane,
+				  struct drm_atomic_sro_state *state,
+				  struct drm_plane_state *plane_state)
+{
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
+	u32 ctrl, ctrl1, format;
+	dma_addr_t dma_addr;
+	int ret = 0;
+
+	mxsfb_hw_get(mxsfb);
+
+	if (!mxsfb_is_running(mxsfb))
+		goto out;
+
+	ctrl = readl(mxsfb->base + LCDC_CTRL);
+	ctrl1 = readl(mxsfb->base + LCDC_CTRL1);
+
+	switch (ctrl & CTRL_WORD_LENGTH_MASK) {
+	case CTRL_WORD_LENGTH_16:
+		format = DRM_FORMAT_RGB565;
+		break;
+	case CTRL_WORD_LENGTH_24:
+		/* Packed pixels are not supported */
+		if (CTRL1_GET_BYTE_PACKAGING(ctrl1) == 0x7) {
+			format = DRM_FORMAT_XRGB8888;
+			break;
+		}
+		fallthrough;
+	default:
+		ret = -EINVAL;
+		goto out;
+	}
+
+	dma_addr = readl(mxsfb->base + mxsfb->devdata->next_buf);
+	ret = mxsfb_plane_readout_state(plane, state, plane_state, format,
+					dma_addr);
+
+out:
+	mxsfb_hw_put(mxsfb);
+	return ret;
+}
+
+static int
+mxsfb_plane_overlay_readout_state(struct drm_plane *plane,
+				  struct drm_atomic_sro_state *state,
+				  struct drm_plane_state *plane_state)
+{
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
+	dma_addr_t dma_addr;
+	u32 ctrl, format;
+	bool alpha;
+	int ret = 0;
+
+	mxsfb_hw_get(mxsfb);
+
+	if (!mxsfb_is_running(mxsfb))
+		goto out;
+
+	ctrl = readl(mxsfb->base + LCDC_AS_CTRL);
+	if (!(ctrl & AS_CTRL_AS_ENABLE))
+		goto out;
+
+	alpha = (ctrl & AS_CTRL_ALPHA_CTRL_MASK) == AS_CTRL_ALPHA_CTRL_EMBEDDED;
+
+	switch (ctrl & AS_CTRL_FORMAT_MASK) {
+	case AS_CTRL_FORMAT_RGB444:
+		format = DRM_FORMAT_XRGB4444;
+		break;
+	case AS_CTRL_FORMAT_ARGB4444:
+		format = DRM_FORMAT_ARGB4444;
+		break;
+	case AS_CTRL_FORMAT_RGB555:
+		format = DRM_FORMAT_XRGB1555;
+		break;
+	case AS_CTRL_FORMAT_ARGB1555:
+		format = DRM_FORMAT_ARGB1555;
+		break;
+	case AS_CTRL_FORMAT_RGB565:
+		format = DRM_FORMAT_RGB565;
+		break;
+	case AS_CTRL_FORMAT_RGB888:
+		format = DRM_FORMAT_XRGB8888;
+		break;
+	case AS_CTRL_FORMAT_ARGB8888:
+		format = DRM_FORMAT_ARGB8888;
+		break;
+	default:
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (alpha != drm_format_info(format)->has_alpha) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	dma_addr = readl(mxsfb->base + LCDC_AS_NEXT_BUF) - MXSFB_AS_BUF_OFFSET;
+	ret = mxsfb_plane_readout_state(plane, state, plane_state, format,
+					dma_addr);
+
+out:
+	mxsfb_hw_put(mxsfb);
+	return ret;
+}
+
+static bool mxsfb_plane_compare_state(struct drm_plane *plane,
+				      struct drm_printer *p,
+				      struct drm_plane_state *expected,
+				      struct drm_plane_state *actual)
+{
+	struct drm_crtc *crtc = expected->crtc;
+
+	/* The planes can't be read out while the controller is stopped */
+	if (crtc && !crtc->state->active && !actual->fb)
+		return true;
+
+	return drm_atomic_helper_plane_compare_state(plane, p, expected,
+						     actual);
+}
+
 static bool mxsfb_format_mod_supported(struct drm_plane *plane,
 				       uint32_t format,
 				       uint64_t modifier)
@@ -681,7 +1014,19 @@ static const struct drm_plane_helper_funcs mxsfb_plane_overlay_helper_funcs = {
 	.atomic_disable = mxsfb_plane_overlay_atomic_disable,
 };
 
-static const struct drm_plane_funcs mxsfb_plane_funcs = {
+static const struct drm_plane_funcs mxsfb_plane_primary_funcs = {
+	.format_mod_supported	= mxsfb_format_mod_supported,
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.atomic_create_state = drm_atomic_helper_plane_create_state,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.atomic_sro_readout_state = mxsfb_plane_primary_readout_state,
+	.atomic_sro_compare_state = mxsfb_plane_compare_state,
+};
+
+static const struct drm_plane_funcs mxsfb_plane_overlay_funcs = {
 	.format_mod_supported	= mxsfb_format_mod_supported,
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
@@ -689,6 +1034,8 @@ static const struct drm_plane_funcs mxsfb_plane_funcs = {
 	.atomic_create_state = drm_atomic_helper_plane_create_state,
 	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.atomic_sro_readout_state = mxsfb_plane_overlay_readout_state,
+	.atomic_sro_compare_state = mxsfb_plane_compare_state,
 };
 
 static const uint32_t mxsfb_primary_plane_formats[] = {
@@ -724,7 +1071,7 @@ int mxsfb_kms_init(struct mxsfb_drm_private *mxsfb)
 	drm_plane_helper_add(&mxsfb->planes.primary,
 			     &mxsfb_plane_primary_helper_funcs);
 	ret = drm_universal_plane_init(mxsfb->drm, &mxsfb->planes.primary, 1,
-				       &mxsfb_plane_funcs,
+				       &mxsfb_plane_primary_funcs,
 				       mxsfb_primary_plane_formats,
 				       ARRAY_SIZE(mxsfb_primary_plane_formats),
 				       mxsfb_modifiers, DRM_PLANE_TYPE_PRIMARY,
@@ -737,7 +1084,7 @@ int mxsfb_kms_init(struct mxsfb_drm_private *mxsfb)
 				     &mxsfb_plane_overlay_helper_funcs);
 		ret = drm_universal_plane_init(mxsfb->drm,
 					       &mxsfb->planes.overlay, 1,
-					       &mxsfb_plane_funcs,
+					       &mxsfb_plane_overlay_funcs,
 					       mxsfb_overlay_plane_formats,
 					       ARRAY_SIZE(mxsfb_overlay_plane_formats),
 					       mxsfb_modifiers, DRM_PLANE_TYPE_OVERLAY,
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
index cf813a1da1d7..cfbd13a64388 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
@@ -50,6 +50,7 @@
 #define CTRL_WORD_LENGTH_8		(1 << 8)
 #define CTRL_WORD_LENGTH_18		(2 << 8)
 #define CTRL_WORD_LENGTH_24		(3 << 8)
+#define CTRL_WORD_LENGTH_MASK		(0x3 << 8)
 #define CTRL_MASTER			BIT(5)
 #define CTRL_DF16			BIT(3)
 #define CTRL_DF18			BIT(2)
@@ -115,11 +116,13 @@
 #define AS_CTRL_FORMAT_ARGB1555		(0x8 << 4)
 #define AS_CTRL_FORMAT_RGB888		(0x4 << 4)
 #define AS_CTRL_FORMAT_ARGB8888		(0x0 << 4)
+#define AS_CTRL_FORMAT_MASK		(0xf << 4)
 #define AS_CTRL_ENABLE_COLORKEY		BIT(3)
 #define AS_CTRL_ALPHA_CTRL_ROP		(3 << 1)
 #define AS_CTRL_ALPHA_CTRL_MULTIPLY	(2 << 1)
 #define AS_CTRL_ALPHA_CTRL_OVERRIDE	(1 << 1)
 #define AS_CTRL_ALPHA_CTRL_EMBEDDED	(0 << 1)
+#define AS_CTRL_ALPHA_CTRL_MASK		(3 << 1)
 #define AS_CTRL_AS_ENABLE		BIT(0)
 
 #define MXSFB_MIN_XRES			120
-- 
2.43.0

