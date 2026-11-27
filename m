Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769350;
	b=ho6JiFTFUDdbMgapaAzCIZQ5ETw8uVhRJJ9PEyXGRzQZKclv3kOLdnIXXouH4ZpqRGsl
	 qDWeqQ+nBYdp2zm6N51LKlDhYyyrgFV7fWAF/XEf0B+UwgYccIKQumfP/hhPPwNP/LHdz
	 eFzjJJZHZH6uv77f85MqX11O1r9Ir9WRMWBJLGJGOB2SYP1PDmTGInoRo40alu0doOaAs
	 6LZpdv0XuY+RzF4S3JOssijBV+/oNAsL8VfZ/UgtBI3z5tMiqPrLVXf7EWWRrsylbp6a3
	 Scndm4tCDLSGGPjmilhCoeEF6sPuXDUBPfjV23gWYWH/+B6dxMA+mC9yu5Sbj1pfUCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=;
	b=XIPEXhRRDdC/8vlKHZtDe2PZACEa0EGkycvrXSHzEek6GhPDaf054wQEB0Why02O3xLU
	 mVerPvb+bTvNg5yhhfDNEL8TTjSRHA+q+U5Zrcx3r8e9GOvuzQgJgKQwhpoFm4+6cOBgw
	 A+ZoQrQ5nFQbDFtWRMnDAi45YxtUWFftJcgdwTkII1QhnJDInIEPpnjSXgrBvrfSYE2gc
	 Bm3htKPQCygbjDgmL6Z1nfvaPea5HMgTbwvDCNIL+6bYcVGypbUnCkKOvqYE7t9UeNk5y
	 uQ+XCNCgjh8OxD7o623FDN0EOgZpALCOr5+6nWTFEeZLqBepgg0zNtQjsHbTkGbYYKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GOe0/uRS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4zxEdJr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329B6606A69D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 329B6606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOe0/uRS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4zxEdJr
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GN4A1779888
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=; b=GOe0/uRSkU8GHkm4
	jfY1ctRutj19A+SOZUVmlj7w6bpKHHBs5Ul+CQoIEquKlzW3A5X3C4qF/g+mxVmt
	y+6XU3zuXX1Gw9LME4mZ+dP+eM50S70LnO5vRK9hdXAkcoibfxyi7oiHuZm9s+IA
	+dS2iIak2VcDw5LrJf64jnTzVz9FxAvEVzNOga/MeVrp6OqJwCniLmAoRYhTwk/Y
	KYaZZiV5b160jBOWucV5PMB6hdUAvQ36DDDZK3NV/lhammz91I07v2w4kM4OiEUl
	ax5F19uhiTHB8QtKE2dTt4G1DbnDpMQFXkxLWASYOHpuTJJXHcssKCLhmZRvX+Bk
	CG40BA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhgqy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-946038e22f5so533741385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769349; x=1796374149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=;
        b=E4zxEdJrYDJcXogKPmvBdZQm4r+9Q2zTkUqftWp8GhTnV0w9T82Fs3XjKBsn7EsobO
         ITE4I32R1KRQg9UTTRLGnYRMI0ZADJ3sHKXOUMcxlf6TELNRCRqPSQt+S4U+T/zkPgWJ
         BbHxZIQ4OBEC8wzEjXTb6dAUCZOe9aBVXYPuO7dejzNyPgWEVpNSFZ6W/FwTESTTWJ8t
         qaDIeim4INVkOJdURvbl8r+EuOUPpncIMc3H/DiLrjXn6U8Tu1q30oftnaFSxf6Z0RbI
         Q9fDL4W6K/eoYniw+FQDp080gBXUfAF8FcC8yRIrC7Fe5SpI9YY9a9tQ+6FUHJZUhm0A
         X4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769349; x=1796374149;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=;
        b=o7wYWmzsMVPTtZMVqbE0ds0ShynNc0NqHhhayRga+kAL9Ek/ETuLiGXcLaaykljcTa
         LAuJ8vKBpfADwjxo5qsdz/Jzv86vFUwbNsg6zWFVu7xMBGMuoxmfWn/8VFXYmKiFDh7S
         TJdA3vka4hFnyet5VNqG4lhgWmZfaIW+R/NoelL6wGhKzOa+hXnJ8YbIMQSB4GnDL4io
         9WHZpwjtG1rEwLHtcXhSvXE+adWZSJ4IcPDvY9E7g0Me14h12ZwJP5Vntk8tLSxoWQNh
         GNLneUtnlJclUuMrYhyzDbUIJWTPhN720hQcPSzourMDDM50N92AK4wF5wvLtozM+t5h
         LhqA==
X-Forwarded-Encrypted: i=1; AL+hErHYL5dmqSY3AtET1jj3iG4w9cYfdb+JJm2ViVKfnqKGBR1QQJDMnRZLNeSNa/Vi68v5nPY98Q2t+HA9hgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TjYUAUJHH5RX2uqPVoxAwAP2zLNvgGgmfmcIdJU5IUfrtggFC
	rBHR6pqhDxGnxrvnb+YmZHXcoMRKHmw2/EsDqCoClGshYvvTwF8MmS64Lh6jjlSpeilqxLU19xi
	YqV826CTXlas69snHGFSHjaRu1DtWjEchboQmKnkqLqM0CifSq2bWVviZHD29F0v8qo8=
X-Gm-Gg: AZFdTZfBpbCSPSuGc/V/a7ah4awfIedspmnIaKcA0IQJdFdIIxES4FfsOGfrbAiz2Dz
	0lQJofiW6HQdI1QHG/+H9p9l6WU1gqqehmr6f8ugAY6g0WbRqM+NcG1vcRw/N7Zmzbzu/Actj4r
	LC142xCOlXmiarx7Uk2XjzTqh9aAfKUBm2/Eeus7NQgMcVyjJmp3P7PZTf2sIToqP1tJjvyh6Yc
	nWVBmdoEGYMClz+gVwUxAD5yb5VyhyoENvBL/4ELKTL54T7MHtJuDnRByD3LbodFGms4tyHzu8q
	2Zj9oRL0Bhg5hAN0ZaFZxNnushmDMczRs8lyGTpChq13mg9zVwjg5GDERF8Zsyo5XSTCtce+JBY
	dZPhgnr8Vi81RA4cdW9HXHAJznH0xy3h3IYvtxpWuBYsEkwTv0H3zOaOqyp2DVkIS4MQzIRnw5p
	1QNw==
X-Received: by 2002:a05:620a:6c17:b0:93f:167e:d990 with SMTP id af79cd13be357-949bab3264emr3923740185a.50.1795769348620;
        Fri, 27 Nov 2026 00:49:08 -0800 (PST)
X-Received: by 2002:a05:620a:6c17:b0:93f:167e:d990 with SMTP id af79cd13be357-949bab3264emr3923736785a.50.1795769348204;
        Fri, 27 Nov 2026 00:49:08 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm821554315e9.6.2026.11.27.00.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:49:07 -0800 (PST)
Message-ID: <d24318db-c2a7-4bd2-9216-1ed5eb90a226@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 08:49:06 +0000
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
Subject: Re: [PATCH 7/7] arm64: defconfig: enable SDCA class driver and
 WCD9378 codec
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261126183806.172485-8-srinivas.kandagatla@oss.qualcomm.com>
 <68d1f55c-ddcf-4081-8111-9773c484ca07@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <68d1f55c-ddcf-4081-8111-9773c484ca07@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX6zwluW+oZF8Y
 xOYXdvOxVLpxgC4LxIETnsDpBq/s86wjyHXfih9kDfDpYpT9Debtr5oZoeifA8qOznlZc6tKCRm
 9UFj3BqTbWC6kmBnOI1hFikzIvJ0NSU=
X-Proofpoint-ORIG-GUID: mm-bmST106hC2O-fXgWhbmObd-mSBMWI
X-Proofpoint-GUID: mm-bmST106hC2O-fXgWhbmObd-mSBMWI
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b094405 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=R3xOvuxQfeku2NNc9hcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX+x8linoeQ1XA
 utN78uNF6K2FiYL2h77L+TomTN0Lwwql7DfByPJkJtLeit5bfg3LRdkNJvzWhoxpARReeHy6xVs
 TV53BX5ec2p4mMqAvWl8uewhZafnNAhNMWCdmZyGtB72ehkK8iNY2E2PZJosLtnb85iQGtAKLUF
 /bAuvT4Yf5NASuUr8KT43YExOTC8pTNHDr6D2JsZVEBPtWv+Z5uIRtxc8dxzU6gHscG3+qdopRK
 I27sdvkKl4nL2yaU5YHP5UOqNVgs4qIvhK7pRGK8L69YVAByQA4+MOPCUAWp+d0WPMMTb2hqH+g
 sql/rWKJfvWoTV3sb7+yoX6p1Rp2zQVEEj1ilMqU0KTMelqYVmNyHmYvAFmMbBsLdVnTHcTfdrV
 iP6zwJw5ZziUto6cPZD9r25QBegogR0J/AGPhEQDqlK+Z4oCo2bSvWrSx0V9KCih/9uBgP3x3aP
 sgj5UzCOvdGwD6t9sEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

On 11/27/26 1:42 AM, Krzysztof Kozlowski wrote:
> On 26/11/2026 19:38, Srinivas Kandagatla wrote:
>> Enable CONFIG_SND_SOC_SDCA, CONFIG_SND_SOC_SDCA_CLASS and
>> CONFIG_SND_SOC_WCD9378_SDCA so Qualcomm Glymur-based laptops have
>> working headset audio out of the box.
> 
> All of them? This is board specific, not SoC, thus please name at least
Yes, this codec using generic sdca class drivers, all the glymur
laptops, like T14s, A16, CRD and other models use this codec for analog
audio.
> few upstream examples.
Sure, WIll add that in next spin.

--srini
> 
> 
> Best regards,
> Krzysztof

