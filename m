Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433602;
	b=zPBhiUVW0DJ7Fv5mPYuKpPK7Vwl2NRwMhMhqODt08+DCUB8lfet4mHUBAqz36hHT8MX4
	 4+v2wTINUuczyIdS0pYuFo0WqH11HY9kW5GLG8w+FH/ZtxB7hNSUsOmGrMYjscGBDHLbY
	 im9cKDYYDKvvZEs8CzTLKXdkl5IXyjdYVTlA3X4XjJ4I8uohxE5D7G5SA7dn60emTfn0O
	 8ieHkR+wF8c+PBEvr9aEdnSOsT8g+G4h82DT8f+Ig01j4SIZL4meovfyPvY1/90LMzoAx
	 aIXpwCsrsmK8+Fnf5PWNTYhLuZSey43DrJw5bSq9K17iH/zeq6DZd06emZNE0J/N5IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j8dmhSrkGCES4x7Qt63skZcMI+cXFvorwNPaLXIPs1c=;
	b=fasvT2V+v5i8omJoxOhmKFIIMlBsu8xC6sRVGGANQmMXskr1M56PjBRB2BXqsG6jVsLo
	 oxXyGgaKxc/dtQiPNufMfa0rhf8aTQxASwOsI4Zvbka53ou4BbqySjJesCF5xxiOI55Ui
	 dYK0hY8ZZWE2Eu2K5Lx9LzjWqzrITUkxfg9hoV+1c7LqUPLIuH4BGiM6oj2t2Qph5t8Gw
	 Dc+IR31b4F8yPaWSY+Kfor5Vz/b9et41mOQwvxtEJuTYUGE9SjsBjGByP4gZxfcpOkFzw
	 NYHR/NG8phUVw+ig66oVaMLx+n/BVq4AcsyaBuw/uDIEVvEyY8qBq6LX/d4iHNGXR/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fmTxrgAi;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E083606A333
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E083606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fmTxrgAi
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so1386010a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433600; x=1796038400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8dmhSrkGCES4x7Qt63skZcMI+cXFvorwNPaLXIPs1c=;
        b=fmTxrgAi19NlM/nagOSThSEsXx3HQCWjOI3Ino/ZQ/UwhUHpA28uz6ZmnB2pvrWs0o
         ZSVMRB6+YCfPly7Wo25AeqxpiweUpWEuxZUoWFuE0DjpEnmPGYBH+40DRa2srDlV+tcm
         C6B+iCXUVS0nP1ymXEoPny6Z53vKStqyDhh4S2QdGa/LwqGcnLXrEoXDksjMe0Cknewt
         6u9rWqKygaqxm81dWVfR5SAytHLSLCyd64+RVW8yopFYLzEqp+GgznjCoDJHALcy+fQK
         Em39iz7JBojPDdNICBf3YU+bQbpxZHJ4sUamiqVnPz17ITAQWg0mPxCfYOIKMnWSKl/t
         tPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433600; x=1796038400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j8dmhSrkGCES4x7Qt63skZcMI+cXFvorwNPaLXIPs1c=;
        b=t2MZ9/YwKZGYXad84/pS7/DBy+OU0jPuSqHNj9s/BV9mRNwu3Mqiut7iqzr+tq/ijB
         vR1sIJQUtyG/uxHivE6IBuhRqyEaiBhaPDhMUlHJ+BBvqnbYwF6a1pALRY6AWFuBEvW0
         YAVVt/Ut95rG9S8SwKoJuOmzJRbhnKwjtZfiW3k1sO+GTL49j44KFRkXLQWsaRHXRynx
         Em/mcflIbSVuhBhuI7NG+tOufFKWwbC3sc+BuB8orIKMvsypfUq+oH1mMKukUYDsrmfc
         wj8Onw1j/VXvGhgavm/OXUHpuDHs7GESq6iu7sO/cGnNhrlj/lp8YsYEpKhe/rq7NaCK
         fXZA==
X-Forwarded-Encrypted: i=1; AL+hErGkC1YOh7zcnC8TdEE4zC80ZBuCNn4YrrtGOiRoc+P9qpO++TFbOnU4KRNiXloGgIMsSaHtAKwSRKCCUZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z93dJ+lFp5GFYniskKNk7FNRKXI5Tpy2T02wDzWpX6HC+vHQ5PG
	4HKFcEbTypWWTY2UEASnlxQGSSjTTSvvPrPcnbSkdr9SLFpCSyeNmT9F
X-Gm-Gg: AZFdTZd88hlLMqaHagVXIB99/6ZGKN9Uqz4VPm5PFD7JvLLZPwcE1kCc2OnRlwSAsRQ
	4icWAExaDFP61JMOQ0U9NQ6gjKHRyEz+2soG6pRhnq290TjWt55VHcHKEfavYxdFyWoYe3XIUKz
	8waBhXgjVimPIGo/YuYABK5NIHohwgvab4XMlE13cf9+ghDqE75lIBCvXrKL2RPDMzC4p5zBbe+
	1iCj4BJ8wiksNryk2YXHuyGcMdTQDV8o+iszsBHlzJex+CW2VPgomr1bYSwwqMKOLVnyrXEWFJq
	Y3tSrON1yc6APHhJ9Kvb0zIU0F0e515ytMHMvkfL3R0/885KULQ7a4BxEE5ssHjs2shQflgYx6u
	EbXfF26KK5Eg6jEcHb7a4rayBw57znFJjKnSjCwKIfbKHNOXbRn0ENM/3ik0BHskmsOYih7eEOl
	ZFRrwzN5gMTD4jmDPVzrF7n3gaDzXDIu492d7760+makIcKkA+Tq7bAhDQPpFzssWqyQnXNOuHN
	cddQ+P3k1BIvd/aM4gozXsooH1APr+qo0O4nRx8uBdkPtPYut6HEFa2ufvHpbuMPetjPvu59s3V
	9cR6kGuBuHPT0zTBsaho8D2mRPRixdiKWFFNyss53ph1BFVU0A==
X-Received: by 2002:a17:906:ad8:b0:c2e:4397:7c82 with SMTP id a640c23a62f3a-c513a5e6a7fmr686236666b.6.1795433599873;
        Mon, 23 Nov 2026 03:33:19 -0800 (PST)
Received: from lin-mg ([178.226.61.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afca58asm382625566b.65.2026.11.23.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:33:19 -0800 (PST)
From: Maria Garcia <mariagarcia7293@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guy Morand <guy.morand@bytesatwork.ch>,
	=?UTF-8?q?Theo=20L=C3=A9brun?= <theo.lebrun@bootlin.com>,
	Maria Garcia <mariagarcia7293@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpio: pca953x: Fix TCA6418 interrupt handling
Date: Mon, 23 Nov 2026 12:32:34 +0100
Message-ID: <20261123113234.197852-3-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261123113234.197852-1-mariagarcia7293@gmail.com>
References: <20261123113234.197852-1-mariagarcia7293@gmail.com>
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

Unlike standard PCA953x expanders, the TCA6418E has dedicated interrupt
control and status registers:
- GPIO_INT_EN (0x1a..0x1c) to enable or mask per-pin interrupts
- GPIO_INT_LVL (0x26..0x28) to select rising (1) or falling (0) edge
- GPIO_INT_STAT (0x11..0x13) for clear-on-read per-pin status
- INT_STAT (0x02), where GPI_INT (BIT(1)) must be cleared via W1C

Update pca953x_irq_bus_sync_unlock(), pca953x_irq_pending(), and
pca953x_irq_setup() to program and acknowledge these registers. Also
reject IRQ_TYPE_EDGE_BOTH as the hardware only supports a single edge
polarity per pin at a time.

Fixes: 6c99a046edfa ("gpio: pca953x: Add support for TI TCA6418")
Reported-by: Guy Morand <guy.morand@bytesatwork.ch>
Closes: https://lore.kernel.org/linux-gpio/CAFOBSkSHt5nwdqsf=V0esBh23oTkOzy--9-vBQFPBoroGK3-HA@mail.gmail.com/
Tested-by: Guy Morand <guy.morand@bytesatwork.ch>
Signed-off-by: Maria Garcia <mariagarcia7293@gmail.com>
---
 drivers/gpio/gpio-pca953x.c | 79 +++++++++++++++++++++++++++++++------
 1 file changed, 66 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 10a6fbdcb64d..c771ecf65071 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -910,6 +910,12 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 
 		/* Unmask enabled interrupts */
 		pca953x_write_regs(chip, PCAL953X_INT_MASK, irq_mask);
+	} else if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE) {
+		/* 0 = falling edge, 1 = rising edge */
+		pca953x_write_regs(chip, TCA6418_GPIO_INT_LVL, chip->irq_trig_raise);
+
+		/* Unmask enabled interrupts */
+		pca953x_write_regs(chip, TCA6418_GPIO_INT_EN, chip->irq_mask);
 	}
 
 	/* Switch direction to input if needed */
@@ -936,7 +942,15 @@ static int pca953x_irq_set_type(struct irq_data *d, unsigned int type)
 	struct device *dev = &chip->client->dev;
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	if (!(type & IRQ_TYPE_SENSE_MASK)) {
+	/* TCA6418 only supports either rising or falling edge at a time (per pin) */
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE) {
+		if (type != IRQ_TYPE_EDGE_RISING &&
+		    type != IRQ_TYPE_EDGE_FALLING) {
+			dev_err(dev, "irq %d: unsupported type %d\n", d->irq,
+				type);
+			return -EINVAL;
+		}
+	} else if (!(type & IRQ_TYPE_SENSE_MASK)) {
 		dev_err(dev, "irq %d: unsupported type %d\n", d->irq, type);
 		return -EINVAL;
 	}
@@ -1002,6 +1016,28 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 			return false;
 	}
 
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE) {
+		unsigned int stat;
+
+		ret = regmap_read(chip->regmap, TCA6418_INT_STAT, &stat);
+		if (ret || !(stat & TCA6418_INT_STAT_GPI))
+			return false;
+
+		ret = pca953x_read_regs(chip, TCA6418_GPIO_INT_STAT, pending);
+		if (ret)
+			return false;
+
+		/* Clear GPI_INT in INT_STAT */
+		ret = regmap_write(chip->regmap, TCA6418_INT_STAT,
+				   TCA6418_INT_STAT_GPI);
+
+		if (ret)
+			return false;
+
+		bitmap_and(pending, pending, chip->irq_mask, gc->ngpio);
+		return !bitmap_empty(pending, gc->ngpio);
+	}
+
 	ret = pca953x_read_regs(chip, chip->regs->input, cur_stat);
 	if (ret)
 		return false;
@@ -1113,19 +1149,36 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 	if (!(chip->driver_data & PCA_INT))
 		return 0;
 
-	ret = pca953x_read_regs(chip, chip->regs->input, irq_stat);
-	if (ret)
-		return ret;
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE) {
+		/* Ensure all interrupts are masked and stale flags cleared */
+		bitmap_zero(irq_stat, gc->ngpio);
+		ret = pca953x_write_regs(chip, TCA6418_GPIO_INT_EN, irq_stat);
+		if (ret)
+			return ret;
+		ret = pca953x_read_regs(chip, TCA6418_GPIO_INT_STAT, irq_stat);
+		if (ret)
+			return ret;
 
-	/*
-	 * There is no way to know which GPIO line generated the
-	 * interrupt.  We have to rely on the previous read for
-	 * this purpose.
-	 */
-	ret = pca953x_read_regs(chip, chip->regs->direction, reg_direction);
-	if (ret)
-		return ret;
-	bitmap_and(chip->irq_stat, irq_stat, reg_direction, gc->ngpio);
+		/* Clear TCA6418_INT_STAT */
+		ret = regmap_write(chip->regmap, TCA6418_INT_STAT,
+				   TCA6418_INT_STAT_GPI);
+		if (ret)
+			return ret;
+	} else {
+		ret = pca953x_read_regs(chip, chip->regs->input, irq_stat);
+		if (ret)
+			return ret;
+
+		/*
+		 * There is no way to know which GPIO line generated the
+		 * interrupt.  We have to rely on the previous read for
+		 * this purpose.
+		 */
+		ret = pca953x_read_regs(chip, chip->regs->direction, reg_direction);
+		if (ret)
+			return ret;
+		bitmap_and(chip->irq_stat, irq_stat, reg_direction, gc->ngpio);
+	}
 	mutex_init(&chip->irq_lock);
 
 	girq = &chip->gpio_chip.irq;
-- 
2.52.0

