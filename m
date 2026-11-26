Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695221;
	b=rdlfea/Ac+CEWFAVkKukfxNacnd9Dnv5mqXdXRI3jXVYxBDNk/hoAcKb2yigPrQ4qdx+
	 3KXxXUCtgHSGS51b35OlxOMXoLinmyMLdJe/4cDEzUyl11oQs3iS+d0Eh0UGrjsKDYQ42
	 wLEzsUvHupAtjKqmHKlIqqvE9oJ9nhhtnShE2lJLJcgvUlVYa+dDcreLD33rjrqaRTZK4
	 SDMEUt20FX0gubQlH5H4Fw4Cbho5B9YTTzIHYlJfv/YEA/j5qy6KxpSkWVQMFo0AJty7D
	 xmCuV2JXuUPKBZI/P/CuQC9zlhlWYFB0ndqHnGxn2WNOOBvxS3n1ZsAB5Gr9K21u8Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jMhje2gFEGMhwhdy3xLDdOVh6UnYKEqxlg7UxZsDxjQ=;
	b=GYg218VXzq6NuOPdLvToWz6T+vuFAOjU96eSg1NdI5FVr4xaVt+DDNFBnaXwo9oB7Ssv
	 1x2t2TNVjW3taKjf6Lh5NA87COFDsx+uFab90suieTzEOJYG7bNvR70T3MNSIKo+BNxMg
	 T6Oj9Bl+R4Lb08RFYrInGsRuo//RH+flkHTZuf9b9M2+U8IJvq5qHq5WnV6GDeWEtqqDF
	 4xkkuqFJ0clFPFv7Pm/iabEg/M4jEFW52fdhFADQfXmTJz1D8SnHZZm4R1B9hkYWrFG1x
	 s7llbhwoDELsfHPS4R1Enajt/5WNFbnGXhpQbKwb7dWseJwpvEqgktZYiJpZupG1AlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K9zhOTlt;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1236606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1236606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K9zhOTlt
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ae5ab4fcdcso48216581fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695219; x=1796300019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMhje2gFEGMhwhdy3xLDdOVh6UnYKEqxlg7UxZsDxjQ=;
        b=K9zhOTlt4nNrZhN0V6C4mNeztK/FZUJg2ZJ5o41KHa7dN71TZZVR16IoRdaF6r+qwH
         cNfDIvfBmBKraEjiIwcI2xx4PtYlxgu5/bi26QbQENxjEBGj93OmJZKJ09ePjESzwMWE
         NxmHAdy0xskOBOO43s4IHcDocFwQhvgiWP6D7ac0YKhpFarH5e0A73IJYbKIWgH08DU7
         e2lcoeapKX6qJFd9DmKYMwhxubueeOtsVfIcMJeVP6LtOtJP6GtfjhAnZr9LvBnytseL
         s5BVsEaGhqkqFTY20R3HUBZj8hsUjW1cj30uFGRC8fYVPgQZO9HruTYKWbbcDNcuSOHt
         kkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695219; x=1796300019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMhje2gFEGMhwhdy3xLDdOVh6UnYKEqxlg7UxZsDxjQ=;
        b=G/YU3+B7OBBFGSZG+wdh6CNX/wD/Ky1cxpOJhblFMGQUb3/i+caW9FPmYfaXxrZtGj
         4FHPiaflbbwPTBBO8awnvf8/4PhgaTz4vlY0pUaJxfaUe4YXG7S0sd2tyeI/VikJid9v
         vwQUpxniIh20xrj805bkbro61ABOdDtW535ti1aoOnVfKdPlXv3zXutkX8S3oCNnEFhC
         2hVQjcbR+HjmShNGebwLS3eDQtkitW+H3f4wLOFUM1rYLkFcFixIQBo+iuIjYKGWJ22l
         v3Ek98HFE6Lky/10wuaC83Gva1caRrr1KS5sbM/V/fNuiM/F8EzsTNUXPHGBrkVibeXn
         8DHA==
X-Forwarded-Encrypted: i=1; AL+hErH9/zmGk8VaetIpqtueGcbXPtc5/7ef7n1RX1u2fWxyPUSHFGaVZlOF5xXN4CgtfLal79N5WJZYlCKLvIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z99MQ0rgoykm/8ETW7pMizsIcxgGowHZ3k0FNnEXGt7cIzclXBP
	7JjfRwm/VQm8mGBMWqUkZZOHiNlZjlUnLd3DqVG+SSKNZquPVwEX8/dj
X-Gm-Gg: AZFdTZceSSDutHfBPRxGNcP+w1DObYn7/vZKlz2sEaY+s/SR0LVP753NzLAkvLI9XxR
	6OE2k0suYOpD8SpsqBpzyOf5DOhbVELQKWfC56E4IEkXpOR9G79XEOori4MmY4GbG0eq8XxnKvU
	bk509dKkkfhxi5gEON+QxCjB07/1MjSzhaB6D+qejTd1n7cP0RI/nKop8Wv1YXkUNvfdHGUMiHR
	Bys1reiGAxrI7UmEere8bW42eEq6WQxxP7uu902gPJbPUAU49GqXAm8EJJWIsrMRMUqaOVb60xL
	oszWbFdntqBSby0/iK3ctewUNO1IuRDBdYuWOxyIcnKi07nfhIMMdVGCLDVWgNUWKwNF9w+7CYE
	xQ8NwAIMM13ZMFxa2pqITevV0SnYWcnB3BKxfRWCYaiYrwSPlwxbPGD+D5bzzkcT+kE/i3AVVYp
	jq/jP0IZDYK/zIFy6uTHM/ShnGANRTKTSWVjhFSJ3XqBGlT79/ZogIZUVS9UBx6rIU1hAgs9PSJ
	YW96nQPZAgQQLaSKNRz8SPgq+m0fmwLleAiLFEFSAQRGbsV0sjz6itk/fA7f1dzBBmDaNEyXsnR
	D6UOuW3Ed+UG87r3zEz2wAatKSIY7bfC8KMh7lNLWNKa6MkcfwX1XVKWVS6XesycJbKlsFf0sEN
	ZKOVP3+dT36jtJmwiCzADjejpNdGY48k5vnpY
X-Received: by 2002:a05:6512:6695:10b0:5c0:bca:77cd with SMTP id 2adb3069b0e04-5c1bc803ecamr4435362e87.42.1795695218890;
        Thu, 26 Nov 2026 04:13:38 -0800 (PST)
Received: from yantra.. (nekmmqtmzjx8yvukhae-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:68b4:f70:61d8:6e86])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e8e0sm56541791fa.5.2026.11.26.04.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:13:38 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v2 1/7] iio: pressure: dps310: sort register field defines high to low
Date: Thu, 26 Nov 2026 14:13:24 +0200
Message-ID: <20261126121331.10438-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126121331.10438-1-zoone.rupert@gmail.com>
References: <20261126121331.10438-1-zoone.rupert@gmail.com>
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

Some field defines run from the high bit down, others from the low bit
up. Sort them all high to low, as the datasheet lists them.

Suggested-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
v2:
- sort high to low instead of low to high, fewer lines move and it is
  the datasheet order (Andy)

 drivers/iio/pressure/dps310.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 9ffef150cc4c..ce83bd3691af 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -54,20 +54,20 @@
 #define  DPS310_PRS_RATE_BITS	GENMASK(6, 4)
 #define  DPS310_PRS_PRC_BITS	GENMASK(3, 0)
 #define DPS310_TMP_CFG		0x07
+#define  DPS310_TMP_EXT		BIT(7)
 #define  DPS310_TMP_RATE_BITS	GENMASK(6, 4)
 #define   DPS310_TMP_RATE_1SPS	0
 #define  DPS310_TMP_PRC_BITS	GENMASK(3, 0)
 #define   DPS310_TMP_PRC_1	0
-#define  DPS310_TMP_EXT		BIT(7)
 #define DPS310_MEAS_CFG		0x08
+#define  DPS310_COEF_RDY	BIT(7)
+#define  DPS310_SENSOR_RDY	BIT(6)
+#define  DPS310_TMP_RDY		BIT(5)
+#define  DPS310_PRS_RDY		BIT(4)
 #define  DPS310_MEAS_CTRL_BITS	GENMASK(2, 0)
-#define   DPS310_PRS_EN		BIT(0)
-#define   DPS310_TEMP_EN	BIT(1)
 #define   DPS310_BACKGROUND	BIT(2)
-#define  DPS310_PRS_RDY		BIT(4)
-#define  DPS310_TMP_RDY		BIT(5)
-#define  DPS310_SENSOR_RDY	BIT(6)
-#define  DPS310_COEF_RDY	BIT(7)
+#define   DPS310_TEMP_EN	BIT(1)
+#define   DPS310_PRS_EN		BIT(0)
 #define DPS310_CFG_REG		0x09
 #define  DPS310_INT_HL		BIT(7)
 #define  DPS310_INT_TMP		BIT(5)
-- 
2.43.0

