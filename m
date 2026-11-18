Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795032718;
	b=2AE3Kk6keY4bGIJPrwKaJ21aPmPeMXZbFq6cx/jPCkIBfGhtXZXV0wa/R13ANJkaeDwD
	 sAZmO4FfarLV52Uz4Pog31Wr5x1JxiO7Ek1jzMb841EVKUbtfAeRjSUZFe3SsnbYaW0dy
	 rEfkcr70CkH9s8JddIDqDEHLdeye7/KXNIpHegsrsnt+k1YVai10kCyOD5PZsx1Hw72Sb
	 pDWMkzyw8yGqG2pUIvt9ES4CWMdHA55L9B+6UZiKEvkdv4qxVwwzP23HfBHyJIS4y/VgN
	 CkgNaes59QgDluood4tNfeeGF/8viXrpRLRzHs31B/4MBqej4YONSXJPW4ZCsMeUiFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
	b=NRe6rIUQVyxIsSoWKX2LpA+fukGVFxmXTPVuU8Px8xL+z9tPJTPavno3ZwBwm/VN7taE
	 d6NjQhrb4nUVTvvCcNTEzxGYJaWekvi7yanG9whiGo8cL+eKFJ4SBdVSokD+pasy+psc/
	 h2oCYTnuNG82qKfdOVD4KSjeeNDjTcvFW+Sv9/EXdVi/KEwOWNBzLgp7f9IE8zTDiX7re
	 bZDB4cWu6+rT6XFKL95fYpswetMOQdisP0DutM5uoVtQR9+JWP+MRNtIAyG3jN7E+EpYc
	 jFyIB2LMAbAb7fnb8+Ozj89vbMoMTTsDmKSOYRV/Q9P7pUSvIrfezoSuxC06nCoAecw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WnPEpb97;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D430260A2612
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D430260A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WnPEpb97
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e10a70540so929286f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:11:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795032715; cv=none;
        d=google.com; s=arc-20260327;
        b=WNzBB5GIk+ANgKUN6uMFxKYUX8QBn4btnD9PjpSxGpwaeeNNxjjzcA/+Cq6QRlfs7s
         fg5j5iQSteqvdOWJUmqKz0kGt1NSz3xAmPhGgqd69WjR0jq42M92Fkikly5p6wWWnqYu
         YzZPEoOqIBwcwEMybIIlwmUT2ng2zoffwQrPn7IVi3WWWBfFBH3wPaCaTSs1YKvSMwae
         Kr/XIw4yr+SkRddHu36wYYZaZD9/UFlKxIHY2JRP0i353dO8WSYrq72kLn+ANh4+keV9
         AFdgWamoqzLdFYCRz94lrs9aj+c03QksLnxyGLVraEXJ04Klg+gIFEPyf8R/YaUbYIAW
         uwDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
        fh=y0O3ecrhZR9ufvuwPOqgTfRG/oZzaI40SdQCP2YnTRE=;
        b=SX1OY96va0RAzlyWdV/rrGvfhO0rb1EweRWHO4xaIltEBwMDNcsD6cuxIDsbDnqKpq
         9M1M+MBRIWieWb90mSrkB/BYpuBmTISAJULs+fgfjP5OGM5Jc0WYwUb5qBohCfzrgJ4W
         y+tv5OGIXGy2AaOpeSdGCxh36gYY7YBzOJeZf7LKoLw1XoECOzArevJoelxhWRaekTSt
         BX9QphU+8DxZr4R697eR0IGWohAlt+iV8NFEywnfvANOI1Zc0AOtuVbQEbYkyzaeAONg
         g8U903i9UmFWyNx0C59TpyOi1VEDN/waTH0mUvD575KqdcGi6bvUJv0ADr3cd9I4yOu6
         2NXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795032715; x=1795637515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
        b=WnPEpb97kcsekPHkHRowpccMWjX8C6s0r6JhqMP+J37hvVyl3KKbdYTrt2mCKnNDPR
         dFa++tGiOhCmVAPTDBNOBZ+/FYjY2XnEehCAl26jldhRwJjHQfxFxycMIZ2860yrP/dB
         aqtRoitnFK+bScW4973b50bWbMpLOkw2YyCX5jHh2E2Uzdlkyo7xXRYjzP52MgWv6/yd
         l5Hpc6/FmSbkceMFAEIunsH7fc/2JN6t/vj4zxj3eulelO/OY6aj3hPKErr0CVXD7o+0
         /2jgYoTAzXn72smJdbBxsLFgjx7CwV+4whoC7laZsKAqXOE6XoAXJ0yzr2PIRyaTC9nQ
         5Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032715; x=1795637515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
        b=EAGmLT0TrzZNM5UjXuAVebnbvbgloxxzV6NgpR9Sm1bWn7KtUV5FqqWgeDhaagozjC
         n/JwUpSW+SUNtVtvTQ5D/anFYE4KYq5fjigJ16LBsBG5AhtPtbDi0cdjTZCqBWI/fxJ/
         mHd8XGNs9/oHVOJwrckPaGr9i9EVltY0t5v1pHRP1Rx3fo3/nkMNcLJjpwZdj4znbLjj
         U4999cotWSp8N8pMwf9q3ny3mw18NWjGocYUUAWawZ05aeCl+Ebmu1ortW6a2mojBWAo
         +lBt9m84XgttOg8m8INUYJK5cVsDgsltY14FEa6JbV8m7gLPbvcxbJ8I/6XXdpWoA57P
         1EfA==
X-Forwarded-Encrypted: i=1; AL+hErGouE3j/wZ2DXCK8qpSBAS8kb1G0B9QKXm4Dd5QMqWSJuDPx/sEBUM2dO9KChutZFd+H7d/0oBm+0bYMRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z89SxSBXKG7t1PIppl5Q0e8CR8RK+4e+8r1ndFjdFaywtkQQvxc
	UirAv7xRvHkmBoTUO4C9dMHZ5lxVFaLe8b+6rrtZ2qD23x/ptOgpvqwQ8trk3CE4XAiJHIXJX0W
	EsOcVMs+fBj4bJOgCpOJJ+bMOUTvtwYEf+meFQ+GU
X-Gm-Gg: AYBFou0uIX3i1XQcvJIyuueJYNMfPJvNogQL55rursA3ZkhUuDWwHVF/N/QYOr25AxT
	W0EghG8BuhmOvrZoNW+ZURgmbn85E00L83c3yxfpb8p9W9WK53IC4cb1RhmPHxDRL8rPV0fCdOR
	kb5KXGKGgq2bLJBDla0emNzuwhTXwcYn2TB5L9Z2GSCjxQkBtHnQslt8Y81t9Xzq7fz0q6euszA
	e7tGrZjZWRPXPTpUyw/LrVP5zOXxqKWWn6vT/Gd8BdJqS6sn3hUQI6Y/bRPEh081qhRqmaCmBrL
	83gmpXw+b7IVTafWEy49LCvg1frB9idJQmx2P5imtwI7TCrvNTnB/cbVnmPvNEXWjba3yKzX/Ct
	Z0eBCRqbpFQiuIr/Q8iMLPv2SS2Bp1AuXARhpYVD2DsLQ1Um9bGO7arfelAx9xsatjKBcGAxAqY
	9ImGcWRFztBMVm
X-Received: by 2002:a05:600c:4f4f:b0:4a1:f377:5c6c with SMTP id
 5b1f17b1804b1-4bb7da1274dmr73938355e9.10.1795032714637; Wed, 18 Nov 2026
 12:11:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com> <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com>
In-Reply-To: <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 21:11:42 +0100
X-Gm-Features: Aa3M54q33nCN9_jrrnbqRVjKUIfyyWJWqzyIJScCl4pTAw6Zw2JFPOFUAC-yfZc
Message-ID: <CAH5fLgidhnPbP=xXQ3162w6q0U6rWHPZ9Mu6-E5va4_CXyanOg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 7:48=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Function merging causes various different issues:
> >
> > * For CONFIG_CFI there's an LLVM bug causing functions with different
> >   CFI hashes to get merged. This can lead to crashes at runtime.
>
> Do you have a link to a bug filed against llvm?

https://github.com/llvm/llvm-project/issues/217629

> > * For gendwarfksyms it causes functions with different CRCs to get
> >   merged. This leads to broken MODVERSIONS information if the function
> >   changes in the future so that it can no longer be merged.
> > * Wrong backtraces when a crash occurs in a merged function.
> > * Possibly also issues with pahole/BTF as the merged function's debug
> >   info is lost.
> >
> > These issues are new to Rust because in clang, function merging is off
> > by default, so these things have never come up before. Because of this,
>
> I've never heard of function merging (in clang). I've heard of
> -Wl,--icf=3D{none,safe,all), a linker flag.  Is rustc setting that by
> default, implicitly?
> https://github.com/ClangBuiltLinux/linux/issues/1598

No, this isn't linker ICF. rustc doesn't pass --icf, and in any case
kbuild invokes rustc with --emit=3Dobj and does the final link itself, so
rustc's linker arguments never come into play.

What I'm referring to is LLVM's MergeFunctions IR pass
(llvm/lib/Transforms/IPO/MergeFunctions.cpp). It runs as part of the
optimization pipeline, within a single codegen unit, before any object
file is emitted. Clang only enables it with the cc1-only flag
-fmerge-functions, which the kernel never passes, so C code in the
kernel never sees it.

rustc, however, enables it by default whenever optimizing for speed or
size (opt-level 2, 3, s or z), which covers both kernel configurations.
It uses the "aliases" mode: when two functions have identical bodies,
one is deleted and its symbol becomes a GlobalAlias to the other. You
can turn it off with -Zmerge-functions=3Ddisabled.

Alice
