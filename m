Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503023;
	b=ja+th7Y39BS2c1dttDuZvvxLQmthlCaix3TIrq54F8UXNaS8BBZOHmCk7P3+I43dlwhd
	 iP4GgK0c0fiaPyLR5nVOvF+RYM4utA6Rq3Vi+kdFth7grE01rmTacJWdJO1z47CT2uNkO
	 tqS7DawhYuU0HEaJxlZMQkImwgIkC0FG+LmRtWtuJBLEkW9ieyOfcgxMF9PE5RDg0cyQb
	 Zp6AvfRLtfQwIe/C3OTqkTWj8uoyvgpJxHyN8R9PTuS2QbaTOoTEDQSJ+6kBLT+UskM9D
	 drEULsGFNW6pus41pWtrTZR1FEAZ29rJMXm2r1/nGk3B28t1B32+RW6pDH7Tzo0hykg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d8p7lDtqSWp9hcD/jDb+a5iwCIgUzEOBbTORh5GXWgU=;
	b=qRT/qwI1ozXN1Vqge4iLGQ39n1L7WJ9xXsUisnBVUpdumNBZ0anym5QS5oLflwbHZi0Y
	 pjFhH7P1eiWQye1nNql/cWKPHn7wljyNw0bpC0wEha/ZSnf4/56ztIwd6UaALjpeTeroy
	 bvl6L83S0d1J/w1xg/ezIQq3xWATkYA3VvSf0637k4qr46j0+Sx4Cr26NL+P14QlOyTsB
	 7L3P3YD7rKOt+YOwqAY0xsuvY280MK/+PwqMWT6m1iBIwvqtWIXTVQVSrDkw0DvKvG93Q
	 bSp2QmQ6Yhva4tKkmUpXBULZhUAA2Gl11HZbzzfKQVRp5UjxoVCs9sIUNxMUWqvwwdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+QmA9AR;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE712606A336
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE712606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+QmA9AR
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so2415148e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503021; x=1796107821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8p7lDtqSWp9hcD/jDb+a5iwCIgUzEOBbTORh5GXWgU=;
        b=h+QmA9ARrJKNULKcXhbLT8ygEDhRbdeSxV8qOOPUv8AKxQj4QWmtSfZwKC1x4+S/27
         cXyb0NEMls1pQWzOn4//3TDka2xC96HbfM6jzVxgjVJDE9pfbqI4i7IbJbudsSiuTUXx
         X0nXYjWSJoqfvtPHlhRRPvNyv/gemhkTcSz0pU6T53XsLm/oOg4Nh6Wz/N0dK0RrpY3q
         sZftxciC5khu/Joqg/3KJyopW2ZctWVviQCP4uwY/4LxdROEyxJftmTw3cL7GwTzsw59
         t3EhSbFSb7cUTcBKvrwyLoGTh2uX+uZ+ksELYmVKFepuXEEIBtrqHCw1HZpZzAXfsSkh
         DBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503021; x=1796107821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8p7lDtqSWp9hcD/jDb+a5iwCIgUzEOBbTORh5GXWgU=;
        b=xr2X95nqcfQHSeAdNa0o0qR7a0xKqWpSWbb2dvgStXaI2Hkh4gicumM9HBJQtcjOfv
         W+YhJEqbivoGF+jT4MmHo+unmkbpNJW16db0kGO4GLXSXymBJ7GFuwfYhnMQKd+hamnF
         0PsFIqzfGwdmX4jJw7zBstAIZQ4jepKolYPMq6sscn8WIJNAO3PUOjZcix6uycDkBTAv
         Ej+mWTvSWUTov6PekyqruHNapR4I8u+S1IgXNZLPyFJICOxoQ8ZgG6tUxb4U2X1rdRcI
         fgj/aB5hufB+DfNH+BxgIdK3b1AZUzaDcDP9qYqrHG5yiSOWhDySbSU6qC/t2XJu5IQj
         4fEQ==
X-Forwarded-Encrypted: i=1; AL+hErGNGG5QLfxv0BhWqPxgirPvygXoYklt4pSvJI5YsiVyqabeIUyrNoo7+S1f43oNZ6F+SuQy0/sI+LEikRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gvZlHrajwf4wIvhMPcSewSOCLpew3UI4dzQpv342yqMhFqm/2
	7x8DHYAaaX4QG0DqaD/RgVTgjiLRGKlhXRJnQ0zknHvbZHmNrAAEF0QV
X-Gm-Gg: AZFdTZfaTHJT9V00n7RFhrdqg6hAsh/fBZ8mdSIA4YwEq0OYBqmc8Hs9lr6fpSSHWPn
	Xjl57+4UmC4qaIQ2CkU49C7o4MT4XH/V2m8UHg2hE5jERHciA1/+OakbmR5AMdoSLdVxFWHhbqR
	g2DjRku7iHTWblHnHHp51E1uLkJBsiXnCfCLbkNX4zN4egb2S0ZgqqW80b75w8402X9h5d0v8qA
	3E4CbbDtP4ZKYo3oBDEtLSje32IW+glrJ9Jgxm/ccDhWS+4RNtJt7xggbLA+MvYef3Q57jR8dL5
	OO9kQ1w7KBj1Vwqs7MjvvR+LRBdAqUIzeEFBcOb4giUQRIXYtVWpsY1yHzX+26Qd8l6LHNHK7Jb
	bJoiw6N6Db4F0WavqEfb4fUhrathLjxDnhRLXi1FG06Br6o73WvfOFQt/XrmXnFi1wANujtelYQ
	UWy66S1pqviZ34fx7gLjIWf9eX8ia/H4vQxKyIS5M4pgE6Pf5a/dGLfvacnP1B5VwNT4t3IQd/j
	jhQ2vXpDWXOVhe6LY/Xm+WayiCEfYjdgxSR3ltni3bgMup/G374cBiv2cjRmXMdbz9CmXFASs48
	OZcRMJr61I0doZCKmHBMKwbRdOYjBX26Oa8glaGbFN6d05YMcDOT97KjsYEiizIdq+lAwt0WT1u
	aLT8FQ8sGvrUzf8G3vj6fqXFaESwv5DCyzWv2yQ==
X-Received: by 2002:a05:6512:4207:b0:5bf:ce41:b440 with SMTP id 2adb3069b0e04-5c1bc7d6de5mr3651594e87.31.1795503021012;
        Mon, 23 Nov 2026 22:50:21 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b45sm3538556e87.41.2026.11.23.22.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:50:20 -0800 (PST)
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
Subject: [PATCH 2/6] iio: accel: adxl313: use iio_debugfs_reg_access_regmap()
Date: Tue, 24 Nov 2026 08:50:12 +0200
Message-ID: <20261124065016.185124-3-zoone.rupert@gmail.com>
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
 drivers/iio/accel/adxl313_core.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/iio/accel/adxl313_core.c b/drivers/iio/accel/adxl313_core.c
index 6dc918c4ae17..c37bf11d77d5 100644
--- a/drivers/iio/accel/adxl313_core.c
+++ b/drivers/iio/accel/adxl313_core.c
@@ -1131,16 +1131,6 @@ static irqreturn_t adxl313_irq_handler(int irq, void *p)
 	return IRQ_HANDLED;
 }
 
-static int adxl313_reg_access(struct iio_dev *indio_dev, unsigned int reg,
-			      unsigned int writeval, unsigned int *readval)
-{
-	struct adxl313_data *data = iio_priv(indio_dev);
-
-	if (readval)
-		return regmap_read(data->regmap, reg, readval);
-	return regmap_write(data->regmap, reg, writeval);
-}
-
 static const struct iio_info adxl313_info = {
 	.read_raw	= adxl313_read_raw,
 	.write_raw	= adxl313_write_raw,
@@ -1150,7 +1140,7 @@ static const struct iio_info adxl313_info = {
 	.write_event_value = adxl313_write_event_value,
 	.read_avail	= adxl313_read_freq_avail,
 	.hwfifo_set_watermark = adxl313_set_watermark,
-	.debugfs_reg_access = &adxl313_reg_access,
+	.debugfs_reg_access = iio_debugfs_reg_access_regmap,
 };
 
 static int adxl313_setup(struct device *dev, struct adxl313_data *data,
-- 
2.43.0

