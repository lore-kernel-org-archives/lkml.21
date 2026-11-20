Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157279;
	b=tkHtHYtvSAelzh/7iLCnySqtW6JH4sg8Z7sHxkIzAZZjU/z1KmqxPb9dNeIeg+Rrv3OP
	 Hix59/TaRaltXuE3kFxlK5Etzbrft+2pdXPOU+3mgmrSB9tdVjnEVkgIHlJRwVQVRkx+f
	 FyZBUHX5ZJuOQWrtBB29EZymNRFtXXT0CzvwuNoGKMZ9nxumIo3A8ssjnYcJkBOojYolx
	 IskvjjNQFlOCmih9P/47gIj9nuY0A5XstEy+Xn+BqVsw9usieQt26EoljyPdN0+DlLlLQ
	 95r6NSHFlJ+BPIZzKHwNU1g354BQ5qWfq3vZnyz4s8NoNfePnn4u1BYtZhMRvM14H4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y5IdSOiR1ak5akmhkE6pI8RojC6EEhOJLCG9nz5PurU=;
	b=Uy/K52gviLJoaFvQxtSI8k5tl8CtR9z3i4UFhutN2TjGAh1NOXRtkmr5bdnfNm8uocH7
	 I9uxTM1f5kTvYi0eIhj6xMyEfr4nHNgNgyKXYfoMYfaKyRqago0Mfa8VLeAiDOzpW4+hu
	 0XDFu8myo+AG2oO260DhJzdPC+VrVSXVXPINWj2iJ/28XZpHcQ7xrmS9h5W5uMSPyj27M
	 0bdX53U5DtXETMIwGyqt+TLdHHsNtAqR0nxiTjrS1dLGuREjo5NQTs+XaUfuc3AITaIZE
	 0rv0HmnES91eNxSIjro3+FeiLpQu97C4qKzRCMBF7VRC7/aDmfmilJ8FYwcNBGw+azg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hkI4QR6u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="UoL7P99/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586B4606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 586B4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hkI4QR6u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UoL7P99/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK6JHFe3393026
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5IdSOiR1ak5akmhkE6pI8RojC6EEhOJLCG9nz5PurU=; b=hkI4QR6ucta5eWG1
	nyjdT1vUjsi3zvTTbwhohx6zH3N8uS7jrj1zPoY9ZP+PiTbUTqkHLSZ4KEMtSal/
	R4fcnQ8nz4z3aaQirfBCv9WObKJw3847lOJVxS8bm5p6Bj5jrQluFvmyVDxNvahF
	wRP3KVEhK6a9+xbLOdhyrXIXeJVhCd6fGhz75pkHLhwMiPtGxabtmCC3mACSej+n
	EwtePSZAQXWkWTKCXRhdTvT2iNMnnA7EjaLdUn1hXqcsYmDj18kjvFAQnlV/nw+v
	2Gfjcm1vvOX1uPdcpGe7Kwf1ILb3uM5eroHPBXjmtkFSJ63R8NFHJsrOH85dPJHT
	RfBX7w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu803sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:47:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed05b3eaecso5637515ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795157278; x=1795762078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5IdSOiR1ak5akmhkE6pI8RojC6EEhOJLCG9nz5PurU=;
        b=UoL7P99/nP8ae97HuQdP+qRNbqfxhH+rHwpJxRIn07lLNpUim+kbrE9SCySebAuZue
         7gWiDCCrvbIYpwITMTn3K0XPBkbcjrACh+9iJsQztZMK+sVE/hDiXJpkY5p3KDUqJXrD
         eGLKjRkQbYa/ZWStHRYc6CW0mKgE/HuhXxLc7ZOLdgiHivc4RbiVlRjOKO3VyPzRp4gR
         7tjtK0354Ek6QaDsVqhUKTxcwZsBKaOc21DLfn/KeqAQN+6Pws+bTI8sMbrIrQuldDEk
         Y2KnmD2BgR9kUXemi5T7dHdHFxp/yRzdZ2Y39CDSVu020BWHFhYePzTLWX8IBhGxbfsh
         Z0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157278; x=1795762078;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5IdSOiR1ak5akmhkE6pI8RojC6EEhOJLCG9nz5PurU=;
        b=VQ/Ett+d2LllYGVZzI+wT3745tfJHOP6XIhKN0iDhPjpo2M3W6QpLeFrnCxoivuHMB
         r2Ba1BRJ+2tyKCv0GFp3fgukzMPG5P8CVpBtlqEYRIpfqLUgJr+sHNiTOkSCTNcY28q+
         BMAe6Tjr03PVe1IGYUcoK8HHl5ALFjlZVba/vzbiO050uMfh5F20u1ab8izoi8zA/WN3
         l6x0PTYtWZjWR0tFiZZ/V4oYu+zJVQWxEuV7G6/I8TMb4OjTOsltlmsojDWF2omKnZ/d
         aygx4GHXrdmAWMTWxSPZl9AttZSjihhwUpyavctJU0O5R0Ubd3BIVUGMVxpx5hn55Vdo
         6wOQ==
X-Forwarded-Encrypted: i=1; AL+hErGilCGnFfaLiRYUWr/9oBeNgRLGD2PU16p8shVd8evMTQo0yCDxOEvCGRDDxVzXqfqrbJEasilaD4TifBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+daBCUUqApftocArEgnGCAs+SMUnAYUGCmQEclsAatjjr44qIS
	UDPK2LwQOu78fKGzkCN5UJJJmQO63tToFf1EdD/YPKCWD+uxjK0vZmtJo0o51itxOaC5xzVA+kz
	ocRA8odgRTldy9IwVwCJtVsWlalEWJjHJfAlpkXiygXMjEdmr1qDlJSVSiStaocxKYv0=
X-Gm-Gg: AZFdTZd0AmxlRwueWjKxscsEPH2hhHj8P3n1ieS7XvX4t1dNJVx9PYVNic0LZK0KTZm
	AYBcobUZHGbKObPUns16hpxQojCmraYc6MtzMb4q+zlagFUYEdCwpL/+Y1BgOcb+sxHsShNxB20
	YWtJGtGXh8dxA/Kin3Rhh0f9gwx2T32uClP3Z/vf3sei7ARu3QjPUuSU1Bwm1Clhg8+6Wx4sLm6
	PJC2updM3ZeAK7jBG4DTGWNiWvyZTrmTQ/ja6auAb5k/eiUyR5T/RUp/iOjJNQDBNa+Ty+qD2GR
	puDlvdiX6lbT6GIbdU97m/bJUTGn8R2MssVz2BPUVRYmhUHL15rgsRsbrKXdteZjTAB6goraweq
	ticHB4P/03y89R3vA3YSHXYWttvKoQevSN1e3bXAuJq1wfKXU4nBJ6pKHVdOTlnTFixxNF68sEK
	nWbgMT
X-Received: by 2002:a17:902:fc4b:b0:2e9:4b65:369f with SMTP id d9443c01a7336-2f03f1ba464mr20069705ad.34.1795157277850;
        Thu, 19 Nov 2026 22:47:57 -0800 (PST)
X-Received: by 2002:a17:902:fc4b:b0:2e9:4b65:369f with SMTP id d9443c01a7336-2f03f1ba464mr20069505ad.34.1795157277401;
        Thu, 19 Nov 2026 22:47:57 -0800 (PST)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm9781855ad.57.2026.11.19.22.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 22:47:57 -0800 (PST)
Message-ID: <eb44a4e1-fa9e-466d-9e97-f87f365ce44f@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 12:17:49 +0530
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
Subject: Re: [PATCH v3 1/6] dt-bindings: thermal: thermal-zones: add
 hardware-binning trip properties
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
 <20261113-thermal_bin-v3-1-878df6eef8bc@oss.qualcomm.com>
 <20261118205056.GA839455-robh@kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20261118205056.GA839455-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAyNiBTYWx0ZWRfX2t2JV+xXLVc3
 EAlfXBNUCDO0vU18ahSEfhw0dxRoYxD3MV5QEA31vfUXCAX8IR40wO7iGMLPFtn24hSa1IkXd7r
 PsUOXMvSS23yANpJGsYHjb2iboS5KwcoKIwTF6nhA0WkzBrPi7JrY+QtQbcILsrqb1RwAPt86Mt
 uhAG8roTNo3BAaUt/lL4mbqP3j/edqD1ritpJZgc65A4DehLBTnIav/6e6U89irkqZ8puPgtULn
 6mfPOF98wMu0vGmvA9MEKM1i1ikhZGvmgZ2pqD0wdaxe3ScRTdXKIDx6wIrBFZXRoEJdJCK3uLK
 peWDv+U54LGBIX3WRv0dcC9Z7dHQXL4Tn3X3jZciafHjF5cJMVZ5Cr9hTaaFDebrNX8uHj2GdUI
 Nzou1F0RQF1VK9GVD/vsXeh2hUO5RGNnQXFrhJLEX3KQS7F6NvKsgydoqUx0t0v51Y7gXpVRdeO
 0mLQXsWk9XIb8AwiqCg==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6affed1e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fXwKFA8GOUhRkyI-wlYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: DK6oY8MrQt3btMTpHO3tq5e7OKKBqLHV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAyNiBTYWx0ZWRfX6rpx6zQZqTKZ
 Q7eL+XKAp4Hfn5n6pTFpOV2yUdJVx/muCjVioxKP69uVTWS9qeBAm8FLJbUCHxaOPaPBHFx0ARY
 76sTOd3W5/AiO2cgaTLUyYBDC6CDbUA=
X-Proofpoint-GUID: DK6oY8MrQt3btMTpHO3tq5e7OKKBqLHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200026



On 11/19/2026 2:20 AM, Rob Herring wrote:
> On Fri, Nov 13, 2026 at 02:13:44PM +0530, Gaurav Kohli wrote:
>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>
>> Differences in SoC packaging can be used to provide multiple SoC SKUs at
>> different thermal and performance characteristics. The underlying SoC
>> remains the same except for how much heat the packaging can dissipate,
>> thereby influencing the critical trip point at which an SoC SKU needs to
>> be throttled. This SKU-specific data is typically burned into fuses
>> during manufacturing and can be read back at runtime.
>>
>> Add two optional trip-point properties to describe this:
>>
>>    - 'temperature-bin': an array of per-bin trip temperatures, used
>>      instead of 'temperature' when the trip depends on the hardware
>>      revision encoded in fuses.
>>
>>    - 'thermal-hw-bin': one or more bitmask groups describing the hardware
>>      revisions for which a trip point is valid, modeled on the
>>      'opp-supported-hw' property of the OPP framework.
>>
>> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/thermal/thermal-zones.yaml | 60 +++++++++++++++++++++-
>>   1 file changed, 59 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> index 999ad40a20d5..cb9a8c96d053 100644
>> --- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>> @@ -152,6 +152,58 @@ patternProperties:
>>                   situation where the trip gets constantly triggered soon after
>>                   cooling action is removed.
>>   
>> +            temperature-bin:
> 
> Use the standard unit suffix.

Sorry, my previous reply was sent only to linux-arm-msm by mistake. 
Resending to the full list.

Thanks Rob for the review.

Would temperature-bin-millicelsius work for the unit-suffixed name?
I’ll also add minItems: 2 and maxItems: 32 in the next revision.

> 
>> +              $ref: /schemas/types.yaml#/definitions/int32-array
>> +              items:
>> +                minimum: -273000
>> +                maximum: 200000
> 
> minItems: 2
> maxItems: 32 ?

