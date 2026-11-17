Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948014;
	b=FMjqyNoEz5ulN9dpl/wtTNhJRMZWXqOGJfCZlXGpR1hPD9tYEZ3xbNv57o3QjG0Wp2VM
	 niGgXJFzuxrynIDD6K8VJRPgcxIjZYEJlKz85tO4zsUBvCVEDCd2b87cPwCHScGXtgOLP
	 22340b+FxHN9NHPMFGa2fOlJzpBcpVunn7o0AONjTHh4oZAvZC5xVNoikHc15/PecgAr6
	 pN1p3TgfSa4lCgfkOENLSyuejhE2aplt7jwYc11KcHecxO2kETXPOqrjAwAiFSMA1lYij
	 AGHC/19424PVD2UCVJRnocwQOhumNjxdknSbYaQsnBjC3gCaKw5fyd/w/Hw5QBTu6+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948014;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6EdTFJwYriIb4IdCOT1qSEgGV4PWIdtBBRJW54ecre8=;
	b=nHV/8ihc1UF1AqFU4mmBfvIvBv6velO5fyPrn0rZj3keQexL/APGYdY71NSwGKre1kfa
	 KAP+kMW4wLorkeXlpSQFyiaDzrHzTpfSaW5I2vnj6CXTn1JRF+gPEPui/fJ83wNo7+jVI
	 xkrsxdykXMX5mkb7E+/z0qV4KXTmhvgLDEFT+4F84+EUy9KYTefBL1p6Kbcz+7jEgCoLG
	 rPI0HtMUAdkeCgHLIrsuKrW9SoHLmEWmRnVGWUwjp+vz1PQp1t8obaFUDajcnUV853je/
	 P/qxAMMJMoBIpqAzvHSyM8x0nQITXSI11GlmOHH7zkFbUGgBmlK5PS6R8WXx4Ju4Ngw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqJwLEzn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jeaI2QF2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096F9606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 096F9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqJwLEzn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jeaI2QF2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ6J8c3997253
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6EdTFJwYriIb4IdCOT1qSEgGV4PWIdtBBRJW54ecre8=; b=ZqJwLEznxyO5/+t9
	dNksUVKxE4vWPKKN0pfkdNvMjGadFAsLAucDT7lWDgUjXtN2fAurs11GjG4SsaFb
	4d5VSun5AOUeKU6IoL65fgo77p6jlB+vMsHkSGZPISXK8CGzbaYhhjRtTgom2YYX
	FmX0aqO5UD+Q5CE6LQ/EwDBxiqjiswmSggaboV8+trVAVXmz22a8EukWSdmbnhLH
	a2Zfy+vlPHfc7Yw6GRrKcCUXw3UdP3y1f78F3Doh0IxuOUdfw3hMSg6pM/vn+47l
	HM/T44CYjvXHPM3ToYlkr3lTvegCqxlFJeOXHRROHUsUzEo0MxN9L2QjM03O9B/A
	aB18XQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv12m8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:40:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso416705eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794948013; x=1795552813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EdTFJwYriIb4IdCOT1qSEgGV4PWIdtBBRJW54ecre8=;
        b=jeaI2QF2Kndz030dEbpShU54M03e3pF1POIQul20/CyhQCcDhMmjpdEc3NdVhJSWpk
         Nv0hCVZuosHtr1D9bL5jDnVQm9xodAlX3hLChkz6FpK5aDs8/B7k1jV611jQVbPf4M9+
         Tkaub4kAK88a/pD69KwUxGMp4RvaPiFMOPp5sRNQMmiLsk60NfP7LbTnS41qzgtj+0mY
         XG2eqwCt70tsKGJgpnoGnhS4huxZcpJmk7EGkbDBtTsR2Bb7GQ+Me4YLx8Ob0AlrOiJ8
         oOnCto7jIgEFY8ZnmbxBB+nrCFjiztrJQxxiA/ot5QXDfwwU7K00cHnoy3HcDyhV8W9r
         zBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948013; x=1795552813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6EdTFJwYriIb4IdCOT1qSEgGV4PWIdtBBRJW54ecre8=;
        b=2jTnnQ32rvdnwwD/Fy4ms6ALng8GOHcKehFNXOygfTa5Ba6U6v3UzMJ4yaysMaTYUH
         JAMid90ZHthCyYH8PBmm9cLYnENiy6+zK7nZev5TjNfS2MwzLtAq151Xl1RkN/3O+qk6
         Mw9tFYSoMhgoDX9L3BBsg9cFp9Hnq4pBtK7wxrp8SMoOSYFVDYZCotsvdAcT+lLvQRHx
         hQjOOyaBDuMq3hVwolg8pk+KzxsR0+O9qDqNwLbg2Dd0pyTO47Ud79pAWtACM9LS/uW6
         d/Ez/Ul+3KrzHcFNLRDtJW/u7W7/MEfcmoZcx7+JWQrYIWVutGcz+H2E1VISrQzZJozu
         ++KA==
X-Forwarded-Encrypted: i=1; AL+hErHrR88doIROmms9VKWlQNy6Tk9CoPn7cmNfv11hWFWzeUKRCGUWZ0Jkcdin8bFSElWAoBaRfQgBof5SCk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XsSSdVUKBo7TNzR/DUJGdw22bRwehSQU3+L/laPWAvwLyKbEV
	PZU1uiwk+KfkYG6658pJvZ/hh3Kpk9BE6n8y+UGU91KPvxAK5NhnKDfd+9kLSWODXSraYnf3h3t
	agL3BIoZhzqWfWMbzgTeDE5FqXe7sw3MD0sAVAXfRGBBEL6x8PXd1Et9lzXHR7jsDqy4=
X-Gm-Gg: AZFdTZcxNIwLsvRSVo3AFk8jIEsbLJajQeXbFeNC/bEeIWdy8WGbuCqsmf55XxzwQFp
	5YF/obT64Kb7d2VQ+vXaWi61Lkv+aSQlDINRXGDfaWrobI+XEJG0YaJ8EgcEUyExJ+06Pgw4i8K
	wd3JlDE6rwFGhDhA9TPz/c8GNHgTDLdHuJVkOO5qzijz8TXmFUmOPBTPWkU83Lh2Vb83TiECKDW
	rOBEFsZhfOn+43MSYNcchCsuJr8sdyNPBTseMTVu7gZ/GrnbVjAO8jrNPKDHPyWtuOAWsiwX+pb
	aERf0EYKOtXKVw1SYf8MgDMkQrt8AcD6l6srvCch4TsCMIb0lgpm3rRtLlQ+P9DazonHHJagYKF
	L2LUeF+28Rxsu9qttEgxe8+gNfit1LwHyDUZMvnkXjNNpIf7TcdIOeiM0WBMQOz0vz3PIYtGrke
	6ttDHQLd0fkML/L1A20ls3gA==
X-Received: by 2002:a05:7300:de4c:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3828101de20mr538644eec.20.1794948012311;
        Tue, 17 Nov 2026 12:40:12 -0800 (PST)
X-Received: by 2002:a05:7300:de4c:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3828101de20mr538610eec.20.1794948011623;
        Tue, 17 Nov 2026 12:40:11 -0800 (PST)
Received: from [10.73.198.203] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304ff2sm456352eec.6.2026.11.17.12.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 12:40:11 -0800 (PST)
Message-ID: <c3a45db8-43a5-4aaa-9251-5f6231e83d59@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 12:40:10 -0800
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
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: Differentiate clocks related to
 the USB block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, jason.pettit@oss.qualcomm.com
References: <20260930-qmp_phy_usb_clks_v1-v1-1-d4dccc9eb263@oss.qualcomm.com>
 <c1abd9d4-98ef-4469-b4f3-94a8dcad9d0b@oss.qualcomm.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <c1abd9d4-98ef-4469-b4f3-94a8dcad9d0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U0S1a2ZQ1o4YNb0vpZW2_tfkiMU8bAA2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4MiBTYWx0ZWRfX7AL0cUikJYrX
 dCRpn1AZ4jXmmfWGJnkOVIgTn/cfEyyGOZqnKMTOYh52n1WfFb8VkTecGX9Wvm988jwfhCmNsul
 Z//Q2L+Cj9qTOr4RlwsNTW6rc6uQMf0=
X-Proofpoint-ORIG-GUID: U0S1a2ZQ1o4YNb0vpZW2_tfkiMU8bAA2
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afcbbad cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_nty3mnF_QhVk_yABmMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4MiBTYWx0ZWRfX/CBgW7b1HmfZ
 rFC4LpFbcC4fJJ/y1PTC1AUjs6RkTKAffjHogbCGEI6aZAFB1Rnx376RKe3G845/FRyxc0PfdXQ
 zERD+cbYG49iReFoLZ2hkmLLx5Vq0lk/dc8VHHbdc0KOdZMaPrn6WUSkytWgWgGUlKOkdWgs/rL
 9bgp4uXFQNR9owefWs5n6iHNmxIX6kxfrckf1F09AAww8sSrMAFYPfuKYcNJO17epLhenNpoahv
 3jSIGnIRQ5MdEuVkR/9Auct8INbViMVBYOINmDNVKA4kExBxHW1yd3jb3qKHBvOkfDu480OVXci
 QsPcnusqqaFDCGPvbeQBgEKMRec/5+XZhGUFjfzSEBYptk9V4TX89Tv8XETs5mOW68RZi2ecl1F
 Jmh8BZo6O15koX6TKf53h7Fu3VzQieIw3uJhNLVZSTiSNaBepha5xhpY6wAPVbmhOWQAeOtD6XM
 f9dA4y8FFnjEa42uqhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170082



On 10/16/2026 5:13 AM, Konrad Dybcio wrote:
> On 10/1/26 3:16 AM, Wesley Cheng wrote:
>> The Qualcomm QMP combo PHY has a USB and Displayport block that is
>> sourced with different clocks.  In situations where the USB path is not
>> utilized, and only Displayport is active, unnecessary clocks are enabled
>> and not used.  Split the current clock list into USB specific clocks,
>> which will be enabled whenever the USB initialization routine is
>> executed.
>>
>> In addition, move autonomous mode control specifically when USB is
>> active, as its primary purpose is to detect RX detection and LFPS
>> signals, which occurs only when USB is active.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
> 
> GPT has the following concerns:
> 
> [P1] Don't disable USB clocks that USB init didn't acquire
> drivers/phy/qualcomm/phy-qcom-qmp-combo.c: USB init/runtime suspend
> 
> When USB4 is active, `qmp_combo_usb_init()` takes its early return and
> increments `usb_init_count` before the new clock-enable call. Runtime
> suspend then uses that count to disable `usb_clks`, although that path
> didn't acquire them. This can unbalance clock references; the count
> needs to reflect actual clock ownership, or the USB4 case needs
> separate handling.
> 
> => the USB4 state machinery is a bit fragile.. but perhaps an if or
>     two will solve things

Sorry, didn't get back to you in a long time.  I think this should be fine 
once I add the proper enable path in the USB4 init routine as well, since 
it is required for USB4 to work.  So now, when usb4 init runs, the usb_clks 
are enabled.

> 
> [P2] Unwind clocks if USB-clock resume fails
> drivers/phy/qualcomm/phy-qcom-qmp-combo.c: runtime resume
> 
> The patch enables the common clocks and `pipe_clk` before enabling
> `usb_clks`. If the latter enable fails, it returns without disabling
> the earlier clocks, leaving them enabled after a failed resume.

ACK.

Thanks
Wesley Cheng

