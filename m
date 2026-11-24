Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513602;
	b=0Q+nfYU/w2DVp2rt3ipPBCojXBj/PUN+e42B4c5KRxT7RO+vXibDWgi2WMtuAFD6fuvv
	 8BIhRF8MkvRqg2IheqBKRXh3IrFHDSJ6o38lCvpIkFHdmQmeZRO1Si6LARomtxvX7ZH8E
	 pmDWtsvQqFpQ8+606aMp86DD2WLEOESFixR7KWvzpRz9oFhSUxNeJCrhDr/3T7HKZOmtZ
	 QY5WbwQOzUn0U4YdjB6PvJh4H2X3TZbHuGc4XcEsZFjuXyQ2BPLAWlyLApy00zmdEcq3l
	 hoUmBGqpfdknshH1vNWXsc/NumVkuDh1C/mUx9h7aM7TOqSJB/ABxugcW/D3O7evjHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bC/+9T2U8Kzer0tWSeR+xsoPj4sAgxGYU2Of5ey/6oA=;
	b=RQ3SlAPbxd5RnKKkt/z2ryBjnxFIRaRjkwdtcAsM57Qqu0pZvhyH6cnUx1rlRehNnCQ8
	 8wIvTzAn0VJcF65aIGLDUukBxAITWB+qks1DA+NCh12XTrwsAX5QuLn1EQ8gMoOIGWJ7h
	 Jc4jvI4I3Hs7BJIkjtKJxw0B/W2CjGfI+T4IX0redgaqkafN5Rq3sR/oXnKA0dOG+KPr0
	 3VGuHtGMSaiwbdXxFchA8Uw8svJuJ4CIbBINMY9z1YWGBRZA9q5KRnpsJXcHBvc6r3sjK
	 Zgj8bm5YaNHJbY2P9O27/IDeGV5LuxHlJAwv7UKBoEzIyuBpB0W+tbAeKBfXn3mweDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qHVlQaGJ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7D8606A69B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC7D8606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qHVlQaGJ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so32905345e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795513598; x=1796118398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bC/+9T2U8Kzer0tWSeR+xsoPj4sAgxGYU2Of5ey/6oA=;
        b=qHVlQaGJfwcvc0wtiqE3FnLP7VpreHf8WPdB5ZLJoIs9T8hcIqcJdrpjXKrixXC8jd
         cUxw5UenDWPVhF3N4eMGqucQQWaqjZy2Pr6wyFpAmnV9PMIDqgDQ6hQjb/0r4g8qZe+O
         0Vq1q8DE8dWWB6LSLu6IRrjB6QuZgzQ2ZYIiMqgIDhN+JPsgRd7V1MebF8UeY4caQcx2
         X5uy8EC18TEfSe4jbJj35sR0uoPK6hzLdx6GBQyFdIlWQ2afLwpcO7hJdVML+IgCl/c1
         YtfOvcA8CK9XIMmHHdTCoUYjjKkaFedhOGL//+zGuDGFu8fwXad9tQ9XBU5/uX4LdSAZ
         ndOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513598; x=1796118398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bC/+9T2U8Kzer0tWSeR+xsoPj4sAgxGYU2Of5ey/6oA=;
        b=WNh0jMQ3CdSSpX+fRaBEPgDmgYAzvEZd2Oo17tK936nj8T0h3WnwYuJpYRMz6qCvII
         KRyL659GfeCj6uSliXhviph/31I4pklsQYU7ZXEAnEUk+v0uCNLJy0QYWS5XDgXqbchp
         hdwMU91eEAc/k6T3kTUo+7nGHEHMBYIBChl/7f2EwN4BTxgt/mFdOE7gXW/Qn0T0NjOx
         0S8AsHLqq02OWMN59fFFSCfKkcZ3Ei4330FpbNIfBeuX9TEnMxRdIuQ7F1ScsqzIsKtb
         70VkXGOnRDXzsbSYbVqkzYSor40KJznZNZlPkhZW/I9LPcyxv9xDCNu9R1t/YS7BYdKY
         a9Rg==
X-Forwarded-Encrypted: i=1; AL+hErG65Eamo3wvGGyyQcyFORxSOi1IWDNsx4tIL+SLvfICy6MvIEdU1jXdjnzvoUA6gZOpVBkUfNblqwIzZ1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z//Mt217WR3rYpSOgT5gpH5FAHfZlTOJk5Dml8ZpspNgjFIfny8
	3oQTDyhOMoqv7F/m+L/CEI1Dpen52vjYZldSVE6bjVf7V4BdrqUeXl3FXHNUzGCzXh8=
X-Gm-Gg: AZFdTZdm4u1Nw2tBlNAyNlu8SrnMU+YqYFToYcN/iv4frxOvNQwB+U2Q1f3fAt3BdK9
	ZQ2iM7sIkTeWH21AcFIbLwOAWPdAhP0yTWxPgUNjwywCIGbJLbnbh1GHZcSRjP3XYzvWVmhzjxh
	RN7u52XBUDRF1TdLWHqBKl6HsGbeKBBXEyUtD/Q4GFYSsIIIw/l9B3LtPBTMpWBI+4mWPkei9D5
	xcZMBN3Ve5+0sW/y4GsI3LibkaEi0WWoOAyj9QM7TGL9o4hC/zHQ3Zs/qNbaUCv6509gpLm8gXA
	dpgA0b5iDvYYDQ5uWB3ItI7p/L0V2V+g5zZuMa5is2Y1dMOw9EqOnjOKHk4i6PFdjDS3gd/TQ2K
	TwwLcjevmC9M0oU3jG4WvAiMIrvME9s3Pif49+VtH/p6BmorlfZy6i6R81+l8RLXi+DzsDwYRFq
	rQ/p1SzptbcT7cWwNdxTJaohkJ6KvhHp6QiPq05ORkPW7gNOv1Hbt5CHE9rkXXbrK9MrqxyT/h1
	RgiEqGmzNXpokF8I32EEoDZeBtemj0U8lNLVpuG+M8Dpo7cydjdhrlv9rmBe6iiNWDaEwp8HiMy
	FZ1Of4MoCkKA7Scvp6zn/skfLPzNI7Khi4tA2Zo0Oq/aPKopMgrIydRIqjel7HATeWET6NdWcys
	HKmj3lomdL4I=
X-Received: by 2002:a05:600c:19d0:b0:4bb:65ed:b55c with SMTP id 5b1f17b1804b1-4bb88824b18mr290530295e9.33.1795513598176;
        Tue, 24 Nov 2026 01:46:38 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm431782555e9.15.2026.11.24.01.46.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 01:46:37 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v5 4/4] iio: magnetometer: mmc5633: Add mount matrix support
Date: Tue, 24 Nov 2026 10:46:32 +0100
Message-ID: <20261124094632.8879-5-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261124094632.8879-1-gerard@teslabs.com>
References: <20261124094632.8879-1-gerard@teslabs.com>
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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 drivers/iio/magnetometer/mmc5633.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index 08bebc8eb5f6..a25d989afb2b 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -95,6 +95,7 @@ struct mmc5633_data {
 	struct regmap *regmap;
 	struct i3c_device *i3cdev;
 	struct mutex mutex; /* protect to finish one whole measurement */
+	struct iio_mount_matrix orientation;
 };
 
 static int mmc5633_samp_freq[][2] = {
@@ -104,6 +105,20 @@ static int mmc5633_samp_freq[][2] = {
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
@@ -112,6 +127,7 @@ static int mmc5633_samp_freq[][2] = {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SAMP_FREQ) | \
 				    BIT(IIO_CHAN_INFO_SCALE), \
+	.ext_info = mmc5633_ext_info, \
 }
 
 static const struct iio_chan_spec mmc5633_channels[] = {
@@ -488,6 +504,10 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
 
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

