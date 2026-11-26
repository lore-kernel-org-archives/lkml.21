Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716643;
	b=upMLsTDs6vKyGh0/pTAI5ieVUXjP3D9z/7DpRg5f5RaicPiR3rML38d2sLiWFlORC6ZS
	 m8zKzME0sVddUuG/XtosZvdWglJbhTThaDyinZ1blBEy6gEG8/AahlddRK+kEw3IJbKYT
	 s4Gm0LhnqMTWFbdHHQImE7l5hc1Xp8UYujUAYUXRMA9y40U5uga67xZ5WwfCfQi0j/NXY
	 jrwXRQ7ekajlLyyptUDdfOrV/kOBtUeOaKc7TqrzcjipmKXY1fzVKO0cT0X5WNUnxD6XP
	 5x+5vypGwGnmOtrmY/PuslY1/XHUlHVR14SMua7hlHElxV+Y9nQW8OMEPO9E/E/JhrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nGSVVjQ0r+iSguJgKuCAXf6PPIandnXG2Iedl8pD6MY=;
	b=Fh8u2MW3scmbP2rfZbFTFnIxP38hTaYG2RmZB+UfMPjQvsLKuA4RsU4IQssWqqt18E6z
	 iqH022wSqTwbBY+aALiQuX6zjIBqfGdcNWHSvi6gb/vq1HjM+ihYxK4iFBSKJCUyz4f5e
	 n5f+m5DWofsMos43hXrOQTnt7G3StyzbA0/QAtd/xLs/57CykVZ6XEX/Rv+MQ+5qjJYdX
	 s271iM+xyydfKecNXZ9mFP17L56FKHleiS/bTloO5ya/PvFxe3ejFaYHxUtRSVy0TghnX
	 r+eIr4fEbGZu34DXo+ekJeMJGxoA4ZJ/HDc6ibizalqiT4hLBiDz3fCcbGnUo7l9RsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXsdTrdK;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23170606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23170606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXsdTrdK
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a358881793so3860286f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716641; x=1796321441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGSVVjQ0r+iSguJgKuCAXf6PPIandnXG2Iedl8pD6MY=;
        b=YXsdTrdKMbKCXR9uO34stn9X9Mn7Uo+MZcNsE6LX0pNaz1LNMPCK0WKiSaDZA5CKAt
         6gwS7ncDs7/v1c6LpfmrYmg65xEeEF+CkvIhkXK9URd0io6/VgmOHdeaVMOJrHmS5ssu
         sVhM5y/miYHlSLv/Xo1hAGEumVEYPHnhFlq0/ui1TzaHqeQRHJl5ig8RFoKmuBA0x1fX
         os8OGu3nRetaYAY8F/Jb7FTRBWVoioWwTfbrxEvVaMARAUpvKhojeFvxdCZHwEbYDQso
         3ZjoNHA+o76KaxX0DvsybUbPoFdSdwQtxEecCjiQdUeoJDry3QqBcVQJHr4B6YpXwAan
         eqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716641; x=1796321441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGSVVjQ0r+iSguJgKuCAXf6PPIandnXG2Iedl8pD6MY=;
        b=b39LeCG+vv9yTN244vb2Ju+GlOwmfFNZyyKMlgPEwXe0ZztYFSt1AkzwdIRrcpQIuR
         ontdO4sZpXm9EXuDSrr/qZfYYHY9d022OPPDnwZXRUfgqT5Z7Q+RBc78vqX/EbI2geJa
         cag/jgrC/lqcUY//rWeMYLYcNYDpCUAbyiyIr6i023Nl978M95Z6Mrf6Dkbf8Z+diJPD
         5JouZEoccw+Wgb9pGBKEb7OIaGwYvVcr7jw2G0jSOmF/PWNhDGf1rDOAJmj++qZC2Bhm
         JcOc8MY/8cZf2kVA3AEgLjmYy7H6+5TWCTlzD11B+faQ4Wqfb+Q7FW6J8YJu/G13tGtX
         SK6w==
X-Forwarded-Encrypted: i=1; AL+hErHxRdz6LOrIARSS+CkD+KUGEZL8EdaeTc4B8QdgyU1WT4K6jpOiGC3MpS9UArTj8LrMPnqxgO0krJCToKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DzhtaCkXE/06/7lmu/xB1FIhNg8RB39sC0WxIKwwFxurHxW9D
	jzBmGoXRzvntWFHQthd3JFhETnuVUM/ve3jnLS1bsHtaOTaJJfUkT2g=
X-Gm-Gg: AZFdTZf3NoCkRMqKok+3MqIe0T2gRL97bvCw4T1xOPt60LESWjP/zPGqyy5wPabgcDV
	rZb44jsWIH6e7fI7SCmaCDGV0sjKpK0ofWRRc7gQ6uXP8NUTqwGR+lsNOpUP/54Mrg1IpYnHsoW
	sdehIiUv/vnhhKQ8l+FeujFsa24T7+ZzJ4est4IReZN4EYluBdsRKHTfQ6WfPcYtNUSN1BqYmgV
	ilhAfLwdw0CNL3Ny6C/4wXzbNiSl7o+PK8FLyw3g9TzP3cHAJlF4nc6dYKe7PXrCamJFZtVjsaO
	oJBNW/pod4FzexLFzNDlfzn5YF1m9MFEhmA3ItCNd7n5Zf2m7Rldh6AwVFN0rb4TTVDfyVwK9Vs
	2KUdptgOGxhtZQH9OAVZyC0jrfwkcsOaNaskARgDhoJ4SRcSbJ3kZy1ibahuZpmgLqHleUmKapr
	pZJf5t73NQDEKyM8dOUmvPrisOHKhuza9jNZoD3PJ7rxIvKIk/PK3IHe5FohORhD+lhb2JVqjWg
	6hIoG+tiYM717ylEVP3QpcukbDIds5q9rSEnIi0Wz3IQonYjIxKKk6CUYdG1AnzeI+Ew2uEw0P9
	Dc4bW0UfjH2sTA0cJsbwkTprgQYTdOq0X/I0lryBBFBNchTA+Eva1Td90soxmIvxtXcu09xBrF9
	NnR9lyEVB8TqqWTOU0/QtmfuI6ynuADHaui1lqRBlkcUcCnleMG5Z2JqMf1w=
X-Received: by 2002:a05:600c:1d08:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4bb8882bd7bmr433521135e9.28.1795716641384;
        Thu, 26 Nov 2026 10:10:41 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm42675231f8f.16.2026.11.26.10.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:10:41 -0800 (PST)
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
Subject: [PATCH v2 0/4] ASoC: tlv320aic32x4: Complete analog routing, Mixer Amp bypass, and volume controls
Date: Thu, 26 Nov 2026 19:10:34 +0100
Message-Id: <20261126181038.99595-1-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The TLV320AIC32x4 driver currently exposes only a subset of the codec's
analog input/output routing switches and omits support for its Left and
Right Mixer Amplifiers (MAL/MAR) and analog bypass volume attenuators.

This series completes the analog DAPM topology and mixer controls per
the TI TLV320AIC3204/3254 (SLAA557 / SLAA408) and TLV320AIC3206/3256
(SLAA463 / SLAU306) Application Reference Guides:

1. Add the missing cross-channel DAC negative terminal switches (L_DAC
   to HPR, R_DAC to LOL) and output driver bridging switches (HPL to
   HPR on AIC32x4 only, LOR to LOL) used for mono differential headphone
   and line-out configurations.
2. Model the Left and Right MicPGAs and Left/Right Mixer Amplifiers
   (MAL/MAR, Page 1, Register 9 bits 1:0) in DAPM and wire their routing
   switches into the HPL, HPR, LOL, and LOR output mixers for amplified
   analog ADC/DAC bypass.
3. Add the non-linear analog bypass attenuation volume controls for
   IN1L/IN1R-to-HPL/HPR (Page 1, Registers 22-23) and MAL/MAR (Page 1,
   Registers 24-25) using piecewise DECLARE_TLV_DB_RANGE tables.
4. Expose the CM2_L and CM2_R common-mode resistor selections in bits
   1:0 of AIC32X4_LMICPGANIN and AIC32X4_RMICPGANIN (Page 1, Registers
   54 and 57).

Tested on two TI TLV320AIC3204 boards (one wiring IN1 with LOL/LOR, the
other wiring IN3 with HPL/HPR) across headphone, line-out, capture,
driver bridging, and MicPGA-to-MAL/MAR analog bypass configurations.
Since neither board wires both IN1 and HPL/HPR on the same codec, the
direct IN1-to-HP bypass volume control ('IN1 Bypass Playback Volume')
was verified via alsa-lib TLV dB conversion and live I2C register
readback (Page 1, Registers 22-23) rather than end-to-end analog audio.

Changes in v2:
- Patch 1: Restrict HPR Output Mixer 'HPL Switch' (AIC32X4_HPRROUTE bit
  0) and its DAPM route to AIC32X4_TYPE_AIC32X4, as bit 0 is reserved on
  TLV320AIC32x6 devices (Mark Brown).
- Link to v1: https://lore.kernel.org/r/20261123234050.150364-1-gianfranco.mariotti94@gmail.com

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>

Gianfranco Mariotti (4):
  ASoC: tlv320aic32x4: Add missing DAC and driver output mixer routes
  ASoC: tlv320aic32x4: Add Left and Right Mixer Amplifier DAPM support
  ASoC: tlv320aic32x4: Add IN1 and Mixer Amp analog bypass volume
    controls
  ASoC: tlv320aic32x4: Add CM2_L and CM2_R negative MicPGA input routing

 sound/soc/codecs/tlv320aic32x4.c | 155 +++++++++++++++++++++++++++----
 sound/soc/codecs/tlv320aic32x4.h |   4 +
 2 files changed, 142 insertions(+), 17 deletions(-)

-- 
2.25.1

