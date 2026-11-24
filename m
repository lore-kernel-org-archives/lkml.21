Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550549;
	b=RNd2Sy/npe00b80RsWX7DN1gfmM3ABqxWVWVij8DF/x+7k9Uijj4CCUY9pgqo59aRTWo
	 6MgaW/JIsCfv0QiSWAWpCiePnZ67WN9wuOB2YCLb+5sTCpaNaXzSjLCm4BCJFrlp7FWfN
	 qogbbdbPAQ273KwsYhLTC8Ylla1LL7otfzIy3qVlBFmagZjdQ17MmFKRAUpVjkrXNlfUm
	 cr1AI2pT31EfznXoTI0c5WzCeziRVDZ/x3/fD2WXRmh80MfqXtJNOVDrrm+No8LqJ48BC
	 Y67l4VkDb0os1z+hcD2P95SCD5bmFrqkW8Q10Y8Ry9QswdJ826YyL9N9pBUkEJ4zHUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Eu2E32/ol3peL/W2BGbxgpIsqZt2KnAdADPuIMiKPDg=;
	b=rupzHrg3EpbcclmT9B+Eir7tgV+dqTEAORRRzqyqKCDXY8DqMQPSo8krIaIw42xOifEs
	 +BiSny+7QG21PrtUES2yZoqsJXKLrNVjh4+3A0PyVYVaXRFsDQBOcQv9mgpXXRYIk1AV9
	 AgIrBm1QBoCYjktDS2+JJ8YaWFq5nXvoX+2fr0DhGNU6kHTpzeVQzfPrsfKSmNp+Dy8a9
	 iOMLTnlNtm7+nsM7M++56foBLEfD6kCaWCUkDuhxbjBeOkR0D8Vtshipd5PbRW7HHRtgN
	 NLr03RAx3/FedijQRrOoGnSePErCdVOZFvqAC/E042utVxwhWXLENF3mtZ1OAxrIxDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j5QU4sZh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BRbAeAyj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330B2606A6A0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 330B2606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j5QU4sZh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BRbAeAyj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXrlK3701458
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eu2E32/ol3peL/W2BGbxgpIsqZt2KnAdADPuIMiKPDg=; b=j5QU4sZhI2xHgCjR
	p6IcSFGTcbJ82rex+xr1SMhGv1h5qPLhaPUFbQ/1uV3wPzeKB6gijASmOJCZjoxb
	dNITbOgJfcdtYUXdpMOdcdddYWfQb5Szaa2aDTSIm7iUoheXBY+8a1E1fykqei1D
	+jMaynYSLdyNOvppZlm5BJWbXBcajixJM3KoN12E2iQoYP/QFghY5ADuIO86VMZO
	QUxAt791k2lHBqNZRa0hiyiJiBidZrssi2oDSsj9V+fwv2cV8tTuEjJ+mkeQ1lMB
	a1S0FbXF4oSniGR/j5XMGaKap7HsRL/sORiGho1T4HmYda6mhA8PAWUL1DT8A43s
	WnzyTg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7t585-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:02:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b436d37123so801940a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550547; x=1796155347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eu2E32/ol3peL/W2BGbxgpIsqZt2KnAdADPuIMiKPDg=;
        b=BRbAeAyjjgVr3ZniJikg8nXWvG40uDcmCCpYVMXLCw71vNKT+5q/ytU13K7e0A77Sf
         5OGecJTEopUAwi6CPvtZogEHOQBoqjPFISMZs1wd72jy5sV1bhZJu6t9P2/8xLE2NCLd
         IpdcAje667BKsM8Tum6/ybsr+SbmoYBXOMgFXZDwRodzH2kHgHfsXkiXnjVVaDoUr4Xw
         Ri2S7ZjxJ4OW0X0GF7Aqyo4yLiG2Bs+N0uM6rzgv4UslaXxLvtrfeJW4yNI3YSz8GGxM
         PGrW3YKQOxndZtoeqyCCxd7xqfy28FHlQI89MNLVpMqBGGVrBHLQV3a8BPop/uJaRRTe
         Er0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550547; x=1796155347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eu2E32/ol3peL/W2BGbxgpIsqZt2KnAdADPuIMiKPDg=;
        b=lrK8YVKd/azbf+TYVBaOKIgtWUdo8ZCSbwVlPyHAxatNv7TxJFhm7nV9GzKCfTnJvS
         GE1idVoirO5N0vQtXnH7A9VkcAj8hnVEJGmkEEhR42xc08/Hoemar5AfpQSnSZGn68pi
         pZWt9Npi64JJyZxzuCjIdIhGR8YFF/H3fiKAH5YFDsnJSb5lj7iV3QrkZlsbkT/2PW/A
         dYIKBTBOR2niD0ntFmJaJkGcOvqNZFG0woNHZNtBQVHrbzIWOuGR0mKofmwSNxI2teJz
         qORk3uaVlE4YgxecrAQEdZLxrurosGoCcHXGYPdnG70GCib/Sqbmv7fC4Eou+zexdRdP
         +viQ==
X-Forwarded-Encrypted: i=1; AL+hErEsj/oTxmyzDpzFMwGWEruVMYNzsnBDIUMYNnVjOPo/gnD1/estHf6GZ/iobxqX4JV9s/U7ydD7AnZKTCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EtLp4OFO8+FtPkSMxgHUkP1G+BRCbQZlwCoijpK60e0BbrwHp
	0oP7ieEH/kurW5DrkRM7iYcIHzEKleMSZRbKc6HfRAjat8wKHnj4PfeIrdVNmTNMm8lQMDVdU+S
	nfIo9vZxoYc7A+SSqhSqpL9hmIHmuoAqJvg+6R4Lf194PWBWgwcqgkj2ZPYhIEZWwu+A=
X-Gm-Gg: AZFdTZdfOE3A2GfHfNL6RvhlAuw3z+OX/pSSjk+jZILs3kzLoISzT4P622IdvPzZNeu
	niiSMJ+toJauB8X9EUeW1wgaNxHha+BTJk3YFTC/YA5zFsAqX6aSIK7Sbq3n7rCbaay6/RIdlUu
	xHDMMFOHfYSUNW5/COjfaWygKUEmzYyKb1LuUUiv4+UgwMjKFXJ/2doyUDlHwaOHvFZmL4r3ump
	Cz8f4nqYpDgvG7DomIr0DpVj+cV156qWT6WzuD/SJdPg6qUlEzlTLTFvl4S7PW4sBXlAXuNupDz
	+sWaA4pbd8+OSW1GzC2iiiSj2IgReD8Zg6IbQyyl6WqIOzvb6SrUTVv+QxIr0PoNYk3U3GsU2aI
	+lGISIl0THUdtVuSBcOBkZ2SGfwB6vW5mqpxnMj4HQfY7EQTHP+10XfhKuWD0Lp9PfiiaS0I5Uu
	mMLRY8uOw=
X-Received: by 2002:a17:90b:388c:b0:3b4:393:453c with SMTP id 98e67ed59e1d1-3b41c96fdc2mr24660901a91.6.1795550547051;
        Tue, 24 Nov 2026 12:02:27 -0800 (PST)
X-Received: by 2002:a17:90b:388c:b0:3b4:393:453c with SMTP id 98e67ed59e1d1-3b41c96fdc2mr24660850a91.6.1795550546438;
        Tue, 24 Nov 2026 12:02:26 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:25 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:44 +0100
Subject: [PATCH RFC DNM 15/15] arm64: dts: qcom: glymur-crd: Enable the
 tertiary Type-C
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-15-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=2970;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=Xbb0k+CFqxQM/ieeZbaME85BBswl0ncWd9NTFpQElYI=;
 b=AnKx11Ytmn87ykR5uQbnyVsvTuFo085fcMybmpqMDR6+5APySmsUsX48jB0surCW5xRs4p64i
 uFocYqhyBcKBl+t/XRjLMJBrshrD8rnScFeWwkIVxA+3PaN8jSHdpzX
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX7C7QWF6LZOqh
 8TEx+XEmAZ/8k22zHNasPqdS15jbatTKQgjh/tRZ6O4PvjWpqig+WSF0DuJaNDj45Y3OGP+wkH2
 J0OEh93z/bY/AHMkXp15hMId+QUhf94=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05ed54 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=WzDp-nSq77L6p4kU6a4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX7aINI7IyCnmx
 QLmz5qGgc5VkITnGxAC2Q9LRLPu3qxklTFCUgwUUmeMXkUDzEGls5ZYlewVfNPGtHGxtcIYQKLX
 gIp3vz2SaMlvqeTcdd3Qs7Gsh4/lICBIhpX2JnO29F73VlvUbyIuC/Z95lLOC8wcgZqEkYSn99Q
 WlP1KYwO+TUImO9M+euTsayphR6FqoF8JwRDTD96bEA9x0XHYcryPTUgizZgMwOTnba/UTjMBPD
 ej8KCRR1xBnjfvx3C8hl9C3jF7MOZ/5EcH8odq1dFDdvpYC1C9zdCALLviZEhlKQwNCG8TokC91
 6VAE77a/aW1vnZDRWWJy2lD6GrLl2ChIul4CUvzcZ2teT6VSUxycyS55l9Oah+Q83Es+ffnwXz/
 DORGrSedP5HNFtdXNXFgobm1ylu52tP2DCs8nD0/B1cG2tq/1kefj6srCjw+jPIgq5F1Euj0nNU
 2fHu+VILswVGtevY4VQ==
X-Proofpoint-ORIG-GUID: 0ywveQxvhItPc2lmNKL0zwekKZAAfBVW
X-Proofpoint-GUID: 0ywveQxvhItPc2lmNKL0zwekKZAAfBVW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

This is just for demonstration purposes for the series, a cleaner patch
handling 2xType-C + HDMI variants will come separately.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 82 ++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 53f134878b1934e8627678dd1d3b8b73ec91f308..5d557d17ca29c4b379209815b2ffd426aaa0b093 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -123,16 +123,16 @@ pmic_glink_hs_in1: endpoint {
 					};
 				};
 
-				port@1 {
-					reg = <1>;
+				port@2 {
+					reg = <2>;
 
 					pmic_glink_ss_in1: endpoint {
 						remote-endpoint = <&usb_1_qmpphy_out>;
 					};
 				};
 
-				port@2 {
-					reg = <2>;
+				port@1 {
+					reg = <1>;
 
 					pmic_glink_usb4_in1: endpoint {
 						remote-endpoint = <&usb4_1_mode_in>;
@@ -140,6 +140,42 @@ pmic_glink_usb4_in1: endpoint {
 				};
 			};
 		};
+
+		connector@2 {
+			compatible = "usb-c-connector";
+			reg = <2>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in2: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss_in2: endpoint {
+						remote-endpoint = <&usb_2_qmpphy_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_usb4_in2: endpoint {
+						remote-endpoint = <&usb4_2_mode_in>;
+					};
+				};
+			};
+		};
 	};
 
 	vreg_edp_3p3: regulator-edp-3p3 {
@@ -563,6 +599,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -735,6 +779,10 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2370_l_e2 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	vmmc-supply = <&vreg_l9b0>;
 	vqmmc-supply = <&vreg_l2b0>;
@@ -1018,6 +1066,10 @@ &usb4_1_mode_in {
 	remote-endpoint = <&pmic_glink_usb4_in1>;
 };
 
+&usb4_2_mode_in {
+	remote-endpoint = <&pmic_glink_usb4_in2>;
+};
+
 &usb_0 {
 	status = "okay";
 };
@@ -1062,6 +1114,28 @@ &usb_1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in1>;
 };
 
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in2>;
+};
+
+&usb_2_hsphy {
+	phys = <&smb2370_l_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_2_qmpphy {
+	status = "okay";
+};
+
+&usb_2_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in2>;
+};
+
 &usb_hs {
 	dr_mode = "host";
 

-- 
2.55.0

