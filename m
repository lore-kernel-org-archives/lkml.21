Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604601;
	b=nOAHGtnOim16l339ZCobk3f8Ce6cLRV9oAbPLTzpLCv5nLoPAq/lAYZXjGTQtrqL51iM
	 wgl1KDScSRV5CV2Vck4Oh7FFQShF18a0wqCj7ICQc8nrg2vVVqeTRHOQK8HgD2qPrQgH4
	 JpzyIhJyGWMffU2+1P6TS4FrwUff0Ts6dfMQ7in5g/m6M/cBerYjPYy0ZU/3ATH2/k0IR
	 ENmbP/m01KGG3ZVISCsWfOOM8dBrVoYYPt3ig1MwSUsjDgo9eF49UY+sV3m4mqjEs3NBC
	 SPQ6SiVsaTy9HQfF3OkRh/Z08xyLnkos3a4nd+0zmXvrQHj83yNZ6VGRC2B6AXxkHyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604601;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N3jXlxFsdDnYKftBj+HA4lSK/F7n4JJDj3rZ2WfFfZA=;
	b=vvHEV4RqIVCw7Scs6Lmn3nHK0Gy2VMsqPnT59OkOukb+vZ2Cjhz1uMOZhWKVbNjWhuw2
	 sFEc8o0/hrcysz36Y6SBx7tSGtMh1KWAEaIhxahh1z0uHApm4W5ULiQqWbhihVOeSyCxL
	 JRVXFFl5ImSPumXF/6o/Kohx0msqZpgD62WxVOKCvZwNChkn7BXl0JUpv/8iEgFAYX+ex
	 PKtUvcjTcx4n/rf+4vZEAUmSqbhNL+pykOTCLBzyHYRCD4yDoBJrAvSKWd5Sd6bpnniyj
	 kT9sjQ8V+ngX7IK9SFwuIvQzqsnAk9yXpcf100DmMFzg0RissD4Rpatptw6Phsf+ZnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b9horh27;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A3/r7GSh";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A90606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A90606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b9horh27;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3/r7GSh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mR204131722
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N3jXlxFsdDnYKftBj+HA4lSK/F7n4JJDj3rZ2WfFfZA=; b=b9horh27NV50ayY/
	B/SlS2tq8A9BXnKCZpmOaZn7KfLNquXoIFyN359bomonMfMHk0alIKaHfvcgKaa8
	Uly3kkop2GwUzV03rMQsMZ9hVPG6WLYJ5utD8DejvyncTLBdaaLmEv1CzD78vkVY
	xTK/0gIJPG6AtgCix1J2VWav6B+VYqaNlwlP/u1bR0YyylG5rshuZDbYfFaggybs
	DnOPttFymm0NIAgPYwgzaDLiw/V3Ewh/5y6L80TKrZFJqHiKjiuTvCK31Atbjs45
	u0ryOc5vntnsYxVbSHv0D3kRkJB1oIY96zOZNQrKdVu1Qt46FQqmcZY4hO9Tp+xs
	QM3KLA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrgsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:03:19 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so224922e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604599; x=1796209399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N3jXlxFsdDnYKftBj+HA4lSK/F7n4JJDj3rZ2WfFfZA=;
        b=A3/r7GSh3rTD2zOyyMS/24VI42GYW9hxkeX5z0VO5y3h8baV37YJoooYndJCa77Ekq
         E2M0Pl/pCOwxo8oGLLxBPWtnSVSSZSmsFiZmDCGIIl8rvFCcST6sO9054duMHMi9GbP3
         FByt4mF/SIKVWurmkjLx9lKRjqe0qjgNRwy0HBDRjQzY0z9yv9qzWkkpvfwB0Jhb4zZk
         5s4sslN3/3Z0gHLqgD+PBd8K4yFhmyCiSEpUFrXQ4qMdrNZpjXOitdwWVhaohCdAMBMK
         n4FRFPmsCQoH/54rP2JyBUvqb3iE2iBeobWydiycCx0MJtjo4sybywJGt2jbmAeIpreO
         jOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604599; x=1796209399;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3jXlxFsdDnYKftBj+HA4lSK/F7n4JJDj3rZ2WfFfZA=;
        b=z3DM3oXYrzovfLX1LgP5lytHz45N9kKGgyJqwWh2ON9gD444X7tkO29t9Kb3CrgxjF
         Uqf0VbxieUI/fikYyGLUGpWhxeBsumDiCNEwXU2F3JaAuaGXNTR1PhCxuJ8DCWsuKH5c
         BUYBsZvUv3eAAf22vimJjYqPghtHUFPCvkK/4R24WL2YOO3c9duia0GEFOxmQKHVj+qP
         tZmcraVYI4ASiz2lOW3wihH7ufRrCyfSowtJ/04ZdMpffGl7lSPVsNJErpdvarFxLfJi
         /LwRvjsbjK0rG5wrtryACvkvv4cjKQOEopX+o9U+PyzGe+tSIhgRg2MbC669gORq5c8V
         TMWg==
X-Gm-Message-State: APuU4Z8vPTCiUtIlmMyzzf+qFIkoNjPTbDKwdK0LTQdMT9eDH9r76bvH
	snUTUKzWE9cjC3boYQKIwixmeJSUtxeVhKrjGABGB2owtn/+shnAhq5G6i212TjdaV8Bg74LZP9
	LjdTlycl971lIkhEaEv1us2b2CbhQwi4wD6vyvfSlzhLjKEZJHQHxCUE5FR03F60Hh1c=
X-Gm-Gg: AZFdTZdxoN4PWfNvcPDBwTqIRwXASMCO9+1HY/1FewrpB28xca02Scsdl79qwnyeh52
	YllpxorteGUtxRKD4S8bk1SShb5WYITEejIhN3kPNeu1KM83DEZzlairLIcOh9ivUYahs/v+YRQ
	8tzNwMFb6TSDKhqZni95bvyeJUBjU+nEIaRbf5hhDU/2E+oqnGo+iO7xIjIUx1RpkxUUxJjKXhg
	Y9q87naB2FxQRwHFvvLLh/TMiUj5A4nkWu4JUCzcthQo3eQZm+fp7vJ5Ad9cNvwogBz4nAznk7L
	QeaKP9PxRIK/74YgephciyIFlERmXHjqOlZEyqa5BaZog7nUBSeSbBUmJF4lywHahvv/AByxdiW
	SZP6t1JU5fjAbgGoo52i0osDBWimQkz3ZGaIDd1v0B9xOSFP/CDy/w9TTFG5QQVa+0qWuGhU=
X-Received: by 2002:a05:6122:8495:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ee8ad0e69dmr9793460e0c.0.1795604599315;
        Wed, 25 Nov 2026 03:03:19 -0800 (PST)
X-Received: by 2002:a05:6122:8495:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ee8ad0e69dmr9793427e0c.0.1795604598783;
        Wed, 25 Nov 2026 03:03:18 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm630307466b.84.2026.11.25.03.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:03:18 -0800 (PST)
Message-ID: <403d0d8d-85f0-405a-a26a-54040272aeba@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:03:15 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
 <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
 <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06c077 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vYosS4eGo4e4NTISwfIA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 1I5RuDGyRgp8iCpEHpeSwrOt-PoN7In1
X-Proofpoint-ORIG-GUID: 1I5RuDGyRgp8iCpEHpeSwrOt-PoN7In1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX+tpSGjoUe5Xr
 rUaP7PjcM3IvvPuKyKmTgtJWevfYQ3Yej8SPhm9Hyx4GibDGPbPc6CXVDRuDd9GCDOqp5mpLsvo
 LjUGj3cFBZIAOvrRBMU0xPRRL+aAnNM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX/lF/Q6/IN6kP
 TB0rPaJFWHZI/lsw0HMp5sMjoWkglRorOIWLcFQKHDMHdNjoYLnrrcwt8QNneuHT14waKHzxFBs
 WzZYf1ABYtgt8X66uC3+1rUW/f4Jw6jCKgDU5UXEXNS7HN/dzpc5Wvq872Yc/3zY8n/K2k2Cb5H
 jWCYLuhQ5LgGenKA2Sas4xic/8bUa0uHBqgpjL6WuqVNni89dFtjMTL6osHY6W/5mR+uN1foe3x
 BcHnp8ZyuUi8knIVVLbeib0x3ce1VfTqqnYiGVzfb9h7n//VgyGv+YVL7HwzLbL1qiKsC63YNjG
 S7g7m31+pR3MIPDxZjyzddcwEPDLUrDTUpsdAZbm0XRDB3i/jRI3kjDY5iqIiEXYzbj0KVZLMGf
 76GKv3ybD7KqY/LxXJpRqSxu9cnL5RVRajXKF3dHjd/98lDqGpEGKOmNhgurapcqef162ZNEEIx
 tGfT9E+Jam4PNQr0xkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250043

On 11/23/26 11:08 PM, Krzysztof Kozlowski wrote:
> On 23/11/2026 20:06, Konrad Dybcio wrote:
>> On 11/23/26 4:22 PM, Krzysztof Kozlowski wrote:
>>> On 23/11/2026 16:17, Konrad Dybcio wrote:
>>>> On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
>>>>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>>>>> currently used only in the socinfo.c driver.  There should no and there
>>>>> is no in-tree DTS user of these, so none of these constants are really
>>>>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>>>>> that part matches the concept behind DT bindings.
>>>>>
>>>>> Driver have local copy of these defines, thus these can be dropped.
>>>>> This has no impact on in-tree ABI, but any outside users would be
>>>>> affected.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> I think we can move it altogether, to prevent a situation where one has
>>>
>>> We cannot move all, because some are actual ABI. I could try to leave
>>> these ones only, but that's a bit too much work, IMO, that's why I cut
>>> everything at ~450 value of ID.
>>
>> If you mean ABI as in "used in DTS", I don't think that's quite ABI
>> (again, looking at the glymur-ipcc.h case)
> 
> 
> True, not ABI in meaning something agreed between DTS and driver, but
> the values are used by bootloader, DTS and the driver, so I would just
> leave them as is. I rather care about not growing this for newer platforms.

Right, but they are compared against a hardware readout of a
well-defined value, not against made-up indices (i.e. these are
not bindings). I really don't like this ending up with 2 files
doing the same thing.

Konrad
