Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463549;
	b=zvETEZHNiK/9xJfk2CbW+64bVY0R1vnHH1dQ/0CAiXWCufPt7/pCOlS0LvQkItmr6DdX
	 YmxKkx+JvHmajLgE2k5twM5E6BbdaLmPyO+8fUiU2e4CG/PCU7oakrmus3h8UbefKRqlx
	 u1YbRRrFLqF8kNlgoeyK/qGg8r0ussIdXE31oGwylvGUdoshXQ+ccCAVP0tymh5zTa42s
	 kZrnDq8QCKkcMfY4cSIPnEmKoyhlWh9L/qr0TNf9xNcNBNLtS54pt4NsA8YPWH5KnA2t7
	 VIKWigB4AKkGlT5YEeZxJQlGXklbO6ByquLmhqxOga6Pd5UD6OKbbO0CfEWznFS8IHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=;
	b=Qps9TLEZwSl/vr0rXm0lg+RF+SszC5KzzbfDyAVmmg8YjY3jjIE2qWug9WyGcalaGpOf
	 X/uKXlXQk9Gx6Unqc23YF11ik5B5UiziAG/6gFoaPD2cD0ArEiYDiY4DRMqzXstlDXl6W
	 LnVd18kM1AEdwHdGZchhtlV7Xb2G/dojieSn9pk42gOqEuhqfaLQMQXXN93LoU6m5ZYDv
	 JqmR2OBJI3R8Ec4IQXnt+NzIxBWrz0cnxnKcXDDKZJyWOXWP53kFFqMRm6MLHjDUDC0gw
	 L1KY2zyDbOgKWzYws10W4uK2ell/TWJQ/fPoynDPdO+GTvkNpg0DpFdWJ5XyWAvyh/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEuoM6vL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhCVNVdN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA7C606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA7C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEuoM6vL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhCVNVdN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH1qd3475173
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=; b=SEuoM6vLNzMom+R9
	jHLxOHK0ndtSRUeXl8wV2xIxUa5faQ3dFWkmzJKJsZtxQwAV5as9U9wDAz046fYg
	V6bTnoNjfNH8JOX7NuMp7Yk7O1LJ/usacXy07ZmELCXfRhnYc/tZk9RTx8T84I33
	a3rzuqV+H0tsZalPTvt+uqHUZr8nshLKPvr7qimWEB4tzhklz8foUi1BbvAqXRCv
	h/59mh/yLErvPKfQ/fm7XNFuMB82ts8oU3t7wCj1qa271lckokZHIz1dtaOevRQD
	Xsg/sF6a9+vBSQUIs88t/C8Auehy1Z3LBCFdzYX3ohUqKGrHksVX8dUX//9ifkX1
	OjdV2Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7tux6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso6639876eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463547; x=1796068347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=;
        b=fhCVNVdN2azqQAEFSzQIOZyF5j9or2gDQvyAI1PGSAj9pRGPZ+YXNWvTAQ8+8QMdy7
         gRWifWOXgWG2Xf9rX9FctC+5I7ndHxqSViOIynCt7lj6XPO9J5oRR83T0/3U1pHZ+xJM
         +ZXURDzN6Pw/vnkeoFIZ1Y5lsBrrVH3SVopUlkNsaPTIdwMB4FC/WZtasvtNzYVhIlv3
         LZz61UlX1R4vCBl2s3lqFFs9SQlofBqkpsZFH2zVAFicvAZS78oEmLx1z6/TIroSoRJZ
         d9bEFINZi3ijjVaknXwz5tpRk006Q+xSUzYpW4sIQBkgf8EymtPGfgT1VmesX8Vz+IQb
         c3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463547; x=1796068347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=;
        b=LNT1eV0OG86fIYE7W5TFwV1DgxpA6O/5lAcE4NIQc9xEzHtUc3MF+cbVzSS7k2QA19
         NNeDPWRnvnnUUuvBLOnOVzhhDmNJNjNOsA+NCDjApqlDzajWYkMnZ4/FlvVOvBEjge89
         BjD/53wP2vzpkTBXPfjgAXx2ddLGGWqRcgGT6cTKBB8FGP8oQbvZSRjxH3i6gpLzqD/d
         pTv6hxwdIiuUrSuW5aT0sNH+Bhn15a945sld5qL90T7+VgXKA7ITDNJA5GTtmbHaHVia
         MtolpK83rqaoyFJzhpteH9iBt2UlksMhUB0fzAZUvP9D/t8ZtqYuct55UW15C176TX3k
         qjEA==
X-Forwarded-Encrypted: i=1; AL+hErF3p+YqmAAafzfaSZurC68UiXVPVEY96UZL1J3X9TqQwCQhG4rRV5Pz5eW2Q39qLlsp+xSS5sc8yYfJAyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7kO3cMdCd2xnUHYEWz0HRTbsBEVTlxoHqCKv1JAmwRHA49Lmy
	Qw+ML05y47520Q6BurwGu9plEpUAzA1Z7BKxLNCV+REZPuW6MV7VeF1Y7ipS5f2JjIt7V8/855u
	dldDw9/7jFojUkpgdpD1Wa9B2LrXPif70X68X6jF0EPm5pfRpKwNkD7yhUkNNYlmI2JI=
X-Gm-Gg: AZFdTZegTH7YTAHjBZPAXCQG6Z7r2n3vxsShSbZlTmtR8d9tJKRZisGschkBTcqBC8X
	g5yNRx5DeyYFCS9n+mu7AIN0Q9A5aHHC3ngKxOSWF5bXW20Sjw6vMlkuwMMVheS3J9VeWZHOzft
	gIFCe/ViHK8Werbxl6P2SMM0vD8vyBcSdqXG8BWSN8gQF21FgAdBBjF6VwkTsDaloKCvjimcZtG
	d+Ei7NU0f+pSHbB2aYXhMrcX9YdK9BhNkVjLT4aa5KyviR1dsdiqaNbleBpaZU245zdocx9zquP
	HOKCo0YaS4P3iOoTHqjAP+4SLfzGO+Y3J+JnxWbroKU4E4XHUm+VKVkwd8cCFB5HT9Ite7rStci
	M2Nelfq/kOHSol+P4oZ4GskjKpJRb+owTI5cQgxVkt4FcTU+U8/tx4/oCFTmDMaVddpUYVKkWJg
	==
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr7564887eec.24.1795463546842;
        Mon, 23 Nov 2026 11:52:26 -0800 (PST)
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr7564855eec.24.1795463546284;
        Mon, 23 Nov 2026 11:52:26 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:26 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:37 +0530
Subject: [PATCH v3 06/10] arm64: dts: qcom: sa8775p: Add GP M/N clock
 controller
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-6-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04997b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qaJfFEnBwp12TzHMd1oA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX7xHK0pQTyeBC
 s0FD8pVfPHhPakpIDbx02dp/3s6FcyiWjiUAFZDKOnaSLOEs9WKFieK6esecl43qZOQ5M9viLgk
 HLw0blw0PiAI1X0ulbGJXG7Vug2MWEMyRnZzG/7E0fPTxEiwPe1RC6heR2bUqWGT04+QxxHlqWK
 r20AJBBzgoWewGBZdLfrOAK+zGdGPz5nM2+eJLJB3eLaGM6hNtC6/TuyrguulDAKWaUYZJLaqMx
 N+i+zDndAkmCRGVITRuXa9dIUKrL6WqD4mnMVUZPXOaMgKkctZLVImxvjHm4QIBDFiF4xmjvXR/
 kkYnGjvRQjst2yudCAhVUtoFaSD7+YF+DKzlcCD/XbduAaPIwXln69gATwGNHO0UV7xRN+0eEes
 AjpL75EkxnRfkbg2QgItGZG7S22vxLDtnNk6h0CAEZAFg4Y8LMIW8uMZ3s8ZObiCQwxFEjLuqTS
 XKgcK9sMGr+4UDeCqVw==
X-Proofpoint-GUID: -wtTCTS-8khP_7Vlw_-oKfTyDcLV4MyT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX+MqIf4e8+Oat
 r121/9lbCL/v92Bx+q3znwjeYyO6Y4tvgDQByMjDKopb0KTgCN3/CwQeODA0Fl7Emnhm9JfUw3w
 y9lY0tsln7Hu5/Ppy5aWDgbnys72W4o=
X-Proofpoint-ORIG-GUID: -wtTCTS-8khP_7Vlw_-oKfTyDcLV4MyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for SA8775P.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio35.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 0be39bb9de1e1cdbb7d67a992172861a5a10a05a..4bba23df8a95d306867e22c49981dd8c22d4a6e4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -1849,6 +1849,20 @@ lpass_ag_noc: interconnect@3c40000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	gp_mn: clock-controller@88d3000 {
+		compatible = "qcom,sa8775p-gp-mnd", "qcom,sc7280-gp-mnd";
+		reg = <0x0 0x088d3000 0x0 0x1000>;
+		clocks = <&gcc GCC_PDM_XO4_CLK>,
+			 <&gcc GCC_PDM_AHB_CLK>;
+		clock-names = "pdm", "ahb";
+		#clock-cells = <0>;
+		pinctrl-0 = <&gp_mn_active>;
+		pinctrl-names = "default";
+		assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+		assigned-clock-rates = <4800000>;
+		status = "disabled";
+	};
+
 	usb_0_hsphy: phy@88e4000 {
 		compatible = "qcom,sa8775p-usb-hs-phy",
 			     "qcom,usb-snps-hs-5nm-phy";
@@ -2515,6 +2529,13 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 		bias-disable;
 	};
 
+	gp_mn_active: gp-mn-active-state {
+		pins = "gpio35";
+		function = "gp_mn";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	hs0_mi2s_active: hs0-mi2s-active-state {
 		pins = "gpio114", "gpio115", "gpio116", "gpio117";
 		function = "hs0_mi2s";

-- 
2.34.1

