Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448332;
	b=vUi9/oW8awdhRfiq0aOYLizhVIyIoz5KoUC6TdEmrxtvBq4e19YYZPU4IxuZRtgurarM
	 I9M4Tg/7b/ivlOSNWh8KdUjaMfSifOBXWtMdxf8izg9/RHChPP219/gOgNXYHKUld2C/1
	 wA4y9KZTKmFGGX34i7MOKZJe9n5NhYE7aQI86OireNJwF5vhqykYr23GaYMEvdD1bRboz
	 8gWt32qZL3R0BeubbSSU1DyNNdkeGUgwqE6Z73wCXbe3ILDmqmWGNs2eFghY2pQ0uzpN4
	 C5EEIYK0OsHd2pnQjq6faELhjtyErQdLYBILg1egoLJV0Xz9CGl95MgKmhWkBfeW1CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gCVuzChl+qO4tFfIRRaq7R9WsSlLoWjA/ThFeM3Nkpk=;
	b=LKB//H1T8DldzpfAHtuH4rLYccaxi8VI/EV0iK7ic6zYebNKgoz/PQUrpsE9w6nwyKLf
	 H8b+y6ECLTp+134OZ+TeGnpdn8NUM11kbjSVVED5bMnkkJ00NY6Zde2tSnl3TAwUiBrTE
	 1cXK3h1m6bLS4kR4grcQTa77vGhEsojoDEOmFfwo7QRNTGB1uBZsYkv95pLERNNXfUPEn
	 GqB6gP2d2Afz7g1qAPVljE3nk8snXC0IWuWwv4vsG/Fb+kZhtSsCa5rpVbU1iqKFd0IDj
	 Tyi+hm11n3hm3EdmXAcdocwy2AhmzY46gjXPbPaO1fs5XxloMH1BiQCQLl5usiKK4gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hoOxe6cf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xtv1pA4w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B05606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B05606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hoOxe6cf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xtv1pA4w
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKxZ32442751
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=gCVuzChl+qO4tFfIRRaq7R9WsSlLoWjA/ThFeM3Nkpk=; b=ho
	Oxe6cfARPCtlTyBaxNA5wTR5sD9+yw7sTOHRGuQ4gBjc5TvQ8/0cpPgW3nD4fUUk
	Jx4uyallOivIXXTB+WjarpzXqeAf5JMp4hvj9vB8lywcWB3q+4nPrSf3ACbvH7ud
	JW6D91HYQxxrX4Gue9XK/AlIkFwH+UNErv5llqB4ZKG0apW/e7tVqucz/Img1Vvb
	Zc3fQXxI3Xs19uXfW160vYEbA3hK29BNsnVKRq/utJs43vnjCmS4brXnh3vCUyvm
	/jAoRmKSuBJfJhQCyUv+dh3a9I/Ads8A/btgqP5v2X1lwWSK/EnL1wjdrGWgoxJC
	ixZEmRVFB7YQ03HuVqAQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k249a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:38:50 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46509ab0149so2654066fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:38:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795448330; cv=none;
        d=google.com; s=arc-20260327;
        b=IPlW2MmbAt8EXZHhkI9CdyObovRNk0J/XietlBpbOGCDGAfx989IezbaxTqrAkvZzt
         JW6/UFaq5bufSrJtp/raDlMZNRDYtfKjMwev75wrqtqJA7d0lDWdwew428m3ymCAnyYo
         vw5AUsjAw24t2o4jE2Ye4WPceP6fJGWn5bGqKW0NoSUEl7KPS7ZIaTzr1YTJ0V/SjlfP
         ecwF1rKfPtpPfZd/u1vS9DCEnSlJ73GKsIgafmuoyGwzSbVn6+x/aYDgmhL1xzRs2cub
         LSTgT7WmoybefqwculzPIYT82lUSOjEycLeH7zGpwY7shRyVeBqSijz2Lj0TrJc1idbw
         6wdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=gCVuzChl+qO4tFfIRRaq7R9WsSlLoWjA/ThFeM3Nkpk=;
        fh=VaiAukVaxTm60P5jmet7SVP2haelsZyaXVQz41z4SPY=;
        b=ERU+2uWogqquzm6YW2VkyjmWXi8Yrz9WJIrq+TZY3BQFokMoN9OQnzzlB1k4j8To68
         TKBjpXoNmsIuBFtq331tqcETg1JGydxVM4r3g0PjPkjbD7UVJEcXH7dSuLG/4fVSoxmA
         3cr8tNMMqFFTddBi/gWeQ4t3yHEZlKk8uSRV3PqVrz4ZS3HwIqQBNrlDfA/QNzeiN1PO
         0nkAWtA5AU90ke8zb7N5hzlfnYLujZrLze3qM/5+34yo3jd2Gi2+UfTKS0TDqXf+e30K
         91cksQLaHCUzyaSwr7gCTZuhnPr7iD8kAzCmWBZ1xWC+cfKGeJK95mqDFw6DFpmUTthb
         On2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448330; x=1796053130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gCVuzChl+qO4tFfIRRaq7R9WsSlLoWjA/ThFeM3Nkpk=;
        b=Xtv1pA4wT4mWyK0zHxXaebMOCTBOYxn65ythntIka/ZhIWvChx8FXB81GCapchZJtW
         xk+jZTE8Mt02PBcrzLK/yQtipnmoXjjp7CUXxcAp7AJ40XuSsX/yqreOygvH82a4i+n9
         sAer10BvmU6GKPgQfcl6lJoFyW6CMWj4KRu0ZQHctdRm7K3Om+pNZFVMxupdBrB+m772
         XqSS21+DEXtA8YQ/V76DauA6zcthX9mP0kcuITw6pRI9VIBeE9BRg4kQTnEtxdmzZKC9
         wwUtQPoSPrb53UoYt7dXe98bBY0lBU3M99x7wQ5iQ9G8ZX/7YGYvagIeYn1CqiclWBeX
         ZNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448330; x=1796053130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCVuzChl+qO4tFfIRRaq7R9WsSlLoWjA/ThFeM3Nkpk=;
        b=oiRFFpJWu1lzt+IyFM9k3ArqKde19sml+PJqfsVjOGHKaC8gVdxSCUm61vOEsdJXiy
         zQcBp1D2PEtllEKaY7BP/UaHaCTvXRqGIjTUHrL+dyXj+qJdQfUV43ic/9nBgZpCA9Qq
         IQIC31kpWjKbXKEKyZe5LNb59+Ht7OlbwgVsvWnvPVCkuZzw9DmK0Z+9TswedW4bojON
         ifDCkrLIEy5Re6Dk1/U8VVjf1WLvXbRzfuqDvAPgf+j3JK5eV8Ou2yUMiRX5+FAvCmU9
         CBLjPlVq7iqTryuD+a7UJnStr3oySgWBv4aKWEF/0c+4RYRKqhSbNZoj66jvf+Q34O7b
         hz5Q==
X-Forwarded-Encrypted: i=1; AL+hErF5nnmpYH2Ag54U3zZg662QUAe/KTICFtaKRqAHvJ0gmT830hGyLhZOtZ6K3VCyrz4mrw/PHKoW862RnLg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sm+OVcXH6qENXrAbGTc6qIi9PVBaBSpyJDbGVfKu8s5IuXC9X
	HZ+9dyF+15y7MtAMJ/gusoa1LogknJt7ugRXOhL587crJbezS4YvJgP+JLAFSe8nrk3ycvyPOSR
	k9lWMfhpk8j/38654XIg2g1b8WsBFIWnfWnfAi9b/y17EuPHXgSbN0BxmX2iNR3Odgmad1bM3rw
	13edn0gnerO5DueNRYa5J2jiZmsZbxfU+9pywb/MQdMw==
X-Gm-Gg: AZFdTZdRBUGqUgWmGXr7/VPIidn9W+m/0H5UhNoDXL+eGYO2cWLu7Ln9pNed9Syzcyj
	sX0s5H9xxLvM6T2RtvkLwPTe5XBuqkeF1luoBFpc43/ZTTHjGRQ2AI+gsBiaWdVstifTkZByei2
	26J01rAU37pCJlrG0YDMrA75jv1DvSLrm4AneHyaRVwCfvLsSBa1aMrv/HTQDiQsSomeMwnCHew
	Rj++EVR2cNMfQb07IMHiQ==
X-Received: by 2002:a05:6870:160f:b0:49a:84fb:a67e with SMTP id 586e51a60fabf-4bc81aa22e7mr11083137fac.19.1795448329806;
        Mon, 23 Nov 2026 07:38:49 -0800 (PST)
X-Received: by 2002:a05:6870:160f:b0:49a:84fb:a67e with SMTP id
 586e51a60fabf-4bc81aa22e7mr11083108fac.19.1795448329302; Mon, 23 Nov 2026
 07:38:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com> <20261031-b4-adreno-timestamp-v2-1-0836856b228f@oss.qualcomm.com>
In-Reply-To: <20261031-b4-adreno-timestamp-v2-1-0836856b228f@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 07:38:38 -0800
X-Gm-Features: Aa3M54r2MCQoQ3PqXzI3hpH_qsmTUYcXPDHzocmgon31QcuLcq7PZJCcVO3KLFk
Message-ID: <CACSVV02JZe-i2gBS0ShiGBaH61MNYEtn8RxsM+sZe4NY7jHFzg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/msm: share a page of kernel state with the GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX9eZCeiugRCrc
 GtLz4ZLahSdNQ8+sq554DzfhkyCbeDBAF81bm9J+ruiMZR08OMxGsx23766mEKyU6b4vdmUfb1V
 Mv2Ok52YiMgI2BKwudRes30DP8mJ7q0=
X-Proofpoint-GUID: kzXeq5MGdf1juIHkMDFCRuG7FwrcF6y3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX1QDGG8+F5lGL
 gDN+H2yPE8dDxmPGezMOImkc6cLoNzuSlbrXcG+akyV30VlJTLOPGzRMkAg0lP/+It1wNGdodLV
 ObPL5NmLt6P+MBJ0a2/1ejkiItiIq+yvlhxD2/fOCrkz+iDiJKzHUHI1FFViycjvkUzhyKF+pAR
 8aLJyCAaOFTnULLaTDC+kgrugswJTy4gJELFXZGyliwVZkYZjH4Dvxxj+yfx1YnkBpBMhaWU6F/
 9J2vHjuDb/b8nPexUZxW2D//+zHlVnugkz3qQgSsrj9b6gaFfZMJqyM1GaQt1grltN3beLRcWWt
 MdIJ4tKK9FStN+/qkvUory1JCXaxkqPLhGkqdw6ioBtNXHO2tMdQX44ltKVwWWKyb+kM69iwEc/
 IG/gfIzuzwg9yQ2ke6iexhGD4GIDtjnA6pZiY7uJISSF3GO8jFxRI3rmBZ2QTwc2jr9XpPb3C53
 T68PPkBkW5UrdQ+JMAA==
X-Proofpoint-ORIG-GUID: kzXeq5MGdf1juIHkMDFCRuG7FwrcF6y3
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b045e0a cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=Sjt1sVUzr0hdpTIL:21 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=uvoR58hokDgp53dTwF4A:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230062

On Sat, Oct 31, 2026 at 9:12=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Some state the kernel keeps has to be applied to values the GPU produces
> by itself, the first case being the always-on counter that restarts
> across a GPU power collapse. A GET_PARAM can't carry it, as command
> streams need the value at the time they execute.
>
> Allocate one page in the global GPU address space, read-only to the GPU
> and not privileged, so the command streams of every context can read
> it, and report its address. Start it with a flags word so that fields
> appended later can be announced.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
>  drivers/gpu/drm/msm/msm_gpu.c           | 15 +++++++++++++++
>  drivers/gpu/drm/msm/msm_gpu.h           |  5 +++++
>  include/uapi/drm/msm_drm.h              |  9 +++++++++
>  4 files changed, 32 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index dadfe4c69438..0adf56fb9563 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -404,6 +404,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_=
context *ctx,
>                         return 0;
>                 }
>                 return -EINVAL;
> +       case MSM_PARAM_VDSO_IOVA:
> +               *value =3D gpu->vdso_iova;
> +               return 0;
>         case MSM_PARAM_PRIORITIES:
>                 *value =3D gpu->nr_rings * NR_SCHED_PRIORITIES;
>                 return 0;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.=
c
> index 0c2c35636251..747cd90e329a 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -989,6 +989,19 @@ int msm_gpu_init(struct drm_device *drm, struct plat=
form_device *pdev,
>
>         msm_gem_object_set_name(gpu->memptrs_bo, "memptrs");
>
> +       gpu->vdso =3D msm_gem_kernel_new(drm, PAGE_SIZE,
> +               MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->vm, &gpu->vdso_bo,
> +               &gpu->vdso_iova);
> +
> +       if (IS_ERR(gpu->vdso)) {
> +               ret =3D PTR_ERR(gpu->vdso);
> +               gpu->vdso =3D NULL;
> +               DRM_DEV_ERROR(drm->dev, "could not allocate vdso: %d\n", =
ret);
> +               goto fail;
> +       }
> +
> +       msm_gem_object_set_name(gpu->vdso_bo, "vdso");
> +
>         if (nr_rings > ARRAY_SIZE(gpu->rb)) {
>                 DRM_DEV_INFO_ONCE(drm->dev, "Only creating %zu ringbuffer=
s\n",
>                         ARRAY_SIZE(gpu->rb));
> @@ -1033,6 +1046,7 @@ int msm_gpu_init(struct drm_device *drm, struct pla=
tform_device *pdev,
>                 gpu->rb[i] =3D NULL;
>         }
>
> +       msm_gem_kernel_put(gpu->vdso_bo, gpu->vm);
>         msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
>
>         platform_set_drvdata(pdev, NULL);
> @@ -1050,6 +1064,7 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>                 gpu->rb[i] =3D NULL;
>         }
>
> +       msm_gem_kernel_put(gpu->vdso_bo, gpu->vm);
>         msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
>
>         if (!IS_ERR_OR_NULL(gpu->vm)) {
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.=
h
> index d27d54bdb7a7..f78f3bc62977 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -252,6 +252,11 @@ struct msm_gpu {
>
>         struct drm_gem_object *memptrs_bo;
>
> +       /* page of kernel state shared read-only with the GPU: */
> +       struct drm_gem_object *vdso_bo;
> +       struct drm_msm_vdso *vdso;
> +       uint64_t vdso_iova;
> +
>         struct msm_gpu_devfreq devfreq;
>
>         uint32_t suspend_count;
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index 3d363f12f66a..f8bf48fdc339 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -118,6 +118,7 @@ struct drm_msm_timespec {
>   */
>  #define MSM_PARAM_EN_VM_BIND 0x16  /* WO, once */
>  #define MSM_PARAM_AQE       0x17  /* RO */
> +#define MSM_PARAM_VDSO_IOVA  0x18  /* RO: GPU address of struct drm_msm_=
vdso */
>
>  /* For backwards compat.  The original support for preemption was based =
on
>   * a single ring per priority level so # of priority levels equals the #
> @@ -127,6 +128,14 @@ struct drm_msm_timespec {
>   */
>  #define MSM_PARAM_NR_RINGS   MSM_PARAM_PRIORITIES
>
> +/* A page of kernel state that the GPU can read, at MSM_PARAM_VDSO_IOVA,=
 for
> + * command streams to use.  New fields are only ever appended, and the k=
ernel
> + * sets a bit in @flags for each one that needs announcing.
> + */
> +struct drm_msm_vdso {
> +       __u64 flags;

I like the VDSO idea, but we should probably have a
MSM_PARAM_VDSO_FLAGS, or something along those lines, for easier UMD
access (ie. without having to start out by doing a SUBMIT just to read
back the flags)

BR,
-R

> +};
> +
>  struct drm_msm_param {
>         __u32 pipe;           /* in, MSM_PIPE_x */
>         __u32 param;          /* in, MSM_PARAM_x */
>
> --
> 2.47.3
>
