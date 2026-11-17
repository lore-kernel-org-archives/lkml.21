Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953026;
	b=GuUZk/9xWVKgU9FIYWheTeSr+f4R2pOuMF4bZcz6WYerwDaN1MO2e6qaUQzudcDj1COl
	 WTOAmzuGcMScpAQXC6eM0U+mYX24HhASAmZ5rjrK9qswMwrSjLzGErYURFEdgrvnGmTIU
	 oN4s75sgFlSJOFjyIbvV84t2dKhCDvlAYxKOXXsyxcjI7dBJjXG+YUEN5CfsNFbJQaTRq
	 CATBnZ5ag4x1m6AepVCnEYWKeOAjppMDz0Gj9ZVGR9bqgdnFauYYWi6+Z8TGQK87ZqYfK
	 YorEjzurlDtMEx1Kj9usSluOglvncxftM8fduFuuUG4D6u8Y48dAM1PjE7uA8TF4TFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
	b=BXv1cSIqGKATRcDUraWxCMGCrztP+H19nPj0PKc0IlwXGlCMzvpIVy2Tl/Yilcskyu68
	 d5hoxhhGovbmjh9YVVOhMVn6u/Jfzv9Sjssx/oEA4frLm5DhE6UzDvg3R+Jq4d0ar8dYt
	 Dn7yrokMLFRHJFmVJPAOcrjs2K7SG/xJBZdi586Bi/D+ndlQMFCbqNWi7YjuyQz5Mq9oy
	 byyAH8nDFtDkrGVl6KttqIEacSL96G3qcfWD4/zlY1ynEmDm0l16UYoBpoJWlFv85VFTG
	 SQtYpqrTXuBTalVFL1qdeQkwdjD89YqhXD5GpdsaoYY5TCgrGkANJ33682bjkoZuOIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CPP46e7p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEDF606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFEDF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CPP46e7p
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so5935e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953024; cv=none;
        d=google.com; s=arc-20260327;
        b=HP4P/7nZGIklqavgxEO5rRP90kjDaciUp6KW6Gkg++/z2+xyONafxqlpBYOZ7U0kWi
         CG2jq4CdRhX6MW0GzgMBuxCCQKRO0bGG86UXsQrBYigC71Oo/oK/YQ6eQYIAgyfQc5G1
         cyBOywz1zltbY9AoZRlquWk5uhhP1KMhJdTxF7g8zeB8z2qgS/lRP5XBWUj/B1ZghHg8
         7v+E7h6b2XjOPjuJuLLhaaNDpLacAtIG9Ma+FLT0dDYhcN86Pk9epJ8Gvpalqc9Eouee
         /pLcBWmzcySj6UF0Sdf2MzJWl7jx5hO89wBAXd5YI6qAWPS+9Yv+xXx0N+3pDd+FLaSo
         JCLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
        fh=PWbCPA8UDMDOqfA5a3WGjd+HWA2jJK/+YPe4Q6RU/jg=;
        b=kQMeCkSH8lJf/GwAMMfw8Z3pHLRFfB0wcwG9ECGF1XJMwXD+4QJBltbRh+X8W3OE8J
         g7HLlzfLkJX30+sdt6gcivgKQPZaX6j8OjEs41fO5FMSXCpgQurNZe5aXVTdH0iGQ//d
         iycgGaUJF4p2eqVGVovSb7/xvU2BzSOGAjluxEyG7Oz0IEZMswYiYNjLQHpSckmETndf
         ZEgTfu+ck+lvXguRp2gKyPT09jezVS2hoEE+Uh6MV4cskXQAroTi2tIszxrACmGT0q8A
         9gIKNR/XzlzTkX+Zqgaywfkb3FdOY4zXfFFjiK2B29gZehr39Gusl7PogCHDRsCd6INS
         JzWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794953024; x=1795557824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
        b=CPP46e7pW7D2EKCMhL3duB3Ttj1WkwUWH77GlFJWMG3egP2uW2EDozE7j0KlFfbu82
         vmWvZt+shRzbBb568r3W4oZ3kkanu+oVMm5uNOCMvdPl0pWGQkpSULb4Fcx65nx/1E8h
         1tjcRex227rHDsOXrHVd/vxcifMXCkt/PZDBFmmEYoObF6RbquX3XnSuq8jShWRlwaml
         opPHinrD942cE1SfNWFs7pFl0GS8kXIMGFpnwg9N/vQRAsLx4OwT9c085sZMxx2jDVIV
         skQMdpBFaqiPwYTJKe5pDaLkVpzIT8aBefHYN0V0L/pvzClyZrCrFwMIb9nOaeF3TJwg
         mLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953024; x=1795557824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
        b=dN9LLEQAA5z166Uh5V15/nVpMb85ne0/BfonSBHX0XvWleEKaMHnx1j/wvhvdrV5qy
         TbentZbgv3eX2I2FQrZxm9AZ1DdaBZ/fbFs8sUJ6qThl1jS288u2SrjRgWBSjk+pG4xX
         zbZlHHcVae2vnHW1avIIyVU/vkl3NAxNUn9PSmVCJgACmCAGGTW3VdPrHQgjnOp+HVSu
         lo/6wzemWBZK2LKrmzs7OK4VKSnt+3FUu7TFORM4gZREGay4v6um4A2cdSe3HiuDQL3x
         uA46VXMu3Rb+pzmDMERdNmgbXkz8ewF8eJv/o2uNlj9jxVNkDZpVg1V6WNTd69qwhoHm
         kZ9w==
X-Forwarded-Encrypted: i=1; AL+hErHk1x+BY/jUdYk2+pcZVPX0+l+6HKzcpv/6w/0WAeC3HaH21Kf9CsZYFsdsDpHCzUcQRFE6Jr4WRGpzxs8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6ejHwdOChPamoZIrC5xFQOD+2TNxtjReNycDexvpCdoERxb9k
	0MQ2wNX52CGetevhdiGYgENkz5JxJyt1hPzpLaW0bLF36NW2B7pA+AOPw1xb3NOxn3wJyB384om
	bcmtGmZBYWFvdOB8bFnqTpCd9r6G0iL+oWGu/d/IW
X-Gm-Gg: AYBFou3Fxk1YsT7SfPRtlymoQQdzRqleHMDNIHuj7lNPefqoTCEPHpdESjVJgHDmRcU
	ATl3AnV7f+bCSfbQjsBN0y50XxhyhoZ6zbb8QvyJ9Sb21IXK7Qz+/bx2EPyzOJnIXTR7d/KPzO4
	5jqp3srPBxYI/CNjiMPWmkdubSEgarC1QRyjlgHJOdO0ysNvqIPVFJYeFABCtYr254zkmrJerbC
	wWgF/DdNVsK9zmiFRh0vw+N9xIZdoeQ7V2mRE7zYd83DNyiYM+gONm54b5TZMqiaUu7IptjESe2
	80Mr2QXL8ggW4Sr490BKun60ziFLTDBTmM5QmQ2gBhhJzcdX7kMiU8SfhKdBK4htvbyqQSPf5Ub
	kWlnrbpnD/EXKf+SXmF0KvhzAzJpZ/chVSA==
X-Received: by 2002:a05:600c:8586:b0:4a1:d225:6d7 with SMTP id
 5b1f17b1804b1-4bb7d58b5f2mr160695e9.3.1794953023558; Tue, 17 Nov 2026
 14:03:43 -0800 (PST)
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
 <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com> <avy_9SPRaPSKD8b4@google.com>
In-Reply-To: <avy_9SPRaPSKD8b4@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 17 Nov 2026 14:03:06 -0800
X-Gm-Features: Aa3M54obldq6YruWajcrqkfkI0bnKtN_pPopxVMwZ7IRPXUGwGNOW9PukA8ODCo
Message-ID: <CABCJKue=wV7gx5D1PuBWOgWnAFC2kzGSFSqshun3=AoLg6b=_w@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Alice Ryhl <aliceryhl@google.com>
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

On Tue, Nov 17, 2026 at 12:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Function merging should also be disabled with gendwarfksyms. It causes
> faux::Registration::as_raw() and Page::as_ptr() to get merged, which
> incorrectly causes the former to get the CRC of the latter.

Sounds reasonable to me. Although, I assume this is only really a
problem if the functions stop being merged later on, e.g. because
they're no longer ABI compatible?

Sami
