Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697431;
	b=fKGI3JeacbtFuT3ZSH0dnFUSDLQsXXIjbJ1EI3YI13UdC3F27AEZtvLNgNPwRFbmyApn
	 OZ/hMpE3JN3ruiQFkM/GcfpXkXhLvMhxU+havoi+zosYVrmC5EGThjndbYoE9Q0KChc68
	 dOAYGWOAssIA2vXkEdcqEHpCGySYrlKj9a7C14zupg9zOgOeXB+6AUblsgun3DWF1qGlp
	 DoYQMEqq1GA+cgFyvMW32w4/NycnNkcrLR1U1vnvPkb0+B3Fu+1L3w1H7mR3OJt54Hjd9
	 GOqewMOmGrZX8pyOmggTDkcY9FbGHQxG90hixgqB2RywHSks3E1K6uLeSA2a8VPId6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
	b=vg+kcbIdV7yxhudpK4KFERmu7CE/+aZU8EWvTYIAP1zLKGw5lSJxUgq5PoK2UJKNXfPf
	 JbMeoUrkm2+hSVQKhoVk1EsarWl3hqxfY6bJWDmK4/OteHqIi4CRrLD8KJTEdzKNOKbcl
	 FTnYJQYKJTwVmm9YQfzpJeVN/g5jf/7KIy+O+Ej5qdqxmd+xzPonKiyfwpddTp/ALlAsQ
	 5FsnM5zBUBc13YOkyXmoyAQUjtDRo7PFaNEl9TLMVk4GJLCugbd4CW3ewFjwlOS+jgIIv
	 IptmiTxbujF/wIzriCur6ncqijn3xNQzklaDSvWUAI2HSSWI1lfccR8IUZUrmm7N7Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiD4IfCS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEDC606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFEDC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiD4IfCS
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386b8f2f671so3866471eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:50:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795697430; cv=none;
        d=google.com; s=arc-20260327;
        b=UU5IC+0br9ijj5d+si0F0JyXNEPzrN6hrWmwT9yiZTiHCKrKFjvaMntgfuwtQ5+CYj
         XFSIovRJ57fJtOkmlN8pa+dmVqmRR+IHjV5d625mAlRghtrz3AdiANZyGEDaSVDc5pMx
         mR3u2zIkeyx6cTeBuPw6FDt4NdPyWGRirtNZqh6oSTodWagWH2fEvBvQhwxC+nXSXhYm
         vfECv7FfBWwZQKqX3FduWfSUuebUTxPlnSzOjr3+GpJcG7jrUc97nDA+YmwADqES8Jnb
         zRHvSdA+jwAcTdqsF2u/xUJXXvmvVFy2SxJm0pslGQZ89uAkfp22p5iv4d8RUbj5bOEb
         qU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
        fh=bwTOK7OoNYV3LgUS8zTQKKMYhWoVCmiBFUFhq+/kyfk=;
        b=IXfZByWAafa5RsO5iRZR1/RRpCGdjX0OlIEPM9Sv7KaQLWBTpxwMCWnEa9IoEydx/L
         n4GiMwoHvBwOzS3X++7n/otUaM/EaagbTX2B1l5p1TVqrPTwoTdHRFo/GVMUdIlioPwV
         TvCDeuZQr1Rshx+VR7aLueJTlHm1jJNd0hpePYh7NLzZnDCMB85ZBkS/ZPbhCPvqFQBo
         MtjfK2CD7OtsNC5bcm3MHivp4H5fsIRMw8wrPFpACnNtwLp+atv+i2Gm/xep1dP7Q4mh
         DztBRQ1ZJxufqqQ8O6jbBx8/nF7sRJHk/pDhFNLTIIFInbgrmYoqKRIHRWRuThZ22HIe
         fLvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795697430; x=1796302230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
        b=DiD4IfCSj5LI0ZTuvV8wtiF82UnMDxvfjqUBavKh+wVIqS++D7AZLaBSYRHijkLNdg
         86RpW81gFKtn7ojYeSCCY5VVpq1y2CuYHX92oXMBaEUv6d5waRxi+jUW4kLamrPDxvbI
         LBKc5jIrzyNzpVvoSAcNlK+xJWwhoAWPKBgP57pqPwr/hJurvYKE58bH9735sI5GyhG+
         q1wxDZFLvZ8Vah+5PEPGb1N/bdEoUhRCEeSdkw88wJk6KDFj//qMm4CXxXcLy2h6Pc9m
         exKd/xWsSMGEGmCcjPXa3p+W32B4TPRz4JljeNIR8BKB+ewNg7f4xVhSVuZBGB2zV+6V
         uhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697430; x=1796302230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
        b=OErPMDIBw/q5DasFlyQIOLXSTsy2ANgTEnecbkLpxgbQW+lwnAexjkzNT6j3S0Nj+L
         1wa6fs5aMI1IJW9WpxV+c3J4QB14YfT5gVTyz0wIin2pN2lFMWvkfljC0k5+VuuihP+X
         8W7lNq/EwMHBi6yWYwFvq2MiGR55VL4vKmUMCCsaKe/bn2r9Ldvv4quhDWOwEnd/NpXH
         Mzy/yndub+1YnKDNOm4ETeiLngK22+NH4zL7kRd0lK8wfJOfvu0bZK+Zq3eBJYfn1RJm
         Kd5o2S5cAlHE3/UXWIm7eRDyJvxZYu1rbR94Y6J4fIDUZ6gSGtDdrHGrKiIp9DGII3xA
         KaZg==
X-Forwarded-Encrypted: i=1; AL+hErHo6CFpT/zs/syPARrvZ6NEwL2ORTrL3fSeuvDEjJ6RVpf3zeMh4DlVg8kme6jtlqUX9h+6FenrRTthPng=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WvSBzTiLaSZdxjNbkv3vNwB79yX+PFJd+dePSLYLfBI5++TNP
	+EzhZng+hqPN74S+ZFfNh0Re6bxV1qXx14YqEumlpSz6TVXQQYZxKNEV03L1WKxT5JXMbnzGRyn
	iPOnLKJTmiitN4Sla5IhUcLJsVHuX21I=
X-Gm-Gg: AZFdTZc1D0RW5SklIibAZFPjw4oKilfk9QVmh3O3BjB/xbkHtw7GkQ8lzhESpS9k1ZR
	cYGyAWYXQPdJnWwgKbNYb4apAxs178cgV2YwuU/tS9P2+T+CEauQhyQNDL4KLr/WOrkQsHjkzdQ
	zaG7URFUjpyUasbh6yGkaHolOgJ7o3ByNH3EdR6n3KWZK1MQY3YbntvMYkOIXuyr9LdFCgpUZnV
	qBBjIoOcDYJmVcSQ6MMuEt7xQVyYppF93qgEoRN5apl++wz2IoEYdnK2aylj5NuCVCxbG2gKugc
	e8oZBR11gKmf4q1QfdGR1lILJSUYO9V1oGRW6ljwyNsuTuosY24RjgpS/kpplbWp9THCIEbPSxu
	YtdSx3F1jkjqzFQ8re2quP/rWcq6vjF8fwFPZRPLRQYTWhYSurNh3703EdgmIe4Y8Xhwc1cCoU0
	IDpChNN2ZjKY3nNmA2L0/GR/bsOfWArw==
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id
 5a478bee46e88-3857181d8ddmr20532737eec.41.1795697429793; Thu, 26 Nov 2026
 04:50:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115085826.89641-1-clamor95@gmail.com> <20261115085826.89641-5-clamor95@gmail.com>
 <20261126114728.GG38590@joneslee-macbookpro.roam.internal>
 <CAPVz0n138PXP88++q4QXiao-7=nzade=e_jAdfKK0_xsEyPtFg@mail.gmail.com> <20261126124719.GJ38590@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261126124719.GJ38590@joneslee-macbookpro.roam.internal>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 14:50:18 +0200
X-Gm-Features: Aa3M54royAl1sABN4xJ1Cip7AOIlFSUkJQoKYmmC67r_RL_cs_moDjpaDX6PwaQ
Message-ID: <CAPVz0n1xgOqusgO23pXzZdaq0A-j0NyX2PvYPyzrzrqUfYM+3Q@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:4=
7 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, 26 Nov 2026, Svyatoslav Ryhel wrote:
>
> > =D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
13:47 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
> > >
> > > > The AAT2870 supports a dedicated main power supply input alongside =
parent
> > > > power supply for its internal regulators.
> > > >
> > > > Add support for retrieving and managing these supply regulators
> > > > (vin-supply and in-ldo-supply) using the regulator framework to ens=
ure
> > > > proper power supply dependencies and power-up sequencing.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/mfd/aat2870-core.c            | 5 +++++
> > > >  drivers/regulator/aat2870-regulator.c | 1 +
> > >
> > > Is this a build dep?
> > >
> >
> > More a logical link, I can break it but it still will be part of this p=
atch set.
> >
> > > Would something that was working before, break?
> >
> > Other way, it was broken (aat2870 may have a dedicated supply) and now
> > it is fixed.
>
> Great.  Split it and Mark and I will take them into our own subsystems.
>
> Thanks.
>

Then pick first 3. I will send this as a follow-up

> --
> Lee Jones
