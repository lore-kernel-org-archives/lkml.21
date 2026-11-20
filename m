Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133154;
	b=S8ELle/Fqqa0+TUHS0gjTmZWF9sgHK7VQozLWsvpY/tL0IoOoBfiW5dhZa9wFDUNr7Gc
	 ZBVWCZN3S1BHpXPTFI6W+Qh3nmdjj5uydZrGb3xsJ8r0BiauoZVJOBjwDER2U200UeevS
	 jKh5feX3+BD0AAEG7x+4fVCUPX4p1Pm1W9Q3e2pqazmX45QsoJV01oEjS5CnIuWu5fUr+
	 JMpCqnqFTwTUhZlCgOamH8L/IM/Tp4SdXz7Gm1zcLfsQusrNZfndgEKGdhUo5K4J31wAf
	 OXtIC/hRE9hP/dfFhS47Ml08sW+k3wLdN/9sMpDZrByhneLeIZXxSnlFuBaMUiy632g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133154;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qBVG13Mpx4DFdTgkmaXvNBnKNRWVMbS+//9o5rWebUU=;
	b=bJ0uECGkd3hJHba5NTCdIjxGPhtC7GFApAEjCaTHiEPCLOy3OmPpPdEr/DnQW2XjA8ub
	 QSln5qxC0agXxy5peI05ASWXelgkfUDgxOCVBkInmjPcpOkiZWm566nlo3zoYtx9ypyEo
	 3j+Qh46CLGN+DNNX44vjFumkfbOywDyLDXE3Yjlpbhs45EVD0K3Z0Sfx/1NafI64NCMWo
	 FfipHmY20piGhfUfn1dvPm80CBT5KBNA4nTdx8WR2awf600r+1oPbrv3WaxsF2a/sGrIG
	 sGJ5Ae0FdkrjG41vSrVI6+Y2Cwf3ImsTVlWHQS2UCKVm+/cdqWyrFp+QhDWHcTaKBtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255FB60A2605
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 255FB60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC8N-000000002Dl-3zDT;
	Fri, 20 Nov 2026 00:05:44 +0000
Date: Fri, 20 Nov 2026 00:05:34 +0000
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
Subject: [PATCH v9 12/14] drm/bridge: it6505: don't write an error code back
 to the reset register
Message-ID: <ace14b08414f700933469607299801f0c10f455a.1795132452.git.daniel@makrotopia.org>
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

it6505_audio_input() saves REG_RESET_CTRL, pulses AUDIO_RESET and
writes the saved value back. it6505_read() returns a negative errno on
i2c failure, which regmap truncates to eight bits on the way out:
-EIO turns into 0xfb, holding video, audio, AUX and HDCP in reset. A
failed REG_AUDIO_INPUT_FREQ read is just as wrong, as any negative
value passes the != 0xFF test and reports an audio clock that was
never sampled. Bail out before touching the register and only report
audio input for a usable readback.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # Steelix Chromebook
---
 drivers/gpu/drm/bridge/ite-it6505.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 7737e6ecc4bda..2da58d94127c3 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1518,12 +1518,15 @@ static bool it6505_audio_input(struct it6505 *it6505)
 	int reg05, regbe;
 
 	reg05 = it6505_read(it6505, REG_RESET_CTRL);
+	if (reg05 < 0)
+		return false;
+
 	it6505_set_bits(it6505, REG_RESET_CTRL, AUDIO_RESET, 0x00);
 	usleep_range(3000, 4000);
 	regbe = it6505_read(it6505, REG_AUDIO_INPUT_FREQ);
 	it6505_write(it6505, REG_RESET_CTRL, reg05);
 
-	return regbe != 0xFF;
+	return regbe > 0 && regbe != 0xFF;
 }
 
 static void it6505_setup_audio_channel_status(struct it6505 *it6505)
-- 
2.56.1

