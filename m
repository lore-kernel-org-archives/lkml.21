Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795556892;
	b=nI/py9lXmLV56pcv3i5FGYvftzz8SU8gj2hP9ehxji/U8bA6Vv1UhL4xy5pbHHfC3eGH
	 3G+Bje7PUp74SwLArExrfKdSkozC3gJtZy/iH61ZNQfXnGv2RSEhSH2KY7O8vC/Ss2Rc7
	 OPWXpcdNqGpatNOcLWMyPKpiKCYNCKKNMFkFttStr46UEbxseHO3xK4xdcSy3vBLfkJN7
	 St7KIFCvXcrJNu2DYQIbPAQ2z9aHSZasYpzUhbgSDHvV24bLGjcfFCuRMVE2qnoLPoIof
	 4V5X7dxjc33PuslVhBr0e2W6np5I4q2YOHMU9OOHx/T1uRETZZG1v6+z62JbEGUsaYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SgapFXyCDKFt+peJ7rxw0qXMyT6IhM0lKM6Lr08CTds=;
	b=sa8749OTBW1lC0Qc706xcfPYg5FoH4cUQ2xRVrg9nPUeP032h/hWEzzKNV08z4Bp8b9o
	 yxnX6p6FuXbanri5p0FOpx7vr24db8q/IuxWUF5vfIEtMWfSNDlg/avH5sUFikYl96w56
	 8spf+jrXub4ESLnh+IIFrncSRttsL97qEIoYkl1gZmDsMLFvAkIPyW5NwZDdm0ZSHdGM8
	 vpezY2pwOBK3cvcMwaDL4f1kCHDs56ZtuTJsB7vOlMT0TXvasT+F/dhQWN0vkoAyppLH5
	 xT98gYm6k5DHsCWnpgcYPki/XoLbn9wmMFO2adj/QlbjUAd4INQiiOtcPM2iA2BbXfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJVqJJ+6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB09606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB09606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJVqJJ+6
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so2966749f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:48:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556890; cv=none;
        d=google.com; s=arc-20260327;
        b=ofalQ7LqWEo+22iKHG6BayZQgEw2H+fs9bfLPtf/H8bsFd5KCrzGJFeVZ4LjfjqR2b
         kpYpK8G6mjYf0sNOEunrB0yXw8CUseWT+WKqVBQAHzqPZANz5YDe4DSdFRdUpBRGE0qe
         Huca9FrCBgEUyVzlfA1uBNjBUoaKB40Fo2mhbhAijL4bWUBQ20+h56DSuoLjhy5MiSLD
         ffYc0fUSmWJjKJ7hkYOshC3nwd2WcfC0l8xetY1lraVSN2pYbjzvgwDQmlJ5UgJhcgQb
         RtrfVO8m3+CA7J0am9xGki07nbhg6aTGb3L2l/1k8QqP7HK1XqGXD/SDuVtemiVP5R3k
         rqCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SgapFXyCDKFt+peJ7rxw0qXMyT6IhM0lKM6Lr08CTds=;
        fh=Wx1Jxz5RB71BkpwW9EWTcDp6EntxmD2ok90nAKWktJ0=;
        b=oAd+9UM/5u9xbtZQdxubr91Bwz7y0Jq2UBxkKWWMW6ikFuN4fLlo40WCoI1ik2ZoW0
         vHtmCw/zntZT1q7K4TBHqL/YalF0Gnhjl2FULt8r6eeGhSaP/HkiRFhnBDkdRB65VfBV
         788h4N5gKonlSaSyTajWAlLCkIeDl5/ns7eM6ddv4VEXcZe0gCiOT1v/+IQTsphRcduP
         7m5sHUrlnzDFncDcyHjpFK9C2bFbtIZyHlCTl0mDlZDPimoPEPc0y3+TOxF3PY7p6Z8J
         NsmjqfX+LIyhPVQgBNKSWyTWhbw+tQyjyoeKrS/KjpT1KlyTfD61ceLGoNhyTYAVqmS0
         X/CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556890; x=1796161690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SgapFXyCDKFt+peJ7rxw0qXMyT6IhM0lKM6Lr08CTds=;
        b=PJVqJJ+69ydWTdAOwldeOa/Zj/oB1g/WO/zF7iEkoC4mDRrbViIThuul+JuPovnSy8
         VZPYecWWf8aLtnEwNQ1utKYSshKRanMRv1jps/aMfaq7R+ooeavz+OMJtKggZDXQrRBV
         2zZ0eoHWjD0KfpS092rbqq+ea6adZ4qiN904dMbpY6gsgLZgfKqCjThFUnPFowdFu2dn
         VM/qbz3/7AuMADxjYBaLk/MlY4MJzP8iAKicfOjMwlO7P2ZKWxFsPLg8dhMeISZJq0FD
         oNe9kLD/juIUFXh6NekvH99kcZz7l5tRMesdS1E/YznaTja0wQ1rsYYfz3w5C3w3Lszd
         UrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556890; x=1796161690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgapFXyCDKFt+peJ7rxw0qXMyT6IhM0lKM6Lr08CTds=;
        b=oenXsyH8I+CK1XfCoEpvigzWqh04UA6TJiMO8XLa//BjV0I8gG5D8nFm9Nk9lAJUen
         3xY7hD7hUMxA4hdlkXOgDYJLNWCShoFjskLJkmVJ50lQUUrvqjZ2ZvrcaZ+Ck6zKI8Oq
         NsEsQ9kb8EQUEyZX2fhUDaUDTQKkrRP2SnNr+WoPVm6k9Gg5f7yAjzSDjWhNlmQax1Mz
         s4Mrifw4lILoPW1MFzA2ms8YWyv9nrY5m552XLHkESEHXt+q/t6wPiDZwhhWgLqqNdoD
         Tntk5G9bT4qa5jonQ3rwQu0sZw7t4TvNgT71UN6LK58PBtMKmmvMBKfM+hOuEWVsSmcE
         EOEQ==
X-Forwarded-Encrypted: i=1; AL+hErF9T2UMmKurFA6w+YIid8loCnmGTXHsaIMh2bB8DSWq+TZbj4S9QN/vZLLfnAo6W5N/86JZcgZpeLagVtE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bA23FaFnyezjs/1qUi2s/8HY/iaGJzdnhUQqX6Lzo/yZc/W9y
	vV0+IAvjkbRtQn2+pdB8Ts+w3GEkgixRnJAdOH5DqcsxqMEBOqt+A9U9cZinWBFQqhVTx9JjsQy
	cY41myF+oO3JCpxE134qSMZZbeLWQY7E=
X-Gm-Gg: AZFdTZd8BkHS/oBYUPU2buY/bbQSmTQ1xle2JliEhJ5wLI52XNzOEDKYijBmUULE1gr
	JfGeLrBgMY1fcpNNZY9kk1CAOw3BI/S3V/RcQe7/IhM2Mt9CBYfCfFRtpXUhcRUNsEwuet7auMW
	hixzBkC1Q50XgfimN+m82QzH/kCL6adq2DLZy3OCJ48+uDZGR/KZ+LQEo4ruldXNiu53DErw//H
	/DTR8izLM60kTe4Talnzdhqe9yYLas3E8Nvx/SBHd++ubWQZ7CZEKFhI0CdsYnFIBRjefDtXokW
	kCAvTVSZg9teQChTJge82PCAfScP0dy8pvZor13WwIzNADTXrMWMyDZsLy4p/zbRmhfa+SC2POY
	fZH7hvvbOyayVsjPCeyyrD2EKC8G8lK6deuVNPBjnPM2lhPWJlBHbPI+PnN8fc3rwi7nX8zyPYg
	bfweA1KOkMjQgjFOxes7w=
X-Received: by 2002:a05:6000:27c1:b0:4a5:26ff:13d0 with SMTP id
 ffacd0b85a97d-4abb0f3b5bdmr20496747f8f.14.1795556890344; Tue, 24 Nov 2026
 13:48:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com> <DN38312WXPDJ.2KLUTCWSDFL3P@gmail.com>
In-Reply-To: <DN38312WXPDJ.2KLUTCWSDFL3P@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 24 Nov 2026 13:47:58 -0800
X-Gm-Features: Aa3M54r4cLpLVpvm5Jm5CUzi10h61k0_Z20IJHqjjVNyNuLE3oFuveUgR2mZQgg
Message-ID: <CAEf4BzavErcSOZhGobqEo68d+2bCnJ8vFxxT_vqb+oQw1j1d7g@mail.gmail.com>
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

On Mon, Nov 23, 2026 at 10:21=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Nov 17, 2026 at 03:29 AM Mike Bazov via B4 Relay <devnull+mikeba.=
sentinelone.com@kernel.org> wrote:
> > - Marked programs are not fixed. A program with a per-CPU map or a
> >   tail call loses runs to preemption as it does today.
>
> I suspect users will hate the behavior introdcued by patch 2+3,
> since adding a per-cpu map will suddenly make the prog to miss events.
> But the idea has legs.
>
> Earlier I proposed to insert bpf_preempt_disable() by the verifier.
> No need for that. bpf_prog_exit_run_ctx() can do it when per-cpu access
> is detected. Like below:
>
> > One question: the marking is automatic. A flag that the program's
> > author sets would avoid the second trade-off, but existing programs
> > would keep losing runs until they are rebuilt. Which do you prefer?
>
> No new uapi.
>
> >   series #2    42.34 [42.12-42.78]  39.87 [39.46-41.38]  41.53 [40.79-4=
1.75]
>
> Good enough. let's keep the walk. No need for the array.
>
> +static __always_inline bool bpf_prog_enter_run_ctx(struct bpf_prog *prog=
,
> +                                                  struct bpf_run_ctx *ru=
n_ctx)
> +{
> +       struct bpf_run_ctx *ctx, *old_ctx =3D NULL;
> +
> +#ifdef CONFIG_BPF_SYSCALL
> +       old_ctx =3D READ_ONCE(current->bpf_ctx);
>  #endif
> +       run_ctx->saved_run_ctx =3D old_ctx;
> +       run_ctx->prog =3D prog;
> +       if (prog->percpu_state) {
> +               if (!prog->sleepable)
> +                       preempt_disable_notrace();
> +               /* sleepable prog should be using explicit bpf_preempt_di=
sable() */
> +       }
> +       for (ctx =3D old_ctx; ctx; ctx =3D ctx->saved_run_ctx) {

do you mind checking if unlikely() around ctx improves performance?

> +               if (ctx->prog =3D=3D prog)
> +                       return false;
> +       }
> +#ifdef CONFIG_BPF_SYSCALL
> +       /* Initialize the frame before interrupts and NMIs on this CPU se=
e it. */
> +       barrier();
> +       WRITE_ONCE(current->bpf_ctx, run_ctx);
> +#endif
> +       return true;
> +}
> +
> +/* After an enter that returned false the frame is not linked, and the r=
eset changes nothing */
> +static __always_inline void bpf_prog_exit_run_ctx(struct bpf_prog *prog,
> +                                                 struct bpf_run_ctx *run=
_ctx)
> +{
> +       bpf_reset_run_ctx(run_ctx->saved_run_ctx);
> +       if (!prog->percpu_state)
> +               return;
> +       if (!prog->sleepable)
> +               preempt_enable_notrace();
>  }
>
> I think this should minimize the breakage and fix the issue.
>

So basically to opt out from this behavior BPF program would need to
stop using any per-CPU maps and just implement its own poor man's
per-CPU storage? And even using SEC(".percpu") would still be detected
as per-CPU usage, right?

Should we give a way to opt-out of this protection explicitly while
still using per-CPU maps?

> pw-bot: cr
>
