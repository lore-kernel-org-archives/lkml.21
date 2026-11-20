Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795187253;
	b=sKuIdab7oknCiRSTa21hP8tLSdXavBuajPuPVvR1dbldKoc8FcnhuYocnZv5RuovYrKm
	 6DsMUNusoOMtVqdrs0B2oLeGNSgN+5UAslM7BS4oKJybIyRqCB/6nKTUtI7neL8liqCGJ
	 moAPNZCLo19+rv3t8V818FsO+y7Ws2R34FqYrngizyxvo2z6WuU2ddHIvVR2fcmhg0gZc
	 J5AFtI0MiLGj4JgJYw83mWFK6cwAT51NnVH2bNKb+hnMzokDrs6ZcvWaU0kuJgNvtu1mr
	 Y+PtEfliG2nI6rpdE4nPAJkRrOYYLJltouga7C7yG5mYk44DjKJf20ZK3I9lb2OGT2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0VIeYKjYJPYfVEKNuXLbK3ZTpB7YLv0Kh1v9qX8Ns0s=;
	b=N4aD4oE8AgT/CjMWwIL53khrT0ItBN8qudeiXgIaWckmjpLIDN68UpDEdGirNS3/GZfo
	 rKCUgmwbCjHjrr0QUNWf34TK4/xEvuykbaZBVgRJaNgHNC5pDs/46Pt4MzWlDfqWZWqMn
	 yY4A2YsEfQPjmr4gwtTvBCh8jaBKyuL8/4mDuvXr++9F9yrlfvAwRYqJ9RPF4ZTxsBaAd
	 SrP9smJUO9XAhdEKaZ9nos2yq6Am2SEbXv4Jx5zGpMYV60rf4mc2LEd2Jq5zsmuIGwWx1
	 cbDWkkTYZSTQloFhW52wIC38L5rpxe77Sc3f5wGgyPU2NJYely/clg95jEZ0Re9/yGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMCK6jkU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C0E606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C0E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMCK6jkU
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3adb75e65ecso821541fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:07:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795187251; cv=none;
        d=google.com; s=arc-20260327;
        b=FGvGZxiHsNv54IBWiOwLe9GxW2dyh3E3iVs46rWyBr2oXEChBzFS3qB5Rq2Nv8GXvs
         it3lraB+M4IXsgkyRAByoEYrSoqMOYU8w5QD26wQsHK4fbKtdUv0hH9P39RBlR+WDD0E
         nSluq0WZGS5q0k2TRCytw6bAtiIIOWmq4nSbdWoQaSjbFUVbPvtzGYKpa3dKJ7NKVeZY
         laZOWo+TJ+8ncIMUbT/QBLKDM8ZKkjL3MLyzAcig+E2NFOfZE6BmpIFlLo4rwSD5gBTW
         roKE4xoHmMZiq3GTqwmJkcyfl/AGv2QrCN0lAcLGrX1WXN5AkQQtBAlVHz4hUwjen0Xf
         jIiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0VIeYKjYJPYfVEKNuXLbK3ZTpB7YLv0Kh1v9qX8Ns0s=;
        fh=z9Ak83QRHFHTLsj00ynJ2LTirbqZhXGXTrO7TCfw/UI=;
        b=CWPyf4chu5YLxOe0TiqiI+WHagN0P1KYsxxSFSDDGvzKyWZg0KGbHKEi7tMf6QOxZg
         j5nZXacR96bhYc9GEJZdSlWJhbc31ompYVo1fP1b6ksRC2XfpKcYffB0Bw6cLE9wZdrl
         pMzpfeDUCDCYll0vQQ4wBZDq25Q5jD52S8XBqjYC7bP1kNTUEnERJ2H1LeEREcHMPMw7
         NvZknKpW92vAf7+jRI/ftCJ+aB6E54mNdK8JrSxSp6Y61ftLFR8Q4vdMAOF4jLWNF9bv
         r8Ujwj98FhBdlgBL6L7kYaDIEd+bcOSGbvYgLA49K0xC0OsRbGLwpnFsVXDvfFeXp910
         cafg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795187251; x=1795792051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VIeYKjYJPYfVEKNuXLbK3ZTpB7YLv0Kh1v9qX8Ns0s=;
        b=XMCK6jkUo7wByooJZtyW7ny3g5DZaDQdNAsIk3UApWv2FlnBhXrVmzZ64OAeqgR9c5
         duyNkpLRZetZ3LCPXqVMJuXS386vOmXoCNFj69w7n4F/Ig/HkURe3Sr/3I6GJUObY/Rx
         ipFP4aS7AR/Ic8SpRgM5fDGljWoof2wAZZuCqbbLadp4+dbMRko6M0soNXKYK1Ggd6Gp
         TyuQl+CZFlUnnZ+fRyzdzjDN7Qx13/uimy0GgXIh2/m2QKSccj22cJ7kpDzwSP0hYDgD
         MSuV1q/ZEtrQNahjTIZxSkPJl5TMj7A+7BMf97j/fcyFrO7fikF4uIStwPOweRf60bOT
         p9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187251; x=1795792051;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VIeYKjYJPYfVEKNuXLbK3ZTpB7YLv0Kh1v9qX8Ns0s=;
        b=XgFky9LkCfF/odbpY37uenJ4PsiOzvlPdwPwqCnLyApnyFvsnbo1wkx5sr6+YrFCQl
         JbgHyY5LFddi/vsT4z0RdFGZrUEaVVEpkYyrJjcv4fgpoa8Z/RaFPE+k2IPzURA+slVy
         t/mej+ifsyplWGssVBmxcx+hAJWhZc8J93wOezGZZc57E67exm5Abcl7B7bnfLuob+OJ
         XckMUzGCAynTXI+k7DY11Yabe/2Psm3b+dRyK8IyVLCOxi5uRxgqHAXXcJlJ+12m8SjO
         z09o9OP9oASRAx2R0CtIB16vzI+/L+nr4pc9f7jSk7cu1BC8HOSwNol3v+6WlboMlxr8
         /grw==
X-Forwarded-Encrypted: i=1; AL+hErEt+4zOqySMN66W7sFPBadgW5ny8mOG0Y6Rm6YvPiSBj14cAJC98IU/FtmzSEehJUPguljBCEXuJH8eiSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OQ5cjzdFhc4Ooi/CGpVZcuSl5msS/66O+xPM9YTg682LgyWKb
	uX6tPtMqxMoewaiNde+ljI1zvQ8w3VXRIFXTXZsktEDdjTJ2oxnseIiK12+NTiJLkqnSxDvrXTP
	PO3hSIfHRZVOEnQQAGZjsImfkI8ySGiU=
X-Gm-Gg: AZFdTZePcCnnsl9jKtegSc0X1UDF0hUl7pWCK+lL8mHJT3ZWS9v+U/K2KqpgSzqmGjH
	baos5afcdZmdXoiQFfZSrQVn/vhFb92eJ3X85W3Nl12zgwyn2TxEJ7KEEf1QCJ5H6QqszTqUKEB
	LhDVLBAvz/b5aGt9IHZ7j6p8pq7d6jcO+xndffk1cNkiZG3fcy78hYTEZMw0YNdafJIeypO6/2l
	BWiy7h47VJl7domPTFElSPxBh2ISYQtXpSchiYDP5k4qZ+VzxvB5TXw3eg0Jioe2NMYmhLonPra
	KlSiKh0TXtu6j16YTk74lyYp0QSIGP/iCV15hH4HysSOciCWISRYV8GAdupb9HJtxrFJJAtzyIo
	XKDRtngU06c/lyAWOiAAWZY3mQZgqKZ0xg70dHsDX4AkwYWwMwoIsaxzKGGbr3yIxiekg12t6fk
	vUVGRmAN0Zd3FwPZ/VSfEG+1J8wsryhza4J4mZyGMbgRsCZVJyHC/dIrrw0L0J7QMBTe3zlrHZi
	A4A0Unempw3IfwMBIfBI/IcBXl33mVAJuJK6xzyHBmTIab5ENiWQUcp9EMIgCHW+NhSie4qXyo=
X-Received: by 2002:a05:6512:23a4:b0:5bf:df58:d669 with SMTP id
 2adb3069b0e04-5c1bc69bf2cmr1387550e87.1.1795187250808; Fri, 20 Nov 2026
 07:07:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-dev-project-vis-v1-0-2a5f433bb516@garyguo.net> <20261118-dev-project-vis-v1-1-2a5f433bb516@garyguo.net>
In-Reply-To: <20261118-dev-project-vis-v1-1-2a5f433bb516@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 16:07:19 +0100
X-Gm-Features: Aa3M54q27XH1Xp2ep-HlHO7AOSvO61RSJVaTdBeMZuWQ8ApBPaE_qgH_4Z8u1g4
Message-ID: <CANiq72nNX41q_ZLOUUbyPmPownON1uxCLh=RXsVGBjFmoWhSBg@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: pin-init: internal: allow `clippy::large_unopt_stack_frames`
To: Gary Guo <gary@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:31=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Since Rust 1.102, Clippy renames `large_stack_frames` to
> `large_unopt_stack_frames` and make it warn by default. This is a good
> thing as in such cases pin-init should be used rather than potentially
> leave unoptimized large moves on stack. However, this also triggers in
> unexecutable code paths that pin-init generates for field duplication and
> exhaustiveness checks. Allow it on the generated check closure.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

We hit this in stable kernels, so:

Cc: stable@vger.kernel.org # 6.12.x (Rust is pinned in older LTSs)

Cheers,
Miguel
