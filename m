Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192884;
	b=HXiVth6rnoV1kj8+QKF3GgDYSr3sOrgdMmTKPneE1T0GZn6KjGDNKJMUvUCDPCUVpNVk
	 xiFGOM4SujDHjDp7ZCOi7WopY4qkmM7ZpOKLiTGmKmFMOv4xwAJNu5NyFOmAb74wIb5S+
	 ajvV+sm89KJ5eeroLbIUCFEVfE01g/XBR6RTERXAkM5SR8St3rERB/cejfu9ANSPbDfrf
	 H8BNjFYSFWhhMKfsde2JydD/1bHx9CTVcTGh6CV6t5WE3/RM0/eAPI2z4mbcSp4gAdOI5
	 yqTRaQyqz/0uwHKJ2fXiUUmmtqxyOdR0lT+MJMWbfEA6DfJg9VWfJBci64vcN+x34Pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5LKcQCSmGSFWH7cFrHCRUFRL7czFDZ0JoEIiivjm0J0=;
	b=0mRqdiWtU109fG6TbKtLEf82Pnd1E1m+N6eNjZe49gQ7AOJWQO4Q9AWcSs3VfUmFg6mU
	 EoSue6LaExLAKTH4qkAt7lproFID60m9a/KihP631T5hj7ClermBbQlEgcBl7/utfqc02
	 wsZXrB6jledOfWd2drI3m9m/s2tazVE34izqIsjqdna4LQo8mp15IUxRKMCRUmOYfaZta
	 hcRMYJ4stSZ3uPTL1lWEG3mr9BbLFbHJ6ZWXURzsm83bOAswOUfB3r4yYaDjU/r7cerkq
	 gopF1kHkkga7x8morVfXdQuqh0eA3P7FbIeUv2JvUHPL3e++oZd7HAPkaBiEd2046QQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CR6kwwm1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C2D606A605
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96C2D606A605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CR6kwwm1
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb845433b8so55835e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795192872; cv=none;
        d=google.com; s=arc-20260327;
        b=gztld292fc2Fg481t/GmylYtU8S7CTZbmm34fGTmEyknRbGyIC2Zi+wqoCeNhgSAtq
         xtOWws0vej3/dBkmVM7aBVh+HPPkQa5hLuCAn2iKKlWg7qSrrY78VYU3SURODJD6dlJY
         5o+YSBpQhqLFbHlrNWvcvnGoX3qPloiyXRxdXzKg6ECevKkEp5dFZCEvWgJbF+IFTDJb
         ej91SQigu+2s2JlrQJFtSJYYwrI8yujf/FvsoZBMYG3pccW7OYHeaWS+ocZmOMSfXoxk
         2fQ8o8whPxLzK9+cNub0yBr2tZ8vn6rJWc/VI2OupExxR2xZcxFQiQAounn2WOuyZgUQ
         dOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5LKcQCSmGSFWH7cFrHCRUFRL7czFDZ0JoEIiivjm0J0=;
        fh=yzxYBRYNoJuCPa4eUPIYg+5J5eFEmOVWcRITDkfxBhs=;
        b=hbLb9JszwbaUmQ7SZqiW4hx8yPXMSE2stWM0cH4/nxo4KHJIU+FuOMpy+3k44e+2qo
         DeGMHKxlSx3xucjxSms3x50gp3k6VSVqJeHOl2wtD2x4bsAzu0CC2ZuD/5RED21hN1Jf
         scRZF3KrRWT/Rbz6hrvg1xEOZMnBmEijiNvjoSebbr/9BihxV06UcVyptU9FNqYsFaWE
         FctICbItMcOixI/qgQ1EhcvWqrMpfaStP9HTN9SNP81s7aCzdXXeTpAdRR1bokmOyTOd
         zOKSAN2V0UwcXN8+Bnaow5u/2imPYzaItdpuY0WOX6Xr03Hga8NFdtGB/yTxx+KqH8Uv
         /rPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795192872; x=1795797672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5LKcQCSmGSFWH7cFrHCRUFRL7czFDZ0JoEIiivjm0J0=;
        b=CR6kwwm1oHbSxVATbOmkl8qKoYaBhgBn5D9snZ0tnQQ3Mum6vvcKkI/UYRjN3sbMsU
         Q3lP7ctTQ8Lb7hgMXk7ZerlRr75y+f4aYQidLl6z3oJYiMaKDGK3/R7U9pbJ6Y0C+4OB
         UKhhnMEVyFTIgUtmL1tvROIZwAd2MQkwQFMbsoAeySbHFbwa3nzNeVShfEzrmGx/jv+o
         Tj4RmDVqM90h5lRnDknyA1JU+t8COdH4pwqC/b9DqLWfgwD/2mKyrQ9XeJCVEaIOuWsj
         x/oFen3mIU0fyVzeYnYKAU/8YM/lNctAhZmTQ6Lp/G+PeuM8bChEd+t4yQXKFCshyHwU
         Um/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192872; x=1795797672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LKcQCSmGSFWH7cFrHCRUFRL7czFDZ0JoEIiivjm0J0=;
        b=l/LyRep6sk0xSGmntKt60LzhvyiW9104hM6mkE/HyXIqeEPvOHobSa0bpTcdGsGXhB
         ifzumXLJPTwehZhQeLzkIBj5W3zYLWd19mWYlefgVwvL5S4iThu8rgRv7b74m8fWgOGy
         A6Fl2T0RjiwkCfUla569XE935c+uAqv0rcAKUw5yiy1vvVqDga2rnNI/mhAhw9PQz9Pe
         2/sFFsQr6HRqLR9hCDhZUamv83W5aN+7z2teMWmWl/seJ9keKjhy+0/FCzat66IJkVUT
         TgU8weDWZHDYxa+mh37GlKk9DZKJfxFTFcTM0SbeXS5grDYY+2YPstxujHaUGpMCOioJ
         AkGg==
X-Forwarded-Encrypted: i=1; AL+hErGZIPRKHWWUtUgfTC/W+DCt8SCIuQrTzR6XLBQJEEfuy7kkRlxOZfIXDAWrSTZdLywlR1nWsW/wDcaL7Wk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cA2V70URAzBO5ZVaIEAlg22D+LUidJStbbD/Dg0lpCNc4ZXsf
	vIW9zNKx1wRM3/EXQ7pXbfImjC8trqZSIGmqHQ2MJejeH1b1eKYZE3TuWio/CRTSI44CBh9oJS2
	ZOE/aLCNSFZCuoKRB5F2Pd7o5sXd8DAWZz/GR4VEZ
X-Gm-Gg: AYBFou0+WEUpjALnu/j4NlUcRt+hMuX+5Pk9xh0A1NxYB7hM7f/4AXHyYy1OE54QDi+
	UacfOBVSXmKEaj01EhoctM8Tt0L2YGAnnZIqQfNUE0pdT+HdpxmIVvJ2S7LTj9wtQYSyxBsQn9O
	w0CKIHxzJHC0CeHofkgvqk8ro9e62Rev7Dp6wHpHReYblwY2mgV/WGCFa9mW+bHqOSvyJrWbPyh
	e8tskdOAsreiYhGtTTNOGY+qPr/HLpO9QPXcNwDuhuAFq59xBmEhbQCsWRUcCvA0T4myLDB4Rh3
	7KS6hapgehN0wm82a38NtayYN5sc3OWqnxWUanvyFg/5ex/BX29aDF0CZEiNM6oA+0s8Pt0bXI+
	YsgY41JNv9wKiF2u1W7fAbKiEUtC3J41VzA==
X-Received: by 2002:a05:600c:3ba4:b0:4a2:bd1:a80a with SMTP id
 5b1f17b1804b1-4bb89619133mr1203705e9.2.1795192871012; Fri, 20 Nov 2026
 08:41:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-fix-rust-build-error-modversions-v2-1-1c2271cbcab5@gmail.com>
In-Reply-To: <20261119-fix-rust-build-error-modversions-v2-1-1c2271cbcab5@gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 20 Nov 2026 08:40:33 -0800
X-Gm-Features: Aa3M54oct8MRe9MZBWMaHsVotwxFhMb4AgWLlWpoCWN9GDOy9iSx4jSZ3IW3NJ4
Message-ID: <CABCJKufYm_PXLzoTSyj6jFjz9fO4hoUQT5eTqxofg7ARMg=2UQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: generate a symbol version for rust_build_error
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

On Thu, Nov 19, 2026 at 2:19=E2=80=AFAM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> From: Peder Bergan <peder.bergan@gmail.com>
>
> CONFIG_RUST_BUILD_ASSERT_ALLOW exports rust_build_error to modules.
> When CONFIG_MODVERSIONS is also enabled, modpost warns that the export
> has no symbol version and records a zero CRC because the build_error.o
> rule skips gendwarfksyms.
>
> Let the existing Rust library rule run gendwarfksyms for build_error.o
> so modpost gets a version calculated from the Rust definition.
>
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Reported-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1201
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
