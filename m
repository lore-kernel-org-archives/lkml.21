Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786303;
	b=mHyegOv3jNGrP38E9uj50l9EpSkfW+nlpvSP30XGi8lGcK5R/yfqoWJy141CV52ftrC7
	 hqbWMRSIk9X3HRkn8Gkemadrl5isS/6zoofafsTUVRajc8f5eL6n4FpM7aA8lcg/YxCvQ
	 fORHckBypsuVjrnKAhffOCPOwo6mNskAuCfT3DMRoxEqZXtSWZ5F/gK0HKRKrYWFXhweW
	 a7PHwV2sBBJ/jpZ7ae+aSAAPklpk4suMqVuBXLlUBUkPJche+qP2D7pAa5IzMKXg1/U6P
	 38FWrosHW9nTsuRbw50CbRWpOOjRRT+joQxId3bVJJSaFOfdTlZIysbMsu6BYzYBKgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786303;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fw8zVa2/GdShruq/BrQ7DJy4AOp9EJw924iesQ7tk+c=;
	b=UfaXsBWDFbKjdbBOgwha113yOkf/ajTIpTpkFX62RY2cMg9yII/daUKqcg6NfFKbU2hi
	 ZUV2rFzboWQlBwShavQyEg18jIt5Aqfw7syXy4rF2VkZU45lqRi+YfCgcLn0KnZGDuROe
	 dJoLcm8bjmrN9B9+6Mt7Vdnmb1Py13bPFzodYtivtkAO/bMJsVxZMkrWh9KPBcjdg0hda
	 3Md9osyCOLN3aFkxWDbMpc+AxFCifGeUw5wKBmU+I/1VPxtZSa/RRY4vFq41JKMwiuzVV
	 zkdaCOznhpsa3CxrkdQg+mUg9Q3L2/z6UY5Cn/Mkg7dA7VBKJCUF4fnfGoRn5MrqN6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evH8njkL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Klei1wBo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DA2606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54DA2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evH8njkL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Klei1wBo
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChHOa3150649
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fw8zVa2/GdShruq/BrQ7DJy4AOp9EJw924iesQ7tk+c=; b=evH8njkL/TLzgNau
	KHzfI8iNVD1HdH3UOaNX994fNRKQqHHPUQ13YPOoMUuxFpkUhGSvvMyY5Jq+529A
	Xti2KksoHv3nDG9PnOnUSD1Oom3GwQAKqeddfQEzixm8vMW+W2AGScO6ZyG+aU0p
	k8jAgFRbhtrd/8VD8l7Z7HltCT+CXaaSRD/p/DCTgSdZVvvUjr+2zLuZJR4T6r9k
	umS3LHcbCJ683Z6woHLB4Yniy2cyWYLAHQi/rM42ucvj/n0PpHTYsf/OQ84y/XDG
	BsxLKvh8ll29YwoQWnXVaMrLI8Ih1cmcmjChWGLO14VSkj4Rz2jQCCMXwja6sCCS
	EJpcyw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf93qs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:31:42 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so4844568c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795786302; x=1796391102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fw8zVa2/GdShruq/BrQ7DJy4AOp9EJw924iesQ7tk+c=;
        b=Klei1wBoKGZ8Ivh01hemdBW/PrNYRdfKTuraEU6fSvXSF4ZxipSQe2YuLmOb9Qlg7T
         tmJPfohF5ntitehP6RJjIu1r/5x5C41G6Z3UbKWku+1LXZjDV6D7fszIRz7B29TLooAF
         N+QAahCkUEdHmL3krzVELef6FxORJFXVIrubuOrTDoKs2qC6jrW1SZfnE37cwnuPuzSf
         okJJPgAtd6QFr3ISPNQJlsXLEyXEEolR/l7Uegg55m7kkES02fZQ3f0aB0DkQ4tGpng9
         ri2zW6Bc/7ddHRDceLOBCGn9TMjKOG3I8moEkgx3htN0FatpPYgRyfh5/fUcpuVhQIE9
         gSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786302; x=1796391102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fw8zVa2/GdShruq/BrQ7DJy4AOp9EJw924iesQ7tk+c=;
        b=pgJfeqtYoIVxzWa61CeQX/U17eZs62NnOTbrx9B/HMKwIEt4dVsfPy1QHbYAhUTUgu
         fbDQCC/KxvrIvlDgrRKAMNo4bJhGwgF8+fHtp0H5FV3cvbCDtJgC3eWmdkYivDC6x+gs
         +xQXTDvuDfGQjS951aUeY6iNMcB4ngBJxxeKbUtQ3dg27d+OrGhtIQGkeCRGMnoZ7Xdu
         vfhIB6AhaTQtaDGgLPM2wG0uNeGBjXlcocXZoUIPuCyCRPqhdR9uET2iehYDyMZJg5gm
         5WBC4fc/YyJnuKWeW6i7INb3mazZuxRaXuNrQg6YGV6uwVY7EfGbz8EbONI9vzJ2u0HS
         jJNg==
X-Forwarded-Encrypted: i=1; AL+hErEM8ClERJDEFX/brWtplBmo1oX/MxpK52/oTaiTotQcX/75u9AomXmFIROMrL7f+jLrPzvBCb0V9jyIGZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fa/2WCuqVjyr2jMF3kBYFLv6Yve2Lr+RukqdUDIk2Luhvksbf
	IU0ZMaR8y86wR+u4m9LsQ+iUlNkjI24TcIoWwMO/PLUiqJKC1bM21B1ilUfNxuyX4AEuDLsyXqw
	LoxOGQotQI/m/FjES93AySYFDIDWXG8gVfj5N4gt4OV5iIIdAYPVXVUYlfBQDvqtO+sU=
X-Gm-Gg: AZFdTZcaM60HVsI3kjwd7tLvKNQPXc8acNKNy58HD5EsUH2/DMeg0NpoIn2pA9MFqxC
	wmLedlrtJd8r4pXbi47LR9PV8wd7JCy1Mue1whnsxh1ohqi6ixnBmaUqJiFgft49dyMDQDU7hlj
	0Q0L3S3oqdAtvoK1sQDQXVuoppP00mJKsDVM+zItQ1AQodqwkw5YZZ1+wOlmcubck1HcG/ZeT9e
	KP0d7BCVeO8ihszuGRkQTke9jFmay23Pd3wxfPCtX6wWhvqqv7ImZV9d/oa2w+SwaOWUVl5bwhL
	CTpNPC5c8D/DFpWN4jAatqTv5nFbE6dgfMlWJ0i+Yu4cyLugQ50QB0MtElgkIaoBglcRFAA+b2b
	+J8fGLYku1VHOaJ/CCSYS5hKUULrI9RQUJPDuUmULKbay5uKZS9TQ3UOCzgRGfxIQlSARezcVhg
	lRQ1vfCA==
X-Received: by 2002:a05:7022:e981:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5568ac1d5mr30974316c88.21.1795786301670;
        Fri, 27 Nov 2026 05:31:41 -0800 (PST)
X-Received: by 2002:a05:7022:e981:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5568ac1d5mr30974289c88.21.1795786301163;
        Fri, 27 Nov 2026 05:31:41 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm43708473eec.18.2026.11.27.05.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:31:40 -0800 (PST)
Message-ID: <c1a5a27d-5b59-41f9-976e-68a7961e9936@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:01:33 +0530
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
Subject: Re: [PATCH v2 2/5] media: iris: allow larger capture buffer pools on
 HFI gen2
To: Xilin Wu <sophon@radxa.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, dragon@radxa.com,
        Chris Obbard <chris.obbard@oss.qualcomm.com>,
        Deepak Sikri <sikrid@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Minier <loic.minier@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
References: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
 <20261127-iris-va-fixes-v2-2-385e8636c22d@radxa.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261127-iris-va-fixes-v2-2-385e8636c22d@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M2ks2vncPMiOJnUJ5LIbbBe8ehgI5Y8S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfXxCo92fvgT2O3
 lwfsyd2jJO6mmmiFuHHLBCq4EJMeuC7iWodhexvlUMjVJzkCdAmfDRjyREDAdPJZP0n+XxoRTZD
 1t3I+s1ZVaAh116zVipYAZVrWkMV+58cdzxJUhl/rS7E6WeYPkyLEY3GI9sCJtHYyAKUatPeLi4
 mXuovXWlaASMddfqMR3pqmuwsdraiB+kRvtoG8rMgPWze2z30DklIjC7PEDVn4tprcCeZD1I8qB
 vRM9sW6IGu7Kbif0pdT6+g1GSpsmYr16KjKmjGwronePYcxzSZjLuE5BApNukAPnjygn3omFhXs
 isMktJLLHQWmgIKe9VqnDRWF6Ql7yuAfBgMaOXthLfeOabJ3rpTXgt6QhKNQ7tiyAvPB55s9aIl
 isMTy1iD5QlmEMZABhOrmYDtzNphMpR/aGvO/dfEQKr24mOe549yhsxoy19tnH0AE5yqrJN1q/+
 991QRWG2WM4sKYKzUwA==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b09863e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=jXj6vGqe9ollWG7NQzIA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfX8utdsEjpAfJV
 44ufqXH242OCi8vTzjVzKbUxhJw6bp2OdzuNSwyTtN1dO/xBkoILguBED/yAbyB9H+4hN4/6sDe
 lmUSrNEbycITlYjwYa0B3ykm5zvtYJA=
X-Proofpoint-GUID: M2ks2vncPMiOJnUJ5LIbbBe8ehgI5Y8S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270053


On 11/27/2026 5:10 PM, Xilin Wu wrote:
> vb2 limits a queue to 32 buffers unless the driver sets
> max_num_buffers. Clients with deep decode pipelines, such as VLC with
> frame threading, can need more CAPTURE buffers than that.
> 
> HFI gen2 firmware takes the number of host buffers for each port
> through HFI_PROP_BUFFER_HOST_MAX_COUNT. The encoder caps set it for
> both ports, while the decoder caps only set it for the bitstream port.
> 
> Add OUTPUT_BUF_HOST_MAX_COUNT to the HFI gen2 decoder caps, and size
> the CAPTURE queue from that capability when the platform provides it.
> Platforms without it, such as HFI gen1, keep the vb2 default.
> 
> Signed-off-by: Xilin Wu<sophon@radxa.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 30 ++++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vidc.c     |  8 +++++++
>   2 files changed, 38 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
