Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795210300;
	b=i4GsqSI3SYPyf3BPwYUmZsVikK0iVTe9tG5D3XP7Cia7tcDUbS4Vp+YLvHUZYAGoI8kl
	 HO1oSVEEN8INu5X/5fifIGS1rIX5nDe67a8PEKRsxQyw/O+QgiTuAqPG00+QxprEIKMGR
	 FKGKdbB9F2njxleYUJLxbgVlsSt6fuBvIywZzE8/xLLWdQlWElafOtlT5eeZ1JeVb3Cpa
	 vnAhNFXjXLGQSJ+2VsQ2fnlLsb2kpvbB8zWt/NHLd7EaFgjS/exQ3hg9dd+bsSvM6IQJg
	 6TpO69+UrBVEyvVTRZKhl1a4vhhMicdeeVa0tGx5McP3ealTJPyp33V/KYVxNh8QkhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
	b=VtDim646SV03bJFQrx+btEGqfaC8i31owx/WwqGpjwagyHqDmKdNFMogtDuwVrTArfWF
	 Tg7KCif5iU6F3G66q2zfPfF1i79EE2/9fe8jQkWVAo8PftUpbWX7Id+qh41GauKNpiHS2
	 lfuoTqSxMWqHVCt6tuAYcebAbAAKDOItp7IF21JaxbO0KTSPai07voyI1zgsoWXFo6ICk
	 sh9i+aQOTEf5ZlvmdQeafrc3EEn4AwsPZfGIqbs3Znk39FEVoNmxKrmL8vjisi0HvIwN+
	 myWE5zDYE2VOhVNVP3/XZqgKU6tTG7QtxBS8HQpPasxe/B2iMfe+xsdoSZVOzEqe0JQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owhm7wLl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A794B606A682
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A794B606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owhm7wLl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3adfb744fa6so1226471fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795210297; cv=none;
        d=google.com; s=arc-20260327;
        b=qXTWOeEYvZ02sCRtH7bUgoRQXwm4VX1PAtYuWI9WPKIHYZU+bZRFM6YQ0RaCmDWU8I
         NkTyTBy6TFZvU37e9An2gOSHvsNQpOudiXuOa/yD0GQiunKaZI5DI31fTt3+WIvlwdlO
         N5C0iRO4vy6UzxVK9mnJ9/xRMJmoreX6ysE6FAhfjQx+xpUxmmq81gsn8jtmvyJNqXYq
         jDC9IfHzrfsYZRap3RNpvAyYlfYOjkQCJDqszNN69hSbmWfU0dhXDEAM32lh8Q4iA9is
         Ht30TK930mabpeUX+veUOpZNB7sLs11dJ8nrXxfMSo4kUfab9IsOL81Jz3nzt5N0zpU5
         pirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
        fh=geomNODHlyBqQBVBpJVro+UN485yZ/jUTk58liQOJHU=;
        b=LOHaqdu/QHNKyFxQ+1ACaQIhPeOiXii+kRbVlhJdWdOfwg1EFOtlXbDeYABDUlHDpB
         bYteWdLzsV1dZhE02jSb+zoj8ndXHy9fOus+uafHwaeWLEgxzrl6AAnRgQxo+Shlh34K
         2CYJj1zA0G8PQdFfE8jlGtdFLRXyAjPlm1FMGkaCNOZPZk0tGFu8eD2bInfX9eeQBRcu
         2pmtA570d5Gu/1mBw6i4dc6kuSMsax61YTSLKsQhOIJXKIdJsev0TeolD+tfZ03cMOR+
         UNki+ZZf369KOKKtiv4ZZf2s74N70f59gkm26Br3DcpngaD49f6T6iqEKR3jxlppjzll
         4wVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210297; x=1795815097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
        b=owhm7wLllg3l9s3Ng9CV1HrjwLj04k4mew4+Il/Z8w5k0GXizWUecYujWL4XpHDtMa
         eS9MRCtEBZwwC8OdUWFwKPDTIlDgdFLHLZUfue/yq/USkW8/TiW1ko9/CoxPtSxP1A9D
         D8MSFcWmlq6iHfxe/N4v0YRGxj23N85NQtLSVROCDnIzR4Uv318mpVWcVMo7jrrlABYt
         YjadBn6OUuNuIFRnWiaLZ5X/eKMo7W3sxO+bCCWoKuFkljemHmv/yxy6hv/IR4N1kz5O
         L3UPxcjApzNrfzj6wR8qTA9djgxz/M4AodemmINAcWB3TwhsliP53LE71qSquskMkxGi
         21ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210297; x=1795815097;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
        b=uqD4EH3GjpNO+/C5AzPWTLLz5D6mPsCR7baO2RikezLJyrgX/wTfObesmly5y4FWu3
         7NcxlwgKZ/fp0KOBHBteknVePKnODywvLdIRiJujtoSuB6Z1xf08KcukEgvT7WMh/tw5
         zpw33nsiQA/izol/1yABQr6gFFaxlm5J46lEl2Uy/vuZ+xRH1On9TEW2OWJoRdNIbe+K
         Ex4jfHLkjiZRKrCIDdrU/gjxUgXdxj7l42GsEyblSxLTGEb31QPIFQLUbojeccWDf81r
         urmZb2FIEudTLFTPFle0slBd22m0SlqZhPB4/DeiieTcl/0R87KTEOmLe7VoEgdji1/+
         ZwwA==
X-Forwarded-Encrypted: i=1; AL+hErHOkjcInfsVJP+7ukBeHvb+IX1qgPvqhfz2Y7Ge7kjOjpb0IHVebz2HyAMHspo3OMs9H7Dbqt4C9lsSd/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qfw8HJxfTJcKLmMQ7eJO5v8M4nNdIZO6xzW7oqGfx9+qwvWl5
	hrUaRPjDWcAPHVp2u8Pl//vyJ5jW79KYsx0i/z8v+HnEzI44HYc2feVrD7gwLNrCv7hlxzX/aQB
	VaRH7Xdxm4m37DQZk2QcuZrFbAOCCw5g=
X-Gm-Gg: AZFdTZd7qNfBsu0RtJlcG/jbDB6RBngww0u+Gt4DCDvvsvu+sSjdW+WB0fEK0xQu+/O
	gg6qs8ROtavAkTZJ2xPTBEBj7sCaz7m3YBM6wLrKcOjQ08RzdYwaJj32GduKS10ughLc0ViJWQh
	CDvF23S74wwu2m9ki9BboA19kjXwa6cEfYNNiqL0JUUgrgyId/wXfLhu0sklnqRqUUeVPW7/Lrw
	3R8LfaDlA1IuqPLLcgFQgvfsWGjUJa9QEbGPCkbnmLjIQ3jCpE8P+FXUiFCq5XVhXbh18jMUPBV
	AoNdQJuAq3TIiqEOd81wAt8IHvaWja2l0fBw1DlPkcdzdzOkW2seGA8ZspfTTkyp73f895fl0S4
	VDEf7+VGX7PEyJHzbDuIwfZI5yqoPB9y5qqszV0a5qccdsnLKlMh3EkxLsy3zrigKBf+d4FmiNK
	P/gH+E22YW4XmpOoTGEQyBUl5WGaBrejDy5BvWAe3ZKRPJJX7bIohKSH/0hiziR4A5d7ynoQdGG
	m7D8PSmHxBQmnLu4r38fhz5+50b6cF65dx+GyJyYOS0pPoYRNmvzDCnEOVQBuHF6hr79bZt
X-Received: by 2002:a05:6512:1320:b0:5bf:cf6d:ef1 with SMTP id
 2adb3069b0e04-5c1bc5767fdmr1687437e87.0.1795210296624; Fri, 20 Nov 2026
 13:31:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <1a1cb87df11.2c57f9fa237371.844135553238709982@collabora.com> <179519331840.3795820.8047048832159165355.b4-reply@b4>
In-Reply-To: <179519331840.3795820.8047048832159165355.b4-reply@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 22:31:25 +0100
X-Gm-Features: Aa3M54o4i_zALBjbkgtOxZes0dCWZ4jiHPCTwn8GOTMZ7mrp5N06gIycRXOv0PA
Message-ID: <CANiq72nOKrAtct_eb7tjc9JFFpOQrN0=5bOyOZo1p4C+4U5bsw@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] Clk improvements
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, linux-pm <linux-pm@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-pwm <linux-pwm@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Maurice Hieronymus <mhi@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 5:49=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> I was wondering how the rust folks expect these changes to be handled sin=
ce they
> touch the rust/ dir. Should the clock changes go through the clock tree o=
r the
> rust one ? it is fine with me either way.

The clock tree would be ideal, i.e. a lot of subfolders of `rust/`
belong to different subsystems (the file is already under "COMMON CLK
FRAMEWORK" in `MAINTAINERS`). The "treewide" Rust tree can act as a
fallback tree for files tracked elsewhere if needed, but it is meant
to be exceptional.

(The files will be able to move to e.g. `drivers/clk/` eventually,
when we lift the limitations of the build system regarding that.)

I hope that clarifies!

Cheers,
Miguel
