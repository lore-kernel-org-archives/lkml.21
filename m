Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795584921;
	b=z166/BfRJM0NxC0PSwpz8eUDG+kyIVPa6yOc44EF5AEZ9rHm3VaDTWRpW070lcztWCxE
	 R81XMQW1+NOogk4lHzQ49FCVSAKSVMDtU94kZ+GkN43sSWKGbOp4Cp30X5u5o6TUe3OIJ
	 F7z3l+A8xcbyhS1ak+PYolhnG2JAW5MYJl2EPz3Ga7gBAIyNP9JRb+uzOzO4KnJq9EIHc
	 9km0tYDC0BGrySSEXRmLTLciJZYRognCv6GvpKKa86dROBjOF0+OXIoDmb06cHYoXk1jk
	 Rs8H/6fiNQvRyCOs5oQZ0REDjsAy9HH/DNjOK93kj9LjZe7tF1LN39PQ/7QkvTTFbTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795584921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DIXlRqv/2z9juZ40YrnkT5CgsYY3lUKcwDePl9HeFiQ=;
	b=uWbsXlsHwBHTSV0ZoVKYcxnyESUoZ59BPECsT1PRKel13bc5Yv0v6xyv8Rl0EV7HQAHh
	 1yxVVY6C83MVELM/f7mrbkKwXJOgoRoaX4mt2l7lwdPGqe19iK0KzMq7oWhTjO53w26l+
	 9j2Cp8F76RFGqABkjmUdLD9ELoEOF0rkEQFtwswRBVMdJ/x1MDRvlValbCIWaB1aCg1ID
	 BYOBczZBLpJyH7PD1o5AfOKgVQHZ1810Z5l79VP2b6NyDj7/U9Ti2dL4PopiQwiZnwZrS
	 ox+GGBqeg3RBhM7o3pE9uX8ULWyFRiwo5Io9dl3jmFBSQn5vS9j3JZJqu632GOKCzwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9EY6P+m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D8A606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D8A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9EY6P+m
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2760477f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:35:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795584919; cv=none;
        d=google.com; s=arc-20260327;
        b=J5hVVG8Oamg6L1Uc7G5ZvbN4LeDApie/YQXtEwv5eQ+qP06OIvtrMwP/0tpo4RUHQl
         BeHXxzLf9pO/f2Jo72M0deltwx+nG7PNpytfNs1HN6lGRsGEMLE5C4xDXRsrr5nn7BR2
         LAxFZlw4wlGjTYhEny0Ub7YpJSVXWsEauP15lQI2k9BSGnVhA0k9b/tthka+CzGMc9kM
         snRVMjh9rzLjG0APIXTdFuyEIlL8FFQFFiSbMHcdHtJPyms2Nq8P2h5UDZAsz6zmHZu2
         DKNGLkIiz4HleAFy8vZ9NZt4lxFMs593vlFKrj6Pu/E9aEvX9PeomZDrpFoxpH1WaVu5
         C/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DIXlRqv/2z9juZ40YrnkT5CgsYY3lUKcwDePl9HeFiQ=;
        fh=Ak8VgUSe//JoOeLy21cTN7DNn4FKaDz+Y8psvZFENbE=;
        b=JXXh0Y7VvyILV4+4bBsvG1v5gaTjfqv5XU1i+Atv1u6+9cC8cFbQDn4q38nZpKY6+E
         2GfxeYyOuR91fy8NrbnbqZlnmjEaCZtbVJm2+fyC5plcawJnmdHsj5AviDxd3/JBcgoc
         IAMtaYR29SS6JmeVIbjDHMams10ZYi8Xr0k3Hiwz+OjZjDTrG4jUWy0+L39Zn5ilJAyp
         Sh62APqjc6qCme9CGQiowk9RnNlP/8Ck2bn8QjwdFt5XLd8gldn8dxnWO7k0hUF/LtZh
         WyS45b/4Tq+ExF7V+wwhibrWgwucqrBZwDhqgd4a/J4LTp3zFdB8yr4IBncgGAHgsD2d
         olCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795584919; x=1796189719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DIXlRqv/2z9juZ40YrnkT5CgsYY3lUKcwDePl9HeFiQ=;
        b=o9EY6P+mlgR+Kct33Mf3oZ0z1Oc0os21EYW2QyzW2/KNaGbvnLvNQ8sbCG5zDp9ueM
         u74Zm24oxxRQMNK8hqfFaWEdJFH0cN3a1TcZczjJ+aIs34Nsl6I4SwyHwsjmQQ9F0x+J
         OK6h9X81phhEYtjBsFd2navN8SjSL+p0LFwLU6L4ln0fwBt3dCRFnn3mfiHM6Km9sSgH
         JmscklCVftyGv/9ZF0tvRlyZkOao23jFBabCKvBC/8mdzxVOGENVkH3HPv3veqfyKrdW
         J9O+RFR7TCiRwUn5t+45pLuktAgdua12wVTdocQvIPwTjpkpwZIhpwOLoTqMOz3yzhLQ
         ERjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795584919; x=1796189719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIXlRqv/2z9juZ40YrnkT5CgsYY3lUKcwDePl9HeFiQ=;
        b=e/96BGUFIoCwGKtekeW3At0ZkbhY83y/t4ir1b5lJGAjHHv9nlmY0ZU0gtiCJQ0ntu
         8WQjVKHTZXNmRMh7bCvn6ZlQMHoHQ0ipuamjDt92NPcJfnj2TDU/ukRK2YXvIQ5ViwmI
         XtwukL+un8hPJyEOAm8LJqSX4Ld07Z6jJX9x79zUZ2qfFkeOnEjB2YNShK66xAKDR3QF
         qVTa1I7nkjC5Wwj1U4cCQPbDtQTKK6eEGg7UrdTUqzBAMuAv2o9kJOvs2kYlp7sg1byK
         pjcAdP0bsaqhbubQI1LmTtgYcIPu44cNAcPIzqqNHCNBQOMk9tk/tAvq6EQUf1a6YK0P
         8sWQ==
X-Forwarded-Encrypted: i=1; AL+hErGhKS203y/ly8/oI5X/g0BjZo/M2fvxG4AJOjzrvMbcEG6YV+zBYHdoJ5qCTl9ZNcpMGRg0ED8iumx940A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/npHB3ratV7gkjHH6+GN2gg83Z/7/TO/r5iqTkvSxzS5LKoOZT
	zn7yCEIJGpE3Zi5YGvnSwd7t6BDFh9Aw0KLkr00fYrXZAwFfwq+xE9RkpOZ9uh2jMU/zDmttk/G
	a/QrDjtnNtDRZy5T8zWNZnavhag2aGII=
X-Gm-Gg: AZFdTZf9k+mq7470llU89tIAxhUxFSakfoD3rw5nf1NbmViW3z1ycjH4VHU+/XbshNb
	rtpYWAcxxnB7aQUoDObdKrJQs20NeCsd1Hq43euJsl0LgbOeEjjT7ngL/annMxM33zrluQ4hBfU
	vOvckFDJUtCt1DmjkkhiEbq3hCiItZkvmvOjE3p123egEfs8eTZL3CVVuQRg8zoBmP6h5hiiBhy
	k1xOQu/ubwYBsb/HPnSSsQUkhmJzzmE9MKGbOCB1dT572lfUPZFDkCsVKAeKmMbdw7seX1QptU2
	UL2ZyMKghQKx51sZV4l3ts0XpyJpuBk58NAQvt6tPkS7ZJjMOPBBJJO1KjQXQoGM8yfpDXesa4d
	P0t/eAAgzAKppuA3mFc/hAOWS0Ur1Wj9cndKZWap9qfVkDaTaeJfFxUBIzAqPDZY+CuljjFWW8/
	HfXBhEoLXbqsoSRl3s3cA0j5BOL80y7qm4R4Ryvlo=
X-Received: by 2002:a05:6000:1788:b0:492:3176:3d6f with SMTP id
 ffacd0b85a97d-4abb400aefcmr31101621f8f.47.1795584919374; Tue, 24 Nov 2026
 21:35:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com>
 <DN38312WXPDJ.2KLUTCWSDFL3P@gmail.com> <CAEf4BzavErcSOZhGobqEo68d+2bCnJ8vFxxT_vqb+oQw1j1d7g@mail.gmail.com>
 <DN3X5OIRXSWR.2Y70DWFMPDXQF@gmail.com>
In-Reply-To: <DN3X5OIRXSWR.2Y70DWFMPDXQF@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 24 Nov 2026 21:35:07 -0800
X-Gm-Features: Aa3M54pxoPCdtejSbeLTFS7uA2H68O1zStyUPispdlpA_6QwbCBs5gPBT8bsyj0
Message-ID: <CAEf4BzYxBM3R1s6XDSpN5htzMho4Jp2uBsx9ZBKTPNBvmEffxw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/4] bpf: Check recursion per task for
 preemptible programs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: mikeba@sentinelone.com, bpf@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	JP Kobryn <jp.kobryn@linux.dev>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 6:00=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Nov 24, 2026 at 01:47 PM Andrii Nakryiko <andrii.nakryiko@gmail.c=
om> wrote:
> >> +       for (ctx =3D old_ctx; ctx; ctx =3D ctx->saved_run_ctx) {
> >
> > do you mind checking if unlikely() around ctx improves performance?
>
> Mike,
> pls try it on respin.
>
> > So basically to opt out from this behavior BPF program would need to
> > stop using any per-CPU maps and just implement its own poor man's
> > per-CPU storage?
>
> poor mans's per-cpu with bpf_get_smp_processor_id() shouldn't work
> as an opt-out. See section 6.

it's hard to weed through that verbiage in section 6, are you
proposing to mark "needs per-cpu protection" if BPF program is calling
bpf_get_smp_processor_id()?

>
> > And even using SEC(".percpu") would still be detected
> > as per-CPU usage, right?
>
> This one is pretty much brand new, so there is no data to make
> a decision. I can see arguments both ways.

.percpu is backed by PERCPU_ARRAY, so we don't need any data to say
that it will trigger the protection, do we?

>
> > Should we give a way to opt-out of this protection explicitly while
> > still using per-CPU maps?
>
> After looking at the data, I think we shouldn't allow it.
>
> An opt-out is for a prog that protects its per-cpu data on its own.
> In the v1 thread your example was stack_trace_scratch in wprof.
> It doesn't work. wprof is broken today, without this series.
> An event gets args or a stack of another task. wprof 8dd41e18 on
> bpf-next, corrupt events / all events:
>
>   -U                             what's wrong  lazy      full
>   -----------------------------  ------------  --------  ---------
>   u:func (arg:0, arg:1:str)      args          1928/16M  9111/17M
>   u:func (..., stack)            stack         683/15M   3419/15M
>   raw_tp:sys_enter (arg:id) and  args          3491/48M  16673/44M
>   tp:syscalls:sys_enter_openat
>
> utrace_scratch has no protection.

yeah, I was lazy :)

> stack_trace_cur handles nesting, but not preemption:
>
>   task A                task B                task C
>   idx 0, st_cnt =3D 1
>   preempted
>                         idx 1, st_cnt =3D 2
>                         preempted
>   put, st_cnt =3D 1
>                                               idx 1    <- slot of B

yeah, this is true, just a stack-like approach doesn't give 100%
guarantee (though in practice it has been good enough so far, though
perhaps I just didn't heavily run into new preemptible kernels), but a
better approach would be to use bitset + find first unset bit
approach. I'll play with it.

>
> With -S offcpu task C is wprof_task_switch. Then the utrace event has
> a record of kind ST_OFFCPU.
> uprobes have no protection. That's what an opt-out gives to raw_tp, tp
> and fentry progs:
>
>   -U, lazy                 today     preempt off  opt-out
>   -----------------------  --------  -----------  --------
>   raw_tp only, args        0         0            2849/45M
>   raw_tp only, stack       0         0            4081/27M
>   raw_tp and tp, args      3491/48M  0            3166/54M
>
> The series doesn't touch uprobes, so wprof needs its own fix for them.
> The default mode of wprof, without -U, is fine.
>
> Now the bigger question: do we need preempt_disable() at all?
> We do. Without it progs of 17 out of 69 projects in [1] corrupt their
> data. 12 of them have progs that are clean today.
>

"Can corrupt in rare circumstances (in practice)", but sure, sure :)

Still, choosing between handling all events and having bugs (fixable)
of handling per-CPU data in my BPF program, I'll choose the former.
Even if we don't want to make that a default, that's fine, but please
at least give me a way to opt out from the kernel's
over-protectiveness :) and not using per-cpu maps is not a way to opt
out, it has its valid uses even with preemption. Think about simple
per-CPU stats/counters updated with atomic operations and aggregated
across CPUs in user space, periodically. E.g., I believe BPF
selftests's bench uses this approach, why would it need preemption
disablement just for this?

[...]
