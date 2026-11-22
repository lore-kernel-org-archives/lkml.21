Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361482;
	b=bJmCqdNJ4EiZ5wZbnal6SZaVgAqYtGl1+T48SjFAetH9q96/5Z0nmJdzCueFdLJPRh5B
	 rf5dKvXw9LlPuNf9oWwJu75kmrT6g3oJCUbz4XL77oZRyWskVrkDODBlSaZkEbdar2aEx
	 NqsZLCevWUBzcXOT05cCXHglJeFtjmj+0l/csVQ5pOffhqAoqEfcfYWdwDBAYWLuqvgmk
	 QcRS0B1G0bhHwXDR7DhMhHcmy87rKTxC/9UEtgK4EB9l2jjw9lC2Wy4TH2dPQNQVqH7KT
	 M9jtpaNbx3QizM0fFM6RT1KWlodNZ5TBrcjp/aexdUbgcVDat+9vVWP+I9CUxoBFXLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p3YrVF29MUANA/M7BuioyKuk5sUXgut6xOBgRR2fmm4=;
	b=4DA5BBHIlNFvEEIFDFyXyJ6ZKd5CCddJi0WJFstwmNiIio5HDafSngJxPwhZbz1RWGw2
	 cCXsIln4+7WFTl21XWHe+nHRJglKcLH6Dmo4YGejmd7QPN8Qu6YVhMCSEJnDUZFeACeDm
	 xl0vJvy9U4r4qTTZgJ1ri1jA1yFzuTIZGQncBYz82f+YE2ot+0xIrsZidCB+okT0KHiWK
	 vgKDaXCkXDjnXD6SiR5rHKyFnOyH+EwKzfWZk2JdD1WWCoVQMO0z78rZwjDmnLodpnJrC
	 qGGxw29b2OPB88ClzrZZ3Ltv0l8iHEpMacqajVZzv3wLkoKvHGYweDfTnSyc107O5gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=FJ1Mvq5v;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E6E606A332
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E6E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=FJ1Mvq5v
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a32576da88so1419992f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361480; x=1795966280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3YrVF29MUANA/M7BuioyKuk5sUXgut6xOBgRR2fmm4=;
        b=FJ1Mvq5vrUucBzZsA6YirKBriguuMoaFZl1GupZ8LnWxe56P/0h523vHbYMYggSkld
         ls0m3cgvOAvDmKK0ZjOFQJ9hL+VI3rGKMZR2KUt1qQPhaKgLO82Itg/8o0DPA3uxeqT9
         wXIBDyuee+J8Pj36DHZWIRqOCln8rokgiqdYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361480; x=1795966280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p3YrVF29MUANA/M7BuioyKuk5sUXgut6xOBgRR2fmm4=;
        b=sKvBFmEsB9BgXU+R1U0+aGBiVaOaF1ocWiZZ+wAqIwQ/+twVkgtg+cvYKMAAQv5dz+
         qerrkyNEqzZsFAI0I1L8GwDEuNYFGVAENenzck19pS9bgJqkcStFh6f1r8GmX6DenvDF
         OEP2tzFOt4sI79cVDHgSMQTeNYoGel6icxLpstaRpxXYpGQGJUhz58tS6xRDAPO17LI9
         YgHZJ7+j9kQeckFMuAGCPnyP8uJh0UrXfqUEU6mHMb5TttiPIeyzvQ56REtr+G0oe2si
         dIYNLxgg1wU1Etxo9hKr3+9Pz9gIsHfvUCYb4XQ/jTh59mZuOaLjTtrzvk3u6lCuBD/N
         dudQ==
X-Forwarded-Encrypted: i=1; AL+hErGfuvJXiGNdhOFYv5hWaltmH8EHUwJndvdSWhZ44NfL2nomYLsOlkrET0LVazeTxhtRmh4m+qPfZVpGGmg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WVx8c3UfQJa54Pa9GINQ6OpdfcKDdMUj/hP3lOn2IUJduUSWl
	BiVMQGWYNsgINL/s0m+6iEiAJPjUeQsAbculOFO0vafvFdiGJQjuX9nVuktGksyKRaA=
X-Gm-Gg: AZFdTZf3vobw0ET1F4+nvUhXGZxQ6NxQD16NZIOGEPa2HX91zZZlYpE51nZe6MXFuef
	CtQnc2fpNEw7fGC9DN17pUz1qqajnrkyl3npIn0o23PX6zuESKZByU8R/RYDXyB4SCWC8c+vhzE
	PVR4bbKUWkNHLPJeQZe2lHps+N8D5K+EsoHLDuUGot8moYiIoD0vecuYSk5zGV2V3xdCHuXuG43
	6gRSIt+QxlUHsBpPaGJoKUiNtviT5q3ezoVUe+/o20ktYyzZlW8B9142NjY3xGWWe2rh5O916VU
	G0qCaNLgnicfG2SHdnnlIMbSsMj/wDREmPMSbsf39znU3+bXmbNrVUe4P+GaVGLQ7roTb51oPyH
	LDJ8/3ztKIcTbryXmQC5qC7Q309+xhPS+jG4SwBsBbIVazpGhz0iwgr8YwELDoig+NbFaM//UAk
	RcrNV7eYqL0ew80lLmFiHyw2XF82QHVXJA3POV+VxNlcdq4qM7UcFd/8QdSv82cQzo8gIpVbvlR
	SlYK2OQv2CGIfDyZCaiwqPoaVcwa++9jKXM+r+1A4g5G1PALpfBeONY5AdJBvSmFS3cLs/JTgp7
	htufSCN8SUt7VIAC3u4407XN1t+ZwcV+TjYS3HjVEjJocC49B7xGtH8OURieNWa3CJCR9Ef4nsm
	NmZ0o7rX0UD574Mexi0Vi3zfRh656zbc3BGkwL7zjDsIonXQiWRPnXNPJ1fMnG6hCyX71SfHsb0
	TNNXawuT3dWHMa0rPq3p2+F5rH4Q==
X-Received: by 2002:a05:600c:1d0a:b0:4bb:840c:72f2 with SMTP id 5b1f17b1804b1-4bb889323a1mr187745175e9.25.1795361480259;
        Sun, 22 Nov 2026 07:31:20 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:31:19 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 8/8] drm/panel: synaptics-r63353: Support hw state readout
Date: Sun, 22 Nov 2026 16:30:08 +0100
Message-ID: <20261122153032.2782768-9-dario.binacchi@amarulasolutions.com>
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

Take over a panel left enabled by the bootloader without turning it
off. The reset line is no longer asserted at probe, since that would
turn the panel off, but when the panel is powered on.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../gpu/drm/panel/panel-synaptics-r63353.c    | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
index 73447d7b15d3..e1d84eca62c8 100644
--- a/drivers/gpu/drm/panel/panel-synaptics-r63353.c
+++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
@@ -72,6 +72,13 @@ static int r63353_panel_power_on(struct r63353_panel *rpanel)
 	struct device *dev = &dsi->dev;
 	int ret;
 
+	/* The bootloader may have left the panel out of reset */
+	ret = gpiod_direction_output(rpanel->reset_gpio, 0);
+	if (ret) {
+		dev_err(dev, "Failed to assert RESET GPIO (%d)\n", ret);
+		return ret;
+	}
+
 	ret = regulator_enable(rpanel->avdd);
 	if (ret) {
 		dev_err(dev, "Failed to enable avdd regulator (%d)\n", ret);
@@ -181,6 +188,28 @@ static int r63353_panel_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
+static int r63353_panel_sro_install(struct drm_panel *panel)
+{
+	struct r63353_panel *rpanel = to_r63353_panel(panel);
+	int ret;
+
+	/* A panel held in reset can't be displaying anything */
+	if (!gpiod_get_value_cansleep(rpanel->reset_gpio))
+		return -ENODEV;
+
+	ret = regulator_enable(rpanel->avdd);
+	if (ret)
+		return ret;
+
+	ret = regulator_enable(rpanel->dvdd);
+	if (ret) {
+		regulator_disable(rpanel->avdd);
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct drm_display_mode sharp_ls068b3sx02_timing = {
 	.clock = 70000,
 	.hdisplay = 640,
@@ -221,6 +250,7 @@ static const struct drm_panel_funcs r63353_panel_funcs = {
 	.prepare = r63353_panel_prepare,
 	.unprepare = r63353_panel_unprepare,
 	.get_modes = r63353_panel_get_modes,
+	.sro_install = r63353_panel_sro_install,
 };
 
 static int r63353_panel_probe(struct mipi_dsi_device *dsi)
@@ -254,7 +284,8 @@ static int r63353_panel_probe(struct mipi_dsi_device *dsi)
 	if (IS_ERR(panel->avdd))
 		return PTR_ERR(panel->avdd);
 
-	panel->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	/* The line is driven when the panel is powered on */
+	panel->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
 	if (IS_ERR(panel->reset_gpio)) {
 		dev_err(dev, "failed to get RESET GPIO\n");
 		return PTR_ERR(panel->reset_gpio);
-- 
2.43.0

