Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540275;
	b=NvnbUcZFzaJC3Iqc3REdA6BTu/hVNBBGmS0OOiNx6nwnwxMdGtcPXPfHxkz5YDYTqfGF
	 EBHytAtA9ZsG/q7qtuLLL2DzoEatuOqGOELAe8AWsfL2LnlMHrWhHLCrTpuDCd7VJ9wd8
	 atE6UurY2lv8uQyCgFuz5UcRrNlNx1FlW7MAzOphul9KInOo9X/W4Zsf3hG3gsfZ7vIWF
	 LIUv//QPL6vSz52f0ei7Js7ezcVYhKNyGehGe4s1uThmJ78rSvKicWUK0oOtx9CBm8UVj
	 2Zfsi7QO/DBrBYw28KsQcZ8ZusfCfQLAT960RBJdhOODQSsiHtOPCq+mnQhZgw1Q9Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FkKsNl+hXnNpxWzyhVxfdlcQJzmEYt/skJae2DKrtv0=;
	b=wZcHgOTR7/+8orStwtsvxQ2Scr5ROSXyN6/iAuxk/xmA2ygL9nApoqGZ9QrqvNozbILY
	 dKBkuUk3+dcGAxdbHmQYRllTBrY1OpyQ91JCGfwYfXesWPxBL8yWjUWnhoIbqKDyFEOpj
	 +f7NguU5hqPVJ9Xx4g/+098vl6y7PyY+N8TOfThUNnDQY6edYraLzPyWQwAmW6N7HzjmQ
	 sqc+j/Axn8irGqT+t7HjoAwOeVutFjR9g2MNpqzmgiNg9Z0qNVFASf65MlwG52w6auG2q
	 YOegy+GQ1gI1YFUNTBHdJOwrqy8G2yy/SnroNW7vi/4OHuL30duAv18dgTI/5ijg0qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R+hD/fEU";
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603B6606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 603B6606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R+hD/fEU
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-862b090e3c3so2529436a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540273; x=1796145073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FkKsNl+hXnNpxWzyhVxfdlcQJzmEYt/skJae2DKrtv0=;
        b=R+hD/fEU7z+WkLI8rht+BbJc71Xpsy8I86Z9luAWsPbmifhbx25fkoWVTFfr6JvL8j
         S3TFkVWxBviKkjuBy3Kh46192AcmsZnSSXuEfkxRN8Q8m7frRwiIw1qzhKsJpvuoODZ3
         ZSYJfH45T4+SRVRLmB2cS43RrR2CYlZSt07g6lnkgczeu4zjsDYcwBPdFgX1TPECdcvT
         I3EYlo7J0sYf9ZU1WLic4dMlyaHTvGDxFkHMZfnwlLQELiN7P7UdGleaDZfFUCZ1Ae22
         yTwRqjxfoBYilBwnqJxwFvwQUL9wschT6W4xzxDtvBUsKFzbbfxIgjXaJ95P1l4Rbo5g
         DWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540273; x=1796145073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkKsNl+hXnNpxWzyhVxfdlcQJzmEYt/skJae2DKrtv0=;
        b=uh34V7kkKyVX69Ga8G174c4i9+EL4wGTj4lxFqiYL4oH/fghogYaPlvY+/JOtJJxSp
         raqwsfwxYxcdMl9XvLBO+Dozp3YbCAd0QpXth6hYPi8okza39rRKZN6CmiBDQnYXiDTb
         yZzxrBgOIaD+eRiWJLMCnf5Nn6esPQ/L57exc0HjxK1XWCeesrSHuKTYuEFJ+QDuMmwz
         29cm0HGjtWb/pjjmM6xgAeXSwjGfCJfQIdu9XqWTXt0YhQ6vMmqL5EgIG8iXghm/etv3
         OTp/td+AEI2z2r55fbVhGFsPvg01zvTiCJI7fetSyPiyc71rQQSkK2awlcd7U94hAB1e
         u1hQ==
X-Forwarded-Encrypted: i=1; AL+hErFzcyb0kpXmqAfXG9DWSroTgKmmAhAOCMUgCNwXmzyCqw17K/b38Z+437NyhhWMLu8ht9SeqFBSIU1gvXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L2fOlsN0IIgQZV63u8a9dYML2pdR/1U0thzNcxb3IkgaVQ59m
	eKoGT3WZAkiGHTeM0cTHX6SKMQu/s8oyytzgBAkeqee2QY44hzhlQP61
X-Gm-Gg: AZFdTZfEPLKhzHhehGiR9B7HulrlGk9YY4kAsgPaL0cNdf4ZfFOBL1socgA8NgjiKJ7
	8L+qdIIS8BeT6B5TXuqYAScxv5vXdubWeCaViCwWSBeC+enQyOECWYe6e4Sd3hjdG4PXQJvyeTo
	CJSJ7qpG5T5OiL4NXzWl1RIa/CfIdf70hrFRKN5o6IbZheoq0iuFb0X98l1VM8Xy9N/PSrLQbjs
	vuFbyTt3UfrCgSIflAPZ5DvI78sGmAEj48Qrqhq3ba55xFuVbZSq9koV0S7dp7V6b8kPsMYeXND
	TE5C9SNZt2w1MQAfsyQbnGTePwBMAtmCfCDULRptHeXbyvXN5e4AmNdQhR/0ESwPW1paEqpkTsk
	sSgPER9hhL8e9T4YVQvZ/AZI9nJxa8kujSV86IjiTnbKrvDYYYMmQCYVa9KA+0NSLIURGdwNinS
	iMI4/mZpEJtB3T9PmPavRUweDYPq8hlv4OI60Dsdw1yzXQvWCA1DPp7lbeie1tDhMO4mcxQvLti
	jIchtrsv29gafLXJWOS3sxbUHaRneU2GTMIK1AL12Vp/9jLKa2/0GGD2sotJHhCAlx7NYf7FK69
	0wGtZabfBHcMd4A6HTcZvy3fRnTJ3g==
X-Received: by 2002:a05:6830:680f:b0:806:d79a:c932 with SMTP id 46e09a7af769-863159f2a98mr15625777a34.20.1795540273303;
        Tue, 24 Nov 2026 09:11:13 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6besm11131021a34.11.2026.11.24.09.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:11:12 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Wed, 25 Nov 2026 01:10:37 +0800
Subject: [PATCH v2 3/5] pinctrl: meteorlake: add some groups and functions
 for INTC105E
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
Message-Id: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-3-c8079f8f569f@gmail.com>
References: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
In-Reply-To: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0

Add i2c0,i2c1,pwm0,uart0,spi0 pin groups & functions in mtlp_soc_data for
device id INTC105E.
The pinctrl-upboard driver set the correct pin function corresponding to
these data.

Signed-off-by: Gary Wang <is0124@gmail.com>
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

