Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671674;
	b=P9a5OBKQG7DUlWIDgCY38bvwEh68MR0ojfV4Q7d1oI+o3IoUcJEMDHS+4Etd1mr6u6uG
	 8eR/8ue421IVV/a8w3uUSvPIik2Vl1ndGObNcR+kFx4DXjGBSldhoSusWy9QE43WAK5ff
	 0RB3qAAwBNgEGErRMwHo1XdsFbONZAMKl3rNBo/3rNtnjc1nhyWGv5UaQJnHM8a1RLZfj
	 Npt45+XHhMsa0AqI1mt0bf0hl4J37DU9HPyIMDgM4Gs4syoF6gES4FdCW3+gUrhFFQV1o
	 NGgdZXs+ijnnWg8sGUarAl9DekFviFvRH2DxLWOaZYLPNPgM6THo1Mnm9onD5q2JUpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=;
	b=OG5wJMHXx6npeiw/6l+VoX4a380lQipTrAHdhihYMA1yJC+EPBqhaPPlGxa6nKgTZ6Ki
	 8B9dwYn6Z98iSvARfwy9gwUKlz/y9l3rEa0/3IDjkW0LU8pyqbKcu9XMhde38UXD5BGD3
	 H1ki14PMt988rB2N2Mk41DeWsB00goD9KHsNwo4fY8pn11hgLC3MPTNk6xuUpULLWjutu
	 Lvz2ia0CbkbPe6/2kOpM5ZBBrERkLUnz8D8nsHm9uZ3Jo+UYOEoStaJ3Umi1yUN4KBLWw
	 9fxFTzMKDZ1gKovOTYUHWB0f281zZCAhQp1GTEIRndFtHMyQRt05PPziVMqx2qqtZqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHbdAQM2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gYkI/hat";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2672606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2672606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHbdAQM2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYkI/hat
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36D6D2068348
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=; b=XHbdAQM24AiJSbus
	R9doTO40p6club4sn6vQEj4a9nZB7tEZwXJl7ZBUiVq3KVrTin0EEyYqyLTMBix2
	FUoNg2y48oSp/+ujhKn7jSWN5sqKGucDTXffGKMfVPmYfWg6pLsu024bNiT9QOc2
	aSyNbANF+QMDFSMGO4C1jkUa7CzSFkXefKO5QgLidvf74XOHFitpLl/QUUl9HAJV
	J1LoFcK2AyM1YX6fPvMLkwlYTHVHJpc0Ak0jRlQqPIUAmKrgZejygEi65NObCmrM
	VFm5Ijgon/b8GdyxEhPMXUDPJsv0XgGzFnHR6bzzmrWLcxlMaNDxaIsWy4hoamU6
	MRttcQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662s9kgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:41:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so6354489a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795671672; x=1796276472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=;
        b=gYkI/hatiBmPXLGsPcbb3jeDbEFgaUC4qtveRJrp2bSNR45Hir5JVjCAVZlx2z7vlt
         7Kv3sW6Qlzh0+cER/Rs1RXj6c33h85FPPGq2MUgTEv7CzdPRlaQ3F/THNgxk09gSMer5
         UEIwNu2vsP+74DApaddlDeM3P++L0bR7C4Nly4h7njB06zeA9R9nIgWB9joEyDAajdHI
         KM4gtxwhHofkTkPJAw5D4YO71ruDmXusDUzwcDaSufiDgWUH0sek1P5b9aKw+RrYRfhr
         iLDY8INI+JvolOItUZr/qXDR9tlqZk4N2pgAZ5Ak/zvCLSjNHerWxF5rn3uP77hcsxXx
         XB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671672; x=1796276472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=;
        b=YVFG0RxTOD1mvR/EUKwzoSArDwGDPewCDatHuRCdWebOb1Dm013a/WHuh5rKAczHoZ
         R/SAp0nqcLmMhFbxCIdBjeGIs6iTeIz4lT7yG3P3rWjucM19AwUCZhY559oU7zHDR91M
         vF7UUgMEwaWldXWK/+nKZyDOpCjuAjFgmANZbCUpiYBm6YvG155X3w4qENN1p+JtB7mP
         ych05D2j5pT+jgrTwMxDhprQKF5DeNxRiTTWt8VfmdsPngERu166yRpOPCs3iGXTcEk6
         ekBA16YqVigK7x7C2D4WaHqzCg/i1A91bL1cQSp9xAXHth8T3jVvZ/T7llBrRE2LlT3u
         f6fQ==
X-Forwarded-Encrypted: i=1; AL+hErGLWAJ1/bnbcBzzErzfXtT51he0d2lJbvZus2MLuYXrZcnAiAaSEZg61X5LjqessUVbvQaRpmTrpjt5vlE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/O1ee66RvfJ4BtArA+oIgG698p7ExBPt+yDdLFEbK/E7AvlD+R
	aOroXgP8JO6mwZG2dfS1B5knJfJmflnlSwTwcELWC6L9rduGGI2KCntmct1NBWzVUBRHNOeuVJx
	ju3WU0Qb25QlxK5/Bs+UtTcNkFGLwrIugFM/WGcsF4Q1iVz8nid49r8o1gSnh57De/8Y=
X-Gm-Gg: AZFdTZfIeTO4O3eFYCUSlmtpof7Of0kSwfKOy6p4j1PnBfQ+MlUeHzP8eeT6lusA7Js
	ZsdhQcrtZZxi7dYFihZm5AAAS4D1GPaWxcK8AHhzkDLDtip91xAwA+l4xfU5BYhYLL9eCG04H/P
	icdV2B5qsOa1P8mCPc0Yv8KC1Mim2GOb4072EJcUPkXCbVEi53ZEp8Oz4dYV6hY7jz6fxtnG8nT
	sNLhtXyVjoZ4+Wex3epjX+Eu5MwsjSaBZJQ/X3A9yM2RWXf72kBqRNTxTTfhCdn0NYjw0F3extW
	MWHGTkpuww4IHLA3btVzUGYspFXZvHSi/Vth7iYYzB69Yz5rCihDL6hIt/3Fcyvn71oqTnhO/L+
	Y+OE2RcoETdlm7Kym6JsojzpIR45P/nvBgH1HzsT3lWow5WpXzQzSRZLx5YmStWXcHuELMB2biP
	WY
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr12554569a91.1.1795671672145;
        Wed, 25 Nov 2026 21:41:12 -0800 (PST)
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr12554548a91.1.1795671671671;
        Wed, 25 Nov 2026 21:41:11 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm33365160a91.14.2026.11.25.21.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:41:11 -0800 (PST)
Message-ID: <238a552a-ca4b-4997-aecb-fdaa278ca1c4@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:11:04 +0530
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
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: bod@kernel.org, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
 <179561294019.462348.12092000419789488599.b4-reply@b4>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <179561294019.462348.12092000419789488599.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07c678 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=CZpgSDYph55k4HqUXiUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ay-a4Qdzdvcuf80gRtbpA7OseWLbWe9r
X-Proofpoint-ORIG-GUID: ay-a4Qdzdvcuf80gRtbpA7OseWLbWe9r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX0GzW69zYs/tA
 EbI2i3kbuGNrZ6iN0nX1FMOAIbGlYhLOGtmFu2yzwGnTqVUuVah6UnUa91Yg4JOmfGUIzd/qYcf
 0FKDj1e1bIV/gaf5g8aopHYDfCQxH+C/dy2hih4EBjXvjwcFd14jfS4kjE/w6fLixwJyKaeMoXg
 mBYmwkmeDrI1QvavWMXcAcJLPWl7v4S3L7uxOeMaT+mITQRM1rkiKWuFeU9vMrdC/S7GahCFUK+
 vBgafaOLFTHmjKSUDfwgPUsq2amDVHO0tXH4jsQmeuEBvdkdVjTpaFHnPMiDybTC/YdXXqhWPIS
 Dq1wTGKtYZcmHdgMMrwJ555HMRt3TywjSInWAZiT59IT/igOvb3oM+STA4A/vw/AVMCdYkerCXf
 Tnwxzjj5FiBDV9/iMfGP2Kp4qp7qjnjYyZoj+ioOXlffYGKgeWTPQaBJ7Od3RtG+kcxYjt2bTq5
 1W9isoYUk155QOdq9eg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX49LKxcCp3xja
 9bYrddz+kTyVx5zb5tbDt1WXVyDPxbPNY1g9n3ZT1e/Ax+aNkzWM4QjNQYWAdDc5u/4w0Y1BX1P
 M+IJerkW48EyNFlJnKflMOa/ovoIFOM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260021

Hi Bryan, Vladimir,

On 25-11-2026 18:52, bod@kernel.org wrote:
>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -16,7 +16,11 @@ description:
>>  
>>  properties:
>>    compatible:
>> -    const: qcom,x1e80100-csi2-phy
>> +    oneOf:
>> +      - const: qcom,x1e80100-csi2-phy
>> +      - items:
>> +          - const: qcom,glymur-csi2-phy
>> +          - const: qcom,x1e80100-csi2-phy
>>  
>>    reg:
>>      maxItems: 1
>>
>> -- 
>> 2.34.1
>>
>>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

This series is already present in the mainline tree:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml

I am not sure why it appeared in your review queue again.
Can you please review the follow-up changes instead?

https://lore.kernel.org/all/20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com/
-- 
Regards,
Nihal Kumar Gupta

