Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765704;
	b=3jUMQrhbjMbWIQSz3C/Q9gCbzD2ipwJTqSNmwJnH5YIHwm7czdQNQkrS9/ES2khctGCR
	 TKWJAPMv4kYqOMqWS1ks7x3q4FtnTG+IagwHMYFq6mS5qoGsJWKYQoevVMqOv4QGfQ/Ni
	 nEr9TdcNaDEHdRNw6Kl6y7wWevkHbifMPQnQ/D3gMtsRmxt8nzLvJZILS/AZE2wgPyyXD
	 4yMIv4Ftna5CJTfYzfAlQU/9AATwtRpN3JRyuoQnO7AtBNTLPKwqYLvLPLcah1VI9G2dK
	 U6L6R7b7C69xHhMKoh6D99bAqsZ+x+IAXwgncvGVGatRI4L9R/0o/mrwPRr7v09YWlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=;
	b=4N1fJTHxBpcSGZqaJ2r0MZywk2UTkCM/cw6rvs1xJaduW5OZOXP+FXUQqXMj8N5vn4Of
	 tHbrnuOYU6qkZGbRZCBbvPwgbCaicFiscEX+bcVfYnSOG2USCJPCmbvcO3O65Ay1/Om3F
	 L7B2dcTOmCoUKex9bkdezdByBaRFpxof+C6PJfs4RMJJOQ/ChspO+imS1e2tCtUAT8/Op
	 VSB26X3HDCVtEzFIhCHNsxYVH/zp1l30smE+8ZOkP7Qkgqmz/b6x/NJT6qkSs2AQndWgZ
	 ObIbto0diz0KYyTw/YWZyIMEUVU/uvMY1qunitxltEMIpD22m1d+cJVWg3aA7ZO5Q2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eMiqHLAn;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDAE606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FDAE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eMiqHLAn
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386b921f2a5so569664eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765704; x=1796370504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=;
        b=eMiqHLAnhGDN8oVgC23Ywafp1eMnQPM3V+RkTFtvnkZDfMkSoeCOdbKA+oxzOAc20S
         4Z4gaIoL6Md+ly+b98m0t/jXb91BoJ5prA21UhWvnvChgZelnpGkCDMeR0955aG/Pp/g
         jwhsXPz//s+Aklece9XaUK+F27SVajGpzVwCNTXfg6UXxHtzTpC9Zenav3EfxDLZvrZK
         kecwqBrK/WbULxZmeSfoFWpc8Q4yzF8m4MdlLnpwY8FrzNmQvizE1LdKL0yKRrk/URWl
         uUGwMx/hjF1uVJQeM1nLXWCxL48VsBpR342aMF0fJJbwCtfQn31VkOMeBbwWKAJ5CzGI
         L1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765704; x=1796370504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=;
        b=Bo0sH1UDj2nGjnnYMNRMfGH6pxBjck16FekFBOKmAwNRAfLhITrDmHhXhn5O22ga64
         IHZXN6lgH1rfbDSXVQNIqibyy95WnIYgyBPcf8aOL+nPZgePj8MdQ28DuivOuYWXiK+I
         Y/hT4nU4Fegis3H/XV4LVEPpevQpCHerUtCj14ELxPfbw8zgfgsphwBb6+kwZlx3TEKL
         STMT97OPWhikmyDfuN8aX3W/tlTc5j+BWIdGuOVoGI9/NeyfqblN6UpEpjXhbkaYFgsE
         nCPuxiWK6bdX02droznV4u3HWJ/zQCKTTwSTlbS0ftMJ96PBKuY+h3Y8kCzOA3Ntsl2b
         edjw==
X-Forwarded-Encrypted: i=1; AL+hErE1DqpvlZKUevh7zgJxwbkh4S8bdnHkDdD+kGJ2B387oTHIgQapnT8WBU1moeMeYg32dA73Rg7dBiNtmVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z97NlbVvxlQFELLN+3j6XaKZESuvZcceTMtZwZkTJ3K8meKU56S
	+aiF+ws6v3rllWuwHx9CexLqx50BHKkxvB1VV0lTXARMaG0PoBsEUjXCNcn73hmYuYk=
X-Gm-Gg: AZFdTZeHBGK/WBbjdBu7AUnYmJfW1URIvwc6wg6gxPs/ozDjmsUIyd03nX607ZJZXTp
	rUxJHSwyOJEpL5j7TdePnz147aYiaJ878OWPaP7XATe6YtsFGsI5uGBc6aajHlH5GjQ6DtliO8Y
	2Gl0ZEvijLMUt9w24DQkizmUauIfkkw+75TxqMZ3/QX/e/jPL1D/2CMqPHwZi2zUuf7HdNOZJ2g
	gX/x3oZAmsejPwVqF0ROC4Yc6+TtKu1gUi7gRlIo0mIVw06xdyKbDXV7EyLkW103QgEtojpVobc
	I5Ta7kkTzhnbshWgCi6F2pm9p4IG9ZAOD0qdk3xqtg78rAs5TryueaI5TFm6IXPycbrij+jh/JY
	CNHBMro7MMkUgs/1pusCkbJFmCXSe8X1mKRD9GCVgnug0V9z/bxUlCuolUGL/Um6e2F6vPLf4do
	nOSG7yKTFWL8Hsj0dC3+IPcs+p8kt++ZimAPX5n5KBsmHdSnTOQHLvqO6+g7DpjAXnvvH/KKX0d
	pZN3gve+PcElrfqXKZLFbr3MFKI91RhE01A6c1wphpDq5/VeKGAs2+y/4w44rPAVbFjLQHn6RQg
	S2YlyuYPj1TYBGriJlttmmmdInsANBRc5pwlVntzKihCORu/NFnTnzaphZBzaID7Db4xK5Jbqgg
	AMQO2mdrsXKwGSyafrD26
X-Received: by 2002:a05:7301:2624:b0:385:1a45:47b3 with SMTP id 5a478bee46e88-3856e24682amr38262478eec.1.1795765703177;
        Thu, 26 Nov 2026 23:48:23 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:48:22 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:45 +0800
Subject: [PATCH v8 9/9] arm64: dts: rockchip: add the dcphy mipi csi-2
 receiver nodes to rk3588
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
Message-Id: <20261127-dcphy-rx-v1-v8-9-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=3591;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=wHYitdr9DGtZWdI+e6LvB71Er0urXzEmjuek2OzfqCA=;
 b=x0Eoz4Ybdy9c1XvKnjo/yqIl9hqyaAcBUU0jRw3PI7nE/mnUYSWZQHERZwCA7q+BJ+79/HpZd
 lElzx8f/wgEClUUQIs5L3e8ZodSwC3V6x4ufyRlZ8cSnMgr5Oku67mf
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The MIPI0 and MIPI1 receiver units are connected to MIPI DCPHY0 and
MIPI DCPHY1, whose receiver side is now supported. Add the two nodes and
wire them to the VICAP ports.

The csi nodes select the PHY receiver with the new PHY_DIRECTION_RX from
the dt-bindings header. The phy nodes need no phy-type: the DSI host and
the CSI-2 host both run the block in D-PHY mode, the default.

PHY_DIRECTION_RX is an ABI change: an older kernel takes any cell value
as the mode of the block. The csi nodes are disabled, so an older kernel
is not affected until a board enables csi0 or csi1.

Before v7.0, there is no CSI-2 host driver, so enabling csi0 or csi1
changes nothing. Since v7.0, a CSI-2 host driver probes the enabled csi
nodes. An older PHY driver then gives the CSI-2 host the PHY transmitter
that drives the display. The camera gets no frames, and the display can
stop working as well.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 68 +++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index aa69fd3793fd..c7174c2f15c3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1516,10 +1516,18 @@ vicap_dvp: port@0 {
 
 			vicap_mipi0: port@1 {
 				reg = <0x1>;
+
+				vicap_mipi0_input: endpoint {
+					remote-endpoint = <&csi0_output>;
+				};
 			};
 
 			vicap_mipi1: port@2 {
 				reg = <0x2>;
+
+				vicap_mipi1_input: endpoint {
+					remote-endpoint = <&csi1_output>;
+				};
 			};
 
 			vicap_mipi2: port@3 {
@@ -1568,6 +1576,66 @@ vicap_mmu: iommu@fdce0800 {
 		status = "disabled";
 	};
 
+	csi0: csi@fdd10000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd10000 0x0 0x10000>;
+		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_0>;
+		phys = <&mipidcphy0 PHY_DIRECTION_RX>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi0_in: port@0 {
+				reg = <0>;
+			};
+
+			csi0_out: port@1 {
+				reg = <1>;
+
+				csi0_output: endpoint {
+					remote-endpoint = <&vicap_mipi0_input>;
+				};
+			};
+		};
+	};
+
+	csi1: csi@fdd20000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd20000 0x0 0x10000>;
+		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_1>;
+		phys = <&mipidcphy1 PHY_DIRECTION_RX>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi1_in: port@0 {
+				reg = <0>;
+			};
+
+			csi1_out: port@1 {
+				reg = <1>;
+
+				csi1_output: endpoint {
+					remote-endpoint = <&vicap_mipi1_input>;
+				};
+			};
+		};
+	};
+
 	csi2: csi@fdd30000 {
 		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
 		reg = <0x0 0xfdd30000 0x0 0x10000>;

-- 
2.43.0

