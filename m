Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638304;
	b=GJwftS+yIbs9JHPeQVTERRnAasWrGTDlBFgb5xQa7Y7x3BW0S0gAJ4nA5cWkD/8yED8j
	 WTBrB1hyTUDzWbhxyt8r3il+0DT4IY54o+ekfFGn2DqzBzhdLgi3m/u0t7c36oCUGDwEP
	 douCzT8Edn8KICQLQvmzT0WbWILptX2M31p4YenWGVaOcRMYr85eW+ijIgKBwHXi6pyrN
	 YymWDzSLQtqFBYui8YOIxOxWKA8BhOiYxAG7hmxW22LTiSHIPoVvsS/xtSysCGAbRZFQF
	 RvTd0Qg3LPSRxu6dpFc4Bxi+JfAEuBlE4Q04iTibUEVWyQpcEhsh/2ARA3Gt4CT6+Iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
	b=41A/C8jn8/aH/teghnqtno0KiRkYFaHQE9XMoO/aw+4w9dq/jhN5n++5zPlayNURWJCt
	 idfX/SPy8686B/JIPUDRhVA+gh2LRd4s7OAW98FhhSV/8MXoMzi2Lvdyf8EjaIG7cnKnO
	 sE3UN1i1mv/Bg4cX7rPf1n767sCxZIFGmEGVr2KxN4JLqiqnmoiU2/kpz46wl3OAo/+A4
	 55EwPSW9xtLh7/brieq0npcCduHY0l/1CK+Gosvul8C5PApi1UoVQqsE5Y637MZQzmhtg
	 vyhiUiXf/DZOTxzxdN1FsUH4NBKP1kVBl0cneSyKPC09SIHDtnY5p9o0DGTytOXloyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxpVsnDh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8724F606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8724F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxpVsnDh
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so36461405e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795638303; cv=none;
        d=google.com; s=arc-20260327;
        b=oJvvZKKeyI86BuLKiKYWX/EyUJsXPZn4D7BzC+c/B+JhcmvLXZDBbxjShiXDYf1Cz5
         eI/sbGYaDTJyQtqF8BSFP4nx51Yres9m6ZctOwBBuOHVjAwSkM9KFy8mpeY0VXqdXVX8
         3X5wNOWiYGoV2FX1ZT+oOZpEeQdSkB6Tbi+mz/j1u1+labpYIGUD7fLHEZi6Q2XaHVXH
         5FIkXZ18MTNYUqJJcxE1x+Q6iRzRsLLjsLLq7jW7OEi7QPa4PTdq2k+zPwJ2TufvPjzv
         RV6u6hnGBnXh1isrpEuQjgTq0bMb/zlkBCSCnfftEnHkn+YbpK5k8cB3ZIbxIBapEPUD
         SRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
        fh=AI4HpCKXSyirIY/Y+XEgA4Lu9Zr6zvyL7bErSW7Vhkg=;
        b=RBHZv/spjIAUNEoYXZdVnjcheKlk5Wm/FhANV09qsKcHL3giaQCWQZEbwDzTgXcC17
         w9nuub6vBzVI6X0Wp2WjsU9Qo/kMRfg7XZZZvXBLOKCqb8IRJo5I5bdQshjyiHNFSlWd
         51s2W4yTdKw0TY2fBYSWKw7MCmgEw3DDakuUUJS8J9JFNS0oNk2hCmLTqHLmIEo+NeZA
         lHqIK8KRKQMmgiRR9GS1dtVh2FX9xra6XxE3fmv+ekGCwo4wecmyCfWd0sAgBA/6m1TQ
         fiqEQSfV3KFgC0FKVZQQZc5ltFjHMRWJYmHNr9Ybm8hH9Tzmaa/JqKPx2ozdewk1+MN/
         GD7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795638303; x=1796243103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
        b=qxpVsnDhKpASGf9nC11h7i3rrzbhgE1Ei3PO9P37aCNXYSI78K7dE3d/HkpdwHszrk
         LY2ewZzhpWyuiXGJ9Y/kVXRgwoqcZjc+AjjGTm6sKWOe26uegothRZycWdOMEmeKaehQ
         rcee0VmCBD9LHFqBMRGKRgu5+yxn/QVPc8+S1f0ZhA8k/QuPVe7lO4kH9kZ7PLYaSPsZ
         UOhEiycW2Hi29WbdqTe9JB7fMqfgVwt5DLrziudwFU1jlESg26yCSYwEh1zt9b/mn3Al
         7ZA2LJwSY/mdKqaAvIEdHaHjwDhtcY5fLQiXuVbUxvNBi+V1wIvq+poIXwdOZVw4io/Q
         3/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638303; x=1796243103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
        b=23qFxT1IRdIU7yL2hvvrIMTtIb8FdgUvFov5RjTBIQr6e4Hq1sQoQT/OnQ8NNHs1Zr
         b/m2RR1Oxzn8/UxS6rmL2adnaZyZAHepeBI7dkZONeFcveijEGheB+Zz+f5XT14BeEID
         YyTALjXDHQB9ISVgh1Gx1pSOeLqNsnZ6lr+K/gAaelAmFpRBYXxJFV8HvSkxH0b/zjHt
         BEZZfVnALxM8cw70nK5aU8Z9FbNGi+c7AlnJehRJI7PWSbk1AvfkmLOCJj/kOvVHJsIe
         eQb1Z83uBkBNdoCX1vVYCO0Wt550U+GzwUi066BL9TsdvRyZ3Znaes7ri126DWy6rid5
         fSwQ==
X-Forwarded-Encrypted: i=1; AL+hErGNcSmGqxlIZqdL3XsNPDWCns8+fAno8445gIx4ocGK4MdwYpnapywi8Qq5YwITenAUp8oHKcsgvdjO5Qg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HPF00v7ss0mYR9o3SWE+6fa+lbnatIo/plxFtHUUKqfaQvrla
	991Kqs0jEehB0YTa+QY+8/vDrGIFy8ek24VtHIBxdTNsscQgGM8xGnKFJoeiRn1apvJXOk5FEkW
	1SrWUnhSz6W8dchS6kmkHZTx4tufdHmQ=
X-Gm-Gg: AZFdTZcsu/Htm5xV+nij5loXA3DWvMrKqVO74VYK2fFcAiRruByrI0lYKPAkrIIUckv
	8AU6/RoTMUSsMg+aIVatr1pMv4pSkv7GwLmzsIf0k0NI1BT2Inr5rMrEflV2NzJeo2ogaB0RLp+
	qE7IuDLA5PsDWLVXEIt0tNQGD9HgY7O6+XWdQy3WwtxrgZFV9xqxE34faR69GAtcq5sMgW0hCYX
	izahJr+PWugg63Qh4qaTITSuMK7NOR3qKV1VV2jKjzVO84As5BFizvgvJrQf8ahTa1j8TKDkmHq
	gEUHmnOnGjiZPeG2nBPntvJO9IA+Dp1+tWAo041dje8a7hYIxvu6rDcD4Ba1bfEEGlZuwqQp1+U
	lsCBfO6RrsHjTjbM31kZuaDcOvY/zaAl0UEZkjZGO6O7b2NH5oFK1IzAuX9Be8L8rzjUcTz8YX1
	f+MoJh0lbZwsl7yvjrCw==
X-Received: by 2002:a05:600c:4ec9:b0:4bb:6a5a:782d with SMTP id
 5b1f17b1804b1-4bb88925fcdmr394635895e9.17.1795638302754; Wed, 25 Nov 2026
 12:25:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261113221248.3535369-13-wusamuel@google.com>
In-Reply-To: <20261113221248.3535369-13-wusamuel@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 25 Nov 2026 12:24:51 -0800
X-Gm-Features: Aa3M54paGFwRi6x8xvkBaed95VaPlmoDIEKWnad49yMfBgn6GjtOde1UijdiQkw
Message-ID: <CAEf4Bzb6LQmHHkvB8WBezU6YRtggycRvvA3L03mQHDr3WQM6mA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:14=E2=80=AFPM Samuel Wu <wusamuel@google.com> wro=
te:
>
> KALLSYMS_QUERY_BY_NAME, added later in this series, needs to find a
> symbol name or prefix across module symbols in one pass.
> module_get_kallsym() walks the module list from the head and runs an
> export bsearch() for every symbol index.
>
> Add module_kallsyms_find_name(), and put the shared query struct in
> linux/kallsyms.h, so we have a more efficient linear walk.
>
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
>  include/linux/kallsyms.h |  7 +++++
>  include/linux/module.h   | 13 +++++++++
>  kernel/module/kallsyms.c | 57 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 77 insertions(+)
>
> diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
> index d5dd54c53ace..d31f2f436159 100644
> --- a/include/linux/kallsyms.h
> +++ b/include/linux/kallsyms.h
> @@ -24,6 +24,13 @@
>  struct cred;
>  struct module;
>
> +/* Exact or prefix name query, optionally in one module. */
> +struct kallsyms_name_query {
> +       const char *name;
> +       size_t cmp_len;         /* bytes to compare; includes NUL if exac=
t */
> +       const char *modname;    /* NULL matches any module */

will "vmlinux" match just vmlinux? or how can one express "I only need
symbols from vmlinux image" with this?

> +};
> +
>  static inline int is_kernel_text(unsigned long addr)
>  {
>         if (__is_kernel_text(addr))

[...]
