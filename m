Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795450553;
	b=Z5R7ygE5y5zVo0KxwzoB8RKnHUAJ9KF0L1lkc233XOFnQ7rzSJVMmYpUlfK3cwFUpACK
	 M16R7WDAW06Gdeu0YSJsqlpk1PI+iuAOQ1nY0NXdQZPoZs3y8/RLIY8qGTw0Dp/q7uVrK
	 X+qxsS/GNPgGmlRLzCGdNHVbm8LA/qJ0Erl+5k9nEYZP/Bano3GwgQiFMDxvA4rrT5esp
	 NtK2hIxBZVdZOSNnlPgw4UcL/hrtrjWYIaOR2GYhLQ4DPbUpTH4zsVCxxA8sBJb0ypjmT
	 lplWCUteXVSCDLlGZHwIgnVAYOvgn1nrbxr6Es0oS3a6cK81B4qrDWBniTqvC4llIxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450553;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J177179CGJ2GQjYr87voPJMa05W6qw1AlhaVh/7GqH0=;
	b=VL6SCC+aGrTD7m2Q/eOqtbyleeMRurXzLkSSGaDlUP0nLERo+XR7eOl7BC+fOJJ+Qi+8
	 H1yvBHd0F5DdOyphoec+FpSjp9GNNoG+3niWtS/U1Z+MnOZdEktiur2Ly8d2Q78vdGJbd
	 g0lNf3V3dwSxYLlTQX+pT3w1kdicVp/1wQ2ljy682iv9f+awnFCQ9BYt77HDDCGshCgx7
	 vHt3qoX7VC9xktppXd6sj2oS4mNyuYTpX6O0flIq+LMw8+4RM2AKU/neBUnY+VKV+HUtZ
	 MYUkjmYr8LVQMVgoqXDvI+D0NBgctpzxngKCow1IMQubZrFXnxWobt4u0eYZIeXpCaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dRUHpYiK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SKdCqHGo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDB5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DDB5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dRUHpYiK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SKdCqHGo
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKwik1937644
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J177179CGJ2GQjYr87voPJMa05W6qw1AlhaVh/7GqH0=; b=dRUHpYiKLEzRiPU3
	trSNVZPjlrfOGJYp9Nttmw3OlzxpCyTAQwgTDG3N4OBmaPnodREpP7qY+cWG0PPC
	5MpNr0MwyIQ/dg/AQ4HkfvIOwQp9vynbIq8jFtWW6DFPF2hYbqafXCo90bWy2Qfq
	CSZKzYOfPZOuGrhmoHZb1Njvqwwxgj5biTh0wZ8eoNawHLdwMihdBIIiUPVi30Nd
	Uk5boXCrFWAlAtRGtwr4Lxt1WGideU9mMNTWGf7l5godxwdGgICieDxZqWhaqB2a
	c2yksX3JmMv9nv32y9V6DINFWcJILH8xnp1nOPNm9x8ZWCeqdWsLNcoSpnHH2Xpx
	RI4kKA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx2h2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:15:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so2984228a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:15:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795450551; cv=none;
        d=google.com; s=arc-20260327;
        b=Pu8PSkkIp1FfgmMxPBUT9fSYHprb/e8SITOrDgfkjs0sk6oTcWwVfjYiJE+mAPjOvq
         K7wqsjQSuEsRk7Jp2t2Dl5jqaOITuZVoesHiOXBFv4am6Hkc7ksbyJZ2KKQpMA6ncYGv
         1kQ6IpgFCBwkOqa3aD+ThzFU2aQrr7QCf8KDsmyAXh7Uzq/nN6pHoTRtKyAQfQgWrLc6
         l6uS3Gy0jit/TrFDvWVOTNXY+mYYY30uSHwrfF1s4XgTr41gEwmQG0OoipbHPiz7BYA5
         zOpbvnfPLByxlonf0So/9BvfMm0o2Hj7B4ShhnzH1wE9GV4HP3tddjevp3fFhpIP1be0
         I9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J177179CGJ2GQjYr87voPJMa05W6qw1AlhaVh/7GqH0=;
        fh=uZ2/ToUM+8jEziJuatnZSKFlkSVFxTxg4xJguLru+Z8=;
        b=KE0Iuv2UGclKza9/U9a3DYtwPIZedKDAeKaGtBdPi37uHAeHqHcBaSigwD3QK52cVX
         GVHv4IXiFB52M4zwp5TwKOaPxHCo14SBRTQKfgay1N/lhLz+RFKHxfVsS0Ue3uUyh8kv
         IoK+QLFgJ6RZsV7XA/Fpog8uMHxT3B36xWv0qeSspOsRzFWQ/C+uHUMzbBOVPrhurk0Y
         67hdhAhF4az/7yBYj+WGAHNn2vfdaB46WTnIU6QfVNSCRcdWKmVKsbElomeTy1cPrcu+
         BzSTeEbTZlu39l44QPRZecdQ7X421UAcflHrBwVHHmJ8SvXtvtJq8D74eROYWNo7dlMO
         8VwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795450551; x=1796055351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J177179CGJ2GQjYr87voPJMa05W6qw1AlhaVh/7GqH0=;
        b=SKdCqHGoAHa8YZIqQdnLwZYUirssdOd3qCJoDkjOANH9uWhwpO+WZwDCI2VlVxKeLz
         nCEvqnKrzDBuJ3qTwyxsPTsrJXEkOnP92MOMlUSviSsfyoqb2eQLTPQtHkUAdJTBdkj1
         vhpkzRy5ptQC5nN1fnSxciRxOmhqq0JWBHI6JtjYLAuJDmcT7h4lTO6CKAFZzHPjtDLb
         MqTIRgaYsMZmlTl5nc5V+SuUj3z3ynptHnwCvwt7FDIdlt02DC4G5M4jOURsdP0u5iE6
         gWqdKsiFUnKxqT5MGf39hzwN0lQX6VX0PmvME92TUf5ONT2Xcv0mYNtpSowEYpzU5gNc
         vO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450551; x=1796055351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J177179CGJ2GQjYr87voPJMa05W6qw1AlhaVh/7GqH0=;
        b=JlSYyUb4b7lLTl449v38kRW3CTY4uQIdQceAVgaEKCh6jZ+NXGhP0c3q9aL5hwSB4T
         y+0gIHdkcBdsEl/CvKRo01OwufvxHitZJzlCktLSnWTklRjPVF87LadxHp5VBHjbfJlo
         0JAhQalOdvLjvquV7608Jtb4t50AMGo1A2FeUlTCq7/XgqdgeNa/yHu8vTPo/aW2Q1iw
         NmVUc6h5gkIfQcy/m1IX7hxdTfEBaGjA55Dtneg9VsXOZ15SrIAxVqotJ3tGDr0EKpqG
         BnGAjyZLwG0lK+bQIGeWIEy2mb1apwCB0d/WH9rMuYbFjL/fgmfSLVNbF0YBFxjLADra
         3H9w==
X-Forwarded-Encrypted: i=1; AL+hErFqvDUEO1twjjBiN5ZPXaqtzCnps73ypDynVl2gyUCuxynXYyE58RziOjSSfI4cSNovw04vaHVsAb6nu10=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hCYxTt3G8rnp+DJ+LQH0ssdoPKtAlEEuR7/VzHvcf8Lsp+3Jg
	7n0sNSitSHFe6LTaJRPwGZYOyEcEylC1O1MTlSQutIS3YvTbOJFwK2fBDzMOJxv6V35Ha+YUGDU
	5YP0qHOPV0NkX56f3YxNv2X7FM51skt3A0vkAWdkdAfeXKLBUQtP63+nv5/kVl5MA4qjTimfj5H
	UeP9i9l8jViiD4lIEMuM4xEgPbORlaMQrxrR/eXYjeaw==
X-Gm-Gg: AZFdTZeJ7qziVXWyYvWGVNjvhyw7YiTwMIvNp5OxGLfrUtOm5bQy9zuhjUuKFyaX3R9
	ACJV/SbSt+0XCloSh+D1qjSVavKJamB8Q8JqvBTfsk4mWnnVeb6K80quIKXKf7AZ4sT1uNUDWhB
	UtIHyXv3CG3VtONGGn9RRe721Y2eu2d63xoX5s7K3lSs9PpDrk3SQerAYibDPDdU9jqvQdNiR6/
	S2JrMNI3BbOq0X1
X-Received: by 2002:a17:90b:240f:b0:3b4:ab19:ae09 with SMTP id 98e67ed59e1d1-3b4ab19af51mr1206240a91.52.1795450550799;
        Mon, 23 Nov 2026 08:15:50 -0800 (PST)
X-Received: by 2002:a17:90b:240f:b0:3b4:ab19:ae09 with SMTP id
 98e67ed59e1d1-3b4ab19af51mr1206202a91.52.1795450549917; Mon, 23 Nov 2026
 08:15:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-ux500-drm-mcde-powerdomain-v1-1-afdc326cceb7@kernel.org>
In-Reply-To: <20261115-ux500-drm-mcde-powerdomain-v1-1-afdc326cceb7@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:15:37 +0100
X-Gm-Features: Aa3M54pI-nMqrQifP2PTTNFuHdzLxGSvIuSxp9oUL80BWWv_Lu9z1icInvkp32E
Message-ID: <CAPx+jO_w6-y82_5+DTLxb6dtiNv2KNMYLKpRJU0nLRLvy5-adg@mail.gmail.com>
Subject: Re: [PATCH] drm/mcde: Use power domain for display power
To: Linus Walleij <linusw@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b0466b7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=Q-y6Duihw73N38jVMmsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: sUhoMqj_635owyBg0FuZO6bMuJ4rIHvo
X-Proofpoint-GUID: sUhoMqj_635owyBg0FuZO6bMuJ4rIHvo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NCBTYWx0ZWRfX+ND5s3Bj41tZ
 97dqW6C6W3Ng7Uf2txBwE6Faob4At8s9aaHTXsT4r0mf/lpQ7am9ig5GeFvsbbHM6WtbHkhW1Mc
 Pe3B46iD8p4OMVbvq0tHSi1NPwwf5V4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NCBTYWx0ZWRfX2gcX4Cer7OAp
 01k+ERXs+BAcdFGTG/VF4E6mFUxi25KUrlfcGej7fTGDQi9MM+rXLhXe6KqfabT6tuo70Mevq9R
 Dt7eayeV4FLYyCm0k3dlJQu1rnqrwZ1ovBsNogAljmkT8Potwov/Vyl2RBhLC8AS9qxl3PQYQfB
 BWJxUVlqFf6Qy2/9OCRX3v5qZ0wyMyNev4r/ocHTBNo+58fjbbUJBzVLC4ZXeJxbzaOqMLe/BoQ
 ZpNjCrPcujwLRQCASUHJdOnlm4vVMxsUmqwn//pi4eYx7Ljce6gTT/A5Kxtk396GFEcFi4xUBiS
 kmJ3qaZVNnVXtLWwHWw9b1otv3QLtyu+qByQgdABiWUy3IJXFm6j+pJvgUfLMT6W+tfY0auL2uH
 i6F10kvQexBMls+mUvIIgD/zGRwTMZewXuFdtpV1CLHVf9EErQxhMwSJDXnRHLVmV0wHJgf0eur
 7bQ5aiKL3PNv6JZ/1hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230064

On Sun, Nov 15, 2026 at 7:10=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Replace explicit EPOD regulator handling with runtime PM, including the
> power cycle used to reset the display hardware. Treat only negative
> pm_runtime_put_sync_suspend() return values as errors.
>
> Keep the separate VANA regulator enabled while the driver is bound:
> the AB8500 CSI/DSI analog supply is not controlled by the MCDE power
> domain. Preserve its probe failure and removal cleanup.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> The Ux500 genpd prerequisites have been merged into the powerdomain tree.
> Please take this conversion through DRM; the companion bindings and DTS
> changes will be submitted separately.
> ---
>  drivers/gpu/drm/mcde/mcde_clk_div.c |  4 +--
>  drivers/gpu/drm/mcde/mcde_display.c | 13 ++++-----
>  drivers/gpu/drm/mcde/mcde_drm.h     |  1 -
>  drivers/gpu/drm/mcde/mcde_drv.c     | 56 +++++++++++++++++--------------=
------
>  drivers/gpu/drm/mcde/mcde_dsi.c     |  1 -
>  5 files changed, 33 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/mcde/mcde_clk_div.c b/drivers/gpu/drm/mcde/m=
cde_clk_div.c
> index 8c5af2677357..1a22e6233946 100644
> --- a/drivers/gpu/drm/mcde/mcde_clk_div.c
> +++ b/drivers/gpu/drm/mcde/mcde_clk_div.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
> -#include <linux/regulator/consumer.h>
> +#include <linux/pm_runtime.h>
>
>  #include "mcde_drm.h"
>  #include "mcde_display_regs.h"
> @@ -95,7 +95,7 @@ static unsigned long mcde_clk_div_recalc_rate(struct cl=
k_hw *hw,
>          * It will come up with 0 in the divider register bits, which
>          * means "divide by 2".
>          */
> -       if (!regulator_is_enabled(mcde->epod))
> +       if (!pm_runtime_active(mcde->dev))
>                 return DIV_ROUND_UP_ULL(prate, 2);
>
>         cr =3D readl(mcde->regs + cdiv->cr);
> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/m=
cde_display.c
> index 281f5b3274bd..57305fdbcdcc 100644
> --- a/drivers/gpu/drm/mcde/mcde_display.c
> +++ b/drivers/gpu/drm/mcde/mcde_display.c
> @@ -7,7 +7,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/dma-buf.h>
> -#include <linux/regulator/consumer.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/media-bus-format.h>
>
>  #include <drm/drm_atomic_helper.h>
> @@ -1187,16 +1187,15 @@ static void mcde_crtc_helper_atomic_enable(struct=
 drm_crtc *crtc,
>         int ret;
>
>         /* This powers up the entire MCDE block and the DSI hardware */
> -       ret =3D regulator_enable(mcde->epod);
> +       ret =3D pm_runtime_resume_and_get(mcde->dev);
>         if (ret) {
> -               dev_err(drm->dev, "can't re-enable EPOD regulator\n");
> +               dev_err(drm->dev, "can't enable MCDE power domain\n");
>                 return;
>         }

Neither regulator_enable() or pm_runtime_resume_and_get() (unless
marked irq_safe) are supposed to be called from atomic context.

Isn't mcde_crtc_helper_atomic_enable() called from atomic context?

That said, converting to pm_runtime_resume_and_get() doesn't makes
this any worse.

>
>         dev_info(drm->dev, "enable MCDE, %d x %d format %p4cc\n",
>                  mode->hdisplay, mode->vdisplay, &format);
>
> -
>         /* Clear any pending interrupts */
>         mcde_display_disable_irqs(mcde);
>         writel(0, mcde->regs + MCDE_IMSCERR);
> @@ -1347,9 +1346,9 @@ static void mcde_crtc_helper_atomic_disable(struct =
drm_crtc *crtc,
>                 spin_unlock_irq(&crtc->dev->event_lock);
>         }
>
> -       ret =3D regulator_disable(mcde->epod);
> -       if (ret)
> -               dev_err(drm->dev, "can't disable EPOD regulator\n");
> +       ret =3D pm_runtime_put_sync_suspend(mcde->dev);
> +       if (ret < 0)
> +               dev_err(drm->dev, "can't disable MCDE power domain\n");

I suppose this is kind of equivalent with the error handling to
regulator_disable(). So I would argue that that this is okay for now.

However, even if pm_runtime_put_sync_suspend() doesn't return an error
code, there is no guarantee that the corresponding PM domain (managed
by genpd) actually gets turned off. What we probably want instead is
to is to get a notification from genpd to let us know when this has
happened.
See dev_pm_genpd_add_notifier().

>         /* Make sure we are powered down (before we may power up again) *=
/
>         usleep_range(50000, 70000);
>
> diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_=
drm.h
> index edbb4580a7d8..296edf9ebef4 100644
> --- a/drivers/gpu/drm/mcde/mcde_drm.h
> +++ b/drivers/gpu/drm/mcde/mcde_drm.h
> @@ -93,7 +93,6 @@ struct mcde {
>         /* Locks the MCDE FIFO control register A and B */
>         spinlock_t fifo_crx1_lock;
>
> -       struct regulator *epod;
>         struct regulator *vana;
>  };
>
> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_=
drv.c
> index 759e279b645a..af26ac5a4455 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -61,6 +61,7 @@
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/delay.h>
> @@ -283,33 +284,26 @@ static int mcde_probe(struct platform_device *pdev)
>         mcde->dev =3D dev;
>         platform_set_drvdata(pdev, drm);
>
> -       /* First obtain and turn on the main power */
> -       mcde->epod =3D devm_regulator_get(dev, "epod");
> -       if (IS_ERR(mcde->epod)) {
> -               ret =3D PTR_ERR(mcde->epod);
> -               dev_err(dev, "can't get EPOD regulator\n");
> -               return ret;
> -       }
> -       ret =3D regulator_enable(mcde->epod);
> +       pm_runtime_enable(dev);
> +       ret =3D pm_runtime_resume_and_get(dev);
>         if (ret) {
> -               dev_err(dev, "can't enable EPOD regulator\n");
> +               dev_err(dev, "can't enable MCDE power domain\n");
> +               pm_runtime_disable(dev);
>                 return ret;
>         }
> +
> +       /* The CSI/DSI analog supply is separate from the MCDE power doma=
in. */
>         mcde->vana =3D devm_regulator_get(dev, "vana");
>         if (IS_ERR(mcde->vana)) {
>                 ret =3D PTR_ERR(mcde->vana);
>                 dev_err(dev, "can't get VANA regulator\n");
> -               goto regulator_epod_off;
> +               goto pm_runtime_put;
>         }
>         ret =3D regulator_enable(mcde->vana);
>         if (ret) {
>                 dev_err(dev, "can't enable VANA regulator\n");
> -               goto regulator_epod_off;
> +               goto pm_runtime_put;
>         }
> -       /*
> -        * The vendor code uses ESRAM (onchip RAM) and need to activate
> -        * the v-esram34 regulator, but we don't use that yet
> -        */
>
>         /* Clock the silicon so we can access the registers */
>         mcde->mcde_clk =3D devm_clk_get(dev, "mcde");
> @@ -412,14 +406,15 @@ static int mcde_probe(struct platform_device *pdev)
>
>         /*
>          * Perform an invasive reset of the MCDE and all blocks by
> -        * cutting the power to the subsystem, then bring it back up
> +        * powering down the subsystem, then bring it back up
>          * later when we enable the display as a result of
>          * component_master_add_with_match().
>          */
> -       ret =3D regulator_disable(mcde->epod);
> -       if (ret) {
> -               dev_err(dev, "can't disable EPOD regulator\n");
> -               return ret;
> +       ret =3D pm_runtime_put_sync_suspend(dev);
> +       if (ret < 0) {
> +               dev_err(dev, "can't disable MCDE power domain\n");
> +               pm_runtime_get_noresume(dev);
> +               goto clk_disable;
>         }
>         /* Wait 50 ms so we are sure we cut the power */
>         usleep_range(50000, 70000);
> @@ -428,13 +423,7 @@ static int mcde_probe(struct platform_device *pdev)
>                                               match);
>         if (ret) {
>                 dev_err(dev, "failed to add component master\n");
> -               /*
> -                * The EPOD regulator is already disabled at this point s=
o some
> -                * special errorpath code is needed
> -                */
> -               clk_disable_unprepare(mcde->mcde_clk);
> -               regulator_disable(mcde->vana);
> -               return ret;
> +               goto clk_disable_pm_disabled;
>         }
>
>         return 0;
> @@ -443,10 +432,15 @@ static int mcde_probe(struct platform_device *pdev)
>         clk_disable_unprepare(mcde->mcde_clk);
>  regulator_off:
>         regulator_disable(mcde->vana);
> -regulator_epod_off:
> -       regulator_disable(mcde->epod);
> +pm_runtime_put:
> +       pm_runtime_put_sync_suspend(dev);
> +       goto pm_runtime_disable;
> +clk_disable_pm_disabled:
> +       clk_disable_unprepare(mcde->mcde_clk);
> +       regulator_disable(mcde->vana);
> +pm_runtime_disable:
> +       pm_runtime_disable(dev);
>         return ret;
> -
>  }
>
>  static void mcde_remove(struct platform_device *pdev)
> @@ -457,7 +451,7 @@ static void mcde_remove(struct platform_device *pdev)
>         component_master_del(&pdev->dev, &mcde_drm_comp_ops);
>         clk_disable_unprepare(mcde->mcde_clk);
>         regulator_disable(mcde->vana);
> -       regulator_disable(mcde->epod);
> +       pm_runtime_disable(&pdev->dev);
>  }
>
>  static void mcde_shutdown(struct platform_device *pdev)
> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_=
dsi.c
> index daac8d67913d..86ae23894cda 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -8,7 +8,6 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> -#include <linux/regulator/consumer.h>
>  #include <video/mipi_display.h>
>
>  #include <drm/drm_atomic_state_helper.h>
>
> ---
> base-commit: 9ae477db090b44816741fd9c49a3c459fc7d407b
> change-id: 20261115-ux500-drm-mcde-powerdomain-8a8d9d4c5a44
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>

Even with the comments above, feel free to add:

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe
