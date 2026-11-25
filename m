Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604749;
	b=HarrzUc0+tAtg/OIpDC7NgnbPK9g8uzvztIztO5ZI3mQONBenM2TXn9xlS1MhrhP7OIX
	 +4TeQ5bn9XeQxSX/TFi+h0jK0Ove04eqKQcC2gKe+kpgn+5a4lEAbRK6ICyPQmjbl4SJi
	 RDEdcuXyFqPX4rLB2elGAWpdWSRvuIGGficb0bs6XccwyhiHyzO9GMG5Mlx1sJ9rD6oVl
	 r0o3rSwv5kD7ZWtV62LkA/xBm+NpNVkPt6Z1gBeVdxDe+uHQRHxJsVb5KgNZ+ehzF8m0o
	 vHyV7Zvz0gyL0+Z6Q9zE9Pf4LvXcGxgnWy8W22a+6dwHoxUxugDYHQbMNYNsgOt1q/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+eO7T4Km/2BDquVOPRZBMlkWE7nVyJddDBKELqXWeQ4=;
	b=ndAzHLdlXfiwiXDtE5rNm+KLggF7nQ8FnxJwFF+QtSTKBYkDTBki73g1uYKxC3GVpEPN
	 PsqV/xLcBBgY8AcUZpPiM4uDqYwVNZIBRgukjO9p10BLCSLNidjEvMWDzE7WXB4dB9r25
	 w6EOjNvM0+UWpLff0Z3VYH16KJxTRkmelTIRcSSESQrmzswub9B8vzUYoGQWOYazk7vSh
	 cVQX8roXSjckj3ce6Th47AgFniIuyJKKS5AMDWRSdvcHubgoPmwhrf5136Ovt63nX3+sf
	 RikuyUvBIlz5ty6dvz9THu8nwBThiwTk/AT6+H6O5Stm/Q+JNipF5HK65Y1e747woug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTb6+TAN;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A835606A68F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A835606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTb6+TAN
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so4427825e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604747; x=1796209547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+eO7T4Km/2BDquVOPRZBMlkWE7nVyJddDBKELqXWeQ4=;
        b=sTb6+TANK+dvAYUWFozbgumb8FQ7J4ZZhik5EqfemTwFdtzMiv5T2nYdXRLjKGsyi7
         BVHnhyqOAjbdOsHCFF9+olCr2ylSz1zZyAwpIKMpsZ/AgaEcEGh9Jt2PzK0ay9nrf1Ie
         KcwiRQaEulFzULW4WPYWy3cpQ5ToB2kitTJpufaU9wVi1xtie3FTSSdbRk/uz/KssBxg
         sFzp8P/XR7V86zWwF2RfPU+F86bHRBtSR3R+FbcrdNK3rU65Dhw6TgL87s8UD5Ws94lY
         9LYRFyN6+A3ci3BYX6J3oZeEVAkzQMAO/OXIuZeArCprqnWFGlHouwgcQ9vKKKhDy0G0
         Un8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604747; x=1796209547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eO7T4Km/2BDquVOPRZBMlkWE7nVyJddDBKELqXWeQ4=;
        b=o2pRLBjn+m2dVEaro6J3X1hPKfgvQTdrwqMgInrjpc1aX0tfP+KnOCOXdisUSw6wsu
         mMtxdPtC4aSquU0KhYt5cPfk8q+VmmwN9nOhacez0JjQ5T8OXWXbSQb5GZLLjR2hg+Cw
         /8ym7ascTY86TULCYyZHnBT0ZOGwLD7LqSCfqtcW54XJy9r3IghsV05iubk2euuKkp+s
         SspUzypxXKFRE15SefcHJh8n72B1AuIKJia/YUScvqWgna64K7QyrEM4GpQR4quIBM3k
         lpVzTR4noz4qSOb01t3KRASYOQd2huzX0ekM1tg2kRj3XL6AUgVD0oaY9ZfmU9EKLyXN
         EjIA==
X-Forwarded-Encrypted: i=1; AL+hErEA4V59GMCuxEomMu13xsiwYz71aIbardxzUTvYL/Qp3O65gfk8HSrt+hBOVb5Sx6y4jXuU7SHDV0IbM1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DAh4ELLlLIPXU8PLITMod68ULLvAc/K3skqjOoMMF6K8DpOMd
	W/pv1V8QfHebmFT+rn1idmeVq7KYELEAdI2FMHQdIKZFUPzBemu1ovne
X-Gm-Gg: AZFdTZdOwqgnSVqUPlCz3rd6X8PX9Q/w5fIWGGlGhVOSODmd4k5K2Za0Mu1p98vQoM2
	ti9gaWaaNRGDYg/USPN1tJRINdCADhnHe3zOqFhrfb3wcZom3b4LCOHsCLEmuLhSgIEoRBw1Bs5
	lLf5XlMmxGFh7LKfZAXSBFE5rc08LWPIqfJHTbZx7S+iwxRWd0YIs6YICiBM/4m/TDlSA0B/alH
	TKq/GElb24ymNTmu/FGDjhovT5NGDfxjXq3nZywte+fwyZoGR+KXyySOwo8BbV/CbMsROP/mDCX
	1dZ3KHFm+FNI3OdOo7/x3LFpC8wggtl2mkHvc4OjmI4RvHOxsZhP/C/e4dfAZl0O2te18Y+O+b/
	5Upq8wuQgEA5Gccl76VsltzolfJWQHCr1DCOex/VkhyfCnri1wab1W+DVVv81JAiny5cJv5w9DK
	TQm8aA1POyOHEsv8eGow+aa0ut7nmWqq38ynfLLQgtian7MI+A74CVtyOWtyHv/YwKT9BAIA+VS
	K5cKxBzjDP0tdgCS0ORUwH4cuZSu1Q/C3Vg3rWGDpgUjwa1C1+lKJwUHEEiA4MSz/aLsBuQozDt
	0LKMXbd+MyTwq18NmKVvY07nLZE3D6k7kjP4CjPweSM2VGQ4ZySEOwh6RQ4KUTaG
X-Received: by 2002:a05:600c:8b83:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4bb8880642cmr334773935e9.17.1795604746756;
        Wed, 25 Nov 2026 03:05:46 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:2e3:78df:210d:93ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm201583575e9.0.2026.11.25.03.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:46 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 25 Nov 2026 11:05:44 +0000
Subject: [PATCH v9 3/4] arm64: dts: renesas: r9a08g046: Add USB2.0 function
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
Message-Id: <20261125-usb_rzg3l-v9-3-ea14d3ab8a53@bp.renesas.com>
References: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
In-Reply-To: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795604743; l=2210;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Jh1Kyo5ZTMRj6dJgXKWzlKlzlSobHFJ8xV3AIFHgvak=;
 b=bHT+na2aEZLyXbW1MWwSkKw27tYSvY49RMc5kxmpOQqSlRJn6Cjk3JjA/OX9iLGM+BZuISbbQ
 /8bBQzDmxOOBBgyAun3tgbSo3N62yBczIoeAOBnPER8oEF8174HrhoZ
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 function device nodes to the RZ/G3L (r9a08g046) SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
v7->v8:
 * Replaced place holders.
v7:
 * Moved the patch from [1]
 * Collected the tag.
[1] https://lore.kernel.org/all/20260707145135.247565-3-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 35 +++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index b41a813b01b8..682301a38a71 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1518,8 +1518,41 @@ usb2_phy1: usb-phy@11e90200 {
 		};
 
 		hsusb0: usb@11e30000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
 			reg = <0 0x11e30000 0 0x10000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P0_EXR_CPUCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2P0_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		hsusb1: usb@11eb0000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x11eb0000 0 0x10000>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P1_EXR_CPUCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2P1_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy1 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		pcie: pcie@11e40000 {

-- 
2.43.0

