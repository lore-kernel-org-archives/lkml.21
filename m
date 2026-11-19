Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795049130;
	b=x6qQv7c5U9pK+B8tGKUhF1maiDozH49WQlAZarqv/PwbjU0GT7pAmOfj3UZaqyRBY/A2
	 zVLGJQFNzSqxzQrF97lzPrx0GY+hv4EWmqd0ttzCQZ4O7i01f117oGbd3h7zDHih/hZbk
	 zmeCeGOTRDUYe10cQ/oDJ4LWH8RfalrsSkABVzT0zO+7EJgue37CFtldJljTJNQqxgpr3
	 ov+hOOJE3mYUQe+rl2fOqLZaltjWQ0efvN0r3CdL0jgi2/1MoY38ybSFWjQVWunoMXIAP
	 NEYLA0Oplw8wh2IcXuSurvQ8xjTEdtmkz8fyBecB3RWTzKBTjHBCEpG0MLWfBmplMiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8sS940tCKYm9vcpUdjMxPgdq6c4Dw9nIfl/dAmKtgNk=;
	b=xyZjKzp3dOTivyC2w+rpq2RwNfMFg/ijVzO6U2lSIREV6KvCcVFjlzSyThsKNRPy/Pqx
	 QmgdQ+C04vHpGMv3wAXVXCeN2gm0ZkadHDuoYfWeW0ukiMIUo+8kkca172QUSBKHTtTIR
	 YYHoC+rqZUvZEv9JLASY71HLj6NlHpRLmOfMLSUtZh2vOtKqbm+10aFatxSs5Gt85lGSh
	 7BVdrahyjd/LX0EmKO8T/KmlTUBZbAQeWHXa60YHbXL73hGRSey28Hqel9GwZw/dHukMB
	 EUTcr9RlyF9040G6JXXGSJoNl+qE0p52VMtUgQnHCq7EXIu+SpX9LnhncqTp/V4QHJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dctIdyXN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4B7606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD4B7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dctIdyXN
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb845433b8so10235e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:45:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795049128; cv=none;
        d=google.com; s=arc-20260327;
        b=ZBTYIJqxGj4g9lFdTCVln+oSTSbmN/kvt0A9PVDvyhKSEc231nkeJiIZeHO3UN7gLT
         AYlKzU9WN/ojgJovbIIqiO+JNp0wTn+JtknRP1wqLof4luj5ox1rJlV9++bsTOy9jWuo
         df0ITr5ZvJNn7v0sMbxG1EbFTk/USOiTFa+ZMdyURUjh7OmfGPggf1wHOkYEjXM+upab
         2oSb1nq0cX95D/cLZDNf6qUJUfzqUwdJj/CsgYnxLbxjvqCKySbf9Ns8uI2F4cKjJYaF
         N6eFjOeRKvGovYaZxjeux6/anz4V8cdoq/BJJmkv0U4iKu45YZm5qYfa/TvCIbXPqvok
         qK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8sS940tCKYm9vcpUdjMxPgdq6c4Dw9nIfl/dAmKtgNk=;
        fh=lJ3D55JzETqNCgfl6ndpivC+nKcpDSyhuNhVKPhvrGg=;
        b=IRzRIjHl2sdS5PksTEJYI4HMPKnUK5Y/+wMp29c28pBnYTsZFq9BGHrSSr2FPoRdub
         lkOpQWIXdysaSli0uhtla6DB/4mF4UYH2sBjEmcdQWOlwh7IJt9DEWIqod28AF+o3RZ1
         fphPI5Em0U24G1feqZw4cSDVcv8V8+YIrLUMFxFG+nD41mDD88TE0g+LLp6iBEKhkdQ7
         r4zJwMYDW1+ovjtKdZ49k+z01treYQiJX0tcze3vMgsoTPBil2nCUneiz+zWQA8JxIxx
         JqaiYKv7pDqbYxhVdDgvtPGtN1JRC9jgKwNJ6dElWCGM5ozCPm+t55DWQth3Gsl5n91L
         FvBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795049128; x=1795653928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8sS940tCKYm9vcpUdjMxPgdq6c4Dw9nIfl/dAmKtgNk=;
        b=dctIdyXNTFOmu6P0yiuU9EAiTrjaoKS6u0AaJF9HmA281BEX+p/zl88sqijdx+DJq9
         G+zNh/CuWCQpA3z6cdByYHBnHi73s8VrPdRcpMFzr7xvXitN21kWHC5FzKzmkpG59TDx
         FtwXO/GJxAl9BDXtP1kwFFehq0N2jkz6gaXMh8YWVP+KDXMgJdAx6Pit8Qo6+8esR3sK
         hJdI4Mz3Y3QuoMv223DxSF9/bh1THeZMuHLgNcQRNeZjYKjktisXU78Eref678HFwQUQ
         lgC9TQ6Dk8hv0ofuQ4L0NwiX+aeR9CxQKEyygnbsFjq61cg3Pi+fkvrtILQgIQ4oaMAx
         e7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049128; x=1795653928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sS940tCKYm9vcpUdjMxPgdq6c4Dw9nIfl/dAmKtgNk=;
        b=GE/DIlSgUuox3zRT2bi/BwG699Q8DkHIVmIy8L6ejxvlag2dQbYkXyrHf1ZjdGd6pi
         S4TtJS1zxWhAGp54d4Y6fzLnk2usUaWGEOtuOYYS8ZFGNC6IMQ9S6FWXae9zSP9Nbb1N
         eHJRuTOLNAbVDzXPNUiiMZy3jrDefviffrloEnGvHh4SvG1UX+92v3ppUa/OdRmHclFl
         sRZZm5QZg14KLQm5nU0DJOW+hJ3LrkoJoWcG4BiJCtu6B5IFTzEkqjZoQOGsvwFE1kwP
         NdMn+6HHsF3EyUq7dnYiwPvr1BtIc/ujGaO8dRAGuE8T2UOe9ydbLxbKqnbmIKVuiyj2
         z7VA==
X-Forwarded-Encrypted: i=1; AL+hErGHPVCS5PMw9UEzq/rVg61vJlVyozSU1LHcHNhClc4apjjpKTSEDGiRJkMXTrmlSUEb4FnEmKz1pQWEPWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oTIBmD+/ZM8P0w8b1kn4WQmj97XktH3stdEZrMiD+zpzQk/C/
	3T5fPw2ftkhJTZNZ0E3kUZbB5jibS4ih8f3c1fjk8a4So0jC7xM2umQ5rS6tXggIIwlJyqxmKH2
	3pO/nPfw26itGk047Ic279SKBP9UdTxqNCvSbfet8
X-Gm-Gg: AYBFou1uVmStBIr3/XnD+uwppwsCOtjlog6N6kMuOHJes7u1Kf2kbNE0GXjyRnqXXmW
	lffmUMG+iVUtHomtSWRvh0MszdUyPdntOHb+xhh2O0UttxF0x1WIQ38Kx8SCZrexuKhe2QpIpVr
	7TooRyXtKO41liLbi3NpfliC+MJjGZChMxtnGY0Pl18Y7u5SNtszpqZiKFVCkbRB0cNJRC5zJFS
	NGah1Nz19YFegrwEOTUbPSBSRu2gWcr+OskAE5t07fmXChPDxMEXRQObmYuPzHuhy8tpnpPuDY+
	EYlsSbZQ+dhvbH381h+t9qrcKbR/3vLDIGbm14r/+lP09nsDS3MvNCvvf6qBnOcQk2DZt6+Hs05
	rjdYvhWCzBTlDVW75U2jq/0QViwQD9C41WA==
X-Received: by 2002:a05:600c:5489:b0:4a1:e368:cbf7 with SMTP id
 5b1f17b1804b1-4bb84b99968mr104985e9.0.1795049127672; Wed, 18 Nov 2026
 16:45:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-fix-rust-build-error-modversions-v1-1-7c1023764f30@gmail.com>
In-Reply-To: <20261118-fix-rust-build-error-modversions-v1-1-7c1023764f30@gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 18 Nov 2026 16:44:50 -0800
X-Gm-Features: Aa3M54rPrnjXnHBMBUtGdNtQCrNUnFqzZgAcYH5tW2jPXgiVWnHrDJiqQAFq-hM
Message-ID: <CABCJKufsw-egbnyqc3_D=+D=AdPQN-Q2bi6-uGi3e6UV_FZkKw@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: generate a symbol version for rust_build_error
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 1:08=E2=80=AFAM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> From: Peder Bergan <peder.bergan@gmail.com>
>
> CONFIG_RUST_BUILD_ASSERT_ALLOW exports rust_build_error to modules.
> When CONFIG_MODVERSIONS is also enabled, modpost warns that the export
> has no symbol version and records a zero CRC because the build_error.o
> rule skips gendwarfksyms.
>
> Generate the checksum from build_error.o with the existing Rust library
> rule. Make build_error.o depend on rust/Makefile when module versioning
> is enabled so incremental builds pick up the change. Kbuild's saved
> rustc command does not include the gendwarfksyms step.
>
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Reported-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1201
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
> ---
> An incremental x86-64 build with LLVM=3D1 CLIPPY=3D1 clears the modpost
> warning. The kernel export and a Rust module that references it both
> record the same nonzero CRC.
>
> OpenAI Codex assisted with coding and testing.
> ---
>  rust/Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
