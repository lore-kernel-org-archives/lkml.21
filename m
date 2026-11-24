Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503026;
	b=McCoM308f1vlJdfGwPlUMKvHt12HuXvG0fYD/ycJO/86WOhoJmGT7Mrb0fMjVtrtYqhu
	 FsQLlk8z/cRmOukr9v8u6GwbhTXZdmB02IjpgC0kuQQuG/s3NqPapVtGANPLI2M/u5Vc/
	 ZJQben7ZYjzA6ViUMXxAcAlTqmpmL7eTyd3aChx+CJUxJQhuHUjW1distv8ZGrwUPbbur
	 AIxIMvG5yExMtXAFd/TgsF28hAPkm+lwOVjG+GElKQMha7ji+OrId3Jfz6ddH2JtDgcDo
	 GnIcr8TJxDzjI605B7QaYiw929rOYu/dTRbVw6qTNcKaw3eDuJWmdB1ZtCuA0ulzs9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DVeHLifVT1xO67SonoAkU2+l387BllNSZWUCd22A29g=;
	b=Hr/PAarXVRdRv1YiRJlnO1c12evBX9TQBlPf35EHyRXzNGMAmmYWAETSUIIK8AgpBbNV
	 HIvx5UysVp9ZAU0cQaZXcxFgwwLwti9/n7XpwnCroPGqNlrKUBBSsMPVCxOO7anS/i2vZ
	 wxMWdxjL8YcW2E9vyfiejmk8E1KwKJ26tPDfnOsjF+esYY1gAViCN5Tl9Fd9RtsVYIOqD
	 4C/JyYpw9fh4P25BlKAoQKE3eIPErHOVtTd8OMFwG0HsymIAcZGvBfaiJpNE5KgcYPO9r
	 ApRwqZUCj4MkcmjUgyWfa7ygzRDrnj4Sr7riUR4p4OkruHPjddLfgI6ymzotK2QGAeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lnr3a9D5;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8641D606A6B1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8641D606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lnr3a9D5
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c1c0c8d61aso2625299e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503025; x=1796107825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVeHLifVT1xO67SonoAkU2+l387BllNSZWUCd22A29g=;
        b=Lnr3a9D5CojzMvN8BjEuOrqdp/HPrzXZrBKO9VPlyVLg5TW+SIPbc0U9x2gLP1VOH1
         jwbWZeXSum6NRfAzFH06uGmTth0Z4i5BmgBwAEC+UPeAwKPYZKov76qV0S0ba8VXXExY
         9wURHdptR4o+qAVyqViHR6iy7Re8MdyTfOb8qe3+doAphAWaY/fqOPoMHGBPih5gwABA
         GdGMRG70XpQS3fwILAVHDHgGC0DXVoZTD6ToXE5oLfQMXcW9qN54bd4wh+08UG8eZeL9
         ejbWwahPpLT8ra0fm6hgKsB9edH+4UOIxFygscT4XQCvB1nVduUvvJBM8LNZ3pphJukg
         OTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503025; x=1796107825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DVeHLifVT1xO67SonoAkU2+l387BllNSZWUCd22A29g=;
        b=h1wVIr1TSI/n/7t/Eepnu64mg4CMrPKP06YjmIbZ0t0yGHCaj7nmp0cOVx/Cclxw35
         yPN0f8wrI5TaCKnkg7FXk2aq4+Ky5GQL5EOGcncjXWN5qQcUPsUHkGyOIkozQGcWWnSs
         IgTTizQwsRNvl3oBwpvJL0PtyIaELz6ojheyw59LKGo9ORi2LrKUMHRteE0doJM1QB+O
         AfLe0D6rchV0IkMvJ6ZuuB9dhZ68SvbkUoLuH+1Dx4MyGPU6Z2po011z2v1TfclcDLOy
         cvULzzX7+Bg6mlbOGTPeElvFDYz/xdez7IZ4qE9B0pB/Rw8lHQoumXA1LC8ZaswXCccN
         nQ0A==
X-Forwarded-Encrypted: i=1; AL+hErH0hnfh2Pr7v8of1sMc3qx3z2zuwaeJelauFUsfbNp5m/R5pqTfIZf4z32P/TW47f9Q7etSnDz/XHdMcUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B7hqV1Ht166h/q+PxdHIqA7D29mRjhpFPpu+sJg8VTjAKKiGO
	kbpZil0RO2a/aVm6uEYDiAKqeWX2Km2EDIdc8FG7Grlu+edC0iem9Y/1
X-Gm-Gg: AZFdTZcBPHbhfvwEngY69Lem4fG1a3iOvt9ta8vi1k6Q3KaKkwMuP77sQq1VM+iuiMZ
	P35/tiORIPJukt3Ceuigf1dAF+/sHx/E/SIZSVACWBUH1nZr232Z/RFKTpe93MMH5r9ijhcnCjB
	iQXDJRbXjXnc8Thpyon21QK0KLxEicR0wH+3kNiAUhyOLWYWjFjHQXT21ZpSKZqSgr6O/OBiQhs
	kzJ2WG6lWAlaO/Qid3HK2CVTXvVk/PMU394Jh9nvkrcI+79DOqpFA/3UJ+4ky0C/oAx+/02LTHK
	IbpF6b8mEmZCZVtnk0L0NfOzgEQsJ2hpjwHqBx5pXtw3YyQCmpWkgpu/U7MF5F5EVPMpd3w4wbP
	uS+booN/0m6oC8PiM/96hvqs2wFkMDlzK5Y2mEJHrtFJR1Jhs4UctW/VJSR+gxiUzCo1UfbUyzS
	RZPhWZqQRw1430w4x2CgOW7IGT7Yc2YKeOwoxdqDVj7R46w8I5/Hb7lUrppkT8+mgAqIVmJlWf5
	U84InHXKa4N3jUqbWvj5aNnwQzlyyVva/1eNRdOonz8DhmmNCnK22XoTkGycTgF5wfoTu2SpqI2
	8TgCe3yaO/RzOLhoj+NHLOdwVIa5aFsQgSqd+SBRgpkbmJqH0YmJ+zewyWMjQywXCzbHtLU0+r+
	ChP3ah22pfAGwGAh6pK+qFaVCm2+JVInPeWZXSOY=
X-Received: by 2002:a05:6512:33c9:b0:5c0:13f:9b6 with SMTP id 2adb3069b0e04-5c1bc81c372mr3862415e87.54.1795503024669;
        Mon, 23 Nov 2026 22:50:24 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b45sm3538556e87.41.2026.11.23.22.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:50:24 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lucas Stankus <lucas.p.stankus@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH 5/6] iio: adc: ina2xx-adc: use iio_debugfs_reg_access_regmap()
Date: Tue, 24 Nov 2026 08:50:15 +0200
Message-ID: <20261124065016.185124-6-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124065016.185124-1-zoone.rupert@gmail.com>
References: <20261124065016.185124-1-zoone.rupert@gmail.com>
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

The debugfs callback only reads or writes the regmap of the parent
device, which is what the core helper does.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/adc/ina2xx-adc.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/ina2xx-adc.c b/drivers/iio/adc/ina2xx-adc.c
index c412f5ed46a1..587e82c33454 100644
--- a/drivers/iio/adc/ina2xx-adc.c
+++ b/drivers/iio/adc/ina2xx-adc.c
@@ -895,17 +895,6 @@ static const struct iio_buffer_setup_ops ina2xx_setup_ops = {
 	.predisable = &ina2xx_buffer_disable,
 };
 
-static int ina2xx_debug_reg(struct iio_dev *indio_dev,
-			    unsigned reg, unsigned writeval, unsigned *readval)
-{
-	struct ina2xx_chip_info *chip = iio_priv(indio_dev);
-
-	if (!readval)
-		return regmap_write(chip->regmap, reg, writeval);
-
-	return regmap_read(chip->regmap, reg, readval);
-}
-
 /* Possible integration times for vshunt and vbus */
 static IIO_CONST_ATTR_NAMED(ina219_integration_time_available,
 			    integration_time_available,
@@ -950,14 +939,14 @@ static const struct iio_info ina219_info = {
 	.read_raw = ina2xx_read_raw,
 	.read_avail = ina2xx_read_avail,
 	.write_raw = ina2xx_write_raw,
-	.debugfs_reg_access = ina2xx_debug_reg,
+	.debugfs_reg_access = iio_debugfs_reg_access_regmap,
 };
 
 static const struct iio_info ina226_info = {
 	.attrs = &ina226_attribute_group,
 	.read_raw = ina2xx_read_raw,
 	.write_raw = ina2xx_write_raw,
-	.debugfs_reg_access = ina2xx_debug_reg,
+	.debugfs_reg_access = iio_debugfs_reg_access_regmap,
 };
 
 /* Initialize the configuration and calibration registers. */
-- 
2.43.0

