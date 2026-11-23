Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413133;
	b=xZnAndrQWgUKq3uXenooyraxzPuQCVBNLa0/32BtPYibt1miXdxHdfuelFK2Lrxa4BiW
	 VRCi+oJ6+hETl7BAc+/eYqPOjgS5T6JXzcJrRhYuLFIzc7aZrcZabHnkNmnZO+StWSXkL
	 JLTwPlBTXYjBuTvCFMyhFT7Y7WWA4VERK4zDTxQymttotP8FXziQ9DXpVYYjLQUdWOK4w
	 cwxlyBC8Vbf1z4M2+ZgeZgyd9N1UEcaDBPTB/l3mCBEsMooUVa/isGB/28An1H76RKHj2
	 4DlKQhOiJybMTOkK9kwPVKnuYfHy0zaKNWv7gcFn44iVhH8ZByVAAN99q7UxBk+QYAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=;
	b=sc785teJ4Ii2izop9heGUn9z3mSkj6f3f9eSKR7ut3NzyrN8+fZuT992/evBOdnoZXeZ
	 9X4RKpo7A3m3Eqplm6qLqVMbfQ610RlkBcC7nZythfvhMNXiJZC7lV1c29fCmbXJHJLc9
	 HE3SJ29Gp6DNY1+C0lk075n2S9wYp2eRJRKICPcJ8Ponk/vbYYQ5A/YIEAWwejpRYFTVB
	 /N1xQ276bC5DNDM7JaW2hqp55zUd61EzjOCiGbCzGBbOkeQEh3dhIuiwSVKiWDjBkIyXK
	 WjFAMA0bonrNTP0hsUnsxZew/WQKBSWyfSnOS/5klx0FzbCjnnOcWnXSyM8YzDUUh9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CGSEUnFN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvyUHcWB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC81606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEC81606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CGSEUnFN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvyUHcWB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN517Xj864597
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=; b=CGSEUnFN6ASWTf9j
	nhtenKl5ijDt/bsnl8gO1DErbLN89LpxWx0xpUGioyMcAoOcdwiP8eeS+cUMUvbF
	xoaBzXrV/Ux4+MMITjae8hZo+DMTbj2qqg5fjCjzq2Lmh56wpch83Uusv3k8Z0AH
	NkJ3Tfo79Z9e0lzOoeHcoHdQKotkJdllFnNVrto9hEVS7zwgzx/0VyWq5UOOauy2
	ntZeB0a9EaOLevFYlBUDnzxVxQV/MiqWSCjozV9jzl+jKs2al5lsnSVDPsPB/6Y/
	Goc1OU1edWcwxlCCneCyEY5556Xvih3YruPtARxuWQZLZMxde6TRUNeq8SY+8PfY
	ZX5Y9g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7wapd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:52:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd65070d3feso1640507a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413130; x=1796017930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=;
        b=fvyUHcWB/hIXRmwdDlGYN4BcvmODhXyg3xGKSanJvSbfZPhS02HtvMXVsHWX5RX4w5
         ggSwoJlvKsiWm37eHD9W/uTIDQWKKdpEM3w4x8ZY2nZ1cfD3yKvTqiiy2nBlOeoodguM
         l/D9L9Dc+LFQ3M9RMI/uVIVQFagHvigTi6W/PQYTbWhIgAWLotQ/TAYZMx03fMwHrMbu
         W12md+ybsoKAulHq80Sqd4q/jNKkv/X+UHkSYGuJALwXU04ivJDPcvbDZiLcs9qnL3iL
         QX9tj2Wk79QEBIFtQQgeugsp+SkTF5hlhixMSbEvvHQqhFi/YX+13D9FtgyIZlGRdrSW
         BpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413130; x=1796017930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=;
        b=fxnNfp1xmtpdrg4R+h351Fx6LLsNztEVOTEE1qKPDX+59UH+UeZg2fpSwO3BAYz2aG
         U3Ai29IYc0zGKh1squBVFCRflnknHCDkDMbRTJkwHFSgmJlrJ5doAQAYik+Lfrd6iFNk
         dUReQcMaIELCKe4uvkFAXtn6OeN8kkIIg4P64msRkmN1YAh0JEHXqbF3WPfGsJSJ34Qo
         wPz1OpTydwp6enwl8xXHNMl4ET/5M7ZWnyMrctDhDR6+j01Qg1qv7kmo+9m8a1xpd/V2
         G1Rah0pzzBj6KFe2m4tFdlqDaiVZ3/icJn0ildEeV3xJkKOwS1OQKvUTZeLNPOZYqXKf
         qqjQ==
X-Forwarded-Encrypted: i=1; AL+hErFhP9ifiFH+FZ1JRmPlgL6v5uIAposeUnnKaQk47L5sf1BH6G0u7vIvMuinTlM2hJ8TNvrnOYYPq0/eG0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VCnfwiHgEAnvffeSLYRQ8jV+6D/SEwCTfdohmY3XK1oF5EQ+K
	xKl84Swf8+aEbWhCMF0LVOce40lTmBr5OS1zGxqLevBOsq7JcJsXt246/KFAxAy80PUlhqpT6On
	qMLZNN4Adp58FowrsZg9fEA0o//ujWsnQHNZ2PxlnwB3P+ULdAbaNiNYYWZDKPTEE1BI=
X-Gm-Gg: AZFdTZdWE84BQrUD/w83M+B8Uwobn31UXeKlmADxgEIPIo2a1w80ysNf57I5hsvVwLB
	Jp6q95pc3stytaCn2ryRcSMgZVAzsQ9BwoCWxEcG1eO+gF9OUm6zQkgrXfrnffDUjlhgG5+7cq/
	TqtyGvBDTUU3AhSpNOi7llKKl4dX7fZJWaaqGKjL2ccWDLecrbRZYeWIlzwQ8HjG0UMGbsp+i+V
	en4L0U2tyl5lFSYoBAXheDivpAuOHFtHRc8tvZDsoeUcCeel3qcQMAEAzip6No07a1w6Anozbwi
	VEYcEodfvE6fCSvcwDNuqIVH1HRu/rmQCrJtSi4Xw8EQ+hIQmqbI7uklMB5EkvqDU061vKyEHpI
	klUGoY2OESlSr8Fmn/Qu6yb4vKYbK3R6+hVnwEOLXRd/K6l2UoNgS0fBc1tSs8Mz0cp6LJ+Ljoc
	T0Mg==
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr91827415ad.28.1795413130392;
        Sun, 22 Nov 2026 21:52:10 -0800 (PST)
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr91827355ad.28.1795413129945;
        Sun, 22 Nov 2026 21:52:09 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm45065075ad.18.2026.11.22.21.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:52:09 -0800 (PST)
Message-ID: <0c289a75-8625-4b9c-81ce-7714ce9eccc9@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:22:04 +0530
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
Subject: Re: [PATCH v3 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-1-71ab966c41c9@oss.qualcomm.com>
 <20261122-jumping-slim-wolf-aa3e9f@quoll>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261122-jumping-slim-wolf-aa3e9f@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b03d48b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ceModZNawzzamKazbfEA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfXz+A7iPNnlc/D
 wIJEzWhWU1YLbno78vBL/5RBT2ylGr6lZsKfti9pOxUbxg+IEb2oqTJJdcsF8NiAgbpJ8vB9PWv
 5UxtA0v2Nf3NrZfEnj5Ayy5FZwAWemc=
X-Proofpoint-GUID: R8ROa2DulqT_D-AIifjav4gB5g7OgAsi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX/ELTMCuUEGx9
 2SM6JcfWRmMlelIpyGAC5aNDBI2c4bjPuiFDb4rZaD+g+2gti5qqV5NwOP9e+Z3ZkuHI3+8JVRP
 jMzD2LPjU+nBjv7ZwPmjUNLeqD1N3cxKNq7RvuK0KPxps0dmNU1tQP5/vCpz/1FKBAcMBHQAjfc
 fRFTm+4ph8TBz2Ed02L33g5laEIqDZvHoywymKNsgkidAjtZvx7sOQ0PV2mM+eGONLDk3F9Nn1z
 n3iOQ74AK32SNLB7BQlspwgljd3qr9JzCz77hr4rVTs2BU96os2PVHvBx7blEp4lTM3SJ/Mf+YI
 o/Y8a9qEN+0gsZT6EziPuqAqWPVOvVEV/niJPkkmw9qpel+CnDF0ZN5r1UeUYGq+4GVKqgSv/vs
 IqVNDcmPvJd6uloHQ87cfZOeudDGSIYxzIkFQuT8JYR4KEzhdTSOIFHYzDApTAX5e/PeBCTv2kT
 gL3QEz3PlQ4FE/lSq/Q==
X-Proofpoint-ORIG-GUID: R8ROa2DulqT_D-AIifjav4gB5g7OgAsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023



On 22-11-2026 22:36, Krzysztof Kozlowski wrote:
>> Use linear graph ports 0-2 by replacing port@3 with port@2 for the third
>> CSI2 PHY connection. The matching Glymur driver data maps port@2 to
>> hardware PHY id 4, and there are no in-tree users of the old port@3 ABI
>> yet.
> There is in-tree user - I clearly see camss.c. Your next patch even
> changes that user!
> 
There are no in-tree DTS users, but camss.c is already an in-tree
consumer of the documented ABI. I will drop that wording.

> This is just not correct :/
> 
> Anyway, mark it as fixes and be explicit that you target CURRENT RC. Or
> was this already a released ABI?
The binding entered in the v7.4 cycle and is present in v7.4-rc1/rc2,
but not in v7.3.

I will mark this as a current v7.4-rc fix and add the Fixes tags.

-- 
Regards,
Nihal Kumar Gupta

