Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693510;
	b=ZYDQ/3iiIKTbE5mKGvlWB2gTCT2s6ecoKlNGCKTruq5JsCUi+/YYiBaObFO7uA/qlCUJ
	 8dfAWH1eYM9h99WQGJ7fbSuvrgHNMQGqzwTMDBfReusfnQlQzBQDzidsPYO5nrzG+1s2T
	 WdJtsKFORK19v6JVpWza2hWuK/wMmUMtzPdiKzTFebWm73qi5RfvM3XNF+LxJ32Pu93Ex
	 HZRvCNm+lgr5Bk/vV+kfkruXjADtElVpy3Wc0b6pizwNKTaKNwxUeeVTu+6RBSfvbkPJs
	 8qbNj4wS4aLGJH5cBo0efcSXi4QpyJIVjm59afozM8GbKmANfLJ6AP4XE11lGbypmVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4pyUXZ88CM2WlQwTXEmpnQUn1K2PGCvOHFGbd3rwe64=;
	b=vFlcx0OTKBG8hS5xS2CNlgWMH2AeDMnAdGaQom8MOST5ID1GsfeRV+50p14l4TYMRo9s
	 /O5/78X1Acne9Z9vs2tsr0/kjvQ0EsI08iFc0diuVJnrYcPa1Wz7HrCsFfdy8NoEHaV5G
	 48vBriE8ZG9G9kvIX8H/wW6G30IEhMihBDUNqKlkwuY/kmO5dfIHHan32E77Dg6z75V6v
	 2QZcNSUMcIUcxRAT7yerdiuqvGnNpXWj6XZVoe5Q/b634Li+/8oRNh9VNAS0E77l5St/h
	 IJEoLoKXnq1tPCKxIgpPaJpWcKPJCRxcbI1eXJgJ6wNiewFd0IEGYjaUE841jkiUXAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DIGPzkW2;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153E3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 153E3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DIGPzkW2
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so3936688a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693509; x=1796298309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pyUXZ88CM2WlQwTXEmpnQUn1K2PGCvOHFGbd3rwe64=;
        b=DIGPzkW2RgccK9gut/XTKCAxEP4RZv/kvOosAwDDIFRyhZBXfFxZTFmiNeZfiL0RV0
         O0XRxPD/rgIAiOWGfoigtvr01ccteEdlmIdwSu/HmL0e1jxSrvyqI2AqYwb4OcfYL8MT
         6bHdYK6ZgWw8PaJ5ZPrUbdgLapC0gutTHw52z1n7tznmDKS7rR/QIvjEHyJd43H5Gb0t
         Y4wYzmTvVAvlVqYvtnBYQ6PUMi+ErlWifcWlv9wTeoHzS/aLRxYrnZVEFQT7FkylXSlC
         ndKfq+CUs5Ni4B/sDGYAL0NILn4wIi1zytyzbLxfoLaa24oeLoy8TQgiVpfmiu9FtA9f
         uMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693509; x=1796298309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pyUXZ88CM2WlQwTXEmpnQUn1K2PGCvOHFGbd3rwe64=;
        b=mCYg/tJG96Tsws1GU5qhCc/6Q7m/+xjHynOc1H3pImwKX9vCh3gEXdokqM2uTSA9wM
         kfAM6Osj6hIC0UCUvWuqreQUb7ONt57T2KTvMmhn8ThG4MHEuBc4Qh+IgwFnDySdlOAA
         acP6FZtJCDSmxTXTBK1+7SYf0lLMVFN3Wq++Ckv+DXEtAjHuln0363TnB1i92ynP59Z/
         aObOYlQQeofKuamNglJcVMVA7HY50TH3n4oE5/x82n8xgEvVjLv4z0jEgK6gn5dsKqkt
         q844Cr+foQOd8ZA+SpqyKIDxFQJaeKmaA73SA3OGA6qihqcWoMlBFckvt/DDvsefBrBt
         NGlA==
X-Forwarded-Encrypted: i=1; AL+hErEczayvl3bY2cdkVyK3Y+Y8Wxfy/+PbCDRdvpmUW7VX3iebm01wb6TMnJWBXFVXHUeXiPzsqf+++peFwtQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h+3WlmVq9RRcfGNhW2nzZKATgkvd9tCG95vA9YP3HcyXijV19
	Hdt/dphamKNvcwyHFC9N/ybomGo6E39PRHlmAzCA3tTrhbgbBb0fGarr
X-Gm-Gg: AZFdTZeIGzjBiU9IkeycusmVLo7dGseUGeVpQzUbpdBVnThryTu7U4OS7CP3YtpKWs5
	OH8PuxnIdXQKvaq+tyNoOiEFZFH3gU4XrwdPknUuF+FlI4+kP2eNK5trT1mF8cbQAMUOLF1QqHE
	wX2+KOGcCbSD7iB4c+2zJNAjWAgqw8toOfI0E15KF+lfUNkfWCpnAD66BCGj9Xd9WhHK2ij6JTD
	s1msGUqRoZthFLGGOstRZGMl7LA/GDkOULYHeSc675GVVKoPSLTVazvpjGsSBt6SxHWtU3Pf1GN
	kFaSZfHwhCBRKqqEfLcvf2wyivzPwx2W0b6H83tGZuUboRPx6DlVLM//YWjqNVOZZD52mr5VD8F
	zil7rp/RG93xIHmnWanuznaAutDqag5VcfC8d5LoPqoJMuHuQceqAeyknx4sBPwJp/z6MCkDMEL
	U3I0FtVAKMsKo6nwV247yX7Y9FmgTbVbtbFDNOzC/tiNgmTDYQdbE0bLbzNb5REu8gcGkICAVDE
	XvhHmFNZ9+GzM3szqOfz+G7JD1k2Cw7eTbRkCMs5uYdUCTexFVvvk8+hlMkOHuQhZMcgkoYgcT4
	C9aqNZyhZhABbQleuXuAyCfauTRy1cEw
X-Received: by 2002:a17:90b:2e4b:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b41c8e0ce5mr13005582a91.10.1795693509391;
        Thu, 26 Nov 2026 03:45:09 -0800 (PST)
Received: from omarchy ([14.139.177.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32962809a91.2.2026.11.26.03.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:45:09 -0800 (PST)
From: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marius Cristea <marius.cristea@microchip.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vaibhav Chahar <vaibhav.chahar26@gmail.com>
Subject: [PATCH v4 2/2] iio: adc: palmas_gpadc: Use guard(mutex) to manage locks
Date: Thu, 26 Nov 2026 17:14:33 +0530
Message-ID: <20261126114433.20674-3-vaibhav.chahar26@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126114433.20674-1-vaibhav.chahar26@gmail.com>
References: <20261126114433.20674-1-vaibhav.chahar26@gmail.com>
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

Made a new palmas_gpadc_read_raw_locked() helper function which
calls palmas_gpadc_read_done() on all exit paths before
returning to palmas_gpadc_read_raw() where the mutex is unlocked,
allowing the removal of unlock goto labels safely.

Signed-off-by: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
---
 drivers/iio/adc/palmas_gpadc.c | 126 ++++++++++++++-------------------
 1 file changed, 53 insertions(+), 73 deletions(-)

diff --git a/drivers/iio/adc/palmas_gpadc.c b/drivers/iio/adc/palmas_gpadc.c
index f777986a6..fa1526e31 100644
--- a/drivers/iio/adc/palmas_gpadc.c
+++ b/drivers/iio/adc/palmas_gpadc.c
@@ -16,6 +16,7 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/mfd/palmas.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/of.h>
 #include <linux/iio/events.h>
@@ -538,50 +539,50 @@ static int palmas_gpadc_get_low_threshold_raw(struct palmas_gpadc *adc,
 						     min_offset_error);
 }
 
+static int palmas_gpadc_read_raw_locked(struct palmas_gpadc *adc, int adc_chan,
+					int *val, long mask)
+{
+	int ret;
+
+	ret = palmas_gpadc_read_prepare(adc, adc_chan);
+	if (ret < 0)
+		goto done;
+
+	ret = palmas_gpadc_start_conversion(adc, adc_chan);
+	if (ret < 0) {
+		dev_err(adc->dev, "ADC start conversion failed\n");
+		goto done;
+	}
+
+	if (mask == IIO_CHAN_INFO_PROCESSED)
+		ret = palmas_gpadc_get_calibrated_code(adc, adc_chan, ret);
+
+	*val = ret;
+	ret = IIO_VAL_INT;
+
+done:
+	palmas_gpadc_read_done(adc, adc_chan);
+	return ret;
+}
+
 static int palmas_gpadc_read_raw(struct iio_dev *indio_dev,
 	struct iio_chan_spec const *chan, int *val, int *val2, long mask)
 {
 	struct  palmas_gpadc *adc = iio_priv(indio_dev);
 	int adc_chan = chan->channel;
-	int ret = 0;
 
 	if (adc_chan >= PALMAS_ADC_CH_MAX)
 		return -EINVAL;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
 	case IIO_CHAN_INFO_PROCESSED:
-		ret = palmas_gpadc_read_prepare(adc, adc_chan);
-		if (ret < 0)
-			goto out;
-
-		ret = palmas_gpadc_start_conversion(adc, adc_chan);
-		if (ret < 0) {
-			dev_err(adc->dev,
-			"ADC start conversion failed\n");
-			goto out;
-		}
-
-		if (mask == IIO_CHAN_INFO_PROCESSED)
-			ret = palmas_gpadc_get_calibrated_code(
-							adc, adc_chan, ret);
-
-		*val = ret;
-
-		ret = IIO_VAL_INT;
-		goto out;
+		return palmas_gpadc_read_raw_locked(adc, adc_chan, val, mask);
 	}
 
-	mutex_unlock(&adc->lock);
-	return ret;
-
-out:
-	palmas_gpadc_read_done(adc, adc_chan);
-	mutex_unlock(&adc->lock);
-
-	return ret;
+	return 0;
 }
 
 static int palmas_gpadc_read_event_config(struct iio_dev *indio_dev,
@@ -591,19 +592,16 @@ static int palmas_gpadc_read_event_config(struct iio_dev *indio_dev,
 {
 	struct palmas_gpadc *adc = iio_priv(indio_dev);
 	int adc_chan = chan->channel;
-	int ret = 0;
 
 	if (adc_chan >= PALMAS_ADC_CH_MAX || type != IIO_EV_TYPE_THRESH)
 		return -EINVAL;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 
 	if (palmas_gpadc_get_event(adc, adc_chan, dir))
-		ret = 1;
+		return 1;
 
-	mutex_unlock(&adc->lock);
-
-	return ret;
+	return 0;
 }
 
 static int palmas_adc_configure_events(struct palmas_gpadc *adc);
@@ -680,21 +678,16 @@ static int palmas_gpadc_write_event_config(struct iio_dev *indio_dev,
 {
 	struct palmas_gpadc *adc = iio_priv(indio_dev);
 	int adc_chan = chan->channel;
-	int ret;
 
 	if (adc_chan >= PALMAS_ADC_CH_MAX || type != IIO_EV_TYPE_THRESH)
 		return -EINVAL;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 
 	if (state)
-		ret = palmas_gpadc_enable_event_config(adc, chan, dir);
-	else
-		ret = palmas_gpadc_disable_event_config(adc, chan, dir);
+		return palmas_gpadc_enable_event_config(adc, chan, dir);
 
-	mutex_unlock(&adc->lock);
-
-	return ret;
+	return palmas_gpadc_disable_event_config(adc, chan, dir);
 }
 
 static int palmas_gpadc_read_event_value(struct iio_dev *indio_dev,
@@ -706,28 +699,21 @@ static int palmas_gpadc_read_event_value(struct iio_dev *indio_dev,
 {
 	struct palmas_gpadc *adc = iio_priv(indio_dev);
 	int adc_chan = chan->channel;
-	int ret;
 
 	if (adc_chan >= PALMAS_ADC_CH_MAX || type != IIO_EV_TYPE_THRESH)
 		return -EINVAL;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 
 	switch (info) {
 	case IIO_EV_INFO_VALUE:
 		*val = (dir == IIO_EV_DIR_RISING) ?
 			adc->thresholds[adc_chan].high :
 			adc->thresholds[adc_chan].low;
-		ret = IIO_VAL_INT;
-		break;
+		return IIO_VAL_INT;
 	default:
-		ret = -EINVAL;
-		break;
+		return -EINVAL;
 	}
-
-	mutex_unlock(&adc->lock);
-
-	return ret;
 }
 
 static int palmas_gpadc_write_event_value(struct iio_dev *indio_dev,
@@ -739,19 +725,18 @@ static int palmas_gpadc_write_event_value(struct iio_dev *indio_dev,
 {
 	struct palmas_gpadc *adc = iio_priv(indio_dev);
 	int adc_chan = chan->channel;
-	int old;
-	int ret;
 
 	if (adc_chan >= PALMAS_ADC_CH_MAX || type != IIO_EV_TYPE_THRESH)
 		return -EINVAL;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
+
 	switch (info) {
-	case IIO_EV_INFO_VALUE:
-		if (val < 0 || val > 0xFFF) {
-			ret = -EINVAL;
-			goto out_unlock;
-		}
+	case IIO_EV_INFO_VALUE: {
+		int old;
+
+		if (val < 0 || val > 0xFFF)
+			return -EINVAL;
 		if (dir == IIO_EV_DIR_RISING) {
 			old = adc->thresholds[adc_chan].high;
 			adc->thresholds[adc_chan].high = val;
@@ -759,20 +744,15 @@ static int palmas_gpadc_write_event_value(struct iio_dev *indio_dev,
 			old = adc->thresholds[adc_chan].low;
 			adc->thresholds[adc_chan].low = val;
 		}
-		ret = 0;
-		break;
+
+		if (val != old && palmas_gpadc_get_event(adc, adc_chan, dir))
+			return palmas_gpadc_reconfigure_event_channels(adc);
+
+		return 0;
+	}
 	default:
-		ret = -EINVAL;
-		goto out_unlock;
+		return -EINVAL;
 	}
-
-	if (val != old && palmas_gpadc_get_event(adc, adc_chan, dir))
-		ret = palmas_gpadc_reconfigure_event_channels(adc);
-
-out_unlock:
-	mutex_unlock(&adc->lock);
-
-	return ret;
 }
 
 static const struct iio_info palmas_gpadc_iio_info = {
-- 
2.56.0

