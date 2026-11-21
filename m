Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223488;
	b=1NmHUiq3R/XEHLN4v06ERv0dUmRGwe4iMJTY9PGml+yvZrwE04CnkbjzTK4dJIgVStkm
	 TmCSiYP0jFjVrX8f10zuLdNPoUEjNQiNHskRUa1DIGBw6N9z6KSBPLVHavMobbwWDwbE3
	 n8Upna9BllXyWSt2hJFaV5koUu2rq5tsBeImcdaODOUYxmHWG//j0N0mf6klAcUceuO2X
	 d0SPU2UWqXQadZ38A+iuf15kU+hMeSl4CcEN0yY3cOnljZzqTsuzM4LOUbZhf/1MeCMkl
	 xKKhGFfKK1x//4lnZ7CB1st2Mgl9ttPGCUfc+FNDjGvW1+bPkyoolB+uo6A6Nqn5JMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jCsma9jNkefw5HpS61LewWc4mQKxmVwW9euoTiUjDLY=;
	b=GVM7lXqvAfLrPPx03oXoVsoXvFSmOcN6bSmG04emrIeqbkOCPbsoTRfpjlePUJDCyNtP
	 i0cYTvEZ9r0fVCWCZZXZZ1r7pBbvhOqM6ChdOf4b06szD5+TiUFYp4uJfRfSJ6B/s5NpW
	 fPzg41jzQQOZEuRJ/Ea59dq62sV0/t/FITidFmOb6PSV8iCSERF5Rkzfp+3ILYu/CVRXI
	 UtCLeaY9KaYBWe+hqpmgRXcAhFj8nLlQ9zUJTygD6/LbeuqEFMPM2nxiOGthCqEb5wkQA
	 /PAhidHMJtu4oMiLoSA5x7LT20sdq1cf9CXDv3N93p+lgwD9vqI8dZkJujr8J6Yhnkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="luI/6nAO";
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA0060A3816
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA0060A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=luI/6nAO
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-57728d87699so651373b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223486; x=1795828286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCsma9jNkefw5HpS61LewWc4mQKxmVwW9euoTiUjDLY=;
        b=luI/6nAOx+GMAFSJv4JqoZ7Yjv5jSrxg/QM00a6dreIqmuDhVfbO2Gi5M5vS0WA7MV
         FVYX1uG+214mgMjRI6RHU0yZWSVmEm0ci7b0S8q/eTyISaNJbt9Tv0H/C/OoJ+sdFXNB
         zew2ac9YFhk3tIvMCEjSi45nO26RaPPGHxrrLhnJmtJrk/HcYr4oTJ3rQmGUO+o17cOG
         Y+zQ7JEJJFO4dsC8GSg1f65CdEMyzbXhtT35tXNV9SgOzyp3jnmuL3O3L8YkDqZ8gE7b
         YvhYs7mlqrb1DoLnG+GO+BCc6nAvMsnzC/g7qQSjXShkeNiKA8SOXaf6SGi2Y8b+yTTU
         fgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223486; x=1795828286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCsma9jNkefw5HpS61LewWc4mQKxmVwW9euoTiUjDLY=;
        b=dvydBQ4tyQE2jmrsJYiMH6q2ugwqsV19KUtpTGGfY2Z48QCK7qiaFXL/mZ+dRczKzV
         8QLScxWLRpXcpbIveKCtxDaR0RmLAz9QmRw/qEg/TWgvKRDkP1Yr14+0tCX/WBg/wmMl
         svUxOvHXCkyiAe8KDJhftbdYslppf5Qo3wGjnWf0WweJStL8cPgortw3qdnduDi0ea5f
         5qwNtctW6w1d9TtapHwNGPwtPUAi6RG4xqTYvgzADMx9oe6ani6DEP4bIfbH1Thz+/oe
         A4Q+ZOoQe2arrHpbg1nIwRKDeS9KVNSMYMgGhJn5lXMZILg5NSzcfz54l1hPJsCkLQxm
         L1gw==
X-Forwarded-Encrypted: i=1; AL+hErFOXRW7jw24a9qGhK8r7ufC/F5uz+g9VKIK2Smkom2mpEGzgR1uv8va+INeXW5b4slLkhuQvyRommME5/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k/YozTWZGmo6YrsPIZ9tgFz4M06LtWQ5HenX4jPbytrEYFkIZ
	M5BEtsCPIxfELqO5FK+XdRLuFNjn0ns+37kCw2PgTF5jjXLLP7qku58R
X-Gm-Gg: AYBFou3/WNbqueHBVeARXAGG7S/3Qn5l0rQMtFAUHpMbWzd/JMmaARkp9Uk5Wodox3Z
	SnAPCuYGlClFX/DHyulb/9BdYpPzC2hnWRA9OJ0XzkDdfyyCJZSnSp3qZVcsIT0KWhdMB+1Pcf7
	WysOSADiaYhigHmxe7EVVuJ64ewR9x9GHlsMCDkTiwt9SW4psU9oThd9+pQntNY/FkbXaeoEWYw
	1jpOn4AmteheisFfBul7tf0V8s6UW8pxORZv/UwTgqIN6pt7jItjPtLFeSEqxa340BC9enjD/KD
	b6KYKyGvv4DtTCdSUJjDYAfZbTND7CqDklUMDtKZCXntMI5qNLsnKlo6Gvzd+OY5T8hS8kGmE7P
	MAqOmwPpdVY0o6dN9Tbp29Cg78A/6ATndpW3d/F0VqYcNq21k38TjjwBBwtrh4Lw3UK25N8pqNY
	hFWDBgBZSMq/ozo2owLHsFiqCoAWLwzwYkTXrtTFWSzO3uzOTZKhIgL/hrzabIX5FOSHO4uCyWk
	iEVv3+SeRPk4+U4/QegEkPQTz1fYLPHw3xeem4sOvdv8xTXXSQjfl25iZOp4s9fRRWaUaEZW1Gq
	0334yhh8nO0by0PiUrx9e6mKntm+54m1boevdwDqpEhc8kw8EJiFyYSCCb5YVQfM1h0qoHiz2Ev
	+7wQPnAlPrau6YYrO37aRE4xuKjQYdIeWt1Bs99uKMDtNVLlbeQRBcmqX6pzZLap3FKjnKV5m5H
	GOiBk4rz0/cl0WA+HK7+/s7hafjaugQxryWWL4ORxfF4xWpkZitTy+
X-Received: by 2002:a05:6808:6410:b0:574:16ef:89c6 with SMTP id 5614622812f47-57a0ab2e12amr5993188b6e.35.1795223486363;
        Fri, 20 Nov 2026 17:11:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:45 -0700
Subject: [PATCH v11 22/26] mtd: rawnand: sunxi: scan all chips before
 registering MTD devices
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-22-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

On a controller with several NAND chips, I/O to the first chip can
overlap identification of the next one. The driver registers each MTD
device as soon as it has scanned that chip. Normal I/O holds the
controller mutex, but nand_scan_ident() does not: its RESET and READ ID
operations can change the chip select and timings under the active
transfer. The transfer can also interfere with identification.

Scan all chips before registering the first MTD device. Track which
scanned chips have been registered so that a failure in either phase
cleans up every scanned chip and unregisters only published devices.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 73d6cd89ca19..abea2ab0cc42 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -274,6 +274,7 @@ struct sunxi_nfc_timings {
  * @sels: array of CS lines descriptions
  * @user_data_total: protected user bytes in a programmable layout
  * @user_data_step: maximum bytes assigned to each step, zero for a fixed layout
+ * @registered: whether the MTD device has been registered
  */
 struct sunxi_nand_chip {
 	struct list_head node;
@@ -284,6 +285,7 @@ struct sunxi_nand_chip {
 	u32 timing_ctl;
 	u16 user_data_total;
 	u8 user_data_step;
+	bool registered;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -2563,8 +2565,10 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 					      struct sunxi_nand_chip,
 					      node);
 		chip = &sunxi_nand->nand;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
+		if (sunxi_nand->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
 		nand_cleanup(chip);
 		list_del(&sunxi_nand->node);
 	}
@@ -2644,13 +2648,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_register(mtd, NULL, 0);
-	if (ret) {
-		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
-		return ret;
-	}
-
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
@@ -2658,6 +2655,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 {
+	struct sunxi_nand_chip *sunxi_nand;
 	struct device_node *np = dev->of_node;
 	int ret;
 
@@ -2669,6 +2667,18 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 		}
 	}
 
+	/* NAND identification must finish before MTD users can access the NFC. */
+	list_for_each_entry(sunxi_nand, &nfc->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&sunxi_nand->nand), NULL, 0);
+		if (ret) {
+			dev_err(dev, "failed to register mtd device: %d\n", ret);
+			sunxi_nand_chips_cleanup(nfc);
+			return ret;
+		}
+
+		sunxi_nand->registered = true;
+	}
+
 	return 0;
 }
 

-- 
2.53.0

