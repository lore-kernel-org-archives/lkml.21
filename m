Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797890;
	b=T6/XwwgtMBukM9nVJ7y6Hyok3P5AHBIvnmZcDTE9l9ug2EhLuFgIrVR17ihRFuWJyLzR
	 oaXg9iZhrxqzJu/f6BaLNnxysVBnGetwzhiC0q5mGqfKJ7T2WDpc5EP/0SRSb/lwBKGkt
	 Q+SfmxGleEAngr2YPFz0WIwBM3AAhLhO1VxJwEIBdenb9mQJ4wLOF0RMcy+/lJNeiirka
	 9t/9k8UHwjcqgmN3PNTjlXx/WkGygzvWqpZAb/hgbCegaQTOef1YHjlsGT1ae5X54wJOc
	 DXTt9tKccLfuQAhw6GzSClrWmS4YDpRhWSoJbBjQFnWrYUt67CRu5eKzvvXjF9qQJhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cer+c2n5gt4gMBvfL06u4xX9piF8QfQQHfFCBwCJL+w=;
	b=X6Vsv1VCsJJQdSPESMAUjkH20k22Xnkp4SOLJu1TeDiQBXy4Y/QhcPas55WD5iwNPG8I
	 IuUGG5QSt87RJLkEfVpYQ6//t7dNilKqfG8pBTnkJwNLLOrauGGatn2o9cmyrfb/GXqLr
	 eiLH6sK8YI/W2iDBIXSgK2OByvD07UdM+vrQidyAkMxH0IZ/VLK4qxD8cCDANHqLNCiMi
	 zSfZsWzCJlJF3AAF4/iuNfiDBXHUODLRlhiVfHz0ludnyY4xXO996R3JxcITLyog3FQ/y
	 YmwExjgM+sPH73/uLpZozqURZQ7UjAgRK29ZLVQoBwE8Rr3xrbu+x3HJiv3A198en2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hB7h4t6w;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55008606A680
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55008606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hB7h4t6w
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4322d310e7so406104166b.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797889; x=1796402689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cer+c2n5gt4gMBvfL06u4xX9piF8QfQQHfFCBwCJL+w=;
        b=hB7h4t6wg+gBdsm1UE9I/Yj4wFvIJg/vr2Sm3XoKYvOhYDBFFbbQaNYWes+8trjnmq
         zHkhdX2hR9LVbulpWEb4ZQUAG+H5s4uJMgW3F6Ibhf3/Zh8NJlLAuQPhFQYQ4m/7drI5
         WDn+MK5Ch21y+MjvPZIe5IthceaukV3K8FDziq9e+oaWrfD0hNF9zLSMxO6DzK/vieJ5
         C49idxpHF0o2TNpgQGxPP/XeEn0aAWD+j0KO+/yZw51Wa61+uxXjvVTx43oxzVQ04p3b
         +yYsTGe1KdTp4GT4ztaKYwrKk24qIEEZqOWA036zlkdSOEUCWBVR6+Ny3pNnr5rYgWxI
         sDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797889; x=1796402689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cer+c2n5gt4gMBvfL06u4xX9piF8QfQQHfFCBwCJL+w=;
        b=fF9GQhdILOpebdS+ZeNlFZ+6NuIzxvOhz68/2WT6utBkgx4ymAWOCfyadU0EBiHU2m
         c1Bhkk1NQeDNgGR7InZeONPgyy4+bf/aJyVzrRJViCR3xoCD1THLGyoV932nZkRNXr7n
         aCtbTX9kfqtQrcpBvh8SdOFJDoV7LhSzBaNLqZQfHHoo8EH13tMy1THmRaz8WTJym9lT
         +Qk2jp7R2b14/A0h4gAQYQ4FKp0JVtpfNkUbHarn08XP7074D1UZLom6k+Mc33ECqnXW
         +VBT/kj/6ZyqqdwgspvAhFZIbiboOpkMvNPvo/KF3WF2Ge7+1xBsgpRAuz4un4P7D64h
         ZmKQ==
X-Gm-Message-State: APuU4Z+G2mtfqai1vKyQgYo9r4SM0ctMJcgPz42lZIt0y8873dFTq2dm
	La9sZCjTIjCXV3xmWdmRJSohsu3lg1Oybj/A02GsHPd+LVnHpNsr/dwr
X-Gm-Gg: AZFdTZcpIQaR7ykLKjBvDAwPtsvFdD0MJbM3QSsCLgIL+ivfBUMdfMN8Oha4wddpkqo
	9X2Qm43IOtcokjTPi6K2bvT2g1HcKZKCHSmD2Wo43cXSz7HGA1i7fiV+Kpu9oka4lG86Tc3EoNh
	xgZukRewN4M59Lg2HQGN1cRt7ucW8abbzZL/VrXvv9s7qnsY3CVdPtO3pQFCCOYGaOWjYHB60zD
	zvS8sFbLMklB/q/GJJANw27z0kl+wprXPHbgBEfqHn9ruRNohAZXoq738iceXTPAlvPbXOGw4AE
	Ebtf8c1y3Zusvo9DSos0abVQ2/Lv6DbvuNn4K8QXMPz95D6O7FT58nVyGJGWrVDBvpZf9cNF6xZ
	CUirxosSNIHlq5EuAH7qZ7wF0tZPO/mkH2azMtDhw4xVzqZ8nszpxYFibs2uUlN/LMq03NdHHrk
	qa3IWH1g7Ap6ZHRexm4ELgBG+RJwEd4gKDMpaOMroM8U4GKW07Ce3vLPwZF6EM2tLsb/L64tyKe
	2F6MuKZ/OTGouroBk7Xkfq2KqSZhPDHP5eyhVY6s21wOpVQYSCL3BGyFp8me7/yLJYNHSTzE9SW
	sTx9iNMuXWzemuXvB5GySpE3R2/1m+4PjjASSsdVuum9JSUDROvJcfoZkuzI6XdNTVeIhkPIjbF
	CCLi96/WPUpEYI7tTyAW6SXMHdq1TWV8=
X-Received: by 2002:a17:906:1310:b0:c31:8984:7fad with SMTP id a640c23a62f3a-c513a999e32mr1717054566b.15.1795797888567;
        Fri, 27 Nov 2026 08:44:48 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm866092766b.85.2026.11.27.08.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:44:48 -0800 (PST)
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
Subject: [PATCH v2 3/3] ASoC: tegra: Reorder the codec structures and sort the machine OF match table alphabetically
Date: Fri, 27 Nov 2026 18:44:34 +0200
Message-ID: <20261127164436.292585-4-clamor95@gmail.com>
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

Reorder the codec structures and sort the "tegra_machine_of_match" table
alphabetically by codec names and their compatible strings for cleaner
organization and easier maintenance.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 366 +++++++++++++--------------
 1 file changed, 183 insertions(+), 183 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index eb78c89fc5043..fcb5ff58414c2 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -699,69 +699,70 @@ static int tegra_asoc_machine_probe(struct platform_device *pdev)
 	return 0;
 }
 
-/* WM8753 machine */
+/* CPCAP machine */
 
-SND_SOC_DAILINK_DEFS(wm8753_hifi,
+SND_SOC_DAILINK_DEFS(cpcap_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8753-hifi")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "cpcap-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_wm8753_dai = {
-	.name = "WM8753",
-	.stream_name = "WM8753 PCM",
+static struct snd_soc_dai_link tegra_cpcap_dai = {
+	.name = "CPCAP",
+	.stream_name = "CPCAP PCM",
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(wm8753_hifi),
+		   SND_SOC_DAIFMT_CBP_CFP,
+	SND_SOC_DAILINK_REG(cpcap_hifi),
 };
 
-static struct snd_soc_card snd_soc_tegra_wm8753 = {
-	.components = "codec:wm8753",
-	.dai_link = &tegra_wm8753_dai,
+static struct snd_soc_card snd_soc_tegra_cpcap = {
+	.components = "codec:cpcap",
+	.dai_link = &tegra_cpcap_dai,
 	.num_links = 1,
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_wm8753_data = {
-	.mclk_rate = tegra_machine_mclk_rate_12mhz,
-	.card = &snd_soc_tegra_wm8753,
+static const struct tegra_asoc_data tegra_cpcap_data = {
+	.mclk_rate = tegra_machine_mclk_rate_cpcap,
+	.card = &snd_soc_tegra_cpcap,
 	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
 	.add_common_snd_ops = true,
 };
 
-/* WM9712 machine */
-
-static int tegra_wm9712_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
-
-	return snd_soc_dapm_force_enable_pin(dapm, "Mic Bias");
-}
+/* MAX98088 machine */
 
-SND_SOC_DAILINK_DEFS(wm9712_hifi,
+SND_SOC_DAILINK_DEFS(max98088_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC("wm9712-codec", "wm9712-hifi")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_wm9712_dai = {
-	.name = "AC97 HiFi",
-	.stream_name = "AC97 HiFi",
-	.init = tegra_wm9712_init,
-	SND_SOC_DAILINK_REG(wm9712_hifi),
+static struct snd_soc_dai_link tegra_max98088_dai = {
+	.name = "MAX98088",
+	.stream_name = "MAX98088 PCM",
+	.init = tegra_asoc_machine_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBC_CFC,
+	SND_SOC_DAILINK_REG(max98088_hifi),
 };
 
-static struct snd_soc_card snd_soc_tegra_wm9712 = {
-	.components = "codec:wm9712",
-	.dai_link = &tegra_wm9712_dai,
+static struct snd_soc_card snd_soc_tegra_max98088 = {
+	.components = "codec:max98088",
+	.dai_link = &tegra_max98088_dai,
 	.num_links = 1,
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_wm9712_data = {
-	.card = &snd_soc_tegra_wm9712,
+static const struct tegra_asoc_data tegra_max98088_data = {
+	.mclk_rate = tegra_machine_mclk_rate_12mhz,
+	.card = &snd_soc_tegra_max98088,
 	.add_common_dapm_widgets = true,
-	.codec_dev_name = "wm9712-codec",
-	.set_ac97 = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
 };
 
 /* MAX98090 machine */
@@ -799,33 +800,33 @@ static const struct tegra_asoc_data tegra_max98090_data = {
 	.add_hp_jack = true,
 };
 
-/* MAX98088 machine */
+/* RT5631 machine */
 
-SND_SOC_DAILINK_DEFS(max98088_hifi,
+SND_SOC_DAILINK_DEFS(rt5631_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5631-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_max98088_dai = {
-	.name = "MAX98088",
-	.stream_name = "MAX98088 PCM",
+static struct snd_soc_dai_link tegra_rt5631_dai = {
+	.name = "RT5631",
+	.stream_name = "RT5631 PCM",
 	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(max98088_hifi),
+	SND_SOC_DAILINK_REG(rt5631_hifi),
 };
 
-static struct snd_soc_card snd_soc_tegra_max98088 = {
-	.components = "codec:max98088",
-	.dai_link = &tegra_max98088_dai,
+static struct snd_soc_card snd_soc_tegra_rt5631 = {
+	.components = "codec:rt5631",
+	.dai_link = &tegra_rt5631_dai,
 	.num_links = 1,
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_max98088_data = {
-	.mclk_rate = tegra_machine_mclk_rate_12mhz,
-	.card = &snd_soc_tegra_max98088,
+static const struct tegra_asoc_data tegra_rt5631_data = {
+	.mclk_rate = tegra_machine_mclk_rate_6mhz,
+	.card = &snd_soc_tegra_rt5631,
 	.add_common_dapm_widgets = true,
 	.add_common_controls = true,
 	.add_common_snd_ops = true,
@@ -833,81 +834,71 @@ static const struct tegra_asoc_data tegra_max98088_data = {
 	.add_hp_jack = true,
 };
 
-/* SGTL5000 machine */
+/* RT5632 machine */
 
-SND_SOC_DAILINK_DEFS(sgtl5000_hifi,
+SND_SOC_DAILINK_DEFS(rt5632_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sgtl5000")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "alc5632-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_sgtl5000_dai = {
-	.name = "sgtl5000",
-	.stream_name = "HiFi",
+static struct snd_soc_dai_link tegra_rt5632_dai = {
+	.name = "ALC5632",
+	.stream_name = "ALC5632 PCM",
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(sgtl5000_hifi),
+	SND_SOC_DAILINK_REG(rt5632_hifi),
 };
 
-static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
-	.components = "codec:sgtl5000",
-	.dai_link = &tegra_sgtl5000_dai,
+static struct snd_soc_card snd_soc_tegra_rt5632 = {
+	.components = "codec:rt5632",
+	.dai_link = &tegra_rt5632_dai,
 	.num_links = 1,
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_sgtl5000_data = {
-	.mclk_rate = tegra_machine_mclk_rate_12mhz,
-	.card = &snd_soc_tegra_sgtl5000,
+static const struct tegra_asoc_data tegra_rt5632_data = {
+	.mclk_rate = tegra_machine_mclk_rate_512,
+	.card = &snd_soc_tegra_rt5632,
+	.dapm_fe_pin_name = "MICBIAS1",
 	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
 	.add_common_snd_ops = true,
+	.add_headset_jack = true,
 };
 
-/* TLV320AIC23 machine */
-
-static const struct snd_soc_dapm_widget trimslice_dapm_widgets[] = {
-	SND_SOC_DAPM_HP("Line Out", NULL),
-	SND_SOC_DAPM_LINE("Line In", NULL),
-};
-
-static const struct snd_soc_dapm_route trimslice_audio_map[] = {
-	{"Line Out", NULL, "LOUT"},
-	{"Line Out", NULL, "ROUT"},
-
-	{"LLINEIN", NULL, "Line In"},
-	{"RLINEIN", NULL, "Line In"},
-};
+/* RT5640 machine */
 
-SND_SOC_DAILINK_DEFS(tlv320aic23_hifi,
+SND_SOC_DAILINK_DEFS(rt5640_aif1,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "tlv320aic23-hifi")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5640-aif1")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
-	.name = "TLV320AIC23",
-	.stream_name = "AIC23",
+static struct snd_soc_dai_link tegra_rt5640_dai = {
+	.name = "RT5640",
+	.stream_name = "RT5640 PCM",
+	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(tlv320aic23_hifi),
+	SND_SOC_DAILINK_REG(rt5640_aif1),
 };
 
-static struct snd_soc_card snd_soc_tegra_trimslice = {
-	.name = "tegra-trimslice",
-	.components = "codec:tlv320aic23",
-	.dai_link = &tegra_tlv320aic23_dai,
+static struct snd_soc_card snd_soc_tegra_rt5640 = {
+	.components = "codec:rt5640",
+	.dai_link = &tegra_rt5640_dai,
 	.num_links = 1,
-	.dapm_widgets = trimslice_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(trimslice_dapm_widgets),
-	.dapm_routes = trimslice_audio_map,
-	.num_dapm_routes = ARRAY_SIZE(trimslice_audio_map),
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_trimslice_data = {
-	.mclk_rate = tegra_machine_mclk_rate_128,
-	.card = &snd_soc_tegra_trimslice,
+static const struct tegra_asoc_data tegra_rt5640_data = {
+	.mclk_rate = tegra_machine_mclk_rate_256,
+	.card = &snd_soc_tegra_rt5640,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
 	.add_common_snd_ops = true,
+	.add_hp_jack = true,
 };
 
 /* RT5677 machine */
@@ -945,136 +936,110 @@ static const struct tegra_asoc_data tegra_rt5677_data = {
 	.add_hp_jack = true,
 };
 
-/* RT5640 machine */
+/* SGTL5000 machine */
 
-SND_SOC_DAILINK_DEFS(rt5640_aif1,
+SND_SOC_DAILINK_DEFS(sgtl5000_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5640-aif1")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sgtl5000")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_rt5640_dai = {
-	.name = "RT5640",
-	.stream_name = "RT5640 PCM",
-	.init = tegra_asoc_machine_init,
+static struct snd_soc_dai_link tegra_sgtl5000_dai = {
+	.name = "sgtl5000",
+	.stream_name = "HiFi",
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(rt5640_aif1),
+	SND_SOC_DAILINK_REG(sgtl5000_hifi),
 };
 
-static struct snd_soc_card snd_soc_tegra_rt5640 = {
-	.components = "codec:rt5640",
-	.dai_link = &tegra_rt5640_dai,
+static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
+	.components = "codec:sgtl5000",
+	.dai_link = &tegra_sgtl5000_dai,
 	.num_links = 1,
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_rt5640_data = {
-	.mclk_rate = tegra_machine_mclk_rate_256,
-	.card = &snd_soc_tegra_rt5640,
+static const struct tegra_asoc_data tegra_sgtl5000_data = {
+	.mclk_rate = tegra_machine_mclk_rate_12mhz,
+	.card = &snd_soc_tegra_sgtl5000,
 	.add_common_dapm_widgets = true,
-	.add_common_controls = true,
 	.add_common_snd_ops = true,
-	.add_hp_jack = true,
 };
 
-/* RT5632 machine */
-
-SND_SOC_DAILINK_DEFS(rt5632_hifi,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "alc5632-hifi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+/* TLV320AIC23 machine */
 
-static struct snd_soc_dai_link tegra_rt5632_dai = {
-	.name = "ALC5632",
-	.stream_name = "ALC5632 PCM",
-	.init = tegra_asoc_machine_init,
-	.dai_fmt = SND_SOC_DAIFMT_I2S |
-		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(rt5632_hifi),
+static const struct snd_soc_dapm_widget trimslice_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Line Out", NULL),
+	SND_SOC_DAPM_LINE("Line In", NULL),
 };
 
-static struct snd_soc_card snd_soc_tegra_rt5632 = {
-	.components = "codec:rt5632",
-	.dai_link = &tegra_rt5632_dai,
-	.num_links = 1,
-	.fully_routed = true,
-};
+static const struct snd_soc_dapm_route trimslice_audio_map[] = {
+	{"Line Out", NULL, "LOUT"},
+	{"Line Out", NULL, "ROUT"},
 
-static const struct tegra_asoc_data tegra_rt5632_data = {
-	.mclk_rate = tegra_machine_mclk_rate_512,
-	.card = &snd_soc_tegra_rt5632,
-	.dapm_fe_pin_name = "MICBIAS1",
-	.add_common_dapm_widgets = true,
-	.add_common_controls = true,
-	.add_common_snd_ops = true,
-	.add_headset_jack = true,
+	{"LLINEIN", NULL, "Line In"},
+	{"RLINEIN", NULL, "Line In"},
 };
 
-/* RT5631 machine */
-
-SND_SOC_DAILINK_DEFS(rt5631_hifi,
+SND_SOC_DAILINK_DEFS(tlv320aic23_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5631-hifi")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "tlv320aic23-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_rt5631_dai = {
-	.name = "RT5631",
-	.stream_name = "RT5631 PCM",
-	.init = tegra_asoc_machine_init,
+static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
+	.name = "TLV320AIC23",
+	.stream_name = "AIC23",
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(rt5631_hifi),
+	SND_SOC_DAILINK_REG(tlv320aic23_hifi),
 };
 
-static struct snd_soc_card snd_soc_tegra_rt5631 = {
-	.components = "codec:rt5631",
-	.dai_link = &tegra_rt5631_dai,
+static struct snd_soc_card snd_soc_tegra_trimslice = {
+	.name = "tegra-trimslice",
+	.components = "codec:tlv320aic23",
+	.dai_link = &tegra_tlv320aic23_dai,
 	.num_links = 1,
+	.dapm_widgets = trimslice_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(trimslice_dapm_widgets),
+	.dapm_routes = trimslice_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(trimslice_audio_map),
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_rt5631_data = {
-	.mclk_rate = tegra_machine_mclk_rate_6mhz,
-	.card = &snd_soc_tegra_rt5631,
-	.add_common_dapm_widgets = true,
-	.add_common_controls = true,
+static const struct tegra_asoc_data tegra_trimslice_data = {
+	.mclk_rate = tegra_machine_mclk_rate_128,
+	.card = &snd_soc_tegra_trimslice,
 	.add_common_snd_ops = true,
-	.add_mic_jack = true,
-	.add_hp_jack = true,
 };
 
-/* CPCAP machine */
+/* WM8753 machine */
 
-SND_SOC_DAILINK_DEFS(cpcap_hifi,
+SND_SOC_DAILINK_DEFS(wm8753_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "cpcap-hifi")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8753-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link tegra_cpcap_dai = {
-	.name = "CPCAP",
-	.stream_name = "CPCAP PCM",
-	.init = tegra_asoc_machine_init,
+static struct snd_soc_dai_link tegra_wm8753_dai = {
+	.name = "WM8753",
+	.stream_name = "WM8753 PCM",
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBP_CFP,
-	SND_SOC_DAILINK_REG(cpcap_hifi),
+		   SND_SOC_DAIFMT_CBC_CFC,
+	SND_SOC_DAILINK_REG(wm8753_hifi),
 };
 
-static struct snd_soc_card snd_soc_tegra_cpcap = {
-	.components = "codec:cpcap",
-	.dai_link = &tegra_cpcap_dai,
+static struct snd_soc_card snd_soc_tegra_wm8753 = {
+	.components = "codec:wm8753",
+	.dai_link = &tegra_wm8753_dai,
 	.num_links = 1,
 	.fully_routed = true,
 };
 
-static const struct tegra_asoc_data tegra_cpcap_data = {
-	.mclk_rate = tegra_machine_mclk_rate_cpcap,
-	.card = &snd_soc_tegra_cpcap,
+static const struct tegra_asoc_data tegra_wm8753_data = {
+	.mclk_rate = tegra_machine_mclk_rate_12mhz,
+	.card = &snd_soc_tegra_wm8753,
 	.add_common_dapm_widgets = true,
-	.add_common_controls = true,
 	.add_common_snd_ops = true,
 };
 
@@ -1202,22 +1167,56 @@ static const struct tegra_asoc_data tegra_wm8994_data = {
 	.add_hp_jack = true,
 };
 
+/* WM9712 machine */
+
+static int tegra_wm9712_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
+
+	return snd_soc_dapm_force_enable_pin(dapm, "Mic Bias");
+}
+
+SND_SOC_DAILINK_DEFS(wm9712_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm9712-codec", "wm9712-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_wm9712_dai = {
+	.name = "AC97 HiFi",
+	.stream_name = "AC97 HiFi",
+	.init = tegra_wm9712_init,
+	SND_SOC_DAILINK_REG(wm9712_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_wm9712 = {
+	.components = "codec:wm9712",
+	.dai_link = &tegra_wm9712_dai,
+	.num_links = 1,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_wm9712_data = {
+	.card = &snd_soc_tegra_wm9712,
+	.add_common_dapm_widgets = true,
+	.codec_dev_name = "wm9712-codec",
+	.set_ac97 = true,
+};
+
 static const struct of_device_id tegra_machine_of_match[] = {
-	{ .compatible = "nvidia,tegra-audio-trimslice", .data = &tegra_trimslice_data },
-	{ .compatible = "nvidia,tegra-audio-max98090", .data = &tegra_max98090_data },
+	{ .compatible = "ad,tegra-audio-plutux", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "ad,tegra-audio-wm8903-medcom-wide", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "ad,tegra-audio-wm8903-tec", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "nvidia,tegra-audio-alc5632", .data = &tegra_rt5632_data },
+	{ .compatible = "nvidia,tegra-audio-cpcap", .data = &tegra_cpcap_data },
 	{ .compatible = "nvidia,tegra-audio-max98088", .data = &tegra_max98088_data },
 	{ .compatible = "nvidia,tegra-audio-max98089", .data = &tegra_max98088_data },
+	{ .compatible = "nvidia,tegra-audio-max98090", .data = &tegra_max98090_data },
+	{ .compatible = "nvidia,tegra-audio-rt5631", .data = &tegra_rt5631_data },
+	{ .compatible = "nvidia,tegra-audio-rt5640", .data = &tegra_rt5640_data },
+	{ .compatible = "nvidia,tegra-audio-rt5677", .data = &tegra_rt5677_data },
 	{ .compatible = "nvidia,tegra-audio-sgtl5000", .data = &tegra_sgtl5000_data },
-	{ .compatible = "nvidia,tegra-audio-wm9712", .data = &tegra_wm9712_data },
+	{ .compatible = "nvidia,tegra-audio-trimslice", .data = &tegra_trimslice_data },
 	{ .compatible = "nvidia,tegra-audio-wm8753", .data = &tegra_wm8753_data },
-	{ .compatible = "nvidia,tegra-audio-rt5677", .data = &tegra_rt5677_data },
-	{ .compatible = "nvidia,tegra-audio-rt5640", .data = &tegra_rt5640_data },
-	{ .compatible = "nvidia,tegra-audio-alc5632", .data = &tegra_rt5632_data },
-	{ .compatible = "nvidia,tegra-audio-rt5631", .data = &tegra_rt5631_data },
-	{ .compatible = "nvidia,tegra-audio-cpcap", .data = &tegra_cpcap_data },
-	{ .compatible = "ad,tegra-audio-plutux", .data = &tegra_wm8903_data_legacy },
-	{ .compatible = "ad,tegra-audio-wm8903-medcom-wide", .data = &tegra_wm8903_data_legacy },
-	{ .compatible = "ad,tegra-audio-wm8903-tec", .data = &tegra_wm8903_data_legacy },
 	{ .compatible = "nvidia,tegra-audio-wm8903-cardhu", .data = &tegra_wm8903_data_legacy },
 	{ .compatible = "nvidia,tegra-audio-wm8903-harmony", .data = &tegra_wm8903_data_legacy },
 	{ .compatible = "nvidia,tegra-audio-wm8903-picasso", .data = &tegra_wm8903_data_legacy },
@@ -1226,6 +1225,7 @@ static const struct of_device_id tegra_machine_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-wm8903", .data = &tegra_wm8903_data },
 	{ .compatible = "nvidia,tegra-audio-wm8962", .data = &tegra_wm8962_data },
 	{ .compatible = "nvidia,tegra-audio-wm8994", .data = &tegra_wm8994_data },
+	{ .compatible = "nvidia,tegra-audio-wm9712", .data = &tegra_wm9712_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra_machine_of_match);
-- 
2.53.0

