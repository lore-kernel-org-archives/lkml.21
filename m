Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045362;
	b=0T46lB1DSW9XQAl1z5S46+GJac9xJjdUq7MUaS8zaXF0P+ktyQAwBwBJRQjYJH0ekNYq
	 orUaNmFG+3o1BgtJR13GAwztf+/N2SWKJFVOhXZ4pjb6rEUVV8q6yDFXglNHR8UpHOPnj
	 bgB7VNn7CdYLkGR7N1e0881zpC+BglIOa9KxhkJwms8/DyOQirB8YwHYOyLh/XtCOChok
	 kJus1cgL7v2gk7QVv0j9qX8NXw7jOcS2iLnwAaBJqQUdNK/aStUQGt388iExCg465DFvi
	 +L6ua9/PISUgIz8ooq+r8T08B1iYIEgyPSRDbougrLWRlaQ5deigOmnfGGQTUWbJBpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=5gmN6H+RSfew5cKRkkzfR78AcJ/HC4QuJ1A3RJGQZBo=;
	b=EjMj9yJAuw6vjptH9VVOIChmmF4/0dTYo1p5NFjv0ansiKL1mCW+MpeiyiquVuiX8zTH
	 whwJoq91hzrnPQNG30bq0JH8ahhrVIrnhIlliDXhPNdM7dzBlSCvVa0TAMEuIZAc2WEFe
	 C2yD2g5a+zTv0Q6E36yYh6+jRYXtGx6tbgBHfTVJKMfFsxGgSF9wdhGVU0aeXz7ArAo6/
	 Uegl7BC+xCzlWK3YFL0M193tPqxL85MQdv1yhLrpYkY67VSe9NHF6OX2smevyoL8GviKV
	 +iNnEadPwOjqy8wAPeelIhy6BRb4e4xrErzfzX92RgptybEGVW1TSCytwO6xwPbDliQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BVaX+M0p;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869A2606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869A2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BVaX+M0p
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4f4095a7aso15266977b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045360; x=1795650160; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5gmN6H+RSfew5cKRkkzfR78AcJ/HC4QuJ1A3RJGQZBo=;
        b=BVaX+M0pOWvZ+HLMo3zTqBf5Q7nthDWVI1w7TmUrDgj2tC06qdVS135x5YyQ1EMHfC
         CQPKgDKVgI2wwTV13B8m+2WVSSXYR73RYzKkG6crU54g1Yy0fg/BID602IZ/kpCvo5zG
         vnEsK6/PyevuH4OBntCkIEu4jPdzTqp2q9ZPOgy+ar2JvVaFjWnbsfxlF2H6kGfi/Snr
         F4iVohsmvFqbEuzd5lOZERBt+Q8oPrGjGSs7LYyQoXguq+BrkFsHv+a1l+4CDyUjCDyA
         TLyldtRNXKSqMkmX4BMaEf0fiZiV1GrYzumClcoOu91XfeYKRePzPdEFganSegopWx4m
         0Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045360; x=1795650160;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5gmN6H+RSfew5cKRkkzfR78AcJ/HC4QuJ1A3RJGQZBo=;
        b=0Nc1qTQglHVS2GyYjhm8fVP3Vc5Dz7b2PTf6KjDyP4wGtxT/kGciYsdhvdHjZpggrH
         1L0nwtmJUPPm5Lj9pwDzv4s0EKjY2ya8HtaWbHDysZmQCuJjFm2GI0+sCEucnDc3PzPS
         hQw6pfu2NvIpULefGuc38bW9yYtNevfYnw9skCBomgUVhiVoiBT9EhWyGPzC1qEjG30B
         m3E4T4n5fB29UbLC7anVtEgY+1aRnEdgLQOOtEOG4ESLBg67bF0mO+tgnKwbTkU0UCAc
         skZrKatBTpkggcZ5tiHGw6zjFYhe08BzGsg+OtldGBB3Ra4Po3ccVtmpQzjZUdDBoWfu
         R01A==
X-Forwarded-Encrypted: i=1; AL+hErGl6tc4112GAlgcIxcoetd6fOx82k6P+J+y+24CW2ZqTzcYkvgUsqRMl/KD4Qv/huvrNqbcPsN/nFKyUx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+Lex5kyPwKfdjnOIHEEuLXZ+27tx9HbMbio9YSnOe3PphbALD
	5al/gkN8XtT+uS0Sh1N2qx9bflZPFRyenF9h2NrhzT29M7ZfPJSdnkCa
X-Gm-Gg: AZFdTZewsF5qfhpQ+20h+34sMr0MAHr5OiSNXYAObMbMurV5Nb1D0AmPKWZZbCPUuPT
	AbV62pLhRLd7uUORsol9EufklP4wm6y1WKhMuQH8BSjzVHqzIQvDFpxeSY3mHZfq/c9aymWbQdh
	2Ac28SPNInEnqg7rBohI04wGyR2ulUqcND+DNPj0EAkIg4QzLLFjEMdTgedEcsEcUMfQv1mYhD0
	NdjR+WLDoMZUzRo7Gdl6TQxIQ8XDk4ZiRCFFT19cSI/ks6m2qY2fnq6DxmQKL087gj7Iob4oNXo
	k6+0kAC9NaxVvsFrqQPWWdk3ko0A0IvXk+WY8k+VIVv5wqyc88fbgpPqXxLsXYJW6G6jrNWs040
	HAkNss9M3B1hypebOERhht7UNa5dWTQZ4CLFO+6HLAAGOCF0hva38nxKFA5Lh0YzMMIuxxd2rYZ
	udV/NRMQnAT2MVEAAik30Y/7BLXB81XIyBZADovdgvXZ8SmFuoQvF5ak6wyC5vQSjudZ/2EySwi
	mXS7YS+Z4TiMhLeODUYKx211E98IZRF12Lw4oyahsfDJEpeYFQMSP+stzVT1qxCfF0klQKmT69x
	jjDwIiphn0i5tv1WLdNoG30VqYNmhmhZQg==
X-Received: by 2002:a05:690c:306:b0:8b0:e479:6872 with SMTP id 00721157ae682-8b4fed09583mr22589027b3.17.1795045360439;
        Wed, 18 Nov 2026 15:42:40 -0800 (PST)
Received: from [10.138.10.6] ([149.102.242.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fdf1d0desm25041597b3.1.2026.11.18.15.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 15:42:39 -0800 (PST)
Message-ID: <650f89ef-9745-4f75-b254-80fa5ac4773d@gmail.com>
Date: Wed, 18 Nov 2026 18:42:15 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/9] KEYS: keycrypt: keys that user space can use but
 never read
To: Rodolfo Giometti <giometti@enneenne.com>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 keyrings@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Jens Wiklander <jenswi@kernel.org>,
 Sumit Garg <sumit.garg@kernel.org>, op-tee@lists.trustedfirmware.org,
 =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, Sahil Malhotra
 <sahil.malhotra@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-crypto@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20261118140421.584086-1-giometti@enneenne.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20261118140421.584086-1-giometti@enneenne.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jzPPC6cqPSJxGVQJoosVKqnL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jzPPC6cqPSJxGVQJoosVKqnL
Content-Type: multipart/mixed; boundary="------------TfokhGkQ0eBXMCucH70BiVLN";
 protected-headers="v1"; hp="clear"
Message-ID: <650f89ef-9745-4f75-b254-80fa5ac4773d@gmail.com>
Date: Wed, 18 Nov 2026 18:42:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/9] KEYS: keycrypt: keys that user space can use but
 never read
To: Rodolfo Giometti <giometti@enneenne.com>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 keyrings@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Jens Wiklander <jenswi@kernel.org>,
 Sumit Garg <sumit.garg@kernel.org>, op-tee@lists.trustedfirmware.org,
 =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, Sahil Malhotra
 <sahil.malhotra@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-crypto@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20261118140421.584086-1-giometti@enneenne.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20261118140421.584086-1-giometti@enneenne.com>

--------------TfokhGkQ0eBXMCucH70BiVLN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/18/26 9:04 AM, Rodolfo Giometti wrote:
> This RFC proposes a key type, "keycrypt", whose material user space can=

> use for symmetric operations but never read: AES-256-CBC, HMAC-SHA256
> and an authenticated AES-256-GCM stream, through a file descriptor that=

> KEYCTL_CRYPT_OPEN returns for one key and one operation.

I haven't looked at the API, but from a cryptographic perspective,
this encourages very poor practices.  AES-GCM even allows userspace
to extract the secret authentication key.

AES-256-CBC isn't a suitable mode on its own, unless it's combined
with a MAC in encrypt-then-MAC.  Even then, it has a 2^64 birthday
bound, so it should only be used 2^48 times with a single key unless
the key is ephemeral.

AES-GCM is not a suitable algorithm either.  If you allow encrypting
with a key loaded from persistent storage, there is no way for the API
to ensure it is only used with a unique nonce.  Nonce reuse leaks the
authentication key and allows forgeries.  Using random nonces isn't
good enough either: NIST only allows 2^32 encryptions in this case,
and the API can't enforce that limit.

For long-term keys, all of the following are much safer choices.
They have 192-bit nonces, which means that one can generate them
at random for each encryption without any problems.

- XAES-256-GCM
- XChaCha20-Poly1305
- AEGIS-256

AES-GCM-SIV is also okay, provided that you are fine with occasionally
leaking if two plaintexts are equal.  This happens whenever there is
a nonce collision, so with probability 2^-32 after 2^32 encryptions.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------TfokhGkQ0eBXMCucH70BiVLN--

--------------jzPPC6cqPSJxGVQJoosVKqnL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmr+N+MACgkQszaHOrMp
8lNdbA/+LXcNkxhaSmkBIlfaAw6S95byA9OavCx3gDwybKkdpBRsqEMuUDmi6Krv
sUsDLaeMdH3ar/BHBgzdRhYzWSYylQxAXK5kyk9Dl+eyd7ytersCCZOWNqQEXZm8
J2LKr4uL8732Pdf9nju8nULZYGbZMMOruowXjBaVMXexkB1+6mlo5Nlg2GWQi+tq
Hq9ZznN68KGW4g+4Tf1yUAVTrCV1il7GWH5B2NmiYoE+X7gXBAm/SN6AZFOBdC8R
9RqyWBD49MqMMo2bJUtpO4GYBp5Nq/mj51QZMQft/SuzJIukGVOgBZjs4tYc6Rzw
aYoqSJs44bHE4zdSItWMBMDMrFE4QwSZT9B79wJDYMc1XYC8GTEcV+A63nqID8Pm
cGeJ75QYBrQPSOGE8Y6JeniPKwFOHc+ZapobcMEZIo/e84/XsTLt3/WLlm92W+AK
b1B+kFVPbKu7aAp59KPE/6woXt1nWraeSJ2yT6kJv7nVlDTgmVjROCYIWx1z7Zxb
w3CLI05Dru/vR3Kfrb1qIwcExSnqHikSICBFrlCtcJ2QIXAe7q97XMUOtrG/r/tV
PhAcmfxf24npXFn3RhkkaT+XxqY891rJUHLUDfu1p8Rs8+QA+wf9ti+I/Ow0zC1c
TQibXKQlhu/Pb1CwVlGfg5OG29hOQEplCyaVjnQK5oPaw9O5NEs=
=AtsF
-----END PGP SIGNATURE-----

--------------jzPPC6cqPSJxGVQJoosVKqnL--
