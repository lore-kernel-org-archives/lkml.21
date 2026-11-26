Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716647;
	b=DLZCPUQE7TTM5x6+Bw4lTKvY3V2sv7DawfzRaStg8XvN+vJePn+/xMyCxkU5jrf817UW
	 Pozhihfx4AveT1FdvgMecIRdK7AdERq7syjaBtBesZUe8E2Rx8GCGxXDG498Wi5quzKmA
	 F59Ci/kcxofmSAVswsmqEbZK0n+r/WLFSuwKkJ0pdMYtYwG3LQLlcSBW9pcgRVLEnj81L
	 BrvjWVcrGuXV9FdSKqmc21Ui5+pioB2SGZgRy78Wq6jRJjDpuaxwYhHmw0OdsF3YcjsXU
	 gCgFDawKqRJyuxmslBqQ+vbcjtqruD/7fhf9fzE3q25+/NEUAkxRcEsbJEy8VV/rCNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9EE7ET7ZAHDkNqGUagc4f/OGnCE/6ki6vjCKYjQxI34=;
	b=enIuKoSGe5oxx3m6m5nu2eRAiVOoYRngIGMMjtmWgZAjIgP8/0N/5si+9IMRE308O8Ln
	 c78NTXMZjl7145rKrPo4bRF81ynF/ubeyrTcQbFhjIx5p/mmbqKjZKTwjXIbJ7QZdDg6b
	 uwIZcj+08UHF8bOiruEiPBJk5rcyXK+P6PzLOFX9Dq6XlZ5QQWnhM3BU+fHwe8x4tFHMF
	 xnM1yDOh+GWVyBYQX42uRPxu7BqfMvigdYhTQVJOZC5sGVXCs+KoAF8qvKYOWRk5lAvEI
	 8U41PSEVaKGkT77cjEt52q0bXR3vGZBbGjtRKpBsyLdP7F/uc0zYTxZC0foCMe8WwFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4b0i9pJ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5EB606A6B2
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB5EB606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4b0i9pJ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso57252335e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716645; x=1796321445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EE7ET7ZAHDkNqGUagc4f/OGnCE/6ki6vjCKYjQxI34=;
        b=n4b0i9pJfy+xA3AKsJdVS83ypg7az/x6Hn3b/cgg/jK8klv6G3wREjV5UTajHBst43
         F67AUFgmt5NLXE9QP0DywV9x3IRps3p0gne3wR0uHXdF0Tzqc5WAVpW4YfIVMUqycaMP
         3dxc/QFEN6CR5pilnRRxd9n6E/zGayGGSm8d8KVmSX9YjWip186tNSrZP8r1Tc2OKj7L
         Q341zxrSAb5yl2NHBD7Xvpzm7LIl9H6vsphgqxUiFTv6KLof9/WCAOtPX+qyp1lcX7lC
         h37EXjSUH6mH6Q/OCpv+TVeZixba/SPYELe/0YTkDLvKGIq+iOJaP629Hpux+ASuusYX
         4TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716645; x=1796321445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EE7ET7ZAHDkNqGUagc4f/OGnCE/6ki6vjCKYjQxI34=;
        b=prmcZ7o9wWc/LMp4CvB6pc9RNpz2AXNvOjavePYpQx/niLyq6keYgOJdHXMJSVsis0
         E+rWTARAvp+/VSNULEGq5kNKz0/JlSm51E5Gvxkj9uOMX07gKXgQZpRbIwbNNKdAZmLz
         PJEfIbqyN3bUcKPV8tmy2PfvbYWusChEFT4bW/fD7NPDbn3TAsSfSVykZEgMFcnR644I
         DsIn6qhmrFVB8L6UVAdZxLOELsqc6qFTjQbLAreJxECyYeBP5mMTdI9lf+h48Z5AlWKL
         4ikpZG2Kx28rCOAVpw6Wz7VwESG38Wyl3bVB0mrsdFZk7BHyBW9gAZbUCK18QqO1XQ1n
         1Dlg==
X-Forwarded-Encrypted: i=1; AL+hErHsPnEZfvSa8C4jOkHTrwHseTJqa8QcPgDD8V7p9+slUF3z7pIQR3W5xBxRD2jyo1PqKzp8JilK8Ycmrdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N+s8npbJKMBjo4n1h8C+OTgsIg0xeC7hA26J/tpG/ARUyevV1
	LQ/x77QKZIkmIN4f1DFEY/1kGDpHBnIScKCHNi1n3QYXm4s+k8vRyJg=
X-Gm-Gg: AZFdTZev6XawMccGPnSxiQY+9ROe4AvQ8VqUl1Z6nuKVGsw/s5TDfOzY31nLRK5dLTq
	Ef3C0tFbBwYqG8RoeC3MiVmbQApcXbbcIAOCjPir1qyEr32//BcfmNTE6qscdpK2rozkVppXBUQ
	9t7k9NN6CKCz+GG0xox+C4LC4krkX1oiTqKAZgibuww7yVYu6ovVc25X/5s2jO6YimiD/3HVNx+
	PF+omSeYW4vNwu2BJZtWQr3N80+cDPBR288AusrG5it0jxM2NuZi76TaMyd7mUoAtfxJA4HXtgB
	6mmwApa3Kvv46+OekeeH9jBSI0ZUXslOoLh+LX7dp7vwaPf8n8Zb1AEusMJOuTK1Yzx9LupCXvY
	gvCrQQu9gMjwJyiJkhLsBoIJxow9TDmR0SwMHlIkODZS9EK5gSSu4JWySCquNomtl6zAtVnhbSK
	ukzKKwpD5ty9UbyHesMqMbUeM76x4qf+QrEBaDLXQ/6h+PfnRFJy+104MkCiTtBHrAy9cNVfHbX
	nyGEuutuGBSepOAc/T9V/UAwOx+E5ODvCuZp3icMVWm0k2CoDsacDwT11FKAHPkyR/yv3lBOSbo
	MDZtrjQkQGINKE9mSymETZ9RYBAeuNvyILq9Pi7z7MqzhV04u+CnZxuFiTPmRT2IsvO6k5H+FQs
	jv5MSP7lSjYB776kd4tDT4FSCzAg2cOZgDtB+1cUzwAxY+qA1FZoNWs0WL5I=
X-Received: by 2002:a05:600c:3547:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb888098bfmr446022625e9.11.1795716644989;
        Thu, 26 Nov 2026 10:10:44 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm42675231f8f.16.2026.11.26.10.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:10:44 -0800 (PST)
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
Subject: [PATCH v2 4/4] ASoC: tlv320aic32x4: Add CM2_L and CM2_R negative MicPGA input routing
Date: Thu, 26 Nov 2026 19:10:38 +0100
Message-Id: <20261126181038.99595-5-gianfranco.mariotti94@gmail.com>
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

Bits 1:0 of AIC32X4_LMICPGANIN (Page 1, Register 54) and
AIC32X4_RMICPGANIN (Page 1, Register 57) provide a second common-mode
input resistor selection (CM2L / CM2R, Off / 10 kOhm / 20 kOhm /
40 kOhm) to the Left and Right MicPGA negative terminals, used to match
input impedance when mixing multiple positive inputs.

Add the CM2_L and CM2_R DAPM mux widgets, enum controls, and routes
sourced from CM_L and CM_R, preserving the existing CM_L and CM_R
control names for ABI compatibility.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 92f77b26b4b40..ffa879c271273 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -395,6 +395,7 @@ static SOC_ENUM_SINGLE_DECL(in1r_lpga_p_enum, AIC32X4_LMICPGAPIN, 0, resistor_te
 static SOC_ENUM_SINGLE_DECL(cml_lpga_n_enum, AIC32X4_LMICPGANIN, 6, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in2r_lpga_n_enum, AIC32X4_LMICPGANIN, 4, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in3r_lpga_n_enum, AIC32X4_LMICPGANIN, 2, resistor_text);
+static SOC_ENUM_SINGLE_DECL(cm2l_lpga_n_enum, AIC32X4_LMICPGANIN, 0, resistor_text);
 
 static const struct snd_kcontrol_new in1l_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("IN1_L L+ Switch", in1l_lpga_p_enum),
@@ -424,6 +425,10 @@ static const struct snd_kcontrol_new in3r_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("IN3_R L- Switch", in3r_lpga_n_enum),
 };
 
+static const struct snd_kcontrol_new cm2l_to_lmixer_controls[] = {
+	SOC_DAPM_ENUM("CM2_L L- Switch", cm2l_lpga_n_enum),
+};
+
 /*	Right mixer pins */
 static SOC_ENUM_SINGLE_DECL(in1r_rpga_p_enum, AIC32X4_RMICPGAPIN, 6, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in2r_rpga_p_enum, AIC32X4_RMICPGAPIN, 4, resistor_text);
@@ -432,6 +437,7 @@ static SOC_ENUM_SINGLE_DECL(in2l_rpga_p_enum, AIC32X4_RMICPGAPIN, 0, resistor_te
 static SOC_ENUM_SINGLE_DECL(cmr_rpga_n_enum, AIC32X4_RMICPGANIN, 6, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in1l_rpga_n_enum, AIC32X4_RMICPGANIN, 4, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in3l_rpga_n_enum, AIC32X4_RMICPGANIN, 2, resistor_text);
+static SOC_ENUM_SINGLE_DECL(cm2r_rpga_n_enum, AIC32X4_RMICPGANIN, 0, resistor_text);
 
 static const struct snd_kcontrol_new in1r_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("IN1_R R+ Switch", in1r_rpga_p_enum),
@@ -461,6 +467,10 @@ static const struct snd_kcontrol_new in3l_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("IN3_L R- Switch", in3l_rpga_n_enum),
 };
 
+static const struct snd_kcontrol_new cm2r_to_rmixer_controls[] = {
+	SOC_DAPM_ENUM("CM2_R R- Switch", cm2r_rpga_n_enum),
+};
+
 static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 	SND_SOC_DAPM_DAC("Left DAC", "Left Playback", AIC32X4_DACSETUP, 7, 0),
 	SND_SOC_DAPM_MIXER("HPL Output Mixer", SND_SOC_NOPM, 0, 0,
@@ -498,6 +508,8 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			 in1l_to_rmixer_controls),
 	SND_SOC_DAPM_MUX("IN3_L to Right Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
 			 in3l_to_rmixer_controls),
+	SND_SOC_DAPM_MUX("CM2_R to Right Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
+			 cm2r_to_rmixer_controls),
 
 	SND_SOC_DAPM_ADC("Left ADC", "Left Capture", AIC32X4_ADCSETUP, 7, 0),
 	SND_SOC_DAPM_PGA("Left MicPGA", SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -515,6 +527,8 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			 in2r_to_lmixer_controls),
 	SND_SOC_DAPM_MUX("IN3_R to Left Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
 			 in3r_to_lmixer_controls),
+	SND_SOC_DAPM_MUX("CM2_L to Left Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
+			 cm2l_to_lmixer_controls),
 
 	SND_SOC_DAPM_SUPPLY("Mic Bias", AIC32X4_MICBIAS, 6, 0, mic_bias_event,
 			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
@@ -623,6 +637,11 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
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
@@ -661,6 +680,11 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
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

