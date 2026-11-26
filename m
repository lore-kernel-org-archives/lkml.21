Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703404;
	b=E1gdLzG2EvlpVKODlSn9C+bnO4q0VvU84+vsUdhTMqCiGT30kJiT48iQ+CnbGacsS/d9
	 ejIvSSDbKcBjpH6psqBIZEIsVNmDwhJO5Ds6f+UZxuxbnzNfiKuWM50ntQTaZoVDUBNgY
	 X/QwyVsgkUvCjMZjnhmk1kdxeFNYmioZLxcbEuIFlP3Lmc3NPAvS4T4J5WfoX/yFQ+LGx
	 +WmmgNtd4iGARukYjDLjKL3GBNfF00Dgv/Epo0WpcpULmMtzZvAZCyMipLzIuL92s2CQp
	 fIaY5qWPxN8FT6mEHff95srqXsofKHMyEk9SmWDQvA33OtrMhOxOoBIvbrGZ8U5TaHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703404;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZYKSqpNm7JmeDVDfHCjbjXW2efJm2SoQYSo8R7KD5hY=;
	b=VkxS7yt/fQqN+DQE70O66kZE5hvISk44XBJj5h7sHH5ICTzg4jfFTbVGrqgRGGWyIXm5
	 xIWDjh+BpXMz87Z9KK4HOQ49bMT4m55djD7/uCFdqdHA4LINt3m6+PUi3gj11FCJ4jNeD
	 sIyPGvAtRqd7kaSfAEymQQ3AV4Op+oK9CIIzA51WubEBPoc+720FL63uI1eLeX0L62y2Z
	 6/c84YoTMeh0yu8nag+q1f3QKuP73+FY+vHOv8kQwX3n65BQruy3qytXkcH9CpwtJq780
	 TF1NuqN9zTI3n9kgItD97FfPdy3glic3Sz0CBeWT0sTA3fQkIaaC/Dm/QoTBoYISRjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLQJCho7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXWn8OVu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F08D606A692
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F08D606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLQJCho7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXWn8OVu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVMjC3893631
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYKSqpNm7JmeDVDfHCjbjXW2efJm2SoQYSo8R7KD5hY=; b=fLQJCho7UC8UCfin
	bajE0cFg1J/8Pw3XuXRvnKPdu7FNMrJG5Crue6GGgTXll1dlK3SyvSOE4Esg+BZi
	/1pIR82MvIbclgjYxvznLpFJj6GpU+/1Z4PXPwQT7mC6w5tWNIn7dao2jZ7VNXyR
	JW45x/4cFUDDYvCOoJKvuzdZrTmCCfwMN6Xv3P175H9n7UShF0BVTCCpmJaQn4uD
	Zac3qSfe+cS4JAmkMGlCIyGK9i0PUpG1wM4j9VfNniLHkKc9bP8/B9tnI1h1qyfc
	33i6SxLCYKSMIZvPgQ5FuM30lm3EGm48p8333M248Iih7dxFtyFENs7077KFkAGx
	yCPMLA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm816ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:30:03 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8635f8ae705so309436a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703402; x=1796308202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYKSqpNm7JmeDVDfHCjbjXW2efJm2SoQYSo8R7KD5hY=;
        b=QXWn8OVuCOIu9WD7DSH9yQCOnFipNMk3z3IlqwXuBiGLi3I/ANAZLf876MCv3tB1Ic
         QH9snTgaRGec4Xo5y0wruSIZlIbCflnjZCPwsXavEcrBwm69k6b8d3zaX8yAo0o2Xrb5
         wuG+e1IoCfyG3XY6U/TDpX+E137d1Udc59MG+vMq0Yftlx74/XILXMXFMW0cIjdlTLNG
         E2+D5R64zMTIoy1HSWGkrg04AG5PvsVQFfYJw7RFFr898u/HgH+LJC+48UgzQEFVtQXJ
         G2WFmzc3OqZW3965r39frGMXMp+KKT95bL3zIhp6JUKK8Iw1kBq1b/iA1NVrk/gvptoI
         /pmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703402; x=1796308202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYKSqpNm7JmeDVDfHCjbjXW2efJm2SoQYSo8R7KD5hY=;
        b=BhyDW1rQOUgot7651hw+iNzYz/xwmnhlqSh0OCHLG6C6yjeN91Lbb7UGAiIXobRxIP
         MHpyRyc1B0CA1dKTvQX/RX9sHyRJ7M8eA8+eWydlJA1z4stEY4hfu5FiuQi1Z+eLbrQs
         aQ/cdTpTsIKMVkqIwGGrwZI5JRxXvIapJNIaUmKmKV9zwsDPwSlaoZzaUp/klGv0wqPm
         5esQvVYR2bjce8Yrw3+arG06ls+9rJFIxjouDLdtTZ0RaPEafpUijXZO3H0kTPWi2T3k
         vfLwzbsZAUxY3r1myMzVgyrvsfRhdiE3D/vUrNnUqQsX2ut/1TPsY3n8GXDLa7EiPfdx
         HNvA==
X-Forwarded-Encrypted: i=1; AL+hErF+77kI3W2umhjUF8sadsACqa/Ouooj9CEWBdrW/gu6c/WJyfmw8K5AyJoOs44qiZVNkaMfunEYOF32RZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i75CrrrQuINEEGy4tl5VXp4F7526MQPdtky0skmuJk57hEzdL
	OTBMHSepVIexHX8h6uihqaFTMRhIdOlgosjo7qOYDjkTPr/O0419D6RMFkzi2mrUkqoJFfoOJwy
	aa0qJcCmbuKrT2L5cSIRPBPKGBli2M5nb08Jr/yu75sD1ERnDEzjUwbUykluHqS+WkJDW2h1emb
	k=
X-Gm-Gg: AZFdTZesZyYElCSM1IEn7VcOUMepxzHolCIltFz4hadbZzzv1JLVMhvWk+0eZyerhF7
	6bhZ208hyc6UFyT93N7lQeegq/pNHdR40xvUVT8SFwV2r9FeJdKo47pRtwbpXbOIVjITlXlblFT
	HeiOwhNTUBfk1xlqtAHBfK+cRMyYq+kEtGUDhCLZUNIycai+5L2ZH3BmoNK5jYZ6DK58gI2DsT/
	eFum77FVs3vUDQuj9A4hMf/TYMwk1zG8OsVGPz46wTDuxg+0ygq+fynS1X78UnuJnV2IWfg341h
	uPJHWsQ3qt0ovUaNcze8EDoPbUSGjzN/bEegL8vt61I2yoW06nrnp/9VDUTz3uAXuivDtDbjKCq
	DV8ms0ubtWdtMNDpKRIyfeded2Ch9YAo6BnhvoZNXuSyC+IFYjq2lwBEzqJq6Zec5p9+gbU8=
X-Received: by 2002:a05:6830:2a88:b0:845:3cfe:5f2 with SMTP id 46e09a7af769-86314ff95bemr34000792a34.0.1795703402166;
        Thu, 26 Nov 2026 06:30:02 -0800 (PST)
X-Received: by 2002:a05:6830:2a88:b0:845:3cfe:5f2 with SMTP id 46e09a7af769-86314ff95bemr34000765a34.0.1795703401810;
        Thu, 26 Nov 2026 06:30:01 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea28f4sm782697166b.33.2026.11.26.06.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:30:01 -0800 (PST)
Message-ID: <56ac1346-3164-4418-a00a-168323787535@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:29:57 +0100
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
Subject: Re: [PATCH 4/5] drm/msm/adreno: Add speedbins for A660 GPU
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
 <20261105-b4-sm8350-gpu-v1-4-a7175cdd6512@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-b4-sm8350-gpu-v1-4-a7175cdd6512@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kMRbLcnQWxu8LDb4YzoGbItyrwK8Xkg0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfXzYuW3MboA3b5
 enKtaNcnaNbz/V4BuITNhSSd06Q0BDyKeCoY1vuiMxm6+77wujJPM8YUVGjEHoOtIM3rC53KWu3
 hxL77zJbnuHiMzwBsV8H8eo6+BQIUbg=
X-Proofpoint-GUID: kMRbLcnQWxu8LDb4YzoGbItyrwK8Xkg0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX1zfuVArJr+HT
 KEC9KIiZFaK2+iC+IFWNymT6h4g6LH37FkF7cjwVL7YucRhg5GpIEaTLNFQBdd+TJxbc7ZxZ7cC
 KpKH/yeiNLLx9U0PwcW8lHzQylsZd0z1A2RcL0mgq/JWx3CI7C6W+Z31NljGKkj7tJYTvkS6wng
 VVvKZm0F/4kht2KcpvZUOBIvFHmTotCmPBIXbnERm83NiGarU3Sb3M594NdMOXRl1KGAevb+Mmn
 eUKk8mMaBD2XLwcICqa76OsXnrSXgPkFXI+wF93nClgIzf2ZE3UwEaKx181qA6XuKqioiubw9CC
 53Pd9w2oa4+Qpi2s9zICN6CczBqCuACTUI7PpJdX6lNzFmOJ/2a3gDfMDk/o/COwWtnTe4WYeoY
 AnPgjfMAy54YxBVzomt0KZ5CMPxmldqOGBtx7LOStC7PDD00u5B+CEVRTgykTfpQDU26BYnvIlm
 ttQSZoPBtHMmHTaPW/A==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08426b cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Tt5JBQAfAAAA:8 a=LR9blauW7GWGG1yPYK4A:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056

On 11/5/26 2:30 PM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> The SM8350 GPU comes in speed bins, read from QFPROM 0x17b bits 7:5.
> Qualcomm's GPU tables for this SoC give:
> 
>   fuse 1, 3:     up to 900 MHz
>   fuse 0, 5, 7:  up to 840 MHz
>   fuse 4:        up to 738 MHz

I only see at most 2 bins, what's your source?

Konrad
