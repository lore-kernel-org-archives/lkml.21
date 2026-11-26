Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680640;
	b=Tzq2k8nMmQ2QuwpvMUMD2tr/RtH8IZr6SNoiIF9ijpwRruWv9B4RP1mUuglWJIAK8PUc
	 bvUOS1riO2KDUtleH30fjGnX8QjeZgs20ACE6ppKNiDZOoA5oBMsU5eHQkx099HiBQzhh
	 RAQF0YscS0/Oc+lor4Apt2jMU1Y7qKaj9+Du0jyy3udlKof/l77f967f03aJiaZEz3oQA
	 w99++5XTZzzgXQCd5fTBkyRqkl6cmkwtkOWS3C1pZHuCz3Lt/BnC6hz/vZJ0dN/Tlqivb
	 gS1+XKuXSaWQTK6JjSk0b304uD49DtGVf4zlhIBQT/58KmmGOeOy273VeQvCV0aeHOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680640;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0oVx9fVa/Ez2JCk7hDN3JGdH21S3GTSikiE4w5uLcxw=;
	b=BdSvkPoa8ZK4iDeEkxHhkMNZu/3Pr3kdt7xzUOLXuWSJsKMm89EKtlzhhfS+Zhe3tWp8
	 jchNKjMoH2fxmXbp9gZfpsWimendtLj8fAN8GC3BXRtyhhPooMIrPi6+mXIHfT4e1/PLx
	 pBUBE++zKg1L/+v60FpGGpFCUGOBG2Q3bNJrInaHoG+Ho/Wjs+KH15CX3dAB0g6GqFuSo
	 t+TnLNXoMdInUCW7Xh63TJc1+jqsViDxtjZae0tIzxXuLgF5xZ5wr+E2Hp57FM9ORDdi4
	 MMJii3tPJ3czPrFR2dD+VowQaIQJYk4gTS1SaF4jNfiDWvrnixnZQ2nNU4iz+I+MNWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NULVhEWK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NCFEVhfd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08AE606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08AE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NULVhEWK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NCFEVhfd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AxsQ2175636
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oVx9fVa/Ez2JCk7hDN3JGdH21S3GTSikiE4w5uLcxw=; b=NULVhEWK+n351rO9
	hK/XaDd1CtJHafsb2Dfzg6zjEsKxtiInis3B12nCQivv0UIs0mp5HRmEqokAhz76
	qUKy/zNvgYcPvN3cdzUN08MnVJSA+QCoyzMC7MIjhQChhVIfOUHvDD+ZVR+rVrvW
	uaOjcv10GTDZS1nLlzbt9GvOkVJkw8rppbFy37XskcRKJt0vDjK2f62uMhL6pNWW
	JmwvCEc+vqjt/c94uyevhCLwqvRqMBYrZDKQE6TU+UpHwJnBYLsqMwEe9JpgtmSC
	lG5S60Ir6h4sBciyHsSFR9VraknEkRhYeorTMcbOi9ByMTWQs1Lq0T7f6Ye7U4Yl
	ewuwkw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahudyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:10:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so5071338b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795680638; x=1796285438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oVx9fVa/Ez2JCk7hDN3JGdH21S3GTSikiE4w5uLcxw=;
        b=NCFEVhfd80vqV4PJNKVuxORQoT2TtZMjY/g1NcbraW0OLgqXKkqx7E/tLqSBoKanHT
         pAjYbluulNInC9unPVUil18G6LztJlKmaaHVO22Ix7BFEmZXOCjIOAnwF98nWGHTi2JJ
         utSXGVl9xMtFMsJkzBTqJzsFOi2m2n59ud02/NfNAsdZrsI3qgXaivMO/EssTcDCRZis
         Pi/Yh0WFwz1jlQ6eNvxKP27eSxGmA7JTstZ5pknK/C9d8bGQjZh2i04DvgDzdeP46r/m
         6SPgFqiagI1NLOsq1QJHTE22Ldxz0UFNcgtRz7daRW0Xui4m0XD+UOcRe9xSOn8THUip
         G8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680638; x=1796285438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oVx9fVa/Ez2JCk7hDN3JGdH21S3GTSikiE4w5uLcxw=;
        b=nUaUACMHpU6i1aGuiEUe/vn+O9YiDB0jbgziY+WKujJhn0C/SLyCSj72+yPhOxJTWi
         z3m5hj61kyOZjmk+KqeEjETr7wdW4rBNMcqwQMYgX5pjEiivalD5dtAzRxxyRZW2CU9U
         KIarvXG0hdO4ZSG+6zM5TLGRcv9Z0eNWhEI57m3T3ZAP2vP66nq59NHkzIXUYFNrbkiJ
         +ofDZ+no0lguGp16ogXbdKvlRYPb+NAVLBxysF4aTP/BaPteGLb1HEUJocLo1FZaM0by
         WneTQFvuO8SA6niJ54QJeNzgi6gakWndee8ejEhD+nHXtvEZ8qsYT8sXVgmpVlv+Vxnu
         RIRw==
X-Forwarded-Encrypted: i=1; AL+hErE0lv9U376phXlahbM7H45F5dCiSAvVVWumr4RCVWm4CfwTt1+PVGE2p7S7Dw9w5YUInLMoYLWntp7BSTU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8A4l+Sop+CkIluWlOVha8cZf7LLHT9lnF+jSSkN20WmIQr81j
	NUbljI8qiDDR7AuqVoVgU9lEm7U8l1LJ9I67AbYqydBZutioapQchXaa9OgLq8HPBsCIAtnyRr/
	aH0PWNiYPrU5OUno/2K6KtrfYmvUFW1wuS8qgL56br29cMJwj5GSVCvEqVJAeQfWv/RU=
X-Gm-Gg: AZFdTZcTtAJK5MdeY4bTWPYaoaeS1XRelCXORyMdvoTdJ6Isj1pi4EFc1ojP9Tozqlw
	/Qxh8DdF3ijXDg1ni4wSH9ggM9C3enPSJkhOeuq+hGoJSZcD4kZUKJAPdkiGgptvuUnxhAZsWBx
	nCo703Q7Ml3DDIGZj8VfX3z2IUVGp62lDArMFL9tsWhr1DDKrwHCxGQJEVgAxgoQlJxAF3HbcNB
	2AsNELhxYbIgG4SfoJ2lVxz4sZ1tyBJA80dkfbOW7BlU5xI/xqGz9M8PMCntxiEUD5JdxGHN0E/
	hoUTz7F27KG/yf3RIVyziNoE5aLC198dt61jMzRYtcEJmSU5c2gbEjB6W6ZMo5GZHWPYGEi/dNk
	Ljt7TjqPLvgy4R2RFyvxye59WiYmemeKqzbR4LBHbFVG49yODVfAk8bGD5RLAn+yVTAVZFFCG7q
	3G
X-Received: by 2002:a05:6a00:610f:b0:886:a737:e0fe with SMTP id d2e1a72fcca58-8cd9fe59529mr7520568b3a.23.1795680637703;
        Thu, 26 Nov 2026 00:10:37 -0800 (PST)
X-Received: by 2002:a05:6a00:610f:b0:886:a737:e0fe with SMTP id d2e1a72fcca58-8cd9fe59529mr7520535b3a.23.1795680637227;
        Thu, 26 Nov 2026 00:10:37 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077fe3fsm10675771b3a.4.2026.11.26.00.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:10:36 -0800 (PST)
Message-ID: <1c294545-91a1-4cd8-866e-49989343b01a@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:10:25 +0800
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
Subject: Re: [PATCH v6 0/3] drm/msm/dpu: Add INT2 GDSC power domain support
 for Kaanapali
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Danila Tikhonov <danila@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261113-msm_gdsc2-v6-0-17adbce47220@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261113-msm_gdsc2-v6-0-17adbce47220@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ejzko_W5X-S5nlPtBGxVhvddpKRDdksg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX4m4UDeok3UeZ
 33QtZ0olps3D63x7oaCFShcV+xHNX3IQJxImWhviLWanwSpja7JKwc4hn0VwtXCIK5bvimtqrcY
 ejFCKM6qJ4KGnLF56pt4znY7AtVXSUc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfXxLRJpfBLkNgm
 I85zOU70L0NdyYZw7jV04y2NFbcJXxFXvaEiJrn7aGLckUpUdhqFSjN7yTxbjuXqZwT+fUI9a/k
 uHplk418whdhQVVi2P/Ze2QjW9ezGp1cOdWCt1SFlOA1ouXtwkbWYgUK70UI0Lt/ErlL/JQYnZy
 jKHX4BglkO7FF07+84FHqw0JnegWkhIU6FVw2/u+cg6RtU/jDK28dBZV+ouru/yiREO9fziz4g9
 CjNc1UzJJxxMxzenBy0nYwqyPfdD/C7UzSppWhpkSpeYZKuJU2NfL+hFr+UeZWPquWwzTLwNx5f
 udvzFcynh8ME17SHquvjscUnixMbidwQdwugN1CeEtBV6I6dGI8pDjd1YkXKG6IpWPwxxNw4M6n
 OdZSopG5KHNkQ59IMeJgFtqdwl+KFSf0SgqPiYJP05hqD4xLoTnIPAquzq0rVRPAKG4f38dJi7Q
 VzHw9ly1SC3cuERpxSw==
X-Proofpoint-ORIG-GUID: ejzko_W5X-S5nlPtBGxVhvddpKRDdksg
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07e97e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ipgrnOdMhYEg8ZrmRaMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260031



On 11/13/2026 4:28 PM, Yongxing Mou wrote:
> Kaanapali (SM8850) has an additional INT2 GDSC that powers a
> subset of DPU source pipes (VIG2/VIG3/DMA5). Without enabling
> it, those pipes remain inaccessible.
> 
> This series describes CORE and INT2 as the DPU power domains,
> updates the DT bindings accordingly, and explicitly attaches both
> domains in the DPU driver. DPU performance-state votes on CORE
> are propagated through the genpd hierarchy to MMCX.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
> Changes in v6:
> - Drop Tested-by tags (Krzysztof)
> - Move power-domain-names to dpu-common.yaml and drop the redundant
>    'required: compatible' (Krzysztof)
> - Link to v5: https://lore.kernel.org/r/20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com
> 
> Changes in v5:
> - Use 'contains:' for compatible matching in the if-condition (Krzysztof)
> - Move power-domain-names items to top-level properties; only constrain
>    minItems in then-block (Krzysztof)
> - Link to v4: https://lore.kernel.org/r/20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com
> 
> Changes in v4:
> - Keep the widest power-domain constraint in the common schema (Krzysztof)
> - Link to v3: https://lore.kernel.org/r/20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com
> 
> Changes in v3:
> - Replaced MMCX with CORE as the DPU power domain, keeping INT2 as the second domain
>    (Dmitry)
> - Used generic "core" and "int2" power-domain names (Dmitry)
> - Propagated DPU OPP votes from CORE to its parent MMCX domain
> - Updated the Kaanapali MDSS example and fixed issues reported by dt_binding_check
> - Link to v2: https://lore.kernel.org/r/20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com
> 
> Changes in v2:
> - Moved INT2 GDSC from MDSS to DPU, as it only powers DPU-local source pipes (Dmitry)
> - Dropped Glymur — only Kaanapali actually needs INT2 GDSC
> - Used if/then in DT binding to restrict second power domain to Kaanapali compatible only (Dmitry, Krzysztof)
> - Dropped PD_FLAG_NO_DEV_LINK, let device link auto-attach handle INT2 as runtime-PM supplier (Dmitry)
> - Link to v1: https://lore.kernel.org/r/20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com
> 
> ---
> Yongxing Mou (3):
>        dt-bindings: display: msm: Add INT2 GDSC to Kaanapali DPU
>        drm/msm/dpu: Attach CORE and INT2 power domains on Kaanapali
>        arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
> 
>   .../bindings/display/msm/dpu-common.yaml           |  9 +++++-
>   .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  4 ++-
>   .../bindings/display/msm/qcom,msm8998-dpu.yaml     |  3 ++
>   .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  3 ++
>   .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  3 ++
>   .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  3 ++
>   .../bindings/display/msm/qcom,sc8180x-dpu.yaml     |  3 ++
>   .../bindings/display/msm/qcom,sdm845-dpu.yaml      |  3 ++
>   .../bindings/display/msm/qcom,sm6115-dpu.yaml      |  3 ++
>   .../bindings/display/msm/qcom,sm6150-dpu.yaml      |  3 ++
>   .../bindings/display/msm/qcom,sm7150-dpu.yaml      |  3 ++
>   .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  3 ++
>   .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 23 ++++++++++++++++
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  4 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 32 ++++++++++++++++++++++
>   15 files changed, 99 insertions(+), 3 deletions(-)
> ---
> base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
> change-id: 20260720-msm_gdsc2-cb9230027a2d
> 
> Best regards,
Gentle ping. Is there anything else needed for this series, or could it 
be picked up for the next cycle?
