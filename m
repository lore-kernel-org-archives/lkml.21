Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529954;
	b=ZorC2Qvdq2UonwNtgtmtLsi4Aqu6YpBMgLmExLTTo9vMx1qVORmEr2OTpwTpj7mYxJNX
	 A1YZzbK4Ki2tFFC48XHvs9WpCbbo/LnIjrEx0u+po38Oob+8/FiUQOLY7UnZQ3GtrBCqM
	 EQ49rO61kN2bsP7d56o2Z96ve70lXlfhuXEKvrf87uemU6gOfmEilAtYjomCHC7dzNMS+
	 2ucxLGkLEw+siuKxUR4Alq9LGG9nsdOY3DBNBy1/ptyp2QMAblz7lhwARjqIFo+f4zCNa
	 mUSLHHjV3A8jZqRhWA1lcv871ajzojiPKLDxg3CZygdpAuBwwV4Ih8VqB1/aiilQ7/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PvlCYG8VQeH4h0Z68Fvh4bQbmDrnrFfU86U6tQW8SVY=;
	b=t01N0h8sfokO8ynkxAaOyGEUsbhhfxCOCHbKAb8bm6VldTV/nfLf9l08sB0DUNJzsTzO
	 k9Dkk6jLJpJ20r9HRrmaS1ABz1+Fcp1pSBmHVuHHB6McZXf4izxnk5+Sv4vAp9B8gJSQn
	 6C69MwOW1e4/OoMnvbUhnIxMb2f4QYdNqwbF0QVUj05iK5H33+6ZFuBtk34+OK1OaRe5R
	 2cr+I+aZnZ9JvV+KcdrGTpeKyKXcDTkzo5WmGrc0nHNOEB7q8xc+n7pG5NAFMMQ8fKKv4
	 NcYsP06MaQ3rssRXyJmLwhxntlkiYRrvGLxizd/teWrQSv4L8radVSEQ19s+dqMUMRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NEf27W2i;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0450D606A332
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0450D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NEf27W2i
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so59422775e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529952; x=1796134752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PvlCYG8VQeH4h0Z68Fvh4bQbmDrnrFfU86U6tQW8SVY=;
        b=NEf27W2iLY+gPYIYnns5NwL+S5hEMzUpFz9AWjVVjTTxH7Fo4ED/jAL4D+FN4z+zOy
         PcUGOrXNh8QOSyOaQeZHmCwnhxi1zvckojZFfFSkQZI96RCqreh0nN++eslsMDt4OAFv
         lp8WpoHQucHsIUzL8IHfbm1le3jFQ2vrRUhhaK8XaX1Pjn7P49iQHriH2e+lFJDK3Hyi
         uDPfVRLrBsD84Qq0d3MemRaMABr+m2OqbSH63dptCV4QMfb57w+EBOmmXd1qtxtJmVbt
         RtJEQft4zYWQRUhOMoKou0P3WZUbmdTx6YJV1Yle6pTSr8MQ/aX8/ovXnnaU9CTeWDJS
         aI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529952; x=1796134752;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvlCYG8VQeH4h0Z68Fvh4bQbmDrnrFfU86U6tQW8SVY=;
        b=h/YQYSNVVPZDaCkcbaPwQmsAYh19acxQyMHqQoxuAFGcSzMlqn+hU7eR112z39EcLJ
         k3Vrr4NA2jxIezlTkg2+eCJL29ivfZepCoBJal06wKINCeWY1rh9K6rzqkVvgzlwaCgY
         0jHhjmHmfJ3sgfMYWcprYVxwreV6KNKqDqXfLipPXdYtdlJit0fM1y8nTNeTTpij0gPk
         0qbt/xb8/ixo/x4ZOAZIdnZ1WBOfijRKbUa552GuKmvVwWiU6OICpg80WxSclXf8vXBO
         JZXBadTC0L/d7dfiIxPMFJkQvobq4nylG5R8cDD7M7gn8urK0CmvDknO39jyHM3Umk3D
         n2jg==
X-Forwarded-Encrypted: i=1; AL+hErG2tW24RotEdWwwWQpLkvPCqYFu2sFg/7z9qheAWh5UhLNZHZzNegjwmBJFORGq7Ms08R7y/Q35DEMNDCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hlSXpE/AfbZqi2cg+BbKwygSZIT1JssPOCql9LLkH7roYYe5b
	ToXpMeRfQ1TzdeVcozhOebBjG+xiCndp1i8NC2VqgixKJC7/nVDf7usU
X-Gm-Gg: AZFdTZei6p2wOEQzEsUM7Zb50KwUzJ39wtOKoRCzW2kWv0fFFZ6miej/iBWAqwtn0Jb
	q6byKxIgofiUgcun++L0j9wPn++2EWHCFMKkap0JmZtiz8Zcwq5jddBiPc6/Y1/9BT3xBlBqak1
	re4WPxnHUuXUvJrtxFsWyWy7FHrqPtusjh1641Vkxfge2+ydHqiymUH0hX0B8HqHnIMrnhsiQ+j
	NwQAvheWu2rrcDIXOCYl9ENL/0lixFvRwtfyP0yoeTxSjmIEcq/S1rIhnfj+dkZS/dfboF48HyG
	E9HcWl4QtNROxEC44utxIGEhA615bwyc+wGq2kKZutzLUDiuMXe/fmvAkxedRi0B83HD/XYo2dD
	zYzngZXAHJHlxN3M3YwCTOgwZ9YbOlwSrloD9bbUPwtwJy4HI/Hr7UbhL4JQgqI5QqN187k/5OU
	UCZ+vez78IUR53VRm4FFMrUiyXMHJ2phlyNRfQnjaKwUOf01GUHrC4bt69DS3G1sys5E/JddaMj
	aGETJhMi8qIS3vik5CxCeRBDBBRSWj3A+wHlNtPV9XvSiWTp7zt4CcQ4H5kFfPOPwl6i2qif/mV
	XktXVSOarn9nO/jlnU6F61TvIzdP+LLLoP0gFDGvyNukhOsdtJ/1HA03DjmKfS74FraazmjL+gF
	t/Q==
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr320994905e9.14.1795529951923;
        Tue, 24 Nov 2026 06:19:11 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm28994719f8f.3.2026.11.24.06.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:19:11 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/2] drm/tilcdc: Implement state readout support
Date: Tue, 24 Nov 2026 15:19:07 +0100
Message-Id: <20261124141908.443764-2-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261124141908.443764-1-maximpedraza@gmail.com>
References: <20261124141908.443764-1-maximpedraza@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reconstruct the display mode from the LCDC raster registers and read out
the primary plane, to build the initial KMS state from what the bootloader
left scanning out instead of resetting the controller. A splash drawn
before Linux takes over stays on screen, and the first commit replaces it,
with no modeset if it keeps the mode.

Some of the state needs interpreting:
- The pixel clock is the functional clock rate divided by the LCDC
  divider, rounded to the nearest kHz. It is not rounded to a standard
  refresh rate: panels driven by tilcdc often don't use one.
  tilcdc_crtc_set_clk() only gets as close to the mode clock as the clock
  tree allows, so the CRTC state comparison accepts a 1% difference on
  the pixel clock.
- The registers only encode the pixel size, not the channel order. The
  order that displays correctly depends on the panel wiring, described by
  blue-and-red-wiring, which already selects the formats the driver
  exposes: the adopted framebuffer gets the one with that pixel size.
- tilcdc_crtc_mode_fixup() flips the HSYNC polarity of the adjusted mode,
  and the readout undoes it. A mode with DRM_MODE_FLAG_PHSYNC and one with
  no HSYNC flag program the same registers, so the latter is reported.

The adopted framebuffer has no GEM object. It keeps the DMA address the
bootloader programmed, so that it can be scanned out again after the CRTC
is disabled and re-enabled.

If the raster isn't running there's nothing to adopt, and the CRTC and the
plane are read out as disabled.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c    | 207 +++++++++++++++++++++++-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c     |  10 ++
 drivers/gpu/drm/tilcdc/tilcdc_drv.h     |  12 ++
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c |  29 +++-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c   | 127 +++++++++++++++
 5 files changed, 378 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index f619b7a6e70d..7040172b1a0d 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/of_graph.h>
@@ -11,6 +12,8 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_readout_helper.h>
+#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -61,13 +64,15 @@ static void set_scanout(struct drm_crtc *crtc, struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = crtc->dev;
 	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
-	struct drm_gem_dma_object *gem;
-	dma_addr_t start, end;
+	dma_addr_t base, start, end;
 	u64 dma_base_and_ceiling;
 
-	gem = drm_fb_dma_get_gem_obj(fb, 0);
+	if (fb->obj[0])
+		base = drm_fb_dma_get_gem_obj(fb, 0)->dma_addr;
+	else
+		base = to_tilcdc_readout_fb(fb)->dma_addr;
 
-	start = gem->dma_addr + fb->offsets[0] +
+	start = base + fb->offsets[0] +
 		crtc->y * fb->pitches[0] +
 		crtc->x * fb->format->cpp[0];
 
@@ -711,10 +716,204 @@ static void tilcdc_crtc_hw_reset(struct drm_crtc *crtc)
 	pm_runtime_put_sync(dev->dev);
 }
 
+/*
+ * Reconstruct the adjusted mode from the LCDC raster registers. This is the
+ * inverse of the register programming done in tilcdc_crtc_set_mode(): the
+ * horizontal front/back porch and sync width are stored as (value - 1), the
+ * pixels-per-line and lines-per-panel as (value - 1) as well, while the
+ * vertical front/back porch are stored verbatim. On the V2 controller a few
+ * high order bits live in RASTER_TIMING_2.
+ *
+ * tilcdc_crtc_mode_fixup() always sets a HSYNC polarity and the skew, so they
+ * can be told from the registers. A positive VSYNC can't be told from a mode
+ * that doesn't specify it: the latter is assumed.
+ */
+static int tilcdc_crtc_readout_mode(struct drm_crtc *crtc,
+				    struct drm_display_mode *mode)
+{
+	struct drm_device *dev = crtc->dev;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
+	u32 t0, t1, t2, ctrl;
+	u32 ppl, hsw, hfp, hbp;
+	u32 lpp, vsw, vfp, vbp;
+	unsigned long clk_rate;
+	unsigned int clkdiv;
+
+	t0 = tilcdc_read(dev, LCDC_RASTER_TIMING_0_REG);
+	t1 = tilcdc_read(dev, LCDC_RASTER_TIMING_1_REG);
+	t2 = tilcdc_read(dev, LCDC_RASTER_TIMING_2_REG);
+	ctrl = tilcdc_read(dev, LCDC_CTRL_REG);
+
+	/* Horizontal fields, low bits in TIMING_0, V2 high bits in TIMING_2. */
+	ppl = (t0 >> 4) & 0x3f;
+	hsw = (t0 >> 10) & 0x3f;
+	hfp = (t0 >> 16) & 0xff;
+	hbp = (t0 >> 24) & 0xff;
+	if (priv->rev == 2) {
+		ppl |= ((t0 >> 3) & 0x1) << 6;
+		hsw |= ((t2 >> 27) & 0xf) << 6;
+		hfp |= (t2 & 0x3) << 8;
+		hbp |= ((t2 >> 4) & 0x3) << 8;
+	}
+	mode->hdisplay = (ppl + 1) << 4;
+	hsw += 1;
+	hfp += 1;
+	hbp += 1;
+
+	/* Vertical fields, LPP high bit in TIMING_2 on V2. */
+	lpp = t1 & 0x3ff;
+	if (priv->rev == 2 && (t2 & LCDC_LPP_B10))
+		lpp |= 0x400;
+	vsw = ((t1 >> 10) & 0x3f) + 1;
+	vfp = (t1 >> 16) & 0xff;
+	vbp = (t1 >> 24) & 0xff;
+	mode->vdisplay = lpp + 1;
+
+	mode->hsync_start = mode->hdisplay + hfp;
+	mode->hsync_end	  = mode->hsync_start + hsw;
+	mode->htotal	  = mode->hsync_end + hbp;
+
+	mode->vsync_start = mode->vdisplay + vfp;
+	mode->vsync_end	  = mode->vsync_start + vsw;
+	mode->vtotal	  = mode->vsync_end + vbp;
+
+	/* Pixel clock is the functional clock divided by the CTRL divisor. */
+	clkdiv = (ctrl & LCDC_CLK_DIVISOR_MASK) >> 8;
+	clk_rate = clk_get_rate(priv->clk);
+	if (!clkdiv || !clk_rate)
+		return -EINVAL;
+	mode->clock = DIV_ROUND_CLOSEST(clk_rate / clkdiv, 1000);
+
+	mode->flags |= t2 & LCDC_INVERT_HSYNC ? DRM_MODE_FLAG_NHSYNC :
+						DRM_MODE_FLAG_PHSYNC;
+	if (t2 & LCDC_INVERT_VSYNC)
+		mode->flags |= DRM_MODE_FLAG_NVSYNC;
+
+	mode->hskew = hsw;
+	mode->flags |= DRM_MODE_FLAG_HSKEW;
+
+	mode->type |= DRM_MODE_TYPE_DRIVER;
+	drm_mode_set_name(mode);
+	drm_mode_set_crtcinfo(mode, 0);
+
+	return 0;
+}
+
+static int tilcdc_crtc_readout_state(struct drm_crtc *crtc,
+				     struct drm_atomic_sro_state *state,
+				     struct drm_crtc_state *crtc_state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_display_mode adjusted = {}, mode;
+	int ret;
+
+	pm_runtime_get_sync(dev->dev);
+
+	/* Nothing to adopt unless the bootloader left the raster running. */
+	if (!(tilcdc_read(dev, LCDC_RASTER_CTRL_REG) & LCDC_RASTER_ENABLE))
+		goto out;
+
+	ret = tilcdc_crtc_readout_mode(crtc, &adjusted);
+	if (ret)
+		goto err;
+
+	/* Undo tilcdc_crtc_mode_fixup(). */
+	drm_mode_copy(&mode, &adjusted);
+	mode.hskew = 0;
+	mode.flags &= ~(DRM_MODE_FLAG_HSKEW | DRM_MODE_FLAG_NHSYNC |
+			DRM_MODE_FLAG_PHSYNC);
+	if (adjusted.flags & DRM_MODE_FLAG_PHSYNC)
+		mode.flags |= DRM_MODE_FLAG_NHSYNC;
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, &mode);
+	if (WARN_ON(ret))
+		goto err;
+
+	drm_mode_copy(&crtc_state->adjusted_mode, &adjusted);
+
+	crtc_state->active = true;
+	crtc_state->enable = true;
+
+	/* The active plane is filled in by tilcdc_plane_readout_state(). */
+
+out:
+	pm_runtime_put_sync(dev->dev);
+	return 0;
+
+err:
+	pm_runtime_put_sync(dev->dev);
+	return ret;
+}
+
+static void tilcdc_crtc_install_state(struct drm_crtc *crtc,
+				      struct drm_crtc_state *crtc_state)
+{
+	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
+
+	if (!crtc_state->active)
+		return;
+
+	/*
+	 * The display is already scanning out the bootloader's image. Do what
+	 * tilcdc_crtc_enable() and tilcdc_crtc_set_mode() would have done,
+	 * without touching the raster: keep the controller powered, enable its
+	 * interrupts and fill in the software state derived from the mode. A
+	 * commit that doesn't change the mode relies on it, since no modeset
+	 * will update it: set_scanout() uses crtc->mode for the DMA ceiling.
+	 */
+	pm_runtime_get_sync(dev->dev);
+
+	mutex_lock(&tilcdc_crtc->enable_lock);
+
+	drm_mode_copy(&crtc->mode, &crtc_state->mode);
+	drm_mode_copy(&crtc->hwmode, &crtc_state->adjusted_mode);
+	crtc->enabled = true;
+	tilcdc_crtc->hvtotal_us = tilcdc_mode_hvtotal(&crtc->hwmode);
+	tilcdc_crtc->lcd_fck_rate = clk_get_rate(priv->clk);
+	tilcdc_crtc->last_vblank = ktime_get();
+
+	tilcdc_crtc_enable_irqs(dev);
+
+	drm_calc_timestamping_constants(crtc, &crtc->hwmode);
+	drm_crtc_vblank_on(crtc);
+
+	tilcdc_crtc->enabled = true;
+	mutex_unlock(&tilcdc_crtc->enable_lock);
+}
+
+/*
+ * tilcdc_crtc_set_clk() gets as close to the mode clock as the clock tree
+ * allows, so the pixel clock read back can differ slightly from the one the
+ * mode asked for. Accept up to 1% before comparing the rest of the mode.
+ */
+static void tilcdc_crtc_compare_clock(const struct drm_display_mode *expected,
+				      struct drm_display_mode *actual)
+{
+	if (abs(actual->clock - expected->clock) * 100 <= expected->clock)
+		actual->clock = expected->clock;
+}
+
+static bool tilcdc_crtc_compare_state(struct drm_crtc *crtc,
+				      struct drm_printer *p,
+				      struct drm_crtc_state *expected,
+				      struct drm_crtc_state *actual)
+{
+	tilcdc_crtc_compare_clock(&expected->mode, &actual->mode);
+	tilcdc_crtc_compare_clock(&expected->adjusted_mode,
+				  &actual->adjusted_mode);
+
+	return drm_atomic_helper_crtc_compare_state(crtc, p, expected, actual);
+}
+
 static const struct drm_crtc_funcs tilcdc_crtc_funcs = {
 	.set_config     = drm_atomic_helper_set_config,
 	.page_flip      = drm_atomic_helper_page_flip,
 	.atomic_create_state = drm_atomic_helper_crtc_create_state,
+	.atomic_sro_readout_state = tilcdc_crtc_readout_state,
+	.atomic_sro_install_state = tilcdc_crtc_install_state,
+	.atomic_sro_compare_state = tilcdc_crtc_compare_state,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 	.enable_vblank	= tilcdc_crtc_enable_vblank,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index da718d9cb1d6..afdd0760601e 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -12,6 +12,8 @@
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_readout.h>
+#include <drm/drm_atomic_state_readout_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
@@ -75,6 +77,13 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 	.fb_create = drm_gem_fb_create,
 	.atomic_check = tilcdc_atomic_check,
 	.atomic_commit = drm_atomic_helper_commit,
+	.atomic_sro_readout_state = drm_atomic_helper_sro_readout_state,
+	.hw_reset = drm_mode_config_helper_hw_reset,
+};
+
+static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
+	.atomic_sro_build_state = drm_atomic_helper_sro_build_state,
+	.atomic_sro_install_state = drm_atomic_helper_sro_install_state,
 };
 
 static void modeset_init(struct drm_device *dev)
@@ -86,6 +95,7 @@ static void modeset_init(struct drm_device *dev)
 	dev->mode_config.max_width = priv->max_width;
 	dev->mode_config.max_height = 2048;
 	dev->mode_config.funcs = &mode_config_funcs;
+	dev->mode_config.helper_private = &mode_config_helper_funcs;
 }
 
 #ifdef CONFIG_CPU_FREQ
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 17d152f9f0b6..74f5f27f2f1b 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -10,6 +10,7 @@
 #include <linux/cpufreq.h>
 #include <linux/irqreturn.h>
 
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_print.h>
 
 struct clk;
@@ -103,6 +104,17 @@ struct tilcdc_encoder {
 	struct drm_encoder base;
 };
 
+/*
+ * Framebuffer read out from the hardware: it has no GEM object, so keep the
+ * address the bootloader left it at to scan it out again.
+ */
+struct tilcdc_readout_fb {
+	struct drm_framebuffer base;
+	dma_addr_t dma_addr;
+};
+
+#define to_tilcdc_readout_fb(x) container_of(x, struct tilcdc_readout_fb, base)
+
 struct tilcdc_plane *tilcdc_plane_init(struct drm_device *dev);
 
 #endif /* __TILCDC_DRV_H__ */
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
index ac4b5beb2dd5..b3fe18f69f17 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
@@ -9,12 +9,34 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "tilcdc_drv.h"
 #include "tilcdc_encoder.h"
 
+/*
+ * State readout needs to know which CRTC drives this encoder so the connector
+ * can be tied back to it. tilcdc has a single CRTC, so return the one the
+ * encoder was made possible for.
+ */
+static struct drm_crtc *
+tilcdc_encoder_get_current_crtc(struct drm_encoder *encoder)
+{
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, encoder->dev)
+		if (encoder->possible_crtcs == drm_crtc_mask(crtc))
+			return crtc;
+
+	return NULL;
+}
+
+static const struct drm_encoder_funcs tilcdc_encoder_funcs = {
+	.atomic_sro_get_current_crtc = tilcdc_encoder_get_current_crtc,
+};
+
 static
 int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 {
@@ -51,8 +73,9 @@ int tilcdc_encoder_create(struct drm_device *ddev)
 	else if (IS_ERR(bridge))
 		return PTR_ERR(bridge);
 
-	encoder = drmm_simple_encoder_alloc(ddev, struct tilcdc_encoder,
-					    base, DRM_MODE_ENCODER_NONE);
+	encoder = drmm_encoder_alloc(ddev, struct tilcdc_encoder, base,
+				     &tilcdc_encoder_funcs,
+				     DRM_MODE_ENCODER_NONE, NULL);
 	if (IS_ERR(encoder)) {
 		drm_err(ddev, "drm_encoder_init() failed %pe\n", encoder);
 		return PTR_ERR(encoder);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index eb0a5562421f..f710310cece2 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -4,17 +4,144 @@
  * Author: Jyri Sarha <jsarha@ti.com>
  */
 
+#include <linux/pm_runtime.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_readout.h>
+#include <drm/drm_atomic_state_readout_helper.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 
 #include "tilcdc_drv.h"
+#include "tilcdc_regs.h"
+
+static void tilcdc_plane_readout_fb_destroy(struct drm_framebuffer *fb)
+{
+	drm_framebuffer_cleanup(fb);
+	kfree(to_tilcdc_readout_fb(fb));
+}
+
+static const struct drm_framebuffer_funcs tilcdc_plane_readout_fb_funcs = {
+	.destroy = tilcdc_plane_readout_fb_destroy,
+};
+
+/*
+ * The RASTER_CTRL format bits only encode the pixel size, not the channel
+ * order. The order that displays correctly depends on how the panel is wired
+ * (blue-and-red-wiring), which already selects the formats the driver
+ * exposes, so report the one with the size read back.
+ */
+static const struct drm_format_info *
+tilcdc_plane_readout_format(struct drm_device *dev)
+{
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
+	u32 ctrl = tilcdc_read(dev, LCDC_RASTER_CTRL_REG);
+	const struct drm_format_info *info;
+	unsigned int cpp, i;
+
+	if (!(ctrl & LCDC_V2_TFT_24BPP_MODE))
+		cpp = 2;
+	else if (ctrl & LCDC_V2_TFT_24BPP_UNPACK)
+		cpp = 4;
+	else
+		cpp = 3;
+
+	for (i = 0; i < priv->num_pixelformats; i++) {
+		info = drm_format_info(priv->pixelformats[i]);
+		if (info->cpp[0] == cpp)
+			return info;
+	}
+
+	return NULL;
+}
+
+static int tilcdc_plane_atomic_readout_state(struct drm_plane *plane,
+					     struct drm_atomic_sro_state *state,
+					     struct drm_plane_state *plane_state)
+{
+	struct drm_device *dev = plane->dev;
+	const struct drm_format_info *info;
+	struct drm_crtc_state *crtc_state;
+	struct tilcdc_readout_fb *rfb;
+	struct drm_framebuffer *fb;
+	struct drm_crtc *crtc;
+	unsigned int w, h;
+	int ret;
+
+	pm_runtime_get_sync(dev->dev);
+
+	if (!(tilcdc_read(dev, LCDC_RASTER_CTRL_REG) & LCDC_RASTER_ENABLE))
+		goto out;
+
+	if (dev->num_crtcs != 1) {
+		ret = -EINVAL;
+		goto err;
+	}
+	crtc = list_first_entry(&dev->mode_config.crtc_list, struct drm_crtc,
+				head);
+
+	crtc_state = drm_atomic_sro_get_crtc_state(state, crtc);
+	if (!crtc_state) {
+		ret = -ENODEV;
+		goto err;
+	}
+
+	/* The tilcdc primary plane always covers the whole active area. */
+	w = crtc_state->adjusted_mode.hdisplay;
+	h = crtc_state->adjusted_mode.vdisplay;
+
+	info = tilcdc_plane_readout_format(dev);
+	if (!info) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	rfb = kzalloc_obj(*rfb);
+	if (!rfb) {
+		ret = -ENOMEM;
+		goto err;
+	}
+	rfb->dma_addr = tilcdc_read(dev, LCDC_DMA_FB_BASE_ADDR_0_REG);
+	fb = &rfb->base;
+	fb->dev = dev;
+	fb->format = info;
+	fb->width = w;
+	fb->height = h;
+	fb->pitches[0] = w * (drm_format_info_bpp(info, 0) / 8);
+	fb->offsets[0] = 0;
+
+	ret = drm_framebuffer_init(dev, fb, &tilcdc_plane_readout_fb_funcs);
+	if (ret) {
+		kfree(rfb);
+		goto err;
+	}
+
+	plane_state->fb = fb;
+	plane_state->crtc = crtc;
+	plane_state->src_w = w << 16;
+	plane_state->src_h = h << 16;
+	plane_state->crtc_w = w;
+	plane_state->crtc_h = h;
+
+	crtc_state->plane_mask |= drm_plane_mask(plane);
+
+out:
+	pm_runtime_put_sync(dev->dev);
+	return 0;
+
+err:
+	pm_runtime_put_sync(dev->dev);
+	return ret;
+}
 
 static const struct drm_plane_funcs tilcdc_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
 	.atomic_create_state = drm_atomic_helper_plane_create_state,
+	.atomic_sro_readout_state = tilcdc_plane_atomic_readout_state,
+	.atomic_sro_compare_state = drm_atomic_helper_plane_compare_state,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 };
-- 
2.39.5

