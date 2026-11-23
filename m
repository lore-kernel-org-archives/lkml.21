Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795450876;
	b=AVjBawwD4p84gZbxnqU/l5rbWny8WebLHwMlqYqxm0bFn5+viKD2TGfVROwsrZRmfFRV
	 Ecb/jllphtNpJcMDjAOu1tCI3cPf6dnVsmlwwSh9ETjuNdDoidrcjkWBBoKpvpu2C/xVy
	 79fjozgwgUZ3nqq/t3hbl3eRXYBVeg8tVyuwkdh+EaXnV5/qUNwDMmpnjQo/nuIDbWJca
	 uojphhAZTovvmAK19RMGhvy5geD4o2H2MBBN5yA+PDS3OfOwhz89ZCJS/ee4A6l+KTtob
	 Gh1EXtgr5xy2hWTCle3yc43y0F/1bc/bnpW5JP30+yQqvuHDqWQp0Ql0Q4Dw2djpNaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pk67/hXS9CWh4vlTcztHypEGoxMFfpG8vfbm7E4XmBY=;
	b=evCNhLWqjl6UTUdctMiHVM9v9i2f3X1tAN/gA0lsWuOPwk83iyYWciv9qUh7KXpaTEDX
	 kmgAKiDkei0dcHnJ4xDIGexLKWLfTzbOGfSjYgDJ7L59VbcXV9WIXXeZo2X1u9dtdaGST
	 bIWe2r3HxFITxQ/FB0vwvv2318dlZ/9fBqr/5zhJ8Nabh+qgMHCKAHXT0aPT4nddr7TLC
	 oUbZvF8+CqKSwePANAlOcwXR9ZaviUaOJ0aaEd1zYK75i0O2KtfN5YkowypbdhSQI6R4K
	 OakaTnOwC6JcdjQ/5HqH0AyDpNfuTJGxWdrLTAL32WWGhyG/4jj7DX5ls+x9XyVzrGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUNHin0O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A1zHvwHu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A10E606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A10E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUNHin0O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A1zHvwHu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGltm3730153
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pk67/hXS9CWh4vlTcztHypEGoxMFfpG8vfbm7E4XmBY=; b=SUNHin0OhRr3bhDm
	CtAfmREiUshcu9bxq7PMGoMcyYoE03SfrDgJ0hqiASjaqsLtV1Jk+mAWywtR4czA
	KjbVxkG3VQjfS/SIxkPyhKpqGcXWkcispE/n8DM5ZKQGHqtrIXBmOW4eEmoDPzOZ
	XSTgJF0cl55LL4iL2Pv3Szag3X3IrqvoWxzvfvISb1sxffxe0WFQtEkLHyPx2GMm
	wzD2BHy0v+CQ1NM1JPKZ8C72CY3+G2+Ht9/2yfD0EZrrX5Ty3HPOdbqGzPFrpqNH
	tpZ6hSMGUHFb7Z/MPEQ8es5Wj1roZsmWcqqbNE8LQvyY90Ahv96yLSjB0wIPxgTk
	eOGPBQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2bqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:21:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so1905947a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:21:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795450874; cv=none;
        d=google.com; s=arc-20260327;
        b=j6Q93JwgZ4wBYL+XNIJT5+bq89B1A5HwDHMMvh46drpbWZ3jYg388Eu4i64VbM25pJ
         NE3L/byiO3B7sKKaoSl63Eziq3TZ9MCV/llCmYWgkxy80gqvvsnG6HEKRusM5ihfjBIv
         2iQRWC3XR5KId9fpxqLmFtB8XZS6kO8PG/BjjGthcsx5fPky3NSQJ0nJkWkg7x4sZSa/
         yPdMqEWyeN4K0vRTaYI6tjWerin5dyYaNmPS1FVNCF8iV6kgptgXv4x9WDJc9B/+5pZ4
         BhBov6uGDHroVjfKOiHfXT9g0lx2VGL2mdD9hRyyTlCrf2lcZK14fZqSb1/ifKkOlG1T
         iGng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pk67/hXS9CWh4vlTcztHypEGoxMFfpG8vfbm7E4XmBY=;
        fh=v1WJ1YAhaOvhxuLNgevSuOlrG02RQPZzY57ueDYzz2c=;
        b=Bu17BXOa2OGqtVNc+ZKG92ympyGUQRmDm41uimKNTHSiK4b3bpDg2+Ojfl1HRpmMbN
         uUzj0P67tgwqfFNH7Iwlkk36W4yF5+bn2vlkqOxL1lQG0GteRjjk7RzwesxXN0PpKGVX
         HCxMu5vwAWN3QwCOtA+aNti+DlzsoKxXESxoWoiU1Db+diUWRN4iK9Q5NupWeP1SIVgx
         OFEL7IsXtBoHYIeEDenXkHmPlsG51lwstZHQ0tdSUctqxboMNP06XdwxTwVngpjQCYki
         PesUSwvh6ppO6q3JeXVWbWa/pW1xlVinx39q/Niu3FJaIz2KpWsXJ4m2hz2w3TeUl2pt
         Tzzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795450874; x=1796055674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pk67/hXS9CWh4vlTcztHypEGoxMFfpG8vfbm7E4XmBY=;
        b=A1zHvwHu4ho0BioIlPVNcen6by5M+AaLJb76KigsDbRNdWIHWFf1TJjLjd4BliJq0S
         7up/DPRjMjD33DcY/1bM9BJUf0JLWttTbM1uTedLKAsz54rhcN6TaXj82mJaHzFmaE2b
         nxkaVmRjX/d1EH3tptP+qKqpOFHtnMTmwU+C8ZqLxJvxdvb/M9w367ypqDkdWYCHDU8v
         hHD+Cnw9Ivd1P70Q5PfKE37yc84AkTHjxvzUGQVnWUGrFZ/mPzSokB49FrF4EykYqK4v
         HrC3Pkri7BLiPerw9B2GksKphl3BF4/TOc0MhPf9ohLN9pKsyJZJPtTvPcFdXLKMdAhP
         UGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450874; x=1796055674;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pk67/hXS9CWh4vlTcztHypEGoxMFfpG8vfbm7E4XmBY=;
        b=c8nUnDodTM4ssrwiTA4bYSrPVF3gJvYarwgtQOjA+0Nh+Z7kVrhW+Zg1V3++OudGyC
         RSpvUtvxelc/kuKHLrhvMlgDldjp99/x8NBd9MZJrrSU2EJb3QRWyETThS61q1WCSO+s
         neQ5Yy/paiZwrtJFtwE8uv8lnhJUN/ISrtPCuxqlxUcWvGvhdWa2BoDzxKTCuNGaJud0
         2Ig6wU+Vaq+HlidpAOTWUEAbv37wvQokZIGYogqlBKGgS+9rI/a5j9zr1b7m1exYKnm7
         W82ENGR+eUMozxlnGpjwREbm+TmX2iUpZyqDIGfDa8z7qlHkZPtDA7B+0cPHkHY07BLe
         IEKg==
X-Forwarded-Encrypted: i=1; AL+hErE4GvxNBYnl1MJc5X1FFEXiRJZ7JK0WMz7NBLaG3jDB5T+JdVYv/L9n+Rr7B/0cpzmpX4vEzbQZ2/CY8aY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MXy/kaHXcvjxUBw5PyShCt2LG+IfYVBeVfg1VAl35sSIibuT/
	SXfZyjLk2doCBf53aDnSayc56vB2GKkjxPpOGyccSIureQeYj8HjXZPHBFcwE0lLKloaVBoNw9M
	NqQZgnoc92k2KLjSU6cmLA9v8Z7NMyh/AJqkfsic3yGSm8iudrZGD8sLpwt9PL8UYtc6fl3PRyi
	nAooaFF1b2yCGltkU5to5NtYvGs4xD9T4ES9GuTkRzTbuJyDlQqg==
X-Gm-Gg: AZFdTZeTE35DydoIxTvorF3UVxLkOXkrv5YRjeRrEbg8gdfTmTDsN2pxJ7+OdJIna6e
	vTe5zPw500UlX/BDS7n8UG81qRmu6OgaQtBuCKdzaFsMVj2/V+GPIEntDjIFTHQNAU7Vi6u7u2d
	/2SmEghxtKdil0ToI11VUc3+X7s+BbP0Q76LIpyo6B+5Cx3gkVi+YCpQ+SFc/0s08UIidIRL6Dq
	E5NzrQHh+u/XZLy
X-Received: by 2002:a17:90b:3b49:b0:3ac:b048:fa13 with SMTP id 98e67ed59e1d1-3b41c9beaefmr11525932a91.67.1795450874068;
        Mon, 23 Nov 2026 08:21:14 -0800 (PST)
X-Received: by 2002:a17:90b:3b49:b0:3ac:b048:fa13 with SMTP id
 98e67ed59e1d1-3b41c9beaefmr11525901a91.67.1795450873365; Mon, 23 Nov 2026
 08:21:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179259111932.19580.13027750156272888992@gmail.com>
In-Reply-To: <179259111932.19580.13027750156272888992@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:21:01 +0100
X-Gm-Features: Aa3M54p5hRWYEEHgjaTJlT9_Lb0ZXa0hS2O8Lw6qo7tyI0uEXYOUPeVJEQxKehY
Message-ID: <CAPx+jO8xT3thJqDfTGNDdEe_EZ7fL5HHP-gjy3uZJtvemmNeyg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: clear states after freeing them
To: Anfernee Cao <anferneemelokc5@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Ez_QVSRaSEhZCSqAqlhDPKrHjC2kAMX2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX//zZpBCmTRfS
 p8BXikkh+eiZDcWXvszCnWOS1vooj7l9rdNoyT52M6gzwMVhdwV/RgiOVDg7zvG00ytazkB28hW
 P0eZcPOTsE74caQjhZrtyye2nNXPaXt3tp62lavsZbH6i1zbhW5su48FqxVrW/K1ocgF2P3rCjK
 /CroMDmAz6RVt6bMjpm644z1Vggv94e8asnm0Bp+Ldi6e8k8nbacZdnZ44Y630EnFXNQ9G9dIQA
 CMqYgkzCBZHGzs/6759AGE3+ghavTZoL8oa+RL0a/NpPIJ1gvK88/zK0VDTOIHKHnoMsGAfTP+5
 bJvPo8zX/1h8r3EGydfP3rBBSU+S1D1QQBs7xgjW60gv97bYViLiDQt500Om7Pole2BRzTVz0nL
 SSsl21r6PzmG9MZGq89AKcQgOdDdimeDZmM5FTRDB2KPR18nGaXTJxi0e83AIk6CA4bWOUQSYYE
 J5FnUSZy7WLrevmO/Aw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX4RTibGheDl2g
 QNEwslR/7eYCp7uJKisjjIDFVrPap2GLyJT8HVLKgsjnfr95TTL13PKFoEmOFybhVcWopyuhMcP
 35UokFoOxQ0BXIXaMnCGH7X5nVnaETA=
X-Proofpoint-GUID: Ez_QVSRaSEhZCSqAqlhDPKrHjC2kAMX2
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b0467fa cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=gKRGjSYNajUN44eR1FMA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230065

On Wed, Oct 21, 2026 at 3:58=E2=80=AFPM Anfernee Cao <anferneemelokc5@gmail=
.com> wrote:
>
> genpd_free_data() frees the genpd power states through the ->free_states(=
)
> callback, but leaves genpd->states and genpd->state_count pointing at the
> freed memory.
>
> Providers that allocate the states themselves hand them over to genpd by
> setting ->free_states().  When they fail after genpd has taken over, they
> still run their own free helper, as psci_pd_init() and the RISC-V SBI idl=
e
> driver do:
>
>     remove_pd:
>             pm_genpd_remove(pd);  /* frees states via ->free_states() */
>     ...
>             dt_idle_pd_free(pd);  /* frees them again */
>
> The second call dereferences the freed states array and frees it again,
> causing a use-after-free and a double free.
>
> Clear genpd->states and genpd->state_count once the states have been
> freed, so that a later free helper becomes a no-op.
>
> This issue was found by manual code inspection.
>
> Fixes: 9d976d6721df ("cpuidle: Factor-out power domain related code from =
PSCI domain driver")
> Cc: stable@vger.kernel.org # v5.18+
> Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 052ec478dfcc..12db69f53aee 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2353,8 +2353,11 @@ static void genpd_free_data(struct generic_pm_doma=
in *genpd)
>                 ida_free(&genpd_ida, genpd->device_id);
>         if (genpd_is_cpu_domain(genpd))
>                 free_cpumask_var(genpd->cpus);
> -       if (genpd->free_states)
> +       if (genpd->free_states) {
>                 genpd->free_states(genpd->states, genpd->state_count);
> +               genpd->states =3D NULL;
> +               genpd->state_count =3D 0;
> +       }
>         kfree(genpd->gd);
>  }
>
> --
> 2.54.0.windows.1
>
