Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540283;
	b=W4zH86wfLWdPXYdiytR/mtSMw5a22PwBVOTkDLREZ6Nrhh7EhBBASxb5qiVPKcMp4fYI
	 HDfgw6CA6FR4o+TkE1KaI83cM/hLl8Lf+ktTvM1+3mn7VXxIfadS0Tr87jxWVjhMioEqT
	 C6Sk6b1/Sivi2oQvSt9Woe8KGwJuKVzImlo2l3Y5uDAPRCjjJ2HOFTFoC4r+rD8VdE1EQ
	 U70IjnShmY+4uN9BsYAUZ+SwpW0KgWP5nUozRpFriLpSAgPU360lRlQSE8i8VFAlhnsmP
	 0l4iRamgN/G2tSOphTwt+tQvHHjgnaWVg7QeZ1/l4eJsY6hTYDvkD0ljNIREDPcvpNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ihyCWaQSe8/33b641CrQpm2QKnFFCoRtHpVnDp2/vYU=;
	b=HIsh16cLC7fJPd37JQUw+AcPIE12m23Xlff1iEOzMfSHZio1R6YkTq2BlxuVCHKVuWRD
	 /mal6D3j0TCf1ys/V9UNMiMo5nNInV46brL0u/F+q7eAZTCdnTJrqFBFfNOno+W/LI+gr
	 4ijobdJSqNi1EbhTHovhNFqeOKlACv3cbTK7LzVglRyVUMPHBgvcF+/RdvASvThweoKyP
	 tnb9EBPWKw+EbLcvZHvJCXsHj9tRylVsZU7RO0RAo2qf2Acz5pzll+bbXZOoHQBJYHC9M
	 lp05wZizSymPFJI1nCXq9PBfuqmCeLqyAZ+gH3e/P3NSikSuU4aHd07PQ2sO3K3n8sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BBDdQ4yK;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7517C606E173
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7517C606E173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BBDdQ4yK
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-862b9c2e78aso2716767a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540281; x=1796145081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihyCWaQSe8/33b641CrQpm2QKnFFCoRtHpVnDp2/vYU=;
        b=BBDdQ4yKiLrdEPoB2VIEm+j5xGV+HluV5UB68gIn4K71QRvfEsiffrRLn+oaI2uqHV
         ZDCLZkw3lCe35+bDvylrY02CWuEE/Xth0fSoD9yCWHUwh/TTr0I+liEAX2gF0OS3/LKh
         qdIA4VDFDC0AlcuvFXZ3Xht63Lz9hkLeAeN/mdKW8CjZa41TE4zJn91no7s2rQNU75MW
         7RB+be4tLJqNry9t8pDKmtVOAVYpjTim/DS16KBe3aBPg8R1kc8FI9vFuIrH177YLSDm
         hPMXLHP440qxmAYOWGdZ0iqDaP2jFkid/lPxVxNt8ZeYyjQ/y+fzP0ewFed3Q8mkhXnm
         kFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540281; x=1796145081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihyCWaQSe8/33b641CrQpm2QKnFFCoRtHpVnDp2/vYU=;
        b=ZI3aGccULVyUeESUj4LTJKkZp33729J8JcLwqsQFkcjtVP06zVSK/feDPzM8e1hPCo
         th0blSbftE2Ze6ttsLxwq5ZYui6/x5qfKXYx1XeHkN/LSXJQac0j74tMX/o1vRbuXEN7
         Rm6somEMYga8VUHdMuAeQeQPYOob7SK8PnBQo8HU3rNFTszZNK2SO90WR4LRd2K21mpG
         RerSdV/WjxYrlLqm+azJE76DXnTlubJRaFsMq47V78e3gpW0ZKLsnOPHrIgRaRbMcCFH
         +dHPndhgvEDDe6md+LA4xuJChHx46ToNjqrYnVjlc2TnaHeBUq6MFTuRB3iPf9Jpjcn/
         h5Vw==
X-Forwarded-Encrypted: i=1; AL+hErGDiVzKn4/9SUTDn7H9TVotAXfC64tgVdk181BJlC8w2afTiB701Bw7nAzv20Nj2O+efLLYARVD45qSS7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2pfNBTeqJz+lHiVY60wCLV1eeZ56QO8AMxVOsyGykw78IjugN
	iIy8lwMiwuOr9WtjOI5uA2QV3ojmZxyXSoZ4kVWPZqwZ3s+VnzPg5rr8
X-Gm-Gg: AZFdTZd09fLwrKF4UXVbfveCWJ8NCIDnLhgp1bTO/VMmOiNuK2Klx5EMge+01WUW2RE
	Wx0mQIkVdNfAjbJCZvq6FSIvqodf2l7ZE0Fm4Quz/MEofs0Kp3hVlG+7I0jvHzkM8Qtht80N6yh
	gKyHLBlM/+XY9qD/VchOdCBXgVttm3Aw2Z0KaglFZdQubTJjnVtvouojBZzJNchJvNqdOSs/JD+
	RBTvR28ORGTLXR7v7XJOwE9ZnL+2V4q//vdGKxO1g1V+vbAjnDwBt1rqbyo6qkCjY0M4d8hBGvS
	MyLngM5bLyzXjgAKPNnKKD/D48t4pL+aZgEYe+ypcbclhGnHwofdXpENp84S+uZIsK31RO0oVL/
	KOb/v4Cha4zeW4HSgw9WYupt1jr9Z/DgP48U4wnN7sW3D9yqdeauNZj1sfRm+rrF/LEVjjrzwWk
	E/UQuIZn6KVkklkqtlXRR4n6R/NiR8VkYQydlhsBBwC2rGUCe/lfiX0gTUS50LSSuMM34eqzj2s
	J4beP3RJUq+EH/P1bY1qzf4VMkN5HFHME1Yn/tE3C199bF7g5Qi8wJ1aNfTRZiTu04EFpF8jGce
	X0nh51ok/nxsTecPyARCXTRf7IkM+w==
X-Received: by 2002:a05:6830:903:b0:862:a48e:24c8 with SMTP id 46e09a7af769-86315944a86mr23180037a34.14.1795540281281;
        Tue, 24 Nov 2026 09:11:21 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6besm11131021a34.11.2026.11.24.09.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:11:20 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Wed, 25 Nov 2026 01:10:38 +0800
Subject: [PATCH v2 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD
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
Message-Id: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-4-c8079f8f569f@gmail.com>
References: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
In-Reply-To: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
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

CC: stable@vger.kernel.org
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

