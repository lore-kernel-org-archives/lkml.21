Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704760;
	b=ryOA2ALK6MDGnnkJk7RWYdUEooONNLqEf3KRzUdWsi1NVjivq6NqMCaRM7LmGmalXj0x
	 hMEH/ghbjT2klEKfdrnbgh1QY6d27fwwrN78M2wpKmGc9CxgOvorbquRo+indmcN6ysDg
	 zLvTW6/Y4evbbxyKDaZNOj3tz/MB3mT8FN7E1yVi2K6eljDJYBcL3b8HPVObmbbyh06tE
	 7IRymhsH8eQbDmpW3hScifV7stgOVJJ5JvehMlTs2kjvLjtF61A86XACIR+cbm1caji9h
	 Wlp0MNFPRczMFq3ccZSqIXPExqSMbknjcxj2P1w0lDHwmcBOM5b6lo6u+RHB1e1mXdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xf3LEdO0EiNsvgxXyr5imDF61aHJP1VjThmwM4QJGPY=;
	b=gtxEq0xmRjbjvOf7xH3wqja0Oc3WQHbL1xyoN/sV2uFjqJDED0g2IltLpqcMGtOCP11r
	 Bc0DqXAoIRx4tfAu9OpOQGKKJWHtj5cZXncc6YvsjOWf2XWKlHReIPk2HyPwu9NiUN9Yw
	 jpbeA9AOFipPS4FpdNe318pNbsHmvBi7Ow5BMOY5ShkuD9Gd/8e9JW+WLkFTG++L2mrHU
	 gv0IYPkMyxKhB39JhdKbJ/11FMkP0bh8lgRTFcwyW13GFeBvVrmi9hoc+yzqycPLcFEkp
	 287wFvEQAP6EEHkM+1Jq5J1Zxi3Cc2+kbT3aa8zebVWl9axu8Svf/ezmA0oYKe5SHFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AI3Bw4np;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fso5GcE4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD22606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD22606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AI3Bw4np;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fso5GcE4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVv9t1022140
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xf3LEdO0EiNsvgxXyr5imDF61aHJP1VjThmwM4QJGPY=; b=AI3Bw4npSU2oaWtt
	G55jW4G6xRjVrK9rstWXiuIUDUWauueM1cSfY7lyiPftN9OdUiTlFa5ameJvY80B
	+B32cV1RFuzvNm6ve4tBQ//4bD+in7UN29gTT8qbqkv+Gw4D89J2lk6J5I+jXxo+
	olo+Qkdy6vkXPVD7Ek4oKSM/iSTx0nTfRh3ld6+h6U3UhtsI4gZYCjqVkFVKtilh
	N5okf8CBNbF6FRaXv9nTh07Y5jU3VGFYcJT6PU4ol2wlJ2cz/6+TlBdVD06txpr2
	hiErXVOpOATPSNjGUSr8ekNfGxJVnQIeCyLV09X3ceSjTyGW9bFbBoX8YxZnDWnM
	UnVGjw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne1g7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:52:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso296863e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704758; x=1796309558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xf3LEdO0EiNsvgxXyr5imDF61aHJP1VjThmwM4QJGPY=;
        b=fso5GcE4xDq7wrTe7F1sR0CT17LTvMyniyT4w2Ftcv36mZBxfdGSyI84DuGs/fBNKJ
         YJRudVYzmKlNagJ4VjGJzPJSPLPvSMEcyaxKE7mc7TfL7N8GYvsjC8Xh6nnM7KLWNelh
         eWfvdKhrqPWgoIk42VF+qEnF5SfzPRjjP79p4LNtlNB83qgv3zhg7ickXstmuw4F2nhn
         GfxGAjSYVmB+q+3YRE+CFoEZwtvKj1SsxtJAZ3jeUhGzDw1xKCaZ1im3bgqJ3+8SFbA8
         r92ybdb3OkjlwYYIgNDJU5alVbUQ9257a/MdK9eCRBxNgk+Z08CnG//5Dm+Hn3NlUqcd
         NNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704758; x=1796309558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xf3LEdO0EiNsvgxXyr5imDF61aHJP1VjThmwM4QJGPY=;
        b=xQdLuo/EMzknKjUXO1qTLu7zjCYAzZrUj48rX6TKyAK/KSohKFHpRN8X0Hq0VEuytb
         H0eV71EwqVV9ZtXZXsF+Q09X+0ysJ+rbR2OsaqMmir+s+mtLyb/hGcu6i4ROMG0QQ253
         cPf/N4dRu/eN4c9GUYVGE+kBrSuGqmPZ6G99fiIb02FfLd75a+37CCZmoKuZ3RmL2aKY
         +n54MQGglvi95zQ3I4oX674rZmYf66M85vjuLCSgOv6JHOHdi2/2SC9e0dr/xgBWe9Eb
         il98ncxPKNMxyDfxNMm5O9woM4kQfdfxzlMy25cGvuSHibiENVgM5MO8uln4Yfecj1HM
         /BcA==
X-Forwarded-Encrypted: i=1; AL+hErEaL0JPMVCMmoljB+NLcIAKrOBeB0TBW6FNPNQ9zZEt8AAwWw+F4hsmcuQW/YZ7ZkvAWjjVSIQsmaX6em4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AYv5TSmUDGTkbNw9+W4Gfnjzakp1EMp1olq99DhHUlKrQ8170
	o2/5GOzggnMRjxtvAedYS1LAgv1ml7tvIjGsYS9scA9hS63QYAr2alTB0WMsmhVY9ev1/6Da5rU
	+LELZuaBlzlfGNnPhL9PL5fbsKdVKRNfxppxTast0RFWlwj1MyZis8V2vEDXmB2Z8HRs=
X-Gm-Gg: AZFdTZdEqMvkLio18hF8+g5EYgyFH9ZA3E+pFS30s3Dzv+/mn5KqyU0RQYcGbnNdiqF
	534aeXCT3fgGSvsdqAOyDq4EF7N2PD2nHCRrxMu/CeIiS3X4jnIDI5DbY6+1MGzmvxuJNoR7ieU
	z+LvBVcQ89e1LamwxBdcPJZKz3x+pTis17WtIlUQf++k/d/zNozh9V00sr8IFRgeU+CN0VSnAR/
	V3UPxyjEl9MEqT/AzDppkR/LdhNXBCb1O2AsRpujAVLzo5q9MYeCqCW1UtcINRhG/MBViEwhp32
	kt5cuPAxuch5tGGfkNXw2eLyrAiwLSbpcHVOylkRAI5ftwhF7UVObVMawBzkKwkf67fgz9NUYUH
	h12Cx30kezlG2GwuEC3hi3/IgUnJZQ/wbI9dTSFo0BjVcb4p23VHCquem7/1SVywJQJkqfaM=
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr18380989e0c.2.1795704758300;
        Thu, 26 Nov 2026 06:52:38 -0800 (PST)
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr18380954e0c.2.1795704757878;
        Thu, 26 Nov 2026 06:52:37 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba371072f6sm9871519a12.28.2026.11.26.06.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:52:36 -0800 (PST)
Message-ID: <0caa0ffa-edcc-44a1-94e4-cd5ad52eb80b@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:52:34 +0100
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
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Add rear
 flash LED
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-3-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-3-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b0847b7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Mq9dOPq6Hou_Oe_0EYsA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfXxed4LNRJMAF9
 Nqky2aE50ULKZ1KxJkRoxpY19tSKT+Ic7YkUvNHa9YBoQQXmrZ9/uj76g0wNjmtmeJc2W7+u+wO
 VV/TC3XbQuGFc3IL3zKn91L5/zTDgozCCayMmIW7cLnS4M94xf+g+BwuKnT5RQvSWQSSO6SJhpy
 o+o3cAXyL6Phlpu4kt1SsKqxQNI9PY/cELJUOxdqWk+K/os9NnaYO755qg1pY0MiRRS7Ug35Pt8
 8VxMUPw5DIJt/er0beHdHmbWAXBxrNvlxuHGNLX4aFBgJCWL0qRm+wBVAJx8BQaPcptHK77GERE
 RrnmBQ8h0g6alahaSJlPtsLLUcEm61rrPowyOIJBJjZwD2j9wlq7bp3dxaT9sJ087XN7IcxheZn
 cbVHaHDwTFsAKoPHYFGJCBn4j5FpRFrO8WO6JtZA23khMpgn5JLcoDz1whyeMtIzCBq9KoS2KCk
 MuaZyX22M3QidWF+C3Q==
X-Proofpoint-GUID: BEOOKt1mnwNrL5WNsmxYRtxjzZHNuEZK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX27HGCDG2ZlN8
 O2i0+Y+M2WVEnBQGlqRT4VgRrIOtXkHPF7DQP6mGz1pBZ6p+f4O7LOJGUFWmnW6vvHDMEmipiHY
 5ml/Ln8UrGv129J+/D5stg4VQM2OFuk=
X-Proofpoint-ORIG-GUID: BEOOKt1mnwNrL5WNsmxYRtxjzZHNuEZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> The rear flash is a white LED driven by the first two channels of the
> PM8550 flash module. The flash current and timeout limits are those of
> the vendor kernel, and the torch current is limited to 500 mA as on
> SM8550 QRD and Xperia 1 V.

This comes from the hw spec of the connected LED. Please consult
your downstream DTS to prevent potential damage.

Konrad
