Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477270;
	b=u6ztQnSdHMULpmQgkx360khikooT3jZ8DAwgxKL1uenozh+w/jtN9EmOeH1GwBoxMKwr
	 1WDfuYPD7u9BIm6qTQ61aagOecyFhaa5FJ72F1ba2dJw3ad8p6HxSUg/FMv1x7H/lQKaR
	 nD1D8Hz77GgXvhIE1NhLbF2hQm36tpwQxoIFXKSYnPqYcX/Rx5nIOpfcN4cs7Fky8qv/n
	 /1plDxS4Jo1Oj4YJXxaYz1x+jY/Gb8TYBtLO+bRHyOgyMn3KV75k30TPPlbFyKy/HVd3w
	 UiHSfJtlH7+VxENEGT+HqpHB00udKC/L5Ijj+g+IYaPfV67UPxVI8qf76nskmiq8XjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2vKrN6bgTHQAPUSAXLB2sa6FXef6bZRnfsxB2+/0yI0=;
	b=1AVuNbr9rgqKBJdPGLfe5DZX9iEasDywoy9u+PEtEdlPMjjLY0q6s5VFBwCEx8Fd5Lmg
	 nrLCExodNWSPhnuyYLTRIEOv1JF5JUHwJ3Nxk9h0MNKf2/cT3YI65215vC4uDCeNeddHb
	 JMLmt+J4nhY+uOOdujVJeCYqlLXNNlFb7vr4UE4BlDS8ZMTPDzq0lX4OoRUV16T3k6M6c
	 j3FG3OLl4F1KF5GTTA4QB26DoB5J2GVIt//IWzr4SqQsWFu0BC4IdtmruAVKHemwUUanh
	 nxZ1k6Fxqk+PpBQ8lTY/8lMW03CoLYNpNz9epufITs6fLKnT9mCLC/hTXzCrmhfKCEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFe8Bkoc;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FD0606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25FD0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFe8Bkoc
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so39331685e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477268; x=1796082068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vKrN6bgTHQAPUSAXLB2sa6FXef6bZRnfsxB2+/0yI0=;
        b=vFe8BkocctGKfGnTj7d4CBl1sVvenYczE6VUmL8x2qVRoOUO8/Qtc8snFeCrvwWZKd
         Au0SH0ZRw67J6IoV+e0dDDzMkSZ5hF82jRGXOqYJqYdd0VqUWPKFx8T6S8mB3lkhd6ob
         DgRCVW602aWGLGom1Qvxc8GWIMi+urGC/qVgFoK9GddS0yoftRVk4Dqr6/NfLx8aI1il
         EhRCKGWNVGFenqp0XoTtJwVxVMpiT6uIz0VSHcbNtHY+N9895EGOT6yKHfS264cFy9N8
         +i1g450fJL/rul1GZELt1bDXAD7TyCGXnlzOB//2YSdPa70Umx5lawuzDL+CKGHEEmpp
         /CAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477268; x=1796082068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vKrN6bgTHQAPUSAXLB2sa6FXef6bZRnfsxB2+/0yI0=;
        b=rT3kGpk2szccuDRodQAjlYzyeuNV1yptcG3/K/hUjm6m0fbF2cZ1ej3O1Aiu5z8oil
         EF9Rea2TNoXXyz1DeAksrnkwy4swtF2kOzzAOhlalbgoPDS0b9juMkzwtSnrs8LYvJXE
         AYVN0aEQrecAZqAlaRhaT1i1Yh9H8+MAvAL5fGJFcsVPJq5qWTE1WNq5bsC2IZPVjF3X
         xp4tkL/gymYdpaoPI0Ptu2Qz27geU8zg0IsXBSGf2p9YOlZk3tcZFvQnmHS86tMwIxr3
         /5VkJk5/TgIsG1AZCHNlsHQ5P1vD5nb5IHooWFkKHmdBOLRlqj0+yhp9zr8LA6f+5UHe
         3aug==
X-Forwarded-Encrypted: i=1; AL+hErFCvNLZSxbgSMcwT6X0i8wtOW0dwmcmveVHwqPqLgCohMW2OoW77iIJefRVJ91Tb5Rp47qK2BlyUGQ0W+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+haqYBCjfbDt8RqLjBVpUZl52kduCas/+jZmj2yALi+oEr58Gm
	r9ZcOcbuzb0xj1JTo6AesFHBwbprCmYZV4MaJKmUX75lH8mTj6QVXz0=
X-Gm-Gg: AZFdTZd6uuFAMuOIKCggX/CvMNbzniv5U2XZTcYTKMdn5PvX1y2EwbIlE0x7ioKwJdD
	2mlYDi/bZnK/Rr337iL73+WmQj1gxm9KK1bVG6aLvnWyI+uF0AWWWVmND3hby8hNRaDiLcAe4Jk
	IO88/FmkAbDBse9Nt+xZHplcR3ODAgPt9kP/BpNrYmzUioO/CK/oOwJ9m6gXJMNt4ypqT2HxBOR
	9EWRdQmJxHfWE2bXmxT0GxgdpThITWPkHArxu+vV4Tws7+U/oBXvSZTSG0WSyOoxxq9iGnnxu6m
	D6PZzJvOgjbcvX5GjYicpr2AdimLtYUTFwWrsNz11Qx2muQal1xSSoK84FAQ0pNpd/GXEAPsHbn
	BGjb93wcpbRilvwPm1gLlcyUU8D4F8PFrU3dvuEcZulb1D7+2o8ID/3D3HPGOSKWkZKI06KTlCu
	ruZXwaC6/0N5Vs3S6m1vBTs/0JKWx0sIRZf6W6ZJgStwqI42e21Up/bAtJTi4h3Mn604KX4ePe/
	JZdYiG966JS60qPxdx+dbzQf6fX5X99rZvmFXQGWWTlm324Ei6PuNgpnmouPIwVjpMCJz3+XO8e
	B/XeSqXDg+zYOccKjvCmpnQXvRFhx/8x2pqVIlfwrte2JnjEMHVwl7M6k+PkfndsT7b8ju6UIO8
	=
X-Received: by 2002:a05:600c:4514:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb888169d0mr281666185e9.20.1795477268346;
        Mon, 23 Nov 2026 15:41:08 -0800 (PST)
Received: from localhost.localdomain ([193.207.76.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm568321645e9.13.2026.11.23.15.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:41:08 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 4/4] ASoC: tlv320aic32x4: Add CM2_L and CM2_R negative MicPGA input routing
Date: Tue, 24 Nov 2026 00:40:50 +0100
Message-Id: <20261123234050.150364-5-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
References: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
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

The Left and Right MicPGA negative terminal input routing configuration
registers (AIC32X4_LMICPGANIN and AIC32X4_RMICPGANIN, Page 1, Registers
54 and 57) expose a second common-mode resistor selection (CM2L / CM2R)
in bits 1:0 alongside CM1L / CM1R in bits 7:6.

Add the CM2_L and CM2_R DAPM mux controls, widgets, and routes while
keeping the existing CM_L and CM_R names unchanged to preserve ABI
compatibility with existing userspace configurations.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 80ff52c6bbbe1..4fdac637ea472 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -394,6 +394,7 @@ static SOC_ENUM_SINGLE_DECL(in1r_lpga_p_enum, AIC32X4_LMICPGAPIN, 0, resistor_te
 static SOC_ENUM_SINGLE_DECL(cml_lpga_n_enum, AIC32X4_LMICPGANIN, 6, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in2r_lpga_n_enum, AIC32X4_LMICPGANIN, 4, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in3r_lpga_n_enum, AIC32X4_LMICPGANIN, 2, resistor_text);
+static SOC_ENUM_SINGLE_DECL(cm2l_lpga_n_enum, AIC32X4_LMICPGANIN, 0, resistor_text);
 
 static const struct snd_kcontrol_new in1l_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("IN1_L L+ Switch", in1l_lpga_p_enum),
@@ -423,6 +424,10 @@ static const struct snd_kcontrol_new in3r_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("IN3_R L- Switch", in3r_lpga_n_enum),
 };
 
+static const struct snd_kcontrol_new cm2l_to_lmixer_controls[] = {
+	SOC_DAPM_ENUM("CM2_L L- Switch", cm2l_lpga_n_enum),
+};
+
 /*	Right mixer pins */
 static SOC_ENUM_SINGLE_DECL(in1r_rpga_p_enum, AIC32X4_RMICPGAPIN, 6, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in2r_rpga_p_enum, AIC32X4_RMICPGAPIN, 4, resistor_text);
@@ -431,6 +436,7 @@ static SOC_ENUM_SINGLE_DECL(in2l_rpga_p_enum, AIC32X4_RMICPGAPIN, 0, resistor_te
 static SOC_ENUM_SINGLE_DECL(cmr_rpga_n_enum, AIC32X4_RMICPGANIN, 6, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in1l_rpga_n_enum, AIC32X4_RMICPGANIN, 4, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in3l_rpga_n_enum, AIC32X4_RMICPGANIN, 2, resistor_text);
+static SOC_ENUM_SINGLE_DECL(cm2r_rpga_n_enum, AIC32X4_RMICPGANIN, 0, resistor_text);
 
 static const struct snd_kcontrol_new in1r_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("IN1_R R+ Switch", in1r_rpga_p_enum),
@@ -460,6 +466,10 @@ static const struct snd_kcontrol_new in3l_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("IN3_L R- Switch", in3l_rpga_n_enum),
 };
 
+static const struct snd_kcontrol_new cm2r_to_rmixer_controls[] = {
+	SOC_DAPM_ENUM("CM2_R R- Switch", cm2r_rpga_n_enum),
+};
+
 static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 	SND_SOC_DAPM_DAC("Left DAC", "Left Playback", AIC32X4_DACSETUP, 7, 0),
 	SND_SOC_DAPM_MIXER("HPL Output Mixer", SND_SOC_NOPM, 0, 0,
@@ -500,6 +510,8 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			 in1l_to_rmixer_controls),
 	SND_SOC_DAPM_MUX("IN3_L to Right Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
 			 in3l_to_rmixer_controls),
+	SND_SOC_DAPM_MUX("CM2_R to Right Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
+			 cm2r_to_rmixer_controls),
 
 	SND_SOC_DAPM_ADC("Left ADC", "Left Capture", AIC32X4_ADCSETUP, 7, 0),
 	SND_SOC_DAPM_PGA("Left MicPGA", SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -517,6 +529,8 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			 in2r_to_lmixer_controls),
 	SND_SOC_DAPM_MUX("IN3_R to Left Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
 			 in3r_to_lmixer_controls),
+	SND_SOC_DAPM_MUX("CM2_L to Left Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
+			 cm2l_to_lmixer_controls),
 
 	SND_SOC_DAPM_SUPPLY("Mic Bias", AIC32X4_MICBIAS, 6, 0, mic_bias_event,
 			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
@@ -610,6 +624,11 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
 	{"IN3_L to Right Mixer Negative Resistor", "20 kOhm", "IN3_L"},
 	{"IN3_L to Right Mixer Negative Resistor", "40 kOhm", "IN3_L"},
 
+	{"Right MicPGA", NULL, "CM2_R to Right Mixer Negative Resistor"},
+	{"CM2_R to Right Mixer Negative Resistor", "10 kOhm", "CM_R"},
+	{"CM2_R to Right Mixer Negative Resistor", "20 kOhm", "CM_R"},
+	{"CM2_R to Right Mixer Negative Resistor", "40 kOhm", "CM_R"},
+
 	/* Left Input */
 	{"Left ADC", NULL, "Left MicPGA"},
 	{"MAL Power", NULL, "Left MicPGA"},
@@ -648,6 +667,11 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
 	{"IN3_R to Left Mixer Negative Resistor", "10 kOhm", "IN3_R"},
 	{"IN3_R to Left Mixer Negative Resistor", "20 kOhm", "IN3_R"},
 	{"IN3_R to Left Mixer Negative Resistor", "40 kOhm", "IN3_R"},
+
+	{"Left MicPGA", NULL, "CM2_L to Left Mixer Negative Resistor"},
+	{"CM2_L to Left Mixer Negative Resistor", "10 kOhm", "CM_L"},
+	{"CM2_L to Left Mixer Negative Resistor", "20 kOhm", "CM_L"},
+	{"CM2_L to Left Mixer Negative Resistor", "40 kOhm", "CM_L"},
 };
 
 const struct regmap_range_cfg aic32x4_regmap_pages[] = {
-- 
2.25.1

