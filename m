Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794959334;
	b=ni18P9dtmTqGXKYgX45/mLHE4lWmBhfeuJAoh/biTkyVzapqk2wiw5o33O0acsh95uMg
	 qhYqhhqFPQ2tvUyEEqriIWSPDV8QLemRJ8JZdnIBvxa8CyyzxcxLrhycYf0yOsobTFgAC
	 W6aBnFF/8E3MfEnI96ksLd6B+ja0DdV7Std6s8P7Ys1/Aji5WDZA+rL1n0jD33w7S12Aj
	 sajQz2G3NG0YWo9xwTHw+Jw/3KbJbfpr15QxZe9HnxZalVXrVQr/+870w5351V6ocUi9B
	 0LLQj1C7doSZkhU5hCwyHh6abT/pBkzO/uEobFiCAsjsIGWrC+P5ssEJpBsTo6vJSNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MaHtinZD1wk7Bum6txGTdaRyK+bUzqzEC5csqnjEg9U=;
	b=RLR117rUer2slnCAYc8BCOiIUg2C4e8gD5/sd9h5S47dsrTQhHeljO7QRNf7Ks+HHF78
	 ev/SzSDKguUK6C2TyWfM5ScfkGCnRyJ3G91HnLFsSU0PspyXHMTURr54JOtTp+yuQerwo
	 F99Nmk+8UdSL4z+IUC8hbBjWJLa51sjnq5fd3TP0rj13AdWZeaZfr7iX1/vfyikvOphT9
	 vOn3ZGP57HnQ35XQi5izphenedxjleL/ab5IcS1TzffjNBM4TQXd7VBIuHm7Qq92FDeIV
	 6w3p4vFblN/6BPXtwIgQzNlAPMV/1E+ZvpxcLKDJifhV56yZ6mf0j+d/Aq+ESFCjCAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l9Yt0Xwt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hsMChUgp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB2B606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB2B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l9Yt0Xwt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hsMChUgp
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMevYJ1886105
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=MaHtinZD1wk7Bum6txGTdaRyK+bUzqzEC5csqnjEg9U=; b=l9
	Yt0XwtTEg/JH+OmVRiqxMbLtJPe0XUm/k84+9qGFxBtGd6xCfQEHy629pzUNKkID
	Eo7PS1boWeTJY+wPsWLqO/mvzC5V2nciKCTdNjex+ROcG1yTJveyEN0YoEJW+nLB
	o0A1kvKabeZ1zQBhzozMJLlnH37Js5MGACX0vu/IDXm5NI8LsOXd4YUJTIgVPB/C
	89Onpq3arIrhkXPz+B9ndHoF5Ku/LgUEC06PylpdQrcbeRdIlBxUTn8uwwVTQJVC
	HZFsFPCBn5Z2zc9MW0+Y3rlopV7rTHbbM6noAHkWlyUslQcJpG6vqVoumerUy2Vh
	QVyyl5FuAtFhO5PZvdWw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvar86j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:48:52 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-81b20bea169so276705a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:48:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794959332; cv=none;
        d=google.com; s=arc-20260327;
        b=ZHwpWU1aoSiT5wP1lThv0frz7nRp+9sQYfHsQcs2WPm1ZR9UxlQCg5i2Lp3Oo9pkgx
         qYpQigcaknA4ANODqCxFwIg5JGVWT2/BJ3Mf+o6vwxJEXFXxvcpAyBm9IwYAtnqNP1QZ
         gmXRsj8i5x5a/DzHhgegHgp+elJiZumh9yHUr2qENktlay0qhEPZOV/EPcpSZheIzrZm
         Y+B/9W/ICQDf4swlBXgGWri6AXBAFg9cySobM+GF3SGnbQBakb0tzVtEfFgFBfh6wnoG
         82xy/R4Kp0CIH9CJNFkKmSMW/bN4Y9K2fZh85YixqUY+nlknOReYGaOnRx5ELHJVlgMo
         OuSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=MaHtinZD1wk7Bum6txGTdaRyK+bUzqzEC5csqnjEg9U=;
        fh=3J/3HPqADcQVnan0/qYFeVHOyEnVAElXcygjJTwVgBc=;
        b=jtlG1Ieq8YjfdtEfEIgsSQ8Ifji2lnQvnVJ1Ibuj0H/pWEinQu3z0fpCbSheRL0CvC
         cnehc7AohsBAmt0r72Xj0qyZtd7EPRo6DKqo/v+z3npkKXR8g2zN13vlniIU9RYDJ4/Z
         XO4ryTapie+zUXIJMErSS6H0oe64mm60LQ3TIXxQ75xlFcmCnHNJh/1ho1oYrVRkOv+X
         7NKRUiCRCHtx29aX399OnoOj4d39Vi02P39OpWxmuu3T4AzcZ/onenp7onjcub9BGi1K
         bUlBcjzS73oET6PzlmxE1yO/nzqhurswdhmzxPM0gOhwHOlpOFdxZ4bwlrwIcfwUo4CJ
         ZiGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794959332; x=1795564132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MaHtinZD1wk7Bum6txGTdaRyK+bUzqzEC5csqnjEg9U=;
        b=hsMChUgp4Jxb5VVzdu+IWr7zmvjoYaSLL4xSJYYsvTOzL1L+8M7jyov1yjSRKD7HFO
         c39yoYIJTTyhUWQmL1TiVOK9LsL265gUxbFOGTGWnF3A7J1yD6EHmT6TuHEzcQWpfefI
         03CT6PCdqRYnN7Fn2CpUELJ8hsdloOAHwQ0hB3oRDTcjOCOfeg/47Xq4EptsV2pkw9aF
         EWYN9IBQFg+DsGX9g8mhCCj64t8Sg8fjVNSdKW+KyAgyBIGDNOqmdV2wlFLAo13V7lg5
         QZHm+vke0HC3TSZXfeuiPNupAl43Kv6c37KTSc/Mh8W2bCdl2MuLCM7gGxsgu5c1y+cB
         XNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794959332; x=1795564132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MaHtinZD1wk7Bum6txGTdaRyK+bUzqzEC5csqnjEg9U=;
        b=uZaYEOv+wJ9cOcmNnRiRMJ/u/u9gNxyXsoARNHf4UjaNdcxFT7MJI7PFmT51kr4WW2
         Pw0c9//FqqHksOJcsdyMsYMOj+QIruhln9MW8Xj2BCWtYl5+nqj4EWgWdv2DhTPO9x7e
         lFxinC0MOe0EKDpXXufUOTs2DBAjBvuBXy2Dib1FVyw9j7ikzdTc64uZvvckNoC/0DJ1
         wpaG7pmW+iWW5xNfP5LkSH0yt+FIr9t7Cr9plYpion6alkliO6KKwLj4o53lM1QRWg5y
         jgNzBmBlcWowP0LXQWEatF0EGlefatYPbpWS5Hx1a2VVFIpTbDrOuczFATp56f6ls8C+
         MR3Q==
X-Forwarded-Encrypted: i=1; AL+hErEgAseUX3/2zPLv+XTYOS1vpaH+Xwue4lWvMHvsTWNVQ1dpBuKR1ZVZpTQvY/PyIy22s0+mjeRL0GICJQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BcFUmgUUgasgcuDq7Sgg7lK2yBtFAKhI1xLwUc4fEBA+bzQ3z
	hRWkzwv27CkFiafK6nkaxFu1+OOdXg1TtAvMi4A9r5L6OfMLCJkTPIb4CkFgwrZjemqTZunpf/V
	dr/YrRxQowlv+s4xbPL5qi70TVlL+/1yvX5Wei8XgajVbsaDiiRKkLvjgMyzRV0UPw1CgjKNs58
	lamHZC3ZeZQwSX16UTRFwMRYjxlwG33WiGbW+b9Dk4Ww==
X-Gm-Gg: AYBFou14TuvlcYtHLJUprRGndiX8E5gEaeMn3V5H7tSmNUo5L2DxzfrTdEuGGhw8Ixh
	XBxjL/rA2Uyjrh2WEPKZVhzmmr3tYFvDQVtskA2FCs/EYkcUSLnbCtxR8IvJ1qyUrprqcI88Fcn
	CGyNEejYd+/nLb8P+puAvUMT5fVzBivK2VMAHanAndp6x5VG6kYGDBYK5jMbA0tnh/rIG/XYn8D
	zVh3prP8nlSpThcpahanQ==
X-Received: by 2002:a05:6820:7090:20b0:71a:eea9:8173 with SMTP id 006d021491bc7-71b1877ef1amr514925eaf.85.1794959331873;
        Tue, 17 Nov 2026 15:48:51 -0800 (PST)
X-Received: by 2002:a05:6820:7090:20b0:71a:eea9:8173 with SMTP id
 006d021491bc7-71b1877ef1amr514912eaf.85.1794959331427; Tue, 17 Nov 2026
 15:48:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
 <20261111-a3xx-fix-me-v1-1-d81f50f1ba1e@oss.qualcomm.com> <079897df-fa2c-4ba0-bd45-7b357783b0a8@oss.qualcomm.com>
In-Reply-To: <079897df-fa2c-4ba0-bd45-7b357783b0a8@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 15:48:39 -0800
X-Gm-Features: AclHuK_gQ7TVoqme6UT0Bozf3_qr3rMIt2eYSB4MEtmBZmpM37PScfWEwT5xtvM
Message-ID: <CACSVV00s1MbvVp0NXRXEqPMu6Fh0FTzto7TGSKgfOb9pkp9tmA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/a3xx: report CP protected mode faults
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afce7e4 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=C0sjHUWUpF4vuSjdFmsA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: R_We1GgA64lA6zUqhX4IAh0EYdDPn3iW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5NCBTYWx0ZWRfX1JuTODSwxKpj
 up2iR8B/8QLhF0inp5KvWO8sytAjNA94skpY7U5PM6cG+FMpIn/rT2VX62wFZ9yznkR8nitFh9o
 As8jRTBRUVhGAIj6CsR+/o2D0xrxu6IUOAnZUI4hkEYUW0zBuglArQzVWW3MMFoUmb4JkG+f3LN
 kUCC58rfG6INkzvdyun6xGcXRvtVx2zVvLAl3af/VtuqXB+4KDhV2Y81YAdY27/9Ric1gOcvyD7
 vBqOK4wAw+2t5xq0fUoyEGrs/JE3107F5ugMTaVqoJvf6VIEZNTqNk9rTqmBMpmCTVtwEwci2Wx
 zPVlJGzE2ouCnUrTyqWHOIK7nXtq5KUuvpAdasimjLyNNz6QHnK2gOECRbG0tQ84HCrLO+rS0CD
 450bNin6h/MKa76g4sOS8LAZb3TvlJyN/MJinavFdY4s50pLY+nwC9JdG8zJyKluZTLYvBO5GBW
 y+ciYqp1PvMhqA8aX6w==
X-Proofpoint-ORIG-GUID: R_We1GgA64lA6zUqhX4IAh0EYdDPn3iW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5NCBTYWx0ZWRfX91O0gU8J/5nj
 z1kaHvyLdM+RRP3fAUCmMJFIDIkbv26qTZs4m3U31AZQnsKMF9+q5P0jWVpI239xn0LCYhxBeRm
 KB8dvALNJ/Oqk2OM64UN1fZI2CbF6xo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170094

On Tue, Nov 17, 2026 at 7:53=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
>
> On 11-Nov-26 14:05, Dmitry Baryshkov wrote:
> > a3xx_irq() acks every interrupt without looking at it, so a write to a
> > protected register shows up only as a hangcheck timeout with no hint of
> > which register was hit. Print the faulting address the way a4xx and a5x=
x
> > already do.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a3xx_gpu.c
> > index 160d302e16a3..7e03b7305493 100644
> > --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> > @@ -419,7 +419,14 @@ static irqreturn_t a3xx_irq(struct msm_gpu *gpu)
> >       status =3D gpu_read(gpu, REG_A3XX_RBBM_INT_0_STATUS);
> >       DBG("%s: %08x", gpu->name, status);
> >
> > -     // TODO
> > +     if (status & A3XX_INT0_CP_REG_PROTECT_FAULT) {
> > +             u32 val =3D gpu_read(gpu, REG_A3XX_CP_PROTECT_STATUS);
> > +
> > +             dev_err_ratelimited(gpu->dev->dev,
> > +                     "CP | protected mode error | %s | addr=3D0x%8.8X =
| status=3D0x%8.8X\n",
> > +                     val & (1 << 24) ? "WRITE" : "READ",
> > +                     (val & 0xFFFFF) >> 2, val);
>
> I would really like BIT/GENMASK here..

Have a look at how it is done here, to keep it all tied back to
register defn xml:

https://patchwork.freedesktop.org/patch/768455/?series=3D178338&rev=3D1

BR,
-R
