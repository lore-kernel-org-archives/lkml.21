Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795078431;
	b=FNZoPLo4nvrusOvhlKj8fU0rVqEjLGY5krBSLJXLgcOZmf5IZjXBfni+jnNo1Y/1OAEB
	 yE3Qv+Dts9AYXNV/1VDbwZ6BMkW+/9/FkBzQoBMY6kHy8IgHkfK1vcQF1t0yG2UIK4JQ4
	 7/EL4CFvScQMOUDact7gPx+KTe96UNQZCATxVK+Fs3Y4QJJTRGNaOpLADGRkfWui0ZmC5
	 t6ZOqEcapAJwwY4qUZKhhEGAniyi9X+OUrTlKuHeABuJVR6rQvSrQEEuiaj4348SbCD9D
	 XH47ITZpApsUBiFVo3nK6DBSYILMb1YzzbJGhCGiwXRy+jJ/9GerlWt9Wi6vidrxhgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5QqQji51y3qIauL0ncte9mW5b9mFOt1NrirI6UE5Ag0=;
	b=LujV18hIqXw7ctytiWwE6WMP7nrHGo7/7fnna7LismvoJhPcl6PuwA9K1Dno+RB35WgT
	 LrIs2WjkcI2Kez7D4LKFw/EKQeCWhUC+7mvyFswNR6evvYsVNIDcMxvOVI4f+TiE4HVmE
	 MB/a5AtblBmvV7jKNGzgKmZiMVIUfxF+Lq8ngEr/D0eQI/g8QlpV5rXey2UK4koQF4B7G
	 Ss4ncUMbA4K/Z2oOWosxvWEfqwgyB2c+2plX6yJF3MHW7hK3mNLGWLheiHh5Hx+qol4Yo
	 iIs8lG3qIzRmSzCsihDX9xzVje7aXhMy/gVkA0VcX8ZPg1VRnuUQepwiVVXY3p9vH6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=afU9PVsL;
	arc=fail smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4111C606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4111C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=afU9PVsL
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so1362211f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:53:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795078430; cv=none;
        d=google.com; s=arc-20260327;
        b=TQh+utw170rmmu530t9xuam4mMWoeY7seEkZYrNVXt4U2cE0B62lXlo57f3jr67aso
         +Rnyez+Fuec0yXu4r1l/On3STjtC61sBSdAA9OCNWuOsnqMuNttrymBm202IEECQ4ITU
         Z0Zwd2QK5tIenhVUYx5nMKdD1JV+l8K2kNE2u0X8bUFYZDtu9aKiUmhFHlLx4dFVZUe1
         PE0wUIP4NwjJp45BfX2x0BGQQl/AewnMk/xI0RD+6OzryJBmvXRXGiWd7h8IXqG1W8qa
         ICVDZqU22prCnefqL6RonoYOvGYh6+xVqDmUXPbKKU2Gx4yVAgKR6AcuEFYDn/wWHspd
         UGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5QqQji51y3qIauL0ncte9mW5b9mFOt1NrirI6UE5Ag0=;
        fh=cpLK0+Y5X/YdtcmtKLUMrWSyiq1riDeMDkTj3kPZWlw=;
        b=K9woHhqVkDdtrGrGVPGb7mTIce2TXnzZe7WNtrMMLnNu4o5EwYoBz28C9rEIhWaxA7
         IU1nnOFBAwmv6pFF7qZrfG+vBIEjtWYQhZCA5K6tt4t8IUjASdyd8OH3jfnWGRas6R9M
         tF/cL9JKaj+Sci3EmrdvMuJsjdz/8RF6ceq1nK7bBQrvt1vgd2dEceBGi8Bf3Gg4QEfH
         eOR1TYfuMt6B9Bc8GC3FdJUyKdF72RDusKhFhRKdbPc4z8SGcNWvYsgop9ks3w+8WQaK
         JpSHNGREBF0koTGeKKieknSrR9m1QYZw9u6mUhXX3Z/ZnpERkLh79oHvfLicwhvpmwXU
         qtDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795078429; x=1795683229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5QqQji51y3qIauL0ncte9mW5b9mFOt1NrirI6UE5Ag0=;
        b=afU9PVsLC0NI3xdY8WJ6HfzNJAcK2Tjj2SMafl9/urdCxCRefIGe9zfIq6Yd5P4t2u
         7vEHK7HsNH20AcwGI5DRRuyPStcPF82LrsxyxFtNhg4lKSVJmqZ2vvLYIEKj/YmVXnMe
         f81bCYC8TH0ntLMUhePWVh41ui1Tz74tSpuhEA3ex4ZF5iwc2gtXHlxj3SrS5yHq21BB
         B9F0s9zM8bDOvfvnMm6yE30F+qb8mKFx3qqgcK2DFHWApFj+XPrh+dJQLXLA3mWMXGpK
         kwlBI/hOnf1Afrnz4iCe2v/vWY75AYZomjQUxv520epMl/2x3VqcH6GZrHd7/HcdwOQ2
         uA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078430; x=1795683230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QqQji51y3qIauL0ncte9mW5b9mFOt1NrirI6UE5Ag0=;
        b=Gm3J+Xs7GLzh+5Z7B1Wo3aDEFMXLWHIKr2frUXYP8ZciTscencEMupJs2QiGLx7gVi
         t5+C/TBF9qIUM4ZNOabasZUBbq9HH0+HoF6K762j5SCZQZpIvSaA7wzegsGLDOG0i9HT
         920yKYfK3yCZD18+3lv57fP10nwDUDAZUZBEyvO2T2o2gaFfJDJvP46tu/DpDzicVj4p
         0alo5DtjHvusC9j52LbH+CAOp+NaNTS17wz7Hh34NsEs1D63/2fV8ImdEAT6nwtfOFF4
         1U71M3mJIFFcMX5bqdfT772en3uUZ8m1lW4KlW45gsu4KvIR2yvS/adrAx5IYPtQaUwW
         CBiA==
X-Forwarded-Encrypted: i=1; AL+hErG0SghApeIielg7L8ZSgK8rQdqqsTU/+tG7+DJxa01j+e6CRm3zOKym3EMSP0XGsr68nCW5wHuft663LqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Dm9S4gNsAxn75yH8GmyUrQ25+vEM7QM3ZpsNlFI5imYy0KIoh
	vo9DNzjjaJ+8SX0DqTylqrSYYNCGYLK/FFw18YtB74JREsR3snQa0KtLf/1CdoJpM7xxq1eCqNI
	gAad4ey/JVOu33MB++47wnEYNkT/xcIwhIhbMlCjm
X-Gm-Gg: AZFdTZdSOJh62I0IAVc2ymSM3VnbNP69aTHi88tcl6FklH+166rY2tfIS4XIlRmAZl2
	HYT138KRJDn1xEKxLMrM2SJHt1Cyqbyc1CtM+zBN7jZ112RpV8SCIs5fjPaIfAe/MbMlzfmF2+r
	LPrecYp9YIxegmfObtQBWWlSOgQfX3ceZ7AqOFtABo+Gyv95Hfv/K4EPrteCN7Uba2w474ZN2WM
	/N/7CDyfkdbLi8N5JgaKaysKJSOXBLexZZ8s+6UWEK7+CyoSAsiUoa26XMQ1/PWoloFFnSHjDdj
	/oYLbVHi4nCnB8nbOCM/FfFtXkK5eNIV9szN1nMOveUh9Vk53XIR6kqt25ev6KOuCOFTdT44tEg
	YUTPOWWeJsxpwcc0BPrUMOwez15i2na9LOeCSfkGDz5BdyJx8ScVxs69IzLdgZwjpUuDeQl1W2I
	Vp95cnMqPhTMQUeur8lRY1yOi6zlZzrVZuOTjrUr9TxHH3
X-Received: by 2002:a05:6000:4023:b0:4a5:af7a:b7ad with SMTP id
 ffacd0b85a97d-4a62e43a3fbmr12154110f8f.0.1795078429032; Thu, 19 Nov 2026
 00:53:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-formatter-lifetime-v2-0-e216d86ffb57@gmail.com> <20261117-formatter-lifetime-v2-1-e216d86ffb57@gmail.com>
In-Reply-To: <20261117-formatter-lifetime-v2-1-e216d86ffb57@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Nov 2026 09:53:35 +0100
X-Gm-Features: Aa3M54qMGsiHV31TkfyWs7_IPL9ZgK6ffsi0k08k8zaNIGS3YlymgVZ3YAzTX-w
Message-ID: <CAH5fLgjLuB6ZdVTK=qUUG+NTBrJEY0cDjyNxZzAZX-NOThLVhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: str: tie Formatter to its backing buffer
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Georgios Androutsopoulos <georgeandrout13@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 6:57=E2=80=AFPM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> From: Peder Bergan <peder.bergan@gmail.com>
>
> Formatter::new() returns a Formatter whose lifetime is independent of the
> borrow of its backing buffer. Safe code can therefore drop the buffer and
> then write through the formatter, causing a use-after-free.
>
> Tie the buffer borrow to the formatter's lifetime so that the borrow
> checker rejects such callers and prevents overlapping mutable access.
>
> Fixes: 87482d6d9104 ("rust: str: allow `str::Formatter` to format into `&=
mut [u8]`.")
> Cc: stable@vger.kernel.org
> Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1261
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
