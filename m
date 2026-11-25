Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620837;
	b=GfwdjhJf+jHZ1UuhbUQkNZ48oIoG/BAMuooCGs1jbYT/lfaNdW9gF6K5WLi/oOUpaTAg
	 taG7wm3vo+L26JslaEUvSuYl5ARG/kk6bG0tw7/ou/f/xIL/qXV2svuSI7D84i5SDd7P3
	 eB96q76oVD7CT4gtTvPsYCA4dBBCR4c4WRe5WNJzFonzIqX3KjhzmYJ8wYJMQ/+NASAtH
	 4N+qvA2B67/LFWZX7N0ZpSiCVGITw6GQLbuAjHJJTXALTLoyCn7c4yv3K5TIkXtFy5WLq
	 OgfXj+V+Kc+k5UYFj2zWLQiUrNqQ9T64EjxzIeItMsDJ/f5oTskMumJsGgA861LUp9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
	b=Wjbm8JBR/wZdie46f7BbGEYXAmpxQs+P/26nsTz1YjC0H7CzrrfmiuZiXnnRAGtXbP6r
	 crRhNF7O7w4WEqz3q1EeCdM0fBmchfZ8NyD+0GbOTQVlohv1X7WJkfK2xEzTjBoV/9KvX
	 pQ44X29vUK2Aq7S+RA27O/aHBskYC3MxJmM/XMaViV0hOIbynsAkgeII81I0l/FXP4toQ
	 mF1BBr5FNFQSHJ49CzFbyS9RvysMKIuzew+KJkFMTW0x/tFZq4dmDlwmlpWuFX+tO9fxs
	 lvS73I1WkelGq5ZA+9U3oi8Bx2+N7owmkqvWlly9LSB9jnct+YFqN1wgg+CM0FNqZ9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=buKUYa8n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED61606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED61606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=buKUYa8n
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c14c0503dfso532398e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620835; cv=none;
        d=google.com; s=arc-20260327;
        b=Se0J0xzIfUip6NjR4DNk2H1JSTixyyXuhRSR10ZiVPn2aOH8X4qRW+4L74y4RxvJgd
         yssOITwuefTrJEsM30lZ04eGEYwG9gld0dXlO5TCZz+sibK6p8AhNAXY0b9V8iSYo8dA
         TMswdVlCAOO0kfGvUG5FtFh/E26cr+dByN3ldjKtjRo+CsNq7EbyIWB5NiFFwmuHFPn7
         H7OslKXAqPuFZCQYf58fLwARfrOPjX32jKr0NRWO55SrBO3W6CEZyj4rtLkbR8D+25YC
         g2PCKYABFvqbhc6m3/lX9nCODU4mWx8OhSUVER1HHzQEhxCNm/10cXgWTIank9akiwm1
         JPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        fh=cWSZpCVwPHtyGF4W9vEgO7ROTtNtqo6+jhupLcpbIZo=;
        b=KivfFhw3fTyd8axbfgf2plwrANBxfgXECyhwBE/1D0sfBBY98TK9Oa4FRMYAesvdPK
         XJrxLGUtOXVki5bCn4beaR/U3TnH6rdAiJJp6O9GtuU9l+Cy7v5nFLXvdhrBN2fH9tJ+
         Guu26Weau02LIeRSahXACZgk0+E6GVjanLeoisf21znW5VVbl3Wc/FkKtdwa5w0E+/uD
         5driCbD4I2IY14t/wjkgp6nuEd650T8UKTTI5cCiLw5MmTmNe+haCxYb8qk2G5IdavOr
         kQqGY2vcH+jB/RE5KOf6y25YoY6qhXPvHZfXsxe4JAsGZ+YimatX0RkP7bVVoELPWMH3
         ButA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620835; x=1796225635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        b=buKUYa8n/c+VXe6APnpgpXA6FOrq+FpjqfwIVQgo23FhWgtM2lNC3OswV9rT/1j1St
         s7iH62UZ9fSmbTJmNmOe1wusd6iKi7MKlpK7OQEZEeZVEAn1tcE9gW5483bhuLeVVlZX
         tGZhQYHe59rb/eOybw083v6sewKrRTARw8BaOX0EixFJjcVTURpw2ruRgQaNIr2d12TB
         1eAlRqX28isVPYAIbEdIx9S2DjhCtfSLFhVd4UQuba+fFbGKhnhcP1QT20dQyldgF5cO
         j9MrI9ffEitabU7NvGkF5I5XmQ7HGSV3Mvyua2JTeZmuW2ZM50kod9BFAcntFma3EQ+0
         sgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620835; x=1796225635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        b=IgViXb1751T/KnDIM4QGSriDcbOkko/f4loY17fYN6ENzk44MNhC4xCNlzmUH6z8Rs
         iRVp+cP2WWeVXKr8nv8oyA2YljjJsp0Wat54Bcl5vfEDd9OPqNyqfgstK3+lULk4cRq8
         64kaN8cOEh3E5gts/IRMYhmOc3i0+FCjt+OmNmJPawDeKGC32lkdBV8av7Mcr+3VRFow
         JdB6lCJoC7UZsats0qhJR0CPnX5dzj8WXGHL37vOhfL1pBCuF9vYKYYEcVrXEa75EMIV
         J9WZqMedA7zpGfavWhEu7Jw0B6uHoCu2hy46ykbAbc7quBwRtHFmp/wGO2R8sVfIP1CK
         mJYQ==
X-Forwarded-Encrypted: i=1; AL+hErFy5GSlCZ2gfD7OHD+WFK0/209HmACpQti5wU0JwUOY55zAIdvmSt8nLVafQFLDC5HXVKmf8+hUogL/I0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mduA5YKkeYRyir6FsRavEVZdiU9B6YWfq7jMNkNUaqd0/BYEz
	0m3pJGzFmafOT2o8mUBqFsc7Pxc2WdmnHYnWHOU2to6aPbV+5f+5to7HgB/9fhQcuB+zAeXZna2
	u+9FdulKBSsNMEjwUmPP1f1ZwZb+jjyI=
X-Gm-Gg: AZFdTZcVqfuR5fckLzrY/ned/+z5JjgnHeZ9GNrM360Zn/ggwiPE2o7lnuavx7Df0fe
	4Vb9KLDfDupymI7bJ4d4iPFM3/pi5tplrZHlOEikEZlb4t3Kyd/HsPpRuhhBbEve6NhCRLmgoA6
	TzIbLpt07VLI5QZGW92wPPP8VOp9D+LHWnSQvM5T9veVkIIVVoWg3DdinwHXQEhTnAs7B0hSTgy
	U1Gx4OxC4GYX9dN42wsv4Pa/EQXXVRjshmypebbmj9PSDZiKZ+vkixWAAjftKIoGNuegZM58MCx
	Y+7b/bA+JBd6DoWJlelJp1OCCF0xHZevYdOxJJby0hIPhJVFW07yQt5TJoXhruy1u5FYSEnI4fz
	OrbsKPOWoKC466OTiXRA8D4yFK/XAWCynSDXSWcAUeU8FxH+9LEdrhraKQ8tdYkXusrVxkjhRgO
	I5e73xORGCiQxUXFWe58FkLnvYdAvkPJeHvqbfUnQD09CO9gsTsizXTGRnOuj4LUf1fMfEnem5y
	kZEB/VFKXFnrgBLT3Z8bG4KpfNa6vhhROKJBDjRjfKWLSK65T7i8VFOP/kHwRE1bBsV/Y6f
X-Received: by 2002:a05:6512:6c3:b0:5c1:4a47:b86b with SMTP id
 2adb3069b0e04-5c1bc785b7amr6221022e87.3.1795620835046; Wed, 25 Nov 2026
 07:33:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-build-speedup-v6-0-141a4f861c67@kernel.org> <20261124-build-speedup-v6-2-141a4f861c67@kernel.org>
In-Reply-To: <20261124-build-speedup-v6-2-141a4f861c67@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Nov 2026 16:33:42 +0100
X-Gm-Features: Aa3M54rAUhOIl7nJAGzRxUt_IUS4JYfamPQ_n0qFr3V4ZOsnZoEMWuF3JwFrbDg
Message-ID: <CANiq72kdpY_tr0Gg16b24J1J-Duj3YS4rJ0CgNYVWQqmQv=nxg@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] kbuild: implement and use depcheck to check
 dependency timestamps
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nicolas Schier <n.schier@fritz.com>, Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 1:20=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> A dependency that is also a target of the same directory (e.g. header
> generated by an if_changed rule) may get remade later in the same make ru=
n,
> so do not treat a target as fresh.

One more thing I noticed: a header generated with `filechk` does not
have a `.cmd` file, so it is not covered by this.

It matters for targets that reach such a header through their `.cmd`
file alone, e.g. single targets like `.s`. For instance, after
building `arch/x86/kvm/`:

    make arch/x86/kvm/vmx/vmenter.s
    # Change an offset in `kvm-asm-offsets.c`.
    make arch/x86/kvm/vmx/vmenter.s

In mainline, the second one regenerates `kvm-asm-offsets.h` and then
`vmenter.s`. With this patch, nothing is rebuilt.

Cheers,
Miguel
