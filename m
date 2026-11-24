Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795551307;
	b=fQr640DcI056hZqJOX8mukCqko+5IbZUfXWxEfEQfuxb+U5PG64Od0ysIcirlVtFd3T5
	 OurCWwrRSiadLCSZB9VrbRon1iW8Sr8T8As2TcB7W278pvye9G0wr5asK1iVA+B5Iw86w
	 KcGG8Sc5jM7obrXhLTcz9JGKKTc0GVguCrl4pdPJemgG/OkcgYhRzqZfld2odlhODSt3y
	 CMvVSSZmAOA2VHimiKfNyja5W0QLzzZ3RtK0MB6keHVInIeG5A1UjSBiCtqi6saBgNbyd
	 2hms1ovZVtpCkRjpvly4Ag/lGQjDMLPOu26H0tExE6pQslnhIuMHXZAGwAnM9Ekb6+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pi553oKEuwJxtkzT1XB/uqe+x5Rc2UJPrmYbDOw3Bd8=;
	b=0TOA2HJJUDCier+W2E0MAOJhXDUGQpOAops1TLT710NwjooLlaEpc2XdWEiDvdi1JdpQ
	 ZMsLZqsjYAw0tVKSlQ7BzmIhPNcEjanRZJXj0T7rSMQz+usLHQlSUG1zZ+r/r4PIyGX6o
	 n/TQJcDqEwosmUkgNxeMYaTNpQG6tGUDnlZ3Ub0w0LgZdKVUZW2J54+oP7BgRxGm1tpSP
	 vLerqrspBoqfwWps/vFz6vLVVXTlk0au+P6L7Rjd5AEMfXZnRH9TZCTo5rjdsUT7Alhb8
	 4PiG0GSgIrKHV+ji4N70ymfja7jdHzAr8oz6UMhVbiQkm3DKnOg+N5L+Y1y4EHP9rTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="y2eb5/LZ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20A1606A338
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20A1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2eb5/LZ
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso49354065e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:15:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795551305; cv=none;
        d=google.com; s=arc-20260327;
        b=BBalBd7B2i+8/dt3qw3U3PSBYLqSqB9FsjXFC28DlGcTM09+MZbkUpZY536qQF7KlJ
         TS+I7sdS9kSNbpgPO8VhIcxJ5kXFd2PdQiXVxjlN7tXpn8QIBuXrJz1MPumT+Pbd1VqV
         3k4sGfiQYnTOV5/tNI3oNFC+AiEZBPlQjQpIyzG5QnuZq3nNOqjWPB9Tl/NLAUJIvLQ4
         4eknS40Jdfsp+MtwALHbJ62nCAD6v45m2jQemIoDLP78zkTp1yf5UCezCXQv5x61B1M7
         ST4r4ARehggKTiD6O/AUAtygH8DCLYANpQwfNshwS+VaWy82+/fraoIroRKxrQsNymtz
         pEag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pi553oKEuwJxtkzT1XB/uqe+x5Rc2UJPrmYbDOw3Bd8=;
        fh=CFAo/8hgfoPin5Z6MoIj4J7VbMrQzcyodizNs8MD+tw=;
        b=q6tuOaLMhyXCPzrLa+JdK6PaElEfbFd+hQN46+rNdeEJ9KLi8V2M274VnQlir7goR+
         PgSuK/RsG+tMw6sAtbjQ3tovcHRGb0SXZd07akJyc87wrxJdIWAtTD8Hp9WfDDh7IIRe
         tRJPIpZ3QPKNxHZ6cretUBeSks16rp5OTBUcG0bn49jr9JIQrEVoSOvaBTrJahmqTSEC
         jUE16JTtndTk6l2RO6nliZYCkNi7zX08NQnhADHSFzDo9FmNcMdx4e6Cm7MqYehncYZQ
         l5E0irrD/s2soJyqKIz3/0niSssBRNaH4RSdNRoV6W0GZWv3dVEDb2MHQWdGsythEm4D
         apXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795551305; x=1796156105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pi553oKEuwJxtkzT1XB/uqe+x5Rc2UJPrmYbDOw3Bd8=;
        b=y2eb5/LZeksmRnb/4Tc2gs3zEYVlgZK6T9qGufOag8Bei+G6Y7t18dJrdfcsvGlTj2
         6lA8CxMUbCuClMKZB5cGfk34by0jLI0jlg1ITdQuWWaeI9HqWFJM2e6Rfg0ZTvX5bQNz
         sjLTVmYDhHX7FjEy3iFjcH6ocEmZ8837BGVvoM9kmHUGDUOl2mRex509wcp+CrZiqNzJ
         4wL56UkWq4ohRa//hvlDtRSTqz1NEniqS2+TrZGYFdakFMsHHsAml5jN5QhVCS+IlyRL
         AZQCCkyozn8O5IF7E3DA218PR/ku9M+5dQeD6rmVKcdzTqGqk2hVspiW/CAq14t162hF
         fBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551305; x=1796156105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pi553oKEuwJxtkzT1XB/uqe+x5Rc2UJPrmYbDOw3Bd8=;
        b=ZDSYo8uKd+NITi6SF4XWNEUSRPYdXJKVJVQW2i4+j52rl7dtySVv0J0jcCNYvT5kZ2
         jbpGWYsGmadlbDKvanw9+Kj1PiK0GbOgHDQ5pPlMpGwCYRckqZTuU+zgfdWB4TRYRJsL
         +k9uFyDvdg3y7O1R5eOSFlku+60Q5h8CLXG/GHR9Gc+lw8AkCgvl1HbswfvRR5d5JAHR
         QqC48DtuMYdanc/0FYHsLqRipesOSUU8CLLqkSImPK2tWnl0mRos+YqRkydMNDLvMbFY
         NNx3Q9h5uo0eta2Lhs0Pw6wMgKbjx0yBU0j55/OijIPSBz++z3I3hZZJe/Gv868DN8eM
         vEsg==
X-Forwarded-Encrypted: i=1; AL+hErGbmH3tCwOjzCrE3XPyaSSuzqYdn3Y54dUinY5Q3Z0sfB9R9C5gf5EOVpOxRQRRTfHHAypnaDqPAbAT1kQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yCDl1ktC88dkWO8tBcjf+sbg1ftK7E9kHfOuMGMK8MgHtVTlO
	Oc7s/Vnw+pnchtGWVV48acujZic0oHHkfS05H9TkjKBHlDWszltotW76kF/TW0TTMNlAyYKOPAW
	GWChttQUzeXfN/mKM34alhRoHGK0g9kY=
X-Gm-Gg: AZFdTZdmq+TMIz83WEq4E04BJreUWjP3PAoS7kQdrUvjx1TbHDAgKliCb/RNeFByaUD
	asu65kKvAOJgyKktWxXWp/Jj9p0IOOFrQobeFSjgEOxJd7Ffcc+6UOurCfs4SaQRpKZyAEMcPQT
	YadgZq0zQGoG/5ySerlSOrOg3vUaDTvjYq+kXz5en9qnttSedMeKd/ATgqEoamFh84wfT8req+R
	cfGDS68moGoj6v060bLZwkhEo0S3vDFPe3EPb+COgAltg/LYQ2pjUvELcauh3/T7idcWQ6N9SGv
	vmO3fgu8jvVScTm7jGe+bQArt55+ev+I+yNV3pVFCBi17DT0JI5cyxzlb60bbf/OvMqOyobCpZj
	ScCKTBPBj566NgImAaC1bKAS0bnckcPTwKUymlPO0cF9EaLauC9zhAZQPl0iGMNHnyFnPohu+Hp
	uB9mYV+ctlEK5SgHBdWw==
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id
 5b1f17b1804b1-4bb88922972mr332691925e9.34.1795551305115; Tue, 24 Nov 2026
 12:15:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260408100247.2065245-1-keenanat2000@gmail.com>
 <awRRgnRmeMDUvUWz@redhat.com> <awR4plQC_oIvoc2R@redhat.com>
In-Reply-To: <awR4plQC_oIvoc2R@redhat.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 24 Nov 2026 12:14:53 -0800
X-Gm-Features: Aa3M54of-GC7sd-E-HO4C2skMXhoQ64d9-dKg68squRz4l7HKi30ussUDXcU57o
Message-ID: <CAEf4BzanZC0Zwf2FDVUjv7JxDvL3dQ3MKvJ=_Wz5k1aADD4y+g@mail.gmail.com>
Subject: Re: [PATCH] uprobes: clear extra_consumers before pooling return instances
To: Oleg Nesterov <oleg@redhat.com>
Cc: Keenan Dong <keenanat2000@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mhiramat@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Keke Ming <ming.jvle@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:32=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> On 11/23, Oleg Nesterov wrote:
> >
> > Andrii, can you take a look? I never understood this code in details,
> > and today I forgot everything...
> >
> > On 04/08, Keenan Dong wrote:
> > >
> > > ri_pool_push() returns a return_instance to the per-task pool for
> > > later reuse. The pool reset clears cons_cnt, but it leaves
> > > extra_consumers behind.
> >
> > So at first glance this doesn't look right no matter what...
> >
> > > A reused return_instance can later grow a fresh extra_consumers
> > > array and then reach the cleanup path with a stale pointer from its
> > > previous lifetime, leading to a double free of the recycled object.
> >
> > Can you add more details to explain the possible double free?
> > This is not immediately obvious, at least not to me.
>
> May be this has something to do with dup_utask() -> dup_return_instance()=
 ?
>
> If cons_cnt =3D 0 but ri->extra_consumers !=3D NULL, then
> dup_return_instance() -> kmemdup() will copy old->extra_consumers, but
> but kmemdup(old->extra_consumers) won't be called?
>

I think all we need this just this:

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index c47b1ee266d5..f265527e6897 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -2118,6 +2118,9 @@ static struct return_instance
*dup_return_instance(struct return_instance *old)
                        kfree(ri);
                        return NULL;
                }
+       } else {
+               /* old->extra_consumers can be a leftover buffer from
ri reuse */
+               ri->extra_consumers =3D NULL;
        }

        return ri;

cc'ing Keke Ming who was going to send this as a stand-alone fix
earlier this summer.


> Damn this code is too complex for me ;) Anyway, I think the changelog
> should say more.
>
> Oleg.
>
> > > --- a/kernel/events/uprobes.c
> > > +++ b/kernel/events/uprobes.c
> > > @@ -1945,6 +1945,8 @@ unsigned long uprobe_get_trap_addr(struct pt_re=
gs *regs)
> > >
> > >  static void ri_pool_push(struct uprobe_task *utask, struct return_in=
stance *ri)
> > >  {
> > > +   kfree(ri->extra_consumers);
> > > +   ri->extra_consumers =3D NULL;
> > >     ri->cons_cnt =3D 0;
> > >     ri->next =3D utask->ri_pool;
> > >     utask->ri_pool =3D ri;
> > > --
> > > 2.43.0
> > >
>
