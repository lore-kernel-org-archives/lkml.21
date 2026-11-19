Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072252;
	b=aMWDh3PbA+ZWawR1IhY5LP2Tz8lyKB0FlqT3N8ZUeAZp84U39mBqNUZeyMNfsxsVXvHN
	 NUHsDh+N1Yu+NVpqjCsdQiSK/Zp6dXL54u6pliWToKr1ShNuNq0psReB7oyp+rCetM4pA
	 u7ir1NNuq0+8YEH8V0+82gYbHQW6JO8uxi6wChHkXML590VtNads4/tT2boe2qK8U4/7K
	 w9yu0CKSqKil1qqjZyNC5r79/ynF11YsYA2HmJK+asBJYimbZmvonh/VlaQkmAs/jysBf
	 swYtbP4PL5SEy4o2TFTANzY6/V1/K75YwltYV2pFkEHvsZMHPt3BmwCShm6BVHO329g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072252;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
	b=e1/I0RulIWQSNaM/lLlopI/qFLlYs5T1DwjqnJ0IoBnsAqXchTtgCVxdhLtxMc/UblTd
	 mc4Xjq0ViYTktzJrLjO1V8SD2906KTltiO0LCy9QMaC0ELrG7FYiLmSaIhvczZM0Yw9Yv
	 75O8+YMinLpCEJonJvUZ0VAXXX7X+NMpSy9f2HxKjKLXVBXVBM+OMYmNnuX0/p2cgfPbj
	 pyRvzTvOHub1m0Ci4r39K1t/2sBhHjwlejSmw7y78xxyEQAGiti13eTr/Y0GCYOM+mPmw
	 G+tIGaQxzYiExfWQv78B/s2jgsv6WQSj7jNOzI3i8sSbfNUKczWDy0Ne+mMii363gNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dfspp45/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JzsZx5qq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0653C60A260B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0653C60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfspp45/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JzsZx5qq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vWuo330694
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=; b=dfspp45//kaCSpJR
	huucG6KlrK11LS3QF4C3SBGnGx5Bj7g4o/rkNEzVlhCEibADDql83Mv6a8c8jo4h
	0H/PyAJD4HgdZ09ktS3oURtMeU6ecVZe3mkwvIAwfqFlM+b+4Ol4MKl0dMl33cUe
	QwBXFhjpUx0GuUJT48qe5pne1P6zb5vF9L40eZINaXpon3zqErfPFpKBKq23hiFp
	gxhzbEy6G296xrEtMr/mVNxGIAySbTiT0Xbefyh2zkE7DIXUnC8wWDh/R5fCJ3yI
	rMBa6gYuor/BrtDF5V75I5PYwpt/7w6l22ACBOtUE/3mnuGMwFP1KSx962Ihqv+V
	k7YUNw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnk5mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:10:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so1531085a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795072251; x=1795677051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
        b=JzsZx5qqlVHqzvED8zmCg/w05+5WQqbvjhUc0DijfNVurlzfAiiOYkRSuelpVSV7ix
         BAOuiOhy7+eC57OrSScrGlpSd6l0RWOdYHfKBn86OyRzWrBDPY0adOwD5j1Ma78tmdta
         +6kbXzxDQFaX+ccQkvXMX30Bta+hjpJKZNWUOqdffqTEBmzyJyG912HF0BVPXozPvpbo
         pBRG7A+PmzSYvus5ETW7KqegjiNFxh7Fz6Sm7A1M9pn+mAuzZ4Dcfhu2yjqwQYDwjOi8
         OiVY0yYCbq9EJqy5ekRciOn2wVgY6owaKAYr1iDixweKof/KNa8L6Q1dsdQS9gvzJW69
         rZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072251; x=1795677051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
        b=VYOIisBq/WcC6nA7Ixu0qwnuuKk3Xy1p1DqIXSQaNZzHuXG/l57nqdM7NcTQ2tw+zV
         vsUrz5MqlnhaTUD1IXOBMuaGTbWPLsQwscZyUUeN6RBigC4ip+vZQ1OqDVWD3tgVpUFv
         BcjkPS4zB84ckK1kqURGfkh9QgSZhQmiQDUMCoSThOdRxX/m4E3bJvAbIpPVeFcnYV+b
         bQ3VUxmOwHzb4/kcm/A4Te+SB60AFFu0f4VCW01olCX+qRVYuQxJwVT8K8RL6wlyY8Yt
         oa77TW3eYqVI3PXV0KsOrlBSw+DlHfK3AIitWlWvIPc0bucweP3TFoGTnTvMOs0pBYtu
         aXKQ==
X-Forwarded-Encrypted: i=1; AL+hErFnjmi4GIIQI4dVrrRVe78dRoggRS4iGUOmaOqbGe/zqfdGE2vCchmk9R+KuXoMdFBAyn3ngR6bGLVu6WU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JdlO5rBzsBugpTW5iwQ0UihQa0cnCDhzLgjjrbF0eqxQYrcva
	jizgcenWBGTNhhSnJK+m9tE2PeENQvXfZ2lL8P4ZY6Ak4a0SmfhVgCh/POjdTPXPukHkTF9rGKS
	SKCsI5hyO1Naq3twij3q02y9655WwOJhZ5tX49O+GINHvgcfpIPobL04BEnonFmycomU=
X-Gm-Gg: AZFdTZeS9KGPqTssNojZsgaIMMFN63u/E4A1Ne1sBMgCiVDyRSRiW2CbPwMD2KueFQg
	O5HvT7UTv1PPDnAhH840LG7MmXD+5HM8QG8fQIgQc6JcQWUbuV2Uly+A8L4O85SJOLSOkwDxA2a
	1LCzhqxG1AtXegD+Qf2Yu5LLmN86LzAUmJwpsjtw2VBeLb0TfgQUPSuPVrbZewqc1nDdm4H2gtN
	lWvZaFKjtHmVwaKXKmcIqrIFXUXumQto02fAnrFAgJZcBDTDWAWq9qMG6PLRUlrUIW9j1hwnTiI
	5JYG1fMzrJ7FE4e+QeBtBjOtPfBzQKuu5i0zXVI32E13GwCasU2drwJmSLWXsytk1Fh0a0WM5en
	OjulAlSZBXP90KkkrwtFzxk+x50bVfesBFUiPhO1/G9QlHn013t592MIw9OHvecmO0t49XlEet/
	ZgF3VLc+1JHQ==
X-Received: by 2002:a17:90b:4490:b0:3a0:abc3:afb5 with SMTP id 98e67ed59e1d1-3b3d07656f3mr5176727a91.34.1795072250628;
        Wed, 18 Nov 2026 23:10:50 -0800 (PST)
X-Received: by 2002:a17:90b:4490:b0:3a0:abc3:afb5 with SMTP id 98e67ed59e1d1-3b3d07656f3mr5176704a91.34.1795072250005;
        Wed, 18 Nov 2026 23:10:50 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm746348a91.7.2026.11.18.23.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:10:49 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 12:40:12 +0530
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
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
Message-Id: <20261119-lemans-draco-final-changes-bringup-v3-1-db08f12f0cd5@oss.qualcomm.com>
References: <20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com>
In-Reply-To: <20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795072239; l=1219;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=J11m6SiF1xvvFn7gQOySTxQ2FArKpUmIzJhDjDucqOA=;
 b=UI7Icu9B2hyFZ0Or791SCaVxL1Mj1EMf+ZP50u+Wua5lXmjjJXMrRtIzH7/1MtGxAl+OwBc3o
 JSbf3jvT6AqAOaY1bppb4hNO1dw8luWlkGYf1SkU6OWki+Epwx5N/vk
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-GUID: -cASYrTvL_9DqzzbFu-dgJn5hinAJAie
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX2urV0VKmTZHt
 c2vc+Bu/qld4Qr2ek+daMifMeVESotNiHcpjTKNwRpYJEtojme5eYk9cO5k/EhkXqeBm+hjCqla
 V09doG60KgdEwmNKV6XSHZiveB2wwphBE6lB6ddVBH4RcCRmLvS8ZCp9znPq94vXcqpo/zqcRei
 2BPDaiHueGN3S7K6SwxE/i41ZUHvrt5UsPN0o2dR6IRQR3c9uQPJCU58B+2XI+2ITcJp1/Xl7Sy
 LnKxIje+FSdU/qyOW+PHE8yL8c7Y5VDd/VFQpYXmzj0uEX8nZ6mX8JziBshFSMAhLH386neXX6e
 UKnfV1wv2qPTB57By2Y2W8NiWHnZ1Vanls/MlH5KZNxxYkk1rFyVMIKNznMwNKkHWuvr2/WsMB/
 nRyTso+5Ye51vywyq2b3uGeI4oe8omunFBeyGP/VBtdUxQ/yXEaV7KliZSwA7Vd6CX6RETxoe9s
 IinwBg03WDQ8E0skbzQ==
X-Proofpoint-ORIG-GUID: -cASYrTvL_9DqzzbFu-dgJn5hinAJAie
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfXxwotEon/crN7
 V6glVT7i5UJltTnWpnpxGBId/k+FKM7iOcYA/0a88AT+sk9HPnbdJG1Z05P9PimMYjT+baZNP5r
 0+3i/yABbNQt6C6rJyjCEuqztmCwSFc=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afea0fb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jgbjWhLY81TnJwHp3GQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190028

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

