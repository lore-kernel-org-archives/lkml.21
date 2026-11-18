Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985233;
	b=JD5jXVHxplsoi0uFSvTerAXTXevMYFoSgK9FlmgqC3eS/ULaJz0RkinZuWMyzauNrSz1
	 M/piNpdFfn3IG7n46JGJBI2MwNhg1Xnn2lQ3OACVhXPSnm59/S/gkTZwv65wplD2Yqyz1
	 FuEWFfvsD7mDWlca9pzB53xZnh8QZSW2q5JQG4Y3hiX1FOEf2wcGiE+YAcZLqBmQeqLqA
	 3gPAn+YhJZg3T5ozEDLPoLnvb+c604fKBSDryF7/C4QDRdjJPLeCaNUAwTl5+TTUmqUYE
	 mJ7V0ImYlM8nvFBRvG1JzVtYxfdiXJWeeReQtyHszrgEjlsrhu//zwIJbLSiqm3YpMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985233;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=De+BTaf7aeCgv75XUtP4o6wsleP3pF94u5PLmYp02pw=;
	b=WYfl9KYlsat5pEfl4K5JIXSDil8M4xpM/QqqXpXwnOJsHbR3dEZo88oi4i7nXIU0wZtv
	 0hC5Dck/Gy5k25KJoEzFYNBs9qYVOmj2blO13Tk+oXEgsIw8GCDH6hOQNr6/ukpSFi3Wx
	 cIK3AuI0+5enTUetWyQsVUazpE07C2WIBnjYIHxrPxmO9F2679SVPl77dfouu7Drh7TUG
	 W1q9ZzKdYoqZ5L6m2dmZkRLSP+7boIApLF3nafAbRb11GRJjkVBpadq2X0qHN1Ie/ej8a
	 g2YoE7XPP5UQi4o7pKCHTOxLlfg2FdxhKpUOl1p07QkWtKfkDdyC7HwsS4/0cUVeoEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIDje7Qr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCJK82BT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514BC606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 514BC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIDje7Qr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCJK82BT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V69p2603443
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	De+BTaf7aeCgv75XUtP4o6wsleP3pF94u5PLmYp02pw=; b=kIDje7QregJFgM/K
	Vlno+kRlQDCQc68TygLDKkCUqpmCkyK0JEtom1fH7nkRtHMZChev8oaayHBZayRo
	mLk7YoXKzDybydjcwSOfykAJV1ScpR5iNP1uakoxbMjKyEOkX1y0FoN7RA005DEv
	hwnePs18MtCjnRbaWbcZkdXEJsZ8N7RnTzhg/Rf45pM2sA1xLyWkkI4Y5icRn79E
	/qrLQU3oT2kF2TzQeth/5xkpYHOUJyfeO4lkJExMAOkTS5for4HAjnhPwm0Osks+
	SQ5UrUTpTy9kuKAbVybppKb2jG5lNsj1UTvsgZ2GPhngytdBnVzAB7WTccxup2Jm
	Rt3TjA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71qfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:00:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a08903566dso1349857b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985232; x=1795590032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=De+BTaf7aeCgv75XUtP4o6wsleP3pF94u5PLmYp02pw=;
        b=LCJK82BTWxikFICBULBc5O3ZLz/gW/tjnFiMd9c6NGB37QYWQw/iJ7d8MC02mVKgIC
         TwUwixXLU/CiETtmVXVyumcwiseGJGZpr9bID1akqFExMvcYEdzEOdSKUZ3Wchhulwy4
         Jtigpqm8PRUuOXnM8blq/6htCq6Y+RRrxwQWpU5+U1t4WLhYZ7AuT1gA4Fygu0Fkff7j
         f6rOkDO/pxUbDon/B+idb2c7n0Fz1x+SsK0/wz+pGoUAGbqbt3JkeVvueMdPFMRSqD27
         uSkUp9qJvV3XIWWGPST18vH07jqv4z+Zy4EnDSSQY99aJmB0KfDScJxhqfrGpOi/JmZA
         wlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985232; x=1795590032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=De+BTaf7aeCgv75XUtP4o6wsleP3pF94u5PLmYp02pw=;
        b=gnQaLZGBYbn/kFq+no1a2ZXHIfxPjsV8f4PBueDSF50JXCYkxw5JLxgWHAHvXJIlAW
         i28eYDVminrfTnc4h69/VoVWkqNQr6EPFV4rUjiTcVawDfItpPwVzwWyvzWkEUx45ovD
         T1GxaG/LzoPm140Ln1NZd50V6BXUSyY8jaGek+/q+JD1DVXTKj+FMflSV3/ezsTFp/DI
         Yk9e0B9ltTQ958XgapLhCx4IY+RGdPTMpO+fatp7ifunNmNvQKx+pHB26eB9v6w3sUwZ
         uoCQt7LfjVxkvVFReNcUMvOBIa4X1SaftbmW8GFuDcYxNBwlPinnPGCq8AQ20dwaD2kJ
         shpA==
X-Forwarded-Encrypted: i=1; AL+hErGigx396UBIkt4sMJX+mZd4U+WkD58/BHvgnQCHeTWenT+gwDt1XMRkO6TxeD4GiVcaD4JmzybtzjHSd4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bVsfGn6fd7FY4+QI/mXgPTiCYKPsziY4DBcWxLPAWkmCAPVV8
	LZGy2Z4nvt4QJs1ydxDPZfLBmfAngQw+ns4wmwhjcqOsPKbgAtqMGVG5SaNLGfssFfK0uDqVa1G
	vz/m60FHxiNcYEXrpZaDOseL/zDYVz1jhRo9vDMQjL2C40HvT+6ZCamCkg9HXVLwaQEkGhpO26J
	U=
X-Gm-Gg: AYBFou1QBBAMIbb9ofOxO33e8YN6LNwMhq3KedDv9WEkMQCM+85+9vJolq33jm0wuPc
	IwZCY22bQO2paW33VztHCReiqBRLUprpyLQPxbpppl3REbUu9aY4cRAKDECi413Bz0t/XBhPEnX
	vpO5nOJ2ZFqPdfZ6/VeYDP5W5YQqjFMwfqCscbgI0c/WtKlS7dFj7aDaT5tilyXTzjlG8Hfb93Q
	yIMCe2FH5GcAAgp1oIUoeUi86HM2CTflDBwQSAAtvIb9bCBvIoMAHuMXIiyccWuYZtIvasOUo+F
	e39lfE/iIJTBB9eMv7c7ReLQjAswFGTF/NiVpmqVYLRZX4xWuOyDyLEJtdaQaDIIIDmjK/3t1p/
	i1GYSDh7wZ7gin3JYZIP8VIT64d324OLV9jnZ9jZjPfV7tFkxQWqPZY/YB2XlMI3OeX6j8M01bS
	gt/w==
X-Received: by 2002:a05:6a21:2c03:b0:3eb:50c9:b3c6 with SMTP id adf61e73a8af0-3fd2e2bb06bmr4030552637.22.1794985231637;
        Tue, 17 Nov 2026 23:00:31 -0800 (PST)
X-Received: by 2002:a05:6a21:2c03:b0:3eb:50c9:b3c6 with SMTP id adf61e73a8af0-3fd2e2bb06bmr4030496637.22.1794985230778;
        Tue, 17 Nov 2026 23:00:30 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3bfa898bsm624181a12.17.2026.11.17.23.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 23:00:30 -0800 (PST)
Message-ID: <761bd59f-4ac2-4e62-896c-57d15fedc6f9@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 12:30:24 +0530
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
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
 <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
 <20261116-boisterous-ancient-macaw-8cc00e@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261116-boisterous-ancient-macaw-8cc00e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TW0zVO9QIAn6UUVYm-bFjEaJoW_dieQu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX50FguntwMAi5
 YPOY7BVQemsjwJ0DHerQCAnzDh73mIbWYZTmd2Qc29A5+mv16iZQqixyWmAwtppP3Z324wLG6ve
 VSTBWMIGM+ZEgaoMNUgTsHHcHNae+vc/zIpfPI6PgyiLQTGDRuFc1fctL6deiYW/71b1Zt7RQhA
 zaIksltTL/++6L3e7tFTozQyidlHRcDefE2eKM8YeC+S3lBUywWqB21qaSBIJQdOMH6nxp2AM9+
 t8E+b6y4zQG6hiPWF6MpW+YRAvsGvXNGbNdLc0U2yyef3Qd5TUWgZ+GwYAo5iCj3eVWWME7JVHf
 WgiXHeBgEp4yU9MKb/jLnc8HnH70EDmmounzgS9onAsv2QGOz6GAnhmgcjkQhF05ksB/Hqg22hN
 3Wm/bFaDypLBNI7E1PJVTR72ckuPrZL6XZ0NapGKFGCp/8XO6O6v6+Nt8nVY52xOjiqm/Uv3DTb
 xHWrd+TtpH0vOquoDLQ==
X-Proofpoint-ORIG-GUID: TW0zVO9QIAn6UUVYm-bFjEaJoW_dieQu
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd4d10 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=u9YKjPMZU3T7gHYh_q8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX9++hFoS3PoyP
 KlZfTDOGKmk1zn1xr90NNo3g5f0BMJEVRIcad72xRyWfvVE/XrPf/7B3NG/v2DjroR0RZYOt0j5
 r1vahzVJZxp3Fe/lnJVfFCrvHm3ZJqw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

On 11/16/2026 4:28 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 13, 2026 at 08:02:20PM +0530, Komal Bajaj wrote:
>> qcom,pas-common.yaml limits iommus to a single entry for every PAS
>> remoteproc, which is too restrictive for SoCs whose firmware uses
>> multiple IOMMU streams.
>>
>> Drop iommus from common binding and let each SoC-specific binding declare
>> it with its own limits. These bindings set unevaluatedProperties: false,
>> so a compatible that does not declare iommus rejects it. Declare it for
> I do not understand this sentence. Compatible cannot declare iommus, but
> anyway the bindings do not reject it.

Right. Wording was incorrect, compatible does not declare property but 
schema does. I will reword this in next revision.

What I meant was that these bindings set unevaluatedProperties: false. 
Therefore, once iommus is removed from qcom,pas-common.yaml, any schema 
that does not define iommus itself will reject a node containing it with -
"Unevaluated properties are not allowed ('iommus' was unexpected)"

>
>> every compatible whose nodes use it.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,pas-common.yaml   |  3 ---
>>   .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml  |  4 ++++
>>   .../devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml   | 12 ++++++++++++
>>   .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml   | 13 +++++++++++++
>>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml   | 15 +++++++++++++++
>>   5 files changed, 44 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index f75cab6b4ed9..4662fe4cff62 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -32,9 +32,6 @@ properties:
>>       minItems: 5
>>       maxItems: 6
>>   
>> -  iommus:
>> -    maxItems: 1
>> -
>>     power-domains:
>>       minItems: 1
>>       maxItems: 3
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> index dda2d144b720..3c35da52204d 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> @@ -38,6 +38,10 @@ properties:
>>     reg:
>>       maxItems: 1
>>   
>> +  iommus:
>> +    maxItems: 1
>> +    description: Firmware Stream
>> +
>>     clocks:
>>       items:
>>         - description: XO clock
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> index b20780e5e26b..8aebc785f212 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> @@ -169,6 +169,18 @@ allOf:
>>               - const: cx
>>               - const: mx
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,sc7280-adsp-pas
>> +            - qcom,sc7280-cdsp-pas
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
> Same comments as before - missing property definition. Properties should
> not be defined in conditional blocks. If you remove property from common
> schema, then you remove it from every device referencing it. Nothing in
> commit msg explains such intention and reason why.

I will update this and keep it as a no-functional-change.
> Either iommus is valid or is not. If it is not, then need mentioning in
> commit msg for example and then you drop it from common schema and add
> it to the bindings where it is valid.

I will cover this in a separate commit.

Thanks
Komal

>
>
> Best regards,
> Krzysztof
>

