Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112880;
	b=Wzi+D76+4W8CHmOLbeac1zPyyYIHlsBGFRqvr3g8L/Jw7322+AyYc56zVhuqlyGqz8I4
	 5mc+h8L7gZUAGiX23MKFicnpUSNb4QJwTuh7pICQ3TLxIwahZsJHz1oh3HuunrzEK6Ki1
	 yBuDJxvlLs8wEBhUeRv0kLPi3NCvOz7luc6AJFSfmC4j2bVLX3AhrLdIheRcqD019agzL
	 MX93jhbCAA7WP+7XXhNTa8FNw6bkVs8aF7K4mGFDgdo+5zPbm1IN06X05TP7QvT5bA64r
	 0p5bNNus+lLKwrNVUVYOYhPRCH7d6aEQ6ZK8bu0YaILmcbFYF9AgNotf6zSKe5OIt5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=opf8wxnVBoLGvaEjdihrvGe/7NQnYFEui4ZmHkpPRHw=;
	b=nYC24EmjlAPhV8cSFlgCoEyPKeGiG0FDgAMmM3ieWzwXN3SVx706L6g/JR1Y3WbHQPSE
	 AVBroy5qLSK69eWfgw6axW50XZR8GOve3i2J0z997tqdsouYfXtGJgG+D+Rwbp04GyPRR
	 vylH8nzYY2G3sauG6sK6Rb8i4+I+mlc7uufmxzc4+bpK5d17Zt8+Dg+UQsfbKGwqkmd8m
	 TdNfMyohhuCcq0uLlXnp1m8kQMhj0ERpxOIRFoeTfuZFvZaR3qYWZMMs+nsRnh0pAhYdu
	 SC38iHkR9q2o/RpkWngAX/U4fFTJiaaSeT0Hk2rPkQUlEA8ccWGAyTKYCq3DUncg0Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=MKDXERw5;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF2D606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF2D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=MKDXERw5
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso11999066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795112877; x=1795717677; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opf8wxnVBoLGvaEjdihrvGe/7NQnYFEui4ZmHkpPRHw=;
        b=MKDXERw5gQJ7neRalqYsX6rVPTduFkVtjvlzGscrtTzxp5CJewAbD+0QPpT2AAPCRn
         tkNWfdDpM0O5ZBoS44X7Pk45csHcPEE0VKlFxpO3SxijGy2C5/goTFsDN0JW9IlDoXoz
         6IZDSwJAfZJ3CMygvLf3m5mnhxxe9YXTNdMjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795112877; x=1795717677;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=opf8wxnVBoLGvaEjdihrvGe/7NQnYFEui4ZmHkpPRHw=;
        b=AkQHDPw8BUMQFOC0PZqkyPPILTvfef7QGVdUlIYm6rQZmSJyL4ON/lT4E/kPpbCEY/
         iqNAfdqbB731jPvNEbV6132+tFeEOBqHmE0XVnPA0ruFlMZWVmNe2HAXB98KpklzVprq
         xIl8tB1KE8xGf/sxC1I2hUKwdoXi/Opb7ckIKBjsbvOzpD806jaXLzaCXBQoBgeOXtoG
         OlfPyIA/OgVWuFJsvkWTCk4XJzxseKhEjQ/OwUrdU8mMZA23WKFvVZwkF6CqyfVjq9QJ
         c3QPKddRR7w3UlEU5vJjI8mJw75I24UU9KCeOwWWzCnoFBKThAu1/GBrrABRU75ALFG0
         UjMA==
X-Forwarded-Encrypted: i=1; AL+hErHwE8DWgSUZrL4xQnDkz8lQ18Z8rKKBIEcPpaeaBoqILfCXwd1p8lqfdHuffltCXe2E1bh9zKmiLIoFlvg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aIcQVC+DON3Pwztsm4saTVic8HYHlsDlO9oHXJpoO8TAYCEP7
	SBvxldL1sipD++m19+JXVEunJ4jQ+igPWqMDacnUlT1rBESFBtObiu+gieHGmEhUuPgG8sxgZeu
	uIpQSmgE=
X-Gm-Gg: AYBFou0JJ0LFqeZzFBaFqOKPvyWmvqb0EPwjeYoyF5MeALe+GPe7TokVPxiG1APGUKn
	0CbHE1BXiduzBjEzXhe36M88RfcMRO7cWVz6dk5wTSvry7gDvYlK2bElZNvadQ7LCnpH4XIJdwk
	t0ISoQJ4K8fqXCE80wc6XXNR7YJ45Jz9c6rR/OldS8kV3i48x6J3gHe1pJtYvOBOwmj43EIKSEQ
	euq4PFgOx2sqll60RhdcNWohqXzIw3fcaCzrjF7158gSdnJ7CQ2dksi/JH9J4baq00Lkm5uLps8
	rFQyR0IV73bK6Rfys9LQDg92T71T+ovmxkDXv+DVPQQEV5O/f7bDEYpujyoH/8cjIrTo7dZ3QiS
	s//amTHNBXKqnnJPmLleIxdooOm6wl/Zjgc0Er0axzABVwxUmX/YhU6osxpq2IJJxkTC8TI22kG
	NL0T12VORrmK6D12dKObaF27wnq0XduVbGLj/NixuhzFhRS6oH5b0chFevpT7zn4siYgYPGG20w
	5OdnLcPRkivPTz6vnUVZfNeE9nRcbPcEaraoOMK1G8/yQxrKErNdVjj32O53q5unr1StGCle+Yz
	zFn3qXt6vOVilUkbgfJHKO9rf3VcwOY37lDqxGcgArRRHRxVsYT2mzGmDawovkW304fGqMd/REu
	wuVo=
X-Received: by 2002:a17:907:2d13:b0:c50:ca93:19a0 with SMTP id a640c23a62f3a-c513aab9bcemr79195966b.40.1795112877320;
        Thu, 19 Nov 2026 10:27:57 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea28f4sm23230366b.33.2026.11.19.10.27.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 10:27:56 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c505186727fso11419366b.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:27:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGH0Oe91HkJqrwKaR0Jok5zti1jCl32s3p7ngV9N1PKc/+DGfqXx9Ug2+FXL70cclEpkb8I1XzQ8YKSca4=@vger.kernel.org
X-Received: by 2002:a17:907:20e4:b0:c40:9b75:84af with SMTP id
 a640c23a62f3a-c513a5ec7cbmr61007766b.8.1795112876211; Thu, 19 Nov 2026
 10:27:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <4002a78c6bf1fa4fc96d089bd6a704bf77e2e060.1794867767.git.bvanassche@acm.org>
 <20261117080621.7ca022dd@pumpkin> <fb66a344-b688-4660-90e2-018d31c2a482@acm.org>
 <20261118121338.51792d61@pumpkin>
In-Reply-To: <20261118121338.51792d61@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Nov 2026 10:27:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg_njGtSQ3qCmPW1P2OWOc-74zt7G0BxOB2s1+4SnAgTQ@mail.gmail.com>
X-Gm-Features: Aa3M54ohNXOdzxJ9ZOFtV-saBkTM4VbI7PhjLzWzcAOVFIP3EY8kidZ5y45oOvw
Message-ID: <CAHk-=wg_njGtSQ3qCmPW1P2OWOc-74zt7G0BxOB2s1+4SnAgTQ@mail.gmail.com>
Subject: Re: [PATCH] compiler.h: Support 64-bit bitwise types in is_signed_type()
To: David Laight <david.laight.linux@gmail.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Nov 2026 at 04:13, David Laight <david.laight.linux@gmail.com> wrote:
>
> The fields ought to be u64 - since that is how they are printed.

... but then the actual tracing side would be worse and either require
a stupid and incorrect cast, or actual work to turn it into host byte
order.

So clearly the printing side doesn't understand about byte order, but
that's a printing side issue (that nobody really cares abnout:
big-endian is dead, and good riddance).

That said: I think the right fix might actually be to just allow sign
extension of the constants 0/-1 inside sparse for bitwise types.

So the sparse warning "cast to restricted __le64" should just be
suppressed for the values that bitwise types already accept (all ones
and all zeroes).

Because all ones and all zeroes are by definition fine in bitwise
types. Bit orderign and meaning doesn't matter when all bits are
equal.

             Linus
