Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133042;
	b=VK+0tAonAJZ+aiW8ck/UwTHVq8UlMeThJ4DL0QL6gADW2VVQ0ibdALqbJRiRbptJN6Bo
	 tC9e9Et2nTdjRGwDEXkYDu8d6BKvuUCL2P75Rh/oKLQrL2TszxiFoKY+iRnzsxHB9XeXl
	 6zcZmdgHV+l0tShGXLdE9xuAMvlbMw0kZVI2MEVj3sco9SdnEdBsiHcF/EC7bR7gdkvxm
	 HJwfly70YBEpZfotMJ5G/K3RtV99llYyd6c+F90pxx80OYnYzDD95EVc4RrJjk9s+ueeY
	 9T6M/RNAZCL+2pHWqWm12ixyjsJt48LROCa32a6EihAV8N3/cecTPusCUrTx4BDgR3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133042;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Bs+9STUWdF4VN/Op7ocuJ+kHlbmIYCqA3ZkhThCuG/c=;
	b=TNocjE2jvRmWEeu21+4M4epR9dyi6UTsZFNIGZu4f0I/+6v0KB+lKDSdSEqB+DGlygK9
	 iVaM6bvr7QkH35mQ97dzQ814Tu4rn/2IzD3vvV+4gl25EbZv0yrMeDyofjH2dzocEDEA0
	 eZoIYnYesDnqGUPitS1uOSTeYllTtxnSSVCOI3c+rr18nkMPZr99PV3j4YCc1nxtqLkhn
	 4f8q322c+8Pfr91Xgj1c2EZ7tIycntFP2Vj7eCrhHI+rFWAmS+lCleNSAUDOv8K28ls5s
	 TNvpWI85CtAng2hqdSFM9VvOP99NVBskajKenQixxGhu4YsFLrRyUXpXFZxy/C+6n/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDE8606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EDE8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC6f-0000000029T-0cKO;
	Fri, 20 Nov 2026 00:03:57 +0000
Date: Fri, 20 Nov 2026 00:03:48 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v9 08/14] drm/bridge: it6505: drop the audio input FS debug
 print
Message-ID: <2b939c53c4aee37140945201b0c41b74f0e432ae.1795132452.git.daniel@makrotopia.org>
References: <cover.1795132452.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795132452.git.daniel@makrotopia.org>

it6505_enable_audio() reads REG_AUDIO_INPUT_FREQ only to print the
measured audio sample rate, dividing by the readback. The register is
a read-only counter of the input audio frequency, which the driver
otherwise only uses to check whether an I2S bit clock is present. It
reads back 0 when no audio clock has been latched, and it6505_read()
returns a negative errno on i2c failure, while the arguments of the
debug print are evaluated even with debug output disabled.

The value is only informational in the enable path and remains
accessible through the regmap debugfs interface, so drop the read and
the print instead of guarding the division.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 9357996c2eb38..17f4f6497b34d 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1606,7 +1606,6 @@ static void it6505_disable_audio(struct it6505 *it6505)
 static void it6505_enable_audio(struct it6505 *it6505)
 {
 	struct device *dev = it6505->dev;
-	int regbe;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 	it6505_disable_audio(it6505);
@@ -1624,9 +1623,6 @@ static void it6505_enable_audio(struct it6505 *it6505)
 			AUDIO_FIFO_RESET);
 	it6505_set_bits(it6505, REG_AUDIO_SRC_CTRL, AUDIO_FIFO_RESET, 0x00);
 	it6505_set_bits(it6505, REG_RESET_CTRL, AUDIO_RESET, 0x00);
-	regbe = it6505_read(it6505, REG_AUDIO_INPUT_FREQ);
-	DRM_DEV_DEBUG_DRIVER(dev, "regbe:0x%02x audio input fs: %d.%d kHz",
-			     regbe, 6750 / regbe, (6750 % regbe) * 10 / regbe);
 	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_AUD_MUTE, 0x00);
 }
 
-- 
2.56.1

