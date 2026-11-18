Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795036349;
	b=ZQ2QbhZS69exXrjDsi24opvsVM7kbnGSNmyB13CTQw8Hg21E0Ihn+uYlne+7W8R2O0DC
	 1kbvAWB/kqdAsKl0TF98RlM9rfmJ5gqNoxJAkQdNDd0M/cLkkFGVeWGYalKatw+ygDzUb
	 VnjX3BjEEEeVj7ak3or3SkpvjF2s4Mf/D82f07tPamjDGjmtTk5rrCVTnti/joQgi8zGK
	 oSmwKmXtbC85mzX7M1u4QiWrq8hxc49efDc/opeZxABpw5HVr7jBN7iQsPGov4S1KQt/4
	 RRzzFjouk/hXrhm61o89on24ttHlWE6j7IbEbtkuK5S9WUwPAoHmdR7B029yf7QTZ8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
	b=TdCQE7WNQjY1lFjUtvrhDu0OPUakPCCOdJjeCKv9vhRefpj6VG3IG83IaOPWk2LrrA3Y
	 SX6z45xoAkQydMa4mXOESwvFSVln2tN+A2dZwSbvWXcu/hwfohK/xWs0gkmXEwg4D6wFH
	 RcAAzcm4owWtes7JUgJ0anb8Xxbu96x89zbYQjVxvihOCM6vIn43stjnTBLC3yHTyfJp/
	 oxWD3Mg1H8N6b9Rsg2lohpj9POZ4yAkYz4TNixdKJxM1i4zrs34zy6Rab4SXAN6WVcF0c
	 J/ydCO0QqzaqN5q0fmEwNoTOCOxIKpN0W4xIhLDmAEYrGcO8n63JeJFx+DhdaTBWgdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dmlfi5TX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568A8606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568A8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dmlfi5TX
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso11942515e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795036348; cv=none;
        d=google.com; s=arc-20260327;
        b=qKa2nT9QqL4OQKePEKW58W6y/WDNNBUyfT6JNc3IikmSYdVqigLMg/nDvWdrc6qlCb
         TTCL7u1nVI3M/2Gcemxbq6JMeVy1yC1t2qavZCWbwsoFCeV4hVhUVOCM0JSPD/p732j5
         PSOKsvsIVXW0BX0RBjZVJnALEqG/+/wkLbN3epv277MQ2YXiNmvRA6NgCHAjlYynOA9p
         vEjlPlFuljZTAHU8yug6r4IrcSDe1enWtgJICrdMYH4MMAS0QgtFwn1azE4cXHo0a7Ez
         pWsnZf8y0Yy/4+LArwJ+2ZrKUZVAb2XnXUm1oetrfTfGAQs/uXmOfW8agqiHpYVuVRcE
         bfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
        fh=/TgSKRcvgyuLMoB/22U3ho3+oQbcd5T8XqlLhwjR/sw=;
        b=YJv5ONmP4Sdp7vtHng0mJ8j5Q8UD0Ut08syvhxqcBR9hKuONSmcX65ufe2xSlINpN7
         Tzb6p0m9IIlj81dzAsl6Y03E4IxIDr1SHL3ZCxstJ9ffqXjQDSieidEi6MwZBhhaW46+
         tkOeV6yJRoL2E8PRN89aqQKF7vMRkKo1NZ3S3vJm9eNXJqFPnG6Hh0qJR1nzZyeT/Vz0
         e1KS1J7xxIy86hJ9K4EQEHHOVm7q6IlvUFgQe458WtybYRblV2+SDGSM6u21WVYOFIej
         0MNo5uNsA472LpiWw7Sxlxlsb0NmfXJkXC1cMRIkKJrQ2usXzERY9O98rHHUIA1iiI0b
         unTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795036348; x=1795641148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
        b=Dmlfi5TXCpgDfmBFbH12jFEe+eCqYa9u6tv4aC1RqtyZ/ewYF1YnHznurBJhjQI/DQ
         u/dcKvXcZeaJqWBCeOn7NVywvmG42klldHAPVRQFasYnZXYwdzbYpEhTu6F8vm03+Ta4
         SxNefPrMhaJ8G3t+vmrdMY42SH5aPl3kgAzRl9bPNzKhx+qwkjBv6piDBvcFUyEdbGLW
         deLwCvXb5Y+o7OEwFLA/O1yyR95FRCCyxncKkMnMxivGphWF+NZRspdK5GnRPdB5zrT6
         GDBJ7tmEVuQ8DA/aMMdu622h11nPCWWWgOKjTKEZtGPSw+0PORvcGF2feFgXpu8WHpec
         IH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036348; x=1795641148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
        b=w7ePP/jXw7eUURmcS+If/eF38EnjERPoHj4dxGE5H8JI1ctw8msU2p2rmpnMFGvPU8
         /2GWKUmg+IBsDzrgqYjkL9p3X6hc7os4yTa2LC6rXPENq54SLPjy/nk9b7fOHvCbEDga
         GNE3+2ybgPHScq0hie3LyRFJq3bjT7iWSAW2ep6iBpde8yrvmQDhnn/09MB2ETaAR6nQ
         2KV/QkaVSsOhE1JMbGKtKD6infpT9mAjBsh1zeKpX9VRoPnGHdMV/gD7V0aP78MLPrPN
         x6Pz3tYUXwrCEUOZ8YXOT6QMNS1Cqd95cbSAOMaww+KE2LnrACFgAK8axt5y2eoKXcjp
         cW9w==
X-Forwarded-Encrypted: i=1; AL+hErFxThR8EdA5MQ1JDk9yJ3uMPJ0mPZ5VizCELS0FzR8OqHm9oswgfjy+/vVOr686vzmXyFPcT3VgQSxIEwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KxaJpl/aZQYe2OwAi4NFcSbJj2Ow3sxoga0MhZ4xHvzUKf9IP
	IyY/ygGWWTV2H6I9gc4icfBYjUTKWKTuZmJYrJDYlBV23dBBadnxEmCib13MXgHjbn3mSOYsP1O
	FcaZjsJWF7UDFFUdGudzrloacsZqWrQir1R06/hSf
X-Gm-Gg: AYBFou1ka097KwXh3mNKFWA3eD4+yyR1ANmEVqdHwhDu+Tw67xa544fOx80wEwFt3Cw
	gM4tnGGx3inEzBx3yL4VX8j2LRqfGVOlTuZJQo1DUYtMm/+QmWbt6CcqQ4fSIFdDsC1KvSf7Vqg
	dUkKt8LE2InsSSXJi/G9MlT8vyrWcB44+baRfMTEyFYEE06+l7Kydp9moEx3kuUIBAR0I36CPew
	zrBAHl68EI1CK9GzUz9cLGRohwBm30Sr/qOumfQMCEOBc4TJB2uVLXz6m2fNeBfus3it8WiilwR
	NhR7zVSyNuYcKHXthRr0LC9eWbR2ienzuII5zgBfdONu7BxVlamkDY3hH3YpoiLrQwyKcLlrgOa
	OBGcpwcLjktGBoq2+gSBmD2ULwFihKB8K36kT7qS8YKdFqMjpJfoBT+4i7ebi6TqIWDolD3pPVN
	AeOUMfpu/tT33/sRSPP0dXGJX3za/sLr8HMeq3yL5Ny4nVfM74qQUfrAZOJN5H7WgP2dav4K95I
	NfAoYsk2h7//u7c16qFz1UjnKU+GKd/5xub3A==
X-Received: by 2002:a05:600c:c8f:b0:4bb:69b2:d3b3 with SMTP id
 5b1f17b1804b1-4bb7da3f50amr85274465e9.27.1795036347018; Wed, 18 Nov 2026
 13:12:27 -0800 (PST)
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
 <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com> <CAH5fLgidhnPbP=xXQ3162w6q0U6rWHPZ9Mu6-E5va4_CXyanOg@mail.gmail.com>
In-Reply-To: <CAH5fLgidhnPbP=xXQ3162w6q0U6rWHPZ9Mu6-E5va4_CXyanOg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 Nov 2026 13:12:15 -0800
X-Gm-Features: Aa3M54rwqBnTNo9s7KzOH39H6ui7-iQszvNlrDcPs70i2RE6J983km-iNd7m9tM
Message-ID: <CAKwvOdkNWp4us-zNPw8Pp3J6TVev3nTRsjPrjd9w9M66w2Qbzg@mail.gmail.com>
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

On Wed, Nov 18, 2026 at 12:11=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Wed, Nov 18, 2026 at 7:48=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > Function merging causes various different issues:
> > >
> > > * For CONFIG_CFI there's an LLVM bug causing functions with different
> > >   CFI hashes to get merged. This can lead to crashes at runtime.
> >
> > Do you have a link to a bug filed against llvm?
>
> https://github.com/llvm/llvm-project/issues/217629
>
> > > * For gendwarfksyms it causes functions with different CRCs to get
> > >   merged. This leads to broken MODVERSIONS information if the functio=
n
> > >   changes in the future so that it can no longer be merged.
> > > * Wrong backtraces when a crash occurs in a merged function.
> > > * Possibly also issues with pahole/BTF as the merged function's debug
> > >   info is lost.
> > >
> > > These issues are new to Rust because in clang, function merging is of=
f
> > > by default, so these things have never come up before. Because of thi=
s,
> >
> > I've never heard of function merging (in clang). I've heard of
> > -Wl,--icf=3D{none,safe,all), a linker flag.  Is rustc setting that by
> > default, implicitly?
> > https://github.com/ClangBuiltLinux/linux/issues/1598
>
> No, this isn't linker ICF. rustc doesn't pass --icf, and in any case
> kbuild invokes rustc with --emit=3Dobj and does the final link itself, so
> rustc's linker arguments never come into play.
>
> What I'm referring to is LLVM's MergeFunctions IR pass
> (llvm/lib/Transforms/IPO/MergeFunctions.cpp). It runs as part of the
> optimization pipeline, within a single codegen unit, before any object
> file is emitted. Clang only enables it with the cc1-only flag
> -fmerge-functions, which the kernel never passes, so C code in the
> kernel never sees it.

Thanks, consider amending these relevant links and details into your
commit message.

>
> rustc, however, enables it by default whenever optimizing for speed or
> size (opt-level 2, 3, s or z), which covers both kernel configurations.
> It uses the "aliases" mode: when two functions have identical bodies,
> one is deleted and its symbol becomes a GlobalAlias to the other. You
> can turn it off with -Zmerge-functions=3Ddisabled.
>
> Alice



--=20
Thanks,
~Nick Desaulniers
