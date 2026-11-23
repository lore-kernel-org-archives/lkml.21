Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465585;
	b=XNE/8GCpeosF3RRKps7WeMIAIzMeNp4QWiSXpul1hRl8UMqCdDrRIoFLe5jTnxpmED6Q
	 /xxtlBa1S7qSqxx2j5Vjc7T8oTJ4dEhF0kn7LkNITiSxUucQBUAiz/RzrNm24gRu2ur0/
	 UQ7uMsLlyvjiitDbK58JYj2E8q7yXCxgk5wWH8uqJ7P2kSp6RMlX24X2ZEb62h4jDBvF3
	 8aRTsxRK3G5S2Xc+gsxXM19HCcaCIUZg+7wUx+MpU58UZFb4HKuJM4lap4f9NOzbMzoT1
	 yfAK707PKK1hIdFkm2BOKCBzdrvHKbXKJ2vdB+AyAs4P1/tsMNZ96Nvg6FGiGVPazJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NQ48N7WWkZ+c+s4V0T47yLDwNjedp7a0tZsuMHqD3Go=;
	b=1VSxcqX8nB7oOdfF4OKHCkQY08bypyY4eZR+/Ui1CW/PX+7JKoDkmKQXUFcLfPuz9173
	 KFSf+To2gdXOHz5640jjkhyoq4bt2A/B86HEHLAZqoxg9WR7oga7MzgSM/3xSU8aedtWD
	 TS83pMaloGE7C1scXHFQmEAf+U23rolp0buyf+yKR+XyRal28SNsb3WPhLWWUnIQYtGhM
	 PhZv4mq4aXphPlsQQd2U4ahEuoive5aqoGUuCZKU8gSSCCSsJXScGyZodes2eHMDG8LEc
	 VsS5qDCo74bqORS6U+ttAW2jaRxgy5PdSo5HCYMpzV0u34KosuHoqtaKv569idUqWTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=j9nSIYwX;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503A7606A689
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 503A7606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=j9nSIYwX
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1769900f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795465584; x=1796070384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQ48N7WWkZ+c+s4V0T47yLDwNjedp7a0tZsuMHqD3Go=;
        b=j9nSIYwX9ihcFMpmtUR6hNHIo1cHJ+LzzBhJnKdh9hkVA5oFY8tlzk4B/vc3G2Yerv
         KSRQPxgPsRMPTHbYh5GO9VFH5+0CBFOHVSUNNNanJVhYBP96/JWeB2Y2o2gxpIgNeJic
         RR0DQOcaY2imOtd39OuMfZOivZNm79jP+pOQKUU2hI/QEtlgfn3hhPcuxiIKlGJWQuGu
         ZHXx+SpBkHrRm0xHzx9ZG0I9ima2b0hPzKu0FEigvCFTa2uGGDu9qF9J4TIvghjNw9SN
         xvAFvd3VaEAMWl53kjYY9jh4VNtdt7u3Lx0q0OGAZPqhUI2QLd06TJoeKip/5Jol1eNY
         zzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465584; x=1796070384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NQ48N7WWkZ+c+s4V0T47yLDwNjedp7a0tZsuMHqD3Go=;
        b=P/i6ak86+X35uc+aVCliJH1s4KwkNhT4dfGLT3HxS2KYo69/EffBcukGeE230BtXm9
         MX+rdVGRItmPHQmzbmWFAND5FX2PGyIPiI4VzGyF8+grjUYtFCHXyapQW49Bl4PuNVZj
         4TCu2Jhewd2SPlw8wjpyarFMZ03mSnJEcKrA8Pk1m8/hDFnyxVrmaTXmFrQz7HFv83P6
         qZDnVhhg2c/0sKHn0mQtpfrntBuNTrO6mIzdOZMfp9lNMNTMP4lB1ckTcMzMvA91B3pQ
         hUWQfdKYIFIza0dRkYe/mOCXU2VjHXG+oZyK5uqf5pixVO7a9HVvnBwAE7SxVmLCSDFm
         pXjA==
X-Forwarded-Encrypted: i=1; AL+hErHBqKgJA3RLtPb7QL9GwBN0ndOrdRL/Q/lw2M2qEyl9jBcv0s1crHEJe1CMwHAbiiT5IU9hPuvxWyYD9Ng=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iClkfaHEJ/pLoOe2xjHrkG4EsIGQKrSlBBXB4reywvrGa5gPY
	oHLc8+IEYoa9Zy5h7Hhr8MzpIPTBvvsD6iDySn7gqqUcZWl8hZR2DdvKW4RMuRAuo7I=
X-Gm-Gg: AZFdTZcdHXTVVnNAej4oCa68xYh9ow0tRdAbKreFQvznq64dkysxqiZ0sKAyotv3rEZ
	CTTdEORVMV7k1KNRhxrBXQP4p/Hz5u3pdLwFiWhDESlNPnUMVdYYZnPCztpL4L/EjlIcR7rj43n
	TuKOyWT4GvBPMapSsayfUonGDeNHA75VEBuVg48zUG2LbYNGl7SsSa75zW4eB/pyrspEmk7oVsk
	h4u4jsSeu8YNJBLIntFcX0Ywtjk64P8gtJA5BTdLw6/3+AEEEYKY0L4BZWyXNHc4M6CDckMx8fP
	1uekzDvxM7GYmpeUHBgsmFYSPYQzYC8hLS0M7kHbUGk6+1MI2nndS3nEtOAucY3fZRfS8c/wirj
	Fy116EZ/B6c7sntw7nNQiePsfThvccEdOMKkYw1tx1PbAseTvCcFW59e1YvQAU2oeAECsdAS3LS
	S9Pnt5jBBoTBfRTj2rAhKruC/c6niANv74fh7oI9NmzI8IlfY1N3zxPkFk3yApIFpoqGqNqlQst
	nI916aodCNTLiFpfgX3tpw9v2u2bhNMHQ1L9/A4O728qQDVg+LzVNwhHTCmfJr2aMARuPEbcRsU
	XuRGQQpX4vxMGH388vZNfeoXoygL2e612WDSsgnORR+qMNiubf7KQhwmTHXuzwB+PX6EPRAcS8m
	4GlBBuHcxTnA=
X-Received: by 2002:a05:6000:46cb:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-4abb3956786mr18544591f8f.43.1795465583237;
        Mon, 23 Nov 2026 12:26:23 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm20108713f8f.46.2026.11.23.12.26.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 12:26:22 -0800 (PST)
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
Subject: [PATCH v4 4/4] iio: magnetometer: mmc5633: Add mount matrix support
Date: Mon, 23 Nov 2026 21:26:15 +0100
Message-ID: <20261123202616.17334-5-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261123202616.17334-1-gerard@teslabs.com>
References: <20261123202616.17334-1-gerard@teslabs.com>
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
index 316b431477dd..adc08cb28600 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -92,6 +92,7 @@ struct mmc5633_data {
 	struct regmap *regmap;
 	struct i3c_device *i3cdev;
 	struct mutex mutex; /* protect to finish one whole measurement */
+	struct iio_mount_matrix orientation;
 };
 
 static int mmc5633_samp_freq[][2] = {
@@ -101,6 +102,20 @@ static int mmc5633_samp_freq[][2] = {
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
@@ -109,6 +124,7 @@ static int mmc5633_samp_freq[][2] = {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SAMP_FREQ) | \
 				    BIT(IIO_CHAN_INFO_SCALE), \
+	.ext_info = mmc5633_ext_info, \
 }
 
 static const struct iio_chan_spec mmc5633_channels[] = {
@@ -485,6 +501,10 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
 
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

