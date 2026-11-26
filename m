Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653870;
	b=rgsPRT0zU3wsxooGNB7tD9smFYlPKY9V9WXDl0tc68oO36kn2bclX3kk4BfQFLJ8k3+d
	 EfmShjVa9BSY8E/lsEx+5ItX1YAXJk/S/scp90hrRsH1MLmtoMNflmfLvBVmEZY+z3j9E
	 l2Rc5Jg5hMP7pndGwW4Yp63BZkeKIPpNXDAy9XpvY+FLNbk80cFlPNQuPq67yqOUIqbNF
	 Ohv9lyB9nR2QBetZXvMPTfMDLu5qH5KGhKeB/m/yAX4l/Q/IPEqZVXNxTG0cYIB9Cne//
	 wXS7T7uV9lYKcN+5dID7RlZgSepCnxEsTuYOgSpb9WU5N8D6wSQ8WPwC3CzjsI0gNoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
	b=xlBKWZooFXTkQG556oNjrh6ESOMoZguBWl8RRtk9RXQJQId+9dzY9kUlaBFZhEhQIiZ/
	 kzyhXYCgfluhQN6d/fjZNywj8dPCPOuSbtDLTLB+Q1TwhN2YPeMwi+cgk+1zlI2zV711i
	 fw0j9Itn6jQEs/Xec96Fq+ai90J5MUlgpK8lQSxVAOXfDp5Q14MAKIOPznOfNxMLaj/Wy
	 BK8XGWrTVsCRdCB2TQkKshGcsYNvetK7/OCepggbcyEi1IdLg1s/xofJ/JIX2sON+wHlR
	 ecb61yX2WxHDBeNMWzI9J2plA6U12htnCzsuJxIfrNdrjQWmfxaA86iwZ/c6d1zZOVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TFVWM1nN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6A3606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B6A3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TFVWM1nN
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c506a231b88so870050766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795653869; cv=none;
        d=google.com; s=arc-20260327;
        b=SAQf3miQU87hN7LFm2c/ZhZPdrhkY+cRxzDzug/37igXiuGSGnRTFVkfvikdnf+MfK
         ng8g7fB+hE3rv7xsou1AwjX/3RMXIL33iJo2omDkgSNv4snEPIH5avTNcnZBZIg2RWk5
         PgQwxWRTBJ1vLDeYpHzHu5J+r0kmgsF95802BQf//lhb3egLhrwbImQw+0qORzOA61R/
         nF0sH6fxQQ7Tk5251fKbBkID+iTuE0Zk2XolBmNWVgNI3j/N+uwcM/C2VfajDzAYgUBx
         30M31h/mTuRkTRiRpjoyspZM6hI3kWFnAkRmv0IUBDIxYd+QGy3RgkhCHwe1GVH1qIg8
         gZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
        fh=0LL+v94T5KedC3eJXuUQLa9pdFLsbQXjOnAqF2Zof5M=;
        b=XooDzenrW7plrTOoW7dqZCvB4rOgY8vymUAybgsfykReuEnVUgrWPHOsa661n6ufc5
         esFuZbEJFxP8NYvxA8IEAHTZej4i7Nz/s4qOZsl0n0P9K/V8lQDkF3ROM8niKOwTCaIZ
         PPSkGhxyqxIlP3uE4TB3mOZqvemBXShPs9MR6GVLJrv84WmmrhSm71ibH+RdXXYZNLTD
         oTrODUMnuDX3EVBvCxxr/dW0LHaXcPiuMKVDaLxJLXN+YFkqqnSjwdGP+c7L2nsbcDyP
         PUV262lgqMHK3zqt1VQPGPY2OgGe70jV7HOAmydmUpg8MitI/kdpjC9D/cuyzV6J3iUr
         Sepw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795653869; x=1796258669; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
        b=TFVWM1nNu5gApS+aRUNGAO2b47beOviKXKAUtZcibEAeTqBUzqYaxbl/Ez5VQvaHiJ
         TXrTwu8x0jRe4t5Qky6cuxp9+qXTOVpIHPYaRTuFvweUNvzRuyVro3GhlyImE69z5l6h
         8+10BUgXaVnSQdQJL56ogVd0eoghwHYtJzCo3zCbsQwT+vD3SGCXtB3FiXNUreuGXelJ
         f7VR1BO5S+hnTUr9vyAHKXMc2Z8rg1qIpqzDfb7vnBqg8zVirP17bCZUWs0HZkfhTJwL
         aGZZfKvpUl1Z4/v5oLfuk517qMaRDnLShKckyF1bvlHNxOJLhAHLt0pu9I70jGnqlzcF
         ZJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653869; x=1796258669;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
        b=IDFdx4g/qrVwMxFk37fKmgJN+NMoyhZVrruLBUIJwOQMP2ZPHPj+OKWMIRvTioF+Iw
         JYuSSkjiaP5/2+AAt/oj8IWAWCd3WPH4jkcEN8I1krHAIzBtwq7AHjRx8KivBe5W6n+Y
         R2SOqb6YSAznFkpNJ8xDnmAtauUDyJc6VDmMxNMOrPAO7nyPRknQ0GGel5LYaQa0Z51u
         jszfLQan6kg7aMwTg2t182qly4uGB5xFUizKzCjkrGYixCt9pzK81rztpoUFt7dbdF1p
         N9IDmMKQx2MpLFG1WMjyQ++sLZWbvalHblJtFUGhkBDIeTJiJBU7zwE/QFZsn++4jyb/
         +FLw==
X-Forwarded-Encrypted: i=1; AL+hErFjIGhuf11CIOoi14BDRIKZpaZHaiJsgRrbS2zQBlSu+CrkKSJx7qMAuX4GRRSxZrNm12vj2gdN1XNWeKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fdZOkk5zmp36N5jzZjl8dkGx/AYmWUIW708njkJ88bcLrruv4
	fBYZvxVE9EObBV5S+oJUhEDvlH531MrQMaSy92ANcoJ1Q1pINSIoFxTL3Svm5q9kc4LR9dNGxB4
	+iznprjLqHmC7kKb5gcEQz1A4kOweQjHTLC2y2Lw4
X-Gm-Gg: AZFdTZdNkGdu63U9oYLBk5eOOkGB6LhH4H/oJmQN2p5RXMJ3c18BvSOPfwJICMSzj8F
	Dk/CHW+cpni2rlFqFg9sdJo52pjCAoMOKd0bggEUAj8xHVTgm6S5D5/lpxS01gtpW5Q7WGcB/Lx
	9bzUZ8KSKPoz3zI/p2cvOenJLkPH96p5AWW6XziNTN4YT8aZWXHTweVeHAMPPJl2v2qvPvZNOcG
	kEYCH9wPuOth5cO/UPwIhxxQwXWNqwHKAUXRGivBtUAWtrRbOCn6wiy9lHrefwmH2urErlayiiV
	B6uyhl+z4yIAC3wsbgazM7PQaqXvpztGSBT98fCyXjACZkVTEa2DE80mZoFEJ3Q39NaLNatlCfB
	PyCzDysVqKQBgwklLruApjq04m3mHIcAm8/FNa8EZM9zejHyW5bJ6WGhLmPFNYIJgvWc=
X-Received: by 2002:a17:906:6412:b0:c51:24eb:e5ed with SMTP id
 a640c23a62f3a-c513aabb094mr1147878466b.42.1795653868573; Wed, 25 Nov 2026
 16:44:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-13-wusamuel@google.com> <CAEf4Bzb6LQmHHkvB8WBezU6YRtggycRvvA3L03mQHDr3WQM6mA@mail.gmail.com>
In-Reply-To: <CAEf4Bzb6LQmHHkvB8WBezU6YRtggycRvvA3L03mQHDr3WQM6mA@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:44:16 -0800
X-Gm-Features: Aa3M54p3EatRpTsPAm_mcmxJ6hPDpQs1114Xl7F84nCmfTvZhGsQScuZoJFkxmI
Message-ID: <CAG2Kctr+6-EESkYn+Dspg0FxTOMFRoj8269UZaNNDFNf3d+bHw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
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

[...]

> > --- a/include/linux/kallsyms.h
> > +++ b/include/linux/kallsyms.h
> > @@ -24,6 +24,13 @@
> >  struct cred;
> >  struct module;
> >
> > +/* Exact or prefix name query, optionally in one module. */
> > +struct kallsyms_name_query {
> > +       const char *name;
> > +       size_t cmp_len;         /* bytes to compare; includes NUL if exact */
> > +       const char *modname;    /* NULL matches any module */
>
> will "vmlinux" match just vmlinux? or how can one express "I only need
> symbols from vmlinux image" with this?

At the ioctl layer (patch 3/9), passing "vmlinux" in query_module
restricts the search to vmlinux without calling
module_kallsyms_query_name(). I will clarify the comments in both
patches in v4.
