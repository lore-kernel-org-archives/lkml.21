Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789298;
	b=CwykJOzytlrrFkpnqjvaRbxQeziQXk97hHa/4aOwa7nH12RJVI2kyQG4utQk/E7qj2Lk
	 kRsczgUV8VXg0NSbbiIIQ1wiJy+xU69Zn+oMONUaXKZDc0t0o/1th/qnJfuC02cvlX3D4
	 za5XpfEtTELwfL4JyVERWhOvBPXNvZV5VkaYTV9LK6VyISal7k2iRSxUmA0kDYjzkHbtG
	 6SXPSamBZ0mGCpfK/J4qAlJDBcagh2KmC3LtC7c8KRYEnyUxR0ICvoajmiY+LsJGj7lOZ
	 4fHLkcb3M7bSYr7x9aiLnSWxDFoBxp+RC2uhSfbcGSWtp4u6GEQF4N8OsSelxi1YjZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789298;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0hheRwFD407BGXCo4pbyWm1UajgkkTJck4QroOzyMn8=;
	b=GmsAe+lf/8rG7bKPC+OK6hjgMoNwJFN8VxSKFbjqwYRnbLG9rmLqV67Bxe4ZP2MRyboq
	 l1wsR42iAjIxgz42M0xXh9FVZ0mLhyAQU8rdZfhLn2qcLHj2o5fe5wH2Ryqav/AfPEVqr
	 Lh28s3y8d51IgaFH0CO9GWqmPnPeBE884uO64weGviDAP+p1N71K3D+/OJDkb8S1vG+/t
	 jcQBEeo4pZBCS2dqKF6Ja+zb46sD12zbIlo5dcb4+LZ2Fm0Do72o5pkDs5fgzGdYq/Wq8
	 31lmA5U2qNXH/gAQvwmvZyJ029Rw2pIFjU6bdlfjgnWwmjRLVhgBFJ8nu/Wx/gdeaMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X6kqByXm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFdgliJg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A25606A330
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A25606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X6kqByXm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFdgliJg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Shb2472017
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hheRwFD407BGXCo4pbyWm1UajgkkTJck4QroOzyMn8=; b=X6kqByXmxnmpb0Iu
	Q709ps0DBL+BlYlm+fYSmtBH867c/HQp8jSSzm1FnHZK+niMlNQcs83OsDH3KV6m
	Yj/19MSAgQCLZetRAFkoIS4Z2kEqnt8Mzvi4oVmSDaDtu/PoC0KojEGpKl3L64Xk
	XtvLc9zvOBHwyY3Vz6vpdScY+U1aHbh0k5X+DsIVopHmjEFOBE5Hta56MVT/EWMM
	QYrCx4q0LPLIfXIY9/wMwAy+LgmrHGKOXKdF/NYzm2b9KLtmsPKqUr8m64tuX/u/
	4YtTQGA+HklT/P4mDxyezWuGMbooITyqAmiaMapKIDrvqQAkJVQDXzDaHZi42o4z
	8LnVeA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gastgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:21:37 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-483ee5899ffso1279608fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789296; x=1796394096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0hheRwFD407BGXCo4pbyWm1UajgkkTJck4QroOzyMn8=;
        b=KFdgliJg6BZ7jxEg336DDHNG+nl5Dyax/a+3nUDLmNbRL4j1XBoCq/3zGFP7UIFqk8
         SjhSGkqsrYqCq9JAiZAF79QzuyVt5JvZLdYgcA37F++6z2BnQw5NRT1IOdjUNERmBPhW
         Gws1O+ZIG7DrHQarOo7BTjl3TNGPzxCUtyG9H7qdLdNv+xyhNG5M0gpsa4LvAc8U1JdC
         7XVumd7lQZEh3h+oWej5JC4OaOeB8HOLVQ9zulttZtRg2amvYqbI/2GljNRxAd7edG3s
         gNG9qE00+3aCTJBX6ZzlrHSYXUWJL31EceWKjiuNUWdfleabA3uqXMHTm+s7IXahG3Mk
         9gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789296; x=1796394096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0hheRwFD407BGXCo4pbyWm1UajgkkTJck4QroOzyMn8=;
        b=GsN3fXSHbEmc4J1+DpgVRhdx/X7pZyqTMvAAlpYAf14bCFGCgejRFmYIbRG7I/pe2+
         jo/z7paTafigo6KpDnrceL5n1msJNUWSYLaRTLbe0xyuSYKfIX62LTVPZSSxnvtl5vE+
         NWtBzw6wuKFQYuWs8O6DwuMPulrVEQULxxZXh7A9fc2g940RqpkNdkF2p/jMnkZVqYKU
         mVI9qiK/2pITEzFm3kXX9BmClnoioV1Yhxq+Wz/5mjPRN+ytiXnzxIlI61Y7NQNbJaDU
         SnOMeRfDIe9cPXwjhdQX/fFAoD5A9moFcCYQ2Dl2gRnDGM6TChh4235aQomd2aAYGuaw
         e0ew==
X-Forwarded-Encrypted: i=1; AL+hErFZ+g7jliQ/+sHWjR3VnoBAIZHNR2UY6DX6HKoogdoe4vqXL3s48a0jGFH5b2NSfxKdT4XgrrVh/+JaovU=@vger.kernel.org
X-Gm-Message-State: APuU4Z91RdKqVjfzdyOB1TUCURJ3sEge1YvBoyeNYP2eGoMILn4mnj3N
	0xDHuKIQ7/pTZSNFLq/IkrcclKbpeiAcKTqQ9Mi2yXrGNYmk8icwejtO9BNMaVgelHpckhEA8Sk
	DbKDhsFyOwfhaKBqll6PN7kJA5Ewe84UVOE5KnDkyCNTvGf+qY+JGdKdlLlYdyh2plSERbCI7Im
	U=
X-Gm-Gg: AZFdTZdt24ZJl8TXqyiA6WIbid71tkIL7xvdaQpVrNFOegapaNw/ujleMg/GI/VUnB4
	XSWyW/DeYrFimLSEEywcP8hltV6ZTooJ7iJZOF1qTx8XkbN6ksrtP4m3LRTswJ1FkqD1kU62lv+
	2yQ0aqoGKN5oev3qc9xmUkGEHwkyxf/TQPawI3uOR7S590BMd1tTPBnBTp/e8bjkOlgeLeq7zMr
	5CJ2F3wY7+1lxlPqRdr4q+RycGQAqizyLs5lHM/xsw8rRMu4MDZVbNPfvw+eUDtYPBOfhnoVVHM
	DL47DnlKekRmkQUMiaDjkcajOh/mjX5tU3G97zGJcX8V6R50G4Z1+VtbBuLLrP3cYDZdzWv4Yyw
	GU7gnXubbANqNEGm7WY9RHYEXuh/LHu2S1Dyn49c7C/uavFR8dy3oM9KpCtb54W/EHL9nlXY=
X-Received: by 2002:a05:6820:a513:20b0:71a:ef18:ef3 with SMTP id 006d021491bc7-71b390332d9mr21903009eaf.0.1795789296372;
        Fri, 27 Nov 2026 06:21:36 -0800 (PST)
X-Received: by 2002:a05:6820:a513:20b0:71a:ef18:ef3 with SMTP id 006d021491bc7-71b390332d9mr21902959eaf.0.1795789295841;
        Fri, 27 Nov 2026 06:21:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm11114209a12.9.2026.11.27.06.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:21:35 -0800 (PST)
Message-ID: <8771620c-3ef4-4d8e-8c7b-cfc7681753c4@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:21:33 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: add missing Iris IOMMU SID
To: sophon@radxa.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dragon@radxa.com
References: <20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com>
 <e1d97fe8-3af1-4429-978e-9f2ce59e87b1@oss.qualcomm.com>
 <A31EF798FBEB36C7+17454013-501a-429a-8918-1087baefd339@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <A31EF798FBEB36C7+17454013-501a-429a-8918-1087baefd339@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7VY9MlGB5tLLeNPgi6JEsF5mpH0-7dTk
X-Proofpoint-GUID: 7VY9MlGB5tLLeNPgi6JEsF5mpH0-7dTk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX3cr+tsPC90YP
 umbfvigvN7whbXtXhS+wNL3ZBctTPGP5pJKVAWtTr8oYzUWxK0/XcSPo0f52BoRmss1fENvbAGJ
 537EfBfR5GGhRpH/+tZ+FRHqfhsD+hx0nKPc2DzcDaGv8g12iUR28uke39bz2rJrsnyQwv4R72C
 ZjrRdCi10k9wLxhFrnUXgkgVvWi4n2l2xzuvjqfL7tSn2wQDRKU6oOZ0tsapDyO1J1ruAINEFrz
 Eq84D/wow/XIqdChshrN2PSAlBOV3rYDgTTsomF/K0MswBtmnJF0Uv4+57mMGOmWYJOB+8NTABN
 yKngv7uizPFwyBBWvmv15vd9vxzs3voAfRvAZMrByKoN1lzMcJYRLdby/Kxkdm/asWjHE3q+noR
 kzBJUndOPXHYoht7zH6pO8/cxh61wCx+svsGjuQ13oWtWU4+zZGZaa13DesIkbUdHsCEvsZbkhN
 ORc70mudfHwDGI2G5yw==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b0991f1 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=ci648DB7tXjaz-gxRrQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX7dT+0cWsGvtY
 QRvZLRTAvCtsEUDMA4hBETuxMF4y3i9GUB9VZ/hQv6V0igNUkXe8XoElX4FTsHlMgIXm4iVkBTZ
 JDXkC1Q1qJHrECzA+OIHsPc0yCWaY5A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

On 11/27/26 9:31 AM, Xilin Wu wrote:
> On 10/30/2026 8:54 PM, Konrad Dybcio wrote:
>> On 10/29/26 5:14 PM, Xilin Wu wrote:
>>> The Iris VPU on SC8280XP can issue memory transactions using stream ID
>>> 0x2a07. With only the 0x2a00 SID described in the IOMMU list, those
>>> transactions are not attached to the Iris IOMMU domain and can trigger a
>>> non-secure SMMU global fault during video decode.
>>>
>>> This was observed while decoding H.264, where the faulting address fell
>>> inside a DPB buffer mapped for the Iris device.
>>>
>>> Add the missing 0x2a07 stream ID so both Iris access paths are mapped by
>>> the SMMU.
>>>
>>> Note that the issue was observed using Gen2 HFI firmware.
>>>
>>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>> ---
>>
>> Any chance you're running into this?
>>
>> https://lore.kernel.org/linux-arm-msm/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/
>>
>> Konrad
> 
> Sorry for the late reply. But I don't think so. That series is about context faults on the non-pixel stream when an IOVA lands below 0x25800000. What I see is an unidentified stream fault for SID 0x2a07, at an IOVA well above that boundary. This is from the TZ log, captured with a minidump:
> 
>   SMMU:>> 0x15000000 NonSec Global Fault: NSGFSR=0x80000002, NSGFAR0=0xcfc03000, NSGFSYNR0=0x2, NSGFSYNR1=0x2a072a07, NSCR0=0x280406
>   Fatal Error type: TZBSP_ERR_FATAL_SMMU_FAULT
> 
> 0x2a07 is the VPU's non-secure pixel stream, the counterpart of 0x1947 on SM8550. The Gen1 firmware sends all non-secure traffic through 0x2a00, but the Gen2 firmware puts pixel traffic on 0x2a07. No SMR covers that stream today, so TZ resets the SoC.

0x2a00 is the video non-protected stream
0x2a07 is the video non-protected pixel stream

I believe the subnodes patch will solve your issue too (and also
guard against the iova limitations)

Konrad
