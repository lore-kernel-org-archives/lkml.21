Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795241025;
	b=vP5bju/+YBynzvdQf/id+tDHhh+KbtL+8J7owCYBE8uXolY+uSPj/biK5Uo6HeuS21PD
	 8nzWLg0UpP//vCB5CdP5UbY/dSYD6f9rkTwro/8lOrdsP53HBjC3HAqOi2P5cPQMWB6is
	 uA8kyXtfKZuDjb+HWDM3Vwg3R9WZnOQS6tKXQvjB95NU5h+ofYChWBCPRKsn+CgmV2m73
	 D01XmBJInAUQ1DEI8fsdktjDSVtdFFxxTltrYOiHRoJbD7XrjBfToNQgY3NjTOyEOboL9
	 Vd8XMP96MPA2jjkKSeE8Ct+dCmUd1urjd37K48JVVr8SRphZhNrRAJnw2WuFy8pwDuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795241025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
	b=yzTFKd27T0Wq8InyZaULtJlqNUHnLvEceK5ZaCfHm2VPGISV64dDwI5GDmwX/8XDHpOl
	 r5eN+44K/6Ij0vO2lS6d//uX4egHvZEMYzeNxVZpCAMOBCvANUTf/u9YUTfSy99HF2ani
	 mH0jhR1AzGYcqrqe9MmJfFb2oYUy+lT47fT0IQfEmoKT9AE4T6XM8UAno1/m84fbK6nh3
	 fk97fHnRlhwTPGO/kTFa/yY8m3XEqyDxZm8P00bA3KCFGhRusdu4UZ1Eh8esn/iOu3VW1
	 UUzzYfXlrKwPz6aJm2sh3LM3MDK3M/2uJ76JYa7P3F573BxlNv3Mm4tEKOAaSkRnWkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkncotie;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7625E606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7625E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkncotie
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38564b4b017so1613281eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795241024; cv=none;
        d=google.com; s=arc-20260327;
        b=ZhXoh3AjjDn3i35pd3AcjWETEUuOCrB8EMId+m2j5KYX9HL8erY8e34KIug/NTjIAO
         scaWvT6iyZXXvv7I4+iMVJZ4pdYPnAGFk8LyhgUS5QMyRdhExfq9xZe03gN+6a8fsp/s
         EJedorLFH0cNLz61qWqZSu4KFbbYM/VJbGN+6u0aD3pJM+DT8fZIvyFGOvvyEC6zE89T
         N9/Wa1OJoZxcus+B36tAGUwd6JfYsnzYq+owF9dulfeoSb7m0HP9rmswd4eoXWql8YYW
         d3dvMKPKe3eE2KVIz+KaPHDlqhxbOROcktyucOCv3kLnWCxkA8t0jflxyytaHxfPT7qF
         aRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        fh=vDISmOTMa5NPeAN4cgKbKJFSh/v5EfqBBY1lO1z5MH8=;
        b=XI2cJfF9MEGQAfgbjrOF3CYtyUITttIu4Lcay7u7oAQ4AbIqZ0EA1W2swUNzg1lDvJ
         28I+WENE4Nh5b5lEbQyimG4bO+DOX8aqlJevZ0tYj5kVDko+tZ+4RMrz0F6UGY5Jcv2y
         T2yn+CbVhMCJaOUtzfkaanUX1aTJ4iesZqLXtdmz7uQ0rKZnAJNNB+Mkh+Sax7FSJKgn
         UKEMMA6kcp3jBR718soVJgIHr3kefUkV/lONv3xwo6iryO9D14RxmVZROiNdrAoWShp/
         OUHu+CXAqOMm4BnzM2uwQWIsvgn6aBpwDI6gaJPOWiEb7mhRjqspA/NZ3+Jo1tAmlLEC
         OKkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795241024; x=1795845824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        b=fkncotieei3fyS8dWHzQm7M/AiGBj/CRGEBjdC2UYG1K6VO5O9PEVGFKKay9ckmx2z
         zS1y7h/y5IxeZ3c8VwbcVrRA3fVJQZM0IhChkXi1Jcf6wHM4gdrHWTdnteCJFFq8zo0w
         n8BTRduL63yAAFof8sanDkZWtT5UVPZsL9GrIebedHVQ7AXGV9w6BEEZqgblcJKX5xjJ
         jJZqdlB2de/PLQzCNejdlU18JJJVQQ0yNkz49Ypy9sabDWehPHpH2m2620BjUoL8UfGg
         5xugqW/nCm6pmHsgiOEnVtzjfSpmhpGmvx1U/cQXyj+xMuG0VuxXmQFXV2b7dI17fZZU
         ZCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795241024; x=1795845824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        b=NpCFjyEHkZthdD0XDIDj1vfLJ3RaeIOu3hfrT6RyhVqU4G5p6CrQkqThkMM9XJkvVp
         Rr290oBd2mzLCd4iuqMTiHhY9FX4PmMvMOVqnNrXhtialkbSQGCqjO/p6A/xKCzxMNGk
         ifAOS1Q5/Cdon4lvQXQvYHKMXHCNDUz+bVRYOIVCQmbY1XEv/5namRZmvATc/G65dqve
         Avn61xJpFZb0r2LTGIdGPUaKhlXGEyrw2nrdxW5C3A9cXCt3bO6Rroe6uwcaoQmbeO8Y
         3ZL5FjmH7ADHr/jPUGTzqzJGQItRmjJzkLQ5OdPRPV2tvzxSDY8VOy7nIUEfADmUEGyA
         jnYg==
X-Forwarded-Encrypted: i=1; AL+hErGP/cQGZyTjB68pghGZwF23qE9Rt1C7b0ZYlXNf79N70tRIXHcx5/o45v1j/uPRIhEcRe3IJ0IbnP9Tw3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e8bI1R6fy9LRNkIR7cgsFEXfWau+OUnDr/l6B3fPjcmTrUzGw
	/Qq5hFEqMeaKbgza1rXqL/B6iK3owsP2PYpcyxdlKImf873/fjuiyQvIt1mb+XD9pdsJk7racIQ
	kTHZFX33nJWeLvb1Yd+dyXZvEcphi02I=
X-Gm-Gg: AZFdTZdYdXNbQ9u6q22ibd2c+bjDWckDnOmECDQ1wlfREovybgt/BF4d19upP+sDVJ1
	+jN2JEzuPXcvhkcioGo9HjSq2/4fz2d83qVj4NB4yQS5M4EniKSnqbX8PUT7cYeX/IB5Fmmmyhq
	Z2n5M80W+oaZNo/Pw1nEzIhakJWEugdNjDHxalHxLKDeAZqvmy0MkLQlHpPDdCdGwXbOPN+RG45
	rtpHILkkAkjEh7PRP0RDDKYjza1VntHowYxyx5RIak2Pu6fiAJOJrJQo6hvW0rIPRIoDGvF8rhR
	XkZYN17ZaclcSYFZqmFWulVnMRRwiJwSuTamGMet2GTVO6DN8E6DjSdLonYKIEwbksdXI+vqn3h
	CPGfBN9P8LfiLAwvbSamQH1oAanfVrZrkDMKMK7smlHb2IwBJgM8kiza8B8gHFl1rF3HIYY/M7D
	sYwacOpTYnXP4Uxd6kSu1k3n2POn2lDA==
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id
 5a478bee46e88-3856c6b00fdmr6323139eec.2.1795241023623; Fri, 20 Nov 2026
 22:03:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113161819.36847-1-clamor95@gmail.com> <20261113161819.36847-2-clamor95@gmail.com>
 <20261120143147.GA2466366@killaraus.ideasonboard.com> <CAPVz0n3u3oe1+H_w9jE2afb9PQT0VLtYVqfHeVNc3D+tLN6NDQ@mail.gmail.com>
 <20261120213116.GB2472094@killaraus.ideasonboard.com>
In-Reply-To: <20261120213116.GB2472094@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 21 Nov 2026 08:03:31 +0200
X-Gm-Features: Aa3M54qOnB5G9GXqLIL-lPBYx8eezPpq659tGJ_BSKM-GqCEY4niHx2BKUlkMTw
Message-ID: <CAPVz0n0h6xd4DbnpNTW63agospeJFqoV8vnkPYdzB3NmgVRM5Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] staging: media: tegra-video: Move driver to media/platform/nvidia
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Cong Nguyen <congnt264@gmail.com>, 
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	Hungyu Lin <dennylin0707@gmail.com>, Hao-Qun Huang <alvinhuang0603@gmail.com>, 
	Yury Norov <ynorov@nvidia.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 23:3=
1 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 20, 2026 at 05:31:17PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
16:31 Laurent Pinchart =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Fri, Nov 13, 2026 at 06:18:10PM +0200, Svyatoslav Ryhel wrote:
> > > > The Tegra Video Input drivers are mature and developed enough to be=
 moved
> > > > from staging into the media subsystem. No other changes are introdu=
ced.
> > >
> > > The driver should at least be converted to be MC-centric before being
> > > moved out of staging. I haven't checked if other changes would also b=
e
> > > needed.
> >
> > Does the media subsystem deny video-centric devices from even being
> > moved into it? I have not seen this restriction imposed; could you
> > please point me to where this is stated in the media subsystem
> > documentation?
>
> There's a consensus that devices that require control of camera sensors
> (i.e. "MIPI" cameras) must be MC-centric. That's not documented, we
> should probably fix that.
>

Yeah, stating this in documentation would simplify things.

> > I would like to convert this device, but that may take quite some time
> > and may case regressions if not done carefully. This patchset apart
> > from moving to media is mostly fixes to work correctly with mt9m114
> > and tegra114 bring-up which is quite simple and straight forward
> > change.
>
> Converting to the MC API will require some changes in userspace. That's
> why it's important to make this change before destaging the driver.
>

Noted, I will most likely drop destaging for now then.

> > BTW, may you ack mt9m114 get_fwnode_pad change[1]. I have updated it
> > to your liking, Sakari seems to ignore it.
> >
> > [1] - https://lore.kernel.org/lkml/20261006153619.304520-1-clamor95@gma=
il.com/
>
> In the review of v1, I wrote in my last message
> (https://lore.kernel.org/linux-media/20260721103845.GJ50424@killaraus.ide=
asonboard.com/)
> that the issue seems to come from a bug in the VI driver. Let's continue
> the discussion there.
>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/media/platform/nvidia/Kconfig                           | =
2 ++
> > > >  drivers/media/platform/nvidia/Makefile                          | =
1 +
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/Kconfig         =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/Makefile        =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/TODO   =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.c  =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.h  =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/tegra20.c       =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/tegra210.c      =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.c   =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.h   =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/video.c         =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/video.h         =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.c  =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.h  =
| 0
> > > >  drivers/staging/media/Kconfig                                   | =
2 --
> > > >  drivers/staging/media/Makefile                                  | =
1 -
> > > >  17 files changed, 3 insertions(+), 3 deletions(-)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/Kconfig (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/Makefile (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/TODO (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/csi.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/csi.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/tegra20.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/tegra210.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vi.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vi.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/video.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/video.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vip.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vip.h (100%)
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
>
> --
> Regards,
>
> Laurent Pinchart
