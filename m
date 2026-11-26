Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699483;
	b=nddeDWMCFQkSSRVs+JbS6rbHmttgx76gzEDiQS2ZdOoL5THT+Hs9zf++t+3ULIui0YkY
	 ba6hQge9rbJ1sJaTsH67UV62SFQdmL0FUNIDYgfgs+o3XA8RHDo8DTyExIu5S8v0YziXh
	 5xYZuKmjxa71TN6R0uDFEA20ISn/ch2OaGrOTrpJNC3R68hIT45/vxL1aCJbQpoK/EqhL
	 Ka/rmhLzN+T2a179Fve0oJ6UE/YHl945ChCfbxmhBYEptl16CM8f5zeMvsTLDfPokjswO
	 nd6vphX47GFQZpyM8v1ixEPJ9b+Al2Ntnu2mDfpNFjM3qo1qJE4Gkx8hEe0xA0wEzfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699483;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+4OdKtBkMlVocSiOViDkwteYw+81H1U7mhaDvSgfyr8=;
	b=m+SNG6FfdKqYSxAtOp2CR5z8YRcPaDZvy4Rhd4JUiGJXPJY1zH4P+iFjT+BTACvfonAc
	 Q5CcOaWtaUdBgX2wSb1402SjP8nHqr7c1vpBfxD9fpik3gUUsGF6lqR8qocU9g9fVYsJp
	 G6jHcuvqTIKESodu6dWEbi+vWffcsT2MEdFwL3lHE3tlUwOmaBHoenqTyFMC0W2445MbS
	 Das5pmx5uJumxA7RGwNLkI0rDbBUDLqoyKCEa3ju9NySjq4mTDkn3ssY3jgSuWqyjCH6C
	 08rYxd9XiVL4+92LYJ2CpovYwgWYOOj6yrzCzwxJjC19ucvXUde6KgxXeNVlop8jHLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=beU7UKWx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Egf2NSox;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A6F606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A6F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=beU7UKWx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Egf2NSox
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVUql2911800
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4OdKtBkMlVocSiOViDkwteYw+81H1U7mhaDvSgfyr8=; b=beU7UKWxdaaocCBC
	1n85sM1okC5pRja4DCnWzEu770DweE5dR9AL74GOl10/L168x+Hx3VL//I9rvmT/
	K5pZ5MWTmOLsVYKu9tyjnS3qH1QKQ07+CmyUEyPir1TNa9iGFKPsp4aBWjLoQDkh
	E9mnBOoqQOp6iw4Hb4RNz+9v1RF9juX4M+Xb8yFTIVEusso15kxlMbiMpDKhoLmW
	FchvGshxJSQzUilEdtXZSloditLxi0kiaB2uZwIxhJofbd7ywemMbAuuuMod/x1X
	pVaqtlLltn0wipbxL5svFcUfGYay0byTlDyyhEw3qQYRpo3hoMANdzjNFdoaZocS
	T36jrw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak02e5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:24:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so5701695b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699480; x=1796304280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4OdKtBkMlVocSiOViDkwteYw+81H1U7mhaDvSgfyr8=;
        b=Egf2NSoxIbs0yvl91UdP+m97xGB4+dLGulX3Ho7DbOBlXcgooRuHB+1mshso4jczGr
         xqQ16cS1Du/fUYlZQcpKLkYvr1OU21Z6SYMLLZJ9RzUq7FbQA4NvPuGa6zTfd06BEikl
         Xmqy/RSJj6UNr+I5MGeiNn5E1d9FShlp+MQ25ICIYeDOzQVD70sXVSdgl5vdlfSnmZ2M
         SzardfQMO8MLonSbrkpEn1lM8iYM0KyN1lXAMdttGWVUCseOLAT2kVcMBlmsgy4EULcG
         IEQVf5UJDLB8ySjDeG99CEYgmwB05PHwYxvEdnl+a8D8lOO9ubt+u0qlzK5u5VOy69v5
         nAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699480; x=1796304280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4OdKtBkMlVocSiOViDkwteYw+81H1U7mhaDvSgfyr8=;
        b=hlyu91yI2Lyl48ZYeoPkICOnTCj1a+7RK7NyaMKHQ2uRTcTn2MBP+sWIVs5P06H2tI
         +FeV57WNTHHddN7OcOxUuFHdkKhJXX/PrpxIuzU7cqHHF3wtE1QZ3Wkz+WUwEginE3nq
         dH9WCJ5Rf7lDsIg4Uu9OiZ0/ldJOCtRILTiruVH3tUTf8q7is8elvR8jOYl6zlp26hSo
         H8InSKLVhpST7MFbsYrc0XydsXp8KKG3y41Fuwsgjqpt4KbaQhXr/3rC1eo2B3E1Ca8T
         EmGBt0aql/p7M+j8IrbMBOuEeAsNRq4muQkp8X4Dlx50nRYWiRzQCfMCq7BiN3ao49XT
         uvqQ==
X-Forwarded-Encrypted: i=1; AL+hErFkyp0Ny8DJtYn5e61nVNNnA163fOMAGXVSZT0A7QrSSIziPncx3G10fkDlrUsK59r69ix37bwQlIPm858=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZKxzxkNa70C9v8yqG0Ffh9sbKNd47V7L0yoVXsrQQdb3YT91N
	4Ns5GFOP3Fi/pyVZxW3S4952hECb8EQrpVNLC1nhBaNCgqxE6tpWKHv0cdDAgjWenqkiQBUAJ4p
	uQAc8xi6kCRvXgeCp5O67BMVt74n2q+4IqzZpBOW8ePa4H5jgee6umToPMYllR5ZIIq4=
X-Gm-Gg: AZFdTZdHV/0rxmrFDNKcArW5wHWN7Sbjo8rnZZY6FNGcY9GKGSHIV9ySVLuJqxwiFwV
	zz4/DVT19w29m0yklthEUj/VXsMEq9ImhjPSGTqTTeD3q8smKEz4S85Ds6Sj1Zkql3ETphQh1dY
	MBdQuJqeb4DTNz/VvspArwb8PPahFrUTSOVyisE9rCgawRLjQHukkSLAlBUTlwNmVqKqMltZrQr
	GNeitjHLMCsBeCj6awJvi4Y9UybUeehDFZsRehZPpZpCy/dkRUnhYbi9EljmHU+3Djo8h3a/ufs
	YCpofpg6hV0X2CVlBpI75J6dzPQT6YC9zPyWMSAe3WSis/pYU8LAzYMXH6KEBRpby47e+lDBzzu
	5tJFy/D9oMG3z6GykJW2IjjiwXHjqMexwN2DLHcn6xHd36F/yDQ4tTN8AcUk4YkRXGZvzQXWxJN
	aQmki9
X-Received: by 2002:a05:6a20:7348:b0:3fa:f23f:a1ea with SMTP id adf61e73a8af0-4014e35c59amr20846104637.85.1795699479659;
        Thu, 26 Nov 2026 05:24:39 -0800 (PST)
X-Received: by 2002:a05:6a20:7348:b0:3fa:f23f:a1ea with SMTP id adf61e73a8af0-4014e35c59amr20846066637.85.1795699479172;
        Thu, 26 Nov 2026 05:24:39 -0800 (PST)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d03adafsm11232196a12.23.2026.11.26.05.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:24:38 -0800 (PST)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 18:54:20 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: nord-rrd: Enable iris video codec
 node
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
Message-Id: <20261126-nord-iris-dts-v2-3-bb88dc5832ea@oss.qualcomm.com>
References: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
In-Reply-To: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795699462; l=960;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=pHs2EXt3Ly7kxB/mmRHMk/SqMUVWrt28kbSeWVTkUgI=;
 b=QTF9LNL5sLtvowhW26NatXiRfhf4o1XNS9zZzkhM4ntqSq88UeLDZoU8r1Vy7Mv/ez0CqZiXS
 pJo6y32T/jHC5WSqBNisvj2xE0v6zg+B11SiF0UflUtRm405YV5Nn1T
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b083318 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HtMBSpEu5xi8YlTHYloA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: sOZ2luQilUI_VxlQzzBsjBXSpvPZvCfp
X-Proofpoint-GUID: sOZ2luQilUI_VxlQzzBsjBXSpvPZvCfp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfXxwebrNX8skO7
 jp7EhjKPOokco8cSCLxikeCUj30gLwTrljF7bm8g4VWl66Jdp1Vpb5grVq05wDTprkW4p1USQjF
 aWpzNZB2RqpP8aVHL5jdRBVIPksowhqhqff/TpqWkltkiMbhwy9tbhVG32Rfs4sEA8rP5l6TZ03
 KIkWLVne0abqs4WEXzoLFlk2igBXAlEzfHOsjFnSxlFtuo+oxHWRUU8F3tGjSAUwBCDCPxHu66q
 LHtG2YL7Tu64GnJMDIE1WpPnkR48hOQ3IlAn2jNKOCmHME3Y2ye4xXN7+EYWGEPSG/e7Qnk1w4p
 jZwvj3pTuMVdDHHE8yYlk+B/FSy0YC6qtmMMLP2E+5iwPZtj6OYlBQ1wclL1b8T3syjI/aX8S2D
 s7N3Fl3o5V+3GBIXqBL9diPxtevXV8S276sbRhyqtuF6C6QKD04JZ9VfPCRvofuwJig5bFSjyNi
 g6hPbS22Ps+CJjLCktw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX/zYdlU6koIwV
 hub4AK/lCJW6WYrN5aNobesMP8E2vfL1p5dyKWEVEFpOP2xhqGBlhJaNoVh0DtDO/QxC8sJxD09
 t885U/e0qEZrSvWyEEn+Dz3hh6zCSlA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

The iris hardware block is described in the nord SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 827d3ba3a2383..cd57aa8b29c27 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -475,6 +475,12 @@ rtc@32 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &pcie_phy {
 	vdda-phy-a-supply = <&vreg_l6a_1p2>;
 	vdda-phy-b-supply = <&vreg_l4a_1p2>;

-- 
2.34.1

