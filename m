Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527428;
	b=RBrJ5HyfvmDddD7SuovwSwzNs7W2D4w/AftEk4hTJBfgC4WxCSDXnP5V/KUBA373MWoh
	 hjtXfWmx91ZRjUzZq+CJi1d71mR6Zi7m2DK4PEieJ46RAVbVpN7BxEGQP0XydILBBfCrv
	 4s9VvrH4klDCTVsHwCm3P8CjrX/udbTXxByw2Rj5I/9s2K4lH8EHr8GK3In3JNE/ewxX9
	 8pQ6YriN3JQ0tz9Vqv1PojCovH+4/Fsn97nVLv3IKAQ32eCbYdbGYQXyWi6izFit5CBV2
	 jgmCs4/SAsdraBfUjbfQ9RYrNb44c87hZeOrjwwfS5yAGs4Yu0BdvL+7auqu00K87QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KPY8tQeszbUqEwYqMLIMysd8FLLdVIfhPfeNS/lrFEo=;
	b=ndXmEulCC/wVmeUbgMbc7sNLJPTlE+tW/VMY4w3ijYiB9XFTfCkclZfH6d2X7jEEsEMo
	 g+UsE3pIhNcfi6jMkQaQcpNLkguMhzanNdNR0tAGgJFaVsjwA5ajb/y5fr8neSR/mN5Hq
	 pwf3bL2sFk9orhMcgekYLBnTy1aISL0rkvQt3gxaroZcW6zuJGxyayAbKZ4xVQfZyScU7
	 eQZf3qruo/C8xnlHo3DZWfG/VxTUvJsas82z3k3iq3UzWcs4a1XbJ29Cf6jNbzkUGE2Cw
	 FQtZztX0OTX/Fn3D3lVs4ckH2Nh7w99xHsnAtCWYdBr5vVi0Hlm2/ey5DgBpkow4fqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bEEdVd4m;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18A1606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D18A1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bEEdVd4m
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-94962d80d34so284515285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795527427; x=1796132227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPY8tQeszbUqEwYqMLIMysd8FLLdVIfhPfeNS/lrFEo=;
        b=bEEdVd4m7e9+V+BhbEvofYjXFqtFxxcsvu5Ml+g87YdGXXVQ+k2A6REr5qKleWXq0J
         /13v6r/695pOYFnUR7ywM8kIEBS+zTx7iQhx/S0lfF2jX1+wQ/w1wzPC9jP2+7ZbDxgM
         o1Bt4KRlCCQS51AQwOC2czo/pNfQnV9dC19GOSz2gwR84LHkdHh151hd/uIFayVvutZq
         5F4VXTJMEY7rC8ld9orYhUhzyVRU1q910rWe8YDxEUBzTXafVhsE6g/vUZwoI/rPs7Qt
         zY7jg1GfkIlhtia2zzt70u/+nVdfgb7o3xK7EoqPXkW0bmMHCCzZVfRKhTlokB6hO8+l
         lPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527427; x=1796132227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPY8tQeszbUqEwYqMLIMysd8FLLdVIfhPfeNS/lrFEo=;
        b=Y5r6FV+LtVvNJgRMnD+VOBnIZy+PxnYWGLPe03XiD1XruKTeDZlENKMj2mjPetnf9S
         BkigxMhn+ndBIzC8V1azMfGXsREC257F81amtEEf0fVlOHCyYY5JlB/QhKqp+5eWWzq8
         +L3ymkP9Wu4iPVg8rquNLRqi+PA1RkGqU3OU/XXvqsrqdGoWf+18Xz/6yMQKh395snSr
         JcTjZHaQ4DflF0D/aW2JvTNjd5zZm7DsigP/cYvJMzwcYzCVPElAd1RL3SMIMN8wN12Z
         e0r7FTdQtuiYyvFgsTNfA53ohTy3rQrM+5Z2IUFZkJuYveuBP1YZRqpBGbyKTYYzQO3q
         NXAQ==
X-Forwarded-Encrypted: i=1; AL+hErGbxtOklQtYbJETXs1+17nf7/0954UTp6ABxdyz62y0iQPvRW6pPGOdzhvBt6HKQYoIL1P7Qs98RMJImrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R6zyy9uwaRKvmwRIkQITNoJm+0AoNFBECNFvJd8fx23mX0xLT
	AQOoa4xlSCqa/d0MxWBl/0Cj05cqOxZ18Dc5xrNhP8dvdZp4FpXDKfeC
X-Gm-Gg: AZFdTZcgR7B5LEQhjxDoUq1nPwGDmPUIzt2T94hVfI4TOus6tGqCGoeOqJvfn3AbEE3
	t5tcifXoI8i9SJoGvWjw3KUEm8Vo5bk7AOXf58X2veXvM2ths45eaXTC7S0ZtjvphbCprDK7HyP
	dt492fvX8zCG0o94ONMer7NXrR9hlipSmvAqwVuP7TN1LxSaiJNzaCjCBpSJfCaaHqlP3d+v/FZ
	YNfxds0/Uf8F9zIdrNjx6fT6iR/+hPGpsG3P/lgGVTS+/rZCP1ZY1cvPMCykP+f7rQ7ORFYINJl
	j5WGGIH+oLm48/hil+dEKfJRX6eF056Sd8hvPnE9GMNIn2hEb/YrEP5JUVL67MAOsPmBPjf8ra7
	GbTVJ29Z56evyOk2Mug3bLLeNruW/93mSLxhdAK+Ti8ciQkRBj72w0pv14v9i4/4YZO8Wt4yAQ9
	id0DFOVHWOXbIm420X3gUDkDmjvjAY2ApjIo5IbpHSmQ4DZ8g0vB5bxUzB6CEio7ayYSrqoURzS
	Ll6LjI5JCpJkzw+oQpltiaQqnrYBwHK8POjd947GzsP86H57Ugj6Xeh12opMqDo09jCwFGvJaoz
	c0kPRqMcGizEo75/3nvB18BIGJLPSaNwZEAeB6OA0D2scfwKjl+NRRiD9FDao2xV
X-Received: by 2002:a05:620a:880e:b0:947:a431:adf2 with SMTP id af79cd13be357-949ba8246bdmr2229548485a.1.1795527426708;
        Tue, 24 Nov 2026 05:37:06 -0800 (PST)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d383asm133834536d6.22.2026.11.24.05.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:37:06 -0800 (PST)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	j-keerthy@ti.com,
	nsekhar@ti.com,
	prabhakar.csengg@gmail.com,
	avinashphilip@ti.com,
	sujithkv@ti.com
Subject: [PATCH v2 2/2] gpio: davinci: allocate bank IRQ data before installing handlers
Date: Tue, 24 Nov 2026 19:06:54 +0530
Message-ID: <20261124121500.2cd5cbf30f89-3-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124121500.2cd5cbf30f89-1-sahaj123.sc@gmail.com>
References: <20261124121500.2cd5cbf30f89-1-sahaj123.sc@gmail.com>
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

If allocation fails partway through bank setup, previously installed
chained handlers still point at devm-managed data that is released when
probe fails. Allocate the complete bank-data array before installing the
first chained handler so an allocation failure leaves no handlers behind.

This fixes the probe-failure path; it does not change ordinary device
removal.

Fixes: b5cf3fd827d2 ("gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip")
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
Changes in v2:
- Rebase onto GPIO gpio/for-next and use devm_kzalloc_objs() for the
  upfront array, matching the upstream devm_kzalloc_obj() conversion.
- Add Linus Walleij's Reviewed-by.

Previous version:
https://lore.kernel.org/all/20261109194910.2282454-3-sahaj123.sc@gmail.com/

Testing:
- ARM64 W=1 driver build and mocked allocation-failure regression passed.
- Instrumented AM642 allocation failure left one handler on baseline and
  none with the fixed series. The real parent handler was also exercised
  on 12 banks. See the cover letter for test scope and limitations.

 drivers/gpio/gpio-davinci.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 7961ddee9f40..15c6420d25c4 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -550,6 +550,13 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	 * Or, AINTC can handle IRQs for banks of 16 GPIO IRQs, which we
 	 * then chain through our own handler.
 	 */
+	irqdata = devm_kzalloc_objs(dev, *irqdata,
+				    DIV_ROUND_UP(ngpio, 16));
+	if (!irqdata) {
+		irq_domain_remove(chips->irq_domain);
+		return -ENOMEM;
+	}
+
 	for (gpio = 0, bank = 0; gpio < ngpio; bank++, gpio += 16) {
 		/* disabled by default, enabled only as needed
 		 * There are register sets for 32 GPIOs. 2 banks of 16
@@ -564,19 +571,12 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		 * gpio irqs. Pass the irq bank's corresponding controller to
 		 * the chained irq handler.
 		 */
-		irqdata = devm_kzalloc_obj(&pdev->dev,
-					   struct davinci_gpio_irq_data);
-		if (!irqdata) {
-			irq_domain_remove(chips->irq_domain);
-			return -ENOMEM;
-		}
-
-		irqdata->regs = g;
-		irqdata->bank_num = bank;
-		irqdata->chip = chips;
+		irqdata[bank].regs = g;
+		irqdata[bank].bank_num = bank;
+		irqdata[bank].chip = chips;
 
 		irq_set_chained_handler_and_data(chips->irqs[bank],
-						 gpio_irq_handler, irqdata);
+						 gpio_irq_handler, &irqdata[bank]);
 
 		binten |= BIT(bank);
 	}
-- 
2.43.0

