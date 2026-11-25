Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607536;
	b=Ikk+OhZeQuIYi65zSaWj0CHBtg7peXM6X0Ggvdu6vpdnmFohCMqOB7FLWsG2AMy2JuhZ
	 5USaMqIyMvWVg4OqloCi/6/CYqj56l+coClWOLgv4awTov/yFzlOp/uSmjtSZQ/aOaE5O
	 qjeJAFZ2bVRxCXt70MdA2qdIhz1sdJmokTTEoHg38hXPAmRB7huaBitN5lxRJbkfmb4//
	 a/D/yrtL6o1qxFzsBgYiaqm0OJhGk9259yEFsMN0DZTMgBCrQBRjxFqqxcEta3HANXXHp
	 42PDdqdmWKtTD60LhH6d//uSbI1uGLHRXGEMYrHn38n+uS1NoTr2P4MwN4A7zNYt8Ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
	b=k9w6Z+Jo9r1tJE4md0JdC9Z7nw/y/bGmmTbdltnitifiVhVroLClFun7sI0vWv+i06K9
	 ZL+wW/oZRoSo5xMExEOtRiJnyDhvT5X41CQPaBfNTTmiab4RlX3DuFEnFxWnoeMowZfqv
	 JAvhA02YpOcgsmagO9hBJzOWtunzaLussTGMZyKw85PtE5wMCtKXURM3snflx7fn923Un
	 OmIQVr6vBUlBHCs8JtH2lDoRV3WMHuNAZUgJrXqiSt8UmbiPo8DAhPu0YQB2mCv1RWUzP
	 Tl63qZPzZsdwvgPM9Nnf9Frzx1CpYy3nam2a1h0QFfNKxfCw+yxIj+kQMScHVne101g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqBOILI5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D80606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D80606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqBOILI5
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so6630045a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:52:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795607535; cv=none;
        d=google.com; s=arc-20260327;
        b=f8QealnZvtLi2HWCY4Jb1cD5mKAT0y/84dG4/CnyEcnGt0F6+g56Zo2qZ2K3uqkwyI
         lwcjA6vJkVTDYJw57csyqa2JRcLuEFKPuQkqnGzrV9Eyh6Anr/EiMZnxDVzOZCWvRJXS
         r9Nc71H1zIuSWdWjHUAkix0O3uu+sQPTR2jqnfAstzmjt5LEqh/CSf/2efQ8jhJ7Z1p6
         Qgs4b2Mmcza7SDlCe9gYbdyTHpc2/jU17wI1deFVGwr+pyGjGhtFxYzMUxHpdKsappCB
         SCRZC1/qvkvIVX1MfntxgOIaZKV1SAOWNRXL/ugLKeSRLaUzNUHotUCPZ+yZ4hYnB6IR
         +eJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
        fh=NLOq0caJzHVB87K1YhlCxFc6AP0bDYx5p+srRsCUbA0=;
        b=ZlelZAvP0s0jTqc6IIf3sfXefP7zle0kBJVHmsCL4riRp9apfHIuvxVjnkjAq90F1H
         zzwY5eOizTCRoN/lMZf1UTe9bPJFfVjhcaMtzV1yo6M6oarkF8vBikUILerH6P6Qptt1
         p5IDECmadIaKZyyWQODkkMshBKe47AX+xrquz7a334mAGoGqS6Zkx81kMqMvkyE7g62m
         uHsfawU7N7zz6+xdZUGbiyrt07kzhru93Zf1ZcXFgXtIKtnTfrOFTQIQWem5NWCVMLTQ
         k9a/DYA07gP6hBYIajHCvZ/5rnCBrtJ74u9WqYzWU2Rm8IzBTT2/1ECvXr7nmOXHP7AU
         QQHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607535; x=1796212335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
        b=GqBOILI5YHt+I8rgrwlbLHY5BG3XvSU+r+LHqw3oI7Xy0/F1mDTEwsdyR/Vg4NAa45
         Lm5t/VP+Y3VLJbd4SMm6dsdhwLsOEkLXgBKY7IhDbCRVTJW2z5+dEGbV75/b+OILcqVH
         Htz/jZJaC1jTlUIovL+B41koB1HHMD3on30Sq24mS8XcpKvZn84VEQVDg78rRo3NexCv
         CfUpZ4w1ozN2VEO3DGF34fg0s21O2V/GL4YDulN54roVhEA0MtAJ5Rzer/ir/Fv35qKe
         X1ChbSIIuM5mpCM9ks6E4geN5r0vm3yNI4K7txZiLyzSdnRqWF00BxvnRVlU7gqrA66V
         x4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607535; x=1796212335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
        b=D2Dn0b+uihcPqnDUiEJ1w23l3IoZahedIACUN2AMa40oJUKhahVZro8kWv28XZjl5V
         DFIWKARq5gh/RtE1hvYW2ybCWEwnLxiP+HgJJwZ4gNwLEZuoEApA2qtPeOZfId+qnPbK
         LnmvPuJuFPWYHQJHenAhlbJYinGtp5cypA7d1kJ+xrNCjqsUpLRcsYH3DPGe6v4AXHLk
         xdowe5qiV41K1mo6EE7hYkLTPFQaGXHu83w2MtBhE9WjxrCaX0VvLcu2uuTaDPcu0wpQ
         HTOAXEOz2BUixRYZDqeNlEDkXkE9krKbXIIaJIkbgE0FvKQ/ybCJtyfSAGkkS2aGeFS+
         ID+A==
X-Forwarded-Encrypted: i=1; AL+hErE03DQwbFGfFvPRTS/IM77ubWxYgQBooeV+OhOZOUudj526A898N7Q+QgmUEyIzdIxYG6HZZPjA6R2trpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z87WXB/I7aMIqOG24NPwHTRyfsiiG8dzgqhRroZzD7XsvFhC2Eh
	g6UZitdRHhZJyn3qoinauejvUV7ACD4CzN/RC/F0k3B6StTqR3g57UETzM6tDQp4+6799HUeAdm
	PrMYJvJlQz4lylCPTQcj7og8AUP68Lgk=
X-Gm-Gg: AZFdTZeeklFJluZ3WxDHCaROUwm7BCQN7VF7VaBwe8pMHmQDvsc2RSqbC2P3Gxdi+ax
	yCuc8GrrKmQHIGyrVtYM2dAY+3+XMUnBfO2fnqeXUEy/Lx4AnUe8UjyY81d653dVXlEs9lE3FWy
	WZAzoJg0mPmudgm2eyYA2mSy6UhliChiWMPRoXY64FGjgCiiCo6PItbe73NQ6ZnF4/K6bWXxHV4
	xIgVRDDkBJAbzzPVr0QkXsS7GLhCJljE7pV76L81Et2LS5cFaeqRRMK4FGwlzAJUb6im06Cdl2c
	KqaTSxoiuGi0NKs26u5A6YAxQNszcVZMKgSiwQMIo/pajq0UsWMWFe5g1b6q1CCNMQeDHHH2/Ki
	E12+Or2VDJSGdKYqXse1bYQS5T57dd58b8ZqtkFKD3Hc97tZKg8YHBohidxCkf4VOy2nwPw==
X-Received: by 2002:a05:6402:a592:10b0:6b8:8706:8e91 with SMTP id
 4fb4d7f45d1cf-6ba37d6526dmr10123892a12.12.1795607534606; Wed, 25 Nov 2026
 03:52:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115103809.1288167-1-linmag7@gmail.com> <20261115103809.1288167-3-linmag7@gmail.com>
 <awVzJMLVw4wUSqky@monoceros> <CGME20261124232303eucas1p10f2da7a94c8aa19fa4e406d089c1367e@eucas1p1.samsung.com>
 <CA+=Fv5QJxoxEoKxRpm5Hisdf=y+VpmM-s_VBC1tDQ2FTCfb08w@mail.gmail.com>
 <3467269e-9929-4c9f-bc19-847976f49527@samsung.com> <awa6Owm3eDW3EitJ@monoceros>
In-Reply-To: <awa6Owm3eDW3EitJ@monoceros>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 25 Nov 2026 12:52:02 +0100
X-Gm-Features: Aa3M54p8sDF24v9l5vsIDk_y4hlZnLV9zBkxaSf0Tu8Y_d4WDzlfpPV0l4Su2os
Message-ID: <CA+=Fv5RttOgZp9vftYN2XfmV31TyC_o_eSejruM_bbf6v7zfBQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-next@vger.kernel.org, netdev@vger.kernel.org, iommu@lists.linux.dev, 
	joro@8bytes.org, will@kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe, Marek, Jakub,

On Wed, Nov 25, 2026 at 11:53=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Wed, Nov 25, 2026 at 09:54:08AM +0100, Marek Szyprowski wrote:
> > Hi Magnus,
> >
> > On 25.11.2026 00:22, Magnus Lindholm wrote:
> > > Thanks for catching this and identifying the interacting commits.
> > >
> > > I reproduced the error on next-20261123. In
> > > arch/alpha/kernel/pci_iommu.c, I changed:
> > >
> > > page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, gfp=
);
> > >
> > > to:
> > >
> > > page =3D (gfp & GFP_DMA) ? NULL :
> > > dma_alloc_contiguous(dev, size, gfp, dev_to_node(dev));
> > >
> > > This fixes the allmodconfig pci_iommu.o build. A full DP264 UP build
> > > with CMA enabled also passed, as did an object build with CMA disable=
d.
> > > The full allmodconfig build hit an unrelated cgroup sample error
> > > involving PATH_MAX and LINE_MAX.
> > >
> > > I'd prefer to keep the Alpha tree independent of the DMA series.
>
> That's up to you, but in my eyes merging in the immutable branch
> provided by Jakub into your tree (or rebasing on top of it as suggested
> by Marek) is really the easiest option. That way you don't have to wait
> for the change to hit Linus' tree and there is no further need for
> coordination or others paying attention to not create non-bisectable
> commit graphs.
>
> However looking at the immutable branch I see it contains both the dma
> API change and then separately various adaptions to ethernet drivers.
> IMHO the immutable branch should only contain the API changes (that is
> the commits up to 31f7e12d621b) to reduce the amount of possible
> conflict.

Thanks, that makes sense. I guess best is for me  to rebase the Alpha chang=
es
onto the shared DMA API changes and update the caller in my CMA commit.

As you point out, using only the four API commits through 31f7e12d621b
would avoid bringing the Ethernet driver conversions into the Alpha tree.

Jakub, Marek, would that commit be a suitable immutable base for this?
A separate stable tag at that point would be helpful.

I'll then rebase, retest, and notify Mark before updating for-next.

Thanks,
Magnus

>
> Best regards
> Uwe
