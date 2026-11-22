Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361479;
	b=xZ936sY1vho/tqGNFoNcvsezYU9EpzsLUGiKEBf4hURQZWC/LcNyjAw/HSpTMRBxW4q1
	 2yQTS92/G/oCKpGVCnyVeW5RNYEWO2c90BD/9OPLzjEVp4ARDUs7k53q2kd8Ks7l3IZpK
	 oFnUy+11GrOz3uvHv493AtmJk7ds2NSmryx2HAXMFbGPbJ8jPOS+KI9Dmju68oUX6llWw
	 NBK5kObbZ5N7r6L0nYrBqowFV0Nlt/DhevaJIzqzfqFW5p4n1SvNpoZ6lt1KyylFDqV4p
	 /FM7LeVsOFbpoyHvZjiLKzZ6e9O6oTaYFYn8uFWBi3TApHzpDCS0A1C/5ZAID1te9Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eZnhWv3l+dqyN3BQpMNy75OxVQgBrIMMsSz+2s8ZLM8=;
	b=pflWLvMoZG41wrJxp+rzJalp9V477Fv+lGgBklOX+CVaXAtBHVprYwQUSa8+h2PMgR+x
	 qOJMwUrdkiI4OpXW4Zhhy8NDCQjfoVF2tUDvHh03RUxE+BqlQhBj/sEK7v6Zv+NMwrzo2
	 mo3oDK9FdXw6fP4FgOuAIl38vvn+iSj42/bdfmTmivnnagOJMinaD4LzIR1rZg7vehY9s
	 hbphgNJ+ZiKy1E1ofeTAZNtBxp9Op9BuNLcKPHGPJH1ePz7VkuNGtIPN2uJjnU1B1T7wt
	 YqoxEPcZB+ZMs0qT0/RQWXkC1QRGGeln8NAYJao/jvwZyLUlCuroL02OD7uZCZM6NRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=V8rGp8bL;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC8B606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC8B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=V8rGp8bL
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so29653405e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361477; x=1795966277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZnhWv3l+dqyN3BQpMNy75OxVQgBrIMMsSz+2s8ZLM8=;
        b=V8rGp8bLBT70Y2XUl1P8MTSg4D1dAgNjlOmvAkwTaKXwteZWYKXl/HSV02wC4PdLrL
         ki6rXJVLIDSukQqqy/2yQ+3mBMt/b3u2HnO85ef6jO/AP615HabAC6GO/3+jzHsOMdcs
         82ZKKmzx952aBa0izFJ6eb8MHE+xtelNdPzaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361477; x=1795966277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZnhWv3l+dqyN3BQpMNy75OxVQgBrIMMsSz+2s8ZLM8=;
        b=SjHKVGdIzo3VfV+Oet7jNe3kvedRKPWG4yXDJbPF8gGRNYpxTF45U5rKJEKtps5CkB
         JmDuwQbs4TunHPCTuhHFGXCW1TY54kUDnVy5cRd9dVQvC8F9Hrkb79iuxgavz8z54WiX
         kq2lrnyfGBpPhPRBDG2mb8Exbxk/qkvyvU2VR1Y7A9JybOm8FJI9kMsuRh2VOOzf6DFv
         +8DP9QUhQwBKuN+2b1PbIsXiUSGJn8JGjZcnab+kYKIhMkFVmT8GMKNpyBKgo+ud7rgF
         pZo6lf1B5eHhkCbLjGBTIxi+0NTEkxvFOCyJlyWl6xdxdQuzQPW8NIbcFBa2m7q81Tb5
         E56Q==
X-Forwarded-Encrypted: i=1; AL+hErFceFTCCXKDhjLpWQmxlroV9Vgkn/+pNiPO/VQfEu5ltm77mVwWvwXg1EiQjjnx1j2yoXVQucIxaih0X28=@vger.kernel.org
X-Gm-Message-State: APuU4Z87hmOJMzNzPetvQrVORk6b+Ah1O6MPa9xq8x8SkuYvkgg4mf63
	nOHksDZcTTo0BfmLRJ6LqLNoPNdTopeJw4AFTm3pyDuIdy05NoEJ+RXfL9U5w3vCFGc=
X-Gm-Gg: AZFdTZdCXRCYetdeXz2cirTZ3jBk1UbVvMZRQBIYe3SROiZp2/qm6vUbOGIXg2tjJZJ
	FgJ69Bpcs7LNVR4IHkCMOWIh4yaNWhaWnIErFMNeQWh7dIQ5hoogcZZE+G3gt/HQPRiFJfKCgfR
	+mJhdsij4UBVm+VsVNvrPE0FR5x891M6MqbhqKkhwtxfv9Z/fyvknynT1rvmYUO3aHnp7qwPXfx
	Y27sprxwbHOkUbEhy/791Al8+wn+Dj/3sSWfBgK3BPTjMgPp/+buCplYV3yT0HDrJJV0fAHuIYb
	THVoj5mZjjvyld+u1zIjPDqLKc8n0k1XbcPtPi2XhW/1fdttrIm6yGDr7zVfviRwQSHbX9ScnM/
	Zl+AHvG091RXHyyAky8SNrKDjPt53yOyoxGHI+XP6CiuQC+dT4DnL3poudVZ1pSHZOo7J+9Nmzi
	bGcizzLTTxTgvbeGlmCfKkyE6U8uHjCrKAsIzdjSORiBVmBS3tam7A05YualpjpKA2jeQcPIrio
	WzDxI732tDbiJLH6wHP2ixgviy8NeE+HwAxZRTe6g896lPsDmsRbwz/XfW6NEu3wbhihetOhHeB
	7VhoYB+78IWLMEBkXiCS5BrHtj9nx06CU78YCCNxxaM+hemrsIlJutJezlbvHYS8lxu9gQ7uyzK
	Qa3j+eutAro004wpw/HIazeKVOlJc24OCsBu7cpl0i4ne0mbSQXQahjRzJm3DLETiW20JgGhIFr
	tKiuLbKEVcG6/APz8m30+EQ2JZKg==
X-Received: by 2002:a05:600d:600b:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4bb887fb6e7mr193017785e9.6.1795361476916;
        Sun, 22 Nov 2026 07:31:16 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:31:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 7/8] drm/bridge: samsung-dsim: Implement hw state readout
Date: Sun, 22 Nov 2026 16:30:07 +0100
Message-ID: <20261122153032.2782768-8-dario.binacchi@amarulasolutions.com>
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

Read out the state of the bridge from the hardware, so that a video
stream left running by the bootloader is taken over without
initializing the bridge again.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/bridge/samsung-dsim.c | 125 +++++++++++++++++++++++---
 1 file changed, 112 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 480e568dd2c9..2eba8f482d0c 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -20,11 +20,15 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/units.h>
 
 #include <video/mipi_display.h>
 
 #include <drm/bridge/samsung-dsim.h>
+#include <drm/drm_atomic_state_readout.h>
+#include <drm/drm_atomic_state_readout_helper.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_print.h>
 
 /* returns true iff both arguments logically differs */
@@ -1562,6 +1566,17 @@ static int samsung_dsim_transfer(struct samsung_dsim *dsi,
 	return xfer->result;
 }
 
+static void samsung_dsim_unmask_irqs(struct samsung_dsim *dsi)
+{
+	unsigned long mask = ~(DSIM_INT_RX_DONE |
+			       DSIM_INT_SFR_FIFO_EMPTY |
+			       DSIM_INT_SFR_HDR_FIFO_EMPTY |
+			       DSIM_INT_RX_ECC_ERR |
+			       DSIM_INT_SW_RST_RELEASE);
+
+	samsung_dsim_write(dsi, DSIM_INTMSK_REG, mask);
+}
+
 static irqreturn_t samsung_dsim_irq(int irq, void *dev_id)
 {
 	struct samsung_dsim *dsi = dev_id;
@@ -1578,12 +1593,7 @@ static irqreturn_t samsung_dsim_irq(int irq, void *dev_id)
 	samsung_dsim_write(dsi, DSIM_INTSRC_REG, status);
 
 	if (status & DSIM_INT_SW_RST_RELEASE) {
-		unsigned long mask = ~(DSIM_INT_RX_DONE |
-				       DSIM_INT_SFR_FIFO_EMPTY |
-				       DSIM_INT_SFR_HDR_FIFO_EMPTY |
-				       DSIM_INT_RX_ECC_ERR |
-				       DSIM_INT_SW_RST_RELEASE);
-		samsung_dsim_write(dsi, DSIM_INTMSK_REG, mask);
+		samsung_dsim_unmask_irqs(dsi);
 		complete(&dsi->completed);
 		return IRQ_HANDLED;
 	}
@@ -1758,14 +1768,9 @@ samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
-static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
-				     struct drm_bridge_state *bridge_state,
-				     struct drm_crtc_state *crtc_state,
-				     struct drm_connector_state *conn_state)
+static void samsung_dsim_fixup_mode(struct samsung_dsim *dsi,
+				    struct drm_display_mode *adjusted_mode)
 {
-	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
-	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
-
 	/*
 	 * The i.MX8M Mini/Nano glue logic between LCDIF and DSIM
 	 * inverts HS/VS/DE sync signals polarity, therefore, while
@@ -1808,6 +1813,16 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 			adjusted_mode->htotal      += remainder;
 		}
 	}
+}
+
+static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
+				     struct drm_bridge_state *bridge_state,
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state)
+{
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
+
+	samsung_dsim_fixup_mode(dsi, &crtc_state->adjusted_mode);
 
 	return 0;
 }
@@ -1831,6 +1846,87 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 				 flags);
 }
 
+static bool samsung_dsim_hw_is_running(struct samsung_dsim *dsi)
+{
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
+	u32 reg;
+
+	if (!(samsung_dsim_read(dsi, DSIM_PLLCTRL_REG) & DSIM_PLL_EN))
+		return false;
+
+	if (driver_data->has_legacy_status_reg)
+		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
+	else
+		reg = samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
+
+	if (!(reg & BIT(driver_data->pll_stable_bit)))
+		return false;
+
+	return samsung_dsim_read(dsi, DSIM_MDRESOL_REG) & DSIM_MAIN_STAND_BY;
+}
+
+static int samsung_dsim_readout_state(struct drm_bridge *bridge,
+				      struct drm_atomic_sro_state *state,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
+	struct drm_display_info *info = &conn_state->connector->display_info;
+	u32 format = MEDIA_BUS_FMT_FIXED;
+	bool running;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dsi->dev);
+	if (ret < 0)
+		return ret;
+
+	running = samsung_dsim_hw_is_running(dsi);
+	pm_runtime_put(dsi->dev);
+
+	/* The pipeline is active but the video stream is not */
+	if (!running)
+		return -EINVAL;
+
+	/* Rebuild the bus configuration the atomic helpers negotiate */
+	if (info->num_bus_formats)
+		format = info->bus_formats[0];
+
+	bridge_state->output_bus_cfg.format = format;
+	bridge_state->output_bus_cfg.flags = info->bus_flags;
+
+	if (!samsung_dsim_pixel_output_fmt_supported(format))
+		format = MEDIA_BUS_FMT_RGB888_1X24;
+
+	bridge_state->input_bus_cfg.format = format;
+	bridge_state->input_bus_cfg.flags = info->bus_flags;
+
+	/* The mode fixups done in atomic_check can't be read back */
+	samsung_dsim_fixup_mode(dsi, &crtc_state->adjusted_mode);
+
+	return 0;
+}
+
+static void samsung_dsim_install_state(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state)
+{
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
+
+	/* Take the reference samsung_dsim_atomic_pre_enable() would have */
+	if (pm_runtime_resume_and_get(dsi->dev) < 0) {
+		dev_err(dsi->dev, "failed to enable DSI device.\n");
+		return;
+	}
+
+	samsung_dsim_write(dsi, DSIM_INTSRC_REG,
+			   samsung_dsim_read(dsi, DSIM_INTSRC_REG));
+	samsung_dsim_unmask_irqs(dsi);
+	samsung_dsim_enable_irq(dsi);
+
+	dsi->state |= DSIM_STATE_ENABLED | DSIM_STATE_INITIALIZED |
+		      DSIM_STATE_VIDOUT_AVAILABLE;
+}
+
 static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
@@ -1843,6 +1939,9 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_post_disable		= samsung_dsim_atomic_post_disable,
 	.mode_set			= samsung_dsim_mode_set,
 	.attach				= samsung_dsim_attach,
+	.atomic_sro_readout_state	= samsung_dsim_readout_state,
+	.atomic_sro_install_state	= samsung_dsim_install_state,
+	.atomic_sro_compare_state	= drm_atomic_helper_bridge_compare_state,
 };
 
 static irqreturn_t samsung_dsim_te_irq_handler(int irq, void *dev_id)
-- 
2.43.0

