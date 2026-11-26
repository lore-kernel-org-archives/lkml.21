Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706375;
	b=nhqmzMh1kOtOFMPkABieBVM8zj/muGV8HQ6qgB/QDrU1quzCGVTMbKp7CIV+Tae6H/3X
	 7dNc2ETu1oZoUK5eri0Ta9PwbrrEbU/5dDeBIMSqzAYk8DJLMD3jTRSpB7dtxf1uSwfrK
	 H3pA4zSu6vOVIyubjbSzRzAQxWPudlz6b3xZTnRyTEpUqArHie0Tm04IZuZ4qQ/3PyHB6
	 zk43kb1aaFRPGBAgazgsWUgyTI7rwjtF0I8ZKKjYPSJswMZncSW9JOddX8sJsf4sBLBaN
	 WnyKE4/iH9bw5MGhisUd02I52QQ/2VuhaMR0uH9ydjtYBAHeoDQiQjRvY1ce9//t2tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ex2uGZMaTo28cXK9e97FP9eID3+hoE7u72R6RyiD5yo=;
	b=4AXU93F7BmBT/tckwZhnprcF57G0fIMoyzbc1TJdZCgix9IOgzzcEYb61zUwzYHZGNrA
	 DPl76FbwgIdd09Sw2qj2J5TFp/3pkiP9wsNwhnnUGTPSJvnlaO9CreZcEShzFVrogR3Ty
	 2T3MA0GjZPcCx+ZEm0gHUyqPruNzS/28uoBMPEHZYLAzPLbjVXsJGNe9UZSSSlKj/PT+a
	 xNYlLp6ZpCrddx8B84H2NItjA09OwVuue3uT1rezVYtBA8NxQwCP/Znn5Fd7fYXdD4P0W
	 X0ace1bHamMCGR2MheecU7EFEJN/Okch+dAuT6XZhcrogO6EGZpxDbIqcuAeXonFFFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNv+liRd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ftoir+xz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4682A606A333
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4682A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNv+liRd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ftoir+xz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVEgS2649775
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ex2uGZMaTo28cXK9e97FP9eID3+hoE7u72R6RyiD5yo=; b=oNv+liRdPWRzk7rK
	SX+pO7pgIIJjFDFa+PF3myfN0YZ6rg2AR3lgRV+jHmjfm1zNKUPoKBHFAAHfd1Zd
	HSX/q6jqroDN6gPuDT/7qWt/XqcAWdq3xguWUQGP6dnEe9KHJb6VvPG/u9xyvTEs
	p++ao7NxFYT4t+bfB9eNvIoYBQcAkKPNJq3u/l2XS53gMz6CPmG0dyJvKx8ZrFpL
	97HB+BGSEcNmHGOaGDEt6NqPAB/OhIvYX0VKD6+8BCvQaRpeAGHyEBZ7DBkE4aJK
	nQL89ORA5Yz+lKuEHnxZOJBCahN8UGCZhFUuAahUiEv6mafcOSdIyMGV/4hxk9Wj
	PdRlvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqg5wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:19:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536540909e5so15741371cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795706373; x=1796311173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ex2uGZMaTo28cXK9e97FP9eID3+hoE7u72R6RyiD5yo=;
        b=Ftoir+xzTMvjPtabCf9EreRqC/3S0g1q4NnXpENgr4w/+cD5BhrooDRkxaIlhaX9la
         it5C3to9G5QmUDGbDTotxErg1gcPcfb+9pir9wxrI+e4u9ZoNAuKRvuQbvCO6TTeQ6yM
         fKOee2FNhHAnHXj5GBLvfrWscgRI34FDI62+nL46UloIX/hH5Cc1F+QEQUePpzqH9buL
         O6RrnVHvLnYMDUcyANJWyEUEBFTTfM4MyItPUkc3qToi3YRNeBSiMDihep3cYoEUIdKb
         guzNAJOGdkvVIMNlneRpDaKAG1i6fHzORZcFVb2SBmmcU8ENaq/yeYfuIwDnUoFQAJLO
         Gyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706373; x=1796311173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ex2uGZMaTo28cXK9e97FP9eID3+hoE7u72R6RyiD5yo=;
        b=bwvATKS31SfBZjqCBMf6PpVLMNQjZX8deaXN4WNH5zIdSfSVilssn6w4CypPXo/Pen
         b+60dYxKOXWzTUINNkxDWwQ3K6cup0WvPNxjylP1eHf8U0rxAQi0sWGUERM0yvypNB4x
         txc+ewEKb5OX9HfwyClDexf4GtOW/CDXTWPx9ykDC6CEn4rvYTzM58g0jQIQUyRxpzuM
         c7rDUoLNaZ8h8AiruFAp++gzLS7X1QsuUR+ymH3NUGcdjVnsfbLv9vXFhrJrvTFZBzFE
         77LtMJaxpB44werM0YJyHA8SoFqEn5VwDEfkcvaa1ycSF0ztGL1UNbqtXt0B8kvStRi2
         GtTA==
X-Forwarded-Encrypted: i=1; AL+hErFnZmCZwhY1Rxg/J+psOrylZ4sowDbXEdJ5QFGQCM5pLaL7KTpD68SorqJJQBf2qSsoAmWaFqF5uLkfEkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lOJSfalzS4Pheho4y1KeN22E5QCnoA3/k+R7+4IlY21ezJU89
	yP7QlPFjRUGxkyQhDx+cOU5vWIdtasdaO6hTkUMv5nAPCvFt5hnozbZdlPjFtvY0A/iJ/3f0bUv
	hl6912NPZRIhSjkcGmUVWMsN2oBWoSXU2U70KUhbBGx3IVrPDSJoabRtp9GA7ie8OUk0=
X-Gm-Gg: AZFdTZcuJjR43T47voNXYXX81E9mWs723gzooQSR2z0kzWhoYqykWUxDhyRdwWf2yYs
	A4SiGq4VGfeyCUDrUysUjtiGfEHF9T4GEjER90MC5yFmhgrJUhct8TlWi2p5NvlwN6SPkfIkn7+
	0WSIb8dTTyH78uYbbqhUEaXLtFMGQNlcsQ8i2YvkVaRleW3dbjthEjnwmPDitQHcl1SEYp4cb0s
	B4OaB78dLDpG+aHU2oI/S5NQT7ULncURiMuwuqf7qABxKVAaBM6QGYdMaMXCNrW1prwIrSfYjpi
	Td6ImtIesNWPzxCtA/8UJicAQ9mSQJwu9BLQBixsQeTNxL3G2h87UXUifMn/1hXuip3P0qqKnmS
	QK3qxtdfBMudAXifLq1qgv+tfPTy+SA6kPdy4BUMUqxw+TPgHvvs3FbHroSJq0AjJDcPheW8=
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr3391366785a.3.1795706373528;
        Thu, 26 Nov 2026 07:19:33 -0800 (PST)
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr3391362385a.3.1795706373059;
        Thu, 26 Nov 2026 07:19:33 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm9867226a12.31.2026.11.26.07.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:19:32 -0800 (PST)
Message-ID: <330a5417-a973-4211-bd57-c5103cada03a@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:19:29 +0100
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
Subject: Re: [PATCH 2/3] drm/msm/a3xx: update the CP protected register ranges
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
 <20261111-a3xx-fix-me-v1-2-d81f50f1ba1e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-a3xx-fix-me-v1-2-d81f50f1ba1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7eQ5Ko5aYJuUnXgd1HxX_b5ShhOmZ40i
X-Proofpoint-ORIG-GUID: 7eQ5Ko5aYJuUnXgd1HxX_b5ShhOmZ40i
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b084e06 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iDjXRScZuT7tmbgFxAoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OSBTYWx0ZWRfX3uPNe8E+KRVv
 /J3/sStG9EjONdOnhJ8y6f0AdBre+M46j2xiPyikqS5lSYHlLZgiyjkwtjlNbIn5v+pxmghBboM
 maDLuYa2lBzVtIIArq//zWXMTm/gb1E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OSBTYWx0ZWRfX4+wX41DWelCb
 dI9jX55v7CuuxuuToYVA1CFgz3uCEgs7SlB4Y67Fy5sMON3CZZ3WNv1qsfIyir7+5uR4LD35mnb
 do0VUyStGvVSyxB89YI5uu2k3/1N0DtzyzJ897dYeUbjb3R8E36ZwHQjq/2amzuedF2+X12rOZP
 mDL49q+Ku+9f42ELWCwW50nfmFr186Y803woNg8m2/FicHNMe0xfwb3T4Zgob13i0G+kJ/lNhWh
 /VaQwCG0MYyzso0YOqkJBNvlezpew6cu76zBuOv+zCK9Xrm41OBkPkqxojg7pSWDcVRfycv+WFK
 UOsW38+uI5zvANOkxs6lV2tqRrCw1rMPtit0w+e6ltKXl4YXWUwZVi65yVSxOmRBdJusgpefPPS
 q4+1PQ8Fif0Uy8gvNotnWygxjn1giQItkuTPv+WJDSox/LDWD/VF2/JGLpulnOgE5d+b16x+/lZ
 6KJPrpfVWofmDjv4B4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260059

On 11/11/26 2:05 PM, Dmitry Baryshkov wrote:
> The protected register table was taken from the msm-3.4 downstream
> driver. Update it to the ranges of the msm-3.10 kgsl driver, keeping the
> wider 0x100-0x13f RBBM range and also covering the VBIF QoS and AXI
> registers at 0x3040-0x305f that the driver programs.
> 
> Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
