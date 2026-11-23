Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436942;
	b=kJeqKieVCaJYL9IMDcufdXmlOPn7vDQNFGZajZy+H9PYrrkWwsN2Lkr1HhJ4D6V+dqFW
	 Tfyn5Bq2D27I8Lps3WsoKeVE08Y0E6GSJf6KT4MDFBc2KYknEKe2A/myDw13+JYFTkQVr
	 VTVblVfTAoqVb0+8VB1sHjI6AA9iI0FS6SyGkapcq7fXCMBQdGb3Mgf6Gu5Fu6Hn4RZc4
	 Jw/dggwsvyMHqDq9kf29rWh8ZgeVQt5Qdua25uea3QGyyoJih0NOZQ9BeQHHSnLiJvkDp
	 7gfTJzP8cSsl0hio9tpqOCsey6Vwf0sdnzJLK+NRsGdb6x5TKJVJ2/a1MW3z83M4qtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436942;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BO3Yp9unh2V1wTLeFzft3ePYglqdWfjIv5tttgjyjiU=;
	b=vjHQlr2hAn+0c3TtLrD8S1aWvKs8X+wK62Xqada3sEH7n12NX86phltvpJiHRsxA5XKu
	 lsKBe0ao99Mo6822/quNgoCT59w5h1VNNtMFL/JE+X7daI2AX9zcEFBVxMl2LB7GQyDdY
	 IVbcRTy65oxtN2kVRPSacEfRbHWI970dlW9eekZradH4HRw30x17kMI1n5U9D4AOL+4yK
	 J6bnL3JZNgmHuYafGG69UkMOmAEk0jFN5++XpCRAGEODg34/txG/LQMCJniOoNsDs0LxM
	 UQTI2gIfqls8fewIucYikqFMC0JyiqfHpmL9FwYElUlTVFIuMOVLrCfVY8/U07NvK0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DUTmj6nA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gi726EgE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C442606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C442606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DUTmj6nA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gi726EgE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCH20M3888376
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BO3Yp9unh2V1wTLeFzft3ePYglqdWfjIv5t
	ttgjyjiU=; b=DUTmj6nA5zutpO6ukbninK+Rq6kAscSnBFvCw5RAo/dSArsfWoq
	K7j2Fi4jYbWNhf0lAcy3kNbBRFksUroSEuv/HVqgVvl3Zl2lAjcvya/0Me47akUd
	UkRS2lqzG3HTP+BKf0ygCMIlQus69dHeN0oXsE/DI9yZJm2azQ+X3+0igxwfmkal
	cIWzbzEazgg8SRw/BEpEMp10hCSHBs9MF7Gtt2Liv2rRvT9Seq3OmEACyf2HhXAR
	35mBQMyQYZIVXvzYx+/IAYT7wY634vwIr8TVupx8LGcz4B78lSEPsGa1q2+gjGiP
	TAJq/YWno78goRXHl8hQURfHq4zJ4xdYehg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evshjdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:29:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so3698240eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795436940; x=1796041740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BO3Yp9unh2V1wTLeFzft3ePYglqdWfjIv5tttgjyjiU=;
        b=gi726EgERCSZojQaqXBQ3MvTADSrPETLJ5o4Pii8s8u0aSE1dGxcORyPZAVpwAE/3d
         WZ+nALCve5fKx4QbIcZ1mstY+XJPk+AjzHW+xF/0FfUcFG61va2omnGFnV+sBnEgY4OZ
         oTb5gFr6fxqekui3MLwm57VYXYkJXF2QSO3s7SuU/SHgU7KEcvZ/c0NRrks+W8gnFv+Y
         hvkYHLH+LkG+bfe2M8+DYYoyqoY/T9fazDz6XpG3e03eLgp6UiJ9CQPnugGX3dpDciyC
         5+4kh9sq6GQu2OQ7V9CUNPcbsqfmfWRGoGl/LXUxqd1gqhgq2e5GQQ+3IDB73Pukgnzy
         BwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436940; x=1796041740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BO3Yp9unh2V1wTLeFzft3ePYglqdWfjIv5tttgjyjiU=;
        b=x0TWliLVgPQRHjMKpFYA2ZRZieQ3P7eH52CPJbjcOfs5KN93S0Eq8KuibK4m6sQ4Sp
         aMHI+nuDcDi3mR4NTAo6X8mJUBawyCayn35p4y0zyCEKZXkOp/n6GHtI09KHqgs09tsY
         9S11i8R8dV40K3K8n8u/XbugnBS/o4jHmv4xJxfVYBOH1A8SoKxjUWBcvFg2KFj0fkP7
         SaEjbGOxBj57J0+yP1LuTOBEzANSfC3ps9pay+4MmwTmaCLfvdZA9m2Oau+dX44IatHS
         ul5WrxrmL860ztVs6lxR6jR2HAGSFmdyzliOukoIHwM6cGbHoYrWQs61Bf4M59EdGJHT
         Tymg==
X-Gm-Message-State: APuU4Z/NoptbeKn2oOlXdwG3YHA5lNhJUZKfAF1K9XJcDAPSqPkrg7K+
	sYGONmBf0O1UYOZIfsX3tdtY7n7IZoZml3P8tXC7Sr7RzpyxYZslgdp2hnc+fmA8CvNd2RquqGn
	dqFtVWJY9NqcrWSRBXwcC5zk4AzrwG85nxRdcYkuXHDG4Nya+dAUpOLssvISJaj1aCf0=
X-Gm-Gg: AZFdTZf/l/rvtAGKbK7ioPymkxJpzRTFkmdE7J8bniGgk/0MmwsmzoQO7umeggB0fBJ
	kvCbM+eSvpqyAJlWXWXw/XqO1Ci/sdvL9QZhtaMu7PIZ80GzYaQ6K3X9QYBIFZCKVpU6WbWTTTt
	p5s2OnbtkWU1j0POd6FTva0pdK5HYe9c71K9zLoE2XSueXHHa/PgUqXnMumFcLDj6TyNpaiaYTE
	fMMmP5BCE8v/QJtcth0rHV/C1Vehh2eD+juJcMUE1R1TR1ziXgPN5YstDqU8A4msYRSOGhBQCf8
	0xwY7y2MLwzDBiAGQ/Mh9XdgCvkFL2i2u7QBBUrbaB3IgPgkHW4EvE+R/WsdXLtCe1k0YjJIhJ2
	5SdV8048N+tgcQSO6F/+Zql/PtpFZs/Lsn1RHaoT1e0N9amUVheTwDwuRqnqGavpZQY1mljgcAK
	JCBQ==
X-Received: by 2002:a05:7300:51d4:b0:384:fef7:5876 with SMTP id 5a478bee46e88-384fef75c78mr13809789eec.24.1795436939671;
        Mon, 23 Nov 2026 04:28:59 -0800 (PST)
X-Received: by 2002:a05:7300:51d4:b0:384:fef7:5876 with SMTP id 5a478bee46e88-384fef75c78mr13809758eec.24.1795436939099;
        Mon, 23 Nov 2026 04:28:59 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm41393571eec.26.2026.11.23.04.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:28:58 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller support
Date: Mon, 23 Nov 2026 17:57:45 +0530
Message-ID: <20261123122857.2424213-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b04318c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Qh-C87RQXQfsCYw_EDgA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Gmb_l6PThm7Wf8BwTTAmsMVz92kJD-jH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0OSBTYWx0ZWRfXzHcSC5XKHY4B
 /iVNmXbC9W435q84/tOXrr82zW9KhWJ6IAGG+qQmrB3uExsgvWiV4DgQgojUHjDtx6c2N5hjXlF
 ynATry+5lBXvmM+H+vIPD29q5HuhVtVvXd0T6Ppnn1zoDl8fKTig491la3XmqgNrNWVbqGp1B/a
 1KW5MFBA0jBwsxnDkOfPw+sFfA/0XwVtycqxas1/1q+v5XP2BMLCy3iGwt/Pr7M1mXDFDcf64Va
 dXXQw7so1sUcB5hL1YVXT6iDJmCBAOklKYumAxYD+o373IZuyLCq5imsjXjWaxbrrf7y98Cpn37
 ALb6RhCCi3D4Oo0PBtD+VMEDTAHy7AN2BosBH4IT5thV/rKTTawxmErEN7O9S8nkNDD/akip1Ts
 u8hwI7IDgG0HRnAhFv+lAD9KRMRA1uILcMnhPfI9hdkMqOnBxEses/b//J8QtNV1M4+fgmGwMLZ
 jUv+DgzG7tjvLpcCp0w==
X-Proofpoint-GUID: Gmb_l6PThm7Wf8BwTTAmsMVz92kJD-jH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0OSBTYWx0ZWRfX2wgI1YKGnfC0
 CZtwdZBRuGrTgBQq8gQlay8+rxaJaDh/Uzr4nDHUiTzW10VJgRpQTyZa4rVy2EdQmvF0gEXwXJ6
 aw7GL2D8gcvGp4y7jUDe7xlpFQTWaMI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230049

Add the Cypress CYPD6129/CYPD6229 Type-C PD controllers used on the
Shikra CQM, CQS and IQS platforms, and wire up their connectors to
the corresponding USB controllers.

CQM and CQS each expose a single USB-C port driven by a CYPD6129 on
I2C3, connected to the HS-only usb_2 controller. IQS exposes two
USB-C ports driven by a CYPD6229 (CYPD6129-compatible) on I2C3: the
first port is HS-only and connects to usb_2, while the second port
carries both the HS and SuperSpeed lanes and connects to usb_1 and
its QMP SS PHY.

Both affected USB controllers are switched from the board-default
peripheral-only mode to OTG, so that the role-switch framework can
move them between host and device roles based on the data role the
PD controller negotiates.

The PD controller's interrupt line is routed through a TLMM pin and
marked as a wakeup source, since Type-C attach/detach and role
events need to wake the SoC. On IQS, the 5V VBUS boost supply is
driven by a GPIO rather than a PMIC rail, so it is modeled as a
regulator-fixed node, matching the existing boost-supply pattern
used elsewhere on Shikra/Purwa, and wired to both connectors via
vbus-supply, giving the regulator and connector frameworks control
over it instead of unconditionally latching it on with a GPIO hog.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  55 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  55 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 108 ++++++++++++++++++++
 3 files changed, 218 insertions(+)

Link to v3: https://lore.kernel.org/all/20261012094835.647882-1-akash.kumar@oss.qualcomm.com/
Link to v2: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/
Link to v1: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/

Link to Driver and DT-binding change:
https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/

base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726

Changes in v4:
- Rewrote the commit message: this is a single patch, not a series;
  clarified that usb_2 is HS-only and usb_1 carries HS+SS.
- Dropped the unused ccg_typec_con0/ccg_typec_con1 connector labels.
- Replaced the re-declared `port { usb_2_dwc3_hs: endpoint {...} }`
  overrides with direct &usb_2_dwc3_hs overrides, since that label
  already exists (empty) in shikra.dtsi.
- IQS: converted the vbus_boost_5v GPIO hog into a regulator-fixed
  node and wired it to both connectors via vbus-supply.
- Kept `dr_mode = "otg"` on &usb_2 (and, for IQS, &usb_1): a separate
  commit (9b8dc188ffa6) already sets dr_mode = "peripheral" on these
  nodes generically for all EVK boards, so dropping it here would
  silently leave the ports in peripheral-only mode and break Type-C
  role switching. Happy to discuss further if I'm missing context.
---
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index bde3b7d81ace..46835a44cfbb 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -15,6 +15,7 @@ / {
 	chassis-type = "embedded";
 
 	aliases {
+		i2c3 = &i2c3;
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
@@ -29,6 +30,43 @@ &audiocorecc {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &pm4125_hs_in {
 	remote-endpoint = <&usb_1_dwc3_hs>;
 };
@@ -79,6 +117,15 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &usb_1 {
 	dr_mode = "otg";
 };
@@ -106,6 +153,14 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
 
+&usb_2 {
+	dr_mode = "otg";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 2ded25c4304e..de058d2978a9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -15,6 +15,7 @@ / {
 	chassis-type = "embedded";
 
 	aliases {
+		i2c3 = &i2c3;
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
@@ -25,6 +26,43 @@ chosen {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &pm4125_hs_in {
 	remote-endpoint = <&usb_1_dwc3_hs>;
 };
@@ -75,6 +113,15 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &usb_1 {
 	dr_mode = "otg";
 };
@@ -102,6 +149,14 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
 
+&usb_2 {
+	dr_mode = "otg";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 5df30ad8211f..4fde2ddb5393 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -15,6 +15,7 @@ / {
 	chassis-type = "embedded";
 
 	aliases {
+		i2c3 = &i2c3;
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
@@ -23,6 +24,84 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vbus_boost_5v: regulator-vbus-boost-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_boost_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 79 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6229", "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 50 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB2-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+			vbus-supply = <&vbus_boost_5v>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port0_hs: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB3-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+			vbus-supply = <&vbus_boost_5v>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_1_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi_ccg_port_1_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &remoteproc_cdsp {
@@ -67,6 +146,23 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio50";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb_1 {
+	dr_mode = "otg";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;
@@ -82,6 +178,18 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_qmpphy_out {
+	remote-endpoint = <&ucsi_ccg_port_1_ss>;
+};
+
+&usb_2 {
+	dr_mode = "otg";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port0_hs>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;
-- 
2.43.0

