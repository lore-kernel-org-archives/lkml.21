Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795027739;
	b=Xf3YiqzZ0GeQet9Pee15dLyOBDM7B7ha5vok7480mgRblBntgHG0fkhYlJc0PaNdxUDK
	 ivHRpsqp7aHfMBWbwENLWNo+qcVD7bnCxtXto6MXBf69RSyr3PX6YR2x18a/pbh/3Vy44
	 1988ddoAJrCas/qJLJOR16BPCNEzA6FyeBxF5YB/izC8sKEE1aDD0g+ZgX6a029LEzNqK
	 sq8J6Cgp7JKFSReSkrnG0Q3DKmFT60e0paEcAL/jwbrMtCFjwFYgG1QkGYMppJF7HruDy
	 ls72OWScTiQxjWiLhbG45o7unbb/I3O/FvDklpiWI93i+0tN5KerYbwUch3A0Y5Y07w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
	b=NNIlJn4bKXsub2hm26g+0WxQTeNa1WDaFwNrljYRRlZH38pYG1uMjNgfpdV7Z44h1Laj
	 LHhZSQNAaIeOUXVCe1eF/CXWoVV75d4xOtkIpYi2nCeSgx3J27ahX1db7pBbI3POO19l7
	 4tlq3xLseKLgn5n6QS69DWcQ0IUr1tTUJv8HyJhj4TBqbhcDZ/maDgaBSBVbKjEQNfo09
	 asQcecE3Pne7Qxts5gq6dvhCmWCfZOwm6uoJB9t+pmUU8vhtnlOEhfZq55xnc1BoZpZ4Q
	 XHg+Qq49ZLxtJbqg/GGtf30yBmvyn/2iJseWirx8yyNJbFqudldJu7N8QLIbMIBrb3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SaVd11am;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC15606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADC15606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SaVd11am
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a358881793so737514f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:48:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795027735; cv=none;
        d=google.com; s=arc-20260327;
        b=LF3Zj5ApXc1iiqSv7q/uqLYwKdKFcY277Sr8vWZgooa+IpHbX8DAycgZOyicvNkKVR
         PS4erWMuY5lmz5okvIJ8q0kuYkU+Y18ItNISxIt+HJwSe4U7YXnHb6oCa+VVy2nvrkYZ
         BisUx8GHU4h8CK2bH9kk/YxOGyM5Ea+3GEK/w56UQ0lBVreRqwA2SqIHzqw99yNBxIGK
         XGGxXxSo6ujMpX2nDQmvNbszdOvAUop5T8wrgVH7eoFeKhFN7DB8ZpnVmXJTPRm2DQTq
         kXjtSHVNwXyK5YL7oCZxUMZ85uGEt6C/P0h+2p6LwF6c6zp35CgNvwQRD5knP2Ttxh08
         R/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
        fh=rreuzjtPPnRQ9nqJzwu9sC/HsNfl/m5/pexfTlClZsE=;
        b=LFWxHgvXMpD5ULyUfJzuhCXwKg4MgifChJK7EX3OmvOmsgarGUEb3MzB5fzrxF318D
         zcfyZQHqTomO8Jd4hcWj2AdhPQ1IcBQpj8bQZf/GzE7UDib/kMl1w1SE3QWH8mJ/Ts7c
         w+Do3hhpk5EYj+B33IE7yaPVpmcjXpVlwEucJHyJA895ubt7ftyF7dLe+sFyLQ/sb3RW
         YJ9ymqORpCFnyfWPFHyo0TcaN7IvLFvBNAQ0+DA7p92/2YPaPgbfa2Qhal1qQHneVujO
         HVFD2ZpO8IERUNHw8TGgtP3U3arPHVd+j3SYIoa8gw/XEx/+m6oE3l67PdtdGNavRTdh
         mZxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795027735; x=1795632535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
        b=SaVd11amMVaZjfemF+IdOLWVydW/v6XL9frGvxx7ZZp1u9OrILJarL+fMcOGS6mqbn
         4XimgGUBm/a3LFYWlv8NYnjom6o+ODA/WyR9X2xnj66H2kqVJmMsLfGdxahANKjAJHf9
         Q/QFhpIbAzEpAT96XnIOLyaKEmEI9Epx7m3YwFzfcCLse8tXhiHbaGE+ZKABhULiU+nu
         poO3h0MjuGBJNbPsJU5sRMaRaFXdz+PirVzKqMfDizt0/KZr1EJfII/mQuNKyXqm0g7L
         CtU9N82CiGKDKZDWmQY6sIpf0FzltFzZL8MF5O/B2XN1KEdDCkY1QRB6PuKvy7B0897k
         d6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027735; x=1795632535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
        b=0JWh0+X/PcpGeX/WswgKjMCFQJzsdf/jLkgHTyV+IM3OAUTj/KmUYvdrIPLGPO7SFH
         Oqq6YpE4vhhIPKE1+Ty9tcOEZmFvHhvyGpoW7KAvl0FyGM2FJHowxZmXdFAMmGflBiYJ
         bC7eyjsVfkvT5H1gZA3hKEx6oOI7czG0Rjo7JQBQKI2NdRfddrVlUJgDdOnCqbZPFKZQ
         LhiGMSkdWLlugslKXpn3dypKhPReVQuEOXy/xJf8QIUUfFjbMjnzGrBkb6B5B5SPA8WJ
         3K0O+UvS2tpsSBUWPdoF0r7/swiPpyd8fzn0j2zf4mZeOR3r6FKCgiAizSXZyrFc0W0/
         OfNA==
X-Forwarded-Encrypted: i=1; AL+hErFWXEl/QIOlmqrer/DYtw/6jIeKQqFZ2tQeO4XG3p/KUpfsutdWvmMiGVOq54Npc1A3DIchR8m3ZtuzG48=@vger.kernel.org
X-Gm-Message-State: APuU4Z93Y+bcwI1uFV6tI+sLo0SlA1gUHySJ34JcDElIt48QB76lx+Kq
	wttz3LedMLv/LaLc450eRVpN6Y1eTinGwVhxS4aCbhIbKfBxM+8pnctqpGWH7xCzNzdJ25BrMMp
	eR60t4OmkAPX5mWIoH0QbxsNHEeILoRZLbezfgkoY
X-Gm-Gg: AZFdTZcJyYe6Iam0JYTwAbDOt1L2gszm2/q/DsYpg+b+OWHnJDW+7Liq0hMjDXi6sR6
	lraei8TcBxaH39DawAKdgZdsn6Z/fNYkpmRsZECK5QD03Z27mpfOQBI3lAHvlz6qgvtalDGTuOS
	OUEib2/LsQLf/dWi630+VV30QoUJ+vxfQQgflL2Q6XUENKgLIfNQFOhYCqt7KwJH71bSgvSewY8
	xq99uY+swleBrxomIMP+VREHrr/FW5JTInAJ99ins4Qh+oR3SCAPtzETdE+xzef7JtONSVeGTXr
	rl17wRZrS+yo5BdNYzej7n+B3en0NuZU6MK8SrA07GwJmqB+y1IdqnfvCplDPbdWrGBRiePtz3P
	bITQv255PMpD8/ns6BI1l6LuRzJY1XMy+wZexadJbPjteVfbtHeOzv1nKafVfc107wHrtNjiPsz
	9nRJ7szOvyh73YaRVuVaQ77PmaYXUoLginMB6/MwEbSWnk0ALn0DVZFndffK7tlloZ2rzNsjMhh
	anXD9l/A7pqstNuNyWDu771Xyv1mV2isicu0w==
X-Received: by 2002:a05:6000:41c9:b0:4a3:777a:a964 with SMTP id
 ffacd0b85a97d-4a62d6d4875mr7842462f8f.0.1795027734320; Wed, 18 Nov 2026
 10:48:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
In-Reply-To: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 Nov 2026 10:48:43 -0800
X-Gm-Features: Aa3M54qO-h-RtjaPnh7QVBF5Y0JJtJj8eYAtLacwVWO8_kUzOdD5vosJqDSsgHo
Message-ID: <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Function merging causes various different issues:
>
> * For CONFIG_CFI there's an LLVM bug causing functions with different
>   CFI hashes to get merged. This can lead to crashes at runtime.

Do you have a link to a bug filed against llvm?

> * For gendwarfksyms it causes functions with different CRCs to get
>   merged. This leads to broken MODVERSIONS information if the function
>   changes in the future so that it can no longer be merged.
> * Wrong backtraces when a crash occurs in a merged function.
> * Possibly also issues with pahole/BTF as the merged function's debug
>   info is lost.
>
> These issues are new to Rust because in clang, function merging is off
> by default, so these things have never come up before. Because of this,

I've never heard of function merging (in clang). I've heard of
-Wl,--icf=3D{none,safe,all), a linker flag.  Is rustc setting that by
default, implicitly?
https://github.com/ClangBuiltLinux/linux/issues/1598

> turn this option off for all configurations.
>
> Link: https://lore.kernel.org/all/avy_9SPRaPSKD8b4@google.com/
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 5aac6f1b011e..17b7ac3afbc4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -622,6 +622,7 @@ KBUILD_RUSTFLAGS :=3D $(rust_common_flags) \
>                     -Csymbol-mangling-version=3Dv0 \
>                     -Crelocation-model=3Dstatic \
>                     -Zfunction-sections=3Dn \
> +                   -Zmerge-functions=3Ddisabled \
>                     -Wclippy::float_arithmetic
>  KBUILD_RUSTFLAGS_OPTION_CHKS :=3D
>
> @@ -1136,8 +1137,7 @@ endif
>  ifdef CONFIG_RUST
>         # Always pass -Zsanitizer-cfi-normalize-integers as CONFIG_RUST s=
elects
>         # CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
> -       # Disable function merging as LLVM incorrectly merges functions w=
ith different KCFI types.
> -       RUSTC_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-normali=
ze-integers -Zmerge-functions=3Ddisabled
> +       RUSTC_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-normali=
ze-integers
>         KBUILD_RUSTFLAGS +=3D $(RUSTC_FLAGS_CFI)
>         export RUSTC_FLAGS_CFI
>  endif
>
> ---
> base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
> change-id: 20261117-rust-merge-functions-9ccbc0516df5
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>


--=20
Thanks,
~Nick Desaulniers
