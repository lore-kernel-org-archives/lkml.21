Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462896;
	b=sgZVBSg98Prahw0M2htXK1GK9BAs3eBji9dJhl9/YzIyE2zic4lqCSBPCjj5PaMR+Dq0
	 TK+BeLKRL6tVz5GpTic6ai2Lpx+Pkp51PWpq93B29wePlq38m+t5Yl7oGI5tJ8qMaozRY
	 GZi9CrVldhKydJJZ3yC7v+itqQN7TIwyj2v/Cj6KlyrVGjR3AqNKhjuJj9WKFCIkMZgF3
	 brIETG/Dq+WrYv1TjXYV1R4b87mLfoIGQqgVbuULwdtYJ72lBrJ8Me2XjHgzkYUTlwf9u
	 ayutOjh07lnLrjt+8SRG/KPkXMGpDLBExJaCWUeheRQbgIgVYmmI4QNVha9/5hJRGlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iWoAxW0ABYsS0zE9hrZD0wqatrqG4QOz/0q/ZQLBBik=;
	b=tfdzsphwQYjJ1X7Csgc80djCPFuXF+sKM/McXac5TsHg9aUcwypj+LpjrnZAY6KHDGEz
	 DkhyoWryWlegR/qZUJ6bpsijtkAZf0YpQnmRTpvuQFQD1Dv5wqNu7xGKShl28X19vq/by
	 2Qi2N4OsQ9ZuSitEhz/hxAvx45X1UNkfb7xJQKPPnm3Sabu7IljMqYJ2Pakn+NQUTsb92
	 cIbWfBFLAuM6hMxUqkPDorQqL8DhWcrK1s6p6SZN35d/SocIZFA+cpWrtTXHpU+PAcUDs
	 mAFXtfYrvtB+jKnlMxPkgvstxW+xDdjfxOsIvZH27uBZkxFYYtaNuQPz/inn9P7fHfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jWmHI/tX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QTDH6QgW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06C9606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C06C9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jWmHI/tX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QTDH6QgW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJ1lJ83211913
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iWoAxW0ABYsS0zE9hrZD0wqa
	trqG4QOz/0q/ZQLBBik=; b=jWmHI/tXXYpGKgSop4Rgj1A2WikJEh7R2Zxyde6T
	0t9hhhftHUgi+qC6ulIhceR7XS6XkcMFifkOgZCVCu4jylzs74pybTY6K911PAXm
	k2DqlshdqwQZ8xoA3Wsra6zHhFZ6HExXgaCIKf7k84P7K0MWtU6R+NaTllVBPIhe
	aaDqmnwc1NV7AE5jzRv8/JKKRi3T61wBO9/pFDpJsmPZzPFN6EYJKqFnpSHaVF6/
	AU5FigJDqdkjY6NR6P+5NP9q6VjJHXSRiFcEvH7UEcyM54/sOkoiE5vdxO8amup/
	1H9Y8ANMNaZVklcQ4Ik6ReDEaSYt8Xhr8dsLsOYKsHdPbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nr5f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:41:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so657466985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462894; x=1796067694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iWoAxW0ABYsS0zE9hrZD0wqatrqG4QOz/0q/ZQLBBik=;
        b=QTDH6QgW4De0DHMryY0EH952Dx0qjdZBROc0HEeg8KKvi1sljEJ3IQmQuJtJtEpoVb
         Gx1jCi1NkQ6cST34Q24zLrfopjPT8XahTaYehTLP6l2+K4gw13J4uu+h0U0r9X5QDY0g
         dS4Estv0yYD9hjMWAY+ZKsvhTCvkQpJOVRSC4Jzy8raFOk+YUV9IbaHccI07miSPFzlE
         eODOfzVs1Egt0CM4a6TUxtlRWzquFf+A/Yc8La3o63MvVBN4nDt0LD/4EXxJDryLHirw
         aPlPjZi5noG8nb66h1ogtBc+EDFU/DVreEKhbUTMe+KtuRQHn75o1962/aPmy8xk35mK
         Hz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462894; x=1796067694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWoAxW0ABYsS0zE9hrZD0wqatrqG4QOz/0q/ZQLBBik=;
        b=Xk9cneRfBAzyy8bDLLqGUJpsMEr0IC64ByVoZEhJbOwupWfwaYOuHA+ANWG15vyegg
         l/unCAaCTsw3VKZO4wZ+tne+sMhSOX6ILtAgbBU1rru0ZQI7+YUk/jIBl7fdK5/HOLiy
         Sjt55Jveh3AdMeqDqe5r33BOJghsjcGqduHbkK4tnH9K0zwXkVMrulqcRLTx/AoHv0eR
         KhbmKC8XEAB7L8qWv43pa9qWBiOIlNF8RAiEN+WBZU5G5bINWu1ihCvpFqTpBAHLzESx
         P+l5QBsTB+EusPzr6AJ/EFWofXAHQw/g56j8ozGzwJNu1cz+I1tO+VWV4TsE3rHH9fo0
         aozA==
X-Forwarded-Encrypted: i=1; AL+hErExuHe2feQIYhwsldaMS4IiJIJkVg6ayCTe57Y4d3njo4gn7KknEb0X9Nb19lJjEAiFM2ZryPqMnwfWuBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y/ZpuMLThUkQG4RqjBfCFQivwyiWiklpUwDVCAVudt8IZMCIA
	SQcUGm7H2iWU/7QLr60FBf8qIDartbh/XxX37my8SVpX0vJH1gPh4kZVFSAMXUuUPNbAEdPc0XM
	SrG6rwVqqLrWVEtl/ElkUsPxJEVEE1CkjlESjK2E9gIy5ZdiJpRcV/tMFqN2A8jW47TM=
X-Gm-Gg: AZFdTZde2xKQDqnu11PDT2vEWZ5PS0fc330LvHKv2u/WnBmlGI0Dmaw284TJ+UnoMsF
	LTpqHlPLBPY/C/i5mriLlT3r2QUgpgPqLtYu3vXT26CHdQv0n9xeReISpI2gn27191kUdwZqWTh
	bWM/v6lT4vW//1RKo+qsYhJR3XhKF32zSjpNQoxYPy2D4eznatjo9ka9Xq5QGKvnanJ/pk5285d
	BI/0QIq/Y6+ZbayZmNwUbfJrUOGLbj+k1SvVQETKpgV4yB1T65d6SxBLvvVwzxzwr8z16Aic/l2
	yurAyidPLuukWAer6S4w0wC1MfUZFS3ycdhHq66Zni0PDR6sPEZOhKI8qlDwUnWvvclJluCATh8
	bVTi1hflHV6X4f2oOJf5R9q/Z35W0aWReSv9lBDrRCYuIUNmhUWrv0IiCr/CMyPPr
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr2093267085a.49.1795462894077;
        Mon, 23 Nov 2026 11:41:34 -0800 (PST)
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr2093260485a.49.1795462893448;
        Mon, 23 Nov 2026 11:41:33 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm22227959f8f.25.2026.11.23.11.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:32 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:30 +0200
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
Subject: Re: [PATCH RESEND v4 14/20] arm64: dts: qcom: sm8650: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <tll35ljrujo7sgz6fesshor7idu7ujoyhh76crbe6xajc2sar3@6uvambereae7>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-14-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-14-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXxzNEr971ClLk
 5ILo67LX7fOPOqU1biExVYr/wzycZcqmkKzZTpj7UeJRxTchHmfwMNGrdw6TbRwSVU4cu/vpsoC
 TbWz53VtOg/koRpU7X1mQ601M/n0JeOl1Gk9GERhyOfL/xMPjCAxsMl6FPpCpxoPB/g7CrP9xX1
 UYHkIzFqubQ9JRy0hf5cJ97Cl4KRuzLd6/s7EgdNMDLcx2cfjKYIRGEy1HLD036V8jf2uZTZwIj
 Suk+4Sh2RUOwQW3Gqhhxl/C3CWm3vbhB73p6bL6K/K0BwE9jaEhLDSWqr+7lXJjtrE64Lj3rC23
 U+wVO7O3j5iOHL7y6hgsKObva1q7X+DumdPEPRyv25ze+IXDQBIL2PywxRohsMBAEnNMbTENQaJ
 ttl78e0jQOFucD7xRJxM+f+gLevcAJdr9fX/rkebD0I0bDbafnhfOSlgewVFHoNUJyDHqxQ4tH3
 wKwQ1JS/VnQZWfAEVWQ==
X-Proofpoint-GUID: j957OdTm5sK8NCt22dikrLRlD5ZMWPOL
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b0496ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mDVvi5Pd1DWatKlo6wUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: j957OdTm5sK8NCt22dikrLRlD5ZMWPOL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX/6/K3PZPVGJT
 7c23Y6QavrCUKL0p77Oob/q/nwkr08RGHtlhMWHS69kYBOc9bv/xcWi7kusFSxKL+iZ2h7QhJUz
 EVdWzDtfrLXLrHKtpe/uSn/FnX5+m0o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:45, Bibek Kumar Patro wrote:
> On SM8650 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
