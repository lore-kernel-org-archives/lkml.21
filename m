Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795377787;
	b=jAkzCGTXq80f8wrcbuhCZLOjWcPQ25ZdSAjeObLvuEXmbc0cWQhCE+tYAn7+JO1TBTjn
	 GEwGviN19Bb2W97lfptfOZloEC6MIftyXHgZumSyUx2Jo2MWU7uDw7o4eONdb4xmHe2qv
	 r2w0oToC1c5Ttu15DdkXiJTlm5AOK4pOL052crwiKMU83+V8iiSfHsdgfCjEwB3tyr6cw
	 yS8jzzefjA613yi+O1AYLAt8rBlXWTE1YCT73HREKpz/XZsiLwND0nYIlYSDuSXNiMpSB
	 3JGjOiTBf7oBeoprdXV0ORDOK2vKIOnnNz5T9y3AlT6gU9qdiM8g7G1rMVUsMfAiGVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=;
	b=2czXopiumTck+N5kupmOeBIARh7qv2mHYSARc/0NY/5iV/dA82VATrbDSqt7l/PEFOiP
	 WyoUguc5NmBMFY5RxBnrcatsa67FTp+jKAsYjlTV5XnvQ67lu9wAfM4z/xMDZl5QKB8s7
	 tiVMjQKs+C4bWs4umomn3jz24UcU78CNH7l+mo7vP5swf//+KvoPPQgwFmyBTeOl5q8eU
	 r9wseW685vyMcqI8/Tv8JVBdUuQkMokhCzHsKYiZVrB+kboRq4Y8uLnsOJlRm05lyzAzR
	 fgpPI+wicYAJhod1izwtZh9iybRyyBNB5OcZqogioydYxYQTRkAva5RwrdGJUsDe78g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0ayWLu5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tod8UVHY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760C1606A68F
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760C1606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0ayWLu5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tod8UVHY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUoWj4154401
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=; b=P0ayWLu5HnEkBhci
	hqj0rSLBOSLGEHUsFbgNsTAVcxYL92RqjUDAhCorsGhVJSYe84ozL+qTAwQliWT5
	n9HKMwnEzq3CBsuibwubzPVKdYgQc/PIcdVm2D0v9YMQ/xk4J3CNTHHqib8lCMto
	P6M8w+1ucoG11tsYx6XVOYw3hXYV1YQMODVoREPALC2ROQBgrQfraFqOdNS9wDeC
	vH71v1eVs4EkvA6putFC77UKumA2AgsCMyFGfSd9nCmhpp9NLPT1CdpZGrXjqlOZ
	iSffFFL55Z3vutME+TXwtmd+HkuffKQFPT0wbtp5Wp1lScgAG2j/xrsXr6Z5iYFh
	K7BWmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j328rvanr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:03:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94970ad532bso423807785a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795377785; cv=none;
        d=google.com; s=arc-20260327;
        b=lyqnB2QqOZf1twmaLeRgDzFS/dC8qBBNL3FCUDemThEbd2T8D+ezzg80f+bJWul43D
         HVda+3YgPyOTzGrlolnWuksUeXToU1KBi3A51iDbXMrbOj64OLD1i2orwEKlxUaJN0Jo
         BviVma9BWe1CYS/yiH5QvZhypCPKSO8+yX2bYCZZUljYHsiyRwtPtWteZMnUeOiyKKDn
         pX78PvkNF5TB9hYdsTYjwpcahRiS5xrjFl+geVnKJ240zRLEuGQtzjhn9de/CD1ylqJS
         xqqWeBbVkK1Ih83XDC4FsoBPum6GSr7VicBGWPd91N6VtJY+nXduxwTrxogrDqHQa6Pe
         bvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=;
        fh=5GygYJpqAalXIOkmxyuGn+/XSmGSpNfnsyPifosPLQI=;
        b=Q6kExPfx4jmwWBpig9DRsRJlB7kiMl8VRrAyP8/thEyvIV1MKVBq9Y/c6pBmTZbrjI
         0664iNQUbbBcmd9EOx3fx481h6r63ZXnmF2j2X9jCm8dkOtj/LV0WlCG2i8XlPkR5VM4
         JpwBJfXT3lOZFw7wuOVeWtAH5OUX/sTepHL+BDOpTTUVx3FPczk5kZ1/F7xYXUekGKgd
         j6Psg6A0PsLEAwjx+hIfhUdIuscZfmpN01LwYSvTbNCSfVUy6Dy21DkGvaQab6LGjDWL
         Xs+uNjwspaY+MJQmG/2Hw5QN0uh4L0Cu+hc3x7y8lYBVjfDYA5V6QOe2zgJ9rayEY2Mw
         4yTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795377785; x=1795982585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=;
        b=Tod8UVHY9KT34rBh6EZ+6nA5i7kceQvX/f/KEeuq11MDnSYvV97/hTi6xjScL0jEJo
         6omu+P0AfHzVvApL0FqpVT++KCbdofG+m1S/4w17g9Omdo4LUSbekHuumvvbUqezILf3
         fsaYOqWfP6fcDwzuh8dkeLmoqEJh/KTnO4IN+o5WqVrQjAeqNnYHufEEEySR8I8/vCUZ
         DCpdpvrzu9N5XBCQkImbkIUHERxBBhRDoJhxVTIc65N8rjnBISFvvYvou0b5Mk5CEbk8
         EJI1905lBgJFHmrzEi24ZqhtEGAri2ovSpZuEEmlhtCZfQI3a918osLVF/b+pBysTbCT
         Sgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377785; x=1795982585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=;
        b=aJ9Ui++pN77LtIUA8NRQMzLpzVE57RCaMORAvE0YPTvK6uL6APiFoAYOiTDlzJ8Y9l
         ehq+jR/jnAIGacKoM/S6elMHhAMot5F8SGOwe18U9Q3GknLKuoNOHdBwNPwXHWMPxenQ
         Fuh5Gx83wMfycVG8pfujpGD1OjvtGnkGVmWG8he056X3il26eLgFHEPTol0palPlu/QX
         IFbUb5tqL7hux4EwXmygmRzH0ovlXG6s8/kxnrObEjRUsk7sdDbi3wKe/8wDuWnLVz1o
         of6sR+7p23PBw6kw4f+FWkKbQCfYM4fBa4cXIAOsXy1ZrFm8VdxzWe1y5nmD0CceP8hN
         DNhg==
X-Forwarded-Encrypted: i=1; AL+hErH8tXf5aEQzu7M4rHSrQOvoszgER8DKCbDXtluA0kRx/snnBDYWXuxteuL+qur2jcpCNo0rKP9eMGqord4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cW91q0wS4VzEVq6mNqTVREoeXk1q8BxR5zndcjsd+LsoMfHac
	8pwCTtWtGYlpe4JzeYLkGb/yDdjkOjkYlMFgpjaXqknioSf/d2WqI/rmRxl40NIKuhL4OuxQ3Cj
	vWp+5d3uf42afIR/0zYWip/AM2kNxXLWrQ5g0TMuYbD3bWQQec8d5/ma0JlgefitSozSjEAuXio
	QDigsL1g+Flhu8f07ktuWCik5cbT6H2bOVnggs2xlyog==
X-Gm-Gg: AZFdTZf99gG7yT+Aphb06O/Rv9IeAGWtnZAVDvxnYp/NRa+nutz2oRkU5zecPC1NtNr
	wg7XFCypWYRhoUrRYlFxz7BJocmpEU2FOgdlVcM+hSqbDfDUZrpRkUCsU+kjvGairlmv6qaNxSE
	bcW1VrsD0Myvku03c5niVWv9YisMPMkNRc8CLysm6q8+Mkj3dlYuyEJAeaLnhD9GBe0db8ShawL
	RFITT8/CGdorjT1yMTnK5ft+ZD2hs706lxmU8RM9QyvZLqcUcetzmQCYJBjahRpba0h9el6Hokg
X-Received: by 2002:a05:620a:8394:b0:949:75de:b22b with SMTP id af79cd13be357-949ba81a715mr1583870985a.2.1795377784673;
        Sun, 22 Nov 2026 12:03:04 -0800 (PST)
X-Received: by 2002:a05:620a:8394:b0:949:75de:b22b with SMTP id
 af79cd13be357-949ba81a715mr1583863385a.2.1795377784020; Sun, 22 Nov 2026
 12:03:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org> <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 21:02:52 +0100
X-Gm-Features: Aa3M54qmPp4TGqe-hJJ37DMHGOwtKCGfgNTUpZn8HGSt-w7F-HPYonR_mEW5WQw
Message-ID: <CAFEp6-3XFf83bT_uuYEvu4KVin2ZmS4N=B8EsJoJ9HP7ZDkCmg@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: qcom: camss: Fix CSID to VFE routing for non
 ISPIF platforms
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfXxRhXzRRffOVK
 kp3rp+KQzDryXyP+xcF3Wy1ujUM1aqadX4q3IF6nTfaErkymMcAjvgsouJp+lbABOubrgZQDa/p
 8hqLfMB/wDJ8nUTy42YMVSojSrY/r+s=
X-Proofpoint-GUID: sbdyylHVOuBX5dFHcJg1tTbEVdoN9Eun
X-Proofpoint-ORIG-GUID: sbdyylHVOuBX5dFHcJg1tTbEVdoN9Eun
X-Authority-Analysis: v=2.4 cv=c9w+0h9l c=1 sm=1 tr=0 ts=6b034a79 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=WXF1KB85Zuouuk2w01YA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX5NijWhotBwz+
 ch1tgrlpuuS1d9VeRxxjrdu3M7XQSJ8lXH8cY0sZUKWnIAoTTTj8kB4W3DRh1/e5HjSMNEWvFYP
 7f7Wh7O4ffflNfP7k9gEt7Fb8F0V5E/+UMCOz8AzkBi8ND0Oecx6ZQdTfuIW+yeZZYeQUlQOYnw
 KY5vp/IPNXTySr/TjUnQfpCKznAAikOPL1semtHQqvk15vV0rzRVM0Om53eSMaTMJPjpn9IXZlB
 nIG2DMVj/GZtHs2bsa5S5sZUwzK4Qi2P4eqkE3zYnbelzplHn1JJGXohS8yB/KJJgw7aQIL87Um
 L+rUBZu/H2IgJ1ACPwTmQ/MMMITMUAs9yS3ZOn9tZOHwDAij72Hx6TzB+dOIzK1fI+55bn/SmKj
 X4GkIgKnkMnRJLa0Xh6dJcvxiT4m2pxDHFJWi1fK4xEJZph7ctF3Eb+drSlGDlvpdQEl7Y4HdPJ
 VI7F9NX/OUD7wIpYxQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220079

On Sun, Nov 22, 2026 at 3:10=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> This patch fixes a basic routing error that has been present in CAMSS sin=
ce
> the addition of non ISPIF platforms.
>
> The ISPIF platforms can route any CSID to any VFE however this is not the
> case on the non ISPIF platforms.
>
> The current requirement is a 1:1 mapping CSID0->VFE0 CSID1->VFE1 etc.
> Demote the spurious poly-mapping down to its 1:1 real form.
>
> Fixes: 9229b53f9758 ("Revert "media: qcom: camss: Restructure camss_link_=
entities"")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 38 ++++++++++++++++++-------=
------
>  1 file changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index aa6d01d8fcb2a..060879a55e483 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5257,24 +5257,30 @@ static int camss_link_entities(struct camss *cams=
s)
>                                         }
>                                 }
>         } else {
> -               for (i =3D 0; i < camss->res->csid_num; i++)
> -                       for (k =3D 0; k < camss->res->vfe_num; k++)
> -                               for (j =3D 0; j < camss->vfe[k].res->line=
_num; j++) {
> -                                       struct v4l2_subdev *csid =3D &cam=
ss->csid[i].subdev;
> -                                       struct v4l2_subdev *vfe =3D &cams=
s->vfe[k].line[j].subdev;
>
> -                                       ret =3D media_create_pad_link(&cs=
id->entity,
> -                                                                   MSM_C=
SID_PAD_FIRST_SRC + j,
> -                                                                   &vfe-=
>entity,
> -                                                                   MSM_V=
FE_PAD_SINK,
> -                                                                   0);
> -                                       if (ret < 0) {
> -                                               camss_link_err(camss, csi=
d->entity.name,
> -                                                              vfe->entit=
y.name,
> -                                                              ret);
> -                                               return ret;
> -                                       }
> +               if (camss->res->csid_num !=3D camss->res->vfe_num) {
> +                       return dev_err_probe(camss->dev, -EINVAL,
> +                                            "csid_num %u !=3D vfe_num %u=
\n",
> +                                            camss->res->csid_num, camss-=
>res->vfe_num);
> +               }
> +
> +               for (i =3D 0; i < camss->res->csid_num; i++)
> +                       for (j =3D 0; j < camss->vfe[i].res->line_num; j+=
+) {
> +                               struct v4l2_subdev *csid =3D &camss->csid=
[i].subdev;
> +                               struct v4l2_subdev *vfe =3D &camss->vfe[i=
].line[j].subdev;
> +
> +                               ret =3D media_create_pad_link(&csid->enti=
ty,
> +                                                           MSM_CSID_PAD_=
FIRST_SRC + j,
> +                                                           &vfe->entity,
> +                                                           MSM_VFE_PAD_S=
INK,
> +                                                           0);
> +                               if (ret < 0) {
> +                                       camss_link_err(camss, csid->entit=
y.name,
> +                                                      vfe->entity.name,
> +                                                      ret);
> +                                       return ret;
>                                 }
> +                       }
>         }
>
>         return 0;
>
> --
> 2.56.0
>
