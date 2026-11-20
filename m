Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190102;
	b=LCqAu0UrT3yiYQl1t98iWRsU1vFXAzOrj+CjSkLud8VUTEdtyQ0WaF9CeuDE5F1JGwPM
	 GjO6ZtI9di/udrrEMOfrcbso6aDQeNo/2biW4OpNFXdBolnZiRlli6UxXFxwssBQGcb65
	 S09ChJIaqsIy8EpFlxfUz2H2Q5S/n/RFP2HQTl9adC+kPUTSPMa2uQgrFK9LeolYcjehq
	 x3KYDtV/MbPL4Dx1WuRsgilrS9drwoFwAZs9hLRsiaAQgKlUpzdliGjR2YacxYIToJZP0
	 ZjPwCw0ujlYxa608qd8mZw1QJYRmUnkm5wrhPsz1FB4o8RwcqgWeM3u/5Q8z0hHaqQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Woi1KVVkXXGab1Y1GMu8DNbprDgDmJk8VMTl2ZFXeN4=;
	b=qc6UAXVO91yDxB3aCX7meFRu3sAwifVLFglkqJGXrTvpMLsaNyo8tYG+uJU5DzP9z+eu
	 ovmu+4BfL5qSuCqNTqpyNs/E30XhGkYqQ6Wh6qUtCgWUMB1jpxuivNfk7AaWEMCMc+caf
	 c159ZHwr48PSCbLe3NSSmph1EKGFkPk6Xzz73QWculPnrj+VO4u/f09BEZFby8x+CSdjP
	 ebXNjTKmaTMlr/LBi8f6hZ1z0OuHvh1sVNlzkWLCjMPask65ZQseFEtFuPVZ1yKzr/tNw
	 Hssa3pwD6Yj1Ef2SkBIqyLnbvln6ZkyLVY9sbUjZGVTYwYeecHb/MDMcqq+5lmG9J+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ou3nVCNG;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E774560A383A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E774560A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ou3nVCNG
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492690dd5daso767167f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190100; x=1795794900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Woi1KVVkXXGab1Y1GMu8DNbprDgDmJk8VMTl2ZFXeN4=;
        b=Ou3nVCNGovNAGTLI5Nwsug7qGSZlbrE3hryXPA5GJ7IjDhlmZA49AZ3mAguJfyvnGE
         pjwKv4VoLuClOdAK76Ne2G6bhvUBXCmjbFmcR5AuU2pn6clNQJZOgF3UpbAqTyjUNMlB
         0PMZLtl9PpGLlDm36Maj3BdsWrNtw/LDg02+xMKorgNhrJMZ7p6ul2xFpXHjzf4UaB46
         +SffsUD9OLtVLXzvmDOAzoTjiLmvxKJjJnlCJCOyVEqz4EfRCeaqx6T2mhAz07jkMKTm
         10oD/FKG2vB02TnSqqU6AkMc+pcZt++wgsvV0MARfIAxwAGBKccB7E3tjMgVQFDz/bPt
         F+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190100; x=1795794900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Woi1KVVkXXGab1Y1GMu8DNbprDgDmJk8VMTl2ZFXeN4=;
        b=ATBjR79E1zOVHqomJV23ROWs6KZn7dDVdeKDyUvPyY0uXMUs2wOWt45u3Qicmz8lbG
         l8cwhZHYS1O6+OF0Ienq7sJK+em5Ndj40fXK0ECj4mFUHIYeVCvHzUqpy2uZ6NYuggGC
         HqqGYdhyCwPNEa8q3j8weTY4u+DpLMWOz1pEyF9NCfXDpIcGhc2jMCGtFg1wkLqmnVTw
         YEx9G+NiZyPfRUIKgzMmsSLd1HjbhU99R9tqJEts2eLWbTufg0owdKdl6x+kBI9izmND
         zmgJSe+k7dIwoGTMxkKn6Gfi22MxZTIEYCCjL0zaAGscVn7EF0LoyJvEfxGBEUWSpQOK
         h/SA==
X-Forwarded-Encrypted: i=1; AL+hErGHHj5kW90rwDTFkaUu8+l4tGBk7VK6KWe4kgHTp5sjU2/1Q40OQStm/bK1jLUmhnFqrQpb1U/7inxP/7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q98DCrg1UKrQVu+ck/HLv6Wcoaqt1HtDW2SYqPVikAu9iAvgU
	m49T4B07ukLZvcN7Q8ILT7wWc9vtoDkYUGAXorNeoEq04lNTJnW8cZV+AnD7l6IXrcc=
X-Gm-Gg: AYBFou1x7xgtLmn9NU/5zVHOC+/uy0BfZ9OFXh5eb6vk4s9iTI/l6Ral5Cv/+BKQZg/
	9+7JZixlfyH3HUGVUhS3lBMRrj6K3lpg7/r9rnKXZW8hkCef1lsfsTABx5QDNe+n3JSCIShhh6L
	18exPgYDeAJLAqfNDHB+OX9D8SnhkYsghaEUzYruOJV5ziUdQqNjCLgcdGiOoBNtxjwZfOqH0cu
	u6+kuGL5akWQz9dLLCFAwKxYLvGKqF+rXIoIcW0cfMkiRqfq4ldqPsCyVdI329MyPZtXcUmE4ti
	Pt09YV6z8bD6nf2Y9v1N4Nq/69cRO1kIXVy1HyC8YsqlHP0vjaihbIxsibesSsf1Cv0HidYnxbY
	BkbQb0zf0ea5K96B8Lqdox3UXW3T0a8f8FqcINJpk2vyH0tcqat7WENCKgDD49+vTfSR4EmG1pc
	gLOJ9rAxRcpBuKYGlLY8cqXhA4km8dqmgulhzZuCjm/NkR6eWOa8XYyiYcQkZjtS2WaZKhghg9U
	R0KMAvAck28c8QAndY8jp9TIbil0FKpepjjjJYPYJxNGOvjNETACFlfW7l+wHaZMdEjUE0CkL+Q
	sM+fvVh3XH06q4oaYaADvei23+LdjAiuWEPwHtXwhdVQmfJ4DUMKoKGfK4ddm8feJTEW3wNqo54
	=
X-Received: by 2002:a05:600c:a085:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb88811c75mr88092485e9.19.1795190100244;
        Fri, 20 Nov 2026 07:55:00 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:59 -0800 (PST)
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
Subject: [PATCH v5 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Fri, 20 Nov 2026 16:54:47 +0100
Message-Id: <20261120155450.7719-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 709cf9674e2d4..6f00495d42467 100644
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
@@ -461,6 +479,28 @@ &gpu_zap_shader {
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
+		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
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
@@ -580,6 +620,13 @@ sdc2_card_det_n: sd-card-det-n-state {
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

