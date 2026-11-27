Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804005;
	b=rGvutN9dx7l7geDK/NVLrXG0BxH98rsR9XqzP+xy+T1TLxb3D4gktorzNIXa90wmvO93
	 ThveKkCQwsHInzLNTfHvSbJM4QNoAGt0Fk7ozROGTTn2KRvCNIJrtS2dOfUmpVAjqQDGy
	 HzLE0XUk8OxsVATGVX/1X+FIzmx8NycKXl9RsatJ8sZnSi/jAKOMDadiRUFtkrLJA0NSZ
	 m4+LMsnTIu5x0KupUhxOQmLhZtw0F0TbhSa47dVdhydh0pS7CI9ieFFUudpiIT+GRMSZu
	 rckqXZ7Tt3na/BMzF4me8xiPVttjH6PRkPjRIYXBl0LxU3yObgslGHbS5LKj5jlYYXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eOXYjnqWWVMXkspdzQNEoKVv+Aym7CHLpb3HIl0SgT4=;
	b=OBYhhy5xS5V/s95tqpvQY4u7wiOqOeK0TCO1371F2aijvJn+8pI1ax3r/XuVMEzvu8iJ
	 iXtC4HOwg39Cqum8YG9uW8UjGTWEbkJXy/uiCHu+N8XpWuiY+YkW86wqKicizkSBHBBMa
	 M0CqqeX+kLHEgpzTA5O91fmO1n2UKci0+A6lIYBAXRwlxr+1XjXO6BaI9e8vp179FCFgD
	 aP2iVObIh7AD04eQMgxU/fHB8fERqhPkzRhYnpnOVlJRQRLTs/b3Zee4x4M3vaLiCkyHL
	 e5qpA5tRUxoBafoO8sRsA6MeaNNZgvfLOEsJnk2qWWTWBo3dSrOsX0NS7RCGoSYlR7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KRkQEOPC;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C530606A339
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C530606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KRkQEOPC
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-92157f2e8c1so68301836d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804003; x=1796408803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOXYjnqWWVMXkspdzQNEoKVv+Aym7CHLpb3HIl0SgT4=;
        b=KRkQEOPCd87kLPA2kUUs7jGcm4AeRVsXt8s9xlDHnsjMInCmYo/25UNtqJTTYfQzKh
         qmHOBqF0H/OPopELhebidAqOs068fFla7OP8BRd2PNw5WQrLX6Ns1E2zHBW90bliVlp2
         dIHYAyUREp5lD8KJi64TXBruhtW2tgUpRe9ZvjNcl3g4Sr/VyGxivnwdE/ARJv+ai7NK
         wPKHap/C2raVJnXtFyW/zl4R31fAMtzpR4KtuFX+qMp2Z9dU//LesOmqlGXgk7vy3bZt
         97AYsMdynnqtLnDtCP3TEFzO59jlGszT4yfkaFjvKI40bG3FxdppzzWKAgCvt3vX0HX9
         QXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804003; x=1796408803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eOXYjnqWWVMXkspdzQNEoKVv+Aym7CHLpb3HIl0SgT4=;
        b=oeRkryW2yg7AOW2Q2+p2Bn9EMVL5T9SBEdNTP1MABWybLlLV9f0t4JerklTiurQHUm
         HOFsCykvlW/JnCbHm6oX0bNyjlDSnJVOJRrupV91f/T1ImFqQZaDWSy2WVPFS1FGSmRU
         9iFBjnqC1tzGQSB2AM0uH8LABVjdEBi6EpyMoObhRDi6NM3gV2WtIoyJXUQYw595u/oS
         USiUFMogxBzH/JW22hcZIMrPwg5qANK3p8NPH9O220vCeE17Ud/Oz5t0CAFH5Bb/Z/it
         Lb15yCZclYG5vNJF/5VR4dnzGfCvNxuZfBNLD9f+dqdgor6v4D76LXCHCcZpPbjG3IJn
         ZD/Q==
X-Forwarded-Encrypted: i=1; AL+hErFTUSOxI5nUnXpfi1nWu1pBQs9szOFNwW26k5PsNddVZO9urmyEh7izlj6a1KUj9IYdRJb/5alN2ZywOfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y86or3fh0rtieIu6XGk+IkkFoHbSTa5ngCNypCLUBnMoomU/5
	1X2fz1N0zx7VXmsUZvyUOOxa+jX1DTvoUHwi8NVlUHdN0J63sZolRkbD
X-Gm-Gg: AZFdTZcZLjsH2ljLmHXOVDuE1UfxSlXytwIZAACSabFEW3aclLxhODtaHHn6WVx2+yA
	rhgc7hG32OYM0jeApu8RA0K11Lq9m3dTn5drvuaxmipofoIF4xed+UMLCjzZ/uGR5y22/J81rjA
	nfQJaLD42ZVFzlyTRLoByorrXBWBiHmYZXSV2v3g23HSbc3+Yu0TJ+Z8eSyWUoXwKGNfQINTGkx
	uqy91/3zIvlBWHwB6PcxtqxkvYcpFOQj2lzDx5Y4KQGl4thXdQrMz5mGKTrqExOiIwdA5i81iet
	L3jB74TvCeMGhp0bZ/Q2PMjLPXUR7bYxBQ8XKhKDBEvK/VBA7eR0uCl03jAxZoAyS6Rs+c6xHhY
	jjl5mU8m3NW4/lqrwLXOXJHcwrUAlA4D12jtxWWlTrI4LeN3AuOQXkjwbPwrOJWBs9fD3DMbGu/
	U58dpeVh3yPF+gsI3G5UqBXTnqUDMT+PXI+mM9A2Qmq0l0d8S27oAudOuNA5sDhNwUCwh1J6hxX
	x+Y29QPFegBYMEWH4B3eBJMLz3wFb00pniwq5tiT+QsuXZiDmtB21PJVSY0VT10zdI4J2zbQKcp
	/F/Z4BaUJIfABRVi4wE5ii0wJ0KkBN5Z6MY=
X-Received: by 2002:a05:6214:4686:b0:921:1ac1:34e2 with SMTP id 6a1803df08f44-921653a9042mr253658056d6.24.1795804003603;
        Fri, 27 Nov 2026 10:26:43 -0800 (PST)
Received: from localhost ([2600:4808:5693:8201:394e:8b9f:994c:b59f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213514d20esm222777366d6.23.2026.11.27.10.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:26:43 -0800 (PST)
From: Marco Chen <marcochen.dev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	pmeerw@pmeerw.net,
	matt@ranostay.sg,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 2/2] iio: health: max30102: propagate I2C read errors
Date: Fri, 27 Nov 2026 13:26:36 -0500
Message-ID: <20261127182636.83803-3-marcochen.dev@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127182636.83803-1-marcochen.dev@gmail.com>
References: <20261127182636.83803-1-marcochen.dev@gmail.com>
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

max30102_read_measurement() returns -EINVAL for every failed I2C read,
discarding the error code returned by i2c_smbus_read_i2c_block_data().

Return that error code instead. While at it, move the existing length
check above the copy as well, so both checks happen before the data is
used. The only caller, max30102_interrupt_handler(), stops reading on
any error, so behavior seen by userspace is unchanged.

Signed-off-by: Marco Chen <marcochen.dev@gmail.com>
---
The I2C error path was found by inspection, but was not actually tested
on hardware.

Additionally, checkpatch.pl --strict reports "foo * bar" for the 
multiplication in the length check, but I think this is a false positive.
Not sure how to handle it though.
Thank you.

 drivers/iio/health/max30102.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
index a553c0e011e0..829e8b18512d 100644
--- a/drivers/iio/health/max30102.c
+++ b/drivers/iio/health/max30102.c
@@ -264,6 +264,11 @@ static int max30102_read_measurement(struct max30102_data *data,
 					    measurements *
 					    MAX30102_REG_FIFO_DATA_BYTES,
 					    buffer);
+	if (ret < 0)
+		return ret;
+
+	if (ret != measurements * MAX30102_REG_FIFO_DATA_BYTES)
+		return -EINVAL;
 
 	switch (measurements) {
 	case 3:
@@ -279,8 +284,7 @@ static int max30102_read_measurement(struct max30102_data *data,
 		return -EINVAL;
 	}
 
-	return (ret == measurements * MAX30102_REG_FIFO_DATA_BYTES) ?
-	       0 : -EINVAL;
+	return 0;
 }
 
 static irqreturn_t max30102_interrupt_handler(int irq, void *private)
-- 
2.56.1

