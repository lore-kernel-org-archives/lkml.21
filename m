Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003647;
	b=NVmabB4josDdgzE+9c8Sd6ZhJ+D8ImomE/OjCMj0hghxDe+kpQnmsFu9mg2wAkLbG417
	 bY2KsMEpd/CZ0f9KBmXv/HKHCK8nxC/IZCsCl1d3R4pX+/W2Z1O7GPRKZ1I84O5dPBEhA
	 Igv7W3xH6q4WE4hBE7MUk/p227NfNUoFiXP2Yu4dqbr7ts5D4ByzI5Hr6HXTl4CyTlvuQ
	 XMeivJbHeH3ZH8aUr59Wb3pXUfrpI4SIy+/TD+sjHP/TeiPSoCX1PrneKbGA6H6a6TDLw
	 57TGHvgtB84BfHBhTZrqPIAhtK81QPfAbKCNCfCsc95T7jR8fQmpuxWwlzIpuY8wG/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wOO7pl4T1V2FI+1ZhOhvGDpiZBHJDeIfIIIzY8CL3HM=;
	b=1PfP5V5SBpra3Do02yLBPhC9y8/k/l6zwzPY0ldKg463r+3N+4T9NUCQdJ6xPW4mwZVr
	 vI1+UL/c0L5QuAHcjOitYm8QM3xLye6bUPDR3CMfBTB/e7HEZBAFKU256fT0GsluPYeu0
	 xaNIMQPL2wqLLuojrLTQ7bJX+isXSZBy7V9+p1G/zyJ7/Ee9fW8KREupLyWwN3zfUPesv
	 pfbuj4r+mW0r1Yc6VD2MzMSXlqC9IbwjPkaTSR78xUYhRvNvTj9iBHBd6jjRlmJXeB26R
	 G2v27vfgpQtn2HBQMBxzZVmiZ8UQL0qrfZQPwpLdQy+KN7UBdOySfZuQi345o/JqLAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hCM3XXoA;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D937260A6F45
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D937260A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hCM3XXoA
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so562496f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003645; x=1795608445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOO7pl4T1V2FI+1ZhOhvGDpiZBHJDeIfIIIzY8CL3HM=;
        b=hCM3XXoABsifPCJHl+S9eIEkiniH8JknIKrQQ5Q4sOKVkcnlgSaYr4w7x6Lm6d08Ue
         TZ1dOmCDAbwd5+r03qljZcFpePl0kaycFVhaciEsPK8NYWUznZEYvVuDRQTNrJJ/cErB
         CwzXcoHVSixwu/iW9djD6fPOSrCq81FtTuYd9zHM5NR8oFkgkTUq/7+v86Kf6uK60RLw
         xIBruYyEb1eKcyjlwVe3KmMBsmia9hK3JkIWr966eDgD1FvzBi1elzbRLMkznNB2eTCZ
         KIcrOtAdznKdiLxM25GbEO+cUeIFZwIff93pzsBsPYmo8lt/MaygSGgz1sazwbOKgX+C
         g1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003645; x=1795608445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOO7pl4T1V2FI+1ZhOhvGDpiZBHJDeIfIIIzY8CL3HM=;
        b=NtpCG3ElGMu8rZjccmwuvRNbwDVDETRr5tNDcypG1p9bNQ1A8UD/yXCAnRQ+eHrNm8
         uXbFRU5wUC9vjo+cLIHsOgTdofluVNTOOzXmkHyzEHzInYj5z+pNGq1ZkQCqaWhvL23+
         VyLfNqGBIOgzCUq+z5vHlyZoOrMVrq8BFptSga2yQ9G5omrBEdb6NPUdcxyCTUOolgd4
         Bdu29pxECSgAHKtFAZV1qEY0kCYc1WXOGkOF2a1VKitdH1UxwuAL9PzAg7HwqBQa4sOt
         GyKvBBV5dSqyNZAfvbznYY9Lv6qkb9x/uaJbyZ4sVubILU84kuB5t4J6kJtmB9CpG6OR
         4ejA==
X-Forwarded-Encrypted: i=1; AL+hErHGPJn8Zc18KKNmd527npEDD0E0ZbVhMOVtctU1YDPsqepct8QKiVtjwOYoBhPC4qcSwiS4yMJulJRmdxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OHYokz7ImGW3bn06UgFmldz70OzRNaxk8yxBIGbQynJT5kkZ7
	DByNykCT3hiizZVRgQAExxcfpws+4tZ34Oa+JR3Hq1cfgaysFTK69N8s
X-Gm-Gg: AYBFou1+DqAQj2pCLOm2YhoedOHifM3A8MNRq/PR8z3ZeksVzJXIqrZ/99ccjRoCPmY
	K4s0pbpN9oWV7z/9XcALPQV693h91XeXSetock5bGuCI6bikRyKm+WMDWILOctsR/EiJddMxVIy
	IpalJtSf22yxmGM3XomYSC9DCSSnYSwyX8GwAoer+618v0AX3vRK/a3wxDow6waFogxiZSlPRP3
	bzs0pxf7biQZ2AHTINEq/ysc2vqchTn2LUinBsqOrGBsllR3ABwiZWi/GiIRW+b2qAxmHBRBaJy
	5MXb0Q5GS+U3l0g7v+NByjiNgOHchQCirCyH+0uw+zYdQxRAXpk97cEZa/Q51mT1eloa/jhFP2+
	M/izb3uazQDk+DAJIAjnCfOQiZt8+lppDI5X+DIx16FjV6hWghbxxOu9nnEXF/mlznsZfXSTIuD
	kvteq5ukD3+mpNnL61FGEDYMlR02JxiVmJz+QW5cL4NaKabACDoFvthRXrePGr6efLAeQmttDTg
	FdZ/wqqXwTipCf4hOqdnYxk2nJiRW8O5Sa48YedSEDJgl41N4LggP9Dyppr7hklzncouoLez/46
	Vnp6MKZp1US8Zyz3IFKQmi9y3m5XgJOatpsL3hasaZHU0iTo8L05iF4IBfqnIpeCx4m7+EnuQV0
	=
X-Received: by 2002:a05:600c:4e93:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb7da12f06mr44646025e9.17.1795003645203;
        Wed, 18 Nov 2026 04:07:25 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:24 -0800 (PST)
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
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Wed, 18 Nov 2026 13:07:12 +0100
Message-Id: <20261118120714.31505-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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

Describe the SW42902 touchscreen on GENI I2C13 with its interrupt,
reset, regulator supplies, pinctrl, and native 1080x2460 touch area.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index d307a52cd0e62..be5b894b677bb 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -101,6 +101,24 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	reg_ts_vcl: regulator-ts-vcl {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_ts_vcl";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_ts_vdd: regulator-ts-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_ts_vdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm8150_gpios 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &apps_rsc {
@@ -461,6 +479,29 @@ zap-shader {
 	};
 };
 
+&i2c13 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	touchscreen@48 {
+		compatible = "lg,sw42902";
+		reg = <0x48>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_default>;
+
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+		vcl-supply = <&reg_ts_vcl>;
+		vdd-supply = <&reg_ts_vdd>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2460>;
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -604,6 +645,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	ts_int_default: ts-int-default-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
 };
 
 &uart12 {
-- 
2.39.5

