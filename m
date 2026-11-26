Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705812;
	b=DzmR0ukDN5hQfmLPHCO1d/HR01rnxerxxx03HvPy2Rzsto4TN3CuqhGAPY22HNW8l02m
	 MON48bUOetaE0XmZQQeq9TWMfKnrp/VB5dQ6GqrH1oVxXlvoxuMQ6YSs2l3BM38xd0n18
	 JeFi7jjOR5frwQjFplZLSMTT422ZcaQtPJmZWR7NP/9aQys5xhzvYphXdNmTE4OyxeLOK
	 MlMedOSgUf6KFH2rrlVl1D4USUilV0Wrqh+vQYI5mMI35SrWBQvq3RMt7IVmsAL8DwoOP
	 w56sDi1jRaeoIYfJ+LTRVHSMsumaFEgMjHJT7B4XhvLqvmgSylHPHMSOX/chTOnSPJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=j84OpHdYErswf16xxVe5gz1JpeWmt2xrc3NrDU8Ooqo=;
	b=0oIbHts1Odtv/QxxSFwksbZK4VVKSlRmLEZ+ihUU2CN/qyoNK0mrU9PukcVYvvU3ETeH
	 fiBs7GtWksTYAFbuxgkODmLcqmvVBWInQ6HH+NqG2WKPvrpahX+Oa8SeOge7LQMK0an+W
	 BEJpVhZ4I7z+/Q1Z93paGAfM2p9BrWdyD1AcsTDMsdaiy8WTICi0NpodxpxqnoZrx5Z5Q
	 J1g6Uz4IBdgXyKt5m8lrUkH4GCinuDAOZtMPn/m0ocEYTgQq5MTaNMQ6fYNjAkjbkXdZS
	 2VXHpgw1qnDSFA0Tm8aX8e9XROHyAew0DbBr+C0BmANUfqBIF727q6EZctmIbf1r70w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WY1Ok4a+;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E36606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0E36606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WY1Ok4a+
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so3736060b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795705811; x=1796310611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j84OpHdYErswf16xxVe5gz1JpeWmt2xrc3NrDU8Ooqo=;
        b=WY1Ok4a+1/aOYT7pdc/gnmKXDex0LIrGg7z/7FJvMEd4uN8PPl/SlaSnJ47hCGoYDb
         9WsERnoOFjQNXgWyZko1Get0M1iNzz85OJE5btgmWN+etyLdNTgBwfja3RgTe2NA7XRI
         hYdpKr/4E7w7kjfLB8cGJpZGk/FdY5hyAwPvhwn0S7sKx46cetPYHW8Vg9pkjmyH0gwH
         sp4MNOyBcKtY4Br2D6oxgkPWUqL6Xen12n3tagLdOIZ/E6FKUaqY95VEVTd2N/hXh0dd
         vXYiQ4r29TeN5Xup8SDsCU+2Hs1CfJSPJyHu7ne9CwhMAqBG52rJFQZmsdvTtWrhlUP3
         XreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705811; x=1796310611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j84OpHdYErswf16xxVe5gz1JpeWmt2xrc3NrDU8Ooqo=;
        b=0xU1xi5xufAXyyRRc8c5Xi5KFcM7Jj1h1o3AnQ4ZRHDS/EVsyrmwiwQER09atYV+4N
         dqF+MwQYB+MtC6vlKucYan6EP+LsGQQhLo65ZI2G0rUfAZ0dqush/HCkUjZA09KsZyH4
         rBGVDMD9UX/yJaV7wDFjTxILHBe91PmAHYoolYsB19EG75C0FdmhK2J4OVQYPRt7VDCN
         vbVXbAk0XA/7lHsfwfj4aqnCjr6AqVZjHTHlp5u8QFJrRXKF3QCnF+X6/IjQGVVuGFYE
         +b6GECUS4yegzyK7i6WGVGoSHCqkhAlFvmX0CAq7EvqmEngv4yqHSvTp0zbNHFRNQdz9
         +2kQ==
X-Forwarded-Encrypted: i=1; AL+hErEqNKiXYdJLfC0FcmVjD75b6L+PJFiE/+qObQkKPC2Y5JYyNcJN/Kg0/7YdyuDSKA+Eh/GwCAztSIdvViI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CwePMe0FZT2R3DEU/lfwA8wBw59+F+ERq9eL9/sEXmrTwTULg
	9Qw8rcfiBt7nYiTVlObe0FdlpRe73gtpmeREZmp5QZTIpmx7s7n2lA1t
X-Gm-Gg: AZFdTZc2re9I5mB70Hks8of+UN0pTfxhOLsOyiVLok+NXUyoLlgw/f0HDzbrf/YA3h7
	dlVSV9QQaUJeBWcMKtcN5UlNYvpv+iQ2qShz7P5JETuirfM23i9hs14QXoGbmG75udLk5awnhN7
	PIzAhKATZ03TFc28xrtp3EEVLiMkOTOtZGfbOha59BcaPBd2bVzPURjIL4D3VBOIEcYAwuEl7qU
	LV4uIG0bvcRoWKvlo09pX/VSlf/EMBZbbfyFnCcmKetDyCFeMYvTLAqM3LL7hPGlSao+D09BKww
	HU5MMfzcOKvyKjMpOjpOpNMGDbuPQcMYpCXlz37so6SwjO+0xHNjR1NAKcw6DYZZWv82Ftf+U6Z
	tycHgRFbBCCaelEe7PgXJ2gV0B/lEePLyuaiDiIksiqP83y8EBJbJBMD8F+pm23iSBGUYIIEgk3
	2/vFUKhiuvBHOUY98FphDEwnt7DaI7Id1mGb83wnRXsNo7/Izj6+KcRqaR9pfZCNVTIGHpjRWsy
	nhGn1ORsqiQ0KkkxYfQkyeTysEXJ9bu7wiG/PLYWWaVkMA16WGt5iKzmlPmhL1OV89x8Y8HQyfJ
	dVNgDESqua4xDx9jlQc7v6pI17kXbjgqmt90o34kMkcApFpjlQ==
X-Received: by 2002:a05:6372:a748:b0:3d2:df:1854 with SMTP id adf61e73a8af0-4014a27e7eamr17658944637.6.1795705811195;
        Thu, 26 Nov 2026 07:10:11 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm11099923a12.8.2026.11.26.07.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:10:10 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Thu, 26 Nov 2026 23:09:44 +0800
Subject: [PATCH v3 1/5] pinctrl: tigerlake: add ish_uart groups and
 functions for INTC1055
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
Message-Id: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-1-81d35c9ba246@gmail.com>
References: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com>
In-Reply-To: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0

Add ish_uart pin groups & functions in tgllp_soc_data for device id
INTC1055. The pinctrl-upboard driver set the correct pin function
corresponding to these data.

Signed-off-by: Gary Wang <is0124@gmail.com>
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

