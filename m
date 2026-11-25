Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795599663;
	b=oXmSyJBv+0RGFzrXZ/UyhHB/68VVP40ryGhkkEb9skeEZZCqMUqogJFvYvbIAzI3jlBT
	 KvG9r+Sd1RWPoX/a4lylPu0/1k5rGQhlN4KT6CKYnqG6FIAwf66oWqK8XjEdLrYXdeIsA
	 M+s/sx0uRVCCO3DitSNwWjlKPYqpKGgqhEBepEiNiXWK1/c5bGHF6+zsNw+vB3ugal1tj
	 DS4fzFJPs3sJbSSert2XxC5fin6bA9dsm+m1Ih3z9OEcmOUMVK8GYP4fjHh+I3cEJFYAe
	 +X3CzQYWRJQLVxkKuXa7Rmj9Orr0FWn1zpH1ixb7+cFfVtX/XUw4HgCxrwp9+DbX+tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a+QvvX1J/45GVD+nOsmA65+xntAc6mMZyDzh90koLlc=;
	b=kxDF944lu+F83CqT2wLAqGwuBMBlmvBTeMqZYRhJu68eBUZmuj1OPn2YIH+/WtvEtq5k
	 wP4cFueMKekK0qyyOjNGwlt5HlN9VYPjXTG0Wmkbh6pGerYXP6TTptC/denR+rwbw/f8M
	 OLYDD8uD42I9T1Kk9YDNQ1Cyz0MRx8tZtskNRVphsRr+Hh4HuDzDKJYcc8Bp1thlYDiY+
	 9xvv+wfWV+d7nnOvvVuNk5UDC9voB2WcFF/v06NJz7hDzCpBmDbh8Km+TO3Vh3wOZDHod
	 3Haox1gif7phWYIAjOOJPSBrDodTQZorqe89ui3N68XuihtaRLIelfVwOZXCcXkHg9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GJ1QD+oF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB5A606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB5A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GJ1QD+oF
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso43614045e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:41:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795599661; cv=none;
        d=google.com; s=arc-20260327;
        b=BFmBMW+ByJAL3UFvRkM2GaPCTGo1cs5R3FyyCE8g2yt2cYtf0HMXJvTX39Smv+UvZX
         6UXb3an2BD5sKPf588jEWkoDV8M2yskiuHPvI/lTwJR2ksnic1gTmDBSo0tI8djmnAGZ
         KhaqWDwJOFs9boYNCyNMfsq4RWL0Dj+RTkDljwVoe5GwxBY619IFt98Pf/rFy5sXBZkL
         k0Fb80ViOg0XtkRPIRqRq1IhvnMikIbMjyQltr4oqM9lvceprcBS7m3n8zna2SJUKKqH
         UIQZ4X4QNlRV0KGVt7wQsEvpx3BdgIq7FCZTr6K5UgQHsyfoxmaIO44SmUznUTx73DWt
         tL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a+QvvX1J/45GVD+nOsmA65+xntAc6mMZyDzh90koLlc=;
        fh=bRophFC02EEuzfO+X4tfPUhNKLlD6Gq91/+1wcJxDr4=;
        b=HHGYE5JGCwU8kDANsitWIoAo+4RYmoUTyz84XPeh99LMtO35GXzN7GY8PWI8IVMKV0
         08lkHYML/omnixkT1UN5zw6NxjGr8thh+7rxtQ5U531PhFB2dSLsT6a9NqkG1M3vDMrp
         qH9iqAiotSwliwKqUqpapjpSPaueU2k6efEjZ1UVccsqo18ha9BAaeHRIFD/K07HFCpE
         ZjzHLPcSrCSPYsXL8+9k7ahD1xpRSRKJIW4YiGfZPNcd8NZCSvIP7g1vC6DGuQvebN7U
         1HB5tjPWuQk6qZuw6UyqFO/iMtWFo5z2/YyNDqT4Y0b0yh8sNtfeBmQcal7WZzlYmZiL
         LAYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599661; x=1796204461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a+QvvX1J/45GVD+nOsmA65+xntAc6mMZyDzh90koLlc=;
        b=GJ1QD+oFh8SkRWfo+pbs/f9JnMVUt+HdqnKSkFRyIzWSczlekD3SaAbGo7PxJtz2Zw
         0zBG98WZKe3bglm2YxEz6NCauA607kV+qhgjcQJFsswK3Hy6A+7gaOYUp5AwwpROsdZC
         KD9cXtu69YEr16otz5uxYwX01E5QMuZNmC1iey3momSm4cGJI5lPn9Z65P+Vca314Z4Z
         5K4anX9tuiYqEYe7sUd/BIhipvDK3rzqevSKjheTko8ZIQf7ETsbBL+LCV8kWJY6wiwc
         /K2YWBuAQ6DawVVZhDpqkfiKXre5+EcUP2W+HsWf9YSp6qHrSF/cBvAJWQgF4MhY0RSw
         bf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599661; x=1796204461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+QvvX1J/45GVD+nOsmA65+xntAc6mMZyDzh90koLlc=;
        b=UzsDL2N0N9ghZN4AAERuJyo9+4z5oBXiGd2dOvCXZT/KVDUjCwsGTQKz4dOuD8g8Oh
         z2qvxc2oKh2p/vdj8lIvb2Wxqr+rvFiVYE544yUHptSTejn8RMMEFu3m/SOEdVoTu4FS
         5xj10jknKsqpoIQ2oglUdio5M0zcZXeH93ynNdLlevi919BpMaQVrWf6Hx9zLTRBppN4
         cNfjU5CQo7rcgpVrhHSa3/m9rRuLxIRSWrzPjoWlWMaC11lQvP/OdPLRMJMJto7KKQ4S
         QTc+0yJWh6GdOaldvkjgzS7s7I+83/v4uLTtC4rdto2S+Pmbz07sHBb7icv4MS7+j0tP
         Bp5A==
X-Forwarded-Encrypted: i=1; AL+hErGuhEX0MZ4ACct+nC0JA83hcqVQNZAb7uBzfLhIYOFo+ZLL5S5hZzUsl6qepWbb8mMaTWrEswTxLKSZ4Rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z93ztTdQ9GZgO3COtFaGIenoDWOX9zKVaqKZ9vSxmizsD+DtM3A
	7+564OyB7mwPNoFjtfmDpTZ80yB5bY/zQyWijVx8vPzHWnv5ce7RCFq8mhkUhuIxf6u7G0z9RwZ
	StNbHxPZ+f0KcVwRmKBmYAhW+rjOK+us=
X-Gm-Gg: AZFdTZc0dI5tbgWvfLGJkYJT2Z/rajw30nDx9ZHFe/XLxOGyaEtedhx5KXH5zVUI8HH
	rYNOlO9CqiaJ6KWJTWNoYZXBobD/ISLjBCF3vv3O+H8CHU+4qkcbAGQHRUwekye5qHXL6xqBmxx
	jEvWJAh08YuyGhppMGuhsPgdDIsPXs7a94hC8Bmf+vrSQqx3gWkaCzyU9cNG8LSpRd+pRLAwGmt
	lrcfysPFXWosf1f0Fu7vKcrMrAuiruB8MFFQd9r/9+v07eRd9WMjJPBh4Rc/QtmKGuOKOf4r/pm
	fHrsTe/3gcnZuDvvwcsbxCGc9OSRFStThnGWIvLyWVZq+6L910cOsFEtat4LFzh0CVDtC3Ah8Km
	NyOgC74vRlPFh8LGDwQEgjmWh9leLn3FlipNds8bAxedqEShBR1I71l8jFEeXriD3UoKiL0TPcd
	sADt0WsFBdaZ//B1Y=
X-Received: by 2002:a05:600c:4584:b0:4bb:6c71:b269 with SMTP id
 5b1f17b1804b1-4bb8881fbd2mr341861005e9.28.1795599660916; Wed, 25 Nov 2026
 01:41:00 -0800 (PST)
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
In-Reply-To: <CANpmjNNOVD3KVrau5KD4WzqxoMkZZoJCfdPzvjLmZsGy9zXBug@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 25 Nov 2026 17:40:49 +0800
X-Gm-Features: Aa3M54oTDKYDq6kmOJwEfEHGGc7qMp6rlREKg1yxsT880KhszTaPaWfsNoxdMeI
Message-ID: <CAN_Opa9zKzSptpNOnCzaW_EK0oT=HDDVoJxy5Q0crM+6b9bR_g@mail.gmail.com>
Subject: Re: [PATCH] kcsan: Detect cross-CPU races on {READ,WRITE}_ONCE_THIS_CPU()
To: Marco Elver <elver@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 6:24=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> On Tue, 24 Nov 2026 at 10:54, KunWu Chan <kunwu.chan@gmail.com> wrote:
> >
> > On Mon, Nov 23, 2026 at 9:51=E2=80=AFPM Marco Elver <elver@google.com> =
wrote:
> > >
> > > READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU() identify accesses to
> > > per-CPU data that are intended to race only with other contexts on th=
e
> > > same CPU. So far they are plain READ_ONCE() and WRITE_ONCE(): no mark=
ed
> > > accesses involving them are reported, incl. from other CPUs.
> > >
> > > Make the new accessors assert exclusivity but ignore same-CPU accesse=
s:
> > > READ_ONCE_THIS_CPU() asserts no concurrent writers,
> > > WRITE_ONCE_THIS_CPU() asserts no concurrent accesses.
> > >
> > > For KCSAN to ignore racing accesses from other contexts on the same C=
PU,
> > > introduce KCSAN_ACCESS_THIS_CPU, which makes KCSAN keep interrupts
> > > disabled while the watchpoint is set up.
> > >
> > > With that, any racing accesses (incl. marked ones) from other CPUs
> > > involving READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU() will be
> > > reported as "KCSAN: assert: race ...".
> > >
> > > Suggested-by: KunWu Chan <kunwu.chan@gmail.com>
> > > Cc: Thomas Gleixner <tglx@kernel.org>
> > > Cc: Paul E. McKenney <paulmck@kernel.org>
> > > Signed-off-by: Marco Elver <elver@google.com>
> > > ---
> > >  include/asm-generic/rwonce.h | 22 +++++++--
> > >  include/linux/kcsan-checks.h |  1 +
> > >  kernel/kcsan/core.c          |  6 ++-
> > >  kernel/kcsan/kcsan_test.c    | 90 ++++++++++++++++++++++++++++++++++=
++
> > >  4 files changed, 114 insertions(+), 5 deletions(-)
> [...]
> > I tested the patch on next-20261123. A 60-second rcutorture run
> > with strict KCSAN and interruptible watchers completed successfully.
> > I saw no reports involving got_idle_tick or tick_nohz_handler.
> > There was one report involving move_linked_works / queue_work_on.
> >
> > The latest KUnit run with kunit.filter_glob=3Dkcsan.test_this_cpu_* gav=
e:
> >
> >   local_noreport: 7/7 passed
> >   remote_write:   6/7 passed; threads=3D2 failed setup with -EBUSY
> >                   ("rcu running")
> >   remote_read:    5/7 passed; threads=3D16 and 32 failed
> >
> > The -EBUSY log shows that rcutorture was already running. The
> > remote_read failure at 32 threads occurred in both runs. I'll
> > rerun the KUnit cases with rcutorture disabled and check the
> > console for the failed cases.
>
> Thanks!
>
> > One test question: should local_noreport skip when interruptible
> > watchers are disabled? In that setup the ordinary watchpoint
> > path already masks local IRQs, so a pass wouldn't exercise the
> > new THIS_CPU behavior.
>
> The test will pass in both configurations, so a regression in either
> would be caught. Disabling is not necessary. More coverage is always
> better, even if it may not seem useful today.
>
> Thanks,
> -- Marco

Hi Marco,

Makes sense to keep the test in both configurations.

I reran the three new KUnit cases on next-20261123 with rcutorture
disabled, using the same image with interruptible watchers on and
off.  Both runs passed all three cases at all seven thread counts
(21/21 per run, no skips).

With watchers on, I checked the console reports for both remote
cases.  The two accesses were on different CPUs in each report.
The earlier -EBUSY and remote_read failures did not reproduce.
The separate 60-second rcutorture run also completed without any
reports involving got_idle_tick or tick_nohz_handler.

One question about the IRQ-off path.  A local NMI can still write
to the watched address while its KCSAN checks are disabled.  If
that changes the sampled value and no other access hits the
watchpoint, is an unknown-origin report expected for THIS_CPU?

Tested-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
