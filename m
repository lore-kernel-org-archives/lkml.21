Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347579;
	b=BkI+WSb5lcv4znf5C0c1qdfOZJCWTbV0oVxYvGoIKAU5Wuqi3Q+cZXh9sza5rQD6yCYl
	 k+pDyK7cG7+k7cFvm2UnaOCJs5heZRrSDf1x1zRLkyBrli2qbHIRiQR3CNauImPLgJYVG
	 APhxT7xANq4ejYF7N4RnPJggDM2mnXGrKhvp5WpqEtb68oMQinFtTq7pSGY24nRy9Vg0I
	 6C+hGxqT8/pqq5GVrbCmrhngNc8rnNWJ6HmNE56enk/PFaa+3nzUJoedhs1D0G/w+EB7N
	 /WDJx5F5grcp4Yy+9hV/gPd5UvArYlSYq7VahPGo2Jj2L+oV3KD19fWx2KTgxHxXQFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=WT4yKkDAmncDHMj/7AEWMzPC9QUnbfloQV8RtbZ7Cvs=;
	b=4UiIty8DV+7CEHJ+6n0bwWcleYpUQBVCd78Bz6AVec8NbRTesz6PW8+AkFD7KHI1x9Sv
	 ZZsBGdtuvLX6L7lOUfw9F8zAL+WTlmWtShvESQTAXQTjPgCZJzrTFw5QeKEZotZN1OSlv
	 oHgOCriBQq3oQeD6B9YdhnB+QLa5865BQXvRBNnw+0MxGJ2FrVofwOYAJbeIpyiaumpe8
	 zSujnO191hZhYdBuHe/+uQ9lI7CEZQZsABFSjZolT3JnEOltZxDcqk7jQH28UcOTM8Jdy
	 v8OT+vecjF1vi7yMXeAwyJXQFvgOR58cga/CzO7EX2A2SYJbYWH6uAxn6r7gyKLgi0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJGi5kR5;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B58606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9B58606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJGi5kR5
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so17096915e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795347577; x=1795952377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WT4yKkDAmncDHMj/7AEWMzPC9QUnbfloQV8RtbZ7Cvs=;
        b=SJGi5kR5gOJlMddQg0H8jvHUJ/YDmXSJyBAoUsvGf9ERLCMk1DZbJoxZgo7MeuCryb
         U2c/xKvKUONOenSzX8QGJzGEogXU1iF4tqINWM1WjbOLY5jrZ4KlvzEzrKTWxSbwkcyF
         /WzbqToCYgtDVE9YYoldCE70ojo4AcNG9ZruXDWZO+TQNEWj+GmwkSMcrfYJx89SvMBt
         YT77CBL9lJWHnsT+kZAlYqyplQaqMi5gjvY2Y1ycNF0fiXkLEjQRs6uBU59XKt9TZMB0
         dj5ILAlpFM1eKfjzn8E+8LKGTQASc46B95Ov07/YttpSqn5jiSosV444TNQb+BvU5ZDl
         Y4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347577; x=1795952377;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WT4yKkDAmncDHMj/7AEWMzPC9QUnbfloQV8RtbZ7Cvs=;
        b=H/bBR5U5jCxGDHaxMgvJ+ZD/7xGYBYSiru3G9qT2Y209qdX5nlmP4QtoW584uvrlLU
         +GNX+V1OfSFolsd7jLEPJSeJMXWKVd05u0AJJTK3cA6tSW107YX7HIGTYjUuo61xnfsG
         Bg3RbbOZz7ceeg1rg4TPQTtbTAZ5j7qT18+6EnV8xnKvVak0ypy1bsNL8ecRpMwfK28V
         KTilP5l8gUZJx11bDl0xKManBgTzuIGNB2dspI+MznYwn/JITQ7lbfcoABOJRIyWWTK/
         q30Nyddt5DsO0CJbQHG685mfmBmHfyepMQlnkqX64fFEXytGERUoXubOS3F36HygQJsn
         4BPA==
X-Forwarded-Encrypted: i=1; AL+hErEYK9rNijdYN9PjknQTeIuCJN6dXwxCs7AVvYCWphaYMtLenEw3Zmr9IsYewtLzUg9doeRt8EKn4HCbhs8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LDQsS3htet6iwO1c9c6YiDPqEsipcExvSsWCu5VHfOfhnbtmc
	cmilXUJ17lLG5doVZykc826YjNVIZqCv6ci40UMZdboKVeapdvBSo4JY
X-Gm-Gg: AZFdTZe8HrGpwWh1+yIoR0dFYV32wObkQmDC5Td3qHNELYlZOImMHhwghJezod6+KEe
	zWoSijW4FnP6I9mU6qrNwHP65ZMs6v2D1LtDWqvnDDxZgfY/KyLoxWjPN1Je99UsU/g0L3mgDk6
	1QF3RiUlvQOEvmrJUHGJ6xtzdwYB7Lx6bYwKFFDq5UCbGpblRIs0516UjJQSVIGM0VYmo3FT9Bb
	UeTYT+Vs14+u7MvRElo5StrVOTRvuBZDpBmnclgFa8wufvKAk/cyQrFYmlMVca8aMzEjEpPfLXg
	HrjRQAWQ3K1LPTZ/xpHH/MaLv7MCi25my99qWq3jxUfXse2PzSwuroxUQGpBLSer6um3yxvJSXV
	4Hkfd+BZD8T8CLXm2Dq8HKNnIPIFJGBueli13MaVewFtsaMFL2NMhDZIJZ1bSrupszvUGvRFvTh
	qkBhgHEfOGfMdf1Ylqumtcm7auWTc+h9AtGgj3tIc82WLqdwBAB/JfDTJ6dg5XzF2p6lryQO+ot
	Av25KmFkVe61eYm2GN7ApNw5EbMSaHaJ4IER00/T1txA+4Vbn5oocoQq2sPslhtHEhkV9JMItIT
	Cijr6qfAoSyprg+7FBevcT4G1ewk8tAeomvN0t5jOGiZNJFdiovwHSMdpJ958mTAkw==
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr191892155e9.27.1795347576774;
        Sun, 22 Nov 2026 03:39:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm310397175e9.14.2026.11.22.03.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:39:36 -0800 (PST)
Date: Sun, 22 Nov 2026 11:39:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A
 . Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: x86/sha2: Drop one-off implementations for
 Sandy/Ivy Bridge
Message-ID: <20261122113934.48a9ac42@pumpkin>
In-Reply-To: <20261115080900.216434-1-ebiggers@kernel.org>
References: <20261115080900.216434-1-ebiggers@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 15 Nov 2026 00:09:00 -0800
Eric Biggers <ebiggers@kernel.org> wrote:

> [ This is proposed to supersede my patch
>   "lib/crypto: x86/sha512: Partially roll up sha512_transform_avx()"
>   which was starting to clean up one of the files being dropped. ]
>=20
> Currently, the kernel has SSSE3, AVX, and AVX2 implementations of each
> of SHA-256 and SHA-512.
>=20
> The AVX implementations of SHA-256 and SHA-512 run only on CPUs that
> have AVX but do *not* have AVX2.  These are all the ones I could find:
>=20
>     - Intel Sandy Bridge and Ivy Bridge
>     - AMD Bulldozer, Piledriver, Steamroller, Jaguar, and Puma
>     - Zhaoxin KX-5000 and KX-6000 (possibly SHA-512 only, as these CPUs
>       might be able to run the PHE optimized SHA-256 code)
>     - Maybe some oddly configured VMs
>=20
> Oddly enough, this "AVX" code doesn't actually have much to do with AVX.
> The only AVX capability it uses is support for 3-operand VEX-coded
> instructions, which is unlikely to make a huge difference.

Especially if they are the only VEX encoded instructions.
Switching back and forth is horribly expensive and the change isn't
'sticky' on some later Intel cpu and you get the 'hit' for every
instruction.
(kernel_fpu_begin() might need a vzeroupper to migitage this.)

>=20
> Its actual purpose is mostly unrelated to AVX: it replaces the 'ror'
> instruction with 'shld'.  This is entirely to work around a quirk
> specific to Sandy Bridge and Ivy Bridge where the 'ror' instruction was
> very slow for microarchitectural reasons, and 'shld' worked better.
>=20
> This is documented in the contemporaneous paper "Speeding up SHA-1,
> SHA-256 and SHA-512 on the 2nd Generation Intel Core Processors"
> (https://ieeexplore.ieee.org/document/6209073).  There, the 'shld'
> workaround was claimed to speed up SHA-256 and SHA-512 by about 20% on
> Sandy Bridge.
>=20
> However, that was a one-off quirk.  And even the paper itself warns
> about using the 'shld' approach on other microarchitectures.
>=20
> On AMD CPUs, and on Intel CPUs after Sandy and Ivy Bridge, the exact
> opposite applies: ror is a fast single-cycle and single =C2=B5op instruct=
ion,
> while shld is either a slow microcoded or multi-=C2=B5op instruction.
>=20
> From what I can find, this is true even on the older AMD CPUs mentioned
> above that run this code.  Thus this code has likely always been harmful
> on AMD.  (I don't have such a CPU available to test, but for what it's
> worth, on Zen 5 the AVX SHA-512 code is 58% as fast as the SSSE3 code.
> Clearly, the 'shld' hack can be quite slow on CPUs it wasn't meant for.)

I've got a bulldozer (or similar) I can run a test on.
I might just to a quick one for shld v ror.
I've rewritten my 'rep movs/stos' benchmark and plan to run it on the
older cpu I have.
(I need to get something newer than an i7-7 and older than a zen5.)

> We generally shouldn't be carrying asm files that are one-offs for
> single microarchitectures, as it's just not worth it.  This is
> especially true when the code has been mistakenly targeted to other CPUs
> on which it is likely harmful, and when it has other issues that would
> require maintenance, such as excessive loop unrolling and spilling the
> entire 640-byte SHA-512 message schedule to the stack.  (The SSSE3 code
> has the same issues, but it's easier to fix it in one place.)
>=20
> Therefore, let's drop sha256-avx-asm.S and sha512-avx-asm.S.
>=20
> The CPUs that could have run this code will instead run
> sha256-ssse3-asm.S and sha512-ssse3-asm.S.  SHA-256 and SHA-512 may get
> around 20% slower on Sandy and Ivy Bridge, but they likely get
> significantly faster on AMD CPUs from around the same time (2011-2014).
>=20
> Everything with AVX2 continues to run the newer code and is entirely
> unaffected by this cleanup.
>=20
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Seems reasonable to me.
I doubt anyone really cares - apart from benchmark data points.

David
