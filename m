Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431223;
	b=CdTYdO4uBLGLIHTsGNjaIsBHNHZda4lIUClO4yqnc8jWw2dzcpL7qDBUZvWTcQtuxV/K
	 9UmMAI2OpLJVbgXU9/Wj/evzud6FsyvGXQobW2vONaLt3c91ZPVBblINxG40pTFhDH8UL
	 ZVOsVpTsGTEsNRPhVU7RjUq9fW3jlUpw/w7yk6wLMh4R9dtYp/s6I2ae0QvowJWeN97r2
	 VE8y0b8ols2ZqUAC3zvscFp2+Odx39+B8aBJyWBc9Iftjq7rY93oCef2fAOtNcES4sXYl
	 iG05AqW895Cl/sZEkLM+/G6bZCb+0V20TjaLeEe2o/60FYHG5M1Hj8jjQDPwsDv7z+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
	b=vGGbXIUTEWKJ9RCwPtynJGAcOEh5r0t0fRxovTJHrGaoi7KzN1y6p2+HTDVnDx2peYrA
	 tq+scYGOFg9073lnYO9KfyOPO1sn5V1LLpC4Iw0XFCBNoqG89fBeW+OB1nEXHOEAq/lma
	 E5VWfXtbameLoj/Fh7wTwXH8V8vxWC29uIMLI8+qkVF0WpL4+vE0+6+j/wGjLPdTvyJ8C
	 XH1SRSmHMi9UWtE6jLmTGxOlAjDcIlwntLu/1ZmssiC7ORcRyUmIqMKmoy33Ubl4El5t1
	 ArWNWXfFokN0bcfVxTObr8bfC9AgCeiwBLaWv9NtjJewMDW7DWVZaI4uefN3BBLhVLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLDhGM+G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dhx35+DQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EFC606A337
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7EFC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLDhGM+G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dhx35+DQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G7ll4095715
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=; b=GLDhGM+Gu8YdqAbv
	F0fXr/OprH0QQJSCflx/jY8SjE7/50uEBfu4VFmw9zY0Cewt5Hbp9eBFkB7eo+3F
	Og9m296OUHR+6NdIirtq0A7+kXhpxO+Wk2b91fw6xswhLDw0Pyt2cwcwY4dpDGD2
	58GwXVz3U63oJYPAaH/OIRJbCO2rSoLdk0YCww1cMpzy9+97jnjiODC99j7CMEdX
	76Pmys9aN8rhJ27vMaL51gaqwGtF5Bfr8siR6gUa77yhpivfEO+Aaou/Fqyt8gbP
	+b00gdOjIjGyh7ba9xN8i/+8/7G9lA/6qYuAuAOVA1/oa4Ln7yCCyBsSuqdNrrPW
	HWSCXw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g74115y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:53:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so2716097b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795431221; x=1796036021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
        b=Dhx35+DQ84T/CUoxcxt2wmpc6/hYmG9scTK3XoXR0GG0riyGELZ4mAHqEKoeel/Y4V
         B5PmfTk3YvAIk5mtlROEMOKdwY7Hxz0Q0iNGJxj21bEVkCmbsc6n/g5NxQ7HHdkhkFSU
         aBZMq0f/MnOnrxTiNEIRYSwhuvSL3bZ8soiNoPSjwvKqiIbYt95Wq2qkdxCtSucHCtUl
         O5rUNmTiUY4y5hlgxTxrMXG+gTPJgz+gHsHKfasGsvjKGISpi02y36P+1qHZE71eXuiY
         mk1fC1b3pu4yplE2d9E/MQnCwwzdDtHmvX2qZGST/DbxzY2+FfJFn7+b0yYKAdx1+A/M
         dANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431221; x=1796036021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
        b=mBOLzPjbO4EV0o5uoEfLu+9QilYip9G3Ko2hUXEeY6ZbhSdVduZssxDUE6lxjGpYg5
         2/bKBP7dUcCv9TbBchhBl2/qdBeJx34aESaZ/Y/dlx3mVXKTz/eFLEA51VwoBovzT2Ma
         zajYs0XkMx3YWuUJ28G3lJLOc1lS4wsVGIgR8BOVQumGKk1sDm3In0XyYD/9JxcE/sJf
         OgdAyPq/214GEtFpJgDypB/fMJa7mSgTra/koIezTxA+Qs//lsZL31q5efcVakNylpBl
         njooXfbuExdIzFObCySBo3sznrP3izm2RW20VLYghZz9zd7QKxFdI8r64jIwKTSG7Xg0
         0WQA==
X-Forwarded-Encrypted: i=1; AL+hErF6x41p5Dk8UckczerVCSga2VJpSLp7G+kvI1tWLNNStzFjK2PD9B0Xx5aouRGQ34tByGGMfC6rCemaUbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rcttQlBfo78Yvl/2DBBivUC3lyhdAtDM//WktsGWwKz3e1ocu
	6Ae0Oma7FlOM8VvIYxMxSjI5x6zkyqq5cm6dEXEiwNEw2Vqpem6jcw6udi4wiEnCHyJNsemrCa6
	/JALWMbtJCP99BaGjoU+WILdC95KZS+b3MzwF080Q09InC1q+k0amWjh22ilgtgv7/h4=
X-Gm-Gg: AZFdTZfFt5mg6QPI33pmunGpMthSIjqrm2K79m2T5kPtktUTj59ps/SrLtksPsYLERF
	mfTq1tji76EV6Xnd3JbNpmTneBkj6k2IGV14v8EdtyIE2nSAEewR5zl4QADs9VJQqEg5KgqF1mf
	lOgyMf/wAgsNOUgBl3GSjjX+wueKu8DJRSOMxxKgejbTB5yEk90LcGSlsusD/vgvREie+hza0RF
	fVF3se9MxNnMx8azyfrLR4taxxJIHfsCH3Qr+579mm4XDOMmgqURQI3j/a7ZBYmDwNR2dVXlUBG
	xv5+YcWHp0ofYCIsVQzAxJl/vFlLlUjxPY2ZrbuyY1EwGSYtVRyIzSzaXuvAlhejjBlP9m7TqVu
	K+JDvrP7Uk5yftbl+fBGFwvvPVcKJJ3D6eSDZwaKU6NIkala6fLj7TCVhcoMkQtNnHDnGO71ANQ
	6y7gUreDgI6Mw=
X-Received: by 2002:a05:6a00:2c94:b0:8a9:b07c:7715 with SMTP id d2e1a72fcca58-8c8792a497dmr9325319b3a.1.1795431220683;
        Mon, 23 Nov 2026 02:53:40 -0800 (PST)
X-Received: by 2002:a05:6a00:2c94:b0:8a9:b07c:7715 with SMTP id d2e1a72fcca58-8c8792a497dmr9325301b3a.1.1795431220221;
        Mon, 23 Nov 2026 02:53:40 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm5330863b3a.29.2026.11.23.02.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:53:39 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:23:10 +0530
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
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
Message-Id: <20261123-lemans-draco-final-changes-bringup-v4-1-dbfc15cd0883@oss.qualcomm.com>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
In-Reply-To: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795431208; l=1219;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=J11m6SiF1xvvFn7gQOySTxQ2FArKpUmIzJhDjDucqOA=;
 b=v/JQPrZtMh9CPiRHeJ/1lQdAnsmbifrQ9YeQZwNf+toWfXHTY4kwDntqTOT1G6r7bgPxk7NcD
 d3fPqeQU97PBujMJEWvc36ZJ9U0LivjEAd6xOda/g4UFOD/p9YM+yeW
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-GUID: lZLI8cbNuObUOUSTmTS9T8VD2Y4pqdlP
X-Proofpoint-ORIG-GUID: lZLI8cbNuObUOUSTmTS9T8VD2Y4pqdlP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX/1M1tc1d40t8
 LE65WZZzmy0nZaQj9PSzu/VqtSr0XtdqVfFHFLcC6jCj0yBZ8QeMptPaAJPxAfVaV/TKqpXgnci
 Ic9stFVxVVTabrbkcw3GAgN+Myf0pvU=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b041b35 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jgbjWhLY81TnJwHp3GQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX9KDCwVai0mv6
 Aq7yTs1XnzYc4euMUjLUR+rEvTqvMGE97RkSmV+XWemp4O5zYPcdFI97zVBcHVTigI1HjZfcFlJ
 H33vVPtPzO4iGA1lUzglbI2Makbn4Z3cl25VZ7x56QVMyfa1nS/D05mt34zH2QUok6uJUhrXgAk
 Uh12ZmcbMgdlODdTcX1sXlhQR+GV4VkV4uMfw6qoKLYE1ccYal7DU1KyFV5f0sKwCynDgEcsSeQ
 wV/DcHDRjb0/Mu16Tfig72TN94zCyFWc0nOOmZ04VWx6f0a4ASWLchbufKjsmvg3lQpe109l/an
 6XjKHcB2k7FhCiOUy8CHgFZ02HkGjlocA5Df6cqILxN8iNB79qyMEnHlBT81DS+6juMC+1GIuYM
 QZYicThL+Z7FN5yCs+agKGE3SI0xUMINfNre2A4TI6TxywZ79H7p7pPuilDc3KY0bFcUxmiqxK3
 5OXb8qZE04oKvY12jdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230043

Add compatible strings for the LeMans Draco EVK, an evaluation board
based on the SA8775P/QCS9100 SoC family.

The platform uses a two-board design: the LeMans Draco SoM carrying
the SA8775P/QCS9100 SoC and core connectivity, paired with the Draco
carrier board providing application-specific peripherals.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..3d63e797cf60 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -545,6 +545,13 @@ properties:
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - qcom,lemans-draco-evk
+          - const: qcom,lemans-draco-som
+          - const: qcom,qcs9100
+          - const: qcom,sa8775p
+
       - description: Qualcomm AR2 Gen1 platform
         items:
           - enum:

-- 
2.43.0

