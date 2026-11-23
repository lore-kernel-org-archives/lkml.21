Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795396244;
	b=X0UleSRZUpajhLgBkDDslepB92V0A9WioMSG8k1n4XDDKoJpQutC2kYiXaRe7whJ2g9f
	 zoFsNnN7BVtUT264YhHH1cGmSrmoEJNjBZ3Kd5X+3xRYjjbbvk1vuMwKLfrhAHRPWRvoJ
	 CtGqaqpAy2D/kn60Uk/UAN5iAcR/mIrtd0mGjYhpl03hdKU+dDHpgXeVqujYgHya49RAb
	 AJxOu4EpiYqHRJMIgYbYxf1SryQmyFbkan2Rf4/RpB57JayOjibnlOM29gm1iYyS6QYjm
	 RXEqUAbAntiQklxzq613K4jjBO/y/lJDSAfp6e1D0QbWu0yjEPUF8R8Au6rcjqDIppw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bTczI3mIqUeZr31ovvSxRt3aL7YuiXjopfj1vvQBI/A=;
	b=CUM1hFe30w49aU4FvJUz8ejkKdphnpj8a+WDU8fS6tWZiV6ZiBjIziK3AgqHFYqoVMHB
	 qBztCGZFU9vqQlErepCvUEmyi9RybrofUu9u6N31OYMpsMaSMHkQLo5tvvmGwjC+T6wQb
	 2b+ORoTRpmLTsaGhIZfMQQZTe9HQP23RIStPYIx0bJgon2lBQNEqvikGMx4SlgS+ZJgbP
	 Mrl1YhfTm68JkNwC2fsz7PIPs5sPo1aDC+f2oq7XkaeH8wGEKv7HmZVOvV+skcacop1UN
	 Nax2/pWR1/HJH7vC2bJ2K3xEUr8cI7k0bmpSt1QbCd1GZmtRqtn0w00x5zNfvS62SQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkFo0V6b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383CC606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 383CC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkFo0V6b
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ad3ef75223so1748831fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:10:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795396242; cv=none;
        d=google.com; s=arc-20260327;
        b=FqpQhn+NRfYB5l32fATuXgBEOOsxrmrGJ76csZszt5EXH0cLTkjCzhOsBEzM8irii3
         BHza2bli5RNlCS+sgc4nNVq0la7YKwGPsOxk0+l2QufD1kjXQCNnrmzDKGszEB87+jKJ
         mKZtsPB6yEtfSCopa1fRNYwoiWtD9IdsTHVlpT9G7FdLuwbEpeuLOM9Z9e9anISLEVP7
         L8zj5kvfLgz3UtSXW78rI3sCMna/ebFxwfMT3kU7wf8ZaoS71I8ed7lLUz1dNrTEv8pU
         QrH21pIPHoDl/P1TQu70tlE8oW5bOT/D6j7bomRYsrxx8Zdv74kqm8u5wo638SaCjrg4
         0z6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bTczI3mIqUeZr31ovvSxRt3aL7YuiXjopfj1vvQBI/A=;
        fh=iUyhzlacOqAuAlyZ1NtXA80I/dyu0VWhy8fpDkPH5ik=;
        b=AYDj9Fjgh6HIEnmVHeS1mgSugryb34Ebx1Sh1LmEV4f1D5MMdLw+6eB9TMV1fHbljP
         pgb0c3YOcj08MLsl1PlMY5FWgTzfIco0YQWuqK/d3vGpai+vXE6FOvnRjg8aPDyTxDPC
         Vy9QxHmBiREgK0JLThXLvytdSJuwSpqDyIPF9oHht/NES0RS9hFwqt1U33xrxfAZG/R5
         08tcjdtf4tmU8uS0xvctVjRFgkPlQtEvRgF0RMXrffj8an01mgOlPKED3/KcDENAD8c7
         Wl7LwnNbT2zaQbPmax2mr52fEY1nUA/PeBt1gQDUm1q4tsLWWXk2tW+1tJe8z4QjNjpP
         ihag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396242; x=1796001042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTczI3mIqUeZr31ovvSxRt3aL7YuiXjopfj1vvQBI/A=;
        b=OkFo0V6bUwasA5GaHgPKKsNR4QdBPiWZC9bmuIuOn7+BiJvbeWnZgsqsL+cx0QzFks
         6l0Jb8X30UUTelKcesUOPTR5IyT4C2Nr08em2DvCZ1hsbI+h+s5dHPAl0tH77jfLve9m
         78oArVH7GL/CuzqPux/XEXtch+5N9OMtaJHEI3OTUKR9Eq5wm7WR+QGVjSmUqvCuBqyG
         Ds0ZoZxN83WvHvcWSNE6C++Alh63tVI667eMCZ52gL4Vq6AeQzNG0OMVh5H//uLz8ZLE
         rHWCqfA4IVBDaRgRe16H6vkqtNLXh6VgK55Nt8BomZLgSR5mAKdJAnST8TtuRssX1Fzf
         vXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396242; x=1796001042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTczI3mIqUeZr31ovvSxRt3aL7YuiXjopfj1vvQBI/A=;
        b=mThfof5iyIEoXWN37JNOuAwMr16TFTpd1mGaJXhHAYSzHI5JGVv3Gsa+QBPQQ4ntWp
         bjh5Y0HETSF1JGvJva1B3VIuQ+xe4L2mGQGQwCTqDNVnWduG1nyUtD7df3hLa1Q6GHzg
         IEkzM4AduikkKylbN+SeWs+c8+2N68Zb/XkYjYYLTUhtFhd/w3c8xoYcBfjh6TQuHIuE
         Rs0AFettVMKYfLv9teHyxZrafEWVEMLPKurLKecnIvXZkiCYDur4YZanD9tKAKneaP5o
         Av7sZy927eQfXxtBkj/HYTjJzVP703KgMbLemJd03bxZ0DcStGrn5/mitC+8oPmb1wv7
         u0EA==
X-Forwarded-Encrypted: i=1; AL+hErFKhuXvuQ+mLFoAh7WX4kk1IgILZmpV0N5Ii3EWrM8rKVku0VBCDa7khxHWLWargF7PkxwLXY+mElVuKfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uEBLXnCHE9fBNrgxERvxjj8JGxwdUjxNbAuIbQIIk6BpwTlDi
	c3rbUpLCfL67QmtXnUXgRdoJLI2UvaZ0sZyIqc0wDXfS9wItQQonR5ljOH5DVPDgBSVonGgUQsR
	DUuhVTzcpkWyHTlptDVkjPQ7f2LLmwlc=
X-Gm-Gg: AZFdTZeO8YDH+wkLmqICgRavh/Yb187MndS17u3U0z9zWiFd5O77MJugYsUJgwhw9ne
	0cwJBY1F71uv+qaXOwu+oS0IIu+KhS6FP5rnlIcpbBH4CDshi2xuYzlvqYn+4epj0UT+0v/7/Ty
	sWGLjMXzbSvfAsbQRvh8wGcY9fyrFep6Jc+actf+F/bdolS7zkFvYFBglbl49QX/r42inQOOhS0
	pj+MugyXvP3FK+B2lQkAT4531MRN2OGUht/cNud2g/o+bw2cAYuG7PPzHV+TK4sRyxx8yukV2KJ
	UCk+5KyBOgjrNx//Xa9TPaCotSJ/w+HbYeNdq+/Mqv8JYN8i3D7eEIwS6x7+JkZqcdEJm//++CK
	QsZXOu3lq2Ap6eNF6ugvh8Fe7R05vdf0J+MSFcp0NlWDuvLVKWo1P4231reu6QHVyGNr59phHjQ
	Jffj064Yk1SD2qrR2FayqO33norFqvzwo+u2ATZPluhnw5Itk6pc8yfxpEqBFOIFVwXPOKyFXYs
	5tasNrkx4tS4h/FwGdpON8zDU7RHCA9LXdUlENoeSEgEL0Vi5X6g1PCNcc/QrvDHCkosVZd
X-Received: by 2002:a05:6512:6c3:b0:5c1:4a47:b86b with SMTP id
 2adb3069b0e04-5c1bc785b7amr3075974e87.3.1795396242089; Sun, 22 Nov 2026
 17:10:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-rust-dmi-v1-1-4ace9449f872@gmail.com>
 <CANiq72mFCq01A_=B0gyaut1rPWeECOdDwP6pD3FBv7n4oH6TWg@mail.gmail.com> <DN260E1QVCJA.2PKN1JODEAOB0@gmail.com>
In-Reply-To: <DN260E1QVCJA.2PKN1JODEAOB0@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2026 02:10:30 +0100
X-Gm-Features: Aa3M54rFs-Q8WtNxV5OFobaLS8L8ULiR3dCbdJ_AnvKKIHAVZYKbk7ifkdnzeZw
Message-ID: <CANiq72kRX4fECZGjEXKsSE=bwT0XsozE3+GPpvmOPZ117B1_zg@mail.gmail.com>
Subject: Re: [PATCH] rust: dmi: add basic DMI matching abstraction
To: Nick Dowsett <nick42d@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 1:31=E2=80=AFAM Nick Dowsett <nick42d@gmail.com> wr=
ote:
>
> Just checking here - is this still applicable for doctests? I copied
> some of the example from another subsystem. There could be some
> conciseness benefits from not doing this here?

Yeah, it keeps the rule simple (everything does the same thing) and
also helps others get accustomed to the style when reading examples.
In any case, for the example above it is hidden, so it doesn't matter
much for the rendered form.

(And, ideally, one day, `rustfmt` will be able to apply our formatting
to the examples, so it would create a bigger diff if we don't follow
the vertical formatting anyway.)

Thanks!

Cheers,
Miguel
