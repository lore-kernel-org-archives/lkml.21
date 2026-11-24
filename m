Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517689;
	b=DsrXCIL5TVBVvbzw5QcGuhx77VSHVdAOpXBTq6D/TbCT4gieyHvXCE5VdRH5yLnhojR5
	 C8PFYj/XAl+ZMQLrcgFvUqebtPBLC8hHiRX8FVSst9rLfCAGLMZqQqZSptlN1hLvtg+A/
	 nJB2tM4qt6XqktaGj6VptvMx6t3m2fLbez26Y6wRxUZR43IqZdgdkVlDx2thdra1KkORM
	 liT+v6FvpzwrZHgl7Yq8BqthiTDGGFN8v0q3SqAQHCtJHUSEVFJpEw2kDTXKTv2D+ZbaR
	 yVoxVt+SVVxojXkPQa24OgfmPj2Oqx6Mc4+kyJpfTFvFL8EFX6rBlZ/6rzaLfS3nR6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517689;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rAp/Ls1/54nALRkGPdoe71Dsv0aoi886pdtKQJOKrIA=;
	b=CoziMKkw21eysGtG0jJD98GD4Ep0oFQWJZab/tMPDDRGwkiyEthMRs7CIpTZxdfZstHI
	 a56Co0MJZe67Gr5ZcO9KAze3SZKWnDeGmSAKYjekP+avB1FV/5BGyhWCm8rCsG5IWx1es
	 jkgY5fi0qZoItbEj3mqRS4wbfBUewiVs39ycVrp6qvMI4/IufxEAWROKQAw6PVwihrCpk
	 /XCH/WT8LF9IIbWSFDliC7YEeiC3wpH2hdNk9zydEfPpv8aEV6kR3rtq54SshJdKvMU+y
	 9kya3vgejUBUJleijzl9tDkdQkfifbWzBIdtNBc6ae6O/sqtHbtzQDr0xpD4GyFpmfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FvO48vrH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b8Sv5Vjo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFAD606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CFAD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FvO48vrH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b8Sv5Vjo
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8VNLB016829
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rAp/Ls1/54nALRkGPdoe71Dsv0aoi886pdt
	KQJOKrIA=; b=FvO48vrHs05wyahmPTnBZZjM8Fn2C+qz3XTVR2X9tJzJqbZePyS
	aaVDddS4Y3J0YgLsAyKOnUJk1BNGHN3TswDAm67XOPnflO3Y4Wx2rJ26oKz3uTtz
	u10SyYo5g2TO+ZYN+DIvg+idTAqQq1RPZh0AAj6qJxlYru9/h1417JUJRC5OAYBl
	xsj/9z14BQ6QehSpR9r0kduDCJvD1uY7AWL/wBqsNGBQZIEmfV7x5+L5UgixrHDW
	BV97N8qLPwICsIv8YaWxyE8sL3iUhRhASB2UWVTu14ZeptTwFYq6j6BptweH9rtH
	bLYhMvsxZ7TjpMx7sFSZS49BCAHIWOW53bw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nueb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:54:48 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so4281762c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517687; x=1796122487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rAp/Ls1/54nALRkGPdoe71Dsv0aoi886pdtKQJOKrIA=;
        b=b8Sv5Vjox07KvqDZt/H7sVzT6tlxc0vtI7B+CzV+EKtHuFjkR3fJ+e4kc75l7H2TrU
         z6nql0qLJk0eMoIYDqmaV+qxixqsTv5bFVDer2xG9JeOC/wyOCE0o7c45qMJjs9ss3Hu
         pAPXOg6VTwXgmRFQYWwCnDMthzw+wN+8/Go6il12H1mh6zL9jsbf4+BKIG2ch+RVY1XZ
         O6vLQYpXDwmYTRC77fQ4UYBOi88CKNuMQs5KH487jTQV5aNgy1qW/hY5gXCCIde04ioM
         s2MjQqPa87YR1SleSgYk2imsv/F9Y1ukoQgyVxOlAR7kTLdmxz64vKzAc/M6GPOQQbOe
         67SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517687; x=1796122487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rAp/Ls1/54nALRkGPdoe71Dsv0aoi886pdtKQJOKrIA=;
        b=cPTkqg8GsSaFpFg+Vpk1qSUZWrGzwfbM8s4GOMKJqF1Y+LmyaamULUo+QQVl11C9Hj
         ZyfwMM2nfwLdPy4hsVYMsqNuqGo7vmoUoeKvhIGb5FbVGjURdqwZYFgOpOMSwIRFccKh
         9vkOxwVJFz7nYu46BIu2B7V96/sj04Q6hiRkcz3k1PJowwzXztrS6kozCsS3HWuxRDz7
         /Wsl/sA98NtMty6PyDmgPeUNntVa8QrZJqpcm2HGHDl6puY1Z6vZMmXlPQAM8OK+Ofhq
         W636ATFHcpcOxJlS7AzySvQd5UWBILLBhIiyVLiPV+TPv17wiu3MjFsw0Vd/Sgj3F/86
         zG5w==
X-Forwarded-Encrypted: i=1; AL+hErFrwsHbsmXawqNzyCTrq+1hsPzsbqH0+H9jWa6L/7CtOq6b0S09LXn5ivo6Z0/vfotpyEiJ7BK1bhz2MAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fQ1+mELtsVnKpbJn/9NpYlgxB/eLYHrksY9DMgh7qRA2MHhPp
	f/7C53DAUHIrAky06X0pAyCQBmbEfLFItpZ/XCyUs8hmR5vcBG68kPfmFQBId+DwEdXKBwhgpOb
	IHVXg2QmPBM0GeNhbnpPPbbA72L9pvBDV/46uto3PXMG3ojq5EvGrwlemIY03w5J+WRiu0ZqzqS
	E=
X-Gm-Gg: AZFdTZfOI7yznGCexCaQqqxeT4eaBRNrtuQ5KB/PHwbQW9NU295wcfxJhEcF07lA/On
	PkofufU9C8b1lGtGgBJ3bqigMF7VqpwabDqgRNeJiYTEuu09wP0CFEaUqgde1AxrxOh15PEDWKB
	mQWBkJvgc/HJXsyTQm48tVM7OfVn+zfL0sPivoeEzp4ZBR0bNnAw4tI/YmTyUfOxGdJEFmqGJcT
	2yYeHh3iMrQD/ICddkI6d/PGTWH60FQRIVOxF+lSAwYmuHmpI/qPhNzYOeWCsQI8nOauioHrNK7
	ZMK7ud1HfcpEwHGP4LcWETKJjK2n7BXie+a2f3qG3nFmgRDwBm8ngp7fvu2RZ0OfM/fkAgvBHkS
	U1Su5ZLwMPd8X0T2v1Cwtv950vZYKuvmXUU2MVEtMD3cPXO3wMLpbpYWV29sMLuDDXOwaG5wWIg
	xEMLgO9+cquldh/8WKMQnGBomwTRCRo7jV7fIqKfoSYhqjYnduhy3joqVU
X-Received: by 2002:a05:7022:e981:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5568ac1d5mr17920645c88.21.1795517687458;
        Tue, 24 Nov 2026 02:54:47 -0800 (PST)
X-Received: by 2002:a05:7022:e981:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5568ac1d5mr17920609c88.21.1795517686848;
        Tue, 24 Nov 2026 02:54:46 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm38072085c88.6.2026.11.24.02.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:46 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: serial: Add compatible for Qualcomm Seca SoC
Date: Tue, 24 Nov 2026 16:24:36 +0530
Message-ID: <9ec98ffd6cec85ad77738128329ec77777a1f69d.1795517676.git.yadu.mg@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX8oa6Z7sFnNkV
 7/5jnIk/HM5BLz191mbBNDDeokgBSDu9apn2NOC7hQdAUpmUmLHsxSFeUo0LuJ/pgTs8M+HnSH5
 DnaYe88YmYhKOl/Zfj4BY0rGJMAw9kN1TQIcjx2PW7KY491EBQD64QnRxL4ksJSRk4Obg1JpRn7
 FddH5o7kiEDLMVP8SpsqAOcDE6JaVfUE6ajWhcROoQcrH99xEpJ6PQOCvCiYQYEngYeDaj8028O
 P8eb5DPv/JUZLhOL68awIaop9Z66jIpINCgPaXJABLRzVUTEi4HQPlTmAHHbjst1FhMawBpzA+t
 rAn9XWFFWk0u+/ZDnyBvg2ArZ0yzlBGF3M7WyPiTwrazAujdppctDrr5ETqZb+d/RNduBlcHY9W
 AIU3keG/WAJhMBWj7PCqr+untkWOup7eDm4tTFWE0qkMVvRojdwgEjHjdUA7LUFJUrMShw7WSLA
 7WlMH+YTWQQxMT5zrBQ==
X-Proofpoint-GUID: QE8fSLHp2e5J12p6GHei2Jq642ss3Csh
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b056cf8 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: QE8fSLHp2e5J12p6GHei2Jq642ss3Csh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX/pAGTCMy4TUs
 OhkL07tRQMplCqobU204wfNpCDo5nU8ow9N3Cr+3n9gLII7ayakJt77Q3PX7MJGWJE35D6bXg8l
 1kvLwOVxNG0Y5u5J6oNKetT8LUmCHSw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Document QUP GENI UART controller on Qualcomm Seca SoC which is
compatible with the SA8255P controller.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 .../devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
index 8496f822dfa5..8415764222ac 100644
--- a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
@@ -24,6 +24,12 @@ properties:
       - items:
           - const: qcom,sa8797p-geni-debug-uart
           - const: qcom,sa8255p-geni-debug-uart
+      - items:
+          - const: qcom,secaau-geni-uart
+          - const: qcom,sa8255p-geni-uart
+      - items:
+          - const: qcom,secaau-geni-debug-uart
+          - const: qcom,sa8255p-geni-debug-uart
 
   reg:
     maxItems: 1

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

