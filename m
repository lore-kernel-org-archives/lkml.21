Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703547;
	b=T1xLgaXbcgROjCPWuF1QhXQM4HsVuz/23iOFQkNVzjU8dZ/i/35oOBlttcqvEdLFN1an
	 fQsiVI7SJFZlfS/QSOKmQLC/ZcSWCUorIj5YBlZ9Ygt7MyY8q3LrFQkn4lV+R3hIsf0hG
	 /mDsrEt3+qJNv85iuPpI9qFO26b9SCbTggpQG6Kz1vUziyWEEYPDCQ6gYTzFQSJ53EbLB
	 PykBZqE716PP5P52YUAhLUDpap19MsarUUD81KMDx3mnCFAkrcgoeXxHi3Rl2cBHvpWCF
	 cZ1MJk2CXcsfmUyIq7EabdSc9qNQNj6W+HYZC2oziIhSVzRh3TaCNf4E6A2/93/ZteQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qRhERcye97/2d0BCY+uzTcTnvBAQXisDPDKwxSe/YCI=;
	b=5bHgkWI5ISkeFZni1KxZ1xmQOLE6ZeNEiq8N0GSuJmS9IVPQxRuIZprbhrs7ALI6P3/Y
	 e6Ep7t0LV4UgXhul+2VdJ82IKdLrmE68V+WRtmxzWI1eSPUt9wWWdPlF6o4zRCMcJ1wVD
	 irtUxTR8xvqV/aIhQ0eBWqe69GwJ0iskjDF6/uFJ2bqQHJu1mjmgXU0Ml5wH1lUanpXRu
	 RJeXJ/wiWkEKq2aRf0PitAdylNdm3UeiJhaBPywRwCfijqik3QjC+BhgzA1RUDrDk0gAB
	 +xUY8DIINIErZF5QGr2qvZEwzNRRAamTnY1nQsndZRUzbc4GXGbvLaixU7VMjCpGLWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N0mpAT0T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WVBusSot;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33576606A690
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33576606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N0mpAT0T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WVBusSot
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUv2u3563200
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRhERcye97/2d0BCY+uzTcTnvBAQXisDPDKwxSe/YCI=; b=N0mpAT0TtY5YNQRC
	yRTjq2/3yaeQ1fJtJ6mVsoATk9OntYF5m6Ui+p6CWjC+lPP6ni5NscReuFeKerdF
	s+5YOug+xzU+qIYcD0IdA/kKw1+Ft8bZmy7O5vR3gbrAzdGjRaD+Onrm8R3iWcgV
	GiZZlkxd1IUCwAV4CmHJwnQ/cprXwz8jZPD5QgJD7WnL2BResJI2mzRxI3fd5XGE
	7TreBur+Z60yJ3PeBxMhFTNpMVHY7arBv9LmGdG79GSukqc2JYaqXCGXgu7s5cu+
	+eVurKvvrB7kqZwfscRsxZUhVKbcg5QJKo5h7u1C21qcu7Sh1zkYmcq2w88CQJBV
	ZBIxcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sbh0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:32:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55dc507006bso1609121cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703544; x=1796308344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRhERcye97/2d0BCY+uzTcTnvBAQXisDPDKwxSe/YCI=;
        b=WVBusSotwYjhCFmAeRtn8ThCTc43hAuqZ5TiEtU5Si6p08g/RFcCxCqujRcOfAjnyv
         +ZuF238XV0yXN70bwAjhOTgulz+Z03qw5YvwrQNdfgQQy1GrTeBU3jaW/b3iHqWdX/s9
         YVUI+hj+PRes6qQ3W4AAU4LBPZ276Y//EIqyh739jvxd5i/Med88fSL3zy+igWaWCVoW
         hRZRLBZBA7lPedroZs/C3oDc0LHbCxCcuwT2uFpbJI4p2jmFeMnFEAoml8XpyHI+RrPf
         +ByPorwmT7pAkWlq3OH5NuDWnrIYcufgepg/4A3+MvskZjVkjLmfNwo8B88CrLsZd+w1
         qchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703544; x=1796308344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRhERcye97/2d0BCY+uzTcTnvBAQXisDPDKwxSe/YCI=;
        b=yO21WY8h6BvLHO7yxkXjcWJuRnABs0i/MBQAYGWRlwVBloI54gxYSKcY7sxF0kVoAK
         9bkZF/D0PggkypiWPVO682H+rRyZ69Sjn+5EQu8ekuQzn1uyJQ8X1G3NHoeECrYQ9BMI
         soh9lAjJQA0qCzIIl2/fHxaaD594fLbB6eiMYYkmy9SL1uXTx36XfLwFiGuXe7ae3Hc4
         mhWV0sOpAmcnSlb9Tc4gfER03LPN7t6CxjOcOKdlczXhB7wA8EmVnwgjmZ5fZYJ9/PdY
         qleQpBV27zi/cn+NTDfBcLUwdn3mITck87bm3EeB4QvX0Bf4bSYqJVbRJQfpvdAalMD/
         F6LA==
X-Forwarded-Encrypted: i=1; AL+hErEXzF8pbZJzSjRjob3CQ0jIGYVFsyueRjGjq1o0V8Q+X7Tvz3ryldZ3GaG3UrRx44mwVVhzB8GaBRcy7HI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sMwPU2w9rPNMshioL6Djl7oLtiNJ0YF3v0ZMprwGhrol7TeCf
	sdvTZjVjiBCy5NjvTQBQ5l5u7G2e9jpNy+SjEviZQdKg3Pn9dAvOJqECX7+oB/8ikfZL1EdIQta
	Mi5s7E9ei7qzWiJVIfbZVh1GoIYe+REBR+XRxFsjSj7RScNRc0upeTC+ibcQ+DZdunk4EN/7Pms
	8=
X-Gm-Gg: AZFdTZfUR0vkBa7groBQotSj7AiUsrmbuAAI0UdYCpGWaBAhm2ZukqhuotuESz9Wyx6
	vOS5PZN+LL3tSJOVeqQ+2lDbt5STaCAs4y3T95/QrlX5igeBu7rJjZEBrWY3kIJr2/W01smf2LX
	CoyrhGKEwdEYU8L8noLVjjWpLMAUVt5iEVHvPw7w+ZndDSuQpinWzb9EKdtDBdA/fHLpLPIVAco
	36oYj5W8S8DyKfsiHVKV8MqhcwuFl5kFbZM5AN2gBU+QYzz4BCipSu3zjFWb0lM/VhMG/tE+XCy
	SzjDuwsGRn7hQpEmTd+nShu/PIOfFNo6seYDMBIY4ZzQhuCwo7y/lQd5XvU/Tbr9872ej7rNn7H
	ZqQR/zYpVZGFCcQA3OFmtDsUZEE3mXyCr/Ped/ndGREgUmWEGKpWCzPUvm8/jEy1/hYIo8l8=
X-Received: by 2002:a05:620a:6695:b0:949:a3e7:e0e8 with SMTP id af79cd13be357-949bab1195fmr3255779185a.4.1795703543617;
        Thu, 26 Nov 2026 06:32:23 -0800 (PST)
X-Received: by 2002:a05:620a:6695:b0:949:a3e7:e0e8 with SMTP id af79cd13be357-949bab1195fmr3255776485a.4.1795703543156;
        Thu, 26 Nov 2026 06:32:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e79f2sm9938527a12.15.2026.11.26.06.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:32:22 -0800 (PST)
Message-ID: <61abce04-a112-4afc-91fd-9591a9de25a3@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:32:19 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Make the ADSP fastrpc remote
 heap no-map
To: stoicoci.mihaita@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123-sm8250-fastrpc-remote-heap-no-map-v1-1-68ce6470e82c@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-sm8250-fastrpc-remote-heap-no-map-v1-1-68ce6470e82c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b0842f8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_ROeunYG8wwyJrT_Ht8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: LGUG5ID7xB-wb_vp1X-aSDwTKySvXI-a
X-Proofpoint-ORIG-GUID: LGUG5ID7xB-wb_vp1X-aSDwTKySvXI-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX98+n3nEL2Yno
 I17Sx97qkTGDGhsPg8UUpMl+cJwkQlD1/o5ljRJGgnuGmrWkdB+7EUpBNVsm2t2ErnqAHQ+dGgg
 5Bt66K51pfqwF4kP5nTLLgDHNfbZvHquIsEjNuXybPpY+cMXYXxGXd0zU9rs9t1Ev7zE01Suddi
 yq3Dk84hhtmf7KCmDpSPDTMpYvfpgEenfXxtR6toLiWTlkZNntWsmfIDt0GpqqCQ4MBklrR5TKB
 ZPcQNG62jmbzqRchSJtJp85TPSRV/FEk+srCtOW/36Z1nOOZ/F8+OhcY2+x1ZvQqWl4DgFpurIU
 zSYgwMWsF4/9yb7fD/XnDpjrTsNcJyqAcXTcRcoNBFbQjruwSE28Jdbm4h5RF5p2+75qRgFipnd
 K/G/9rA8FpMMrDxTihMtQcUk9oXo+92MVujm5NoEZH1xoh9ivsnv4XfGKlbT5CoRm8T2644E+sN
 TfWR8z4FLgrVXsgZRQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfXw6+UxKHygfsl
 zDOFh3mkFVqLsjxTkt6hwdFTl/YxIwfFM/LQ2L65lOakT5QBWVkz1FvxM09wPu5Gb4EauoYNQRU
 QTwzndh4orJNZ/vRLkkbFIJckkJ5Rzg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056

On 11/23/26 9:54 PM, Stoicoci Mihaita via B4 Relay wrote:
> From: Stoicoci Mihaita <stoicoci.mihaita@gmail.com>
> 
> The ADSP fastrpc node hands the whole adsp-rpc-remote-heap region to the
> DSP when it probes: fastrpc_rpmsg_probe() calls qcom_scm_assign_mem()
> with the qcom,vmids list (LPASS and ADSP_HEAP), which does not include
> HLOS.
> 
> The region is declared reusable, so it is a CMA area and its pages are
> still lent to movable allocations (page cache, anonymous memory). Under
> memory pressure the kernel then touches pages that the hypervisor no
> longer maps for HLOS. On a Lenovo Tab P12 Pro (TB-Q706F, SM8250) this
> reset the device within a few minutes of heavy use (browser video,
> Flatpak installs). Nothing reached the kernel log or pstore, the PMIC
> reported a PS_HOLD reset, and the TZ diagnostic area showed a fatal SGI
> on a different CPU each time just before the reset.
> 
> Mark the region no-map so it is never handed to the page allocator. With
> this change the same workload ran with the CMA area fully used and no
> reset.
> 
> Fixes: 531ce288b6dd ("arm64: dts: qcom: sm8250: Add memory-region for audio PD")
> Signed-off-by: Stoicoci Mihaita <stoicoci.mihaita@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

