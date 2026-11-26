Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716719;
	b=j0chSiXLIj+KNf6SCdwfMMQ15JzHjjsafJ4vrB+XZU1LvD6H6nGDta0t8Y3UzB/hG2WF
	 lQ7rmRUtA7CcqGVPgY0EkalXcU+xha9x0Y75G3bdg6DB0TBlWVcbZfMZdRmetnop5CJOd
	 A1Gf9eHujc8Yxpq9fI03MUk+wMgLRaqbUkN88pGNzAUVpzbUZweDl+uuqDRYdDTBvmfur
	 GbygjOyPFdC/EHoVB+BelAzY8jpDU5E8A/jrXH2q/QRzAppNtyql1KdVgcQIf7ynaGAqp
	 HQsadvivpv5a6HmOcoeuR/AmUQTn4cilL0qAt6U06fm2MvKtbCHsHdgqMRKffKwfSiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VmI1RLwiar2heLlFaWJ26IPV3Xx+MW05Ao+rpfa4gPo=;
	b=TGaNnVathuUd6ELlrPc69gGp+mXwG+u8op3NL0Uu/pCvDelXfbU08DVqIv3AZUrFkUm6
	 alnw+mdvJGuCcFrHDORV9QGlmMMvs5Es9nDyXEECz4mewChfUozMtLlme+NowAdfETgMM
	 hj8odlNCvfGH2DmRYCyM5zp3wYhRbIrHHsv/ZmqwyIpm03MqZziZRyExHT4aL3tsCf19O
	 kKaXXFMGHrzgZJS0SicEmYf14sgYtzCT8BS6NxXZMjHkuxA+1Px/W2TgrqLKHh22J9qJs
	 E4dQUlhqu2Suna0PVa1CrCPw8Jg4G2mRjWXKE6X3josbASDUaZ7lr6BjjbhgtBQXApA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hhWbqfHa;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B456606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B456606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hhWbqfHa
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3acec6677so11066313c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716718; x=1796321518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmI1RLwiar2heLlFaWJ26IPV3Xx+MW05Ao+rpfa4gPo=;
        b=hhWbqfHauOjYhVPjniYAo8GgzUHzotXJ+4xcVGNkJvIPCvGnz5yRQTJch82LZpv3Of
         JsF0jWEb6jmf41DSTeUW3bhzmqWJ+SKxGG9Lxuv3vu1TWCTqa5DsNFLmgfgPtY7B83gn
         y3mu3Bp4JndHEYVsV1UDBtzw7/7qLu5QabGh2/ycLQyTcUhnF5cPF175V6ZWlZMGZ/ys
         nvvvay9KkKCiRoTJyfL78dpV6vwiCMkgyNFZJv2IbcqBXqTjdWvdAqhuOfU4bVAS+jZC
         xFwIEMo++oXGvFAHaWP30zQhpDWrFK1FtdKBjeq3GZkV3vbxg/Ke0didZ1uFTm2kKsvG
         z4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716718; x=1796321518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VmI1RLwiar2heLlFaWJ26IPV3Xx+MW05Ao+rpfa4gPo=;
        b=sIdlUld/08ddGU2iYEdgrJxRXDUusG0JbyqTyBVN4J2Q5M04jqv2SCNehJrYv7zwsJ
         FcIjh3QV71JYE4VJj4k5zYj14dMZNNJwXMNS3ORTt5Ilkn+I4bgYGW6Cv2xXPkTQEolt
         +mXMeZ6rhKFnR18hDr15sCXUsIxln77sag8exLjkEb5mJ5MtfoWIJqLM/VKChMAsNN6k
         0aAye6Zomo/o7UjxfS3dxvWH6+qMCQ8fE5b+F686vBS9K2Gdalsr8OBJNN8e6gxg9r7R
         Ld+stOB5TJ3Ut78aWfXYOxAxLOVdn601roaLrsrLW+0nhTTTklR7C1wVejrmih4oIc2R
         rTLw==
X-Forwarded-Encrypted: i=1; AL+hErF1+9uq4+naHHU4T0k3p8gR0yx6TMcrknJW8oOP5QQCtSIh9RyZU/mcpByxq9mwo7YWP7Cq/Kw1a6BaxMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I/jVWu5UHiXn1uOl5B98SW6NkIW/ra2DmtHOZAEYk25zlq1to
	K3jGlLOp/Y67opFHYFt8lQv4ND5xSWzlcMTwciSWnySfMBEQkgeljzSu
X-Gm-Gg: AZFdTZcRLumugf+fG67NmT+EC64GtTkgBkZbMf2xq5wbl9Udi4LAFAhnHtJYzu0LRQa
	1D8NXqaJ65hLM+5uQyQoCxbxRZuiRLzdlZ4U/1TLZ+41jMC734CBlHyTjmvX+2s4B2V6YrWqrJp
	hTQZoGmSW+S/M51fnvDS2CrOOwi1jUl1OnpY1ZgBuSvFUP15meLQumeaMwFynT+b1WQpG8b94OF
	sx45FU0EC3VAmx5As5ER6ndzWFeZQP+s6tTvyue3FAmtTc2Mqb1rlT4M5SwfpUaFoOrgVI1pauC
	8dh0BHHGfl7qQTYHWC0D2DO1WcE7s3vmyqReiE5TESlUNWAd0xYszegjd4YCJ7k01g+6uPUA1M6
	SdcZlV9RcG8zml2MeLqwYdiVc/hfdpIs32mkX6qScWpXwib3O+/MSTnvwbBDsFGd9W+t/5mhq68
	jHQbWJ+DV/36q1R7R8VCYJ7vukLWc8drkj/cMdvQM9o+xqd0CMc2ySgfHP0Y/j378udSqaECdiW
	lll2dlSvG3bII2VDQFf6RJV8m7TuGzf4ViufzNB7eHvjtn9WWZi4sS/QXBVDdtmVCLZc3INEF86
	pEWJI0fSi2FIRI471vQC0oyDQVgPuuQ3VdUQaN/PrgdWUxW4odE5XNKTZ/gkDFQPEq5gb6a9IaA
	q3iXbu4QklKGgxMFlQocEOsY=
X-Received: by 2002:a05:701b:2815:b0:1b5:22d1:1eb5 with SMTP id a92af1059eb24-1b55693615emr22539079c88.37.1795716718270;
        Thu, 26 Nov 2026 10:11:58 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:57 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 9/9] MAINTAINERS: Add entry for goldfish timer driver
Date: Thu, 26 Nov 2026 18:11:01 +0000
Message-ID: <20261126181101.3715754-10-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
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

There is currently no MAINTAINERS entry for the goldfish timer driver.
Add one and list myself as maintainer, as I already maintain the same
driver in U-Boot [1].

Link: https://source.denx.de/u-boot/u-boot/-/commit/909f717eaf29 [1]
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d738990161bd..4e3c24b6888e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2078,6 +2078,12 @@ M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 S:	Supported
 F:	drivers/rtc/rtc-goldfish.c
 
+ANDROID GOLDFISH TIMER DRIVER
+M:	Kuan-Wei Chiu <visitorckw@gmail.com>
+S:	Maintained
+F:	drivers/clocksource/timer-goldfish.c
+F:	include/clocksource/timer-goldfish.h
+
 ANLOGIC DR1V90 CRU DRIVER
 M:	Junhui Liu <junhui.liu@pigmoral.tech>
 S:	Maintained
-- 
2.56.1.839.g22a8290db9-goog

