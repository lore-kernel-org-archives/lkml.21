Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115314;
	b=ZN02CzHpo9zMvWEhlRk5TAOR1HtuVgz0HJ57F8cjaN9LwxB1xfmRTvba8GjDYqvR1Q4q
	 O8yioJiXsfBgzfr7o6JZ/KWzeI0mvvf3Skjps+hoCfyCOcUBMGMXfgZL1lq+ke4Wo0Lup
	 HeQxQOrXnIPaq3nuUewL62yW9+z0X/94XZ0CQNCPM+5WKUznKlq7iV/054aDVfLOMbZl9
	 a/60ya6Tt7SSA+L+UG+/JoZBPQZuA4xTWRueu5mkYJsIhg2SG3qPkvab7NSPXP8Iw4iXB
	 4XhnST1rdDPbPP4SBR8fvI+CyG7nVBbX7RQzy16CSj8rCXCfYDLOW20wM53Vg3MzrRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UQGqXnVXE/6wF3pb82GfzovBiLKDNONE4MZwuQ7yLjQ=;
	b=LOYJ4u+hugR6aUhBw89AdaNr1DwyGwHRk7P1IS4PbsLRrUuPfcqvHfVbnkWC1/zONXrD
	 6S/s6L7F3n0zg+920May5DI2Q9P4a1HgwzZjiJ64HD2ZvZ/vTzvZ7hMvMzse8P+nYDvIl
	 4/llqcmcYrLHtbXcgx/WEO9oBE+BUjyZs4OTg5Ij39LDMFeCydxzeccKZNAFuOsXXaSO4
	 q+daVIK+hgmX/lSi70aR0nwC6hig8tmPjrvRRomfPWOdW77yNTserqJjnlLegNKDFFCt0
	 vgZR9GCsaOt7hyTfpvo9qXWZosEADGwG3GNmP8DrQGqVht+e7Ok0hJ1K7eEYEjUt6kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iyRmx8n4;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0A2606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B0A2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iyRmx8n4
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae0a5c1715so12856571fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795115312; x=1795720112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQGqXnVXE/6wF3pb82GfzovBiLKDNONE4MZwuQ7yLjQ=;
        b=iyRmx8n4vpQclEboNZ8lb459ncIbpraoDdR8PjKNSBooXOCREjqKiWqFeCp6Q7Ry/o
         jJa0lR+QwANG/aevovDPW8/mNJx/FqcqNuMq7sdLpyURiLBpNftBNmZpcxMNlKsKTqNe
         fKGz7670ccjwJUDfSFjrYojGpAMXDgzUtkfreZuGsICc7G3lIpt44Jf3TrN4Jd3Qbh7u
         IRTEnvuwMtpnR14jH9PqKvRy78m6vKeF6doIW9EccpSjzHfPvYav7zrL7WD7DEBwqAtA
         nKUQhz4laRB1F3UxJS0TZeEHyphSXLLqyyTCWZQQAE1BprGMK6aS7CZbCJeenNK3mqFi
         HAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115312; x=1795720112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQGqXnVXE/6wF3pb82GfzovBiLKDNONE4MZwuQ7yLjQ=;
        b=FJxYNScQeM/woReQK/5bxZlgqE601mYDLmcFuuS16uVxzSXa9Ne9dP2hrGTlJ6iEXR
         0i1TXdkiacCQregmzcXJHk0miZ6+SE7u2vN2N59Ka6SK4C/wsaBHtKyGwnNOPYCuXyVx
         smowvRQHpuOvd80EmRxMRmhkQwUd0Lg04Ty0zhagmKoK10H214WxMAqEqn9EXgrVAIrt
         yT68Sz+SAkOcMc3mIRTDRAWSwFUWk/Lwrlhey/nXiRf54ZqEYG+PDtf5/eNAIpZ72xgl
         NW58JqeXgqaJuSqUU6bjXUqavWafe5AxeZQY/BH1Yh/LC/wq2rM1iBeFVSS+5K2cxhyP
         v6mA==
X-Forwarded-Encrypted: i=1; AL+hErGd1ZeW/u6/NoqAkqwKLekCAQ/A3Q7XjvW1RDiJOG5GXZy7cQPo5jz9GxI7uP9E/3umN1K7RSONpQw/aGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cXrSvsmHLlXeChPNDcu2g++UZcmsTYlIhTke/8koizIyaTHfY
	grD249QcRljJUVLDhZ1/DRUvsITTEdOHtvNyLDnS0yAcVNqjhF6ac0D1
X-Gm-Gg: AYBFou1MXIfV36Lk0dRtD7kFzH+DudEY/+jCgweZ7eFxBmQ/zAfLIDqRkQqsJ0ZAhwK
	iqffgdHy9RhEn81D4YCU41SF6k00jGHK7p6YLTbt4Fz1TArUBmnszaIux45vls0qfCU0ofscMxW
	G5ORfWfD1zopDSLqnBR3Zf3HvNyS1nfPHtFEAXO+oRthJsspEL0fcLYXhJN7/ZAwXFmX/30NGEC
	+8kQc7366gsmkiapyKVM60OqOk6Xfi2C2WjCNC1Oh6bdU+mhTFHi9e959q2FgPnRLuerPjsVwSL
	OyPYsIhb6SZO2CLYTkkIQg9laTwBipauV7H0gbitnBw8Kzxkmzdf8gPnAbi9le2QhIdLmlOU+Jd
	6tuhUULZr8i5D/qujfl8i2IdqcB1FRQFI8OP1I6puW77o7FFieavwpggPPLHpZ210lzNHNUPm0X
	TlYCtyCIJWFiPe/vKfNl9IRjC8jd3FqOG9/b4vkDnJhKSn6OuV2y9d6zsr5GuzmHgXunDEuvvX3
	Z/bDDiXeF5BHMbPXyPKr45bVnKI3EYjop2/u64V03jDhCfAd5gi6IomDEcsJ8+bnKUUAjiuhUF4
	CtUhNxXcqzth0Zx5+VHYdPkzS5yM6JXekDou58D2K4lrlQ4HULPDPX7f0bypbXlMti0ia2nWUH1
	ztiFqxgW9/kEWtoitd63/yy4VjlUCwFSjuSnSfRHYklIEhnkZz7tnUXLFoGw=
X-Received: by 2002:a05:6512:39c8:b0:5c1:57ce:d4b2 with SMTP id 2adb3069b0e04-5c1b7c78c9bmr718744e87.33.1795115312011;
        Thu, 19 Nov 2026 11:08:32 -0800 (PST)
Received: from yantra.. (nekmmqt5p04tda8ausa-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:491d:95cd:6e94:3a5a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b45sm63965e87.41.2026.11.19.11.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:08:31 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] iio: pressure: dps310: read the first temperature in probe
Date: Thu, 19 Nov 2026 21:08:27 +0200
Message-ID: <20261119190827.36947-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The first temperature read is in dps310_fifo_interval() instead of
probe. That function is called with data->lock held and takes it
again, so enabling the buffer without a trigger deadlocks.

Move the read to probe.

Fixes: 903941a9b06a ("iio: pressure: dps310: don't wait for new temperature in trigger handler")
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
My v2 was on fixes-togreg and its probe hunk does not match testing,
sorry for the trouble.

Based on iio togreg. Same change as the diff in [1], fine to squash
into 903941a9b06a instead.

Tested on a DPS310 on a BeagleBone Black: enabling the buffer without
a trigger works.

[1] https://lore.kernel.org/linux-iio/20261117110735.46400-1-zoone.rupert@gmail.com/

Cc: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

 drivers/iio/pressure/dps310.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 9b52cbc2372a..ebfaa67a6b91 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1058,16 +1058,9 @@ static unsigned int dps310_fifo_interval(struct dps310_data *data,
 {
 	unsigned int drain_interval_ms, fill_ms, want_ms;
 	int scan_rate;
-	int rc;
 
 	fill_ms = MSEC_PER_SEC * DPS310_FIFO_DEPTH / (prs_rate + tmp_rate);
 
-	/* Pressure compensation needs a temperature from the start */
-	scoped_guard(mutex, &data->lock)
-		rc = dps310_read_temp_raw_locked(data);
-	if (rc)
-		return rc;
-
 	/*
 	 * There is no hardware watermark, so take it as the number of scans
 	 * the user will wait for and drain at that rate. Scans come from
@@ -1478,6 +1471,12 @@ static int dps310_probe(struct i2c_client *client)
 	if (rc)
 		return rc;
 
+	/* Pressure compensation needs a temperature from the start */
+	scoped_guard(mutex, &data->lock)
+		rc = dps310_read_temp_raw_locked(data);
+	if (rc)
+		return rc;
+
 	/*
 	 * The device measures continuously in background mode, so a triggered
 	 * capture is just a read of the latest results. The setup ops run the

base-commit: 903941a9b06ae445c70646ab061b604c2dea17d3
-- 
2.43.0

