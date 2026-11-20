Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160051;
	b=pDu7zqOv7WYIt4N6cMTDsrg1o+qN11rEc+yhlMMStspxaucwphHZg/FpNOVKh2Be168j
	 5vShnMiITlXxVgquaahZ4jkhyBej62LnAWJv9kSGqAmKdSQIScJK2vT52Yc5H+XwRTKXG
	 pisim/35yYPwc3C3c4tAiJ9kR43PhOtmFhro4MhvPGaOwrSs87Wa+LfE+WGpPQz0k0Rxd
	 1voQpx8zyM/B1UaSUUjgMPPQL4js7guOF5FrXGWeLpeP0dmdDAWq1UuZCVR6kfru4Lhyp
	 Gt1MB6vr68xo4IilFUY83O3IWczMHlVPR8zcRsl6GDI+Mo9WivavyFS1XdOhhShhDRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zaM+gH/dN44KPfMZjWOtQikePy6isicudqZk6D3g/BU=;
	b=MSR/20ImeZ97v78zIXD8yjxUm2VR6/MeSjfjvA3XowcaoUBQ6+aNU+Rksz7K7pEBcw12
	 O6eyJym848Gk8kveI7lm53P3Z/pIFSkL65zFS4YINPTOr9sx4eTq1nA9N9tPSWNETOLqp
	 yPxRd2nfNqM69KssHPPBnNtjsu7EhPlhSEgzjwdZgp67yIMvSimoDA0V8OlYH9ViBb6Nw
	 TaFwfLhn3HE8ApiePviPUrzMzUJeOrfMgS3AOusxShIDfGXIdVyvOz4UKW/icI7qKlyQ+
	 7p9uqblme4BKDQ4LViFPz8XE0UlTPoemUOqHy6qqBQhEYpiNJt4eRn04vUhCQnIeztw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uM4EwaUG;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD1B60A5BE8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABD1B60A5BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uM4EwaUG
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so4055535e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160049; x=1795764849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaM+gH/dN44KPfMZjWOtQikePy6isicudqZk6D3g/BU=;
        b=uM4EwaUGJ3db/pFbwtIa1AwHXGzh7FRaXsI3Exn9B+X7Y+75sVIT5aImQsYlqQAktP
         DgaBTApC542QL9npLpxxeTVf74R7zjkF0/m3xwM7xwescjyqHBWPycRakWxowLsZb6pX
         cGrY63UXSZ2H2NfsxAY4yq/X+S/iYRF3tiEce/necRond/IuTh8tOFzJDbtLj6fzPK1U
         MAKzBfqdFT2WqL8jMV4JsznILSHyDzkawPS8nssGskfTjuT9GGB1tNE4y1fIaSqBcyk9
         SX9S2XOPB7yHp8jDZF2G4cOaKS8o12dwoejRkN2VyyrPktVoqeYV8KlFIkSASm0WmVT6
         aKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160049; x=1795764849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaM+gH/dN44KPfMZjWOtQikePy6isicudqZk6D3g/BU=;
        b=JukrRXr30LLhjsvSxfx0ehXrQu8coKj8Kn5qcA9P892S50qub+0bKc5H7Mi5gZhkff
         zTpZYLaMVBHM/H/iyWOeZHzasKO6ZH0ZSnsJV67PfXXm09FRKy7k1eK4BROzZkNWI7md
         6rCvxVB9fOOIQL/xuyiU+qDp/EfF1qeYtI8+jjfbMJRga5O+qN5UdEd6QRmVQmfRKPrb
         dAIRB+0vsKN84bGdHyePVzUES82KMd+FPFjsx99HKJD+HATO8+NqSrR1gcdPqIulYBAt
         B8t60i9wt/hLXdaaq98F5WbiXr/xPY7mLWuGpAA+DvfZhVz/qE+80BQMfGzl2D8M7FhO
         rKnA==
X-Forwarded-Encrypted: i=1; AL+hErE5DzrMovyrMP+rWXOHEWpc8s/7xU2OC+sRf8y7mf48qtbXxwsva3NCU0EsAEyGH8TDuOj/0Te5YGI9Ltc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TjygBO3/B24nDMIjOo1r0rZBR6lAMUjTf43+CnP7zhuyFAlJ+
	nAEI8X2BJIuNKbIeCcHVKegGZETEtyPknQ2XQ1JhzN1sdqLEB+MBWl6Z
X-Gm-Gg: AYBFou3SEKv7uhlOnajJRh8O9fOAAFT0eOPbHa44RTjWFs8LBGlVpXeZBQ+McQV0zLH
	2e6yKKMCXBcz7tdPZFoJu6w/RRlF2vHLUJdIwXUNJVThrvXY7tvl42DOd/B3zTEoLWTN1Uk2mMj
	0aR4aTW9tB2jOwL/z33sffNU9FMSZQdJQXyPp7K2a8G53a0gz833YAjOcANmgdSqjL5qtm4pTNy
	qm2WEmhfc+AbSfKXOcPL1W6Z35rWrzUXKJA80Fs8xCBuinhYTys/0Q7vXH/ZoxU+rbbWgYkYpAg
	8WlbNvoefY8/2aEb/MfAfZ1NaRUgTRY2rEIJVaza3mbgyiPlckh5kA2EfBGO0Ld7FcywSLakv+p
	3E3iP9cl+VRKNKA32urzt13auDFVnzHQqraFhW1rq4IT0qBbhGXxNhTwGklU2H6Wdc7U7LjBoUq
	UYr2nAiiW/Q6GfIJ5AvVeP7mEKiOVTXWMJ7kEVfDVHcoDPu2HpRAmZ4fafhGUuNpOCE50xIK9AX
	BLYl/Ur+W0+7n+4r29QeLE995Cc7v8mAgftcjF0LmuWicacNNO4dgJHKuvm3NtRLqVxMvWnG2ZN
	ne3zHyJ31RmPpSD+NXWleFJex1QWccKdGPs5v+6hkHUpUZv3RPH3ZCYbiUNAykH8EzJ6SYNbTOU
	=
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr44615435e9.12.1795160049029;
        Thu, 19 Nov 2026 23:34:09 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:08 -0800 (PST)
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
Subject: [PATCH v4 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Fri, 20 Nov 2026 08:33:56 +0100
Message-Id: <20261120073358.10267-9-rofikcoga@gmail.com>
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

Describe the SW42902 touchscreen on GENI I2C13 with its interrupt,
reset, regulator supplies, pinctrl, and native 1080x2460 touch area.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 709cf9674e2d4..16014df9c087a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -107,6 +107,24 @@ vph_pwr: vph-pwr-regulator {
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
@@ -461,6 +479,29 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/LG/timelm/a650_zap.mbn";
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
@@ -580,6 +621,13 @@ sdc2_card_det_n: sd-card-det-n-state {
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

