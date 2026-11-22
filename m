Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795343849;
	b=n7RRF1kM6bPkY3elRsxZ4A/xb4fDyhnZV3piIJI05qgD7CEkgIrjjHyPAl/+HIfW0jSu
	 kpr/S2LWcT1DRgIUYiuTc6a+SRcmAzygsnHbvPWejEgwTcXYEMv0EpABjLdTNPJaPa29n
	 eyNwPiyOtNzXbC+TtnfYNSbhP5tq4oEAnioNMbUH0IIt7Qaer50QVa1FTVMlEZpQKPKwr
	 cCQEHRhMlm6qOH6wETqIsnSsDVdSO4YhGLeQ5InF4juy+JsybS9nL4Znwaqky59ibDSjR
	 riPn6Bm5lhyuv7cljw1isBAOZS0NM2CZhpdGvypa3gwQx2YhdMZWRrKlJXMagdt6bZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SkHThBbL3IF8/bZX9InG5rUd1TXxNJhC+NUu8na8ZaQ=;
	b=4zch3zPlCk2PR1zbSXVanpDFiZ35h+Fk1obmaak166Yr8i/WLOMKi54yn7ilgV4wiDRz
	 P9u9mtqYhiRegO6M1Eb/oHvUOBw8onyZ3bjQvX1zTVHwn6J/yg+KwRY7a1bwZaC5o+JlM
	 lIA7BGl5yFZzMjbrhaszEwVBNqYoBQRujnse5Mrz7RfctQkMZLI5+nbS6PhldwXstatZc
	 O8HKwFn2HkXb/exPCf2Zk4XIzs064ZDnpOKwIZ4khX+z2ZI+NS7MGG1VQm2DGLaeX6NY0
	 d6kuVxr5VRpfQkmkHc+tQEct9s+vMb7IBrZf5g3i045f1FJz0P88VK1o2H/sUnlKEtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxLLoHl+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B53606A33D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B53606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxLLoHl+
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c0f0e04628so186803e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:37:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795343847; cv=none;
        d=google.com; s=arc-20260327;
        b=tAYGPq1LNpyFFzZcaXTMVDbk9qG0q/XO1+rWE7fjcXRlqYMzO/2bqu1vL+1fYQRB+f
         /Vrm6Uz6K4hraiSrxAqegjIciKpCJdLTtWEDS9hLvR7/cnXd6my79nU+nEBVjg851K3o
         CH5SB0pZnvV2qOFsEkdS205abJh6+9y+K9YnCK3D3lhPjD3KzpxkkGbhSW29dYwOApP7
         E2G0taJo+KlucTCoYaqPl7pjz19f1bvZnFoVmnvWRQkEwF+j8aPfzdcJqekLfx7vf07L
         ax4Sb+2yo4uakyGUHl4Zd4GmKI+0zsUwR7N+jSs2bOxWWV0TlRuan0YdwegQoyy5RXPF
         o6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SkHThBbL3IF8/bZX9InG5rUd1TXxNJhC+NUu8na8ZaQ=;
        fh=poMWdY+A0oSXg3PoaTgx/MXcNUDKON6bNm+vBgSs1v0=;
        b=StDJlcYkY3Yp7l008sygDG5bnmZD5ljbAbtFc3jnTvOoDCNiHifYRMELa0Ed100cSO
         pk0yw5q3MQ9C79NAK+b0m4smvZvd5gA+w0l8KaV754iIZDZc0GWQwa/A9eZTKttfpyY0
         jkyv//BtL7sa8kOdVoznd+C/6qeWF1lMd3ZVw/ps7FjLS9bjk1h3Csp7Gf+KW3bBC2bs
         0slBvwatUOd1WNDXLNUjX74cHCHD77CBDIl4CbCr8Ki4QBSrTmiu9s76bfAgi1a7JO3a
         8Q5I8ko21uZzqDhhTCPdN1O6R4hXXsRz1A1kOjGLz+qM7GB3H7v59qUD5Q3afeKhUGMp
         YuZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343847; x=1795948647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SkHThBbL3IF8/bZX9InG5rUd1TXxNJhC+NUu8na8ZaQ=;
        b=yxLLoHl+fwguCBO7F8phUX+J4ajaH2yEKHmMYDsOVnNp8aOaX/ZTmgqTlfVRzQp5AD
         c3+cb+EYVYZDj6pyBth/wuJR/VbKpDtEeP7AXRirOidtfMD8eSLVpXFS409ZV+pK+QMw
         Efy7wksgrj6RYGQL4aRD/bqpKMWnlJeefBxratoiTuzhTaDQqwNUyld2JJTjmOQkLMy2
         EbwNgksGLxvdBRgUwYioLRkK2XRAf02rjlY6IwlEBtLnR96OK83BF3Sw7Rssoqrecf8W
         NtHwN7veS0ESRl1tLbARdizJraCXBjyeO1eXJ0pfI87DaeRCnQ7Vj3XAl1BwKkx+VzNl
         bsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343847; x=1795948647;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkHThBbL3IF8/bZX9InG5rUd1TXxNJhC+NUu8na8ZaQ=;
        b=JKSHF9ntUmcftQTs7LycqqYa0ZR/AlKBcvy/R+vEQhbUXsqOP8c0SsZTP8QPPoVYEC
         gJKycUfLwGaITrvnn4Wrc4woZ2//dn/9YaEuxdt0gkFln3LUWzgQ1C9d3jO2DMvXlek/
         Jdc33slczM5HY7/X1mTe9vPKVpVde+5iLF+kc7UqvxvouSOars6WyRYKPlShNTvhriJE
         mmOtk5TiIbMkOKY6ggyFTYNTksGgacQ/cdFpxuSrP92AoqoggFRhvdpvztC+t3XDVMNq
         j681He5U5t7eOYUmx9SnM5Ab5kgCneWxtHe/g48B2KeeuBvA9L5kFzpgQp1HVbau5ECm
         Y9Hg==
X-Forwarded-Encrypted: i=1; AL+hErE6B6knfse67y1q8OYZNEduD2SSpPF1N+kT8xAIhMB5FARrXbXdRBsM7en+A7UIzzzrXd3Dg8fXvO/LCzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WRDKQLTVC8cW80hAlGiIOy/vF7krugzEQ7Y1VNLasfEWDv6K/
	zoC2D8A1pOofza6iRw3svBGeIGSfbK8dDzf4ID49UhwNyqPzRxgkl6G7p6pYXTR0LjEVxVkdW66
	vzTelX6WJsIDaowm1NuJsXULHbPyd59Y=
X-Gm-Gg: AZFdTZfZE3EoaZD44+B5y38KIibXMxSwmYJT01w5hZIGjmghFVqasSMAomgSI0tcNQ8
	YEKf1ptbmaZSMrNT359KAA+0IZPcHY2fRL5DtDCv8BCCGefxY5u7aWmHYyAYfKH4mE6bliHUp8V
	o8xM3G9aDHZ188MrLsaM8s72iOfFnDD3iKIn8BMuaf31mL4+Idi5QxIdq46YWyyY3O3hEylF1vx
	7KE4J3G6/wYOqW2GFB77+jSfm6PcoBunIfcSoDwCnYBJsLqmGNiteqZFKRfZsabugubg8d+FW/B
	fbSKrGyoIAuzGTTsbcm4wkPJlBd8Sb9Uwu+6gdj2xt3UsSuENrgoJ66QUgsEKt4eL9s3rpoRnEk
	E7j6Z++9/VmnKGqma0c4LTLJbDmugF827pHhbdRpFT8Y145VjQMlItjMyi1LjWdVJyMhuDtD9j/
	q1T/cUqoPrHamFAUA0tkuh0Dt3KvvTjouR/7lKhMlRN0DMWKMD/HQe3hRU+BWMPp1nrm/VnE6kP
	w/HmmXrk58rJd5b0luKeCF1RKfetDImV4Eqeuf6wnZQeIj4e/Ajm2zzjG8wYHFqCs7UowdN
X-Received: by 2002:a05:6512:1384:b0:5bf:ce24:38c8 with SMTP id
 2adb3069b0e04-5c1bc797ddamr2535837e87.4.1795343846483; Sun, 22 Nov 2026
 02:37:26 -0800 (PST)
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
In-Reply-To: <20261122-rust-dmi-v1-1-4ace9449f872@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Nov 2026 11:37:14 +0100
X-Gm-Features: Aa3M54p2K8gxR5qOYb2sPLuv86fFx9GH9QVVzKPq4L9N9ex9zsEmuZ3vk_xxDw4
Message-ID: <CANiq72mFCq01A_=B0gyaut1rPWeECOdDwP6pD3FBv7n4oH6TWg@mail.gmail.com>
Subject: Re: [PATCH] rust: dmi: add basic DMI matching abstraction
To: nick42d@gmail.com
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

On Sun, Nov 22, 2026 at 5:28=E2=80=AFAM Nick Dowsett via B4 Relay
<devnull+nick42d.gmail.com@kernel.org> wrote:
>
> `dmi::get_system_info` is currently marked safe under the assumption that
> Rust code is always called after DMI is initialised. Would be keen to
> have this validated. Alternatively I think a minimal patch to C could
> actually make this safe earlier if required.

Please avoid soundness holes unless there is really no other way out
and/or it would be very, very onerous to do. The bar is really high
here, i.e. if this is just an `unsafe` function, then please simply
mark it as such, which in turns allows us to document why and to force
others to ensure it is correct when calling it etc.

Of course, if there is a way to make it safe (whether with a change on
the C side or with API design on the Rust side etc.), then that is
even better.

Since I noticed this while going through the list, let me throw some
nits from a quick pass at the code if you don't mind...

> +/// # Invariant

# Invariants

> +#[expect(missing_docs, reason =3D "C version of these consts are undocum=
ented")]

(It may be a nice time to take the chance to document these in C, but
out-of-scope for the patch, of course.)

> +/// # use kernel::dmi::{self, Field};

Vertical formatting.

> +pub fn get_system_info(field: Field) -> Option<&'static CStr> {
> +    // NOTE: This can be upgraded to cfg-select post Rust 1.95.

`cfg_select!`

Though I am not convinced we want this sort of comment -- it is true
that we have similar comments for explicit workarounds we want to
remove later on, but in a case like this it is the "standard" way of
writing the code at least at the moment, rather than an actual
workaround. And we can always grep/LLM for these improvements when we
bump the minimum version.

> +        if ptr.is_null() {
> +            return None;
> +        }

Newline after this?

> +        // SAFETY: If non-null, `dmi_get_system_info` returns a C string=
 that
> +        // lives for the life of the kernel.

I would word sentences like this stating what is known to be true and
why (since that adds information), rather than conditionally (since
that "repeats" the contract of the callee), e.g.

  `ptr` has just been checked to be non-null, therefore ...

Thanks!

Cheers,
Miguel
