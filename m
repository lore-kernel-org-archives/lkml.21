Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470960;
	b=nqijnlhOGFd56xvqJTsOPMEpBxmzbCdevqGSqWZTNy07M2oP3shLYQzGH7zQbMXbakkD
	 qmFm2lIIdbRNe3NBA64AXNE8UTss9Pmv+lysGFNHBKFdWM9EtruTqI1SWY2SRqw9H6/gO
	 K8Mlzz9802kykvgAUACc6AYFzSIJp8giFMavXWCOeffP5K1vaHjIVDEIy8IHg1gkJC53Z
	 IbxBaz2DdM4IqQEr57cY8NgDV64cOAQp3TT6YqM55ZXyzczqbTa3oz387JNInx97FChLH
	 5ZsqAYvmmhz3BRuWYhI2tdEVkUgfu7NTJFxdYLrVOQKNfe7Se6bSRZkxUiSuswYoz/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ltuEpeeCJZ0H8nUAa0Z2OFjeh8a+dq59B20UOPR5p7E=;
	b=GOc2n7jOS3yTJJzKSzWvElydd5IpdMqGXoVACqN0WK2KgjLycdgx19SGbSE8xDmSyDBw
	 S6Mm+1Nk+ewBihM/phat8EBVfXKPTOBkalqREPWpZCSKRVHKUAfsoGzcd9Ge8nIllr7CL
	 e5xLjXoehc//J+Xw9fGRJKcb5dT9+F5KPEl+Py3S9RavMbNpEHhuj6hruGfek3Vz1Z9Dp
	 T+4YTRv5JYkVcryZ2peaGBW6Z3iJEQNPxzA+xSdvyar/wrORgEzb6v/oDJW5krmOt30LY
	 bGBAOme/YClNq+HOIyuZELJObS6Sr9wAnlF1wyQrvH5bPewqjLJQA6bxlR4Ti5l7WCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iR+TY8EY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iu8fcBnI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8A1606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D8A1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iR+TY8EY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iu8fcBnI
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANLC9RJ188786
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ltuEpeeCJZ0H8nUAa0Z2OFjeh8a+dq59B20UOPR5p7E=; b=iR+TY8EYrJRphKgx
	//NbEud+rO3GJvgvkVY6QxgnYpFaZU/Zju/pM4QStFIgC5X4wb8oKRklxKN02yKs
	fEWocKFGXBjRP+kOkQLzQyoo0uWu4daFlg/hiP36RjyAWomMSmUVZZqQbdS1rVai
	yNOFS+VQTKizQSFK+UqDh52FUwb0pvYXzWU6jpcNmNLlaYwUArZ4rOye+88OdmCr
	JUbd9No4yTMH3MltAD8flN29FkdzzfdmEPjHk3ShyWLjaA/IACkEMPkLsoENgOP/
	z0becPFmRRp2SmxQgonifx214vwUTxwfT9S8EsL2+G9VnZYJeYUfPKxdVBTzI7by
	+ixikw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6sr4eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:55:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f2fafeaso445837585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795470958; x=1796075758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ltuEpeeCJZ0H8nUAa0Z2OFjeh8a+dq59B20UOPR5p7E=;
        b=Iu8fcBnINm1s/7RhWcQtoLJmurJ5/O0gOVVrCAmU0LKpt/afonGkoBH/vSE2P6RqGI
         4dmkqaIKcglofGzjioj3C2rfJQmmwzk0H69jO59Qm6fb7itNPua16yOe5OA5mnUo5gLs
         uNCjJDAyCM2WFccvBihuGA/vPovRvkhTIa3r57X4CJ4D+7DziQFK8K+XCEa3g8jZiQUB
         CQZSyo74suK8zBytpVo1jbiY1nhfvPQMN/e8g0Hriyr0zsGCgtfwt2pQ9Umf8ih3ZEdn
         kmQIfB/pkryXH5raqkkM7vy1+ZR5FvVGW1CDvrYl0a1SnA443bmCnbPoRdDwc936zcsf
         bJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470958; x=1796075758;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltuEpeeCJZ0H8nUAa0Z2OFjeh8a+dq59B20UOPR5p7E=;
        b=PHI+2+7i48Lbxzf/IABijmjkGbdsT0gPckToTeRHf0LpF6BDkVFKuL22xebRN5fRU/
         2OGvDja/kby9h8EsIjG3ZCJH48yyYsPSkqSDvrUqT5A5HkGZx9tUTB2F4FxzYNRz94za
         5xErz0zYum5e36CPtch0G/ZyziCk/9jhKg+cflm/Ad0nGHYDrN3gXHt3jgG3TeTJRhms
         RiWCJwcjcK3fFxYdTPsJT7Y1UfWsXYpebm9/SZn8HFl3u9Q/mbCMjRaHLZBvz8uhEbnP
         o9QMfGSCyC3yO4sRHjfgvwmqeCQRzqzplZGZ7r+/M/8sUcWyLWddVj6OLAWk9sU4EEBr
         JrRQ==
X-Forwarded-Encrypted: i=1; AL+hErG6qJyY159mJkjvvUc0MnZXtqJVMMVXl0/6G4gx5kKMibOSZiXTSaQodpWJLUUepWozzDMlukFPFUQJtdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Pe0KU+O41E+URFUPOJuBf+ZXiaEZNQd42ymK8nSYp52w8vYxX
	LNDYBx+Y4vRzzV0QbBeqCdzqCAtIbPtJg/u9+vTu2xsw3qaGPfLVYB/mzKAHE2+InsG1IPq+1s9
	rGBZvrkrwwgUepvhUrVSN+nf+tbT4y/lbOBuKgw8JpDWrf0Ex7be4fVD0HWtJHbLfIZY=
X-Gm-Gg: AZFdTZc7WckBcUAU8Id9go02rJDVGJxBcrtvbSh4IAhrvSW1OA7eAYPQ+AfbF6YTzgv
	hSVzU+NDJhMPCTGhOSN4eJN1OaNGwiJ4WVGnnmvyCV+qAA+FzFOMN+kwhp+lGZu1ol7C1L/TgBQ
	cEXOWSgb1h5eqGcgjV5hYcKLhbCS9s9UhbVo/J8b41K61QqwQZIp9dvf5dGqqvDv2DkRxYa236P
	J+pB2odFJS6Lvwja46MU+G6ysuZuGE1WFPzcLev+oRUGnyesr9HBAQs1J245osgm+Zw+51rIX3C
	u37bbzWDjWmpFEL74GIGKN+1MheGheFuZtDQ7G3UlT11+HyH9n7MaohPqm9rNvQSSQKw2i/4uS2
	17odMAMgxJW8s7c6gg33Euo8kjvt6wBjfFD061JSertOm7i6hysNV1PkO6Owm4gV3xo82kgBX6t
	U=
X-Received: by 2002:a05:620a:600d:b0:93f:2635:b6f1 with SMTP id af79cd13be357-949ba7e3ac6mr1929197985a.8.1795470958020;
        Mon, 23 Nov 2026 13:55:58 -0800 (PST)
X-Received: by 2002:a05:620a:600d:b0:93f:2635:b6f1 with SMTP id af79cd13be357-949ba7e3ac6mr1929195785a.8.1795470957593;
        Mon, 23 Nov 2026 13:55:57 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm24037890f8f.10.2026.11.23.13.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:55:55 -0800 (PST)
Message-ID: <9640ba5c-a538-46f8-a80a-385c0631f9eb@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:55:53 +0100
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
Subject: Re: [PATCH 1/2] soc: qcom: socinfo: Copy new SoC IDs from bindings
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-1-eeee0ffa25da@oss.qualcomm.com>
 <awQ_90R8_uGWm2Sz@QCOM-aGQu4IUr3Y>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <awQ_90R8_uGWm2Sz@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6Nm5anWJ4tOwPZDTJGT6bonePA_VNQEu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX7ouUErPw5qSt
 aC0KbTon/fgIkFFlFHiX2LQRC9pL3GbZMFkVVZMp2gYPUfsN9xKCulKpGmAka0J9FN3/5yxpKUZ
 6XtXNz5AEUBUdpS8YqQ2WsViFLPnp7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX8uSA+LjFAyEf
 m67GJFO3o28UKqevRudYR0uGawVldX5JB7jhvEuviV7GbtEtn9BMguD368Oe/kBhK8Fgiy4AxQh
 3qsXsiH5VBeL8mzZuGNDEq6hW01NYhGBPG/fExsVQKnUioI1XqmqT4Oerm/3dejT8yJEex+XyQ/
 tFkQ2QUSSArLtaY/7JJhZfwi2xW6YKqPjcFtqNsIjGcSlWNiL5GNWNR2mkTg00EaRnQP0mVRZxF
 aynTxGD6BAMEIkPuxyDBC6YMFUYwM1ELSfBXWx5csfXudzuUiti36cPC+4AYY6d1L+Tvr9F11ES
 xqy90SCjPDgzqODy4ROlctF49JsIwiSCZK2yM60tmvo+mNPZbphasHRoPna2a3haZZIzLL0Whou
 oGCvhDidutIZVhZwR5SibNpBBx5BSTX8VLpk7jN7LzmNt34HRvdWwc4LFiKnZTObpJEpIFM3dL2
 trm03zHOyIxjRsZjb8Q==
X-Proofpoint-ORIG-GUID: 6Nm5anWJ4tOwPZDTJGT6bonePA_VNQEu
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b04b66f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2dp_lxLZj-RLOlf8FDYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230087

On 23/11/2026 14:30, Shawn Guo wrote:
> On Sun, Nov 22, 2026 at 06:46:20PM +0100, Krzysztof Kozlowski wrote:
>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>> currently used only in the socinfo.c driver.  There should no and there
> 
> s/should no/should be no/
> 
>> is no in-tree DTS user of these, so none of these constants are really
>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>> that part matches the concept behind DT bindings.
> 
> Not quite true for the start of the range. The constants themselves

I did not perform global search and replace that time and not sure if I
want now, but I can keep the few values if this makes sense.

> are not referenced, but the values are used as raw numbers in
> qcom,msm-id:
> 
>   qrb5165-rb5.dts:                    qcom,msm-id = <455 0x20001>;
>   sm7225-fairphone-fp4.dts:           qcom,msm-id = <459 0x10000>;
>   sm6350-sony-xperia-lena-pdx213.dts: qcom,msm-id = <434 0x10000>, <459 0x10000>;

Indeed, these three are actually still allowed to use that property.

> 
> So QRB5165 and SM7225 are still consumed by bootloaders through DTS,
> which is the same category as the older IDs you keep.
> 
>> Copy arbitrarily chosen newer SoC IDs from DT bindings to the regular
>> header of socinfo driver and use it when needed, so later they could be
>> removed from the bindings.
> 
> I would suggest converting the boards above to QCOM_ID_QRB5165 and
> QCOM_ID_SM7225, and keeping those two IDs in the bindings. Then
> the in-tree DTS users become visible, and the cut is no longer arbitrary:

Not sure if I want to add that dependency...

> everything left in qcom,ids.h is an ID actually used by DTS.
> 
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/apss-ipq6018.c      |  2 +-
>>  drivers/cpufreq/qcom-cpufreq-nvmem.c |  1 +
>>  include/linux/soc/qcom/socinfo.h     | 94 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 96 insertions(+), 1 deletion(-)
> 
> [...]
> 
>> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
>> index ba823a0013c5..cd2e8eddf3b5 100644
>> --- a/include/linux/soc/qcom/socinfo.h
>> +++ b/include/linux/soc/qcom/socinfo.h
>> @@ -112,4 +112,98 @@ enum qcom_socinfo_feature_code {
>>  #define SOCINFO_PCn(n)			((n) + 1)
>>  #define SOCINFO_PC_RESERVE		(BIT(31) - 1)
>>  
>> +/* SoC IDs */
>> +#define QCOM_ID_QRB5165			455
>> +#define QCOM_ID_SM8450			457
>> +#define QCOM_ID_SM7225			459
>> +#define QCOM_ID_SA8295P			460
>> +#define QCOM_ID_SA8540P			461
>> +#define QCOM_ID_QCM4290			469
>> +#define QCOM_ID_QCS4290			470
>> +#define QCOM_ID_SM7325			475
> 
> [...]
> 
>> +#define QCOM_ID_IPQ5404			671
>> +#define QCOM_ID_QCS9100			667
> 
> Since the list is being moved anyway, this might be a good moment to
> fix the ordering.

Ack

> 
> Also, drivers/clk/qcom/apss-ipq5424.c includes qcom,ids.h without using

Sure


Best regards,
Krzysztof
