Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072289;
	b=bdqUEwiTkAGSF8EdlvWeoFWg018um83lmUWk9nEf9icbNw0zZwwD8FHbt4Ylx2DprXzo
	 w28gpyQ+A0AW521N5Y+bWLoQXGgqDcAQbmPeh9ZjP3JTlGuq2+hZTJmoR2WzNwaKwcFFg
	 aEdbkCZhU1L5vTPKXKISf0IrCYKspKT5kM9jhRRJkElVTIgyRk3fJu7VAM4NxGqJEZxO2
	 to9jDcGvQlphHmxwChedxWDzatC01eEHBcJN6dhqv6A2kl3pdt6QmQxr25iciaG/4x6XL
	 Hq7kkOVY7fxdgN0NHjQGn/Li+dXLy/hQ7wLa6Mee2IJ26VbrVQZGgy1D9y9A3orfXew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072289;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=;
	b=JyWb2n5yIBdP3mMoHebUeALhA0LwuFULGk/k/8gOizFQzkeXiJghkfpmKs8jhORfcHlW
	 x4Qfi1IygoHLOG7I4Lgvo1wCbUpAIY2JcIjOW+DhHcXwjRBL6lZikHByC3ylHw4O3KO91
	 6hpPUtHD3D/eGoSJ9iPhKC4ww8M7pe5yymYiw54PdTp78MjGbNOE4TdSFoLSc7klbtY7s
	 RQOnwYzJp6/sYk129HX4JO6xvPT6t3sS71q0CI8o68mGooGOhNwGrYmOPTWqMsjG/1hPp
	 OaAAt/SYcjzKi1us1QoGaKCPI8LiNedmU3bBU8CIiEYGCNK21LiYyGEPXJC9tT7RL3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oODRBWzo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmYj+1FE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB059606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB059606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oODRBWzo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmYj+1FE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vFRo1681175
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=; b=oODRBWzo0WVLn/yz
	r/qqs4ew38c5s8Y2C9jWsI/MdgQ3doWeU4tpKM668Y59KVFjh5Ojy6BtYFMQx//Q
	c9O4rATzmpDthO9TmKuVez34+oEA7Nuu6SO3oJegQR8SukJbaO4NM0+ydcUpkxsj
	N7nhUFgdy1EvlApUY33U4k2hIVcTe/nwLO6gcnAIaiUOdcSg0qhmQP3xn/WImpid
	8Wfm6YaIiwoXMAuz4498k8qqJioS/+7JPdSnhH9tiZIhS26sP18VTwlc4xOFTxpq
	djd0eDo+5vMcTIC1oXcR0ck8bKKnPHKnc45xLa4LK10eS/pxzLtp36m8LTcYahTa
	Q8M+1g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdcse19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:11:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efe2a88b7cso11153005ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795072286; x=1795677086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=;
        b=UmYj+1FEAhj/ZD/UjYsnQwdKYokm42yCChJ25vSfZQwitZjNq5UdlZyu0Ns7TNT/4i
         JPJ1t/ufoypQ9tq4DEjfgCVLA24GOBXS9rupjEKaplXTqepaeXMAWmTtP50a1AufSU1f
         e+ZeFAifL97C+xlcFMaTcs080g5m+glLpcl59n9Jv0Ey/9mUwJdwCl0nFpyPY3zX4jNm
         0usDbJo4jZQZ1O+DdA1g/FX2ej0uqa6htm7y8a20hQgubm3Fbidt73nxC4qtjjA2DoQ3
         vxzuvo6TfhjZqCpbTImdPA1S0mjuGFlt5GszwPAx439KfOKhAxXXF75dYFcCoxgk6anM
         zoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072286; x=1795677086;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=;
        b=wi2sfB4prGft8WxV/bmSjpruwzCZF9BEXLNa6vakRokl5LyhfF76tpiJRBengNG0rO
         UYtxhytnt8/OSlASCQCca9Lpg1pBn6IZWp4EvQTzqkTk1npFgY79T3hUWzi7e7GDjoOr
         +uspv+sIVPgBYrdGdqRolUYYBUMj365l3NrbeYNMLIAeqYzBBOQCd5qXH2rCnkhAdu+E
         HgCanFbNeAgk+KQ/lxXVghH+eMF8eKZPXiG+eOXGVaiT3mJG7adWWa06kX2qEHa1Kahf
         ZIiU0DA0Jp5Qi6/bUa9NeUk3GQM/yzWNwADRYZeKr6pKwb0t1n9GKYWGTMLIDWPqreUV
         uj+w==
X-Forwarded-Encrypted: i=1; AL+hErFV4JfOpBAYImbwACqOtyz6KkxIjH3dBBoRv5UkC3dO0kGpKED/nc393pV9W6AccanIMmv/7bbfmopkm1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mKD1qW9b1HuzZvDc4rI19yGwn5sPvYgu2ftpnmDkO/1gTM1dy
	rLjPCFyqAQUkOVJYTzv7dVqhJyWoDnRmNxkwerxn7WO7iF8hkLqrhRfENGlmiTevXZ/Dctw9sRe
	+IKSaEJEtCHkEfgO2irnMijnZEJ6M1e1iO0Baw8AAXxxvJOXsPZE9f27e4oPCZvtbS04=
X-Gm-Gg: AZFdTZeA2XngoDBM1wUBHSpIISw80QiKcp0Z9UOgRFilKoP+uaHO5ntA4OZHOjFEpJt
	XCJJOVpwTvKaNRLYN++EgdkShkeCDZO9U/GvM0cuvkHWk6mOZhNeyHfAWl+AFfJDjo8pplP0i+I
	9Pg9uOiRkMmLgplcc8P/BBRJRNmtqB9T4N+j7JY/1X9GaAgCeo8YBvayOeMLpjKVX1HhXjy0q1n
	YoAP4YtX/9ZbPHQWMxhZvMiIXB1AS5CJAMo5wpNaNcbRYR5keVNUnO2ZUYyWvn6djnbhELJZdNC
	trGz2LXkPUmZcg8yP7CcCULpnr3HGpwGCpPInhCNXpE2PKskZEGKKqDBtyjUq+MH4Wm8arGpiOn
	Vt2BX2F/9JtI/hTlWVwkCNghqfstZ4QkokCiUezGjZA1qw8PR614oHiydbssm3VXVnIRgevpykv
	lep3HC/YM=
X-Received: by 2002:a17:90b:4acb:b0:3b3:8094:321d with SMTP id 98e67ed59e1d1-3b3d07aa6e9mr4435693a91.32.1795072286324;
        Wed, 18 Nov 2026 23:11:26 -0800 (PST)
X-Received: by 2002:a17:90b:4acb:b0:3b3:8094:321d with SMTP id 98e67ed59e1d1-3b3d07aa6e9mr4435659a91.32.1795072285666;
        Wed, 18 Nov 2026 23:11:25 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4057af4e2sm1243414a91.7.2026.11.18.23.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:11:25 -0800 (PST)
Message-ID: <553b354c-70f1-4b3f-955c-17a197e6ad20@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 12:41:20 +0530
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
Subject: Re: [PATCH] i3c: master: Disable slave events before RSTDAA
To: Defa Li <defa.li@mediatek.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
        mingchang.jia@mediatek.com, yuhan.wei@mediatek.com,
        hao.lin@mediatek.com
References: <20261106062236.564607-1-defa.li@mediatek.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261106062236.564607-1-defa.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0UHlMC0J-1wEblgRxevi0SLcIMWaMT3b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX807cf9Dt7XF+
 1mbPlgdgg3ZRynwF1YyHJvGNs6Eqd+bpoi2JQM9qsts0RyuIpgt3/SSpnSsgWlWbs01zV5J7c3g
 mJT1sAHt0iopptL3Tuq2fDOOMvlQnKQ=
X-Proofpoint-GUID: 0UHlMC0J-1wEblgRxevi0SLcIMWaMT3b
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afea11f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=mpaa-ttXAAAA:8 a=qpz-AGu6-bpAACMkIr4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX6MWGbzTpQrhs
 dU+tCARDAwALy9dCWEZJNl++BoANtNYZWkYFS8+nvZbGHgibZfR+lvWMqb4z/2HsLI7cObmI3x3
 ptV/4F6K9Sag0FxGAakt5+rb/QaLgIP/fNXN3zQf/tgVm458uSLM111QOs+8jRouVzvZip/1vNn
 kkNuCVcXAWKMQNT4BdidbxSX9WZ6R6Ch4BZv9ulY6gwCBSV8wRtHTa2cTvhKiJHPlLAa2QbO29o
 jGWJnAlRPtlIIz5IvydP/PistoG7jvsZELYfDoiGkb8obWWeVSCantSde0wbVidcurAcGmGTo8t
 g3MJWZnO60GqkwMUylFw7WbpSlcmQMTNTNkK4RT+UEWeIiYYpVKeSgyCwwmqKVgXKQlf8+MMGEC
 ozgY73Uv/zVHGeLAVUuJ9na5znxXdrfdT/eufSUsfbv85yp0+iNYVx8KtnG8LSHGsu8l/RUc47H
 ZKDyvV274olsAoFTw1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190028



On 11/6/2026 11:52 AM, Defa Li wrote:
> Bus initialization sends RSTDAA before disabling slave events. A hot-join
> or other slave event may occur after RSTDAA and interfere with the
> following DISEC command or the remaining initialization.
> 
> Send broadcast DISEC before RSTDAA to disable SIR, master request, and
> hot-join events before resetting dynamic addresses. This prevents slave
> events from disrupting bus initialization.
> 

While the sequence you suggested making sense to me, but i am wondering 
before bus_init, are there really a target device getting powered up who 
can generate hotjoin ?

MY understanding is, post master registration and bus_init only target 
devices should start life, isn't it ?


> Signed-off-by: Defa Li <defa.li@mediatek.com>
> ---
>   drivers/i3c/master.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 01e05bad8661..4fdc8f721364 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2571,10 +2571,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>   	}
>   
>   	/*
> -	 * Reset all dynamic address that may have been assigned before
> -	 * (assigned by the bootloader for example).
> +	 * Disable all slave events before starting DAA. When no active device
> +	 * is on the bus, returns Mx error code M2, this error is ignored.
>   	 */
> -	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> +	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
> +					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> +					   I3C_CCC_EVENT_HJ, true);
>   	if (ret)
>   		goto err_bus_cleanup;
>   
> @@ -2585,12 +2587,10 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>   	}
>   
>   	/*
> -	 * Disable all slave events before starting DAA. When no active device
> -	 * is on the bus, returns Mx error code M2, this error is ignored.
> +	 * Reset all dynamic address that may have been assigned before
> +	 * (assigned by the bootloader for example).
>   	 */
> -	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
> -					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> -					   I3C_CCC_EVENT_HJ, true);
> +	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
>   	if (ret)
>   		goto err_bus_cleanup;
>   

