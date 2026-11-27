Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776067;
	b=ijEOJN4ZuqFQyix9Lne4PJRlWYJtBPucJb54xP58Imj73Q56JdxdGXD9DKokrfecWlEF
	 dyTmLMw4cUjDyr+M5IMCASAfm+TFArTLXoHWt0sDzPm44/t4DrWJ4ZUnS5PBoyuvXks3I
	 f8iktUZo0OrFqM9ZG3OBY+d4RgTq7XGOgyO92DI2rdUJgztV75HTlkXscxaDyIuUGcQ14
	 J08ivNOFrgjC/OKxsXmTqfCw720OPgHkM+apnuA0n/Ut/L/lbb3QgKDuJnl7ZjxAfdQRn
	 iQbNPyc3NXK9dSfSR8S0JxDn7KuKbCNGCRkepSOa2ViwQ9uy6t6Uyybh6RsF26VHxnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=v4a+pdVtUe1EJJdubOOaKfns4F8nxWcG7WQWMntGcGE=;
	b=XSjImyn7eQITnab2JndvvESGAgPQevGigwU1WbF2oedas+Y5ePQ/OB8YY1xFfMbObAzq
	 agnhw75sdaOv9XR26vthAbAizxCJUQ5w2CKcborezbjgISYfXjD9tx2wL6amzO086HvWt
	 R/K6DtgpbSa7KJXf8TDT8umyUBTd6adjBr4wdtip+ibO9xVXILXlunEQeChiLpLwRu/AK
	 jIO1RKiHi2hd6+Ll/FXT4jytfpexd8ZD42u27dqGmH+3p4bqko9D1TKuH9SZL+LXtMNqp
	 d/jKxqrURAH1bZ3l8Ht+hDxVt2+ypEUDHyhlmlOn1TvlJWzySYFQNxBuOJDj/Bbfp0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=1ipxtVqT;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566CD606A693
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 566CD606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=1ipxtVqT
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e3b22e971so4180540f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795776066; x=1796380866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4a+pdVtUe1EJJdubOOaKfns4F8nxWcG7WQWMntGcGE=;
        b=1ipxtVqTLi8aXXC7ZvgcyaYiJaJogM1Ec9e6X4zxuekg+R90tVBVjEIIvJoEw0IqAG
         AWOlMD5sEKagJZbc+kEkAYv3m4ge17q4G0v2UUfioCE78dMp7pfVZqmBW8+lTVorx5po
         T4jrBEgXs/UhlaxDNkEz+VRj2EO9xfzthq3ecYxq01IAzc8OFj32lZnUpZIXWR9IVl/q
         u+/o9Pb7b8r3BY33Vn29eLZEypniihPkacBdGjYMNbgmqInk620W+wMxTkhysGB2t1t7
         R5AsHNhO1wr6ZjWs/ZjscWCj6urXUwiWVxW5aK0l1R++h8gvTxHSpfMmWmxSYFe5TwOz
         aMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776066; x=1796380866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4a+pdVtUe1EJJdubOOaKfns4F8nxWcG7WQWMntGcGE=;
        b=YDvhXyTzVXLQWi9MKz4QFLrZmkWZ1YjQwzFmEsPFi8USCVYAoYrz5VbBq71Ls6f9ny
         pCHsQwbOB8njjU4DewUnc4jJr3ho6IHzmYjiNqmvyi+QdVG0IO9Ny35Qh03Wfk/VD9nC
         l3VAsO15iU2glDLvuLD4GUXdN9kDNU+uOPatdn9g3YiQRCgRVom6dfFvBnnOgyQmLTRe
         HZnq4VACQ27ndFfIC4APk+8Udg9Cppo23phuPk9sDGU6IW0Tg0YaOikMmGU9rCQVeZSh
         QqB4sa/LaDGAC4ci+Kk+dATVyw6XZd/ahMrffzQPHcfNAQ0GL6iASbNct55uEEhLgT+3
         PiRA==
X-Forwarded-Encrypted: i=1; AL+hErE8YPD2qgjzyOdQnIv+gqfOXSKIZzoL8CbcVPGF9tGSH1JomXSU5SUBxdMl/gGtDsyyzxRTGx+57RaAEs0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f5FtgOkG9mxgOdYd9zLbqhwJo4x7IM0tUCr4HnhWYtXBN4C/I
	MYV1CjMyGzEKhLl61vi7r5nATYHAmK4hRGiLnFFFHrzwhSGrJQSWNK004NaeTPaDpkg=
X-Gm-Gg: AZFdTZcXhJQSanj4xO+FlY0l3/ZNvRihp3C2FMuMl6nB63TFhGYw2f2L1AL71LTy88Y
	+mTwv/iSNX/25lBekdN0q0Tee6sZCM6/CMTB3kJ/RFMY+xyxf7QwxfGh35qaE2Ob4FhTo8fG+ko
	ybmajuwG5MyvErXL2pluL1LrHt29sKnHoz4JhGBQmgRaX6XrIdXfcLMgtMpjRJiTK8xHelJ8Mj2
	WGA1963vBMOawsqHbSszdapDyB/xDl5vuNXECtMyVs1L7SDo5aog6CoXAQQc5s2hziTC35v4zuN
	YWazoK4YSBDGhFG0w27NTIKt2ze32gYYvXJrMR0/7tJKQ/ePX17QaePbbx856tD+WK3//qiWPU4
	otwNdgImA5Gcf2W9wpHY+3+K1TMi+Fg4j8xFmc/MDDNWog2NkOftcMQPOTGEaOEBzFK1PQtiybE
	nzl2OwbBVnsu4oI2guke9vGJIoe1o27bu9Yd/t09X123bQDPGBsKeUkwIp5RbFhri/oBFN7I2Aw
	Z26dy+fwWKGCMKo6sQ9xYHse/K31jJg/JgALndKFQw5pzWHdMPMmKkXWmG4Iysvs4a/1/YH2xXc
	nYpq/9c0c3pgfHuSwCHxcMHkVVSLE2U6fi5ffFF/U0vMnMFfFSDeTQvpBhNFRU6e/W7kUG1FYlx
	Um4ekhCMw
X-Received: by 2002:a05:6000:2503:b0:4b7:8178:f7ea with SMTP id ffacd0b85a97d-4b78178f825mr23002295f8f.51.1795776065640;
        Fri, 27 Nov 2026 02:41:05 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm45597649f8f.32.2026.11.27.02.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:41:05 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 27 Nov 2026 14:40:49 +0400
Subject: [PATCH v2 4/6] usb: typec: fusb302: Handle interrupts in the IRQ
 thread
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
Message-Id: <20261127-fusb302-getsourcecap-v2-4-6770eb1e7945@flipper.net>
References: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
In-Reply-To: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao@google.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6105; i=alchark@flipper.net;
 h=from:subject:message-id; bh=kTIPW2yAFNq3399UJRyEGQQJQ5Ot4JrKKJTWUyt7UvY=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRzxpkx56cU58Ux7cg9c23RskXlTEI34j6femrz6dZPM
 YU32XOmdExkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV17QY/optnctQtbZrwu4yFWaX09O+Pet7YDUncWdBrF7xjRUPtC0Y/hkV3+u
 fOzd5nU1fvmIk6+6cb+HPeB6k5xhc/vwsa8c1cyYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The threaded IRQ handler only disables the IRQ and queues irq_work, which
then does all the handling. The extra hop costs a context switch, and
leaves the handling at normal priority behind whatever else shares the
system workqueue.

Handle the interrupt in the IRQ thread instead, as suggested in review of
the switch to a threaded handler [1]. IRQF_ONESHOT keeps the line masked
meanwhile. Before resume, the I2C adapter may still be suspended: disable
the IRQ then, and have resume handle it before enabling it again, so that
nothing handles it twice at once and it stays a wakeup source. Make
irq_lock a mutex for that, as disabling an IRQ behind an I2C GPIO
expander may sleep.

Verified both at runtime and across suspend on a Rockchip RK3576 board.

Link: https://lore.kernel.org/r/20260312120418.99U0NPWL@linutronix.de [1]
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c | 82 +++++++++++++++++++++-------------------
 1 file changed, 43 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 5cf1b78e7669..aa0e4dbe31db 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -87,9 +87,13 @@ struct fusb302_chip {
 
 	struct regulator *vbus;
 
-	spinlock_t irq_lock;
-	struct work_struct irq_work;
+	/*
+	 * A mutex, as disabling an IRQ behind an I2C GPIO expander, which
+	 * fusb302_irq_intn() does under it, may sleep
+	 */
+	struct mutex irq_lock;
 	bool irq_suspended;
+	/* The IRQ came before resume, which handles it and enables it again */
 	bool irq_while_suspended;
 	struct gpio_desc *gpio_int_n;
 	int gpio_int_n_irq;
@@ -1943,24 +1947,6 @@ static int fusb302_pd_rx_start(struct fusb302_chip *chip)
 	return ret;
 }
 
-static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
-{
-	struct fusb302_chip *chip = dev_id;
-	unsigned long flags;
-
-	/* Disable our level triggered IRQ until our irq_work has cleared it */
-	disable_irq_nosync(chip->gpio_int_n_irq);
-
-	spin_lock_irqsave(&chip->irq_lock, flags);
-	if (chip->irq_suspended)
-		chip->irq_while_suspended = true;
-	else
-		schedule_work(&chip->irq_work);
-	spin_unlock_irqrestore(&chip->irq_lock, flags);
-
-	return IRQ_HANDLED;
-}
-
 /*
  * Reading an interrupt register clears its flags in the chip, so keep them
  * pending until handled: a bus error on a later read would otherwise lose
@@ -1998,10 +1984,8 @@ static int fusb302_read_interrupts(struct fusb302_chip *chip, u8 *status0)
 	return ret;
 }
 
-static void fusb302_irq_work(struct work_struct *work)
+static void fusb302_irq_handle(struct fusb302_chip *chip)
 {
-	struct fusb302_chip *chip = container_of(work, struct fusb302_chip,
-						 irq_work);
 	int ret = 0;
 	u8 interrupt;
 	u8 interrupta;
@@ -2128,7 +2112,26 @@ static void fusb302_irq_work(struct work_struct *work)
 	}
 done:
 	mutex_unlock(&chip->lock);
-	enable_irq(chip->gpio_int_n_irq);
+}
+
+static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
+{
+	struct fusb302_chip *chip = dev_id;
+
+	mutex_lock(&chip->irq_lock);
+	if (chip->irq_suspended) {
+		/* Only once, as resume enables it once */
+		if (!chip->irq_while_suspended)
+			disable_irq_nosync(chip->gpio_int_n_irq);
+		chip->irq_while_suspended = true;
+		mutex_unlock(&chip->irq_lock);
+		return IRQ_HANDLED;
+	}
+	mutex_unlock(&chip->irq_lock);
+
+	fusb302_irq_handle(chip);
+
+	return IRQ_HANDLED;
 }
 
 static int init_gpio(struct fusb302_chip *chip)
@@ -2226,8 +2229,7 @@ static int fusb302_probe(struct i2c_client *client)
 	if (!chip->wq)
 		return -ENOMEM;
 
-	spin_lock_init(&chip->irq_lock);
-	INIT_WORK(&chip->irq_work, fusb302_irq_work);
+	mutex_init(&chip->irq_lock);
 	INIT_DELAYED_WORK(&chip->bc_lvl_handler, fusb302_bc_lvl_handler_work);
 	INIT_DELAYED_WORK(&chip->rx_recheck, fusb302_pd_rx_recheck_work);
 	init_tcpc_dev(&chip->tcpc_dev);
@@ -2294,7 +2296,6 @@ static void fusb302_remove(struct i2c_client *client)
 
 	disable_irq_wake(chip->gpio_int_n_irq);
 	free_irq(chip->gpio_int_n_irq, chip);
-	cancel_work_sync(&chip->irq_work);
 	cancel_delayed_work_sync(&chip->bc_lvl_handler);
 	cancel_delayed_work_sync(&chip->rx_recheck);
 	tcpm_unregister_port(chip->tcpm_port);
@@ -2306,14 +2307,13 @@ static void fusb302_remove(struct i2c_client *client)
 static int fusb302_pm_suspend(struct device *dev)
 {
 	struct fusb302_chip *chip = dev->driver_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->irq_lock, flags);
+	mutex_lock(&chip->irq_lock);
 	chip->irq_suspended = true;
-	spin_unlock_irqrestore(&chip->irq_lock, flags);
+	mutex_unlock(&chip->irq_lock);
 
-	/* Make sure any pending irq_work is finished before the bus suspends */
-	flush_work(&chip->irq_work);
+	/* Let an IRQ being handled finish before the bus suspends */
+	synchronize_irq(chip->gpio_int_n_irq);
 	/* No RX FIFO recheck may run until the bus is back either */
 	cancel_delayed_work_sync(&chip->rx_recheck);
 	return 0;
@@ -2322,15 +2322,19 @@ static int fusb302_pm_suspend(struct device *dev)
 static int fusb302_pm_resume(struct device *dev)
 {
 	struct fusb302_chip *chip = dev->driver_data;
-	unsigned long flags;
+	bool pending;
 
-	spin_lock_irqsave(&chip->irq_lock, flags);
-	if (chip->irq_while_suspended) {
-		schedule_work(&chip->irq_work);
-		chip->irq_while_suspended = false;
-	}
+	mutex_lock(&chip->irq_lock);
+	pending = chip->irq_while_suspended;
+	chip->irq_while_suspended = false;
 	chip->irq_suspended = false;
-	spin_unlock_irqrestore(&chip->irq_lock, flags);
+	mutex_unlock(&chip->irq_lock);
+
+	/* The IRQ stays disabled until then, so nothing else handles it */
+	if (pending) {
+		fusb302_irq_handle(chip);
+		enable_irq(chip->gpio_int_n_irq);
+	}
 
 	/* Look at the RX FIFO again, in case suspend cut a recheck short */
 	mutex_lock(&chip->lock);

-- 
2.56.0

