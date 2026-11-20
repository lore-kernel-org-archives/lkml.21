Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133071;
	b=Zc5R1WbptKcAWCq65WMYtx4Qs2LpQ1+T0GyNfi+ND4S+3IyWqh9CgzM3eSDq6/o8syYa
	 3fhKMJp3alfeokQ4FZj4X+patzx53RxqrcaS/V3OJQGDt9ykKU7UCBzZWcmM5RntWfleZ
	 vCGVI4hZIvoDYBNNx5Cy2IlvS9c9R3T3WsOZ0clVItO1oQNjgZA+LoGmxhMvkdPG08RwM
	 JgcPdF18fiY2zWkjiDyyOp50t/wLs3/j9336IPa4NNc5G1zmbWd27oPjI/VHLHF+Uyfl4
	 n+ddA6p7fgKJTjKoelhDAp4uiScTswbvbOYsSGwc7c+8exnhioMU3m12xrZnfqIW3EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133071;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mzFU/NQqwjturQLwowMh/ymO+n+PWtu2g/CVPtT5cTc=;
	b=vZnRnZajvL54Z2+NgBuvUjg8ocPysaoFCiHLEmxVyrfiosbw5+2Bjo9ppjeCtcNR8I/S
	 +zTkA3VST06fdEQ3tIbGAa3feeUJXI8R44iZJNIju7cjg1ACYe8E7coylUV0D4K4vmNUG
	 M/kUMskaOq/1i1tnpm4/9HpTYwMCYmFhCDfnXCx+FVWdIZokc+8KRAn6rIzvmc7GsRITj
	 sq7GzGCDxJoNRgy0/GljXdGjbftKZSv8FwrLzHIAiuuba1KDN503qdhsQrEKLhyn+PJgg
	 l1Hy/6v2BM/PD60f0IEzc7ey5aprDNguf1gdTfxLF2Xrh6EtvkcL2mvzQLwZwRiCRTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE6C606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EE6C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC77-000000002Au-2bQ8;
	Fri, 20 Nov 2026 00:04:25 +0000
Date: Fri, 20 Nov 2026 00:04:16 +0000
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
Subject: [PATCH v9 09/14] drm/bridge: it6505: guard against zero channel
 count in audio infoframe
Message-ID: <d4c3e1dc38d98aae62bb73d4166bb68f2e1fcbea.1795132452.git.daniel@makrotopia.org>
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

it6505->audio.channel_count stays 0 until link training or a valid
hw_params call has run, but it6505_enable_audio() can be reached
before that from the audio-FIFO-error IRQ, making
it6505_enable_audio_infoframe() index the 8-entry audio_info_ca[]
table with -1. Bail out while the channel count is not yet known.

Also fix the debug print on the invalid-channel-count path, which
logged the previously cached count instead of the rejected one.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # Steelix Chromebook
---
 drivers/gpu/drm/bridge/ite-it6505.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 17f4f6497b34d..d0d2bac88a94c 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1579,6 +1579,9 @@ static void it6505_enable_audio_infoframe(struct it6505 *it6505)
 	struct device *dev = it6505->dev;
 	u8 audio_info_ca[] = { 0x00, 0x00, 0x01, 0x03, 0x07, 0x0B, 0x0F, 0x1F };
 
+	if (!it6505->audio.channel_count)
+		return;
+
 	DRM_DEV_DEBUG_DRIVER(dev, "infoframe channel_allocation:0x%02x",
 			     audio_info_ca[it6505->audio.channel_count - 1]);
 
@@ -3003,7 +3006,7 @@ static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
 
 	if (params->cea.channels <= 1 || params->cea.channels > 8) {
 		DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
-				     it6505->audio.channel_count);
+				     params->cea.channels);
 		return -EINVAL;
 	}
 
-- 
2.56.1

