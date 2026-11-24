Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552901;
	b=OWuYcq3uheNi6bXwnCneRtb5Ps+T1QgB39YHS1orC6Soe/Lchywx3UwgkcPNqJ57GEfm
	 pZfryVNpl484RDC9ov1x2dWIDtztpS6C2G/3/D+R5HI4Ux7Xr8fGvpsryJtAql9+FCmGR
	 NDzuAaTaReW268K7LxjSV/dwfdQrtn+XTtBM04slODAvY5tT4LwaNRL/JxDHlZTglY7QO
	 CtohwHWQ07/G1ZJmFOQYX8VedXPFUmqwjVbp8aCW1ci4VogDeOpe/1MegHjGSyo5Z8hAi
	 Mp8Ju24FKOPvZoZtodQHO+reQKuHW2R3s2anJk8SPkACslys1emMQqnc9/lZl3oc9AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oTz4yJysuJaLUfy3cRuCYqOwsFm6T170lpx6HPpZBnU=;
	b=BuT4Xtg1onWfGIxsaHfQADyKFXZNxrV3hZ1aaqDJu/HnbYh2OYleMTOB+uz9Lu1tM8U7
	 PJf4mjYogf+UQZtoqs3zT8/wMRwHkhlqV3+sJmZJ/FlshetufSPG4AoLLjeDLAVoY6jUg
	 MOtvxtkCVZmuNuqbIwvIHoACAd8GzKu4JKDosl/tFs/gxnk7qaQpnz/7PS+hoN5eUOlOK
	 2QTosji0krhJ48d9AMkik7Nhyk+MhCMWHSsBIJjde9k1LCD7F86sLUN/s3GSTtPRGcp73
	 JJ4dh1pEgsQ5nrVRkMDQ5Qfl1lMRrbZVzDB76uuXnhfFjT8+Q8Ida9ExUlVfLDv49jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i4cLhX68;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A15F606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A15F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i4cLhX68
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386ab9ab619so5519401eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795552900; x=1796157700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTz4yJysuJaLUfy3cRuCYqOwsFm6T170lpx6HPpZBnU=;
        b=i4cLhX68CzuLKinuriyOO7ZbOLSSSujr3bdCgDUMtg6V5QiIXlA3SPNTMtz+VPIdTg
         WNbGHje8wtDLFXqRvrd6FECM7nzJWqAzekY9Ry23AKUDvibrQmBmyfdI16oyoN9/swxE
         d1E1pSniS9U78veGCuGCDuZfXhBlMQlxri6qoRf/PS3h2x1BxtQFC67b//Atp2JJZKsg
         b6fDH1BQtPvY8SGtUpDVyo5ySukyjC13omSlzS6a9AOWgV2DrD6hHCGbAKZiPwVNEajG
         JNgYFXUKgmVSZNW5op8Tr90WOrGzKE7ZRGhGFTEmDt5uhnp7Rahu9B//x4yxcqaTOKO3
         jQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795552900; x=1796157700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oTz4yJysuJaLUfy3cRuCYqOwsFm6T170lpx6HPpZBnU=;
        b=z25kVUbQ5uc7HfDnCnmd0/isZVy/4u+WN1WHjaAhbrOR0moJXYEolkOLNTws9ZMnmI
         8bJ8Loz4ynfKdZ56Ec7xJrgiydzF9iBU+ZGUzf56WUPoAyqHgNBezEQgLvFRLGVjdZYk
         XCt6IL8gUDjIP0LE1aNy6UcYKtFBcRpLDJSIPux8A8/QI2tU+Zzr1B8r0RidYV2mgSqA
         BEaJ73EyKJRzLImbAGfPDVpJJf1rXrSSF5xf5RFxRmBtTuD8daO3R4MxjSAU+mvZF84S
         DPHgokwS9vf5rK8XLmzCJasbbsdkxAhQUMYt+Rc+VMSRcshR7kuzrv3dIBiswX8eoBgS
         RyPA==
X-Forwarded-Encrypted: i=1; AL+hErEuhofas4MFC4Y2S9CNpusaKcp7C2jP/zBvp17b3HI4ZmCFt6XB/1//C0QevKWXSk7BpXchHkIZ4OoUUGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3WlkRVHgSFXdga3D3x5jLkFZTSzlBeFoiTlOUNz+iPCtL4CSB
	ESaO5CU/jzdLC3eGNSukdnO+dsDZ4M+4oJ5AJW92yjLxk/Rw6NEWI0w7
X-Gm-Gg: AZFdTZdCl54jo2r9LchMdfvnEcJGIqXtUpGZS/iXo1STXOh91/VZbuOubxvRF6EZHV1
	XRAVMyw32NKU15y82dV7CSv8nrt51SC3rcbUYwJWnaBL+J/0+f+AU3TZycffxSzzmX4XkHRn1rT
	Zpdbi2mGlxo6aWkC+cfiJkqYX8gqz/70aBWmQysSkAXeeV9q2W0/CSBhAiRpUOA0NbAf37/LoVn
	M2wFVDBNAeNox991wRdycn/Bn0LDp707bwIYQ3bfFS6C1NRBKGPsT836F/bAHGXg5P3sUvw6vy8
	c9rmAmGZidh4XTKIyok3cfWQwsWJ2A/i6HrtULsQ7tOeJ1+/TvpKf4nn35xs+OY5zZC9EVdk4Kj
	W1ssYbLbEkhuR+m+VAIrYpJ8s+KVvhCOyqoqQnPM0b07U5S2V56wldPDU3XJmc+Xzgka8iJg/N0
	XHsBYiY/G/gOLVUAXmH7SgWKeT+TuYooIjNj2eWUyQVqor92ERtnx0im979pQTGZR2WK9NgyTNY
	2e3Bvjh+a+J2bQ2GWDhwe/DtjWuA8yKkm3LrWjERRKonHtq3RYlmjiN3rfU3P8u0CbxLaES9fVz
	/IqRvb6pz4Qy5p+jNHM64RXStNjt0iUZBKQSL4f7FjEr1PQz/NKteA==
X-Received: by 2002:a05:7022:3f01:b0:160:90a3:ca8c with SMTP id a92af1059eb24-1b55689f73amr16833087c88.7.1795552900499;
        Tue, 24 Nov 2026 12:41:40 -0800 (PST)
Received: from omarchy ([122.186.156.30])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm54214420c88.14.2026.11.24.12.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:41:40 -0800 (PST)
From: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Marius Cristea <marius.cristea@microchip.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] iio: adc: mcp3564: Use guard() to manage locks
Date: Wed, 25 Nov 2026 02:10:53 +0530
Message-ID: <20261124204054.85634-2-vaibhav.chahar26@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124204054.85634-1-vaibhav.chahar26@gmail.com>
References: <20261124204054.85634-1-vaibhav.chahar26@gmail.com>
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

Use guard(mutex) instead of manual mutex_lock() and mutex_unlock()
calls to modernize the driver and improve mutex handling.

Signed-off-by: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
---
 drivers/iio/adc/mcp3564.c | 97 +++++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 45 deletions(-)

diff --git a/drivers/iio/adc/mcp3564.c b/drivers/iio/adc/mcp3564.c
index 259ac4ebd..310161f48 100644
--- a/drivers/iio/adc/mcp3564.c
+++ b/drivers/iio/adc/mcp3564.c
@@ -17,6 +17,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/iopoll.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
@@ -498,18 +499,18 @@ static int mcp3564_set_current_boost_mode(struct iio_dev *indio_dev,
 
 	dev_dbg(&indio_dev->dev, "%s: %d\n", __func__, mode);
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
+
 	ret = mcp3564_update_8bits(adc, MCP3564_CONFIG2_REG, MCP3564_CONFIG2_BOOST_CURRENT_MASK,
 				   FIELD_PREP(MCP3564_CONFIG2_BOOST_CURRENT_MASK, mode));
 
-	if (ret)
+	if (ret) {
 		dev_err(&indio_dev->dev, "Failed to configure CONFIG2 register\n");
-	else
-		adc->current_boost_mode = mode;
+		return ret;
+	}
+	adc->current_boost_mode = mode;
 
-	mutex_unlock(&adc->lock);
-
-	return ret;
+	return 0;
 }
 
 static int mcp3564_get_current_boost_mode(struct iio_dev *indio_dev,
@@ -561,18 +562,18 @@ static ssize_t mcp3564_auto_zeroing_mux_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
+
 	ret = mcp3564_update_8bits(adc, MCP3564_CONFIG2_REG, MCP3564_CONFIG2_AZ_MUX_MASK,
 				   FIELD_PREP(MCP3564_CONFIG2_AZ_MUX_MASK, auto_zero));
 
-	if (ret)
+	if (ret) {
 		dev_err(&indio_dev->dev, "Failed to update CONFIG2 register\n");
-	else
-		adc->auto_zeroing_mux = auto_zero;
+		return ret;
+	}
+	adc->auto_zeroing_mux = auto_zero;
 
-	mutex_unlock(&adc->lock);
-
-	return ret ? ret : len;
+	return len;
 }
 
 static ssize_t mcp3564_auto_zeroing_ref_show(struct device *dev,
@@ -598,18 +599,18 @@ static ssize_t mcp3564_auto_zeroing_ref_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
+
 	ret = mcp3564_update_8bits(adc, MCP3564_CONFIG2_REG, MCP3564_CONFIG2_AZ_REF_MASK,
 				   FIELD_PREP(MCP3564_CONFIG2_AZ_REF_MASK, auto_zero));
 
-	if (ret)
+	if (ret) {
 		dev_err(&indio_dev->dev, "Failed to update CONFIG2 register\n");
-	else
-		adc->auto_zeroing_ref = auto_zero;
+		return ret;
+	}
+	adc->auto_zeroing_ref = auto_zero;
 
-	mutex_unlock(&adc->lock);
-
-	return ret ? ret : len;
+	return len;
 }
 
 static const struct iio_chan_spec mcp3564_channel_template = {
@@ -828,10 +829,9 @@ static int mcp3564_read_raw(struct iio_dev *indio_dev,
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
 		if (channel->output) {
-			mutex_lock(&adc->lock);
+			guard(mutex)(&adc->lock);
 			*val = mcp3564_burnout_avail[adc->burnout_mode][0];
 			*val2 = mcp3564_burnout_avail[adc->burnout_mode][1];
-			mutex_unlock(&adc->lock);
 			return IIO_VAL_INT_PLUS_MICRO;
 		}
 
@@ -839,12 +839,12 @@ static int mcp3564_read_raw(struct iio_dev *indio_dev,
 		if (ret)
 			return -EINVAL;
 		return IIO_VAL_INT;
-	case IIO_CHAN_INFO_SCALE:
-		mutex_lock(&adc->lock);
+	case IIO_CHAN_INFO_SCALE: {
+		guard(mutex)(&adc->lock);
 		*val = adc->scale_tbls[adc->hwgain][0];
 		*val2 = adc->scale_tbls[adc->hwgain][1];
-		mutex_unlock(&adc->lock);
 		return IIO_VAL_INT_PLUS_NANO;
+	}
 	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
 		*val = mcp3564_oversampling_avail[adc->oversampling];
 		return IIO_VAL_INT;
@@ -888,7 +888,7 @@ static int mcp3564_write_raw(struct iio_dev *indio_dev,
 	int ret = 0;
 
 	switch (mask) {
-	case IIO_CHAN_INFO_RAW:
+	case IIO_CHAN_INFO_RAW: {
 		if (!channel->output)
 			return -EINVAL;
 
@@ -903,41 +903,46 @@ static int mcp3564_write_raw(struct iio_dev *indio_dev,
 		if (burnout == adc->burnout_mode)
 			return ret;
 
-		mutex_lock(&adc->lock);
+		guard(mutex)(&adc->lock);
+
 		ret = mcp3564_update_8bits(adc, MCP3564_CONFIG0_REG,
 					   MCP3564_CONFIG0_CS_SEL_MASK,
 					   FIELD_PREP(MCP3564_CONFIG0_CS_SEL_MASK, burnout));
 
-		if (ret)
+		if (ret) {
 			dev_err(&indio_dev->dev, "Failed to configure burnout current\n");
-		else
-			adc->burnout_mode = burnout;
-		mutex_unlock(&adc->lock);
-		return ret;
-	case IIO_CHAN_INFO_CALIBBIAS:
+			return ret;
+		}
+		adc->burnout_mode = burnout;
+
+		return 0;
+	}
+	case IIO_CHAN_INFO_CALIBBIAS: {
 		if (val < mcp3564_calib_bias[0] || val > mcp3564_calib_bias[2])
 			return -EINVAL;
 
-		mutex_lock(&adc->lock);
+		guard(mutex)(&adc->lock);
+
 		ret = mcp3564_write_24bits(adc, MCP3564_OFFSETCAL_REG, val);
 		if (!ret)
 			adc->calib_bias = val;
-		mutex_unlock(&adc->lock);
 		return ret;
-	case IIO_CHAN_INFO_CALIBSCALE:
+	}
+	case IIO_CHAN_INFO_CALIBSCALE: {
 		if (val < mcp3564_calib_scale[0] || val > mcp3564_calib_scale[2])
 			return -EINVAL;
 
 		if (adc->calib_scale == val)
 			return ret;
 
-		mutex_lock(&adc->lock);
+		guard(mutex)(&adc->lock);
+
 		ret = mcp3564_write_24bits(adc, MCP3564_GAINCAL_REG, val);
 		if (!ret)
 			adc->calib_scale = val;
-		mutex_unlock(&adc->lock);
 		return ret;
-	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
+	}
+	case IIO_CHAN_INFO_OVERSAMPLING_RATIO: {
 		if (val < 0)
 			return -EINVAL;
 
@@ -947,16 +952,17 @@ static int mcp3564_write_raw(struct iio_dev *indio_dev,
 		if (adc->oversampling == tmp)
 			return ret;
 
-		mutex_lock(&adc->lock);
+		guard(mutex)(&adc->lock);
+
 		ret = mcp3564_update_8bits(adc, MCP3564_CONFIG1_REG,
 					   MCP3564_CONFIG1_OVERSPL_RATIO_MASK,
 					   FIELD_PREP(MCP3564_CONFIG1_OVERSPL_RATIO_MASK,
 						      adc->oversampling));
 		if (!ret)
 			adc->oversampling = tmp;
-		mutex_unlock(&adc->lock);
 		return ret;
-	case IIO_CHAN_INFO_SCALE:
+	}
+	case IIO_CHAN_INFO_SCALE: {
 		for (hwgain = 0; hwgain < MCP3564_MAX_PGA; hwgain++)
 			if (val == adc->scale_tbls[hwgain][0] &&
 			    val2 == adc->scale_tbls[hwgain][1])
@@ -968,15 +974,16 @@ static int mcp3564_write_raw(struct iio_dev *indio_dev,
 		if (hwgain == adc->hwgain)
 			return ret;
 
-		mutex_lock(&adc->lock);
+		guard(mutex)(&adc->lock);
+
 		ret = mcp3564_update_8bits(adc, MCP3564_CONFIG2_REG,
 					   MCP3564_CONFIG2_HARDWARE_GAIN_MASK,
 					   FIELD_PREP(MCP3564_CONFIG2_HARDWARE_GAIN_MASK, hwgain));
 		if (!ret)
 			adc->hwgain = hwgain;
 
-		mutex_unlock(&adc->lock);
 		return ret;
+	}
 	default:
 		return -EINVAL;
 	}
-- 
2.56.0

