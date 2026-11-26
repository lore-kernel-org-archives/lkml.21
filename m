Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697981;
	b=PsJW3wh/ZQBuMJEpOO5bL7cI2dh4ulErtzUPeO7UWq3g7yXBbakD255EsoCpPR5tcQkT
	 JpxBuCeZ6t8odHZJqT+CRtgn2gQINUnYr/Mtusfzbzfy8kYnmw5Bc56EMW36/dxJfBpES
	 WVNlYQGdA3qdhd9ooFbzUEcZA7MIN5vVEHpKj+w8kpX8s494oq//twOe30dl2kC6c6HP/
	 +nD9IcfpWZm7sLN5gyjTYBuhGASIQRLidd4u44DMZBiSaNO6D3vskePbVz9JWA4n0tKnI
	 wdFlYlJRFBCvvbcBPJ5ZTBpyafVBMqrBnSswJY5qw5mn/qgQNYQv11He1tXKVw2LtAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/pb5zHgl63KG16XK2xUlTaZkg6Ui48LOGLyMhDrC7G4=;
	b=T5CMHhAKJs98dL1fyxtOT8LjVEaD8q40RfshlUlGYhldbmP9Jf8xhdseDyw1F58qHjzu
	 YJ1OcAEs+SnsueWHV5Zj6Lucuqs3gaFWlFvw61J+/8488dWzSgcI4ncOzwSP4yQzLNzOv
	 t7VKVe0usHVSua7B+vikqY5pHi5zgK2pcziLYfNKeJP1mkhZMi991Tsn9jkLBovEtdxTu
	 hh+whbJDhUDgquCmp5zoyktMtCMewSLt2wzP0mkh1+UgxZdek6NcCBGgCRMLTLwsfnrcg
	 Q7737VI5m6jAOzR/HSihXse6HHyKFVcCEUCTf7EOO+0w2xyA+L/0kdbGMEZV2U1wQmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nsr97qYH;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E244606A339
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E244606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nsr97qYH
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb64c99bb8so57375245e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795697979; x=1796302779; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/pb5zHgl63KG16XK2xUlTaZkg6Ui48LOGLyMhDrC7G4=;
        b=nsr97qYH0hDOSFszgs7HZR6asNaHVQfl1MZN90sDF7HCf0LvZ6wfI2nIZ3i1mE6lQ8
         owQvd+UFRNZpkgonEqgq4iDwsQP5gxQwNSxeUDdk2andjlgP2BLzqeqouObf0QpM18Mu
         qMY53fEqoXHGqqVXjYQ7sNaIygIVq1rLwRY2yrepFoPvqn4yjDD+EI3O77xvKF2DkU8A
         0b1qAo22XUeVoJ1ARb9fNFblciwokobaN9a83d/NMf3/u7uEuSKH4rCjCB+0rmdUb8Bp
         3sxDq0znmhjPNuTxqErta1LoHvjC+PJsenNGYz4CYAQhWY4MzkqlPgmA1uh+tAtu4USm
         LpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697979; x=1796302779;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/pb5zHgl63KG16XK2xUlTaZkg6Ui48LOGLyMhDrC7G4=;
        b=cXJU3SFdNuKf4UmINN58Q6O5noueA9i1PmoPY4cYK3nJc0P+OYw3zroxcWN6/8LiEP
         i6TFbgM6dj4J9wlRaWeRorqtpGgXBvDQipm0s1DIh5gC07uSpuYADZAoxpxnj2pIoGhM
         tuy8/rsg0cGPoF9Yo51Utwr4DKnxYBn0SIMiSWkj5qQilX4JFyOTs075rWsFsoCCNWAt
         C+pHH8kvh16T9D5Lsbe/zpe49o+F4dJFmIE4WdBt4SsV107vu1fPBlt//ZVhh8WCcD4a
         DlWqSgvaM0584AvEL/3KBar/vtvWMnmRWvgHm2ZqgyV+DyvnlheP8sbck0LDpGgRPHOe
         Y65w==
X-Forwarded-Encrypted: i=1; AL+hErEtl2lW6zv2BjoqxCyW744xZLWSoeA2UqXef5iSkBkc7YbhmRjLBZn+bunuLJa8oIsNdUtFZQnN8cJDjWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nJrHCW1vhhuri5SpmjRhAiy/pvhOp/TY8RkWh2EIGp94w7cD2
	ApdfOXdeFRZqgY0r1aTzWETip3AsfRnbG4E/B3nBkYEZsr6LgfytS3cmkytAlkKS7BX2arH/7Wl
	43K/XuMOfpalqQBmzsg==
X-Received: from wmmh17.prod.google.com ([2002:a05:600c:4151:b0:4a1:e3ce:e2eb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e16:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb88813024mr432813665e9.25.1795697979116;
 Thu, 26 Nov 2026 04:59:39 -0800 (PST)
Date: Thu, 26 Nov 2026 12:59:37 +0000
In-Reply-To: <20261126-time-delta-display-v3-1-aeeecc72f3a8@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261126-time-delta-display-v3-1-aeeecc72f3a8@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126125937.3973192-1-aliceryhl@google.com>
Subject: Re: [PATCH v3] rust: time: implement `Debug` for `Delta`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 26, 2026 at 11:51:14AM +0100, Andreas Hindborg wrote:
> Implement the `Debug` trait for `Delta` so that a span of time can be
> printed by a formatter.
> 
> The span is printed as a count of the time unit it is stored in, suffixed
> with that unit, and with each group of three digits separated by an
> underscore the way Rust integer literals are written. A span of 12345
> nanoseconds is printed as `12_345 ns`.
> 
> `Debug` is implemented rather than `Display`, because `Delta` has no single
> obvious format and the other kernel types that carry a unit, `Hertz`,
> `MicroVolt` and `MicroWatt`, implement `Debug` only. Callers that need a
> specific format should use `Delta::as_nanos` and print the result
> themselves.

Thanks for addressing the earlier feedback! Aside from the 32-bit division
issue that Tomonori already pointed out, this looks good to me.

> +    #[inline]
> +    fn repr_to_i64(repr: Self::Repr) -> i64 {
> +        // CAST: `isize` is 32 or 64 bits wide on the architectures the kernel
> +        // supports, so widening to `i64` preserves the value.
> +        repr as i64
> +    }

Maybe we could add `impl FromSafeCast<isize> for i64` to
`kernel::num::casts` and use `i64::from_safe_cast(repr)` here?

> +        let mut groups = [0u64; 7];

Minor nit: since each group is `< 1000`, this could be `[0u16; 7]` instead
of `[0u64; 7]`.

Alice
