Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705830;
	b=QQGdw7h5nEMQCUGMVlLfM3VgfVtt3cgrSiEwZrGP8kM8vIe/roQ9TleBsRtL73GUUoNQ
	 Ey0Kb/vcFH6MIVKGeydF+MafPr6p3/LMbomjXkC5jUZPPLKBF4QTs/ua1dN+aw/Z23/kw
	 pujzs077/crJi1m4APh7fe+cvY7zE9TVHL+8pY/Zl85QZW/Paf7D4n7/sA4ew7uEe7A4c
	 kmCvR816OQw72bbjqZNCqbSdBun85HUb6R3q3p13fschhpRjTkcl4u071rtpV+1ElvdFv
	 RUSQujHKwwfPgGKQW3kwPcBmEvhUHlZBl5T9qxWmp7CC9HRawaJrxQXexnJDhvEp4pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wmDIQo20uS6O1DnD+oq0Q5d1d/SJjeCFVriKtYROA4w=;
	b=GQ/Fy6PxgqslU56eY1f61CAa7h/+Ed/xj5ZV3GLwGNiKlopnaiTwqwOIS9w5m6IVu0GY
	 C9DSDTtUYXw33TDifU81f0SWBXnqGYUzZlhWVdE0Y58B9HUVnQzoEug7rbtSOdpIVQ+NO
	 NszZ++VjjvCoKLYvfTpfACGuwJQKiVUGhwd99pAxiGvgByvpvqhCD882Y75LpabYt+XVy
	 co39jp1/I+uzzyY/d3oYt3gTiYTWrOxxzkIhyIOWDKcLKJm3sKMzgdre7buUQt/v5hlU7
	 eHkTOZpcJYKOj4rmUGOiF7RhCeg6amMklkOi6k8CYYi5fNiibkrXN3KvJXi/2BUhJXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cs3ohIph;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860A4606A68D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 860A4606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cs3ohIph
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso4091128a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795705829; x=1796310629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wmDIQo20uS6O1DnD+oq0Q5d1d/SJjeCFVriKtYROA4w=;
        b=Cs3ohIpheW2gSgLfy8Ct/Dp2Iugp1WNSOWui5en8x876oqTEtMEI4kUyJG6jIFRtOc
         Esf9cgmDLFmLq1Fa5fk2bH4qmfD0EarnJpza20JXNq2NCJvK+/1NMpx2DduvcjrKfZYY
         WEfR5dAkc4kyXsgBepPDcTqyZQdNGEM4Ex+zTW+1LOUlVXHXLWv6fEcitG2qAvnYKwSc
         +PzAVKdoYTDBggYkeCvz8hxxSfogBBJ0vmxdrWBMtfrtZ+Qhm8eX2YZUzNrtrV/DITci
         AQdoY7bSht5cs0tfknR79PKLbc+G1z2pkHskQdG5iV2gA2arIzYzcSjm3Irn6rgJ2DAu
         IwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705829; x=1796310629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmDIQo20uS6O1DnD+oq0Q5d1d/SJjeCFVriKtYROA4w=;
        b=dkXYlzMGB19/CGCIX19L4/Sw/Apg+ZCm/4GZoV14cfaViFJQal9MnU+U7E08zA/0TI
         4bJ/DkHr4A9tzeXEWbu4r0DGdWKqR0pO2Vlr9LwEJWfBR2dcDO76QWdDItTOA7BuOaCK
         /U/0nIBWeqItZw4Pn8lEKj9VLbp4zXwuCgmuZ0CMCTUh+Y0qnqEsoIxwFpf+m3AbL++S
         S4S1JSGwZzwl51IZb0yb8IsNz/FVIJNtDHMmAP7GxxD5sIAz1P3h+H6sYEoGvMo3BtOA
         nLAITZil5VxjMkkwmCs/ttmVtd+n4Jbr0IsY0ML6LH91M15YYQZtx4SqT6+d7rJJb6HX
         zZ5w==
X-Forwarded-Encrypted: i=1; AL+hErEbVa12Dk1ql5OPdt/1zG8GNwYANAw0bVojeOw9lNdSlKvt668tXAxczy7XI+cE6RD/jSA0V7BdAOCEerE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BscjFAt8sNkbH7oWcM7dnEfNk9/6W8PHfs2gnrM23QUslm3uE
	RcVGJApBKkU0ESxvBmm3ElcOmfcKl3n98NWjF2eIEKhAowc2Z5pBy24d
X-Gm-Gg: AZFdTZcwBML9TpiGZfC4qZ5oHGI7Dq8FbolFxINpdGpR0b1/2TXnp8a+OUE4trlWY4P
	3T32VHSPIw9RAGRDXz8J9kDbmTdt3GI2CNuerbKfolhxB36Jx5zdwU/MvfXVY1zYoVmcEY5npsA
	/A8nYsgZR9JCh9GpNCqwLvmCQwLaoxd1DbWzKzU49xPgqVN1VKTNfM8pesxk8U6vMhZNbQzgVLq
	D5WYJM8KUIRAhGtZCZirKcGIx+v+BzV39vC8LdVzZUBCVH8q97xDfVT4IzoW8UmBwHySLUfCqrR
	VHWCCKbihoWm1PdeNgqCbp8VAGFPo503lLE5xHcwjckyemP+ndAa9i8rAo3VJAGJM4bKlpY2H/J
	9YNC81VBkaeB2pWwI5AbqxcAnBMu4yA/luzg3sXZW1gtoo/ogn12kTWjpC7NS96RQdF/y8LkFXo
	uGRABH7AcnzRvcJc4PLTcIDMmgj8w6XhdqE9piGpNA/4yaIqgdFtoZ/5B6cSP7vJrQv6+t9bM6P
	7fdtxvyj8aaEoTRcsNw5OqqU0Wo3gb3rkPN5sj/D1QXxK39PsmG+2P28ufJk44pXo7IDXgnjd5/
	2vfZkpfizeTjQE+26lNn3AuBTmCf
X-Received: by 2002:a17:90a:d2cf:b0:3b4:d22:8600 with SMTP id 98e67ed59e1d1-3b41c8fe1e2mr18824415a91.18.1795705828955;
        Thu, 26 Nov 2026 07:10:28 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm11099923a12.8.2026.11.26.07.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:10:28 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Thu, 26 Nov 2026 23:09:47 +0800
Subject: [PATCH v3 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD
 GPIO OUT not function mode
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
Message-Id: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-4-81d35c9ba246@gmail.com>
References: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com>
In-Reply-To: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

The CPLD I2C pin mode setting through pinmux-select is not correct.
Should be set UPBOARD_PIN_MODE_FUNCTION on AANT0F04 devices.

Set UPBOARD_PIN_MODE_FUNCTION to 1 to prevent a NULL pointer
dereference error on .modes[i] for any pin group using this setting.

Cc: stable@vger.kernel.org
Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP boards")
Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/pinctrl-upboard.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
index b9af6dd93c34..090316349331 100644
--- a/drivers/pinctrl/pinctrl-upboard.c
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -33,7 +33,7 @@
 #include "pinmux.h"
 
 enum upboard_pin_mode {
-	UPBOARD_PIN_MODE_FUNCTION,
+	UPBOARD_PIN_MODE_FUNCTION = 1,
 	UPBOARD_PIN_MODE_GPIO_IN,
 	UPBOARD_PIN_MODE_GPIO_OUT,
 	UPBOARD_PIN_MODE_DISABLED,
@@ -289,8 +289,8 @@ static const unsigned int upboard_up_adc0_pins[] = {
 
 static const struct upboard_pingroup upboard_up_pin_groups[] = {
 	UPBOARD_PINGROUP("uart1_grp", upboard_up_uart1_pins, &upboard_up_uart1_modes[0]),
-	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, UPBOARD_PIN_MODE_GPIO_OUT),
-	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, UPBOARD_PIN_MODE_GPIO_OUT),
+	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, UPBOARD_PIN_MODE_FUNCTION),
+	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, UPBOARD_PIN_MODE_FUNCTION),
 	UPBOARD_PINGROUP("spi2_grp", upboard_up_spi2_pins, &upboard_up_spi2_modes[0]),
 	UPBOARD_PINGROUP("i2s0_grp", upboard_up_i2s0_pins, &upboard_up_i2s0_modes[0]),
 	UPBOARD_PINGROUP("pwm0_grp", upboard_up_pwm0_pins, UPBOARD_PIN_MODE_GPIO_OUT),

-- 
2.43.0

