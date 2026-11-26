Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704731;
	b=eWvGRXRRSQnUt5ezc8etbqR0qgZWOmSMqBI9Xg2X0yalwBVMnM0zUOG/qPKHO5IB0c3q
	 MvKTbHgEb1DRiy/15A/GDB3DWwwyUbXvpoT+poBBYgZFSlU/ISPD5hE54y+7uIfO8pJUV
	 LU3VXyL2hiJVprKSTDk7xNzXv71DJumS7QceWe8M6KiDj4/oOD70H9RHtG775tdKlYshD
	 F0uaDJ27r+EvEqFgEHj40Xvn19+xF09AY6BRhCVYIWLqqnoK08Dw6koZiTs0ENYTVP2ZF
	 mtd9W1L/5rB26m6CBUfUNvnANwyg59cnALfbZq7hSgiPN4gD+q4iFrRVlcGKLKrcUKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704731;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H72KJoBHayhYZ4/SDSW7IDXdiM87q9Lxr+UY60gNodg=;
	b=d7h8gM+FZyuxpjgr/m1cDYD61fwYgT4bge6S1bWJwcrlMACQFzdhn+Q43TQeV4lS1iWm
	 HWnLeHUBHb0k+ztoJgCo5Z7G0Of5eKHxjI70+bvqM9+Ge2189GRPLDN4spyzgOAPVOe43
	 6rKRsLF7Sl5GNt55Tui3NxFhEXX3lzzKEYveMCfggCe4S1R1LzxBJ+62FqwOa9CkTTYRx
	 PcKbnreIXjq5U2WhvN4ixOFxwnhTbSCYqjjBZ379gwc2eeUXVRLNnqrtfQidL6Qc4VCzW
	 rQlHlE1HqeHe+uHZQOSvN+aQ7EedDfaXOxVtZpdjt8u2NZp6Xk4Lvo08gZX/Y3vvoSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DcH5s7q6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjjmxBUZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4663C606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4663C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DcH5s7q6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjjmxBUZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV1JM1661709
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H72KJoBHayhYZ4/SDSW7IDXdiM87q9Lxr+UY60gNodg=; b=DcH5s7q6VzmfovC7
	X8ERTzZzLQgE6u9cK21TkKmvdxx5K+XVSLYJKfmdBmOtOA45vbkf7+RG2WSiu8TA
	0hL4hjusjemQXIxZYXYFUlUFW5SNyxNHBnMDqeAnMeLHIpJ3a5+wrDSpzjp52WVS
	L1eDXaZZiJYQv1wYMupMgoeMyCSCpCl2j1pwNdczpm21ymlwZaQV8S0Af81gdHlY
	J128FRSE3Bjm11YnLUj+rV6oXoih974R1ozvBsaeyVBVlcX0ny1Q43yopRaDqtU2
	DxhjY42h0PurEyjxMEyu7X/q2uO4J6a8AS2VE5WDmKXT6ku2zly1nZrqKGTiB/gh
	cTQl2w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7sq2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:52:10 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso320826e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704730; x=1796309530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H72KJoBHayhYZ4/SDSW7IDXdiM87q9Lxr+UY60gNodg=;
        b=WjjmxBUZnr08pFivAhtxe90AaCOdH1YC/6KDDKC8tBl5EM12sBD8IGASoCQP5B7N2I
         FP29pUgllJSjTHRq3xt6YFLzJXt6pdCqEdWNnrDC5TSVhELv4JsjoUPmD5ATTM/lC0ho
         aWbZnr3mlFBraqMO4UrPlsdQ4cgmLupTCRlnEyiQ4dwj0cxDI/4zk58WtJG60YFPN//U
         IcJNVYeqHo3TezMxswaSRik8qMZRk0LzqBCES0csosTCOB/OOw5/ghwMYfHSezTTaMmv
         +ZrX0tYPH6oRA9l/mQQva66d7D1rqolBuGlhl1haXZnhip/Y4QAspvhURpzBIGHZ2Z76
         Th+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704730; x=1796309530;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H72KJoBHayhYZ4/SDSW7IDXdiM87q9Lxr+UY60gNodg=;
        b=I44KIGTBe/vIYYSZREWZWEj0z/9YRa1R+cb/VPmv8idYD8699zVGS1S23mq8uNQn2y
         bI9DQjq9E9sPXvPXUynsrcUnzCE2gW3G36Pa0xMtCCHVmNXB1jkiy81y46Js/oyeXpZY
         +UY3ZFhbXYh8epTmajhqSBbUmZdTwwzNeZeWrJM/iZTbgUTkiVBbOnNtIl1xlfGxWosx
         BKEKgSeVmkt88ZWSqTYLi8m31jyeIdXgr5boy0A1Xloe5SHaFsDktdkiu2vzk7ftgeQH
         A8uuJtSDAK2n2H8ZLR1HdGwyOmtaHrJzpFwkbTSbhHdK5H2fsM7TgFO1TQ5I4bSaYYDW
         O30w==
X-Forwarded-Encrypted: i=1; AL+hErGJ0h9N6NtZT3QcPrqUdbwKUdARhrMFIJkRwHtcet+3GLw0/ro0q+yQuAT9P8yth1GCl72KHjpiSZ3NK28=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HrdlWf4pj4CzkFqSru3+Qy3fhPRkFahg8+IJF5aqANIbRGlRP
	I3RSmPqaHa3AdG5JVU8aJ/+Y+DvStMKcoWv7hTKXHv4GJxR8exxFfcMqeGWhzuPWpzy2FeP1lOk
	UvelfNGHzLFUoCToeVetJAnR2A2K0JFBHPT08kJSP3OhVkV437tI7FBgeGwUHVkY3vOA=
X-Gm-Gg: AZFdTZeI/l+Z1P8oHNr8wy/vuQdwaI6d9nrb8OJGUgOXhkBW+dL58S4GsG6JwQTRYXR
	ExGtsOD0BOryrjE6QjzcbZ+lX2Wbf1IU9qK+x0KlCxaqXLgbrwcuwx7tjfv/yIBiL+H1DehLHJU
	LmoC3LBQR1pvfBZ2batL+3JKbcqy44Ib323/wWi36jzTztjZ58kLvhWJ8rayVhiQoqP8hBsJQC9
	ElSO3LJbjP+fv+kYrlwjqqt5SpseaIR25oJatQmtHteyg6HyS+eM3b346VAUvY19/qjrQDQj6dF
	6O8CuvgN5R5CXnu7lVhWXG+WTv/vKcfl19eIAXA7eGvRTqCx63tuovOCwhaDG/ERCr2xHalAuQ8
	n1DHtJXqkYmgZf0WT4r0rJGskbSSOU32JvoJuCWpQcUsRErBGQ9IufHGIw9nl8x1PumbBi2o=
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr13243942e0c.5.1795704729577;
        Thu, 26 Nov 2026 06:52:09 -0800 (PST)
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr13243903e0c.5.1795704729006;
        Thu, 26 Nov 2026 06:52:09 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b003eacsm750204666b.81.2026.11.26.06.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:52:08 -0800 (PST)
Message-ID: <c19ccf6c-f7b3-47a4-8288-27da1120585c@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:52:05 +0100
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
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Add GPIO
 vibrator
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-2-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-2-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX5++wgXrcvVkh
 jB+4gcKnXSK0/MObRqpvOrRG85XVHvSAv6ITcFhqnmJ9cgWm2qxbBXc/CGOZgoHm6qdMbCnpa7L
 UUzGygxxCaPV9BRTUB8Li9msTt7irqA=
X-Proofpoint-GUID: S16jcPEOXqknF2OO9lXLo4UwdL8eVlQR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX23QDGpo8JSAh
 4YzoZf7bmruIzVBcDWyDVHEqC6nK++BIUVXjPYO8r4+4/jQxaDvJeQNlGiCXx8mgKkRBxdI+l0M
 y9qKns6tzp0woPR/TWizS05f7/qgD0NunWKjTmLZZLsD8r11DaZMBZI/AkZ57ZaTphSeco3DrvF
 dBjk8xGPC1AYCzmjATuDkOdRkJzv8o0pmQtyLvpK/pjvZKHbC8dUR4mLt5L4/EZOtWPBJTpK2WJ
 wIRSOE8fGqfOnlbmplb/BMKBRY0Fq8ol9dVyIPqZ07dqzHaGQHW/Zjpy5QWJpX7cssc2iudmqXZ
 f/XNEjHmNYABv0qC/8obKg1CRgw3qHaqgq1RSOg9nHVb7tQodu6DfF5YijS7xF3iKTZwzWFxnIe
 FBNqF2janis49AG2Wf5/YEtle97+5uaA91LpXdDBhfE2y+6w2C3O1U/eumqiJswPBVEzwJomGv3
 MkUcDh/qU/4z/e1vnvQ==
X-Proofpoint-ORIG-GUID: S16jcPEOXqknF2OO9lXLo4UwdL8eVlQR
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b08479a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Mq9dOPq6Hou_Oe_0EYsA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> The vibration motor is switched on and off by TLMM GPIO 18. Describe
> it as a gpio-vibrator.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
