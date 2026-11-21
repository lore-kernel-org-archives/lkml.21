Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233350;
	b=MFnJTTYB9KZwXwfK9CWxXydjQPEmt4B/CELnto43VDWi12EeDCNnuFY8nM8ekHatRQMN
	 uvgdQmvWqDw/C7xDVJr/60ZNq93FL3rTvTPCg4DdCsj1jyTEuEdt8sq4+jB6Fzb1mguBF
	 KurS9ASrIHn9QDESAq0xHMeqX3Dmgwyt4p/6iKF7t1QIHzjBv6X46jD6wYrllQYE4tQ0c
	 jOhCxQIiWKpN2deQitdgKOm3N8llYnoH4qd3O5jgTNfHbKINUsWl1ZKOa09VsbvGQrlZc
	 96vDezpmxhSfTAWcEXj5JaXl1d81XFlVuI0VilgqrmzpLavnOpsEIws5ywyJky3xN3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tltDCiy5cuzdulawCOgmvyY3l0pK0A9bj1d/Pm/aQJI=;
	b=tEZFj3irOzLm5JWXZzRYtxqCTCRV3YNvCKoxbcPqwHs2dhi8MOkjQd1egOaSk4AR8Mx+
	 Y9Fts5w9j6Fp0mLJAKLAqv99xAokElShPHwA7DcSPfS9vw9XuWjIzbmRYXQTU607+c3Zr
	 EACUlJj1D6wPkPRLFuCJyywwbfbXCMiOTkzOsLntre+kxbKNN+YncEFEAHARsLLiB3wTq
	 hdEQE6bh1kaA0geUz2bb2eXcpVCEmWkfFMLOoVgCLCIotv0iua9OBrN6slWAb8M+U2M5t
	 isY+usWE+1b/WVExXCWpRvB/5KN/vxOfsNfqcZVDInwXBPkvP84snJN4diNKM6PDYnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wnqpGEHY;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51CE60A2624
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A51CE60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wnqpGEHY
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b1afdf5196so604977eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233346; x=1795838146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tltDCiy5cuzdulawCOgmvyY3l0pK0A9bj1d/Pm/aQJI=;
        b=wnqpGEHYxtDroPc3PZWXnrqOoc2sCIXECDGkhs7RGu970lvBqHo2idlO8jAyuN3wMP
         T6pbZXgc1lmmOWlHm++3+4qVzYdwcnFxwj1nuAeA3L9W0VyEhZ3gHs0c8RhTrVCmCM2w
         WSd2PfA3CC0CHxF+5mcst8wNoWOb2tuAVk8QDhok+vwe8p2XMbQRGGLy6I69LeDPSaLj
         egSe3N7k1du/MKe6gIJjVMApLLqZv/6IkPkj2mXbGMtkhTgLwFrbq0kZcddhQgbpNOda
         URh0TkDIHf1RFExGlGGTM+5bUVbGPm70/BmY3EyrK9OUF6KUsDglwF9SPl4/Lk72f0zw
         eg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233346; x=1795838146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tltDCiy5cuzdulawCOgmvyY3l0pK0A9bj1d/Pm/aQJI=;
        b=fKO7ALTdlkjT6Tqq5TFstEYcpNT5FFfvey2pms3TA9chl7KoYCY4+TXgXQkOHEelva
         wXDXUK+nP5hDhKsF0+maBoEnU5uYUydwKX6Dgbgg2P+2IAuh/Dpx+7E6dx7FGKeFxrNb
         bBxK8ByBW42Xh3KY/RukSarEL/hQfSW3CrdapHOq4JfqpOMoRW1Yi9f2IR411ijwsww6
         8gNFOQDQolm7cMsgrHexTjA5gd4tGv3xz9KBhtaVbyYPSaVmCA8fVgKuqwnI8axhzKux
         /+zWLKcm7doQ7s9njosYZhekieuFrrEyuYnHcfSVTiu/SP60ZzjrimGzmT9drqRtZbTN
         rrxg==
X-Gm-Message-State: APuU4Z+0DSHpHLjhvdVQZnK8E6hqtAliVYqVLhgBkhZJPuUMXrKMjQG3
	MksayLUjVQtqBmXoXP93DJjrg8XeOjrh4ebN+POipUxYthDkpfL2H0o=
X-Gm-Gg: AYBFou2POlOP9yyhSqlTwEDN3SxSfaJvzrOjQyI7t7vSN9CuWkBhubUsdh3ojUgoomk
	HKpelrC82iMu0tR5aswPBmN5QayH40tEPaZb0LoRo5/Y3FhQ0aTSA9Sgs7tBLfWiagmAH/B/4MV
	e2oSs5eKHkWAVrdr4AlbjLRKRMaN9I8QGEbALSHqbj404aghk7yPHrJV/paRCldlFTiQo7OBoMy
	Nw7Pk2Qf++690XBgPOh1AI84/oLcRt0aVBuu52ckkR/hIsH8DSh1PwIK/HGXT8SF1tv6uHxY+pu
	iAVOmrwVICUOpeEQwS3e4MzAfEGaW6qQTg0LZ/cPI2dVSWlEcepul+TXJ2+CZ6LZKqI6IqDPR4Z
	KTNGDKZ0g4xy/dLhe1ppE/zwq3Trnoo+UZmr/8nahTO3AyyyeoQbYS7eVM+RCPn7TJVm4EpJk/e
	+qm+K/hgp9CvxYL5fNU/Z5e72pRd/V9UrYXiJOw2FOegLic3tiiTkEIBT565FXMl6YPBcGd8Mlt
	MJu0p78lN5tsKLmWq7DGERJ8yJzBsl/M6yYVMt/x7dts1zZtxUG2ejwTgck98vHtz3m9pwLcIec
	CWQ242/jgv9F2/EUfPxNm4p+CLLq2DYhwog00ktQfM/4cnYH52WncAp1
X-Received: by 2002:a05:6820:2488:b0:70a:347e:4e9f with SMTP id 006d021491bc7-71b3952cb48mr3400899eaf.59.1795233346574;
        Fri, 20 Nov 2026 19:55:46 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:45 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 03/12] media: tw9900: accept the TW9910 chip ID
Date: Fri, 20 Nov 2026 21:55:14 -0600
Message-ID: <20261121035523.26764-4-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121035523.26764-1-matthew.laux@gmail.com>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
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

Allow tw9900.c to accept the tw9910's chip ID and revision fields as
well as the tw9900's. The tw9910 is a superset of the tw9900 for the
functionality used by the tw9900 driver, and USB3HDCAP/XCAPTURE-1
capture devices can have either chip.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index e9d384039b50..df8c7b1f3450 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -23,6 +23,8 @@
 #include <media/v4l2-subdev.h>
 
 #define TW9900_REG_CHIP_ID			0x00
+#define TW9900_REG_CHIP_ID_ID_MASK		GENMASK(7, 3)
+#define TW9900_REG_CHIP_ID_REV_MASK		GENMASK(2, 0)
 #define TW9900_REG_CHIP_STATUS			0x01
 #define TW9900_REG_CHIP_STATUS_VDLOSS		BIT(7)
 #define TW9900_REG_CHIP_STATUS_HLOCK		BIT(6)
@@ -51,6 +53,7 @@
 #define TW9900_REG_VVBI				0x55
 
 #define TW9900_CHIP_ID				0x00
+#define TW9910_CHIP_ID				0x0B
 #define TW9900_STD_NTSC_M			0
 #define TW9900_STD_PAL_BDGHI			1
 #define TW9900_STD_AUTO				7
@@ -574,6 +577,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 			   struct i2c_client *client)
 {
 	struct device *dev = &tw9900->client->dev;
+	u8 id, rev;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(&tw9900->client->dev);
@@ -581,7 +585,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 		return ret;
 
 	mutex_lock(&tw9900->mutex);
-	ret = tw9900_read_reg(client, TW9900_CHIP_ID);
+	ret = tw9900_read_reg(client, TW9900_REG_CHIP_ID);
 	mutex_unlock(&tw9900->mutex);
 
 	pm_runtime_put(&tw9900->client->dev);
@@ -589,11 +593,17 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 	if (ret < 0)
 		return ret;
 
-	if (ret != TW9900_CHIP_ID) {
-		dev_err(dev, "Unexpected decoder id %#x\n", ret);
+	id = FIELD_GET(TW9900_REG_CHIP_ID_ID_MASK, ret);
+	rev = FIELD_GET(TW9900_REG_CHIP_ID_REV_MASK, ret);
+
+	if (id != TW9900_CHIP_ID && id != TW9910_CHIP_ID) {
+		dev_err(dev, "Unexpected decoder id %#x (rev %u)\n", id, rev);
 		return -ENODEV;
 	}
 
+	dev_dbg(dev, "Found %s revision %u\n",
+		id == TW9910_CHIP_ID ? "TW9910" : "TW9900", rev);
+
 	return 0;
 }
 
-- 
2.47.3

