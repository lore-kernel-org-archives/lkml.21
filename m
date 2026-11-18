Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794995878;
	b=L3lhv3LNW6H6XRnBrBwUdFFl5G6zpgTT668dSm3sMDe1fN0nhjchc0nJaSJEhFblf2FD
	 BP+W1dH6dPEKeFZP01xhrdLzGoZufIjNu9NzsMvmzxobzme7mIZW0AEz2ocdhLvh9o2er
	 XrkUcRzC8zb0V/3DSChe4xgpYOSy2QqhELxPUZqHuhIrtEFzWuPexjrs8h8jy/0GCTefX
	 VVdQar3TkR42nZrBlxJgEm/DolPS9KWDh7Sf1ASUm29qhYK9MKCuuxune9QX+M3X8bNe7
	 DqXyjpk95m8Zo7i9WRL+oJ6RMGqgkV1dvgvl+Nvj5YtR9EcwEBjFatjtQWWPof2/n+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
	b=WIcJhYBxVVRc0X90CikJb7tDckW+DE795O5pxMiQBJbBm42IhTozImNs2HD5DiCzqpB2
	 vF1Fon0k97xSNiwruOCjMqh6CnrMWi7Kc0eepnCuATvbT7zUFUuJSfC19a3u1mrmYeYSe
	 ktBDdBFNiWKIbqaz3jeJRlJCtyuuvSAYXJMmSeCEIHz23c0/Qqn1N431dhUACcoNjBdv3
	 pNq3XhOrsenOTXgh+resssf8kGElFlgGxWOOnuOfXf8cO9nI19y/rK6u9LPdWTMr4get7
	 ykt3BldBjhCpqLulAJzpNt9BB2p/Bc08STSGF5Cq/BOATrUGyGrYRM1leMIk3mDytSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=THEBCTkh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1700B606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1700B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=THEBCTkh
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so6894995e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:57:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794995876; cv=none;
        d=google.com; s=arc-20260327;
        b=DWLja1cjIGmb4kcwzQfP8r/5pf7bG63Kz4yhLaKA+qttQvQyP/rDZ6tq3TtgJmQ87r
         NOVguzojCuZsKXmt2MBqQAInNV3E3a87UFUZLyaDFMisxTSkf45suDF4ejTcDYWBphGs
         o1VeMY+/x+Y1UmPdsQQ8qCozQtDzahZfA3zdns+2EQfvzH2ZF2kq0q+Rf0tehRf6AE4W
         nIZM49Aw8c3Qm9ZACXV7HTYlAn7hrlfTnmsT2wdvtO5a9adBgEspImOZ3ejrpZFrCnQM
         fwM0nWFqttjMQKQAp/0lG0bVMzM4U4xC8XiBm+2sReIX55vzR5IagzIYj+vQBPfMMOZJ
         fdkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
        fh=/eT2OwKTG1GSOaI+vz0TLq/M0BsrrOO5ZS/Fr/5LTc8=;
        b=J5QM2uDd0Dit2E7XCPtM7grbqKJsxZk4BR7P0koNmOI5y6UkVkheP0f7mw+ecpW3NP
         JKh9pdgE6RQK1+ytzzTnWd0letFa8Vgn1ykyJaVb6mSKZYDuZlnzfALzoZX6ZciQ4KNG
         sXoHDYKgcLx+sktkfMjRfktUrkRr6/wrWI1FAQVkA1tkvsqlE+jd0s6+arK3jjSnWY1f
         CfFSlwY0KMoGYUmKV1tmbG8Hlm2rDWJ9YyPh+TphHO3E5pEoxW+qTB/tGJwWCCXMQRBh
         fXzEdvXIVHvtt+JHHE0VxIgTbgYl6WBN/dn71D/rDX4LklrQ+5Y8wseJ9NOsPpJfgsS4
         GIRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794995876; x=1795600676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
        b=THEBCTkhDaIj9RmoNF4LMTOL9oowM3Y4L++ejGG0swuE5SWcqzZ3Fm0cbNnMT7gQX/
         lFsXGvsSx0fTnTECCMqkdycImYjidmXHi35LTyCR5gd8zhuDXSk5OQ9CQyGDd3Ae9nAL
         zS3gzc5DJ0QGeC+Ri05xWzzrJjiUrGOE3el+1F4665cKmTz//DnelXie8/5O24xGomdg
         3uIGkrxSDGEee98W2JoQix1x80x/+wu9HBtUJ7WzYlJQ90JLeIhpkGy1Pht8KuleFUyA
         uApyHEi+/6pmXmByHQ/OZKiTcWMluPP7FXxcyIv+NSl1/PyIzybhD7BPMIwgYPnMnpmA
         XW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995876; x=1795600676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
        b=ymYK4f1Hm1ChuRVgZPkXNT5GVb2+kOQACqL055drTXp5ZfTvusLbk9QJ6sD/Lq4jJq
         HusdS+Y824UHQuHspSzneHTxK12k5BZwW0Ym+VrTsnTBoX64VCEtiiLpmp74uDbcT+4x
         FKnLChIudcWpXAcnsaPcQFhkAYW3WWZ2Q3oAZ5hLKommp5EzZpIC1FWOB0jb6UfeoDcs
         fw7AbYSCF4rYvS2TZtum8ZmcB5JhW/CP2IjUdmdUfRNEs99GFgyl/R7eIzY3P4iWtlHi
         UwslMirC5IDpsJmd7lt6y1Gp31HPkFIAwh2qRco1gEFeBZwxbfGJ6s0GQn+lNq9Xj1XW
         2k6Q==
X-Forwarded-Encrypted: i=1; AL+hErGeYtvkZxzHlhfGzwMLkLr84wKe6Y2vm5gmXn4Gxy/Zw2dSY32/8TAT16EH97zJmwF5Z7TkNN7rw6r8+Sk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7qmVZv9kpNJmyZTeo6huuXL/wUYceutIMATzfz7G7IU/lTdwx
	RsWYke1UUnNMk7FctRw2/P4ZHf82ZYENBYnkaGTSCenlxeSqWn+Bj0i4AtQM2e90el5z8wD2Ey1
	8J76JYsjKuZEY/6DSe6/1BlC6gXPnNYOt/5nStGMc
X-Gm-Gg: AYBFou1GtpIw7mhqrRs+rk5JUMD4894ok+WpkSxTFKK7zW3e3AoiDwsR7IBoEbW1BAv
	EMltXkJcg5L9Z4Zwpsv7/ivI1e2DLzNd2hJxVS1ENDmVCYnClH0OxqnfNYKqHV9CklSSvsx9Nlf
	Yevx5OS5qfmmfAA3dmrD96Qyrk24kkLGho2RVjXVrZ86jGO8cN2vpI3+tGzafuZivmTUe0ThnfP
	MiJzmTG/6lT4ige+tswWJzxKLUdpW9+mNIS4cKW70vyddIFs7lz1lkqwloKsLd/ftSPmHQcd3Cu
	k8b65zDFCh2v7GDyMN/4zYDNdZZrpB7vwHy0Wj+CMoelVh5HDEmmj0UnH+mR5b5umKNrzVR4YpQ
	gkQeJOIwY+pLE8n0ZtmN5yp7FF0bzIgJ/aSpUzvEs23plvlBpPRZG3Z5aTPmrupDwhehT+1W438
	/Bi3iJkGl7mAPyMjv0DdiJ1murgHYFTA==
X-Received: by 2002:a05:600c:6095:b0:4bb:6238:cd81 with SMTP id
 5b1f17b1804b1-4bb7d9fb3e1mr33299535e9.10.1794995875720; Wed, 18 Nov 2026
 01:57:55 -0800 (PST)
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
 <avy_9SPRaPSKD8b4@google.com> <CABCJKue=wV7gx5D1PuBWOgWnAFC2kzGSFSqshun3=AoLg6b=_w@mail.gmail.com>
In-Reply-To: <CABCJKue=wV7gx5D1PuBWOgWnAFC2kzGSFSqshun3=AoLg6b=_w@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 10:57:43 +0100
X-Gm-Features: Aa3M54owhO-6y_6OcVgrrG5ngHvNLszf1Fezq3bAT0KDUQTiMvc4EQOCOXnAIEg
Message-ID: <CAH5fLggoZNruFqpXsUP+rUP7L3g252Mvs+_=A01w7NiBBfT+bA@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Tue, Nov 17, 2026 at 11:03=E2=80=AFPM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> On Tue, Nov 17, 2026 at 12:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Function merging should also be disabled with gendwarfksyms. It causes
> > faux::Registration::as_raw() and Page::as_ptr() to get merged, which
> > incorrectly causes the former to get the CRC of the latter.
>
> Sounds reasonable to me. Although, I assume this is only really a
> problem if the functions stop being merged later on, e.g. because
> they're no longer ABI compatible?

They take pointers to different things, so the one that got merged
definitely got the wrong CRC. They do not have the same signature.

Alice
