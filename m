Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795002774;
	b=D0uLBN5KG8e+6rzPRbuzxkdHpghLNjwUUWiTtZCnBwm8oUAknJcEEq0f6mdIIrlEkdY6
	 n3TyrxZ5i8IIUexun4pvtRRy7yn5Y3S9Rfr3U9Cbm9J1rf86slCmWUj9prPDlKzG7M7aK
	 f5gmC0YTIX71AmXxPua/uywA4bqof1VBwXkk4y7BYJPwX9M8pXqdDZghUGBliTNoi9kpG
	 f76F1XQcVJBPoBH+teotpjSGP2NmATEmtubkk96diKm5KKS9EDEVZujPVUAuuUxQcxYdE
	 YZDQRS0UEwW6TZorlAkjufXmK3Wat/RAbp6ZnciQAqHjDPvdgdgqWRDTbM4YCb7PKLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
	b=yiTlW6EoGTMTs4+pX91Y1I9qquY8ObKavi8/2WJ6457kII8pGDhNYUltRHFQNBPPTCub
	 +OT5Eu98M6xud+7Y5EIgUmwZ06mrOhT6ALE/eJr55GK16xI9GTr/y4YcrYqmhuBkPpIFQ
	 8b2DneB2Pbkkb0tZl2OsrwKox80rHBJwY5unEnjX17ZcVVOYhLYkMvy/401djnbfUqA/Y
	 9gUfX0WMkLUOXxumoKL7oYgf6DbS3DsZ4GFxJm/Vus29KVMce0tI98XaJy4iPvQCCZoWS
	 PRY2FAZQ5NHF9lVG5EtubE/z7fVMm/N/ltta7ufbWVVoby7x/Y305Xlf/oT2enfMXdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e5O1YFgV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E88606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E88606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e5O1YFgV
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so447254f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:52:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795002773; cv=none;
        d=google.com; s=arc-20260327;
        b=Byx4D7eX+9qyoch1zDj4AMEHvJtHtmhvXxmDp15RKZrG//wgMNbAhPGRJ7/LxfPUXa
         zIXTszdSBmbp07nknICcEUiN2Gyx2NyeJYNcJ1bX17N5EuX5uK7vM1jluOb0PfPXthcq
         Oc6UndyED0ONZSTLnNzErEx+mKuBFWbZObhg93RO07ImhBjY8ONsaR2dj3aWG0jYF29E
         Sj6/tMDgYiTKg19o/qPtAZABEdh4sSmYKUISXCcc2KMZZ5iazrGFqQAdQRv6SAEuvEXQ
         sFbmrgXaYzGK46FKcTK30QoAjTEGAd/BGSZdOdCzzd+BLq5vaD7q41WcH/mFxZUeDPJQ
         Qt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
        fh=dHFjWnIuAaTrsUJsntlT+Q8K+5DDAAwUixQdoJE1bW4=;
        b=fw9XIUCBvxtImUQqgCCOEcllcphSElHEr1WYYhLn/zg2vyjWrmT4ZgA0d0dUda4pYo
         k23Nt8+plTAoo49s0GKmsMuFqlGU+trClJg3jKJC0Dz1GtW6a4Vq6TtHh+aBTmezj4eh
         Uiju0BUJHqrJa7nngzC7pi2fONeJDcgUpxAtuMWX1Im72OhdRaatcZ53LP3UoLNC/hHL
         8EU83NrviAIICCy8DcdmuKFx1HHXbttHXntGCMaZSMmF6vzATyoVtRaNqCCYge3bJZt3
         CBCOfH+WJOIph5Fcg1akua0ly92o32MGS7OoKiAQin1AH9Gjn338P/4FHuwt8m38FsGb
         Q7Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795002773; x=1795607573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
        b=e5O1YFgVRV5ukFJdMUpqscp7b4nWgoG1SlTnydT8WNraL5M24baxJfaf1SsX4Jnppx
         7hjVczj49PUmm+DKVG37TuG3QKDMrBLoaR/ZWk0Nvmo6V7XpXLLONKz9hgUOGmjdkedg
         kr9f9PizDYLmDSGTi2uAPBf5G2zixwONqa5bdcYfUJ6DiNcOGkJ2BIQ1KpxNrQDYewkH
         zY6I8/KKfpViBPfn3WPnzdzLxfFuUatkDgdcFcVPDCNwCaTAd5dTxwkiY5pafpWyT4+q
         UPPTSDk05TSOtR3J9lyYNYsuSjH+3+hCyY3YmqpWvxkBtWcY5IN6h2ZECTs/aondEb+E
         MvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002773; x=1795607573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
        b=KdSVl10o9VqvP8EUOyHCusg5KRoeuVw8xm0AqeJbim7Yye2YX2vDoBLI59kCMQr/a2
         BVQUKRz3/UkcV3DF9EH927GRqZpijU6akzgJC2BhYUyxjeYIp40cjx/7RT/f8ke32Qkt
         9VDxXNcel7FtvVrQo2lxf/mk57EJ9sBi8Iu31B5nHL8pW4JvNg5vYq/VYtPopH8RmFMt
         I5D88cTj0QlqBTb3yZxaZM9p3v6iQDAIBx1p4EDMmBOJEsuk2ScfzoYf0qJ7ugecueZ4
         e9V8Edsk+jLOZ642TQEYgY0PRB9pBkUEVqT+xtSQkkDa7jVhn3RFW3Ja2W4mqyeo0JLz
         TpIg==
X-Forwarded-Encrypted: i=1; AL+hErEquFPt/w8qFYL3dejgEfHPdXw1BHR6V2ti9m1Z0QEt47XwE7CPnjNL5+hbgMr49WI6uaxJvUAO/nvJ3Zs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zKycxAi5Tr84lhO36sGZwYeA3CECYgQR3p/vk7dq+SY1ByzY7
	kkKvnzne3JGaYdb10YRSiaXgz/59vhmnHj4trF3L2Ew0Bf9zaBDIM+/QHemcK+D9GghvvC5esnD
	DKMwNVflsOyyZGZWXsVkxD/vIIEzjEWSM5nHxPugD
X-Gm-Gg: AYBFou1+FGJNpcXJJxOsPGiXsYaz6Zle9QQoz6BaO/iBtTu9V8qPC41KB2nW2DrbVJm
	vXucmJs8q3e13Gaq47s/KZ7LGa8CRFFhgbsAZDh64tpiBtWZU5soV15d36/tJFJV9POOjkde0Pa
	nI7Z81uzE1baGkTTB7JfOdr2N+nCW2aO4FlOToJEZkaEMV72ZncI0y6SA6EYuQeKqbu8JmBQb7M
	QEWXiIEMLpi46zWzWGloyN2p6jaHsGHmtAZgeU0hJnuMDxJ7BSxO2uHIfJcAshdtchpsTF51lEY
	BAe7nrSC0hxEPIym9bh+IJ9UsJJYMpxqsYhaFh+mhascDVSS5zgm3qkTcGCHom3heTb1oYkEQ3F
	vBDVUJe9lRghDtRkuUqx+U8hUJfmXS3LAeB17dTCtMyXG4sAJocq7e5UgOE0b0iberbZTdBYgik
	WakvQ/JUrTKYw1dtdak7vSdlLftY4VkHAkZeTdZ/qg+oPGtR20wpvCA0GGVBKrdp4KfQ==
X-Received: by 2002:a05:600c:a303:b0:4a2:84c:52f3 with SMTP id
 5b1f17b1804b1-4bb7da13acdmr37565995e9.6.1795002772260; Wed, 18 Nov 2026
 03:52:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
 <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
 <avy_9SPRaPSKD8b4@google.com> <DMYASURCURHG.2Z417FHDGBR5F@garyguo.net>
In-Reply-To: <DMYASURCURHG.2Z417FHDGBR5F@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 12:52:39 +0100
X-Gm-Features: Aa3M54rk28vpmTCa3HDqQLECd8XwI0zPt6LHL51Y7EEk1gBPhG59tDP6nvzdrww
Message-ID: <CAH5fLggQ=N5D3DyCHJyLMB11XEyJF2eVBndYwwktLVeVfyOJpA@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 12:25=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Nov 17, 2026 at 8:58 PM GMT, Alice Ryhl wrote:
> > On Fri, Aug 21, 2026 at 11:20:18AM +0200, Miguel Ojeda wrote:
> >> On Fri, Aug 21, 2026 at 1:43=E2=80=AFAM Sami Tolvanen <samitolvanen@go=
ogle.com> wrote:
> >> >
> >> > The LLVM fix itself is trivial, and it looks like a pull request for
> >> > it already exists. I assume we'll want to drop this flag for fixed
> >> > LLVM versions when they're available.
> >>
> >> I will link it in the commit message when I pick it up soon -- already
> >> did in https://github.com/Rust-for-Linux/linux/issues/1132.
> >>
> >> I also added the `-Z` flag to https://github.com/Rust-for-Linux/linux/=
issues/2.
> >>
> >> The `-Zmerge-functions` flag is internal but has been there since Rust
> >> 1.34.0 in upstream commit:
> >>
> >>   b91d211b4030 ("Add a target option "merge-functions" taking values
> >> in ("disabled", "trampolines", or "aliases (the default)) to allow
> >> targets to opt out of the MergeFunctions LLVM pass. Also add a
> >> corresponding -Z option with the same name and values.")
> >>
> >> so that should be fine, but I will ping upstream Rust so that they are
> >> aware we are using it.
> >>
> >> And, yeah, agreed, we probably should remove the flag conditionally
> >> later on, to confirm the bug is gone etc.
> >
> > Function merging should also be disabled with gendwarfksyms. It causes
> > faux::Registration::as_raw() and Page::as_ptr() to get merged, which
> > incorrectly causes the former to get the CRC of the latter.
>
> Do we not want merging at all, or only when the types are not going to ma=
tch up?
> If somehow the KCFI type metadata is always emitted, will two functions w=
ith the
> same KCFI type metadata be mergeable for gendwarfksyms purpose?

In principle merging would be ok if the gendwarfksyms CRCs are the
same. I think that if KCFI hashes match, then the gendwarfksyms CRCs
are quite likely to be the same too, but I don't think it's a hard
guarantee.

After all, for a pointer to struct argument, the KCFI hash depends
only on the struct name, whereas gendwarfksym CRC also looks at its
fields.


Alice
