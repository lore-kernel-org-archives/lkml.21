Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167419;
	b=zBZDRbP/CW2eExi/BnXlKQc4WsvCW4mcmMESmLidM7IfCNrqs+gU57CRCZ5q0FAo8mrM
	 nu5UHcKbCwV2bxfjC1NzqaQlUk3OtJbb3J0fCPGufok1r3h/sqC6gmk59Tc3oq6K89GEG
	 Rx8VW9sphyyjwTHVauyYpnmFe4Y2LM/488ibSuRkK9Qu7Knssh10gWdT5xIwGSe4a7DqF
	 RHyrgWJ/VHbvlCaKKw8PetYUBEc1+4oybCce9pGDQ5HWb/s3lNzKnj1dvNgHb5eiQLv0b
	 sxjXfgk88hZlnS/v25hbNSH0wq8Ahpw3aTi26FRVM5plZvggZJG73d8xc2SqVJGY6JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167419;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dzVvc+8XsI4mSrpEcEXWdjpdTd52V0l/DsZKFGKiNHQ=;
	b=r8xDJVz5zF/OUNJhKS0/51j8wCncCQuhfDL7myUi2A0SDOMKvhhQd6aSTEXDb2nMju0E
	 3jA3+oflv9lHTwhEW72acGISM10QoptBEBiUItddf06WXox+znL97oKUQXRVlaBFk6I1D
	 zibwTKR5eOILMUScXuBBZgcYiKOVnANknkG5SaXm6z8E/kBp43TnBpWBHS0GWetxpQkwY
	 NqgYyUyzo6SgA493jWSg4ecgcGEtN9h2FKNdcAHBs1SLxjmLf1xetzQYmB/5RqyovdzfL
	 r8IXJiEBSSLwBqak5a0XRFWAb2m5IZp1X4JW9APKQgoa05OmkO5K/7LieGayBWbu0Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+2XMwXl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G75JbPtm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7C7606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E7C7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+2XMwXl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G75JbPtm
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f12o606035
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dzVvc+8XsI4mSrpEcEXWdjpdTd52V0l/DsZKFGKiNHQ=; b=F+2XMwXl2VN+r4ce
	HeaKZ/LNm9kaNf9UWO2fLOQe34kupTxy/VEmHvbVKWX6sxJLC2YIn1JCLxvS2FZ0
	5++WVRDcJt/nXIkU00dtUNVtjPSjDdIMY5tGRemvuBy8CE33vWs0K4D4hkOWqgMX
	Tu1VmK7L2+FvEXCq2gKwFhf/b2BuPbbuy5mQJnBsgPRhYE6KPCEmCoNCFK2lIgdK
	pNLH6oNq4HYDhQlktyAECeJ0MJv8Lyiow6wqCexq5yuyilT2YUL81tgTP0t18PeW
	UvNqn8VbsZgsnAGCyiw0BdP16NTGefl8PdLicZzyRAQUD2m2dwfq73ThWZXU+q6i
	UvU02w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrv5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:36:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so763601a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795167417; x=1795772217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzVvc+8XsI4mSrpEcEXWdjpdTd52V0l/DsZKFGKiNHQ=;
        b=G75JbPtmpo7xXhqUmZ7xWy/RV3DbEusQnkRdzGz+kf9hz7cZEkmW0Z0ZBGZmBNGOtw
         HPD0N+W2gVh3K4BQxh+kq18MJvppdW3yiIiKi9fJXo49uH/Mr1hh8ZcUD4ASgpwk6NO3
         Ak9lTOhXpfNFkOCjoneAFuol/t8BRC1Ha2lMfbEoxp22yVtfKat1SrFvcuZu7jkZIqlY
         6BqPZ4cPArmA0P8At4oQXEiwE3DkUy727ChePuZiotZoLKcSFbTGUcWVly0ole4ROFLf
         3nGhqAGc5rsR5Jxsgka7pm3Xfm8o2QDqEmZca7nryPlNAxI+oZXVZrcMTEs07Ib+4t8J
         e7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167417; x=1795772217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzVvc+8XsI4mSrpEcEXWdjpdTd52V0l/DsZKFGKiNHQ=;
        b=bblDzePJCIb/nvx+9pUmqHedh/bqDLF1rFBS6qQCgRN+/MWzzl2tPoy/0ERc4Kqp2L
         DdFKVEPR2gDZjfua981Pgo1FKRmVSR0KOC/WvwvP98UyZ3HFyiSEOUKzXcwri7mtgNKQ
         WOyBSbJZRmEmuIizIghrFw2xzOVvKnPuT59PjjwXg/teU41uoil5Sx6UAMy9n1MpFe/J
         2i9rhg1MoVMUnfCjSj26SB4Bli32eE5w8B2uI2YcjVR3xKkF5jNbsCNk2tOE2bQk+eNv
         oyNS0vaI2FGzVsj96c5EpZmv+wXHX0v6a6jjKq5GULRngYPoSqH4WaSi7jtvys94NHIf
         C13A==
X-Forwarded-Encrypted: i=1; AL+hErHLLA/2aWRgfEyJsxDVu07q0eqUPpD2UvpNhlX553ti2TbZrw4Ss7lLjq05UqvwuIv7dZQ33PBp+Ww6k9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/00M1nNEKNzFnOvNT88L1L7WiiM/U5gBfshUZ0mQuPwYUxNETg
	oJ+CSfLLkFaiLJqePoCJDOaiG38vIBtz5pJ79J62dPJ/nWgUBJJMH/tBBJPnuUdajwcVWClZR2Q
	o1wIcjwsf08wsXWpqq5UOJTaHuKSjI4Udmrtqj4SG3sh+/PNG+CrtGVUEW8dPy5lBtC8=
X-Gm-Gg: AZFdTZcwP1DhwYAgkUbRA6PNsFdkCbWpVUfHCjMkKMVPXUAzwCrJjuPzvhsEkAyVvf3
	bBGEnC/PoaUmKqHDfuLBYKMbVbebAj7vlJUd1d0VDjjYgxIJpDXI7N8MMnXS7kb6g0K3I0WgqD8
	FZxwA4m0CPJSO8Uu7kUWSU2q9FDIZpDQP4VKSnsAqwZyUYVWO7KUVw1LIasfOSD2QKiLA8fnRqZ
	7TA/JgHHY7Mx0Z9+5O/FIraXftJPGGfQOOVP/tHy4y2FpIrP7loC8UrtwSnJiKFHapK1PDWYwKU
	cmD4lqkdyDLSt/ubqP8rVDfI56UqVn3E41l6PYnk5f3dOo+aQLaGvhiY4qg5Sb+5UGeXwgHCPFu
	QoW/PUgm7K5qayk2qxXizw9j/1wba6EQhax9yK+4xLYsOuh73ICYZkNbue6vfJhePA3xjU2mc8R
	y0/2E7ng==
X-Received: by 2002:a17:90b:35c2:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b41c8e0c7emr1983723a91.18.1795167417607;
        Fri, 20 Nov 2026 01:36:57 -0800 (PST)
X-Received: by 2002:a17:90b:35c2:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b41c8e0c7emr1983709a91.18.1795167417198;
        Fri, 20 Nov 2026 01:36:57 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40548711esm7000212a91.0.2026.11.20.01.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 01:36:56 -0800 (PST)
Message-ID: <a116e2b0-8857-48c8-85f6-be3a62325515@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 15:06:50 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
 <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
 <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
 <20261118125534.7iyzuefhz4te35st@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20261118125534.7iyzuefhz4te35st@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX6ciNCOcPCp3i
 nPKYRTHBKRrXZshbc5Kz0ZJX+K+dY3V4bV2nARJy1URZ5UrV0yQBBB4MOYXSd3zDFwr5WxYO5Qo
 /eTb9OaYaJa1hfWV/H5w0ywmeerUMEsmX4RUJHol0+GRzk6JBHz/Fz88kYG6EEEoeBLTa36L+cW
 dQSd0CAjFxuvjcV7CrXD0nBng/wui8WO530khGRpGV+HRAYgns3sUb1zrJUXoZ4wIUZt5eHUduY
 q/ntWjl5g+AzuoyEPW2ljsduAB78EcFV4phzBy/b/BZ3o0zoHSDrpUaTQxOHrIVaewe9puGdSzP
 ga/eK3Si1eZOlfez/Ce3c1nV2DZk5eipfXhh4PM/w4W0LQnlNRE10ebHVDVrsSyahCfPoRVO1xg
 m/5A+q/dTkQ0fTfVYq5AIPtWQW+2dQYQ2M9RRnzw4x+ghemruWAnrOcea0AMjdXe1MRf402UF2R
 ZUp/6Tcj/H0Z/OwmvsQ==
X-Proofpoint-GUID: XvWqMPE2g7Ryu4QrklKwrMXfVWtTx7xP
X-Proofpoint-ORIG-GUID: XvWqMPE2g7Ryu4QrklKwrMXfVWtTx7xP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfXy2SRQgwRLxhe
 QaLEbWCA+q/vd4whV3S6odxlfxiP40Yyz5F7tCoGhcoV+3KQOyBUii5S7RvRa5NkOjY981uu7Yc
 cD/ExuoqJv0EP26YZbAuJIZwx0IlNnE=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0014ba cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=H8OHiH52VRMc-eBXeh4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200038


On 18-11-2026 06:25 pm, Mukesh Ojha wrote:
> On Wed, Nov 18, 2026 at 04:35:55PM +0530, Vishnu Santhosh wrote:
>> On 17-11-2026 09:49 pm, Mukesh Ojha wrote:
>>> On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
>>>> The RPM message RAM is shared with other subsystems, and parts of it
>>>> are not accessible to the APSS. It is expected to be mapped as Device
>>>> memory.
>>>>
>>>> The "mmio-sram" compatible makes the SRAM driver map the region as
>>>> write-combined (Normal Non-cacheable) memory instead, which allows
>>>> speculative reads into the protected parts and results in XPU
>>>> violations.
>>>>
>>>> Add no-memory-wc so the region is mapped as Device memory.
>>>>
>>>> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
>>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>> Why only for Shikra ?
>> This XPU violation was seen only on Shikra, and only with Linux
>> running at EL2 (KVM). It is not seen on Shikra when Linux runs at
>> EL1 under Gunyah. So, I kept the change to Shikra.
> Thats not explained in this commit, why this issue not seen under
> Gunyah ?

Under Gunyah, Linux runs at EL1 and Gunyah maps this region as Device
memory at stage-2. The stricter stage-2 type applies, so the
write-combined mapping from the SRAM driver has no effect.

With KVM, Linux runs at EL2 (VHE) and there is no stage-2, so the
write-combined mapping takes effect and speculative reads reach the
protected regions.

The region is expected to be mapped non-write-combined regardless of
the exception level, so I kept the commit message to that. I can add
the EL2 detail in v2 if you prefer.

Vishnu

>
>
