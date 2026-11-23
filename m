Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471619;
	b=qgas3PjUGkJvQj3DbxsrxbGCmGinA3zKV8GrVvbKw9aqOE2jMQ45pj6YB961JH89pExl
	 0wTS2o9+Ih1T6TTJ1JHYgcopPjuvOkXcFbLOT5eYP85G5ipxsNWjx1ggAdifpKVS9BKEz
	 Wh0wvByXJB9tKRZJxoqIz5KRe1Vb4X2Ucx1ARK3LgBWFXVmk+81rKjuy8ZnofL9GFZZth
	 odlXYcB7L6kv0GNxe1tvushmasr+2At9UL/GQ9hNS3eJGSVaXhbFiOQJmgntuuIwpU1II
	 vS97MtfNuyLHqKMvtOhbxFvn9gSCbGsFpQxB/Np+XqKz4/cGKO4tHUSSYGxedUcabsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o7w+XYrUuPM5OlZczhXAMuU75dtDBjR/bPRPu3dewXw=;
	b=sT1P3v+OxZmNOGVPavzZ9QObca0O7og5q8a8BWj+0OhJm/+NceLjTCBNwcPQ9fxSUgss
	 Fx83llRAgJrb2Qp1SomrUD4ORZhgFSOndKbaNrUxDHV9J8el0sBymvGp8bzsgbE2o/YoH
	 fyACcRNZDKkN3vrUiB5O8gkeXQvjs2MqH59CylYImwb+Rwz1myPkQiwilOgHoFoG6ecNE
	 uuVqCmFDzGG76FakRqe7xM2UlDQ1f+fqdSlOOFKkvYMDNow2zxmztWI7hdxjZkV8Zg7He
	 yABv2mOwzEbi1+j/WU0A6jXT7pC5UY5JP0Sqz+NWk4ZbIf2Yk3DyXGlBPhdp0xiZ/Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9xdN1z2;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F33A606A333
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F33A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9xdN1z2
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so31838471fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471617; x=1796076417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7w+XYrUuPM5OlZczhXAMuU75dtDBjR/bPRPu3dewXw=;
        b=Z9xdN1z25XmSHzZ4s0E/IbSkGR0uFFE68m3F/9/VOGIbSzHYtF6gJP7jHCfQz91G+x
         W8N+BiUDrttMBOzTFOyEVSmbDz4XVPLxCH8+tZkowj0FIeiLJfkmvhPHV0pH7NoAgYDz
         59iMsTBO3wS5MBL6gf3FvXV3DlTpqeBP1yEDXeCMJxRLbcOdx5H7owFE5Pw/bOZFFgFB
         QmuHbJhlkiN7XtPOw0LmaZWjl27SmWZruqaymDnZwpyvmKskmU7/YkeUr0fkvy+8dOYN
         dKEjNVpVEoZv5VtZmvqQxlaVR+K6a46irUJHM+athRHOgHJ/HEmmoCX/U0OLx4KLErzM
         gwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471617; x=1796076417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o7w+XYrUuPM5OlZczhXAMuU75dtDBjR/bPRPu3dewXw=;
        b=bZyAEzKDv9++4p5vG2jJmR4SMjQmqNrP+z4uQsFaXg5vVXu0i/wfYxHhdm9kebQMvH
         5eokxuBBWWgIIVzrwHKI6jDkmKKp+ud+6BP9Ms0JLjXeLvUmwpdAklBn+tT/WOJc4Vw7
         pIMK+MPcXC70dCzGmb7d7uwrmM/XcDtauTC7zZNR2xnn5UT/780+FbE+kV5J4g1aLMaf
         d6A4aFNzEeDXq6szMZcDKO04guEcg3IOy4ZXgCB2UVTHxiVs6h4jlkwEg6hQr98qDJPq
         2XhYbLFuv7Uy+c/YIebFh+1cnL8VJDT2//KBJWio4+s+W1T8MeyRp31qiWEtW4CrqV8t
         QnxQ==
X-Forwarded-Encrypted: i=1; AL+hErF6tjEc8z7Dr9W/EpTPinavlFkRYixbY3l6ssf2b931Hc66JfcVUA/dq5C/Lz5rtFTbvU5Ad01vgHMiC+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d7Wnwol56c1IpfkEX9CDFLzEFLwHEO4QQowsaZb+PtYy4HUPa
	l/7+1D9gCDHz6cfvGtrfeRaP1jm0rB+boGASM+ZGuvq6ZkoM+l2XQHpF
X-Gm-Gg: AZFdTZeclZWDhuBMcV5Z6TbCyqlP244AVbAI0rRHpghHlLn3U4zrnOuhA1Gmt3QyKLa
	1H30ru/upUp+nO498OlMCq5ktlHhza3b1SfP7yXF+ntHhtK3Fn2U54qbc6QKGExSr6Fua+hSxVJ
	9N7Bdbxmq4BuC1sVOTMid1b/LEP8caGs0IoRlxGofxXYUSJpzNf5hPG7PCUzfGwc2JXzuzq309N
	oXbK6a9TblNOGBbQrbCbwLnMuME/vyxPQwXnV35FUYAMd1UkFKHfKTRj/Z4I51UE7PmRSBP0GIf
	+SeYDrohJ3kjLLR9uKgKahqGiS8QMZX09JqtuNbdezPiSDdgyBrXBuRFtYIvMuz94mYt3fH10FV
	CzvAk9M5mqogmrBJOO2nWl64wssXLWl/Dr8t2BGZlvjf6PyIdKNYeMA7RCoCpsP92X3ymiVRC74
	wcQiLpnZaM0JJNmnDanJhUlcQVP+LkTqpJAZDxK3teINkaxRUUUmCQ0okBEuGfwupR8C7xFGZsY
	4c0OYQg3ny6GddZNnm8bo1c9tVMgTbRoESNHL+GwnLwogW6DctBvAUetjzSarmk4XuZW72ddXjK
	l2AIe4l7pz7FCLBmP4XChJZLS6A6xlS5zM44Gx2Tx0tEaYk+s6WvljNxVNiAtDiHW03SNTr8YBx
	8/ArtwI3925dcqSfYeFQDVXmi9HiYTl5A9LVM2BxRd5Itljv0l+LtJ8wpB5E=
X-Received: by 2002:a05:6512:1313:b0:5c1:57e3:f5de with SMTP id 2adb3069b0e04-5c1bc81a0ddmr4006457e87.38.1795471616638;
        Mon, 23 Nov 2026 14:06:56 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805215ccsm34272021fa.21.2026.11.23.14.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:06:55 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH 1/7] iio: pressure: dps310: sort register field defines low to high
Date: Tue, 24 Nov 2026 00:06:43 +0200
Message-ID: <20261123220649.36887-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123220649.36887-1-zoone.rupert@gmail.com>
References: <20261123220649.36887-1-zoone.rupert@gmail.com>
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
up. Sort them all low to high.

Suggested-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 9ffef150cc4c..02dbc5a8ac37 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -51,13 +51,13 @@
 #define DPS310_TMP_B1		0x04
 #define DPS310_TMP_B2		0x05
 #define DPS310_PRS_CFG		0x06
-#define  DPS310_PRS_RATE_BITS	GENMASK(6, 4)
 #define  DPS310_PRS_PRC_BITS	GENMASK(3, 0)
+#define  DPS310_PRS_RATE_BITS	GENMASK(6, 4)
 #define DPS310_TMP_CFG		0x07
-#define  DPS310_TMP_RATE_BITS	GENMASK(6, 4)
-#define   DPS310_TMP_RATE_1SPS	0
 #define  DPS310_TMP_PRC_BITS	GENMASK(3, 0)
 #define   DPS310_TMP_PRC_1	0
+#define  DPS310_TMP_RATE_BITS	GENMASK(6, 4)
+#define   DPS310_TMP_RATE_1SPS	0
 #define  DPS310_TMP_EXT		BIT(7)
 #define DPS310_MEAS_CFG		0x08
 #define  DPS310_MEAS_CTRL_BITS	GENMASK(2, 0)
@@ -69,19 +69,19 @@
 #define  DPS310_SENSOR_RDY	BIT(6)
 #define  DPS310_COEF_RDY	BIT(7)
 #define DPS310_CFG_REG		0x09
-#define  DPS310_INT_HL		BIT(7)
-#define  DPS310_INT_TMP		BIT(5)
-#define  DPS310_INT_PRS		BIT(4)
-#define  DPS310_TMP_SHIFT_EN	BIT(3)
-#define  DPS310_PRS_SHIFT_EN	BIT(2)
-#define  DPS310_FIFO_EN		BIT(1)
 #define  DPS310_SPI_EN		BIT(0)
+#define  DPS310_FIFO_EN		BIT(1)
+#define  DPS310_PRS_SHIFT_EN	BIT(2)
+#define  DPS310_TMP_SHIFT_EN	BIT(3)
+#define  DPS310_INT_PRS		BIT(4)
+#define  DPS310_INT_TMP		BIT(5)
+#define  DPS310_INT_HL		BIT(7)
 #define DPS310_INT_STS		0x0a
-#define  DPS310_INT_STS_TMP	BIT(1)
 #define  DPS310_INT_STS_PRS	BIT(0)
+#define  DPS310_INT_STS_TMP	BIT(1)
 #define DPS310_RESET		0x0c
-#define  DPS310_FIFO_FLUSH	BIT(7)
 #define  DPS310_RESET_MAGIC	0x09
+#define  DPS310_FIFO_FLUSH	BIT(7)
 #define DPS310_COEF_BASE	0x10
 #define DPS310_COEF_LEN		18
 #define SPL07_COEF_LEN		21
-- 
2.43.0

