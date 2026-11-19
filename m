Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081931;
	b=byVA8BV8ySdvHhbu9wvDa2KbtAE4wdT/Nr3oIYPBfE5+On/R7xfPnSnzLGToKDUdLDCn
	 3kMSyGe1d9Xn0rAz7CBPpcH6VMljRissCDsrtp1TOvGzoQpA6CTyLb3fDAx0QvZLDYRQX
	 qRbQ24mOsJkx7CnaBAjYb0OW49fkEzj3l3ojKgf4TtAzvbmKTjsE5DRS+TbiatVTohz13
	 M9pmrJ49C1JcqusJXba23U4fpbW5ljOJFEzJpGnLLhPBHJfmszYnVPPmmQxZEIPLCZuHm
	 S/2ZGrPOMjTw6VuHvCxMkb4yhOqJyfj2tf306U69bYC2abhQbIi5EQYcHQzaFTEQKjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CSizmi6Mw8mtze6J22xXAjJEj/rlBp05sy/aCy1nj3o=;
	b=BK9eTpVBcKe3356UAogGDPVTaZ3ejO1Bq3DergfeGAO/TdCKxg8ztlK02Na5cWzpy3cX
	 ldExLysPnV0IOAUmRtyRCPOc/Fdaxp+CroARrKPpWdogeQiZ7yeEtIBDFn+jxdXeyltj4
	 AhyzXieL2nwgFoKmXETQvnAYfca/YCB4hqj9HZk3PQYF6JzdWqFRIlYn9mEy5ajznxAUD
	 QHYrZCLYUOXygpSVcRyZBFZyoHnicaimQH2A+iedio1mefcgcmQkatchJbaNAAQqTr/X9
	 vbRDG0qk+6euSmN4ZuDGEAcOcu+HI6OLDJn5UOxJT8mZFK2wldPNS/JFn6LdY9UUrGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFyt1hB+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M/1//x+S";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F84606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F84606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFyt1hB+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M/1//x+S
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vEAi2935530
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSizmi6Mw8mtze6J22xXAjJEj/rlBp05sy/aCy1nj3o=; b=VFyt1hB+9wQlMz+p
	hOTNWkff0nFqw6MVRCUzaZSOS4DLhAAoiXOhIsfPwE+F2FUyHE2/owOWSnfbZGwV
	AKtSLHpusLYDsD58Sq87Ajl8DyiWAKANA0U1Iyx+7EW9HKaWcOsUWZkWUpPyIjyb
	Lv9X/WVn4kE81U3rso7Bp4K3aEgM4iKOl5z9ZtIuyZ4fWGC/bRt65P79YzuVFQ0B
	knCPijvz8QYkZSt6BQDaTXKDXWUr7DxKK45ixEREdap8n5auGnI97+eh6+oYhhHg
	fxM9wftRjPUPJU6wjUWyZnYy0F9UUH6rO9YPnCaFJ17dCeIiXvmB4HVRDi1NMiNC
	4LO9tg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ekset-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:52:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so550403a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081929; x=1795686729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSizmi6Mw8mtze6J22xXAjJEj/rlBp05sy/aCy1nj3o=;
        b=M/1//x+SX1LSinI/YBU/2HjQonY8ab9IMrHpR1/skqyGFYLRjbWy29ejKAoKoXUZ15
         GD/xY/nibitxhsBlXTBZnZxV65Of8KshUkKsqooWS4Jd9rizphTyXuodi+AlsXJax5W+
         fdxPtyc4eDYp/Bxy83qSF5ZQrJTiCkiif1OT+vsQWfcbacVDfV6Bida6qymifL4eJAqm
         heQ+RC6EvvMcoY3MSHRiRYlnpER2ThHiUppBSZxe/UyhA88/pjaTuI3d9rU7fNJnzpmM
         kZ90rx6l8lPs4KykbVd8wWB81aAi1aIud5N83iCPKbeWQXA0wECPuq+58CEaQEKHQbBj
         /5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081929; x=1795686729;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSizmi6Mw8mtze6J22xXAjJEj/rlBp05sy/aCy1nj3o=;
        b=fPyLPlnbKRZrEuhy+/l0Z1+GbsVictsAgF2CSOuI7JsDyYUkBshCL5YROPBouwl/wk
         R11FBJRe8dCis+i7OF6ccsQ61h12FwHv/eDBm7YSPf6updag839ZffhT7G3swosCiwF6
         Poo/i3OiZPvp1RmOjam1AwLibg4h2preON1IsWmksfKCQZGnw+Vc7SQRC8J5HpZnP8mo
         30vYgnJWKP1Hp8frFF5+apnj1WcWOJJl9nDrhcgN1fgk8m13phPKWYtGSouI2nyUr2uf
         mbKNFruiWIoXag2QEpLmqfZOvKSmsYG9Y6GYUN+Cxj8qVFnnuCG54NHJjN6OFMU2GlES
         eQng==
X-Forwarded-Encrypted: i=1; AL+hErEP+9RwfykfgM9RZJ2D8GJuDfJ9E/YhlW7/ueu5I00PaTo0yEPokrlHOf8eYejbgklZy0XUpf8j4Qa6w28=@vger.kernel.org
X-Gm-Message-State: APuU4Z86E+Fh/EuywBSLfv0e0vOYMoHzivjA6h3GrLf5v+a7RdADujBx
	v5tzMQk7EfrcKB+s2BLQE/P75drV5bC6E5SryodV+UgEcfRhosMIlGjybA7iFHq7r4zShhCteP0
	dwIBPg5h/VLzSLGzNWQXjExN8hLWyZA41ZmizUO8/kAdiVMo/xoA0w1r97G9UkfOfjsw=
X-Gm-Gg: AZFdTZf8v9/mkTtnsJpGWWwzB06ilWUNauLhvH/lIoCtag6BWP0aJV2qN5oaX/Ncb+8
	aU0/yFqGKceFzfOuUsSd5OU58QDq5Ie3t5T22THyF4KWZyZ3GVtTOC4MNFAyvPpI7ZZB+jTV7jo
	CLYvuoGH6mhklFlfT2nQy7SNtZYI8cHBGMxbubiXi8jcF6o2UosymxSfDf1g2IoEWWIVi0P3dXb
	lj+HXHbKg5/Uur+UbnyjmvEm/y+8MSg1d/1sOIGc6mea01B73hmP4A2SRRG0aSA6YRlNKz6P7Tx
	f5K4DCaaCBmcxOxiT8Jml4zlPzUp+ZR1fAgZ/YIheiGFOnrHMwM8S6cdzE1z7RxZ6x1Mswjx3fD
	/7eqArrRngae0Ck3pY9lqgHffLhtZSqYAheN3URIf1AXYnZF1dDLWt+JD0XXQ/E34K1kUz1PhU6
	D0zhWJoGo=
X-Received: by 2002:a17:90b:254c:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b40a21dac0mr365152a91.33.1795081928933;
        Thu, 19 Nov 2026 01:52:08 -0800 (PST)
X-Received: by 2002:a17:90b:254c:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b40a21dac0mr365128a91.33.1795081928418;
        Thu, 19 Nov 2026 01:52:08 -0800 (PST)
Received: from [10.219.49.219] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4028310c5sm1189430a91.3.2026.11.19.01.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:52:07 -0800 (PST)
Message-ID: <813a113d-f4fa-44e1-9616-c01dc5577365@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 15:22:02 +0530
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
Subject: Re: [PATCH v6 v6 8/9] ASoC: qcom: lpass-tx-macro: Add support for
 Bolero v4.0
To: Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-8-2cda302237cc@oss.qualcomm.com>
 <179436005595.790675.2243536196647069749.b4-review@b4>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <179436005595.790675.2243536196647069749.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOSBTYWx0ZWRfX0DDO6LbnjHg8
 SDje75l9+J9sRIGWPIYB+FWSvYe4NlNpoZzqwArBUYRinuZqnvxCRpk02PeyDzEQINie8/4cwQW
 p8ZeMsgnW+pweNMPkdFXoZ89vKYPiVzdNKgH5a28YE/vufjN0qH0qvi3BpgxNlD3SEzuz7kJeq3
 OUBuPlSmRCpY4vvtu/bnivgtl4NpFF6Dlf/RVy04STnxr6DCPMOHjOgwgH0Qvj8A+I7+9wh0cMG
 6P7FwXqIGmv2t3xcrbeFHCdF0Naq5X5Y1JSBr+ZQ8wQ7i4Vh0xdcM047G6DugwjbOKPL60su9xH
 Py5v1f7qHh6f+u9GIbyCqRuPpW3NXWLbeRdk3L9jqlOA0kC0df+d544ZcJjsgpDJovPhYBqRN6L
 TusXGhoMf7lzbLGBTbMAKhcFFJEiPIjyOwDuZVH6PUlXYq5cDqepZHFqL9kWvtvN+v60O1GCVDl
 QtPEm1ZRwgFCXE3oVyQ==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afec6c9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=4tHaGl9kwi2XGHUKs7MA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: BTNq6w3Yee02JP5xepK3Zo_XaLIc7jTi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOSBTYWx0ZWRfX5x+KNRCUnugB
 w2d7r4+CACKXqcKUbqLomFdbTiqaqYrKF4d2+ZJdWgoToCMg57Hq55w7pszHQ4EeoFOCmVxjIOq
 stm1BeALsdhqL/EJfaQLbYopLDhdEHI=
X-Proofpoint-GUID: BTNq6w3Yee02JP5xepK3Zo_XaLIc7jTi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190039


On 11/11/2026 6:50 AM, Mark Brown wrote:
>> Hawi integrates the Bolero v4.0 TX macro. This version extends the
>> existing TX macro register layout with CFG2 port-select registers,
>> per-path CFG2 registers and an ADPT control block.
>> +#define CDC_ADPT0_ADPT_CTRL		(0x0800)
>> +#define CDC_TX_ADPT_CTRL_EN_MASK	GENMASK(7, 0)
> This is also 8 bits wide.
Thanks for the comments Mark,
Right, the enable field covers the entire 8-bit register. Since we clear 
the whole register here, I'll switch this to a direct write and drop the 
mask.

>
>> +	SND_SOC_DAPM_MUX("TX WSA MUX0", SND_SOC_NOPM, 0, 0, &tx_wsa_mux0_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX1", SND_SOC_NOPM, 0, 0, &tx_wsa_mux1_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX2", SND_SOC_NOPM, 0, 0, &tx_wsa_mux2_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX3", SND_SOC_NOPM, 0, 0, &tx_wsa_mux3_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX4", SND_SOC_NOPM, 0, 0, &tx_wsa_mux4_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX5", SND_SOC_NOPM, 0, 0, &tx_wsa_mux5_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX6", SND_SOC_NOPM, 0, 0, &tx_wsa_mux6_mux),
>> +	SND_SOC_DAPM_MUX("TX WSA MUX7", SND_SOC_NOPM, 0, 0, &tx_wsa_mux7_mux),
>> +
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX0", SND_SOC_NOPM, 0, 0, &tx_psel_mux0_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX1", SND_SOC_NOPM, 0, 0, &tx_psel_mux1_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX2", SND_SOC_NOPM, 0, 0, &tx_psel_mux2_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX3", SND_SOC_NOPM, 0, 0, &tx_psel_mux3_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX4", SND_SOC_NOPM, 0, 0, &tx_psel_mux4_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX5", SND_SOC_NOPM, 0, 0, &tx_psel_mux5_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX6", SND_SOC_NOPM, 0, 0, &tx_psel_mux6_mux),
>> +	SND_SOC_DAPM_MUX("TX PORT SEL MUX7", SND_SOC_NOPM, 0, 0, &tx_psel_mux7_mux),
>> +	{"TX SMIC MUX0", NULL, "TX_SWR_CLK"},
>> +	{"TX SMIC MUX0", "SWR_MIC0", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC1", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC2", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC3", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC4", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC5", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC6", "TX WSA MUX0"},
>> +	{"TX SMIC MUX0", "SWR_MIC7", "TX WSA MUX0"},
>> +	{"TX WSA MUX0", "NO_WSA", "TX PORT SEL MUX0"},
>> +	{"TX WSA MUX0", "WSA1",   "TX PORT SEL MUX0"},
>> +	{"TX WSA MUX0", "WSA2",   "TX PORT SEL MUX0"},
>> +	{"TX WSA MUX0", "WSA3",   "TX PORT SEL MUX0"},
>> +	{"TX WSA MUX0", "WSA4",   "TX PORT SEL MUX0"},
>> +	{"TX PORT SEL MUX0", "PORT0", "TX SWR_INPUT"},
>> +	{"TX PORT SEL MUX0", "PORT1", "TX SWR_INPUT"},
>> +	{"TX PORT SEL MUX0", "PORT2", "TX SWR_INPUT"},
>> +	{"TX PORT SEL MUX0", "PORT3", "TX SWR_INPUT"},
>> +	{"TX PORT SEL MUX0", "PORT4", "TX SWR_INPUT"},
> These muxes look weird, the different settings don't seem to change
> anything?

The mux options select different values in the CFG1/CFG2 registers, so 
each selection does change the hardware configuration. They all use the 
same |TX SWR_INPUT|route because the input path itself is shared; only the WSA/port 
selection within that path changes. Thanks, Prasad


>
