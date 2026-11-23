Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463037;
	b=5TdLCmjY8Tt3d95tZxB7RT0AkmJErfc3S0bsF1tWdnvU7ZOzoNGr4nrjoPShddOpzia+
	 wrdEJvyI7UbpbN8jfRO+PvX4/+HUQQ7eX2m1njDZrisX0Nd7+5jBrJtbC5uM2l88PmQlL
	 ZlGCzjeB0s8SEV5XfESdyesMjcN+RSABN0ZP5kRdEOuHMbAdxPZzjBMSKvXte6UB/X3UZ
	 GGIIljxI9jrTblfQN4Vnl6yQARWdMT4QLmWXY9mMegsga/S3Uhjua4Bh9m2Px5bsr5IdT
	 dbCu5ffzJ6GMXZTVik6nZutJ97hdKKaP+sjGUgQbXCqERqF5avov0yf0yQcqL1D0YMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463037;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fcrUVABBd5BeMh3yq/6enDr0xTKRX2RD7vMv5/wMSTg=;
	b=jivDsZVsSNJZ79N9VoC4TTgqlOrxDjbhEHjmajm0/cv73DnstK7mdD15FVuC7vQbEoaF
	 drRmW7d60HOOZ5tSAIbXWt4yq7TXTz9gbzn/UfVU92cwE/iU0TlMCBHqLJbrjpTb26SWw
	 fcgwMnriU8wJHI3sfVj6X6+DqZ4TZl/DykKPJWRfv4dsHZXA20EKZjG/6nlMEpIanoMgD
	 LS5eO7MOQgs+5dhv15IN0CxOfecirkUpnOX/FkTWAFYmCn+BZOhGOjRExMd4wQkpBC/J6
	 VOBJAyjEJo4uz1e7cW2zJ9cD/ToOeVgg6+4EZmddQRaZsjWtt0DxtO3HKHaeD3O/MZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jlR2J6Ge;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDa5qWFy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA7D606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA7D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jlR2J6Ge;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDa5qWFy
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNGqO647044
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fcrUVABBd5BeMh3yq/6enDr0
	xTKRX2RD7vMv5/wMSTg=; b=jlR2J6GeUOvDnOTPhh3wO8ea+tdICFP0OpQ2btOC
	O5un9FGL2kd6S+hOypQb7vGG18+TcYQvUp5jr03s57D2m47fW/1Q6hYTr14jEcAF
	Gj6Rh9x3xtTdw2PteX7tjHkeWGXAPZHW+Dw4NexuvA9hhYmO5033Kwdq2KVL+K2u
	Ns6ja+cE08Q9ygOHZ74KsGKHFtVYNxvwHbjtIgcZOmeQBXK23gNCajT18NHaeHY9
	f3ZpkRiJf4RTGA6IDuWEPG3Jt1MQIK6AVBjnQG3uyYvwHSn15O/O2rGFrIx9LRTd
	SLfth1XV7FJADTB6bqovH0S3yNW79HiHeOl+oAf5OCC4iA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg2h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:43:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so657797885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463035; x=1796067835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcrUVABBd5BeMh3yq/6enDr0xTKRX2RD7vMv5/wMSTg=;
        b=iDa5qWFyJj3qwAhJCC0v5x5b4M+NIgVjV6kQjYL3NWhfYYc1UfxmNzaJCdOZoPkoL9
         jTGCJg/lMQoyFvAjIUNgMiPdRmFBMweeqDnYDzFIOvKsYRmZPfA6Txr7N7QkEZmMdT7b
         RrjL0OUUTOmFYPYY2pA4802adfZ7QadeH9LOrl/23pGAcKTw5vyg8v8lUdsIqf/I/01T
         71bBIyINshwONZL2SeF6faqfTZ6Oivu6VmZfEVCPoKmqaEEexOs+SfLdF/FXHbkKY7O6
         8GnThM3WcuTflRjCVDmgwUv5XtN3tYeFQ3A60BZuccKzeBCeHFQcEEDluIvTlneH7yBW
         8u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463035; x=1796067835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcrUVABBd5BeMh3yq/6enDr0xTKRX2RD7vMv5/wMSTg=;
        b=h1twikoBURwxLXJdft3FnQa6PDPmYWdK0HsFe0JzwCGUXCxM1q8QTEoIfUV/RBzKZT
         7fmUi14W6MbJ8sV2P0DCc0rYqNKkAyAnV5wUwQjViFs1S7L+P7WV9FWZLP1xZMO+t+ST
         tx1c9OUq0FvZU0m3ve/GqLFSWzf0dR/AF126aybf7a09lU6SaSKmAC3jaxLrDOGZ6Lj1
         4nHao69XG0Rqgrjtp/LTaZlLM/goNsgrQBTV3u0AGnKrcacb64KEvzmSJzBW/6Kr/7oT
         JiB5B2yqbExCRlHik968hbgEnYgMmMH1akd2zgif36tF0XiBSzGx/MOYY5XOhIwQH85w
         n7dQ==
X-Forwarded-Encrypted: i=1; AL+hErEWdU1rQYTBuXuUPvqgF4nOkNwm0JHkApSHlxKKCqyz12rE1RjZUtMQBNgS1Z2IKZYsjvGj9JwNGCws6xU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cIHjddiGiT1v53c7dvVaJ/LXNE75zigCcb2SbRfxBlh41TI+T
	1q9qhqinoVq7XljP3UIvJqL6vMHxNV5//K1KJYAjUrTt6nSDLOMw8zXgImGI21iKMXLng8HTbbZ
	ZMYCBYSmMDgWS5GMdMHAd7mRDp7ppPVy1OtcuZhMfcTcz5GKQpY2nIQsunrSdMk3ktFw=
X-Gm-Gg: AZFdTZcGn3KCzBZSWQdIdYOR/d6RMJF4P4nbKxNJmDKY1P4XWKLvutgEeeuKOjaPvBZ
	NNV6V/Nu07z/veodpq6swzAtPV13oz2HQU6bZ9/FMC3uUtt87EsXOb7CugnXGW1ZHgn1xiUwj86
	kv+uAA5dIWYcbUG+cDtyRIzbrdSadzVHn4sHSJw22SLVc/cAarHnVT5+dypjQntN9CZPYindILn
	zRnlfrzFo7SsN0DEK2qhhtYUCyEmokVQFfb0FasGhtRCr7BXQ2maFzy78NvDsyEielQjmPZsFSy
	qiAnttSnGBvVe0+JLPQdM7kjzB2ooMuVEGqg4Kf1jnZNYsI+cT4ALPi0RsfZWVryZygyQ9Nehg2
	8NKXcYRP3Ou1QqRRfVsVZxCZwKHI0LI8E73yTyOuuyuu7wIPqwMVsDbgEcWpq6JwZ
X-Received: by 2002:a05:620a:8396:b0:944:192:85ef with SMTP id af79cd13be357-949ba95dfc3mr2013018885a.22.1795463034446;
        Mon, 23 Nov 2026 11:43:54 -0800 (PST)
X-Received: by 2002:a05:620a:8396:b0:944:192:85ef with SMTP id af79cd13be357-949ba95dfc3mr2013012885a.22.1795463033726;
        Mon, 23 Nov 2026 11:43:53 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm23340306f8f.20.2026.11.23.11.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:43:53 -0800 (PST)
Date: Mon, 23 Nov 2026 21:43:51 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 19/20] arm64: dts: qcom: hawi: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <6yjftfrc3e5xsxqpzpab53x745utqey7ivz3hws3l34qmlxdho@jbcmzbhdq4aj>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-19-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-19-be30526391d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04977b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX5VHcHE8/TvK6
 h+UPjY7Pzf34Hq0kRoRtbv4PJ3v1RYfXSKVxn+sfAQQZ3KkINAbd7AukeLda7Tr9uSBiyO3de2n
 T5hhJ2/cWtSD3tFH8P7AkGz8eon6e9fVRP5DdtfxjhsaZTQ4FN4a9goq68Z52tD9/Zz/Lz3uFJS
 0CrpsTQwYM1bcTKbSio9zQa86nz/3l7OrG5nRASK/E4fZ7hpdOBzj9lj7XXzaZzYlZ9Armd/Kwe
 goTUh7IXxHzkLQED5N6ZCdlTyGtEngrFxJf0l779bH2LFY0FoQPCRuFvsxFy6yhyM5CpeiGt/GB
 ZLC+eUFZfW7b6j89Ru4tNitclgij6WLMTd6NM5o+wbV//xxhZxQQDvOv3yFzZiIhRZQfQgCpMt3
 Ck9WANbTATIbOKcMGgTix4TNVx4nAuMuHDbz7+C8dGy/wWRBWL528+2fyxSYUCfTLhWFhCw5z7D
 GT4BfcZS3ATPocUh9Sg==
X-Proofpoint-GUID: l2pCmasJEMYLtCfQeUqcQP8_GZ26fdFB
X-Proofpoint-ORIG-GUID: l2pCmasJEMYLtCfQeUqcQP8_GZ26fdFB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXzqRYD1oqkjqa
 npoiTG8jzpMy8Tkrou+RaH5+kG0hrw4ZFu/6MEzs1CwArMZtRXY3m9nX812KuAriItmQtAN5C4O
 8o7BgGFnToJUd07BeUG98ck+PlrjQ7A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:50, Bibek Kumar Patro wrote:
> On Hawi the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

BTW, can you please check Eliza SoC as well?

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
