Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795342691;
	b=RFSAK7vRIlYvPkvdtHqtIw6vfgBzMy/znDxHyHbbVdJWuqAPoREve2tSCx1WvgohlNfa
	 1BsFTcMAEMrlFbYxSMkDu0q3fBK4OOMzzv12Kc2zAa7vR6vUrv8Li407H77M7WEWpcH9N
	 gu06rcrs8V10K3lcJHe40Qhq9PROMIFzCNXQVPs2h7hlAVMNF/KyakVaFfiP3aQRuLGjH
	 pTm5uG7DXfQtwGGIbB9zBi12vYfKsleHYxzG5rt8cU0FuAB7CIL4RmnzmhDRxro5Hanwz
	 JzLhNlMakOxIx41IsJye+uOy9L7uVqz/67cvCDZsKfzq/YX4qcaHCsjz0QVa46TpWCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795342691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oCpV49nOga8AoZMY7yHg06vfkscs7oJjLDcTlwIf7nA=;
	b=ZvCyNpoVvN3VNeyfsQtI6c+RmCclsTc7o3B7aUN6/fkIoLYmbImlJKYilX5hilMhO63s
	 tbZjfYdX0lvOkhIskEttXn11ux2wDG5WGm5q5MWni20asp3LTcd5pW7e50KP+2sLYbLl0
	 hgjVs2eWtOp0Kn9nOJC3cMHPE+wF2MKcM2OqeDSbMIaVmH1humyzJ/3QJ13jOBMVj2ZOG
	 MiiwzBrep2rIAR4263ds/NADnyysYkctdHuznaecFdWa+Jfx1MNxYI38PSbreNMbyUOzx
	 o5N5NpTrLQo/xmLZTveRi2efkJjSxRLv6n7PXFPabci0v5l6tY/zKpDMu3H9C5oEcow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g7G7xhn6;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2082B606A33B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2082B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g7G7xhn6
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ccca948203aso2400353a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795342690; x=1795947490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCpV49nOga8AoZMY7yHg06vfkscs7oJjLDcTlwIf7nA=;
        b=g7G7xhn6BKkNkLuaikWbY4K22jSt2/x180ZFzhvcAu/sv1xzTxeyrGpK3uy5TAcEz9
         jo8tUHVY/xpcRGQmCDnDPmHTw5ECPKoRT92POP28b5TGwVooKlgruSWjKTTMZiin1dfE
         x1JUFKigPR9z+HTPfW8SJkNnJJdvuWWF8RmHmzkKn9bperFFO+JzuzmIHmDD9SAO48t/
         +kHUa4j+CTYyGm503MCTnVdRPAj8W06BluKIwYy7wct9gDf32xUtQx9xQgc0lTzYLRY2
         /Vm2thBE5zOWl921kN4UHXSEiWENojKWKLKfVqS3qc845F5GY1djR4ASXZSC+Vhzgj3l
         dbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795342690; x=1795947490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCpV49nOga8AoZMY7yHg06vfkscs7oJjLDcTlwIf7nA=;
        b=QfIAyG1Dz91r6RgmVmvrQ7pC1R+xqOnzEQ0oY33jHCmsiMQaG6Mp8ZluZcZEpYGhoF
         5GAjnU1m5wEx6lWmM1eEV9TlR4Sunjs3f3rZ1peamAQiASlP4m2HR9RqDYeiqr2BWrmT
         ZSd+NBRse5yqpmfdZ6MJSs/ithRq4Kb/UyVcuda9COcAApT+8idGeGWk+ug6cCPeUZ3C
         LCgjhc63QM0ZuLDLq4DNsPc3HKYs3ssJnxLjLZZbQtefhgxN3vcKTs2ubj2AFzQRw5S1
         C5lGUcw3aj2ZSrMXBz08C+s14NpL0yCqrIOkPUrPnT/URDJ0aMpItGRubks4sp5YIAcB
         8qlA==
X-Forwarded-Encrypted: i=1; AL+hErFPaVp8QC4q84iqBCU0sqLnD7sq3qoA/T6m6K/ML5srra56oHiJ9hAZ7D9DJ+hc4xKRGw2jX8jtQZAO6o0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WHpi2tUwM9oAEk0XGOwBhlalMjgD/fw1LQNNiqikC64hCb/Lv
	+aaZSjZwq8PZf0Vu/rCx3jAiSeum6/rwK4WSVDAAxjp4x4sMxSalF1wr
X-Gm-Gg: AZFdTZdAU99T1UBlm/kk3OZzD/Y1mQLrfLCbtAD+gcC+pki5REf9y3mdX+/1Mt4hHwb
	9ba26zILVO+BJE3x3Ajqy//Ni0iE2QgSOxeTJ6iZzAmUnf1g41tIgTIN7Zii6m3pIFN0D2ILTuT
	04Pfh91bSXMoDvoMSI6vNRl0QwhRhAqXkDHJUpt5nc4AmmXrNEFOahk7cAInCDSqJsDLIZyyrSR
	XPNpKXxI6VTSPxRFUzINJDxpUK4DsCoCSDQQu10a05Kz5naGwxJmzPAYSSqFp9UN0GvguBs5Enw
	QH1ncyFVGLx7rrb1wbuAdlbfdkTQf9d33b9iNT0Yjw7F4XJBXXetstyN6GBPhEzinYScxL2oxmO
	08XvfxjU1zqf2Ycl1p554UKODGV0zCAGi7tnEf/beAXiQyn04l73OakSKAQXhZ+PIM0zx7Rum31
	MjTUHhTFInV9QqK7a1UMyjgBfIrVgxKgNPajEgYBmUdbwHOMriEre5+U72hIJ4zl4xa9eJ1rR2A
	95zYTHRHUDTon/wPHkxdp95uPWmT7MLhxK1UD2FYG9JNsUtcJamW7UKQMUTBNDaXRghjmZ0hru6
	eT6ovLJmVnRorpPUPy0n40VL79jogl/HFshsdz3uT3vr5OGjWHU=
X-Received: by 2002:a17:90b:1fc4:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b41c98a43amr7026493a91.52.1795342690497;
        Sun, 22 Nov 2026 02:18:10 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm14953787a91.17.2026.11.22.02.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:18:09 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	robh@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2 2/2] ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Model B
Date: Sun, 22 Nov 2026 04:17:59 -0600
Message-ID: <20261122101759.206056-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122101759.206056-1-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
 <20261122101759.206056-1-artem122novak@gmail.com>
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

Preserve the leds and led_act labels when replacing the deprecated
LED fragment with a board-local gpio-leds node.

These labels are exported as device tree symbols and may be referenced
by overlays.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
index 72764be75a79..660814ce851b 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
@@ -3,7 +3,6 @@
 #include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
 #include "bcm2835-rpi-common.dtsi"
-#include "bcm283x-rpi-led-deprecated.dtsi"
 #include "bcm283x-rpi-smsc9512.dtsi"
 #include "bcm283x-rpi-usb-host.dtsi"
 
@@ -93,8 +92,17 @@ &hdmi {
 	status = "okay";
 };
 
-&led_act {
-	gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
+/ {
+	leds: leds {
+		compatible = "gpio-leds";
+
+		led_act: led-act {
+			label = "ACT";
+			gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &pwm {
-- 
2.56.1

