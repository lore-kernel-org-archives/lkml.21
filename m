Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636262;
	b=rnh7EDH47zpUJ+WbPufdVukWyM27KZUj2K0Z3x0ncL2NwsQMbNtOAc1P3Xlj/Q7UifhJ
	 FjNqvvvHTz3znJzIfO4ty2E1R9mS1BsumUUcCE6YADFcKfnBLX7b8xzpuWlBWmASyD3Zu
	 7QhHGeDg6u0JWBhx6PTEWocTQSc7yPnM7Cbj+xLlzNIAgbqpEFjxpQTWG7tRn9C1hRnf3
	 Jec01F+Zl3zxwPH5vybAxN/fyhkg4l0hZM2Nwsh9z15gdKII1sTKwiGeIxI8Hxfgxa/Ak
	 aigm8uv5UxDnAptnbb9PhFJK76sW/MOMHJAwfZseQDADel3qm40IRHGLBOYho9mCiVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZuGEAzWS3xcIcvSu/cuY37PG3g4bSwO/xoH2Fm6M/Eo=;
	b=HsLQRatYaFOHgQ5ecJ4sDLMQQu9N/3ZNiLpT/K4QgwfL8FFjom/G74tTZwbNDwa6EYQ0
	 KwFlf4iQUBFSkBQaTfXBYnj4bKzsJlJwfaq1GF8uMH+ZrqbzyKI0h+/yYweQhtkS5FOr7
	 vcz9gVjzZc+BjnXj4c60bPxsXyf7inf9njvxGp9hCOOyy8q5rtzsBhe0o18dRe8TKdIik
	 sv3buzQnsx03sMKCXSGL18DcXKaRd0Eok5uy6HdvRNT2O8HXKBcR+x4OqPrJFYCVoCLG3
	 wMOGYMvoHrihRIlLmeFBPURqhPzTwqFXJ+IFVVnB7Xq4uU2yHcyCvjjxC2gx+Ln68KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qMyTSypB;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49938606A691
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49938606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qMyTSypB
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4adae3eb4d3so2463300fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636260; x=1796241060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuGEAzWS3xcIcvSu/cuY37PG3g4bSwO/xoH2Fm6M/Eo=;
        b=qMyTSypBvbs4gQ1+F3bFPW7VPlHr2GwAICXC7/K7ZudopacyXTW4/xyFfu/RQInevI
         3MKQAI4s6BiJlMkT2doW4hWFUfcNvjXJ1pC5TAOuljmR36AaQXcFTAY70XHws2LRypXd
         pbYGqe0WOF0TbkDduFtWacw3TK0EUyep6waaENj0YAcC2KkAUosw83QVzXkxf5c5fEAT
         CLaXEZN8RYBGKH/8G4RV4xs2rt0dAtHp26XCf4K0pqTgkKHaW6HiZiuV8V95EglfQhwk
         PO7AZhZCACvGiYlXQyw+pO7xuYNLz8XBDE5fU1oHnq20WdaHmPMjtfTogOOdh+dfM0BB
         W/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636260; x=1796241060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuGEAzWS3xcIcvSu/cuY37PG3g4bSwO/xoH2Fm6M/Eo=;
        b=hImZAEgcuMJ2YaqtUieGWTWgxN3sSm1m4xVz3dyvAkXDBazxEqiG/7UfVGbC+ABuvv
         L/o/L50g5ufTDtRJFXqB2sW5gXAsCFXebqXU3FUYtJLxzhysuxw/mmbYjl95bD9PPBv+
         MV2jxZ5y0UseVHYzqpzAqRhOg2khxryi6hVNjC+0IG7XehvAxAeZbNObe93M5DSXWViC
         1jD+5kjuc/T0ekd8OjSWaI3ux9SIsGZifD7Tyuh78xw3hpPvtRCre25o5V9Ari05yi+p
         H7r48m4G6qpqHteDcIo/S6WQCIM0qvneuZQfcmD4eCU4kxt54lK6sTyMtxbrW7N3HWNT
         LvnQ==
X-Gm-Message-State: APuU4Z9G7UnlKiDZy6PAnkathxTSqTx8BVPubM7PN3IJuvMjESjQB1cg
	2zl5k8QJeC4+dr1tAdy79vUbB7qSDDPU/6meFteH38jxn1d2+hl9lMM=
X-Gm-Gg: AZFdTZf4nNxmE4YKeZf4rHz/Yy2qZIcuOwxJjAZ31CM2ncLdKTsn1oX5LCvsUy7dVtc
	RuykJMxkpZGHzEcSdkAPgO4c0Oq2n1rAel6sPyIBYE3mGXoX7rNKnTLdoF+xM3YxNkN7Ut91+cB
	f1MCYIZJ/5CTuj39HLeikRAQEJw0J7fkpV0mvrHU/whKNNsacs3hN07nHPg4VujsKCz1kZHsqa8
	EtzOF9XUU5QX2PVQrY0eSVj95tvM6QsTjx+xzT1wHxBtHl5LWm5ihFxiUDB0OseCWOwuHOD5n/+
	M90n13XfBVNkUSpRp1E63mZZV0pCteIbt9DUNnOI9TB1HvcDUhRTZ6I65O59IE4ZXEWM7Tvh0dK
	JX06tYEHyqKniIdYarI9dG0H8ivQw9dyDIp/Hxji30uIcmP87c6OIVMTGcG9y9419a+vBMecjdA
	YlAafmM7UI8EDBkn2YifuVH9TqLvKVp8BNkxuI1KxxpzAT9iQbHGw+6sunfnW0BBcbXuOXsnynI
	ld7Sd9L9IQU+Hz7nnxxgO30P6VOwr92Pm/Ga90DwCAOes/MsG9y53tBYnMkVmBK2+TEbm3WVa1o
	NPADvVKQRL58w5cMhjACdSychIKqbpNG5KmNjvPEM6HHzUnsz3CjG+mb
X-Received: by 2002:a05:6808:309f:b0:573:3cbc:9775 with SMTP id 5614622812f47-57a0900b93amr19406702b6e.27.1795636260017;
        Wed, 25 Nov 2026 11:51:00 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:58 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 07/12] media: tw9900: power down analog blocks in runtime suspend
Date: Wed, 25 Nov 2026 13:49:46 -0600
Message-ID: <20261125194951.19072-8-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125194951.19072-1-matthew.laux@gmail.com>
References: <20261125194951.19072-1-matthew.laux@gmail.com>
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

On boards without a controllable supply or reset GPIO, runtime suspend
leaves the decoder fully powered. Set the CLK/Y/C power-down bits in
ANALOG_CTL and the PLL power-down bit in ANAL_CTL_II before cutting
power. Runtime resume rewrites both registers from the init table.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 585509c1b41d..b2b754e898c2 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -34,6 +34,9 @@
 #define TW9900_REG_CKHY_HSDLY			0x04
 #define TW9900_REG_OUT_CTRL_I			0x05
 #define TW9900_REG_ANALOG_CTL			0x06
+#define TW9900_REG_ANALOG_CTL_CLK_PDN		BIT(3)
+#define TW9900_REG_ANALOG_CTL_Y_PDN		BIT(2)
+#define TW9900_REG_ANALOG_CTL_C_PDN		BIT(1)
 #define TW9900_REG_CROP_HI			0x07
 #define TW9900_REG_VDELAY_LO			0x08
 #define TW9900_REG_VACTIVE_LO			0x09
@@ -48,6 +51,7 @@
 #define TW9900_REG_HUE				0x15
 #define TW9900_REG_VBI_CNTL			0x19
 #define TW9900_REG_ANAL_CTL_II			0x1A
+#define TW9900_REG_ANAL_CTL_II_PLL_PDN		BIT(6)
 #define TW9900_REG_OUT_CTRL_II			0x1B
 #define TW9900_REG_STD				0x1C
 #define TW9900_REG_STD_AUTO_PROGRESS		BIT(7)
@@ -689,6 +693,13 @@ static int tw9900_runtime_suspend(struct device *dev)
 
 	mutex_lock(&tw9900->mutex);
 
+	tw9900_write_reg(tw9900->client, TW9900_REG_ANALOG_CTL,
+			 TW9900_REG_ANALOG_CTL_CLK_PDN |
+			 TW9900_REG_ANALOG_CTL_Y_PDN |
+			 TW9900_REG_ANALOG_CTL_C_PDN);
+	tw9900_write_reg(tw9900->client, TW9900_REG_ANAL_CTL_II,
+			 TW9900_REG_ANAL_CTL_II_PLL_PDN);
+
 	if (tw9900->reset_gpio)
 		gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
 
-- 
2.47.3

