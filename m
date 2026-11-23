Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436695;
	b=NRT44ddS6A7ghjp0NRSdDAnb9WZsTQfJIo+Sf6QJsfFgrp7+O+FNkCWbQbd+fMHXT5vZ
	 lBcCC86BnjsfpYddoZSCIu5xlV+M9d5MKLE9cTmjtsPKGkhuEX5TXY8mtJOREdIuGRvFt
	 oHayiBX4lxQtP+T1WQTthUJWqA4PtxOzLddPMRLDf/Fjuq5NqGExOgLXu8N+s0FjvsQix
	 HJqWHOpT6r+c2gMj6l4BPhVPaBmFKEZuvy+OMSOcVLTf1cP4dY4Y4DmjKtNn1hf1KCAjO
	 SbqsGeVgx4Y27dwV+evdvrQU1gJNG/MJaPkvoQVUvoY7wXvuvUMpCYFQECjwwNJJ0ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3JGEHCaGHgSI8BrKRQk6rt3qVFIqpC8XEVH84mN8VhI=;
	b=0FHnv9r1bVdH+sIVNoIQCH5C10Vhrs3XV+ysqVVyCTRAjl8rWb2GuT0OXtI6YWTeidHy
	 kv9eZfFSz2d/O2LvfY2wjHk4Jor6tGCZQ4RMWnuT9M5V0l8KdZKSdJeAivUIMVBxx3TSx
	 R9vJ188lByUNeUCI+EVENu7QiiPQHnSNsZYgV1BD334V6h6ut582uZj0V3zadeALBWFyo
	 el2u4DVF/dWGinTTQdPDcyp2veXFySTkrlSS9z3dO7nQ1P5B83Cs+GZPL7GFFU2PKmnIB
	 HmwmWMKeq9GxRaHpzO0kHHXZ5bQESfjii8IdfettaEIm+KzTa32MhOln+Q+3VR9wUpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=SMANlYAy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC440606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC440606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=SMANlYAy
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c506a231b88so443580266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436693; cv=none;
        d=google.com; s=arc-20260327;
        b=cQXIkm1tcmkwNniYb7urKhEwuVlLZlp7mA6Dyr4ws5ObZVRhlcJTWDU1Z93k+n2XGl
         sOg/L/Dfc+FqOzl5bDqhAz5aFqXqD/kETOgMLes+8i8w4rcqhdMkzgViIFUXN9Uq68py
         I95oVRtx47tPsVOXwgTMKFC9ozsqxKrOGVGfY6TVnBUmfd4DUTzOBfdkUb7YUEqRcuum
         CU08JVEtgEXTJ220sy8evvVzuNT3ffcGRPxs6K7Aqsr4yiJjJ8lkMcSRVcMKAi31qAVY
         hCNF85ipZ4qnaSsK7ANsL+rniD88ZrKKqx7dnkZMjFXtyngOftrQvuMHOwqCwNI3jewX
         P+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3JGEHCaGHgSI8BrKRQk6rt3qVFIqpC8XEVH84mN8VhI=;
        fh=IffSNSnPbQ0vF/fvkFCT1Et/JshfaS+Ow23XSr/MHNU=;
        b=qNxXmlIZ26MvC1ZdA1mKtZCGoW2ZtJC2grY71IJK0Fg12zCiBbqGNJYjdhwW3JqBK3
         zx7qZOR5v1cAr4rFMp+n9W1hXwSCuTJLuUkh2Fk2HAfKs2dpr7+COwHXyeCuqgsj263N
         fov2M6ecNZbrSsmSNvHFtYbqyiioPzPiPWheGbX0gfp51zJrDkG0vLQZDzSDV6a98F5s
         zOjwIw6pNR2dwaxe/SHVik8NYdycJ+qABEL7xRF8qZ2/e4C6AZWI/hTwhjruf3iddxdJ
         k6Dq7mh0TzG3huvMyYWGuXgUbetbw0ssVeXih4zYsCQHhMSsShlCnjkQdA8r4+g8Yngw
         YHAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795436693; x=1796041493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3JGEHCaGHgSI8BrKRQk6rt3qVFIqpC8XEVH84mN8VhI=;
        b=SMANlYAyDeGkrtgBxN1TqmHqif7PndowLtrYXDCvfpS41NPxmuMXJ6jsNNc1zmz0Dh
         VkzUSIlzCAUMjR57cjvMvGDj7JSQ7Is69x/ZRWBbNAbA/cj/RFfYVFVvpPQeICtt3kkP
         T1mLwgtcbLB22yBUoh/AG+y6olc7pVHR86O3aJYjIu1333qq4MMiicORUlMC94lpov7v
         0KqOJwjAUfYh2e52uWhjmdbTHyAhuFc66iuNpk1TntsqbqIWDmWN8KcVWyrAD+MZ7y6p
         PJuvWoLdC9Dc8TdGQmajQg4Pxk20AAkOctDJZF3zZm1dNFNIH+3FhrguLyx5jviyO37e
         8OOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436693; x=1796041493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JGEHCaGHgSI8BrKRQk6rt3qVFIqpC8XEVH84mN8VhI=;
        b=QQ15JyRDZWK+cG3cgO9VuIiyKztSmz9ZMgfGom/2jGH2vW8HCnjRSYqiGGvJ1jyfGK
         47nSmvAotW6UIRvICI8NOYgLETT4u6J+caBwYN/dHndH3lmUPFhYwmed1IdeV1GW2+lZ
         Z2QGXp7Ebthb2XUyd8qWZc/oh+c2RT2csNTUpV/se6+rfSovjsYaEkV8G+Ip+azRJu6s
         VkLnqHYVr2lvHpLQv2vHdiPQkV8W2w4nF4hbvn1YxSIy8PP4CHdvp/Hde3CN1c1tKj7N
         nakf137lnwCOJEQTC3Np8jdsF6F0yEz8lRkZ2bjgWM5v7kcd9KJ2FQpnjYJumd9VRqBu
         IUCw==
X-Forwarded-Encrypted: i=1; AL+hErEOTuRoNO+DChvpsgxXSDC2+/T0zWWabTe+kptafNIheBSqCvm68/LlTDrkdtvY/9ASaKDZs0w4MVLO6/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BtH7oq7AcVqe/ffkPXZC0Gtkf1vjzF7m+7sHHDf2C7UVzQBEI
	Pgs3PVUE04Gn+u9h5bsld8qqgzH3NDNKOZASEWDniFyfMVqPbVcEM9E+gJnAbIkYewz9l/c9z0c
	YObJSmB7RGcaF7SpyH+ouddfp0aYn7vxXlCRXqB7DJA==
X-Gm-Gg: AZFdTZesNu6TykWqZ2f+o7TTitIGPs5qHJV64cD1MyvPJBawDyPRm3iWBxWQn3q8t2Q
	ZsX9imXThX0FBHX4YKQX/Lp6QdkvEow3h0TiQXXQrJcjqRDumCEIEcsWA7S07BL6JXqYDRtsWi4
	71iMB2zCS7KtKJPBtNB4Lb6+15dA6xF4yZFj95/duosg9tdNbUblC2v26X31yWLxFj/BEaouFn4
	jZQ+JpDgsF20WKGI8w8/qdXK5Lhwutk5LYl8okmDQqAFieEqCmPowZpaApt9mNO9c6bmuAmDdIK
	SUPc1m3vMfOP8dqyz2/1eb00E17/Q3T+Aim63PUxQBs8CQ1YcMsSwXrDTUClQTxxd+6tuyhjFQg
	wZxF5R1LJ4dltOgaZy4zZ4UDF3Bcf+nBDyg+4HNB5e0ix8fauwfdALeFBClxouUaPx5UIw918au
	QDCknfvrEquQJUESs=
X-Received: by 2002:a17:907:fd15:b0:c40:33d:f06f with SMTP id
 a640c23a62f3a-c513aaad90bmr920564266b.39.1795436692893; Mon, 23 Nov 2026
 04:24:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
 <CAKTNdwH9QAgreJ-6+t1j_P1di4VyoMBSsFkf_g=mCi_-M8g9Pw@mail.gmail.com>
 <20260917221857.GA4056431-robh@kernel.org> <CAKTNdwH6E5=9gZHB6tdianC2+1aDv4wnLmvL59kDW-dR3a12bg@mail.gmail.com>
 <AQpdyd6hRl9cLAxBK-fEdzq0dcZsWpHP63dbDpOxcNQWCdaNIc4D3Mfi9Ll86jBVsbEVhr5-9EZzFHbkF6efBDcRUT7nXx9TH5Aeffy5DyU=@protonmail.com>
 <RWg2ZbGh-TJtEJMDWD9DGxBKsszG10BM07351ALdCUa9UL-IImPGxSYztcNF3kiRFVCA0x5cECwign-2lb56nPMGZQ5LVZhckY4-KTb5qpk=@protonmail.com>
In-Reply-To: <RWg2ZbGh-TJtEJMDWD9DGxBKsszG10BM07351ALdCUa9UL-IImPGxSYztcNF3kiRFVCA0x5cECwign-2lb56nPMGZQ5LVZhckY4-KTb5qpk=@protonmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 16:24:40 +0400
X-Gm-Features: Aa3M54pJDInt1dUc3UbuIPmLJ056A7-Am1qM49T-fqpCAj8EFLf-eta10BiPxGY
Message-ID: <CAKTNdwHOoG8j59X7z6j15n8TTf-A-+EQhvC+SqNWOq24p9vNLw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
To: Ryan Leung <untilscour@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

On Sun, Nov 22, 2026 at 6:08=E2=80=AFAM Ryan Leung <untilscour@protonmail.c=
om> wrote:
>
> Hi Alexey,
>
> On Wednesday, November 18th, 2026 at 10:51 PM, Ryan Leung <untilscour@pro=
tonmail.com> wrote:
>
> > On Friday, September 18th, 2026 at 3:08 PM, Alexey Charkov <alchark@fli=
pper.net> wrote:
> >
> > > Hi Rob,
> > >
> > > On Fri, Sep 18, 2026 at 2:19=E2=80=AFAM Rob Herring <robh@kernel.org>=
 wrote:
> > > >
> > > > On Thu, Sep 10, 2026 at 06:48:33PM +0400, Alexey Charkov wrote:
> > > > > On Wed, Sep 2, 2026 at 5:08=E2=80=AFPM Alexey Charkov <alchark@fl=
ipper.net> wrote:
> > > > > >
> > > > > > Rockchip SoCs are shipped with a unique CPU ID in their interna=
l OTP
> > > > > > memory, and Rockchip bootloaders use it to give boards which ha=
ve no
> > > > > > dedicated storage for a MAC address a stable one anyway: they h=
ash the CPU
> > > > > > ID and patch the resulting addresses into the device tree they =
hand over.
> > > > > >
> > > > > > Kernels started without that fixup, e.g. straight from the SPL =
in Falcon
> > > > > > mode or by any other loader which does not implement Rockchip's=
 derivation,
> > > > > > fall back to random MAC addresses which change on every boot.
> > > > > >
> > > > > > Formalize the derivation in the DT binding and add a Linux kern=
el driver
> > > > > > implementing it, so that a Linux image can use the same stable =
addresses
> > > > > > regardless of the boot flow.
> > > > > >
> > > > > > Only RK3576 is wired up here, that being the SoC I can test on.=
 Other
> > > > > > Rockchip SoCs keep the same CPU ID at a different OTP offset - =
0x7 rather
> > > > > > than 0xa on RK3588, for instance - which makes supporting them =
a two-line
> > > > > > addition to the driver's match table plus the layout node.
> > > > > >
> > > > > > Patch 1 is a prerequisite fix. The OTP hardware has its own int=
ernal state
> > > > > > machine which only works correctly with serial access, but the =
current
> > > > > > driver serializes nothing, which results in timeouts and/or cor=
rupted
> > > > > > reads (e.g. returning splicing a TSADC trim value into the buff=
er of a
> > > > > > caller asking for the CPU ID, or mixing up trim values of diffe=
rent TSADC
> > > > > > callers). Hence the Fixes: tag and Cc: stable.
> > > > > >
> > > > > > Cross-checked on an RK3576 board: the addresses fixed up into t=
he FDT by
> > > > > > U-Boot match the ones derived by the new driver, and the driver=
 correctly
> > > > > > assigns them to the network interfaces when the kernel is boote=
d without
> > > > > > U-Boot proper at all (via Falcon mode).
> > > > > >
> > > > > > Sashiko also rightly pointed out a use-after-free in the nvmem =
core when
> > > > > > a layout driver is unloaded leaving its sysfs nodes and the pos=
tprocessor
> > > > > > function pointer dangling. This is fixed separately in [1].
> > > > > >
> > > > > > [1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-=
1-2d16bebeb518@flipper.net/
> > > > > >
> > > > > > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > > > > > ---
> > > > > > Changes in v2:
> > > > > > - Switched from a scope-based guard to explicit lock/unlock cal=
ls in the
> > > > > >   OTP driver to avoid mixing styles in a function using goto er=
ror
> > > > > >   handling (Sashiko)
> > > > > > - Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpui=
d-mac-v1-0-ea9135270fc2@flipper.net
> > > > > >
> > > > > > ---
> > > > > > Alexey Charkov (4):
> > > > > >       nvmem: rockchip-otp: Serialize reads
> > > > >
> > > > > Incidentally, patch 1 of this series also fixes CPU thermal throt=
tling
> > > > > on my RK3576 device: apparently, the mis-read OTP-programmed ther=
mal
> > > > > trim values broke the thermal governor logic, which now works
> > > > > correctly with properly serialized OTP reads. So it would be grea=
t to
> > > > > have these merged.
> > > >
> > > > It would be great to have the sashiko comments analyzed and replied=
 to
> > > > as well if you would like this to be reviewed.
> > >
> > > Of course. One code-related comment Sashiko raised has been addressed
> > > in a separate patch [1] which is still pending review. The
> > > binding-related comments will need to be revisited, as I'd like to
> > > first explore the idea Ryan proposed in the adjacent thread [2], as i=
t
> > > will change the approach somewhat if it works out.
> > >
> > > Best regards,
> > > Alexey
> > >
> > > [1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d16=
bebeb518@flipper.net/
> > > [2] https://lore.kernel.org/all/20260916123355.4507-1-untilscour@prot=
onmail.com/
> >
> > Hi Alexey,
> >
> > Have you had a chance to explore this? I have got a working proof of
> > concept [1] for the format I suggested, tested on RK3576 (NanoPi M5) an=
d
> > RK3528 (NanoPi R28S).
> >
> > Best regards,
> > Ryan
> >
> > [1] https://github.com/untilscour/openwrt/commit/a622c1cf292f7a4bb70935=
21e25436be324fc1a4
>
> I've updated [1] the proof of concept slightly. Perhaps you are busy
> with other patches? As it's been more than 2 months, if you don't mind,
> I'd like to send it in as v3 of this series, with you as co-author.

I've had a look at your proof of concept. What worries me is that it
introduces a "virtual" DT node for the MAC address derivation without
a corresponding hardware block underneath it, which sounds against DT
conventions.

I'd like to try a slightly different approach: have the CPUID cell
carry a dedicated compatible string such as "rockchip,cpuid", with a
binding description outlining the added semantics for deriving a MAC
address from it. Then have the NVMEM driver check if the cell is
accessed as "mac-address" and apply postprocessing before returning
the buffer. That's what e.g. drivers/nvmem/imx-ocotp.c does currently.

Let me give it a try, and then let's see what other reviewers say.
I'll add you in Cc.

Best regards,
Alexey
