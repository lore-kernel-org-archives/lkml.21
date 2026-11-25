Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795626932;
	b=uOY9uj0TTZJiv4Hbs3uB0ajlATDkQNHPFPvPMVpSQ3eUIxgiPsxeYusisRtHiV0021mS
	 wfZrbT8rJ4wASjlsdxzXOOCOwnaihc4fdX9ul3YgQnKswzN8zZZMlHiLSEZtNze/Hb2ae
	 LttY3Duu+0or6R5NktvJtTBSZA46iYGT+lqXURIPMXW2eLNNWbav+YiJKlTN1SJ8O+7LT
	 TMSr715wbremHL/XjHUsGEOiw+xxVpCx3i0AUuM8pDF1l+eMBSGLjqdWtv0s5uyTYEpfn
	 xlRYQ/4awNl1myWwp25o3C1nciPm9EvICuTsxCL8FDslTbmRwagsvoWIOw/WODVggdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tVk/U1sWsKr7v+Loj79t7L4BZhdXVQobaa743cBfykg=;
	b=gBCAmimLruKe/PZwVBfAg2FLUwqklFTMtt16oebjwYlbx4DqsYd7mW0Oc3J+E9qg85e3
	 rBiCaJXXWRzyWtzldlmzRh7a7MnlYDRT3EufmXHAsoptCesByr3bO2/Lu0rNLB8ir7C6V
	 j6Or4h8qrat34YQSBFB3Ip5715OToeCBugd8fF/WcGrbzmvIykb3AjryJciJ2E0+3mkqj
	 okX38Btt27EUGGToLfMlcHPje9945J0Co0qSV2bfJ/Brr9Zxwh9lttspkZOdS/QEgm1BS
	 nYriKBIu8hoSTLf73Xw+gcXaZtesx5+pVBTdK8gnnpjs9LmTzopBCfWfoN08Qbxe2Eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RsFMTFUI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEE6606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DEE6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RsFMTFUI
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so9381993a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:15:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795626930; cv=none;
        d=google.com; s=arc-20260327;
        b=d9SaEDwlN8HaL3aRHjmKxiExp876Nw5Wq3be5hf/Y1DGC1I5pFpTLO334m4F366Z25
         SmtqRK5LPYTFhEjZtpkxhT/Jlu35YXvy1JYgiqkdkAHlgIQJtD3Pb2ZEFj4aJ17PLvJN
         7Vg4QNqqpcEDITbniGYpqDqpKJikE/aKGpPA77fFVscIG5+DlxpmVT7BAqjFhWkCCeJ+
         QwdW09/eMAXhT1qz4IIv9zLEXvHH0WqBI4IQS/UX+q8mXs4nGUDw3Ofm5DrJ+lCdECAn
         o2YMDJoqh01MooS1TOqble3ZAZ1/cjPam763hPQfgtFZ0DJzggBzr1d8TBInbp4BlwEX
         Cx2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tVk/U1sWsKr7v+Loj79t7L4BZhdXVQobaa743cBfykg=;
        fh=0fnwQUF7xGGsR+7c3v/xPHxZ0t0gFOn4/o1bVFqklL0=;
        b=MgTap+CGbXoJHzebyIn1JhXBUvwNWFOxhsR23eGzGhXtxkwNNHIu4cb6PYjbgdPV1H
         ai0+39ClQ+SnjEQ4JqscHiP4HJUdCRJCNokR+7KK26ERe8XMOjNFeDQ3MjsTGBcx+syi
         WBj+lrJehzTfcnPWGQpCz3R46SkjwdxL75K7OBKsA/q/mRcR/JtQW3uude9rojqd61Hp
         HAmMdpiTjRL2Kfk2688KZo/wG7NPUEsngGs8ZQRwhT8tivnqJYHK3pTU42TgNDWquTil
         86WKNuG4RsOFmtGD34AGcz7/a7kY9ayfbUatnfr75xGlGk0KiBMNivAGZkqBtLZYSDHR
         t++A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795626930; x=1796231730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tVk/U1sWsKr7v+Loj79t7L4BZhdXVQobaa743cBfykg=;
        b=RsFMTFUIDnPWtIqnWs50WPgR5WHRcF4OrAdQq/cuDgtdz6nPwqDmjTBm0W1wv7JEDN
         vEtFjPIydxCvc3NNEVUPLFf7UNngVD72UjpfX/mJOjvyL/EX8rVL/kxyBL+Pe3YU1Mso
         WQamxt+qGP/rX0+xEZsQmGJ5nZ+jQsC2x7VHXOaR4DGt6cNpWZ63T5t06jXPxRfsjNPO
         5Qts2hDhqHe42Wyw8mi1z+96p63wxuPzMdnodYl4uZkiwnMCf6WqAnospozBFjoX92ZU
         t4aUXfhiOa20ku5DjUIGie7+elkTzYgplLfcj6/NmcxbAQZUPFuw+hwszox2q+dWsJxy
         I1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626930; x=1796231730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVk/U1sWsKr7v+Loj79t7L4BZhdXVQobaa743cBfykg=;
        b=rGmsayYotLOF81/kh1GlWicb+BqBO9mIvxFYyzBUzdtUKiiG/ekxNP2tssiIz0+0bE
         kxzBivMKV3OAH6aTbMoCiQfBDkEv29Wa+Hk8SM/J2wMV/97BIinDvO0mMTH4P7Z5jZ0c
         2CGtehyYZ9P9n7yPDRCj+ZMBnZuDaNaqwqbQYLRgfmYh86xHKZ7pZFGktYjAN0pYsNEo
         X7R8cAJQLZtpeTB8Nh+LhZtW6BT5cQDJyM4IFzWGzAtrdesxN5vCbU9OD8XHeiBLqtiE
         m0B+xIcSMPDiw1f5MzNTAX7kPRPjqQcW9/6snWcPlcbZFc4pWnRNoCccHfQTJkk4EPhd
         ICjQ==
X-Forwarded-Encrypted: i=1; AL+hErEgS+Kp55V1lsScFbu3t0cYJRYLW52sDrNyYvfFunhKVbk4ZHAkYcbABHHM6ypEj/WY+/V+lHmPttKwzHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Tg4pSvxwJz08qT8MOTJqo0fk7GfdJXzazDUBGCpbugS4g75tv
	ig/IEzEEc7G4Uy+S3DnEiERMqDd7Jw0sVGd191X3Zc3iJkO544tI7FBBFNti3C4BkVq2UcqqOT1
	XJ2aHvbvIt4HWA5cJH3NOV3VCxWpFYcvQ7U2QP2kbiw==
X-Gm-Gg: AZFdTZcwaGl/eb9jwAXbL9dbEKgbOYpyynYMc05cASdHGfKZ5SufhaZ2q/M/1i19flW
	/qZqGHNvVoyTpAbA7x1q2zlzWdusdFQAW/DwPPYK0skUq0yCtqR0txOT5MkvfXEwMFI/JS/tMLp
	aoStnbkpAfi6XaQnPVlL/W3aKZepnyDEcVL5qemZqAwZ+fVHywlx7aIgFJXYrxODHgInpTHEhtD
	j83F+9jQrNDk/xCUmScAwHRkfZe1xXjEomBHMIIo1pK8KDeH1oZcG6EyD3U+tn70xdHSlHM4tT8
	ycrLbSVis8kCmo3n2A3/kcYwY2e9PccEvJhWfkJD0z0I9LaN5LN5YyAUP6/5k6UBk1Re+tjqkKw
	fuHeTi1wzCb1frjDSqqSmkNQx5l6RHbUgo0+bVWgBr+SQNdQNZ78zne+TgV2i4SIsqMU3
X-Received: by 2002:a05:6402:2105:b0:6b7:6485:23cf with SMTP id
 4fb4d7f45d1cf-6ba37e935femr14659931a12.42.1795626930003; Wed, 25 Nov 2026
 09:15:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121041507.39582-1-qyousef@layalina.io> <20261121041507.39582-2-qyousef@layalina.io>
 <282a3922-91da-4145-94b6-d1a6459b6da6@arm.com> <CAKfTPtAT_gPBMaw_xyjkY4TTEA6+kuPBAAyNvMvT4Uq6T42xkA@mail.gmail.com>
 <8150e8ee-cd2c-41c0-8c5c-3f0c7a087ac2@arm.com> <f607fd0e-64ff-4b1e-92b0-88cd04fd6ffb@arm.com>
In-Reply-To: <f607fd0e-64ff-4b1e-92b0-88cd04fd6ffb@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 25 Nov 2026 18:15:18 +0100
X-Gm-Features: Aa3M54qi43aFzIqjZzj5meO-veJqw0g0jAmYeQmE32hNAzJsqzfbP7fE9WrnJo8
Message-ID: <CAKfTPtAxbSMg2NkNP4t5Edsb2DUkpEOKntno90rPvPwkphpETQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
To: Christian Loehle <christian.loehle@arm.com>
Cc: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	Kayra Cizmeci <kayracizmeci@gmail.com>, Wei Wang <wvw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Nov 2026 at 10:13, Christian Loehle <christian.loehle@arm.com> w=
rote:
>
> On 11/23/26 18:15, Christian Loehle wrote:
> > On 11/23/26 17:23, Vincent Guittot wrote:
> >> On Mon, 23 Nov 2026 at 15:38, Christian Loehle <christian.loehle@arm.c=
om> wrote:
> >>>
> >>> On 11/21/26 04:15, Qais Yousef wrote:
> >>>> Static keys are not guaranteed to be enabled atomically across CPUs.=
  Or
> >>>> across callsites on the same CPUs. Which means when sched_uclamp_use=
d is
> >>>> enabled, some CPUs/callsites will return true for uclamp_is_used() w=
hile
> >>>> others won't, leading to asymmetric uclamp_rq_{inc, dec}_id. If we
> >>>> decrement without increment this is safe as documented in the code. =
But
> >>>> an increment without a decrement is a problem and will leave the
> >>>> uclamp_rq in a corrupt state.
> >>>
> >>> So if we only need decrement to work then we can rely on
> >>> p's uclamp_se.active and decrement regardless of uclamp_is_used() and=
 call it
> >>> a day?
> >>
> >> The static key prevents overhead for those who don't use uclamp. It's
> >> a default rule for features like numa, cache aware, eas, uclamp etc to
> >> not impact those who don't use it.
> >> I'm afraid that the executing  uclamp_rq_dec up to
> >> p->uclamp[clamp_id].active will not be free of overhead
> >
> > I get why the static branch is there, but as long as p->uclamp[clamp_id=
].active
> > never changes from 0, like when uclamp is never used, the check should =
be virtually
> > free on any half-decent branch predictor.
> > Also in any case the enqueue path ought to be the expensive part for uc=
lamp.
> >
> > I can come back with some numbers though, including the original netper=
f that
> > introduced the static key.
>
> So I compared mainline, my dequeue-only fix and a version where uclamp_is=
_used()
> always returns true (i.e. no static branch optimisation at all).
> A MeteorLake, Xeon and Orion, all compared to mainline as a base:

I did a quick test on my favorite dragon rb5 with perf sched pipe -T ,
perf cpufreq gov and only WFI:
- on big, the diff is -0.7% (+/- 0.30%)
- on medium it's -1.85% (+/- 0.20%)
- and on little it's -6.53% (+/- 0.15%)

>
>  Workload / metric              =E2=94=82  MeteorL: fix / always-on =E2=
=94=82    Xeon: fix / always-on =E2=94=82   Orion: fix / always-on
> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>  messaging-processes / seconds  =E2=94=82         -1.00% / (+0.02%) =E2=
=94=82        (-0.11%) / +0.67% =E2=94=82      (+0.02%) / (+0.34%)
>  messaging-threads / seconds    =E2=94=82       (+0.06%) / (+0.58%) =E2=
=94=82      (+0.04%) / (-1.04%) =E2=94=82      (-0.10%) / (-0.08%)
>  pipe-processes / usec_per_op   =E2=94=82         (-0.06%) / +1.42% =E2=
=94=82        (+0.33%) / +1.86% =E2=94=82          +1.29% / +1.68%
>  pipe-threads / usec_per_op     =E2=94=82         (+0.16%) / +1.18% =E2=
=94=82        (+0.22%) / +1.99% =E2=94=82          +3.46% / +2.42%
>  schbench-256k / rps            =E2=94=82         +0.05% / (-0.01%) =E2=
=94=82       (+0.003%) / -0.07% =E2=94=82        (+0.32%) / +0.38%
>  schbench-256k / wakeup_p99_us  =E2=94=82        -18.72% / (-1.45%) =E2=
=94=82     (+2.63%) / (+11.06%) =E2=94=82      (-3.65%) / (-2.36%)
>  schbench-4096k / rps           =E2=94=82       (+0.00%) / (+0.00%) =E2=
=94=82      (+0.00%) / (+0.00%) =E2=94=82      (+0.00%) / (+0.00%)
>  schbench-4096k / wakeup_p99_us =E2=94=82      (-19.12%) / (-7.35%) =E2=
=94=82     (-11.03%) / (-6.98%) =E2=94=82      (+0.14%) / (+9.45%)
>  tcp-stream-1024 / Mbps         =E2=94=82       (-0.02%) / (+0.04%) =E2=
=94=82        (-0.25%) / +1.46% =E2=94=82        +0.75% / (-0.30%)
>  tcp-stream-16384 / Mbps        =E2=94=82         -0.44% / (-0.16%) =E2=
=94=82          -0.22% / +0.33% =E2=94=82        +1.14% / (-0.12%)
>  tcp-stream-64 / Mbps           =E2=94=82        (+0.81%) / +10.86% =E2=
=94=82       (-0.67%) / +15.31% =E2=94=82          +3.98% / +2.96%
>  tcp_rr / transactions_per_sec  =E2=94=82       (+0.37%) / (-0.39%) =E2=
=94=82          -0.31% / -0.97% =E2=94=82          -2.40% / -2.13%
>  udp-stream-1024 / rx_Mbps      =E2=94=82       (+0.77%) / (+0.18%) =E2=
=94=82        (-0.20%) / +0.33% =E2=94=82      (+0.57%) / (-0.39%)
>  udp-stream-128 / rx_Mbps       =E2=94=82       (-0.04%) / (-0.13%) =E2=
=94=82        (-0.30%) / +1.56% =E2=94=82      (-0.02%) / (-0.68%)
>  udp-stream-16384 / rx_Mbps     =E2=94=82       (+0.17%) / (+0.04%) =E2=
=94=82        (-0.06%) / +0.19% =E2=94=82          +0.82% / +0.97%
>  udp-stream-2048 / rx_Mbps      =E2=94=82       (-0.36%) / (-0.85%) =E2=
=94=82          -0.31% / -0.54% =E2=94=82      (+0.85%) / (-0.22%)
>  udp-stream-256 / rx_Mbps       =E2=94=82         (-0.50%) / -0.72% =E2=
=94=82        (-0.29%) / +1.15% =E2=94=82      (+0.05%) / (-0.33%)
>  udp-stream-3312 / rx_Mbps      =E2=94=82       (-0.53%) / (-0.54%) =E2=
=94=82          -0.33% / -0.54% =E2=94=82        +0.91% / (+0.19%)
>  udp-stream-4096 / rx_Mbps      =E2=94=82       (-0.28%) / (+0.17%) =E2=
=94=82      (-0.18%) / (-0.04%) =E2=94=82      (+0.65%) / (-0.03%)
>  udp-stream-64 / rx_Mbps        =E2=94=82       (+0.23%) / (+0.31%) =E2=
=94=82          -0.48% / +1.30% =E2=94=82      (+0.72%) / (-0.44%)
>  udp-stream-64-pinned / rx_Mbps =E2=94=82       (-0.77%) / (-1.11%) =E2=
=94=82      (-0.33%) / (+0.72%) =E2=94=82        +1.29% / (+0.35%)
>  udp-stream-8192 / rx_Mbps      =E2=94=82       (-0.01%) / (-0.46%) =E2=
=94=82      (+0.14%) / (-0.36%) =E2=94=82        +1.24% / (+0.50%)
>  udp_rr / transactions_per_sec  =E2=94=82       (+0.31%) / (-0.75%) =E2=
=94=82        (+0.14%) / -1.07% =E2=94=82        (-0.28%) / -2.04%
>
> That being said moving the active check up in uclamp_rq_dec() gets rid of=
 the
> regression.
> I'll post that version and numbers separately.
>
> >
> >>
> >>> See the attached patch.
> >>>
> >>>>
> >>>> The reported case seems to happen due to callsites on the same CPU n=
ot
> >>>> seeing the flipped state.
> >>>>
> >>>> Plugging the race is hard as discussed in [1]. Take it for granted a=
nd
> >>>> do correction actions on going to idle to guarantee this state is
> >>>> transient for a short period after uclamp_sched_used is enabled.
> >>>>
> >>>> [1] https://lore.kernel.org/lkml/CANDhNCqyXsZ6G77z+9s=3DrTO6BZifRG9+=
hVxMTah+tAv6pB6h3w@mail.gmail.com/
> >>>>
> >>>> Reported-by: Wei Wang <wvw@google.com>
> >>>> Signed-off-by: Qais Yousef <qyousef@layalina.io>
> >>>> ---
> >>>>  kernel/sched/core.c  |  2 +-
> >>>>  kernel/sched/idle.c  | 19 +++++++++++++++++++
> >>>>  kernel/sched/sched.h |  3 +++
> >>>>  3 files changed, 23 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> >>>> index d7c3b43158dea..c6780358a7975 100644
> >>>> --- a/kernel/sched/core.c
> >>>> +++ b/kernel/sched/core.c
> >>>> @@ -2111,7 +2111,7 @@ static void uclamp_post_fork(struct task_struc=
t *p)
> >>>>       uclamp_update_util_min_rt_default(p);
> >>>>  }
> >>>>
> >>>> -static void __init init_uclamp_rq(struct rq *rq)
> >>>> +void init_uclamp_rq(struct rq *rq)
> >>>>  {
> >>>>       enum uclamp_id clamp_id;
> >>>>       struct uclamp_rq *uc_rq =3D rq->uclamp;
> >>>> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> >>>> index 76f3c84ca6846..84301fc49e699 100644
> >>>> --- a/kernel/sched/idle.c
> >>>> +++ b/kernel/sched/idle.c
> >>>> @@ -502,6 +502,25 @@ static void set_next_task_idle(struct rq *rq, s=
truct task_struct *next, enum snt
> >>>>        * lost_idle_time of clock_pelt
> >>>>        */
> >>>>       update_idle_rq_clock_pelt(rq);
> >>>> +
> >>>> +     /*
> >>>> +      * Due to a race condition when enabling sched_uclamp_used sta=
tic key,
> >>>> +      * we can end up with imbalance where uclamp_rq_inc_id() has h=
appened
> >>>> +      * on a CPU without uclamp_rq_dec_id() on another CPU that has=
n't seen
> >>>> +      * the static key flipped. The race condition is unlikely, but=
 ensure
> >>>> +      * the uclamp_rq() state is set properly on each entry to idle=
.
> >>>> +      *
> >>>> +      * The reset will cause the uclamp_max from uclamp_idle_value(=
) to be
> >>>> +      * lost. Since we are imbalanced, hard to know what is right. =
So just
> >>>> +      * cleanup. This should be a transient error state once we rec=
over
> >>>> +      * everything should work as expected.
> >>>> +      *
> >>>> +      * We need to be careful of some paths that can force idle wit=
h tasks
> >>>> +      * are still queued.
> >>>
> >>> It wouldn't hurt spelling these paths out IMO.
> >>>
> >>>> +      */
> >>>> +     if (uclamp_is_used() &&
> >>>> +         !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
> >>>> +             init_uclamp_rq(rq);
> >>>
> >>> I guess this means init_uclamp_rq() will need to use WRITE_ONCE() for=
 .value at least?
> >>>
> >>>>  }
> >>>>
> >>>>  struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *=
rf)
> >>>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> >>>> index 7d2ec527b8a25..d87bdbd2121df 100644
> >>>> --- a/kernel/sched/sched.h
> >>>> +++ b/kernel/sched/sched.h
> >>>> @@ -3704,6 +3704,7 @@ static inline unsigned long cpu_util_rt(struct=
 rq *rq)
> >>>>  #ifdef CONFIG_UCLAMP_TASK
> >>>>
> >>>>  unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_i=
d clamp_id);
> >>>> +void init_uclamp_rq(struct rq *rq);
> >>>>
> >>>>  /*
> >>>>   * When uclamp is compiled in, the aggregation at rq level is 'turn=
ed off'
> >>>> @@ -3802,6 +3803,8 @@ uclamp_eff_value(struct task_struct *p, enum u=
clamp_id clamp_id)
> >>>>       return SCHED_CAPACITY_SCALE;
> >>>>  }
> >>>>
> >>>> +static inline void init_uclamp_rq(struct rq *rq) {}
> >>>> +
> >>>>  static inline bool uclamp_rq_is_capped(struct rq *rq) { return fals=
e; }
> >>>>
> >>>>  static inline bool uclamp_is_used(void)
> >
>
