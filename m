Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654410;
	b=rW8d8KBLmLfGIP+eeMFzxIrUaCadb0cp9bdMjb3NNc84lBE4WEaXhcIAyVVDxZjQVwEF
	 6SO2DaJ5INt3jwLFCGsZ30e04AygVvtXM6kSzrdBcM+bXGt1AAh280ncWB07QzvaUwel6
	 Gm5TTBheSYKzUBRrZOwo54tmOWAqZMLKrOAmxdRgI/80Hwnex77KL/wp6IP8m37H+uJ1m
	 EY4+zQajPw4NRgPhUsgHUTI0iB+qvoVNSLQFqFp95CkjOVvysBJabYhiyIxR67/WWqwkT
	 6hRha3GmokPJ955mln5zSwjQqR4jtZRT/nTi/eRp1x7SZlHVcGu5LoI/raD9M7Uj2Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
	b=PamlqajPn9OG6jxoOLkPJo/YD7O6oWZxGbGDzQ93ZA1E7KlD84VW6guBmcBgGLLMGenm
	 PekMGQodN4jt+duot642dQ6RenthKQFWvaSkQotgOroFF1DPe9zmAa+P1kucn8nCHNEef
	 RIs4qCVcSW2euUJY4nuBfIDvmeuVHMmSn7SXBwAWcQe1es+wjIioCulVZkaV+hZHxsbF3
	 nyD/YyxIOSW6JUqyxQJZ8xJf1mbkzqxFatbJNn17hrzaQ0Rundn7wTgQDytT4uruCUjIl
	 y4aaPTQ1dDxVNdeqYibLTqJj5+CELTvzpcmPFeczffugb5Pyx1qve7a0QkFxzZ1EGyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a4eFl+zq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BD5606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41BD5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a4eFl+zq
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so1038064766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:53:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795654407; cv=none;
        d=google.com; s=arc-20260327;
        b=QlFds94EEi+zwLiW2KxLWZlIC3nj4H3qAAt+KgBjk8a3IbqUjenGe+OQhUAO62G3Iz
         WMLccNAt9Rn6IvrfO7wTo+PZyCwhjiWt6SOfIBJ180iaQNk2ZFV4j2TQrxRy21XNKs9e
         ppwgQLDpNqazVrQSkeTOfjzm+0Lnuy9ZI9B+AS0fzKo5yFRUIR1DySwHllnKpa1SMvaV
         8Uq1BKDGvXCjxi5Rte1vzBH7UCYjGUWq35aepDk4DuV75dzmxNIxgybEmE2D8+KjOq/C
         DzhvQ+SAoQ9MAvdYVvr8to5FBueN+huH5cT5yfAt6+mXqDnr/nBtqWnC4a/u4e7G6KhI
         w3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
        fh=FfAq/RPtljXBj4Ky+Wj/kJi85N0XMeWAuByYGlXqdKU=;
        b=IH4JffIA1WCbm1XZ5E4tRTUKVsWcSnOyOoqdeXaDDu6WEZFVf4iI+yIixjw7Ibd38b
         Y2VVdu6dwV4TCzOKyBCQs449dFhENFAdCO8ibUEmQh26zjgSnB5MevP+gPOXFFX28fRr
         4iKbLZ8T4hemxJ4lO5bMr4tOZKujzMzGw2h37lNfU8eyIny7MWJto3jGGlJy9bMc1N6v
         Jqdf1RnmWPZe9OdeSzUuRDnKaggq6/mGcN6W19DKH0LTc21JCp4k3dZPoFTellMP0p4X
         gdXDXv+FFu27veHVMmXQXdp5lY9rx0u5Zwmk2Z2dqh4SdUY53W4/fblrupWdxrJQxMJE
         KwBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795654407; x=1796259207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
        b=a4eFl+zqDA7lt6mS4OPtO/kNIzj5/TeMyYctmQS6rAumHNP0h9FsWUJ7GkY4LaTvLi
         XZbc9+MpEFhqKX2dYqL4fykXDE2Vu6VriKTMVn3VrLZFMvAdbWL/PNv7jwSgKKZ1PtPo
         ZowSH7rKSGYS1L+tNs98Ydq/kM2mjFCNw6LNhS4AHF2+N9sv8qzWoeQsyZT4WWZwUBMo
         kFuUyX14mctAl12H0ZoMaHcUk3BMSDtDlW6sgXpzF2yPB6OfUcgWwgPlBLtY+UTx9+d6
         awve9zDaWLroV1RpzkDpg7ZcMcA3bnOLK7O95pXWCLuKc00IinjvTHkOHGq72mwYFnMK
         mO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654407; x=1796259207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
        b=Fl4V0wQYza3t5FDL0tLrunPcC8KxakctcPstzGN4aCLmylM4Vba2beKwvuqMBufVzo
         nCCN0gDQThjpNA5pdtN3EUKlwQT+F3fRbwi8XZz3QWRfcK+CQsWMgexp1syvmMQYc32p
         KX/zv8BG3SiAF8Y2g8wsv2b5mtFqxjwQfIuFONDpIj34pgKkfMDpUMDcBP7TRtCkNcbf
         i1/rZgySF1f9c+v9C3GTUFgy80x45ml3Chy7Bc2Uf24SJ7FXBrhtGz2NOfGz35qXeYXI
         YgknxH0bMkEoE93d34yNUr0pYqfBaqXpassaSoUuxtFlIgdPl19O6Wj00vlmn90dW7Fv
         47WA==
X-Forwarded-Encrypted: i=1; AL+hErEwiQqC3/VojiYXIa4aLtxXyDIiLVSGhBtG1kJW3RqZgoJuDAjHJE8NW8AlQoLEr4uGlwJqbeTjPhwovrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yIwC1yJQs4pxQ2oti0pe0PRSmt/PaupSaRB5+RAfd//daixEO
	94PGB55lqBuAASI0F8zPPj9IZlrFawjAjiOSzAND0+2bKyfB9nyFk9nm6A44r2aC27uYsYzhT4Y
	QzA009qDRNiDZaGuq7ZdHMwB4IvymvaN949e8shzL
X-Gm-Gg: AZFdTZf5k5l8L1F8bIf8darSrq15j22dbL+B3Fg12BYtnk2vYqbewasWHnJGKGLfVHZ
	BI6QcFV9e/MkYnPu7S3a0/+0E5vsjJgWclgqq2Z9M+gBFs4oHyE+/rhMDS5eHrof5iUouYreGQe
	Eh45pkihQiiT9dLlUpW0oKS9hjSoT+nnA/+REZlp+w/SbBzJSUhiqc07WrjlIC+83+lf8u2vaz5
	lrhkScbLZLYYSfJEsX1GZPZWVqYrhB5bySqhaRVDNn5wQ/iorMCRL4Oh3jwdc8G2Ed8on/p7cDY
	9uahy1D1+2QapTWD0en7NrXZ1SJk1XAqJyeaSfeMr5t8grxEH9z9XEp3VdsSBCxo59o0N93wJjD
	j9fIDcpgQEtgUsRqcw2MCvXufoekVsalMiZVPyBm6cOxfe5spGaDTQwsduQEibwxaWZY=
X-Received: by 2002:a17:907:c643:10b0:c2e:4292:d27e with SMTP id
 a640c23a62f3a-c513a816d3amr1138026566b.22.1795654407168; Wed, 25 Nov 2026
 16:53:27 -0800 (PST)
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
 <20261113221248.3535369-19-wusamuel@google.com> <CAEf4Bza48tGhcUhFRhSSv3qijV0uF8YrAQcLM6Qv9az-8zvK_Q@mail.gmail.com>
In-Reply-To: <CAEf4Bza48tGhcUhFRhSSv3qijV0uF8YrAQcLM6Qv9az-8zvK_Q@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:53:16 -0800
X-Gm-Features: Aa3M54rfuKAHSB0QMI506grzDhwAStyJm9gAvy8QXVpNXfEJd-B8LId_HiOPEPc
Message-ID: <CAG2Kctq98pvyV=jmN0Di+p7m0AWQKg8+QF5YBvdLi79kTJaKoQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 8/9] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY_BY_NAME ioctl
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 12:25=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Fri, Nov 13, 2026 at 2:14=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:
> >
> > libbpf parses all of /proc/kallsyms to resolve typeless ksyms.
> >
> > Use KALLSYMS_QUERY_BY_NAME instead: exact names, plus "<name>.llvm."
> > prefix matches. Ambiguous matches at different addresses fail the load.
> > A missing strong extern still fails and a missing weak extern is 0,
> > without a text scan.
> >
> > On any other error (e.g. -ENOTTY on older kernels, or -EPERM), fall bac=
k
> > to the text parser.
> >
> > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > ---
> >  tools/lib/bpf/libbpf.c | 99 +++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 97 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > index 44134421bd7d..f3f3475a64d3 100644
> > --- a/tools/lib/bpf/libbpf.c
> > +++ b/tools/lib/bpf/libbpf.c
> > @@ -59,6 +59,34 @@
> >  #define BPF_FS_MAGIC           0xcafe4a11
> >  #endif
> >
> > +#ifndef KALLSYMS_QUERY_BY_NAME
> > +/* 'f' is PROCFS_IOCTL_MAGIC */
> > +#define KALLSYMS_QUERY_BY_NAME _IOC(_IOC_READ | _IOC_WRITE, 'f', 48, 0=
)
> > +
> > +enum kallsyms_query_flags {
> > +       KALLSYMS_QUERY_NAME_PREFIX =3D 0x01,
> > +};
> > +
> > +struct kallsyms_query_sym {
> > +       __u64 sym_addr;
> > +       __u64 sym_size;
> > +       __u64 sym_name;
> > +       __u64 sym_name_len;
> > +       __u64 sym_module;
> > +       __u64 sym_module_len;
> > +};
> > +
> > +struct kallsyms_query_by_name {
> > +       __u64 size;
> > +       __u64 query_flags;
> > +       __u64 query_name;
> > +       __u64 module_filter;
> > +       __u64 pos;
> > +       __u64 sym;
> > +       __u64 sym_struct_size;
> > +};
> > +#endif
> > +
>
> there is no need for this, libbpf in kernel can use kernels' most up
> to date UAPI headers directly, and on Github we sync necessary UAPI
> headers into include/ directory, so libbpf source code can be built
> with latest definitions of kernel UAPI. So you can drop this part

Ack, will drop entire #ifndef block
[...]

> > +
> > +       while (!ioctl(fd, KALLSYMS_QUERY_BY_NAME, &q)) {
> > +               if (!ext->is_set) {
> > +                       ext->is_set =3D true;
> > +                       ext->ksym.addr =3D sym.sym_addr;
> > +                       pr_debug("extern (ksym) '%s': set to 0x%llx\n",
> > +                                ext->name, ext->ksym.addr);
> > +               } else if (sym.sym_addr !=3D ext->ksym.addr) {
> > +                       pr_warn("extern (ksym) '%s': resolution is ambi=
guous: 0x%llx or 0x%llx\n",
> > +                               ext->name, ext->ksym.addr,
> > +                               (unsigned long long)sym.sym_addr);
> > +                       return -EADDRNOTAVAIL;
>
> I think there is ENOTUNIQ which we can utilize here

Ack
[...]

> > +               /* Check exact name and then LTO .llvm.<hash> prefix */
> > +               err =3D query_ksym_by_name(fd, ext, false);
> > +               if (!err)
> > +                       err =3D query_ksym_by_name(fd, ext, true);
>
> err =3D err ?: query_ksym_by_name(fd, ext, true /* lto_prefix */);

Ack- will update in v4. Thanks for the thoughtful review!
