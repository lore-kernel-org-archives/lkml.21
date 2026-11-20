Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170337;
	b=f8awjdGTWwJMuWJguluQBvABzvLBSF4GudyKR7HLKzHeHUEa2UFaW23KjqAbgkbz5k7t
	 y58zGcm1FbI+vmiMFt1d3W/2DtEk5vsrlqBURTibOkBwqbDP3lMY1Fw5d2xaU4fTWwr8G
	 koQVVyTGYqPkxe+Z6OOk5Nf1I9ZP18DIOLgYfan8szOH4h0jd2S1ZbfE0KTpjcnUAT7wg
	 0pZAk0iPxsNoTjgqBMzIiPdqr6rtocrC0dFTjgF+NEM68f+Dso/03xO1i9mzXrX2tgCBP
	 4dlNuWt/QDhRVtl6q7lh9kDo63aKFcu4t8f6tsJIQzBUdTV1mTX9eXWg1WbRW7DOt2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ut2hNOaaHrPSnRNEPnnWVMx38OMkQ2B8AQgyQXg3fHs=;
	b=olf8eYuRBkujcCLqSc4TIR52YIP+5ybJ4aheCQTzWt0ixlB/vC+izfI38Oks20kiiYTc
	 oB/HFLa8GUqVwbFSVbVZr2ZkOI89aNQ0oK9Y5kYuQooGH8+QT5UyUI74NdiLwtNnV5Put
	 2bzkZCPww+3gqcAEYDyhfyVnAe8bsMWMrCpKZ1e1P2uRONivT1GOup+N8AUqo+OWmXTQk
	 mnssg7/CkK8/Oq8dwyJ4k7quMnGLKWF40iEY6WTcqvpFXHnN3b27HkOLoPSkwL73YiSPR
	 EISa1vv5C6VcmznnbXVuqnh19RzuSLsQF5oMaRHPtbr87I6HAnY1+uteXJEHkkm7bwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCE5KFU9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTyexNf1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4562D606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4562D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCE5KFU9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTyexNf1
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqJs144484
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ut2hNOaaHrPSnRNEPnnWVMx3
	8OMkQ2B8AQgyQXg3fHs=; b=fCE5KFU9/fiQGgHvP6sDlyxnB6IZwJbzQRfIffW0
	wSxG/UCKvCPEKDU461gqG26UxpP2qR+GUI1WowSvGonHtz7gjyq/O590nUOAlPlJ
	Z3dA6MFygSM/CoL0pAJdFwOhpsbVhkikqZ2zBMZL8ixJeYu9elsouXsCMQRglsb1
	d+K1em9x4BN0wGYb7cLifA5k/Ay7Bv0m6noHCraE6CGXIE1IBXSQuXiE9XbCeJT7
	fHF7gC8A6MTTQDFDwW5Y283IoZnGZUM6HMwMAAgYV60GYfNz2g8cSD71iSNMdG7S
	4vKqBO9DH+JdOARjJZSmvyT2Y3cUCZ6x3vA7IjsWl8e2PA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbh97e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:25:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9211f05706bso10735076d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170335; x=1795775135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ut2hNOaaHrPSnRNEPnnWVMx38OMkQ2B8AQgyQXg3fHs=;
        b=NTyexNf1+I4T/0Ml4x+nZRITzoedO2QcI516l3KaK8YBRWubLzCOpKgZVI1wcesPUH
         myZhsZR3NIYsptSOgo0Y3OXascRBtUCpFKEhJsCY2KDUltNnEEtpsrEJoIaL7hyn+Kdu
         dknRt0DevO74l5EgRfoaS2qt29IKcvr1Y/P/+KGpmJMoMl2k1Gst9jbLU4nd7CU9FTfS
         cB+QK3u7ZRcfVh/YnWDpxE4dinCTxMphPKHENM4QqOg1eeKBTZDhUAbpUEkeLc8+Ty33
         FsJHjTy6et2Xofp1MfTD0/laH60LTOmE2aYbfbpYdloTv+W7+IXUS1kftO2OaKw1+BJ4
         aOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170335; x=1795775135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ut2hNOaaHrPSnRNEPnnWVMx38OMkQ2B8AQgyQXg3fHs=;
        b=o2jeJSpvs6WRmaFtynsy9Q7K8bB41+RUO9RV0wA7mdZy9eknE2ILZI0nbgKqSDqEYa
         uGTJ2O0sArLZdz+x7RIzP0MjvT/NK4UMG1pTh6/6kdu0qkqmbICh8GLKlppBqOIg5fqs
         u3CIIJ4eaw2bFGnMlDeGS6CvKJwTBLzh+dOjOciGmTV8NU79keZHvs9RtbNPxnKv3K6K
         peBCsD0x16PlQLMz08pbBaayFup9idi5B0S6UVIQsgnwGOU0RqitKfxOCzM2PvmbSWO7
         WfCfQ64GwN5sd1zKInUonRscLK/gcfeRtvZrX8FK0dpjTvPRVgU1yJH0KNoQKL4ZhNC7
         JNuQ==
X-Forwarded-Encrypted: i=1; AL+hErG4x3eK+F5Jbhu8mHzvgcq2Xa/apavNF13jkfHZm2Z/H0JDrSUVlOjqq1Oaey4JbFo8oElLjGsOHbfQ7uQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rpV8qzMoPRQLf0RCnrE8dI5prLwx4wjU9z1p6Vxoe4w+jwt0j
	dTV146WD8omhgs3CQk3GjFkxUlSHhLf5iSBDcFQLVBAjxpSilSaMTW3+jJsp6T/cplPb+8CHwyX
	Aal9BWRbz55GVRgF3mDbkZxOTb3J6I7TLH0VHIap2lVSsdAIifbGUL5Ag/YgJ0JdOP9w=
X-Gm-Gg: AYBFou2ZS7ZtazFIEtDlgotfzBxryYOIJAUFEmm2OaEO/96sof06NpBcoGvxZhDjT+t
	qSQAtbfMwfkxgExHaPp+no4m1R1FVFtUASY24+255x91zzWNuxQM8uyMcER/V9QVfVeZ+F76/4t
	dJPoU9BIjScJcnqLhY4W22wsIdspODYkZxaMem4T46U5/8VlEFca6v+IcmIWg7CLtwn5OmBkkWr
	Pgsp2umJlEvZN3U3ujzacHOuB7Zl6ssCQq8AQ1ViRlR7TH7WXfbeN5cXrNFsnhkDgrxYEwJaQda
	hmwZO+vHRILag+VJIAgOeK8bBComgxbOG70Z/kEro3svkYypZNUK4/Sv5JrMC04DwrmK5h+zwBz
	v7nBCUu7SK0KZVfjYBK3fA1/QTDMwBpgGoOtVthIRL4nJ98h2OBVVbG+QhyQbwltP
X-Received: by 2002:a05:620a:1725:b0:93e:48fc:aa88 with SMTP id af79cd13be357-949bab1293bmr416731485a.44.1795170334551;
        Fri, 20 Nov 2026 02:25:34 -0800 (PST)
X-Received: by 2002:a05:620a:1725:b0:93e:48fc:aa88 with SMTP id af79cd13be357-949bab1293bmr416727885a.44.1795170333921;
        Fri, 20 Nov 2026 02:25:33 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm118841265e9.10.2026.11.20.02.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:25:33 -0800 (PST)
Date: Fri, 20 Nov 2026 12:25:31 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: hawi: Constify known static data
Message-ID: <hxvyvbjlv2k7fiqndvfhrgaec3355bnla7i5fmdiwkucey27zx@x7hzvv6cwpq2>
References: <20261112154357.271072-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112154357.271072-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfXxPbO8T8PFIki
 vtT4yeaQjv/WB2q7sucq1TRkUjBKrF9LG6CxwwehrWqbxl9OTVnNHM21EQ8kZexe8MmgMOHRPH5
 FzlFp9dgT0+b18dS6iX4q+G8v+Azxz42/L2SyExmRgcpDNBCS1/aC2kBJ4Ro18o/AS7rvxIsccy
 bWMEvyVc8IuP3J5OHYIpBVwCkPkfIbtZOK4S9AqQZ5rvW6K3UvOVI2LjJOis6OnNLGlFRTJlJY4
 VN4WhLk4shUEupGVgT+2gZZr5JN5dsUItB8gD2i6ZjN/dHKrtkHsWJ6o8zXYd7q/9uBXg6moc8J
 Vp6PS3o8llrRM8e5icl9TgMVfD6TKCdWEBcTts9EoQFEdJsQnELRZmg+kfejcyCt5GKmTdXYJWu
 XJewEOdrQtCskbN33CNgXFJfCyxXvrz3/eLGOkO61+FVAFDF9hJQ4z4NaP8fLqUXwIXg956L/Nf
 /wH8EKXl+VcMFZ8cBpw==
X-Proofpoint-GUID: wT4viCIi2yZ833nUQx5k6P8xVKQ8jFiZ
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b002020 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=l5ae-HWxQjlzd3G8lioA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: wT4viCIi2yZ833nUQx5k6P8xVKQ8jFiZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX+wZddBUokkTB
 R42sGgOT17M90RKLjOpGQgzFPiO1YSKL5iT15qfRvz6L4ahWPleUFFUi6Xb0nAg2EyLiFlu9bUO
 UF8G5EK9lonl9yQkQNDs7PYFDH6+MMw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On 26-11-12 16:43:58, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
