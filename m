Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693370;
	b=CbSvcSwaNoECwjW2DdOj9Ex+6P4kvmdlKuDO6HBcOn6Uu0pBASvm9ZmQhIHur9rNenky
	 FMRgZeSgD7ttuxb2ZORT+wVM6szMma/ddvoZ8fyunUg+dHvxts45WtDi7vUc8yHR/D8ZJ
	 Tcffuenp4RUk6JjDcl72vg4iqB7KZugcrCsyhM8oaPWC5jCv9O+W4dbM7D8bJG79wEmEm
	 Ec4VW/F9eXDtLO5xSySlM4GBDkHVjt9cfTen+ZhA/GovcNmLLSzoBCb8kyQ3LyROy7NfP
	 2TWzbqXi3spgNJ+t+PvM0KPYDVldOnh+6W0Sp+C6OLiPq+8CZLEwhDV5BNrQOMOmwmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I6lL9Zj57dWgnPBSlKlRN2hREBCW1ZtICTCl8DOJjUM=;
	b=Byj5PYlH6ptIiAkUtX930rka2BXMcJDWF10PC+5jKEc3IfYQ66ufY27uNwA3XdiuUoNt
	 R64qTuXcB1zYSHSv97eC8QDkRnmSwM/hsZmuarp2u4YNGUhdmcRdAClJtA6wX2s1C3cNP
	 x6P3aQP32obyYJRUjt31AJfjs6FyvUjxA+wCgGD0MePx2a50WbInb8FA02tLO78/QoZiU
	 /7bpf0+3kpeeSg0ySe8iem0deSdPXCdil/AGgeSFgUz3jGmLBnZZLYWKEdSRjRq7SDGYL
	 rtpqp2tlhXhFg55M6r0nm7Bi4e+NA3u93SXuY0mW0fTlQmMNlKxh9o4UKkfpsB8ZUYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JkopCOUx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AP2AUQBE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A382A606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A382A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JkopCOUx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AP2AUQBE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVYFP2758331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I6lL9Zj57dWgnPBSlKlRN2hREBCW1ZtICTCl8DOJjUM=; b=JkopCOUxbdpRd6DV
	7rVqG6keB47462GxSS2GwHEhhenOwpI0TwsmYUqc0DBkh2iVC2P19I+puolPoxcc
	EmvK9DUm1VMedzGfxx5Y1CDGfm+41Og5hYVDR8g88oKiWGIdbz33+6/fBDTqY9H4
	YngJED1cUuZy09nbl1pnORhdh9ns3hlBBXjoZXoeuV2eaidnUBaOihGdlk0FWns3
	eWAzotsImLvD7T4j3CIXdQAK6ZRLSLIzJkEZ20V+5jKxGJBx/KWKr75W4ltdkssS
	134RBORNoKBOUGtluzxwCQuNKgqgwdXZ6CqaSdvxUeE9F9CTt5pFTMb2VKcqHzXZ
	zbeOLA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahv8sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:42:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92134a35ec9so6056456d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693368; x=1796298168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6lL9Zj57dWgnPBSlKlRN2hREBCW1ZtICTCl8DOJjUM=;
        b=AP2AUQBE4Cq3VykfUvh7xtdqiNdeuUob/5hUFKbarKYEKBxlqExqEpBaslyZuTELJn
         28oqrYK6UnH2WJv+A1XvLRRlA94sS3zQDL75CO+X+B250Co8h0s1R6GZLBaYQi4iknna
         yK5pbFl/JmLx4fDmbDN/+LimIZPpXgoyUNiZkHL+xtY86hVKNZzdy9z4ThR7hlwxHfTb
         LBPlQKFdiLT6gjXHswD6MqhnlMSdWqT9s8Aw/o4YLSulS+fQGrkbMXujy3m5oBAu3Nfu
         qpHuTYxTfZgtFmBfGlKybV5CAOKeuXJnMGdpTjmKG98m0yhuUGxbXFH5ddXjuHm6nlGQ
         hTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693368; x=1796298168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6lL9Zj57dWgnPBSlKlRN2hREBCW1ZtICTCl8DOJjUM=;
        b=hGTQfVqEsqGiNVIiO/YrRsL9UK4Q7mi60oB3/AfGRLvHNM2SS7qOFbG581Gy4StDo2
         HSBqi/c/tRV+uGAamx58of/aVeyAWm0RYn6Qq6ZZMvZwL7VDZPeT5w1I/6QkWJz+dCwY
         gIpD8En4cKv6Q6b4exNeyYkNWtvIlmu93n5lxF50Rnc6HxZsTWWfCVIsas4rx386A6+3
         oZ0or2RcDgMMF50W4ukB6BaZhCE0EzTZeZX1IJ0HRUkVlO4DDUk56cnABWOCVPtJQkZN
         Rza7mZ6V70D3JXS3qfGn97bqeemXZKdLjaArGITQJi++cF77BUs8NUCvRfvDYW8l8zUe
         eZng==
X-Forwarded-Encrypted: i=1; AL+hErG8ql1D5Vr5Lq6gtOdIhdl8H6qtoUgPfyBnJkckJIYyo/zAYczXVA2ZV3ACZ7KubDOenqvpEiwEKJJXkgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IXdyAeHPBaqFaIGFYlA/lJPBkQzjid12WDbIZHt6CeWXdSVQk
	YWPtTbVV5iWrXDv9R7QzVx7oy33xSXp7I0uXcUjvN1MWECeB3o22NsMx2KIMDMPEH0cqfi2L97B
	+dAR05caF6l415YQQ/svPyZ3fOZEfz2MOR0G1OGqgeSBYUGatygIqEnK3AMp8QcUR2ok=
X-Gm-Gg: AZFdTZfF4r5txKAmOVm6/05A2TisGx10H61hpShRoeONGoKolGGriYwZKZ6xX0d1B6Z
	lHePZ0pBmRpdKXUQLv2KseJLA32PtWKRsNY9M56ZOS/S+5e6T9lHhnzsomUl9GrbA7Mok+3Wtzs
	e0es1We6xbcGRjqZSzXvE5LiIKdLGFZDJMxgUgJ3Be9xAKS1wSKFgZnOWOeW4EvDf+coiirsxU1
	Zc2PKEMlWIz4nY+mku48oNxyeazNDQ3LpYAWpTUIMw23nkJMAKey+ci6BOOuZruB6TFq3G1Qaae
	OhB/bvvSy222sgv+yi9EppdsAJz0XsCFuT6+zwTsIDR0RA2c6LhAZJPcFM5E4f7ACAihGq/6bGt
	DCB+BwarD8MS+3Cqid/63fDWSDV3raTJgJmAFbOQiWmYF7owG2hCR9UXVKSJqPNyEixoc7U8=
X-Received: by 2002:a05:620a:6f8a:20b0:945:ede4:d247 with SMTP id af79cd13be357-949ba82824dmr3397656485a.1.1795693367661;
        Thu, 26 Nov 2026 03:42:47 -0800 (PST)
X-Received: by 2002:a05:620a:6f8a:20b0:945:ede4:d247 with SMTP id af79cd13be357-949ba82824dmr3397654085a.1.1795693367223;
        Thu, 26 Nov 2026 03:42:47 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm738945466b.37.2026.11.26.03.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:42:46 -0800 (PST)
Message-ID: <5b3112f5-6b6e-4796-bb71-3ad92238bd33@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:42:44 +0100
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
Subject: Re: [PATCH 0/3] arm64: dts: qcom: agatti: EL2 overlay and QUP
 firmware for the Arduino UNO Q
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -DTWDxGPknH--8ndgJ2ildpOGNmbSe7O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfXz1ykRhyRIku+
 7temoZrZgtz6Nl5oeorzPmAmZRTnsibrCaQKtWE4Kngy7nIat6XWybersMfup0HWNoE/chn7EZG
 +43De7gvekk45YtEpiFPoBnt2faRZk0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX27Gxi0EfHb+4
 0iI3gIn4erhoy0WeHZuB4idmkD4tdFZN8Gh+MIyQO5+/D045d4S/tBJvIeF+bD+RgsDP9GLK1Ho
 Kdz2STCzZYI/LqcF3iBTanswuMe1IZwRmpyMpJ4UIbGcIwjSN/8waTJ0Oyadvsk8Dh97gvZMUHx
 qgvVzZm4aXGn68IojGP5qIadUyKPqvXQmAQp74hfouXEbNhUT8y1MhMbAjMgQf95RxvGRXE3e3T
 q8dnQ0ZFEYzFc37SX1KtA7EgJcvWPIM7yjXhlJ9pHb77E2fGWZwyM3L3Z8Gee5aOLVYHyupCc/V
 F+1YcBpNmdcHQDrMWoIkZZr4ZS4wFzD09R7IRoR+YrpTKOzMojIWv9jVKFh8np0gMO9/U1bwgBy
 QQHbGE14TRdsdDVdP1LGSxYmAGexzVU66xyV8jbGVcfqOJVpk+rG40JJJTf0dBA/Ay7++7Q47Bk
 4x2bz3KWbyMoW3dP+aQ==
X-Proofpoint-ORIG-GUID: -DTWDxGPknH--8ndgJ2ildpOGNmbSe7O
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b081b38 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4WvWY9BfOHavVd4mqZkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

On 11/26/26 12:36 PM, Igor Opaniuk wrote:
> The Arduino UNO Q (QRB2210) can boot an open firmware chain: TF-A and
> OP-TEE in place of QTEE, no hypervisor, so Linux runs at EL2. These
> three patches are the DT side that this chain needs and that does not
> belong in the base board file.
> 
> - Patch 1 names the GENI QUP firmware, so geni-se loads it when the
>   boot firmware has not. Where the engines are already programmed, as
>   with QTEE, the drivers do not read the property.
> - Patch 2 adds agatti-el2.dtso, following the existing -el2 overlays:
>   zap shader off, SMMU stream for the ADSP remoteproc.
> - Patch 3 adds the WLAN firmware's SMMU stream to the overlay, as
>   kodiak-el2.dtso has it.
> 
> Loading the QUP firmware on this SoC also needs the geni-se fix in [1].
> 
> Tested on the Arduino UNO Q with TF-A + OP-TEE, Linux at EL2: I2C, SPI
> and the Bluetooth UART probe, the GPU renders without a zap shader, the
> ADSP starts over PAS with no SMMU faults, and WiFi associates.
> 
> Patch 1 was also booted on the stock QTEE + Gunyah chain, with and
> without the property: the same serial engines probe and the same I2C
> devices answer in both cases.
> 
> dtbs_check (qrb2210-arduino-imola, qrb2210-arduino-imola-el2,
> qrb2210-rb1) is clean.
> 
> [1] https://lore.kernel.org/r/20261114-geni-minicore-v1-1-a825dd549664@oss.qualcomm.com
> 
> ---
> Igor Opaniuk (3):
>       arm64: dts: qcom: qrb2210-arduino-imola: name the QUP firmware
>       arm64: dts: qcom: agatti: add an EL2 overlay
>       arm64: dts: qcom: agatti-el2: map the WLAN firmware's SMMU stream

Don't fix the previous patch, squash 2 and 3 together

Konrad
