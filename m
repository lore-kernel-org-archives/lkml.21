Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783308;
	b=IUMJkvK00Urt0/dBsEooX2NQwNafk/LdzaG/rRpx1/LD786XWrmzjovRgy0nVjayDQq9
	 iApWIVrp6gT/h52NhuZkEvghbGSeQBf8RVn0HOQJSnN6LCa6tT/P6aLf5W46WhFhsWFwk
	 eYx8aJGybimM2MCLgwyt88Ii6Ucz1mAAxaBoeumJZ7o5e+HJNw4au+z3vjNLI6Z6dIg9x
	 z2FC39j9AX8+RBoA7Y8bqI/sNlUE8KGM4lSFFtAMDAe7hiJNYy1TjkGaleIdw0UfUQ2sW
	 TywYfF9CFQ1P3kGWXfJdT2fu8e0CXwZR6JYP/6m6jwVDEfnt1axSwfAYMGZk1/VvtnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G7WfnYAAz9L7iq6xcuOnJKP+ixkbp4G3odLAKqkVuMg=;
	b=mEiu5wKQTmZrRpxRzSQMuMUvBTC5y66PYlxDG2rHtjX6jRVjdtRzJEB0w8fOysbtnQGF
	 Rsz71sU7v4Q3TES7XxQAh+YFF1RJ0KP1U5wFRFoyULQE3Ux4rPWdkTp48KW39zXTk9ze4
	 hSl7dNKsF5A4XDI5vvAmzFe/QkuE7K8YSORjtYcrJ4N0YuknxIlGl7RmBt9GqczGQ4nkk
	 oDMNhREdXoI3t9Xh21ZMkMeVy27JDUdX9NInlwBQ0fJ3y3gCqmGDZQ+MJgMSw6XVEUVaH
	 MFAC+7Ko38Wy9IC1mWSXmgrm6y4nlSqIeJ1kPKettJ0Vzy+Rs9McRRK6OZ+0b5Rc8Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ksYuS3+N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jEjY+FC8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0050606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0050606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ksYuS3+N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jEjY+FC8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAsHH53609882
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G7WfnYAAz9L7iq6xcuOnJKP+ixkbp4G3odLAKqkVuMg=; b=ksYuS3+NdQcAkupq
	UqtxonlxKl8nzWLPnjJ2cnDy4QMEFs8ukuo/xtyLmhlxavYzxHwouTzgqhYBoMbE
	2FA5UbMyhVHF5c3ODFPVYbg9DjA9YSOu5EszWDVtsLgLG//r1U/pSoNXMRgZtA68
	ePQQjJsazCF4H78cHmZmgZXN5kEbalgR4Q+rqk8JgnK5Wg7nRJAauY1hDBqouPYA
	jrWUDUIIiP9xyUTXioJvgDZga74UZUqQzVAjVdS2/KZ9qzKXIXJHo162KVnU/xX+
	c8g80b8Zvlp70HFSnj+8i8A9z5BKRrOev4mB8d/T1F6sBjKs22r5tNsBrlTg3Afa
	Zgo9/w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh9nh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:41:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386b8624cf7so7019781eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795783305; x=1796388105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7WfnYAAz9L7iq6xcuOnJKP+ixkbp4G3odLAKqkVuMg=;
        b=jEjY+FC8/F6SyJENSeH/5Ipor9xyWqnnr0kYQ0vAXgWx6l39ZWH45sesJV9MrMRRRq
         F4ZbARA7aUR+WmMqkpreph7pteI3BAyzoLIL6qIvSApjUESpkAWSO6kwuIqAZXzfrFvK
         Um0Bf67ehWLPUavx8SKe8KnzjBP3E6ifMurS9Mj1DDcRiWGtsufEEI2r/p6FBCaDOacK
         1Rl+uhpiTsR1WGDmIT9VGpmS8OJf/OEsoRvj6pO5E4qS8KJqlxkep7+fB0YdmaYpmZSO
         LemZ+n+ryUjf80EDvuqcYBrycC5igh+nZx6t+2X+ivcZ5v8w4GFDXWeDQFz8Phl+Y22H
         rXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783305; x=1796388105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7WfnYAAz9L7iq6xcuOnJKP+ixkbp4G3odLAKqkVuMg=;
        b=AGJ93+dA0E4lYh+t7Xkwu+kvVVagnMxtOsNUt41kPOhT8Ns2o4MOcGO/CUam/JF+TQ
         3yY9dn00OxSKIgESdwCQUcrmex2w1dk6NmD4uydd5cvJ7tAKQHOHZSTcitjNIrAgDMkx
         kSuEi0rxNdQU83CUUGKoV8b4aOhgrbqJWskmK4OFuTZCMgp+zJs+Czv16hDCLJ/iyNNg
         a3BR1gYzFmhc9LpysVQCtZI1ah4tUxKMto2YSZHJS2471Lgjg8o+2WIRH5G71PVM/JD9
         tVtUuyRUU9lfon3rGxuynFMV5j5wMPHWyTZeZlThWuRka9ZndR1Sik3CS+frdb0tk/TH
         WWxg==
X-Forwarded-Encrypted: i=1; AL+hErEZyMhHY3heRQfT+YtLQkVFjh2A8jjcZmA302yKhvnrOuxBp42O56MZ1CvU5MRwwVVx6k4v/ErWwWyE3DI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vZ7aP7i7TZtPp1N5e75ybmQW+s9H6hs/MT51/ic9gWYWDBuOs
	ohQnCioUctrA2TeX++muYhPiplVGfOpoN7ZdvK50l37qyRwG8icn6GTwqkCPs1IVJAmC94aqROy
	OL7rs+it71aDIu5fSi9bsX1ILv2VbrghQtz75c44oU+pAxDBlhrU5JX0s2+BFTE71j/E=
X-Gm-Gg: AZFdTZeFTsqMyZhB4R+sp2LaJbER8rfxoRe58HNXdJfT7+fj91sVFl3ggWqsd2LYgrl
	+U3349sPtb94a/QGopD+Hq2q00n/qXtH2pnaqIy7P7054DfCbfy0WuA1yloONHVKAbEbbmriILq
	uhvaJorGlxRlohW8zbbUloeWa2PX4QAXh7EybsPcpgtG9PA8JxaWNljBlOR0gDmhINQXBMJgHzP
	MlZxFywsSVspq/8xYlPUH9djipfHZg865Uv4PeZejdxvLTMR6nci5Rj3yEaedkggtNZJgeX5bel
	X1g1Mu+avzVUqJKSF8ucWdIOaLBO9Wv6hkMQiqyJyAfzUTJHwHrM6Uu4R3rzSib/keHL3D6JjCD
	hpu7kzTPq5Ypk+zcVkDIgz3JRDr70ndcDBzbYCfYqjWrwPUidTT41x5OXUY+RwyhBgv+RFtfcz0
	KxZk8EfA==
X-Received: by 2002:a05:693c:65c3:b0:386:e9bb:d9d3 with SMTP id 5a478bee46e88-386e9bbda7dmr2871195eec.28.1795783304844;
        Fri, 27 Nov 2026 04:41:44 -0800 (PST)
X-Received: by 2002:a05:693c:65c3:b0:386:e9bb:d9d3 with SMTP id 5a478bee46e88-386e9bbda7dmr2871178eec.28.1795783304400;
        Fri, 27 Nov 2026 04:41:44 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm74177848eec.28.2026.11.27.04.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:41:43 -0800 (PST)
Message-ID: <1ea0310d-b25a-4e34-930e-7998eec03605@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 18:11:35 +0530
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
Subject: Re: [PATCH 2/4] media: iris: use dma_iova_size() to check the
 reserved IOVA size
To: Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Leon Romanovsky <leon@kernel.org>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Sibi Sankar
 <sibi.sankar@oss.qualcomm.com>,
        Honglei Huang <honghuan@amd.com>, prakash.gupta@oss.qualcomm.com,
        Alex Williamson <alex@shazbot.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, stable@vger.kernel.org
References: <20261127115849.2780625-1-m.szyprowski@samsung.com>
 <CGME20261127115900eucas1p268ca3a6688c2fd99513317dfc99dbf59@eucas1p2.samsung.com>
 <20261127115849.2780625-3-m.szyprowski@samsung.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261127115849.2780625-3-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX02nMYIpy/FXJ
 iP1BhgKWNSZB9GOINH7I+Sccx0t1oJzKdn84rF8PqJwxu8qEZqmzWn40fnYQKGh5vQw6k7VJuWE
 Ma3pUvnst4AhJA0tRjU4jMMLmd+XsI8xY5dbnwMQ8ixT5omi3ro5M2g6DKuyr2CjfkEkO1I5PsU
 7y9HUMjw/D1ZZmNcWLcdfrvWnGY8/BzG5YsejmyhU+cBhB7KCtjX5Po6rsBuMa6ji+YgYVF1CZw
 UGTEzJSGdtWW43zn4/zrPZftGbztKA2v3vQM6rE/EuJX8MA0OK8B6Z5qW2t9yrHK4XNvw/jLmAY
 CvdKDwScMN89flaVXu9evBs9nCFBAYnsk1Tsf1SoPRHkRDyMROSitTjAVcZocRnZMgL9Se3qcPR
 x/ssQbCPflgW2iz4Y5faka4nMGFpUcTOtiotFQcJr2xNOLhysaqlAq/5bamHFjQT5vsQmC5PTt4
 nLTiwlP//SzKFXvZf6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX8dQyOe9L8IJ2
 eDAeyf94Bo8tDwB2RyIkAKzocj4tX7s6NfkUudVviz/9/0p12T8K3zrCIu3dBGb2Dmae2zuxZ1d
 kYhZIBl+V9fXUXUZDv/seS8r0xOOKQU=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b097a89 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=umoC_DmSGuEwgYlhGCYA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Z1XD5fnoOMMgppI1AZ1ATaXvIHEDanqr
X-Proofpoint-ORIG-GUID: Z1XD5fnoOMMgppI1AZ1ATaXvIHEDanqr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270050


On 11/27/2026 5:28 PM, Marek Szyprowski wrote:
> The IOVA reservation code compares dma_iova_state::__size directly with
> the requested chunk size. __size is internal to the DMA IOVA API and may
> carry flags in its upper bits, so use the dma_iova_size() accessor
> instead.
> 
> Fixes: 200473c198b2 ("media: iris: Fix iova allocation from restrict region")
> Cc:stable@vger.kernel.org # v7.4+
> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
> ---
>   drivers/media/platform/qcom/iris/iris_probe.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
