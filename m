Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447001;
	b=P8UwSGp6AcSo8wtdSqNQjoohtFl/BZWAhCL4xWnFERLApwQRyeuAWpMWABqW1KidscF0
	 UA/VExSV3PkenCVIvpqfSEMF2tLlxf2u4twfxB3e0jZIqjLa4vg68V8YXv4Bm0MTG+b/e
	 kbNnS3GM/2gf83zFBPZz2vYTAxCbdxjRg5tvYydwg0cSFmACS4Ykl2p20WQjHu7zRcoTG
	 RBq0l3LCUPsg1El58SohxCav6EHDLaqeBm54f01n3YUJh5tFHR8B4M5xgDN6j8s9YUUXq
	 CSt9n4jk2JpuxjOqLE9NAAEKvHIDLxbqAPGt6PKGBPwUqwCT9KfSx8JeCRGgzY+QOuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gt9sS5b3wSu8cyzhasBzSCBoh7vpVmGfpzabjBQAwec=;
	b=nf50OSuezXh/ZXJz2puJiVk2vYtDc8xXDFmsfreRFjX8qvm0aP9o+4y6Qvg6KpINWgk+
	 uSrjH6quzphc9UnkPvJf+Q0ZuyLugFMt6I5LUw9NWVKnavYL1VndcGzzvKlvFAqTdR8Y5
	 k/OWXkjJrqOe1XddxtGNTbsYt/y5pT01Yw49bNPu/1GTB2COInwe1lH5BGmQo9lHKCSy2
	 aBFqh6LSRrEiT6tpWn2j2psfxqY5P9i5d8IDlBISvRzrScFLjZ4E3wxCSYP5oOP6pXwuD
	 TeS2QwuN9LMGhjfeusNvJtJsxsgdq/Jt7tktSMa/h8MRDmfAocB1nsjSW39k5WZ82zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8ejuoNL;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E246E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E246E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8ejuoNL
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b49a6e8212so570808a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447000; x=1796051800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gt9sS5b3wSu8cyzhasBzSCBoh7vpVmGfpzabjBQAwec=;
        b=J8ejuoNLfUDyPFb/pd/nAD0g42VEZ8fMNWARYRf1CGyd1u5DTGi7y6aMHvqEyfVRuD
         B9zJ9yAQEoUEKQ+veMlZldMynWGxc3C/X6nXDMThKA5tlg1Y29IuRSx+6W2LygOsAZ6z
         aczeSaBOTXHWhOq8AYb4CL4iBhrOrf6Ci+J8dVPt5PbX/gKhxtzXY0DcMyOl0ohA/Q8n
         fQSl2rQ/fwoySCfzuYcmyr69fFhwz7XB6Z1phWaoy+zuODEsC3h2LhybS+MUdh/Z81cG
         kp9hBlHZCuKRkBHLjnOsqUTnTUO3Ggs5TZrWsCgchowxW7U9irXWPTdd5QvZsTpTgZRw
         Z3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447000; x=1796051800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gt9sS5b3wSu8cyzhasBzSCBoh7vpVmGfpzabjBQAwec=;
        b=LZvUwxiuRrWgBoAKPWMYj5y0AZoCA76pJZ6YDOLznuOPI9EXBJ5bsTm1TTOGx7A6Fn
         bOshiYlSTJmqZF1RfkiZoK/0SgRgDsh6dsY7y3SPufOxf5xIf+ykJQ43v8vieO9A898H
         48M34icW9cbBeF+XPhTq/dlTSk2GfFrV9EjPJAK3ocbBCleMxi1dtWvpz5gcoESI5Cy7
         clDVqYBnrT9De3j5KhhotydJ1XbtsGdHTAc5Lbnco3/c+Tg5ziaZQUP8p4lltLOGbUGU
         UmOpzFt8Jhe5HOhmh1LLnXgPHp1KXs0ODunPacuB90S9lhqpdqfEz6yz18edJEV8HB8A
         Gsww==
X-Forwarded-Encrypted: i=1; AL+hErE35/ZdojBe0pNuEua3IVtrW4BQuWdpjMAOY6prVGemErp7y2x9wlLbkeAtGTpE02udps0UOVQV7i7pFOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A5Frxc+VnrnUlS6habUFsCueaGqYrzYTYiOHTT8o/K29MpcET
	i4eLn/Ct+i7kIb+VwtZ5uLEAYYx30cTKcqWcV3/HdkWvbCZmudN+04w2
X-Gm-Gg: AZFdTZc9JgayZsqy6/r8Ku2OfS+y0oF1KP/O2VHCmGnO7akICmJ73AWFCJoJM3YtV3u
	lgmC2HWODcKlObSCNcjSICtC0icE8GN4VfNlzpyFm0vGHivizCdTBFk++AnCCGGY9peQWDS2L2H
	9DkEo6ZhEM75y/W0cBTWS8xrhl/W4LL14BNsEbKNfbca3sMvzTmZ0gRWMd1pg7Tx1NFR6GNQAm0
	HzDY2OnjEawpzuNNzsoo28L5WKVSzCIrwYjlM5708k8e2Dyvr4YCvskyfQKEqeEWZSjJgq7rtkE
	R5xnw79oOI7rR63JRXIzgJ55qK9Ooi+NusYf2fmzyor+oQlv7kWeR3ba0MnekCsm73zt5NdHqn1
	FfXz94eShc7aJL85zVGUymjpIK3xOv0rmTe0VKw3zNB6CGWBU9+QpyQBaNuk3f9Ie+JfCnmG4IO
	LxbvXSXZA+yadod/IpgHT/BjiZM16HxsDqIQCAvpOWIdu6Cbnld4YKbOxXies0rrXGjTkA3rpRa
	rpn/7lRLdjqeIwUXfiw7Ix4mKFDhqxj4TE3ViZYNUEU7txfEFzIyyCfXTCKSfwLyRu1R0HQC5O0
	kAi4BrvwcWk5OQwRhUYDOwyz6m5d2Wac7NaEwtBX7DoeNjyyavA=
X-Received: by 2002:a17:90b:442d:b0:3b3:fc9e:561f with SMTP id 98e67ed59e1d1-3b41c852ce6mr11297493a91.8.1795447000231;
        Mon, 23 Nov 2026 07:16:40 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm20067482a91.5.2026.11.23.07.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:16:39 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Mon, 23 Nov 2026 23:16:14 +0800
Subject: [PATCH 1/5] pinctrl: tigerlake: add ish_uart groups and functions
 for INTC1055
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
Message-Id: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-1-f2322a91686d@gmail.com>
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

Add ish_uart pin groups & functions in tgllp_soc_data for device id
INTC1055.
The pinctrl-upboard driver set the correct pin function corresponding
to these data.
---
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index 93234f4a9bd0..80c847875faf 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -333,6 +333,7 @@ static const unsigned int tgllp_i2c0_pins[] = { 5, 6 };
 static const unsigned int tgllp_i2c1_pins[] = { 7, 8 };
 static const unsigned int tgllp_pwm0_pins[] = { 99 };
 static const unsigned int tgllp_uart1_pins[] = { 85, 86, 87, 88 };
+static const unsigned int tgllp_ish_uart_pins[] = { 112, 113, 114, 115 };
 static const unsigned int tgllp_ssp2_pins[] = { 108, 109, 110, 111 };
 
 static const struct intel_pingroup tgllp_groups[] = {
@@ -340,6 +341,7 @@ static const struct intel_pingroup tgllp_groups[] = {
 	PIN_GROUP("i2c1_grp", tgllp_i2c1_pins, 2),
 	PIN_GROUP("pwm0_grp", tgllp_pwm0_pins, 2),
 	PIN_GROUP("uart1_grp", tgllp_uart1_pins, 2),
+	PIN_GROUP("ish_uart_grp", tgllp_ish_uart_pins, 2),
 	PIN_GROUP("ssp2_grp", tgllp_ssp2_pins, 7),
 };
 
@@ -347,6 +349,7 @@ static const char * const tgllp_i2c0_groups[] = { "i2c0_grp" };
 static const char * const tgllp_i2c1_groups[] = { "i2c1_grp" };
 static const char * const tgllp_pwm0_groups[] = { "pwm0_grp" };
 static const char * const tgllp_uart1_groups[] = { "uart1_grp" };
+static const char * const tgllp_ish_uart_groups[] = { "ish_uart_grp" };
 static const char * const tgllp_ssp2_groups[] = { "ssp2_grp" };
 
 static const struct intel_function tgllp_functions[] = {
@@ -354,6 +357,7 @@ static const struct intel_function tgllp_functions[] = {
 	FUNCTION("i2c1", tgllp_i2c1_groups),
 	FUNCTION("pwm0", tgllp_pwm0_groups),
 	FUNCTION("uart1", tgllp_uart1_groups),
+	FUNCTION("ish_uart", tgllp_ish_uart_groups),
 	FUNCTION("ssp2", tgllp_ssp2_groups),
 };
 

-- 
2.43.0

