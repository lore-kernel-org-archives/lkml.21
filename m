Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797889;
	b=yQLzbQ8hHVyFUa/NoFyCKYNnZbyaIhptFanQXLO/HubYOqSJNJ+CiXvpi7tpbMWxVTky
	 35OjT97it3FVLdBF0wcwA4a6EYPDiXY4+bI5OldQZHfmEZeM2QMXRUGXQkak02gCxpjS8
	 wbT1BpojCNN2KSTovhX04Y8HOn3nrdGaoAouU/4EJTGVOzNSbTwQNZ5ZynVTRCKi31Pjx
	 s1N2TWfvSO2EIvThV37JcWd9Byv0aXDnIJzt8P6pYfBLj1F/CM3vfXWIewZo7wnWLlTw2
	 dQnChO7kzVvs2qCXAlIgXxBWKg24aZ4JApGSckPryM/xJYrfQ40Fjrgz3Vm9tufDECQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KTRMnPPdfeGg8LaA/1S6poYzQtNeoatW14gLT5kRLjM=;
	b=ja5evlcDuteoqrTMKioIuKkxFh7UXXLUCdmpIK7I5NgbEnjsqxgfrEVQ3VhQ0I0ndzAb
	 ULzyfOBY3QBXx4lmoYBkBkGi5JTDUESz7LvTitgzke80pPdFHqb/XF14jpgKggPE1+YLh
	 39K95VC5YMISvls9SCh+v8+LTf4nKyFGLgAQ8+eJegHDeG2rBdJxJEeD7G2PEt2bd1ZtK
	 oKUD1EIJxIinjsFOUXWFy1HhgaV8XVMqXEqnLjmYbceuFmj5HACr3ll3wECRWIdpNheHH
	 YkxSTswCF72yu+Bk4qLx1RtcVUa65/RadLqJQq611MOSIEiy1BnAUvPphsx4qutT+YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CcvaCvpG;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C0E606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02C0E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CcvaCvpG
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso1235323666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797887; x=1796402687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTRMnPPdfeGg8LaA/1S6poYzQtNeoatW14gLT5kRLjM=;
        b=CcvaCvpGiGXUipVT0/85Z7tvANU3+0v4+kPLH0L4ij7Pr/TMZN38loVoqLE4ZMDJO/
         Nf5lYJUxz66KcJKQXIIFAiUTC7/OIasBHyVNbXqx6p7Leor7KGNdYqQ4lc20YrSchsDh
         laonFda/1s6/GXdAeyRFW7Tg1aQ0norp6Rf4SdAd5Z2d1wrV3OLM0WVpbOQkM9NikTh/
         y0ee9G3dvU1oOQLtTCa/XkuOvaQv3HoYaKaEXredgBmNi2hiQUyNEQxuPddIsrVNEEVu
         fU/bPuTIIxe0USI3jrQsfnCHIZzgs4W4Urm0/rE8WDbDCkPCklaPbuuQpOXuk6dCU2Kb
         +DOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797887; x=1796402687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTRMnPPdfeGg8LaA/1S6poYzQtNeoatW14gLT5kRLjM=;
        b=eCZf+W6jI4hhyR6rjMIkUZMp3kL0TuqkGiXtutRUaOQtdnXESKk0d1jEkmNIl4se7A
         lpturY6XyXjF2nrT7D0L3em6ejkTKlNkOSHc3iSBadec7/Q0aWqzJVLb4iE+N9Di1Adc
         KVhdrQ/SL6Ff4wiu92SFF4H0McyMIYy8vCBbz+8AA2FgTC2o12WpIJS9luMgA1GJFqGb
         m7NKqNEDTaHg/zq7V1RwlYRCOlZXE1ImdtfkHmc2OwpmD2LLU6HDgNZ3xKQzE7ed4KY5
         rOUaUVouoSes17ckXz/tPONC2O4SO6w08lqmn9DYhdFFYXcEicSDELCNPgPDJFXdPKux
         Rxng==
X-Gm-Message-State: APuU4Z8eT/i3w0PEAPrCUwyRw6P9NMxhmo0yDq7KGN6C7XJjAeKL1xHh
	N8NykMJu/0onCro8AhvupmidEAtfk+L7mSYuUL4nbEZbg38z2Vp5EheY
X-Gm-Gg: AZFdTZcB1k2gp4l8RZiAbTAdNVGLcqHw7/JppV7GY+iXi9Y2TSZ0cz3eDfWGrzE+Zyj
	NC2JvcfWysKohQYDJ/YaABL2qfS/RlR6kfKGNU+yAOHUFB8O23SpxY3QjfYsKc74pdbFbDZRnGS
	V/Zj3otLCM3axB3bhL5bj+YeIUBLrVkJlpqfwoNshybzpZ2+8Z32eMjqz1t+DLWj2jQ7JvAtwgS
	SR0/NgmmyKkAQfPrHI3SxIPbrFE+u1p7qXT+yNVUBxRt6/sGU2KROeJpKUUKsrlIH3JB9IpjfM7
	vGIKYmwTPi4UETZEnHIuCfa15MRicyP+BYAVeRGMDnj41a1bJiavVg1TQqlz09dHxL/DFLtCnQQ
	SP4GADTaO7UQf0pEoe279WQpBRwa5DtwpWGTuMCsxHn1gJkC2CelxuqS6XFRT1GfJrwkpgVZls8
	UzBQTW/URfu5sgt+Z4dKZxnEHoc5BP7NYzWC7B2d3nwnG9HBb2dLqhb47LK6njFFHVD6gUZz6eE
	XZNbdvciJwO03lhpuB4Rfkwmwvvofo6lCYnCK2NoXly0uFw+u135U9bj2fRPgCBR82Z8ta7/BSm
	OmW5onpvRuUkjf2kHLuyJ1uVv5SwolcWoHcQaSA367vPbV8nw5sskoxMNN3SErhKcGOCOhv/3vs
	K8xJAKTYRuwo=
X-Received: by 2002:a17:906:f885:b0:c4c:fd37:bb0c with SMTP id a640c23a62f3a-c513aaea94amr1456318666b.29.1795797887201;
        Fri, 27 Nov 2026 08:44:47 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm866092766b.85.2026.11.27.08.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:44:46 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/3] ASoC: tegra: Generalize forced DAPM pin enabling via tegra_asoc_data
Date: Fri, 27 Nov 2026 18:44:33 +0200
Message-ID: <20261127164436.292585-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127164436.292585-1-clamor95@gmail.com>
References: <20261127164436.292585-1-clamor95@gmail.com>
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

Introduce a dapm_fe_pin_name field in struct tegra_asoc_data to handle
force-enabling DAPM pins (such as "MICBIAS" or "MICBIAS1") directly inside
the common tegra_asoc_machine_init() function.

This cleanup allows the removal of repetitive, boilerplate codec-specific
initialization functions (tegra_rt5677_init(), tegra_wm8903_init(), and
tegra_wm8962_init()) and points their DAI link init callbacks directly to
tegra_asoc_machine_init().

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 62 ++++++----------------------
 sound/soc/tegra/tegra_asoc_machine.h |  1 +
 2 files changed, 14 insertions(+), 49 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 0e0830d2733b9..eb78c89fc5043 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -154,6 +154,7 @@ static const struct snd_kcontrol_new tegra_wm8994_controls[] = {
 static int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
@@ -252,6 +253,9 @@ static int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
 		}
 	}
 
+	if (machine->asoc->dapm_fe_pin_name)
+		snd_soc_dapm_force_enable_pin(dapm, machine->asoc->dapm_fe_pin_name);
+
 	return 0;
 }
 
@@ -908,21 +912,6 @@ static const struct tegra_asoc_data tegra_trimslice_data = {
 
 /* RT5677 machine */
 
-static int tegra_rt5677_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	int err;
-
-	err = tegra_asoc_machine_init(rtd);
-	if (err)
-		return err;
-
-	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS1");
-
-	return 0;
-}
-
 SND_SOC_DAILINK_DEFS(rt5677_aif1,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5677-aif1")),
@@ -931,7 +920,7 @@ SND_SOC_DAILINK_DEFS(rt5677_aif1,
 static struct snd_soc_dai_link tegra_rt5677_dai = {
 	.name = "RT5677",
 	.stream_name = "RT5677 PCM",
-	.init = tegra_rt5677_init,
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
@@ -948,6 +937,7 @@ static struct snd_soc_card snd_soc_tegra_rt5677 = {
 static const struct tegra_asoc_data tegra_rt5677_data = {
 	.mclk_rate = tegra_machine_mclk_rate_256,
 	.card = &snd_soc_tegra_rt5677,
+	.dapm_fe_pin_name = "MICBIAS1",
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
@@ -998,7 +988,7 @@ SND_SOC_DAILINK_DEFS(rt5632_hifi,
 static struct snd_soc_dai_link tegra_rt5632_dai = {
 	.name = "ALC5632",
 	.stream_name = "ALC5632 PCM",
-	.init = tegra_rt5677_init,
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
@@ -1015,6 +1005,7 @@ static struct snd_soc_card snd_soc_tegra_rt5632 = {
 static const struct tegra_asoc_data tegra_rt5632_data = {
 	.mclk_rate = tegra_machine_mclk_rate_512,
 	.card = &snd_soc_tegra_rt5632,
+	.dapm_fe_pin_name = "MICBIAS1",
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
@@ -1089,21 +1080,6 @@ static const struct tegra_asoc_data tegra_cpcap_data = {
 
 /* WM8903 machine */
 
-static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	int err;
-
-	err = tegra_asoc_machine_init(rtd);
-	if (err)
-		return err;
-
-	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
-
-	return 0;
-}
-
 SND_SOC_DAILINK_DEFS(hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8903-hifi")),
@@ -1112,7 +1088,7 @@ SND_SOC_DAILINK_DEFS(hifi,
 static struct snd_soc_dai_link tegra_wm8903_dai = {
 	.name = "WM8903",
 	.stream_name = "WM8903 PCM",
-	.init = tegra_wm8903_init,
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
@@ -1132,6 +1108,7 @@ static struct snd_soc_card snd_soc_tegra_wm8903 = {
 static const struct tegra_asoc_data tegra_wm8903_data_legacy = {
 	.mclk_rate = tegra_machine_mclk_rate_6mhz,
 	.card = &snd_soc_tegra_wm8903,
+	.dapm_fe_pin_name = "MICBIAS",
 	.hp_jack_gpio_active_low = true,
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
@@ -1143,6 +1120,7 @@ static const struct tegra_asoc_data tegra_wm8903_data_legacy = {
 static const struct tegra_asoc_data tegra_wm8903_data = {
 	.mclk_rate = tegra_machine_mclk_rate_6mhz,
 	.card = &snd_soc_tegra_wm8903,
+	.dapm_fe_pin_name = "MICBIAS",
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
@@ -1152,21 +1130,6 @@ static const struct tegra_asoc_data tegra_wm8903_data = {
 
 /* WM8962 machine */
 
-static int tegra_wm8962_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	int err;
-
-	err = tegra_asoc_machine_init(rtd);
-	if (err)
-		return err;
-
-	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
-
-	return 0;
-}
-
 SND_SOC_DAILINK_DEFS(wm8962_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8962")),
@@ -1175,7 +1138,7 @@ SND_SOC_DAILINK_DEFS(wm8962_hifi,
 static struct snd_soc_dai_link tegra_wm8962_dai = {
 	.name = "WM8962",
 	.stream_name = "WM8962 PCM",
-	.init = tegra_wm8962_init,
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
@@ -1193,6 +1156,7 @@ static struct snd_soc_card snd_soc_tegra_wm8962 = {
 static const struct tegra_asoc_data tegra_wm8962_data = {
 	.mclk_rate = tegra_machine_mclk_rate_12mhz,
 	.card = &snd_soc_tegra_wm8962,
+	.dapm_fe_pin_name = "MICBIAS",
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
diff --git a/sound/soc/tegra/tegra_asoc_machine.h b/sound/soc/tegra/tegra_asoc_machine.h
index 2034ce8e0689e..8ff39b53930c5 100644
--- a/sound/soc/tegra/tegra_asoc_machine.h
+++ b/sound/soc/tegra/tegra_asoc_machine.h
@@ -13,6 +13,7 @@ struct snd_soc_pcm_runtime;
 
 struct tegra_asoc_data {
 	unsigned int (*mclk_rate)(unsigned int srate);
+	const char *dapm_fe_pin_name;
 	const char *codec_dev_name;
 	const char *hp_jack_name;
 	struct snd_soc_card *card;
-- 
2.53.0

