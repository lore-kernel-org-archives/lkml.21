Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604763;
	b=DXHCzE+fe4ic1r/BsChIsJKn+CrMgCRjZuoLm/vjkv2NFFNBccCRKZTVvMQybDx7A9lk
	 cMEEqamPv5OTq12HcoB4r489lRWhc/pawPcoGQxsxvyLxDGoM/xCa0kKWtsSxEjRa76Le
	 TRO7Q94hJ+LEIPC2ytDMzJE2RBjKhBkmS/m9zUDnl2H/1lW9EK3PgnIXoQfGL7iqAKxCo
	 jR1Alz2pZcQX4ksKgG9CyhGN1b/trm6eJKkTO/Sg5uNgCgkDCN2lqVV1MzgmxqBRw623U
	 cwGreRkhHdOMkjFRD0Yb05zWFSPtHg4dpuP0KZ/8Hc0tJ1N3sx0p+eVZZRZpaXb72Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604763;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hDG5/daHdq5Qtkg2Awsfb6nndUgxxHZKbiFNsjxgBrI=;
	b=FGUU6IAhzz5I5yIpMn89GVB6xLW4tewX3SKIbJzkY9cUQFKGPlgvJKS2COqTXdiz2Lgf
	 YV4qiN6yLDMppjKHiMLwt73Pi6WIFoBsgsZSx7uLWPPgpKpNIyF8/Uam7yp+jYJaG6RQp
	 HvuNikNrHP4CU+wIVbcjC0PHMAfhHwaPfK+9mvMg0NOSLf9iaHd7QZK71ZJYJcFc9q/Rf
	 Qr3hu3s974BvoZat9/phvNWwecGN/tDcTpBxjo73n+LQSlocFWiLLLgornQKV6Uxg6hXP
	 kYKDHz6RAOrteUWjjX3LsxGilcqBEhbWqegF+R0VqXERjSk5LG3b3aSuDvbNOlsFKMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ekeko/cj";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHA22Edu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CAF606A335
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20CAF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ekeko/cj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHA22Edu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mGG03126481
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDG5/daHdq5Qtkg2Awsfb6nndUgxxHZKbiFNsjxgBrI=; b=ekeko/cjanjWY19a
	XvNMHTsNGqGf995L7X604mFLYvlVA/6sOhOJ6mCN2wRzqwx8e+z5aIvZ3LopHqKR
	9+uzmpWVrYG7k/EccXbHcTzm2LMNNggptlCn2Xo0ldbAyHLfJhL2UIYPY0kBjrqz
	HkuENHlhAmEtmb0Qb/x8bHwFzOb7CRqnoj0WFuBdbCXby4ZQpPazRrA2fNl5H4V3
	0A/UZmAQI6NV22TvqyHbupTPu5Cnx0fPEN08wvL/AyzDb2cEsRtdhxA90yzA7nVw
	IoAoPCqrSwpOEXT5h5rwgYCWFEJKn9rhfdiXbLDzg+5bUeJP91WBV9RVZnNdA345
	sdJuMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydbu8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:06:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso1087750785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604760; x=1796209560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDG5/daHdq5Qtkg2Awsfb6nndUgxxHZKbiFNsjxgBrI=;
        b=QHA22EdulviFb3Tnn6AKaTFLWIhSQhxhgaRmYTBygRolOpjZ7bkjOyvsQFbPSxRGae
         CB6/LT1u1OaX0xymbTYLCRtXkj63Ey0jvaYB5ryrju0vEVm0hub8mKOV/4iMEaSYgqY7
         VYJGi9fnQzzxV6AZ83rXBjM+1RhdSgpTqPRgvAMeFQE1anguB/pc0sMW6C7mKTgEMsRY
         O6ajmHa52LtQyvqcW5R3a1i8g0PytGaI+qb1lOgdQ5eR/MF9+hJnYCmUfmRH6gojYJ1H
         bcdgQmuq5n3gm0plvbfzyT7BMNKqS0UpT5/PkSJr/bWTMqtoYiVv2QwUvFLjN3LGGhr0
         4gsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604760; x=1796209560;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDG5/daHdq5Qtkg2Awsfb6nndUgxxHZKbiFNsjxgBrI=;
        b=DU9YOD8uC7scED8DREvylXBqxtStbGLZ6bVfeD3iI6keWeyjGO0lZt7FoKdIluNU6f
         OrsG5qAiW6awYjH9L5MwrS+kUfbA7ldllUGIwPAx8DNrEU68dolhYGnzDNw9b2z1VXeh
         njq1znBTWUwmNn919N/1KXtpIFso9KRPqBpWQPlRCSe9nOBnObpOqo8rahlmDH3xRsN2
         PU7J23BJbeN2QYB/4tq1OtEpdqtLudogY3Fhsd/vln2CQf/APSUlD1lbwhjqwlLb3VeI
         NIpdy+93glgZNjyMySlb2Na0AEcXpWvn5bE2KqAUsiZzzU0pIJnVZICXhSKjb9YW7I0O
         9gvQ==
X-Gm-Message-State: APuU4Z8y3SPjADHxeglgho85fCc3RshattUn1lLo+SoP9Q1/WQteWhWg
	z2OObQ6jEb3aJebKvkpwvrBpZHreIUFpzFLLQ/RSLFkCUmdEnjwUc8q/ZkRaJM0NEgC5tyiv2os
	zLA+7s3nj4hW+1vdbzr1HXxo6PGokiqDWy7wAoYPiFX8C/4SF7/lbNY1FS7J0+bMC1VA=
X-Gm-Gg: AZFdTZcmis7Dhw5lwk+sX94+ZI31m/dpjy2HJ0JW20SoaCViWYWeSx/YsRvmndqLyKK
	cE2WUdt7OKDe4VgkHesvS98AdA92phQKTCm1W5oQnpGknPPm930llvdHj2Z7ZxA0t2zWHOoMd+g
	7w8/MC2zX0F82dmPNatb+Zv14H/LA0BMXdbL6Wh7ktW3lPL4x5iSHU3InrYMmZ++F7Qy3EIH5dL
	cMC8OyHj9h0/UeS/5pXG3pb4gefraiFOXxkBDpET/Dz0q3qyY6vjxzNLroC74ocsmCQ4yRHkpxf
	plW7CmfDA/AThOiF3T4aWyWBmaH8Fx90oas6MgMuTEHDRMA4WE09jknXZKfTlLZhWhdzdq1t4uZ
	xbITBg9xmV9u7sha2yneubLtnFdxKmYj1RNPudQ6ye9Lx61sn7sMMPJR7QCz3HZ0q9DpINe6wGg
	Pj3dHkeamehdox3b7/iouJ6V123gq3tpLx1eh1WGI=
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3260297885a.36.1795604760323;
        Wed, 25 Nov 2026 03:06:00 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3260293185a.36.1795604759812;
        Wed, 25 Nov 2026 03:05:59 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.241.ipv4.supernova.orange.pl. [83.31.98.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm273412905e9.3.2026.11.25.03.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:05:58 -0800 (PST)
Message-ID: <4276402c-9fa4-4bcb-99a2-4556ec59f3d2@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:05:55 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <403d0d8d-85f0-405a-a26a-54040272aeba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX9Ca7pUOBhhif
 sVKXh244fEBM41ikalzJ4HY4RnokKcvK6Vuh6Xl7DoLjHxvvTG1c4zubYdzwz9qZQQjEM2PuSdQ
 q6k+7oq19SIWn5A1N+G3vf1NryxobKY=
X-Proofpoint-ORIG-GUID: f1BTm7KtmLT9XdmY5dZFJ3OplDPuacbS
X-Proofpoint-GUID: f1BTm7KtmLT9XdmY5dZFJ3OplDPuacbS
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06c11a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ivW4MigAevuCEqTxTIunpQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KmKYLJ3ZcJ8E6AZ2J58A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX5ZZLPAe72d53
 VmLmUaMUvOz8PsUIETgpG/nPGrisLenPFKp4Z2BFhk8IHgQ6krbCiYFMuM36W42os09CldB+7r+
 OiD+3fQJ5AE1O7YvOAZfHwUhg0up4N52+Q09ajZzqrZNeatkFuFapjfFIS+xWkGCXvlLorM97DD
 61AwMA86WG8kKESNacKtTqO+kviHfBS4FhVs/+tzczCpNJGdeKjfIqLpu9i2gu+/ZOr9KkydiRZ
 PHN878Ee8rPsCZ4nQsnVrIeS8HDtT8eoRIWrBCuFWjSYovVhNlSPYw4l5Lvho4AamIa4+jhd5Z8
 DCB+H3O/ZD3QtcAvBnSIgRSpJ4KQQutiVO3UMXWb4BjgjaClsCM5gn1g3SNagKJhE8JUDptnsZc
 GsEjUBW/S/SCvmGRc9kyTg+8ZItjKveOWV6f8IAUo5xFlAarHEJW9uqIscnuz83JShxjqGpUWrC
 QJ4+trZ4W+GCyer5fqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On 25/11/2026 12:03, Konrad Dybcio wrote:
>>
>> True, not ABI in meaning something agreed between DTS and driver, but
>> the values are used by bootloader, DTS and the driver, so I would just
>> leave them as is. I rather care about not growing this for newer platforms.
> 
> Right, but they are compared against a hardware readout of a
> well-defined value, not against made-up indices (i.e. these are
> not bindings). I really don't like this ending up with 2 files
> doing the same thing.

Not two files doing the same, but one for legacy and one for new.

OK, let's drop the bindings, but then what do you put into the drivers?
Hard-coded values duplicating another hard-coded values from DTS header?

Best regards,
Krzysztof
