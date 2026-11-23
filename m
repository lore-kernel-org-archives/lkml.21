Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454954;
	b=gngTjOILxdfLjKzWWw1cK/srj3rer0YNbUueQ3BeWwgya1Un14HhVeW/ZfIXg4dtf03F
	 Ori/bQXkeyF2bdrPDLqLk05s+LDggSQ4T4TtMvOH6Q6CyPSuESA8UslmjU+QuC6ggtsco
	 kbwzrz+O25T55CJP7+Sa3noPR6KHGGnDTekhh55eCN0c1iaLqkmSs25xkhk0uBptu/Ail
	 3+GBvhu6ybtIb14vymRKSA0XJJSqFV6finru/5nTmSMNnqMUyMF86yTLGWuj5E+6yCh6S
	 j9T/l1P2w9TcWOjUb3DzosCSBqQrOcV9ZjH0rKgHiEt8CT0rvMVRm6muqX4PhutfdNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zTaK7A55kx+ukUmMEBIL6G70BFxqB0UyNj3T47ltUJw=;
	b=p8fZ1An//p/7sJElJGQpsqo/IDoJ2Z648wEjluqzNb4EPDEbT3ZM+nVSFaCU0FrW7CMV
	 mWSASHKUsoPHpMQdRO2Gk6nUu1s9C6uVSZnTVIoVvkqrsQFTIBv3/7QylSez0UsWmAHhx
	 v+B4x0w34OyQ+E8q6Hr7Z2n1ukzOisNzhCDY/SOH022+PHoFb88SbkXEwl+UpRpE5Hb7Z
	 S5DmETp/KvvRbC4iOSGgCmVk80CWd7Z0PR+osmUGHHk6bctFn3LRYRT9XQ6J1/4g6deWu
	 soG//xNbKMqfs8ISmq95M31gdO/rAdcWRML3Eh35HgkmpMLkgQIXHeX4wK08Gxm/UqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZEtamsy;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1A6606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B1A6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZEtamsy
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cde1479f76fso2159101a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795454954; x=1796059754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTaK7A55kx+ukUmMEBIL6G70BFxqB0UyNj3T47ltUJw=;
        b=WZEtamsyrjUVkOKTH978cBAq1W5QGHQna/rxp8GAgzBrk8Qzf85YsR2YsHvKqjRgV5
         86OyaF2kpR/FFe6EQkIldNjtvt1UXdM2uvModBxhaziI1ZxZxE8/eYz/Dr2LflJUt9yu
         YimBBdnM1akKIG3nk6AUmwfrWKgs3SSAM/VA7qJnRULW0I44TFUCjM8ylN4JBxU18Xpa
         R1G8TeCe0PWmiRqJHBujTYJk333KUjnC43Py2hlgg5Zo7AkBx33iX1rVHaerPjT0Qj3H
         2VJC8PSHtUotRRAC35Pi9y78o72JLw81Cxzv1A5pyXVkmL+e8CBi6c17N/guIjgIM2Qi
         USrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454954; x=1796059754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zTaK7A55kx+ukUmMEBIL6G70BFxqB0UyNj3T47ltUJw=;
        b=Q9YkrCKQHY9Lc2DhOUwuAXThO6XI+b2ZZ35HKi6HcPPbrMYhj66zZSS6KQ1uVtIs4r
         tC7tAGhS5fOX8Iw8nOLZi9VLkpwjqMa12AdXT7tHnyj0PjnL7PdoU25Sg2Ak+Nx0agey
         m4hIrJhgPJDV3IKOxJq9mmIChnNGRjRe56gGcJGXXSU9556GpRgAT5yNyPUNu50/gNCE
         KIr2nQdnjGncCkadS8Zw9l5tw3Ygb7RDP8eZLyqzHu4GsUG8yIA8GT01Qjx+OeRwsPzf
         vGhKB0Mb2URc423vP3vONIHh++3Q3rUAzCDrSM53iSfKasTijTw8U4v+ienIOeaYl0XH
         agsw==
X-Forwarded-Encrypted: i=1; AL+hErGWYu+dgMfpr87g859Niu250Gvl6XXg+hiLgROxyfu1KbFZsPexuL5Q7Q2JBhqdooR+BkeKWX7/zQMpmr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dzIahpS+pGhKDUQDOMhdbSsx2dmK70Tafbi/c7UGieQCZ1aJk
	6KKLzaHXal7hV9g0QJ/x6Sb/X0ZLnpKTa1hnfnHkwVQTe73Yj310O9op
X-Gm-Gg: AZFdTZdSjL7u9OWelowiDQVLKGREKlz/F534Af7pfMPqRbhs2ha9gXB9AEmLGDSjuuQ
	TCcg7+xw/dNJlj+OvV3BO5t+mI5M5HcsH5BZRXSXiU//uKBhf05Z2aeYPTT2nHxDDcpLiPbSAbV
	e/KSB5bL49oIEdLajyg8J1P1AY2wK2U3njtxtlDbRQN8teYSjC2ywELozA3nYnW/TZg8tSz+U7h
	CTVnf3sJcXFj4jM7LN+eCZHbFUZONwsS9ss7JskPYReShJNFIPOELvcKiNoqAwDcKT/TzqEpOI4
	Im1ZH06sMnYrQpp2AUrCOx7jL/HqMy2bHg9cOR2RB9k4UEi+FhNDFpyPgKFojJzo6BZKiQAp/91
	kG4nku/eq24K6su3rR17A31fG+pK0ufyzUefi/GXsuet6r+bGX5GR3PBs/bgjIOLYznwGt/oGaa
	/jdggCc5Hs/fLgcFD5IcQSJ0SN6apqTy36feqzJntBGP4Rrs6SHoXf9yPWC4JvPKeVcw2//64Tt
	Dze18DBP8wcKbvunLp3FCXsUJ1rKN4571dSecSFFt9/eGQoUXvYHyIKzxU+lzVzvH9j0VIny2ip
	+4CXGFfkOd6h26OfCPyVUHKm+TpHaOPA
X-Received: by 2002:a05:6a20:5493:b0:3eb:8529:6347 with SMTP id adf61e73a8af0-40148dca769mr14083557637.7.1795454953582;
        Mon, 23 Nov 2026 09:29:13 -0800 (PST)
Received: from omarchy ([122.186.156.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfebdbasm5552489a12.13.2026.11.23.09.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:29:13 -0800 (PST)
From: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
To: jic23@kernel.org,
	marius.cristea@microchip.com
Cc: crofts@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vaibhav Chahar <vaibhav.chahar26@gmail.com>
Subject: [PATCH v2 1/2] iio: adc: mcp3564: Use guard() and scoped_guard() to manage mutex
Date: Mon, 23 Nov 2026 22:58:35 +0530
Message-ID: <20261123172836.130440-2-vaibhav.chahar26@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123172836.130440-1-vaibhav.chahar26@gmail.com>
References: <20261123070802.14487-1-vaibhav.chahar26@gmail.com>
 <20261123172836.130440-1-vaibhav.chahar26@gmail.com>
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

Use guard(mutex) and scoped_guard() instead of manual mutex_lock() and
mutex_unlock() calls to modernize the driver and improve mutex handling.

Signed-off-by: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
---
Changes in v2:
- Wrap switch cases containing guard() in braces in mcp3564_write_raw().
- Add blank lines around guard() calls.
- Change commit message and drop compile-test notes from commit log.

 drivers/iio/adc/mcp3564.c | 63 ++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/drivers/iio/adc/mcp3564.c b/drivers/iio/adc/mcp3564.c
index 259ac4ebd..04bb4da4b 100644
--- a/drivers/iio/adc/mcp3564.c
+++ b/drivers/iio/adc/mcp3564.c
@@ -17,6 +17,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/iopoll.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
@@ -498,7 +499,8 @@ static int mcp3564_set_current_boost_mode(struct iio_dev *indio_dev,
 
 	dev_dbg(&indio_dev->dev, "%s: %d\n", __func__, mode);
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
+
 	ret = mcp3564_update_8bits(adc, MCP3564_CONFIG2_REG, MCP3564_CONFIG2_BOOST_CURRENT_MASK,
 				   FIELD_PREP(MCP3564_CONFIG2_BOOST_CURRENT_MASK, mode));
 
@@ -507,7 +509,6 @@ static int mcp3564_set_current_boost_mode(struct iio_dev *indio_dev,
 	else
 		adc->current_boost_mode = mode;
 
-	mutex_unlock(&adc->lock);
 
 	return ret;
 }
@@ -561,7 +562,8 @@ static ssize_t mcp3564_auto_zeroing_mux_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
+
 	ret = mcp3564_update_8bits(adc, MCP3564_CONFIG2_REG, MCP3564_CONFIG2_AZ_MUX_MASK,
 				   FIELD_PREP(MCP3564_CONFIG2_AZ_MUX_MASK, auto_zero));
 
@@ -570,7 +572,6 @@ static ssize_t mcp3564_auto_zeroing_mux_store(struct device *dev,
 	else
 		adc->auto_zeroing_mux = auto_zero;
 
-	mutex_unlock(&adc->lock);
 
 	return ret ? ret : len;
 }
@@ -598,7 +599,8 @@ static ssize_t mcp3564_auto_zeroing_ref_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
+
 	ret = mcp3564_update_8bits(adc, MCP3564_CONFIG2_REG, MCP3564_CONFIG2_AZ_REF_MASK,
 				   FIELD_PREP(MCP3564_CONFIG2_AZ_REF_MASK, auto_zero));
 
@@ -607,7 +609,6 @@ static ssize_t mcp3564_auto_zeroing_ref_store(struct device *dev,
 	else
 		adc->auto_zeroing_ref = auto_zero;
 
-	mutex_unlock(&adc->lock);
 
 	return ret ? ret : len;
 }
@@ -828,11 +829,12 @@ static int mcp3564_read_raw(struct iio_dev *indio_dev,
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
 		if (channel->output) {
-			mutex_lock(&adc->lock);
+			guard(mutex)(&adc->lock);
+
 			*val = mcp3564_burnout_avail[adc->burnout_mode][0];
 			*val2 = mcp3564_burnout_avail[adc->burnout_mode][1];
-			mutex_unlock(&adc->lock);
 			return IIO_VAL_INT_PLUS_MICRO;
+
 		}
 
 		ret = mcp3564_read_single_value(indio_dev, channel, val);
@@ -840,10 +842,10 @@ static int mcp3564_read_raw(struct iio_dev *indio_dev,
 			return -EINVAL;
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_SCALE:
-		mutex_lock(&adc->lock);
-		*val = adc->scale_tbls[adc->hwgain][0];
-		*val2 = adc->scale_tbls[adc->hwgain][1];
-		mutex_unlock(&adc->lock);
+			scoped_guard(mutex, &adc->lock) {
+				*val = adc->scale_tbls[adc->hwgain][0];
+				*val2 = adc->scale_tbls[adc->hwgain][1];
+			}
 		return IIO_VAL_INT_PLUS_NANO;
 	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
 		*val = mcp3564_oversampling_avail[adc->oversampling];
@@ -888,7 +890,7 @@ static int mcp3564_write_raw(struct iio_dev *indio_dev,
 	int ret = 0;
 
 	switch (mask) {
-	case IIO_CHAN_INFO_RAW:
+	case IIO_CHAN_INFO_RAW: {
 		if (!channel->output)
 			return -EINVAL;
 
@@ -903,7 +905,8 @@ static int mcp3564_write_raw(struct iio_dev *indio_dev,
 		if (burnout == adc->burnout_mode)
 			return ret;
 
-		mutex_lock(&adc->lock);
+		guard(mutex)(&adc->lock);
+
 		ret = mcp3564_update_8bits(adc, MCP3564_CONFIG0_REG,
 					   MCP3564_CONFIG0_CS_SEL_MASK,
 					   FIELD_PREP(MCP3564_CONFIG0_CS_SEL_MASK, burnout));
@@ -912,32 +915,36 @@ static int mcp3564_write_raw(struct iio_dev *indio_dev,
 			dev_err(&indio_dev->dev, "Failed to configure burnout current\n");
 		else
 			adc->burnout_mode = burnout;
-		mutex_unlock(&adc->lock);
+
 		return ret;
-	case IIO_CHAN_INFO_CALIBBIAS:
+		}
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
+
 		return ret;
-	case IIO_CHAN_INFO_CALIBSCALE:
+		}
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
+		}
+	case IIO_CHAN_INFO_OVERSAMPLING_RATIO: {
 		if (val < 0)
 			return -EINVAL;
 
@@ -947,16 +954,17 @@ static int mcp3564_write_raw(struct iio_dev *indio_dev,
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
+		}
+	case IIO_CHAN_INFO_SCALE: {
 		for (hwgain = 0; hwgain < MCP3564_MAX_PGA; hwgain++)
 			if (val == adc->scale_tbls[hwgain][0] &&
 			    val2 == adc->scale_tbls[hwgain][1])
@@ -968,15 +976,16 @@ static int mcp3564_write_raw(struct iio_dev *indio_dev,
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
+		}
 	default:
 		return -EINVAL;
 	}
-- 
2.56.0

