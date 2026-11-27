Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818997;
	b=POiBmil9LzHbaA7mmkAuUuTbBfJ4cJBNfrV7dG8E9SMKV1rcusu1GNFNj2SkiQblmFxc
	 rF7ACcuT2odsO71UYFFDokk3dcvZ3l0v4pvMxAu5QvE4PzJ+Tx8z3RufHCjD09bzWZ39V
	 nj2xFwuKYT3YOIDJHxdW89g/O4ssgYVTBxNmQu3zC6P2IbA/lOnjN/NjUmJpw5PKN5nhh
	 FhH236pyxuEvQFgfF7jGdHJvK2SUI5DkfhBrhtXmlBTaTItu0plieTgMaOZzo/F+wQMDM
	 clTEeOfEQHYbgM4VqeCtzrJ/h2pLaTJ4dsNOd1PySw15ghqDOBs3JtdoF/s4ryWZ+kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818997;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SZ3OQ2mv12Ze+aLOyUcRFBk1F/gfnm+grww8lcGn4t0=;
	b=oOFW6IM57mP75+JTuQX4As7SOheb8z0cULXxkEtMwJTB+Fgc8bFQJq25Fc90Oe/jWaCs
	 e5A6hzGzE/tCmFBjinIDgxTuF5E2jr0nLe4rUsZxv0ndRqxovoJ8rLqnTiaoxiiyT+60t
	 g3y2fHC/6ouBhbFnKJdfZGMAVjyD6BP5GDswOmkbhCvnuTO+OrLEBXQudFNkKwlSWlmbH
	 123+Zspt8yWJCg6/CppBJQoIRS8i1kazY8OzPeJ4UfE9QNtzIdbXYoCotopg4y1PkiELR
	 UozKFGgD/rxBNgrQ6W2Tw+Jo2Hl4LjctJNa7Unkar+gD/zJUiZEUEfT0OR/Hu0704sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oa0wyiyc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02A9606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oa0wyiyc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD831F00899
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795818996;
	bh=SZ3OQ2mv12Ze+aLOyUcRFBk1F/gfnm+grww8lcGn4t0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oa0wyiyctBvFied+j/e5B3PNxbetOgNaIH7JGFjxoRibBttI21/C7GzX/rAdKTSAC
	 3rOhwkNOzetgcjWSn3x+LR1NMqDnEyDrZJaowrbspmuUU1qLdo2vtPvfudpu2NSqZo
	 A2zcP0S3flNaBFM8kK5AEuqGaq91+5r1BUhRe56eBvLWI1WBl4SlH3kFdhGLzddNr4
	 Qex4RGf8VG+/jzdjXY+3MDFLJOgusEN3vOW6mAFjH3RhSt8R4smjdqCsnsVkic8evO
	 wxSoN/k9zVvmSB/CEuTVue2WAZCmCBFZtR1j2tz0hgjOY+16BpTBF1JrEvBiOgqb0x
	 uCv5Vm7QMifsQ==
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38644aedba1so13333859eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:36:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHawayR9IPy6gedALzniAqv0UtynmG+dNFsZl4Aqe9Ppd6gCShPcRRuBjdQHh5eyJgKKYHjNLuwG5tCbM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A0zv4EGhq7xDcUb6qlUUd09H7xwhulySeuZ6xcgwgZxT3vMUP
	DFvgSJFj6zJrLjQu24ZL/L4tbTRdD6RMwXUH38fEK2p4aK/FmpuxQ3veZKBWI3pShTD7WJFQIxX
	vxZECNzkLwFIbMeuxYdMgDaalRxX9sYs=
X-Received: by 2002:a05:701b:4648:b0:1b5:43af:1bde with SMTP id
 a92af1059eb24-1b5568bebeemr22118799c88.25.1795818995779; Fri, 27 Nov 2026
 14:36:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1779100597.git.u.kleine-koenig@baylibre.com>
 <aimaTrJvXFjbDDTB@monoceros> <aloDsjYyv3gCsx39@monoceros> <avxptCL2mq7Z3vPi@monoceros>
 <awlOvzxRjyQo6fOI@monoceros>
In-Reply-To: <awlOvzxRjyQo6fOI@monoceros>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sat, 28 Nov 2026 07:35:58 +0900
X-Gmail-Original-Message-ID: <CAGTfZH0OyHZjH17Ab4dBb01UzrcpGJ3bRiXRsBPBpqG45-_dfQ@mail.gmail.com>
X-Gm-Features: Aa3M54pK9rCNtB2GC8d0aqVo19kFPoFB-DE50LHyMwYPiEncKE36zl0mUIKMkfg
Message-ID: <CAGTfZH0OyHZjH17Ab4dBb01UzrcpGJ3bRiXRsBPBpqG45-_dfQ@mail.gmail.com>
Subject: Re: extcon still alive? [Was: Re: [PATCH v1 0/2] extcon: Rework
 initialization of i2c_device_id]
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 6:52=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Tue, Nov 17, 2026 at 03:53:17PM +0100, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
> > On Fri, Jul 17, 2026 at 12:31:20PM +0200, Uwe Kleine-K=C3=B6nig (The Ca=
pable Hub) wrote:
> > > On Wed, Jun 10, 2026 at 07:10:51PM +0200, Uwe Kleine-K=C3=B6nig (The =
Capable Hub) wrote:
> > > > On Mon, May 18, 2026 at 12:41:43PM +0200, Uwe Kleine-K=C3=B6nig (Th=
e Capable Hub) wrote:
> > > > > Hello,
> > > > >
> > > > > I plan to do the following to the definition of i2c_device_id:
> > > > >
> > > > >         diff --git a/include/linux/mod_devicetable.h b/include/li=
nux/mod_devicetable.h
> > > > >         index 23ff24080dfd..aebd3a5e90af 100644
> > > > >         --- a/include/linux/mod_devicetable.h
> > > > >         +++ b/include/linux/mod_devicetable.h
> > > > >         @@ -477,7 +477,11 @@ struct rpmsg_device_id {
> > > > >
> > > > >          struct i2c_device_id {
> > > > >                 char name[I2C_NAME_SIZE];
> > > > >         -       kernel_ulong_t driver_data;     /* Data private t=
o the driver */
> > > > >         +       union {
> > > > >         +               /* Data private to the driver */
> > > > >         +               kernel_ulong_t driver_data;
> > > > >         +               const void *driver_data_ptr;
> > > > >         +       };
> > > > >          };
> > > > >
> > > > >          /* pci_epf */
> > > >
> > > > I want to work on that, but I'd need this patch series to be in for=
 it.
> > > > Do you still have this patch on your radar?
> > >
> > > While I still have to make several patches land before I can modify
> > > struct i2c_device_id, getting the patches from this thread in would a=
t
> > > least make my queue smaller.
> > >
> > > FTR: The series still applies fine to next-20260716.
> >
> > It's November and the series still applies to next-20261116. Does
> > someone still have this patch set on their radar?
>
> This patch blocks going on with the above mentioned quest. The patch
> we're discussing here (well actually that *I*'m discussing only) is
> IMHO trivial. The last patch applied to drivers/extcon that went through
> the hands of the registered maintainers was commit 1bf0ba46d9d2
> ("extcon: usbc-tusb320: Make typec-power-opmode optional") from October
> 2025 (picked up in March 2026).
>
> Greg's char-misc seems to be extcon's upstream, so I wonder if Greg
> knows something about the state of extcon? Greg, would you merge my
> patch without maintainer feedback? If yes I guess I should resend? If
> yes, I'd expand the patch to a series adressing all the needs for my
> quest also for other *_device_id structs.

Hi,

I'm sorry for long delay. I had some individual issue.
I'll review and merge the extcon patches. Once again, I'm sorryt.


--=20
Best Regards,
Chanwoo Choi
Samsung Electronics
