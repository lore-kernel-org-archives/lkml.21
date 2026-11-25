Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620522;
	b=0oJmIJZvXq5ZO/7UTuhpxw8/SbNuL0B2oZHPipH8bSre/rdDZuLrxHGlFSnk6ZNDhd5w
	 4GQrZAWrdE+7ktPBkoQPY98s/XGVopGkx6vniiXWqfHVHN34Imc6LGIh6YOh0z2uV1DLk
	 oFagsUHhSbEe1mdmEv/7WSEMSOhFO8pz5YMRUwURlrv+lrjyXCeAUQuv80vrbbDJxij/S
	 lKBgmuANt8lXxG98gpTdw1skXd5rlmbfdPh59xGd+hNUuggisExSR4qbDSj+JiRir3sMo
	 SJRuP59dh0Oah+/1lodNb99KjMBJiEYYdyehBnZ6JpJT68f8NleP4i99U/U5Ru8vOtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sQHzM2rknVr9bM5wgvQqIqYNbsW1RfLPVnXbYTp6XB0=;
	b=o6lPtyQCgOyuOLIJVgXsLnSHrS15nL1vB3/pt6zZtGsjdco2aBqUHd9UT4oaT9P0hQfB
	 LIlLWJRZ/N0Ok73G8BqhVuuqBsHIBuFytpIaGzVZA51LemQuqZLjhUv0+u6I7+aNDUTqK
	 HNhS92qRxRhIp8MTnMn3ler7+qv/goswwNBm9QjwuJihBqqZVTOxI/iO0V+8PIm45fxfq
	 oWDVAIiERmd1NjITIWy2iXgt2vg3FmcaBN5aAYPGS1YbZuXmaM37HgSLUMeRjuLpUptms
	 mwUugEzS36mUFxVa8adPf0uqCNtJvwgqmLPhNyf+7Uhjd5n39Sab1qMT3wHLjg/lIsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dcJeNz7j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O+jskw1v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAA8606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AAA8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dcJeNz7j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O+jskw1v
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEMCn3048157
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQHzM2rknVr9bM5wgvQqIqYNbsW1RfLPVnXbYTp6XB0=; b=dcJeNz7jBO53pM9b
	BWVrwtK7J9Fh2vzyGuYd2ROc95rQjRVUnpMNAi24cw4DUxj/qKO0bf7p5K5v+ppC
	WoLmdJU4QuDKlddsZsQaMlvb/xAfL9b8l1OwK3z99yl6iu8po4fNwM7HT01XnGiP
	uTsd53Uxewrpk74/Q0ugLMkY/MNDJrwmodDT5pCBAGsArM45yCsJEKBmE01NDSdQ
	H4Uu5WBscdP+W8zhFQt7BjyuS6UtxJ17JY55ZzWTChDwajmNvxhxkL8ZZhlyyjmR
	nxAfSF/aGTdDGjrFJe/RiqrxaC7jxsracyRrOMB8E2xc4brdgOAOsk2ZQdDgIRPI
	owy1tQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2bhf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:28:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b41b099809so5155832a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:28:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620519; cv=none;
        d=google.com; s=arc-20260327;
        b=FsuMAguDE0/peUew/Qo+/lAL/MV4YYoJgXCl2O2sgUPBSchrUh5w5a24cNgBRqAht8
         zjCJh8KDU2WrruHHHYnhd7A0J1nMPglEBSsZ97hGuPhseTOUdIQMkcB9FuRQSgoDLcRg
         OOL9BZDtBn/tZUQGuYB8JzTYYa8fxDPmMJaLOTiyrX1VFkqcClm0eoZbo2/ZnV7OR335
         /qILLRW6jEPiFxAujDBiKex5TPcMO1Il2wV8rlw766yUguJxweBvNIjObfFf3cLshwSv
         GpYjbirs8kD42nRlc+PEhIas55WXVKu2k85//VYhXwqIbZiL/SUFJ59UBo9SgUGeiEql
         IiCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sQHzM2rknVr9bM5wgvQqIqYNbsW1RfLPVnXbYTp6XB0=;
        fh=I0wX4YT2D7BTVvuGYYhPxD/xCeyoZLZy0TIXX/J4ppg=;
        b=guxNBY/YFh+gFdXPjA+g0D7D+1/8xAdPVCchHdjQsT1XP9XVLT27tK+/hDNHqxu3AY
         9VOF1Eibaz1+y9l5sL4dVPbW1TyUxL913agvbGgQdIa/yNq21mgxnHL6UEDJ3xBiWRHc
         24Mx1pdNZq1PvEv5b+KAKWaEyQaofgLzOSjtv4e4ESnSRMrCB8poXaEGqmWFfdoMgCT+
         MpTofwK598JfiXW2V5FcXTqPOOaXcZ0Pix+2+170BYf4eAnFaWbKGeHij/c2oYETGPI6
         72zbnj8YCna7bVCAJuxTjIEV3hpkEOq8u3W8tO8M7dvNvEqXIhkj69lJRMj6ZIv96U0O
         1P3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620519; x=1796225319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sQHzM2rknVr9bM5wgvQqIqYNbsW1RfLPVnXbYTp6XB0=;
        b=O+jskw1vuDcDijdNVhIFZdNonxaJ4JTuRnRckQWib8OCuNFiJuAejNb+jUyFj0Z41G
         GmkHW7tJH8ggP+toSv/w6eyD+cvAO4MUzuL28aKRCGWs/Q7tYt/5ejyjVWE5T2ci6cF+
         /BXPyl3zCGDYGPiP5+NclLmlUgO59DCJQHqJ8KaPIymhEswY1lPrx9Iivkm5vAH7Dh18
         lk7OwSxWYg7sT36GA28oCu8rQYPU7UL7UKXsTwHlBJ5uSajCOEg0lPT4Q2TimxLmV54/
         pPJI9t6SqJvZ0D+T0DLhq9aH/LZ5d3Vo7eXNfVJFw3/4end9duN1cKYNhmFzEi1hGExg
         KtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620519; x=1796225319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQHzM2rknVr9bM5wgvQqIqYNbsW1RfLPVnXbYTp6XB0=;
        b=AQpbDo2Gjo8d2lRTOUvNwGnVUJ/sRcs/LZlFsBNDptvZz5aif3BsfBxX2oK2CiRhvd
         yPHtweXxX9s1d48K9vvvWMBmdU48r8/KSOv1Z8upnnii/kdIc6UP/Bp+bqk/DpKdqb9O
         3WJoaPRlcttdwz6YwmLCIMd38YcV25yt+XRbfZfffemuPwglhur+uqq+hZ2viKWd1VQe
         nwAY99hhjs736h//gBkSp/KA+RzTKfIvv5V+oWS3wUnJJDAPXef0wJL0a3Jsw287UITH
         8J1+U6UISZpb8eoQtHZIibSa4mbvQb1V06ZXBfgpz9V3ElIolWDP9moo/wzwOYJtOSu3
         Vw3w==
X-Forwarded-Encrypted: i=1; AL+hErF/z2Top1TzdZwvnssc8ferucrkmDOQna9anKwYRrQT9aCgiM+o1xiP7IFpq+C0c/1BhNL4v19K645zNBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uj8d3LLqJHzn+tNg1tV3BmyOkMYzK82GguTDMSrc8tfJZFneE
	slRs7sq4tmlD/vnvw9HGV4P+Whc2sbMGEdouQdYcOwemQ4B+xxF7fvRMM0xNC8nFxSxhveMM9qN
	A//xjy/icZkngvB/IR6uviMfoRvPejLZhhCtUqeG24byeTsCy3nhpK5mZn++wxmBY/bbC0audZr
	d9iIQ3mZ7w8l3fOClAs6/3kf+dsha8bePYrULpPDcCnA==
X-Gm-Gg: AZFdTZfpc+4t+WaJCMeN3xDYLBpCs6jcewe33h56OusPci5xnUr11OKeD5c0iheU4Ie
	qMb6Tn1cEGPO4Y7jTUOyyU1eMo89uRI+4NeUh0c71P9Ai+XwR9sjlBF6QHlhQJcK66meO++g+MM
	BdGGP76I+KrbD8/TBfbNRlP/f9NgAHCFSVMNl69+7b3MUXrP3x3/tFImPU6A==
X-Received: by 2002:a17:90b:4a48:b0:3b1:2d60:66cc with SMTP id 98e67ed59e1d1-3b41c7b56bemr16095968a91.8.1795620518972;
        Wed, 25 Nov 2026 07:28:38 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b1:2d60:66cc with SMTP id
 98e67ed59e1d1-3b41c7b56bemr16095933a91.8.1795620518406; Wed, 25 Nov 2026
 07:28:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123084218.673382-1-b-padhi@ti.com> <20261123084218.673382-3-b-padhi@ti.com>
In-Reply-To: <20261123084218.673382-3-b-padhi@ti.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:28:27 +0100
X-Gm-Features: Aa3M54orfvOVvXWigsGrBuGRN--3G2MONDmqMcP_qizMGu0HQcaQbj1P0UCc2ug
Message-ID: <CAPx+jO9LhihGLHYSFR4Wd8GhOu_AC7tE49OJxrVEVAJyEDHhiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] driver core: platform: Allow drivers to skip PM
 domain power-on at probe
To: Beleswar Padhi <b-padhi@ti.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, pavel@kernel.org, lenb@kernel.org, ulfh@kernel.org,
        sid9.karanam@gmail.com, afd@ti.com, nm@ti.com, vigneshr@ti.com,
        u-kumar1@ti.com, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06fea8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=7sSX37EjNprRciGDyAYA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: N99zZ3nECB4us2TOSqQpJw1CzN9eOT9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX0vlC7/A6TTfI
 3Xbf1W2gEA3YYm8FYiDxPRV6WONCjRMhSKp/75axaf6FtnJvr1abkhw6Qi78s1D8lemmWxJkqbb
 rwoFij+Io4Ubjc/+KBICmO34uvl6/AdXJy69w0ZEfYX+iV1oXD2QsPKqLXa6H68WGdezfIlU0As
 ANlBXyzvrgFBy1NQ5SUKPMSt42ggvuO5VJ628KYbmwYUlWVTeS21DfxNnD+FuXw7TVD88jrzjQK
 7HDLlyJks/eLZ52+MnGxZ0rrsPV03BM51naBPTgHhD/jIJUPDxsvN4dAgK4b7tWR5gSfnbVqwN6
 U/IXVgnB4XgGr5j4qTXttC5CakCkHUOmneWk+hp8N5kP4nxWfJyPKGIxhteqZoO9S7TuvsiO91r
 nhsBk8zW5KIzMoH1q1AlqAxBetMK1Udx4nikHyYh58SMTILV1QnwWYRDN53k3wqZiof1jIvCCkH
 ditThFLrXUEvobgKomA==
X-Proofpoint-ORIG-GUID: N99zZ3nECB4us2TOSqQpJw1CzN9eOT9W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX/z/jgQGc/sIi
 4VAysYzwUQ53d46mdWI30MczCnj/STAiwMCrjjJ/8gcs7NQ2ZrusHnPkFqvQvOYHCFC7Abe/sIA
 mel3hkeFFvKwxvlWW4h+vD+SIW8xMJ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250061

On Mon, Nov 23, 2026 at 9:43=E2=80=AFAM Beleswar Padhi <b-padhi@ti.com> wro=
te:
>
> Currently, platform_probe() attaches the PM domain to the device and
> powers the domain on before calling the driver's probe. This works for
> most cases, but would be erroneous for devices that must be configured
> before they can be powered on.
>
> One example is the C66x/C7x remote processors on TI K3 SoCs like AM62A.
> Such a remote core's local reset must be asserted before the device is
> powered on, otherwise the core can start running bogus instructions
> whatever happens to be in its memories at that point.
>
> dev_pm_domain_attach() lets its caller skip the power-on by not passing
> PD_FLAG_ATTACH_POWER_ON. So, add a pm_domain_no_power_on flag to struct
> platform_driver by which platform drivers can opt out of the power-on
> at attach. Drivers that set it must power on the PM domain themselves.
>
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> No changes since RFC.
>
> Link to RFC:
> https://lore.kernel.org/all/20261027140751.2465743-3-b-padhi@ti.com/
>
>  drivers/base/platform.c         | 7 +++++--
>  include/linux/platform_device.h | 8 ++++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 979593e5cca15..6e7b803a50ab2 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1482,6 +1482,7 @@ static int platform_probe(struct device *_dev)
>  {
>         struct platform_driver *drv =3D to_platform_driver(_dev->driver);
>         struct platform_device *dev =3D to_platform_device(_dev);
> +       u32 pd_flags =3D PD_FLAG_DETACH_POWER_OFF;
>         int ret;
>
>         /*
> @@ -1498,8 +1499,10 @@ static int platform_probe(struct device *_dev)
>         if (ret < 0)
>                 return ret;
>
> -       ret =3D dev_pm_domain_attach(_dev, PD_FLAG_ATTACH_POWER_ON |
> -                                        PD_FLAG_DETACH_POWER_OFF);
> +       if (!drv->pm_domain_no_power_on)
> +               pd_flags |=3D PD_FLAG_ATTACH_POWER_ON;
> +
> +       ret =3D dev_pm_domain_attach(_dev, pd_flags);
>         if (ret)
>                 goto out;
>
> diff --git a/include/linux/platform_device.h b/include/linux/platform_dev=
ice.h
> index 3bd0f1f0d8704..4d1679c4ea78e 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -292,6 +292,14 @@ struct platform_driver {
>          * to setup and manage their own I/O address space.
>          */
>         bool driver_managed_dma;
> +       /*
> +        * By default the PM domain of a platform device is powered on be=
fore
> +        * the driver's probe is invoked. Drivers that need to configure =
the
> +        * device (e.g. hold it in reset) before its PM domain can be pow=
ered
> +        * on must set this flag, and are then responsible for powering o=
n the
> +        * PM domain themselves.
> +        */

I would appreciate it if we could be more to the point. We should not
need an entire book to explain what one variable is for. :-)

> +       bool pm_domain_no_power_on;
>  };
>
>  #define to_platform_driver(drv)        (container_of((drv), struct platf=
orm_driver, \
> --
> 2.34.1
>

Kind regards
Uffe
