Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454604;
	b=flZxcvup0UJ7FStGV2+1HtLVqWSdpDAZchZbyV6cJKFqVCoq3dJwC57oxy2rnRawtj5M
	 5VdcgAakXlWgKoWTnrmGVWnOMaVhVjk+aWsSVNWag8zLlEXvw2KHW2LjyK4ckVq0M+dG4
	 E9HvAJI55+YTpfSdzPpp4oT+OrpSZdp7uConPtm75LSzeXR6QiyApC3O7zg5xiYEyiNJR
	 ZCqRixh736yCY+MPjLU7mZ/46JVedFVrWnKhsC+xMeghlL53EWqXIXlRYZMDks0jEv+G2
	 J8DRn7Sop/wlPzboIdg65ltdkyX1lMJPP2dFnxcHfQnvPx15NXqH0kn8XR+08nPZWJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454604;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QqMha60toiq9cJ0Dwjl5c0knVmrMb1MbEveOjw8znfg=;
	b=cpv9y8YOHK715HUZmukknPAqNG3bY3qE8C2iDr8jl6sISTRrZtRgyU/tVSy+yiB7+95V
	 7nDLDhQ3L1ZjWYI8arpp7wcjkqA76fTzkhbCVZN8Mk/tKXjHC2kqBoEhfYhgimZFyXSPv
	 BQTW7CRyWvhFXH1M9ZWO3hSqlIo2GYU1UA1ErcYPmo7sLt7qAEWTYA4XBDTUiBmApGA9W
	 qm+U/bdqbcTgCsOAw+Nt08p6zcz7s55WIjuuS10fBJSb6EjOI9yHikWu2tOdwb/hxLWeK
	 ntcR4WMZmUL0VbRrgQ6hD1zuvSFVWknC3egn1hXvbQskWhJF8vJEp+TgyWsYTBsfpEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=knSkjZp5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QbiDcwdr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC39606A333
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC39606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=knSkjZp5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QbiDcwdr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGHvwB236065
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QqMha60toiq9cJ0Dwjl5c0knVmrMb1MbEveOjw8znfg=; b=knSkjZp5LKR92Av2
	al90EzL7Icqx9lO9pkbP/E0hjvkTFTphVMldeVE+zlb7IHvd9z9iDIX9vDs2133S
	Y1g99l8t+ePbH5zQzm3kjP13wyEiPZy+G1X0VNSTg7lYg2Silw1llyAPdX88XZaZ
	R8w5wfayKFiius+c5dkLpWVPFGVrPxrRF43w6glKhHLXL81FiuHnXVna4Y6rFz4K
	ZpgdopiaJfoiQwwf2XxxXLC3bR30QDGqUUuwZsHpnReLJE7tG/83wKt2wILqcAZR
	t7ww+/yE/ls/sWw3n1Zr056FB97gXM16MXHIod2hhA6Iaomrj5irQRrQYnjBatbX
	Qr4SfQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsjs01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:23:22 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso111642e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454601; x=1796059401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqMha60toiq9cJ0Dwjl5c0knVmrMb1MbEveOjw8znfg=;
        b=QbiDcwdr9s31R9mZuQuvRRe9qQwP6o2gP3s4HAoaHzYGM3KdMGdiuLk75J2H1rmamz
         GUZlEkkXb0Wvba4ff/LzENQsW3t/kJowWoSuXDRO4knHB/ebY4XBDbuvurCwWs77ylpd
         V3kEjPbTsWTLDudRSF7SYycW4eJMXN9K6XLSUG/Hr0GOtrbDM4vbJom4nNx/uKJYZkNb
         38SrHuosvHKPf3mwlKW0CVVHFUGbFRh9Z9/oZ6Enh/SqLAexTk4wH2btIg6pT2dVJJw0
         8AtEI+gkEBaRv+jcm79aKMTk3v9Ka2ko6DjfUgmKUig6C/cOLHtED957M91rQdOqX55F
         KI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454601; x=1796059401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqMha60toiq9cJ0Dwjl5c0knVmrMb1MbEveOjw8znfg=;
        b=mBDDsXCQurw6ByFO29a7xb/ofDeZHnljLr3BDgt++b5KEGzUSPx9LE2cWLkOiQ/2Qj
         /zubyc+ObILu0nAKRpzsGur/e4PMoHvI6xwsy1sdDBbXlXiLLzuHv69+MM6HY9u38UIr
         UZKoIUdOY9ZIEDwFFCzI6qApA2/Ht7oI44VkFLVD1swTrIqkAg1WQ4lIKS4R9CrejFw2
         t9823ewg2DiF1nTzyyzYlGf+TGCiu7JhOkSOHAp8ego8XesV2UVPi67Y+/+lV6zwZ7qJ
         ZSIGrs7IsOAnwgxTn9bKYNon909/OVFln/iyI2IJEExoI+8StejwlPFFjX125asA7Tqt
         RH1g==
X-Forwarded-Encrypted: i=1; AL+hErE9dZIVll5zvYGJxs0ZoB7fi8rXblyHud+D+io8mjx7cWOXNBN+DUefXEKEeHY4pYLTg06Yzbc9yaKwYGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TvHcdNrwAlKobK8RQhYU83mQ7Ikj7xLm3QyOWnZhz8xspi8VU
	6RzMdzqswRlvseZjLoyCeStf9bB1sCYwxZIV3ozHZ3JWjXwuy6K1HDxrIXyhz6aXN2A7MIoBGVg
	Cma1p8C7sumdgymC/96TSuTeOPv15OjB9gTXRUcykfrO2+sycMJ6KH6EyL67FGe9+mss=
X-Gm-Gg: AZFdTZcxu36nw8l3n18Xesv0AtE//WdNvcdraiDTJ2ZvKdvJHIOGAEI8x19PXq2rtc6
	7FS9oc4VeBzj6VdDMYZj/w5hOfmy60R/NZBMLnUoohJZN3awuf1Ibyl2VSn1SISsFBoI2S9JaxE
	IFVNICJf4RkrJxULjtWe5W0PZc55g+2Dxw5Ec6cS7t8+j8i7WBB8y2SkKA9cZ2DWas/0edVADpN
	YrcPtfi0JdWLtYzGHRTIwpsH2lqOq5xd1YmVcSnpoGJh8TQxCyvgAFBjM5OGQUZw/lNk/7CQI4D
	cFJTaduLbeQbF7akBWFX2WyFwQXb8TnTKlG8NJHyeYlOc2yS4t/XD3KCD2v0rbJ+gnE63wzwLsr
	jVSQEY2vWKKCTyS+8By+c6bVRNrI9l5klwVEsIL2fDigSVWUVeQXYnOb3ECWFiY/UKIjx1aE=
X-Received: by 2002:a05:6122:6846:20b0:5ec:b437:e670 with SMTP id 71dfb90a1353d-5ee8aeb50e2mr6973967e0c.3.1795454601080;
        Mon, 23 Nov 2026 09:23:21 -0800 (PST)
X-Received: by 2002:a05:6122:6846:20b0:5ec:b437:e670 with SMTP id 71dfb90a1353d-5ee8aeb50e2mr6973910e0c.3.1795454600582;
        Mon, 23 Nov 2026 09:23:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm419548566b.13.2026.11.23.09.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:23:19 -0800 (PST)
Message-ID: <40157685-826e-4011-93f2-1632b244a1df@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:23:17 +0100
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
Subject: Re: [PATCH] drm/msm/a8xx: Add missing preempt_record_size
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261123172025.402295-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123172025.402295-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b04768a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=S6-QWJaKbxxgmz9MQ4kA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: KQdGaMlCdy19GPanFpPmRZXHr2RO1OzW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfX25gUnK8J4HDS
 J/nHdSucm9a/kqKNu0SLHG1Lj1HBG2WkT+zgVgHLUpSQucr06NqN6b43ZduLGE2ukEK8bIoVulP
 t5NNatsSchsK+8abnmpuIJtHnQk4cKzKf8olBkZq757RxxKfKZ0VrpTempwABXWwNYx+HgM9L02
 4WNTJOjP2CKfguaMsgqbvCzL5n2EDkLzUxTaLl6TCDByi+VhXZjJMSQXr4H2320lmJsAUJklCbA
 Dn2/Mx7z6Ou6OeE+LdEqn67jTuZUV26dcFqrQ+xocoRnAwYmCu/6wHuqXjC5hWkReFDoLPVMUNn
 8CNWpRbsumvDYjBGZ7v4tG3b81J5/sPCf5/YYujyDlbTqsmIupmS+2mcT5X8UXDpxa3ApOot3q3
 8PvHQeoaIlxP4IEC7NkS+BzO0bW6lyohNbQwbXb6A36fdH4BXXYc49mL1oxRCD3x52zRV8FNx5y
 on3BP7kqXF7mDMdiO4g==
X-Proofpoint-GUID: KQdGaMlCdy19GPanFpPmRZXHr2RO1OzW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfX4m9SRhBxByuP
 wKbIPrxpn4uj+5EGsDLVAyUn6wnuzK076V0MSE52g5q74ay3JGukfEPq3LZVOwkp+dz6WfEQXwo
 RoM0d4qfnfJ4eGqefdlm8tYwi7lqiPw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230069

On 11/23/26 6:20 PM, Rob Clark wrote:
> Somehow this got overlooked, and Glymur/Mahua were falling back to the
> default 4MB.  Which is way too small for the amount of GMEM on these
> devices, causing faults in cases where preemption needs to same GMEM

s/same/save?

> contents.
> 
> Reported-by: Connor Abbott <cwabbott0@gmail.com>
> Fixes: 7fad33097e67 ("drm/msm/a6xx: Enable Preemption on X2-85")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
