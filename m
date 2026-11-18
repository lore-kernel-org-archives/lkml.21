Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003648;
	b=r8tsleEFajbi2C8musrcXBvCWwL/4H7qR3dKbfMGchu5grUf6BvmDOKA09p/G/cih3fd
	 UOX5a8U9ZT4OFwbJQdUzAtU90UndKRed0exUSW4PtV3PFH3lD3rLI3fVSg7wqatRa38nr
	 0vKAzQ9LJmG9ZY4/s98iowB/vovNUJ1rOgMFCOVRz/7fe6vWqCYbRn9YK+W3sfE1eib5V
	 OvB3OsroEAqzHsiVrsAGmomYaPB2elTMwzws9pWs9mE6pmJlRo7KtPFz0D0xClv+CXSpt
	 eAFDACwu38ukIiaD2Qnm40XYanld8zbzIyeBHkOvInRmsu2I/5xRqW+mK0S0amqdVXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=167OHAGXM6J7PJAqZ3MLk9kxvb+fEinCgbUkehm0fFo=;
	b=yEauZNSYc0itNe1wAhVuDecWeZ3gxME4VLVonAEM8SwyXOJNZIH5iG+eREel9NRc9WnW
	 ZgwVFgKek0Eige7mvbemWwUDqYwJ8zxoU8LDKS+QPVU9LMENBJrE8MJXShSu+oJfgy4Zl
	 0LmJvaarR+P5tQ6+YmWkAUJVEKlFPgRKU8FVCreFWLWvAf0y0Pc5RKU3yK3Bfvy1+9ufm
	 A5EjC8nZwKojUWzsgQqrcBeTEtV0Ft3wZjjYvJKfFr1rRRic047RYVWiElEEv09o23zH4
	 MKfnY4LC8CrrLoDFOqf0/GWQgncOxsOylsZ8fCJr5Mtyrqgof22K8tXu/8wEd/nvz7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpCybyBE;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A1660A3839
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A1660A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpCybyBE
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso429809f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003646; x=1795608446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=167OHAGXM6J7PJAqZ3MLk9kxvb+fEinCgbUkehm0fFo=;
        b=UpCybyBEXExg7fNyUzYHBW3rjcRsRXehyFFmfjaYvHLSQ90D5OFnveZgTMARiksJNJ
         uEo1gYGyFBz5M/L1biwqZDQpqSuBmv3z9cXIRbLCZCWB2YGoBTB5aNbXgwYOJxRmwMQy
         L5sJ5TsbCibNGc4ossOWkSSNPuTaSHaHEdNCf7qpeEonP8siaY2D3g6Nfvhwl8uvq7MK
         VQuZEzjtfY2J+R265c6K2fB5CRwrOFUpXNvB2V8Cj45FFnLMsxqOYMqoVfrw9Bt0UQDT
         DY5/T/+uKCoxo3cf2CGgoKDFlnirJjwoffAbXmcXRBC6bwGN9V/b7E0jYizr9J/2YsJs
         WGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003646; x=1795608446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=167OHAGXM6J7PJAqZ3MLk9kxvb+fEinCgbUkehm0fFo=;
        b=uoPm9oVQ/xXEbuLqwNR3zNn+aZxNIlyv5YKbyvDBLdZjaM0mTYSX/PhinbXe1/RjUl
         oim08F7X9pcHSDWJ7WSyMjr5rcKZTaRp323aSOCReMskkCNcTUdVsrjXefdP34maQlaz
         T3MoF769pa+TQvZP+0l9Dk+lpyy7eDeSttXk5QhWc7SBUTdIGX7Uk/wJHrGISV/mq5hu
         gWKrNaeteSBrQPCXE/wfSowMLCkHaWkAR+iPfo0/MAX5cTtFAjsAnLkdeWbOkm7ayDtO
         ALnpdR/Ehj2pb5v8l7VN2/HjOq8R8+F4AIKjVwgs56hXKovYyOb5rrspS7S3Ia3T6bos
         /Kuw==
X-Forwarded-Encrypted: i=1; AL+hErGTyK+kTxosu/CXd00kCRrS3HSXxBzv1gzEdgzITOooppDVkJamy5hOzDZOmaBjLCyCoeSNZbja9P+fbpk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IXttiHQujB9T4WY1zUJF8jSbh17Wux+wrV3RKdbS2AGYVjY3r
	uNhq/8cdMIZwqhytWMtF25ZTHp9Io2nY0dwnXUGDi1Sleig4ANoP+Rd6
X-Gm-Gg: AZFdTZd25rPIftQvuX9OV0RlMQTZp5I1xfbTL5Oiwe4vlNoAMLhoBNcQEnIO/wgU/95
	7Rodg8MHtoi+o/jjHx0sYDYNZq7IMPeeeHCWVipfH8LjQxK53NAQgTwvWENKuM/7ofNtqvFAW02
	U+Hyxgtfp40pzGsuryyRRR88/hp6PmkN+AdDKIhfUTmHcY2ll/aVqT9FlXLqKrWQLftDvCwH2UR
	Fwk0Lqva46Bg7/3lSmuhlq/4rZszIlyOEVYbR2T9cFUJVWcdi7jPe3mQ7EStkarwIzmkt3+djse
	gvPJPR+6JAiQAgg7Nkor14xDiFntVbuN3G5eGs2Q9AvumXr15sTqy1qLLdcoBU99LmnhzCklfS/
	xyyeciuW4NMkMxAxD9UuYXG7hDbLFPiyEU7Ap4HS86bIag8DiAlWELyd8avuDl6mEi+7ysDSCXB
	prW7AJ7tFKuU654a6buAiloJOzdX7hpXO/0osU8Ly+Kp+dn/1MvBAOZ//VxFsMEOG0z7skB2lwU
	Iu8Aag1JmaliptbR1+0czCQNLxcu+VXHjrNfUlNoUGl9wqYpxuPD21BR/AUuJduGhdWsdxN9u+1
	bDZKzxinIZbk85ozpig6gLcUe88G4t81jfc9XgAygCR727f47o+3UdVPoevhZaGGWUYMJZiabeU
	ayOIDoJZI2T8s8al1pQQT
X-Received: by 2002:a05:6000:1606:b0:48e:6f84:2e8e with SMTP id ffacd0b85a97d-4a63e6f1a49mr3049066f8f.39.1795003646222;
        Wed, 18 Nov 2026 04:07:26 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:25 -0800 (PST)
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
Subject: [PATCH v2 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Wed, 18 Nov 2026 13:07:13 +0100
Message-Id: <20261118120714.31505-10-rofikcoga@gmail.com>
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

Enable the PM8150B Type-C controller in sink mode with PDO_VAR up to
9V/3A, and connect the OF graph endpoints for USB DWC3 and SuperSpeed
QMP PHY orientation switching.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index be5b894b677bb..12ca5ea921fff 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -556,6 +557,45 @@ volume_down_state: volume-down-state {
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
+
 &pon {
 	status = "okay";
 };
@@ -684,6 +724,10 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -698,3 +742,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l18a_0p9>;
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux>;
+};
-- 
2.39.5

