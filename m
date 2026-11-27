Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757890;
	b=rFniXNwIJFJjhVXqBNAmrNWnr1NUVDPiS7+/NfHCfS8EZGjiDw2lgMSLMb2VCvj6QjJY
	 ve+TjSwAuUO5PaGvr9FI5POZsYtCf3Q2MkrLmICW+2la+vZMN7M1S29EtRCIEHrUvRe/O
	 V3GghdOnaYsZ4dOcqaN5FC2MapzUG/dt1TW3rQJZysCMWOa4StLffcDoHvKSySUPAyMCD
	 ZFftfXGGkqA4OUBhGywnErPFfYw2fAUUvVEE1KKw6is+eLD3GBJm8eoEfogw6CZvUUW6q
	 GaThAdrqHqqimMAswbj8tiizsumr/Wp+volMir9OvrzJ3EmLSlFLtvtRY2lAxbkkN2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Owb0SJ3ZfgyAlnfXWgWsY7QF3Ejq0OG9h/yNLoECbZs=;
	b=wz1qzQ9ZSrSyE02dcBRAzUzTOTk5R6zEHSFXcYAHcFRJOJNoezwz0/kM4qXbAuRSke7u
	 13Gpjgyr4E6ZCHN6g9qm6FsPE/Yc4ustHR2bj+4fwcvCruwTOCKaLGhK5byG1a738+edn
	 hJ/vBepSIGO23D9Y+MuvnxNDDcctWDGNlNPSg1509OeiivTcbAhXLksqehzTMniLffL5M
	 BkJM98VPUoPiux0pCPkEPkRp+7qChXW0ctwa0ehjGROqj6NFsAZhpBWFgLnG3Rnz7lTgo
	 FFYuS0gckYVCvYHEhcQ2A6Ft/4cPhZxTnyThJgXQk4FtvtB5bVcm53XE1NHQ2Tdzadg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBaCu4fo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZ+5j0s6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEFB606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EEFB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBaCu4fo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZ+5j0s6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwP2x2574565
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Owb0SJ3ZfgyAlnfXWgWsY7QF3Ejq0OG9h/yNLoECbZs=; b=lBaCu4fo6I1f0hp/
	9m0DXSBssWM1gumZcrCKWjXEhx4lFammqAoX5r5Ct6t2qWv9IvQGxqF9w1Xfp17t
	xUDN4YZCR4uz81q1x05mCTmS1BJLfO2C7Brzr0rcSh1zlmF04VKtX4eAp9gEarYj
	bqt47CE13uHX6W5bsYiXPOYTRojsS9OpyM6y7YHfUfT1VZvZWN72GFRotJBK+sxh
	zDvlqtKMtYYVh4LekXeZBVtXeYYkeOZWZtTs2deyc9oalS6j/MZ/nmC5uYcKrqc6
	Vqj2NKCFPtX88jsyFXeMqeoeaKtCmlvXPAGttztbw921f1JK/v8OdQneMeKHLE56
	G7d23A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u499d8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:38:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b4232374d6so10314965a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795757889; x=1796362689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Owb0SJ3ZfgyAlnfXWgWsY7QF3Ejq0OG9h/yNLoECbZs=;
        b=cZ+5j0s6Bw+cijAnbD/1oQ+VmctASDRDfdwOupth/TZ+ZtGDgzgC7qvLJlbL4bNHrd
         URCKP6fuj771aHw75KYZ78J8h4uj+hCIgpLiVLIlIyxJhgxTLUpSJeWyFNWh1fA3tKB6
         EY/asbP7VinEqV0ZSsM9rHuoKfEKcHF08gFAwggoefJ23K5YlBEqAj8Ba9ZawPzmXZ2s
         /8B2P1DIcW45vyvan4YnZ1YZnuyqdxaLaQ7GybzQiH0lQvPod7AJjHsGTFBQi2gihTaS
         ZN/0sC0SMdxAO3fUA4XNmapSI/aPwF9kbSiSVWG4hitmD41cfirsMAUIn1ewceG9eM/D
         7gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757889; x=1796362689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Owb0SJ3ZfgyAlnfXWgWsY7QF3Ejq0OG9h/yNLoECbZs=;
        b=pg28HBIzf6SaCObrmEmimWsQeT6OPqPCrAi4l8yfS4DWwDXKeDdUQKeoYE7hulzOiZ
         lnW6DjQOkUYuoo8pxIG/efYoAWrcjVH8Wa+0rwXHVmYSTVt9gxjIyLk1QMnFKVdiBHun
         L3EbYDfyrK4IlsFLHiJ1GSzkbmEaXgFcOWPFOxkSF6h5s+E63OlpqMQeUAhBFQ7Vv7Uf
         QhYZxE8LoLyaZ7QeAXWorduUOj6M+H9woKwWmGBQsVLSpPVMl/Mqj6VDJIVnbefW1sDV
         LO22cTWKTM6BgG0QTi5l5vp7Ipu6gAEolchJrqdrJYRqCaNmtujj8Qka1KrZVe1b4W71
         HGGw==
X-Forwarded-Encrypted: i=1; AL+hErHrow+mwVfVmebfsDQAKd2JNAZadLAb2nlTmV6g5huAiF/L1qsajyoSdz5tjryfRRRWmG3ZrjN1tKlH3aU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kKlOWfgLW1Cff71GCUPEecHuUD+68NyDzA1wR7oBurMoFo6lU
	UHd70srgK4cpxouCW3P523H9i0zhfnO2EA7cZXsE16ovwQGRkSsLhtM/IzpB+uPpnXluwarhgiM
	UaUdhfBELTovJ1FY7hiBX8NeMqtJobAFtKdcpI+jaSsCYNdvg0KwoJQMp2oqssrV9K6g=
X-Gm-Gg: AZFdTZcCe9XyQ4ln5TPrYwQciq4Cz7OH3GFzbV1fk4R5obCPUXb7Km+zOTflKWmQ0BL
	kye3jlCCR9Zpp4/W+pWZH6cRvWUfYeY8p2RPSZjUdZSSM75x94oLDocJ83zVcdkV6TMLNvKRHHz
	z6/PmaywNkgdPOvxP2o7RfpBGKGPb0mAdYyq4RzzwSREyE2iehQF0Wj6IC5b0nlQ4zkkAxB0cSx
	hmmKJEfxcoQPpRuZge61Npx702NvlPs5LEmfUQer5QeTvhnJeMOSdV5JMzGCuC01cErZgNKHnlG
	XoC3IpKKtQPlAH+wLBEZtoIvBwgWn9OTZlqitv3uqM21r67z699RP8AyBpTgLb0758dTOJMrZQL
	UeumfqWUGz1XvkXBja6vyTgbxg2oVfc4zyXHnm/KX+B4IgbHrblokyVpH1VLOLmnm6nbipTlDF+
	ZKA23Z
X-Received: by 2002:a17:90b:2e47:b0:3b4:a63:d56d with SMTP id 98e67ed59e1d1-3b41c7e119bmr22968546a91.1.1795757888716;
        Thu, 26 Nov 2026 21:38:08 -0800 (PST)
X-Received: by 2002:a17:90b:2e47:b0:3b4:a63:d56d with SMTP id 98e67ed59e1d1-3b41c7e119bmr22968496a91.1.1795757888236;
        Thu, 26 Nov 2026 21:38:08 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm38855983a91.16.2026.11.26.21.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:38:07 -0800 (PST)
Message-ID: <ce0b6c2e-e913-4c8c-9acf-7bbd443f5fb4@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:08:01 +0530
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
 <20261116-shikra_qce_fix-v3-2-9ae31470ef48@oss.qualcomm.com>
 <5cde45d9-40c3-48b8-8074-41342d0cc11e@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <5cde45d9-40c3-48b8-8074-41342d0cc11e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z93fzOQfnTfvU8P_XCnByPAYR7SGnBDi
X-Proofpoint-ORIG-GUID: z93fzOQfnTfvU8P_XCnByPAYR7SGnBDi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX6aXOMXEDr5pv
 XFaSd3XO6akWoW3zOUxqUMOdeoYijPjnMAGn5fusVg5fcBBXy9aEVg60SR9PuuJANzqpGSPYxHR
 +8BV0XNz4jI/7AEBBneRBfNz1rIj6Ls=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX7XOw1lIVBQ4R
 6qKEns+yrkQCuCHUv9hhWkA+y71k4wz9QTabUWRrxn36g2cACHQmbFwYjSPZ9mQTXV15m3hqp/6
 lTDW6g2/9xLqKL9uGIj/DIoaG+btmlib43Pn3+UCaf/HPu8qoeo6DhUMb2DPCS/DbKZTSxzyRU0
 4G4Ow8/pFEMZHvRHk2g4ofS2g7tMqETlK6sT4RQmvpILQoqG2qe8bBPNf5EQOStIAeNv5T+UB0e
 WTO0aA/48n1kDiqO93SgJznYv/q4lsdwVPRU0M9u9agIfKl/h7cstitWrTmyOUokhtqX3ItPIqP
 Te0A9PZJKVFodBGiDlxFAINoGlF7bu50Yx5rGBzPeD12b9x5YBIhOjWK2xxDawnh0e+kDjwi2bQ
 uus2ERUNZHuXJVua658X6CaCB+Y27F4hWLWRWsp5Biy6lNNW1OStifobzacBCJ4EePiKIqe4BKS
 1qr30atUCwUl8aAnjCQ==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b091741 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=YcclnU47V90UdgMnL5QA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270022

On 26-11-2026 19:46, Konrad Dybcio wrote:
> On 11/16/26 9:59 AM, Kuldeep Singh wrote:
>> Shikra QCE requires an explicit core clock, which is missing from the
>> current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
>> and specify core clock to match updated binding description.
>> The crypto interconnect path is already described by SCM node, which
>> votes for MASTER_CRYPTO_CORE0. Drop the duplicate interconnect vote from
>> the QCE node.
> 
> I understand the need for the clock, I don't quite see what we
> achieve by removing the interconnect

Yes, interconnect voting should happen and I fixed that in v4.

-- 
Regards
Kuldeep

