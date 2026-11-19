Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107274;
	b=l9g0K3XZySQOlmcEdY5m7pFxSP8pSiomNkqdD3vm6EDRBSPYvlA3t8JywoxIoVYbjE61
	 f09mXJ6eUsnf9xmk08STyiBvSJ1G2CTFaahLIl5E4PyN69wxZX8zvazx/NY6okqLVwUdY
	 m1Np8YDNNBglgnnnoe6E2EcyO2vmuVBFRaHAee6JcSyYZRTV247lu96gS45hMQmsZbSGz
	 YCXKXEze1mMfaCez2YDWfMUD79iAulFyteyjOXlzTmADP7N3qup4mUsf9PUGvh9w5CpdW
	 pCweuiFhxA6yG4pkOOo8vmfFqC9IdJliZoaZ4sjG+h1VBUlWhNCxUEhjaRskDZbr79Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F0J2OIIkJQaAc8JC0X1XpyF+PM+4498+YyFt2tkAI9I=;
	b=A4ZU9YAZibcNfpYrmlBHxKNitadMj+hTgvgyaQiIf4ZBtqnD/uoIjUBqxhY/YvjsPyal
	 MzkCm0sMfCwNWLqGt2BEB04vakw6Z+weoMnNDJNXLf5uOcPDOsW0EA2pvuuLLwTZLX/ls
	 H71K6T7DMa13HZY0keVQ7mBt07gguAd6NDUSmrOqWWB8BgbxIEno9QrO2nA/lHi1/w1Tx
	 h5KSBbsJfBZrefIt0s0tSHlKhjIYxkejV1rDOIho/5pSgVBE1W/2r71admZ9ReY9ikWGK
	 K78N1g+JLwO4nmiyDacXXoapMiOgykU7VJQ1pJG1vLYfni0gV5XWoy2Xx4QvDwJXwqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juhEOwGF;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92E860A6F44
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B92E860A6F44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juhEOwGF
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1678835f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107272; x=1795712072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0J2OIIkJQaAc8JC0X1XpyF+PM+4498+YyFt2tkAI9I=;
        b=juhEOwGF2GOjxoXtmjs2wXb9+vc1RddKdvLf/LxnA0U+tZF2dd0cGF0s07L5ffEOWJ
         h4LKn62uiKSoqVEeqMnvaD+aMjk40J3zn0ctuFQISREnxJV0NphasYOXXvBl35yMvtey
         mwHSYKhcUkiHIIGinJfvjQuMHKufDYa8tpA/QGGslQhw/IaeX+ZzQUTPn9ICizxOENbf
         oPA8kDxf0gZqOt0n18v8pvMKVxK7TpJKlFNPOYjOfxWlrp0ngsZCoYs/cdgXK7uKEklF
         WiflhUjEAc83kAny5N5Y9O5ZfB1i5Z9B1GgXYh5RP0Ho9VQpIi7+POg/jvs3ZMpdWNfI
         49Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107272; x=1795712072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0J2OIIkJQaAc8JC0X1XpyF+PM+4498+YyFt2tkAI9I=;
        b=t9uqZaeShOdEgNWe3ZW0ddaW5RtImqS8shIzWKeH9oPo1Zydp1EnI7UNnDaqEWyZ5A
         lmvZZ6v2YI9XMbn1XzrGxX/tA/C2KlWqXkLt2uf0oa0jrTpKCW6hCgQoy4TEguR63CZM
         ScL5OfpNwIb/5ICnX3bNtaN8Lss3tNFdUP1fh3Uh/w6uhVZc0ntp06QcnFoIJL6zhSJO
         jaE79P7LybDjBtx/3piKwIWGFy332DpmUYMYXtqgDmnWpcwtk5nqkfSmuxWK6Da8eWCV
         8g9PiNl2aGHyU5A8Pyv7O5DZWYsRxC14qunyon+pAK7jwFJ9eEB0l0hWDW7ZNWkzolGI
         okCw==
X-Forwarded-Encrypted: i=1; AL+hErGe4WoMLoEvxIdrBTzip1ei+E+tkOisUvFCcxMFNYyaOLi9HJZW7TcE6u5+KMn4rXSIldmVfzT+YY7gKmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W4DfOM6Cu0BHpVMfgcuUMCj9DIMbc0qkvWVdLx1rOv7Ui1lmE
	1DMCTMyxUtVSzXfe3ADolLR91pcG/hu3REYbkgZMQ5ocb/ExBPdALsIL
X-Gm-Gg: AYBFou37intVZ3pbmTEPKw9z8gEvV9t3/IdGTqp0JnEgsg3x35I0ShJWd/EKaxyUd78
	Y3rRpw7VIA+4pSiuYk1JxhUPzQOFfBEE7zBO1Y93AlvyCCxqkaZiOxGKNpfEqqSckwo8pWM7GNB
	vdsurN/jH/sRMSyiBqFBoxXoYPHmZJU4sIgGcKVkrnSSFL5TGAEZiAMX3eN7sIoPGsMAeH1PmNC
	EKfz7vCrFoHTb1gnsqiQXYw2T5/CdsG5+U9hi4TGBhPxIRwKVWCJ1OGbDWHhIujyOnVKD6ZPxaP
	qgK4lUwJqtntUS88iLzP5UT1nH1OYvXhbhgd7MkxMfAwP6ymqoLAuSPMcIwLHuvHvN2j2iV/0U6
	bw6ZT1jIJoSrysRl7b/2WtwEnYfO5qWCCJ70GaoH8WZWEIWFA3aaHp/D2BXeD5Dt0JAzAJ36zao
	+fAAGCCFhdT8Fmv4uzh5AHNF7lVWWKab8M8aNmVtUGiBlW1DF562cLd4bxr7Tx7C1LUDh5TETPf
	F1shkc/fBaLx2QWcytvyfvr2fZLEEVG0qkKUKBQWoLSvsu4YLP2mD2DPeBe0qAxwne1j1qv85O3
	aZ28V3RBYwDsVvp4I0dWKm/vGxbF/PSsXnzpvv9oLsQCEe0C6OGKLB/TSoRNFO1ogytA521pm4M
	=
X-Received: by 2002:a05:600c:5303:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4bb8880767amr1755525e9.9.1795107271789;
        Thu, 19 Nov 2026 08:54:31 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:31 -0800 (PST)
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
Subject: [PATCH v3 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Thu, 19 Nov 2026 17:54:18 +0100
Message-Id: <20261119165420.24466-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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
index 59d6c1518a469..160b6f4c98b17 100644
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

