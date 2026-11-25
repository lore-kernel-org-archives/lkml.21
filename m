Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613411;
	b=vBSOuT4TGh//bxex6vLUmMB5tcaU5wBWqkSUDoDiJVAW1b09xLfFZ9Hw6/U4wRgQJBwN
	 XFPVrnimGpjRzzsKlNYUSlwICcegi8aYeqfvkPd331cErhDJJpKStdRr5rRMc+iUGZg3a
	 mAFi7QgLSG47BkwtBpSrQ4gHbelAarUy5zzt7hWHESnSgXa1a5eAOObKpXPmcA17/enu1
	 BjK7vrFvFCBTjg/jlq/CLpiujdRdAQP0dBeuhkqNWhi4XPDAuKETNpnZlgY28JdhnvvtI
	 pSLHF9WC4x5OFpTc4ygPn8j63Ub7CjhiZdinglE3nzTOHlmFnNrN9G7oHydblLO8MAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=;
	b=KeMVDQPZjZCzJg5KhD1Ddo9BH/gfG0dYeTtx0VTERhRtE248Voo4t3fAiXNLYMFw9ivO
	 hgan6L9GqdslTwD5VMAo5za6dyvn99Tt6Dg/lZK2TTl7WfncQUCF8ZpATDrtNF3uHBnLp
	 U89fdVgHkTsnHWUGs2Jep4JXhZWKSDVjZeQTtrd03S2MimkEjShcMPuuLDyAN7nPafpi5
	 U+DwNILanVSzASVJ3oMumSJkCaUpNk4IXt9fhImI78yF7K+Gj0Z+0sRlciVFqBhSRTu1u
	 8hQ7nl8RN0au35RVSUz7ECwpcNw93p0F3G2odZhk10z8AZJ2M4u3w7gBaflwUOz0L7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6sKIbB1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dF7U4VqU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C26C606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C26C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6sKIbB1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dF7U4VqU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mGAD3126478
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=; b=F6sKIbB1nsAton51
	paC/HxwfC9i0kGF1D9KX0zAFIRfCWqW2aeJh9oyVLl0UnKGQcq3kwi+qrTkjRXko
	zuy7pubBK6K7yvaqsAVvB1Lpu7Fu0BMJrnCf6lJ4/ZPteXflK8hoOttyeCZbkk4G
	9BQ1YFw6tsrIilIRMmFEdGgX1ZFihlDneueV0zmo919xxM/HU7rnLLWvwBvhDGTl
	26VgkQeU4UtPIsekC9HB9IIu5SQJfE3WDZMGxAetqDZFxeYV9EAGeIlq9RbIpjAf
	0HgZwofUi6zcUB3xXDdYGCh5WMRYq6bNDo0eOJy2UClk4BjnSZ1BK/xVVSP7jCy3
	N0wVyg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydcc8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:30:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso1109793985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795613404; x=1796218204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=;
        b=dF7U4VqUeXP89S/oo+7JKc7+IRUJEeScod58I4v9l/XRffoYx/uBuVa62RIhf8XOsB
         3tzjZBCqUyHD3P1/KheTIPn0m1XbkRj3Pk8a55CRcy+lFuCVua2Jf8VJcYSnv4G0zSRK
         bIqCvOH7ceLXVsM4lLH6CPr9LXcR78bWU3D835505iEBXx6/ilHrPuY4ShyHOmk5b//V
         w9kaWNtWe2bBA7mRbNvqU6UU2bEOL1jTLDLy5BjIrhWFziaofRjWa1GUtXWsaoNWBKy8
         q9WpJtCi61vHchhGTRxaSpXvJshgVKqs1EHhCr7uA1jYvdbh5O/A+pgzcSTWdFLAOAAY
         1qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613404; x=1796218204;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=;
        b=YZmTCSIoymyQ0/MgnAYsbdYheKO6ZHEjT0K/A/QMS3LJM087Snt1mTihmTW29NRS5X
         iNy8pKDjLCunjZkLXWRz4AxXMsxmDjVUMYSG60StmOO1vXKmM1oIlZQcKCRYNrPnWdrg
         iMhc/RO1qRemSpd7s3Ux74HDyQmr3RoiiLt12tqP4COW8TMeLvrb9j8dyYdkGtRp5zT9
         d0+qNY5rBTbCN9LX4XBz1gTCVaBoKFEeCjYEnHqUTIwATE9kMSujOEhJQysHMlnIUoT+
         op9QW34RXUMjBVqb5LgtjKFbFlO1420mdWlWtHBXgSrM/TJviF5QbDcarkJtajzw5LTH
         VwjA==
X-Gm-Message-State: APuU4Z9MxIVCDVzGY+XFvgi5eDeUQdNPmIj34dT0lMhO+28ta792YpyS
	CIwxiSy4wFkXa8JGQWIRSqOPuTC+hEfL7xSVP6g3RnDGwuOQGxPBAjL6N1aQkTOAsTSQ03vEM8i
	Rxuf4zlzzYB8j319YWJIUnkknxH23UU98SvLI869igDZpJ3GUSkxCoQw9OLSttPDj33s=
X-Gm-Gg: AZFdTZe3Qf+rKcG5MsSrW8HjeRtxjdTK/wBkIaS7kRG6EbHABR5HWoA4BiDooeo9Wmd
	6uHZKzISXq9jV7NsfQ/dGPoasyxoLIVGN/LdkTaw/3hvO050/izk0bUBxBCMJNDQ1eZCiP7bCoM
	gsWJwhFCs92m1trxQScTktvxzPjoWCzirQO+/NGuVngGq4d0zWGuwf2n0+peOwXfg7w/Y3oFmki
	DypN2TlOyvy/BPZk4kd9v3XV4GH2vAzLdA529N6gszQG8cWpCzwXiiW5YHOppzPuE3jKO5mB6dj
	XIcm7RQZbwfjjXmW1U8LB5UjB9UhaHgAuy33pO92Lk5cL1S59vlEmRGPiAuRjB4E5EGk3rOD/EA
	FG+QqVDm1WYII+pZXbSgPn9wQHfcXAJ5oelxW6RhzQbCddIkk5EP2kt8pwsr8eUR+fek5kza9QK
	P3EsHN/lEMBCTM7IKujD2lYpgb8JEH9Dj6PBzeFYc=
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3328606985a.36.1795613404351;
        Wed, 25 Nov 2026 05:30:04 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3328600785a.36.1795613403766;
        Wed, 25 Nov 2026 05:30:03 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.241.ipv4.supernova.orange.pl. [83.31.98.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm519677145e9.15.2026.11.25.05.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 05:30:02 -0800 (PST)
Message-ID: <f9190246-ea4a-4dde-9ef7-e29cbf6c5908@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:30:00 +0100
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <403d0d8d-85f0-405a-a26a-54040272aeba@oss.qualcomm.com>
 <4276402c-9fa4-4bcb-99a2-4556ec59f3d2@oss.qualcomm.com>
 <ac7db1b5-ae9d-43c6-b553-ffeccc50e1b6@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ac7db1b5-ae9d-43c6-b553-ffeccc50e1b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX39om9Qkch7Lg
 VCd7HvFsfGviYqRxGL3xXmsuu36BX2Rg/EKNEu0g1XWtXZv5ILEfwqkgc4oNtxfdgmM2u2T9Aew
 TjcuraRGMFaXMagkQAnF5scMPylGwI4=
X-Proofpoint-ORIG-GUID: LpYL-Hyfac8gpZzTlIkClqmEe1KXfLIF
X-Proofpoint-GUID: LpYL-Hyfac8gpZzTlIkClqmEe1KXfLIF
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06e2dd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ivW4MigAevuCEqTxTIunpQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ks9rPHZIzW2PBVneSSAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX3sdSsfonnmzf
 4XMrsaW0bcy/b5o31/G755yII7ohXv4dNVgPUtBkmZaNRfPHncklCMF9aJMnoOlynQcna4n73dt
 lf+ajRrMnRpvQuVzvu971nO0livvw6isoIBZM4OgKKSLbeibRv6YXRK5b/cCaWVJj8j4yyJAHMc
 kKQensXAWDqIpsbLQdM/7AqwUB3yPT2ElwgPqBRnX3kKUxeZ2fzkOvuaeBwXZWJ380AWYJp7KZH
 38ndsv2s26f1rqzEfJRpUAbcz0gsblJRHh+d7X4JZig4h4Yq4J6SK7Q5/BmlHMtHGY6weYlTnde
 kcN2f65DT3J+CTz/eEX4zw+VpSpD6TQ74oxQGbCrZBuctNzcgpKxyXCPWJGrmK1ulydljXEoVH5
 yz2foBH1wlgqmmsMrBvH5qW65KwWyB7fJbOB8rh/AwMEHTwopGspAXSXT16wYeY6r0xnKWBgjlh
 42U7WFuD2tqiCAJyErA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250053

On 25/11/2026 12:14, Konrad Dybcio wrote:
> On 11/25/26 12:05 PM, Krzysztof Kozlowski wrote:
>> On 25/11/2026 12:03, Konrad Dybcio wrote:
>>>>
>>>> True, not ABI in meaning something agreed between DTS and driver, but
>>>> the values are used by bootloader, DTS and the driver, so I would just
>>>> leave them as is. I rather care about not growing this for newer platforms.
>>>
>>> Right, but they are compared against a hardware readout of a
>>> well-defined value, not against made-up indices (i.e. these are
>>> not bindings). I really don't like this ending up with 2 files
>>> doing the same thing.
>>
>> Not two files doing the same, but one for legacy and one for new.
>>
>> OK, let's drop the bindings, but then what do you put into the drivers?
>> Hard-coded values duplicating another hard-coded values from DTS header?
> 
> Or we can have the defines live in include/soc/?

Then DTS cannot use them...

Best regards,
Krzysztof
