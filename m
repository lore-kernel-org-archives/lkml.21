Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693069;
	b=cZSN3iZMkrwKGewak0GiV1ExeRQFEe8Ge+wFBHPARQzl5czS1h2A9vth2SVMD5h4q58K
	 f3eqqBhzDUax9+S6XkEF3gbTL8hjFAARZiRDbnF60RULVxWsmyuSH8xCvSfS3YA87vAfv
	 Iejy/vYK0yHR7G9BYSqgFLI03SQx4uwCCLtPPW0l0o/WBPMtJb1ZkrdKpkA+pVFQZg5Ho
	 mLuK8dCBYNRo70T6Dgpj+hgA8ODNCx+WNA/F+UkCimVbobghBlZTMoYJnH9kSVWfNzaUl
	 jowAWlAYWqgecf29SozH/+6rn/D50o0CElARCTFKGg8z/9lwP3Pjw52Tf4NDkYWJZgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1H+FE6kLZFrXby5VphVQHarfHz52chCR2U1Jt0HCyW0=;
	b=BE0n4JA8I9pHcZqCchGdAt5yZ4wNz8kgWE46HzlJ513rH6Sb2B1riBTydCP2HlmhbRMw
	 gItydHvRFB6rB0mljmoBKPHQgM6b74IR58/TlV1YKnTJc//gO8ks0f6GCKu4ScGp4VQUO
	 zj3StlMlD40SxjO07fwlPKNQF2JfYzeNn9hXJ09KaJStZ11+BU5Xuz++FhYrupWPnX52T
	 cYLdfwLvJz7SXPkw0xwYsooC2h2N0uD3/mD4cd7OHCNra13WwAe9rGy6goAQLPF/sL7Rj
	 ayl5+ZC7ZqFPngW41ukt2mnBnpt3ZHtdC1iUbaJacORy6kID6qxInCZfbk0gdCfaGSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AXrIv5Gz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ARrkrFxh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA78606A339
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA78606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AXrIv5Gz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ARrkrFxh
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVImM3476070
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1H+FE6kLZFrXby5VphVQHarfHz52chCR2U1Jt0HCyW0=; b=AXrIv5Gz8xeLTr/P
	16C6KVD3hjLVUUicfD96RUkcXn0jLCTm6gP02Puti68CDEVli60R8A93EURcJlWN
	cg9ent/Ier0zWYVG2j0SZ9ltdA8RP7/raqEW4Sc+jFbIwNX8P37lGQVBsoKVz9Xx
	7iYX2DSdtf8D+1Y0TPaXbiEkIWyU34we6k6ISzkDPLWqoxPaPpQJAK4KBALgaJv6
	HsJzcc67E6mrhdRRDFw76aeSvWT+OJzQX7CLdxOtt8NtEAjxSUM16ja6Ks1ggb3O
	ddhefQytqkOIV5svPS7RrgUtUweUsAtZIQy5dYg8jkhiwVcs5TSyPFne9XbrbHUP
	LxEF9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rh7sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:37:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-948d83322f6so537713785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693067; x=1796297867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1H+FE6kLZFrXby5VphVQHarfHz52chCR2U1Jt0HCyW0=;
        b=ARrkrFxhxx88VZamemwQPr8Lc8H6wczgJXbxpkPKJDjUSloCDCBcKimQs8QBuj7MKY
         C7yxS8GFbEDcfMT7sm994rlkGcUF6b482Y3HCaEcxB7g6PkKATHGHyHCahgws4CAPcDh
         KwM/PFwRDsdzplYLgfTfxAdR99NM2+dOH9cXHi6OMwdGBSf34C/4JX6HZsBgewuJsS6o
         ttW+uphbX5RGZYAYvLHgvNFVcMFxegdOk0Y/gqeb4mQj0Gmo162DhtmJ/5XbOIsleJmd
         dOFS8PFH2kLcDjkeFx/UlZ6tlbSyDIs4saeKSBguKnuEcmZ5g3uVyHJS/kkfgPTDejen
         JO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693067; x=1796297867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1H+FE6kLZFrXby5VphVQHarfHz52chCR2U1Jt0HCyW0=;
        b=kYDGkc3neAYinbXW7VPJaxjHKGERNq17683qVBHNJM20JlDvOAIPqh5DqSrCtx/dr8
         MkR4+aAlaoej0D9bByIGVHlGrT+zCpaEvYpDqPVCIsOck/FzdPqnWy1qRFtOAjQYuKPw
         WtsdgIa3DEgJB0zf7NdllDdBeCvTb7yzhl0oVM92DXMOOUlCUeNXLJRgvnPWhESFDzaa
         o7fFsm8CiH1G5qn9zOWGFm0elphqzlysATvxPi4A74tjNVoHAv+GzYjEJtg06bZdBvN2
         TvApRTu1WfQViR0iy+oXmRDcrlE5oOB2zNa38tsOGMQv6Bv7xE9jWtgTYkY0pnJmyuCJ
         GBIA==
X-Forwarded-Encrypted: i=1; AL+hErFz4LQkAt+4RYu6YxbpJnT18pM4UQSglbgjwC9AGkGOYB8OjKUiOVB7thSKLl+7tReSjgFh17rGtySmj0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YcYyoVznAOkXzF03UictHTQ/iYjF6orHI8EVzqqLtEpQxBcv6
	w+bM0XYdeOrHMqwFr/kST7ujryDejYRgibgyBdVCZdtkknvVbuMyMUK1Ut1u8xNFtHzh6B6scz9
	F2ajVimPZids0SF195nnlkLIvdIaz0I3bJyWAqAv+yC8KiotRCtKvDFYVdPhjF5hk2dU=
X-Gm-Gg: AZFdTZc1wKDJ4gWm0jnSUaUZI21NGG0/RfcwK+YHhFEgCA9g7YO91c9miALLc3ydkYx
	ekmc03QPxjrfUoGyNT7RQCReHn1dmp87PW807qhduCBvIS0COE5V/adjeIsntPDQFWq/oVBBSu1
	7UBbmLtC2ifTnuVR57bahxqogDOyrS9pJ2b8sxhPWue8rr2iCdiudxvK2QHDo96uU9JAryzVh75
	XfSm7/br7BYxvb0CfM10OSwvqM2l/D7G3b34G5uK0w1jqJSlSUwdXaE0vzDkUK8bRQuO29RN+9i
	2QEFU/H0e1nyWVfj+sZDbzjhbeNG6IAtfnP+2jiFxal5A2qUM1cUatL3J6OG1d37aOsZjYipgbo
	fEKZ+MsviAV2q2sLy725YwBQdjJI0f2snHif1IDGMZgIytaKR6GEOVf7lCfQNwnSsOK/CLZNLHD
	VGDw1E0hYex3Re
X-Received: by 2002:a05:620a:270d:b0:949:8109:8bcd with SMTP id af79cd13be357-949bab6d24dmr3486795185a.77.1795693067272;
        Thu, 26 Nov 2026 03:37:47 -0800 (PST)
X-Received: by 2002:a05:620a:270d:b0:949:8109:8bcd with SMTP id af79cd13be357-949bab6d24dmr3486792285a.77.1795693066781;
        Thu, 26 Nov 2026 03:37:46 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm748210666b.73.2026.11.26.03.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:37:46 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:36:47 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: qrb2210-arduino-imola: name the QUP
 firmware
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
Message-Id: <20261126-agatti-el2-v1-1-4e25fd64f198@oss.qualcomm.com>
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX7DwCHJjNr8hN
 3O40SC0x/OeA6wkyTLllFUMIIRrKPW3Y74aU8dQOj6B+bshrd4na1pfdCPB6ZtoNVqLOj3okVOV
 dF3zLtAfzv8AKSHgMAhGLJ+prHPMiTpWfMlRH1EfjjqTiD0Ih40bxAEWh9msTtLpj3uhpK0xQmU
 pUhjDfD481ND4M7hNmDEi758nNwsvS7gW2SxXmoe4CN66skwzTs/OZ8MDdp14D2fINlmueD0xzt
 ubRZDeNxu2B2YMKYqZapYB1xhIV6Z7q7PVH4j+lHmsK9BX1QPRky9ul2f19zi+CWIMYhliFL4rD
 Uurw5r8culFnVKNSrL32b+TfE0b/tsdMeffKj4ionsiKduYVOpoOCXUOuXsvT4/+EgG7wqIaqMg
 w8OCtQXXCRVsVNYnPaCv2lMndfSjdt3pjmZ+PM8RKNvO+/FCg9w+mc14YIScyUvXXJFcYGwGMIb
 TwnRl3phI0JvHQcpCHQ==
X-Proofpoint-GUID: ETvd5Faikmu2dUARUfGjuIb5sLHn0mIt
X-Proofpoint-ORIG-GUID: ETvd5Faikmu2dUARUfGjuIb5sLHn0mIt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX7NFmhpKRUiq2
 6MxMzoxn9GG8ahjuIhjcKUOwqkLLo4UdyiRpgqKrEa062GD4B68PuYSAPpRmftjSGgf3IhVlHvg
 Rimepl0uFfl0/esnAZw5Gnx3ZmLFELs=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b081a0c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9bc6S-rvgswZ-E9PJ8YA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

The geni-se driver loads the QUP firmware into a serial engine that the
boot firmware has left unprogrammed, but only if the wrapper node names
the image. Without the name such engines fail to probe:

  geni_i2c 4a80000.i2c: Failed to read firmware-name property: -22

On the UNO Q this happens for every I2C, SPI and UART controller except
the console when the board boots TF-A and OP-TEE instead of QTEE.

Name the firmware: qupv3fw.elf from the QRB2210 boot binaries release,
the image the stock boot chain loads from the qupfw partition. Engines
that are already programmed are not touched.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..f6db8ec25133 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -338,6 +338,8 @@ &pm4125_vbus {
 };
 
 &qupv3_id_0 {
+	firmware-name = "qcom/qcm2290/qupv3fw.elf";
+
 	status = "okay";
 };
 

-- 
2.53.0

