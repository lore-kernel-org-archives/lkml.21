Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107274;
	b=zn5JG9DiQNrGFOUXyl/i08wGSz7FWClWklmrc9F7g4DT/E2fd4Xi28hpXxGRmGKFBoZu
	 i7Ym6c8Q4PSRx3BSfJ5YmY8JBgBsAmtoThDD6YN7P2bh9IAiaiTvLSrDXz74bh3Dwhj8p
	 0j9x1C/PrwZC9XzjZ6ui4o3EtZ++DcPIuIvLMpT0ba7qy2VrJ1SWcZRH8O1Ab+mMBwwia
	 X0fuLzuS1lXj48MsWZh+1qs8zW9jcyNHCbHa9j4hBkXuI6WFmhfodnfxbZEukWLHrptuN
	 E85LhCK8UHJqqht9h+tvLyK1Q0pEesUKQzVMpeKRGST/GuszBOPmKl00iTbWqIWzUVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8HAdjmJFS/vSTReOhqoIJm4R7O9SEUoXAZM3wxNxKGg=;
	b=XngV+kHqXoJ9G1paLBGE0r3xbH315a+hUkffj3gPO2Mp1ubtU2S7SEylr75kX/IUW1gU
	 GAHkq+q60wrF3x6IgaCP3OO9CLAOtLBwsDHeYC6Y9/lFrhzE53FJc1FaxwkF/HDMUlgvZ
	 0oSytaASDEJaeZY+pRoqbUT1d3hisdYtO+tm6LUyUBFgh3/5lHCG7TpWmwDax1nvBIHdW
	 SBu2uR+HM/IucwPrGp8jloixUQ5gQrFRLS+gOQyXFm/Xe7Cdut/M24QhO/y7cwxerDJxF
	 cM8Uqqv58Rh7JUUhlDTGssk6xkgoSsh/c2G2DXKcuODFgGcp4X1rwwS3DO04y2Nq6nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWxDVM+f;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E43560A6F47
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E43560A6F47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWxDVM+f
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so20325655e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107273; x=1795712073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8HAdjmJFS/vSTReOhqoIJm4R7O9SEUoXAZM3wxNxKGg=;
        b=tWxDVM+fAapdNLO5oAWMSWtAihRfVvePxg2vTZOMR1EAAz1T6LOrtjMhCbIyJukujb
         CK8xrym1k13GJeg8eVnp9YpO7I8Dml4JbqzQPDDNTW260lmsIw1Dy+21wMRdeblnV8GR
         rHisEaxrRdyV7+Iatn88T/yvi4WJXXkqtg4Teig9r/bD8OS9HsoYZmSR6+eLHfTP+TaK
         n8Q+MisHDTFGPTSqSsmHX1qPdRCEoAmYQNGhRWvVjUQVo5FFWYJO8fp22aEacncxuyIU
         NufuF4F5ndIjeqeCEhW7rSePkv+nfoUuAC5W8V9Omo7ibEFqK78trnrigzgQ+6gXRKnz
         5NjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107273; x=1795712073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8HAdjmJFS/vSTReOhqoIJm4R7O9SEUoXAZM3wxNxKGg=;
        b=IR/4EQ6uobUXVnKVYifZXn7OMEYvKLRI/UDyJG0P7/70Oja3Z9NdnHsyRTNGGIBi3i
         BoY9yK4iYqscygVmmOvpyycCbW92exP5Lqj2IzQYFMXzeIOwVmcPNp0wUZueiLtfmTTl
         M+ML3I2MR1/E6ukE7fuwkAa/iN6cZ9jViWPInUpfzSMmoNoN0Hv/xPB6mRODT46xsf7q
         MLKAQFQOoWIs8bOj+0gfKhM9d7lsYhwaf4TJKRi6Ssj97x+AYrWr7OtYD6qtU1YWGNPO
         wfcNkMv8YrKGSFkvKrJJOz64/f5bXVOHu8l5tspYOW7f3lOYzlFTZLGse63gVO8w+R3e
         7gbg==
X-Forwarded-Encrypted: i=1; AL+hErEj1iYyH89zuaEY1qlwr4kE0hKiSqOhhSKe1C3xtTOslNmG7unPTh90PXH2qNRQW3cU8N/SthsFi2ZJpMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+89P+GqhE3yYhp2YhjJ63oSNlIpNLKtVN8mFSj7lPIzf4edN9e
	dR7zHXDQDHjZ5cSVB5G9u6w6zIublP82VudCELZcDTyujDtWxslJLoHb
X-Gm-Gg: AYBFou1deZZCTy647DjuQ6pIXr+BCmPZU+Zo45rccyvzChMTead1Dsftm5vJehDu/FK
	S/gM0zo5Z08WlYGndc/1B4i9KMFDfiMFe5y1NbTYBGoFDqchj7CJKL1XsEjm1ramj32n+PYzDYd
	YaRadROJIlV+eU8BXF3lWH98jlm1zdcN8OtFbc3utp9f6L0s8lJPEOMFztCZW++D4IEMY8EyM43
	T/J4bCpFl4v9BvXs7wuNUHGr3+Yr+YWPl9GmGepcXXGxzK+Sk8YoaFf9WpQ5b2iPrfi5phMUdDz
	qPyR86E9E2SPNiro3Xt1VaKzZk/iGha036u1P3pq2iMqsGRWEm2ePBxihB3zYQz2jraooHaOeHM
	moFHNy87QYbefozABhCoXkZYDoh6I6y0AKwqqs/Jbjz0Ko5YUzgeu53iinc1MGhO52RlKri4r1x
	x3cEKt/eBxqA7TymfOW2lszz3VwHUvIPJL7TxPLT2O44eCmAaB1XDuHOHAe0nsV5PFt93WENpPc
	H7Hej8Zg0GNURJGe7+3iBD+QnEweP9hw21EZeDYMbWZFdHbH68LxQ0pWh0QoynsQ46gkb0/T3Mb
	mQKjjWdJzynZYj4SwbD7wJpDMF4b81N0Z2OlCjoG88lGM8cD8M+jZoud17O1y4YhuHTU23FOyD8
	1
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr1984605e9.27.1795107272825;
        Thu, 19 Nov 2026 08:54:32 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:32 -0800 (PST)
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
Subject: [PATCH v3 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Thu, 19 Nov 2026 17:54:19 +0100
Message-Id: <20261119165420.24466-10-rofikcoga@gmail.com>
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

Enable the PM8150B Type-C controller in sink mode with PDO_VAR up to
9V/3A, and connect the OF graph endpoints for USB DWC3 and SuperSpeed
QMP PHY orientation switching.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 160b6f4c98b17..3ce8161574a95 100644
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

