Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716645;
	b=XKkesqONYHuyW2hMxMHSoVJ6tkKAnRT7H14xmNMiqn7PX1/czAXoDAHb88PWSBji9Nug
	 /6Elqi3qFfVjProlg/91zM8BrqI+1o2iEi/fKgkafgotTcveDOHlNw4zATsVJ8fFj6NQ3
	 fQGJxo02M0Pa9P23T1iKeDJQyON51coH75lJFOkJcrUa1193TRfWR3mPhlcsuvG6/HtWI
	 gTxUH2mQNJ5kUvTtOy1KCZkHiiiuLUhaevCj1q0uvm3L0rMgjJXzorOZdYTT5OIPfPEvS
	 /73OCj8uKsTHba93gfbwTTXAhVG5BDAJ8+BvluG7axwlVd3TpewZq2GFiabKyautfpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cO5ywSvgVSEwP4XSl3QXK7GVm5TxXZEp9/5ly6PjXL8=;
	b=OQowUdecbWoVRcVFTfuda71wv3hAzbZFJaDlvdG5QdMzZcv+JuB009yt40thjXGKJ8xC
	 0FgFGzWBniJ7wsGCdlOrFt6JuiDf94VoK1pcKbK0N646mazszNyzHPtlkmm9cIgoqLUM2
	 xdKxsx76eWmrYFZIQNPtqjCux7Qf9jVrryLd2EKAMlPjFZSCjjbFT8ts6CmyehV7AJMyV
	 A7Pdf1rYfGCNHTtydQIVZ4fv2k87YIJ9WhTsHhonc1lwHPbsSqg7+20V8IEsiFy7NQCtw
	 rTRPnT2mRwJ9tSaN3zuTeIMvxOaMYfjJ4FY+B66rm+knXWT393ynaQ+CRfebRJBtBEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vo6zbJIi;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF9A606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF9A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vo6zbJIi
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso3351351f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716643; x=1796321443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cO5ywSvgVSEwP4XSl3QXK7GVm5TxXZEp9/5ly6PjXL8=;
        b=vo6zbJIi69z3pZAUHRwJ/Or9gyX8pGmA2cffq5GKhMMpC1CsJ+J35fh5ctkkEJvIdJ
         39L48JErxD/sUVan7vXlpDa4zVlgIS7eB4GCKBW3VJF+8iqqPjVhyOnoAmXY7qrEntg7
         LfgeoV/0xXYS/TcBp6jmmMmEJboWrOKUBUEDrbn3JzghfxP93yp0ZcQypkbOH3Lutv4d
         wJvVQnuoERaZDaCxdHR2DyT9dXA1ke8Qrt5kzgRKg9dh1EtEUr+erXJCZ2x7BtVpOnje
         LacGoKAQ2EyKATRW1ox5mALOyQI2662vPBEniZn/R52pUEXco8gcyTbw3mTbGk3jHr/G
         oufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716643; x=1796321443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cO5ywSvgVSEwP4XSl3QXK7GVm5TxXZEp9/5ly6PjXL8=;
        b=xtB9zQqWlmAnS4kIbiPAwndmsvs63gZmuSiyo6Pg3O58i2LO1LGJlXwebsUu9Nyca4
         4WYiNn74HhNnM1pJSUJvgY8kU00Qhl4T23v/8YA1FqjzlCWtYD49Q6fC7x6VrREaVnJY
         /Xo3y6+A7vGSEH5JlrpKzTW837lMbvVAkJvqtt4+I5eRnNqeeCbTKQkFDG2INNpV9rB4
         F1ZhzGAgiKfmsMRkNpfqB/FkgsWpzFI74TAy1w5DQMNtGQxkxqEnzaxjHyXd05dwGp/p
         m7td97jAPe4qfq66RMCZdhUEMQzSLPGJMKy4EpUSATElks3JWS3PasqSyWiP4sxkb1Zq
         mBVg==
X-Forwarded-Encrypted: i=1; AL+hErHFMUNiBEM6iF0BebG0UfgeCef0R+9JC/sEM57Ox922pS04BeEnvO4abOpjZQkY0tikZTL5k09yicsiv3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YsfD4q8Kd2qi5bIXRv2hS8UqJfbnHlSAwMqRS3n4rxB4EKI/z
	CCmjMugUQiPfLY4r2O8xcZHWayPBr3EAMPDYiISD59o6GULI3hszYDM=
X-Gm-Gg: AZFdTZcby3syjy3l+wHo1b0FJM5FiuZ1LRK8qPu9QH7N3+mkfUetdG14gbmqTfAstrv
	Fo4Xw57dZyzl9Fm2R2lahTIy6kSSKEyCd+rXkvuR1NpZuvpbWdtygKB58ZbT68ztU4dVdYGdqCB
	JkjAwxvE/hdQ8+u1o64EH8U0VGTnZrCr0TNQADNfAbZeJ290smCUqGtS5WThf4QxYWR5wKAhA4L
	ATuu+anWT6VPVTQewqqfon+jp5GuE4c9LB1ig5A2sFfaZ1GSTn7yPkxnqF4uSA+jq+ZSyqWs9Ma
	2VeGOPXIQFZB0JrCRJZ1qhI1zor45bJylyjhRzT4uO67+eun0RO3jygBpxvtwYVgK+v/ATn0Oyz
	TKpaRSpFtB+xQrVEMW92u2lhyTyUaAMGLO0S1Nhx5a9PEkk0diWJBIUDKTC1c/ENwownyHeLoCP
	tj6gB4fhQ9Mpj/GQtwjx8Bzbx9RnMtXcdB5U8WIDwvPetJOTWGy86uC/dc0l4F4G31cawhiQzaB
	Obvkzieja4TM+yW7EJqA2PxJeA+ol7aFWiwUk6wlZ2avcZbKRNBas9cGfYJS/2CCsELgSieZo4h
	QTLQDnW7lVYwjtxj6MLokOZb/SNV/MaM8mjbgvbuGfhUBzqdOw01r5N9BKeMch/hyxbDa7P0+h5
	AUTfprM6ICRwEO2iyaLW4oxJxBn1ko7wFn7XqqchsaT36N5FavYwKA0zM3+k=
X-Received: by 2002:a05:6000:4028:b0:4a6:bc53:246c with SMTP id ffacd0b85a97d-4abb3956374mr45006457f8f.42.1795716643175;
        Thu, 26 Nov 2026 10:10:43 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm42675231f8f.16.2026.11.26.10.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:10:42 -0800 (PST)
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
Subject: [PATCH v2 2/4] ASoC: tlv320aic32x4: Add Left and Right Mixer Amplifier DAPM support
Date: Thu, 26 Nov 2026 19:10:36 +0100
Message-Id: <20261126181038.99595-3-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126181038.99595-1-gianfranco.mariotti94@gmail.com>
References: <20261126181038.99595-1-gianfranco.mariotti94@gmail.com>
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

The TLV320AIC32x4 and TLV320AIC32x6 feature Left and Right Mixer
Amplifiers (MAL and MAR, controlled by AIC32X4_OUTPWRCTL bits 1 and 0)
that route amplified signals from the Left and Right MicPGAs directly to
the headphone and line-out output mixers, bypassing the ADCs and DACs
(TI SLAA557 / SLAA463 / SLAU306, Section 2.2.2):
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
index ba881b28f1fd6..ff9cb9ce7cf77 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -320,12 +320,15 @@ static const struct snd_kcontrol_new aic32x4_snd_controls[] = {
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
 	/* HPL Switch (bit 0) is AIC32x4-only; keep last for AIC32x6 */
 	SOC_DAPM_SINGLE("HPL Switch", AIC32X4_HPRROUTE, 0, 1, 0),
 };
@@ -333,11 +336,13 @@ static const struct snd_kcontrol_new hpr_output_mixer_controls[] = {
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
@@ -425,6 +430,7 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			   &hpl_output_mixer_controls[0],
 			   ARRAY_SIZE(hpl_output_mixer_controls)),
 	SND_SOC_DAPM_PGA("HPL Power", AIC32X4_OUTPWRCTL, 5, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("MAL Power", AIC32X4_OUTPWRCTL, 1, 0, NULL, 0),
 
 	SND_SOC_DAPM_MIXER("LOL Output Mixer", SND_SOC_NOPM, 0, 0,
 			   &lol_output_mixer_controls[0],
@@ -433,12 +439,14 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 
 	SND_SOC_DAPM_DAC("Right DAC", "Right Playback", AIC32X4_DACSETUP, 6, 0),
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
@@ -455,6 +463,7 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			 in3l_to_rmixer_controls),
 
 	SND_SOC_DAPM_ADC("Left ADC", "Left Capture", AIC32X4_ADCSETUP, 7, 0),
+	SND_SOC_DAPM_PGA("Left MicPGA", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MUX("IN1_L to Left Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
 			 in1l_to_lmixer_controls),
 	SND_SOC_DAPM_MUX("IN2_L to Left Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
@@ -509,12 +518,15 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
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
@@ -524,83 +536,91 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
 	{"HPR Output Mixer", "L_DAC Switch", "Left DAC"},
 	{"HPR Output Mixer", "R_DAC Switch", "Right DAC"},
 	{"HPR Output Mixer", "IN1_R Switch", "IN1_R"},
+	{"HPR Output Mixer", "MAR Switch", "MAR Power"},
 
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

