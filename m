Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186851;
	b=TVXG0ZV/XjEXAzs/2B414aQwpB19NZGQn9Uv2dn3ZLNF2yOejQHx5njpnrfZlXGr4DJg
	 0TIs3+DifRuhRvHaU1vSuPZXYSIp3zOrn23fwWOAPLRkErvYz3T7Sn0MI8zpThGpZGluB
	 1uyt07TbkigBE7mdXy6yfsKKLyeKXBVb+B/vAplPKkrV1XybUncb3SyV7IoLFTYWgQ1fI
	 Wxj/67bRzPUyCgmrYHL0sq/ASYDqwWpzr57tGiU2PX/xD4/MX3cRNEIN0rT5AZ+GL5PqP
	 UGUCpQ7INMNccGKICP+6AMYXmWGTOxqDAR4pD5xMd2ofqUz2EX18FSKW98F7fd1LXGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7/iYOhMINhvEOk0ds7NRqLPwYU2L0FMs7KPyj2Wr1b4=;
	b=Eb996P2zXZhdgzEdvF4wB/szKkMpfX4bo3KOi9BGlYRgoYZpODNMEqr9zlrms6ByyD8q
	 sfoa1NphQRTbQSXwH2WvaI16f4VGqG0q6wgmc9Xj4pPOueBZSK7K0JdFG+gZT3VJmYVTD
	 Sh78JUA26a3de3aHxikDM1HrgNgTLFhdiuWHuJEKOyUw9RiUTq77o1llvmv6dm6De1M46
	 a4QmxTxQc9yR3fm9woonGlDhW+vCueRYG6eskc3a0PxKzC9wjrDUjN2SuZdyctEL9MHyg
	 XhFFVlT3tacFT7j0teBt3xrILGUBcZOYY/tEuMBzybua1+cl7/t0bM8COKkyeFAoIfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TiD8fojx;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AF760A382D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67AF760A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TiD8fojx
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cddc597d062so583545a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186851; x=1795791651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/iYOhMINhvEOk0ds7NRqLPwYU2L0FMs7KPyj2Wr1b4=;
        b=TiD8fojx05fpXLGJd9ptfNKTEs7T1NdcBKTFQxZJA32CsSSfGN14cPiJwznki7FzKp
         sYCDFhKNdWYAR4j94D8GcjDNCD3r8lxF7c6NGErd6hf3MVTC4WMkKuYsQt94gqQkhUWr
         MihaNqOWjJWrvDn3GNcuFd/k3TpcDgEwbCcAexgxqFVfPteP1mQto3nS5rTd2nRu7q2i
         vwj5dSKkcafKqAkZ5ZT4xxEyZVhWUG7rFjQnGJhDXSj4eRarZxEVEs4iTAyccpGEboey
         mVjWfAifnh6mriCsuGm7lUCAenCELKxMHueLVQEBhyQFBVkSr48bN1OLLzzzvdHUMILV
         ECeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186851; x=1795791651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/iYOhMINhvEOk0ds7NRqLPwYU2L0FMs7KPyj2Wr1b4=;
        b=gsaChmRQ4h6V6DD5oUslGhTGxX+l2dL/0a5dYolJH31aAEne3jTgOUzXoPEaT15MDw
         EoLqvEn6RWNaD9sai5e+R+JGhFdl089TDppw7N/sn1kT447qcCaQoikX0snUwH4yu4Zw
         ZgR5voX6rLFaYKOMZO232A/CwNi7FU8fySXK2bpHcXY+T41ncsUWQKW8f2d9+LU7CaHq
         5/0524D90stPV+qJA1eBOJ0l5YdJfVh6Ld2cyOewjgnLAFf9RUWehzPFkcl5thSlKzrr
         V/ud6/8nk4IIVuri7jENeSyce1R60rcp6/T3eudQcVGMcdxM4qGMZWGWrsaecEdks1F6
         cGKQ==
X-Forwarded-Encrypted: i=1; AL+hErGimgcn8WRSDcyb83Qf86bq0aRkg8+U90rb1poosHTdUj4XBzafqDa7BADt6aUt3E0AaVYwYMi2rUj1crw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sMataCvKmCo/ssuzedKEnIinN2PlcLlVsRSzSarhS1CODCHuR
	LXHLppWC5RzlAIPhRaNVOZ2HniHKsxtT54IZ2Ob6niccAQcZ3nQ1+SE/
X-Gm-Gg: AZFdTZeKPO3RgWvN1cRUcU9CT3sjHN9qcPXZOXX/9n9a5ja1Xs1na/3uv7Z+RUuR5ax
	jKUEATXE3HQ1ADuuVyvCZ4jcx9uaL+Wi9iFEBLuTKF7P9maRn9p2lD+vGg8bTmfyoyG50Y6msKL
	iUPmKewQpQ7A4DrU4o+8NqXF6aq7bm6GF/2+tuhzgwLhfb2dRkzCtqmYufHDXbjl8RaQ2/Bva3l
	gbFrxxeqSw4N4LhIYEQ+1OGnX28LAYawhCPOD1kT4zk0LkUGjr2glpiAtLxw/bf6jkUlGWQp02f
	KWS9OlkO5PRax9O5gx4uOcItA5hnpZFymj57Zv5UmQqDWq/dwwerCa7UHIHCGyMtfVdc8rGp6q5
	i3JJZr3nO19BmUsvZB1BKxT8Qax+tGdlWGzz3ue4TKpRoFvYSRwODPqavoioVEH0RN1vPvtBS+5
	Hi6nPlfHdIlz68uEs9oq+MzTVAF3dhC37iMEz4qHR5Z4o84ba0fUSuuLdPgroWVv5JC3ApltCgf
	q2ApX96ZMxoukGx6tbGZkAK6vzzIvGCmJ3gmNbJziYtvd2FgD8gWOjPkdCTGVS0B7UwmASdB9Y9
	PLtCAGRlorCqqK70q78PJJ75f7S+ukUVJ2i2SFKplGdU4zWE3+xIasLYdeZWWeVnsM2I
X-Received: by 2002:a17:90b:2688:b0:3b3:cde6:d8c8 with SMTP id 98e67ed59e1d1-3b41c955b9dmr2998636a91.46.1795186850600;
        Fri, 20 Nov 2026 07:00:50 -0800 (PST)
Received: from localhost.localdomain ([115.73.20.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm7851802a91.12.2026.11.20.07.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:50 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nhat Tran <nhat.tranminhk2@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/bridge: tda998x: Fix CEC calibration with lazy IRQ disable
Date: Fri, 20 Nov 2026 22:00:04 +0700
Message-Id: <20261120150004.64033-1-nhat.tranminhk2@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The CEC oscillator calibration pulses the TDA998x interrupt line low for
10ms through the "nxp,calib" GPIO. Before driving the line,
tda998x_cec_calibration() calls disable_irq() so that gpiolib allows the
GPIO, which is also used as an interrupt, to be switched to an output.

gpiolib only allows that once the interrupt is actually disabled at the
GPIO controller. Since commit a8173820f441 ("gpio: gpiolib: Allow GPIO
IRQs to lazy disable"), disable_irq() is lazy on GPIO controllers that
do not implement .irq_disable, such as gpio-omap: the line is not masked
and gpiolib still considers the interrupt enabled. The direction change
is refused and the calibration pulse is never generated. On a
BeagleBone Black this happens on every boot:

  tda998x 0-0070: found TDA19988
  gpio-537 (nxp,calib): gpiod_direction_output_nonotify: tried to set a GPIO tied to an IRQ as output
  tda9950 0-0034: TDA9950 CEC interface, hardware version 3.3

Set IRQ_DISABLE_UNLAZY for the duration of the calibration so that
disable_irq() masks the line immediately, and clear it again once the
interrupt has been re-enabled.

Tested on a BeagleBone Black without an HDMI sink connected: the error
is gone, the GPIO is back to an input used as an interrupt afterwards,
no spurious interrupts are raised, and rebinding tda9950 repeatedly
reruns the calibration cleanly. CEC communication with a sink was not
tested.

Fixes: a8173820f441 ("gpio: gpiolib: Allow GPIO IRQs to lazy disable")
Cc: stable@vger.kernel.org
Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>
---
 drivers/gpu/drm/bridge/tda998x_drv.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
index 0b966c9844e7..0815ce283f49 100644
--- a/drivers/gpu/drm/bridge/tda998x_drv.c
+++ b/drivers/gpu/drm/bridge/tda998x_drv.c
@@ -495,8 +495,16 @@ static void tda998x_cec_calibration(struct tda998x_priv *priv)
 	struct gpio_desc *calib = priv->calib;
 
 	mutex_lock(&priv->edid_mutex);
-	if (priv->hdmi->irq > 0)
+	if (priv->hdmi->irq > 0) {
+		/*
+		 * The pulse is driven on the IRQ line itself, and gpiolib
+		 * refuses to drive a GPIO whose interrupt is still enabled.
+		 * Make disable_irq() mask the line right away instead of
+		 * lazily, so that the GPIO can be switched to an output.
+		 */
+		irq_set_status_flags(priv->hdmi->irq, IRQ_DISABLE_UNLAZY);
 		disable_irq(priv->hdmi->irq);
+	}
 	gpiod_direction_output(calib, 1);
 	tda998x_cec_set_calibration(priv, true);
 
@@ -508,8 +516,10 @@ static void tda998x_cec_calibration(struct tda998x_priv *priv)
 
 	tda998x_cec_set_calibration(priv, false);
 	gpiod_direction_input(calib);
-	if (priv->hdmi->irq > 0)
+	if (priv->hdmi->irq > 0) {
 		enable_irq(priv->hdmi->irq);
+		irq_clear_status_flags(priv->hdmi->irq, IRQ_DISABLE_UNLAZY);
+	}
 	mutex_unlock(&priv->edid_mutex);
 }
 
-- 
2.25.1

