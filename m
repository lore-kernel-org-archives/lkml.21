Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810169;
	b=C5SUqxj8Sv+99OspzwGEqPCHtsB14UPXoXuSqdlFVNsFoYsY1xS0idj1YefxFZmY5lIM
	 MtglOtXy48boxSuZ8ybqitu5r89BKPn9XZ3PEM9AlbUoRyVTBKtGMyOxE9qB9LE+rrwN0
	 YdFvTOejdsJBPIFjUoRCtqhRNKWZkjW/UQlNHb2JxxlzH5tY5lqarnbKrk6apSicVV4Q2
	 StaYFdku6skpLz3moyo5osOb46spbYAvWrixbm8meacJ/GRt+zPYWCvAAQ2AXQZZUWVHu
	 0AzfEpolq6ZRqn6idci+ZVnCoFDQNhu+SYwFwhobFUREkn6N87ZoxgrzZ1pYXEB6fLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eFtBGJCac2mU4gzMuEFLnWO2dv/2wJCX7JUpFzZjIVY=;
	b=eUq5tIkixFjTQBqAZqzxTFCjAqXqWVmxuadr0qf9J7aJp/XpJoweiDzWhE+y6hjaw/lV
	 D56TD/F/pWXBu80zbimLlovB8xcqzf/t3ublV9qxF6sOWst3QLnLpB8nMZl3arprc2BGS
	 07CeybT1YJ9P2qgVvOegSDubUdZRcd5RmuY8tNmmH0Pk6X6niBcKhmF5lfogVfJr1CYAr
	 JSU7dtCSCX8ZkWMneb0EccLJiDLiTdAipqqi4WETP5wJWhAkKcZ0ct5W9VE8Q2zONYEGn
	 qxwHXtpi8NmpYKOQ0Juzk/ZNG5j5776HDdv2s7kfH3FbkDOFTWNsYwpwpypRyhRIBMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cqx08XWn;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252E0606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252E0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cqx08XWn
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6df5e315bd1so6656733eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810168; x=1796414968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFtBGJCac2mU4gzMuEFLnWO2dv/2wJCX7JUpFzZjIVY=;
        b=Cqx08XWn6QzVedujOsRjW/Hs4JxyKp96uzXH9nHy1jtflOPSwxphsSqBvMk8hVXNeS
         2eEB7Cc8cId/Vzj/+KL9SImZ7WLxSoOU2SkvEgQWfDEArpu5E2gBVu0BETrUKadIBON7
         xI8muDcscw+B9K2dpk9WfWwIE07VrhiPJGpWy+txI4kcn28TDCcIoRxu0xt0ZT6f3Wsy
         OejGITNQG19TCJ+NhgZgqIc0JBuzhwwc3VWKZxAJ0ccaP6pjTAx6txzk2bQtM8ZzsfCL
         1a9ug7/8XtAcmY/89mma019OYj4jrHQSV7sbaEv1XRTSDB1y/0ZT/e8xyrYmQkiEeDwP
         vytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810168; x=1796414968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFtBGJCac2mU4gzMuEFLnWO2dv/2wJCX7JUpFzZjIVY=;
        b=PadPXzjManS6S20djM8imwaFEKMCYNh48mn5SfAdXj9wfOQznSxPGFXQCr6kBgV3R+
         ee9Bz+wPiP07YpOFWp+5x4FlwjXnps7mvDRfykasYvam8cJQOc5ct7AOM4eR+CLqabGY
         9Fz785Fpc4IWDy4l4S7ppGLws+G4rzFcVYuBChw3Q7FBf8whJawVa2cIdIF4nGjQLhvS
         3FHt13ndwWKA3WBQMRYjsNSbg1TD/INvaU3taGMPTK+cxpmqwXY/Gsdfi+2A4sahr4aB
         HmHxm62RbBG5eta9tCQq0RUEnN2PRkMA0EGVbIE19Kad8iTlU+sc/vL/YgVgF8HBd/Y+
         1OzQ==
X-Forwarded-Encrypted: i=1; AL+hErGAkN24iIS9H0SUbepiid+Ns8ITEivxBkZdWURq+MAk8uKGsi2C96ehOiAo8vdn5zvytV034D2wGz4afMM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sgo0iyR3vEBQ5pOuL5HgliLQCypPhu0YyyK3B62kJek0Hj+Us
	n5IzdKqAEaFuk/qEKAVHv6jF4gFdKCQYn7117z4nyfw3LFgyt3XmKpcs
X-Gm-Gg: AZFdTZd+WzW6S228lR8d1pHe0gMdpUACcx4R/907VS+LdECNJ13ltXVYAaL6Khn7Hca
	DGTqw7w+d6jfCYLgRTYU88xPJXbf/u4sxC4Reo7xNq3cLr4baqIv8HB4Ks57gjyNEgX1ADGQiB5
	J+YDs+EjndQYniSXTABnBagsX1ambcVzh4vxwHl6bykrAcLl/c3Sjdhso1zv1EOUS3Av/LjlMB0
	RmIbeDZlk/bJxr4la6O9O5lFeyRS/ijqI94twzN7nIGFvumOQOoTA1+VBO5afLrt1Xoo5QbFZh5
	iWWB8Z5/ezPVk+rUoQVpX8jMldwkIOASpdDpI53W2Z9Jx7PWKwYXRxDdRSNyPhYgeuTA05e1GDi
	fQZ15Xg5EWS48g5ZdCVbFhagRBaaKvvVLyAoh/EBP/J8kExtbmI0ok3gXrjckfQxIofOxSUHi3l
	8Oh1gG0HFIIqFrk1uxXd/YcBzD0Ct3Oxfmd35yv5YMqX6RMoMyGMZuHFF531twELCpvQNj9Gd1B
	3ntOZ70+2IE6qpGeDOZg3RXgBjObKeO9L1+GvtWYodbLzm/9OFHqkeirZMxJJH9Z4iOEQeVxhXE
	jLJRqYSiUYTBUFRJ5beHk2LzpZZ6sg==
X-Received: by 2002:a05:6820:83c1:10b0:71a:e761:6995 with SMTP id 006d021491bc7-71b394d6033mr15209770eaf.30.1795810168080;
        Fri, 27 Nov 2026 12:09:28 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b8590ba0fsm4834662eaf.2.2026.11.27.12.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:09:26 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Sat, 28 Nov 2026 04:08:30 +0800
Subject: [PATCH v4 1/5] pinctrl: tigerlake: add ish_uart0 groups and
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
Message-Id: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-1-029071f417d5@gmail.com>
References: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
In-Reply-To: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0

Add ish_uart0 pin groups & functions in tgllp_soc_data for device id
INTC1055. The pinctrl-upboard driver set the correct pin function
corresponding to these data.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index 93234f4a9bd0..93479695bb22 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -333,6 +333,7 @@ static const unsigned int tgllp_i2c0_pins[] = { 5, 6 };
 static const unsigned int tgllp_i2c1_pins[] = { 7, 8 };
 static const unsigned int tgllp_pwm0_pins[] = { 99 };
 static const unsigned int tgllp_uart1_pins[] = { 85, 86, 87, 88 };
+static const unsigned int tgllp_ish_uart0_pins[] = { 112, 113, 114, 115 };
 static const unsigned int tgllp_ssp2_pins[] = { 108, 109, 110, 111 };
 
 static const struct intel_pingroup tgllp_groups[] = {
@@ -340,6 +341,7 @@ static const struct intel_pingroup tgllp_groups[] = {
 	PIN_GROUP("i2c1_grp", tgllp_i2c1_pins, 2),
 	PIN_GROUP("pwm0_grp", tgllp_pwm0_pins, 2),
 	PIN_GROUP("uart1_grp", tgllp_uart1_pins, 2),
+	PIN_GROUP("ish_uart0_grp", tgllp_ish_uart0_pins, 2),
 	PIN_GROUP("ssp2_grp", tgllp_ssp2_pins, 7),
 };
 
@@ -347,6 +349,7 @@ static const char * const tgllp_i2c0_groups[] = { "i2c0_grp" };
 static const char * const tgllp_i2c1_groups[] = { "i2c1_grp" };
 static const char * const tgllp_pwm0_groups[] = { "pwm0_grp" };
 static const char * const tgllp_uart1_groups[] = { "uart1_grp" };
+static const char * const tgllp_ish_uart0_groups[] = { "ish_uart0_grp" };
 static const char * const tgllp_ssp2_groups[] = { "ssp2_grp" };
 
 static const struct intel_function tgllp_functions[] = {
@@ -354,6 +357,7 @@ static const struct intel_function tgllp_functions[] = {
 	FUNCTION("i2c1", tgllp_i2c1_groups),
 	FUNCTION("pwm0", tgllp_pwm0_groups),
 	FUNCTION("uart1", tgllp_uart1_groups),
+	FUNCTION("ish_uart0", tgllp_ish_uart0_groups),
 	FUNCTION("ssp2", tgllp_ssp2_groups),
 };
 

-- 
2.43.0

