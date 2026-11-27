Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789568;
	b=AkNmmSqE7UkbkSs+q65iOfIRdeE0pllsfmnON93qyjwgwRtzwrbK+VP4U7PF/77+vBjx
	 j+2gZnB8od+8ab/SUgKQrXZHDc9vVnhPhmMj9prCLDSIETaX0hWI/abEUTixswNfzuAZm
	 OJmfootv/4QIjGYOZVz5JM9BRkr/UkM/KFkkrRBS2CFTMWFacKBAcrLc2bsRS6ZJVndeJ
	 lgVJ5s5NyqN9+XlRwhh9p0foLFPC6in+Dv1odkFYcJv8OdD2Bl1X5N424mHafIHfyVKFs
	 Go9yOUnAfDSyv8/K/MAWiNb3iCyovB3xhoNo91DgKHW3rDoflDuOnGaSzlmuDnopDtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=;
	b=u6WAL/9T5bv18zPpwT+FE17r9letTqv3FBgLLtxpCy6h+OEWmqzCtD/qmzZqPWfcUDV7
	 pKHpnc5GyTcjaSYf3tn4gtSYfDmIVJQuwuG2HS4kHuazntr6v0M7P1riTa+Fn6Bw3ias9
	 pSnB1lcWKslUCSBQyuBPELWSQpUVWTtRb/x8yJeoQz9iK1meq6MB8frD76k/XgnldPPij
	 8/GDf5n0kbvmJasU4IixbWF+hs+VneIu64oGLyPQP+xRW722zU2FOHQbkOyVXpPsTdJ/0
	 w93xYb62+awXc+9EBM7PdrFGmLevaRuak05ZfiWUXB3962fs1Tozep4sfx2BHGSyhBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A9OyCWOh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXGQtXxR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EEB606B430
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43EEB606B430
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A9OyCWOh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXGQtXxR
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1fo31971479
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=; b=A9OyCWOhxbNrnNBj
	j9QsIzGlTvvelZiXk7G6sfyIvotoJBnaRafsAYfleP3VDnfNZGyaBLOxdBoosuqo
	DhQYJN3Rm+ndD4lKkmMPEBqJpR7TQJUHfNFuRk8MChz3U9QSbjZFqVXYLKXsI0iP
	3M8YDl3OgBdR88C2wpHB528xoNGuET5iDhh4XwJKqq/IlR4vX5ALLSv+AD4NtElz
	nSVJgU+Sp6iZD46sA6ee7Y+XdGgIkO625Bd18WByUVcX+LY+n8yIG+XuXx62PUtu
	F0ANFbsQ1MFTO25zz27EWezgHKYj3t0gw+pRCSEFGgu90ePH/pVXy41gwfaBikUJ
	u+wOLw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55ubrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:26:07 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso333757e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789566; x=1796394366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=;
        b=QXGQtXxRgRfUPqPPaSa5v4NhJuVXnfedKc9zW2WBcM8D7MBIObheXgTzU1nVB5/3o4
         y0EVDV+juXL349kJMuzcipVHtgZ7hvowNlbolPdMrrh3tIKH7oXtamvVvxZQQ31QJFbT
         wO0lbyoUzJf+zeAaekHcSqqflPTOzeHB2Arn19Dh0gOCBF0TBmLFHpmAfUjnl9yJkRKd
         Hftc1tgroYfLbzp0vApqPX2f+hA+F7UlKKnW2EhQz/p/MZF+YMSJ/mWQWyCr8hiT35qR
         x16m67yddyt3gSeqNojp7cDRW0pE6mo0fH4yX8/RpyTEQ7fCQHumIDsJ8eFyV4WgzrEt
         mJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789566; x=1796394366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=;
        b=uHgCTtTyyfvEfO27xHIRBA0kHMgRm9KUTESX7qqwu60v9ygZvsgOIryFQ0yCAqXbAE
         LdzNfSgTURtTBi/zNr4Ao5HRkz+IWweKE0zzsRpplcL97Wr9ygvFKXPu9iPKEpPDaD6G
         fVJ0W0UzDj847c5Y4Ag39/17pXbnUt0rMoZ05I+3XfMBJ4OicdKktMQHaRAroq11rYAa
         jVidIR+gVRtu3K0v/Hfj4h8PxH45Qbn44fsijWeiP9jwCucPgJPzz+ouqe+O56X2A/3j
         JZz43PNY3ZMozXbgGXsKXyC0cyPQX60hIofX205JVau0a+MUMQ7XIMHIYeDwZySclL2x
         OrnQ==
X-Forwarded-Encrypted: i=1; AL+hErH1xrjx/kald9shpSug7ALSDJhMQ/zytpdV8iFX9fHp+RDeTICGGQt4BUJi++ApfEOB+pCOhyMavr0Oxco=@vger.kernel.org
X-Gm-Message-State: APuU4Z81++woqI7A8wMNVnaI4nZ95vWhCt+aXw07XF9UVwEO9z/QbD7m
	ZGdSQteC6Q+N4RxQsz1oF5n/S3JS1/gkmVP2MyK0TH2Ap8dkleBLBBoPvVnjvXGj4XqIzdd+vuC
	bx/F37J7qEf4IudB7hYIIcbcqAM2rTm7HzToTCTKoxglkxm1Xo/Ll6DYdrQ4xaqT2b3w=
X-Gm-Gg: AZFdTZdwkg96366vrfn5bu14JM8K/nzW/vuokSfr78WMpij2o+c5YbgpcgySXh6kskL
	Rw3XdHhn727EzDjQ4eUoJy3CheTdWWZhE0BEKVIWc3NSvl3MYI5Sv3CDnLl7dx6moSMizZpDuR8
	ZWOXmBP8RQt7GE7PUM1wDSggU/+B2UhyfItg1cr4bbClIg1N5HCjXtRn+Y1cHNz0oEtKsIW0VtY
	VBwYdHQs25XzxvQEi3/7E1JPZ6yrc4m9CzhuJ4Bp3VvnPfQ395nHYXwRZnuLWvjR96lA8RLiXRc
	zEUIjfv05r+lj96AhUqEN8kkekdbsnOB8U20Bbint//FuT7oe5v27LTvVmBmantj9++M53lJHbK
	++GAEzK2to8+eenH29tRFCxP+y01ZmjttsQ1d0JZ18N1CL0rxQqAf84h1RUchE48RfCWu3NE=
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr17109614e0c.3.1795789566408;
        Fri, 27 Nov 2026 06:26:06 -0800 (PST)
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr17109554e0c.3.1795789565824;
        Fri, 27 Nov 2026 06:26:05 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66053sm871434566b.19.2026.11.27.06.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:26:05 -0800 (PST)
Message-ID: <2b589a52-de75-40c3-b4ae-3960b9068cfd@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:26:03 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-lg-judyln: Drop qcom,te-source
 property
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amir Dahan <system64fumo@tuta.io>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20261111-judyln-panel-glitch-fix-v1-1-ecee1f0a1b30@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-judyln-panel-glitch-fix-v1-1-ecee1f0a1b30@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXz99hIO9fmBty
 TwnDHKVMAyw9UgYsaXz2BCu7ivo1Q+9vRwRf6Gjx5NWZewhWTRz3LlJa25mKOseYk8GBawMCchG
 qB1JoTvhcqpzgVQOorYUJ4kbm/23/TE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX+UjHyOjY3Jw1
 AI1W9DH6PdHTdZ97/NZJa3wijPMFRiHRyEvN0ahJFxQobsEz154tIf3ic256wdTiZ82gm7+8fo3
 SfnjdcHzRbyjBBU9oYd8TrMVp6q215XD4BTWh6uIGtE+kuPvleXOdTl4b8CAPW1JYZTbkKscUQ2
 GFFw3j4C1HV75HKkjL6nevlZw1m+R4UYzC5Tm2nuRNnUlC5dWhiLysdAciBXzH7g20C02Dj8SHu
 iVYSiME57JjKcshSBsrpKgTNgqud5g2Oe6VLbvmPQJj+JEuvf2a7pZP+GmCTaAc0QQLwZjmHWFa
 LhnIbSwfiSQA9hEMLGhjqwCG+Ag7QrarW1NZxhjt80pgSi27e6FNiu+njhcuP1nh0scHLiYcnA5
 2+YW/b4e7Q2qGt9rVizHefByffA2FjM+y6GSoR8YJA7Gn6O4/yM37yjnhei2RFmq1SUH56dO1mr
 Qm+wvc8H7dkO4Nn7J8w==
X-Proofpoint-ORIG-GUID: Lj-5FTRsD_7P2f4EuS1uD-rNj4d1-XQg
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b0992ff cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=bCXaPUmJWq0JbFlovXgA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=tNoRWFLymzeba-QzToBc:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: Lj-5FTRsD_7P2f4EuS1uD-rNj4d1-XQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

On 11/12/26 12:53 AM, Paul Sajna wrote:
> It was introduced without proper verification, and causes
> graphical glitches on the display. Discovered by bisecting.
> 
> Fixes: c6c66aa3ef33 ("arm64: dts: qcom: sdm845-lg-judyln: Add display panel")
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
