Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454958;
	b=5CejwomBaCkiHIKAO2JpByOG9UN3ATuEJ2mO95MePwYlhOcX7+3tNFQvB4Jv3utlgKns
	 qZv6pKLeDsXJZmGQryJ866V5ryL5A8ucTBDL4a/xY3zkecRah5n3RNdDG7u/tMxWeO3RA
	 EuYE9JE8bhRx3mH/xKPxOGeZ0co+r3+9HpEMtaMfY+IGrUvv5PFoVljsbEgxhWQOvO4VT
	 L7A+8xQxH5r/u8x3RATttb6Lxh9LZCnz4RfwFl4745tB8ru3GE+Tl1D1hhgL2Z2i3OyB5
	 DiareZ1qwg5Bj0AQesfAAnCOEkOJe924GT27I7+IEf+kmrNo842YyUmDvISaUr9TnVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7LTwfbafZgGIQPY1hJ1oWnepZBxy+zN8S1xyEXfSU2w=;
	b=YsUk/LUk/+GWLAghSg4KycjYBy8mf9ITYNJEIlT6J6+WmtOSOYJ8gjosFMvKszVO1tVO
	 nLWc/tvBhlHmGkRxnizicVoeUf0qGHUOEHGXRbvLxikc3Hzj8n7muKjUxW9lFF9PtxrZN
	 PsbWoV/m4xXPZIQ881wW4xkKGpjuvwk9QjbqNQJY/TBmn2Sjr9uSLvSyo18hfOO8Hsnzn
	 fM5UiuJjCosgmZRDD1g0FKQ4kO2d+MmujFPkHMfe7ZNlwpLin0TREW7gvUO8ifC8umGYq
	 HWlUVetpaDgJxz7/Ih2glYa7KrmDyDGs9hCrq6QJCEqRR1dP+uhKJT40az5VgwaOZBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LWSnHekp;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9BD606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C9BD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LWSnHekp
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso1443284b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795454958; x=1796059758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LTwfbafZgGIQPY1hJ1oWnepZBxy+zN8S1xyEXfSU2w=;
        b=LWSnHekpmFN8i/+LL5R4/kj+6GCY2H2qwNIFckvSuw1Kxh9XgRWL8PMr8GpCIWki7i
         PGL0at7FzPG3fDewTTvdD3u6NeBydZ3bvjlCZAaWMF9fK2vEp6LtSAMy5mS6K+g7u37c
         DF9gNbJNFwt3ChPkbWMPgk707VhzL3cHngToVEOsaPgGyhK7HrxUwlpjRdE5HcbRoE7J
         XwamrQ1pLH3WpTxFVlX9Bi5huz+RrGOWV291PO2MyysWVs9j5cWEbClHJYNc/bmJnZ+G
         FW1+JfQIIy3MBoWYh6yrhIirQYSm0TC6nDYTqzy6Q9I/GfGdd4Qqw2AVoZLervY8ghAR
         +L4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454958; x=1796059758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7LTwfbafZgGIQPY1hJ1oWnepZBxy+zN8S1xyEXfSU2w=;
        b=jKJt+6Bzzo9ytbISxJISdUHOEIxniLWZ9Lr5iZ3HKhFre2NYhfEL4zjj37npt27g7z
         TjKdFuEvtvXs47w8MqQXsSYd93kq2v4iKUtwPbhNv3gQXCKOls7qDj4Njk+rKSHHKRxI
         9sV/rOhphqfnCv3WECJRLwoONkS40gfKF5GyquDj4VWROVtbfTNcp5EpM2HFKpdNOKV1
         riAZ9KwSmabnUj7DjSN3Xh164JFX4TVCEvLnIqLvoF3mmtqV3LEnqd6mYgySHrN6DSdl
         CrJTAnLxc3yfUrrZksCAqnm7SO7c3MYFw5C0rSPW1ZbP4yxyTtrnqBCM8jBUkKEGiOkf
         EmIA==
X-Forwarded-Encrypted: i=1; AL+hErHaYHFs2KjN9yYLljWte/ZYt1U109myn65wLuXRPJVQ2R+HxfKvvZ8jOIuMsExxH1ZW7K4pd94iiZuFJJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J7pkfM6BiVjd9Ze/Vf0YCLxDfKrKfzUGririY9/RBiSbET8is
	7rFeLf3fRaSJXXceSvDvY+b1JjjNt56JaLgwstSLzMr2DurJVpS20wRM
X-Gm-Gg: AZFdTZdgHzvx7OxArp3Xgk/VV82rgWw9rL+L4PQhnay4NtSKQNxvgJFqz4buEwr946W
	wqT1Oz0S+1aH14uW23qd/ySKkuFCwwhPHs5bLudaOrWkGm53XFtjeil4faRgVf7VmD8zaM7yP+w
	hgl0Xb239vqBn6xPbMaTMgSYRPFXLD2uTQqR0Req8VrU2FEEPUPvaiQX3LJDOlhvxRS13MYNiXm
	5773BPzQ13QpNoxNBSBbxOwo+6vSgu9kcLqCz1a8nrZOBLvG569bDMcxpwShbBan13I12/D4mcR
	0qSVEOU32DttBkqom4ESNTdkbqB4CYJAbHXjX+YZNn3/c5VDFIObymU6cMkc627BrV939fvy8K+
	P33VoTzhggfAYbUwyCbpcejTY4nyU0anjHniMiCSeNY8FFJeb5ukGzdyX6057lrnSMwoVaQVlam
	FkbZqjD8/lE/UHDL1d8XTOppxduJxBeywsy3s+YtxX39LLV+/2teFlO5XcXzQaBOEsZLX2k+PaC
	qfqLdwLfFWPHLL5EL0fR6Qba8uTXZnZDlt/swI86EBH1ns/9IyS4hTE2aCTu8SJsxE70SOS8nOO
	eB4nsSXsWzkbX5BfIEWu68PCDTsFY2OU
X-Received: by 2002:a05:6300:614a:b0:3e9:27a0:e9bf with SMTP id adf61e73a8af0-4014cb3952bmr10918154637.23.1795454957588;
        Mon, 23 Nov 2026 09:29:17 -0800 (PST)
Received: from omarchy ([122.186.156.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfebdbasm5552489a12.13.2026.11.23.09.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:29:17 -0800 (PST)
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
Subject: [PATCH v2 2/2] iio: adc: palmas_gpadc: Use guard(mutex) to manage locks
Date: Mon, 23 Nov 2026 22:58:36 +0530
Message-ID: <20261123172836.130440-3-vaibhav.chahar26@gmail.com>
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

Use guard(mutex) instead of manual mutex_lock() and mutex_unlock()
calls to modernize the driver and simplify error handling paths.

In palmas_gpadc_read_raw(), moved palmas_gpadc_read_done() into the exit
paths inside the switch block so the out: label can be removed while
preserving hardware teardown before unlocking. In
palmas_gpadc_write_event_value(), use direct returns instead of jumping
to out_unlock: label.

Signed-off-by: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
---
New patch in v2.

 drivers/iio/adc/palmas_gpadc.c | 46 +++++++++++++---------------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff --git a/drivers/iio/adc/palmas_gpadc.c b/drivers/iio/adc/palmas_gpadc.c
index f777986a6..fc528fc0b 100644
--- a/drivers/iio/adc/palmas_gpadc.c
+++ b/drivers/iio/adc/palmas_gpadc.c
@@ -17,6 +17,7 @@
 #include <linux/pm.h>
 #include <linux/mfd/palmas.h>
 #include <linux/completion.h>
+#include <linux/cleanup.h>
 #include <linux/of.h>
 #include <linux/iio/events.h>
 #include <linux/iio/iio.h>
@@ -548,20 +549,23 @@ static int palmas_gpadc_read_raw(struct iio_dev *indio_dev,
 	if (adc_chan >= PALMAS_ADC_CH_MAX)
 		return -EINVAL;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
 	case IIO_CHAN_INFO_PROCESSED:
 		ret = palmas_gpadc_read_prepare(adc, adc_chan);
-		if (ret < 0)
-			goto out;
+		if (ret < 0) {
+			palmas_gpadc_read_done(adc, adc_chan);
+			return ret;
+		}
 
 		ret = palmas_gpadc_start_conversion(adc, adc_chan);
 		if (ret < 0) {
 			dev_err(adc->dev,
 			"ADC start conversion failed\n");
-			goto out;
+			palmas_gpadc_read_done(adc, adc_chan);
+			return ret;
 		}
 
 		if (mask == IIO_CHAN_INFO_PROCESSED)
@@ -571,19 +575,12 @@ static int palmas_gpadc_read_raw(struct iio_dev *indio_dev,
 		*val = ret;
 
 		ret = IIO_VAL_INT;
-		goto out;
+		palmas_gpadc_read_done(adc, adc_chan);
+		return ret;
 	}
 
-	mutex_unlock(&adc->lock);
-	return ret;
-
-out:
-	palmas_gpadc_read_done(adc, adc_chan);
-	mutex_unlock(&adc->lock);
-
 	return ret;
 }
-
 static int palmas_gpadc_read_event_config(struct iio_dev *indio_dev,
 					  const struct iio_chan_spec *chan,
 					  enum iio_event_type type,
@@ -596,13 +593,11 @@ static int palmas_gpadc_read_event_config(struct iio_dev *indio_dev,
 	if (adc_chan >= PALMAS_ADC_CH_MAX || type != IIO_EV_TYPE_THRESH)
 		return -EINVAL;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 
 	if (palmas_gpadc_get_event(adc, adc_chan, dir))
 		ret = 1;
 
-	mutex_unlock(&adc->lock);
-
 	return ret;
 }
 
@@ -685,15 +680,13 @@ static int palmas_gpadc_write_event_config(struct iio_dev *indio_dev,
 	if (adc_chan >= PALMAS_ADC_CH_MAX || type != IIO_EV_TYPE_THRESH)
 		return -EINVAL;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 
 	if (state)
 		ret = palmas_gpadc_enable_event_config(adc, chan, dir);
 	else
 		ret = palmas_gpadc_disable_event_config(adc, chan, dir);
 
-	mutex_unlock(&adc->lock);
-
 	return ret;
 }
 
@@ -711,7 +704,7 @@ static int palmas_gpadc_read_event_value(struct iio_dev *indio_dev,
 	if (adc_chan >= PALMAS_ADC_CH_MAX || type != IIO_EV_TYPE_THRESH)
 		return -EINVAL;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 
 	switch (info) {
 	case IIO_EV_INFO_VALUE:
@@ -725,8 +718,6 @@ static int palmas_gpadc_read_event_value(struct iio_dev *indio_dev,
 		break;
 	}
 
-	mutex_unlock(&adc->lock);
-
 	return ret;
 }
 
@@ -745,12 +736,13 @@ static int palmas_gpadc_write_event_value(struct iio_dev *indio_dev,
 	if (adc_chan >= PALMAS_ADC_CH_MAX || type != IIO_EV_TYPE_THRESH)
 		return -EINVAL;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
+
 	switch (info) {
 	case IIO_EV_INFO_VALUE:
 		if (val < 0 || val > 0xFFF) {
 			ret = -EINVAL;
-			goto out_unlock;
+			return ret;
 		}
 		if (dir == IIO_EV_DIR_RISING) {
 			old = adc->thresholds[adc_chan].high;
@@ -763,15 +755,11 @@ static int palmas_gpadc_write_event_value(struct iio_dev *indio_dev,
 		break;
 	default:
 		ret = -EINVAL;
-		goto out_unlock;
+		return ret;
 	}
 
 	if (val != old && palmas_gpadc_get_event(adc, adc_chan, dir))
 		ret = palmas_gpadc_reconfigure_event_channels(adc);
-
-out_unlock:
-	mutex_unlock(&adc->lock);
-
 	return ret;
 }
 
-- 
2.56.0

