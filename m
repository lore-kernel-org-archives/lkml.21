Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795108398;
	b=RroMnj9Qu7719xjP5oDaFmkKW4va4l4cjDIJaf7l2fPyG56AfQ4mAlFNFopconoOXuRQ
	 UedwJcEHAgX8DAsVmO9uUnnxhRUfLwk3J+6dftwH7Olwjk+sS9L+jorV3rM7w7kxA0dOK
	 qf/o0xMzBJzijuLm4rZQhxmrUIn1fQbbXSFG5zB1OMst9VaMFYiGuyOlsAwyKqZiVmJ6q
	 ntV307fM9Nz7iF8Hg6U1EGnDDIJJscr3xBa3V27nnCHTRnqtLLUpsI8pqEE72BYOkjOuK
	 LRIa3Oi8kEg3KXXTpYGP9YXDwjrri43jSmJvAP1fhUxbo6NIFHwMQP8NTwcy7Yoz5LA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w2EnSjdigFnp2O6d4NnYI+986RpKhw8XyhaQWjzHOYw=;
	b=JZqO5RS/pA5/vedG1cXBkDktGsnLZSWDa+IJBWcNt7OQeRtBipzOer2QZQshd3BBeemc
	 p8TP3bmXwGpcgV24euu04q6yIo8QgvGCY2G9AFC1E2Giwj6SmwOS6ab5X0FuHze+IBIJJ
	 a9ZWYiFBt6cZBO+AI9JGilRE6ulyYlvCfR50NLM9RjqbNFFvcQNeoblo9bzcrDNg8zE1Z
	 1F01X6f7TEIdUukFOhyNAwfw5XYFKJCdgQOxZynEmOVFfiWFpO0LH7rDeQe25/f61kHFn
	 2W0cOph1fYMrJBHX2bzzMSdDHxVVzQmSfVnX/XCmQD34cbMstyj+4jRiYmzv6j9F+1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a95DEfaf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F8A606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F8A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a95DEfaf
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-980c4258105so1494123241.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:13:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795108397; cv=none;
        d=google.com; s=arc-20260327;
        b=bPnPmoqp+QbM+e3IRxIb4yxglDUTfij4s5GQz34ft6gNpvh4q6EdnF0m8+yoQpMlYE
         Vz+kLcK6TdxD+KtyRTNpsV4LDd4qeeANA9OzlfMUT6vLPkelBRS72w2x4/qTXC0cbu4w
         7lcb+XuzUHsnAiDr3Ujwnj2JxJNQq/oH6d6LZQGsg68sm9XCVN2nFOvB0pWdVW/rr1wM
         YMsn/pjXmYFVcl97upUl/0zFshtNtp0PjZFoyfoTV4W5fGUoLZ489Rj1SL/2Zm2jJFSP
         oF1Mo9v4zJ7DL6zR2G3LSlBI32uHGgXPjuZG5hPHbEQv/BOqcmIXaEuoOIPNKV7BBlmk
         DSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w2EnSjdigFnp2O6d4NnYI+986RpKhw8XyhaQWjzHOYw=;
        fh=J9uBOpwpmgYAzJEZk8/KtYyfzSCQu0NLTpfogthpem8=;
        b=LMadm8cV7jUBabJi8cM5mOK49BPqLQcSP42xZ+mw0Vg471fcesMYDofiB41m6d/0S0
         d6UGkgAHw6/MqBdnfYkFk99XuUS2aMkbPxRGLf3wtAdOGrSOw2yvTrzbpYXSblp0hXU+
         4Tx04UNU+lFPMMPWWHmgHxt47WoygggJSLtd3KGvlWNsw4e0woOOLlKo2CC28AFtyHbT
         cZ1Sn/Aro6hhX2+p0qg4HiuQTkCHQ0qvaxEbsqdyEVqJ2OKsEIQekvrcjyOdApgI50iQ
         OvqmGKCT2nU7LSM9BFr4R6OiSPlnilJgMErxCIgTFaZjI/ePJ+HPOqxTiYpF9uPUcUE6
         pCaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108397; x=1795713197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w2EnSjdigFnp2O6d4NnYI+986RpKhw8XyhaQWjzHOYw=;
        b=a95DEfaf41H00JrahzY7J/OxFUh+RpvPFLnD2bhT/kb9/isZuj7SQVofTbV0nRoqJM
         gE/W39r4fHb6MVGMH00YxWnuHwQVI9rUCXdd7/QzfLaEvlj3wLNVSlNXnZARiKR9+CSe
         U5KTtPgOUp85JflcZvfWHMqBTMTYYrAa0JfKizqkV6Ol/a8tOrsyiEW3T1YZgjv51D9b
         CNDohO3QnBXunkt4yW5s6zGnuOUfBcaDsWPDxXpA1Wfn6CHhSWuiEC+VtjhT1THyHwgv
         r4Q0WyMQz/bEEirUW7JJVOBLjb144GNd+RYK0/m6UNCVbumuOWQIkHoDqhJmE7EArW9K
         PeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108397; x=1795713197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w2EnSjdigFnp2O6d4NnYI+986RpKhw8XyhaQWjzHOYw=;
        b=TOaqVJRnmGj/lkokOcGQ+cSIhgwADC/u6x1MmOpZl2gihJ/Q1Ldfwhwab01LEvUlON
         bGHeLvDW4gz6RLxSfGZWunq8tLbNfY/FnSFKEEm8qpB7g7aX+5fDzclnf0E9OcmCAKAT
         goF1+4ILi/A6ZWM9Bwr4c+8Cn/YCjReKzoGeMC0LGo97bYGNo0Z0OvnRP9ROd0g1z3P3
         PKamnc07mOm6HTjyxUdZ9l94inLxmqHssUs0P2s+IifiW4Oq8NCScbvEtHgf5UIrnkXA
         qsV2UBxWYG+IaLE+ISjtHLTFNK2xUk+xOuxe2TnyUAfAXw7X/bNrrKNmlGnIOVDAK6SX
         ET9g==
X-Forwarded-Encrypted: i=1; AL+hErEIQ5yQ0J0GjCzfgdg/jUF07WnSbMTmAI+Ifp0Awnj/IzA2LN7bv8yF3QWNJT4aF0FSKsfbQsu3M0WZCWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uvwHMglpnRrI2Tg7e+wHOhXL8hailfz6sHn4iWutYsiOO63wh
	SRGsu3Or269rPcOEmldDFcUfmmE+mmMimgTHgIku6MwpI1kdlxJ5mAQl/Dyg7gTghQP+gsjqE0D
	NSuKXZ/diBAuNMsIhRYG17hN47J5UnzLO9eF7
X-Gm-Gg: AYBFou2oOMbj4CJd3/12rjn0m5ipcwohLUApjint3DES98f8CVMRs52YrulGM2V9Szz
	tcVVFlZJS/U/VyVYSBDK/PjZ18wP+70uT6AE0K9QO+ZU8v3Fvp6xdFBukzAsqvu9uyrNYzX8Y+M
	u6dEC8oFMgtAPb14+pvmhp83lEarZDxt1H4nrw3kDTvBnLzoTX9JLF7nj7hgwP3SkK5EaLCjLm/
	JUlBw+9MCpzcXVIQK+uLS+fqo3j2aIZAOEOAmhVDggmYGjI74aO0OlJXVVUHmtjiK2wStr7Wsnh
	zXIRxTokYBydWvlJ9S7Tipfg2aVa9h8gkydJ7F9Elidmh3bfCu3V3tRwOa1QMToRQp+CUu9S570
	XcEDGRXWFXZHswkMHNJPPBqLxODwh6CNaTGbu0cpsyTDM52kEh4TSCVsiYh7C6hq43WmsOxV87K
	Oc50P2LBj7UB8E92/eoAbnAN7TGA911tvXuCDn5cny4WBhTLB1oNny09NK6PPsRlPjMHI6NMI3N
	slwQsK7YPOMfE4Zb+VVgPsN7QjQJw==
X-Received: by 2002:a05:6102:508f:b0:7cc:94e0:ad23 with SMTP id
 ada2fe7eead31-7d73967085bmr11341137.31.1795108397165; Thu, 19 Nov 2026
 09:13:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-submit-nvmem-wp-serialization-v1-v1-1-539d121f8f5e@gmail.com>
 <faiy43d7khj6d3adwhnbdkkq2h2cdg7bue4lpawtzrhv3vsm3f@3372slynbcbc>
In-Reply-To: <faiy43d7khj6d3adwhnbdkkq2h2cdg7bue4lpawtzrhv3vsm3f@3372slynbcbc>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 10:13:05 -0700
X-Gm-Features: Aa3M54rAJ1Mkv9PZFikrBwu2LdRSge9Gu2YTNgX8QQ8FL9Kc05ECu88O9Wlq0uw
Message-ID: <CADvTj4rkBApMzBk0fmKym3iSxqjuGOPiPyTnBGKoVRgYcz_Usg@mail.gmail.com>
Subject: Re: [PATCH] nvmem: keep write protection disabled while writers are active
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Khouloud Touil <ktouil@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 6:25=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, Nov 17, 2026 at 03:09:08PM -0700, James Hilliard wrote:
> > The core deasserts the WP GPIO before calling the provider and asserts
> > it again on return. Two concurrent writes can both deassert WP before
> > the first one finishes. That writer then protects the device while the
> > other is still writing or waiting for the provider lock.
> >
> > Count active writers per device under a mutex. Only the first writer
> > deasserts WP and only the last one restores it, including on provider
> > errors. Keep the mutex outside the provider callback so providers that
> > forward writes to another NVMEM device can still nest.
> >
> > Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
> > Cc: stable@vger.kernel.org
> > Link: https://lore.kernel.org/r/sashiko-outbox-219526@kernel.org/
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> This adds a mutex where there was previously none in nvmem core.
> Synchronization was left to the underlying providers.
>
> Can we not use atomic ops and avoid the mutex? I'm talking about
> something like:

There's a race on the first write as well. The first writer can
increment the count from 0 to 1 and be preempted before it deasserts
WP. A second writer then sees a nonzero count, skips the GPIO call
and enters the provider's write callback while WP is still asserted.

>
>         if (atomic_fetch_inc(nvmem->wp_cnt) =3D=3D 0)
>                 gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
>
>         if (atomic_dec_return(nvmem->wp_cnt) =3D=3D 0)
>                 gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
>
> The only problem here is when we put the last reference, start setting
> the value to 1 to enable WP, while another writer bumps it back up and
> we drive WP pin back low. But then we expect the GPIO chip driver to
> handle synchronization in this case.

The GPIO driver can serialize both calls and still execute them in
the wrong order. If the last writer drops the count to zero and is
preempted, a new writer can deassert WP and start writing. The old
writer can then resume and assert WP in the middle of that write.

The mutex keeps the count change and the GPIO transition together.
It's released before calling the provider, so it doesn't serialize
the writes themselves.

>
> Bart
