Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378494;
	b=oof0eBNP5FlYxhW0Cr8hXArOK787O/3C3dQT++73UDAJsZXLv26EifeV4zXeqjH72VUO
	 Jaids3Qoa0DzniNV0vI8Z7VwyfvJYgccFBNFClAk8cOsVT6PXQ6EO9AasuTBRGwkqZYEm
	 0yHxexWFyp+qpOsjoQ9tFYhiR9uHw+tOo8a3b1BXAvzPF0ou3YCbdEXVhzBi4OOL4v32F
	 Vb2Z6lsz2oA9RA0xwalXbcPKRH6B4qLsQsHbSBCjDtsyYeWX5yUiBSgcAiNWO+lb1TI0u
	 /vtSkM/+bkvAC1Ny6TxpNSMWR2uGa8VzoaFf+Vh8pfNb7RFyWA2h2fivl9HzLZNvOYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W3DOibmTouZHMicE5mHPj229m6Ggbgawt0BEFNpJyE4=;
	b=ArSkeK5UdQtWLqsYvaBHozaLJjlfXKo3Q6cLEhAAFojXgo/SoZz26+pbmp8BfVa2DPLj
	 BcdmRr111j5JJAjizHnrGzy1Gl86RqYQH7RaCEn8NQAW+VQYC6hHEhPCCw61wZ7UZuEXc
	 bjR16AovaEtM7sOtAxRPIjWIxPP7KPOP6qtQfOtWUxLha5HcL4oZ4sDfFi5qj3dRczZ0X
	 KqCtIVomHoLFyOlkBJWpLjoJTD7dfzWuH0mGhKzqZbALQSFi6oK1GdvhGbJWjNXX9pgLf
	 6OvIsZXLSY/wKjwjUC6ZSdYqamk3HyqBozt0f8HTguFs3DDzk7+0TEKrhV4hB9NaeQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILYBHBS+;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87772606A684
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87772606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILYBHBS+
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so2924924a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378493; x=1795983293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3DOibmTouZHMicE5mHPj229m6Ggbgawt0BEFNpJyE4=;
        b=ILYBHBS+B3TI7PbTogIuuMAICxrVMAFQyhYm6WTkVWi+mzR6iuxrb3UvF4rVAp0YDt
         LGnESxqxjrV1Y8HpHmyJMURjL2kZUhp+wYrs1p9M84UbMVBFPy2G+wpY3mlQe76PorIj
         BdcFJgbVl3flZoIBXTKuAEy5QyDrvk550CPBuM0BaPiP1ptobzKyoMexCMnhAyyWYhb2
         eroduMh5Mo632NnK1R1O6c+XXXbgDUgXK9GkTR8xuj+RWhStwEU3LdCaqpLTuP5BAyom
         JLuLtzxnLQts4q/BRop4L8fa1X55fFIQ9lfZCzZc9l8GO+rLqQBnXU9BuGzfziBF/XDD
         VVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378493; x=1795983293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3DOibmTouZHMicE5mHPj229m6Ggbgawt0BEFNpJyE4=;
        b=xBSUV5uu2CQaZmJl9RHEtnIkES8K63a1r1nTvRBT9UgLikTaPh1e+NRC1gsYc74hyo
         1JjgFmp/9Cck4zI2RnMe6k/EQSt8SnheaSLQQyGJkHssxUP5EzgH/r3WeDmTHOvBAa6E
         nkijTWsxRiSVRsj6PVmYVdlPTZ1wu8Gk0slPaWxp9ai9oDxpeOSkvu46qKs8VdC0uT4Y
         Ym7bCXajxpAfH8TvV5CwpHvbZR2/hcRw8Cqgh9wlrMtSop4HEZsgo92vu6BS3pURnq8m
         rtFlZnmJg7ysqBbq1w0WsvqgOtxDNfYuFYjO+iYrGE5WTNuj1l+1x5cSjG0H5rVUhZKV
         pC2g==
X-Forwarded-Encrypted: i=1; AL+hErGXKOtxAbDP0QRieCob7xXlfNIkdSjKR1TawQItGfKhinF0o50pyFv+mYLHL3I8lVtfPdC5q9AqMvaGX+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1ZhNEHT1COXPvRZrdau8PitbB4otQAzNyjaaD6FEIKsCeb7SF
	27TiDgH4YP8WbNgLZ1rQscogJwpr+T3AYf+MVk/3W6ZEE+EFuIIS0Tr4GH8hQQ==
X-Gm-Gg: AZFdTZc6IhZXZCANKUInRIUhiYKMCvtgqQ84k6VS5al3UOgq9l97esnqdRSoLwiZXRH
	7vBInIpqeZ9DBijZHc8ZXDQuqHu1T/r5yJS/FRgdR1e00UXff9QFTxBrw2mGB+XahYmO0PpxQ41
	Bm3WwaPu+tGMCRe871zlR/gfjy5NcRv7qvoVXl+W5uqT1Or9PoE+endho6SpdGHLUyTCSQp0jdS
	gR+V/xJZIWqiNaRMgLd7RJQILowN650YvWScmifU4NWDUDVHyGHUeuYUihNnknruOR+hYs458kW
	XAS5u0IlX/lpUUyuDb4HUy1U9dP9T4xYdtCSOJ8R850d5qD8pFE/JfyMSL0SQqmHmEaDGbpnoHe
	SoD3kXFTB8/VIFCMIOwyxD3D0azNXFpirc4/P/mLFqMF4dPznDutO7pKx+rYkeB5ppdjjI0jz2B
	4AIaCQJuALDDPsE/z3zkTEp9pMND0LWFXtSJWYIBhWVWqVt67mG6083IVC/rgNYuhOALzpFPerk
	xmYVZw5wREjc/QEGuG79ugKx5NYncgAgFvudD7XgzbvUirAYfECTrtSte+wn9FdwYOSisFuzCyq
	pWZWg5tZz5JCPLrgKiIKu2+iu2TIrOfU20wxO6k/issd17gFzSNaLQQo9yfdTGD5+gOB8FAdXxr
	IMWILFw9fbg==
X-Received: by 2002:a05:6402:42c2:b0:6ba:b1ea:398f with SMTP id 4fb4d7f45d1cf-6bab1ea3a36mr810664a12.10.1795378492739;
        Sun, 22 Nov 2026 12:14:52 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:52 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 12/18] ARM: tegra: tegratab: Add common sensor nodes
Date: Sun, 22 Nov 2026 22:14:01 +0200
Message-ID: <20261122201407.23742-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

The Tegra Note 7 uses an InvenSense IMU with different per-device
calibration matrices, a Capella CM3217 ambient light sensor, and a Lite-On
LTR-659 proximity sensor on the P1988 board.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 37 +++++++++++++++++++
 .../nvidia/tegra114-nvidia-tegratab-p1640.dts |  8 ++++
 .../nvidia/tegra114-nvidia-tegratab-p1988.dts | 21 +++++++++++
 3 files changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 07091ffa6df19..c839e6159de5b 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -989,6 +989,13 @@ gen1_i2c: i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <100000>;
 
+		light-sensor@10 {
+			compatible = "capella,cm3217";
+			reg = <0x10>;
+
+			vdd-supply = <&vdd_2v85_sen>;
+		};
+
 		rt5639: audio-codec@1c {
 			compatible = "realtek,rt5639";
 			reg = <0x1c>;
@@ -1022,6 +1029,36 @@ fuel-gauge@36 {
 			wakeup-source;
 		};
 
+		motion-tracker@69 {
+			compatible = "invensense,mpu6050";
+			reg = <0x69>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(R, 3) IRQ_TYPE_LEVEL_HIGH>;
+
+			vdd-supply = <&vdd_2v85_sen>;
+			vddio-supply = <&vlogic_gyro>;
+
+			i2c-gate {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				magnetometer@d {
+					compatible = "asahi-kasei,ak8975";
+					reg = <0x0d>;
+
+					/* no DRDY (polling) */
+
+					vdd-supply = <&vdd_2v85_sen>;
+					vid-supply = <&vdd_1v8_vio>;
+
+					mount-matrix =  "0",  "1",  "0",
+							"1",  "0",  "0",
+							"0",  "0", "-1";
+				};
+			};
+		};
+
 		bq24193: charger@6b {
 			compatible = "ti,bq24193";
 			reg = <0x6b>;
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
index 8177e4f7db489..866158f055913 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
@@ -7,6 +7,14 @@ / {
 	model = "Nvidia Tegra Note 7 (P1640)";
 	compatible = "nvidia,tegratab", "nvidia,tegra114";
 
+	i2c@7000c000 {
+		motion-tracker@69 {
+			mount-matrix =  "1",  "0",  "0",
+					"0",  "1",  "0",
+					"0",  "0",  "1";
+		};
+	};
+
 	pwrseq-wifi {
 		clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_3>;
 		clock-names = "ext_clock";
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
index 9447203eeda36..7ccda46c42af2 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
@@ -7,6 +7,27 @@ / {
 	model = "Nvidia Tegra Note 7 (P1988)";
 	compatible = "nvidia,tegratab", "nvidia,tegra114";
 
+	i2c@7000c000 {
+		proximity@23 {
+			compatible = "liteon,ltr659";
+			reg = <0x23>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(X, 3) IRQ_TYPE_EDGE_FALLING>;
+
+			proximity-near-level = <50>;
+
+			vdd-supply = <&vdd_2v85_sen>;
+			vddio-supply = <&vdd_1v8_vio>;
+		};
+
+		motion-tracker@69 {
+			mount-matrix =  "0", "-1",  "0",
+					"1",  "0",  "0",
+					"0",  "0",  "1";
+		};
+	};
+
 	i2c@7000d000 {
 		pmic@58 {
 			pmic {
-- 
2.53.0

