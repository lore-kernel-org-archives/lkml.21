Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027524;
	b=nzdJA/FzH/pW9Xbe9xOZuwA7RokWeTZ/4Af6aqRPeL6ECl/4aIg7JRONJALcruTUP9DR
	 l8cbfRwRtsv5nh+8wt07WFJBNbp7VfiZZ2xq5o1atHbCff0mUgxTipao1402dYYB+E38a
	 4jZuooyNKR4nd4J0W9WuRdkfQOCF+QJGLcjBoaQXDYgBNLK6edT+5am6adVmcqszUQn/E
	 61BKZtsudrfBhiQNQXmoDiyidgT4IhVPip/vh0rTr23nZWfzaeZxJ3nBj0whh3B07Qzgq
	 XwSxDuqQ9u2ukE0nVOdEpSvG0zUh5O4TMzBZpvsYITU2QW+duFsNQ3Al+gIukSAWLng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1OzZpcUFjpmG81df7E566yXplpxzc02RjjT/i4nIPrI=;
	b=uX3BbdSv/VJ5+omR2njEEpM1tlDRcsVNse6DSJYp4+QZlRnsuQu8RspFEKet4/8d9BrY
	 MtmYBh4sEcJ8WYu0QsyqxqinNzlrDN7z4z+k8CijXp0bSgJfLMr29o7Im8j1pUTpV6BOU
	 RceXFN+GSTYj+BCXw5R+5aDxtMExgJBGHysrFomtUpUNYBXBsMQZ0aBTvWALEebvVqB3Q
	 2H1H1+vjSTMlH6nSClTdFaMAkZRMwOprDkxwLA36N8+A2Tg0k2rLYy6ESahNN2FOdUWx6
	 Zu9XtD2RkeJICh7Y0fl5Py2OE63LItdpii8AnmA9BLeK2VjNgoDunam8VQxrgMEUtJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PZYjwBB8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUzJDpKb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587C660A261A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 587C660A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PZYjwBB8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUzJDpKb
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHG9pA2447068
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1OzZpcUFjpmG81df7E566yXplpxzc02RjjT/i4nIPrI=; b=PZYjwBB81Hid/zVF
	k6/+pAP93fHhK+aQIKnJKf29J7JdoNn062YzdC8vc9Zb1bEqqyvWIv4OJS+19vUf
	kxA90Xa2Kxu+qUUmG45JZcVby9g1LmyUdy1vtHGndI/RkrFOBuEevnhrfksLJtNP
	sMXO3znsSFtYYZHzFZFvNNO3y5cJL9gGK6w/YLoB+N9/bEPtXU3cCRGrnLom3Bzk
	rSl1HQMMQboo/cgac5Aua3XbDUBosOCQakRemjfNYA/yN8Id2TG74eHMSWZnM1wG
	nuHAX1+/tSjS+mbyEr4RXsG3CP3cykrVxxrZVLN4Aw/4IlRZOiNEldSC8txgj0/a
	3Xn8sw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3b8faa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:45:21 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b25d977b91so1398175c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027521; x=1795632321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OzZpcUFjpmG81df7E566yXplpxzc02RjjT/i4nIPrI=;
        b=CUzJDpKbNtqeH9naJI+ZY/tAvT08hLgpz3NRt5GoyKCHBplYWSb6ZWrpoAdxhTDzVy
         2HOUy1N/eBCA59toVu3qgP2n146b28pad7kiXf35iNw0+SK8YYZpMNM0wiAVpsx7AGLf
         FZtAVPvsqQ1J7CBkAyttIRMAkK7uL1IxNVY990piPVRjFc7+ppfb/zR2LHywcDoVhS6S
         APOidEjId3D8GgFjNxfA11A+IUeF7PNlqhnGTJZKqCmayW0MWlYa8C0SqZDkP2qR9q6c
         4mkflennufHBNBMDEdEZSH3psL7zv0j9E8/yxKcyi9sW+/uBble0Ke2YLPi7fC2uYddn
         HROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027521; x=1795632321;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OzZpcUFjpmG81df7E566yXplpxzc02RjjT/i4nIPrI=;
        b=dirCy8aAcz0lZnlq4Y07l1bzaoRDAw6nGE4yQCLPdbvIRiV8J1lmTxUeADVympVkLJ
         EDV5y0/dw2MUOunGO9JhKtkMlcfrXjO8GMinY74DU2IG13Y40M1QCJV7cFd5J0TIj1TH
         tHRl24U2zUfnxVWjrQ10g7o3DNzlQvdCwd+CDUcgJVbChs1eIPZfZ8cPqRwl8BbvVJ8S
         3g03tM14HqAqpjTNSI0LLFxz28L/dAnhuKa33J8VmP5YztcbOVYwWgUrwSvlgZ3cJrxx
         1KBuUNVkqIp5dzIOpCIyftu26ipN6aklzsLAQZyphAfl3F493ojkcYwOdp5ADzWoYBFY
         qq8g==
X-Forwarded-Encrypted: i=1; AL+hErHkQ4yhu+bjfclPrmHV9mmZNbtCEEuWpALzgJkJsPRDeyIK0pYjhg/vSZfp8QdW3qMIfHD4zunOCiQ6F3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pTfOAod9FVeAhpmzeBkUf5KpTkhUuLr74MnxLSz6+UCSCZR3R
	BUJe9X2zBWL1i5n7wSMsmv3n6QS4OOK2wguPSc+WXqJzUH/TC0/CeV8yPTxODJ9QHGIlw4IZLI/
	8oqtkV93KkF5LAWOUie18Eq3sG2MicFxkfK3gBZXQin+JHjNmYQR5y8qdEAbEGtsM2lI=
X-Gm-Gg: AYBFou30jr33upDMlQWu1oVEXwH634xP66N8BnzEAJEjCfivVV1Q2/BnsrQuymGklp8
	801TNL6c3dc7Po3zQKQj2yIi9uHIY1EQkepG+ciFAT1vLCLSK/O7QBGzX5V0feCy+2HvyC7hzEw
	rBKc7Ibm0BkTaI9YZtykzmh8c4Qm07rA8AGYac9fipZf/D88vNBXV/ijwyl4dvql2PHgupMclps
	eB0CB6NyCKDZb/BRhg1yPZMz3SkqdR6ajeilaONOJUTLswnY9WkmAMUQtafNJcRu6jrR8BDZm9T
	RZqLCkKNkkPiXfWrcPa7GckEej5Wgd5dNHy7fDaZsCi5zi4VvEWsRHwhxJCF0QwuRvz0ysjM7ba
	1WpUt381xEvzKU2rNLn3DB8/ToEDdUZOFesVcL7BleJZ7tQQq2dlJqDwOQU76jkahjnEtA5T8zA
	==
X-Received: by 2002:a05:701b:424c:10b0:1b2:6eef:3f32 with SMTP id a92af1059eb24-1b543d0c613mr3282685c88.37.1795027520257;
        Wed, 18 Nov 2026 10:45:20 -0800 (PST)
X-Received: by 2002:a05:701b:424c:10b0:1b2:6eef:3f32 with SMTP id a92af1059eb24-1b543d0c613mr3282649c88.37.1795027519445;
        Wed, 18 Nov 2026 10:45:19 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm12271571c88.9.2026.11.18.10.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:45:19 -0800 (PST)
Message-ID: <c495dc29-5af7-4abd-9608-43b0236c15fc@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:15:10 +0530
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
Subject: Re: [PATCH 3/6] dt-bindings: display/msm: gpu: Document the CX SMMU
 aperture region
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-3-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-3-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C0IcyTs2a0Oyntr73mfjrfsQXLpjX0n0
X-Proofpoint-GUID: C0IcyTs2a0Oyntr73mfjrfsQXLpjX0n0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX3MN3Tkruyhtt
 NpmOp4Pu/9uWbJcfvy2K5b2SSQkFxedsl1f/mWrQYLBOQFvVoEEVeSE3FkljqurqBYi5ZglbQvZ
 LcCDoAvPZzm4u3+8NCnPA9s7zGu5an0=
X-Authority-Analysis: v=2.4 cv=dZQVTnXe c=1 sm=1 tr=0 ts=6afdf241 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Rpd184sqDP2D46n30CoA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX9g4VbjMKGqJE
 VlAtQyrCLuSHcd2WVSlH8mURxiJLf3E0dmz3WLlvJjTXRvtlArIamdkR0A/ZJ+8hTiXuSUDCrg8
 hFDRyLQ1Lg8YhJSbJVNzvTahIgIzfAuWXaamewW9NvJw13kRjAcM4kEe9CQPHW17y5ZxZdzqBOI
 MLAyyhRXFqelvlkrgq+W3D9O4e1eI5/u/yp5um2WzCZuNqCrKxjaT6KsHye9F3fG7lpYHNFfGUg
 v34L3ifAyz97S11D2pzmFIFalTzzgeLy5SEbsZWODMgt5T9LEXkuVb6atXiv9qTrA3WdaDMQHJy
 s24EDuGfbPhKe1qiqe4JfDTsR6+Eioy0c9jeRkB4OidWF1ZelssdPtaivmzFxrBDa5ECbzCqM8u
 H2LjHer+d8pDJod0r+ebh0xu//zZskL7r32uAEkzGImqfn8KI0zW2TbtH7fiX9cFLWUXGvnmdkm
 U65rzPO8a8w+AUPGbFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> The CX SMMU aperture is a register block in the GPU. It holds the
> location of the GPU SMMU context banks that the CP uses for pagetable
> switching.
> 
> On some GPUs the block lies outside the existing GPU register regions.
> Add it as an optional aperture region, so the driver can program it on
> platforms where the secure world does not.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index 3c90a09febe7..5e4f3149839e 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -54,7 +54,7 @@ properties:
>  
>    reg:
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 4
>  
>    reg-names:
>      minItems: 1
> @@ -62,6 +62,7 @@ properties:
>        - const: kgsl_3d0_reg_memory
>        - const: cx_mem
>        - const: cx_dbgc
> +      - const: aperture
>  
>    interrupts:
>      maxItems: 1
> 

