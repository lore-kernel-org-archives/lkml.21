Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160052;
	b=JbqUlsH6SoeRu0yrL8+rya9pM5CGl/J/z6AO+z5VzzU1HCsY8GfHw3RXQThuTfth5MpP
	 zAZtkBXPXv0Fdru/wjY1FSN5LGqqj8VQ1NYMYDO7kP+9gv9+sfVSzLxr/JiWNnV8mNvPF
	 X3i6nsKbsPPiarJOIGXveDocueGgoEVjsdSpvVRQ2d9w5rwiXp53i98Nyw7ryk0qo6CN3
	 nWrOFVHjk4wTVZlUwiQmjSvD2ruPCS8Th5DI4MNkqt0nFuZb+7TOaXq4yIeXMlRgUQa1k
	 e93PKvbyCDL4EcewcezVuPnhNe7SDu7akGTCIXt0trBi62KSBYtuZso1kAPYNjoEBkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kRnaLXMIjjDmMSY6mFAZa1ZXluewGJuLAGDDGmmf4rQ=;
	b=fMSpOfwnZI9fHBO9oje/+qlJPGfqFvIjlHt7awNDv14m4odDnauAH8hrcfG5X1PAnzqf
	 JVSwlWH32KH2dQJMWaIZIC2y1bWWa1xu08ARITMHxlm4m09xeQNf39z9PTMQEo1Ct/IxV
	 TgR956P+at2bPHE+Jfg7POytG9nom1XP+KIK4U7WmEphvsFrZSP4gp6ulL3ksO2k+1jKP
	 rhsKubhbdvpkqevBEeh5MhAShhYoHxL7ERRlH8nq5Z7HHn/RdhIfOW8w4BIpkszlgpAsq
	 uZBA0hDzaw5iSLYxWAPo9DpHiDzAnYoZwE08rJVUf0ov78RQv9pq0NbZdU78yf+ecnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKPNdU8p;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F17E60A6F53
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F17E60A6F53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKPNdU8p
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so5014585e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160050; x=1795764850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRnaLXMIjjDmMSY6mFAZa1ZXluewGJuLAGDDGmmf4rQ=;
        b=HKPNdU8p6BYIA0PhbhaC1eJory9J9d32I7tNCfsWv3fuI/ikf80iOswt2MD/UneDAR
         pZfsOIkqqGcjGwnK+QtkPXz76nrHkKEKIwP45S6dvMaiaSmTWRYOYMj9bs8Kvr9CqIhy
         UlpiewL52fQp4co1XHQk4F373mEW+dWSbBgzggPwt42FJHWZ7PAAtv//hGT/1c5aa2xJ
         /zbRclE/JIs2XkUT1vW3xRAdh6aefo8FO+wSmudGTq3AiCh0FSnZyAGRaqLKNoh5deiz
         cM5lGO7zQLxFPFWg9KsIf1xmHAtyWTRD7J4o+skfJ5KIHrZLemE6Y9/SB3dgKLtZsULk
         xLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160050; x=1795764850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRnaLXMIjjDmMSY6mFAZa1ZXluewGJuLAGDDGmmf4rQ=;
        b=C66dHMuAjW2XnSA469/Z9MpnDX81RdZcPd51vKkvRtOF9qVzUZe/IqjmH9TONUnEHA
         dNejbmY7jGlmc6PuKxZz1jbSN9mau6oubvwEWpkRug2SkjA7iwXvnCnQ2sXWFaPFLm0z
         HAI22rHgFyegEcEY0YCX19gXPlMH3G73v9MVyEToQ+i0gkxLmfyv2A+8cEltbDkyd3xX
         j9PTgrb4/P0DSV5iXj65CvSmzR6r/wSA480mDYRswBjajsY1z6wuCCSwzqW61mZ24grW
         ruAUdvTzcMjz5/jwqSVDEaSqyLr3ZCHkBSbE50yrBFrnXw/GWNkvWfHwKHO2iRzcxWvA
         GtPA==
X-Forwarded-Encrypted: i=1; AL+hErGHwLkzmDeC5tGDJPJIBXBAeEhhpKiUeWTANZcKkdhnzaUmS+1dilUXgt2aRjzrZoZxkmIdoC+xaBHUtas=@vger.kernel.org
X-Gm-Message-State: APuU4Z96mJufI2uLFcDJW7FOuq9Ql+dPNXoq2BUUWkuzltUORPAFzhYe
	9nDPyabBTY028C+Uh9i8996WqXe8ZRE/2RXjVSq2OB+/56tF507iaz6O
X-Gm-Gg: AYBFou1qGTUEYDw58f2I8xB3aLZZenQXnKc6JFf0mRGMia+U3Sy3ZiBxnCN3QSrukMA
	flrTsRtAWVhFC6h9XV62i6vRueW+DCSvFR4UuLPmS9wNvAMOy75rEeBr1L+U1XCA99LyQT75FiK
	P894h4UrmqhaCtdf13SI14iZf1/gYBNGrAfEQOKEIptaHpq66h1EtytjQFwcvg7fJbU9PJ51jC/
	FgH3t3f+E+/4Vgtkszt0OOiaiwE5pL74/fzhWLOV1/n6r7w8ZP78Gt6FZF9o6+/h4CIrhkG2BtA
	pZbRwWR9pgJsy2Nk45BLDdGcK2v6oGfZgxjTEvz+ZPvTeSBj719OgDL1Bieiq108TWl10N2h5Sy
	mXr3ZtiAH2xhCi/ife9vBVmczZ4MfmzuQRIiSau8x1EVyrcQ9PrH2WTcC2Rs0DfBYcd9TXySoPZ
	iZzU9kAR3jDHcGN0d9B8VPVLd+MyrvGvOdbFdbrqARXQAh9wZRKm6O4VhANXhOv41DdAwlAkp/0
	U+kFTjHOlMGRqQUSW5yv+tqlIrYc3XmuvP+t/uC58TixHthrVTojhQOptvmJ/EfrIFB5yTjponL
	YgnMbp4mzydGsHsPVFB740PCw+TURz8hGoMA8aSrtEpicBKzV2up0YrsaUWCjvV6JG0hdDzUDIM
	=
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr46585025e9.20.1795160050056;
        Thu, 19 Nov 2026 23:34:10 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:09 -0800 (PST)
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
Subject: [PATCH v4 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Fri, 20 Nov 2026 08:33:57 +0100
Message-Id: <20261120073358.10267-10-rofikcoga@gmail.com>
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

Enable the PM8150B Type-C controller in sink mode with PDO_VAR up to
9V/3A, and connect the OF graph endpoints for USB DWC3 and SuperSpeed
QMP PHY orientation switching.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 16014df9c087a..2d8b06c05ecc3 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -556,6 +557,44 @@ volume_down_state: volume-down-state {
 	};
 };
 
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "sink";
+		data-role = "device";
+		self-powered;
+
+		op-sink-microwatt = <15000000>;
+		sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+			     PDO_VAR(5000, 9000, 3000)>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				pm8150b_typec_mux: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
 &pon_pwrkey {
 	status = "okay";
 };
@@ -660,6 +699,10 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -674,3 +717,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l18a_0p9>;
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux>;
+};
-- 
2.39.5

