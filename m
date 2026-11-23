Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795430521;
	b=DRLXFu8Y/mT66sjDXLXf46MMxmauH12cXqhH9QjoavqVKIfex74n7V5YA3jGVaNWlZgt
	 7OIudpFqq6YG1z2UgCnZbLgtC3V2k+SzNw07vBtDE9iAr8SShRuOxIsFVdhIVXUIAy6RZ
	 eMXJwbFx2QGUoMQl66/lRuRaydk2L7lPOtPjhM6KBB/+RssOsj/mO0jugR/eLPPxdtM4+
	 T4hkY6aheMPwvXjwhpygqXIzxze18z6WvMizGfka6hjVYxNF4v6guaB1gh0gBsiJYhueb
	 nBllLDJDMJTLXi0qzUM5bU4Dqrqd+JMOsI0oHlISiwqL/hXhsNwJJ9zvWM9Tv8B4xMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XhoOrqJDbQt9SAfQacKyOATjFJfF+l8LSMbumVFvOZs=;
	b=s1hYYWXQ42qUUKKR9ZT+rZcCkineEfjnvx3QSIBFOAEsVS80N0pJgDzUXolrl/WSM4wc
	 U5YEianlKus44C9bIxtkVwY7vxWjMMghVNvRhieUi1jVGyfUH22nnLv2xbOLJtTQ+SfQA
	 lqyxjsyFBjM8LG/CFaygH4o8845T/5/vcZ86x4gt9kOEhHjCOghDGPUOH24YAf7JAFokO
	 vaVL8nyvAWFsHzgOHkNQpBhWWUDDadoKa+BXm1lTLvVVkk0Dw9UKRDog2+Y8hABz5nVyb
	 g2nKmddSR1bs6Js5tGp6zehlH3q3RMqNGJLdl3YoT0yeuR+HQ7W6n4v657b3Md6fFRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5CxacYG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A55D606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A55D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5CxacYG
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-949dcf80821so102128385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:42:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795430519; cv=none;
        d=google.com; s=arc-20260327;
        b=EdRqaTDykO6TIRgEriY6WlLb8mRCl7KwEOc+10ITU+hCPV7BYXPLq+gxEzui/aHPPn
         XXCSd6a60eRqxIYXkovqv+NN9r38I4FmaDXGon5adaIyYvFnywTfeAs0OO6OL8G1ZAAn
         3zidGwoGLAK0gSfzOl3GYtVKoC0XIVGV1Ds69Juy9aHd+TpYO8HUp7BcmoSWLHwFBVrC
         Mwfz2ZP7QIPtWGwNMaYywdhmMk1ulWyeO9hbIuZhQyGUvbjRRZ4dvBzFymYFH41ZFODO
         sCH6uXRdcBQvt2XSBSCpmu3u1bX2hFze8gQAk6fo9ed5e51lpvX9iqfqhWqEH5VL55Oo
         UbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XhoOrqJDbQt9SAfQacKyOATjFJfF+l8LSMbumVFvOZs=;
        fh=v2LGFslFFbzLqWUEtIUX3ugqEn1BqYUb/MBGN+Nz6Uw=;
        b=Epz0kmtPCW8zremwwTmORCBle7eeUf3FOaLgeAoTgKLE8LZ7j9cqEqwRkaz0M5M/14
         fcPrKTzls+EzRAkajV99xde8JGko0Ja0x2HXtVBarvLFBhyBxKUsuTC5gsUtjbawzEBT
         K7skmD02AGIGcQyVJIduO/Z1NoO/WyXKz4zqdmgCETk6zq1vPWvojwWxtw7FLQlzgoqu
         fSbAqBNY1K6CLjUIbIyfXaKJwAX+eiKdps1TrkwvA4MgT9Ai+nN+wg4KfiOdtRudoK5U
         a0RAlG3So7wJfw70MEHKbYn7fJsctGc1xjjxDlGcd1qIDPYdic+NQzsDLYeGdDCZEfF8
         62lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430519; x=1796035319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XhoOrqJDbQt9SAfQacKyOATjFJfF+l8LSMbumVFvOZs=;
        b=Z5CxacYGLdDZfWQi7Wf+MgYhdyZwtmj6v+wKj/cqXCivpLpznNmXgFehz7Nwh0xkGL
         gy/sbiTOkNoGikmc7ltFeguF1ea3nBF7BVtCMzhCUDwZBysjy2O0+bQRaSQbvyG8bAwS
         zCKJVjAWUU11ttlfwdD4z6pIQayqwJBY7ETjR+tSgHAe26t5FlXmCLb75jD4DJSkQeZJ
         94dw5RbjhZ0rJWXd+cO9nrMnNVx0K18luGQ2CTciDORvn6jMcK0tUk0Grb0IYcK9EF0i
         h0aRnoa9s6e4Q0ULSdg/bXA7exHruIRgSZEku/Rs/BpK+0Nf6XxuWDC4+r0BQZI0L7LM
         ncWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430519; x=1796035319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhoOrqJDbQt9SAfQacKyOATjFJfF+l8LSMbumVFvOZs=;
        b=S4mrvoP1BX5j+PPVp13d81H1wi/iEtesOrfCBHVbWI+y6owpW+qiM81C8hiK12k8I9
         LLIl+AJYngeZhOmTv0qzRJotrejSY9DRr1P3cQynhMXg/W8jyLM5AEKKi8jLWHnKhqoC
         rFncS1XGXRQPeskmg9wO+llGQ1q34a9MTp+U4nFiAbRWi8xbonEvUPzIHzdFL+ybp4Ku
         4xZxHZLnJKrd/eKLjK5uoKvz2fEEVjOT01XNgHtk/7UVwJkS9aRkqUuqIhk/IE1Roz8q
         WxtqZNg4FvztaPyWaX3705pUloKjjP8W7ruY8aJdXwWuREQsAlSGIW0apLcl3qH7sKhy
         RVvg==
X-Forwarded-Encrypted: i=1; AL+hErE8vaqBuEN8TVyw3MMpMyL16TLe/w/8jROw1FWf0x6kI/h+aAhCb1GKtlods6phSIcmp02Aduv75GgdrrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fZRG8QEsyKDBiwWg7sBraqDc89XSYzSHKLE+hb0I4/kdss1r6
	3JEu42sCt5/FCumFn9Z//Zx2XEakTnkXPHlFN/oOG6c5fjJuijtbrmHNBAq255wiSOiKjLSkElY
	M0Luz9Nm/ud6XycLRu+GJtJc60ARSbFolbI83ZE9eo1PE
X-Gm-Gg: AZFdTZe5eX4sr9x7nN5hJ/5KpTMNVT//UJm4n0HyFs4jG9IsWX1V2N3NMTP3JNBIY9K
	MVdjytknHWGQBBBK5W9MZw22sRoMBMKPdgikOFTSoqzRDfw8Jce2lzxm5XaZJtuW8fjQ6xYUt/b
	dB+5DB0XKRMG7JSJjQXScs32qEAN2oy99uvKwIVbQs2gXNBxDYaDdMhl2F/LXKC9aJNPJtxCqbZ
	PSQiLQU4bAMmtucZyu9Lk5jBhnnaClSKArewiP6fPa87ESeqwyV8kFYtO2FxZAzm0hLyh+LWSBc
	TY/xruwnUDjlP/Dhu0de1S74cscUOD9DCDE+7LERROnEWodUPOH2gnLCrgbpsffuNtdOB/fggx8
	egykvx29ehLuQIk853U++iNOHe9taiYKfomEm
X-Received: by 2002:a05:620a:2b85:b0:93e:722b:1f79 with SMTP id
 af79cd13be357-949bab1bf5amr1751787985a.53.1795430519485; Mon, 23 Nov 2026
 02:41:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116195011.24156-1-mbkchelofficialdev@gmail.com>
In-Reply-To: <20261116195011.24156-1-mbkchelofficialdev@gmail.com>
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Date: Mon, 23 Nov 2026 12:41:48 +0200
X-Gm-Features: Aa3M54pS9yahJSWNN-tmF89We6qpc300mvM1QgNITUbjosx0r9KSgFaBXaiPrgY
Message-ID: <CA+YDrKDJDWT0Z=iNpnjtTFQH8VK811XJf8KFyQ_QJ_j_gxaATA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: sync: atomic: Update safety requirements for `AtomicAdd`
To: rust-for-linux@vger.kernel.org
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Gentle ping on this series. Is there anything I should change?

Thanks,
Ivan

=D0=BF=D0=BD, 16 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 21:5=
0, Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>:
>
> The `# Safety` comment on `AtomicAdd` contained an unresolved TODO and a
> broken sentence ("...to must yield...") without properly defining
> `wrapping_add`. Remove the TODO, fix the phrasing, and define it as
> wrapping two's-complement addition (`v.wrapping_add(delta)`), which
> accurately reflects the behavior of the underlying integer primitives
> since `AtomicImpl` itself has no `wrapping_add` method.
>
> Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
> ---
>  rust/kernel/sync/atomic.rs | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index 6d27898add42..5f6491fafd34 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs
> @@ -127,10 +127,11 @@ pub unsafe trait AtomicType: Sized + Copy {
>  ///
>  /// # Safety
>  ///
> -// TODO: Properly defines `wrapping_add` in the following comment.
> -/// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`S=
elf::rhs_into_delta()`] to
> -/// any value of type `Self::Repr` obtained through transmuting a value =
of type `Self` to must
> -/// yield a value with a bit pattern also valid for `Self`.
> +/// Given a value `v` of type `Self::Repr` obtained by transmuting a val=
ue of type [`Self`], and
> +/// a value `delta` of type `<Self::Repr as AtomicImpl>::Delta` obtained=
 by
> +/// [`Self::rhs_into_delta()`], the wrapping two's-complement addition o=
f `delta` to `v` (that is,
> +/// `v.wrapping_add(delta)` on primitive integer types) must yield a val=
ue with a bit pattern also
> +/// valid for [`Self`].
>  pub unsafe trait AtomicAdd<Rhs =3D Self>: AtomicType {
>      /// Converts `Rhs` into the `Delta` type of the atomic implementatio=
n.
>      fn rhs_into_delta(rhs: Rhs) -> <Self::Repr as AtomicImpl>::Delta;
> --
> 2.56.1
>
