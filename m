Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515473;
	b=VpiJHkF7OQPyhIQEQUhLZm9XeDBIXapr12vz7Nf2tdEb4ISdVmX9LgcD77Pu7KJN51uf
	 shN58kpwqlRhr+m9VmqGdPMcejI65fGz0RDszHLR6lsd/NCPBB7iSoKh7cyjbQXWJvkaJ
	 MMD7RkcBLLvr5CkvMZ6LnPKAuMmFAODxid4UmOyF2c8sFebsbpThngNDPT8yjCOTW4gIm
	 JxGaPRwm9q5uDFgt9XMzGZExNH7FxY0YsgZkrqCRNfo2Uk5pAMJDfwpijM2i+EGFhCv30
	 ERhjlG3BLbD+MDH1Vhq5elRDpQtd5KFSN+cfhTWgvhr+pmVwwCPegg6VNitPfM65+gQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cDR7cjV4IRioJgp9xWXyZAeSRy7CXHNvvQiffZPND/Q=;
	b=t4S0+t701Cu92lWx5sLRcAQrmWN+bepJ3W6474G2VPFGyw7sjJvdhFvHioX71FoUI005
	 1ydoqhDvfKh5I4E0CAqTfUDusZDkxSWTlqSYh91WS2ScFgKOCw7khH7XLqnn71hO4j0ar
	 pn2l6a6Oi2u/mg/Q5AS8H0Nf2Ybgxxz1q50mca+iTNZHG+OecQzRwChXRg6lUW26/yK3q
	 r/23uxG6ArbV9l9obUHMZmuetwqEt0LXuqlsjIx1d02G764OhsDcCnXV3QxN/d5crIrtv
	 YAhAxe7B/hMmWfWVjnqEnHEhT7x5DnToszqmnqBkQe5NuZuOX0NKFzwV0kMs3BTUQuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=boQDOESY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE071606A680
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE071606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=boQDOESY
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so2203791b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:17:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515469; cv=none;
        d=google.com; s=arc-20260327;
        b=LmgA5/G0dUArvolM//FSC+DraYF7TzpAh1Zqs/XtzUnOEeoZgpghLgfflc99mBRAuc
         qqHPuUzF/ycuThMJMFvZrUGx1m3guxnQqxhBUJqi/pITDehux2qTVPf7V2yJka5aS3qw
         F77d+IGEuq26StGbNlUxihc8s9QZF22mKL0+BPokpEaWbVCQM9Zj+tH7ZLQPXaHEltmV
         Kfiwd2QSNOveRPw3jb3wO7YniLoVl1jYUnzF9UP+123CA+0rxhBp8QNzXcPiTV+GvUyq
         ehwmZ2yQo3CDSs5f1NtHNZ4LaXSWgSR8VDUetPv9O4NydrE1VMhKIEC4OUGKLvXcbNzr
         3Dag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cDR7cjV4IRioJgp9xWXyZAeSRy7CXHNvvQiffZPND/Q=;
        fh=VuHmA1C6aEIZZjulPGF2ha9JbMBYbkmjIattDuTdMOc=;
        b=Y4gz3CUs7UtN5lNf9Dtxw9Ry5iHHQR7mFt3/y3vAB/FFo8pXPaF6gqkVmTdTXsJWPg
         u/u5FGfF3q/s0axVEguaHKOv8RWyBecg2EReyZpmFFG/Mme2++kXv6eLvtcij1xhbkJ2
         C6hU9lOf/0Ho37Mb4unXLhATJ/Dy0rXzSJC5bXXxLRRkFdifNzdpJp7Q42L4v0ci3Tpg
         fJFWjOkdMjOiFv9LqKdPWlNgJBpu6wAcrgYAALieKUQVJyOv7gLLhazBuQP9XDpb12lD
         raYva2dz3SP92IXeR1QCYP1CnRlu/ElOG1D8sIufPaIBfaouDRBKIVGejaDtahp/D2KJ
         QuQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795515469; x=1796120269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cDR7cjV4IRioJgp9xWXyZAeSRy7CXHNvvQiffZPND/Q=;
        b=boQDOESYfuu+ei6nPbUoODpl/Ek47OYUgvhVk99ETOZyiaz2nZqCLusCouY2MPVsrf
         Lmi4VNPNuXk5gN0d8V16BfTeGNVTHqfHv8lmY2KZWvPzn/MwZzGSASY+bMZQ5SWPoW91
         4pw6s5nM+6RqviziclgIXLw7PFOAQx7tuzf3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515469; x=1796120269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cDR7cjV4IRioJgp9xWXyZAeSRy7CXHNvvQiffZPND/Q=;
        b=ofzk/LvW8G7AqgwPpCLMlBw+ltFsBlCcloVPbKs06w6ozNOIFvEUkgFPudVGYpJgrX
         CN/mpHJXSHy9/YEvkDK8/0Fmq2TMosshWPGDO6ONGnwzqSyG4tKoz+50Jtycsg9aM8do
         ZfDK20WfB+ZCliwiuTXNlLCJzBt8OAD1myvwY7VDbNmBSjXxgjIsDb9NDWsJIa5zdBst
         6yP6yHbYcJSq7QFh8/hvynLlZiBiZQnPyVYf/dcLePolEsvTw725DJ7mkRToiK9ViyKf
         W66jlfdZcPVeAoHcOccAx0JBmWFgkJxRhHnfF/7O+zoPzCRo8JM1IPhQkg0PFg4VPltO
         aAvw==
X-Forwarded-Encrypted: i=1; AL+hErEep/fec4REBKO//ydnDipC49HeuGSuyx/ICgyNlP45teB2dAMmCmA9CyhTVs076OQfywVUAs0PAwWLJlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U2cUo2sYwRuOw4A/3rUVDmkjTqrkXW01FhDNI0DlGkwRWDUuI
	oE7eTKkGzTrgrLd9KBOrvm16Ylw3srUYCRyC8L2wTm3cKHkZi4ZhmLnikRKDZgZfGQHstDMLtFC
	rjqcTlAsk2GOymg/6akqtQ1LtY5pV6mhe1XdQ4W9V
X-Gm-Gg: AZFdTZdrfnz0flarWBGBZT7j4fqs2IfXhbUwx0h8UV1ze/K+Qef1HKdXz02OPUYH328
	FBWvRpPl8oiqjVcTXnk8sq0MbihbXN/4GAYr8sAuTuqHMh6ZlpZRFF4+4LtJc7DNcV8O000+vCv
	T8N6zZ0fehfBHb6RshO5NCqvqUZcEWXv/HACdumTSN0dCrwapmnmReJ5zsCDu/ur7RvMcnz3Uc5
	E747ka0SBMkpNbeCOXt8vh8/rhwVBvTe2nR0EJDlNxiLFkF04G7bzprQcb4fP50cK7oQhEW36Xx
	b3UDMN5yC3B4f2sxBLMkmjfMADTalDHdTXte9UUMFHgI4ZIyTNWZJOJ5seZJkm8dzcQ2bM63z5K
	hQuB9Bidw21fidKwUY1NOsHzRIKS4JcolquPeVjll/+hSCK4DXbyc9feyZPXbXoBwANXqobf+MO
	dP+Rn4HKIb5TIPjXw/ttkq
X-Received: by 2002:a05:6a21:4a8c:b0:3f2:acd9:132e with SMTP id
 adf61e73a8af0-4014db57e24mr12442219637.61.1795515469040; Tue, 24 Nov 2026
 02:17:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6b051681.58b41460.7037.0590.GAE@google.com> <DN37NBGPJJG9.2DSVDCKS3UYTV@gmail.com>
 <CAM0EoMnVa=xGD3uiZKuzMfFL6oZNd=Umb0U7+_QUrTK7Ej-BYg@mail.gmail.com>
In-Reply-To: <CAM0EoMnVa=xGD3uiZKuzMfFL6oZNd=Umb0U7+_QUrTK7Ej-BYg@mail.gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Tue, 24 Nov 2026 05:17:38 -0500
X-Gm-Features: Aa3M54oAhgDu4a3QN-cUvm8ntTPorq0ToGdV6xzEFC1H8I-IekXAnPLMj4fFDqA
Message-ID: <CAM0EoMn=ZghG5KFu2Nc=W-=KjDv=epspFHZVDY4ww5a9GBUaHQ@mail.gmail.com>
Subject: Re: net: act_gate bug. was: [syzbot] [tomoyo?] [mm?] INFO: rcu
 detected stall in security_file_ioctl (9)
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: syzbot <syzbot+b6f8640465bdf47ca708@syzkaller.appspotmail.com>, 
	akpm@linux-foundation.org, andrii@kernel.org, bpf@vger.kernel.org, 
	brauner@kernel.org, daniel@iogearbox.net, jack@suse.cz, jmorris@namei.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, paul@paul-moore.com, 
	penguin-kernel@i-love.sakura.ne.jp, serge@hallyn.com, 
	syzkaller-bugs@googlegroups.com, takedakn@nttdata.co.jp, 
	tomoyo-users_en@lists.sourceforge.net, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 5:03=E2=80=AFAM Jamal Hadi Salim <jhs@mojatatu.com>=
 wrote:
>
> On Tue, Nov 24, 2026 at 1:00=E2=80=AFAM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Mon, Nov 23, 2026 at 08:45 PM syzbot <syzbot+b6f8640465bdf47ca708@sy=
zkaller.appspotmail.com> wrote:
> > > rcu:           hardirqs   softirqs   csw/system
> > > rcu:   number:     5264          0            0
> > > rcu:  cputime:      138      52351           25   =3D=3D> 52490(ms)
> >
> > It's not tomoyo, mm or bpf. Looks like act_gate.
> > Zero new softirqs in 52 sec, so one hrtimer_run_softirq() doesn't retur=
n.
> >
> > > RBP: ffff88807ed35538 R08: ffffffff91be1bbf R09: 1ffffffff237c377
> > > R10: dffffc0000000000 R11: fffffbfff237c378 R12: ffff8880b8228600
> > > R13: ffffffff89fd0480 R14: ffff8880b8228600 R15: 1ffff1101704514a
> >
> > The registers with lockdep struct sizes:
> >
> >   reg       value             points to
> >   --------  ----------------  --------------------------------------
> >   R14       ffff8880b8228600  cpu_base
> >   R15 << 3  ffff8880b8228a50  clock_base[HRTIMER_BASE_TAI_SOFT].seq
> >   RBP       ffff88807ed35538  kmalloc-512 + 0x138, tcf_gate->hitimer
> >
> > act_gate has the only soft hrtimer that can be on CLOCK_TAI.
> > bpf_timer_init() rejects that clock.
> >
> > TCA_GATE_CYCLE_TIME is an unchecked u64. In gate_timer_func():
> >
> >   n =3D div64_u64(ktime_sub_ns(now, base), cycle);
> >   close_time =3D ktime_add_ns(base, (n + 1) * cycle);
> >
> > With base =3D 0 and cycle =3D U64_MAX, n is 0 and close_time is -1.
> > The timer restarts in the past and __hrtimer_run_queues() runs it again=
.
> > It's there since
> > commit a51c328df310 ("net: qos: introduce a gate control flow action").
> >
> > Jamal,
> > taprio's INT_MAX limit doesn't fit. tdc uses cycle-time of 600 sec.
> > The diff saturates the sum instead.
>
> Looks familiar - i will take a look.

Ok, found an abandoned related thread in my list:
https://lore.kernel.org/netdev/tencent_FAEDEECDD478AE6DFC2DE96D389440E96A0A=
@qq.com/
I will take it from here; it looks like your patch is still needed and
requires a fixup to the abandoned one as well. I need to reproduce
this first.

cheers,
jamal

> cheers,
> jamal
> > Here is a potential fix:
> >
> > diff --git a/net/sched/act_gate.c b/net/sched/act_gate.c
> > index 711cf24..5422d60 100644
> > --- a/net/sched/act_gate.c
> > +++ b/net/sched/act_gate.c
> > @@ -45,8 +45,9 @@ static void gate_get_start_time(struct tcf_gate *gact=
,
> >                                 const struct tcf_gate_params *param,
> >                                 ktime_t *start)
> >  {
> > -       ktime_t now, base, cycle;
> > -       u64 n;
> > +       u64 cycle =3D param->tcfg_cycletime;
> > +       ktime_t now, base;
> > +       u64 rem;
> >
> >         base =3D ns_to_ktime(param->tcfg_basetime);
> >         now =3D gate_get_time(gact);
> > @@ -56,10 +57,9 @@ static void gate_get_start_time(struct tcf_gate *gac=
t,
> >                 return;
> >         }
> >
> > -       cycle =3D param->tcfg_cycletime;
> > -
> > -       n =3D div64_u64(ktime_sub_ns(now, base), cycle);
> > -       *start =3D ktime_add_ns(base, (n + 1) * cycle);
> > +       /* cycle is an unchecked u64, the sum must not wrap into the pa=
st */
> > +       div64_u64_rem(ktime_sub(now, base), cycle, &rem);
> > +       *start =3D ktime_add_safe(now, cycle - rem);
> >  }
> >
> >  static void gate_start_timer(struct tcf_gate *gact, ktime_t start)
> > @@ -107,15 +107,8 @@ static enum hrtimer_restart gate_timer_func(struct=
 hrtimer *timer)
> >
> >         now =3D gate_get_time(gact);
> >
> > -       if (ktime_after(now, close_time)) {
> > -               ktime_t cycle, base;
> > -               u64 n;
> > -
> > -               cycle =3D p->tcfg_cycletime;
> > -               base =3D ns_to_ktime(p->tcfg_basetime);
> > -               n =3D div64_u64(ktime_sub_ns(now, base), cycle);
> > -               close_time =3D ktime_add_ns(base, (n + 1) * cycle);
> > -       }
> > +       if (ktime_after(now, close_time))
> > +               gate_get_start_time(gact, p, &close_time);
> >
> >         gact->next_entry =3D next;
> >
