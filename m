Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341157;
	b=JgLzlPxO6t2E93iDt3XNB3yz1mMxOm5YaWHKvsNkwrWEO4PFfBY31iO3mkXnSJSdVZn7
	 uCnQyu+Wv4x54IJQZdbFt6Ubn1inOJ7qT3Hg/EaoZEVF9odB6UNY1lC/41h9z4yj70ZDi
	 a9q5Mgak5Kl3aRcNZO2nzXfWXfoy4lFmClaunNHy1m5vKK2sN4LWUPoSTRx/M9TcYczt9
	 Zs7O4WHIwS7b2WzizbBXTOW7d3R4PA/A7A8VCenGqU3czqY2QCsNeTnkRsbBg3F3dSmwc
	 rP/AwxcJSBhP9ilOIoWkp28pe84VFeN7sYygBQa748Lrd9rkbTPVLiYhBowrv2Q7/HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1hkM21HuHsoo/xKTtTZspcbr8ShtbfKXKLIxiD4q2iM=;
	b=H7OeMGuZ1P9IcrCykQwK+sMwu4ZLqxvuTT8FYiLd7PWYb4auIx0m5yp18vmqpqFOrHXM
	 fQwG3fxrj99mPUToIuOqMPJdX0/orxfkgJj1wzV3vDIFF/wAdYodhEviVOydLqNaxl7R3
	 aGheUl1i6/IHZR8SqCOfWtav8L6V/X+hiklOH3ahPzbmWEkUQHW8YpCgFDSN/pZdgC1Nw
	 Dl6bwLfRaf5TJNnoSX3/ZRiCIhvw0IYSHJdAJZ54iRwg0x/FUhRZKwFgp/Ru58GIL2tvo
	 E367kLyYI56QCx2L4EteJWcRH5++PUSnlx7MEeiorumQ4PzohI5frqRmmNa1hLUfhTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jc6jAil9;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CDD606A338
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87CDD606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jc6jAil9
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1279913a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341157; x=1795945957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hkM21HuHsoo/xKTtTZspcbr8ShtbfKXKLIxiD4q2iM=;
        b=jc6jAil9z2zvZbxO4xGlpYKIJ8urF87mVF1dLL66/t+8qftxuzdOmfygxVPIQp8kx+
         o6cEKdjm+LwXNiBkQnS+dQiOF4pFBF5r47Y7Hs5Pm3Vetzjo38ugwkP+p+ag2GXJYB5W
         wxLknGQNRDr1aruFnn3fdgekO1gtkg4PRQ1hG1UfE+l0az80x1vCd1dIIGUDLUMGXmw+
         Ed1FK24DtH3koPynxUZC6IaQ/08DPEjq9qvfq0z6A6mhbo68wPep5Zo3dwqiT9tayX+q
         QWQ1qVuQss5xmRXXujiTMbT5gbwxlOXWC9C0ATwBoO2mTrJH7nVci3U1BUG6XDql9DzN
         Z/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341157; x=1795945957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hkM21HuHsoo/xKTtTZspcbr8ShtbfKXKLIxiD4q2iM=;
        b=gGT1qzhi+8BA/WviYkE5MR/WgV5JL+9FQrYTCY4K6KBD3bpWjXLeSdk2t+vy5kvbhF
         Dlg4I/V1jNWz5myvbDcU1ls/w8mH5oHFCA6OTAzwRgSYhKwlfnrFkx+jiG8GkTSf40RH
         yV41HJrXpePnFGk7DfBV9CRmIwnAwiU3XvuNSDl3J52LlxI2P2xgjbBqBis0sbS7ptMQ
         1zJ8j7Ki/kbmyFJcLZ9vu3qOtmfrzgqN4Bta+P3WalTL5yvtIB82GgSfW+OZJIWEsbtj
         aXakpA1M0mAKz8IE2oEJ5zD9mOa918iKlWSOkrS9v0TueH1m+AC7aBCtpzD0QBKRhHL1
         6UmA==
X-Forwarded-Encrypted: i=1; AL+hErE4pZrQErxfjwjvnQ9HJ5pr0UERhTxWqQ4PoNpU9efIRnN5nhPD6lP4SIKn1WJSc5kmKJ3mO76E/FjyPi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V/FHpNzXBwwYXPl8+SO4JI1179/HBhE9qR+JwQRlOn9lJTJoZ
	4IhJbU47117keJ65QJQO7hMIM9ay/BoE51KekNDudeJbz5hJhmGcARJ5j6XF/1chLnobkQ==
X-Gm-Gg: AZFdTZdeqblfxU4a1ZXMcorGXRZG00X5uwtnJCUHdR/4eSdtpfFslAkJaTYWWrNERqW
	fVUk/sl/eya3AYogd/LRsB6KMNYUHhgxehpUXv+wFfChfCBC5Uuo0iKMoh0WVdR9ipFNWwpbE8B
	8B7EFaLy2DUvDFh0TKJqCic261JuPRGtAVZeXlZH+nRnVRNPx6odg+M4UyOQQQcUIw8cG/cw8qG
	qNLW3s3FT8HZMqMt77btFKpPVFS86PQKgnQcsjbx1d6efGAC4O3+LoZj4NfKr4GTDV8zkQJNvYi
	LbBc1BKadszOWjo+70bi+Wt+neUhepA1itWeY3d1ZEUpBDKmg9AGLzrkZ9pXVP70Lfs5NiKrLig
	avstYTvAW9h6uZ5a2IlmCEgmJWBEN7QZa/+wv/1w82E2F9AyV6tQE/AgCikiS7Mux1+LvfWfECZ
	moB6B2XGsx02GwJpb+7PwpzYtZ5m/pYMPFgywRDvHS09186/yT9pw9RJmVKuawTlMWDULQBU+PZ
	/o5lI88jGw20rDq53oVZs34joV3ETITM+FsY2YKybOSa1woBKBjxZj3wL0zJm60ZW3Vp2HYCkLi
	JwUZ3dTSKXTopSWgwCMVXOSbwZJdjaT44H0XIXtGRXmD1dHlq1g=
X-Received: by 2002:a05:6a20:cc0b:b0:400:a999:d213 with SMTP id adf61e73a8af0-4014c25005fmr8350276637.23.1795341156757;
        Sun, 22 Nov 2026 01:52:36 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm3289722a12.18.2026.11.22.01.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:52:35 -0800 (PST)
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
Subject: [PATCH 2/2] ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Model B
Date: Sun, 22 Nov 2026 03:52:25 -0600
Message-ID: <20261122095225.200916-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122095225.200916-1-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
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

Replace the deprecated LED fragment with a board-local gpio-leds
node, preserving the ACT LED GPIO assignment and configuration.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
index 72764be75a79..040ba7f45216 100644
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
+	leds {
+		compatible = "gpio-leds";
+
+		led-act {
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

