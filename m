Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514235;
	b=GavlEJB9zhTtufhcb/rjhcTIg+0c7XVh8nZ4yujrdKWQskyYuXFoGwdGbrJMH0nI9sP/
	 fS2CqYlSztlEQ3jQq+IMLy/RXLaA/X4umo1bEg4eT6PXn4xDwezn+n81kdxIbDpXKrcQ2
	 yMYAb3Jy2Etm6Z3kglftPzQ8Hvh3cTAwz3quaMP+t3xQjp0jT2DA4PIrC76qyA9iltLcM
	 jusD7uXtygfPtvi8iAJFQn+6YoqiKCmXVUbBrSWvmc+WHvP8sWm6NgjIv5/iytIAiBI2M
	 rsmksQJREzlefZYBK+F8bZpaq5Gz39njn1JpkxQY0y32eQZJw8v7XXd87ePg5Cb9z4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZjDaNSB2HLIfLWzDN7uiWUYczNlAzXlQFpNtIilTK4g=;
	b=rvnYqv4IpJZzA/OvBK/s/bcFPmBFtc77RVuNSy9EzDmVo0cT+hJvRt7XbTqYQzMu/Eos
	 DnmzC2o9jWDdQxCQULPpIkTG3rsBkTVwCb1ISIFkd76adJCaWjx9grSqo6hH5WyIaOVbH
	 d9l2SPpfKXU4Iv4R7tKTVwPad1fehyx9k3vayPuSFXBSFjasAm0/V/1L1ErhlTETZXuMc
	 o9/A+tGd3Izt9r4kc63zc3biLxCJDcRmlPwdAT3t+iH9GRWLWZzqHEcS6qWr0VGldwHsQ
	 dVjr4009wM9gc6nnpuR64VYMmnJ8iD6RE7QTSQRmcpowL72bTNrcEPn9QLtrbzvpYLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v7w6IN9a;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF897606A336
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF897606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v7w6IN9a
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f02f04a426so34794365ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795514234; x=1796119034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZjDaNSB2HLIfLWzDN7uiWUYczNlAzXlQFpNtIilTK4g=;
        b=v7w6IN9an0o4PTO4bxm+siSV210HGcPWmamp1rYVn/Nat5ZwOGdOtQL6REmEGb3B9n
         0L+RNL8BiSXnZ+5yoFWze/geC+uqNrYDIb6rEJt2DAdy/Yk5irwqB0pQ9VmkWk+rgFGy
         DJIhdBBGyPlfJ7dE4abOgpOU+6AFIRo1f8tYXkyp6D3LZ0b6fPGxKFP2hJv6Zs7xWCzA
         j3LORax0XQ8p4742A4aV6HL2FGfO8KtMcnXZsjUHQaAangAj3qHM/trbpEqaP+4AafFu
         SNMeC+22K0p2/xoXQGNb8Cl4A8G2PWPvWuQSMSyTYtT+Wms2A+gfMPK3dNY/qnL3AYka
         STHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514234; x=1796119034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjDaNSB2HLIfLWzDN7uiWUYczNlAzXlQFpNtIilTK4g=;
        b=2g+UKG6rOmvF/C/1Ix0WkXdYGRYKIqMy8NpILxvuZt9iaYk+hj6shDYdE1txtKffhh
         mU1jzh5xohRLjQgskjDKC/5Mydzcv5zhT8XGsdU3dj4PZNl+R2Vb+GW02jC5w5zJ2IYa
         XxCbHLr2phwavcaPlNDkRWMbEbv5+PPOlKnaUbjkEU+p4syvu7GXXZFKONd76Zb+dLp3
         vv5nS7etr7WOli0zfXjshXTJrtmMjT9HuYpPg+BWtMLAzXUCqJg3Z4zDKzj+d2tBJk64
         ePNCpi7e5WZu2L+vwAg5zhm/hGOt2nHnv1szRlgsOl4lRFas0y+BYtTLgYIZ6Co/JbTL
         njKw==
X-Forwarded-Encrypted: i=1; AL+hErEN26dHPJLm3jAfYaaut2lk2xG7dqX7ENxBiyVgKatUOTR5i0a/UzXqMC6L5+kKpNxvvAJVmD3ovG4FGx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lwv3PsFlebkyVrGRFL0vmhDA7MyGbfF5zc3yzUlQTBcoruzyH
	+o3NsvLa4EO15M3LyC/UnEFb3V4p53GxwrCxsiOnAE4Xa0RVWuCDmQW8
X-Gm-Gg: AZFdTZd8qvDXuntmxBTTm2+oBGLyvqd+XqSEGxDZOuJBeJNDBXn3tw4OzfrkuXdj1LM
	wm3VOhsfHVnKaoUibNbR5pJPcOpMYRh/bCrtwdsuHroFUnWK4lvNqQvHMxXoK5VyVmXo4G43keC
	NDMJSLsJplG2UrRhn/VpoRsluEyHvzcHVfMERncZaC069EovHpL01autnl6mgZYnB22UjkVtIY8
	xVdDMCmg19zrTZ4dq1WlM3AHGS7KtO+EAunRT+h+2VZl43hddinAjkz1SiXE0Shy6/9TlRjjh/R
	SuykZfaOi3/ZEWo4wFhBS/dQrcbEu+GqkmqSU8g+ZAKUP39EljYAIwX55DWvsC3RduWSWGmdvHY
	L9eh/hnU5ZZ+sALjAQ1L9G9Kw+GkFyVdWXpvwBg4ycXsNBQ67IN0yimR9tjF2hx5tW0+HOUB80w
	KkS9YlkBYB8f3vsCRyzPARSVxIkpuwBdIv1jvOOP9kJ3+QsAl9q9kqYcgkTLNqtjO7wNtWKzacD
	oJUlIOK3O77VrCXXa/Z1jrvhCn5cHEfxkuQWQky0KZg7dAmgkwQ3XHvo7XyEExi6Xws78r1XUpq
	2Vc6fTnQul8EgWGmHpcZUjnEykoUXjA85fnuI9r10KwigMg=
X-Received: by 2002:a17:90b:3891:b0:3b4:127a:2bc2 with SMTP id 98e67ed59e1d1-3b41c8d9bfamr12544097a91.14.1795514234177;
        Tue, 24 Nov 2026 01:57:14 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm24186851a91.5.2026.11.24.01.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:57:13 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Alexander Sverdlin <alex@sverdlin.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: rgb: ktd202x: allocate the LED array for the chip's LED count
Date: Tue, 24 Nov 2026 16:57:07 +0700
Message-Id: <20261124095707.3852724-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

ktd202x_probe() allocates chip->leds[] with one entry per LED child node.
The allocation helper sets chip->num_leds to that count, but probe then
overwrites it with the number of LEDs the chip supports (3 for KTD2026,
4 for KTD2027).

If the firmware describes fewer LEDs than the chip supports,
ktd202x_chip_in_use() reads entries past the end of the allocation each
time a brightness is set.

Allocate the array with the number of LEDs the chip supports, so that
num_leds matches the allocation. Entries without a firmware node stay
zeroed.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/leds/rgb/leds-ktd202x.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index f1822281c3e6..56f6fa906b70 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -533,6 +533,7 @@ static int ktd202x_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ktd202x *chip;
+	unsigned long num_leds;
 	int count;
 	int ret;
 
@@ -540,7 +541,9 @@ static int ktd202x_probe(struct i2c_client *client)
 	if (!count || count > KTD202X_MAX_LEDS)
 		return dev_err_probe(dev, -EINVAL, "Incorrect number of leds (%d)", count);
 
-	chip = devm_kzalloc_flex(dev, *chip, leds, count);
+	num_leds = (unsigned long)i2c_get_match_data(client);
+
+	chip = devm_kzalloc_flex(dev, *chip, leds, num_leds);
 	if (!chip)
 		return -ENOMEM;
 
@@ -558,8 +561,6 @@ static int ktd202x_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	chip->num_leds = (unsigned long)i2c_get_match_data(client);
-
 	chip->regulators[0].supply = "vin";
 	chip->regulators[1].supply = "vio";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(chip->regulators), chip->regulators);
-- 
2.25.1

