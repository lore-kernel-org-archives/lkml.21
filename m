Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600059;
	b=zWC7tMH1aHm9yxg5/VeVBSZhDmT4okOQEnvyW5sB5ErwjH2ftHARtiUxjPT2p8ke4BRE
	 mCtyIkvAnzBouOT858SkSAqw/hYURbvdulNP+dfgT3rpcgAKG1HMDDR/tcvJedcN4UgMw
	 87d7Yh6IHxaN9HEQPkLo4/SX6HeP/zGU5D3e15grM9LpI/eN+xhP+yuUV85CSFIlAlNMx
	 eD0BPQKf+g+WTSD0OTodyMCbyFTYb5MR4oP8nZvWS9X6+KkhhQqUrJGy99xowhO/yJlhn
	 o33MgmRm3D80JO3y41ICyCanpefldb6SIEAF9a1Fr/tD31KQsnWJoXWsLQIXTAJKlVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=;
	b=meNesGzpqLX+901deKhVXB0c2yttU3HrqEsfVgFupSqpeU21ivkj/TlGROqpSDfg90cd
	 wFjr13PUStLKGmnBWmTxgkbHbYfIKWHdncPtgchgGdCTqUnzrWz6KAOrCuIOZQJjF96bH
	 meEMR69fG79wAWZkMq10B4OLG49eufxieOftMsVIRtG3o4ylXXArd8Z1qXCZZPGzj+Ht1
	 Uin6WKVxgE9WuSr17W4E6C7k5mO73nK166gqnEXQP7MmJ19IAZKGW4RkeplqgODnR/rSf
	 z/NCuBYKGKhhwDPY+8smNVJFvxHq3nFuAk9lh8ub6DY4BFv29oIeHbm3k/nAifBXSVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Wc0v6/T/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I8o74it+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664A8606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 664A8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wc0v6/T/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I8o74it+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68k2w3143002
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=; b=Wc0v6/T//zOgi/kV
	Dvnswvuqy8DOPsBRut8jHdj3lf8SBHw6Rg0jgoG39nISG6LcbRjYmnyu1EJcZqSH
	RvAtqFrd8xSy5lWjeeMNwT0dQxT/SXjKgQiFmNtnuDCBHDLdJgX6P03eMcPztGXF
	gBtD5LfkQJmvmfUJshiBwB+BLEh4RYaxF1ZoHWQeqx3c0ColoeOu1gLqD7Po6pO9
	rKGZGxTY+4nimE3YIrdBL9ONTqZhofqcq1lRb2rw45FKJ+OCtPP26N9VqzN2wo7X
	+8nxqSBYlcTeESdO5yjmQ5lrm34BhNLrlgxG43TMejfRbh2DiR89GMmb6ocD2owp
	2LyLgA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2a69e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:47:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386c3309469so1762551eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600057; x=1796204857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=;
        b=I8o74it+Za/xLr7v7u3b9UCBNHYvaqdZBN0XPNAkSR1gb01DqMMstfX6KwDpTOFpFw
         D11qI1v4JU73d95w+UNCl5qt6mOzhJz/Z1W5I7aH2ialqUNCYe3yB5x+RFyb6EcgusnE
         iB4E3qAF6VKLu6aunshk6TQDFDhBHnck6XwWyLSlXYnnTvTjbxBvXbZBk3NVs95/WU9B
         fbsLv6EtOBZUe1F/Wz/Ll5h87JgpmU0VpuLZGgTM/YXRi7iALAnUnj5Bxl5deFxpGnSo
         GQMZfhRNerbjAuZ10hudgK/Fb06Dar2spy/gewdBlzBs0E/KKHaBHz8VHoNsiVwB/0x6
         iKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600057; x=1796204857;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=;
        b=2GL0UiL9SaHxlGHVVZ6zHjWo+g5cRUxXe2/ULgt8ox6IFMkcAJZyofanEjvQa0lr/m
         XBN0ewaE4+ojn55A8uvcvnoWmyu/BQC8nscjevw6ApzjyX0+A4fSE+e8+2DewNru6pHL
         jHP2YeLQaPx6lmx2Gi2cCctxjjRzUASYKzTBcoE/8/qJPYdJG9xJQqotcMEC+RSIyoz8
         1TRIm8043DEtEhtDTW6nzk1evvLu0sGqLx35cNwaBRBOsCczS7n6M+ypSr9Udn0qMkKz
         yGOJZyy5AuQcAaVNnKsmmiHZRY34545hgQ95Fly40BhppxGlzDED1Qt22AT2Dc+PR8CC
         l0YA==
X-Forwarded-Encrypted: i=1; AL+hErH4sAx9hA2d1XVtPJG2WQsf/IVCrWBZkkH2+T6rHsHt5beFgDz34gxTOVHJh4g+jUpbxNvMRvJ6b3FQnaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BwokBD4hBokR62SBXaxVhkqAIZjP6RJ7dOYID5LsCG9OitQRI
	ygdEazh7LRfEzBEXqcO3x2z9SX1S/Hnb5ao4hSWeCRefttB6JZ/Fw8X56umbiXJ4Eu38WAYGjdC
	pzzDGDD5RDnMdgkhIEqv6rV6jMCZbJHqPxGj4f+nRJ+OW48bAV70+5tZbeyk/dXtvXTo=
X-Gm-Gg: AZFdTZf+MRvg+7kQNLCDSMk+/oZLhc5oVGmlR771+NKunWAJT9cekgAsKJ3Tks2tJie
	979/BVWH+PaBKLfpFZSBlFBLRVKMWal2cZ3pGfsVqs7nhcXjeaE3wnj+AKjfnWuKpORdYfo5ggS
	ULoMId79S9ld8kpFxd0KIjAUZJZFyRr4DaPmGfoajz7lUjTm0znYMd8g7RnsKaFjwk0xFtu0GCo
	G+q0rh/0tnGOj8g9hu2tFnhm8uOrOnc1g5BzpCqiEoJlEoQFEYDqwHpzc7wuRsTlile7re7BmDM
	0t0uq0JcGDLOeGEpaeZeLVEO+AC0DGtrFaFkbL1aIiXpIrdNIkQOdMozlPoSErKBc4N+OTocExk
	R6e/TtsuVlLQ2NJtumQXhD0zCFBhc7nWIb78YdjaXdnA7MVnou+8kUgLcS3HWsrWE8hD1ZP/9KE
	G2bufIyw==
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr20788263eec.41.1795600056872;
        Wed, 25 Nov 2026 01:47:36 -0800 (PST)
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr20788241eec.41.1795600056302;
        Wed, 25 Nov 2026 01:47:36 -0800 (PST)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm54307397eec.12.2026.11.25.01.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:47:35 -0800 (PST)
Message-ID: <3cbcbde4-39bc-dc36-72a6-b5171ee6730c@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 15:17:27 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v12 2/9] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Content-Language: en-US
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
 <20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com>
 <20261125082430.ekstreufyimdwhzt@hu-mojha-hyd.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261125082430.ekstreufyimdwhzt@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06aeba cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dg-V5EUWANZTljz0_-gA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: x0X_bTsI9Mrptw7nA_L0MnfL-_8Kkj-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX9nFCP8aheSBG
 W3e0V40k1mhDQffxetszPP7JSQKz+I64blZeUHKCf1KJN8eAoMmzvJn7+ZhOj1uufFYhY5lT9ty
 teXep2LdvHalITr3OAAhQJGORcUtLOhkLP3YEhM99g4ZWD0sRrnR5reHNd7WVBmZJ7Vropazj7F
 KIro0cEtm/1ZPhpb0u1UtiG+eVg+kQ5WcRSJ4/QnnKuWxLd+cZrpAi2qNLS/BAHTdPc3seVIaq9
 5/nBzSxmpc2VkKT0zblf9FkMjs6IDFpEKybzTnQ1hPZe+8nI44FRNSOKjozbOMqyo7TooYEsJBH
 5tyoS/6owsycmHQIRQYrOMQCUSf/6Qk4qie4K65+U9q4gyuLafs4BH8kzy44vTpexhXFcKSf7KA
 Wyo1QnWQ8zCc/b2Iv6xWoz1Lq0Xk+Wbc8K9mQ9NbMnarXu5bBjeBeDgDi3rIsVZeHPpmWdIph24
 YXjp8Wd5QN6swTNx1KA==
X-Proofpoint-ORIG-GUID: x0X_bTsI9Mrptw7nA_L0MnfL-_8Kkj-N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX2UGblsEjtFfK
 5cnlI03GDFnHpK5DWBOpXb4Q6iRjvVzKuXpTcR0Fl90GL+e3OD7XmXr02gebjG98v+SsZReXpL2
 8A77naCe7edN0c1uy8XXkWIH37KI88U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250038


On 11/25/2026 1:54 PM, Mukesh Ojha wrote:
> On Wed, Nov 25, 2026 at 08:54:09AM +0530, Vishnu Reddy wrote:
>> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>
>> On platforms where a hypervisor is present, all Secure Monitor Calls
>> (SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
>> registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
>> (PIL) memory region so that TrustZone (TZ) can access it, forwards the
>> authentication SMC to TZ, and upon return maps the PIL region and
>> triggers the co-processor bring-up sequence:
>> HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS
>>
>> On platforms without a hypervisor, Linux drives these steps directly.
>> The SHM bridge infrastructure required for this is already upstream [1].
>> To isolate firmware memory in its own Input-Output Memory Management
>> Unit (IOMMU) context, a dedicated stream ID (SID) is required. This SID
>> is specified via the iommus property of a video-firmware child node in
>> the device tree. A firmware device is created from this node and mapped
>> to the SID.
>> The presence of the video-firmware child node is used to detect whether
>> a hypervisor is absent: when the node is present, Linux manages the
>> IOMMU directly; when it is absent, a hypervisor is assumed to be present
>> and these steps are skipped.
>> Extend the Iris driver to support Secure Peripheral Authentication
>> Service (PAS) on platforms where Linux manages the IOMMU, by creating
>> the firmware context device and performing the necessary IOMMU mapping
>> when the firmware device SID is present.
>> [1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
>> @oss.qualcomm.com/
>>
>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> Looks like it is almost two month after which you posted this series,

As listed in the cover letter prerequisites, this series depends on several
patches that required review and any follow-up updates, if needed. Since this
series would not work without those changes, posting this revision was delayed.

>
> So, I posted a series to move every mdt loader user to move to new pas load API.
>
> Please review this as well.
>
> https://lore.kernel.org/all/20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com/
>
>
