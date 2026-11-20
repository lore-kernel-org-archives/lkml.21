Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172493;
	b=zr1Ik6t+zIV4ClYZWnQMQ+HDqC4bEFxmR7kHhI9ZkhtxvoXCrvxmK+cYCYf4cW3II2rQ
	 ejg5mtRzTr+d87FaWnTTSz/4TlvajvHzeqhDpEb1/UVPO2oXBRuAuWWUnYitD1wiD67qF
	 EiX5PszgCsaNAj5m7KExuHOQZdZQKl+JcJPuztHk79UkpUZYFoGDutmQji7oBkOrURQVb
	 QrJS9dJk2Rbdde38R1VGC4VjD3RxSeKj1E+Nha7FAXBjQAHPx5Y7IRZWPKNAedGCAIjfI
	 tKqJ5fRpm3BffWKl39KQYhj+dDmuPiryd5JZhTZNsSylqfy9DQ1JyghzA6GBRdoylxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tfEwMMFJ6+T2olV/zbMMG3qY/sm4oMfIGWok9FctD4g=;
	b=ah830TkLgZp04/X48DC8l5Lh572Sa+wdTXI3MX76oBwegsjIxXfpHAp4MjDhbLdn3ijn
	 ZV4GKqnHmamy//luwEnM/KUPA4W4UIQYX5TQT+lsirIJTy2BGKojiT98/dRdWpI0UD9a2
	 wqY4qJP9fOh5D8mFOYEWz5PLBtEGNQ9HdxxvP1u4BYk8Lqzmh/MoASyEC+gpW63NnCPD+
	 idFwWIlOxSTL+gVtHzlPMU9z+80PdJjWTJ/lXQeVtxRYffJpNTsqJNSUAQWrprQQz0uI2
	 V8mXbnmq2U7GKMXCvZthVpV4daL9ePfqfjh4+q2ECrpMtRT//QdEw1qs5dA5Zf199BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6d1XxOD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FMZJyRUb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B96606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12B96606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6d1XxOD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FMZJyRUb
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk18P2433136
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tfEwMMFJ6+T2olV/zbMMG3qY/sm4oMfIGWok9FctD4g=; b=d6d1XxODjBBdAlSG
	WHy6RqWLX/FSfUv6GgZPLpM6dWshQbOT4/HqK7u0OFiydm38Wq3WMRhOtsiMt/tp
	NEXwy05NiNEeaDq9YC89DAPUd0A6C+m14zozf+V/6+jIxBiSv0pDdEcDDiEWHSjO
	RuIlCKCaxUFjkgKqa3hcWHF0+iuF4UBODTH1VogeUHv26q3rYEfwEd3KC1EkKCux
	dnRdwSMfnKitSTrLfdER3Twf9jyOkukCukA+QJPDoUMUNgm/kIq2SUbEv4ZXJ1iD
	zxTYFGo7OSw2rGomzr1XaZuYO67PigzXLkrCR/ZI9e9O7cUyXTtw2WtPr5t3vJQ9
	I1BvEg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9e9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:01:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd65070d3feso519534a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172491; x=1795777291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfEwMMFJ6+T2olV/zbMMG3qY/sm4oMfIGWok9FctD4g=;
        b=FMZJyRUbutEeaWsw8MdqhFKPTrPlVwTt5Hzx76HgYYFZoLXKd10VtwDFw4gRUAWpea
         eEWPuRQUfVsW9r1D8NtQJDW3PtCwRHLilqpRDtamMfzKeLRxhjuXPfxAu56V/V8UWcv8
         8geu3L3bhZIKgyw0Gv6vE2cKGK+qPZxs15YSb7EaJxQgp/YGvk51LLxGTd/rSsp7IrD3
         +Y/btVy3KDFlBhm2U/QmAQQybjdoxIUAVOGQ+tCRFAB6T+vJskE4ovLW9aHxpMdID3Ny
         5AgBEuQm3pJBArATutDgOd2yiTVeBdwwZFctNt47s/8OOFoesqODjMtI/7YxNzoBliDp
         dKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172491; x=1795777291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfEwMMFJ6+T2olV/zbMMG3qY/sm4oMfIGWok9FctD4g=;
        b=PMNP8jZ5PQSOebXXHCw4YzNIhVPBHKnyIej8FsbpKBeJ9HDWplvfaj6wyn+FLaPz5u
         JE3bBJpIPS5HhUYtR3hhSsPl9AsMpk22lLSzc8OiM6SnBKO0l+U5fTF8X3cUv9Gu9CYs
         hE1t/3IwqmgZbScgDW2ruq/aMXLvQjCzBi+K03+yI32PvIFODlmCX9Tj4S6vUZ25fcra
         JttU1eOjXmD/qFkfkBc64n7GssMEr9VhBFtXEKwbFcijzjcpxOM+eorPx5XvLVKjPWt7
         jkxu4DxOwRA62U5cW0c6wiJ1N7RmplyCrJbOrIhUDl1bCw5P71YVi7EY19GexDd6O6Qu
         pdcQ==
X-Forwarded-Encrypted: i=1; AL+hErFCkksXyK2X66jrrVCN9/JVLi8uj7lvP5zJtoXX0s2cJssmP0Eh4K3xnJWQOosIguyQfD7fR72FAsbtHEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uIwmj3V1QICdZmwbyJqw2UyvpW8fQzV7dbr3sjCY+hxh23bKl
	IjVzvSOfS+6R45J6pNVJ2NY1H6cnGXT0vzQOWrXvAkNitJfYVRrz3pEoOJ28AJuKeffGbUwN5If
	cFEbHFu3sHCPkJBuJCMWV+owG2h3i6s2Bk8orQfVuJW9FAMNXqH+1tEgBf9MGcrTpyQ==
X-Gm-Gg: AYBFou1q7egIdjY8FCbKbPZsaVHUPJ1z0Avk1JHxyS2izEJ3eWDFpB0HFR+pEV9JL3i
	ZuUra+6CGBuOHZv6AqZIr3w1bax6vlj4KQugmqqFTLOw3r9eiLvx/uSaTDBQ2C+ErfCPWCNG/I8
	+Bd/s27OSPwcXLocvx2nQshKup2j+8c2rZtDqu1/seCum6irzVokrcWG347tYqaR7OnqJYMC62o
	cOq2v/2GVG0qclnx1XdZflJ+JQnSU/+/V0ZSlGsOnrI47eE4sUKYZcQcaqTNTK8kLGjDy+OUq6R
	pKbG67usVgXCc8bg2wgLWuN3W9eVHCkKHIAIpdxRiUyZsqIB6ChqcAD3NT27cfIBunBacBb9tcl
	MCcQ16EggpPB89jQy5pajWHOjjnyIBWmfzTVcHhGQLzmpb1HxtpN9hQj5D574gyz83Xm5y427Vx
	WDuodLBIs=
X-Received: by 2002:a05:6a21:a4a:b0:3fa:c74c:756c with SMTP id adf61e73a8af0-4014e45e611mr1898075637.35.1795172491537;
        Fri, 20 Nov 2026 03:01:31 -0800 (PST)
X-Received: by 2002:a05:6a21:a4a:b0:3fa:c74c:756c with SMTP id adf61e73a8af0-4014e45e611mr1897969637.35.1795172489261;
        Fri, 20 Nov 2026 03:01:29 -0800 (PST)
Received: from [10.218.26.184] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f16b41sm1336893b3a.56.2026.11.20.03.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:01:28 -0800 (PST)
Message-ID: <9130f308-e264-4ada-87cc-95553c5e9e0f@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:31:25 +0530
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
Subject: Re: [PATCH v4] devfreq: qcom: bwmon: Reduce zone1 threshold count to
 3
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119114426.4050161-1-pushpendra.singh@oss.qualcomm.com>
 <cf2091e5-44a3-473a-a5e4-d9044b053b45@kernel.org>
Content-Language: en-US
From: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
In-Reply-To: <cf2091e5-44a3-473a-a5e4-d9044b053b45@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b00288c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mi1jIm9wWjqR4qfdRYIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX+lkyPmdq5ybs
 HR1zwQruCA9zarnRfoWzI8g4hiymxv3Co4Ac+cxUp4+sX5L5EO3SsubAYOD+HCs6gI4TbZpy66f
 Hj6L3COdsRhodrHVO5cEGDW9xNZ3eWM=
X-Proofpoint-ORIG-GUID: iLTyvmnYvAaLPK7Pndf72fS01FIBz4S-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX1ycfokO+M+EU
 8xFo7alJzlApC6ZKyLOqZHP8pxgEbk1wJ/6D6J2J5GtaURiCEsdFKT08SEoJvG11FwKAgDjs5l7
 VLYQFD8lgSthKW+kWyzSPdztgX33CjgXk8UEA89kz/Kw/+C36cwOU80uAwlTn4f642OR0HjHI6P
 RBbLwPuzZ7g+SZ3RVZqSHfaKmCcVfOiaclg1F82fCq4n4AnUzYCqJ4nv7awr0eQxdqqRWh5gxCv
 q15PXJeElkHhA2bQhSSLyIR4SCL4P2uRkvIDRS5HkBVUmRw3pUb1W3MaidCwktATf6dfmoae93u
 U1FZktcwGI0Db/Q2aX1G/BiNFeJX8QZoXo/tnunUHzExRYXb8KBCF2H3qOQMtT49cfAvNwdgoi6
 BoiHe3VweemOrs5870YeRHl9ItA5ArJpah+ZFNfkYBFzp1f//6wTco6cX0wu49JVRxV65tFX7nD
 c5xK2KLmWn2O1bmGuSg==
X-Proofpoint-GUID: iLTyvmnYvAaLPK7Pndf72fS01FIBz4S-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200043



On 11/19/2026 5:37 PM, Krzysztof Kozlowski wrote:
> On 19/11/2026 12:44, Pushpendra Singh wrote:
>> Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
>> vote after 3 sample windows instead of waiting for 16. The previous
>> 16‑window delay (~64 ms) is too long at higher FPS workloads,
>> causing delayed decision making and measurable power regression.
>>
>> Power and performance measurements were collected for
>> zone1_thres_count = 3 and 16, with the following results:
>>
>> Usecase                         zone1_cnt=16	zone1_cnt=3       Delta
>> YouTube streaming (power)	4126.49 mW	3991.30 mW      -3.28%
>> Google Meet audio (power)	3058.79 mW	2929.73 mW      -4.22%
>> Speedometer 3.1(perf)		25.8		26.5            +2.7%
>> Geekbench 6.5 ST(perf)		3907		3905            -0.1%
>> Geekbench 6.5 MT(perf)		18636		18680           +0.2%
>>
>> The reduced threshold therefore allows BWMON to react sooner to falling
>> bandwidth demand, providing measurable power savings in the tested
>> workloads without a meaningful performance regression.
> 
> I do not see how you resolved my comment, so same comment.

Thanks for the feedback. I had addressed the previous comment by rerunning the power and performance measurements on the latest kernel (v7.3.rc5) and shared the updated results in my previous reply[1]. I have also included these results in the commit message in this respin.

Could you please clarify if there is any additional concern that I may have missed? I’ll be happy to address it.

[1]
https://lore.kernel.org/lkml/34ada002-5271-4f05-8b6b-ee4294f2ebee@oss.qualcomm.com/

Thanks,
Pushpendra Singh

> 
> Best regards,
> Krzysztof

