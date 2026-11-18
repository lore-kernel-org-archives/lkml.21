Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795040335;
	b=YiydgW3Y7aI2lAw18TGFQotsXALZ4m9LEGcwlvrsjsZePC1ACl/Xss2SpORrXZif9PYw
	 y0OfXoL6qDHq8WW5J6Qyxv+UZouRyNectosOejfZR0NGnp8sqGicpbnyFKOuQamU9I8jw
	 L2I1W4AOXtfSLuRC48d+b3swHF10uuno6MD7T9y9PXY8qgolbi9UHjLe6OdVWv4R2ZdFu
	 ChJNpx68dVeMprqx/q//RFdkSRSorOBjaT2VxSiYhsZEyK7NDvDZhhrUSACT2XvgZc39/
	 HkbiFfiJ+yk1bMh/tkUBXmlliFnb+vuEeoR9p4JZBzhaT2ZeWXJ8H6qjxKFd5vblk7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
	b=C+kItf2brF7vyPZ9fquGusqXwdFLI7j03ndtLZhXrRNCB/HEI3RBIhuLIWYkAZ4DKb07
	 bFxrSM9jeRhhUkQkLWNEL98qY5lSYRp5Sjl/Te7wt3/VGs8UIfHbqb1n46uVvtzQAPDVP
	 zVJ8XWd3hrc30FMz+UT1wri1da8msPdrPoOattCn4MAzZOuy3Z9OUAaUwhEQxpSOfvkwJ
	 pnsBHNXT+BBIuDiZ3oQ4lBknA/pYN6k2TV9vFl7Y8Ip5KbykOm43ezEmq8isarD06MSoe
	 QelDRV7V7yNdNh3cKhrV9czQ9vUKaFPmChWh4DVt+mqtx4GdGVHPPKSnw8HuLsqizxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DhwrPv4G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25D4606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C25D4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DhwrPv4G
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb5b33e2ffso5545e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:18:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795040333; cv=none;
        d=google.com; s=arc-20260327;
        b=E95VDnn1E/0dn0DCoAupk3KnqXisnTND+uzuBDyujIv+CcMglO8RkKOtKYUp5kA6rE
         9blMDqkMwUG2Xo5BbP5jJEaeEcDPfBnnWWYU0TFzd+4evz9mCrRNLUVtBF6FBix1Prx7
         fvVaAiNPCs9G4r7HVD54uldrdbc5ZG0iQ8nhJlyRz/GvKEoBsgs/SWOBcu8TIEEuNV81
         nauxHW2B5jQ1zXOkpr3qN/keec2OUm9GkzekqSwi26WzIaX0Mf7mh+ZY1BMi8bXM1Dw7
         OIiFY9Byg/ywmRj/kN2O2HT4+OIi99Rk+BNGhCwssJFzZ0o5LaJwHMOQfNlNOQe3pd+S
         MX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
        fh=0d7tCdWLUz1YCGWR42jLmtT8UPLOPR7fq5IslU8ySZk=;
        b=XvK8lPoaNqR0/ZZOXwLkPQrDicjW1KLYySNzYhjRKyNcrrrvKN94LhwZxVC0D0PETx
         xbvhC7Nfc/VBTxz6PvzlJW9OgwmkgCZIxkLgepFey8S+lSBJgg/9M9sxf/M3H1TS0O30
         WIZmX3RHzeRJW0c8cTpXKLrsyydhKYcnY0vL8Gl7wG1GSfK+kUeps3ufowLXNtn8wti3
         zhs8D7AVg/9mz7eB5Nr1vPC0g6jiTQjA1GuVknVlZcjBkFI04FjJot7Mq4nUavEDy2Le
         qoI5N+1+CD2hNzDBh1+/MFGTO4VpCklD+HwZMwfGvx4FVllyDLMWy5PqddwTaTKm2ZVq
         bUwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795040333; x=1795645133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
        b=DhwrPv4GGFiOVke3X6njuMQROCZZTT+xdWguHN9Ve4ls24tJInBkCDQToNg2sTOH/7
         9fkhOJ7HqD7c58NdQDY7sym37Km0fntvXNnHSLiComuANprVK86/akMKEQtOmRk1K9xO
         JES0ONp3tAzKlLidLptHk3TFMkYlZ1Hvyx5PdcqkASrzNWnsmeIBpBPXdjrilkGx/6cD
         K+L5mYzqtqK2/8ulA2EwqsRtFXiw30sGQybhL4DTr6C9ZWTA47PRumYSiqWHNmNcZW+C
         Byy1W1ngeI4hePMxMzk+5U3fmHmoAzAy7yzhoofr7fZIleSiMd01npReSTAdbkh1M6ZN
         KBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795040333; x=1795645133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
        b=fA2/55fsavEIV5byBJ++3eSetEhYvgWCpCGWXwtr+qbpS8pavuFfSPCB9gD+DA+irs
         v0g2NB6vDd9Wzo/uf7pVKhUq56HE71VdRW4xSUFG8lRpOeWbeQcWMz7di81+XUnLoPfE
         zm5oIDtJVewfL1drYt9JmdhLvlNgZAiu9PW9XkAByOv3IoFUKCn5DBpMYijGB0mkN87R
         P09MxMHmRNUJp2weQI5mXgI+e6aBWJ9qNdhW8CYFwnelXJ2HRd9isaJWaXV/iP3Y54Bd
         dOezX+V/X/OVoyPqVlLwBVG/wbNJ7LJNjWiP3SNSTT5ISDREMWEBp7BTC3DIRWtvD75L
         TXwQ==
X-Forwarded-Encrypted: i=1; AL+hErGHklstJRLOWnGIbN+zIY/rZyB9r/5Yqs2pHDZB9e6nzI3CtCFLhrofVb94izdgi/QGf1DdFRhBAWqsDQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wakvPh95KWYq9ZVSCkyxihaCXv4nlj5tk7F39Z6WmCxxjaEKB
	VRXMvAB5kLI3ncCt3/V9XM0MVSME2XX9Jc9nVze2NRXhfl68jyEPl0QWimrTMgrCFOArpmnHt0y
	mw0Nk4Lb7RtC66+TvIgYsCjZ4PBOYiZPoLeNUZFa4
X-Gm-Gg: AYBFou3XBdv+7kiwDQFuEVmx9SV9qCCN76mmb61JsaU7DWVrCA2kkN9SCL2RC2BwsvC
	FxIWIxAuwB/URcj+gt5POa0RqIshBj9aOk44IQq/WxYtsJ5GSuBAvojSS531WpH6OhjIsebdl8d
	W26mCk8Yu1pG1i/RrMEQumzWiiDVaYxtNhu+wtyxA9wfsddtNKMR6Fn3DtLb91iaDrR5nCWAy+1
	oaEwu+LH2MTBHl1oAbXsJpWR5tGeLohQ1I7iwizXQJYaHYM0sCWkC1Sf5BBcARHlc0EPINQv1Iw
	YTKxB1eudZ/adZK5lOetvZHwLq4dST6qORy5uOSvwpvNP6hUNzuG3olLw1fqwNLBG9QU6o/UMA4
	L46G57lBW03KpIXfpzwuooG4acWZP412mmA==
X-Received: by 2002:a05:600c:c083:b0:4a2:a8c:22ae with SMTP id
 5b1f17b1804b1-4bb840fdcf6mr76245e9.12.1795040332631; Wed, 18 Nov 2026
 14:18:52 -0800 (PST)
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
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 18 Nov 2026 14:18:15 -0800
X-Gm-Features: Aa3M54qrYLCi1kdI6tOsVZ4Mm-8YCYtqxNVjxhU4bWLFHJjIpemXwQLKhaF114s
Message-ID: <CABCJKucCD8RTVTg=_PuWTDLVaV+h8T7=whx+kLuxKq1Bpi3NrQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Matthew Maurer <mmaurer@google.com>, 
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
> * For gendwarfksyms it causes functions with different CRCs to get
>   merged. This leads to broken MODVERSIONS information if the function
>   changes in the future so that it can no longer be merged.
> * Wrong backtraces when a crash occurs in a merged function.
> * Possibly also issues with pahole/BTF as the merged function's debug
>   info is lost.
>
> These issues are new to Rust because in clang, function merging is off
> by default, so these things have never come up before. Because of this,
> turn this option off for all configurations.
>
> Link: https://lore.kernel.org/all/avy_9SPRaPSKD8b4@google.com/
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
