Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133194;
	b=M73WxGkt246L3sEQZPng+TPDuQc2yAVl8ztgpOsZ3qS18TyBslKbUmsi+V+XIba9OPVP
	 yq+ZDgqbOyXhcaV9Ax8YGbVanajweNuBNlk24yNBj+WAhOY+nHJxOIXAWZx4e2PY2uqxM
	 yRucocRQGQoNx9DysAW/T4q+npowTjap6QLeQl7h4YKFPFjuKwyNHW7TObwDCL6dpzIqG
	 d/KKCdnYOqQ2BYgy2ZhwUgP4P1feki445qIUq5eg+WEJaWLSFTrnczFH60bdikUpgjl2i
	 iTLKjmPpeAQJJ7SqxT8xzdnT957G6bLaEy2XTRoPvvWgc0z4lHdS7V7uVWamS9EZMug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133194;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7C1PP+zK6IcTsQGGOhIebzb8qDEFGz5JkCLgQQEJ6fU=;
	b=vDO3WY4z+fx/l7Z7tzKuM1jC8pYMq/un1QeyPuo24EzmW6xgLHbKpSFlWv2dKP4NQaul
	 MpJsSFowqmdZ6J4l/cQnn3n7UJWEyiiKUhIBxXIdKofEh8zKcX4RY3UhEy0732eNkcTGV
	 MuusfJN8htXIv5GM0YmJYmSZy+Og0++RxfGHkDSas8FzfzWOVwbi4PTqr4+ExGDb7T5by
	 aRw6n9ilNsbGYXlWUJR8k1vq9x7+KfuMexLsEOakTZ/LKG0zJGPfRcAm1Vkwf5+fJoSeB
	 HeNu6z2SuPAUiioiRjPaPQ3AzN7sDVflHuO7pUGcqUYYS5r3C7080OahE+00Fkq9Uzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF8260A261D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF8260A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC97-000000002Fo-1TA8;
	Fri, 20 Nov 2026 00:06:29 +0000
Date: Fri, 20 Nov 2026 00:06:20 +0000
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
Subject: [PATCH v9 14/14] drm/bridge: it6505: Don't reject audio hw_params
 without an encoder
Message-ID: <c42d0316bf0f67cb33edabf43ab4ccaad19442b3.1795132452.git.daniel@makrotopia.org>
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

it6505_audio_setup_hw_params() returns -ENODEV when no encoder is
attached. With it6505 registering an hdmi-audio-codec this runs for
every stream on the I2S DAI, and on mt8186-corsola, where the rt1019
speaker amplifier shares I2S3, the error tears down the whole DPCM
backend and breaks speaker playback whenever no display is attached.

The function only caches stream parameters, which needs no encoder.
Drop the check, and apply the audio defaults once at probe instead of
in it6505_variable_config(), which would clobber the cached
parameters again on every hotplug. Actual audio output remains gated
by it6505->powered.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # Steelix Chromebook
---
 drivers/gpu/drm/bridge/ite-it6505.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index eedc46eaf974b..d39f2c396cfc8 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1373,16 +1373,6 @@ static void it6505_variable_config(struct it6505 *it6505)
 	it6505->link_state = LINK_IDLE;
 	it6505->hdcp_desired = HDCP_DESIRED;
 	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
-	it6505->audio.select = AUDIO_SELECT;
-	it6505->audio.sample_rate = AUDIO_SAMPLE_RATE;
-	it6505->audio.channel_count = AUDIO_CHANNEL_COUNT;
-	it6505->audio.type = AUDIO_TYPE;
-	it6505->audio.i2s_input_format = I2S_INPUT_FORMAT;
-	it6505->audio.i2s_justified = I2S_JUSTIFIED;
-	it6505->audio.i2s_data_delay = I2S_DATA_DELAY;
-	it6505->audio.i2s_ws_channel = I2S_WS_CHANNEL;
-	it6505->audio.i2s_data_sequence = I2S_DATA_SEQUENCE;
-	it6505->audio.word_length = AUDIO_WORD_LENGTH;
 	memset(it6505->sha1_input, 0, sizeof(it6505->sha1_input));
 	memset(it6505->bksvs, 0, sizeof(it6505->bksvs));
 }
@@ -3018,9 +3008,6 @@ static int it6505_audio_setup_hw_params(struct it6505 *it6505,
 			     params->sample_rate, params->sample_width,
 			     params->cea.channels);
 
-	if (!it6505->bridge.encoder)
-		return -ENODEV;
-
 	if (params->cea.channels <= 1 || params->cea.channels > 8) {
 		DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
 				     params->cea.channels);
@@ -3152,6 +3139,16 @@ static int it6505_register_audio_driver(struct device *dev)
 	};
 	struct platform_device *pdev;
 
+	it6505->audio.select = AUDIO_SELECT;
+	it6505->audio.sample_rate = AUDIO_SAMPLE_RATE;
+	it6505->audio.channel_count = AUDIO_CHANNEL_COUNT;
+	it6505->audio.type = AUDIO_TYPE;
+	it6505->audio.i2s_input_format = I2S_INPUT_FORMAT;
+	it6505->audio.i2s_justified = I2S_JUSTIFIED;
+	it6505->audio.i2s_data_delay = I2S_DATA_DELAY;
+	it6505->audio.i2s_ws_channel = I2S_WS_CHANNEL;
+	it6505->audio.i2s_data_sequence = I2S_DATA_SEQUENCE;
+	it6505->audio.word_length = AUDIO_WORD_LENGTH;
 	it6505->audio.mute = true;
 	INIT_DELAYED_WORK(&it6505->delayed_audio, it6505_delayed_audio);
 
-- 
2.56.1
