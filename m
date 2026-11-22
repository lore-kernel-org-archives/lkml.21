Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338480;
	b=C1lVJUPWNYJ16EjjnD4NtRCAfq2o9LZ6GOBdAxEvHOIKZelKIEuhXPGnJuFnBp+J+IYm
	 RZPjYWkZP7IGLdnnDzPgxKBq+nDlh2rEj7rStytDgtMf5uG9/3GxxVR7/3oriwe3yI9pX
	 HHHY0P6EzMfGs3/XG0JoGXILdevBa2IreTZSgXowAkMdlpfc5fL1n35Cv6edGE1iuzkQc
	 eIDjDTu4/tao+y0Chw4Ui6b2+I8rKz+OebClnOVjOr2CULeymUWwiTYjSP+92On5huqCd
	 srm+MTNWLE/fmDYqIor74cYUUFpSCCXwZH5aBa4M2ditlTxpX+UchpRaDRHeK5TZEkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FzzE7HZCozxGjLrr7Gn9UqXhwvi6GyDdNSIP0zo32Hg=;
	b=gm/qM78msQpCy2XBcmtMq/GlKwOg+kVuXp6E2Ud/WylzDmGuYe9gTqtqISNIfyHdbb3d
	 nbrzYyNulsc8pHIucAFLxtRJdftIfwai+3LE76hqGVfMNiQB/OmDeyL2V6VDAKMwutxKL
	 RPGmHWMWlnWTRmcYjfUw0+7LuRLFX253PHRCo+I6S5XXxaNgxnCmg73TUKCkq2Pq6JPC7
	 A/ndj7G3ZYDnG3TswRQtD3f/A9j/sx1IsJZHWQYbbSe2201Yv0XFEJXYvEsyJcxZ1JFZI
	 HbNBgw0Nya7APrULfhDUf4e9xlbp2wbeyVJXJQRNEGAj2b/a3ZYm6wO+47rw+W03LWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=koUYZ1e5;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D6F606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D6F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=koUYZ1e5
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1060147b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795338479; x=1795943279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FzzE7HZCozxGjLrr7Gn9UqXhwvi6GyDdNSIP0zo32Hg=;
        b=koUYZ1e5vMcSg22Vqo+dLz1JeO8PfV60nbBgRBQu3kyh0JHuA1bVtOFCFtFoSxTVQ5
         xac91m3B7no49EkRumMy+d5hj2hkimLOIaJOww69pOqnyFt+bzdzPAyw/9sf7mQIF2eK
         cTOQvr57IFrOnCwRnBk+pxkt30HdOv7uBir5piufxwjdW4yeCIGH7t9zN3YbHdhxFVxH
         6v+8fGFIBioRffIc/Z1YovJ4QNC9jcHxLBjR//MAMYjlzwozvBHTcuM8tHpX+VAwvvz8
         wuoxPqZqQMGLiTTohC9uygdtsPvZxUZ7+gWvLqe+28LbzT1cabILV8tg2KasImKbK/fs
         KqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338479; x=1795943279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FzzE7HZCozxGjLrr7Gn9UqXhwvi6GyDdNSIP0zo32Hg=;
        b=prPsprFGguf11Vyx0oQhk5lnyA28k/sOQKM2A64wT6etcBrT9a1BgT9lvcn3bw9TqU
         wNkFb1mjrFZB8uxlAdZ7noxXmHQ0psOK4zw4VcW1/4RdYPM+Kijb4BksILk5otqh1RX1
         LPL1jkYbAnn28f1FENSsPgir5o1YboxtXhA0s4SSxD7EhcpB8ipSfPxOVI59mNLfDiux
         4DAI8v8izBn3GGTHrljVA+Qq9Posr6GTxZ7oPKVDUaVH9gaIro4IHh0HlsossEK3Uqhh
         EVX4FclMCbXsutKQM3hP4Fqe9Qg5vcSGJZt+fPKgW8yOoSHlIpq4LTjKZlMD4/E2zCFV
         preQ==
X-Forwarded-Encrypted: i=1; AL+hErE8wPDzUDp2VxYGC0o4QKYGhxPd1kK2rE02p5TGFSXDc//CpdOaJqw80Oc6LbhCD9TpD4muqY4PoAD5KTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r9qlASUljRfJsM/8KbRVBUeOInTFXQrGKo6mf/IPKNa3hpxkK
	yV9gsHhccZ8jv/tfQiueST4wecTgphA32T4EZISaz5Y9HcUp2PcChOOw
X-Gm-Gg: AZFdTZe40KfgwCQs0inXlgpoNTML+mSfzgg3wFTz3nIWJBK3/HiykXiTnmVaeASvgA3
	qhG6da57w4GpkhHWZBYAfoOxBS73OyakX+MqUuW/+M9+IgW1/LZGqhJU1EF+tnA2n+AXGKkZxA2
	a3+YadgQsjs7xC+NubLXzCUY1xAWs39KcYsmE8kMUdXq6Lj19Sc8gU8C0bIsi8ofPtpbhGSuTx8
	+zbEeNC3ITl6x3MmZnGrFASN5e75rTAmVM1/DzRlFHwQtFYFSeF2FILdeS08Y72MOfyFxTvtEz3
	hO0aI6sTd2lidOHXH+ENMGszGcToI+QPZEPiffoFQhSo3XuTYSJn6Z5pE/7rVh8HbX6amb1yv5V
	JWvd7CGtu0aRIkAPyRaZ25bEjpxSnH3fttQS4uQI/YxTmLJTIMPa6S6fiKvjTg2MgvHWify6Fc5
	6SnNjCd0kT7PmSJH4j3K+QFn1HgF2VOn+SiukvDpyQ0ryPVWcf09fofWxagxkJboCxmo/beyZy7
	Tny2Hv1O6IadRfFaBIAwcNty/jrs01tT+5ia8JMdZ+3AdJs1z8wfwJB5/TTlx5d/HCrv9urbjzs
	WOqYMVmeebcx/w0xkAQdTmz4R7Rf+0oqE7oKGHzbVF1Er1Xb3X0=
X-Received: by 2002:a05:6300:8811:b0:3f9:b4c0:d3bc with SMTP id adf61e73a8af0-4014c94a9dbmr7480537637.24.1795338479155;
        Sun, 22 Nov 2026 01:07:59 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c86d821637sm3892624b3a.0.2026.11.22.01.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:07:58 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] ARM: dts: bcm2835: remove redundant CM1 LED node
Date: Sun, 22 Nov 2026 03:07:54 -0600
Message-ID: <20261122090754.193072-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The CM1 device tree include already configures the activity LED
through the &led_act override. Remove the redundant child node
under leds, keeping the CM1-specific GPIO assignment intact.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi
index 750cd76948e3..7554903323ed 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1.dtsi
@@ -6,12 +6,6 @@
 #include "bcm283x-rpi-led-deprecated.dtsi"
 
 / {
-	leds {
-		led-act {
-			gpios = <&gpio 47 GPIO_ACTIVE_LOW>;
-		};
-	};
-
 	memory@0 {
 		device_type = "memory";
 		reg = <0 0x20000000>;
-- 
2.56.1

