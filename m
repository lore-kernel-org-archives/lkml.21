Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795177929;
	b=OriLqEzhACjj4WWMH0Fd/Fm5+vHzKX32CQzgiXrPOtSZ3vExTdpoiuAiKE8DG9qGPM9y
	 J8j3YzrJVhI5AttxunZFZG/ZiRSPKEEoldCJNESTBtmugiyaBP+U45pip8mz1De6eRh9A
	 NUjvQNdfTux+f3p6srAkEBnq/rCqtr/cfKMICM1V6369RPNLZOQuMrCcNISzKITN+kEEB
	 ewTedVpEeB/L4rIQI2QryvjNEF4HE0WYcb50lCv07ljX09Y8BznenX6iBlkBME7BPbGLf
	 ZqWE5zamQ66vgNJ6cCe2g7RyXe2XaKWsoTQYSEwvto/Sv5kKRdddbJJXmC3VNq876Fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IhiE/LJFQy9yi5YvfPy9sO4qIb7WIlTpzeu36y0dLyM=;
	b=PRWQEdhU7A1IoCGRM6cfUqcvfRg2iTF3mZ91AUyEDHLvLLGwZgGZgnsbUL7G1I+Rduzk
	 vD5hFqfjVUEU/+m6A/lUPwyNwlZ+anfBkRBwDpEI6167UGG9JhxEKTQKTaliFmTy9cKHO
	 x6HGNcNzBjY5q/VYMv0IX7pSz54UcUoyk01aXMQyexYHbSngfBdMmuRoYKO42oj+naXQN
	 fz6h4IKGejsc0px9aEkgiFKKIwPRlDEhlvANJlbVbMLBJzIxauG8eXePzxhxa/WKlySBc
	 zqNeIHMOWDjUXqqRRXYOvBvGMmoVUIzfJ8+AsPjrqJG1GT+MCFXHnm4TjP3vFhznpVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QDmwuMBh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BCE606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0BCE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QDmwuMBh
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3adb75e65ecso639551fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:32:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795177927; cv=none;
        d=google.com; s=arc-20260327;
        b=PzcJnjba3iwETnnuz1uXDZmxU9OJ4dH1kI4GzDQnuAyIQXv2/qB9H/GG1fkkLU8C9t
         /1mxIyLE0yXhllRFaHWiy24eptzgPxeOCETCzNOzCrbmQg7oQ2j7W61jLeMWWwREyD8L
         xODzVySctO3IM3E/efmJTyNKofo8DDNuNYji9GWTmwEqHVWFpTv4tgmsGr/XxnzJcM32
         eyBvFVN7fByjBoRlhCcuwGhpra2O8zTL4BACLxeSwjX8aSo3Dsa9yIGF6CgN66QPuPzy
         XkoT5rXBHUvfmfI6Dd/3eQT2WEbL2Xkf63a08rDJpgI00R0BG3YP47Axun5TR5Fc/QPb
         jDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IhiE/LJFQy9yi5YvfPy9sO4qIb7WIlTpzeu36y0dLyM=;
        fh=cm64oJUOB2i6GIYDyGa3naWXvmNlcPeMJp/2LRuF4rc=;
        b=FPCg3WHtilGelXUgQPNsfDqAZnF8M7XgWZ4P/CB7Sy3/qFwfNWaBg8BHkwcCYM+ixv
         1HHPCb9xsqZEN9kryi9z3xJVHSv7t7oNCfAJDO9MEo2oT0NsUrp01tNB6Sj5DANZws0C
         fYSOKq+sseTMSmDleH8IVREZskKJAwzQxcU7A9qb3a9B9x1ILPr+4gnQIxCNnI6YOw+r
         NTw1QMlV/TALwLnmbtrVs33pkF9ajcvRhOXj+tTlsD8lNHaSFwoFpE+lKV1yKiVlhMHe
         E2ey5Dqekau+tEE+n/kM7K59cqCqfSxWDeFEW7zQeo+zUj5dG0Wj234/M/rWKWttKvwf
         LvnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795177927; x=1795782727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IhiE/LJFQy9yi5YvfPy9sO4qIb7WIlTpzeu36y0dLyM=;
        b=QDmwuMBhSpTqnt8KZvPmDtpegZio09coWGXg5ZEFJ0HQ2BZKSYNl29jzbBxRtoour8
         WjzeD/x0LXOjsGErS/402inLq2+slzulYjk4LJKocMxKvgNz3EhH6NthHh686TY1kHsk
         kYq6H9szHwIVKBE8HaoHmF7dJWayeZ51W8MKNEG+mid6f3petDzIAw1aqnkMTjwCqo2Z
         4P76Z7zUmv5qzbhsa6t8Vc7TyqVVHS/C6G+t7V6nR8PjeWFf4ByO1/OH2KnXSCWfYMzk
         gY8tX+IhAv/GYC7ZTJNJoIp63FCAVaptkfuPj7bHSniq4kogSZymU3auX9w+Hk9Y2ROZ
         oUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795177927; x=1795782727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhiE/LJFQy9yi5YvfPy9sO4qIb7WIlTpzeu36y0dLyM=;
        b=ybQWF2TRLcGFbX0sNTMHz9a4OnY+OmAxuwTnsGjD8Yl/Xi3Zp/ETDbNJKv3iA4v+ZG
         cUbKw7JCUQXHSHtbr1xxRZPsqo7VsYpGPaYi9SvG6gkifpt6sWLTsQ2s82LX6zNX/U3O
         99eWoCfj1/iuPKooaGG88eraO3JbphFrduwkNfFgTdWwbZVILyFMZQ+rx9G7WMgwogXa
         Kc1GOEcD3yeF/5eEz5izjO/QLwU2N7q6b9+9uxPZifV++3DdmdLop8gNPq0nHYk2rdFu
         9KgrCsvbIlAjOODmrSWJKMZmnZH9DXJKblW8s1djMAx9mOmWBxkTOOIl+D9b++Rv4PQq
         854g==
X-Forwarded-Encrypted: i=1; AL+hErFvoWniLr2Xlg2WXyamK6axy5Ehx1SMPFd+okva5vk8TdKwh7ujXPShmqfUTPdj9A1aPP8ffj1+KqFGM1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8itnJ/wRG8gGiHtW3qAOOmDGHb/wGvX1Nq08dc43gmPxVINIoT
	glgQzYjkDrppdf845JMnzZJtAebOZM7RYhvq9D4LtIREd/mkRn42cscmscncCoxr6TvqtyqGlHz
	sdVY2DwjiBTlKfB2Iijn7ECl4jHzekgI=
X-Gm-Gg: AZFdTZf3ewoZxS91ZdsM/R3YktFLJvvxwZhQXw+guHXKCgH1k6CQo2QB8jI1xZgfp1I
	i+AngXDHK+XZOPkN+8gADLCihwTP4lGwyZiwFiBotd7fmAO/HPE6OcYBQ/XV/4JmgX6bEl0Py4+
	719jPxt9jH8NYV6ZEdYLxJeylLvNPqqi2FctJNJf5BTvsuThed39FvTLGclr0x6a94BERXC2LPX
	C3FqqHkRXVCiClDw0czhKFANw5gYDAzBH+MF2CuHP3m0rRFL0c3jeTy5NfTdSyGDV6CcBpimf1e
	x/HJ8HQDBkj5FT+KGRoOKhffyhYOBRR4zYGwmtab6BgUrhxJw0ta6RZ2wrtq8Kj1Zlmeg9+Lj+E
	d/jWi7F/o+hFhILF1fsDSgge4L0VHzZLDBGQYlbKiVTI3xBcYi1chVcx62YLIXOWTG7wAetA1HZ
	2Z/SM/AXGnGRa/lUpTLrkh5PnyBmQPhd2ThHevMbu12R0psrPnSMSvmRHCo+kUGKvlb6RQTdrb4
	HIbCBBzVs6vzm87f2S4ARE/Mvulmxg7W1epzWDXGN29l8XzGA8WjBJ1aJ1/l0U8x0w1ND5gWtgG
	N5h6yDcoIT4Cttu/tg==
X-Received: by 2002:a05:6512:6313:b0:5c1:ac32:9904 with SMTP id
 2adb3069b0e04-5c1bc80e619mr987431e87.3.1795177926726; Fri, 20 Nov 2026
 04:32:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-fix-schedstats-bindgen-layout-v1-1-0599dd230ffd@gmail.com>
In-Reply-To: <20261119-fix-schedstats-bindgen-layout-v1-1-0599dd230ffd@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 13:31:55 +0100
X-Gm-Features: Aa3M54rcMiGp8tEKzqSGwq9pN9j_ip44fxmLfK1-urL5STB7swv0NRy8cxr5owE
Message-ID: <CANiq72kcDMqswODJ0OqcqecDG+8mVn7Q43v48=ED5d6tsFOWQQ@mail.gmail.com>
Subject: Re: [PATCH] rust: bindgen: Preserve sched_statistics alignment
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 8:33=E2=80=AFPM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> With CONFIG_SCHEDSTATS disabled, struct sched_statistics is empty but
> still cache-line aligned. Bindgen emits the empty definition without
> that alignment.

Link: https://github.com/rust-lang/rust-bindgen/issues/3549

Most importantly, this is about a bug that happens to be exposed in
bindgen 0.73.2 only, as far as I can see -- could you please confirm?

> In the reported arm64 build, Rust
> Binder reads the wrong pointer via CurrentTask::mm() and rejects mmap()
> with -EINVAL.

Cc'ing the Binder folks.

> Fixes: 313c4281bc9d ("rust: add basic `Task`")

Given this is a `bindgen` bug, this tag should instead be:

Cc: stable@vger.kernel.org # 6.12.x (Rust is pinned in older LTSs)

> Jules Mercier reported the layout mismatch on arm64.

Reported-by: Jules Mercier

(I asked Jules about an email in the issue)

> +# Bindgen drops the alignment of empty structs. Keep the cache-line alig=
nment
> +# of sched_statistics when CONFIG_SCHEDSTATS is disabled.
> +--opaque-type sched_statistics

This seems OK as a temporary workaround, but I would probably write
something like:

    # Bindgen drops the alignment of empty structs and bindgen 0.73.2
does not add
    # explicit padding before over-aligned fields either, thus the
fields that follow
    # get misplaced: https://github.com/rust-lang/rust-bindgen/issues/3549
    # By making these structs opaque, we recover their alignment.

(In addition, it would still be nice to have a debug Kconfig symbol to
enable the layout tests as discussed in the issue, but that is an
independent patch, of course -- I am thinking of gating it under a new
`BINDGEN_VERSION`, plus particular architectures where we can confirm
it is clean, and maybe `!COMPILE_TEST` in the beginning too...).

Thanks!

Cheers,
Miguel
