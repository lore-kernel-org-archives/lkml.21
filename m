Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374523;
	b=wpWw3GeQkIrtwK0o//cfNQOkpHX7XivH8iLjVHbmGKsKVzfiXo4iNCe39utr9h8zUZSz
	 e1kkHOYnIcK+ZXbQlVWPKRCwsmTWS1Xb6YO+Bp2eIobZbxoq/VDy877ELs2RBKbnGBx65
	 j1/0OQ6lj4CBSTLUG3SKH+Y07gbfqt8tvOF5bYHeTPGVFo6AxMg4JKIM3PM9KcnFL6Vtq
	 KajU9P+lYdZ/dgTslJyV3ZX2ymON7HPRcjWEcAyBjY/XmfKoyhx/jmRFJ5v3q2IuMJgQ4
	 3c4gu8IEA0XgDFePntaky5EMNRhgbQYlFZOA9qWwFVEUWBvrzRPjnwZjXWk6S6dacBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAs1mqfrVrH1ol/B1nRUX6eBBIxpRuHBybsWCr2GDvU=;
	b=aGuyRE1RVxe98voEzM38HhsRA739eN5NUmbBRuu7kJzq8zu6ENKS2gH/gv/bxkPj+wwy
	 E9kAsOD1amqxiPOzQcaLvB4XzlFUe5QmmWPtBUBw0v04QJb/ytyO9nBvOd8dlHRa5y1Zw
	 ECG8mdrFGG5oHyh9YqT9oQr3Y2MgIlvkBG75zULR7o4Zlh++JVzv7dHCbXP3VY/PtacyK
	 wVxdeU8jcjGuHQXemZEbEz1SUxFPrqn/PT3dE6oJfv0Xhav2LGj6o1qHfi+mWOxUNQn11
	 pBP+EhBh14oWNC4cuxCrfURMMjRqSFj0beiwe+tecolano1GfHHvKVXI65dJeJWbYTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CK8UnIGY;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03E6606A682
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C03E6606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CK8UnIGY
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so21923285e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795374521; x=1795979321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dAs1mqfrVrH1ol/B1nRUX6eBBIxpRuHBybsWCr2GDvU=;
        b=CK8UnIGY3tyNdi3KsdxWUFgIsuevJezdcxkZ0Tvxgvwb2yGWbic7kemqR3xCy9RriR
         XtDRytV0gxbfFtkO0gju/ZJjOwfQSDSzNwbE2g7oBcO6OD5XDKZY3yENX1kRAqYQp3zA
         IwPRo+10jO3xlCxlC9rJEmKQwVuaa92PQ1YcuJhQgbJ3hEbVn674bfv2Oq/ccAmP7ysu
         KVDQURX/udZ5xXi0EJIg9v9FOWsaYl1Di5oFGsQT3JZxPyVkYIAlhsMQvL7mDeeJQ4a7
         hksPvNghpbg7JVmb/g1u2/amPVy2WQnPV2iGFZmKp/ICzFRez1mEB0M0AqSS8H854Kab
         nQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374521; x=1795979321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dAs1mqfrVrH1ol/B1nRUX6eBBIxpRuHBybsWCr2GDvU=;
        b=Y9Rthf2eSs4//gLxxX/5BMnJUUsqN+KCpDRpii7SS4gk6KjSh8dlfCPBe9sG2NtGNQ
         OqU+xmOBQ21d2WtM+VYM9stL72Ue38fsU/3C0tOWjNHs94rsjB2eHVfcXZACmAXzLbNv
         K2tfLqH6bDcgtkveKvQjG0/wHD06aVnGQN9MZbaPuUBUd9BWXDUsnYquEhnysyyEi+Wd
         2soBRFUc50T/9eXOULSB6bjepne6pujOKQWtscRD30juuWvuuQIq/MtdCU21OvWCH0Sk
         Hd3mggNw+OcMOyb+0b+SgeI2OwTiidbmrhZSTxmOGrp7OuwyoyHoJtKjpLHme3tTm+94
         iP8g==
X-Forwarded-Encrypted: i=1; AL+hErHHgHoGgEuflJJO4JleN2yuNFXzFRENcdUc6ZcIoU4JiPNU+ttU2WNeXcbeqGBPeoXVhNb63EM8pXNeVU0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MtQ8N6H7rYoYwYv1bOl0j9Xxj/3wb1tD4VJvIHg+H0L/qQamu
	2IH9mHQJQUeWfXbzf4mAl1VHqfF20MUYvxiPfFdWYFiipHvkdoArj7XdbC2vs04AMUY=
X-Gm-Gg: AZFdTZfPEx1MdrhZdP4+UKAUMxEJZ2AJdPzQfNCmoZ3aMPkjU4geYGSzFmBisV34DXQ
	wf/ON0iDs9rQ1cKjKCAu1gobRryx8TQTu9OcMugiFRz+FaXRQmzPs78pbYgpKSwyupCiWN+7FI/
	5CsQdwOBDO60i2kwUai5wXUNZUI1UlusZliufRfcaLc11/Hr+lo7b+/Au+uiGmnonAzumfXtMZF
	kG5MHWO57/yot2YRBO0wTp9KmQo56N/7Uj0SQWVRLf99bVYrf8cf5ouXgMF+agdyyRUy1kfs95g
	udM6dug7rc0JRja1JWp+Z4molIeyLGRDwJU9VINCPmjvm3tf1VNcm3vPMIwVultpu8RBtJVhs/+
	484/44MmB2EDcsQCVHtveeCOvwTt/7v0E0DPXpMMzuBbGGH6Fqk+RiiQWcRTuHOBiGZ6JA+m7De
	ogjBEo3PPlLsC5xcgUwYUKfYcJ+sgi3hRYEBqDA1Kb3W2OBUzmrwaZ9BZ+qI3l04t05t7iwc5h7
	lt3ggNxRUkjqbZzmNJR5LR3lpvxPDJtfSGuTSGFYwTTskiJ7Acdgk1CIfuFefdeQmNOnuvmheea
	gDZ+oOCfhGeCdFhOD8dAAGzuYAqnfyWQeIB5LHn6rReyQkWwLdHb25si1fRb4iiDBpj5ZW0BvhI
	0wRtfZWdM3ao=
X-Received: by 2002:a05:600d:600b:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4bb88815f1fmr200246095e9.21.1795374521196;
        Sun, 22 Nov 2026 11:08:41 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm103080395e9.3.2026.11.22.11.08.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 11:08:40 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] iio: magnetometer: mmc5633: Add mount matrix support
Date: Sun, 22 Nov 2026 20:08:36 +0100
Message-ID: <20261122190836.66111-4-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261122190836.66111-1-gerard@teslabs.com>
References: <20261122190836.66111-1-gerard@teslabs.com>
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

Read the mount matrix from the firmware and expose it, so that user
space can account for how the sensor is oriented on the board.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 drivers/iio/magnetometer/mmc5633.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index 79015c7984de..f9ecb3737cf6 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -83,6 +83,7 @@ struct mmc5633_data {
 	struct regmap *regmap;
 	struct i3c_device *i3cdev;
 	struct mutex mutex; /* protect to finish one whole measurement */
+	struct iio_mount_matrix orientation;
 };
 
 static int mmc5633_samp_freq[][2] = {
@@ -92,6 +93,20 @@ static int mmc5633_samp_freq[][2] = {
 	{ 6, 600000 },
 };
 
+static const struct iio_mount_matrix *
+mmc5633_get_mount_matrix(const struct iio_dev *indio_dev,
+			 const struct iio_chan_spec *chan)
+{
+	struct mmc5633_data *data = iio_priv(indio_dev);
+
+	return &data->orientation;
+}
+
+static const struct iio_chan_spec_ext_info mmc5633_ext_info[] = {
+	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, mmc5633_get_mount_matrix),
+	{ }
+};
+
 #define MMC5633_CHANNEL(_axis) { \
 	.type = IIO_MAGN, \
 	.modified = 1, \
@@ -100,6 +115,7 @@ static int mmc5633_samp_freq[][2] = {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SAMP_FREQ) | \
 				    BIT(IIO_CHAN_INFO_SCALE), \
+	.ext_info = mmc5633_ext_info, \
 }
 
 static const struct iio_chan_spec mmc5633_channels[] = {
@@ -480,6 +496,10 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
 
 	fsleep(MMC5633_POWER_ON_US);
 
+	ret = iio_read_mount_matrix(dev, &data->orientation);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read mount matrix\n");
+
 	indio_dev->info = &mmc5633_info;
 	indio_dev->name = name;
 	indio_dev->channels = mmc5633_channels;
-- 
2.45.2

