Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609991;
	b=eVRMLmK9PzQNrjAnflFHG+ObZhVtzDjL1cY21pPQgAoxFEa55OGEiXwuTPfL0/upnFAO
	 XbVM8J1BTSjuOzopgkg/k5hWTCAxvaOp+12jQU3UaC2GXYaCyGMLtO493ySZ21YURnB6I
	 DXDc4JrEDgT+Pya4iSrX9phsjzMaP3jVZHlcu/0hIaqdBGfXTBPCA4K7hiP4gzXSn8sY7
	 6CVS67/SptZd05da5HQVazOV9q+1sFfSUNq/C1aE6/u9MOQ/hmL88cZPpxqdatvkpKyiy
	 eBhdQpmbYr3H3BaZ3/qKOuEWnsF6BCzexGAUZ/wO/nh7JglpqyFfxTCTKd0ftFN1/Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
	b=zFZf+Nk6QyvdSKN/tBtc4ieaEwtfprMV2I/KlBmcXrfPozS4PoSQFSEFcWTUMPFG2u++
	 fIHbEy7jL1K9lbjJsaYRk2Org6V/tPCdjHdUo6pyFITmdbQZUu1bjSi1RvlLwIE+60nva
	 v8zYF6UMjjNjfh7niOuqReMmrH7p5zfbuhbnd2r5wfTkWuKdM7Iyu7nFJPF0jlhvXH/Xq
	 VT2tN6ZrZ2u96ZzW5CAmECajjx2BtUJIsdbCbigv8PownMad+3597c6fH6hkCayLgyWCO
	 hNjAzdMiWfG+MQQEsi7ltFfiQNspCuueQM2hhOBj2p23QyO76LuokKOHFwqKqNqeusw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=coF9vi33;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE65606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CE65606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=coF9vi33
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so1681189a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609989; x=1796214789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
        b=coF9vi33SW4tbGka+gZC7pdGpyvIY0OtwIIMqCJW6vpl0uAXM6J7Dc9W2kSeYwyCPX
         vM0U2N5kitDKak9f1DbQyMXw4taeVk6nLXeJ4JltlSKzQBPEtXHcJoiTegnw8Txj+zkq
         0dpgRSgk8+Pnf7PFRT5Mdo7IrR7VeBUzba7Q4m13xsgciEGMxd+fA8czVgId49TI+GQR
         rpsX3ijWrEAtMHym5qFNdSkOviJpeYV5UDF8U17c5P4nWNLLYz2kaHvV+txYkXyPYsu+
         wRQ91DV59oa740lYbhXpNM2UjhvWiUUdtoADlXYyYNp3s9oedX/hyfaa2obE8JmwwlVc
         mqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609989; x=1796214789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
        b=OtVXt02JOJBV3mIdi9QDRDSzg/ZyFHp3ElanEkWfBMiJ+suR/bBSZV9IBPLmebQjUS
         KoGipwB7VlujdmPRiknueZnk99Kc5HFA0LOQypAeS6rtMy+kzuyw+PeiHn2/b9lL56mW
         PwvdJLPRcR4YWV0/lk2hi2JP+sYizPQeBarwei/b/BESsoFY9QIiRMRXzNn63/Datb8i
         Q/wPo9m9xJOm7zmuxSI9QOtJ0eQ3GIzVVE7beSbmK2xD9I3rQccSWkA4xoDLx4Bem/2N
         3bBv5KSHfLSNeGx202jc/2S6jb3ic6VCdwO/mBmyjSDw2ZNmbArRoDOh/QohJnxLXLWT
         n6ww==
X-Forwarded-Encrypted: i=1; AL+hErHEuxc5BGc9Uqpr2omkh/So5sugheByx/Sg19UIPaENhKuTZuu0PGUfS3eShnDSBpKhZyXvFlkmsVKa8Mg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WA3jlYHbzSFN4W40N8Miano2hKKW3yvf5Rod3/YfXnPv92bIR
	t2Hqu7Ok6qL3tmDhCGNAMBwCaXYvSSwLr2oLJwPRR2eYClfV0eUdlNMEsHF+neG/x2I=
X-Gm-Gg: AZFdTZfSUpUGkUFI0+Avy8H5EiaWrlSfNztoBx85Y1Q+nlNEVbUoURGsEKZq08Rr3Ln
	xxH5agSVnY5HZXqtecMp3RiBGua0+pwYGEVtKx702YSHqpIRAemgxigKYwclcMw6RHiiNOJEtmH
	KD4dx1MPoBfPMPkK4cvrQTZc0LZQoJs9wJEIgZPU36qv9pZb2FuhkdQXXH99MCvnmctlN8P5cnS
	LB9lpKG+nPIKa6C3IuDCZnb0+tHu2hrW2qH7kWFHhrROY4My33QmoH/R4HTW2C+I5kgAt13+eEd
	zo2UbhON091JX12o2fS5df0Dtl2vcLc5N7+WBmeigLs61klBSZuwA5oQVfVdtEEhgl64dBCmtDa
	nKfCtC5spDEGtfvWv698QFMUQPipBNMgkqAEkyhvjsxJ4uYAiCrj4VDxSXjIH/+8rRwm+ZfcIAc
	PZ51rpaJXUPk7BdvdDizIfPE3/BevrD9na6KdvfuKgfe5/ORk9ozvZgQ8ZCw5yZCUIgDuVBeMve
	UaIopoxiMfs48DgPeD7Lew0INijJLxft1+QUsU/jORQx5aRPlXIMymFuefqkaWGcJtTQU+EO8+e
	5eJQ4adjL/RHuHpfqJW9GExJdpW+9Athe4iu6c8xnLlvRLU=
X-Received: by 2002:a17:90b:4ccb:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b41c7b67femr16891721a91.3.1795609989472;
        Wed, 25 Nov 2026 04:33:09 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:33:08 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 6/7] arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
Date: Wed, 25 Nov 2026 19:31:45 +0700
Message-ID: <20261125123146.379057-7-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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

Add the camera subsystem (CAMSS) node and MCLK0/1/2 pin control states

to the Qualcomm MSM8953 SoC Devicetree.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 145 ++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 753167c3f861..396472ba8f28 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -753,6 +753,27 @@ i2c_6_sleep: i2c-6-sleep-state {
 				bias-disable;
 			};
 
+			camss_mclk0_default: camss-mclk0-default-state {
+				pins = "gpio26";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			camss_mclk1_default: camss-mclk1-default-state {
+				pins = "gpio27";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			camss_mclk2_default: camss-mclk2-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio29", "gpio30";
 				function = "cci_i2c";
@@ -1214,6 +1235,130 @@ mdss_dsi1_phy: phy@1a96400 {
 			};
 		};
 
+		camss: camss@1b00020 {
+			compatible = "qcom,msm8953-camss";
+
+			reg = <0x1b00020 0x10>,
+			      <0x1b30000 0x100>,
+			      <0x1b30400 0x100>,
+			      <0x1b30800 0x100>,
+			      <0x1b34000 0x1000>,
+			      <0x1b00030 0x4>,
+			      <0x1b35000 0x1000>,
+			      <0x1b00038 0x4>,
+			      <0x1b36000 0x1000>,
+			      <0x1b00040 0x4>,
+			      <0x1b31000 0x500>,
+			      <0x1b10000 0x1000>,
+			      <0x1b14000 0x1000>;
+			reg-names = "csi_clk_mux",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csiphy0",
+				    "csiphy0_clk_mux",
+				    "csiphy1",
+				    "csiphy1_clk_mux",
+				    "csiphy2",
+				    "csiphy2_clk_mux",
+				    "ispif",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMSS_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI0RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI1RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI2_CLK>,
+				 <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI2RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+				 <&gcc GCC_CAMSS_CSI_VFE1_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+				 <&gcc GCC_CAMSS_MICRO_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_AXI_CLK>,
+				 <&gcc GCC_CAMSS_VFE1_CLK>,
+				 <&gcc GCC_CAMSS_VFE1_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE1_AXI_CLK>;
+			clock-names = "ahb",
+				      "csi0",
+				      "csi0_ahb",
+				      "csi0_phy",
+				      "csi0_pix",
+				      "csi0_rdi",
+				      "csi1",
+				      "csi1_ahb",
+				      "csi1_phy",
+				      "csi1_pix",
+				      "csi1_rdi",
+				      "csi2",
+				      "csi2_ahb",
+				      "csi2_phy",
+				      "csi2_pix",
+				      "csi2_rdi",
+				      "csi_vfe0",
+				      "csi_vfe1",
+				      "csiphy0_timer",
+				      "csiphy1_timer",
+				      "csiphy2_timer",
+				      "ispif_ahb",
+				      "micro_ahb",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_ahb",
+				      "vfe0_axi",
+				      "vfe1",
+				      "vfe1_ahb",
+				      "vfe1_axi";
+
+			interrupts = <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "ispif",
+					  "vfe0",
+					  "vfe1";
+
+			iommus = <&apps_iommu 0x14>;
+
+			power-domains = <&gcc VFE0_GDSC>,
+					<&gcc VFE1_GDSC>;
+			power-domain-names = "vfe0", "vfe1";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		cci: cci@1b0c000 {
 			compatible = "qcom,msm8953-cci";
 			reg = <0x1b0c000 0x4000>;
-- 
2.47.3

