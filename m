Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374198;
	b=Yg7RUnr2Vp4Qsbg/Cc4WNUqpuNY/pDGLhu+JXZofTWT0azntsP51rMl18amoql2VkLuo
	 9UZECwTOSBF73cIXVePdhMuypfl9Kc/G373FGcWS4N631T4FG4YPWdFwPy1CSb6Qfk7cW
	 fKt3CDyg4y0TmP6Eg1ruizCoDQa9M2S8CMM5YlSM1HbsYidKwGsljLu/P0AtqPzVGMJYR
	 e6YRLXw+fRM9fo48piyacw3n0RhmEo8Tkr6iv5iBD9nya4DhObiITzVtC1brlOtJcwU6w
	 qUc1/U90TGTyRzKLrRTbjMVJe9QqKmlvBXlUet8bRFtz5PXYwTwY4XTtgmG5dTcV7+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kmoFusvyzW8rHvZc8KpW7XguvidS7PpWapoBiQhCE/E=;
	b=ap96XPdf5bH7AJLDrYQLGXQkj3jk2mJm+LN8m78+n03ChGSxZkKExYbfmrJ7Cvu5NzKa
	 UTk4ZFq9totWYFTtHLnug0fGv4ZKT5fKfMqk8HedNG3W5EtKPL67GW29QWhUo2Do7Smkm
	 HBC6g7iigXqKe9SI8NuDhbgzinPkKmRY6uHdrfibiLFQg08OTM4qMgNTR/wx9OUvr9Tkk
	 xSNgoNwJZYV9h5jER9/ubLE4eLrGDULy0SY6IU7pjA9FjYop1FbxP7qjxqqe71f0WDGXw
	 PU3XkZNYKJxSBsgiMLU/xkNOrdYLFR+29u7rs+st3n4fnAt5gnNQVZmT82Oe12o0Jsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kflYew/k";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MfwRm7Pp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E55606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76E55606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kflYew/k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MfwRm7Pp
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMIhX8m4188411
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kmoFusvyzW8rHvZc8KpW7XguvidS7PpWapoBiQhCE/E=; b=kflYew/kyJZDMFSX
	DhVKouEskDccLqfoHH6ubTw5C7r/atRkc4tkcTKsAqr8NwvkRh0TKmro0ihGil+f
	0uTqdZoL+6hXYCaJF/mQEJjc+6wOwSX5jxyn4tyLT2TXBPm6CVqqxSLUEGBIqFy4
	zYufGWBmykxmV9NM6z211c4mCBjFbE4/zZ52SytxnPqGSfM2hEb8MpWbdzJW+Va9
	ujwTKtD4GXKSgeVpQ0SRtSncw96/Lrrpf5b5fWVtZPsiKxaWZp/C8Lu+kpvX98iT
	ymp4AzDEjkUQW62bkZ4+o1JNKjRxWX0XR4XMPK6HiFS9s3mUlSImKiDPMicj1Fag
	2o6C/Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h3422k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:03:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaad8219b0so861226e0c.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795374195; x=1795978995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmoFusvyzW8rHvZc8KpW7XguvidS7PpWapoBiQhCE/E=;
        b=MfwRm7Pp63sXAQMQobDOI6n5BENUFuDlJo7hEFMw8A+9OypIXzq/sE50+PdJNqrSX6
         8PVCoellAQxwflT78Yo7/i6Djobzon1CLP7iKtXCUeEZgnQuSbRI09mjvSycO3gGeN0D
         zRilCBk7glf1KD9iQHxbxd/ebEdARzwngS8+9itTIiO2MXm1/XVsQLpw3fL4G1Tp3obz
         ltkHwHQslPgT24P7awgx+cKVMUkAHFQLxhoaxjQ2nYu0HQFL3nzrN4jX+49BDxXJ0+nZ
         nh72xqpfY/T+Af8F2KsfyBEWmtC1+drLUEwlMlbfjQ3PxUF/c4tRw4XExY5tCQvzRfoO
         YDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374195; x=1795978995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmoFusvyzW8rHvZc8KpW7XguvidS7PpWapoBiQhCE/E=;
        b=TQ0hTP6C2vAJrAAV1AslQnBHc8uFtCnRoTYJwI7AqJbnYh/Qjj+a2pIGFRYRyBKpmw
         u72gFjPLY0K5/1AsUruQEtHsQtrIyx4VzeMlH56L45nd6dmRr8E1QHFzlf3K5zP1LkY3
         OmUucZ5neUk7AkoFyqJaUzrtazudj6aMZh7g+nciLybir6NnqWKaG5wu+0pBnI/yAJcC
         lhI0fyBRbdzuW7P8ao0Fkmu+K+/O9g6Dhe1HgaErX0mz9ChNsWX+ANDycq6iCVsVGSdF
         rgI63W9XO3qDB4PHeoz16ShIS7KRlnGrRQgHzypHXAUYtc6fKSz4GdfrWlrhdlJz9xlU
         /oCg==
X-Forwarded-Encrypted: i=1; AL+hErHmT+OcECGSqMlXM3MLdVIpYDx4MTbleIIy6QVpwWqL82ffljTodnvN2Orn1RWffCQe8SyELYbA3G9xykA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AdGCxzOFzGiex9a1XVZhUGsQuedwS3gwefDkh70hJBrX5dcPd
	ulcXzFh2Ugjtc2wPSUwVmxjsbZtuBTiarAf5Cwcg3yVwfQV5BHgiLt7UCT1RDMWHv4Sh7Cbiy99
	bPHJWBqWxMcldVuEKX6a1E9l/xYfM9LWEUjNJFp1rD+IdNZZmA/p+G6J7ORA64CSauBQ=
X-Gm-Gg: AZFdTZfCEc5HXFrAHk36+iaMiuV/sanTI81GkLA1fyecXYCR9By+wRODYuPmdAaAxQw
	LlJFGIGxs0OzXxHMhtFURqtFiJbudxiYIpfo5Cyhkfdb/ZCnxP2B/B3nQVNsWoV+evQ/hQfo48h
	FPGmPb9NbLZ+EQ8qeD+aJ0mGEPk72A0OLQnDA1ieMnrcZyRs1sYuQ/r5+aVW3XqiNWk533xd3ib
	F2NYCVsThK7UkLocSI8paQSbQlD3GDBYCzmZzUEtW1cDgIs3wjASrdtMf1pOOa1rhpUXfgkJFi4
	fQO/qWCV/X9GVeUtU7EbdAXkCwsGN/wshFkzMuaEu5p5mykDuvyDbTg9pYrD2SgV/WerIxm2Ekz
	Y56KrQQpK6DaxiossUGTOFwpHWZ/VlmTjS+5eLDr+ehV6Jsi27K56bmPDZVCl3sOUoOB0n7DaA/
	KCCjiRQwH1M7fD
X-Received: by 2002:a05:6122:46a7:b0:5ec:e522:70d9 with SMTP id 71dfb90a1353d-5ee8af2f1camr4520935e0c.16.1795374194603;
        Sun, 22 Nov 2026 11:03:14 -0800 (PST)
X-Received: by 2002:a05:6122:46a7:b0:5ec:e522:70d9 with SMTP id 71dfb90a1353d-5ee8af2f1camr4520912e0c.16.1795374194058;
        Sun, 22 Nov 2026 11:03:14 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm530661575e9.4.2026.11.22.11.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 11:03:13 -0800 (PST)
Message-ID: <c2c2ca30-a1a1-4ac1-af52-0999e7fa8122@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 21:03:12 +0200
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
Subject: Re: [PATCH 0/3] media: qcom: camss: Two routing fixes and one tidy-up
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b033c74 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=1TreyUIoxbpaR6lyi_gA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: LzY1INy9eErX0ceVRZedMp3jT21LTgzb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NSBTYWx0ZWRfXyeUxkG1LeT5C
 KWhjNP9L56fgyoarA+qQ+yKRC3gafxs19ZW/ovpsSw3xj8FEMHMGZ0zz1uJ6VJiyiQSVGg2oNbA
 8X2BaD+WdsvUV7W0o8iOSd5+wpzfAilDLHOuzwd4JegLLmcfAsYqVvn7mayeI9opmQezkeF9/7G
 LtWyhjf+9pXnfYKc1nrZ2QQDzSH0+vvRrpsEXKHuGkM75/njPiGFdlVrqyQbJjBc/80iEKxWg2O
 DrkDcel3cYIWkeJupLbL68I7aOPV/n8bCxgjrsaPduvHn/pTId+Uw1jXNVGlMcnvAw3MzHSRjV2
 syJuxkUcEVS5sSy/w9xnycqIVRHV0qocH1Ifv5YN81fEbKi/yjr1BhErLmDLDstXG1BHliR54uf
 EFzP+YEH5AEdsrOIoqRkgM0+k5+/RYwc2vP7X/65k26i8MmFOgIIPmAH0U2CzZj+89cDZWB/Kd0
 Tt1+aFD7nmsM3kPdK8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NSBTYWx0ZWRfXy7raIF+bhJ+O
 1GbcAxTHxoBPS/LPl1AlAcILRtEyeBCqGd1Jg7Nk2NduZeMLjTu1NQwrTdkFGNJ6ksKlERipWT6
 LNe9Ophq/BoBWYv3c3z49PL280MrE5w=
X-Proofpoint-GUID: LzY1INy9eErX0ceVRZedMp3jT21LTgzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220075

Hi Bryan,

Thanks for the fixes.

For the whole series:

Reviewed-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

On 11/22/2026 4:10 AM, bryan.odonoghue@linaro.org wrote:
> This series lands late-enough in the kernel cycle and applies against the
> camss-next branch staging to linux-media/next.
> 
> Link: https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/camss-next
> 
> First up a patch drops the declaration of CSID2 from x1e/Hamoa since this
> CSID doesn't have a corresponding VFE it is entirely useless and violates
> our 1:1 mapping between VFE and CSID. Since CSID2 routes nowhere there's no
> reason to keep it around.
> 
> Second is a fix for a longstanding error in CAMSS which as stemmed from
> the original development of post ISPIF devices. These devices have a 1:1
> mapping between CSID and VFE so the mapping we have given to user-space
> which declares each CSID as connecting to each VFE is just plain wrong on
> these devices and has always been.
> 
> So the second patch addresses that longstanding issue but, I've been
> holding off on fixing this for a while since I believed it might require
> extensive surgery, but in the end its quite simple to do.
> 
> Finally the third patch is a tidy-up patch which inverts our current logic
> of continuously adding new elements to the src_pad_code switch for new SoCs
> filtering those SoCs down to a default: statement. In fact is is the old
> SoCs which are the exceptional case so, just do the switch for the old and
> the default for the new.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
> Bryan O'Donoghue (3):
>       media: qcom: camss: x1e80100: Fix CSID2 routing to nowhere
>       media: qcom: camss: Fix CSID to VFE routing for non ISPIF platforms
>       media: qcom: camss: vfe: Eliminate ever expanding src_pad_code switch logic
> 
>  drivers/media/platform/qcom/camss/camss-vfe.c | 20 +--------
>  drivers/media/platform/qcom/camss/camss.c     | 59 ++++++++++-----------------
>  2 files changed, 23 insertions(+), 56 deletions(-)
> ---
> base-commit: 2ad58ca589da80990b7afbcff018777851577f89
> change-id: 20261122-camss-routing-fixes-b178bdb84f20
> 
> Best regards,
> --  
> ---
> bod

