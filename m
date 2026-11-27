Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769386;
	b=5J10hf/czgbk2lQZReqw0qQtWituUE/uWaaHogaT50hWrH+qGs5KLsg4wtizv9MsVXDf
	 wlKChiEvoFyOEAAldV/P33uf9HIiRyYyCEW+hLXs7woZuPWJ1PyHb+7JgSRM8IQ+oVblI
	 44VNBJwNlKoii2iExxnHAvZ8Gtt62ZrE01ugqzgkv1UF3HHcoyJJpuWxPUytSU4v8iKNk
	 Zu3/QKqkbxo6aYyoQXdxZyB7L+5HgJCjHsPwDEe8W3fGbHu8m/r81VgSeJZsJcdIyjcuz
	 HH0X6Ft2/x+pKPrfsA0fYWOhbBoIoJuKgCqeJG5vNdyh5RLqqPf9C0ruYTMCjjenhUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769386;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=;
	b=PqRTT37JYHkgDLIQMo4p+Uu8pQMNYzJfA5wDwCl+1BYhEAVbPEG5iQFN8tiOunuNEGIq
	 cEY1XFVnCSM2ZxcIqT2uamoFm5L+wEieYsUGEjxGzgaoyy7c3cfC9LY6Cj/5QA2riuXci
	 KFh5+muzMsWpM2hZGGnVeXiPJYAIsZntdK40bc7KYJNaLMj11B7lADF2r7aA4H71LwkHE
	 vl36WuMhjRlFeD/DfUeUl9ZM9Sil1KrBaC8zoBcD84fy508Q2JJeuNHXL09Gxl1SZyCW0
	 bByweuC0c0h/chtUVPoTug4RBEZq2IATOuNZpRIrm4j0U08LrpMpblxT59autelBWLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fiocv4r3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="E/qqubfd";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF886606A338
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF886606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fiocv4r3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E/qqubfd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GdKj905175
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=; b=Fiocv4r3+WrYzRgR
	ylvaa1j1Y4nn0x5m4z/PrPipQnhkhVj8NrAj12ZxAAM1UOzTmymp06SQluXMUIHB
	bsTUA6DD4E1dhSORqk9vKqN9mymsi2/f1rPiFWtJ3vDY4tTwSQKmYuYhu8HipMBK
	oq5VTyYcUtoOgHAJJ9qRMISBtSvCj952DB/T7TPoU+pXlSoO1yWNUqIzZ/jVXaSf
	QSBXXkaQJ8aR75rpZUXqNmrt/DxEl+bT8kvBDO/Rw4PeK3FHZm37MKuusnV2uCeV
	N/D/yQEOp2vZoCJhC7VXdEVPCAZrjHqC4YwuAjkXfBJVdn7nv5da05fvhXK8VUNm
	ldCS/g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru39qyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd84379223so242577a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769380; x=1796374180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=;
        b=E/qqubfd6luEFv+hCkwXI+88Mra6+6zyqGRezhVyv+Mv3nkA1cYAWeJXg1gQgAHyIH
         vWuV8qKjQkkwZXhRa+cpDHb1Oyo+C1Zdc69bnZu5FRfT6+0uqo/Rsp8d4Iq3DYncG1bC
         Bg+dGKR3U7liTAVA02O0o954MvTbWvxHIYIJSiwF9APjgS8MvtRb9nzy+GV3picm7AH6
         JjSlRnBnY2Uiu8vRzOJv4ssgePuY1MFphvOpaHxVJa3CLYIe3bieBi6CJlfFXhYWinRA
         TbEufGTcBmpAbu2RohU5IC5pNuYRsjEhKZFWNDVvwtL3gdEQa+xf7eWLYUBxKkqsBreq
         h/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769380; x=1796374180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=;
        b=FZQS9uuC/kQ8mNA+S+33TgQ153grVYL9b3HHs3K+QST+5+q+J5kVlMuoG9FFTnHzoA
         ULMPawz7MOb0ahTyonz48tclrRkW/lG4rmtgoQTWj0yg9djv6vDLOeWlTkabFJSKlCMB
         UaP/TeLgfXd7+hQHKe5LSnbnqBxTlp8ifsA0Nty3IStD3mnmt0AQCy1uDt2k4eO0leer
         +kd4q++IRaeIg0zb+Lcc2GQrrI+nTU2oNyqUWGMVBtvlTfqaD2JzahIze4WgVI3y04uA
         tKEgFp5DyXYhqq1iL7YVZx2g3PcBNp/fTjkVeFBrc8pNNjTdk4vPsxen8WG9JSkylJ8i
         Ni3Q==
X-Forwarded-Encrypted: i=1; AL+hErH8TYKM5fi32Sdn9q9x22XIpwu124DzO2d5MDu3pf7Q3zVhjXJHxFR04J6DH1ePvsu78fU9a1a0zjYPe8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lBIvxPkjQ/5xUNgQlHop+KcpsmRABV/YUqVgpfC1JMm1x9uE9
	Qo1QD2gPeepcIksmKXy6bQFVzAluqi2kFYt/RQmuxNSdPpd5iIh1RJPM/cRfrwrLsIDgmvXxdVw
	169QHJemiscXnmmt9vFYMOt5kWFdM8x98fGCBV0KdNtiW37PQpp+BIZBvkDhl4eSs8eI=
X-Gm-Gg: AZFdTZd3a2OSw5xeN030Ow7mNfcPNfzw615QlUYieTcyRJjXvxzdFt6Qjewqh3wLdW2
	YNtCbqIjUSjr3BqSvf1/JOlkGv8ipoztt740R8zcVPk4UPJoRwG191MPUGgMfY9O1f7iJQu6lYP
	TqkJijQ5A0V6Ftyt7sRIiuiGAblklNRqYPA56n+sc2Rr/fiaJkmwshPdSSSAqBlDwyU1q2I+V7c
	5AhwbxV4/5y8JRKDfV4EBNFavIlJqxe88VtL0l9ZMetLaMI4aBjF9fNoVx/WNPXosx77BuHO76t
	6QG8kjdEWKsgBVYS7/jMxJG3dlJUF+TcvgpjH3Y0MabJF7oYd6G20Q+6iwvFxPECuvOojwpSdlg
	UaqmKUyIADVB3cN3iftJnMXWgJ3O5c8gQPLHkF8q2kYJUEx5HcklvSs7j90ICh/B6j+RskKGMi3
	Vx3Obq0eZYYtp7ZcDgselzmmcrpcxyQlpQUUj8tFEZpNMd3esF/QVld36qt02WYKROKa7NHbFNI
	At1zdUHJ7Ux38eTnxi4H1x9rpeo1Q==
X-Received: by 2002:a17:902:e38b:b0:2f0:7707:227c with SMTP id d9443c01a7336-2f0770728c8mr194869835ad.4.1795769380476;
        Fri, 27 Nov 2026 00:49:40 -0800 (PST)
X-Received: by 2002:a17:902:e38b:b0:2f0:7707:227c with SMTP id d9443c01a7336-2f0770728c8mr194869475ad.4.1795769379993;
        Fri, 27 Nov 2026 00:49:39 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:39 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:23 +0530
Subject: [PATCH 1/7] arm64: dts: qcom: eliza-evk: Enable HDMI output
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-eliza_disp_all-v1-1-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=3172;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=Tc4IF8QhApcJLjNKZX1uGI6mMT6TCVFK65N6fccSJGI=;
 b=DUR+qCC7na9KJSaIm53BA7ckVADIAExITbGXHQEnEBNeAp+YuPPK0eKm5sSQEhyYEb8hfMPF/
 QiVLFhHJBQwC4r1tpMLczv3Dk0BKy5sTxaza0+wpFI5uU0WbesBAbK1
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b094427 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sRTJwmOA1GI60g-zRKgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: dj2mjmr1ARTdwyiDUa5WHDKxcAuqejV3
X-Proofpoint-ORIG-GUID: dj2mjmr1ARTdwyiDUa5WHDKxcAuqejV3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX/dg+Khv4o62C
 I6swcJRJ2i1/KN35TACXoU4OyXLvOns/OcWC8u43lIdLFnAJCo7CVjuQ6dI5Jmvj20mRyL1Myvq
 U4G1v/XPW0OVb430x5CERiI8DHsYyvNUs10vcwcJKw+7LMh5YZNh8DtjVrwAGLOjUp1oEXbtJmu
 IEGpvqCGf/rxzYavr+MLDBhTEvqdM5bXW3/aTF2f1cGZeCOeJCd7pd5mTUHFdpBGsDXzzDs0W+J
 Qox7ido2grl0OxSpJo7Y+0QWpCrYGmQsBZiHbAlWjbmSK/GBa9uCXlC+q6FEOZtvbK7hhclCnlC
 VGN7kGdMTMSsa+wZwHwd/HrNVKm4USH2iwCiEgfMbPqmfxyfuT76PYHU6P8QIn0j8UWiHCLEODU
 il2X0nKXi2/hT4eTsodqQRyppzL8d1jyvHHJjZ0KykMg7fYFhZ4BQF9wTwwRdG6qpicboYnLgqG
 3ngcp2WU8Jq0lI5h8nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX01blpS7qAUF5
 bTrvdOW/Wz8DLaOlZBU7dANrrdwO9MotOZJNtCF1FK7OPmAX6ZVF4cc9CUyxV3T8SwCSYPB5G5I
 9vFxUGci22CndttTO/aCk9PAkS+9Qfc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

Enable HDMI output on Qualcomm Eliza EVK through the LT9611UXD
DSI-to-HDMI bridge connected to the DSI0 B2B connector. The bridge is on
I2C8, with reset and interrupt lines wired to TLMM GPIO16 and GPIO13.

Add the HDMI connector, fixed 3.3 V display regulator, bridge node and
DSI0 endpoint wiring needed for the HDMI DSI0 B2B connector path.

The HDMI DSI0 B2B connector path expects SW3.5 to be off.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 90 +++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 8c663ef6718d..734bea47855c 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		i2c8 = &i2c8;
 		serial0 = &uart13;
 	};
 
@@ -220,6 +221,27 @@ m2_e_uart_ep: endpoint@0 {
 			};
 		};
 	};
+
+	hdmi_0_connector: hdmi-0-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_0_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8550vs_g_gpios 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
 };
 
 &i2c4 {
@@ -238,6 +260,45 @@ gpio_expander1: gpio@3c {
 	};
 };
 
+&i2c8 {
+	status = "okay";
+
+	hdmi_bridge: hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&vreg_l8b>;
+
+		pinctrl-0 = <&bridge_irq_pin>, <&bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		hdmi_bridge_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_0_connector_out>;
+				};
+			};
+		};
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
 		    <&dmic45_default>, <&dmic67_default>;
@@ -514,6 +575,18 @@ m2_w_disable2: m2-w-disable2-state {
 };
 
 &tlmm {
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio13";
+		function = "gpio";
+		bias-disable;
+	};
+
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio16";
+		function = "gpio";
+		bias-disable;
+	};
+
 	m2_w_disable1: m2-w-disable1-state {
 		pins = "gpio35";
 		function = "gpio";
@@ -541,3 +614,20 @@ &mdss {
 &mdss_dp0 {
 	status = "okay";
 };
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};

-- 
2.34.1

