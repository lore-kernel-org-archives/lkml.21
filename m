Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795610158;
	b=0O1hDD+rvk73QdvDXdkKXPmOAj67WKGleEdpyL7WeqP1RbCThsFfIF3l9QHwuyj1sLLh
	 Dc2KkpUZXGMNl92PR/0lJmebEz5cgNcbKb6ujTb14dFOS0PpShJ98NErxLkA4DLMmLkca
	 slxx/OK3MXti80L1CdJPN8Id8wgHe4faSkkjhxdhWXdUtrDoinwp5Z/Hyl3L5iDB4sO9n
	 BU7yegVgVY5TZLbN24ufMHetZ4mKYWEp/5tEVjjfrghfq9qYe0y/TQMpBrConiDzSNC5E
	 dc/mNzuLxMHeU+YeOj2HJ0oWcmGTTVefuwNi3hZ9fpxoC8zj0vJ9aX38QWYS/Lfh1KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610158;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+3Wp0nakT6agArNabE9QzN5k/sUhhh9EJvtHBgL7nNM=;
	b=bTatxuRdIIqr+N8Xc/NDd3mJ66wpKJP+fXA9duixjOfskhABpMyW1heEJSHUBZ6FCQDY
	 l5nXxSBTd2uI+LpmreySYPDLepKaojp4J0zwLJ8RXyXUtvOwS9bM6ui9zWwIVez2aLaDV
	 TfpgdbTcXrgUXiLmWD45bPT107cHeui82yUFjFh3LA0HEtqSbAKp2iDkSG7ZtQSgkwgru
	 SOLSfN0hyEhn9/TO6CdBcIlVwLOPHc+ZrZ/ERqmIMyHdEGe1+j+cRwFUcJi7Pvoe5TgTS
	 v8aahaW6VXCYJBcvQeRqGUADEPLqF8PJsrsiECzQyjDSEAjltiWviuf0LUTsOQfGJ3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LagV5qZU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HzG5QPhC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F32606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82F32606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LagV5qZU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HzG5QPhC
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mXid2121347
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3Wp0nakT6agArNabE9QzN5k/sUhhh9EJvtHBgL7nNM=; b=LagV5qZUOt2uWP6h
	u81683iqi1UCjTeQxGnUvJ2fBiBtCRMEs3p56yQZvkBc3ZioolvXxbqZ36uXp+wF
	zGbUwFlNFlUYXCtONQs7HCeWVQTs8Xv4pPajs5B9pkloApMnkfUjAySC0Up0pEFn
	AcK/hPz1BoWbDEqBGlHMN4SB+2zjAmGnrnxuEWTLEhim9I6I38LC4q7im90ApWq8
	AyBXxZuLi7BfE/5rKlJDkEj510kmldyFZHE28RP1a3Dhln5p1LD1JYR7HsAnvZhs
	OqW2W1TpNhM+fS11eVw5AEeG9AMgClfvwBF9W29/KZpHJFBC+KIKMpVcNxdvJi3H
	CzxowA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukru2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:35:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b505a2bb1cso21081a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795610154; cv=none;
        d=google.com; s=arc-20260327;
        b=s1DJ9jhTUcQ+mn1e5Zrs5Cobu/i+myNEmtx/wUi0zkTUG5pnrDLI5rD5IdgXcVdR72
         U+u6HcjM1tNuq2WyDqKKzZv9+CC6SAkEcvmY0rtlT4+aepr0kLdWVkuHu4X+08xNu0Hp
         ZREOdkcGwBt8tii5vkv8vDONQWWdGMCpcLXPhlYaTXRZdFsFo8hfUYYfdwECVFO48jZr
         Yxu+HOI0EKb060jSbJAXwfdhAkJsSygQ/TTMajPn/fA+iCkK7h5V06jNH50zsA8e5hNS
         jL69byYt8+5F1wDQor7cd0E76FLprTUxzlR9iKDVnG36X+m1M2NkbDnqroX4X7cUi628
         M+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+3Wp0nakT6agArNabE9QzN5k/sUhhh9EJvtHBgL7nNM=;
        fh=umI/iAMAZuOsJzc4B9z6fx7EOKR42AhehZ5fNwO3i60=;
        b=p/hXyxs05pHfGfsox+zrHKy8/YZrHYMudsibEDDNwOmJMbSkWuDg9tfpRBqejVNVMZ
         DZXZDPPbvRV3mHq8l3V6DbappxD7XX8mvei1Jz4BTaab4pO76CMij72B2n12SY85lDAv
         Md+fz2bm8iKmJg5Kt2IStTksH9U49qP8Ax4YOO7CgM+vfX+UhLkP6GAMEny6hJzGXFEh
         +zaA3UzGNKCi/r70trab6Nk9lUkj1pcCTVnxt0X6a1DdwIO/gbJONXEMJpvGL/VdR/bH
         sdiO0ogSnV9zBpc0C0irV7fqe4G72kFjqDH6tydRxTgzZ0sa72W0nBsF9F9REdqa7fC+
         2Giw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795610154; x=1796214954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+3Wp0nakT6agArNabE9QzN5k/sUhhh9EJvtHBgL7nNM=;
        b=HzG5QPhCt1Uh6qJOHwOrpu+F8mxlOOvrIQzSU456yhyUVSvqETieYysI5unaSIbsYp
         UbRRi2IEC9jQEF05HAqsUBOA/csjD7drHvDuPAiVWZi6QwwDCiuGgt+PYGfKLp80yd0o
         eI0fLRuW7vBYPH0F+9/pYPKdSzA/fE9bSWZk3d977r9fgUi0rRImEzok14APxG/xdc4q
         q4ah2jwloAD1AXuM0l2AEBvrBMswherXPwjBwgZSZBDS+tNTfc90AwEbZvipLaiFet1k
         BWXCkKqMhbVdA7Lv/BNYpz5SVqQZ9Q++UWXBrx6DEUsPuLmSJB5mw5Tda1VyHsbmuOEm
         KGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610154; x=1796214954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3Wp0nakT6agArNabE9QzN5k/sUhhh9EJvtHBgL7nNM=;
        b=qUPCONph7CbvGnead1NZo86G8yzuczgL8QGw0VyaQtWhiA0XgSPR/RW5WjAuAXHuSN
         +DLdEwd1u/QVvIt7ejkyIytX75gjAbP0lq2arYC2BHYJzybMqM6+5n/T/GbyVmL0bPdh
         eiNRWONO4nA47ZYLY6Howy7shttFBYNq5rxErPOEzMqaNHhhxZEBXDb7iNjfemWxJ7Wk
         p5cgrdcm+eAUxbnL9/B0UxFKcVfHQqwsccQTVGv5LDfZAJh+Z17brSMYKPep/G527qnW
         rL5oelhSuPBKaV3J4OrFOlBqZxcm85XCgKV61qsmbNFR4hZrxKPkL9RpsiqgksIeaQsS
         8tkA==
X-Forwarded-Encrypted: i=1; AL+hErF1g3UyOU5yesDFTTFVVq6V+lxGkVjF63AMwhMEAmfGWYqkq0naUNGbGV1iViKV+ZmBKM6XxmWqLFMlFkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4iJKKgKLWat6Tai9cgZbItuQKEpcLowExLaj0eN1FQgVayQyD
	XZpJJles+bdKgVagMNspXra5UdfyYsrYZVNB3YScIbNxr8J4Jmv3JKOs5Ygw5pbgEh1PZwjiobn
	GL5LFPv2fdCrANzmONA2a8DKygDZYwsc55dFCxNTOtDui22o3alUGPMpHmJuMcoAt9Hio6hzQcS
	J4mZace2TTKE9fBRvgmJz7bQUdSxCyUapS/ce8yDJfnQ==
X-Gm-Gg: AZFdTZfZuKcLcdI9z0QKRhTpYQX4X9SKHC4KHnCol8UM7XAKvGnY+eW9+W3yeVGpZnG
	Y3HsuURMW50PYE1MBr1zYg3RYES6LdciotGVVxhqgUzB31K1uXSH6uKhWWmLTO4D5GzDSc6ckFl
	jktbboZG0XFU3XQPUSKtBum2IJXDWB/FdkpTBXqPsG4lMHRJszx+ww0PjOSw==
X-Received: by 2002:a17:90b:2cce:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b41c909001mr16588214a91.21.1795610154196;
        Wed, 25 Nov 2026 04:35:54 -0800 (PST)
X-Received: by 2002:a17:90b:2cce:b0:3a4:967c:6947 with SMTP id
 98e67ed59e1d1-3b41c909001mr16588198a91.21.1795610153699; Wed, 25 Nov 2026
 04:35:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
 <20261104145502.2.I59b2ea87f07947037b772c49c277092c887f4310@changeid>
 <CAPx+jO8_gCHgkeTB4aQDRjs1xwvXCB=zFjFBHB_UwqeOWSUEZQ@mail.gmail.com> <cc9c816f-eebe-4f29-a8b1-32c967c27722@foss.st.com>
In-Reply-To: <cc9c816f-eebe-4f29-a8b1-32c967c27722@foss.st.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 13:35:42 +0100
X-Gm-Features: Aa3M54ofjiIlywJjaTlNlnZrdM2sYCijlbq0js0DVsDfwYEcKAT0z4AyXuoBXvk
Message-ID: <CAPx+jO8d58tCoEL52baYMzjJ9VzyfpVNhruKAhrHrnEwuOoJig@mail.gmail.com>
Subject: Re: [PATCH 2/7] pmdomain: st: add STM32MP power domain
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Ulf Hansson <ulfh@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06d62c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=8b9GpE9nAAAA:8 a=rfZIK_W7AAAA:20 a=NEAV23lmAAAA:8
 a=YQXNl9ZGkXhj2O3QN9AA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=T3LWEMljR5ZiDmsYVIUa:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: JXDMDv61cJxYTYH_ufuuriRvCfFbkoRd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MCBTYWx0ZWRfX6uGqSldJfY06
 8A5jMMfonyiX11NYf3Y463vTF3F9toTEOpRtHdtlxArVMqYI2XgldjVWnK+hamd/+zAMF+ujJwy
 GYJ/Iodi0phiI1fzmCnGMYByDHPknUk=
X-Proofpoint-GUID: JXDMDv61cJxYTYH_ufuuriRvCfFbkoRd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MCBTYWx0ZWRfX+ZwDXRXY992B
 EsoftVH3c8HKjgIzgLUCs0lCzctx9VNpKCYmW7yeozIcgXoo1Bjdg2mJxxtfFpkMGCbwyLunpo8
 L1HbcPbZsRIuc5ubyrc6YCj0HfK0b2cPWWFUSG/M6gm2bxNX2dyXGunUiMjQ26Ml0ORNdijwEmW
 4mcupM46Zwu8mOF+Ryk0XLAOuObtDCXjG+mtN2E+/2R2dUNqsz3r9jBdARzi6mbX8WzOsdlq4W1
 SAzlVpoh59M01P/PjGYMwTSHWOFMv1AOTsAWc0riYWyNGKv0RCiOolm29pyWZMMPtnAudJmNW+c
 3zC6eI1vO+xGby7AXQn/ajNLyCX3sVcPuH9ch0Qccdj2pFAcyN3Twzpwwh8hSaEw5zSDwBkmyx/
 lhtW4wepgHBvtXH8yawTHpEeC9rh0JJDl3lKwE2hsCZx90ltW/VmW6sQVMsy6RFomipqHQHUOSn
 RZb9YcR2GMmhb42ADTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250050

On Mon, Nov 16, 2026 at 4:11=E2=80=AFPM Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi,
>
> On 11/14/26 11:40, Ulf Hansson wrote:
> > On Wed, Nov 4, 2026 at 3:02=E2=80=AFPM Patrick Delaunay
> > <patrick.delaunay@foss.st.com> wrote:
> >> Add a generic PM domain for the STM32MP D1 domain, using the PM
> >> framework to manage attached devices.
> >>
> >> Make D1 a subdomain of the PSCI cluster domain, so active devices keep
> >> the Cortex-A35 cluster in Run1. Do not set GENPD_FLAG_ACTIVE_WAKEUP on
> >> D1: system wakeups are handled by EXTI1 through the RET_PD PSCI domain=
.
> > Would you mind elaborating on the system wakeups a bit more?
> >
> > The devices that get attached to the D1 PM domain do they have another
> > PM domain as well, to support the system wakeups?
>
>
> Each device in D1 domain use
>
> - D1 domain to allow any low power mode  (Stop1) when they are suspended
>
> - EXTI1 interruption to manage wake-up patch
>
> For example for UART:
>
>              usart2: serial@400e0000 {
>                  compatible =3D "st,stm32h7-uart";
>                  reg =3D <0x400e0000 0x400>;
> -                interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupts-extended =3D <&exti1 27 IRQ_TYPE_LEVEL_HIGH>;
> ...
>                  power-domains =3D <&d1_pd>;
> +                wakeup-source;
>
>                  status =3D "disabled";
>              };
>
>
> Then the system wake up for S2Idle  is managed by EXTI1 device wake-up st=
ate
>
>   when interruptions are activated.
>
>
> Moreover LPLV-Stop1 is not allowed when EXTI is "active" for OSI, i.e
> when at least
>
>   one interruption of Group2 activated.
>
>
> To explain deeper, when  OSI is fully activated  [1], i.e with full
> upstream for STM32MP25
>
>
> - the PSCI power domain Cluster Domain allows "Stop1" and "LP-Stop1" low
> power mode as CpuIdle mode
>
>     - D1 is part of Cluster =3D> the device is D1 domain allow low power
> mode when they are suspended
>
>                                            =3D> active Wake-Up for device
> in D1 domain device is compatible with Stop1/LP-Stop1
>                                                  the wake-up path is NOT
> propagated to parent domain
>
>
> - the PSCI Retention Domain allows "LPLV-Stop1"
>
>      EXTI is part of this domain (not yet upstreamed) [2] :
>
>
>          exti1: interrupt-controller@44220000 {
>              compatible =3D "st,stm32mp1-exti";
>              interrupt-controller;
>              #interrupt-cells =3D <2>;
> +            power-domains =3D <&ret_pd>;
>              ....
>
>          }
>
> the Group2 wake up sources are handled by EXTI1 and but they are not
> functional when the LPLV mode is performed.
>
> We handled this restriction by EXTI patches no yet upstreamed [3]
>
>      - activating the wake-up path in EXTI1 device when at least one
> interruption of group2 is activated  for S2DIle mode
>
>      - with EXTI1 pm_runtime state for OSI mode
>
>
> So the "ret_pd" domain can't be deactivated when EXTI1 interrupts are
> activated for runtime (OSI) or
>
> part of the wake-up patch for S2IDLE
>
>
> [1]
> https://wiki.st.com/stm32mpu/wiki/Power_overview#STM32MP2_series_power_do=
mains
>
>
> [2]
> https://github.com/STMicroelectronics/linux/blob/v6.18-stm32mp/arch/arm64=
/boot/dts/st/stm32mp251.dtsi
>
>   https://github.com/STMicroelectronics/linux/commit/d216f8439d14e0a11475=
495cf5445e05cc4a9da9
>
>
> [3]
> https://github.com/STMicroelectronics/linux/blob/v6.18-stm32mp/drivers/ir=
qchip/irq-stm32mp-exti.c
>
> irqchip: stm32mp-exti: Add support of pm runtime
>
> https://github.com/STMicroelectronics/linux/commit/4a4a20f5c5aae461a7a14c=
98efeddbc9cd08c672
>
>       irqchip: stm32mp-exti: Add support of wake-up path for S2Idle
>
>   https://github.com/STMicroelectronics/linux/commit/1d3b854e7b95318b67af=
d2dc16b8ff5fc060443a
>
>
> >
> > Just trying to make sure this gets modeled correctly.
>
>
> I hope that follow the genPD model...
>
> and if it is the case , do you need update in the commit message to
> clarify it ?

Okay, thanks for sharing and elaborating. Even if it's not entirely
straightforward to me, it looks fine to me, to model the HW like this.
Although, in the end you need to convince DT maintainers to accept the
updated bindings.

However, there is a fallback option as well. I think it should be
possible to drop the D1 PM domain altogether and instead hook up
"usart2" (and similar devices) directly to the cluster PM domain. To
allow deeper states for the cluster PM domain even if there is a
system wakeup configured for the usart2 device, the corresponding
driver can call device_set_out_band_wakeup(). This informs genpd that
it's perfectly fine to do a power off during system suspend, see also
genpd_finish_suspend().

[...]

Kind regards
Uffe
