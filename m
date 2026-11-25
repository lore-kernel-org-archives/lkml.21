Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638159;
	b=WtbeUnXV4ow2aJHPas3RJyHoT5nkKlvkQnORnmeXyAz5vENprqCAJ9TQRQ3rQkc5KUB1
	 48R/pz3Uu/3Ah86epy2I0MOLQFeS6xkvBFa5HYuwKCR/A27JeLanoYeVPPV3p1UpIepb0
	 EXmYgupoqrOmNqKFNTYMiVa2B3BozBHd8W+SomuAIzS3ZSg3JfnaS9Q8XafjfEdk8XNEk
	 l2JeOUdmLC3ycboWuArFh7VTHzxWREZGbyLEkSL1oMK8sFX5wJ+hb9JwQT7cp7ElUjp/R
	 F/N5kTdUKB6auubkD4zbpAx+kh2mJu5l7+hwv7jmvT59yIsCwOEZf48dGkpydNG3lcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638159;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=pgnUeUO8I19NQs/CTfh4hJgcQtU+xPIOCdAi0uHfl8s=;
	b=n2Mrm4p+TvSVuRzDMumT/0zifU+/jBeof0TKpLL2B0srlevx4pUop0qrN36npDFgiBxc
	 7fplOww1soO2jmijUdliIEOTkLltys15aNJWg+DC6HhCl0lma81nzv6m0Ly8USYp5UEiu
	 ddkIuoOyshfLuG0ZLPfM9F4ZOT3AOzynh0zZOsoyCmMSQ8Jv5gjLr1RBLe9hlIUnf7VSz
	 n9miqJ0+2w5zk1lxfw2H4XjOlEzJiITZC5M20ant0U7nj0SFoEUzUsz2q6GnyUROPoe0q
	 BMSvIvQODoz+JX3Sbn5vp7NF2ycLl57/Bv5p0Z9GJ/fTFf5B6+xqqL5gmNcHx193DEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B5D606A688
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B5D606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67db3a48dc6so7535347d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638158; x=1796242958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgnUeUO8I19NQs/CTfh4hJgcQtU+xPIOCdAi0uHfl8s=;
        b=O4RcskeLESDPgfKgDw+zYMi/9rVM7DgJPIq6GiUpQV18w04J3HEU8H4kx5vb2aHXkk
         wWbcH5NMONyl1DiN6zqjxuiRDQjXzGE9xg4dF9Vtn0JJwxGl2n3nFfm1MEBmAWZtTeWg
         FXMoaYwkgk2KfFexMNrSN7Qru459ElfOEue2OhcMhr6uxag99qLV2Xm3GDbt6iDWc2I0
         01JtcAhAWSY+YZWH9K9/rmPSHUqr+5RzFF8h2w2RK6sHEDi8/86ThD91zVBv0m1V8jzq
         RIkBJh7mx0dsNOuqhzXRcMb2E+hVv4Zs4FPTM9Vq30G0SrPHUlFgiZf4JVzFtpnYELDR
         3CRw==
X-Forwarded-Encrypted: i=1; AL+hErEhcM/EEg7xbg7bl7KACx1QCouldTCKtYPej0cnMZTd//qyhGPL9V8RofFYeAZLnGR0NbXXXofiCAHcwLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Eo97vFchk/FvCGyY4dT5zXf2Nkrc2i2uyqJVOjWmr29fDGsh2
	1JoReVBphwivQ8+qOy61c1PUNoQ8mMYUyQ7gSxkly9dlA8jtriKAZidRDLyuPMtzgsY=
X-Gm-Gg: AZFdTZfVxD7CK+Gtqo10QclCk8FxHQaffE5PzlI2NuaFWEeqys/tbgwJnJWOICtzc2s
	bOJkkHg6DT4KW+MZoM0cNyGClaHp+qhhsqz+MstnOHt92jslPeztuhgj31fs2Ql7KqsWximBnZN
	Oi2Ckp+4nfQms1b3rSq7OYojgJvCcUS7gEdCZ5vcifvMvuaDrNzwY/HaKJXcrPCOE8UEJcByp6d
	aEtLBBPIpy6L5v+1ba7V7lixPjcUSA9vUIS7l7azHrlRqK3pn1rU/aCmLr52e3r1RmOmR8AEQ/3
	w+E8x2qM8Z/JoGImeJjAMGWty4YjJL1PfhjaV/zPV3ggrpxfjNOGqp+xG/JQVeizN3ijpBSxsxY
	luqb0GXzlz1PhPn+wrRytVWp0lt10G6tYzGOSHxrPuRv8IU+qroWCCsGsPPdRcDGyReo82kAx+o
	Yu/w8by0yD3d/P5kzSHeB1S6SQWdoHdN6mkoVc9D4/b7oU22oB3kA4c+QPqpkbYMfT34sfgTsZ4
	vLV6gOPCsyKRDwe+T6MiYuzovSO3JReNT0JiIUN88S5enbwIVlasaRMDToEpWB6cXl71FJdGYcv
	/ohAwS6Lla19Vzblx8Yzb3RXcNFfzJKZgMlrqOE2o0j2j/qnE3FEQfRYlCIAYa/hwu1zp0iWv1k
	xUo7Uug1Yg0EkCYUa7UxADK3KtuTmNCvxjUUclZ+p/DYKG5k7ZORbHYoztBJug2vCmKNgDjvY0V
	mfO/ofl2Gn203VGAaQWii4wN77PO8+fK82gAFfCEIxe8i78Q==
X-Received: by 2002:a05:690e:1905:b0:675:33c4:52d1 with SMTP id 956f58d0204a3-67df42b5a2amr7810425d50.6.1795638158345;
        Wed, 25 Nov 2026 12:22:38 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201bb6c7sm77074377b3.6.2026.11.25.12.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:22:38 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 25 Nov 2026 15:22:31 -0500
Subject: [PATCH v2 4/6] iio: potentiometer: mcp4018: Turn on the vdd supply
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-iio-ad5246-v2-4-8feeb630f0b6@telaak.dev>
References: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
In-Reply-To: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Get and enable the vdd supply at probe, so a board that switches the
potentiometer's supply gets it powered before the wiper is used. On
boards that describe no supply, this gets the dummy regulator.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/iio/potentiometer/mcp4018.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/potentiometer/mcp4018.c b/drivers/iio/potentiometer/mcp4018.c
index d6387645853d..6ca6cd7cbf71 100644
--- a/drivers/iio/potentiometer/mcp4018.c
+++ b/drivers/iio/potentiometer/mcp4018.c
@@ -14,11 +14,13 @@
 
 #include <linux/array_size.h>
 #include <linux/bits.h>
+#include <linux/dev_printk.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/iio/iio.h>
 #include <linux/module.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 
 #define MCP4018_WIPER_MAX 127
 
@@ -169,6 +171,7 @@ static int mcp4018_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct mcp4018_data *data;
 	struct iio_dev *indio_dev;
+	int ret;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_BYTE)) {
@@ -176,6 +179,10 @@ static int mcp4018_probe(struct i2c_client *client)
 		return -EOPNOTSUPP;
 	}
 
+	ret = devm_regulator_get_enable(dev, "vdd");
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable vdd supply\n");
+
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!indio_dev)
 		return -ENOMEM;

-- 
Git-155)

