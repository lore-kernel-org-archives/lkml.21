Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428170;
	b=S0fNhKfnsVho/j+3g7sThBB1Biq2o5LaTpdQSsGvT9zlrU7Uu8f7oE8LnZDzfJoVLqlv
	 qlcoaJBLzCY58w2kxRgN3QJNSmaVhikIRtGAUjxOuWqFGa82Pk8FTUKktN3B1Qye13oDN
	 fdFAE2Bvap0ie7eOkdHABpkLJomq7iZC+ARzA5eu81vL3D+09coHc2S37uwOeQyLiiGUJ
	 z5MUfig7QkzzKJPjSCZWxT+YlKmCRQWaI0qhrYK2ztZG+tMCZh8G41Cm8FwqkPDIZoWKn
	 vXpg+8nORhX5ymMqGjWjxxr7kWSiv+/WpzXbom6H2qZfT6fnuSlkhC647gzGimLf6Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U5fmRl7VLOuEYCBD7EtGXC6AhEnchrAVlkeohL5NfGk=;
	b=qRxlHw5h+REqrwmIpWW5k8bfiegdUlHHYuxphQb/4qWqsSuLqlf+848feh4KOH6UOtHb
	 ae/aNUCT8iL+OhQrqqkC46apPgi9GOMw6v3Grk9toel2WwXjMUNa4ycEvHoCWRKdOnMZH
	 aWqTdM6YwBFMw7Z73DnG15Ze+syG0Abpe/R0wVVlqA1+uMfcDWBUyzikiEkynLEL0j16c
	 EzQ4PbmTyIlbK55zf7JwyWOe4M0x/NM+XI6+C6nFxGV1TqYBZrSqh883Z5xy8czsMK53Q
	 aDZ2PPHakA63C864/9PBG+8InmGY4/gMpEf/ypjNw2mScrKM6AfyjTs+aa638VZ4H5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=li0sHq2m;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA193606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA193606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=li0sHq2m
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so5166928a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795428168; x=1796032968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U5fmRl7VLOuEYCBD7EtGXC6AhEnchrAVlkeohL5NfGk=;
        b=li0sHq2mCmwwRFH+LLFzvwWgCT9ZJMjiSXz8Q8lvN8eXtk1T7jXaLFbWt1kW4dE5GL
         4cIDkGnzjMOWhPDb7+65owWaa47Xxmn9XL+HE8Yh7CvJxOWKsicn1ViWpxFBRAmM6afn
         C4A6P8BtCvTV2qKms4AZztZ1ruFalyZ0JpSrQqKOX3G6gCo0j5izFoDbDV2gcl4igG9J
         qoHyPm/nRwaelbzuiW61pIus+rjpJcBku4wOi8ORO0pKx1pK3JS3pRywjB6Ca8crHVxH
         FqY3CMwE4gaEf6r5+PekFhkfyNQqlUOfo9ziml38HdJetVMAf1uvPh4dfCq65UThWQ9r
         iCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428168; x=1796032968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5fmRl7VLOuEYCBD7EtGXC6AhEnchrAVlkeohL5NfGk=;
        b=g1Mc8okvDiPG9nokpUx/Wu6LIZtZrghXmZu2si0qNEqs1fwxbN/+KSn27qgV56q5Wy
         kypikzWF1zlPi+l8rjfexAbt70kW6SOTDTFp202FytmdVJqWbftK0yJFM8cuOrv5fG/A
         OO4wgKm3h6DZIC49jzNVWi0TVTLz8wynpkyzdbxvA62v8rnO3+vFaCw5/+KulS2TUofK
         IswpUanlNmynpUi1Rh1l9SjCy4ZLQ6aAfVkfdMbN03SXRd7YxWlEwmGN6y/YUTniAs6l
         SjO4QEwYG+dTp47fwkFsmdNbY5wY1Rq/ea16/BRCa0yT4HdN4XAp9H/sE1Kv0eIuxsOC
         LEjw==
X-Forwarded-Encrypted: i=1; AL+hErFqe3vDPfvufuZKKXPUZ1Z9m4PN/c4xsSQqrH3mZJGM9JArMr5pzC9EMC+DqGesese85oPbj6Dm8HYZtbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YY5CBrdVsAXO1NYwiny1gybVWeEqVwropFHk6ZIjtB58jfx27
	1+lQWNbJRCFO7adKo/mfd13CnvU5nHyvcAjGn4CrhKVQdh9Io/TAPxFB
X-Gm-Gg: AZFdTZe4SXSJGAVyhSgeJbCOw8FNkghH50PdaSjue7uzuZC1f/v2bGhUB7hiTRy6rmq
	0pPtfe3zhWVtSAOAg4BHAeC0CS/4eN/ZJTdo3KPS/a76+mUt6rUjebVAve1YkqcJevId4vgOEQf
	7XCiCqFgg2VwpXvmE3vXQp23oiUxcnXUSQHRif/JgnnkkQAnH4liLXycHtCZxckXV347upoEu1w
	fzGt3bsVfSvhEzmXw0+QT/qytN8f4cee/AIvCZrMP4+ysl4jUB5/kJNgA/ICRQuMkP5n5PK81T+
	7qeLxrcYuIw3fWoKEBjez6BCW6TJpb8/7lwd2naV1/IYn5DuNYSXJDWB2a/IfiZpwcCEzNiFHza
	GsnTiGkPsCYvsG8uNh4re6lNEu/ozrlwYXoym3HWOCTJY8AC4X7YqX+ItMyTz9DK4gMMgqSCb9q
	RDofKsdyu07mspKD8nzXVZXU7PI/rgVmNq/iEa49YC4IIHV825fmrnUW8nQf2qcVJvhs4w9OwRj
	AAh9jbpQyWBnCoqOp5O0yHuxWvjh3rFULUf7K0azilIim8JgTh71vhMXbTBUIWLOWBsjm6SFTC2
	5OejiGt4P3P841Ke1VMRII5OJahox4+WHErNiDopln9fHfMbi4kSJnOE2quFAkvncyNVfITYtPH
	HJZPhwo4hcg==
X-Received: by 2002:a17:906:397:b0:c41:26b8:c49d with SMTP id a640c23a62f3a-c513aab9965mr692564366b.38.1795428168018;
        Mon, 23 Nov 2026 02:02:48 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8dc60sm379265766b.34.2026.11.23.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:02:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] ASoC: tegra: Add support for mono channel to Tegra20/Tegra30 I2S DAIs
Date: Mon, 23 Nov 2026 12:02:28 +0200
Message-ID: <20261123100228.77797-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

According to the TRM, both Tegra20 and Tegra30 I2S should be able to
support a mono channel for non-DSP formats, while the number of channels
for the DSP (FSYNC) format should remain restricted to a minimum of two
for Tegra30+.

Implement support for mono audio by adjusting the I2S clock and divider
calculation logic for both Tegra20 and Tegra30+.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
I2S clock calculations were adjusted to match those found in downstream
sources for Tegra20 up to Tegra124. This change was tested on the LG
Optimus Vu (P895), and sound was consistent with both mono and dual
channels, with no distortion.
---
 sound/soc/tegra/tegra20_i2s.c | 21 ++++++++++++++++-----
 sound/soc/tegra/tegra30_i2s.c | 31 +++++++++++++++++++++----------
 2 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 2978c9d6f4839..285923e6aeffa 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -144,7 +144,12 @@ static int tegra20_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct device *dev = dai->dev;
 	struct tegra20_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask, val;
-	int ret, sample_size, srate, i2sclock, bitcnt;
+	int ret, sample_size, srate, i2sclock, bitcnt, i2sclk_div, is_dsp;
+
+	is_dsp = regmap_test_bits(i2s->regmap, TEGRA20_I2S_CTRL,
+				  TEGRA20_I2S_CTRL_BIT_FORMAT_DSP);
+	if (is_dsp < 0)
+		return is_dsp;
 
 	mask = TEGRA20_I2S_CTRL_BIT_SIZE_MASK;
 	switch (params_format(params)) {
@@ -174,18 +179,24 @@ static int tegra20_i2s_hw_params(struct snd_pcm_substream *substream,
 	/* Final "* 2" required by Tegra hardware */
 	i2sclock = srate * params_channels(params) * sample_size * 2;
 
+	/* Additional "* 2" is needed for DSP mode */
+	if (is_dsp)
+		i2sclock *= 2;
+
 	ret = clk_set_rate(i2s->clk_i2s, i2sclock);
 	if (ret) {
 		dev_err(dev, "Can't set I2S clock rate: %d\n", ret);
 		return ret;
 	}
 
-	bitcnt = (i2sclock / (2 * srate)) - 1;
+	i2sclk_div = is_dsp ? srate : params_channels(params) * srate;
+
+	bitcnt = (i2sclock / i2sclk_div) - 1;
 	if (bitcnt < 0 || bitcnt > TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US)
 		return -EINVAL;
 	val = bitcnt << TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT;
 
-	if (i2sclock % (2 * srate))
+	if (i2sclock % i2sclk_div)
 		val |= TEGRA20_I2S_TIMING_NON_SYM_ENABLE;
 
 	regmap_write(i2s->regmap, TEGRA20_I2S_TIMING, val);
@@ -330,14 +341,14 @@ static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
 static const struct snd_soc_dai_driver tegra20_i2s_dai_template = {
 	.playback = {
 		.stream_name = "Playback",
-		.channels_min = 2,
+		.channels_min = 1,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.capture = {
 		.stream_name = "Capture",
-		.channels_min = 2,
+		.channels_min = 1,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index e5e648d00621b..433a7eb873b43 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -137,10 +137,16 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct device *dev = dai->dev;
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask, val, reg;
-	int ret, sample_size, srate, i2sclock, bitcnt;
+	int ret, sample_size, srate, i2sclock, bitcnt, i2sclk_div, is_dsp;
 	struct tegra30_ahub_cif_conf cif_conf;
 
-	if (params_channels(params) != 2)
+	is_dsp = regmap_test_bits(i2s->regmap, TEGRA30_I2S_CTRL,
+				  TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC);
+	if (is_dsp < 0)
+		return is_dsp;
+
+	/* For DSP format min amount of channels is still two */
+	if (params_channels(params) != 2 && is_dsp)
 		return -EINVAL;
 
 	mask = TEGRA30_I2S_CTRL_BIT_SIZE_MASK;
@@ -157,10 +163,15 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	srate = params_rate(params);
 
-	/* Final "* 2" required by Tegra hardware */
-	i2sclock = srate * params_channels(params) * sample_size * 2;
+	i2sclock = srate * params_channels(params) * sample_size;
+
+	/* Additional "* 4" is needed for DSP mode */
+	if (is_dsp)
+		i2sclock *= 4;
+
+	i2sclk_div = is_dsp ? srate : params_channels(params) * srate;
 
-	bitcnt = (i2sclock / (2 * srate)) - 1;
+	bitcnt = (i2sclock / i2sclk_div) - 1;
 	if (bitcnt < 0 || bitcnt > TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US)
 		return -EINVAL;
 
@@ -172,14 +183,14 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	val = bitcnt << TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT;
 
-	if (i2sclock % (2 * srate))
+	if (i2sclock % i2sclk_div)
 		val |= TEGRA30_I2S_TIMING_NON_SYM_ENABLE;
 
 	regmap_write(i2s->regmap, TEGRA30_I2S_TIMING, val);
 
 	cif_conf.threshold = 0;
-	cif_conf.audio_channels = 2;
-	cif_conf.client_channels = 2;
+	cif_conf.audio_channels = params_channels(params);
+	cif_conf.client_channels = params_channels(params);
 	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
 	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
 	cif_conf.expand = 0;
@@ -323,14 +334,14 @@ static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
 static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
 	.playback = {
 		.stream_name = "Playback",
-		.channels_min = 2,
+		.channels_min = 1,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.capture = {
 		.stream_name = "Capture",
-		.channels_min = 2,
+		.channels_min = 1,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
-- 
2.53.0

