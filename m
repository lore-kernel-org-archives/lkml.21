Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700909;
	b=KHTpW3U+nhulEzQ2djXfdxuvd82jaywVONXpduiYybTVWYzEHGJZUNfBL0pLoITLBYJx
	 8GZhqxb2SzxGuDIggUnHBd4dls1wD/wvhg84ZgPlbVdxZObB8v2vSlwrSYf9P35fmWgGB
	 n89eGbRPCjcbHyldIO1D/N+R/5UMhTgyYoUoyG+wes7cVTAOX3scp9BN84uazRf7F9J5O
	 X6S15VLtlxBMPLZWltaebEMClXsN0SOZA/H6T5nkkZbS6mJr59/fgVsGj5zI+d/31yvGE
	 PD5VPAc8ZAVUDZxX1B6kZaQKlxSlIhkjBOAm2KiOw4mWi5DPpcY27R6zFAU3D+HU4Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=VtBIJPjXIIg+HHFMzUuDZRNIJbDv3nZ6Kp6imhbfLPM=;
	b=Z7B0T9FPicVXHHM8dJesOlarEm8nUFRrU5Z4oE9ixLNZlJgsgUsvGPiDuj869n5oX5s4
	 br3Y6a4awjroGUfS9OCmEeG48/WnUC409K8HIFz61+CswtGpKpPWIzhR2UlGBcimPenBt
	 5Smr4NllevqiPc8bBVs48kE7eMqeNDiSqi6qKQc/LwD8h/sMM+kbukr7FJcccrFofpyWz
	 xqOTWmHxqcsHIsrwUepgCexrHIK2LUNksodQ3JyxHl1+l6WcenBsjUHvYlHIsKZpzpzMg
	 H3gMyH6sviBvQCrjpsBuJYZMu3x4E9e2Dol6xZWFkGilY2YEcM7uBz4Hx3eS4aDPV9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OQBpUL/z";
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7350E606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7350E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQBpUL/z
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ee27c9eec0so2254063e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795700908; x=1796305708; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VtBIJPjXIIg+HHFMzUuDZRNIJbDv3nZ6Kp6imhbfLPM=;
        b=OQBpUL/z+LIsM8xhyvJfSd26SnpwITX9l4cvtx2mpX2NkUSuWVKRbjhtC95H2Ndwx0
         SIPVAb37fNdmSYmSmppM2euqUf4jQ05xdDdYd7GtMk+aqD/LENyNhBClKX7BzyOCUqtO
         snE2f+a/82fzcF5ftLsvehKWh//Hu+URoeEAlzPqjPKZ9Z7MqfwiS++QstVKQLT4tonu
         zi8x1HXC+Qkmt7qeWuC4fOlUJkwcoYNklEBKIYB3W4ztl/3yN/jkp+IjMrpwyXtOY5QT
         P8iDNEKtvPb4JQcGbb9x2JksmupBgTUsun6xh2lZxVVKY97i8zAyy5OS8sG3Z+T9G/mb
         xRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700908; x=1796305708;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtBIJPjXIIg+HHFMzUuDZRNIJbDv3nZ6Kp6imhbfLPM=;
        b=aEYKCd2SpF5oPvYUU69P/pqvQB1TUYL9RpzrXRIUaPO3svC+qv9/EF2y4WWcg9t8xI
         rNLOEVcPA2sCpCd6fqxMU5XYdxY3vc+kitWAacJBxM+ne+juoyLjhlhuxXl+2WEVI+sS
         q210DmKGfOCTvBHsto9x4MbF4h5QVfWVAeaCzbx9Qs95sHud0EnKlaTIqOvSmnOfLewp
         dmFPfCu9f+rhfF5vspNLqfoP6Cz1GWdirOF3fikecf3aJBujg6aCN013T1Rt4WW+/umb
         5LUacBhZghndTjDjbvOPvbtD6tul6OolLaxhSpl2oP73I/KzxjkKaDZBzrD+f73jdaHE
         V5rQ==
X-Forwarded-Encrypted: i=1; AL+hErHlMhZs9L3iRGHxYI9J6sqsfm4lTwwo2z2194ApXcHmK2D8tnJdnC3UeOXoTeQhdyILCLsy2mEF/vtHA8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4eH6G4SIN7fuPHJuGsoZqZZGSU+dmWG4blZPf4U6gfWM2fxkA
	farqiFMLGCxY6eU9WvYFfBWuRzkqJqbNFmp1xgJP4nPDdqhnXu1q7kw=
X-Gm-Gg: AZFdTZfIcD8xZr3AqgOU6R082f/EVGlHNE+5gc93wsHeQKF+ZVuNMDcI2EMXWnTkflF
	Pkn4Z9nNQPIx5U0ZvNhf5X6u6Bh0c8d5c4CC9v8u4gXD+09vGLhG2XRLygRAiK2kIiGfGtvX30E
	IiWx3JalDniq4D72sjuKZUNRdYsLf66J3rMoq9T6ADyvi6yDdXGbFPdw1EQTb0mqYCqo3SacpvU
	a37BOyyPsaWzxZiqdSgyYtWRifff43B+de7Q2ehqCyL82hVPa2JLH622O+hpomweVhNq7am7oGA
	5Lf/Iryhwk7nY+1ABx8Bq3TGHxM2kENeWVGvBLUMMRgFF7aVh9oQcS+wzvaAbS0BuIo5iU9AykO
	+rKXkv3Bd1Uc/ceah7vPw9TMlymsNPyg1wbGkCbEgT0Mz+QxV8zTwiFTXFY1ouItwzsjdmgkwZt
	NIotqyfdECS2b6QSFK8uY644Yq2YmEyBShoN/5pI45LyvIcvKyCLuLJUMuqalPgQxdVDAKuo5UG
	of2lMH99ZRPHpv1ucXFCFWzYnZDJ+Q5n7DjWMAmAZN6RS4MLgYjpRZDFrCHLas4vN4ZRqYC12CZ
	Woi6IZ2qvCbo43/zX7kd6D2zDGSvPCRcFQYRtTFrg22xLgW2nLMTtD2uU7Z3Ve4EmA==
X-Received: by 2002:a05:6122:3295:b0:5eb:2a6e:d3a7 with SMTP id 71dfb90a1353d-5ee8aeeea34mr11674738e0c.12.1795700908379;
        Thu, 26 Nov 2026 05:48:28 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b555137sm20586545e0c.3.2026.11.26.05.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:48:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 10:48:20 -0300
Message-Id: <DN56UDHKNLEC.22J1K2RGIUUJ0@gmail.com>
Cc: <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <dakr@kernel.org>, <daniel.almeida@collabora.com>,
 <tamird@kernel.org>, <acourbot@nvidia.com>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <oliver.mangold@pm.me>, <igor.korotin@linux.dev>, "Trevor Chan"
 <trev@trevrosa.dev>, <vireshk@kernel.org>, <ukleinek@kernel.org>
Subject: Re: [PATCH v3] rust: sync: make AlwaysRefCounted::inc_ref an
 associated function
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Tran Van Tien" <7enlab@gmail.com>, <ojeda@kernel.org>
X-Mailer: aerc 0.20.0
References: <1795684556.6d661f19@gmail.com> <1795688552.31c01b07@gmail.com>
 <1795689815.75b422ec@gmail.com>
In-Reply-To: <1795689815.75b422ec@gmail.com>

On Thu Nov 26, 2026 at 7:43 AM -03, Tran Van Tien wrote:
> In-Reply-To: <1795684556.6d661f19@gmail.com>
> References: <1795684556.6d661f19@gmail.com>
>
> Incrementing a reference count must be a deliberate act, and every
> inc_ref must be matched by exactly one dec_ref. Making inc_ref an
> associated function that takes a NonNull<Self> mirrors dec_ref, which
> is already an associated function because the object is freed when the
> count reaches zero.
>
> Having one half of the protocol take a reference and the other half a
> raw pointer makes the pairing harder to review and easier to get wrong.
>
> This was suggested by Benno Lossin.
>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1177
> Signed-off-by: Tran Van Tien <7enlab@gmail.com>
> --

Hello! There is a patch that implement this [1] with some 'Reviewed-by:'
tags.

The last patch is from June, maybe it can be coordinated with Trevor
Chan or you to take it over if it needs some updates.

Regards

[1] https://lore.kernel.org/rust-for-linux/20260628100731.64885-1-trev@trev=
rosa.dev/

