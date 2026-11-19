Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101776;
	b=XZ2mLZCICMjg8WrzxA/h5RdXW89NCrtdrXqRsP+6MoT2CHdx/AlAQeTaulQY/ex6orMM
	 94eztDZtVoGaf7H9nIqCTaIqav8TpLxXpnIiDsAuTSnKT2GUI8PqPhrwV9eZH4gtwh/UX
	 u/l9jEcFeHGDSMwAF7pcACtPUH+wiiGHrP70jNy2xVnpvlO86Ihvhdg1/NzMxCgvqtITO
	 nwLSRuwH+oieEIe9G7pxV7OkEigzcVvEwLtRTQB2SvVOS/iikJmv3rEo9MsOnWUSK+DSj
	 fUNJtYbLPnkmTtsZW+qUeYeriRIzhlbCgdhKJP6sI3hho67KoxJHN+rELYegSOEzrmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G2UPR75xzfTvalTHSN0OQNkgfu7Qf/VrvIKOhOtWOu4=;
	b=vOUut7rZvl3ZOTz37EE71W81vsGhJkEwphWffSyE5wBM0TBeohLu4DUjJIYzDnrUDuYw
	 +Ta68FDotj503akVcTqbZOGQRcHnN+iZ6MwOuxsWoFQ43OwXbTS6R/wwF2EeU1LSHojkX
	 Vm/bbS2Tb9Q/WUGmRa/KvC6oiN+loXdy2xRpj03DhedcUFxTLFrHY+aygaur3eGwGbh8T
	 7k6Z/74L351wX0KkOIXxPgrurBu/yeb4tlmCGH01eLbBt+EkjSf7cjqZnOU1LpIZlfWrX
	 t7sQN7iyzA2xalTU8d7/0AI/rnXJblz5hh30w4e5rjuZVE7fY7kom//4fsUTC8PsmoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXwXqip6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bjiyawMD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A14C606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A14C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXwXqip6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bjiyawMD
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF6RFe2664341
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G2UPR75xzfTvalTHSN0OQNkgfu7Qf/VrvIKOhOtWOu4=; b=ZXwXqip6K2xGt4Lw
	FOX9EuvZazD6QUfTRDbrFdqF0sWbOPMvMlFZTCoASFoxZrR3O1xY98YNWBZ5vBvJ
	yxMbijI+xVbZmIBfnB4F1Cl7nW2TvOnikKb4QI3Pt5CK/KO+fFxkFMptYbUgvyec
	peia+7E5ffCxl1/gcGvcz86G/aP37ATZalzE2GfSV3s/Rjc8ZTnG70gsSCwNgo9J
	M09KezWqV1t5MgcMRfUqyH0ijikDBwTQo0eZt1Ve0wIe4yRovnKAsyHM7KetNkjs
	hh2ydsCadOYiYYr4Hxf07XLhLkcajINZZ4kGbqiuKYgPRCErVmG2ebNeMCy0Ymuo
	s+MWJg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uuxa6xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:22:54 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0d978e4faso34258607b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795101773; x=1795706573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2UPR75xzfTvalTHSN0OQNkgfu7Qf/VrvIKOhOtWOu4=;
        b=bjiyawMDejoqRtuybuj4rOQadC17/BbTZxuxMZbdFaH5yejOytmldzDtUk9eybnWx4
         FCXyWuHjym0AGKm9DNaqsq1l26gz4/1kd3g3fgwDF8XDDecLie34EiMLHY6h4B2+DOaW
         8KqYvVPDuAbt/dRd3MFy3RjLpLCWf9zAUcEci2xgNlpwpThAFwXTREoGVxKKWfzluA48
         MJm86KBBF3cZgeWrwanTNPnD2WN85uMDW+S8+WDE1O0Dkv8DFc4cPbN9MKBV0zxUTT4L
         oRwbm9dIrFUSFCm2u8PmjuB0HSTvFUtJ6SdAgOgvYKRW0wp2Yz9aR+/BEpyin31rhsHX
         1UFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101773; x=1795706573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2UPR75xzfTvalTHSN0OQNkgfu7Qf/VrvIKOhOtWOu4=;
        b=NH0x5A0/FTF8E0nKdj9YJN1b3toE01WWpVjwnyAqzOpWMK4lm0KyFo8pT1eV/IKUxn
         kBJ03LQnNeAdyH2fIi77x2WTjtK2uZVcuZcezMTaLym7/P/o5JKd1eqrE1mU3J6IPemE
         2Uuxurtvb7FZDO0Lygfzn56nTQazEpBZgLkvQqarqOKV7SI+SbW7NZjrC3iDrugIe3EE
         iyqkKIpRDByp4WtcQTtqJT4US6DKd3JQD7Z3lIq0djtg0Pva//58NAv1pypw5ZkYbr8M
         Lu7F2KkBdbflkQ68jd0/wbCPhcmTvzKBaRJq9wf0cn/bBqmn4Ef01brmE81i0IynTTZW
         kw2Q==
X-Forwarded-Encrypted: i=1; AL+hErHarV3t0myJphf4Kamxo/9wQIPtkMKCtGrR6zWUGreJbSV/lXqUeG+6OEnsn2diioFoyOi/c35G15QcrFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z91zbSbAYZKQXqWuRTbiNxAiWZ+eJPBEnLuOt0509rkXBH71s7e
	zB+RRqwcNkLPM2lF1k4Ds9s6LApUzEyBNj6zoee7icozMgqqGFJYlF3lCvf5zrsZeDRHAyDiMNN
	Ty/tCOePYn/ftTBIszdagC1y/t+0MuLX3o8iwK3clktPlqKxJ9E8LucybLXYjFUrtmUdPX2zkAI
	U=
X-Gm-Gg: AZFdTZeipyZGJF7TjlVHVHLBTpmndAJ5qTlRZo/V8CTvVhiPN9bm+U/VPGsOpWbzwcy
	ECJdSpt8aA4tihWkMCGlcrFDe54K0bmdplbUNCvAq6yJKxtidhgE2/tMbA8ok6tu0tUDoZTE/sU
	xsieVxoOFt0gau1hiByNPPjjApQuWl5Z6xvIwicvLyQ7QVFdb5PKiiy0LjTh4Hq177fr2RNPm7p
	RewkVucdCvj4KkuHaqst2vSXS9aLlaNecTsfepu0IYzMtkbNzo985WcrHWs2cd7+1+C+CtZlmYm
	HFkTjRgp66KQJJbsST4T2ciXhr3FkWvS8Wue6F1be5KJFE5VLlDUrheMa9R12N3psv1hzxc6jfT
	t7UK8Q4SSOeLUpON7tloTUd3ZDuvnG6ahG6IZjcojH/NskeIJLq/jnVUkYxpWmVqQi5+sTiUImy
	acPXli9zpVE8B3J7V++53qL0Xy5kgeAtXeZjMZfE2U
X-Received: by 2002:a05:690c:c9b:b0:8b4:d8f4:8cba with SMTP id 00721157ae682-8b5205041d4mr132537b3.59.1795101773194;
        Thu, 19 Nov 2026 07:22:53 -0800 (PST)
X-Received: by 2002:a05:690c:c9b:b0:8b4:d8f4:8cba with SMTP id 00721157ae682-8b5205041d4mr132317b3.59.1795101772587;
        Thu, 19 Nov 2026 07:22:52 -0800 (PST)
Received: from ?IPV6:2a0d:e487:234f:6fea:c988:1c88:d345:57b4? ([2a0d:e487:234f:6fea:c988:1c88:d345:57b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm144466f8f.30.2026.11.19.07.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 07:22:51 -0800 (PST)
Message-ID: <284f2947-28d9-4d30-87df-eb224ccc0a73@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:22:49 +0100
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
Subject: Re: [PATCH v1 06/12] thermal: core: Calculate aggregated thermal zone
 temperatures
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261119094706.3439040-1-daniel.lezcano@oss.qualcomm.com>
 <20261119094706.3439040-7-daniel.lezcano@oss.qualcomm.com>
 <2c6e86e7-734b-47ab-8699-aa07b5a35e63@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <2c6e86e7-734b-47ab-8699-aa07b5a35e63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5LpzmpjGpnV6LdTn7EOVsNobT8gJ1gAM
X-Proofpoint-GUID: 5LpzmpjGpnV6LdTn7EOVsNobT8gJ1gAM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2MSBTYWx0ZWRfX980lwKLYivES
 XlR8eNN2yoJajqjnweFIjnRCEWF06XD2M85OXbkMY5k/rImh++pIEGtpxLl8ZKAAcdyCDaKLr1D
 hR0m7m/q6l0/ym3ro6bGLSNk4sFXVO0=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6aff144e cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=vZRywHDwLr9VNEc4dicA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2MSBTYWx0ZWRfX6mCni57Yyo+c
 oa+JfBbe+nOv66mZ5DTdb+fLRCuD6u+AEEgHLmzyzp9UGhBP+ZgKQf6uDzgdAGgqmmy8fvuUhXi
 95Z7rksOsF24Bv4uFjV8+EvVkik5HaZCy5gQrHmnyLsLRlKrYDM6SijxGLwnYtltvy6DGdhVWrr
 q3db7CGgAxImR6mtHM2Gt3aZ3Aqa4vabv5QHcljgxDLo8tfNAhUaHDI+ftgU0blcwdVpDGTpNch
 9e+h/MG5sIyB7mk+G7bZG6XXxGlckjNbMI24vOiPByRq0RIqea15KyELF80+WDdb8UIZ2t+mNKy
 pcCoG58mR3cI1rlkhbW6P9jU+HzUQkBp3rpmzmO78jgDAurKpVXMZgbQ4O5N21p+1qw6cIfcW1Q
 KwW8P4N8+6BBDLRM5lVmQklhHOVaL3n04YWK0Lf/g7nW6pZpbUkLutHO04UYNi4mH8FhN+04XPm
 46JAc1RVy+PatX/EiDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190061


Hi Anvesh,

On 11/19/26 16:14, Anvesh Jain P wrote:
> 
> 
> On 11/19/2026 3:16 PM, Daniel Lezcano wrote:
>> Replace the aggregate temperature placeholder with a signed fixed-point
>> affine calculation. Accumulate source temperatures multiplied by their
>> coefficients using checked 64-bit arithmetic, divide once by the scale
>> of 1000, and add the existing offset from thermal_zone_params. Reject
>> arithmetic overflow and results outside the int range without modifying
>> the output on failure.
>>
>> Read each source under its zone lock and preserve temperature emulation
>> and error handling. Use nonblocking lock acquisition to return -EAGAIN
>> rather than wait for another zone lock while holding the aggregate lock.
>> Reject exiting sources and invalid temperature readings.
>>
>> Keep initialization-time checks in the aggregation validator. Require
>> validated, initialized entries and stable source references
>> throughout each read. Aggregations of aggregated zones are not supported
>> yet; source lifetime and detachment synchronization will be integrated
>> in subsequent changes.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---

[ ... ]

> 
> Tested the aggregation series on Glymur CRD with a few local DT
> additions for the aggregate zone.
> 
> Tested-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>


Thanks for testing

