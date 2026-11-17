Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945924;
	b=L/mG1RAKECU20f3nz8E8YZ/sXpitA0CWsTA9ISyKcjxAQXRQeGHPCAdkr1FrL6zT5HCn
	 VjCwgVDLCAgd25gJ6xH+FpNI8g6SgSdQM1Ovzl1aIIfcxk9Q1Wo61Jl6iphzK2SCHRWer
	 uqJ29flBsgQarSMn3qCdbKRnkId/p8fcZOerFFWIqfd/GrVMxk/o/qNf3urNUePsDPAXM
	 mob/kDHUexft2lEHN6x+Bo6334qrSZDokusrytgY1F85ty64ZYBpDche3rp18mwcXT2Lg
	 G2/9yp84vGKqf5dmBFk6pvuv87cp+Qcux/KGneSkkrm1X1M2Wwh/6mHjDitelhbvS+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F4uXxJokLeEK2Ei4CenpFZ/AW+5FOpcgkJGIO2nPRlY=;
	b=zCbFChj24cxeudEc//14R7md8viMb373V9hJL7gqnj8JnEhiwzeOr5vOlayLnBi3bfEU
	 x+NcabLTKaTVyZffyylCO3Qpl0LIGppbP2UQshQ5dOmMLOP9TlV0uto45E0H56OP1+iEH
	 A8wr1ioDxEQ/G3+mYIMHe/Z2eCTB4PkRqE3SvAZxBrKwbKRL2UhmJBBI6Au6yxb3UTqb6
	 AcIigcPYYPwaevlfNY27O7717VayHjGB3JfxKYh/Jcj+Oy2CAKzxEmtG+v0pX/g4Na9QB
	 EL/nKbQOq4IQg9Gt0+qOCvlVsgphaP4DRCEayKbbDCE6B1jwmNHMazavlbUQGn36gnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnVZ8soi;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E11606C70E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1E11606C70E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnVZ8soi
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491971ac844so148992f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794945922; x=1795550722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F4uXxJokLeEK2Ei4CenpFZ/AW+5FOpcgkJGIO2nPRlY=;
        b=cnVZ8soiaMC68w3xaXt7hxACf295vu4LUFyBx5IHqKhXUO78ZqV6xWjnSubsdr3KSB
         ekFoJa4dZDSEbQzYp3JLhoiPoLtfuR27Zf4IdAiQsfP2capDCYVi/i2Z6/IomVwMYAXC
         xM/M3yo/DCcExZg5rDrMDauNVzbEm8zmCQ4edQq+Dle2bRk3VHBTyIJw7Lsfn5HFVeH9
         Zaa7OPjyogaYgJinHjluak0k9IrI+Zv6VAUvGiVEJLsthcBi58qwutZtBmcRsvex+Hli
         yOlZMolCnZ3Ib6lMvsbGeMkEorRrrPrCNxywqz+a51GUuiLKhdCZ45l6e10JivZqRjKM
         tq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945922; x=1795550722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F4uXxJokLeEK2Ei4CenpFZ/AW+5FOpcgkJGIO2nPRlY=;
        b=0cFXzTEsjsP8Gq4dqyge9Beu/tBHdhLLOuNH6U/1nFyatmC99q49wvD7qmjTM3oP/i
         iXyq/vw4fgVlgl+KcXlogsxBl6oy1FUgy9PXcP6Z4AJEvhe7Z+GbxfgDrGHmd6sW8qox
         xEtjwIreH0Wqgi+stavTkdj4gnwDytdr5C4hqO0mW3FxQAbP3UCVEp7cBVE6bpPZIr7j
         +SYdAYinlj6NNjqBaE6sTey9JOVRL2hcjHmZLzj3ya7X1y3x+W8a/Eg47Ey8Q47YXDUK
         6dWgFDT5KP+yR2safcWnL5CsyIuttrws2w5jKID1L73b5GqeiM7I/5kuTkYXOK0qt/75
         hbpA==
X-Forwarded-Encrypted: i=1; AL+hErFJ6AT53Yw0KgnT7KVU18JcYJCi5JZNoXcs9aM26TmP4OwXmWGaj3coYlt4DuwKG7jWzjzQRfUjEY3Bdg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9E7lAvWSsa2LgkEHo+K/jmNZUIpBGxl12IpLtorUp/g3q3oeFZ
	Ub7HsdagknV/wD/KnenxthgFj6CSbBup9pIksDWx4zjB+5Rw6BM56uci
X-Gm-Gg: AZFdTZfBUdLxnz87qbCvykLxtP/3Jiq6oe1DMb9UP7525yWOilC/c/LtIx3Hl5LCsHm
	ftvG0XNTBZXDhrfFalapIzSPJ+7wl8n5rLlKQMkiJ/lggXLGrGGgDafogJOsmoQoLiAl1IRVXY2
	tnVwe0BLaqKSWUtFITT/C/0owfVxk5iMZ9aE/yBUnhC8CLTjl8T0B5198SnJ4L36prS0t5KlaV5
	lgT+133GbUJQuXayxdPTJoIXEnhVzDY6L1fbtDVVlVzYkNwaMERGv0HHM0A8+nbUQN1GGRmsX4w
	XlqupdcNvXDwnYbjqhL3d3NADibQO3waYni8MF9YghvlbmrKmf8ipd+lb3SLCGwryYZ0MGVHn9e
	V+O/IfmMyvMdYPMlB61in/LWzwd5RaW+BhgmiIdYVHUj3xEAtac3OeNiVwmnlZTeXQExKf9rfS1
	P8ftogymeLTTth4C/zJX/p43kcQWI0q67hE1xY0BVXCXuUK6q841MdS3JnKBsfxx92B0JWLp94L
	Pr71ZllPXii3FNl4oC+R95bx23apdiOOq8lGG1YdtzsXFecbemZ1vaMZ/kXfrarUz1HX/EsUIkp
	spULd6Rify6tvaVY/f8NSapBGkvP
X-Received: by 2002:a05:6000:2990:10b0:48e:870:7791 with SMTP id ffacd0b85a97d-4a63ac6b6b0mr839568f8f.26.1794945921835;
        Tue, 17 Nov 2026 12:05:21 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm625528f8f.0.2026.11.17.12.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:05:21 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v4 09/16] HID: ft260: group sysfs attrs per HID interface
Date: Tue, 17 Nov 2026 22:04:15 +0200
Message-ID: <20261117200423.19561-10-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117200423.19561-1-michael.zaidman@gmail.com>
References: <20261117200423.19561-1-michael.zaidman@gmail.com>
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

Split the single sysfs attribute group into per-interface groups based
on chip mode (DCNF0/DCNF1):

- I2C-only (mode 1): I2C and GPIO attributes on the I2C HID interface
- Dual mode (0/3): hid_over_i2c_en, i2c_reset and clock on the I2C
  interface; GPIO and UART attrs on the UART interface
- UART-only (mode 2): GPIO and UART attrs on the UART interface

i2c_enable is GPIO-related too: it switches GPIO0 and GPIO1 between I2C
and GPIO, and its store updates gpio_en of its own interface. So it is
on the interface with the gpiochip, the UART interface in modes 0 and 3.

i2c_reset is an I2C attribute, so it is only on the I2C interface and
not in the UART group, which holds the GPIO and UART attributes.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>

---
v2:
Fixes for the issues reported by Sashiko:
- The i2c_enable attribute was missing in modes 0 and 3; it is now in
  the UART group, with the gpiochip.
- The i2c_reset attribute, an I2C attribute, is no longer in the UART
  group.

v3:
The err_register_tty path, which patch 3 adds to ft260_uart_probe(),
removes the UART attribute group of this patch.
---
 drivers/hid/hid-ft260.c | 63 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index eeaf8179adcc..e34780c62522 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -1633,7 +1633,7 @@ static ssize_t i2c_reset_store(struct device *kdev,
 }
 static DEVICE_ATTR_WO(i2c_reset);
 
-static const struct attribute_group ft260_attr_group = {
+static const struct attribute_group ft260_i2c_chip_mode_1_attr_group = {
 	.attrs = (struct attribute *[]) {
 		  &dev_attr_chip_mode.attr,
 		  &dev_attr_pwren_status.attr,
@@ -1644,8 +1644,6 @@ static const struct attribute_group ft260_attr_group = {
 		  &dev_attr_gpio2_func.attr,
 		  &dev_attr_gpioa_func.attr,
 		  &dev_attr_gpiog_func.attr,
-		  &dev_attr_uart_mode.attr,
-		  &dev_attr_uart_dcd_ri.attr,
 		  &dev_attr_clock_ctl.attr,
 		  &dev_attr_i2c_reset.attr,
 		  &dev_attr_clock.attr,
@@ -1653,6 +1651,32 @@ static const struct attribute_group ft260_attr_group = {
 	}
 };
 
+static const struct attribute_group ft260_i2c_chip_mode_0_3_attr_group = {
+	.attrs = (struct attribute *[]) {
+		  &dev_attr_hid_over_i2c_en.attr,
+		  &dev_attr_i2c_reset.attr,
+		  &dev_attr_clock.attr,
+		  NULL
+	}
+};
+
+static const struct attribute_group ft260_uart_chip_mode_0_2_3_attr_group = {
+	.attrs = (struct attribute *[]) {
+		  &dev_attr_chip_mode.attr,
+		  &dev_attr_pwren_status.attr,
+		  &dev_attr_suspend_status.attr,
+		  &dev_attr_power_saving_en.attr,
+		  &dev_attr_i2c_enable.attr,
+		  &dev_attr_gpio2_func.attr,
+		  &dev_attr_gpioa_func.attr,
+		  &dev_attr_gpiog_func.attr,
+		  &dev_attr_uart_mode.attr,
+		  &dev_attr_uart_dcd_ri.attr,
+		  &dev_attr_clock_ctl.attr,
+		  NULL
+	}
+};
+
 static DEFINE_MUTEX(ft260_uart_list_lock);
 static LIST_HEAD(ft260_uart_device_list);
 
@@ -2372,11 +2396,20 @@ static int ft260_i2c_probe(struct ft260_device *dev,
 		if (ret)
 			goto err_i2c_free;
 
-		ret = sysfs_create_group(&hdev->dev.kobj, &ft260_attr_group);
+		ret = sysfs_create_group(&hdev->dev.kobj,
+					 &ft260_i2c_chip_mode_1_attr_group);
 		if (ret < 0) {
 			hid_err(hdev, "failed to create sysfs attrs\n");
 			goto err_gpio_remove;
 		}
+	} else if (cfg->chip_mode == FT260_MODE_ALL ||
+		   cfg->chip_mode == FT260_MODE_BOTH) {
+		ret = sysfs_create_group(&hdev->dev.kobj,
+					 &ft260_i2c_chip_mode_0_3_attr_group);
+		if (ret < 0) {
+			hid_err(hdev, "failed to create sysfs attrs\n");
+			goto err_i2c_free;
+		}
 	}
 
 	return 0;
@@ -2432,12 +2465,14 @@ static int ft260_uart_probe(struct ft260_device *dev,
 	cfg->uart_mode = FT260_UART_CFG_FLOW_CTRL_NONE;
 
 	if (dev->chip_mode & FT260_MODE_UART ||
-	    dev->chip_mode == FT260_MODE_ALL) {
+	    dev->chip_mode == FT260_MODE_ALL ||
+	    dev->chip_mode == FT260_MODE_BOTH) {
 		ret = ft260_gpio_init(dev, cfg);
 		if (ret)
 			goto err_hid_report;
 
-		ret = sysfs_create_group(&hdev->dev.kobj, &ft260_attr_group);
+		ret = sysfs_create_group(&hdev->dev.kobj,
+					 &ft260_uart_chip_mode_0_2_3_attr_group);
 		if (ret < 0) {
 			hid_err(hdev, "failed to create sysfs attrs\n");
 			goto err_gpio_remove;
@@ -2460,7 +2495,8 @@ static int ft260_uart_probe(struct ft260_device *dev,
 
 err_register_tty:
 	if (dev->gc.parent)
-		sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
+		sysfs_remove_group(&hdev->dev.kobj,
+				   &ft260_uart_chip_mode_0_2_3_attr_group);
 err_gpio_remove:
 	if (dev->gc.parent)
 		gpiochip_remove(&dev->gc);
@@ -2569,11 +2605,18 @@ static void ft260_remove(struct hid_device *hdev)
 					   dev->index);
 		ft260_uart_port_remove(dev);
 		if (dev->chip_mode & FT260_MODE_UART ||
-		    dev->chip_mode == FT260_MODE_ALL)
-			sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
+		    dev->chip_mode == FT260_MODE_ALL ||
+		    dev->chip_mode == FT260_MODE_BOTH)
+			sysfs_remove_group(&hdev->dev.kobj,
+					   &ft260_uart_chip_mode_0_2_3_attr_group);
 	} else {
 		if (dev->chip_mode == FT260_MODE_I2C)
-			sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
+			sysfs_remove_group(&hdev->dev.kobj,
+					   &ft260_i2c_chip_mode_1_attr_group);
+		else if (dev->chip_mode == FT260_MODE_ALL ||
+			 dev->chip_mode == FT260_MODE_BOTH)
+			sysfs_remove_group(&hdev->dev.kobj,
+					   &ft260_i2c_chip_mode_0_3_attr_group);
 		i2c_del_adapter(&dev->adap);
 	}
 
-- 
2.43.0

