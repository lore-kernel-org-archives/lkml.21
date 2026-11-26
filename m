Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703996;
	b=nH0BuG6d+XJQ38gOJ7S99AOaWt6iAJoEMcXDChtfFQRtennCw1npWKBf5Z8uOYW+NGmk
	 HOZU8QABjJuyQakRVHKrgDoTL/4CqKPCU+He8r+YyQF5EzFgTmhNRYCu6bWjQgPH8fbH0
	 kY0gmzxvY2JbcxY5TWA8X6n5b2f5hAWd27b4dnbDCRhHcyx784rN+OahVBiCiSbh3SsxT
	 x298ZcLHBeykxjdnsBxDaV6Xje3LbMaETMYW4bH0H/f2APtrWGw6vYnRLPesUevohbgod
	 yKJGbN/Qj8ES99uW/7+6xhsa1FZs/u9vAVhDHWXHSu1JRkWgMVGl889/rnGwLJApytA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703996;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4o6hxaMULxHqbctzpcqZn0i4+vQqLZ7WDm3A2Ju/p4A=;
	b=V3jn0JBA3EfSyims0cGXi7WSU3qHdreWfT7iBuvd4aSVs7X3lAa35T3530VDQGTXGfPw
	 Oetqf1N7Du9z8GvzIH+ew3CM99GK0GRRtM4gRAZpD5YcmvXv69bg+TNuViZjpKackN2ZU
	 igTZp8B92aibzjF7s0SqtoCyqDgY1iKtc5XdkhpW0YzCb45Vg7jd5t2dtfAdD0/1Q61IU
	 /VaFu0O/9urkoaOke7LILeAtYtbwZpqbY9cfpZ82BgIWrt3qVjqCUlNIpWRdxb65l1Py5
	 sq3K7Y4NFbJkUI2gqWsCH25Ov0E0eHJquvqNrayQP34Edwfy5XGL64n+Ect4t+wIb8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j+Yn3eps;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FKNJCzFG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1ED606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F1ED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j+Yn3eps;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FKNJCzFG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVAFs088634
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4o6hxaMULxHqbctzpcqZn0i4+vQqLZ7WDm3A2Ju/p4A=; b=j+Yn3epsXuvzCPA9
	f6uSvOK6O1ynXZLniq3rilBDaOAIjPc6utbZ4AKCo2J7TX/9mqFW+MXXrbp6q2yq
	nXKxFA4PlfnFURe+OV3GqBD6u21T8iE/Yo8kdu5QwCvriUZxIJ+7vYrtUy8DNoe0
	GlJdDmOqzdGVvocH838y4aQjz6tvtndnEofKc52pxQFC3pB+7Zaw9m5xYx8gF8un
	Vpp5hzlM42OfD5E1+1AZslQH5q0sO70x2UZmIHGCiyuxy9BPDy5Qgyu6XpS4+6wd
	nlsaVJZIoRP5sodiTeNhZLaOq8jx7H2Ye+opNXC9N1DPES8CRNi4eR0+R/fWDprO
	DZENYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm817w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:39:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94993a54a73so63996985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703994; x=1796308794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4o6hxaMULxHqbctzpcqZn0i4+vQqLZ7WDm3A2Ju/p4A=;
        b=FKNJCzFGq/BS8cFeSIE5nnxhh8pK+7skNRK118uSc6+Q8PjHYvV9HzCKFHu7Is+sio
         K8WkPJfZqKXncK6zf6ry8rPUolzLpM+oIZKfVQ6/f+mQm5B9ewLzHXelNnIm5vR60KVz
         n2Ks1bF6lRfuimih7a+SMQQtMDtzM2qGXALeisyLS6XwvHarrvYMLMVZ2AQByDQqfGO4
         IQGZdF3RN8zaLNXxNBpRo1JcOZetSi3JJvvvKB+50yvKDsSzviwv9u7xsvUBqNOnuuhP
         n9BkbCxU+NpI+0GZcQu2ljPshxftUvuHk30P99F0fvK/KT4eGP4JIvk5+WJoSDWyrDkH
         wPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703994; x=1796308794;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4o6hxaMULxHqbctzpcqZn0i4+vQqLZ7WDm3A2Ju/p4A=;
        b=Cls+BnvtzeUyrB0f4cYEkGoT5zUdVOKh3RsA14+Oec9zYqTxyrNnpXW8KnZ5nQCS5R
         FGa/8Vf4DoD5pctFzB9nD/gwEZfK+p7TGwLtFWHRqL8LhkpeG0cH1yZM4b847PvNbhIt
         Nlc1E8bSLQEK5mq3gCkcMmGLh52+SIpnd8R4nSDSv2y6XMbmDIuFTnGa7dTc8QLrp/jM
         GaVU0UZZcDt3gAtPz+RSCmGugPygGhoiBJXtEm6NvI+SXfg2c5vSKc5sKMtgm0Z2hCrj
         MbvfLlaftKpV01RQ2KPjfwsgE6rhm3SAK5Ftbardu9hcAiSb9g8IHBIB9YP2ackhs0//
         SdIg==
X-Forwarded-Encrypted: i=1; AL+hErE6TdvtOewxUjnMrEk0k84zeuHOypy1e9op/pQeGZia2z90dVG6UA4jNzBsi78BDuCCaLWc5uRDgvmjs9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AXnXQgPQTgyPIK/X2r/uDatYXDIhwg9M2jcmkYNOS9aR6KQVU
	N3g/wSSyrOngAVSTt5Rp2gyRiwpjaHODoyQhx9MUwzlcr/7SwWwd8/mOSKJtSzILYd2T78jKUw3
	JKhK8dFeQvNPdXZajDnj2DfQvmWDaLT4shX6wgzeZSPBqmVAmWBxvL0EHGtlHRqU2kAQ=
X-Gm-Gg: AZFdTZel0CZq1+2M8GVC5e2R6qzOh05Cl9RDxdbQyloP35ABWXpw9doPPlsiA0Vba6p
	Q4Mz6jPlQFfARBEfYLg2zIkVZwD4l+kTXwyPHzI4Oj7PHPYkR156VxI85a48krCT0nU4i5sh25A
	C1Mw2qjNzP76rBxPkcrcOFAeFP40dL049Z4yulvurjGE7yk/uQeS/z2JfyvD7d6dYPuvE5bTg8T
	OCMnnPrpJJYmwXR5jKmZZSCOpZnviDDo864H9+w8f0bjRN0kjSjs3m/nDsnKxoTWaaYDdB4d9ob
	6dB8Wa47bXyfjgr5hyFzfTxUELcapzW3O0bRMtuIJoiSWsnqkJd046fmxFK38cPuTgUtB0ciyDK
	Da53VfqP/2QTwIQj06kr8fMAnKWAsuzb3v+E/2gugb9UkzOHSizw20bXbbQIPYkM3LIhkfco=
X-Received: by 2002:a05:620a:8719:20b0:949:b116:182c with SMTP id af79cd13be357-949bab698d9mr3428196685a.6.1795703994548;
        Thu, 26 Nov 2026 06:39:54 -0800 (PST)
X-Received: by 2002:a05:620a:8719:20b0:949:b116:182c with SMTP id af79cd13be357-949bab698d9mr3428192285a.6.1795703994052;
        Thu, 26 Nov 2026 06:39:54 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm9326829a12.3.2026.11.26.06.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:39:53 -0800 (PST)
Message-ID: <bf91db79-ae88-4402-9b5d-bd797658d03e@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:39:50 +0100
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
Subject: Re: [PATCH] drm/msm/dsi: Fix double put of the PHY device on probe
 deferral
To: yzddmr6@gmail.com, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miaoqian Lin <linmq006@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261120-upstream2-msm-dsi-phy-ref-v1-1-d267b87d545f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-upstream2-msm-dsi-phy-ref-v1-1-d267b87d545f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uiZ4g8NUGd_4Wf_Dncg7hBUIHXsYX4Jz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX/sUROR8sbGwo
 NMToM5M7vKDs2zL0Hhl0yziepUgunAzXX96MqvD5JKbo285mkNpKbrh8ccklX79f0Mui+WbcIhh
 k+sCf7kznGbbOO2SLXnqlyWAIRlUcTc=
X-Proofpoint-GUID: uiZ4g8NUGd_4Wf_Dncg7hBUIHXsYX4Jz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX6IhSOcXtwmVD
 S0sMCemc+2d8yagiMBFM8WEaVlIJUIwQksq1anNNsbue7mOKrzvZSurdU3fsLfSLMBdPlbwdEyc
 657K+ifAyJxyvWR4EfxOwOtx2ttjBzOe4OlFLV8PSrgmM//6y7ql/EWfE1fJQsLUhFJe2kMI42q
 4Zpm0kb+l1yAUnqNvemRnx7lZVM1hPl3M0gev0Zx9TumG71M1K5zVlSYlIR78UC33y/rwvegbt2
 rooLzOIhYpzXl1MAehrOE/9pizjdHcTKhoit4/WPhks32w2l6/ezt18UkC7NN7q8tLjIbxmCzGX
 pzLVyUy98qfACFl07Urkv0LyfkEY5ZOFm6mdqgsm8xz+miNz7A6X4I62gttrzPXiUPZDNX/URAI
 lhLMMMIvSQSFbjg2ilWf6xR66GeSbyLY5bxw+RYh0GMPq4hnM7+0uwSJ3P+a6EY/zP9FUKGdY9j
 TcYpSdaEqy2+HQeOooA==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b0844bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=Fn84FyJqvcQcrJAY-HMA:9 a=QEXdDO2ut3YA:10 a=JkYnuvabuEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260057

On 11/20/26 2:12 PM, yzddMr6 via B4 Relay wrote:
> From: yzddMr6 <yzddmr6@gmail.com>

Please set a valid git user.name, we can't take anonymous
contributions

Konrad
