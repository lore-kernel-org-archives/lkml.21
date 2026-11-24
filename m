Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795557905;
	b=B1EfSyPuonH09e1+h2fH3VK+sB412Ku3Q1lLDmdydhMlovQKIurIrN9Hd+5dMU8y9eTf
	 oqtMz9bKhw7VbRsYlFuqE2RXuerAU+jq/3ygvoNsbE1NOGanCuUAELP7NV0cvIBBs2F6V
	 JLuM+8TogBCNnAlKLmQz0LjdmiT+gENOLJ796bXdWZNOYWbHjMnFcjsXMSD9OVy0H8RRN
	 oOGQd+1iVz7b4n1d4d3cjcX96SBaPgq8Xscm/skV2+7sLGOyIKB4NeGQl4sIYJLgB2yb3
	 a7jxjRalGUgoFxkxx9KQe6S16ACx/R0z6y+J4ICYTzLua+WGYDEy1DE6nH6D0Nv7OrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=X7EgV7M1nlTNeVW/LvjD4DDHSsWIZ29WUt41R4QNBZE=;
	b=cOF9AbAyNBkR+RohBb9vZoxOxqnwcG7O2E+Km5G8r5hbRxsO4CDgiDEzHjcUsJ8csIfA
	 LLl4QTYoP4D545aE9XiMf0nX8K4g8jOwtdwgcZ5eP3jAvlkg8U6rM6rXpoikoGnaRgiBp
	 SMlpD7HpYG10iGH0c5LEneMr0XZ+75hVQKFPDNwxUDmxtCmw+X57H6oXdpDYC9bq07EBr
	 swXninBGheeY+PZfM9x983GAiglF/tARxrDmNCM6jNgOj50JBV+eCC86+ES5XUrkSHr0H
	 e5BqOhqTGsiw7tWGsMANN83ExE//cX905DzmguCOzG+ZZjhAz9iWETAw6wbxOhsR2DA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ElIVNTJ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4745606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4745606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ElIVNTJ3
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so29495025e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:05:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795557903; cv=none;
        d=google.com; s=arc-20260327;
        b=JUeTXn+QMIgK27Wk2UHRqGdB978pf+LJi2krWoYhYKqJFVDnH9R/Evd/vLHd1MRc0Q
         6CmlHa9hNILe1q6Yh3Mu4oN5nQFQZ+8ZO7K8Vt5XbggZi1dAToT8F1LgPuRtl0MmpUyA
         ozC82SlgP6nnsToliza7JThsgk3UY8LjfnZPi48XHO+y1cVjglRZoUXL849I53yIWzf6
         qtgeuoW56CWoqwpERmCzREQP+fXomy3aIECuN6EprH0rUxr8fIVoQuUuW8saNEIlU+oD
         cJvV5CNgc2szf9aCpM1KyJFK2uYCk27+EUT5u2wm24kp01mZFjgvnXHN9joiMqvp7l4G
         oY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X7EgV7M1nlTNeVW/LvjD4DDHSsWIZ29WUt41R4QNBZE=;
        fh=yW0EfELX22lZvF84SN118ja67gMbsHV0lapGhSfbaqk=;
        b=mNfiSPQSniuL2fxPkNxfgkOIDgfOMKjkP6Ndj1wK3vfnewihlrNGGqb9sG2uwOemBl
         AvQWnEmkSsOswfuVePVCHvnbgT2vZTdF9amr//Cjzxjy9dJKfd4yf+Z+DrrWS5mS8rDS
         J8DGlk8tYrBe21lX5U3zY/7VRAM80yGnMXS4XqQ/pjhqoRYj7ZPZ6PJu/0cOeekfnbAp
         9sCMGcr7MgWenuu58kAMOCK0T/Wt50wB1qT1dgRSVXbI6GjVZ+cXQ1iqpbhCcdAxs/Iq
         WYpPD2DM9sbzlUich73DROafC932QLxtWkmcERdYcqrIByAUzatUA9s9dFgXZ/0irid8
         cK0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557903; x=1796162703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7EgV7M1nlTNeVW/LvjD4DDHSsWIZ29WUt41R4QNBZE=;
        b=ElIVNTJ3Z0lJHLzxGGNRGUDG3fMREP3weOXpxP7riSQbYRymGdX8MF4U0ZyTwsJ78X
         voW4RsziPy/qG5ChssYqqdUvUIFjMuTt2/mbRQCKF2pkvn6ccVZqvJmJPEPkxqy7LznS
         wVPawdroBX3v5Vyg+VxN7H63rX5JTYo7PAFyBYfq7J0CPQeU4R4wgmDrsLFjdbbUGipL
         ORuvjyxKulExAZxWywOfRgkehc5Lnm4sJc16WpGnw71G68xAIORr20LKlAL4P2RciqxI
         Frnd0lnV8ayLYyuzQlKDbclqv5BWyvrwkCV8AaQbYmSM2k7ILQzqR4k5pguT93ZQONTd
         dYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557903; x=1796162703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7EgV7M1nlTNeVW/LvjD4DDHSsWIZ29WUt41R4QNBZE=;
        b=LlQjQh3UEM6sShQ6h3mD4V/m3wdNPfcGRap/nzrIPOcjQ73+BqCRvYY6r+8qxlEYkl
         Uh+ZLQRM1Rc6mdCGi4ACz0ssaYqmv3EF9H8KQNVPaFW/RajbsT7gm056+OpKfhdnB4l8
         iOcDe78fB3Icyzzf0/dNn1AxdSBc/fKKElwyC2GA1Erw4AFpJR/aaQ2elwRhf5lVbGhQ
         NigiqvMdGlinJeIGnkQHuIkHBpZNZN+851cv1lGegypyQ+7uTE+NSFINYTyuy/ItRarf
         6yBJ0TzIdLjwLZSS/Gu44XLu6IXhB4uN1Xh2hdz7xLDQMJfgM2yhV6H25Y+IEtlEz6Q9
         LKtw==
X-Forwarded-Encrypted: i=1; AL+hErGL2Tj1k3Q74mmyvD/atPm16AfzoHufkK/K0etsPmGlCah3RGKjZ/MF/Cwc2sDGeCmONSx9pARaGANeeUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3th0S7NwUNQEW8KyQSusgtYNhdcIjK04h2IR2fz/tmGbTOwAZ
	Iw7ca9LYYeiIQjYQjdl9NukK4+NzHwzyp0cKzvTx75fIv3ryjshHrfsvvKK3TYaCMapc6P4Y9MF
	hAWNDp0qtWU6rBDTt49S83GQyFentVR+pZQ==
X-Gm-Gg: AZFdTZelOKMVNU/HKUguRgzWN7KbatPna1xS0d61p4hb0QE/E8EFnDuWEmDY+AdqXA7
	+2AFQJFxXAnujOC3ghLZrjsYKuYwF/I+GGuJmN0X0lBMWzztokPfbTed6coUdLCBdnPWPpUw5Yx
	WV0ykhNgtalDtICDdezGrmNoqgZxZGtfVZ3EneFasJBm/8AmGO5BMVIrS96YuyhzRQmkk01DkDn
	sDfBBlK60dYDgq+pNZAr6VdSkXOu7cPW7aaL8V7jex4Q+MozfLec5A0qseE3dzUZMnNg3++JMMJ
	gm+U6fdOWSjtcLharU9zvn8PXubXaxluY/ttoTHtB6lzLH8QIEmX9hUYe2j29u4R25ThCdzBvQU
	UXAkiax/i3ZO96FHU9w6zVfEmtGe+/+k/Tox4GnPE7I7x/GnuQctioskd9V5eR3QcdOu3PmDc2C
	3ucXCQB2e3QxueegpP3Q==
X-Received: by 2002:a05:600c:4ec9:b0:4bb:6a5a:782d with SMTP id
 5b1f17b1804b1-4bb88925fcdmr332120265e9.17.1795557902961; Tue, 24 Nov 2026
 14:05:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com> <20261117-bpf-preempt-v2-r2-v3-3-586376ec3672@sentinelone.com>
In-Reply-To: <20261117-bpf-preempt-v2-r2-v3-3-586376ec3672@sentinelone.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 24 Nov 2026 14:04:50 -0800
X-Gm-Features: Aa3M54rWyEOiWn9N3xPgi9IskIYemCYvuFKzmc7MjXfVq_1zxdSl20HVcikpyTo
Message-ID: <CAEf4Bzb6sq6g7jq715fqAAaL=PNSvuVWn6u3o+76w52gsT+bJQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/4] bpf: Check program recursion per task via bpf_ctx
To: mikeba@sentinelone.com
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
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

On Tue, Nov 17, 2026 at 3:29=E2=80=AFAM Mike Bazov via B4 Relay
<devnull+mikeba.sentinelone.com@kernel.org> wrote:
>
> From: Mike Bazov <mikeba@sentinelone.com>
>
> Trampoline programs (fentry, fexit, fsession, fmod_ret and their
> sleepable variants), raw tracepoint programs (raw_tp, raw_tp.s, tp_btf)
> and tracepoint programs on syscall tracepoints run preemptibly, but
> their recursion check is a per-CPU, per-program counter. When a task is
> preempted inside a program, the counter stays raised, and every other
> task that enters the program on that CPU is dropped and counted as a
> recursion miss, although nothing recursed. A program can't avoid that:
> the counter is checked before its first insn.
>
> Since commit 7dadeaa6e851 ("sched: Further restrict the preemption
> modes") x86 and arm64 have only lazy and full preemption, so this
> happens in normal operation. A security agent that pairs fentry and
> fexit programs on inet_sendmsg() and inet_recvmsg() loses one half of a
> pair with every drop. With 200,000 HTTP requests and four CPU-bound
> tasks on a 4-CPU VM, 9,254 of 7,966,760 runs of these programs were
> dropped on bpf-next, and none of 7,975,426 with this series.
>
> Check recursion per task instead. The runners already link a
> stack-allocated bpf_run_ctx into current->bpf_ctx. Move saved_run_ctx
> into struct bpf_run_ctx, so every frame links to the outer one, and
> record in each frame the program it runs. A program is recursing if a
> frame in the current task's chain already runs it. Interrupts and NMIs
> run on top of the interrupted task's chain, so recursion through them
> is still caught.
>
> bpf_prog_enter_run_ctx() and bpf_prog_exit_run_ctx() do the check for
> all runners. The syscall tracepoint runner linked one frame around its
> program array and now links one per program. bpf_set_run_ctx() accepts
> a NULL ctx, which io_uring passes to hide the BPF context; the frames
> below are not walked while it is hidden.
>
> Programs marked by the previous patch keep the per-CPU counter and
> behave exactly as before, so no counted drop is traded for corrupted
> per-CPU data or a renewed may_goto budget. An extension (freplace) runs
> under the check of its target, so a marked one can't be attached to a
> target that is checked per task.
>
> Trade-offs:
>
> - An unmarked program that keeps per-CPU slots of its own, see the
>   previous patch, can have two runs use one slot, and nothing counts
>   that.
> - Marked programs lose runs to preemption as before.
> - bench trig-rawtp is about 2% slower: 42.6 and 42.1 M/s on bpf-next,
>   41.3 and 41.5 M/s with the series. trig-fentry and trig-fexit are
>   not slower.
> - Attaching a marked extension to an unmarked raw_tp, tp_btf or
>   tracepoint program now fails with -EINVAL.
>
> Signed-off-by: Mike Bazov <mikeba@sentinelone.com>
> ---
>  include/linux/bpf.h          | 95 ++++++++++++++++++++++++++++++++++++++=
------
>  include/linux/bpf_verifier.h | 19 +++++++++
>  kernel/bpf/syscall.c         | 10 +++++
>  kernel/bpf/trampoline.c      | 26 +++++-------
>  kernel/trace/bpf_trace.c     | 11 ++---
>  net/bpf/test_run.c           |  9 +----
>  net/ipv4/bpf_tcp_ops.c       |  6 +--
>  7 files changed, 129 insertions(+), 47 deletions(-)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 7873f0ef2817..97cbcd4b0d67 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -2783,7 +2783,16 @@ int bpf_prog_array_copy(struct bpf_prog_array *old=
_array,
>                         struct bpf_prog_array **new_array);
>  struct bpf_prog *bpf_prog_dummy(void);
>
> -struct bpf_run_ctx {};
> +/*
> + * A frame in the chain of the programs that a task is running, from
> + * current->bpf_ctx to the outermost one.
> + */
> +struct bpf_run_ctx {
> +       /* The next outer frame, NULL in the outermost one */
> +       struct bpf_run_ctx *saved_run_ctx;
> +       /* Set while a program whose recursion is checked per task runs i=
n the frame */
> +       const struct bpf_prog *prog;
> +};
>
>  struct bpf_cg_run_ctx {
>         struct bpf_run_ctx run_ctx;
> @@ -2801,7 +2810,6 @@ struct bpf_tramp_run_ctx {
>         struct bpf_run_ctx run_ctx;
>         u64 bpf_cookie;
>         int retval;
> -       struct bpf_run_ctx *saved_run_ctx;
>  };
>
>  static inline struct bpf_run_ctx *bpf_set_run_ctx(struct bpf_run_ctx *ne=
w_ctx)
> @@ -2809,8 +2817,17 @@ static inline struct bpf_run_ctx *bpf_set_run_ctx(=
struct bpf_run_ctx *new_ctx)
>         struct bpf_run_ctx *old_ctx =3D NULL;
>
>  #ifdef CONFIG_BPF_SYSCALL
> -       old_ctx =3D current->bpf_ctx;
> -       current->bpf_ctx =3D new_ctx;
> +       old_ctx =3D READ_ONCE(current->bpf_ctx);
> +       if (new_ctx) {
> +               new_ctx->saved_run_ctx =3D old_ctx;
> +               new_ctx->prog =3D NULL;
> +       }

[...]

>  /* BPF program asks to bypass CAP_NET_BIND_SERVICE in bind. */
> @@ -3492,7 +3565,6 @@ bpf_prog_run_array_sleepable(const struct bpf_prog_=
array *array,
>  {
>         const struct bpf_prog_array_item *item;
>         struct bpf_prog *prog;
> -       struct bpf_run_ctx *old_run_ctx;
>         struct bpf_trace_run_ctx run_ctx;
>         u32 ret =3D 1;
>
> @@ -3503,7 +3575,6 @@ bpf_prog_run_array_sleepable(const struct bpf_prog_=
array *array,
>
>         run_ctx.is_uprobe =3D false;
>
> -       old_run_ctx =3D bpf_set_run_ctx(&run_ctx.run_ctx);
>         item =3D &array->items[0];
>         while ((prog =3D READ_ONCE(item->prog))) {
>                 /* Skip dummy_bpf_prog placeholder (len =3D=3D 0) */
> @@ -3512,15 +3583,14 @@ bpf_prog_run_array_sleepable(const struct bpf_pro=
g_array *array,
>                         continue;
>                 }
>
> -               if (unlikely(!bpf_prog_get_recursion_context(prog))) {
> +               run_ctx.bpf_cookie =3D item->bpf_cookie;
> +               if (unlikely(!bpf_prog_enter_run_ctx(prog, &run_ctx.run_c=
tx))) {

it feels like bpf_prog_enter_run_ctx() is doing too much and the logic
becomes convoluted... we had old_run_ctx above after setting current
run_ctx, why can't we pass that *old* run_ctx and our prog pointer
into bpf_prog_enter_run_ctx() to check that our prog is not already
running (and do that recursion context accounting). And before that
you already optimistically set run_ctx.bpf_cookie, you can just as
much set program pointer.

So in short, bpf_set_run_ctx() sets up chain of run_ctx, and then in
the inner loop we set up bpf_cookie + current prog (sort of
speculatively), and then bpf_prog_enter_run_cxt() checks if we can run
prog or not.

Am I missing some complications that would prevent that separation of conce=
rns?

>                         bpf_prog_inc_misses_counter(prog);
> -                       bpf_prog_put_recursion_context(prog);
> +                       bpf_prog_exit_run_ctx(prog, &run_ctx.run_ctx);
>                         item++;
>                         continue;
>                 }
>
> -               run_ctx.bpf_cookie =3D item->bpf_cookie;
> -
>                 if (!prog->sleepable) {
>                         guard(rcu)();
>                         ret &=3D run_prog(prog, ctx);
> @@ -3528,10 +3598,9 @@ bpf_prog_run_array_sleepable(const struct bpf_prog=
_array *array,
>                         ret &=3D run_prog(prog, ctx);
>                 }
>
> -               bpf_prog_put_recursion_context(prog);
> +               bpf_prog_exit_run_ctx(prog, &run_ctx.run_ctx);
>                 item++;
>         }
> -       bpf_reset_run_ctx(old_run_ctx);

same here, what's wrong with doing reset just once, all we really need
is to update bpf_cookie and prog pointer inside that while() loop over
bpf_prog_array items, right? the chaining itself doesn't really change
and shouldn't be done for each item separately.

>         migrate_enable();
>         return ret;

[...]
