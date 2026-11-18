Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981381;
	b=m0+yB0vuDC2MoLl26H7uP9di1UN7xtLJSU9pQKmfGlkIO8hWVFVVQm8Je66HQzrSq9Rb
	 p3G5q+hriMe/mzYJOJ1ov79V6Ib77yvXJkasRlFeB/ufRETxW/bODuER8Xtkq+dUF+XTn
	 ccxeartlVp/Uvd3q2immul3tvTUrgkvlsP57WxN761OoWJYOGz9JOC+MT5JvHEuxuygT9
	 4ksWnsSxwAhdNnRGMYBUSpCXq7FeeAZQX/3aze8rvWLDxR6MaAvS6w1Ndq1buWvq1GS1k
	 3OvdJtI6WVX3TNSEMiDoKyNmnYrUtZKYZtUdj1fh5H9i2XPVrfNw9wEK+aPZQnXjyPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=;
	b=XRB3q50UBKKAtaMR/MrkQKtTI2NkRFSzzj+s3xsbgv+gXtQ8CpCdBM5FDk6lGThuB0c9
	 v8GO7lOydosxdAVw1Vo5ScHuV2FtU8AUWNmaD69cgO0/F4tvBtWuCqf3lZ1PIKWfXuRDR
	 FsoHXtTwuSzp2JdE7s4nSEQU/JOfwChHX3p7ff3iKv3van0K/kjWXZSl4tYqscWsa9nyz
	 GgBGov0sA1IbauzLvf3pOnpoc0D1okQFhw5XekqH7dfwVnMNKIhWuOan5121EFI4bsi9X
	 CkCYmZSLWnfzHHkfV8pfaOO9TpYOhj71/pvettzKDsRhymGnmq8457wfigOupYVzWZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fIt3rOAZ;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB61606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB61606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fIt3rOAZ
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb2fcaafb7so5153a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981381; x=1795586181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=;
        b=fIt3rOAZtPnzPaw8RLeDU4lrFzvZ1E0zMhdIhwP7cvtZGGoczAG6yZtQkwC5qy8duO
         ykjI4l3NqZCVZ42B3SArtDxwmILaC94yC3mHpYzIbIbg4r6TAt6I42U4F+nghkKmZ5u4
         8pnSl/E7jyXHb8EQrv2lz8h599o6bVHenNispOnSmZIKtu1wTGn8Dp6XjfLx6spwYVXg
         YjAIGUvMDgTBy+hd1PRXHCfecpKrK3fb2jUHpKVS3qEXlTpW2HX5iBoGP/2QeZM84Y7+
         jVW//Xjtg02cgWdOUgwMGGQBuwGo1o92Jsn9LoxYkxOZvgvh8cd4leYcquGW6qpRCygZ
         J6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981381; x=1795586181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=;
        b=G3vjF99ImDBtVpEZg37GMjY+YTjozC5pGjTPXe/uO4jhzEhwIaa7ql1BMzLBRy4WKZ
         njmtHlw7Mj6tIqtFsINcV2efHs3RtO0ae1ndXtYmcWZr7g6swwwh/xu5Y0AUg/S7wIi+
         +SRvcwaZkw4ERpw/k7Tva5IdqThm9DKhv7F2kl7cvlTaxIFObxXGymZoUULAzC9ZRxPF
         ufTNpNPylMRKFt7v/SJS8T8w/Uuw/ky2UfB5qxtLN5qXZCSM1d75jcmmS9f+DpsNOFdQ
         pggahdWbRk26VFbXCyR3mgcQaja5Sfx+tWJMNZTB8Uz5320bt5MTVrtAB5DvVocB2ITW
         eu3w==
X-Forwarded-Encrypted: i=1; AL+hErEnkAaCgsxbIdby9m0q9PFx59rmjhLFCP1NB1LgXUSoJrnY3zaPAtYleYsG9Do1reuGdEEwMZqgZwQJOOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lYdW3AuTsmD0n25oOoi39jsNEFAtU1VcS1V5zG9OmJGYOcgMW
	nsX69Ul08ut4SlVClrRc+XdVZ98/SSUUXFOKBfUE+nYtULiJw7EULt7B
X-Gm-Gg: AYBFou0v/P7QufQ5LZcSlH+iF8uVmjqQphxMa1fvgx5mdEylhSb4NL9LysWVMQIuk0U
	IqftXM1xTmxGfBmUQD1M8BSWsW7F5PSuFPPBAfjRorPAAxfdxEIIau38CIRycg5mKT71MRIOeiz
	I7LNuFeHWzrZfD7uE/UXRA2dNTIg4Csk9tVwMq1N7IQTyQA2hEYAaVERGBRZw3DttPzuu2RmsCW
	v9oecs+/dZW1pSuwdo3jn3Zh8ipO26yxzpAE2JpQUcD5OLeL310KHbT3OESGWjtiWcG4GMXNpz2
	gpup/0Lk2tByQUVVmhKOpEOKmjjTidYyhkWCstUfw4ZfSDtybSkubcz8OB4nikcekBFDKNc96cH
	PsY+K0KTDZ0eZtVVQ4LA7NE8MTyoz+rZDMoV2NHv9gzWDQilFcbXbMFEM1UrfAo/zyK6/AUY+PM
	4k8+GXevpPgBwvtvovgdxl5Dd/kinYRyDnHL0j0dIwKw3hlCaTO4qG3PezgSpRtnQvncHhfNesj
	9EeUEQ7tf0nn0IAwdX9cKX2GYJdYCaC9xhznptZrmr/y5+s3yqubMOnd4l/jEJS1BjJujCApfWR
	hu0gcOAq62g2iyrMaaDJEanVWqSYItAuxMHf/c9URqTblqTRRFevJHb+Zn6s3jaL7yFsRslFmSa
	Zh+rgjalfLSqAl+Jk5xWm
X-Received: by 2002:a05:6a21:c219:b0:3fc:7f4f:ba46 with SMTP id adf61e73a8af0-3fe888eb7b0mr1972957637.2.1794981380287;
        Tue, 17 Nov 2026 21:56:20 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:56:19 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:22 +0800
Subject: [PATCH v7 9/9] arm64: dts: rockchip: add the dcphy mipi csi-2
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
Message-Id: <20261118-dcphy-rx-v1-v7-9-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
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
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=3591;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=wHYitdr9DGtZWdI+e6LvB71Er0urXzEmjuek2OzfqCA=;
 b=8DgSgyPhpQNduk9l/SM/4dMAVGgXDC3dSb7ZJjM9K4UTaLkxLcbj5MRsPNdpQa4pp54aTKeyl
 /jVizBopUDuA0gxVUv0l9MYhwPgtlRDmP/mh/ZJasL0zxGzgI4x0Zyy
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

