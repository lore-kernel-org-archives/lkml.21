Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607836;
	b=BrNPCWjng6ViPyk73Fm8IHC2Uk99Ew0GZrR7/6WL8vphr4IbcvO933o1ghcfAw/0x5H/
	 7D6rZTSXGPJvdGFjkdNfhAC6Aj0tYNvGZarAykZuamz+TcvJdDubOEBa3wi45CSAVcSwY
	 sL0mN0cNB0FJz+anrRpzBnqYgB0rdPHbmWLJkOil2tJpTDLzL9XE6vJqO5lPwGGmkDfEH
	 y463nPePj403RQNpXzcNd5KAvpNzrYhfAqI+he2Dnc9awadMl803XYl3qGmyIE6ds/vyE
	 zyIhLm26fBM+o0VU3qPnppYDUm1V8msF6d6EMIXHrIdS5cEjjVyoCt2jyRdBRr1O7Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WIaM91otGd4vtySupJsEK/JbUTZeMbmkY21CbOPjPac=;
	b=LdIxrMUe96kJNHCmcejOXVqW5uCFKZzIOtBk87j8YLJHzTDj2ySIr9zS78Z0hObFErPz
	 j2dbuHkIxFv5T3BVgoEl5ZXumYijgYCyM61i0CtFGQbmcWDifsA634IQx4XN0VBz1gy8u
	 Xv2KR24LVMivyglAR//QgSilEkxO9NYmwTJpITQNRWjGHYbq3V2Ph9XbXcmtkL0vUCB5d
	 Xe+fRK6GNgYNHz2fXAo9xcI1oXMNrCCLvXUqdjG2yMM+LtwdyIQnuLkG9zJ8aN5KrNGDG
	 1ePB8fbxhIY9c/oKcxAJv896psUkdOt8ZKtNd8kbUpdJc+FJJR1qUr06xERUmR3cnLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bf0qJbMg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEUYaFJk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCC4606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BCC4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bf0qJbMg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEUYaFJk
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mAqE115089
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIaM91otGd4vtySupJsEK/JbUTZeMbmkY21CbOPjPac=; b=Bf0qJbMgIQfinrCm
	T7S1xHwVE75BX50Rkepre02UkLvICu2sBavOAP4WOGy0HbYWHM7q9+ATKrzJWMir
	A2APG+eMge4rxnMXZsWS4PJrcUrihtQyKvLCe4FVaqwQPLJJnx5FJorHoactzt/g
	SH53X66n2WkioAm1+0GZ4vEQVX7BNOG5TKciRIK6JoKXg+UziF8LLuNZcyxejlkk
	aodkDvWL+zApsaqYIAbhPD8raCpv1xu0iIX2mskDC2tOtzFnlLv8fJ59OTzKGRfI
	2BNdxGy/hgTEsEPMw5fEmcyuSnEBn8n0Bf91sSlieVKg0TpUM0kEisIOvd/wSV3t
	ESQegg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkcpjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:57:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3960dca5so50777385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795607835; x=1796212635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIaM91otGd4vtySupJsEK/JbUTZeMbmkY21CbOPjPac=;
        b=cEUYaFJkJ8xh+J/fvjneJvECXkk5ZJTzDv4XCeXAkUzoCvW4pzfhcXZEjKW5cy8aCz
         T31qceAtj2rndvQrkZDGE/+vUZVdrXdss0zZGym366II1JgdYK7c/cI20WDF4fvX1dUQ
         Gz9jcVoMvWNRlQqVqYWfn+yra+8ZQjj6p1ECjp8uUjywNN73c9nba02yLguBm9KK+HED
         rXADdRrtBBRVytcOFmpPZgAQtJbT6AhFtLQ+RutBPpwJ8nW84sITyo7XeBAdzESHdlLM
         Ld6w6tUzh3HOaD2nLLWiMoJQGbnRVaRVp8EsWhsVq9Z/Q12QCMFiNt7b+JM+GZQbKuNg
         NDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607835; x=1796212635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIaM91otGd4vtySupJsEK/JbUTZeMbmkY21CbOPjPac=;
        b=oogMwTShdKuOsHG+zk5Z6qrJmL2j1DD6STgw57b1R6Wr31O+gAcld7xUamm9zmN2cn
         U1kklPoN8W5wFtblJmgQ+4m3+uwhfQsRjXAMXfr9XWOzK7KbSaUSDnTn0ZJ3lFN3NprA
         aUe2Ia6s6VfXXe0jEM7EZ0DvlVwxh/8vlBk/6DM2PSslN2SJ9h5sjhd9+yKzsO6CaIPa
         eWnclR/Y+83b7HG8Hb4XAj0YNUb4C1GpRVW7SQYM6FhvPP1kzflhFT4gMXe37noE0Z/M
         FNi5y/nQeUOYYAK+T1NwJgjYopWx9iF8+ZY128yPzQNDH24WsUDqXYt6zLd6NJ260SJ6
         JCIw==
X-Forwarded-Encrypted: i=1; AL+hErHAfJGMCL7IbQaL4Sq34UUae4t7kR1TOOBSOsoTfmPGc47JcvHi+quLTOkr53QOzdEUCvyRWTOlbQa2/uI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OX/uEDv/4Y0FHCzbFa9Ya4a1mgWtfg8u7VBAKVKbWpDqiuZIx
	UIq3fHkEMSxhcK4dHoTmU54WA21OTnJ2pKN85Qo5C3QFjm1YdFiQyZmaSso8o/AfatuSkr/0TMY
	RV3PF70uqFB5f79qUVruFa9GiGX9PMsjuKQam66hBgV09ZON7V4KUBk89VxqlCnH2GQI=
X-Gm-Gg: AZFdTZdmBMSZuysnjaLoRxM1K0d4DRkFETK5djvpRP+f7loYiSIIPde9h9XijCNBOho
	lj1CsAuc7TTEI6854FJfp4WQsccyyaKbt+A1D/JLzzS1ROWDUb8k1G+Y8Z23hw/vrE8R+jJcPT+
	x79/fEdUXqmPy42o6eL3gotJqmPRdqmbHbX9DgwgEF2zPP8aA7rVbUlcDe/NRJ53CRcj2Xk5jGm
	Eb+8kEHCQUMUekSZOj647XSlbHDrE3h3cerEmF4qNheyvoR7zRDPqyfR3ZA/BboKklxA+IVvEDw
	uvXilnyNe9Uy+Sc64/NKBwARfjY1xejOUGz+O1OwEl8PBHK13XvVnMeivgVbzo8ZzBuTtcinCId
	3sBXK5tXk84sV+hdLoRHPZmdcTIJjJwNp9ZqrQZmCWowDrU/srSoaqOPR3C98kJCj4HSaJrA=
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr3064945785a.6.1795607834517;
        Wed, 25 Nov 2026 03:57:14 -0800 (PST)
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr3064941185a.6.1795607834035;
        Wed, 25 Nov 2026 03:57:14 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc244asm621335166b.55.2026.11.25.03.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:57:13 -0800 (PST)
Message-ID: <f4d667b0-8a92-48f1-a033-3ba12e0e85b4@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:57:10 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 vdda-refgen and refgen supply properties
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-2-ziyue.zhang@oss.qualcomm.com>
 <5b27776f-cef4-4963-85d4-6d2f970c8484@oss.qualcomm.com>
 <361c05d6-b5b9-41a5-a33d-b12f534e5893@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <361c05d6-b5b9-41a5-a33d-b12f534e5893@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX7vH42dL0RMxp
 9r8EzrNA8SSLVH0YbKCtw7JDO/Lna9ar+PBGRUvxeauunqLdr8N3o6q5TASgLVYVXXj8WhPZmvu
 8grVSWvj4lG2YoGdvi4MIzxTfdh29gmdSeDNQDlhwTfeEZe+Cj2ClpXSqcn5OGOp7PVaoBpN84H
 wwIid7FTEuc6ycancc//miHL8h3hAAdSplW66nPe+ngTvfziDJ/bnXsERFC+E3LiAVf21DO+lvq
 ZW3YaR0Xm6BK69X0S9zJgjWrsXDuLvBopVbWBTZ3AoTquJS6xS4rOB1+JBn5YMZr7KyjDGys6Ow
 rDE70DPML1THJYRRbhoyLY47ZylXSX/4JlzOt9KWZZ0bT1C80RrZ+rk8pZJb4QS/wJitSh02cuk
 RBLk2jQsLZaPDFukChE5kepa2R1xi8M0KG0q70KMzSg0HYk1gHQ5mVO0owH6DaT0LqmgFB4IeIG
 YgndD5bGtlQxx2t1bMA==
X-Proofpoint-GUID: x0qHkBR3estB8bNWZABAplL8KbWwY1aU
X-Proofpoint-ORIG-GUID: x0qHkBR3estB8bNWZABAplL8KbWwY1aU
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06cd1b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=BrYspsXIrGSGt3-AnOoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX8ugfc7m+z4xH
 56+gsvlE99ypa4l8NcYrPiuK3XDXEe3VlFaD+lknfLnV8HwJb8MM/rkjVBxmCo6TOX2Kba8MEvS
 +Ta/7ejdWsBKRwOsP9so2GKIML57sqQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250047

On 11/3/26 11:58 AM, Ziyue Zhang wrote:
> 
> On 10/28/2026 10:37 PM, Konrad Dybcio wrote:
>> On 9/16/26 12:20 PM, Ziyue Zhang wrote:
>>> QCS8300 and SA8775p PCIe PHYs require dedicated vdda-refgen and refgen
>>> LDO supplies for QREF to provide a stable reference clock. Without these
>>> supplies, the PCIe PHYs cannot work properly. Mark them as required for
>>> the affected compatibles even though it breaks ABI.
>>>
>>> vdda-refgen-supply is required for all three QCS8300 and SA8775p PHY
>>> compatibles. refgen-supply is required for QCS8300 only, as a workaround
>>> for a hardware issue where QREF actually depends on refgen3 rather than
>>> refgen2 as documented, so the PHY driver votes for refgen3 directly via
>>> this supply.
>>>
>>> Signed-off-by: Ziyue Zhang<ziyue.zhang@oss.qualcomm.com>
>>> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>>   .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 27 +++++++++++++++++++
>>>   1 file changed, 27 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>>> index b353b7bfb839..bd4c98784142 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>>> @@ -94,6 +94,11 @@ properties:
>>>       vdda-qref-supply: true
>>>   +  vdda-refgen-supply: true
>> There's 2 REFGEN supplies (0p9, 1p2) and the sister Glymur patchset
>> defines both.
>>
>> Konrad
> 
> Monaco and Lemans only have a single refgen(vreg_l7a) supply. There are
> no separate 0.9 V and 1.2 V REFGEN supplies on these platforms.

VDD_A_REFGEN_0P9 L4A
VDD_A_REFGEN_1P2 lemans=L1C monaco=L6A

Konrad
