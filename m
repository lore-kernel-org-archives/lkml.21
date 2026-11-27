Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784083;
	b=4qqaZvccax6G00LeEBncHuLNJC4Exk88aqiuvz9ZDYaFdjsnNFIFSkprRsLLUWCHP9he
	 g0EpmyTjfsTYKIW8iUH0uTy1FubqnkZv0mQaTgzsJTpXzBeJbbJiVv6e/vhGKffE0L03v
	 ExcgRYePFdOcvml3IPc4FrSznbGJYtb/URg0TYjeNVBjiJXD3pkUQ+CssAlBeXsKIE9TM
	 ILjPSFcvb7kFyZl/qsA3pIll62aQGzJxMwQnLxgXRqJoaiAeelVIqTKTW6NRrvioiyIDo
	 nLYK9GP81osyxOp/dsL70HOpmdYtT9A9CP9UE3SpkIr+R/5g+COToq0+NHDDTYqfWAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qyG7mz1+iqRSmDE+0/L6t1wuS6VVHsnCtrQ54KSfWOo=;
	b=LqpWhldTzhjksmuwWILZQwGVDkkpfs874l7jygHIA9JECv2LQhyI/GF6wdhL/cCOSeP+
	 55xZ/1GrA0ZWwMjwKz5arqSJUMXQsZb+CqvTP5uaFhDOBjXcN8ZMMsYA4u6uTsNR3PM4z
	 URv3htVY/77D5OtOO5X/tBhUU6B+aShro2IT1xqY6e3VyTNo5LPdBq+auPsblCgJ0wjAb
	 OWdXUi6DOTb87fq+Iz8TQykrxM/nOkdf+93KZun1BSwAKlWDGwKa33mgCrVqLTIMuAx5S
	 LkkaWCBJmcZXtgxYnQrPAuIpJqUOUWnMEPoUnnccKwSZAymurqJxvelpz9ITlDteGww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="PIz1R/Qh";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="X/RJQl35";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA02606A332
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA02606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PIz1R/Qh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X/RJQl35
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARCh7722301663
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qyG7mz1+iqRSmDE+0/L6t1wuS6VVHsnCtrQ54KSfWOo=; b=PIz1R/QhdUpCx97W
	tWM0/xr0ThcMO0YawZmNyMiHAyWJ/hBs5RDKuyLd8tkeQ7h4VbaqSsPs/sYmaSg3
	o2IFqUo5zOfS6w93MD3YB10yItDy7rejlWYWPARD/2o13K5dGoT+WATdk4wTHCRE
	SNeZfImpSbrUR2rg5UIZbyczLM8/N5Q26ZJTGY4s2VVaPE//3qaOSSFcD+xYnyht
	r+aInWF4BQw3KbHtC7a9NQiWO8/t3MgYvSN3i9HrzmTix1iW4hIRiKdi4QgmvVS4
	enCbsYffVPiHwa0tCDNXtigGVGMJnrgDr7iHVQlzmZVt+2yLXHd89FFHA+R+SmX2
	/v5/Ew==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gasgkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:54:41 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso346073e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795784081; x=1796388881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qyG7mz1+iqRSmDE+0/L6t1wuS6VVHsnCtrQ54KSfWOo=;
        b=X/RJQl35OwXkpBuFVpiHbXoujn4OxURb244259C3upSvs+Kyb6up2BIgvRdaWjv/vs
         trrv6UHlc+xzYKBdRiCUwXDY2WfSasI66D0hVKLHMtgVe9MsNZtARLPpSEO3SSwl46VR
         lngISoaEjIqT1wodpCXnbX+uLzc+SyMop42tZm+9dMlYXeeNI4RMPEyO0FG4aRdNwXU3
         zxPLPvv8RlFeghWKTm7KoSS65Lsf1HYqN4jAItRYerIMgm6Xvlt3NtVxqrvTq4Cavuqj
         S7AMiYUxH5pza1X4uRNNfrlefwq2bfM66X4roc3zlUeJuwIE56SnfNR+NEKHSfudBhH2
         uDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784081; x=1796388881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyG7mz1+iqRSmDE+0/L6t1wuS6VVHsnCtrQ54KSfWOo=;
        b=nI21vVl095JmfQhHE2+fz4ikKw4Bf4h94gqnr8CuA66hOE1dyiLoOzEWWeet2tcev4
         mUJQTS7BqyYk/0t/yfGqegrLdHeLk2wfblKtXy1oBOBeTbbc6RyYmbPK5MQBOzZHeccV
         whAULjpyhkSVT/h6zmhNXQyh+ekekCmAnwOiUBFgAKgb6rUaRdtXeCIBHlRgx3ql3J10
         f2nVYXxf2//Q7no/RqtI+mwU2tm5OgvpZnPtL5aeOwHmrUU+rXBXq8QuCbnqsqmr3cIU
         gZhfWqrk4DrG/i9Wmx3vd64dj8SQs0+Q9mtNeP+hALqLLFNKKcDNDKggdxKrCoxCNQjg
         UTtQ==
X-Forwarded-Encrypted: i=1; AL+hErEtC1SkVmfvO/dx/mUm09RMHdN555eMmGhovMQSICrD6f0Ku6DzoKeyHsdoYPPC6CIcCngCu/sPCooC7Nw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UFmJm+gX8TFLP2wfjU4fMqhdgcz1+3AjsH/NTufB7kA5MTnCi
	z+qAIJCqe7vElGTcdFCrMbRmjl818yOHWFKvxmh2XoYpoAVwNoVPvIZT9I0NZS6iJhGStlXz0oN
	BibARBXhDdksc4p5GmtmmmLMsGKYze2TAg9xJu9LyRk834A5ZOYNV5/+0DYzcGnRrLgY=
X-Gm-Gg: AZFdTZcc39rfMqOH9HGKAPfbhn5MxEBefCjCgprxaW6p5L53cCrhNtTxBVvze/kIs14
	wcrdMPsHzZkiroW3hkT2roPRNTUw4iqC5Dhsh8kRnLwVhZUWl338Ypf6K4JFZVXFF0hL9Mooj4J
	L7XDfvYYehvJPfvXAa0lDQLQU1LtGBum5kOCG4zoNi6Yd+md09oZTgbDeaEpGuiX5wsTb6ZwEiE
	qdui4sqJEl2G0rber0R/DMntoJmTTKtupQTrrJmvTyqS4CUX0ZsJ0L5/c56Cfu5wJeKqhU5gQfl
	xtxm4sxDKjRzbI7hLRpgYQ2wrGqk/zH5Mu2sxv/3eKI9QNSUV+2aPXcL+JHIc5L7QOqB8MTti4B
	OiTCsdtErDDJj2RPKPZCKsVWGMQXr3oE01EQaDvScWhMIpZXRU1wKF9nrjh4xq+Iu/b7GN8g=
X-Received: by 2002:ac5:cd3b:0:b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee8af4a71fmr16430666e0c.4.1795784080703;
        Fri, 27 Nov 2026 04:54:40 -0800 (PST)
X-Received: by 2002:ac5:cd3b:0:b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee8af4a71fmr16430642e0c.4.1795784080301;
        Fri, 27 Nov 2026 04:54:40 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba371072f6sm11126122a12.28.2026.11.27.04.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:54:39 -0800 (PST)
Message-ID: <bebd75e6-3d67-4f1f-8909-f7a9786ce3d6@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:54:36 +0100
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
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage
 for panel nt37801
To: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mahadevan.p@oss.qualcomm.com, rajeevny@qti.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
References: <20261117-resend-upstream-attention-v4-1-3f11ab312d2f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261117-resend-upstream-attention-v4-1-3f11ab312d2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 54UjB9UPZJ88L9JpHU9aiKZzThRl7lrE
X-Proofpoint-GUID: 54UjB9UPZJ88L9JpHU9aiKZzThRl7lrE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MSBTYWx0ZWRfXxWPYM01Fru8z
 KxB5v9e0LPXmLmYJ8qJ3tvtaxiINPxlmNFqXLIZvTBtacu/IHa9pDovYOtTSpVFAsxdvxYlgJvG
 lULaasaEAb5Z2nE6K44hgvTuXQ9Q9CXFxq+MPoDmacMW+uNJrd22q0CO+QU5oX2S/+lA75qEc/R
 59ifZx9JnNrnsjD/9EH3GWkdO1ApNR5YIrQT591NcilBz0JIm8IM0QY/bdGmeOwBKleV8OlaZ/y
 fK9ACAxZKqQYAT/0cUWYvqx6Bu+Wn613ISnqgf9vwEjmTaOo7r9yD+2s7S9sRVaYJf0dCCg0RgJ
 YVsE7/TWD3ZWPj0gXQuqTgdANn5LjmLAt7QCqrawFiICCbbSmP5dLsy0erQW7ZQ4+BtAkvXekcE
 Fne2aFCrDddhKO7cBPF5mes32bERUn/gxdS9UjoPK1+uVBLgM2cducnjjglqx7pNa5bAgrwRrH/
 QmTuSaEgKIIqARaAm4Q==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b097d91 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MsdpSpnpVP8ozw9Nrd0A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MSBTYWx0ZWRfX0P0zZDRStYA2
 xQee8Yn2Ti0CxbXY91Pm1zYkSuWfsn5mKt+A5kyrvqgUeB2bgKECAtcT3N2IQz60XTboGl8CKdy
 EzCNz7IrFraK4pNdGG2em8u9P8XHhVA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270051

On 11/17/26 6:54 AM, Arpit Saini wrote:
> From: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
> 
> The NT37801 Spec V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> While 1.65V is within the range accepted by the panel, the power grid
> documentation specifies L12B as a 1.8V rail, so set the minimum to 1.8V
> to match what the hardware is expected to use.
> 
> Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
> Signed-off-by: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
> Co-developed-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
