Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190103;
	b=gv1e4ZFfnkjKqdXvOeq9Vfbt1zSblBvQ1vL82h4g4Z8geUea08MxgGw7T1M7PvN1SGzW
	 yVaPN6jPgjPZHwnlEA2uURvOg0IKndWheSwdNV7NSh2mdmQ+wSmJlWY/Bl91u7VMyIfH0
	 3jTgKkinIqcABha6nCBmMRO5+lutXRu3kLG2N1peQSMxiUqr1hSS+fCOMforxWDIMtser
	 3T+URR1RsIANbJFTis1dSIKarwMsGQkGrpkg6MGU3b1V+d/zgKvs+hvj/jCtl7RIEX0rP
	 cfL/aX1grmX6XKYvQ5I67/pc+SL6+wVJ0dyfANvdnLt70TojutMzgK+GUNV3kBKTcHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=grKFuqlZy/vF+EZ9KT+ynP4RyPsh8Pe65v03F3LVnyg=;
	b=BH023gVlKzb9JGCfrGo4vPpzRyBPI7GTqiHtjmbOP1Fwy0Z1zq2IgAX9C4/DebFVAP3H
	 mpppgUEOgIQkfq4PkiVbNeRhCeY0Ac3zQKOLQzTuEfSRUH6rvY9XDTItp2IhU4hRCJvUF
	 r3ZX8olbfe05Vg0tbKreQRwAn37rwQRheBWsBpRFhWSAke2s6dt2cdu6rokh4djWUH7F+
	 jeq59OI8USWPIfkicubz9FGhSfJVOnzw/FsMuCez/OYMc6er8xQ12QHVHrFemyLyGItw3
	 H/gLGnmUxrJ7pRw65YkoBC1EtZa2TZkKiBdtqtKRRAjgNTfHemCd2aqNPjYqdSMcPWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2kOcKCi;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F7760A6F43
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F7760A6F43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2kOcKCi
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b467581b98so10544535e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190101; x=1795794901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grKFuqlZy/vF+EZ9KT+ynP4RyPsh8Pe65v03F3LVnyg=;
        b=s2kOcKCiOdhayP7XlDN2K+jTO88jXK32Xj8Z2koNKcodABBvPJzDEE4lrX+uH+BskK
         0j3ep3cMpa603H22Sp9sjtiY5cc1X+dlyc2t1VLetPq93hcTtVn7qjJY2XO0nzH2u3+J
         jISqCrmykUqbgdHqNpBZMZn42xrQi+HUo94jrL0T5wA+C1RQjryX/goit+z12GCpIuyX
         rTN6a/b6TrCLyY4Tnt1HRXy5HelUHYJQ+iX8L9yCnRYQB+5LEeJumKhULoWd8pZfTJsp
         jAgjEBkCFcppCTLmOUI4cipO1YR5A9A8vrYTly24tBfFcIjv4eHRHrgGaKouh/fAOe77
         Egfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190101; x=1795794901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=grKFuqlZy/vF+EZ9KT+ynP4RyPsh8Pe65v03F3LVnyg=;
        b=UileVGDtWr3T5+h+irMahQv73xbGtkh265GnYnagFGNSxZ5vRN3Xyc8iYF5504JLwN
         NQx0T+9jjnSYJ+vYsLUAW9DkNLx9YoUCJubkD8KfdvPdqdwB3+ZYn8SYNQH+5pMKrAWh
         NwOY2HcxjJnUfTLwqDPwS4YGo8jFKOydmJJ+PghZOvL1gWHcG46YlCvxQ7tydS8ANjPf
         Eh4IJmOZWbg8xYsYAwXS9o9/yxAcn/dWssARTd8pdzaCXM42USY5MOFr6g9vUb4vVx7b
         gVsDa69lCyPvjcQ/tVGIfy0+f1831z44uhfMGpNfYzc9pJzY514xPXb7XDWLy3HhefSl
         9/MA==
X-Forwarded-Encrypted: i=1; AL+hErEa7D4kcC+eTxb1Mh8qKsjENkBG5i6SbE38tHfHquhFJUDiUZ7OABb6LcRoHfhX69LMd2o+GszhhKzJZlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hw6HaeMeSOAByqyzUVQfONG/udc3MO76/2HmjTUXp1nTay/UZ
	MWr4jrGujWMyr0GUSUC/fkMQ0fmtSTB0gjJ8tt1AeYcjU/eCIJ2wBAWI
X-Gm-Gg: AYBFou1EoBz8TXa/91Hz7c8WXgHr8YAtmqmWZF3MU2w7sS8zZdyD8fuJ3rt+24mYkwX
	zf7jgpT3HeTuzyiXXth4k/EsBznYsJR4TWnTSb4WxrKbqRrFseksvFUDU2cXnqD+UFXT8B/w91J
	J7N9fwNDHkXNZw1LD8QmmzNCIqL1a14+2JSBBqCLA4RXLko3O4xunTNbchGSRT9W6a6u0fflUb/
	udoXHvzN4D9nU1mspOTDfw6p7V2/hB7MIc4g5I8b85PdI9TOJsiHrBOS6vItDRJDXYD293EH2Lb
	6YDUAnCQ/+HsTzskndEOsKfzjDbLyAX3m70tIrqTjBJUxwWCng1Bti3a98ajDjdHEJleTWjCeCv
	0cYrDnPicGxdQPjC9dbScUKtNFNKsCs4Qwvc+GX9ojUXvI9+3WfqnrVA/vqGiCzeV9e3cYW4sXN
	F3ODmfSRnRw+kDjdw5tyDSSiH9839MSD8nrRjq3fN9KYY6Bd4NEzOJe6xBgG15E8Qf2Q60/4rlw
	lzZ/9rE88sMdzmAnS7w2WAt5NAzaz1gi+pkoSDD3cwrUlNsL4jhhGs4FybHIKySD9byYWyy0siV
	v82X3OzZAz7LGx5IOFt5exR7KUNgfjGOuRVwSAzQ29DP/YsFmMRWhcgi26jtK8gg5DnTW2FrxH8
	=
X-Received: by 2002:a05:600c:3e0e:b0:4bb:6a5a:783d with SMTP id 5b1f17b1804b1-4bb88929c63mr74999345e9.18.1795190101297;
        Fri, 20 Nov 2026 07:55:01 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:55:00 -0800 (PST)
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
Subject: [PATCH v5 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Fri, 20 Nov 2026 16:54:48 +0100
Message-Id: <20261120155450.7719-10-rofikcoga@gmail.com>
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

Enable the PM8150B Type-C controller in sink mode with PDO_VAR up to
9V/3A, and connect the OF graph endpoints for USB DWC3 and SuperSpeed
QMP PHY orientation switching.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 6f00495d42467..16ed6b3871374 100644
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
@@ -555,6 +556,44 @@ volume_down_state: volume-down-state {
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
@@ -659,6 +698,10 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -673,3 +716,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l18a_0p9>;
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux>;
+};
-- 
2.39.5

