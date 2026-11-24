Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540265;
	b=ZjRxmcR2Pofn6sr6qXFZybZUKGBFiqWhw6EFkPWuOQoBmd3pLHkN6FSd0ykBg5iO/Wvi
	 tyEGmX0RRa+0kPvW23P0NFS4zuOH/QEF7wlSF8bMEa0LB5LJpEjJyd8ozG4ydyd8NCGq0
	 Oxt07u9wHSk62cgBxDQkbpaej+e3apoLuAvdJHqmFx+yPSwH/HH3Dnnsb6WdPztQyWDUR
	 E7tbKSdMSOEu4ablTJGGR6eNq4mBVcN4fakR4IXcRakP9YNLnH+ZyVlRdZIFfbfZGxLCP
	 IdK2/V5ijIn4r92yxSXzas6V1wlDWUKnnioLRufx9lSd2H0FQ3uZI9fCu4f5d8uHaEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Gh8q8mJVDQR+NyGikWkffprIeLzliNYmsHDBlbQMV2I=;
	b=AlFwVson8jLICsXxVKyvND0KOfRU6ZS51G73riBnI6vXVMIJ4bRoAVfMDOK857zNhcF/
	 zAbpwXjGWiIiRuWIvlO682I2vrwnb83xgsFWSGYT0mTLX6nQFzaitNZEP+2LRlZO+LjLr
	 RLRw8YYYwPrlqzu22Vu3Jm+WZp12+pdCZ0G4fIoawejs/OhmnSEbbaLFW3yQ2c+mJz+K0
	 6dpWzIfYrHRYuF+T3lHlxlFmn+FaWIdijHGI/v1SOaW6Zna5zyq2RwX3QHdAyyZEGKwgX
	 FJM7SZdXwFnn37Wc4asZS+ri3kMXeGWPQWpgKe9Gx/xoRjpMVpINfsJdYDCM4FEQ6fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5s8I2pT;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E95606A6A4
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90E95606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5s8I2pT
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-862b090e3c3so2529353a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540264; x=1796145064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gh8q8mJVDQR+NyGikWkffprIeLzliNYmsHDBlbQMV2I=;
        b=c5s8I2pTtlki/5Mgeo9+maByeYBCj/Nris0A7XKIvhWnnJuV4ltJRCHcwOksUJA/49
         tuHThyzNyfs2ejOjbPw7ZeCn518qLC05KaCHw9SRsvcQpbS3R2zn5/vMoVLfhk0al9Ax
         AJT8s9QQl+pmlStwTDGNgYI4xlxlyTSPlBvvFFnDG2O1KgfBzIT3/wSWyIz2apoFYb5D
         RBuqsQmaS12Fv/ayvL8nRdwURBsRkBr/HhpojLx0DRbnm5T2cXgxrv1cOQ7IZMAj98Nm
         /yukBgS0PNXNfs8xRrY6Ts8/SkhmGmtVHbMNNWrIPKIgjSm1rcEAABP84v4wivEr1U/I
         gvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540264; x=1796145064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gh8q8mJVDQR+NyGikWkffprIeLzliNYmsHDBlbQMV2I=;
        b=aSOm9q4L7cf5QC4+R8d/azPnjBKRfcpYXwqEYg5j+z+KbeFZVTfInaCjARZf6R5+3K
         Zp1UPJygptt5SzdrGcNpvBuI5CEkNKmRyfzC2xvqDRtSxBqFOx0XJNGEOvrXTrNJp7P/
         gpSmDe7qD/m3mrLJb37VhYtgiM6L1v/0bb0MScry1UZWBFfeuZEBUgEH/Vj62DIW+V2f
         ZcKBtTBtyfRLLniyA3zL/YSmkQngbbxzQIEV+S9iL0aoJodAuohMZIS8MBQHXI8Ww2Ox
         Gr6Ukc7aE2vhPJKxEiYS3JhncLaeqHh0lvlnvuPrBGv6L//8W06Z+A5MMhcpuZl4J5mY
         glXw==
X-Forwarded-Encrypted: i=1; AL+hErEBfhCJCvWBtNagsU+LWVUcAeh5WCpYAwzcLZpAVd8agoCB5Si8z/yvwjCk9YrNXqBMcMyD728hShKbqY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+N/BT5vzvWWTdJuv3JpX3KZJDX7QLadhTSEa7t/pAJMUeGnFYD
	NGiwfr1BZZNfuip6UYJYSo7eFzC7Vs29hIn3XX1hGZCrPIqi4DtNLFBo
X-Gm-Gg: AZFdTZdkvAtFAGYwBOq+9je3SEcO+FiA0iPMcocgLJjs3cJ7wumNI9AwwCP0rUEv86/
	mhGTPy7rApfou7JSk7LI+yer/8gq17j66raUYHP2iap2l6BrexHOmwjRlWnWXJxsMsqoPnhsOqv
	WQIFsDEp9VBC1mvBdV3oLQEearFKr3jc3lwoCbDB177/NnlTlisp3DkfQTznUix2vKKvv7m7bnZ
	CpqakClXVN87uuWVnDx58r03COk3QwyGMFB7zVynsQtPu+Xkk13tFiXsNs+SVuwzCnOurkaDkMU
	/Cyfkfbod/3uU+Pi1Z9fAN3VjgBhiOTbUzTdEdg938Ekl0AYz5xgeV1n7E7HW/UQcDuCgJb9L1c
	hIWTN1LKlFOOqV4uORZdvIZHS7V6ZwXCfadc9WmCBKtP71uQFLGmy/Ku88WjoiBOIgkdkefA1E4
	Wv5KQ0CqjJzOYsnVl6QblcqN/9fBEefPBjinHD1dBoiDNVgO+MvnH/x72PfGf0WENsSnKN2hF8f
	rWrB+wHfR93f+plEw9K3pjPipiYruXJNCWzYFEvOdXqC16raA4/yMySxQUkdwRhtgM+Me0C/B8K
	JPzls75PkgAoloXgef3RqXw+FK32Dg==
X-Received: by 2002:a05:6830:2306:b0:862:c685:849a with SMTP id 46e09a7af769-8631507f9a4mr18481473a34.0.1795540264410;
        Tue, 24 Nov 2026 09:11:04 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6besm11131021a34.11.2026.11.24.09.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:11:04 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Wed, 25 Nov 2026 01:10:36 +0800
Subject: [PATCH v2 2/5] pinctrl: alderlake: add some groups and functions
 for INTC1057
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
Message-Id: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-2-c8079f8f569f@gmail.com>
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

Add ish_i2c0,ish_i2c1,i2c0,i2c1,pwm0,uart0,ish_spi pin groups & functions
in adln_soc_data for device id INTC1057.
The pinctrl-upboard driver set the correct pin function corresponding to
these data.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-alderlake.c | 40 +++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-alderlake.c b/drivers/pinctrl/intel/pinctrl-alderlake.c
index 415bc0a16957..d3bdd727ced2 100644
--- a/drivers/pinctrl/intel/pinctrl-alderlake.c
+++ b/drivers/pinctrl/intel/pinctrl-alderlake.c
@@ -306,6 +306,42 @@ static const struct pinctrl_pin_desc adln_pins[] = {
 	PINCTRL_PIN(256, "GPP_R_7"),
 };
 
+static const unsigned int adln_ish_i2c0_pins[] = { 5, 6 };
+static const unsigned int adln_ish_i2c1_pins[] = { 7, 8 };
+static const unsigned int adln_i2c0_pins[] = { 99, 100 };
+static const unsigned int adln_i2c1_pins[] = { 101, 102 };
+static const unsigned int adln_pwm0_pins[] = { 119 };
+static const unsigned int adln_uart0_pins[] = { 105, 106, 107, 108 };
+static const unsigned int adln_ish_spi_pins[] = { 128, 129, 130, 131 };
+
+static const struct intel_pingroup adln_groups[] = {
+	PIN_GROUP("ish_i2c0_grp", adln_ish_i2c0_pins, 2),
+	PIN_GROUP("ish_i2c1_grp", adln_ish_i2c1_pins, 2),
+	PIN_GROUP("i2c0_grp", adln_i2c0_pins, 1),
+	PIN_GROUP("i2c1_grp", adln_i2c1_pins, 1),
+	PIN_GROUP("pwm0_grp", adln_pwm0_pins, 2),
+	PIN_GROUP("uart0_grp", adln_uart0_pins, 2),
+	PIN_GROUP("ish_spi_grp", adln_ish_spi_pins, 7),
+};
+
+static const char * const adln_ish_i2c0_groups[] = { "ish_i2c0_grp" };
+static const char * const adln_ish_i2c1_groups[] = { "ish_i2c1_grp" };
+static const char * const adln_i2c0_groups[] = { "i2c0_grp" };
+static const char * const adln_i2c1_groups[] = { "i2c1_grp" };
+static const char * const adln_pwm0_groups[] = { "pwm0_grp" };
+static const char * const adln_uart0_groups[] = { "uart0_grp" };
+static const char * const adln_ish_spi_groups[] = { "ish_spi_grp" };
+
+static const struct intel_function adln_functions[] = {
+	FUNCTION("ish_i2c0", adln_ish_i2c0_groups),
+	FUNCTION("ish_i2c1", adln_ish_i2c1_groups),
+	FUNCTION("i2c0", adln_i2c0_groups),
+	FUNCTION("i2c1", adln_i2c1_groups),
+	FUNCTION("pwm0", adln_pwm0_groups),
+	FUNCTION("uart0", adln_uart0_groups),
+	FUNCTION("ish_spi", adln_ish_spi_groups),
+};
+
 static const struct intel_padgroup adln_community0_gpps[] = {
 	INTEL_GPP(0, 0, 25, 0),				/* GPP_B */
 	INTEL_GPP(1, 26, 41, 32),			/* GPP_T */
@@ -341,6 +377,10 @@ static const struct intel_community adln_communities[] = {
 static const struct intel_pinctrl_soc_data adln_soc_data = {
 	.pins = adln_pins,
 	.npins = ARRAY_SIZE(adln_pins),
+	.groups = adln_groups,
+	.ngroups = ARRAY_SIZE(adln_groups),
+	.functions = adln_functions,
+	.nfunctions = ARRAY_SIZE(adln_functions),
 	.communities = adln_communities,
 	.ncommunities = ARRAY_SIZE(adln_communities),
 };

-- 
2.43.0

