Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795790235;
	b=EaE2gCQZtdge6Vz/H5ypAreTJhZNsUPOBJcwbT3B3Tk9g91E5oJha2B28fbfP2qQaKZA
	 SAG8ZE+FoNOfOgZZnrr1sZsoMzD3dzm/mSOriQwGWFH4aJq6HYkbeEJwpm52klP2hR7+W
	 uFdG1CAbQG/+KdPsYAnPiBsn6gbLhMrhSsZwy18UBFBF75aie4oC4XsL/SDGnE1i3ROzM
	 bg+1Kao0pqa5ZlXs5E6yGgt8z23iybiz1l6+JMay6z6WWITOj36J3c0wA4WhmH1PVDKng
	 qWfX8k2C5BMAjFrFk8MBrW0oN830+pZ4WYLJB4x3LH/tCZ3cFjY4qS8dvl6Pd4WNDOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tWNqqUhi+1+BXB18Sy8VdaElJpWatihymQrBKDZIAhs=;
	b=eBXT54TCEOFDumGzizT7g8H8NziuntEibVMecUw5txkm1iBIdzR/shSVSWcwKWHlXYGC
	 MDfTa4M/puqogdOraSnyqKSe3HS2A5v3XNuUl2iIGOcJqhHcSlhHjaca0YN5wmAqKtD4U
	 gsNhX6MHYsfT99qCxmISm+oXv42LyEJkhDJYlZ3lixGPP08y6DutpxRmFfonnkvqt2lMF
	 7AG6wyCUOhVDyBlFmcBq7wk0NODYf0iWIFuyUCvUJ/3mdOjjw7Czu2e6mK8cUth8rgAfK
	 fqir9vKVymxQ0vLL3xtimualaPwwylevzn18J3QZhUcxcSA6JoLy01gfKcNlfghKa3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YmMgZ/pO";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kh8NqtIS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E97606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E97606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YmMgZ/pO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kh8NqtIS
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1U7a4018817
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWNqqUhi+1+BXB18Sy8VdaElJpWatihymQrBKDZIAhs=; b=YmMgZ/pOab9CSh5Q
	DVl3xNIexnnlIj/zQKs3hc/pzrbtXHmPn7TGlsdPgxAUpy9/ZzqKZ4LNPwnkB7vL
	F8Zk/BehkVn/5JMt0fWGJoklG0bGOCfa/wc9JsNLt4Nh42vD5wux1HniKAa65pDs
	kq33x6S4hv1O3wBgQgwH/3p98pu6plj+zdNMklwKniLieS21ov0TWTU+dwgrrFlc
	mN8/vqERjgEjMDnaGOPVx5XOuRn+6eOy0hkeN4PxrqQqcglQrxtCShhRBk2acWcG
	JSchMAdZmx9UuP6JVLmhR8gvpE3AF0lnUXSvtw04e9ompKow6crfj0ayXXuwBHOx
	6gfowQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dha386-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:37:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso6946880a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:37:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795790232; cv=none;
        d=google.com; s=arc-20260327;
        b=afkRP9D9DEd+gepGOuSjHzXg+3ZuYR7/3TtThhA3QKrop56PzX+YJBLU5q5cWr1aN8
         NwR6Y5IvxxkabGKxtoS4cL+UXNX7F1soriGdH9PAzPqZ2NCoCTzUqj+8sp148lvNPn3W
         9YeL5RMpzPl9aNCfSSwjCGAhLdFm/8FRnVC+CYK/AAprwQJ+tLK2jbVelBORh8ElGNi9
         OU+naBsOCTJrJ0NJx9EzIpnDkhJ048M+g6WQNvzq4eYaom6NmcPxFszXNIIYnn0tcGG+
         vdY1//kYD59iyIwYtzVS4nkF8N5hBRTOFK8/ttb2vk9lA3mV2qREPo4ItaWt3EBB/oxA
         ytYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tWNqqUhi+1+BXB18Sy8VdaElJpWatihymQrBKDZIAhs=;
        fh=+s6nb1lnHRwkfaGaC7G5IQQKdyHQimOF8QRUcr68B2U=;
        b=HBYEs2/BcSli5R7i469CQhplljaEdhfS5bKUJOUQudIkg/wpmKZAlYaRRaau6QIRpC
         8FeLuO7tImS7esYpK2YlmiThNHSMGmDFSpoBo1NntqkHbglaHi3gSrjpQsx3CSCmnVK+
         AJxGf2kc+Sb5h4CsGuB0+MtYq6Quz12mYCIGyLOdeWWoaBZMzFVT+h81igJ2rPe7a6pQ
         rHOW+zWOZrI5UUePsejC7MIM0Ip0ll6HDNY5L16msuGRUT+uygwFdNTvuv+coabO4oYX
         oN8GUzsX9BCdguHVH+4ZcGndUqDsywe3wVEdezJqCcTrUU9hYrA4CTE/AeZyL/5D0Nvg
         yLKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795790232; x=1796395032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tWNqqUhi+1+BXB18Sy8VdaElJpWatihymQrBKDZIAhs=;
        b=Kh8NqtISoZ/Vkw2OYJepH8g7VFszxxaC8+OnoQ4WraEetnJ1DKypshW2OahcEE7Rsc
         wozXephNpe3etPMFc8Znd/FYmSP1SrrfDXw4dDq8WnIvILj4/6GwWU6yvzIeoHZIB9Vd
         v6NwR5AaXVwPgZ+bX4JbzuLmH5zA+vKl/6YCQsxVqzv1b/p9a0ex6b7l3/o6EGJ9NU+j
         ohe/EJWixmDTuXPcL0RKN/OGmoO3Yfk6oRp9nkH3ydnAm0XrT6JWbPzxRJb7lXI4uXy6
         bfkXHDYbAnSuXfC0HN0nzZaqMFFQEno7fVECEMFsa8sceA0YV5ImJmfNMBxm2Ms6OqHV
         3xTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790232; x=1796395032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWNqqUhi+1+BXB18Sy8VdaElJpWatihymQrBKDZIAhs=;
        b=XWrn/f4pydAM2V3R0m6+2E+aA4nMkEY7nqcfRsGIromUjiV0mfPkvcwu2b6QIJljk0
         c9vIONE0vntcUu2yl8f5BSVZ8Var1wu/2ErMuPQzcxR2ZsuejXHVI7gIg9mQXn8VLnlP
         i1tqNoP6ZiVPkK50H4SaDvNP4CnmTJyQLfZjU8wirOJAVmP2HvNKXK6pWAfhSaLvBQHA
         BMyYoexzlysx9HIQJLXJ5iY2Lz7wPID2lCtCRL45nNH6kvlmjSxOMZBMGoQQ6E2Tkm3a
         Kvd+63YTAWJxTtkClSbWmTuBhA9kthlR4PeQne2PVL0cSbadFf9nqlolh5bs9fASAhmL
         Gjtw==
X-Forwarded-Encrypted: i=1; AL+hErFyzgH+luh05mADi1FH9XBHUUZyYHVPqlooPMBEugZiwgoY8BIRGdIlBjeLHw7ryR/mT6AbhIb0ntIg3sI=@vger.kernel.org
X-Gm-Message-State: APuU4Z89a4pKCTcGRxrMgGWZwgwh+uevWnMmIB5KxAlmWY/qqqKnJLEU
	TBA9Hzqem55Cu1WVOZKhU1Mv/0dr548b0X7Rl4vEU71aVSy9G8W3dhc9ain0FOeHN5LCV0SQWou
	3T1ogibk3yjtlyDrkWoIdOjcmXcXwkYakOUg8wy3/6hrAuSta3qmrWlZCARNk0PwaX7+8JYtWhV
	FtULsBtsG5wmeTYu6QGeOqBXLnBYzNJCSD9cAdQFQ1Wg==
X-Gm-Gg: AZFdTZc8iTzhFVe7WrL0J4JYuf3lBBB0HKW4VHZvxLP3LNPhkHSV5eribfN/hEorXNL
	f37CPPKAvJnBC824pHNFX5q1qb2ZhW9m6fWbSXCZev0/kuvB/vc2k7qK5AU3h1ECSw+viFGB91i
	kRsZAv2LO6ef2KxWNKhjRF2qPYepzBEdd+uzj1N75DOsOk+3xypx67w7g96w==
X-Received: by 2002:a17:90b:4a48:b0:3b3:af45:6a6b with SMTP id 98e67ed59e1d1-3b41c7b5e76mr24825945a91.3.1795790232078;
        Fri, 27 Nov 2026 06:37:12 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b3:af45:6a6b with SMTP id
 98e67ed59e1d1-3b41c7b5e76mr24825891a91.3.1795790231581; Fri, 27 Nov 2026
 06:37:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125182053.3915833-1-kamal.dasu@broadcom.com> <20261125182053.3915833-7-kamal.dasu@broadcom.com>
In-Reply-To: <20261125182053.3915833-7-kamal.dasu@broadcom.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:37:00 +0100
X-Gm-Features: Aa3M54rA-JO2YKivrqSDVD5rGdTwrKCSYiQ6IpwpRh3i5IBbuLuwM2MCvKhsdJ0
Message-ID: <CAPx+jO8cJD74g=u1bHEbFVDe+KuxfspukP0VKmhgOC=dEr0Ppw@mail.gmail.com>
Subject: Re: [PATCH v14 6/6] mmc: core: Add support for resetting an eMMC at
 system resume
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Lin <shawn.lin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX0jCS082m5yOS
 xlMN21Yv3fh8O1mN++eXrFPLPr0Cb7AJAoGBOxGRUyviCPFQobIahUQsQ381RTGa8Y3z5QPM6KY
 JNFPzTmg2uVTnmBCLbFcpFBj6okUTavCv8Z2SHbJTn99sgZrm6fYM1eQYsTe4TiRt3bIyVcnh5s
 ABhUpNhQEBQqRvQ7Ew0B1qI7caDgalymqRpc0fJG20r/2af1uKWlfyxAYdaRyH0f5Je29LUJx6U
 K2+nNHtf3MvdHKnwyfff82Ih0BfZKzHkaQo/ca5I9EPbu7M3McbjA2PXVmhtqVx54SCbChazB3s
 SXtotJIVdOQWFiwpwZlaPdoKjP7cyqF4rxFoXhamFoIUv9VKmoGWeZuWVv8AZLIunjW6X2IcjvF
 JgrKUDSPijh4+wdmpeI86SX+STVElRDyfsLkDdm7Bl6jkBtH2/1SrwbQB1XEXngUN2ZQlw0tHtC
 D7MlEYpC4Nji5nktg5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX8/XwSHO525fB
 +SAZGZ1ygDkj/DMw5F45RHrqXU+shM+XUKptJ2ebRl6DhlM9hZkMXxSkDN0dmVmg1GeAUajhh5q
 RJc4KJJPGe0S7C/GoJGGf3/7tOOZ4i4=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b099599 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8
 a=r6S0buWGwmKu9fT6DDkA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: vdEpJ1JbLBGidz-8RiDPSGileH48_4iq
X-Proofpoint-ORIG-GUID: vdEpJ1JbLBGidz-8RiDPSGileH48_4iq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270058

On Wed, Nov 25, 2026 at 7:21=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
>
> The DT property reset-card-at-resume specifies that we need to make a res=
et
> of an eMMC card at system resume, assuming it also has stayed powered on
> during system suspend.
>
> To implement support for this, let's start by parsing for the new DT
> property and set the new bit MMC_CAP2_RESET_AT_RESUME if it's found. Base=
d
> on the property, we must also set MMC_PM_KEEP_POWER in the pm_flags for t=
he
> host, to keep the eMMC powered on during system suspend.
>
> Finally, to manage the actual reset during system resume, let's extend
> mmc_resume() to support the needed behaviour.
>
> The property only makes sense together with keep-power-in-suspend, as the
> card would otherwise be powered off and system suspend is refused. Valida=
te
> that in mmc_validate_host_caps(), to make the host probe fail upfront on
> such a misconfiguration.
>
> While at it, claim the host around the reset in mmc_resume(), as it sends
> commands to the card, and propagate any error from the reset so that a
> failure to re-initialize the card is reported by the resume path.
>
> Also clear MMC_PM_KEEP_POWER in mmc_host_class_complete(), as mmc_resume(=
)
> isn't invoked if system suspend is aborted after mmc_host_class_prepare()
> has set the flag.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> Co-developed-by: Kamal Dasu <kamal.dasu@broadcom.com>
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>  drivers/mmc/core/host.c  | 26 ++++++++++++++++++++++++++
>  drivers/mmc/core/mmc.c   | 12 +++++++++++-
>  include/linux/mmc/host.h |  1 +
>  3 files changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 8e9e61839198..9cb456a153ae 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -48,6 +48,14 @@ static int mmc_host_class_prepare(struct device *dev)
>         if (host->bus_ops->pre_suspend)
>                 return host->bus_ops->pre_suspend(host);
>
> +       /*
> +        * If it's required to make a reset of the card at system resume,=
 this
> +        * indirectly also means that we must keep the card powered on du=
ring
> +        * system suspend.
> +        */
> +       if (host->caps2 & MMC_CAP2_RESET_AT_RESUME)
> +               return mmc_set_host_pm_flags(host, MMC_PM_KEEP_POWER);
> +
>         return 0;
>  }
>
> @@ -55,6 +63,15 @@ static void mmc_host_class_complete(struct device *dev=
)
>  {
>         struct mmc_host *host =3D cls_dev_to_mmc_host(dev);
>
> +       /*
> +        * MMC_PM_KEEP_POWER is set in ->prepare() and normally cleared b=
y the
> +        * bus ->resume() callback. If system suspend is aborted after
> +        * ->prepare(), ->resume() isn't invoked, so clear the flag here =
to not
> +        * leave it set at runtime.
> +        */
> +       if (host->caps2 & MMC_CAP2_RESET_AT_RESUME)
> +               host->pm_flags &=3D ~MMC_PM_KEEP_POWER;
> +

I think it will just simplify this a bit, but there is no need for you
to send a new version. I will update when applying.

[...]

Kind regards
Uffe
