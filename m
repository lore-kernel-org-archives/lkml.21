Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720459;
	b=L2wrNDd+ua+4K59cVdwhPQwkRRb+rDXeGEZQ/gPtSPLGiM+KcdvMbul7aSB+iXsaXzLe
	 gmc8ktnKygOEweei9pdBfLGyjqeZOisGxv3T75uudFsBoqrldBOZLU1+fGLCKEX+A7B3C
	 B6D49KUrSWFvpa04FR2SIIv8IP16DfE7kCoY306efiuVQGIvYYklxocpJUI2Nk9MnHnx5
	 EjlJaDkJ7tWYdnTqDG0FBN+ipPmEcvSvJFGqtJsgRojsGwQNEYUmSiwos4u37CGedtGJ5
	 6e7BlyXzml7jd2s5wji7DZ6QGtQq0WoYoTmtjCAFAQAHXtuhZz+KzPaqHwf5OPyz09g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=8q/VB3c/73wlCZkx7DvMv3nIBqo12V1N1B2GG0LAjuo=;
	b=MozPq0boDJlCoKu0pq5TizUnNrYLPLW53ysdpnmvH3BxrfvM1ldR6Wnf81l861bWoCrf
	 KCNXWwNBRziuDFbUV1uzL/ONn9lNPLnwtu1PElUOTQcovVoSsIPqzSDDRjsDfgTdJmpOA
	 M8R2KxLxoJPd2RHNd+Widi9D1NroRfEVVFkJpVamlsk7/NM1xhfw3fLG2sJCz5LuUjA5i
	 I/VkTVVJUg2VDqZjkUux00wWV7yJjyJRbrPi9inwfMe9Vxlfmc+gPQtNVtY9Q0qD+5hUL
	 ZH+jjCGaf5EumLJw+HlYfBSzwZwxNcqubCm1lA/vV52/ughjbduJ+duFcYYbcI0UkTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dqEi5PDv;
	arc=none smtp.remote-ip=209.85.208.72
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DA0606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39DA0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dqEi5PDv
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b879130a02so6610502a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795720457; x=1796325257; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8q/VB3c/73wlCZkx7DvMv3nIBqo12V1N1B2GG0LAjuo=;
        b=dqEi5PDv30gTfAasu5Ja/e+ur78G8qsuDm93O1UkP+UvXGZ82G4AGKiRBruSkCQqyn
         FPUJJZvCkpmo3hRzM06O9EmZXgDAnY/72P3ybkYV2d6dEpc9pHmknbUJeE/TKPBol5gz
         f0bHEiWdwLDOKQXMn0u3duo52cvDxmfSMrH4Y3ReIPZBmT08gFnL66b24BGjLzesO6jP
         SWqZJw501z99arvEfU2cl116uO9lPnjdt7ZmG4I/5uqhCDkta0AUWMxIvP1B9dgyOVxW
         4r5v6nDlwIaiR31vTboH52xjNarc5b4B5AX8Je7peCugULdcaUGradVecwj1mAgJCZR+
         1jHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795720457; x=1796325257;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8q/VB3c/73wlCZkx7DvMv3nIBqo12V1N1B2GG0LAjuo=;
        b=rPjSXqWmjf7nuDyLdQzrVESsKvqvXbTOyMmL50rCgaqvdQ6L4UgjgWt2jvlE0Zxb7b
         YwIKDuy2OvH+fm5vLPm7mWe+CLeuuNw/Ij9q8ATKRfTYQIxL+gn3ryCL8/GazBGyscHv
         jggVwprkckfQu5au3qXX96IlQYktviiDLqg9af6GzrhtkIZ4gpk7tofq2qRd/XH77ZDn
         NLua1Wmu91YTPa1/8EXMYZJUTFCMewR6A+JqyTjNz/qnzqEqMuxd/6Q5pcZ0jsmIk63W
         GuIgEzqv7F/gRaCFdBmr8fas/LYA9q2qpWouP0LpUUGqatQiYk6X54oNwWQlNJR0X1KZ
         CluA==
X-Forwarded-Encrypted: i=1; AL+hErEkr/zaMBVwVW/ySOtgA+jlr7e8x+yUZ+BR8skEs0Cye/gs512owX3e/1yno5ZCbhtH9+Feqf949CgGMKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kem4rp8RYIwAsaRSCXmqSaRvbgT7CAsYGjCwbwAicacK6D8mA
	ZwLR+MqAdXQIeSPtG+5fgUadty5bRDiWJMBSC8XNo+ETvBpb4gwQkWvdib18gVUcL4gr9IcT6W2
	YKykEx2QGy2Cl5dZyZw==
X-Received: from edgd12-n2.prod.google.com ([2002:a05:6402:a50c:20b0:6b8:8b9a:86f6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:c0c8:0:b0:6b9:278a:99f4 with SMTP id 4fb4d7f45d1cf-6ba37d5bcd8mr11922168a12.10.1795720457280;
 Thu, 26 Nov 2026 11:14:17 -0800 (PST)
Date: Thu, 26 Nov 2026 19:14:16 +0000
In-Reply-To: <20261126-b4-rust-reset-v1-5-9c4c3d029080@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261126-b4-rust-reset-v1-0-9c4c3d029080@collabora.com> <20261126-b4-rust-reset-v1-5-9c4c3d029080@collabora.com>
Message-ID: <awiFCBnJ_i-N_Blb@google.com>
Subject: Re: [PATCH 5/7] rust: reset: add SharedResetControl
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 26, 2026 at 01:04:32PM -0300, Daniel Almeida wrote:
> +    /// Deasserts the reset line and moves the [`SharedResetControl`] to the [`Deasserted`] state.
> +    ///
> +    /// Equivalent to the kernel's [`reset_control_deassert()`].
> +    ///
> +    /// [`reset_control_deassert()`]:
> +    /// https://docs.kernel.org/driver-api/reset.html#c.reset_control_deassert
> +    #[inline]
> +    pub fn deassert(self) -> Result<SharedResetControl<'a, Deasserted>, Error<Self>> {
> +        // INVARIANT: The reference that `self` owns moves to the value that this returns.
> +        let reset = ManuallyDrop::new(self);
> +
> +        // SAFETY: By the type invariants, `reset.inner` is a pointer that a C getter returned, and
> +        // `reset` owns its reference.
> +        to_result(unsafe { bindings::reset_control_deassert(reset.inner) })
> +            .map(|()| SharedResetControl {
> +                inner: reset.inner,
> +                _phantom: PhantomData,
> +            })
> +            .map_err(|error| Error {
> +                error,
> +                reset: ManuallyDrop::into_inner(reset),
> +            })
> +    }

The C side here interacts badly with the error path of
`SharedResetControl::deassert()`.

In `drivers/reset/core.c`, `reset_control_deassert()` does:

    if (rstc->shared) {
        if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
            return -EINVAL;

        if (atomic_inc_return(&rstc->deassert_count) != 1)
            return 0;
    }
    ...
    return rcdev->ops->deassert(rcdev, rstc->id);

Unlike `reset_control_reset()`, `reset_control_deassert()` does not
decrement `rstc->deassert_count` when `rcdev->ops->deassert()` returns
an error.

Because `SharedResetControl::deassert()` returns `reset` in the
`Unknown` state (`ASSERT_ON_DROP == false`) on error:

- If the caller drops `reset`, `deassert_count` stays leaked at 1, so
  future shared users will see `deassert_count != 0` and skip
  `ops->deassert()`.

- If the caller retries `reset.deassert()`, `atomic_inc_return()` returns
  2 (`!= 1`), so `reset_control_deassert()` returns 0 without calling
  `ops->deassert()`, leaving the line asserted while Rust treats the
  control as `Deasserted`.

I wonder if this is a bug on the C side we should fix in core.c?

Alice
