Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463569;
	b=i3MjlcBHyd3I+FnfGxElKpVHF8OczAfHc11uvDVdmvm04nCiinnyP70FA/oG9zYGvD4U
	 +hCWkaAnWBPI4qWbTxIY8/yH3RvCsQzTggNMqBPbV38l/HGZfPp0ypomSKaWRiozbKlXL
	 3YKTweyT3k6RxyomNobm+lyTJyefalK3W3cY+Pb/c9F58rqrGq0x/NivtN8JZDCWkev41
	 uE8+RxdPWh9wxBJUuZ0d3mpMo0TYoV0Wt4kufwc0hhCqY7Mplq6pU2DiAB2C8XuUpXi2r
	 rMkprZcGl4S4vBwgpL+QfCh1X4AZiOW2NosJcb7Eb3R2eowou1IjrWUvKBzESpNGrSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
	b=lNjbTbxMaLdjkzY4AUvWW9aK+Bk+kBfESyGXI6Kn9N1fOMuuiJUWQAuTrLKcQW+Im/TY
	 EHQ91WDnLWNVrVP5b3Fm0xJQnriLVNM1vZDw1JnjAsnIp6HEu6mNKn4Oj3HmCGUnE5mOi
	 WtLnyJS5J+Ipa/SynV4Exuq40spnacix9dwuvbUObOlD5hdYpV7lcofwN1J8QZbNkj5Sh
	 eTaRhu8X93cPvnyGJzswSbPT7QZKPhOD02o0I27M5ow+jX2uqmlBAc0/Lr2DlXnSVA/xC
	 FxZUiQx81AZqM6mbCy7x58quEMWLbnHcdjnJINfTrNOdTkaEmP3/Se+COn/ZzOKafdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk5OOLF6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnDZg4iG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71318606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71318606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk5OOLF6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnDZg4iG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNFf0647031
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=; b=pk5OOLF6DEIadDHg
	RlXb7d7E5t8XB0z+6gUx+XTk4g4tndVYynxJLHXJ3406JJMyjVhNipZvsMqQ5whq
	qxWl2KSc10E4Zj3JuLvUvYOMq8s9xlbhQvfyX0EZFCTYC7rEIOrvzHA13SZ42zOy
	oQyn6MDdBvfdss3jnieqzm5p8YJJtfSl8M8IILqV/7jqtjiiaThWR/f+KT9APKxs
	U4BNUkwPG1oy8K5PFX/k/1iJgEgYDIgX61+RHqTVmcO3JtNWqd1TRCWc9/s7WtOM
	K6vuUOg3wkYYfXld5lOhtesBCCLyj+oICCKZuZ/rNz6vIcKaqfl2Qk+Cv7cwCXDH
	MAIxKw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg3hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386177b0516so9962608eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463567; x=1796068367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
        b=OnDZg4iGAVxr7B9cAwmxCeK7c8SLlFnSFrhFxjIG06TPr4NfgiWE68xrtZrrYTh6NO
         JUnoGr1GJuKxDdswmrwl8+j2YshJ3l9lCbaDvNfquVxjSJt6f2AZsqbV9MxkomkAGWuH
         2FHKcu+yynt82XQ08MEiGmfWSxlYrNaZu0TFY6pyiD5Zbf5/5L98iWWNkNDR2aZS78D8
         gsElgimNLkCRrDQH12EFVwhIr6++iyqQFEe3ZDYN1l0QXmuzfMs4PL9ko+OLAYvcq2uO
         k8esH5/3GzN4PFWelqScIdX75dBazpDAq1PSA7JlZIO7X9I7Xhmpa2oXxPE3oSfntaMN
         P1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463567; x=1796068367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
        b=v/19REkA5WyO7caVU8aW59lSzvxXLfHpSYXS3IXZ8ex1SoAIPBVbzcftEHRF3J5DTE
         2eGFnA8PoEvZc1j2eKC/jgB8ew/uXG8KbOOydUDVVqHCnGP/kc29lNjYhfW7vk3POY4v
         0zZOPTSjh5E4ACqoulQQ99ZUg3G2dtw4LUq/U+5r60PNorPIYxXOomQGro6LNndUdYlW
         tPRbzPUd1/KwEMALv65DsPLULDA0gG4bSshyqC21UjesB7g03gL0gfi/nLTs9h1kqTgS
         xPvbQ9ua+M3Y7s3Qynk1jFaslNXYZWILDDdVObx91wbqLddA1AvoiUXG9QJdkw6DFpNl
         qldw==
X-Forwarded-Encrypted: i=1; AL+hErFswu4DPauRZwT0lJx1WtbSx94iCvBHm2g5xsLxxoMGpIxuSeWw04mA33/oTsPDEPIF+WoO4v9gPlL+D68=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I45lCKjHTphbJgQK+rZrj1G9X1WAgsLxz5vT8bvF7/u2tR9/k
	3jAZeiTAS95vK/LpmylpAf/KmjHm0hXL3ETbN1ZbKLWm47LD1Ut14rX7njqkKywK6cG9vP6zZ8r
	JXm6jLB+aqW4uKK2HQRsY8ZC6o3ex8g8p7/2tWPKR62PCU0UWJzuNjCRVACRk+WiyH4M=
X-Gm-Gg: AZFdTZflPd/+3POq969sjT+Zq/PZy40Q2JUv8ZxD4rLmETKc22k6U7XxvzjX33fcBX+
	qg8WjX2IksG3OANaMwjjmNBwEtAqq13BxOOA6G+WgmDqkh/GzAN3mV2b1LjYR+/7bL2261QnI6b
	Sd363b33lfs3whA40rPU6cjT/YrIGHPqk/57zWXrRkZG3ItAGrdy3uWTUbZw42W3rv6bresuM9T
	CC8Ks2Sb3JRp9OuTO0w7ydLqCxczdrv+fPd7N2jShfIHCgZDcptyQ1cdLtZARsJnsgEmDXZhls+
	9u7q7IgA3lOwlgrvfwQSw9hg//AFhV+ld49I7x6+7UsgCHLxsTcPTRMbu5YY7lCnCReIuxJ4R7e
	GOFnxgUgX+GPZPlliVtbFKtw/h2upPO/QCQgTnlH5ZKNMJM4i5YF0ooUEm5WfVZw+ZriJ0OpLdw
	==
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr13083787eec.32.1795463567248;
        Mon, 23 Nov 2026 11:52:47 -0800 (PST)
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr13083765eec.32.1795463566804;
        Mon, 23 Nov 2026 11:52:46 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:46 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:40 +0530
Subject: [PATCH v3 09/10] arm64: dts: qcom: sm8750: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-9-98db26a87500@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b049990 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hYfjAn83TXJ5YwiWwP8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXyreElNLxm2Qc
 +XYshyTlJHdgKoXSfCP+jMn7s35oELVxx8vqqliS/oQC5SUSfL9cHmDy1RJhRRw8VQ0x3IP+YVM
 0COYSxF+j7nCIoN+qikiAb4QCkEqgIvFNiHPyttbPIDwfbPHt+qVFhso+ymuTZWUH5C3vHpSWqQ
 wS3S1+3s1VAVZxLp03hPjxrMHBPd/B7uoqYGwVmrtm+VHJjHQyfOHWF/MKJ7FgNDg96Eefsz+Pl
 ux7pFshxpMTSELcuenDTJ3Tsdu9a3Vnw1DQqDUcBEV8Gn5s4zysUKo0KNObTGklYoOGVixNcrWn
 BXIyI3BtwAjBQWlnE4cOjItmU7lotGACOLdCUH9Q3oxzQrSn3b0IoRKVFx/n0j7RfqzfSkCqY5m
 fglobfAEMlVczJ+HN10ZUSSSRh0CNnlYNcN29zEa61NfKvimv/ZEczADNn7UykynaHvzFaXsEZR
 EojbFHtTDzobZycG39Q==
X-Proofpoint-GUID: nV2cb_p4Oo8k90g0I2lOSTTON9JSsQX4
X-Proofpoint-ORIG-GUID: nV2cb_p4Oo8k90g0I2lOSTTON9JSsQX4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX14Kh9X/gIqTH
 XHeBeBHiSNl3FJoIgEVg7HMKXwCxTeaBjBxwKV7BkFV1o4iPjsUdDcj7E+UD6/Yg1HXHnUTxUU7
 R6jgnvHo0lAzz6nwD4fpI9xuHehJHpw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for SM8750.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio53. The node is kept disabled by default so boards opt in
explicitly before the output pin is muxed.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index d8a853c31eeb15fb1d0023fb8b5a5a59a9ed763b..fcc78bb3c8334b20561af6be87818af8f5ad461e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3067,6 +3067,20 @@ opp-202000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sm8750-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm", "ahb";
+			#clock-cells = <0>;
+			pinctrl-0 = <&gp_mn_active>;
+			pinctrl-names = "default";
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		usb_hsphy: phy@88e3000 {
 			compatible = "qcom,sm8750-m31-eusb2-phy";
 			reg = <0x0 0x88e3000 0x0 0x29c>;
@@ -3921,6 +3935,13 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio53";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio64", "gpio65";

-- 
2.34.1

