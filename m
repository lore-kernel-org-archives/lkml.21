Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795514621;
	b=ts8KVsmfdhIuFNpAesxPwKb+tpVu9QeBoakNQidT9A+3Cwl1PBKV14mZKf4M43Ni5e1I
	 xXakHEQYLMKAT4HA6n8a/V/7sK7tMSHivAa3Sk06QQR/xXxISZvehQRKluUVHruo1iZqx
	 t5nveP6yAaE/IJG/criMHfnVL4rZXD5XKYpkYP4eolVRTbjHJVhRs9UfbiHIkFTQE0Tdg
	 7tUARK4dFYw9dPoQ/RhpFuaHnJRyS/8p1+UrDUyDdoapanp9KYamDhV+14ZlQvSBke0ls
	 Q26S9mhu8XNNSQawOL8B5EaIhjs/W+uaPesIno+pq3omm3M1tQ+dCbosgjZ0/BLgSGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cGN5g9PtUGCG+wcdSVJumY3ZUtFUe8Es3+mlikmGYwY=;
	b=WjWKVO/OYDxavr0GAfQTUGJgpYXOotkgGRr0esQjr55EiCnwte+JGu8zn/RFFBck2BFH
	 cpGOFzwbTHWGgD8faSG2xw7oQL8nNqrPTP7HXfE0WtPcFoK4w0YoHxU5+ZjgEITip6mKZ
	 +hiCBI+F1IuYVX8rfSynRx/tKo3J1UfEuMx1+DUS6igiHfUpP/JYd7Dp5UvozqOGcnzHp
	 L/HyfV5UBgkyxL1Y4pZsKsa6ffPux7JYq/+ZMqV0/3jxAjOOYsOGM1X/nd9jXGKa6fAPa
	 qthZFZz2NZ6dy2r6xo7/yknnSsvfP+2MColkVNqOdGQDiWqq6yuWUbrCEyFqyPUVlcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=VmWAs86N;
	arc=fail smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9E9606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB9E9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=VmWAs86N
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so2065510b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795514620; cv=none;
        d=google.com; s=arc-20260327;
        b=V/G9i0g1Y2WFwrguI7ELfJffARoqocDq1eMsLHFeZxihRTlK3vWSQhyPSNQZ9i9NZj
         2epBIANfeMhcjM7gqlW9WnPZnNcHy5T8hqpVoOk0/KHkOV+qyO7VhrSHGfu4NUp0I8oS
         QYWZ+lRDGCb1f55ctJUVUafxPdFWGdxnqou6XhhmK5jRqo/SAQSfxhY4fcmI3o7ZK0pO
         22PGsTXDjIG59DF7FE87u1q0TxBw0Rq7LQQVkbVv76XNpiZlhWnHXQkpYPGLeIyfHtBd
         EDO4CQTF6sNLSJWnF5IGhUARS+VQFv0Bl6EIR6VtEWZGjo/Nz6CnXKiSyyZyKhfKcJEz
         xG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cGN5g9PtUGCG+wcdSVJumY3ZUtFUe8Es3+mlikmGYwY=;
        fh=xkUUDmNSneqXI2M/gTlavlaq5bjr9LWl6JsGS5zFlxU=;
        b=GGIjueIWG3Q8tA03EU7ziUKV6Sbl+AdioM0pDpG+9wl3qqJ8BEICV/YXhl4VFWSWLo
         biuAy2rN4h1jh8T/QCtd01Vq7bROzEy0icmN5BVpRmrHIWlKBp6+rUUsT6Dp88194Cdo
         3toJEFK5R2fI2WrnFZVB8v9Fs5SSJhF++JaW1AgMMlDCEUQDRLJxX1fs8wWCWa4yDY5T
         mV2TIZbjzxTw270v0b8/9SFVK/GMx8/T/FIZawQ5/7+RZ1hWraXccQp/bR/G3kBk1vme
         QbGoZ+EWM6czgPI+2jB/XCJCJ8tf557o6LB/fg4YtILML3DPQJ+Vnprt5v/3Ggp4ReGE
         fUew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795514620; x=1796119420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cGN5g9PtUGCG+wcdSVJumY3ZUtFUe8Es3+mlikmGYwY=;
        b=VmWAs86Nz7sib60O4izbmOD6cZh1oJHcY4TIr9SaP6pD5C0G2T6As0XqGlZXCid52l
         D7UokUSGtJok+76yw43RikasNHy7al4rTLqNt+q+izWEJlO4nwef7uYHHiWgKe9yWWTM
         I5j2coA6k1F5B5uggw7O4grg7Mi+N5CcJvy20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514620; x=1796119420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGN5g9PtUGCG+wcdSVJumY3ZUtFUe8Es3+mlikmGYwY=;
        b=2TpJgUw+0lSPCAgjYemAzmyFLOAw51h7V2jSuaOICnI0vFct0XORGyVFOXEbDxXZdH
         TinDSzJXvIwyuIbGe8naJ+AluiTfQ64SdqCu2eR6IUk26ADyvQcM+fXPqKGhC1xm685d
         tzipnEE4jVcmgI2MF5AuQRqEesfdWVeZSUAKuh3h9ZJ2yc6hk4+ERsO7WujyNYpp0m9Q
         aC6E3cRrWv8gRghAceTmOSLMjCmwlvZ2g9Keva1h1lf87mpCGJkk1Ln5S3+IYv4meDPw
         S31a4UdOLcilkbt9VT5VTQ70HyTMhfHGYgWUix67Yw+qtvE0b+sjRj5mrVrKRsHCkTnP
         kOhQ==
X-Forwarded-Encrypted: i=1; AL+hErEP0OtpankUcc8MDRiaHfnC4LUBfe8Y4gdNi4+xxj8Wlv2fZ91YSsl7Z/QPAZznVR2pTX9FXiRBC/cpyR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nQ2zEFM6/4bdP45X3R9i101MklfKBvYsxDjGIP5lCoe6Z7i0w
	FoX2Dq2aH/K09WXVp4NjoxweYvWZCm26uIIAq2bBKLbLDih5OI4t+javVEM5IpjVqt7hER1IJ7K
	1hO9KZeq7QvUMSc+Y0ovX2JJkEnFuEJRGCLsmCIr8
X-Gm-Gg: AZFdTZer8D16KrgeGQBAwJnJKSKhE7e/oZe/+Vj9yoLvQ8wvHsSrmYLaZyMxchPmgXL
	XYNvrgwXfYRAbGnWmyGl2K7OrZVGXayYK51yFdCiABh+CbrlaDZw1yUaplcpFR7YN6JkAVD+VWp
	Yy4pSSCIqA1KUds64Z/A5OIBi+xf012a3nb0X1p87TsyXJtmtE4cNbfi+JxZyBYbm6UBtroDmkp
	SWENBYFX4x+sjn5CEAtCSV+N4+2mHl0WuN6KjGPRFT1y2YXDMLcBNI++QFnu0FByK/TGmFa12Z+
	m7v/62SQDLFEW4yS1Xg4skbyLypcL/wGG4+Co5Gy/WlwKfkaIaRR/VLGTzlUYQU2BPqPxwW/EE/
	0HJP1XjaJevo7kBwmkSlCOL4FSRNsUJaalfGM7RgnDE88lini58S4M4tKlLtvckCq/TYcoQ+u19
	320lc0cmn+UVVwDVl7GYof
X-Received: by 2002:a05:6a00:3c84:b0:89e:ba55:119a with SMTP id
 d2e1a72fcca58-8c87d123bd5mr13499490b3a.47.1795514620227; Tue, 24 Nov 2026
 02:03:40 -0800 (PST)
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
In-Reply-To: <DN37NBGPJJG9.2DSVDCKS3UYTV@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Tue, 24 Nov 2026 05:03:29 -0500
X-Gm-Features: Aa3M54qvcfjcRlRGJK01N9tkR68vSDtEhX-HABSVQSN3K_q0am-4DoB8x5iA1ls
Message-ID: <CAM0EoMnVa=xGD3uiZKuzMfFL6oZNd=Umb0U7+_QUrTK7Ej-BYg@mail.gmail.com>
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

On Tue, Nov 24, 2026 at 1:00=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Nov 23, 2026 at 08:45 PM syzbot <syzbot+b6f8640465bdf47ca708@syzk=
aller.appspotmail.com> wrote:
> > rcu:           hardirqs   softirqs   csw/system
> > rcu:   number:     5264          0            0
> > rcu:  cputime:      138      52351           25   =3D=3D> 52490(ms)
>
> It's not tomoyo, mm or bpf. Looks like act_gate.
> Zero new softirqs in 52 sec, so one hrtimer_run_softirq() doesn't return.
>
> > RBP: ffff88807ed35538 R08: ffffffff91be1bbf R09: 1ffffffff237c377
> > R10: dffffc0000000000 R11: fffffbfff237c378 R12: ffff8880b8228600
> > R13: ffffffff89fd0480 R14: ffff8880b8228600 R15: 1ffff1101704514a
>
> The registers with lockdep struct sizes:
>
>   reg       value             points to
>   --------  ----------------  --------------------------------------
>   R14       ffff8880b8228600  cpu_base
>   R15 << 3  ffff8880b8228a50  clock_base[HRTIMER_BASE_TAI_SOFT].seq
>   RBP       ffff88807ed35538  kmalloc-512 + 0x138, tcf_gate->hitimer
>
> act_gate has the only soft hrtimer that can be on CLOCK_TAI.
> bpf_timer_init() rejects that clock.
>
> TCA_GATE_CYCLE_TIME is an unchecked u64. In gate_timer_func():
>
>   n =3D div64_u64(ktime_sub_ns(now, base), cycle);
>   close_time =3D ktime_add_ns(base, (n + 1) * cycle);
>
> With base =3D 0 and cycle =3D U64_MAX, n is 0 and close_time is -1.
> The timer restarts in the past and __hrtimer_run_queues() runs it again.
> It's there since
> commit a51c328df310 ("net: qos: introduce a gate control flow action").
>
> Jamal,
> taprio's INT_MAX limit doesn't fit. tdc uses cycle-time of 600 sec.
> The diff saturates the sum instead.

Looks familiar - i will take a look.

cheers,
jamal
> Here is a potential fix:
>
> diff --git a/net/sched/act_gate.c b/net/sched/act_gate.c
> index 711cf24..5422d60 100644
> --- a/net/sched/act_gate.c
> +++ b/net/sched/act_gate.c
> @@ -45,8 +45,9 @@ static void gate_get_start_time(struct tcf_gate *gact,
>                                 const struct tcf_gate_params *param,
>                                 ktime_t *start)
>  {
> -       ktime_t now, base, cycle;
> -       u64 n;
> +       u64 cycle =3D param->tcfg_cycletime;
> +       ktime_t now, base;
> +       u64 rem;
>
>         base =3D ns_to_ktime(param->tcfg_basetime);
>         now =3D gate_get_time(gact);
> @@ -56,10 +57,9 @@ static void gate_get_start_time(struct tcf_gate *gact,
>                 return;
>         }
>
> -       cycle =3D param->tcfg_cycletime;
> -
> -       n =3D div64_u64(ktime_sub_ns(now, base), cycle);
> -       *start =3D ktime_add_ns(base, (n + 1) * cycle);
> +       /* cycle is an unchecked u64, the sum must not wrap into the past=
 */
> +       div64_u64_rem(ktime_sub(now, base), cycle, &rem);
> +       *start =3D ktime_add_safe(now, cycle - rem);
>  }
>
>  static void gate_start_timer(struct tcf_gate *gact, ktime_t start)
> @@ -107,15 +107,8 @@ static enum hrtimer_restart gate_timer_func(struct h=
rtimer *timer)
>
>         now =3D gate_get_time(gact);
>
> -       if (ktime_after(now, close_time)) {
> -               ktime_t cycle, base;
> -               u64 n;
> -
> -               cycle =3D p->tcfg_cycletime;
> -               base =3D ns_to_ktime(p->tcfg_basetime);
> -               n =3D div64_u64(ktime_sub_ns(now, base), cycle);
> -               close_time =3D ktime_add_ns(base, (n + 1) * cycle);
> -       }
> +       if (ktime_after(now, close_time))
> +               gate_get_start_time(gact, p, &close_time);
>
>         gact->next_entry =3D next;
>
