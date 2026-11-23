Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442283;
	b=eyoJLW8yZsFFk930hRqlqjBt0SJ6ayyQM0spGzcyet/SkC4YhfyrcWeli8Elul9ruPtg
	 QNSuaMqWQ4W41xXb8ybx5E4ZkNBtF/TMVaA000cKNb8hI7zPu1yfF1JRzzen2Y5juTUcQ
	 VJhAl1Yi03tgXgHjdGYiPXtOLOikKSyjkHEkr8oD3hUhNg8CosTa89V0DE+x0UZs/2AXF
	 00y/yzRfh7pDLQdYUW2j/bngjrEsZpT1Wm3IspeWaKWwQl7wwK2kwXZ0Ncd66hqCx/Uuq
	 z+itNHMoKOmfAHDKHlnEkTbAApRwgvwcjkI5ctfHzxSjnUq3dakikznLgfdlTVWzmGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rNrAG0FwlseYPe/ZdyatSVBSgZTqm1Xim7o4c6/vvS0=;
	b=vMF9agxdr4N7btDDzA2+tcXPNS7hBQe70Sjy1knZUsiXtlO+seYLrySYnWaAh9bP7nub
	 psmCLgM467yRd5nr9/wckAjrb3c/CSFbO3SjQHRq1s6OXojGdYlGTazEDZrmXjSsHnYIk
	 /wwuZQdxmRGp2kG1g1O3I/qipSFqtl60kVorBtod29vv06Jv/1bsmlAiWJNKEGerKP7Wq
	 trJC7+KaumXjvtq8L5KrTfSzdbymBUQiQCK8Hp2woPKB0nk/UAp4AmmaO55uKQxQMSIzh
	 aqJs+fGKA8jIzK8X1X+9rufx5qBkjesSwJDWhc6w9GDnAphwFuoqNTAo7enDZj99pWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEy3pcRf;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0708606A6BA
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0708606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEy3pcRf
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2313132f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795442281; x=1796047081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNrAG0FwlseYPe/ZdyatSVBSgZTqm1Xim7o4c6/vvS0=;
        b=sEy3pcRfo8cHflY2T7S828p4717fDh7JpH1WhbLZ3kQUrh/oxE4KRMjg8ZhO9ERZD+
         ubfr+eE/zfEmyrgXj7IcdVVJZZHulIs3OGfUHnlaFdRRvWvOtTYhsfkzKmpXJilNcnLZ
         nRxKCChVnFAwAD9Rrxaf0M2kjjOJcHD0ReQDNia6fMazPiqm5V8m3/emj3ezbbIrr8fE
         M0xbRdBEV6q9Zs5cxgNVlyKUBVcjvbleDkf8jyDal0S+jbSnbeNacUaz4LqTTfpu5D/E
         eiXNzDlrLwQW4FsrA8MeV5SwuP2FR9fXtBbsQJkaCGbEk+bKhC225XT8OZMKyMFpLRoH
         twTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442281; x=1796047081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNrAG0FwlseYPe/ZdyatSVBSgZTqm1Xim7o4c6/vvS0=;
        b=Sx7hVMcKvsp7T/nkSnTRYlzZTc0Pkl8Xi+AWiTjDPJSPTJNmpgPS10Yuwfaxl3oPsN
         j0DzdzFpn1+pxpN0hKTbIzww+su6WrcdnkMCtHbOszqkEHf4A/9BV4ea24CQvnA/HLUS
         KbocKAc4XPZFVvIWzt+Dr4Dzr/uteBZZbO2rY8DsNoPJLSDdKc0e3aFTYMtELnfzbzcF
         OY9Ae29XTc/h51hg4Bsmm+H3OrPNkDpzzR0BmVLymeDzt0WT4p8K2IoMSp5+kMncfBtq
         7jL8JTtp2qtUdTbi/JjG4dpiWIyfPnrit8kgcehnUJAl7HImofiDKViMTLuplAlEXAtl
         GQUw==
X-Forwarded-Encrypted: i=1; AL+hErGET7vpW5Rz4kfolqqnunfBvaMTQ0OjCs6cQjYV69oaJhJKo7lX5jy4H4G1AVy3xg60a84wP60aligP8rg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tR4dEJgFV20lMyFWdfGUET5sUO0MSUgbe+Z8+Ppd1+hxByNdZ
	ncp4V2q6cdcd9tm0kUh0lHyNLcR0tkG3YRcPgIGXjEBwlB5E9jr1GGiR
X-Gm-Gg: AZFdTZdWEn3wV1v/d2LYKHwekmLW4sxQOdOmtima9dcLJ3y1Grjci7LzjZ+AGohfuv0
	0KDo6vBkPvQmUKGx3o4cCDzs9H/TqZwc6pv33BS1a8sfGUCekAZlUCnI7/udu8Ao9AKFus/bcos
	uQ4Yj74uT0irYzWb73VL0FixIzctogurNJR9SBqdvWqgQ1AtgioldHd+hHo9Vy295ZSug+k2U51
	F2THl545dppTSyO/v3xGEeINMsbcJ+p5lK3k+C4qGW04/p3i2EuvNCOws1FfWUDMUanEC6ccS2j
	jAvEBUb7JRVg8pb59Ghhil19xMlGZIJr2Voz87JL2YolQKnfifWpLps5yJwul1yipjVCcX/jPdt
	vbauCSnYvGGlXqgRKOFNaXpTtPAWtwgjGgJFQRipiqnaY44555VxZ+SG3CpPnUCAg1EsXhtECXN
	TWsSafFbWcQ2SZLTD1PeBQhDYcu+iHS30JVw8UPhJ2R5QuB21REVGvmTUHZDV8tCQLQV7xqE4/d
	ph/UzzvbAo6WO3AQaj0tBkWYMudDdIH/ckcxLNp01U+sF4Mkj4q3v8pxDf1Q9wir1tYcMzLw7tS
	Y2WvrsvyqrHZOhmW537IpB2kNqIRO7LwygZo91Nu6duoDmja1YwvJ1U3dhFJujwOhg==
X-Received: by 2002:a05:6000:2409:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-4aba56f5488mr21665771f8f.0.1795442280851;
        Mon, 23 Nov 2026 05:58:00 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d6f4:1401:6558:1dff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm22109308f8f.36.2026.11.23.05.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:58:00 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 23 Nov 2026 13:57:55 +0000
Subject: [PATCH v2 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
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
Message-Id: <20261123-sdhi_rzg3l-v2-3-bad3a6358849@bp.renesas.com>
References: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
In-Reply-To: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795442277; l=4238;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=SdO9oPTeSId+gQhJbIDdaFXl20G3i+msvzfHkDzH2Mg=;
 b=Oc+V/0XBOdXK9fNQw7BgpL4HoMlMkSLmcZhLE7VBiY4Fks59eEM53bZjGz52HxBOdwgaK8foJ
 O1v7zPBqfHeCrxztvDiJiM5DbCp3np/XDuc1z6q9Y9lW+DqrjaFQWqh
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable SDHI2 on the RZ/G3L SMARC EVK platform using the internal
voltage regulator for voltage switching. SDHI2 signals are muxed
with I2S0; the selection is controlled by the SW_SD2_EN macro in
the board DTS, which must match the position of switch SYS.4 on
the SoM. By default, I2S0 is enabled.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2
- Added a comment about the SD power signal.
- Collected tag.
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 11 +++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 88 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 3699712d8bf1..e59126e7ff9e 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -34,6 +34,17 @@
 #include "rzg3l-smarc-som.dtsi"
 #include "renesas-smarc2.dtsi"
 
+/*
+ * The SDHI power signal can be controlled either by a GPIO hog or an internal
+ * regulator, so a customer design can use whichever matches its hardware:
+ *  - SD0 does not have an internal regulator, but SD1 and SD2 do.
+ *  - SD0 and SD1 use GPIO hogs to control the power signal on the board.
+ *  - SD2 uses the SoC's internal voltage regulator.
+ *
+ * The mixed usage is only meant to demonstrate both options. It is not a
+ * hardware requirement of this board.
+ */
+
 / {
 	model = "Renesas SMARC EVK version 2 based on r9a08g046l48";
 	compatible = "renesas,smarc2-evk", "renesas,rzg3l-smarcm",
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index e64a611aebec..fc5ed4907a65 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -42,6 +42,7 @@ aliases {
 		ethernet1 = &eth1;
 		i2c0 = &i2c0;
 		mmc0 = &sdhi0;
+		mmc2 = &sdhi2;
 	};
 
 	memory@48000000 {
@@ -355,6 +356,74 @@ sd0-data {
 			power-source = <1800>;
 		};
 	};
+
+	sdhi2_pins: sd2 {
+		sd2-cd {
+			pinmux = <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_CD */
+		};
+
+		sd2-clk {
+			pinmux = <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_CLK */
+			power-source = <3300>;
+		};
+
+		sd2-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_CMD */
+			input-enable;
+			power-source = <3300>;
+		};
+
+		sd2-data {
+			pinmux = <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_DAT0 */
+				 <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT1 */
+				 <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT2 */
+				 <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT3 */
+			input-enable;
+			power-source = <3300>;
+		};
+
+		sd2-iovs {
+			pinmux = <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_IOVS */
+		};
+
+		sd2-pwen {
+			pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
+		};
+	};
+
+	sdhi2_pins_uhs: sd2-uhs {
+		sd2-cd {
+			pinmux = <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_CD */
+		};
+
+		sd2-clk {
+			pinmux = <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_CLK */
+			power-source = <1800>;
+		};
+
+		sd2-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_CMD */
+			input-enable;
+			power-source = <1800>;
+		};
+
+		sd2-data {
+			pinmux = <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_DAT0 */
+				 <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT1 */
+				 <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT2 */
+				 <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT3 */
+			input-enable;
+			power-source = <1800>;
+		};
+
+		sd2-iovs {
+			pinmux = <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_IOVS */
+		};
+
+		sd2-pwen {
+			pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
+		};
+	};
 };
 
 #if (SW_SD0_DEV_SEL)
@@ -386,6 +455,25 @@ &sdhi0 {
 };
 #endif
 
+#if SW_SD2_EN
+&sdhi2 {
+	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&sdhi2_vqmmc>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&sdhi2_vqmmc {
+	status = "okay";
+};
+#endif
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";

-- 
2.43.0

