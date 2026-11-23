Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417766;
	b=k/UBMiDh9Y8KQhwugEF0SEp5jeMiWlyY3LpyhK6E4aKRhRJaB7m6fGjYrYSDSIW8iDPe
	 tnTcVT3iBFkna4Uy2rGAZfy7QuELOXw+ROyjr5RQ1R/YvvsnL62mVL7hUwTS5sG8541+c
	 US+lCtMaGKDgAMGq5Q/1UpvsUh/foDruAkLoP6fdxwxBC6LDmbD+Y2XGeJa2r0/TFYfJ8
	 isikraRONidHEQOuvhieLq4aLEdQqmMi5NbdKz99c69efYObLPj1rAaTSV3RXkY49epw0
	 KqzXU136Mb3DsOeeM3spS/m1dQ0mCqrl9VxF2vx7ikABPtfTzG/Iq2FGt1OOPiyuHTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8MAzL+L3Rrw/YnY+ybY9g7R6arsB3n6cfIMTszHVd5s=;
	b=Pt0Nsc3JA2w6B58TaopaidpV24Jga+7heReBwZ0VxLr3HvZnvtOKTuyYMAEVAGyAwKPE
	 7raK1nPFzk+7EbOFAqgMxAAAbynke4Sjyq8qUxpgRMDQ9N95dRPMxqjWf0kRIomK7HHxK
	 0e5yYZsASTFyJv6bxqGvTH7U3FI//Ldy84ouIEckQID96Oi9MuJzdXr+wp+/RzJozK53o
	 LIWJRw+L+gKpjzXj4O7dUOk7p2zO2PNDjAu2lKE5w61vYILAwdtkIwwsv5G6JDHE2WKrh
	 +rrqu1k0wr6TiENc+ZZ52JRMNr5wQcjSRCN70HWS5i4s4RQO6qwJYX0dB1rUsX9ydHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzWwWfRt;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4F3606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F4F3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzWwWfRt
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-380c28f9e35so4031570eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417765; x=1796022565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MAzL+L3Rrw/YnY+ybY9g7R6arsB3n6cfIMTszHVd5s=;
        b=dzWwWfRtCJCV6K2tsWlErxLqWoyDYqItarkhqjExd2Uojc7eaKjkRnh7w/LDXSR0Ts
         QxoBK681yTDYfMzYqkvGRBNEiu+ejh6zsPTaeVWiwSOt4qa73WTzHheXUqdzbPiRujzY
         +YKO+OwrV4cH5DBfGA8BqVYVqTEzZzig2solna+GsW1jrKkdiZ6evcgRLqYEsF2f27Ek
         WeRWvQtzj1djMX390IoUE6xCwyGBdRRNKCLaHFq8CCMR+sPrXq5ReDVaaxmEPEH7/3oK
         2LfhxU8VrRbjlonae4/Oc89XvLu2o7RDACS2bgV02BB1SfFUgnfJQi9Rd/CpFjbIXY79
         Saaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417765; x=1796022565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MAzL+L3Rrw/YnY+ybY9g7R6arsB3n6cfIMTszHVd5s=;
        b=I/N+pdV4TDPMdpBmnDhz+XhES7v3ne4wbMLQPNvD2VbLMrIsyapSsP1vr5DhSBHZbL
         lx6f6BAp4zHVFWg0Akg/H+6wxFuqIzE31plZpJe+DFaqwZj/eerNxdQVd6b+HAkhwvNA
         Ck4EyOoHJppqBDKWqGPuzEDrZQXDJ4zD7Dph1IcJFkCXKyMz7xPSTMV097NYB2yjRpGs
         7x+nHalyL4P8g3mBUpjHnP/3ZJOp5FULHMqPD8EziIgM5gHqYfJRxeTfEscnDhASKZ/V
         hg+6NFQeIHtC7u50PhbmaWVAL5kfaUDI0SIN3h2ZBJKaF/5yw6bRzF2t/fRFAfSwDpdT
         B/JQ==
X-Forwarded-Encrypted: i=1; AL+hErHwrHgLlUgJ6Yl59LeT9sahMedTR6ON8CZi2UW8hqTf4B5kvWJhfQp/SYvQ3spibdY0jMVp4N9JZOIoLcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ofnRPl6jysrvSFeYtMGBpCIJ3wxR70e9zfYsCFJWJG0QuKiFe
	rN7mooCKL/2wAT2SgBtxrV47kRLUSETh91s7FFMtV1vpTOBEyCwgAXIAN6jDehITEbA=
X-Gm-Gg: AZFdTZc6HMlhTrnCfqY097zQTxSvJy4KOMpHGp/ssILy5SgVTQtAg5C6Bf58T1Q3mcl
	acqcu48/WT5qBAS1rEoq+KUlIGHA5/CuCdHd9RmU6BAbIQXalxk2Wmb+mIC9bAADXFZsMAQWKcd
	2pts6IsKXnNu2i2otEo6Lzpo8EB9dnMdtoY10GExW02jgqvmpWNNwoRdgbmwmY1owovroGr6Djk
	fM2Dt4eNE+XlbTFWSrwCPWJHIocvekTytJj0Swv1pJCayiLsOqiTOGaImXF5v2iVaTO/mvaNtBs
	WvQEsWSh6N/LFPUAXBrI9BwhV/ltBerpcnURlHYTceRRo88jeYaT1D0MjoP7pl7/CX/qB3Lv8SF
	0Ej0iFnnPhEhcFsaJ8X0xjc82rX3Xz57BjpJMiMv62PTRQg48nsrdaR0JWxjwxSdIQ1s0Kdrgnt
	4IIRxwAbIfvk3D1hwZYtwQZsWazHRxo2A8Y9ac1wKdZQosAXoq8h138mSzFqsOb/BtUeTPbX586
	OSU9daF2mrR2YgSqb4lZc6fLeCrgIm+owgPFsJcQ81p13tZtBd76V8i22WjeobG91OodqDhgM9X
	KtdHFuWb36LACWFnyVu9J35AeMIfolnt
X-Received: by 2002:a05:7300:51d4:b0:384:fef7:5876 with SMTP id 5a478bee46e88-384fef75c78mr13119936eec.24.1795417765170;
        Sun, 22 Nov 2026 23:09:25 -0800 (PST)
Received: from omarchy ([14.139.177.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm5293460eec.27.2026.11.22.23.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:09:24 -0800 (PST)
From: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
To: marius.cristea@microchip.com,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vaibhav Chahar <vaibhav.chahar26@gmail.com>
Subject: [PATCH] iio: adc: mcp3564: Use guard() and scoped_guard() to manage mutex
Date: Mon, 23 Nov 2026 12:38:02 +0530
Message-ID: <20261123070802.14487-1-vaibhav.chahar26@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Adopting cleanup.h helper: Replaced mutex_lock() and mutex_unlock() calls with guard() and scoped_guard(). Ensures locks are automatically released, simplifying the code.

scoped_guard(){} was handled in mcp3564_read_raw switch statement (case: IIO_CHAN_INFO_SCALE)- giving it proper
scope.

No goto statements were present inside older mutex blocks - so it was a
1 to 1 substitution.

Tested:
- compiled with `make W=1` with zero warnings.
- Verified using Sparse (`make C=1`)
- Verified styling via 'scripts/checkpatch.pl --strict' (0 errors, 0 warnings)

Signed-off-by: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
---
Q: If i have similar cleanups for other drivers/files in this directory. 
 Should I combine them into a single patch or submit a patch series?

 drivers/iio/adc/mcp3564.c | 38 ++++++++++++++++----------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/iio/adc/mcp3564.c b/drivers/iio/adc/mcp3564.c
index 259ac4ebd..252c3886e 100644
--- a/drivers/iio/adc/mcp3564.c
+++ b/drivers/iio/adc/mcp3564.c
@@ -17,6 +17,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/iopoll.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
@@ -498,7 +499,7 @@ static int mcp3564_set_current_boost_mode(struct iio_dev *indio_dev,
 
 	dev_dbg(&indio_dev->dev, "%s: %d\n", __func__, mode);
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 	ret = mcp3564_update_8bits(adc, MCP3564_CONFIG2_REG, MCP3564_CONFIG2_BOOST_CURRENT_MASK,
 				   FIELD_PREP(MCP3564_CONFIG2_BOOST_CURRENT_MASK, mode));
 
@@ -507,7 +508,6 @@ static int mcp3564_set_current_boost_mode(struct iio_dev *indio_dev,
 	else
 		adc->current_boost_mode = mode;
 
-	mutex_unlock(&adc->lock);
 
 	return ret;
 }
@@ -561,7 +561,7 @@ static ssize_t mcp3564_auto_zeroing_mux_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 	ret = mcp3564_update_8bits(adc, MCP3564_CONFIG2_REG, MCP3564_CONFIG2_AZ_MUX_MASK,
 				   FIELD_PREP(MCP3564_CONFIG2_AZ_MUX_MASK, auto_zero));
 
@@ -570,7 +570,6 @@ static ssize_t mcp3564_auto_zeroing_mux_store(struct device *dev,
 	else
 		adc->auto_zeroing_mux = auto_zero;
 
-	mutex_unlock(&adc->lock);
 
 	return ret ? ret : len;
 }
@@ -598,7 +597,7 @@ static ssize_t mcp3564_auto_zeroing_ref_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 	ret = mcp3564_update_8bits(adc, MCP3564_CONFIG2_REG, MCP3564_CONFIG2_AZ_REF_MASK,
 				   FIELD_PREP(MCP3564_CONFIG2_AZ_REF_MASK, auto_zero));
 
@@ -607,7 +606,6 @@ static ssize_t mcp3564_auto_zeroing_ref_store(struct device *dev,
 	else
 		adc->auto_zeroing_ref = auto_zero;
 
-	mutex_unlock(&adc->lock);
 
 	return ret ? ret : len;
 }
@@ -828,10 +826,9 @@ static int mcp3564_read_raw(struct iio_dev *indio_dev,
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
 
@@ -840,10 +837,10 @@ static int mcp3564_read_raw(struct iio_dev *indio_dev,
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
@@ -903,7 +900,7 @@ static int mcp3564_write_raw(struct iio_dev *indio_dev,
 		if (burnout == adc->burnout_mode)
 			return ret;
 
-		mutex_lock(&adc->lock);
+		guard(mutex)(&adc->lock);
 		ret = mcp3564_update_8bits(adc, MCP3564_CONFIG0_REG,
 					   MCP3564_CONFIG0_CS_SEL_MASK,
 					   FIELD_PREP(MCP3564_CONFIG0_CS_SEL_MASK, burnout));
@@ -912,17 +909,17 @@ static int mcp3564_write_raw(struct iio_dev *indio_dev,
 			dev_err(&indio_dev->dev, "Failed to configure burnout current\n");
 		else
 			adc->burnout_mode = burnout;
-		mutex_unlock(&adc->lock);
+
 		return ret;
 	case IIO_CHAN_INFO_CALIBBIAS:
 		if (val < mcp3564_calib_bias[0] || val > mcp3564_calib_bias[2])
 			return -EINVAL;
 
-		mutex_lock(&adc->lock);
+		guard(mutex)(&adc->lock);
 		ret = mcp3564_write_24bits(adc, MCP3564_OFFSETCAL_REG, val);
 		if (!ret)
 			adc->calib_bias = val;
-		mutex_unlock(&adc->lock);
+
 		return ret;
 	case IIO_CHAN_INFO_CALIBSCALE:
 		if (val < mcp3564_calib_scale[0] || val > mcp3564_calib_scale[2])
@@ -931,11 +928,10 @@ static int mcp3564_write_raw(struct iio_dev *indio_dev,
 		if (adc->calib_scale == val)
 			return ret;
 
-		mutex_lock(&adc->lock);
+		guard(mutex)(&adc->lock);
 		ret = mcp3564_write_24bits(adc, MCP3564_GAINCAL_REG, val);
 		if (!ret)
 			adc->calib_scale = val;
-		mutex_unlock(&adc->lock);
 		return ret;
 	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
 		if (val < 0)
@@ -947,14 +943,13 @@ static int mcp3564_write_raw(struct iio_dev *indio_dev,
 		if (adc->oversampling == tmp)
 			return ret;
 
-		mutex_lock(&adc->lock);
+		guard(mutex)(&adc->lock);
 		ret = mcp3564_update_8bits(adc, MCP3564_CONFIG1_REG,
 					   MCP3564_CONFIG1_OVERSPL_RATIO_MASK,
 					   FIELD_PREP(MCP3564_CONFIG1_OVERSPL_RATIO_MASK,
 						      adc->oversampling));
 		if (!ret)
 			adc->oversampling = tmp;
-		mutex_unlock(&adc->lock);
 		return ret;
 	case IIO_CHAN_INFO_SCALE:
 		for (hwgain = 0; hwgain < MCP3564_MAX_PGA; hwgain++)
@@ -968,14 +963,13 @@ static int mcp3564_write_raw(struct iio_dev *indio_dev,
 		if (hwgain == adc->hwgain)
 			return ret;
 
-		mutex_lock(&adc->lock);
+		guard(mutex)(&adc->lock);
 		ret = mcp3564_update_8bits(adc, MCP3564_CONFIG2_REG,
 					   MCP3564_CONFIG2_HARDWARE_GAIN_MASK,
 					   FIELD_PREP(MCP3564_CONFIG2_HARDWARE_GAIN_MASK, hwgain));
 		if (!ret)
 			adc->hwgain = hwgain;
 
-		mutex_unlock(&adc->lock);
 		return ret;
 	default:
 		return -EINVAL;
-- 
2.56.0

