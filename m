Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795784991;
	b=nBxVly625CLp8lMnNTnTs2cL3hxBA5HkF+Bpa0bYN8lV7dCLPa8rcY8TKG4670nWYIxW
	 rrfitZEL5cDBzAPdJzBSzM2s/0i/EEP5udCoxdbQyqR3j9yRBVFcjMXUQZTSCGULKI/IG
	 UtuhD6VW2Jehi82B7Q/z6xfavth6fcQvC3a0mqq8O53p8msyfZXH8fWXeVUxI4ftqRG4R
	 FuR9rRf0lA0lNf9HjBNVfgFmrY/7Co29cpdcNrconRRLqFZ1RVAJXmsmb4o2wfGabpNey
	 wFzKuWb6Hku+dzO462m5GGv7oaXPlqr++NAZiwcDlmwUY5Afu4vtAQLm8O6CslbaC/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Eogd8k2r4l6L3snwOgsY9XYxjjhni7gOzREbmp7dwa8=;
	b=RmRpo78TCf8+U02bfVeq6MXOrnYdZVuEwztS4CcOdL5CpvxFU5iRnpDvMrlwrd16v+Qy
	 S9+fyqIU1USLlM5XIu0XvF3bITcGhquwkXN7XbNhrQWTcNEigqrZIklnaG7/cNyB1v6ar
	 ODiv52n0Pu4p4R8oceXEJFP+CJOYfBJM6vpbPL7RIDKHUdPPzX5hIo4FX0e2nVI/Mtqsm
	 uXf0pmu9AEO66L7KGv73+sh3OhVCd8p37J/0qPag/nqm5RuGQpw2E9O+ccap6SeUfbSGo
	 3RcSf7BnnrcNmn6rw3VNnHdH1A/5TfXxcFBbQX0ZbhB2jMBL7coTaA6x60s7FkTBaNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GBJbHn8R;
	arc=fail smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306C0606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 306C0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GBJbHn8R
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-18818daa3e7so4412599c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:09:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795784990; cv=none;
        d=google.com; s=arc-20260327;
        b=ZW4JfQKyOOVig6d7R67Q8J04JWIiTeQyasCXrTY424hZb+JAxl51CNGjKubI84ermA
         ua8h8YRPwQg3X+svkc6YXUh/AoSpU8Jb0/8ZdgkDiFUVTEjZfDbKA60jcn2EGGwUsR+2
         xCZD9Dj/S/SEeUBmIVa5uXrKxd4FjyFhHKrQlyudYQqgLX6u/03xvhYW2YA4MnyHYPYp
         2YRcwu9QFQ18fwL8RazkY/W0FTdZK943dCiAALpgI9OKvuDOWPlzyDGXNYutFR/QVlUF
         5kQcuoHALSaJyhviMhepA17essl0nSVQNmIoolouvCisKDwOjiH/4pIt5hCFBct01aM2
         KsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Eogd8k2r4l6L3snwOgsY9XYxjjhni7gOzREbmp7dwa8=;
        fh=DijEgXBBoNVJ5FjMY3mrS08h6caQstkY5qBF5BcJni0=;
        b=EFiJz8fnJ54ygqP3U++7EekKuYS7fxzt+a7OzzhMQ19W+uapHjcgf3UVsGZkfaHifk
         mGUf8b/sVmlabt5veIwhoUM16wNtdiscL0AtqYVIW7P9S0B3mQRlwSSLeZerdW9NZ9xu
         KqrCQ0r7TwaPD6mjgK/w3K5F/dsZTyaa7U9DxC4D4B+yzWEd8Qho542egsbwKn45ge7a
         /aqFQc/ECrx64uiRCvWa25DpXN8D1BSsh3J6CuGRV/B7XochcGsfemjk+GGzYWEoO7yd
         JHfiJWmKwd5+gw5673Iauzu5KAsFcejySaO5hhwuzTlwA9kYs4rCRhyACWz13Mfyy7sA
         OTRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795784990; x=1796389790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eogd8k2r4l6L3snwOgsY9XYxjjhni7gOzREbmp7dwa8=;
        b=GBJbHn8RdXvQfEikYX0cu96q5pD3BFvyfAK9ZLeUZlxwEgYREy+0BkHCeZ6LZkSmkx
         DEetXf1aLYS8Q1NkEb+RRUJYpK0ER3y6LH3vOrUQasfq+w1hwo8v7g/0qOsUPL8yXjoY
         8I7Y1ZFftzussraXglAKs4IVYT9IL86KM8PdjRPM/o4my/vnd2vLMxdKdJiu8akZu7il
         sWNgg6enFUVsuM7hZUGJ+4Ooegmt1ze9/VhVeZ3oPI2FzQuUTXie06VXUsqMa1m4XRHB
         A3PdTf0AeoE4rVWktzdjMowW96BruaV+Il1oMj4s9YURp0yzquvnq7m4gW0LHt5f3NNh
         1cTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784990; x=1796389790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eogd8k2r4l6L3snwOgsY9XYxjjhni7gOzREbmp7dwa8=;
        b=1pyAacN4D7Ktx7Nvgv8dT4Zojnt0C3W1YOzNk58M2fyVO81BPDmeNvk5mZmidM3fe0
         hBXACAg+byJynXUWr1HDpaOEmpJK/05DjJfWrD+hEnpT7fBZ87+Y+Netx0zTurVQG2Yi
         Cxu13okRqrBkBjCSE4t7d6oEGcLB8B/hjtNELFBY0KSzOF+dDZFNXnZCWo3ajQ3b1xnv
         5oFDQqGPUUiv2lAoeg/WxTjKujmM+udcZzmoVWxJSHX/smObERnwOVn0sBTGmLdUb87t
         x/YGY2lgsB9pPHNWpl2WbWZmNp+xoJslouic/3DqvOO2wTEw/olSI85owaojMdyIvlA+
         5fLQ==
X-Forwarded-Encrypted: i=1; AL+hErHTAVYtzxUEmvgpsysqmTdGWOvDXgf/v6l3KQWEBWfHU7qLb6i6Q2Ay2MCwUmPD8PDZlszWgqnf62fdvXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8x3mCibVIbA8lwxC4+2S9X3/RcHPYM7K5zVM1aEkYzYDjocI4O
	LOuKoikAgzBvy08gERumwG9M7OYwhskA7LOsssK0O1XG1WPNUv/ZSal9vqvDOW/XeWl3q7eoc+O
	R+gxLym+YhcpgwDTwjMBMg4lFazflohSsHjAu3Kyw
X-Gm-Gg: AZFdTZc/UtPRv3kEMuR9sr/sBYff7reifJsYgz5GNtEEOLhJcYhPo2gGbDPSr7iM+N7
	WRETauTEVqj/BVQ1DZI1gHHnUYfcZPdlz1a16EAcaUGoc4Ch/jD4UDvcAVdftMbWRyQBpZmCooy
	zCbCTqH3qECNgObJu+33MFMyiJ6uSi5HyhJMDjAU8os5pB209/FdwuO+Q5KLvjDBSsDXaqS23oH
	FGLIlabFRdjIAp111aEugOhCASyx8jXpdxZDagqGO3fsGUyXTbdfiWxHYsFf8Yoi2hoznkphTtA
	ccPwiLgHA4v0paTrZ5SmsCgxJkeK63ESnOJD/INu1GtNLWAUqn5YggD1FvCXU57HM1hwqn/W9/m
	ae40q2D3gK0qqZEJL1QcaRmjnbUNLotnb42kNm25EKNIGqZ49A8ad73LM2mVEKXHmrwQ=
X-Received: by 2002:a05:701b:2319:b0:1b3:a8fc:6306 with SMTP id
 a92af1059eb24-1b55247e725mr21740730c88.6.1795784989485; Fri, 27 Nov 2026
 05:09:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123135148.1146372-1-elver@google.com> <CAN_Opa_TKjDAWz8EQaw6ro=joymwurpcy-k_x=q4E6TLt6ZpUQ@mail.gmail.com>
 <CANpmjNNOVD3KVrau5KD4WzqxoMkZZoJCfdPzvjLmZsGy9zXBug@mail.gmail.com>
 <CAN_Opa9zKzSptpNOnCzaW_EK0oT=HDDVoJxy5Q0crM+6b9bR_g@mail.gmail.com>
 <awdlqAbyRyJdSVeG@elver.google.com> <CAN_Opa-Oa1-NiR9bHLkT-Z1pb+JDTj+oTKv_phVitVtwsV1EDA@mail.gmail.com>
In-Reply-To: <CAN_Opa-Oa1-NiR9bHLkT-Z1pb+JDTj+oTKv_phVitVtwsV1EDA@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Fri, 27 Nov 2026 14:09:12 +0100
X-Gm-Features: Aa3M54pF_A1KGvCJJkG_GXguTjQxf-CL1zJXjvDc3sDy-3xEWmjZAMm3r1RTYSY
Message-ID: <CANpmjNPdrfXokReaOubYZB9+Q9tgemirCikP068Spn3rj1ACrw@mail.gmail.com>
Subject: Re: [PATCH] kcsan: Detect cross-CPU races on {READ,WRITE}_ONCE_THIS_CPU()
To: KunWu Chan <kunwu.chan@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Nov 2026 at 03:58, KunWu Chan <kunwu.chan@gmail.com> wrote:
> On Thu, Nov 26, 2026 at 6:48=E2=80=AFAM Marco Elver <elver@google.com> wr=
ote:
> > On Wed, Nov 25, 2026 at 05:40PM +0800, KunWu Chan wrote:
> > [...]
> > > Makes sense to keep the test in both configurations.
> > >
> > > I reran the three new KUnit cases on next-20261123 with rcutorture
> > > disabled, using the same image with interruptible watchers on and
> > > off.  Both runs passed all three cases at all seven thread counts
> > > (21/21 per run, no skips).
> > >
> > > With watchers on, I checked the console reports for both remote
> > > cases.  The two accesses were on different CPUs in each report.
> > > The earlier -EBUSY and remote_read failures did not reproduce.
> > > The separate 60-second rcutorture run also completed without any
> > > reports involving got_idle_tick or tick_nohz_handler.
> > >
> > > One question about the IRQ-off path.  A local NMI can still write
> > > to the watched address while its KCSAN checks are disabled.  If
> > > that changes the sampled value and no other access hits the
> > > watchpoint, is an unknown-origin report expected for THIS_CPU?
> >
> > Yeah, but we can suppress it:
>
> Thanks, that addresses my NMI concern. The trade-off makes sense
> to me.
>
> >
> > diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
> > index 51340bf1d4a3..b3e0c2627712 100644
> > --- a/kernel/kcsan/core.c
> > +++ b/kernel/kcsan/core.c
> > @@ -689,7 +689,9 @@ kcsan_setup_watchpoint(const volatile void *ptr, si=
ze_t size, int type, unsigned
> >                 kcsan_report_known_origin(ptr, size, type, ip,
> >                                           value_change, watchpoint - wa=
tchpoints,
> >                                           old, new, access_mask);
> > -       } else if (value_change =3D=3D KCSAN_VALUE_CHANGE_TRUE) {
> > +       } else if (value_change =3D=3D KCSAN_VALUE_CHANGE_TRUE &&
> > +                  /* May be due to a permitted write from NMI on this =
CPU. */
> > +                  !(type & KCSAN_ACCESS_THIS_CPU)) {
> >                 /* Inferring a race, since the value should not have ch=
anged. */
> >
> >                 atomic_long_inc(&kcsan_counters[KCSAN_COUNTER_RACES_UNK=
NOWN_ORIGIN]);
> >
> >
> > The downside is not detecting races with uninstrumented code, but usage
> > of *_ONCE_THIS_CPU() is still rare, and if someone wants that coverage
> > back, we can think of something better. In general, I find the unknown-
> > origin reports not all that helpful in many cases, so my preference is
> > to just ignore those.
> >
> > > Tested-by: Kunwu Chan <kunwu.chan@gmail.com>
> >
> > Below is the complete v2 patch with the unknown-origin suppression.
>
> I tested v2 on next-20261123. A 60-second rcutorture run with
> strict KCSAN completed without any reports involving got_idle_tick
> or tick_nohz_handler.
>
> With rcutorture disabled, I ran the three new KUnit cases twice
> with interruptible watchers on and twice with them off.
> remote_write and local_noreport passed at all seven thread counts
> in all four runs. The remote_read results were:
>
>   watchers on:  one run passed; threads=3D5 failed in the other
>   watchers off: threads=3D4 failed in one run; threads=3D5 and 8
>                 failed in the other
>
> I also saw intermittent remote_read failures on v1 with
> rcutorture enabled. Have you seen this in your runs?

I haven't. I suspect it's a flaky test because writers are also racing
among each other.

> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

I'll send a final v2 with the fixes incl. to make test more robust.

Thanks,
-- Marco
