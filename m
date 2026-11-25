Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604748;
	b=KzagPW0ojN5zNMqfykn++nGGl8/XS/j9CJ8AJaDVxWo2ksmzqNGfb5dH+vXAedTOg8g8
	 t/tk1m6hSdToKp8tJDGgi2MxydtBwExnDDJqtrhpaS99nvlx79y/mIRgwsuUeAaCbub5F
	 aRSUto8cednpTEgPuX58JLL/0DgplbXXUrEatGWSoTmmTRpZr6ukaMQWTFB3gKnA1o7VI
	 D+nPmDPSaSR6yeMNEoezF1GQ3gU8hQtWoCSerXqkBaAKSmJ+D+OqpDrpoZec8BQyVKN9F
	 rMVH0JIQvgAELzzHmc5U8eFbN8oTAb+EGUgG2BRQOy9xn5KHnMcnMisgvCO11kAy3Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=f842aynd9qkF+2ihndmibeVzOIh5KPshrWMEfFSYc0M=;
	b=3TZQj3sCzcAVgOnZSv8Etomk0Bu1s7MBeFRu2NXQIseOeBASG7Wq1jn4H2fHVoYNu4xa
	 XnHl3uxNF/95EmtZp9aOkkIIdS5EDDgLaJrzBQhJDDzMZ6sH797TWLCFKNdV3xZ0jnN3t
	 ZNUL4LHds7d4Gw2hBjknGFwVHC0I1Dn+qbtHZP/qtTFINX/fRa2kMHSvrMdn2KrEbWFNe
	 y5pwgmDwBhZCZEhpf2fjkU8JAvZ/0Pad6PlBb4SU2a95gZztnF9A68L0cRVVxhYj4mO3h
	 OJ2Lerd7yaE24KVWtr76q3D62yop/Zt4MY+EsPF6VL/pa3mUoh9X+i/JpMIykeHaf0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLkjE+TZ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99B4606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C99B4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLkjE+TZ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so72262765e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604746; x=1796209546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f842aynd9qkF+2ihndmibeVzOIh5KPshrWMEfFSYc0M=;
        b=lLkjE+TZG0FMymlcIM6k3QhwL9ItWQW4XWpCQqIs9aKXPsKB+sJBtaIU3V15LINH/M
         uEKwRvo8v3JVOWr8mejNoAKHkUZPRtwVjjH5gJw3wIFL2DEVRGynF3LuWfuBRGvnSXR3
         bP05YbTmsVkFqHVFF4vqarI1kwEFDrQFJn+sLrrkZS4hUd2A0nB6Cg/HbpsU4qpIOkt6
         6cQcF5rSMCTPlEDrErd8CU/9Vd/v0Bvwwt5KtMcZY6A741n8zPJWvoS94nEuBMIMo9XC
         Uui7l8bTSSe98eEyBl5qZuj8jie5IjQKrC22yuxXdw+HDOPZ6tsGQBCx6RLDZUV3U0nK
         Ts6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604746; x=1796209546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f842aynd9qkF+2ihndmibeVzOIh5KPshrWMEfFSYc0M=;
        b=YibB9NoVEkUJ9B/VrSG2xbh/nDenZa7UOb0PjgNFq0OrMc65WkBV9OwFUyml+Vjjx4
         LH+nM04qPYc7sy77aiFIRajiK6/l3QGgJeh+l07Nov8u3gPwQm+oZjO0uk1ebbl49iyi
         bcjjwUHdhEBGTZlfBPJzZJomxw4R/d1CryClakWAvr6ILDGnx+Hg7RhCqqo9MS2dcHQe
         LNQmJMpyTZ7ch6ZI+Z6uM12meVKnfpZec4wUggVlCyzISN891JEgMUF5mh5hfvO3LnIV
         rT1jbVc9DxTHODXguH2TEacKsxa2wS8prDYwD2nroXr/Eo2dm04K6sDFoDskwrqDF5FV
         KWPA==
X-Forwarded-Encrypted: i=1; AL+hErFwirvaIsOg6G/dI2ttn3/lxahfBT6Z0c7qV9WJYT3au7i7yQKqVNVjQofT7MId8GUnt7ZwN4L90CxAC6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4bfSoxzbpxILcerc3ZrjLtP2bvG7GXMkELcVnS3o3LrzMul3/
	fGGpyQy/RPnLgIuJs3gxCdVgZyP87khptDztOl6SNgCh/Vxb6b9djTEO
X-Gm-Gg: AZFdTZd473wXNcNy9NLM0se14d7yCq/y4SY6X6lpRgbDGLB0kPfjansBlKQs8q9hrJz
	bKkvhL7XYBGECZYgj2W0QagwtnGL895EM6kNzhcfbZ9zqC88+x81FfA49mSZcn62Bl3KSEQxeU2
	Ga8utRGqriLjjtC0SFsiIU4uYL0Y46OJdWkzWzWKkNY8/NSx6a8d4pJgNU7rlS5eWDBEdjOwVKd
	Qu1ZiNZkxuOH3zRNIvSSNKqRW1mYRBIz710QHzYSWqekF33xi9tmRGQVXU2bjk3jCKKxiRJaAhG
	3WE2dXaesrdDfob7NLYyTpALRYL4pf3u4cXn+g9w8587FHiaswKByZtNOyl6CtaKvWzVC08DW5Q
	htvHZxBcm/lx+kmhh6bflsO9uoSUwGCvtEd6E5syJgHp9VB6LkQH1w7j4Mk6UjXIjdCZn9NwDCA
	RqwWE4h/oqkKKzvbeSCgqCOaYzOAtfzbL8zu/zvmAFtWi1U/VFZQ7RtQM83zLGXYSrTpyESi+1A
	rkhP/OW9p+SRB6r+9s8yJl6QHCBTCEIOfXLlMiyEW6Ni1v0nKIzTnKpMKHrGwUdC3nCnmL76Sdh
	gdwAl2Dn75ESLczylWYpC5S1LanlrXzKw5H8wPUBAStcuJxsf4XkhTAN/JyyTujG
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr360275975e9.3.1795604746080;
        Wed, 25 Nov 2026 03:05:46 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:2e3:78df:210d:93ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm201583575e9.0.2026.11.25.03.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:45 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 25 Nov 2026 11:05:43 +0000
Subject: [PATCH v9 2/4] arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy
 device nodes
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
Message-Id: <20261125-usb_rzg3l-v9-2-ea14d3ab8a53@bp.renesas.com>
References: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
In-Reply-To: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795604743; l=4199;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Y4aH+161y3MIy6RJ8G27J8Wexgq8ykbImur/Ccjduhw=;
 b=5mSlwxytSbQnH3wCUEBOoi7ca0IlcXwuQb7jvpYENWoaVJaecZmX6hhjg8VrimnvMJU8PXVSU
 bq50RRDT6ODCYydDEIm2lMwzutXIXm51CnrIBtr+7+RUkkrErKvh/wG
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
both ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
v7->v8:
 * Replaced place holders.
v6->v7:
 * Updated commit header
v5->v6:
 * No change
v4->v5:
 * Dropped renesas,sysc-pwrrdy property.
v3->v4:
 * No change
v2->v3:
 * No change
v1->v2:
 * Updated commit description.
 * Added regulators group node and its children.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 92 ++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 241ba7b5da74..b41a813b01b8 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1413,24 +1413,108 @@ queue3 {
 			};
 		};
 
+		phyrst: usbphy-ctrl@11e00000 {
+			compatible = "renesas,r9a08g046-usbphy-ctrl";
+			reg = <0 0x11e00000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>;
+			resets = <&cpg R9A08G046_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			status = "disabled";
+
+			regulators {
+				usb0_vbus_otg: vbus0 {
+					regulator-name = "usb0_vbus";
+				};
+
+				usb1_vbus_otg: vbus1 {
+					regulator-name = "usb1_vbus";
+				};
+			};
+		};
+
 		ohci0: usb@11e10000 {
+			compatible = "generic-ohci";
 			reg = <0 0x11e10000 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ohci1: usb@11e90000 {
+			compatible = "generic-ohci";
 			reg = <0 0x11e90000 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ehci0: usb@11e10100 {
+			compatible = "generic-ehci";
 			reg = <0 0x11e10100 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ehci1: usb@11e90100 {
+			compatible = "generic-ehci";
 			reg = <0 0x11e90100 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@11e10200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e10200 0 0x700>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@11e90200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e90200 0 0x700>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		hsusb0: usb@11e30000 {

-- 
2.43.0

