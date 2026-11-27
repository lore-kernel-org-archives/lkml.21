Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787174;
	b=PmQNlImuG1lRfi4Y+Kabh+lvPU8q07oU5IEx5069rzVXLn2CVQ3FehxYgJ7B3qvvA3Iz
	 GuVje/2C3PYrVY4NsKAHKuD0S1eNl1CB5p9YxDvXyB/JdU6+Xg/QKPde8W5EyVqGRcdPO
	 DuvwW4SyOVhfOALoI7qm++FU2Bi5ApYlsDT6wM16cyUxNbE2HvcDrVmrWAqsb2nEV9DOB
	 neyUFsPoSuqu5vwLM8H2hA+hHjOUqyKjDRZAGH1bAMt9gtmJi/oFbo1mDAUjSDpoE9WcR
	 xenxF79ScJPE9Y9Ke03oBeOdD+/C4mIsJJUQdm2p+vH2S5R40Gm9bOiGUqyMH7Jzu5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
	b=e82fcVoj3PmwSdIy9PEw0Bnq2hyWBLAxuJ6XSE+sP78R2WIcCi+md22E97uRtxwWD4RY
	 Eu2ea8SF5NaweyViKdQh+O4x3EoipMTO0Z/hv+WBk3PxQ2YAXw91SsBBoocIwYRE9elZ0
	 c6DAgKPJQ20Ps8Vqhi11/eXG4qN2Vsk5+nynKNiczuCGVqyxJSBpsHTMwphPsRP8Stq72
	 jqvH9cSZf6gkw2Sp7PObfWT5qTdFfwljVQekeZuziWqyRRrgG8a5BsupJ6XHkBVd5hv8R
	 5PZ5r22NHV64hWV6AC5beW8Bta4y0HexAdR/TlU3Sqdlsr2wK1kH8BJzRCgkHQtd1Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsSgoHTp;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E83E606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E83E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsSgoHTp
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f0918f9e6cso23985585ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787172; x=1796391972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
        b=qsSgoHTpvT/9ctbzZttJZbtP2h5pd+ESqc8K/2LSApxjk/xCp20O7Fx9kzvh8G6913
         7ZnaOx9ePfZQFSFrXeKpDFzMGe903VH/MGVYaeQN9rORudZ7+77YhFmlHb/7kXxEKLCM
         DTG6EbON6clJR0AvkEmLs0oWREJkTIbwlTzyyNb2obn3/UfC2sGXsjUgAD8vQ/b+fObq
         WGsVkxQf4nbTj6KKbRaJKRsxodoDy4rhSUX4QxsnplgzF/G/Ky6T81XzaoXbDStAZrq0
         ua9/JpZIS5oTK/rksg14NStePupbw5EDsZXPQqpy3cyTW/kRk1fIQWZ0H/na+TYZCPXU
         nhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787172; x=1796391972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
        b=Rhg9yq+GpBxDAUwPVbM1ykpz1PCcTqwbNJrhFEiimzCPe3H1+7tNqaIATKHXTQvbHi
         2S9lTPBVfmFLWuryYPuUMCOprU7GSSNHnbxmTxj9wTvqcw8Kq0stKatgLtT9wCYwhkVW
         ASZHN9SrhvJgscvUyV229GIFh3jNuNMHmIDU7U93MSDisQ2BjiDTB2kuzPGs6fKrTJmm
         YHoPpqxFk8vqWbxwYzGgCrVqZcK+dmVVfT2cYSdikQ971QC+pvGyC73ZSj170Xk1QGYo
         PfSDZIIZG0DuvnsJSto30Pu4k/TT8d5b6NVzuiukfgrJlhvPcKKZsB7aNN6cXXq7hiHE
         XJWQ==
X-Forwarded-Encrypted: i=1; AL+hErEQ49MvOmXrakuE2MBEImuOzesxcbCvoKX/JlipmDnECCW3tLCtFmYDCU6RDPVPabLTlkvO60tuWrXIzLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kGhFoXeWKMyZeeukfOI3ZAhS+9V/5wmWJ1ocQ7g82slxYmjqd
	ClU5l0y4ZXLu9C/fxQEwGZh9Jb3TaRuzqPoU+5mCx1yT+m0pjP/gDBIl
X-Gm-Gg: AZFdTZeHH1F8X1PeeoMPiQ339qfH9hOeHa56JrxuBRfBaNJypB8sEE0LY+VHEzc7KvD
	W9Mvn9JvopdhllEV9pQUGo6JxwsakS92dFWXvpPMCfXmb6SIL5hscM+l1tcpLr+lHmL1tnS145g
	vej6rwvwxBuRiXXDrKjHLrvlJOf065LSmkrW8bOwbCxgr7hlDRfYka8LqlTTtB2ZpFm0FzOSnIg
	5bVApf+ybUUvokpjs5tSlXKU5qgsMBYXLDXEDzWYrPycw7RzVfUlb/RkNJ/x5qaCMtuKko5f+8P
	rZwO6FP2b3zKox0WtDReyAKG2HfyHQh984+bbowEZGvoiVOUkS6epBZkQVmKaHedb3ySZjPLnbG
	7Yn9M3qSYP9WlBZv51P7sTq6QwoNXZGs3V4ArS4ArGwJmJvlrzPZkuIh7rWWAI2OhZcyIn7q0B+
	3bhEsCNNX15JFKeEWHf8IdTxloFIgKmPawhz1sSQCMHBFaINsAkG3ZDGBmVAllNqoiftmrxKCwV
	eYjjoNByM1YUBD6+3m+SSE7MOby66+VQVsZgnGtVWRWOaE83NhQ2GnbVCXIk5HLiFYJunAGIdKj
	1LKU4a0og8mpaNrTT2ArXSj9nNejNCkI3ee+LXzfDpnANw==
X-Received: by 2002:a17:902:f792:b0:2ef:e864:e0fe with SMTP id d9443c01a7336-2f03f1d70abmr227466355ad.25.1795787171767;
        Fri, 27 Nov 2026 05:46:11 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:46:11 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 6/7] arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
Date: Fri, 27 Nov 2026 20:45:06 +0700
Message-ID: <20261127134507.125513-7-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

