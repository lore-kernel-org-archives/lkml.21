Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795342688;
	b=S7XBCUskQJaDrOgDR1HZ006iFd1h8tCqEKdOEGVdzNnH6BNuqroJBSR+EFXIHrJ3ilM4
	 vH6w7idgG+ai20AvuWv5N+R+qFS3dmANyuuNFyq9XrD+sBl6H8a+2mc4aEG4KYpNlv/wY
	 ZceFGOC4/fKkzRYRBZ1XnPMP3pwytQ3F5R8YGK25mrclNjE8NsAW8j/AQVOinFQiulATd
	 XOtGDQDwXwIGh7Tg7pP9ZjV1Dib3/+IwHipe9ojR0mxwLJASLL2a9jc4bs9VvYpH8T8xC
	 uwm6esthbSjyVTUAewVNxEAjdNdBl271LZhpCdBizrpUzQuu8itdm2lGZSp4M9doiMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795342688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ph2rx9fu8uegZW4FmXu9ACxG9GNyZ62Lgq4kaeRDI/o=;
	b=PiqpL47ECfP7bHnYPC3EY5lxSpe7HeeWpsenZJp2P+AweWEKveb86fALN3BTd4AL+iTx
	 eZ28ktNrJivja6wAkvRRgBONBh4jhAryW5Sakm/8Dju7khkJZO6DTFdlTFQBKjmUjjFmn
	 KkyOjL+rENadBduA6uZsptsmq+Pnhf1t69hlE5FAelJzWyvWTpsBBlOzfYtYZXgmfH2zX
	 7eOGiO+CTzmfGcAzlXjqj3GXDELL/zzyRBbN9ALBqpLT7yUaurPDC354O7jlXGFjSURj5
	 xFjq8jeWW6MJ89YpjRipOxIeeScJsO0uu0I6j9/5j+EyWNLEcdHApNE4ceNU/McOhdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zMsJbyIZ;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C601606A332
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C601606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zMsJbyIZ
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1955348a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795342688; x=1795947488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ph2rx9fu8uegZW4FmXu9ACxG9GNyZ62Lgq4kaeRDI/o=;
        b=zMsJbyIZCUHEcHpZAwVHTDluKJwKBGdzJPPBhb+QcTL86D45cSOV/YULbZSxUNOegU
         Jnu5VtLmCfpHaJbhjwxWnBE6iJK1SVZbgwb7+e5lDNGw9QwiRVWRj/T9Uoe8Ngmcdbeu
         PpFF0A11F3eA+UaDNNYdgAVOoW9Hi2BkLaAb9nQIs3IEDi44GmyAvwBD+eyC/m4SjuwT
         K7Dkqkvqtey82M9j+qJxcZh7kh9EaK12L41EB/bBxlQGnteESbP/r993X/e10VgSJT/t
         EXRPdq9dciXamJek6HMa4xK/AAMfulddQxfRh6kOw9oHXGjL5NdqNcvALMlX40PvAmXO
         +L5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795342688; x=1795947488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ph2rx9fu8uegZW4FmXu9ACxG9GNyZ62Lgq4kaeRDI/o=;
        b=1KkS3e8VFvAwSYfWQYudQ2brpEkEFmaD5GGnxKRG7hG3ydioTsuohyQk0RH2btWRFZ
         xmorlEPJ15lfaGszrNoIzvCCRCO6JOZ0ctsoxPoYWOsG9PrKYY1Em9ENKtHjD80dnS0U
         dvnefOXjiY/cB0/msEeVnm98sDXQLdtzf4nWc0QBJSBiZko6+XXFl3vBG1puzwmXkS6x
         6puF14bS/mSXfrue6iaCgcAjbwvathNWznAc08IMyIW771R6mVx7Zw1fRA/Lw/z06+Uw
         BX5ylaBaIH7UYQB0mP1NfPO2d2YJzMw4u23+RbCnJ/8S0oQnWTYuepBZrhG/mAdhHiWX
         qvpw==
X-Forwarded-Encrypted: i=1; AL+hErHh6HRerPNZDifiXxGdNdQD5ZXKbD+aFRKWls9oy9YGowicUR4BSLlsvl/IkIaY+HP7l0mzNcgb97pT6S0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YBcgd5po0uHIEnU4FBgq4uO5KUtKrlN95Gs5IhdSeZO4tSsLH
	i5xakOxV6e/1r5kagJbQv3KMw9mPY99fNtyG5roYZ8+TQHJqB3vk3r731M98YwEq4/PpIA==
X-Gm-Gg: AZFdTZf7Wsmd8QyVq6tiv41owrSSAASKwfTZssVMTnq9kXRV3L/LdrOPXUD+kiZOUT2
	uGwkLpKwptwGY6zTBVTMy7krbSiuPgPUAIL2cKbTvkzYHgUAVZ2wjnYuJhjOVNrywc7vA4whUrt
	1VtzJTsJOPvQdHSXMHDQfAwtivqZT4xBfl63RhOMQ+XmPYITgUQVTr4CGZbVIzQf5TmBRBEDrBj
	n1G/t2OlabU+UbYiCDmcs4ef8BSaIIOtnayvHg4RB8hypvPQF7D3z5cHUnTc42fTPVrbIg0Z6aC
	EWuxmILfLL/V/+2vhs66GbxJ6C6w6g02W8DZdyxfG9ETt4Sk5AzJf+aWDz7vRM+xwi9thnjkNDh
	TwPDHo6pZN++QTrAp+uavnYTSqxoXuYwIs7TK797l43+n1/zXY+2v2/4YwXtqiXXEhU7NnBKWN4
	L1Pmb46Ngg+Ael3J0cQdaKPtnjsr2NfpFLYFvFNBgxwbv6kQCrdwsgO5hudo/edaNNJEln8YBKY
	B9FIug0+6Ex4mDBF5FddWxof4ZwX83NHc/nJb/8xmFeL4BrFpbSosQjoGIFn4zpX7KUuydvcU5b
	VQoiJntBF/j8mlumGXpBUi2sBph4qgfNBl9YF5RFGXzKlT9OzBY=
X-Received: by 2002:a17:90b:3f43:b0:3b4:1621:ba74 with SMTP id 98e67ed59e1d1-3b41c8fe3a5mr8501493a91.17.1795342687728;
        Sun, 22 Nov 2026 02:18:07 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm14953787a91.17.2026.11.22.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:18:06 -0800 (PST)
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
Subject: [PATCH v2 1/2] ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Zero
Date: Sun, 22 Nov 2026 04:17:58 -0600
Message-ID: <20261122101759.206056-2-artem122novak@gmail.com>
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
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
index 539c19c10946..e01f668cb9e0 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
@@ -7,7 +7,6 @@
 #include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
 #include "bcm2835-rpi-common.dtsi"
-#include "bcm283x-rpi-led-deprecated.dtsi"
 #include "bcm283x-rpi-usb-otg.dtsi"
 
 / {
@@ -101,8 +100,17 @@ &hdmi {
 	status = "okay";
 };
 
-&led_act {
-	gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
+/ {
+	leds: leds {
+		compatible = "gpio-leds";
+
+		led_act: led-act {
+			label = "ACT";
+			gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &sdhost {
-- 
2.56.1

