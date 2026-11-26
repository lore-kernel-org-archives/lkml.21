Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716646;
	b=vz+7IsNALSDLmZ4XH7dO9HRemqlycRLMNTWUwEuh+Lu/g8n9D6BrSGdnUexWMu3mFaJr
	 gDtjjyCkEFv/hhg2LNLgF9GlhidYeQV0NMS746ZPV1/JKx4PrG/Ybaf6A3dOc1Hqp+XA8
	 Znw+tOugyJPP9dNqE+VunvpXS8+yBMAqTtmWjOfDFMofYhDqJ4A9CwvxJIMV2Wy+NOn8Z
	 H+U15Un8/3T4UJW303inMxzuwR7qpV0ur6mBln6rfgKSIjEsWM0rXZn+qgZxCLJchTgDT
	 vPpzsgGLOF1SXhY6pcg4HIt10Rspg7O7YmWxrhJvgBVXMGZFMVXtFMH9PLthlGkWjXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zz6u4Cuzc6p+EDQcVFWb32sTk/fRMtJK3zDf6Jp1Zog=;
	b=RwULN2iF69x3DGOLlY3xl/BvC9+DW81+Zwiiep0PmFRo3g9S6s7V0z43R9JSAFZloKc+
	 87l7PwEFGOLNJuxGH+9fqB+bCyAXvNcL1vva9PO/loatOLHrvjQTaM/wbF+yAJ6M4mL6M
	 i89xE0Ia1RX72+rDrr2jSv2Ex8me+iBsUAvP+B78q+kh7nNg7CJWTZ0QzODmlyEzzn0CT
	 cxpF+By6c7FPfV+jYk71zhAEd8YaxMyb2jfBQ+D2nNOkXlao9Uvz/uC4wgL58tBNCjtKr
	 IbALJa7lEHjkTKDq1plCsjSBjQ+S05N6Ic7rj6Kq9qIbTx1pvZCBlaOtEYSSLOxVGVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQIq5Vsk;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E1C606A696
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E1C606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQIq5Vsk
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so6150822f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716644; x=1796321444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zz6u4Cuzc6p+EDQcVFWb32sTk/fRMtJK3zDf6Jp1Zog=;
        b=OQIq5VskqQRB450mdvMxDxAOhYiFXd88UbRsXEuVe6FNcxoGRGdvcKgRhE/eccKZ/O
         AdltUC6Tz2E5h2MtaaWMpOO64/hQmqLqM3zFr+mUp8iF/pmPEYXDdix0CPtzs7LZ5jCr
         a0Uhfxg1q9HNfJPy2C/FANc238WM6H9gMr6m9bLfOd9OIirp7WKB1woE0qNAYLYaGkNp
         B8/ngc0fNT/P1NQm1bY4FO1fMCazrUkZMtaAfuEEelq3pN/djI2/KoVQi0lF1ifOT13k
         tlPqeeJ/o1ICav4K/iUczJYd5riF3XRfxx2kv/q+XCYTtdeTNiaFbLf4+l+buCRKQjC1
         7AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716644; x=1796321444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zz6u4Cuzc6p+EDQcVFWb32sTk/fRMtJK3zDf6Jp1Zog=;
        b=i8QirJ2NNk8zjUV62lqrOFTcdlimJOUnbV+4snN1mbr7gSS1N49SpS45FBfzvGCeuy
         YxI+H+L8DpJgKGPB8KFznERW1hiuoN6q15sOEGSxM4h+amKM7iYcq17yTh4U/X2mYQjK
         w5myOg8j2H+2Zbpvcv7HSarMyTS5VxU9S8NKRxM/8IDnlzd5quLMutbM7sisdmYzLduo
         NhND+yh9NUjJHaisTDAkpCAAv2cTAytlioYvNZ5AXI0pKMvQHU45lmAufqfTa57T5AKw
         +bVgoH5h7Libe5vhc4x+5UCC0t8ANxNX2/zAeccy+VtZ4y2hWeGkC7zgHlmJz3qm16m1
         /8VQ==
X-Forwarded-Encrypted: i=1; AL+hErFcoRszAIb0/0zwLuh67zpuIDAZTLg6czOj7cHNm7wBHPNZ7ocfj8tTua7sYMSieFgTKfllpAZWOMjMzlw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GkcfIMsEOBNcMQXuXSroKqYatKG143PYUNAwHCUObgZn/FdgI
	qko6hGyEmO0Hs9cXJXvO0H5lxsrIu1uz/FMNIybz2roCUMJzbWC/I2E=
X-Gm-Gg: AZFdTZeD+vJXt4sPBdCofBb9SDVurD7UENe+jDGqT5rVZVHUrL4IxVmEKxa9CFGHqeX
	1aLo6vk6ZiGTExl5IG0fjsWjPWMH6YaHAvEaRniGxzVPAuyDcDfx3ETwHws/xyz1FC86FZ58+AA
	kRvJ2ZqOC5ZU1NcqdhTKhZ/cL3XejeQ/LQhdtGwAMOI/Ru/UFbaxocAvys4SIKiCPT4a6eANWdw
	/pTEZyVLn98i0mJJTpb1kj74N1Yj821KF4FBRkpAC5sqJ9MNLX7BGdqzDUk6+Fixh6ibyr5v+vm
	dqyUxQwIhg7eTTGiFUyrB+euSeqjepjQ3n9J+FgH7YOvvXhtUzZVAkUi/MQbH/UKwAheFqydiD0
	Sh+eG/Ibcvv4pgZMTls8/8/Djd3pgNJ8lft1iGB8kN/+oZs6JHBPnjAst9rNGvJ5J9a9znCvRZp
	xAPeI1ZzReV/sl+miA4Q9HcIlzD0p4oTAKbe2LJQOc7yKkHT9WwLM6ghpp6QbxX4iBLKtoPpdvN
	b6SI8Qh/ALPo0gxgMYln4s8uKCiHOfjvNmdLJ6cSfuXI9xCmBnqYbmPThvt7MfyF0l0BPhtlidL
	jc19uWvbucDLvlroj/hDvgPlEvvz5LexvD84SjzcmaeLlt+e/a3ab4e4oD8/LXA+jCxZNIhMZS1
	oz/+z4UM1ndVQM1ni7FduM0FPTgvjUp0RhfD6t2VAPtZpwVBFwLvQjJwiXfY=
X-Received: by 2002:a5d:5888:0:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-4abb47b0fb1mr41676503f8f.51.1795716644105;
        Thu, 26 Nov 2026 10:10:44 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm42675231f8f.16.2026.11.26.10.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:10:43 -0800 (PST)
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
Subject: [PATCH v2 3/4] ASoC: tlv320aic32x4: Add IN1 and Mixer Amp analog bypass volume controls
Date: Thu, 26 Nov 2026 19:10:37 +0100
Message-Id: <20261126181038.99595-4-gianfranco.mariotti94@gmail.com>
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

The TLV320AIC32x4 provides analog bypass attenuators for both the direct
IN1L/IN1R-to-HPL/HPR bypass path (Page 1, Registers 22 and 23) and the
Left/Right Mixer Amplifier (MAL/MAR) path (Page 1, Registers 24 and 25):
- AIC32X4_IN1L2HPLVOL / AIC32X4_IN1R2HPRVOL: 0.0 dB (0x00) down to
  -72.3 dB (0x74) and MUTE (0x75)
- AIC32X4_MALVOL / AIC32X4_MARVOL: 0.0 dB (0x00) down to -30.1 dB (0x27)
  and MUTE (0x28)

Add the register definitions, piecewise DECLARE_TLV_DB_RANGE tables
approximating the non-linear TI SLAA557 curve within 0.1 dB while
staying under alsa-lib's 256-byte MAX_TLV_RANGE_SIZE limit, and the
corresponding Bypass Playback Volume controls.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
Note: Of the two TLV320AIC3204 boards used for testing, one wires IN1
with Line-Out (LOL/LOR) and the other wires IN3 with Headphone
(HPL/HPR). Since neither board wires both IN1 and HPL/HPR on the same
codec, 'IN1 Bypass Playback Volume' was verified via alsa-lib TLV dB
conversion and live I2C register readback (Page 1, Registers 22-23)
rather than end-to-end analog audio.

 sound/soc/codecs/tlv320aic32x4.c | 37 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/tlv320aic32x4.h |  4 ++++
 2 files changed, 41 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index ff9cb9ce7cf77..92f77b26b4b40 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -264,6 +264,39 @@ static DECLARE_TLV_DB_SCALE(tlv_adc_vol, -1200, 50, 0);
 static DECLARE_TLV_DB_SCALE(tlv_tas_driver_gain, -5850, 50, 0);
 static DECLARE_TLV_DB_SCALE(tlv_amp_vol, 0, 600, 1);
 
+/*
+ * IN1L/IN1R to HPL/HPR bypass attenuation (Page 1, Reg 22-23, inverted).
+ * Kept within alsa-lib MAX_TLV_RANGE_SIZE (256 bytes, max 10 items).
+ */
+static const DECLARE_TLV_DB_RANGE(tlv_in1_hp_vol,
+	0, 0, TLV_DB_SCALE_ITEM(TLV_DB_GAIN_MUTE, 0, 1),
+	1, 2, TLV_DB_SCALE_ITEM(-7230, 360, 0),
+	3, 5, TLV_DB_SCALE_ITEM(-6612, 174, 0),
+	6, 7, TLV_DB_SCALE_ITEM(-6020, 190, 0),
+	8, 10, TLV_DB_SCALE_ITEM(-5667, 124, 0),
+	11, 12, TLV_DB_SCALE_ITEM(-5370, 100, 0),
+	13, 18, TLV_DB_SCALE_ITEM(-5240, 50, 0),
+	19, 23, TLV_DB_SCALE_ITEM(-4921, 46, 0),
+	24, 47, TLV_DB_SCALE_ITEM(-4670, 50, 0),
+	48, 117, TLV_DB_SCALE_ITEM(-3450, 50, 0)
+);
+
+/*
+ * MAL/MAR Mixer Amplifier attenuation (Page 1, Reg 24-25, inverted).
+ * Kept within alsa-lib MAX_TLV_RANGE_SIZE (256 bytes, max 10 items).
+ */
+static const DECLARE_TLV_DB_RANGE(tlv_ma_vol,
+	0, 0, TLV_DB_SCALE_ITEM(TLV_DB_GAIN_MUTE, 0, 1),
+	1, 2, TLV_DB_SCALE_ITEM(-3010, 350, 0),
+	3, 4, TLV_DB_SCALE_ITEM(-2410, 200, 0),
+	5, 8, TLV_DB_SCALE_ITEM(-2050, 120, 0),
+	9, 13, TLV_DB_SCALE_ITEM(-1602, 72, 0),
+	14, 21, TLV_DB_SCALE_ITEM(-1251, 47, 0),
+	22, 24, TLV_DB_SCALE_ITEM(-851, 34, 0),
+	25, 34, TLV_DB_SCALE_ITEM(-715, 47, 0),
+	35, 40, TLV_DB_SCALE_ITEM(-225, 45, 0)
+);
+
 static const char * const lo_cm_text[] = {
 	"Full Chip", "1.65V",
 };
@@ -291,6 +324,10 @@ static const struct snd_kcontrol_new aic32x4_snd_controls[] = {
 	SOC_DOUBLE_R("LO DAC Playback Switch", AIC32X4_LOLGAIN,
 		     AIC32X4_LORGAIN, 6, 0x01, 1),
 	SOC_ENUM("LO Playback Common Mode Switch", lo_cm_enum),
+	SOC_DOUBLE_R_TLV("IN1 Bypass Playback Volume", AIC32X4_IN1L2HPLVOL,
+			 AIC32X4_IN1R2HPRVOL, 0, 0x75, 1, tlv_in1_hp_vol),
+	SOC_DOUBLE_R_TLV("Mixer Amp Bypass Playback Volume", AIC32X4_MALVOL,
+			 AIC32X4_MARVOL, 0, 0x28, 1, tlv_ma_vol),
 	SOC_DOUBLE_R("Mic PGA Switch", AIC32X4_LMICPGAVOL,
 		     AIC32X4_RMICPGAVOL, 7, 0x01, 1),
 
diff --git a/sound/soc/codecs/tlv320aic32x4.h b/sound/soc/codecs/tlv320aic32x4.h
index d0c2e1002e99e..70ea13198002d 100644
--- a/sound/soc/codecs/tlv320aic32x4.h
+++ b/sound/soc/codecs/tlv320aic32x4.h
@@ -95,6 +95,10 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
 #define	AIC32X4_LORGAIN		AIC32X4_REG(1, 19)
 #define AIC32X4_HEADSTART	AIC32X4_REG(1, 20)
 #define TAS2505_HPVOL		AIC32X4_REG(1, 22)
+#define AIC32X4_IN1L2HPLVOL	AIC32X4_REG(1, 22)
+#define AIC32X4_IN1R2HPRVOL	AIC32X4_REG(1, 23)
+#define AIC32X4_MALVOL		AIC32X4_REG(1, 24)
+#define AIC32X4_MARVOL		AIC32X4_REG(1, 25)
 #define TAS2505_SPK		AIC32X4_REG(1, 45)
 #define TAS2505_SPKVOL1		AIC32X4_REG(1, 46)
 #define TAS2505_SPKVOL2		AIC32X4_REG(1, 48)
-- 
2.25.1

