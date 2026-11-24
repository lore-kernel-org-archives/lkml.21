Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552906;
	b=Quh9m51FWIlKkImliMB2l5jiWIO09Ee+VzNbcYn4vXpulUX5P3MEBTODrbIoB4bdempv
	 mibUJoSUDItmvaK7aztHjTDQTQH7JwneRU4fvo7PNir2KFGqrT34MadASUXAztW+/AQPY
	 2q6K76CkIWoo2xUIqBIJAGelLaWZgZ/DMYFcVzclX/OrcGiSVw0LAZ7q/mSA28OmATzby
	 zcb0Q+kC6La6L39NNMzl3aDQUcebkGdFekV+NWnkq/zdnPi0VI4FiGLyqwEjP/zOs30xT
	 lysfusLpkn4CS2Ev8GqSVmqgOiSigRGdFiU7NydhHK4JcKf+I3vXzhJS1T3JqMTbxPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=osL2M/19coEMUU7Ga197ggH9O1oVOsCvfp/GhIbgW+g=;
	b=XoNCzNuAB38QUIm55X6JbLvDotX30ZDqqo6Y98E3HRtBZXJFXbF6y9bkcR9EnONCX9Mv
	 tGptiySDiuHn8P7Tj9JI6uLHSlux/SOO03zFwhQbM1uhksfpv1TNLdmOmhgpF2k/gAwnc
	 h/HrcMVKe++EqI/QrGmeHl8tO2fM8bGo8nInZQLjT01YRqiBm//rqSKUy24tcagScfKka
	 Wdf6mx8aUJM9YcqPRYXIdoO2Ft3a1oD7LeMUABglyV1vGjRccz8K5ODKIDipLwhB5pJaY
	 bmGexZ92jXT1OBQ04CJvP3AsOkr+TujnfZ+rdjwRboHuro6Q/GTi7NKpKZRco1AFIgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y4I55EeO;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F96606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5F96606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y4I55EeO
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso5428069c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795552904; x=1796157704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=osL2M/19coEMUU7Ga197ggH9O1oVOsCvfp/GhIbgW+g=;
        b=y4I55EeOMZw0jTdWULjY9+XX+QbN5l0/VaCsw/JK9z0sSrIDTeW5rkktvkwE8E4Dwr
         3NGauEwYfsFm2F6zNy3EP1uhV0sCTz6IPTjQynEJztipaclXCTQ4CmsnjYkGm+IZ+wRT
         wHIVY7ynTSUHZAsMZ0uFR0xTENhnYmQEqWECo9BA4gyldUPxDfJ4S4wDzv6RtkxM9pOs
         67IidjdpSmi/XZEu5sNlLpCqNBad0qEdGcI6OSWPhwZJWO9Hx22uoyxS41HuWtmQb/Bq
         YeoQBFMDQGxiKrkHwqPF+N31edRsE0OoGbLIimJYPx61MTOPpQlJY35esa47xASsUhaC
         zR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795552904; x=1796157704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=osL2M/19coEMUU7Ga197ggH9O1oVOsCvfp/GhIbgW+g=;
        b=JNCQVNwZhsM8SGm/gDYD5fZYuqtmlVuUQeKsOO9ldC0H4VpLGGc8xLVwgm7BdlC+qF
         HaTUdwHPsBNa6SvthmA67Oaua8EpTY8DhobGMOnxGrbdjA7NFQK/Bti27OrCbhxueIBU
         XysY/rkBkGUC+iSePN/WpjDItDQjixhiOIsF6Uziu55ufzr2947OeupoJrV+WxRm0SC/
         hRpl6zedy7s8LWB7Fb95IH1HTesuHGWHTVwepUmNNZmUKGlb+KSUJinXfqLCidKPBMg4
         qzvIuwvuGHVE4YvWRjtZhOPR6hSX30rxSu9uerbHxi5Gld/M7UfxV/T0BaHd3SqCR9Ze
         JfFg==
X-Forwarded-Encrypted: i=1; AL+hErFUhjJ1S87kiF/olvkTHkhFZWA61khIcz9coi8emTWMA+/Xy1PBobqY/f4KDoqC7Rc+na8EG3ElunpGn+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z99QdstfsdwspR+EIuodwEDql2jE7IfruaVIs3k4d9qeVDQXB7g
	MSKDLkJUkwObMQVBB4upgvTmUTOqKDlXWKSrvjTfem2Q/sZVP76aLwvU
X-Gm-Gg: AZFdTZcF8UBOuU124n87BNLe7sOOxrwEfHEd5alH1QTc6DRXSpj0DRt9JTU0gtv5/vK
	yw2sQZTGOCrQOgkfEgEiDLPyfOqo06g1Hp6WCaao3gYd45ujnGAdiXVm3oNYzqrLtPiKj/qACap
	WoS1VV7iQBagViunhM8OYMN0PsXIQoWRAe162obZlcuYF1GLkFoOr7E/K2HbIOxXv7F09Eo6lmf
	LKXR+pGTapQLjsmQ8vCPFMV9hYDcYmt6xU8m3nYtWJaSbum9xKlKekZiDD5Z4auF5+RGgoWvMiN
	11r0G5UaziBaFJ+VqeCFGg/b8C2V7Z5eqAM2YaGryGIwiA8eS06/Fd9V6Gc/3svOXfcHdu1TcEQ
	TWai0AduGoL/e2cNhWJagnwQiSArjsfPYGAu6Fu0oO8KbE25taSwD4sjOsEZsyAezt42iodDwmf
	n2RKnEOVLFAhES1BZDGQ9l4Wtm+uh+9PYnlL1jsCNpBJ5oUp7Ei5B4Y1YvAO3CeS05gAgD92pFM
	znfHljrY5ivyJ051lvzTuKs+YS3g/S+lTG3shUUNNKRRR5fahubWHf7c40io1Scw8SstYU8LGF7
	wx7jcjpUEA5tuznBEXui/ZgoihYw+PXF
X-Received: by 2002:a05:7022:e80e:b0:1b5:3b6e:e1ed with SMTP id a92af1059eb24-1b55690bcf3mr18577671c88.32.1795552903922;
        Tue, 24 Nov 2026 12:41:43 -0800 (PST)
Received: from omarchy ([122.186.156.30])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm54214420c88.14.2026.11.24.12.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:41:43 -0800 (PST)
From: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Marius Cristea <marius.cristea@microchip.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] iio: adc: palmas_gpadc: Use guard(mutex) to manage locks
Date: Wed, 25 Nov 2026 02:10:54 +0530
Message-ID: <20261124204054.85634-3-vaibhav.chahar26@gmail.com>
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
calls to modernize the driver and simplify error handling paths.

Made a new helper function palmas_gpadc_read_raw_locked() and called
palmas_gpadc_read_done() after it so it can still run before the mutex
is unlocked, allowing the goto and labels to be removed safely.

Signed-off-by: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
---
 drivers/iio/adc/palmas_gpadc.c | 110 +++++++++++++--------------------
 1 file changed, 44 insertions(+), 66 deletions(-)

diff --git a/drivers/iio/adc/palmas_gpadc.c b/drivers/iio/adc/palmas_gpadc.c
index f777986a6..00541e58a 100644
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
@@ -538,6 +539,29 @@ static int palmas_gpadc_get_low_threshold_raw(struct palmas_gpadc *adc,
 						     min_offset_error);
 }
 
+static int palmas_gpadc_read_raw_locked(struct palmas_gpadc *adc, int adc_chan,
+					int *val, long mask)
+{
+	int ret;
+
+	ret = palmas_gpadc_read_prepare(adc, adc_chan);
+	if (ret < 0)
+		return ret;
+
+	ret = palmas_gpadc_start_conversion(adc, adc_chan);
+	if (ret < 0) {
+		dev_err(adc->dev, "ADC start conversion failed\n");
+		return ret;
+	}
+
+	if (mask == IIO_CHAN_INFO_PROCESSED)
+		ret = palmas_gpadc_get_calibrated_code(adc, adc_chan, ret);
+
+	*val = ret;
+
+	return IIO_VAL_INT;
+}
+
 static int palmas_gpadc_read_raw(struct iio_dev *indio_dev,
 	struct iio_chan_spec const *chan, int *val, int *val2, long mask)
 {
@@ -548,39 +572,16 @@ static int palmas_gpadc_read_raw(struct iio_dev *indio_dev,
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
+		ret = palmas_gpadc_read_raw_locked(adc, adc_chan, val, mask);
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
@@ -740,18 +726,16 @@ static int palmas_gpadc_write_event_value(struct iio_dev *indio_dev,
 	struct palmas_gpadc *adc = iio_priv(indio_dev);
 	int adc_chan = chan->channel;
 	int old;
-	int ret;
 
 	if (adc_chan >= PALMAS_ADC_CH_MAX || type != IIO_EV_TYPE_THRESH)
 		return -EINVAL;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
+
 	switch (info) {
 	case IIO_EV_INFO_VALUE:
-		if (val < 0 || val > 0xFFF) {
-			ret = -EINVAL;
-			goto out_unlock;
-		}
+		if (val < 0 || val > 0xFFF)
+			return -EINVAL;
 		if (dir == IIO_EV_DIR_RISING) {
 			old = adc->thresholds[adc_chan].high;
 			adc->thresholds[adc_chan].high = val;
@@ -759,20 +743,14 @@ static int palmas_gpadc_write_event_value(struct iio_dev *indio_dev,
 			old = adc->thresholds[adc_chan].low;
 			adc->thresholds[adc_chan].low = val;
 		}
-		ret = 0;
 		break;
 	default:
-		ret = -EINVAL;
-		goto out_unlock;
+		return -EINVAL;
 	}
 
 	if (val != old && palmas_gpadc_get_event(adc, adc_chan, dir))
-		ret = palmas_gpadc_reconfigure_event_channels(adc);
-
-out_unlock:
-	mutex_unlock(&adc->lock);
-
-	return ret;
+		return palmas_gpadc_reconfigure_event_channels(adc);
+	return 0;
 }
 
 static const struct iio_info palmas_gpadc_iio_info = {
-- 
2.56.0

