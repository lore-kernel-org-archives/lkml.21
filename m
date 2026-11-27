Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772997;
	b=CA9Okeb853yW6aFDrrr1hHpiHs5SCLeod8zWOjvtDyw9k9Xys4nRCgPzwOb0u5V17KD8
	 g4vhL63LwOnPmq/Sc353sDNw2CoCPtSJuyxLXX6Q2LPqyoz7XkaQNPiiicxloPe/TbO+H
	 f75V98Vk42trdby0jW8V+Kl/zS+dSqetf1IrOZEf9HjGfGCtBUjKZk+IPd6Ayg7X/HzUB
	 UOVblvvEJsKdCKHVHzUDUnkbDxt0oBA/WG46yM/0gdWE988QVOeSJd7TigXMkM7x23g+p
	 +O+FHU/hNCxY+xqaemg8hAhuEV+0TiEQ5qWaj1yzUhtnaseMNI/awLlFozTIJsRx8dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772997;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=c0Dnai2mS0jKW2gFMXtdOeHQc3Vgz+AH8UmEJxjmLmI=;
	b=QAPC5JKKbC6lowrtI5CFtXlusIAS1NKnWQk5Z2Ba4BvNaUUIXl5ozZb+Gom5sdMHlIFR
	 0uUitiVxTD52wKdbT7lU/qU5IovfmNEVT1P5n+BypOBQTjlnOOBgEmHph/RAOw72SwLYp
	 8sV7nnIfkPm8GtHqcskLPGy1TSTdODdlCqvepxXUhXgPQ7eBHAWC5hHB+hADCrtaRhG93
	 H5vOLFgyfb4pUT20FCUDc81wHR0bQgrqLCYreqv9QTrZWeAiCbcwDlbqAr/ztnPjwJ125
	 NsX4aLrdHylh653GWM8R4PXmrRJj8a37D8K4BynRg+NSHAGlRUj+tmLvfCigzkTrNFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=obfICoDJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9giYd5x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EFB606A68C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50EFB606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=obfICoDJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9giYd5x
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GbSN3983840
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0Dnai2mS0jKW2gFMXtdOeHQc3Vgz+AH8UmEJxjmLmI=; b=obfICoDJxgCSIHVq
	1H2m4OsJZmwrrNOkmSyZ5PCFuHLydF4UHCKinlEo20WiN62lEXqg8fCrjE/BVyRL
	T+SLXWOy8Z0j18JjAfAvm27SoQTXYpUSbb8bmYvHjSRTDL9E/zGTDF7lO79S7N6t
	P4H1x1ULr5XGWIdnr6qI8v5aALiTNCgFnldXX4WlH/lEkCLQidFYyBtMZhIIbpIq
	yPxi1NMbVXXIILZs4rEbm0Yj3P2OwMYwpOesSv8+UCA7W1sDdaD+/rhtQJaF2LXl
	BWjRYP8hQFzHaHoTOySn1+/zh1AGahS5F9wMKKynuLSQImyYJzqgIq/E1kwnJCRD
	soScFQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49acnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:49:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f09a37f41dso49619815ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772996; x=1796377796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0Dnai2mS0jKW2gFMXtdOeHQc3Vgz+AH8UmEJxjmLmI=;
        b=f9giYd5xDCxK4f1w5/qTkfCdb4CeHpi8ruUnxzcVpY5nNmQRBB6EC8meML+tuGAirQ
         Lj3TpIFKOmdGGMSUKr8gspT45PCKPxYAtJ/k6Exei5moJDAZPY8QCzjDF7rSDsij4dt3
         RkOyi8XyModNrMyHl4NB5qnfjdSATuJmwRdnYSyHtoSINhVFESguw/5KqRobLSA+b8IC
         krzJU0g6n3n5Z1bXoRm/jRlJn8GjjOXP4Co6JxoZpOeyvs9Mp25pMV9WfSnwD9FulIwE
         v/hD3ZxPZQkR5yAzP0dYYfhJFEZZoP6hiKFpchX6DTRpjsn7mWvs5IO7128d8ulTP+Tb
         a3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772996; x=1796377796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0Dnai2mS0jKW2gFMXtdOeHQc3Vgz+AH8UmEJxjmLmI=;
        b=2LTkbG1M6108BDJmQoP67kUbscVqEfHfHWK6XDlMYRSHPV3ReYrR0OGcst2yKyUKV2
         hb12kDOfoNQTZ6boAN/vhyDoAhZ2Y/wdYwMQgjTmfc/G1L5ByNqzP+vAVR6v8HrM8dPT
         kplX9P+IZyPNtxXBNdXucfL+/eNvrPvURLQXKMlI7fm8WTLPoTJGxOPutWXDiTMduQhT
         M3TMeSWi03FxMw/LTf66Z/69vgvQd0vnptGN6Kg5eC/iA+gAVx/Ez2tdtCGNCR+ByCnU
         SQDI7Yd7CghmC9G5E0P9cGGShrpz7IKDEKZqaqvjfwK1jXHSDrmrSKGGBKSkJl/THTNo
         6nNg==
X-Forwarded-Encrypted: i=1; AL+hErHRV3qBnFdBJpUhb73M1X2NNnA4qWPCCs5z46d4RNz/VfavfZ+04KwkiR7q2R88pvb/9F4YqW5H//dvHvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NbO6Hqjf9FlNyWWUlGK9Lu32dWCOFuCpL1rggRKEU050brX6J
	ovhn8XccDenb9KJOBLNqPUA6uhWt5zn3mZCaOAyulFmYUTgrG8Tb2ONxrWW/3QgXg0rYt36vVIh
	kMOb7Q3l+OTpanqVA4S/xVwxSTMYtvgR+2wFQfDB/UrQAkmOEMGBdMyrwlOG+n+sdm3k=
X-Gm-Gg: AZFdTZeg5aBpDJs5WOO6cnxBWIvQ1AwacrRh1S5/HoYKjXDLwFZxmiJNwD1LbeMnKQD
	5X/B56Zj2Tfn3NWyNsD7+n65QoXEErtTzvs4iqAvS4M5BH8FV90PRDyFDH6zt0w6FSA2aazcDOh
	fFBlOIlg25OvYAuGY5SMiU/tupYi41Kn797zlR7auMsLBe2CnoJRiqLSkuFtwz3grihqHZ2KMod
	TkHDkmvnMBU1eQuMOqbFapwBUsvYQF9HAQMX4+6x0StTYLvfeT5U5BC4F2RDgYTyqkxojqEB5I2
	1+46pxvabFFfSH3+dBvjdkbyQx6zI7fZ/V5lp6sDJiaeaLEx9ct9lMDsGtrNNBkRTV4kzk1toU6
	YcO+nWqicb6J9on0ivqywGRvU5qMWWUEvXqo414o6e459YAf6sVu9TcN0SioJCiC8o7wbSjvsIM
	akGMt58nCsuX5r6hYwjydZdsiSXCXZXLRicTvZHTbUvG+5+rydvtMQkmh2y4CC7toSc9BK+eI2N
	rVB
X-Received: by 2002:a17:903:41cd:b0:2ef:efae:e8e7 with SMTP id d9443c01a7336-2f03eded341mr252338245ad.0.1795772995850;
        Fri, 27 Nov 2026 01:49:55 -0800 (PST)
X-Received: by 2002:a17:903:41cd:b0:2ef:efae:e8e7 with SMTP id d9443c01a7336-2f03eded341mr252338105ad.0.1795772995384;
        Fri, 27 Nov 2026 01:49:55 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm115916895ad.72.2026.11.27.01.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:49:55 -0800 (PST)
Message-ID: <917776ae-ab75-4f81-93c3-7e359641cb1e@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:19:50 +0530
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
Subject: Re: [PATCH 3/4] remoteproc: qcom: Fix bounds check in
 q6v5_wcss_da_to_va()
To: Atul Akella <atul.akella@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, sibi.sankar@oss.qualcomm.com,
        quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261106184312.100-1-atul.akella@gmail.com>
 <20261106184312.100-4-atul.akella@gmail.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261106184312.100-4-atul.akella@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 65Oaf5qeYp6MKr5CnWmQOdFhkwSGZozC
X-Proofpoint-ORIG-GUID: 65Oaf5qeYp6MKr5CnWmQOdFhkwSGZozC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX/N4pc3UqGTCT
 RdHJJl52hgKItkqd5oq2Ly3XnsaOvFG19pNnPl1Y3r6uZwOISlZ8Qmfci0S1uybnFEXV0SkbrfW
 ja6XsSSQIuwsx+FeYU2TFOq+h2yFqUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX47Ql4G0kp4DK
 L8PfQP0YhvHt5JTlERkzO54Xup+8Jy3DQJ4H2OhXWVMwcPzoswT2aZRnkrKRi8+vLw6lpr/Rk11
 jy7vIPLjRXTMEKwIqg1NFG+SpiaeQta/w5SKOrj568TToQ7uS6d2tIm866ZKkonEV2S5V4QoayA
 rsC98g2F1d12C314YugSMV3qgZ19O2mb05ToGPMH2DmK/IqRxsuwXi04CfWZN4B3CT2GcN1D+xl
 RVrHbporTh3SSDuYf536/gykLRqDPRA3BTUsDJablOluMZs2QBgBDx+yCd1lasB6c3MATO+eEP2
 N2SN0O+GWSsNDrncnQACAMssqrP9k1QV58HlL/rfebcFG0DHbrLuGg9yIGkIZOoLukLwo3C7GJN
 kE1faYIdt0rmFCNWe0+6aAXEtTML6/HvJ5LiOZVTZzEsNCZEWd40ZJlkLvinDbiXmkc3qPwqSJ3
 ry4KsmL3EGJ+z3AHYzw==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b095244 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E4ycadI1TCjYcBWHacUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038



On 11/7/2026 12:13 AM, Atul Akella wrote:
> offset is calculated as da - wcss->mem_reloc and stored in a
> 32 bit signed int, while da and wcss->mem_reloc are both u64.
> For a sufficiently small da, the 64bit difference is truncated
> into the 32 bit int, bypassing the offset < 0 underflow check
> with a small positive value. Additionally, offset + len >
> wcss->mem_size can itself overflow when offset and len are both
> large, providing a second bypass.
> 
> da and len come from firmware's ELF program headers via
> rproc_da_to_va(), and the result is used by the ELF loader
> to write firmware segments, so a malformed firmware image can
> cause writes outside the carveout.
> 
> Rewrite the bounds check entirely in u64 arithmetic. Reject
> underflow before computing offset (da < wcss->mem_reloc).
> Replace the addition based overflow check with a
> subtraction based one (len > wcss->mem_size - offset) so no
> intermediate sum can wrap.
> 
> Fixes: 3a3d4163e0bf ("remoteproc: qcom: Introduce Hexagon V5 based WCSS driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---
Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Thanks,
Gopikrishna
