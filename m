Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463391;
	b=lHSvfa5iwEv9K1J2NJH3yaHSIO3NaGUdJzI64te6bSNZeyKNOvkvTtol1+BMz1ceM/dv
	 aA3t/SLEw8ZBSMFwLJ1Gx/7buv4ioemyXstitDRdl/Yw8vgRYf6IDPQps08esxZ84Z61U
	 yZc6K1fzBTIkKww6xPkY4LQM0cgX9OJQVavRoEhQ4Otjjl7urZyXyAfcJ3Dh5Gak+d7xy
	 t8Q9R0AHpK13nOC/fc19ggrd+ZK6FLhnneyOC038nZJiZgIqBKBxNFOds1COH7re/gbCZ
	 FjA5TwNvskcgParLTOddTBpSj6EFy+tfwVBI8l4zvoLzccTRjGMPVLOm1/6Qw5+ul7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FKRBXLDYVdFCJ4/5gtHKzvLnfTFU8JtXH7QpWXH0Wyg=;
	b=NPKJa97wZwTVh503UTLiz1lPND8LkhoZQGbOJ+OWibNFR7bESb+uta7ULUyjPij3sKrN
	 urSl9oo/Rnm089Ox20iybOVa9sGqRbvR0qPfbk9UnJimIEdRFC6xGfFGT8dgdccHKDwbX
	 q9Zrd+/MLSvDd5HMsuIFuJl8Lree5G/nbI6qU3BUMYc25OnQsmXL3W+Ol9d73lPq5X7Y2
	 Sy8gnAAdR4T2BO1+lnamu4FYqO/YNvw6NrPQ7i2yGx1TKE5y7o3SiofePPOG2QJNBEDjf
	 hrJQtgV8NwsAPO4bY/DAzvTgpTjfozHrVhxJvzN3+mEjYIhFU6Pq7uhxprQZMA1ullg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WuKwUk3h;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD740606A6BB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD740606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WuKwUk3h
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so8457795e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795463389; x=1796068189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKRBXLDYVdFCJ4/5gtHKzvLnfTFU8JtXH7QpWXH0Wyg=;
        b=WuKwUk3hvyLU1RhLkirm6JV18FNUaB5chi1cvXL3xcm/x00Xuj7MeXyhGTFp8PSmAz
         UxM63nCjqxRmzAdZXdCUeBiko4UXAPeJXhka/n9S9hkzYXEC5OoJ2cNw1HGbe8POjfXG
         kd91ZZ3CAqLUMOeGuTRbq2Rqgya0K7g3sw4mFp85dVXfv6JasJO26RLWYkcQ2wu5gc/Z
         PtSb1j6j5IS+XaXuciyb4IVZaEHpLtctn3/oQc1+m8N8M90wZE8qGsQYWkEIaXIiEZpI
         IZrHBF/fudW01q85Lbg0hj4jRc2uAwRDxRWx041VZVOYYh+tRGctjhOiV+RrQMBILiUJ
         KL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463389; x=1796068189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKRBXLDYVdFCJ4/5gtHKzvLnfTFU8JtXH7QpWXH0Wyg=;
        b=RcAPGDTmoGjVfeuIHZB+AP/BdDJ4wmDxGYOH3GiVuVnS57109+lwVuFWvCRaZtliUi
         mbSrUTOj179f2CX3j4/HI8/UcZ+cuptODa46YHtD4FW1Nx1LijGMotI5YkH6cGAxg2Ky
         0LMY9Rr0Ky+lT1tRXJLQH9f4l2wcqkKzoiCuaBTHsg6y/sS2giGnNAUqhZ4oZg4BH5Zw
         rXhlZr3nP4r69JtP2xqeovXEFY8q6p1NjbexucLuNP+JhBA2tb08oEb7Pm9U4GtyoHZF
         /enZXa+rFyTk2h/EJRKJsdkX2t1zblwXXg9SaL7Ili+oti9rzxPKikK3ZUB5Hr8ZvWqE
         4JAg==
X-Forwarded-Encrypted: i=1; AL+hErFDk8E94B4fLECdXRRukmpdPLUaMLJSuYMEE3PCU2YauyCFE6zrTSfhI654/GnOYFkdizJzpKJiu+aUi6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A8BMFonzUSCultuxwnoakat7ZmZfcqwLHWIs4h1zetImToUVr
	gFCuokCnUqVJTqbkhepbLJVggBJfNBwcLmYCu0yjOm14rpXWyWsSZpFDCDrTTVk6a3Q=
X-Gm-Gg: AZFdTZe4GEeJKkmvyU0Mg7zkSiY0wuQfKTmlapTXVRoUbVKsM9vZHmg6E6akxdRoUUC
	C9nihfl+T7KAw7XjG5sy8GlSEJ22pfHSO+u94U/f/FcGe6O1MNkcfIJK4iptMYh62F7hs1gTimE
	QyedYJf5p73RRbp7+SBObjaf4v2+N3N7rg40ScrQ9vbuUpKdQkT5Dgm7Eb2bpeiPWMpq5bqIrxz
	8dsYEFCZM93k5SRP4smqXhhIKHJtuSmTlfMQKF65YrEWv0PTpfjoU5keCC8IbTkRruxgmHHgwlP
	AGZcSAd6NRpWDwv/63REl4KErbOjSMl6xFNDBYUZFXl/W+7clr7dS++G5WrVfKzcbbneA0R3tUA
	/QuKbL+UUpPikpaMMLT6NYFkCerjyEU0evVGEINZS1e4Oy2x0uBiemdoKxSQAQxx7F11KlHGUVe
	4onT4fNtahxxO14KE6lH5A5z1TP6Bid0fmzoOfT5WDY+uACwWdaYX+E+fEkcTh0ts75u/j/NwsB
	VVSK7o/CBcduTpo7j1iZlwLTvHEMP9kWIfkkCQpiQgrKOWCV4YuUHfprrVrkMkjlSeCDAd1chs8
	ma3JUQKLpRw2JE3X9dryY2LUx0G4BXILJB5ZsfvCEAGrequZ0phPGSj+InzJeb7GUe9tbfn6c17
	1K3jmPx/sym4=
X-Received: by 2002:a05:600c:5487:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb88813157mr261425675e9.26.1795463389367;
        Mon, 23 Nov 2026 11:49:49 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm300924125e9.2.2026.11.23.11.49.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 11:49:49 -0800 (PST)
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
Subject: [PATCH v3 4/4] iio: magnetometer: mmc5633: Add mount matrix support
Date: Mon, 23 Nov 2026 20:49:43 +0100
Message-ID: <20261123194943.57601-5-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261123194943.57601-1-gerard@teslabs.com>
References: <20261123194943.57601-1-gerard@teslabs.com>
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
index 584ed957e0ac..c92c40665e6d 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -85,6 +85,7 @@ struct mmc5633_data {
 	struct regmap *regmap;
 	struct i3c_device *i3cdev;
 	struct mutex mutex; /* protect to finish one whole measurement */
+	struct iio_mount_matrix orientation;
 };
 
 static int mmc5633_samp_freq[][2] = {
@@ -94,6 +95,20 @@ static int mmc5633_samp_freq[][2] = {
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
@@ -102,6 +117,7 @@ static int mmc5633_samp_freq[][2] = {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SAMP_FREQ) | \
 				    BIT(IIO_CHAN_INFO_SCALE), \
+	.ext_info = mmc5633_ext_info, \
 }
 
 static const struct iio_chan_spec mmc5633_channels[] = {
@@ -482,6 +498,10 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
 
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

