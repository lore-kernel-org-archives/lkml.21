Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160053;
	b=UUFtRwRpgNkDoNIktZ2tYFRjIMypZxVQdAkl/BJEB0SR8zU3ZIGXckB3kBv4lejp01kE
	 aaQYWMx7W8TA639MEVnF3/ZsveNvlk4RRMpvDQrupq4PZCgqMuzVGJVyL3NxheBX5zKM2
	 N91FEmix9dU2FQVfpknS8Wp1KYxAVJfGzsUnb6kXWNcIeGrKQBKG/Kswm95S9OzW17XmQ
	 Qi+Glndnkr3yipdAZJw0W87VKRIzGj2hTOvZBbalxbh7YXQXRj3DCxRaVEXvRXDO3A+Xz
	 0HHGy92glAUdMD3IwaMjFxNybA9Va5u+6c97ncRakBXtifta8AKfaASbrNWCiwvXwaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0qQAv0ke6L7thaRcZoBAW7C/f5nOb8olxJacy9wBEu4=;
	b=yaY9BBGn5cF+J3k5sBISezi0xvpKiliRX7V1wyEIZUhFBZq7bmg+HMJsgerEClWh1Ro+
	 2OKgzyB81XM6B1EtQNeOZZF1hjFatR08w5ARFMj/lGqI3RKDoi3OyYAB7ve89z8NmmG2+
	 qXj+NESOMJyEgdQhcbbiumgKxGVy23v4zdsT52wXAI8xbcPguaMHDTuyhfS3c/0rJ640N
	 r4rypeeJse6AmZfrfOSWDIKW802PY/ObfN/6kGVMl7+C6Y2hqHg8MLJZBYSnLN1NYEueR
	 KXYQDSy8BLLQENYKoXZ+lPfBCHP5AqcWAR549CEIBBbnSIr+Sz+FvEEQdsWW4Gyc+FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caNuTuUn;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C5560A6F57
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C5560A6F57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caNuTuUn
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so4317965e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160051; x=1795764851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qQAv0ke6L7thaRcZoBAW7C/f5nOb8olxJacy9wBEu4=;
        b=caNuTuUnbk/CiU2CCksNUM3jfmJfYfATNbvRdD6mDUD7922uAAIvcfffd8HaVo7nDe
         maUx/Q8bh4GwIzRKzUCpSPIad1bewWf7Q79xzOeKxcOhcWBYBAvOVO4jdo0T5YtThfJW
         VagYkp64XVf/IqUDjyLItsm0zzUr+wXUGEGfuU070mXHn9b7qxC6mkbHfCXdIDIa46Q2
         nX5Kal+csBsGL+FieTY0X6rMo8rn3k9GjRwuuoOVMTZS6h+W0CAEp+Av3gyxj5dVc06v
         +bOCPl6l2dsP9v4fG7z9CyiZwyed3x5HD7WFjZXszVEPa+rvsp6DLewlgqrMKK3ifbcR
         c3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160051; x=1795764851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0qQAv0ke6L7thaRcZoBAW7C/f5nOb8olxJacy9wBEu4=;
        b=KmXUxJ3JTdPjgsNeNn//GYYMlfEuqPtwy7HbYy9U5BWQNLpSFq0ncG7nH+XDuv+Tb/
         3Eijr5NJSFTIe2cYB8LDWFUL9P+XyqvK6gc6tpTLO5gJgGJuZvBj1G7sewkVSPcognXD
         Y6BrRDRobEzczOOiH7AaMXbvjY0+hlVP6aMjOaj4P4AVepXYKLmg0eFVCGv7DrJmL5KT
         PW1iAs1emq1BttAnFqqu1dpX/mWONSce6mnM9Lf9NTjdYgQN0dcsVixusUKBwjNjsPx6
         ptqB7f3kTMBY20SiTtvo5Tkt1p+evxSrZyBifdylIO0sbYc/dsPl7FyqTGlHMqzzFVH2
         VLAw==
X-Forwarded-Encrypted: i=1; AL+hErGrsqA/ZsbHiuLXF/9CRKGiR+LoylKCww4NCDN/EwZRa24RYa7lXQjMBFQZ6uAp26r2Wl+ZaBO/fwx/4SE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZAv5MuqYfu/ZmuBHBjrqcpbQvSHBGwQLD42N2+U4wjg4yRTYG
	HGxD8CTY7qkqkfGJWlH33kFd692B09Cv6lS528sj2Jc95c2R071PniI2
X-Gm-Gg: AYBFou2oVg84ewtu1+Ba4Ts84pP06UwCrTY//AN3gd0v9hPow6llo4gv5Jz3vewY8kV
	rcjQ0cTjZdJzZDcai8ZizXSuOTWppjRO8ImWcD4dYFaQVAVqhyXqEBxNAz20qSFKtQz6mY1KSVJ
	WYPcq/mrrYTRmFemNuzVV0Wdkpl8NPaguFUKq1qbMMEw1o6bmrfx55AYMoGLXRDcnGr1utETOnW
	GncEpmzLIuebFMuN7iExySmV2VTiynCflwCpdmolrPfCsYP3FC/QG3W9CU0Hi7CBoHf9QxWCNbW
	/pDltFNXXHKgUnRTQwZMJWFU7+gmvNq02hJwmvCLwN1bLFakaCiZyLBgb4uW96qV5Z+KN9BDHcQ
	ISCdeirajUFry2Xg4UMANGZdFzDLX8UbqsH/Zb/muZwOULGb7e4tYB246LBoLl0dZXxnS3drgoZ
	Ez5vcDcQztAZ8sBtJ3qaCNcXuR2lsJWKqmZMIFUsfVgWn/Ud4NbC91dIuvMZoAa3Mn6sCCzv1Bp
	6Tw5DJXRCf4CbF5kTVN14K2b6Y/9GSWoTpNnEB24DGdMvKlMJ70DjM8Pi/4HSRB4K+hVR+zlOvl
	h5YIXSK8Pn8SEkO+LFZN3qK882Lu9PT2VszB54Bg0e6kng9QPB0SwfUXidxm5efhKEMR3Virjki
	+UhgAuVr/NiwvhfAbAfpp
X-Received: by 2002:a05:600d:82d3:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4bb8880f0ebmr49766975e9.9.1795160051109;
        Thu, 19 Nov 2026 23:34:11 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:10 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 10/10] arm64: dts: qcom: sm8250-lg-timelm: add QCA6390 Bluetooth
Date: Fri, 20 Nov 2026 08:33:58 +0100
Message-Id: <20261120073358.10267-11-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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

Describe the QCA6390 power sequencer with properly voltaged supplies
and enable Bluetooth HCI on GENI UART6.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 2d8b06c05ecc3..46258f3a8cc72 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -65,6 +65,67 @@ key-assistant {
 		};
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s6a_0p95>;
+		vddrfa0p95-supply = <&vreg_s6a_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p35>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p35>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+
 	reserved-memory {
 		res_xbl_uefi_log_region: memory@80880000 {
 			reg = <0x0 0x80880000 0x0 0x14000>;
@@ -634,6 +695,14 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <40 4>, <52 4>;
 
+	bt_en_state: bt-enable-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
 	sdc2_default_state: sdc2-default-state {
 		clk-pins {
 			pins = "sdc2_clk";
@@ -667,6 +736,29 @@ ts_int_default: ts-int-default-state {
 		drive-strength = <8>;
 		bias-pull-up;
 	};
+
+	wlan_en_state: wlan-enable-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+		output-low;
+	};
+};
+
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
 };
 
 &uart12 {
-- 
2.39.5

