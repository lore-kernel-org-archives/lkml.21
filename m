Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705307;
	b=Cp2itRnASeOZIzynby6lZtx+TR5nDIQtIFzVLtzbwD9TLMch5n1HpzZ66LQsZuFzhljj
	 6CHTfkNXx7LHHjQDz2pkpex9oddQ2luxtOsRlklh4kIA1/o+PRL1RUccxnqNaQITYWIAr
	 FMS/T+gPVldLPBO+u/tewZFJBGLKtMz4S+c3BcvKn6hGnrztJAbYWpOECP0jLuA1lDww2
	 fwwPD3RcFq7eJKgX3x+HbqmFoGP9Dv9160TA0X/Vnkl0ww8CZYDgXoyJtVN8RkMCC/aOO
	 A9NwO5ketPE+zuAMC94j42IlrPBgfnQCAXmNc06oKvOTtStqOtmstBxBMz0I9c/D5Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BCBvJWUUzh4EABV/c2ZfxvfD28hjPtQ33YkZR/isC78=;
	b=Cyiq2raUnSUK2U3jPeIlwWlYHK2nvbJP8jvGepjMgnIJ+uAkwdMnExxGSjfOwypi13HX
	 /83+QZrLjCJi9UwyTLhRFiI/eMUzW1R/yjNtRnb7dFN3Sq/GgcNXQ6nzwprCe7orutYGY
	 fsDyz1mobQJpbzVNCbX6mHT8CB2++T841AF01eHsL3wC+O2p18jdToHFkL7qetcqLxIeF
	 ZqP7/NPgfiRAQHCeQ4aMzW4UONWMJTdjUSo8IZZZuZiy02M6JVJO8PqtJWrrajGkxlu9l
	 2XAeW8bNxIxn08Mch2fPU+pR5uWiRzzr3sxO0fg8VsXp44buUhknqpubbTSUFzzuRsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWclrFBy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cM1leVt6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764B2606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 764B2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWclrFBy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cM1leVt6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV5hm3664840
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCBvJWUUzh4EABV/c2ZfxvfD28hjPtQ33YkZR/isC78=; b=lWclrFBylEkYJmnz
	uQqsbH3qxDtNpVUljF7B2i5IowP3/Oz5hHlLqH2U8Iyjwo1ACDZJplStp2qvZkyY
	zBA9II2Mz9JjOZQGYlv+5Z6DuuuBpaanwklVZ6x7e/++ESCfR1/Laypp6cMYICX3
	ajwQ4hQXebB8lLxGlADQnuWmKjmzAsREYHp7ecQW79cKIGkSlndiYEFMaDmRicVL
	TcqeI8UcjjWNIoTakZqg3iJTrQlVoIjWRbaXZ1A0PAZhogBCX9AOnz902WUl8VWR
	Lk46w7/BeCv5eKvATozGYNgNfetjve280PVTyMjT7zXWV1v2iZX+NFXNEPOAy4cn
	VJvQ2g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g9dhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:01:45 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so362171e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795705305; x=1796310105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCBvJWUUzh4EABV/c2ZfxvfD28hjPtQ33YkZR/isC78=;
        b=cM1leVt61HZ4VV3DoLtiB+baFd/YUABW7QazNIaiArAaQ12dDZTeKtStL2UqwY7OH5
         GDIz58YvKpRoumvSKRj83IRoMyrKu/GaGlU8isWOKnYkBWRb2VM6214/Kjm098/HrBlC
         77pLAdxoQMPdVFzpnf9SXpXfvP6MqkRF54aT0bFB0kFYM+GPbHJCBwK5aMip/VqpQkDv
         vW8CUEysjNEumNq4Ub5qRrt0UCVn72HCCUZVd39zntCSewwXIKpnvVik/wQ6L8Kq5MhM
         C6pB94yj4otSTSLr8+jnpXssGPM9UDi58RUDSc76x9B5cHst0vJurOEOBIlts0UTmxgp
         EbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705305; x=1796310105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCBvJWUUzh4EABV/c2ZfxvfD28hjPtQ33YkZR/isC78=;
        b=rWsp0WGsBw2c51hEF+EtWkUCatT4YdXXfK/glT8eFbsNtnRKIWoxTK2kcDmnnKD1uS
         J070geFViICeXeQEDwVmRaUpq7nQEG8lsqxQMK1IWNVOVsIJ/2g/sDp8Xnny+RYzI/tq
         sh9a04JNHHe1geu3pBptPGLSz6gcvJFhdBPg1R9mKXjwBRBYnM6NbtKiPpiFnKqaA5Lq
         fbmk2sw4bleEZQl5Nav+5V1SQnMADyHhwrYXXaUSjQNBZJZHPBmhF/roq5g4qj1cy0mY
         XXim+Ltoqn3Or0x7CKQ9splev6SUrTjKJ+Zl7dix3QR+3KmJ9MthLjK5q4Q9kZK9O9wQ
         qFxQ==
X-Forwarded-Encrypted: i=1; AL+hErH0dQHuzdvLKCwN3NZ4sUOqmNm7MxWZQohQROrfVv06lzZmSLQZB9iwQALrycHmsw5NF3nDdzXZC/kOsFY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/409vPy6LYzfDxQ1i0D9RtLol70A9HVVV/BCa+/abbxCXXOE7p
	pytcWxpnQ6LV3DvON4HNkPTby+cM9EkPW2DXB2zEKrX29flMcjFIIIuZpYq2ApiHPnOnGIR88Ap
	j1s4ePKBFP1oL5mYMMeetsXzu/apPqsPjC0xRIPzcPaXew8fJ8oSUKIsdfgkXViMAFGk=
X-Gm-Gg: AZFdTZeWHK4iGzB9dunJm163wW2wQWleAljHbz9ir0/ZgsdVr5BB1QcFUA/nRbLHRbD
	Zh04g5TkzLHVWbIwfYjegEbKnFyG65N3g29kENU5QNsSkhBCxDccxZHYwr+8svDTpe8bcl6fbmj
	X/U/2RyDDEbWdr9IfCX3W075GK1MHcUlaSsjj0RuVDABJAm58Y3hizmMDowu/4HNJpqNEYJk+LU
	LftZVMJ1HK6liwIn1aCg3eSra2+hR+GeEZEuZR6LOMGuS2IcO3K6C0VP3mWgbwuQ6au177Fir77
	1+XMrV52kxXGwOA7lJMAhO4RpbpLxevFLp2FVXUmxnG7GoPYjaJp2qVc9apgGmP5ZaSZ0IAysry
	Lm1RaKZ63GWarQkyDisoWfv1z7jH6GNqqOiFWorEOP0dFQrTFrjgx0KkrdV3pqfSLCsH5FCU=
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr13275377e0c.5.1795705304728;
        Thu, 26 Nov 2026 07:01:44 -0800 (PST)
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr13275286e0c.5.1795705304183;
        Thu, 26 Nov 2026 07:01:44 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm790932366b.4.2026.11.26.07.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:01:43 -0800 (PST)
Message-ID: <00422583-53fb-47a7-bcfc-f517b84283c2@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:01:39 +0100
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
Subject: Re: [PATCH v3 06/11] drm/msm/dpu: Fix DSI tear interrupts broken by
 adding INTF_9 and INTF_10
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
 <20261116-nord-drv-dt-v3-6-e3d3bf0e2c49@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-6-e3d3bf0e2c49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: s3BcVYFv_ZGMXwsDVe88EQ-MY9mgFYOl
X-Proofpoint-GUID: s3BcVYFv_ZGMXwsDVe88EQ-MY9mgFYOl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX69fvX8n8M9TO
 VrOJSOXNQSDaoEe5hhfe63xADOU5IAkEp4WeIOrDSpniPZED4nYYsm4tvW2+9jkvk8XExhEG4FK
 kGQLk4x1maFXEWpi0yaZViojdSH6iKAMKr6UPph2mT1DSj9p+uQtusDrdFgFsAa+MfjSoYN2z2c
 /BFweXS+69KGkF5eUaAP9pZyD1n7MKSVzuUK3udaV4hskRsOgplJkmTz3diSx68LIhGp47oIK3U
 avsDBO48UK1YsFbHTfa2q4sD4Pz/HbqTY44/aGHeLjM9TJki5PmDgY901C8Rx+Rt6uGxyDBflrn
 7xjiL/tN8AGwb0Lu7hDChVOfmw5YnqMszlmBPQQSwovLUx/2xdgNbbpM1cuIb5Quy4C6gYJ7rwg
 x6nWaARBT8vMwrqZPlqrMKX8am10IwClplwLRLE/sxDsmN9SwT23nyXQ5qcX9e1G5wwZwlEHXpm
 uJAkVvaWWUkIG9YYubg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX/ZeqLBR+Und5
 TFmWBoU9tmJdXWugGjUJQuq/dTj1f/mqkI6v3yr+3im5fYX5rmYmp8Y+hLxHDuGeZ5zPxpmLNfZ
 RXv9rzIigXh327/8D44hMxcGXqkG95k=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b0849d9 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-NiRQLekuLvWmI5UBGoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/16/26 2:16 PM, Nabige Aala wrote:
> Nord requires INTF_9 and INTF_10. However, enum dpu_hw_intr_reg relies
> on all MDP_INTFn_INTR entries being sequential — MDP_INTFn_INTR() macro
> computes the interrupt index as MDP_INTF0_INTR + (intf - INTF_0).
> Appending INTF_9 and INTF_10 after the tear entries would break this
> assumption, causing DSI tear interrupts on existing platforms to map to
> wrong interrupt registers.
> 
> Fix this by inserting MDP_INTF9_INTR and MDP_INTF10_INTR before
> MDP_INTF1_TEAR_INTR and MDP_INTF2_TEAR_INTR, keeping the sequential
> block intact. Add the corresponding register entries to
> dpu_intr_set_7xxx and dpu_intr_set_13xx.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

The subject should be more along the lines of "add missing INTF9/10
interrupts". Then, the commit message should explain the reasoning
and effect.

Konrad
