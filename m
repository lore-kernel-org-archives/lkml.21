Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424337;
	b=prNodc9+jowKbKaFGXoD0tjfMtw22/+NVrLVHxP0xJihRbVmExmO8bJNLobbPxDst8PR
	 KlClgavsId7BpivqML9GI6WRfbeGOkAn2BhcruJ+OeUHiLUmOpyY5CN8rC75F/FnhZNAZ
	 bvLC6QmIkzJY5t9ljEoGwCnhuz2zMEMKa46DAwFldqX/a05rUc0brdI5gJywmb3Xj4i6Y
	 +vB7B2U8SasXrlHw/wrxn94s6k2pIknpRRuSZKhMw2pxoU2CphQy4gyEVbTltV+5AuwRJ
	 HyfN6O7qA3xhpOukZD9gJqdPhnYygplt9tk/trNE446KnWg1/lRbZ4QG0SXHSYI3vdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1EXVEM4I4sHSFjrWWT9LPUpNwHQcqbIl9vwHkY7pXuc=;
	b=18KiP5l1Y/lVZ1211aJ9nSimNQjJ3FPc2TMFtGkXPUnWM2fI8e0EU6ZTX1bcoSstdQ9t
	 RrAKc2hbURfDYPouIHv6BrcoRBdbFRdTvgHvyLGQEyusczwpVX3xxDFu5Sgiqbc6Rqc6d
	 UROubzdhgbRaQOnC89jN8zbW/ovnguWGyaKcQARTLICKjwL9BBHpovIhHJkmQzyap3n5N
	 1UnkTuscigs2PReBYHiQyWgx7xtd6dxBn6oJpjngEea24y6gK34Q3VWsslYbHBNp3BlVz
	 8JmZ3BPp76n0+ui8Y/Ioy3t0fZPEikjB5LJDxcxDAHuC2/7mvTyOmPSQ3kEJL4BRnkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hCa/AhtO";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF9E606A339
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AF9E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hCa/AhtO
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so29908755e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424336; x=1796029136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1EXVEM4I4sHSFjrWWT9LPUpNwHQcqbIl9vwHkY7pXuc=;
        b=hCa/AhtOWKassfyx9lUvh3zA7UUejd0LKqh4ARVLt6ix4opFZsFaIXao8rvCu31Ns2
         3SpGSaZEPc/xwA/L+spdmi5gKz+WdvufC7oGfHC+egSWQlBgZUXZyY/10n5pa9mVghgZ
         G9tKx1WubfLywCDFa2BzmUjKt8WwmV3kKNIc7V9+MWCDLP/1Er22hl2oVnKzrBu1nptO
         sZmBQDivOynE5qqmG84S0JR/XyDnJV0wfJXQxOH/g5Kd53pKefFlcVuqWXnhP8r63564
         E0YFIYGvVmfYxxNCeXlzrgIa2U4cJMtMTZ+YtJ+rnpgmc7Wi+tKr8SJZrc/ttZAECMwI
         hN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424336; x=1796029136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1EXVEM4I4sHSFjrWWT9LPUpNwHQcqbIl9vwHkY7pXuc=;
        b=dlcIxui/YZDSnd5SCsd2tVJg/ohSm6dSoRfXqVPjD6otNTaAst3xLcDFls62StWk+3
         uO1L3gPEbTCtWwIaiH8iHIlvrypEy/rKWbVRseOnoPTsbmhZBMLkF/oHn+r+NGmJUGl8
         7ZcDrwUo7wANGJhCplaR1ySCcj9U3usy/ifLJcNLbBm3nDg7HvUrPOosQkEKkNozP+FU
         zPuPpc0r8qfE6RzlVFoyZUFk3XbwOzsyHW0iLsdX5YXoP4Po9JIS02w2MgSPz8HkVdAU
         2BHboKK4G3tSSIz67l2C/IGE1wMWy6d0HXfdOZlo7o49YpduAYcJHxxjrIAYk20Kv3Qp
         336g==
X-Forwarded-Encrypted: i=1; AL+hErFNfsoyPudTR9YU75K/riMXawBzqTl5/GIsCblggw4UbnBq9I+EzEJQrUmtlTNiRbqQif1jyDtkBQEEzgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9shqV64l3w4/X0HHlTO67NvmjWFfuJnoCcc2MoXaRFeVF/pa9U
	FPKpZ7oOyEAB87F6kxqEubSkejDB6lRUmxIXCZ3i3Op6TIpvAJs22ek5PH5q3G1RxY4=
X-Gm-Gg: AZFdTZdXgUgkJb8tW+GnXKfjWLqeyR1xPXg/yFsHbpDTSE+GaeJW/UMVFkY/FxtK6Ym
	DonrOgoPf9ea/ic3FnVxNKdfyryrE840JgwuUvCrV6/tzQ67qza1sBYMtSEEGv5hMLBtSllIGBp
	qnKKx1nf9j5MX4JxlMWRKFj4/rmmxKx32rT6yieOW/UCI0Y1JJr+PsF44pkJ2sUbTx2iJ8GFdpA
	H/biQUT1Duorcay6Sc+9ZzongOYSeJ8ndURdoP11u7BtNYaeNwWXIBndgx372L2AWTNT3l7BPtb
	IpNXlRoKID+jeL8JYYT/5hbnS12KPAs2PJcsUlUsmEb9sciMeO0EIQaJEkGsUGE0mV14fniynxq
	HOintE+rAm4/k+j2C2qhWmVsXXsIW70MrmCMd3NrdeTwitewPM/YiGyM4GR9zqEeuMIpMEqfM2g
	oA5hWQS/JmrOCr3nguWIR60yI7cXIo8SvBEUnILDmtw667Qx0GNlUvQbM/nEbZ75LyQfymQoQql
	IzEWLaDWeQLfsZJSvmZ8E/2ewXMwXJVl4ZfkaDc0x0H+mrrH5qaXl59VOOCD7W71AtJpaZb3zFJ
	kw2CoREdhewm9pxPx4kczBH6
X-Received: by 2002:a05:600c:6290:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb8882a21amr216218545e9.27.1795424335967;
        Mon, 23 Nov 2026 00:58:55 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm375960755e9.12.2026.11.23.00.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:58:55 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8167: Add DRM nodes for primary display path
Date: Mon, 23 Nov 2026 09:57:55 +0100
Message-ID: <20261123085840.8687-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123085840.8687-1-l.scorcia@gmail.com>
References: <20261123085840.8687-1-l.scorcia@gmail.com>
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

Add all the DRM nodes required to get DSI and DPI0 to work on MT8167 SoC.

The primary display pipeline is defined using an OF graph identical to the
fixed fallback implemented in driver code to maintain compatibility with
existing boards. Its block sequence is as follows:

OVL -> COLOR -> CCORR -> AAL -> GAMMA -> DITHER -> RDMA0 -> DSI

If a board wants to use the DPI0 display output the last connection should
be overridden in the board DTS. As far as I know however there are no
devices using the DPI0 display output.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 297 +++++++++++++++++++++++
 1 file changed, 297 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..a7818fd92edc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -120,10 +120,297 @@ iommu: m4u@10203000 {
 			#iommu-cells = <1>;
 		};
 
+		disp_pwm: pwm@1100f000 {
+			compatible = "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm";
+			reg = <0 0x1100f000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_PWM_MM>, <&mmsys CLK_MM_DISP_PWM_MM>;
+			clock-names = "main", "mm";
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mmsys_main: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&ovl0_in>;
+				};
+			};
+		};
+
+		ovl0: ovl@14007000 {
+			compatible = "mediatek,mt8167-disp-ovl";
+			reg = <0 0x14007000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_OVL0>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ovl0_in: endpoint {
+						remote-endpoint = <&mmsys_main>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ovl0_out: endpoint {
+						remote-endpoint = <&color_in>;
+					};
+				};
+			};
+		};
+
+		rdma0: rdma@14009000 {
+			compatible = "mediatek,mt8167-disp-rdma", "mediatek,mt2701-disp-rdma";
+			reg = <0 0x14009000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					rdma0_in: endpoint {
+						remote-endpoint = <&dither_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					rdma0_out: endpoint {
+						remote-endpoint = <&dsi_in>;
+					};
+				};
+			};
+		};
+
+		wdma: wdma@1400b000 {
+			compatible = "mediatek,mt8167-disp-wdma", "mediatek,mt8173-disp-wdma";
+			reg = <0 0x1400b000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_WDMA>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_WDMA0>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+		};
+
+		color: color@1400c000 {
+			compatible = "mediatek,mt8167-disp-color";
+			reg = <0 0x1400c000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					color_in: endpoint {
+						remote-endpoint = <&ovl0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					color_out: endpoint {
+						remote-endpoint = <&ccorr_in>;
+					};
+				};
+			};
+		};
+
+		ccorr: ccorr@1400d000 {
+			compatible = "mediatek,mt8167-disp-ccorr", "mediatek,mt8183-disp-ccorr";
+			reg = <0 0x1400d000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_CCORR>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ccorr_in: endpoint {
+						remote-endpoint = <&color_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ccorr_out: endpoint {
+						remote-endpoint = <&aal_in>;
+					};
+				};
+			};
+		};
+
+		aal: aal@1400e000 {
+			compatible = "mediatek,mt8167-disp-aal", "mediatek,mt8173-disp-aal";
+			reg = <0 0x1400e000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_AAL>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					aal_in: endpoint {
+						remote-endpoint = <&ccorr_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					aal_out: endpoint {
+						remote-endpoint = <&gamma_in>;
+					};
+				};
+			};
+		};
+
+		gamma: gamma@1400f000 {
+			compatible = "mediatek,mt8167-disp-gamma", "mediatek,mt8173-disp-gamma";
+			reg = <0 0x1400f000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_GAMMA>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					gamma_in: endpoint {
+						remote-endpoint = <&aal_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					gamma_out: endpoint {
+						remote-endpoint = <&dither_in>;
+					};
+				};
+			};
+		};
+
+		dither: dither@14010000 {
+			compatible = "mediatek,mt8167-disp-dither", "mediatek,mt8183-disp-dither";
+			reg = <0 0x14010000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_DITHER>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dither_in: endpoint {
+						remote-endpoint = <&gamma_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dither_out: endpoint {
+						remote-endpoint = <&rdma0_in>;
+					};
+				};
+			};
+		};
+
+		dsi: dsi@14012000 {
+			compatible = "mediatek,mt8167-dsi";
+			reg = <0 0x14012000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DSI_ENGINE>, <&mmsys CLK_MM_DSI_DIGITAL>,
+				 <&mipi_tx>;
+			clock-names = "engine", "digital", "hs";
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_LOW>;
+			phys = <&mipi_tx>;
+			phy-names = "dphy";
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint {
+						remote-endpoint = <&rdma0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_out: endpoint { };
+				};
+			};
+		};
+
+		dpi0: dpi@14013000 {
+			compatible = "mediatek,mt8167-dpi";
+			reg = <0 0x14013000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DPI0_PXL>, <&mmsys CLK_MM_DPI0_ENGINE>,
+				 <&apmixedsys CLK_APMIXED_LVDSPLL>;
+			clock-names = "pixel", "engine", "pll";
+			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dpi0_in: endpoint { };
+				};
+
+				port@1 {
+					reg = <1>;
+					dpi0_out: endpoint { };
+				};
+			};
+		};
+
+		mutex: mutex@14015000 {
+			compatible = "mediatek,mt8167-disp-mutex";
+			reg = <0 0x14015000 0 0x1000>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 		};
 
 		larb0: larb@14016000 {
@@ -145,6 +432,16 @@ smi_common: smi@14017000 {
 			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 		};
 
+		mipi_tx: dsi-phy@14018000 {
+			compatible = "mediatek,mt8167-mipi-tx", "mediatek,mt2701-mipi-tx";
+			reg = <0 0x14018000 0 0x90>;
+			clocks = <&topckgen CLK_TOP_MIPI_26M_DBG>;
+			clock-output-names = "mipi_tx0_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		imgsys: syscon@15000000 {
 			compatible = "mediatek,mt8167-imgsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.43.0

