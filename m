Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772901;
	b=hmDwo8XUSsVvYPfRFJzZSHUTxR46TSQN2m8OtQ/zUXBtZRJVCZKL3dlQXdZroIYoBJNJ
	 LjkeA46NDl2ec1RpB78Qf1zRx9/yA7pjztyS2CPGHmVd2kQEYaaH56mRqRW/mhnKgL7c/
	 Zfke3V4tvNYI5YNAPq6LKgioRryAalFCMQZprWjiXv5GFyOv6FxH6hlo8uiMm745xl+aw
	 Sr1spYVEdGw4uWnPGQ05Sfs4ZitJBKhAD01sgJg4/T5tOM7dP6hF68bZfsgl+76WXlasE
	 eCiv06F57nq69QE3EzjcyvRuLN5XVMA9Ovxq+7oNjCKLicWrfE2akjrnEExqGQ2JtgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ab35YM3lnptTqwtYOc9MLi1LtF4BDA/SuR6VP3OwrRw=;
	b=CdqgbMYsUth8mXS1K+alAXhOtJ0nG/SQEnrEoKBbPN4oOGAVyog83+VSJU6Shv7C733j
	 /FR+u6veLAfZBuUR/pZpL3xIzgyXuUurE+BG1X4Z6xEaa25TAwZFxrHSvuzG0UerXeb8l
	 GDeth/2ZREVofQ2gzgSaIZhQqVFg7tyhtFumcFCMpBCp9nW3Vo/heUc1/b3L0aCqHIuWY
	 lxh4/y2InzVaKE0MKYm0n47OojD/WFg3nyasn5IStng+kIqZgc1ogpOKhuFTJH9kM9/ba
	 MHeevZWslm0aY922ql7CP371jeE0csLUXI9odqHjx7SnHNQtZLX2hrXnISCOof3hqkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZjyaOow;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5oSXALr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280E8606A329
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 280E8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZjyaOow;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5oSXALr
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GVfX1780018
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ab35YM3lnptTqwtYOc9MLi1LtF4BDA/SuR6VP3OwrRw=; b=fZjyaOowGea9OJ+y
	GAEOqSDBMxGhKNfGZx7uZPHCGvgTGF7cYDktJ+48vi0QJ7n71fVLFWEaKm9b+J36
	eT8sSyaaZRkpnhur2FlvWo8rHMP7Eox8SSN3kHpbE9FxDWHIcCoeiLe9jV5HiEme
	3lywV8yDlxISOy4jsX/okmkRd79yf67B7IYkYTeeJBB0wInDq/jl9kw3yppHYZgu
	7uxSXwLFc+rfsFryUSRXbQV0ITAgQLapuEO3ftV2qg05zibPwYGSBacn9q4x87UV
	OXMzaeEAz/vZ6cF0QsbYIhFUh2BVyh8Qx3zbTtVI7shX8BkTH4/blmAOlp/Gkkhg
	U5LfyA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhh01f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:48:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f033dc37cfso75192985ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772899; x=1796377699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ab35YM3lnptTqwtYOc9MLi1LtF4BDA/SuR6VP3OwrRw=;
        b=C5oSXALre9byhG3JOjtRwFsImfkdKz+YfBXja4OhHljw9Sy/3w1onxdywOe/IRCqvW
         pCBCwuBb8GW0mBXYjj4S3mwOTfrll0/BScDexAXBHR1vETIpsZXAZXkpuqDmQo67Jmq6
         kQZFxZoKeeYe/2CossTflYtiQ3u/rDYjgr6Y7SeYckUd1fqu/dSdbSyldFQBLK6CFddi
         +mmEGt3VRzurMegvOrqsnwqiAzLQ0rPGdFCUwQfS99bFn/O9AkvdkcRz73G96gxQ5bmd
         oYSqxK8LgYANIBHkkUxqqs+8yv7vgLhMy9+7H8vAP6Y7vv1/mv5odsRN+Ktu9+SuSryr
         1Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772899; x=1796377699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ab35YM3lnptTqwtYOc9MLi1LtF4BDA/SuR6VP3OwrRw=;
        b=n0vPYgXbu01BMzydp7e4p38A53XQhtZsjTx3qY1pieK/Ri2bKqT9TcDEAweUKev5mu
         0Ayowdu39X8K8dhkN6wxgWOtZH/vpu3sFg68Auk9wAqLjVMk8JxbaybAne8CGZ5O+ht4
         XCI6HoE/LM0hefQ6JLXuJwhfYzIB98fKejuu+suS9NkkAJRAAUMmHhS5lVaApb5bOkbJ
         a85dUgyw7LqQ9thLKeqFGR+qDoeB74m8ciJx5B1zW7buAk4XxO0I/if9yCgmRDZJg5Ws
         37NimFcJHyj+V8SbK+HEH+fwxDUX4XQ2F6mw2hAIPzzplExkI9mWPad0VfVrh/THvGaW
         pyvQ==
X-Forwarded-Encrypted: i=1; AL+hErGH5eBOHkYzOCOTGMi9vlOPV1algVJZDjWKN0hOZqETMjJv3SowonBgw2VZq2rxTwfogkZkczRENlxTKHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T97CppTeWAR5HF6k1FVwH6IUZGeCsLik8CKiIt8GFO9IZ/HpZ
	wJ0EsAFo0I/PMs4uUPNqBntJHmlpSRqVupsOEJnnPx0hDcMDxlINmKV4TQSFOe2hUzDO4q/wBO+
	KCI/8j6pocGrlkdGxTUFH+TvAGvLKR/SrPvkvBfox0YOdbhtV4GeucYinzET3t04aJiA=
X-Gm-Gg: AZFdTZc5iZtw92Y08hUv1VOetZTV6iah7Z8G99ozhGbWEl/GigyuYlt77rWEKc3IaLh
	8Jn2djC7dLiT33s5x0JKUuShDRnlbTTAa0hmAe8p9XL/pI3BrJZyF3QaCNSPX1ThQcjUBjurx7B
	jIQIL5/sAvuLkMjq2y93X7yPY0OVroXPjLNuTW0Kwg5zmHvo43diCYN+a2U8WzvY2tPNh5psaAb
	0HY7G9WvGMUlezZr4EOyZy74qyQwSWcAXxiuRKKsDgh4s9ySMHVTjLJzcAXig471cn35fZ6Hi87
	n2GqR2F4jxEqwep3tXn1t2K7I1rY1e1yGF/QWWBZAVtcNK18uDnsAivC2ecTYnGH8EM2ZRNZhz6
	Sg5DafLP848xpnKWshqZznI3T78VeNaLS9jflfdbBYUHRp31I2PGpk8/pVCXn27OwE9ASYPtFSU
	thjV2XTW/N/bqbOffP12L/f6SgsKq/galPjPjeOdE2U8V75a8sGaZxwqiHgG1/hsdX4pLvbHqHP
	FOy
X-Received: by 2002:a17:903:94b:b0:2f0:3618:f170 with SMTP id d9443c01a7336-2f03f1acb10mr233462915ad.66.1795772898787;
        Fri, 27 Nov 2026 01:48:18 -0800 (PST)
X-Received: by 2002:a17:903:94b:b0:2f0:3618:f170 with SMTP id d9443c01a7336-2f03f1acb10mr233462675ad.66.1795772898346;
        Fri, 27 Nov 2026 01:48:18 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dbe86sm117153235ad.32.2026.11.27.01.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:48:18 -0800 (PST)
Message-ID: <7a77f62b-7ea3-43e3-963b-e01b86e14e62@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:18:13 +0530
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
Subject: Re: [PATCH 1/4] remoteproc: qcom: Fix bounds check in adsp_da_to_va()
To: Atul Akella <atul.akella@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, sibi.sankar@oss.qualcomm.com,
        quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261106184312.100-1-atul.akella@gmail.com>
 <20261106184312.100-2-atul.akella@gmail.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261106184312.100-2-atul.akella@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX468y/Pxd7sKo
 JnbBU9EpsFFokXZ9msC7ZTCexclsX71lyKtgCGc3/cvs5C8Sd5jh3LusGwFgxlq7Vp2Y/hBWD6T
 vZDkR5wZi6zTA1eVV68oE8/o7OiDhvc=
X-Proofpoint-ORIG-GUID: 9Z1yHY4zoN2QUpkbV5fMMD4ZVhV--osL
X-Proofpoint-GUID: 9Z1yHY4zoN2QUpkbV5fMMD4ZVhV--osL
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b0951e3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E4ycadI1TCjYcBWHacUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX0/gAwiignK24
 1oc65sOXhKqIkScqx8xkO+qjcckHNL488Xwgir5+FqPENpa1skmc/kwL5vms8dOkx3YxEzMEkRO
 uJ1AAtktkwjva7Q7Rd/UFb3nkc4xInboKuSF14oxngkM6ec7/g+cbGtGAcRPNuNvsIrQ1PyWLDX
 C97wQpxRNAvX763dm5vBKuP6nwlgiFxEKKToUPpzO603PdDCoVM6tzcyDaD7qNZeAN+VUH1zaI2
 NSiztr6xWP8ihw6T4G8TboZBUd2riqBTqSMHtkfDZwqtogai4jAYXK/LXRXBw9jrY5Z8YO5IfF4
 NEe1K16Aaci2BInU39+zx2/2LIa22/Mbz2Ac0xDgWkuaJ0/v1GOAK6PkHJoM4c9Br8qlzWICwaA
 nhBmmHFPnkBojXnogiU7IPl+4zRG/FhnhqwrCvl4HizryTScWmn6NE156I+/ydQotKgIsiz3J2s
 3SVRW/8N6Kj26jvzMKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038



On 11/7/2026 12:13 AM, Atul Akella wrote:
> offset is calculated as da - adsp->mem_reloc and stored in a
> 32 bit signed int, while da and adsp->mem_reloc are both u64.
> For a sufficiently small da, the 64bit difference is truncated
> into the 32 bit int, bypassing the offset < 0 underflow check
> with a small positive value. Additionally, offset + len >
> adsp->mem_size can itself overflow when offset and len are both
> large, providing a second bypass.
> 
> da and len come from firmware's ELF program headers via
> rproc_da_to_va(), and the result is used by the ELF loader
> to write firmware segments, so a malformed firmware image can
> cause writes outside the carveout.
> 
> Rewrite the bounds check entirely in u64 arithmetic. Reject
> underflow before computing offset (da < adsp->mem_reloc).
> Replace the addition based overflow check with a
> subtraction based one (len > adsp->mem_size - offset) so no
> intermediate sum can wrap.
> 
> Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---
Looks good to me.

Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Thanks,
Gopikrishna
