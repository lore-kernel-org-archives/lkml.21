Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477266;
	b=TLbWIEhWtE0UtqjtPt8T0dpGmzwHNBeVKwZYW4QUaRBQwzJcGQAxob9gwaysTgmltJ41
	 TlBurFQqD1wwNqMQsBIokGKNRcoAGnmYLos/a7AuGIth7lG9G7X0TEuB6w5AqR6Sh8Bq6
	 mMjVJfAgWcad/T8O37plj2k8GuaXxB8hXwdZE9xe0xhD22czFi57QEVdtehkuw4bXg9zn
	 Q8/hkyQ0ZXkiF9nTL/7B8wHobjmi4dLlWXeBvhzyJODvpLVkpe/rtDh7D4ObutWJrV5vJ
	 c7cFI+xZLuP7K/NLoH61VU4qGsdSpPag/e6dbDeV6tYeA4ok3bILOykZ8s2FpbUC9Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bDsDAMhXzZY7QIF9oImxY/mFcO7LsdkkD50C/kd98n8=;
	b=uRvzyTgC9LEQV5DecvNXovb9/KU0akaA/qAde9V+sqJ5LWRP40bcllWyrtg6eJ2SPCXt
	 j2wzc7VNAPUnJTm+APO6aNQBMiHlg8LRK4jqK1v6DS7xuBJxSEMMatlfOi1S0tIu/2rHP
	 kOIYKkXxuEk1PjeeYMzFimxaxAo/QmJ7rKvJ1gWBB7xI1fbZssZVoFzbLociBFW1vVPNp
	 qQIOfiTEdpQ1NKHHhqEz9xSuW5bNX/1Cwa1cAr5NmTq4nGIknC6tt6eA7Jm11HasgKICd
	 NVqeLQK1+W2cKuaLGEFNieHX8RJ8QxawWZK65x3xLrybpadGQRJwT2QV2SaARyYvm+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xt22lYsP;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997DF606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 997DF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xt22lYsP
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso43611735e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477264; x=1796082064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDsDAMhXzZY7QIF9oImxY/mFcO7LsdkkD50C/kd98n8=;
        b=xt22lYsPuBAC58KGKW4OGKbhFXxhz6V+vCWgBnjNzB8xmFILuiZEDjHn17MFd0B2rE
         NpX8UHd5h6QGCPZn2eu2qKLl+cOdpuHF8W0NnkT0yfJBubYpRMsS9F4ln8VHiLAtXzpS
         4IqK97daGmFq4oQeliDtr5a8jphN+1lB7NLDxAIW7F69Ca0PHUK2wE/6R5bB1qoBKQBh
         aOsU7syYkM3eFUuTcO8D82AwpnY/UiN4SfDo5MTpwlIjvwID43CvxoWNpMoO0hJB+4pz
         pcvs2grzVxMnkEfeXHU+9BNMpyf9wjPPDqQZ69N3wGNMGKpugDru/C3UnhiljhooDTPe
         YXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477264; x=1796082064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDsDAMhXzZY7QIF9oImxY/mFcO7LsdkkD50C/kd98n8=;
        b=bxXXusqmUeBFTI7jP3NYR7lXI12c3t//t/+M564JhqDvEjWiv/68vWzm9od9en1hhR
         dY51ejP/N0WDhyWTbqC0ef2O2sJH4zF6BjgvvdnWyyzhxAoX4lxzJAJc8G6zLabLavQG
         YKik8dxy9RVNWeZtc5/EjfU3oxIdimVe9ibx5VvGXM+Sr9VZyRDsWD5/sfEJzpQpnhKs
         tBpjiLolMTmqckghgcY4h6qsPTo0Y9DcU2fnDwi/BS8HNTWS817I1aV7RqNpbtn/O2+s
         R2VomxSCygM5YSn07e2VnEufkby6srqXnd/QTVCzkJ9SPa5aSgdRNdx1LYe6W/OfFtA2
         gwlw==
X-Forwarded-Encrypted: i=1; AL+hErGQNyMLbSGBLVMptmuCeVSfSaJhIiqR810SEmq8OpsFSUQg7Sn3DgVHSaTZ+FHCGvI1v35iP4HiBelFzMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z81lMuQRnjQWk5QRLsqnnofvO7XEeQkThyBVW0mC4k7g4FZGxm/
	7xLXp6Vbhx+0c57fsb5004hv//uAg94WD1rFpj0jxRws4EDpqRwk8q0=
X-Gm-Gg: AZFdTZeFa8btAnL1hVMvTGpehkY8uB6U+ycXm9nXlOZcDbzRdfyk7vQuwc5tgzNBFSt
	U9nJD9YAKObk2QYhiKOylfQh22rQdcKl3ghNv+ydQkacdAyiCdYnhb4VHjbGyi9XrH0LR5kzL//
	CYXM3ZBHvVSlPjs52WlymeDh8tNOS/Ovj6y8jQqLAf/Hl6K7UpfuClZ6xweeEx3xQUlOuNbkO64
	xgPSCwDsVG8kTKFapKGKa+kmq1eWuOtMhRcJ6MZ2WUTepKlYL33zK7XpFyn4REIP3PX3U48tIEV
	PxdxJJ3KWC+qtlnBM2g/zcE20UTb9uRXE8eSJgpOn6b6XyW3biVFFz2Ukqbvt9zBYSyj1/8vtZe
	y0/O9ZjCIkZw2UcOZkRUHZZ1OlDG78AqlpHKhZKJU0BXz7ruGM1sczCq0ae8s8MlrvkerzLzJYx
	GKOLPbq6SzRkDZHMh1ZAaKHKPxSWPghRMjg9njhYAjJap9va6xLIoniM+VWdT61iSKBInq5zpts
	E2HHPF5qbJA13tUO4DD/dANHqQ0FdKrrPZPeX1KAd0tEABJwTuUtQIdRa/eWFVq36+M+cgy+HRS
	VgpCAkYHVdrStZU5+qRalHl+X3PZESc2E0yDMeR3VBZjFVzIOo4rSA==
X-Received: by 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr256218215e9.12.1795477263720;
        Mon, 23 Nov 2026 15:41:03 -0800 (PST)
Received: from localhost.localdomain ([193.207.76.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm568321645e9.13.2026.11.23.15.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:41:02 -0800 (PST)
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
Subject: [PATCH 2/4] ASoC: tlv320aic32x4: Add Left and Right Mixer Amplifier DAPM support
Date: Tue, 24 Nov 2026 00:40:48 +0100
Message-Id: <20261123234050.150364-3-gianfranco.mariotti94@gmail.com>
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

The TLV320AIC32x4 features Left and Right Mixer Amplifiers (MAL and MAR,
controlled by AIC32X4_OUTPWRCTL bits 1 and 0) that route amplified
signals from the Left and Right MicPGAs directly to the headphone and
line-out output mixers, bypassing the ADCs and DACs (TI SLAA557, Section
2.2.2 and Figure 2-1):
- AIC32X4_HPLROUTE bit 1 (MAL) and bit 0 (MAR)
- AIC32X4_HPRROUTE bit 1 (MAR)
- AIC32X4_LOLROUTE bit 1 (MAL)
- AIC32X4_LORROUTE bit 1 (MAR)

Insert Left MicPGA and Right MicPGA DAPM PGA widgets between the input
resistor muxes and the ADCs, feed MAL Power and MAR Power from the
respective MicPGAs, and wire the MAL/MAR switches into the HPL, HPR,
LOL, and LOR output mixers.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 48 ++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index f39856d0b1f19..9f90e41076992 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -320,23 +320,28 @@ static const struct snd_kcontrol_new aic32x4_snd_controls[] = {
 static const struct snd_kcontrol_new hpl_output_mixer_controls[] = {
 	SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_HPLROUTE, 3, 1, 0),
 	SOC_DAPM_SINGLE("IN1_L Switch", AIC32X4_HPLROUTE, 2, 1, 0),
+	SOC_DAPM_SINGLE("MAL Switch", AIC32X4_HPLROUTE, 1, 1, 0),
+	SOC_DAPM_SINGLE("MAR Switch", AIC32X4_HPLROUTE, 0, 1, 0),
 };
 
 static const struct snd_kcontrol_new hpr_output_mixer_controls[] = {
 	SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_HPRROUTE, 4, 1, 0),
 	SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_HPRROUTE, 3, 1, 0),
 	SOC_DAPM_SINGLE("IN1_R Switch", AIC32X4_HPRROUTE, 2, 1, 0),
+	SOC_DAPM_SINGLE("MAR Switch", AIC32X4_HPRROUTE, 1, 1, 0),
 	SOC_DAPM_SINGLE("HPL Switch", AIC32X4_HPRROUTE, 0, 1, 0),
 };
 
 static const struct snd_kcontrol_new lol_output_mixer_controls[] = {
 	SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_LOLROUTE, 4, 1, 0),
 	SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_LOLROUTE, 3, 1, 0),
+	SOC_DAPM_SINGLE("MAL Switch", AIC32X4_LOLROUTE, 1, 1, 0),
 	SOC_DAPM_SINGLE("LOR Switch", AIC32X4_LOLROUTE, 0, 1, 0),
 };
 
 static const struct snd_kcontrol_new lor_output_mixer_controls[] = {
 	SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_LORROUTE, 3, 1, 0),
+	SOC_DAPM_SINGLE("MAR Switch", AIC32X4_LORROUTE, 1, 1, 0),
 };
 
 static const char * const resistor_text[] = {
@@ -424,6 +429,7 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			   &hpl_output_mixer_controls[0],
 			   ARRAY_SIZE(hpl_output_mixer_controls)),
 	SND_SOC_DAPM_PGA("HPL Power", AIC32X4_OUTPWRCTL, 5, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("MAL Power", AIC32X4_OUTPWRCTL, 1, 0, NULL, 0),
 
 	SND_SOC_DAPM_MIXER("LOL Output Mixer", SND_SOC_NOPM, 0, 0,
 			   &lol_output_mixer_controls[0],
@@ -435,12 +441,14 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			   &hpr_output_mixer_controls[0],
 			   ARRAY_SIZE(hpr_output_mixer_controls)),
 	SND_SOC_DAPM_PGA("HPR Power", AIC32X4_OUTPWRCTL, 4, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("MAR Power", AIC32X4_OUTPWRCTL, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER("LOR Output Mixer", SND_SOC_NOPM, 0, 0,
 			   &lor_output_mixer_controls[0],
 			   ARRAY_SIZE(lor_output_mixer_controls)),
 	SND_SOC_DAPM_PGA("LOR Power", AIC32X4_OUTPWRCTL, 2, 0, NULL, 0),
 
 	SND_SOC_DAPM_ADC("Right ADC", "Right Capture", AIC32X4_ADCSETUP, 6, 0),
+	SND_SOC_DAPM_PGA("Right MicPGA", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MUX("IN1_R to Right Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
 			 in1r_to_rmixer_controls),
 	SND_SOC_DAPM_MUX("IN2_R to Right Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
@@ -457,6 +465,7 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			 in3l_to_rmixer_controls),
 
 	SND_SOC_DAPM_ADC("Left ADC", "Left Capture", AIC32X4_ADCSETUP, 7, 0),
+	SND_SOC_DAPM_PGA("Left MicPGA", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MUX("IN1_L to Left Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
 			 in1l_to_lmixer_controls),
 	SND_SOC_DAPM_MUX("IN2_L to Left Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
@@ -495,12 +504,15 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
 	/* Left Output */
 	{"HPL Output Mixer", "L_DAC Switch", "Left DAC"},
 	{"HPL Output Mixer", "IN1_L Switch", "IN1_L"},
+	{"HPL Output Mixer", "MAL Switch", "MAL Power"},
+	{"HPL Output Mixer", "MAR Switch", "MAR Power"},
 
 	{"HPL Power", NULL, "HPL Output Mixer"},
 	{"HPL", NULL, "HPL Power"},
 
 	{"LOL Output Mixer", "R_DAC Switch", "Right DAC"},
 	{"LOL Output Mixer", "L_DAC Switch", "Left DAC"},
+	{"LOL Output Mixer", "MAL Switch", "MAL Power"},
 	{"LOL Output Mixer", "LOR Switch", "LOR Power"},
 
 	{"LOL Power", NULL, "LOL Output Mixer"},
@@ -510,84 +522,92 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
 	{"HPR Output Mixer", "L_DAC Switch", "Left DAC"},
 	{"HPR Output Mixer", "R_DAC Switch", "Right DAC"},
 	{"HPR Output Mixer", "IN1_R Switch", "IN1_R"},
+	{"HPR Output Mixer", "MAR Switch", "MAR Power"},
 	{"HPR Output Mixer", "HPL Switch", "HPL Power"},
 
 	{"HPR Power", NULL, "HPR Output Mixer"},
 	{"HPR", NULL, "HPR Power"},
 
 	{"LOR Output Mixer", "R_DAC Switch", "Right DAC"},
+	{"LOR Output Mixer", "MAR Switch", "MAR Power"},
 
 	{"LOR Power", NULL, "LOR Output Mixer"},
 	{"LOR", NULL, "LOR Power"},
 
 	/* Right Input */
-	{"Right ADC", NULL, "IN1_R to Right Mixer Positive Resistor"},
+	{"Right ADC", NULL, "Right MicPGA"},
+	{"MAR Power", NULL, "Right MicPGA"},
+
+	{"Right MicPGA", NULL, "IN1_R to Right Mixer Positive Resistor"},
 	{"IN1_R to Right Mixer Positive Resistor", "10 kOhm", "IN1_R"},
 	{"IN1_R to Right Mixer Positive Resistor", "20 kOhm", "IN1_R"},
 	{"IN1_R to Right Mixer Positive Resistor", "40 kOhm", "IN1_R"},
 
-	{"Right ADC", NULL, "IN2_R to Right Mixer Positive Resistor"},
+	{"Right MicPGA", NULL, "IN2_R to Right Mixer Positive Resistor"},
 	{"IN2_R to Right Mixer Positive Resistor", "10 kOhm", "IN2_R"},
 	{"IN2_R to Right Mixer Positive Resistor", "20 kOhm", "IN2_R"},
 	{"IN2_R to Right Mixer Positive Resistor", "40 kOhm", "IN2_R"},
 
-	{"Right ADC", NULL, "IN3_R to Right Mixer Positive Resistor"},
+	{"Right MicPGA", NULL, "IN3_R to Right Mixer Positive Resistor"},
 	{"IN3_R to Right Mixer Positive Resistor", "10 kOhm", "IN3_R"},
 	{"IN3_R to Right Mixer Positive Resistor", "20 kOhm", "IN3_R"},
 	{"IN3_R to Right Mixer Positive Resistor", "40 kOhm", "IN3_R"},
 
-	{"Right ADC", NULL, "IN2_L to Right Mixer Positive Resistor"},
+	{"Right MicPGA", NULL, "IN2_L to Right Mixer Positive Resistor"},
 	{"IN2_L to Right Mixer Positive Resistor", "10 kOhm", "IN2_L"},
 	{"IN2_L to Right Mixer Positive Resistor", "20 kOhm", "IN2_L"},
 	{"IN2_L to Right Mixer Positive Resistor", "40 kOhm", "IN2_L"},
 
-	{"Right ADC", NULL, "CM_R to Right Mixer Negative Resistor"},
+	{"Right MicPGA", NULL, "CM_R to Right Mixer Negative Resistor"},
 	{"CM_R to Right Mixer Negative Resistor", "10 kOhm", "CM_R"},
 	{"CM_R to Right Mixer Negative Resistor", "20 kOhm", "CM_R"},
 	{"CM_R to Right Mixer Negative Resistor", "40 kOhm", "CM_R"},
 
-	{"Right ADC", NULL, "IN1_L to Right Mixer Negative Resistor"},
+	{"Right MicPGA", NULL, "IN1_L to Right Mixer Negative Resistor"},
 	{"IN1_L to Right Mixer Negative Resistor", "10 kOhm", "IN1_L"},
 	{"IN1_L to Right Mixer Negative Resistor", "20 kOhm", "IN1_L"},
 	{"IN1_L to Right Mixer Negative Resistor", "40 kOhm", "IN1_L"},
 
-	{"Right ADC", NULL, "IN3_L to Right Mixer Negative Resistor"},
+	{"Right MicPGA", NULL, "IN3_L to Right Mixer Negative Resistor"},
 	{"IN3_L to Right Mixer Negative Resistor", "10 kOhm", "IN3_L"},
 	{"IN3_L to Right Mixer Negative Resistor", "20 kOhm", "IN3_L"},
 	{"IN3_L to Right Mixer Negative Resistor", "40 kOhm", "IN3_L"},
 
 	/* Left Input */
-	{"Left ADC", NULL, "IN1_L to Left Mixer Positive Resistor"},
+	{"Left ADC", NULL, "Left MicPGA"},
+	{"MAL Power", NULL, "Left MicPGA"},
+
+	{"Left MicPGA", NULL, "IN1_L to Left Mixer Positive Resistor"},
 	{"IN1_L to Left Mixer Positive Resistor", "10 kOhm", "IN1_L"},
 	{"IN1_L to Left Mixer Positive Resistor", "20 kOhm", "IN1_L"},
 	{"IN1_L to Left Mixer Positive Resistor", "40 kOhm", "IN1_L"},
 
-	{"Left ADC", NULL, "IN2_L to Left Mixer Positive Resistor"},
+	{"Left MicPGA", NULL, "IN2_L to Left Mixer Positive Resistor"},
 	{"IN2_L to Left Mixer Positive Resistor", "10 kOhm", "IN2_L"},
 	{"IN2_L to Left Mixer Positive Resistor", "20 kOhm", "IN2_L"},
 	{"IN2_L to Left Mixer Positive Resistor", "40 kOhm", "IN2_L"},
 
-	{"Left ADC", NULL, "IN3_L to Left Mixer Positive Resistor"},
+	{"Left MicPGA", NULL, "IN3_L to Left Mixer Positive Resistor"},
 	{"IN3_L to Left Mixer Positive Resistor", "10 kOhm", "IN3_L"},
 	{"IN3_L to Left Mixer Positive Resistor", "20 kOhm", "IN3_L"},
 	{"IN3_L to Left Mixer Positive Resistor", "40 kOhm", "IN3_L"},
 
-	{"Left ADC", NULL, "IN1_R to Left Mixer Positive Resistor"},
+	{"Left MicPGA", NULL, "IN1_R to Left Mixer Positive Resistor"},
 	{"IN1_R to Left Mixer Positive Resistor", "10 kOhm", "IN1_R"},
 	{"IN1_R to Left Mixer Positive Resistor", "20 kOhm", "IN1_R"},
 	{"IN1_R to Left Mixer Positive Resistor", "40 kOhm", "IN1_R"},
 
-	{"Left ADC", NULL, "CM_L to Left Mixer Negative Resistor"},
+	{"Left MicPGA", NULL, "CM_L to Left Mixer Negative Resistor"},
 	{"CM_L to Left Mixer Negative Resistor", "10 kOhm", "CM_L"},
 	{"CM_L to Left Mixer Negative Resistor", "20 kOhm", "CM_L"},
 	{"CM_L to Left Mixer Negative Resistor", "40 kOhm", "CM_L"},
 
-	{"Left ADC", NULL, "IN2_R to Left Mixer Negative Resistor"},
+	{"Left MicPGA", NULL, "IN2_R to Left Mixer Negative Resistor"},
 	{"IN2_R to Left Mixer Negative Resistor", "10 kOhm", "IN2_R"},
 	{"IN2_R to Left Mixer Negative Resistor", "20 kOhm", "IN2_R"},
 	{"IN2_R to Left Mixer Negative Resistor", "40 kOhm", "IN2_R"},
 
-	{"Left ADC", NULL, "IN3_R to Left Mixer Negative Resistor"},
+	{"Left MicPGA", NULL, "IN3_R to Left Mixer Negative Resistor"},
 	{"IN3_R to Left Mixer Negative Resistor", "10 kOhm", "IN3_R"},
 	{"IN3_R to Left Mixer Negative Resistor", "20 kOhm", "IN3_R"},
 	{"IN3_R to Left Mixer Negative Resistor", "40 kOhm", "IN3_R"},
-- 
2.25.1

