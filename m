Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551674;
	b=2iSx/3JbwBuKeELcBorWT5MPF/bnFMzgZtdxVVlVhxW3wi5/SzwD5+YebiVpMdJVebld
	 fVVU+5iRFYBJZkJki3kLhBT3mBf4/du6RxrCqik6RBfPcfIfqUhtBiZcWfwvdGkrKYWCZ
	 +9rcVFSNxKOheGQu/SRagNfwwAviPdnAHGEBrTkjHTyg0JbGVxdKywcmii45xTavuerzI
	 +mFiIryy8rxL7te2M5BlzQfpSxJ/typlqyrsKKYzsTWpPdmJ5Lg3pBinuMvAq5UlXCko2
	 pP8ju1FQC1UMJ5iVwCtCzXCiOGexKI2JpGy1uvDxLnCrNqoUHaa8sSrazvvA2E2n0/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IJh0gyj4tVyAUuSEvtY7JJfcpLPqqDKXWFndc290fQE=;
	b=I/ctx6r8kW6Xox1lVdtxshrxBXIICm+/DpZdlB5u1l6tcuMBzQj0kaysY5ou6pexOtFV
	 qHr6V9TUy+QHQ6KDIk1d0vGoshgy92iHNvQjeepPV76vfBdhkuK3Gjt03IDrhzUKJYcMc
	 Ce1ZZqePg+Mr/GGbnEGIytyrGgvOtqlksVV8J1JYVsn9DvaElYCDdXbiqc/y/dawHIZyE
	 qTpK0RZY0UpxJdjoY4RcaQSXSY2RoG1/+d5r5yA5IilfMQeam56TjiUYXx47f7ZhuJ8nY
	 P9fTkV3gg30T/7HNQKEeHuhqyIB96UEl6pgZ8zSsr9nOx1P1fgDoThUaOzJTKhr+kHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6ssbANC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ0d7Bok;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75950606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75950606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6ssbANC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ0d7Bok
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJLLiQ1723194
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJh0gyj4tVyAUuSEvtY7JJfcpLPqqDKXWFndc290fQE=; b=F6ssbANCVPTVOG72
	EKoURmpc+mvCputi/bjo0yyQXvf/+rGxUcga4jEuO0JEyOJdL/x3JwkHLgmsUlwg
	FPuXy7zYY/N1Ib0CIhXnczuV318Feaw4fXHfJZUtp6PskgBEdOqcicWZP94wy/3K
	8+qL5SFJ31FGpAS9zlWeigaA3kI6hVO4EoIZurWVX264ZIuot8+kFnK6arPtfP32
	Kul/B8HGsdCgpThB5Op63FVpRc7ZSG7wakyxpyXQIX0w9Hoca9nrl+O78hLTdTpl
	4ifp8J0b9GDyThFidr+pedmXGRd49B9QnH+sfQV/2tVGSiueREBP7NsjP/DulcrW
	1XHg3A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gns87fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:21:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869865a304so4539402eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795551673; x=1796156473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJh0gyj4tVyAUuSEvtY7JJfcpLPqqDKXWFndc290fQE=;
        b=iJ0d7BokKXSAtrRJzI8YyHoaoWukQkcFngDvKDzD0OD6txCzgtiJqo53aghUlH1BA4
         AGKxRRMNjOE3116QmHc3Xy+oLzGzyVdXRdYe/3AXHuXhvEIZ6gBBgl8Qb6A3smThTZfZ
         5mB+KBdNMItSyqoDGRaBrb2DyklGWxMILpUAuKq4T6KS/MmuKshsPkdjS9/AfGT8PVlf
         +XGIFDtZ7vyzThObkx3e2QYGb2oRETTQjP57MVSVuihgBK5qfKgwcsx0f6zbo77sfqtV
         juQ1tJ2rstufYSj8XtkFX/2C/gfrl2zvZJV4jC1NafthdBuWLTKNSYQ2CaBc1jKEeWhX
         FFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551673; x=1796156473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJh0gyj4tVyAUuSEvtY7JJfcpLPqqDKXWFndc290fQE=;
        b=S7pTclj57AACn9UAiEJmV1aAhnnTWg7FglWMozz+EcDetWb+rJUIaGKDOY1rtOSeug
         qjsZQIO37g3kO+NNB0czogxmziYQgJ2Z2ViI81SpY/wMIGs3c+PF0fwjEbDHtJ61SlkS
         EJbqlutYCDgCwRaF7xjJ7kP5X1CvqYBOKBIEumFRXpy4CqUMBSV7qv5JoGQ/0bBLgTUP
         VOXDTMJJEY2iu1CDrg4XgVmOjjyQvOmZdUkyHHYXi3hQjwbw7BhASXhXEwu+CeN5zp6J
         dji31i5RJ4EL6IYlmJOjhHWDB8qEva8P69X4x+VPp36Hb51TlfnHegJz/FspQlEAxDx7
         Qe4w==
X-Forwarded-Encrypted: i=1; AL+hErGsLlXWdAU79FIu4e3rklZv3FF1OpulTSoGmgQzA6zAapr9OBeAXYDLS9tpT1iYTZohTHnSzQmDRpWFfxQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HObX5Pd63DMGMRKkS2ckiIf9Y9W+CsNR815Es62gX6jf4O7I9
	aBof+OV3QUVY4dkO02MPvRXUG/qiVcxNm26rbGBjYK/dhqD+JS4vgijUmdJy1ZWd++oXny5DR0w
	iduLsLWymfkanU569d9KodB4N/uAHEcFPS6QeqNTmXye8U3LBxX63kEXhfk/WvtI2u0o=
X-Gm-Gg: AZFdTZfcVUzQeyFpPbPkGlQy4/Tpdu05ivSTJWWmeTTaP7BLu0RI7PVaXXC9wcvNIWW
	Ik5kViwG9KWppNYKkMrl6Nwq4SIk5NrukBGXl+dJPiOOkXuR1yLHHiFj3jqffBtaqHI2iUyS0gm
	Qu+1JYZlEHIyT0Cen/ymJpSb8CkU7u+G5wZMxGBMeH9RTVW+mEpYjQ2xRi2G07LYSP6f8lhJf5Z
	KwDkUW0QOU1lFi/A9B9dktKwhP2JP6HbYtU7qQNpp5iYVCZa94tj6FACFbCZMZHiVXsxjAbpRDe
	dInYzdtwPgk8QDWeEl641mfzm+/B0Y+35yGV5tObr1brZ9c792K7D8E57+ncO/mzeUzGpuNhSZx
	DtkWRCEEkLQonbwIDpqQ0130lmilIx+jTyiNRLvDt/ieSyq1f1AnBacRh0JUkW/2emHzuQKNrOr
	cDRRTdyIdGO+cdqRANlOue/g4dnVf7xtY=
X-Received: by 2002:a05:693c:42c5:b0:386:bc42:b5bd with SMTP id 5a478bee46e88-386bc42b660mr4453674eec.25.1795551672718;
        Tue, 24 Nov 2026 12:21:12 -0800 (PST)
X-Received: by 2002:a05:693c:42c5:b0:386:bc42:b5bd with SMTP id 5a478bee46e88-386bc42b660mr4453629eec.25.1795551672001;
        Tue, 24 Nov 2026 12:21:12 -0800 (PST)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm44462979eec.7.2026.11.24.12.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:21:11 -0800 (PST)
Message-ID: <e6c4fe7d-8010-43b8-a407-157bbc09a619@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:21:09 -0800
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
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Bryan O'Donoghue <bod@kernel.org>,
        Michael Riesch <michael.riesch@collabora.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <f689ccfe-4adb-41f6-b492-97a48090413d@oss.qualcomm.com>
 <e3d322a0-43d5-4369-bd09-128152f4b233@linaro.org>
 <8741d667-efdd-4e3f-a1b2-2f04255d7c7d@oss.qualcomm.com>
 <3Qy0nxBJKeIHC6U9JocO-BGMDL8rLOkC_xTz4kT1GKMFKf86iv9Jhty6HHNLjO2CNSn6ZjK3G8TAXKLwckkhVg==@protonmail.internalid>
 <e579e40b-9ee7-48ba-92b7-78f9dfffbeb8@collabora.com>
 <fab551bc-5cd8-4ab0-b97b-f808027506ad@kernel.org>
 <P0DcNxFFqRzTkXdjBWhsf9xcIvjwIClQvC2dMKoQDIZGtFv8g9u78e5FJ7-sp7JxcMPiZROgk9a2niaSZwCztA==@protonmail.internalid>
 <773b5d1b-6679-4f68-b15e-022842f5109a@collabora.com>
 <b3adfac5-e9c7-484c-aebd-16c94f41f28f@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <b3adfac5-e9c7-484c-aebd-16c94f41f28f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3GaBsTHXGw5yvVH5Iur1YYfoCyn8Bvn6
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b05f1b9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=lbkA2V-SW6yiuUp8BYEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4MCBTYWx0ZWRfX6ENGbsBORiYM
 Lz9QBykX1BUYTnHstnYB1FksYow4A710FLgL7LNtbi9tQg7BofqbZTYvCXhKqqPkg5pAS4SL0YQ
 XD6m1HeKeuZXKJHYm4F2oq7bi6s4PgM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4MCBTYWx0ZWRfXwGuxTpUjLURO
 a8oipvMapBHC2pqR+6353otCE9McTKIndGK281SKbB36+l5i0ANUICWYmt+UAFwm4vrHRUW2xX7
 9cFbDCk+JJQXYX6cZm1W2FGhpgrVM28tH8kLcCsBqPNjdl5eG+0E4fmpbwSQMsqNc2xGfEfhYL7
 hPuY8/uS/wzLm8K/ulN2nrofNisPM52IkY3voiOWThbC8RRih9WAZok8mRD9ahjnxb3GIKzJwcX
 pO2OVJgvuEx5kepR3qFn5aTEWGKww7Vn39+FTDFFTNRGzRSyz5W5NyMxbATS88P3RHyVRW+7RJP
 FT98nYt/KFhKrxtNB31sCzG6xgcp/egnt2MYWTmOWMh707beUxPEbUz0vzeuIvKCWsrJemoatl5
 ZumPqXzuyPI44Rc8/3IZsSHC9LZaWqnnmAhNpclDLh8lzzwRRFFpHNA4kNw0zFp0V887cUYKJiV
 prrzosEUv9fRXoOrmhg==
X-Proofpoint-ORIG-GUID: 3GaBsTHXGw5yvVH5Iur1YYfoCyn8Bvn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240080

Hi Michael, Hi Bryan,

We are planning to send out a patch series that provides a unified
framework for D-PHY, C-PHY and other supported PHY within a single
driver, while keeping the design extensible for future PHY-specific
requirements and enhancements.

Best regards,
Anusha

On 11/24/2026 4:18 AM, Bryan O'Donoghue wrote:
> On 24/11/2026 12:01, Michael Riesch wrote:
>>>> On 10/24/26 01:20, Anusha Arun Nandi wrote:
>>>>> [...]
>>>>>> The CSID needs to know the symbol rate - so that it can vote on the
>>>>>> appropriate NOC/CamNOC clocks/rails but... does the PHY driver itself
>>>>>> need to know that ? It does not, symbol_rate is not required in this
>>>>>> struct no more than it is in DPHY.
>>>>>>
>>>>> Yes agree. I was thinking the same. We would not need the
>>>>> symbol_rate in
>>>>> the struct.
>>>> How would a timing calculation like in the Rockchip downstream [0] work
>>>> then? Can this table be implemented once in a common helper, and the
>>>> resulting values are passed via the struct?
>>>>
>>>> I am new to this spec so please bear with me, but it feels the symbol
>>>> rate should be in the struct?!
>>> Might be the case alright. We have two approaches we can take. Something
>>> like DPHY which populates just about everything in the configuration
>>> struct or just add stuff in as needed.
>>>
>>> Maybe the PHY does need to know the symbol rate.. In our case on qcom we
>>> vote for bandwidth in on the CSI decoder side.
>>>
>>> But maybe there's a use case for the PHY to know that rate..
>> Fortunately, that is a kernel space API, so not*that* critical.
>>
>> Then I guess we can put the symbol rate in there. If it is unused, there
>> is not much damage done, I would say. Plus there is the possibility to
>> remove it too, right.
>>
>> Just my € 0.02.
>>
>> Best regards,
>> Michael
> 
> An equally valid argument sure.
> 
> ---
> bod

