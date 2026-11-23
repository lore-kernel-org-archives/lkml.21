Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447012;
	b=kNKmeSTdcQpvfHuR5kc0CjU5VtVzICYjUZXqGF1sFwzFW5XnT03LAGrLw//6dfR3615I
	 kWkH5nUh6Mzi2376qjrPatb7QL5SohXGBMK8w0NqTsIJNSXgaJ+H/LrME6Nktl/uz5Dhw
	 UnsNKTosYBXQTwF77upb0M9qOoFw69R2quSGoqOPxSpGHqA6NeoMFaPes5r0jEwyvM7kC
	 k/jqFWT4/3s54YGeiqTEvzngSB1BnuWgvRG6J7rvdgf9jFVKMjykSlKOta/okZRy1YG6w
	 mQZ3pfe61Qztb0Q4LJMId5pRk4icETbCIQQ/Ro35oKs3B+GgNJcg1kZ51MfcOh1hG0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=x8zS9sQC2qzaVvAkqUIvrNo7w3mYFINi27bRT22YfmY=;
	b=qP6/k5OHvFewEnRoG6F+zsBoKK5SjU9Xuja+JU9JakBleuijoLZDd1tCQ8uUtur9Cs2S
	 M7wFpT0MlVUUAHS19GEYAYk0kVPyxT13GZMdrQk7gsQOAXf49XggpLFnvyZl0nDr9F8Hq
	 9EaqeA+72Y4M67xZzSR3EPnnNwL7gyGqXkhUESyq2FqsJWv+Ca62JNDctdTUqyCNKU1rr
	 K4RzfCAVaJMePxgFCaOlfIAaTTyYvsQy6G4IjnM6tb1KGkmLD8h05Et5z5jcpW4BHjFnj
	 jK/v1GOQ9MuZf3VQZaksxei2wXV7Yg9PW4SJPbA4yGX98N2SRxOx6UDjGCmQJnA7rrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="z/wAoo5j";
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E633E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E633E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z/wAoo5j
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso1299448a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447011; x=1796051811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8zS9sQC2qzaVvAkqUIvrNo7w3mYFINi27bRT22YfmY=;
        b=z/wAoo5jJ2dIbSsXMVGPhztklwvw84alpTp+itq8cC286M3ZLZSUQltm3KI/aO1h+g
         ABWHUvju7TeFH+SR2iF2K/Qr6fE0p7kx1+5/h+xvZNBOcz+Fem0h/Rr7kKc6h/KyTbT2
         6If0cs01fxe4K5Uakk/ar8JL47uIxaJjUYejzpGRR8o/L525LDfXJfQHbI6jIDtn4UsC
         +1vrl5dUl3cvr5MIQqgzE7FaQ+gKdIPtG/CodYUjO1aOwjyMp/qtWO+31jKbOwpgyALv
         l11yD06hHftkIpoC4Rhsqvo0FCYrReYewAQQmBgSJG4WgTNccxblM1vFy2owqr0eBBog
         qzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447011; x=1796051811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x8zS9sQC2qzaVvAkqUIvrNo7w3mYFINi27bRT22YfmY=;
        b=Jbsdb+5veNPR6hr5tiIOtmzcf/pEv+ssntOvB6WgDjPJZdoIv9yDXhslxOKJ7oLRB3
         0GxV7SJNjoXaIL/2GUC7uz765KJYhN/UerVkC1F5PHzvin0CVCHfRJyBnZ89LuhYZC6Y
         jTORVkMdqPH9gC+eE0tS7hr7zEU3UlM9VxM5t28bgcoSsEV0j7MANu6ha8jn/P9i0dPH
         0I5OcUB7Q1t+/KdOgnCyEvmw+51uUx7HvSQAkreVXM80OKukty9JAOWxbSQp+oNgooAm
         UvUDOppDqU/X6swfdAV5PojW29Chatn+3WId90dahQNhoLQ/ubf31D3CKfrnPqsSkWP4
         Zv+w==
X-Forwarded-Encrypted: i=1; AL+hErH2GoAlClctJUt/Qg2zP8WSL4V685K8uGXdEXlK2hj0+IqjDHR6ztkD7J0Q8sPbPd+LfPbVi5ThivJZSNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z80mQcbHQGls2xv8y4Eos9Rlr5+5zlaCbY3ezWrh+mYS/P0Ahfs
	EctvdQcZETFUhvUbaHj/OV2s81XWc3xqJdGqBySF2Zc6L5P9NdvYim7G
X-Gm-Gg: AZFdTZcYiLRlIR0sAP3NGX0HIp1byP4dgsnb9ICne/jvIggIWx7yqobQMvu7oErtTc4
	aIJnGsc4iU/N2+wKlcIz3D9JcGOsrcFCO69dLHEKmIS/WbnoCg1vPljhSp/JHMsnNV2GpZmFgrN
	WYLkzQW0kV+e9NHt6c87aKjyU89tpe2IbJTFNfJ8TdsMag9zkx5Y+NHOIfO/Qkqte2AH9CQcp4Q
	jZxQfowg2iSeureW7SubfvAnuNQ3WO7UwZashxPJ738Dmw7Sookwr84/qCV7mbj4AtauzFMBpSZ
	FKE+RbRwHN7HKcOQCLjadZV7DBB4C/H5SkKRQB/eXO6IMhL82294deB6BqoyxrGRZUnMCSedI9s
	f6XAcXalwNWqSMcBNEU0pOZzx/Y0R4AmHO7HQ8ZqNgVi3IZ3wtsQbHm/cS35Qj1WreQ5o1iHizO
	ABYIrF66qz0hC4xuMKbIO2b1OIhE0e2wqMFPJin1sn08+OEj3I7S4cvOBuTKEIMGRH9TUGpU4/w
	FmNpt0FWo5zHubk1NiUxZ9fhWI+panatNLXdEpQoj9/2ZXuJAuM9lI8p6Or15UJzFX8HIv11SV6
	52dbuwq9Z0AfQce6J9wzXV9mBK/UpKE=
X-Received: by 2002:a17:90b:3d4d:b0:3b4:7cf:5e5b with SMTP id 98e67ed59e1d1-3b41c93e808mr9457751a91.31.1795447011273;
        Mon, 23 Nov 2026 07:16:51 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm20067482a91.5.2026.11.23.07.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:16:50 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Mon, 23 Nov 2026 23:16:16 +0800
Subject: [PATCH 3/5] pinctrl: meteorlake: add some groups and functions for
 INTC105E
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
Message-Id: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-3-f2322a91686d@gmail.com>
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
In-Reply-To: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 BillyChou <BillyChou@aaeon.com.tw>, Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0

Add i2c0,i2c1,pwm0,uart0,spi0 pin groups & functions in mtlp_soc_data for
device id INTC105E.
The pinctrl-upboard driver set the correct pin function corresponding to
these data.
---
 drivers/pinctrl/intel/pinctrl-meteorlake.c | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-meteorlake.c b/drivers/pinctrl/intel/pinctrl-meteorlake.c
index 6fefee7827ed..870658eac91d 100644
--- a/drivers/pinctrl/intel/pinctrl-meteorlake.c
+++ b/drivers/pinctrl/intel/pinctrl-meteorlake.c
@@ -339,6 +339,34 @@ static const struct pinctrl_pin_desc mtlp_pins[] = {
 	PINCTRL_PIN(288, "vI2S2_RXD_2"),
 };
 
+static const unsigned int mtlp_i2c0_pins[] = { 122, 123 };
+static const unsigned int mtlp_i2c1_pins[] = { 124, 125 };
+static const unsigned int mtlp_pwm0_pins[] = { 208 };
+static const unsigned int mtlp_uart0_pins[] = { 111, 112, 113, 114 };
+static const unsigned int mtlp_spi0_pins[] = { 88, 89, 90, 91 };
+
+static const struct intel_pingroup mtlp_groups[] = {
+	PIN_GROUP("i2c0_grp", mtlp_i2c0_pins, 1),
+	PIN_GROUP("i2c1_grp", mtlp_i2c1_pins, 1),
+	PIN_GROUP("pwm0_grp", mtlp_pwm0_pins, 2),
+	PIN_GROUP("uart0_grp", mtlp_uart0_pins, 1),
+	PIN_GROUP("spi0_grp", mtlp_spi0_pins, 5),
+};
+
+static const char * const mtlp_i2c0_groups[] = { "i2c0_grp" };
+static const char * const mtlp_i2c1_groups[] = { "i2c1_grp" };
+static const char * const mtlp_pwm0_groups[] = { "pwm0_grp" };
+static const char * const mtlp_uart0_groups[] = { "uart0_grp" };
+static const char * const mtlp_spi0_groups[] = { "spi0_grp" };
+
+static const struct intel_function mtlp_functions[] = {
+	FUNCTION("i2c0", mtlp_i2c0_groups),
+	FUNCTION("i2c1", mtlp_i2c1_groups),
+	FUNCTION("pwm0", mtlp_pwm0_groups),
+	FUNCTION("uart0", mtlp_uart0_groups),
+	FUNCTION("spi0", mtlp_spi0_groups),
+};
+
 static const struct intel_padgroup mtlp_community0_gpps[] = {
 	INTEL_GPP(0, 0, 4, 0),		/* CPU */
 	INTEL_GPP(1, 5, 28, 32),	/* GPP_V */
@@ -380,6 +408,10 @@ static const struct intel_community mtlp_communities[] = {
 static const struct intel_pinctrl_soc_data mtlp_soc_data = {
 	.pins = mtlp_pins,
 	.npins = ARRAY_SIZE(mtlp_pins),
+	.groups = mtlp_groups,
+	.ngroups = ARRAY_SIZE(mtlp_groups),
+	.functions = mtlp_functions,
+	.nfunctions = ARRAY_SIZE(mtlp_functions),
 	.communities = mtlp_communities,
 	.ncommunities = ARRAY_SIZE(mtlp_communities),
 };

-- 
2.43.0

