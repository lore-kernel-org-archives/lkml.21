Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984806;
	b=HwP4mdjl4jyJUrgbpPrexKoXatbYkJcLZF4o8E1C/SaovPFUB72cuKr1TG2wq3L8Xj7U
	 UhmQNAemcpHi01lQnnF+D7oWYwk9xWzmc/yN3Ll9jMF4K+WoVijXU4zYmVS7qL3yCcAxs
	 13s2hTCzgcRO/SSMhjmgDWEbzie6+aVAopj8MeQgZqRDR7e1b041F0z+QCWjfwHPvZ8u8
	 3mIIyKVi4WwRaalvtrg4uMHqMDxk8S1Y66C9miITqjdsHP7iNOncqkg3qwvyjov1pF1o3
	 Se+Kbl7ypoofohap8qyHphSzd3miOM5tJuxRocO16d4ualeUn9S2iIeOoVmuxz33RUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=;
	b=M4Pn8t/f9kDPr6I2+13JVn7DC1CIqT11A1UjRdOGTz80wWG+vlmjDwY9Dh7vGgnJCDht
	 DcAZFHN8eJVk29kNogUjlktxWn82k615M3TJx+rQon94rkTkLl0K2pHzkkmSQ9ISs41gT
	 wN9n9zXmQbkxev42oblhlOTLG1967VS8MIJvWzlvnIEoQTb/4/O9Qdaveu6ixE4iW9u8N
	 UAPnIRvKnMz7RQSF6N4djl1jLYu3DPUoQTGg+Kjg+Pi+1a5XEDLe4pFe7fyArTsom/U/t
	 8zdbNTjhGbaZW1OziNknbPmzOTiYfECI2iJb+JS3+fZwi8b8L6nTMq9Tlp8Gzuh3CHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jq4DSUUF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JaLSpv/x";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED11B606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED11B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jq4DSUUF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JaLSpv/x
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Vf0U2107748
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=; b=jq4DSUUFY4qxxOrO
	4cjBLfKTqSfNpHioraIwZA/NG20jyjWPuZChQFn3SQR4So+HwXPSDOd6ShoMD4u/
	FBRMf4bqzW08Uj1vKVm9oeBvo71ZiXVA++lcNJMDKyYzYWrWybJMlWpKucTKl4TR
	hwFWWAdX/GCu1sAIT7p0YcbTzFopnUUH+4M+qQ695xYs52CxbYVb5DdGXrS3KHBi
	+QO+jA4KzQTGVXWUUTu+jXb3JPsRaalWmJNb/xey5GeCVTnUWgkmwQhJ7rbPVNoN
	NcODiE2NpxB20GUrxyBuji0szWjXQfcvxosu9G1ZEh4W0rf4CqK+bBPRsH1qp5va
	IpTWPg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8smsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:53:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso482993a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794984804; x=1795589604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=;
        b=JaLSpv/xrg2YmBQiUtFOPprkGLhsS3x+c9oLIZPMOT+H5ujgueHPV4DO+XHSRSkN17
         lH2Mi2frCktdNJG3/s2hHXfbC+VdJWziDr3YgCz5FaEJGQ8O+cdLIlNDB3DZ7rX16uJQ
         JdAufjmeahSAvBtWqWsbq4FK4AkV/PjDSarydRQFGZQTYX6eoQmwOhKDqkSn0Zdwm9Ts
         bUzYEslGC0KdWJTQRK/50P6Z1sSk3/fM+Qp6wi8Mer4/MQK007TUUDXGGdCse60fMYEU
         1CHx0KkTWLwx5W8MlRxu4woExnjfb1Al6vQlyu0t0ETZoXpuNqS0vheWW8N7iiODJVmy
         p9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984804; x=1795589604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=;
        b=JQ3H2mowRbcSGQerUsoWQ5pEZrPNGKS+B/ccxC8T3LTtzlrwmQidTjRsGvU91Pr592
         bOI+aC/825gEwLJmcb48robQmB9SXBxxPRCpXfrAYKM/2ro3Sijbi65/eFqc92gkLfch
         oHmojv6KwsIBlBn4nmr1+x/WiPBvORH3vDRAzm9U6oYjoV7Ym78/CO8wDhRSEjjubggS
         MpIAZ2VkijsFNzhNG8YMTLK/Eg9zfi60c/0nPZEG+cX1pe+V14F+QjcHFQ2QvmtLUb+8
         NZ5XdA6bGY4Jx4MBJhQbyF0T7qILowZhlpV3pwkmbTtjo83Cg32//lRATSux0gnTN1ub
         bwBA==
X-Forwarded-Encrypted: i=1; AL+hErGSF+QKei3LILVvQ4b0nvqTkhAg2ctj8URf4CQqfyQC13kuAHBlZ0JtywFfzFdHx+2uSsjS6c6RSYPV9sE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kfvHIp7oO80xLiN9F3Tg98a0SFou91yJfl0fSoxwOxeLCjPEn
	0QkKT9FABZJC+euME70lyzHoga8/uZfMgX8DEqhN4A7QB3T89ixpK5ByOTIkcr/qXYcITw30yEu
	10eCsOQFXIhiOVvo46HPa+1LtV5NCDj43nmjccWJj0goIMhyHDLCTO/pUyhQDdgcZcRM=
X-Gm-Gg: AZFdTZcsWBKLHgzLCvUDkd4CHEX6uIGnTNjVC6xt+DdOWRnWIls0MIRYodpal/Sv0PR
	jxuFlOWTyZRkzNWfkr7n2kciAqxCbdYiNPhP/B3VZxgnhurXKt7YGLhxVkv4j0HHGNcg3yuSj1q
	MBT88zUdSFFVIFKHFwbpK0oVNGVJvWhOFUTgs+MeSlMf1d5QFOkwg6xmO3go0kyqZ9Szf+n/Gi/
	T3QS2mhTNHgfyQxoeK0yfW9m61a7CtQCFnt+Janyy6VdP4/rglUVYymGvpYr2S+aD72MzHQgP4e
	6v5XEUPfyJ5lGmhghZtxrmVmlwMi6Je8xbLHBinQM/gzc/YPXO4jUskI2U6wDMuNgntEGo240Lv
	tMVgKjAxJxARzVhe2JSkslRCfwfafKUajMj8Jaf/Gs/v0d68uXqqctQqj8PlZ+sbciEkKEsBtBF
	zL
X-Received: by 2002:a17:90b:4b12:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b3d07a5319mr1630655a91.43.1794984803742;
        Tue, 17 Nov 2026 22:53:23 -0800 (PST)
X-Received: by 2002:a17:90b:4b12:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b3d07a5319mr1630645a91.43.1794984803323;
        Tue, 17 Nov 2026 22:53:23 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4ddecasm7774110a91.14.2026.11.17.22.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:53:22 -0800 (PST)
Message-ID: <10c3be7f-f329-4612-a7bb-c033fab6f99e@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 12:23:16 +0530
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
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
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
 <20261117155208.wbnm2hldjrfomryh@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261117155208.wbnm2hldjrfomryh@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: df7UeVSNHTMmZFPHXE7mpjJOvxQSewX1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX8QkJEn17OUSG
 wfuyWyTYn246NQO1YeyfmshttjrYA8p0h6Vx4slkoOQ+5ERRQAxOEzU2imjrtqdBAgUiz6/JHYa
 z1to1ZQrV3PprZPLqgEVJH10KD3+Cw0=
X-Proofpoint-GUID: df7UeVSNHTMmZFPHXE7mpjJOvxQSewX1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX8lcsHvol7c09
 bfpz2EIaRXlc7bOqQgduKk57PsHLoIjknhy67F/glCZQIqCHsHL5XpvboGWcu9I+0H0z6d4sk/C
 8BUuaN79PBrne4nU6jutyM0WajBlJ46k6BJ/cZdsvLlC5OtIKylOnrp7J5CZcf5A7RlnQcyoJjU
 xE2u+vqUyfz0dfIi/lFhguIi9PVqeDD55AE6kUtf3pNxjl3V0+bmw30CcI9D1IDFmRKrtb1LdGQ
 cKM8YV9AqiXlf6ixQwzepWs/YbX4fKu/qErEiJNgl99je1AnDGEhUBcMYUQX2ZBLCfBIMB6DNCF
 hI75ehbDJ6arTSGPFhwxd++7im++4q0WioZvGlckRTc6fd9LPr17vfRgy6CijLVFpuVlFuGMMK1
 eT/3m1w457DNBatB/dp8q0rtIt/THQlJFtK0aOSsou612dhogDG+ieOWl+ZDtGBpVFaySA2ctP1
 iMXxUfzQhdEzh5WxkgA==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd4b64 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Q45aZnUg8FDEnReNsB8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

On 11/17/2026 9:22 PM, Mukesh Ojha wrote:
> On Mon, Nov 16, 2026 at 11:58:20AM +0100, Krzysztof Kozlowski wrote:
>> On Fri, Nov 13, 2026 at 08:02:20PM +0530, Komal Bajaj wrote:
>>> qcom,pas-common.yaml limits iommus to a single entry for every PAS
>>> remoteproc, which is too restrictive for SoCs whose firmware uses
>>> multiple IOMMU streams.
>>>
>>> Drop iommus from common binding and let each SoC-specific binding declare
>>> it with its own limits. These bindings set unevaluatedProperties: false,
>>> so a compatible that does not declare iommus rejects it. Declare it for
>> I do not understand this sentence. Compatible cannot declare iommus, but
>> anyway the bindings do not reject it.
> @Komal,
>
> Yeah, this patch should prepare for the 2nd patch, so ideally this should
> be a no functional change patch. Any constraints change should be a
> separate change. So, ideally, this should be removing from the common PAS
> and adding it to every SoC PAS YAML that inherits qcom,pas-common.yaml.

Ack, agree. I will update this accordingly and keep it as a 
no-functional-change.

Thanks
Komal

>
> -Mukesh
>

