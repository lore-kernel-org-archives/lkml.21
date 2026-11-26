Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704720;
	b=foBiFny7GM+9UPxst/VMemdZYQZneSzNkOrhxe5ZKqxTx0t+LBpaOH760799+liF24Y0
	 NS5DF16oRlpbtMCq6AWF7U54NFsi75sVCyqlLgYZpotgaRcLRbuAkmwvRn3gG+F8kMHD5
	 K/7hBzGPP6Ix/oYlKIlHhNr7AmuBe5KAFVJF8SF63xMqsHGLSUM9GwWTLMSi7hxV6aqLv
	 3JlIOxrQqQAnsctN2n/xmUEoL9+4NTbeugJxrgU7NVe9dIOx72KedoNgBaC7daripLcTr
	 CAKBk29Rpb3Vu41cV8jPvQDem+OqNSlRV0lXrO4DIgkgMTn5SNF37mRZXfHlK+xeWJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xI8m9vEWImI/pxO3zJqG+/ZGVgDGikFsjhT5PJEyTA8=;
	b=Csl2ZTfV17VQhKT74AM3qRvr/AbeX2ZW99llwb6CBT1HPEzA19kzaBLu0msTj2MIi+kE
	 2GoiiGE6wyGIbqrlJnu12lZuYv+eo0DMvH2YsaQYE2UXr9Xk2zBlHWCft7ujjYsHbRS/0
	 c1h0tvxX0W02QA8pzjhGDibJFgDFBAXhWE3tO9zRPF/bKDMt81etwaRKtekX8Y0ZA8B/g
	 bE+qe3haMvMqZlcYfkqMobcHb527uZLYZ5mQso0BaXh/e+It2XVWSGD5+jVSVq9fF5Zu7
	 YGyfCY7ygCm+jt1BUY/zGitHCh5MIUhTHrxNRbvDJJm/k8s/w2sPAQ4fKYfuhtyNcFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ma6CmOqV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqpblyhN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B948606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B948606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ma6CmOqV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqpblyhN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV4ZV1882589
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xI8m9vEWImI/pxO3zJqG+/ZGVgDGikFsjhT5PJEyTA8=; b=ma6CmOqVTEZCgkuP
	m5/rETLGCLHystYO812TFoucX4mUdO0JjX92XlMITVuF6EjOjNreb7B3SuhuioTt
	LQt85y43KTKE9XVpLQCBq/Q/j/uvCj+I5SJAFIUe906CdTeeW9pH1sHatp2202YN
	CcJFFIKoLH4h6CS+ojZC7JOqxROKEL31WDgt9q0uLaL7t5WUuFqynEWxmijuWWkL
	axYo7tWVVrxVq5FRjndE8o7afILN6KNXX3mRto5hGTBAJYeCge3CGF4MeLBz2OVS
	TsEUmKaadB3TumSe3PrIZRnfmxt7KkdbFPGShSQTlLgEeg47reKppBr+4dDOFaNm
	TdqwDQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y3gus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:51:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-54e4ecd1b4cso16033531cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704718; x=1796309518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xI8m9vEWImI/pxO3zJqG+/ZGVgDGikFsjhT5PJEyTA8=;
        b=iqpblyhNJ4zEpuCy6AGzzHhRHB5JJxEjLZoVXM6tBWHGPA6S2Jf7a5dVvjdTIhpYML
         sSAV4mxelHyLC7Izt0Wye560jTtK0szrUYLWGYmdI4cP/ch1ccIOu9zNbCMWGnerM6Fs
         yPGYc9QOk7Vkxk4ydKrw94NqnfHSjCJidpRl57w1UOWIdaGEUKnKE9zbp+/ZcPVQM+sp
         uDUqPit3EqFV6wYS9aBLiCFZuFKPTJecI7uoW/kgxHsY+QAC8X49v0zeFdoZj5QQ7ZTW
         /nwJMeOJKzU8bvtRx+Fle0XAVXcs5sMSybTy/y1CnEmHvcOK4BbOoZ+0G15zBfrxSHZp
         yumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704718; x=1796309518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xI8m9vEWImI/pxO3zJqG+/ZGVgDGikFsjhT5PJEyTA8=;
        b=MgbIJyji8dzn9fxHLIC3Ijl96N2//t+r9aTZBelaA53NtZ18yeRZoFh9VFzl7nYDNk
         gwO/A4Vaolh2JiuqaaH+6JhHQ6rcLVFu+HgM2l/975dl10e2MhASnDj+LeGHxWGL2stF
         UStsDtnVDAqZtAaxA9m3DBYv6n/aCAPz1QxuRayf7khVNG6WC1NdNLQ9d3pzFszKlR5N
         uOhrSmmUQOc3qTfkG3t7prT28qM/TkARkTlcOO4/gzepSGBFGAyH8FCQBto8d6Y/Vgp6
         mON6daz6WBoQeS8UUU0qRDSP6VC6GXmvR1MUGziQ+MWuLez2QJEm7FsH+kuHfCJtL6vI
         f5+w==
X-Forwarded-Encrypted: i=1; AL+hErGpH9rgC2cJ3dbfx54Xk2prPesVImG4sIRvU+xN1by7464J5S195CPCmgNAK/s+CxNrmmnDDYlDwcrQtww=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nMGKEonyyk0m5SfzVcZrGF9oGAR6hC9LCD+Xx8w//L7FRBsR0
	TfloXZGP3MhI8/J474yVy/pj5hcaHqnLNZe29P0YGN6HPrTYvsOYEVlPAwNWNSSuh531t3IKKmB
	Ymq4sZVfaSZQZP1YcDhExSQdG0BwraAwMf9k1vZxpiQyUMrRs286Xo2uGZZeeR3439EU=
X-Gm-Gg: AZFdTZeklfagA63mhv1YbXOtZgd5FjqznMNyGAWPVj5SpWk4pSsl3rDfBvN42AFDJ/q
	sGwfRz1WTW1JZGyAgBp1qmQfc94iBAGTpji1YarO+4/HqeOSq634ZoTcXhL9g5W5nPcnWGZUXFO
	P893CE1eUpWB05j8a5O/ZDzDOHkea1QXbd7N57wmCemCEe8KIwkq7VIgcclSES/L1rONdu+51Ym
	1afNS1m/nkZ5JR2fh3G5uGTl+aQ/LWckxJVEX/Fpf8aJBvHQ471iHgQgjsySoZ3hCPLc8Xyprug
	TCKulpNNgDDBSJCTdFcTWgBic8Uivafv8/LnNtyBzQy11pUEg138mFitHYKfGIzAoTqndsedDiI
	wOajJ8jN4a/COxxOMlnflSSyoGaqLHVHWOgd6XZVJSLZAFSwTPNupEUp3t3+5fQa5P48rKH8=
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr3374722985a.3.1795704718212;
        Thu, 26 Nov 2026 06:51:58 -0800 (PST)
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr3374717485a.3.1795704717712;
        Thu, 26 Nov 2026 06:51:57 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm741485966b.13.2026.11.26.06.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:51:57 -0800 (PST)
Message-ID: <874b1934-c17f-4134-98c1-fa24e287749c@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:51:54 +0100
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
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Enable
 CDSP
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-1-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-1-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX5wNtc66r6GII
 L9ZrLJ7coznLjgT1ID+ZpKG3QdT0vRqZwLHZlYODuptXKUfxAiJQLa8vMH13smbmL911g5sXY+D
 gdFGozOFqOlCuPpz5p8TTZ6YEHReGqQRfWvhCPxPcCTWoZLlrIOPO2Jn5L+rI7Ayw+Hx6eXN0Kl
 8jgS3CqHpyeUr1mZmtEVNSQp2Cgpi1oa390m73mU6F6SRVtOYS2L+VZC86UmNvZ/NUTYmB5H7/c
 2dRTZs6MhoKW+wQuRG7ELf0AojZHPDXIbJbxVbXldVye8yFDg7RGYyUOvrT+jDyGwn9N7Mjkf8z
 aMjcUJE2FyW2GOxoLalPqtqZ28HyrkZ/++WD4+rNulLel3awPkfktQNi5xxb6ubJC1gYqGFTUIn
 T/CyHYwdz8u5B8bhzdO1vJXGW6BfOVZsnH24XnYxjshtsFemEV+LmBHAOnuPZiuu8ID+vh6i5Be
 DBe0mw939rCZI8lit+Q==
X-Proofpoint-GUID: RaiB4LuCFgNrDQh8WrjW6zqJYpwIPMyq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX9LXDq1fEBZjF
 g753gWqeExH71a2WlzApyH8n09/VLe5/fDln8XhLYFbsc4uTkFseCHuECI8FiB1jL1AE1/yLG41
 xey6bQFkleP2pKPodPT9BdGrpybu0ws=
X-Proofpoint-ORIG-GUID: RaiB4LuCFgNrDQh8WrjW6zqJYpwIPMyq
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b08478f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Mq9dOPq6Hou_Oe_0EYsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Enable the CDSP with the Samsung-signed firmware shipped on the device.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
