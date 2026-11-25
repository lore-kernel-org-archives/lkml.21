Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650008;
	b=fj70ONh+nveJMUhhxhqx54tALAkS6zAeaeaLSYgYYr1/958W82Wy1yHdbm+IXkcCDRqI
	 otdbzaH8uIyWF3UdVziRoG+kudPc84vb5KTXvCoOx6ol83YW/wcB/fs9Kfof9VAjZM//c
	 tzewoOfHQrQCm2c4kb71yWy1Kn/ksMVjbiUzVBSgSHCLq3r4Vj3d0p9+YmSw+vjbhaL+R
	 /cC5zLwKe5sPEa2AheabFyfBUDF2W6nVX/Qdnn2mH2RyUk5XUpGgd0RtCsXk+RGyfL7wB
	 pcAkzPnt6AP+r78RlxT+hL+OIGp0Kwv64fz589oixxJbMYavdRdboOQBgrq5HHukh2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=kYQevDMgd4nV63TUt1qQ6dj7n6DE8YbUq5s0sfO2cZY=;
	b=H7RtlGtggsrpY6gwWal2WQFnfWXWSL3l8lDPy+UKcwAHojLstCJGYVsE0dERZ58Na9h7
	 6yEOqzpCL/2sQ3802o8u/nsYetzUH4U8nPCxvFTGXzzx5Hsle0zg0VGrgo6Uk7E/iN3Iu
	 dA3g7v3B3MkdsYNqRcaFs+XpFN0LRIRs84QoWpy++7tO6cpMsBmlo0bpMjOHiJoagNjtq
	 rMQy5PIpxufcBp252JnBLDXhwVIAoJMVSPml7Ela55+rZsoPwimtly9aPrYpF+mvPNEwr
	 9DihfIz6SWXX/bdLOmAwklH/3+fm74WrWUwXTdUPsfu2YkEdw3pWi8z0hN1cmScda3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2FzBzNZ;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3C6606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A3C6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2FzBzNZ
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49a92144733so3161161f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795650007; x=1796254807; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kYQevDMgd4nV63TUt1qQ6dj7n6DE8YbUq5s0sfO2cZY=;
        b=v2FzBzNZYZD0Sw0ae+xQZHhUn/h9qCDu5Xp5CmZAXcbnhJlIDOVsAXStAkGP02sSQf
         47TRCel4gPcR76VFcIXaqdvD9onhUthkEyWT/ncQM+TWDOejSK1d8tzux5nuSSMsTU8C
         kWwzT3PNwz2YFQcs82VVsoUqpjOudeV2qdQpdqcEC6rpoolifxh+y/dmrtosjw9jZ5Qk
         wimddvXmQE5EZIoa34WR3Jlpzn8LbusV+II49OasSRrN50JZH3sIeLcbgJMRv50hUmkf
         kQmLBTu/pQWWi25et/nkGg9COIS2cxIiKp1xA0LGbDUZNLoRifhLCvPqFnXErmGfl2Gr
         U2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795650007; x=1796254807;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYQevDMgd4nV63TUt1qQ6dj7n6DE8YbUq5s0sfO2cZY=;
        b=K6TN8PvSVUDG7p1fkG4wGdY8M2xQNJAetiFaRO5xnATdLuirDDVrslH3MsG8yejZLy
         DfYewPZBFCysq9PQ49zLaFHqtLX7+UbwZiG3YUQIKdpPauG/Uskb//rgRBLxeYXT3mGB
         xD9IobvCPoL5tj4ZWrlYpVIciFm9jl0zGwR1jFVbW4RE4t1wUhJaK0s4vwsNyl3i8Gcf
         Pdm1hvEnvTPDyfEZglJh9O1B90mvLotMagmMt0QcRZcwZ0UV2V4Z6Ix1XWwn3lm1anAP
         h5eUcEy3ueSwJCmNuupnHN8BGu1nQtDFkJxv6xZdTAWMjZzFEvNELX0LO8rZxetMNal+
         I8Xg==
X-Forwarded-Encrypted: i=1; AL+hErEJmhbocPqKSR4M+HOiuSGerZEGfaIdeOpbEqWlUmHi3zAaR6THFSPFajyTBOwzspGy+sYsD7pVTiFZ7pM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/45sI2j2O0Hs6vj9FWj9W/Q71oypEEBAFTOPrFOrB3AfYliKU
	FDPcO/yFsjnDn/+2qvGGjVNKiuhcwpe3s9M1sVU5A2slNAM+tSAQDXIS
X-Gm-Gg: AZFdTZdrz/2mJpODKPdJuQsaO9jZJ5FKFJLRCG7HBN9m46f72l8wL6GYa02cjrEgZaA
	TJkdnooYW1SZHd7KuQ1fA5R32P3hNYFUyZUINSqy751XDb7hbAXgL2hVogbT1Cm/HTk1n8vSGtt
	AWMxhbMwNpDanOee+/GIJTlCj/Ykzex3vBgPxL5XZbhgAW4VhHUB2vs5hboczNpkwRPZimikrf5
	9YXBv7nOxnXhGRAyQuyeVqzrwhGp2zmem5HalpfXfnA3jP0z9Q9RSrJu7LMRFiAg0QLmLJDL2Is
	lgtlUzISobkoKsNZ4PhiEMxliO7/Un7MCqrdEvSgwQZcpnGysiTPWK16fByQsluItfxUGGa+CNv
	wcMWPNvDbpdVLc8TOYhMxDLniGXeZ4PpSWNtm07lPefPvRhmDYOgw2lYug04RaVt8QVevhJfZGA
	3qwS5W3oqXQSA186WYkbazRpa3WGmVJWswvPg2xn3n3p3vCWKdWDJWg3PhUMI4mAt7mv9YBAKIN
	bd4Vz+/rgE+o28wex6xn33p7y4K739bmscJQWtUBSHik/PAEwtY5VpLyg5+25yiYcUIV9vuPmHo
	YlovnQ+Zhulz4GW0+LuB80h+bAgLGJ9HeTrq8avpZiu+XSLLPQV2fOhUwsbz+UDhjBkpTEBebve
	JMi5HRAIoQTu4+N7OJg==
X-Received: by 2002:a05:6000:4813:b0:490:2033:1477 with SMTP id ffacd0b85a97d-4abb917a9eemr34174451f8f.56.1795650006473;
        Wed, 25 Nov 2026 15:40:06 -0800 (PST)
Received: from [192.168.0.41] (bl22-190-205.dsl.telepac.pt. [2.83.190.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm36478394f8f.10.2026.11.25.15.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 15:40:05 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <eebb7d7d-48f8-47d0-810e-b03e47929fcd@gmail.com>
Date: Wed, 25 Nov 2026 23:40:04 +0000
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
Subject: Re: [PATCH] kconfig: warn about malformed KCONFIG_SEED values
To: Nathan Chancellor <nathan@kernel.org>,
 Priyanshu Singh <singhpriyanshu9838@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
 <179564821041.3369856.2083626361406656618.b4-reply@b4>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <179564821041.3369856.2083626361406656618.b4-reply@b4>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c5HntaBRVjPdisNjAnoBfb0c"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c5HntaBRVjPdisNjAnoBfb0c
Content-Type: multipart/mixed; boundary="------------N1B0s7j0n7AdZMYFuOHkCOmu";
 protected-headers="v1"; hp="clear"
Message-ID: <eebb7d7d-48f8-47d0-810e-b03e47929fcd@gmail.com>
Date: Wed, 25 Nov 2026 23:40:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: warn about malformed KCONFIG_SEED values
To: Nathan Chancellor <nathan@kernel.org>,
 Priyanshu Singh <singhpriyanshu9838@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
 <179564821041.3369856.2083626361406656618.b4-reply@b4>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <179564821041.3369856.2083626361406656618.b4-reply@b4>

--------------N1B0s7j0n7AdZMYFuOHkCOmu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/25/26 23:10, Nathan Chancellor wrote:
> On 2026-11-18 07:15 +0000, Priyanshu Singh wrote:
>> randconfig parses KCONFIG_SEED with signed strtol(), causing several
>> validation and cross-architecture bugs:
>>
>> - Artificial constraints and portability issues:
>>   32-bit seeds in [0x80000000, 0xFFFFFFFF] and values > UINT_MAX
>>   are capped to LONG_MAX (0x7FFFFFFF) on 32-bit hosts instead of
>>   matching 64-bit host behavior.
>> - Whitespace handling asymmetry: Trailing whitespace leaves
>>   *endp !=3D '\0', discarding the seed in favor of gettimeofday()
>>   while leading whitespace is accepted.
>> - Garbage handling: Invalid strings (e.g., "xyz", "42_foo") fall back
>>   to the clock seed and exit with status 0, ignoring KCONFIG_WERROR.
>>
>> Switch to strtoull(..., 0) and consume trailing whitespace so
>> whitespace-padded seeds are not discarded. Reject 0b/0B prefixes
>> explicitly so C11 and C23 builds behave identically.
>>
>> Emit a warning whenever KCONFIG_SEED deviates from a canonical unsigne=
d
>> 32-bit integer, and exit(1) if KCONFIG_WERROR is set. Otherwise, retai=
n
>> modulo 2^32 truncation for parseable 64-bit integers and fall back to
>> the clock seed on unparseable inputs or ERANGE overflow.
>>
>> Add regression tests in scripts/kconfig/tests/randconfig_seed/.
>>
>> Fixes: 0d8024c6ebad ("kconfig: allow specifying the seed for randconfi=
g")
>> Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
>> ---
>> Notes for reviewers:
>> - 0b/0B guard: Under glibc 2.38+ with -std=3Dgnu2x/-std=3Dc23, strtoul=
l()
>>   maps to __isoc23_strtoull() which accepts 0b/0B binary prefixes in
>>   base 0, whereas C11 stops at 'b'. Rejecting 0b/0B prior to strtoull(=
)
>>   keeps behavior identical across toolchains.
>> - Backward compatibility (KCONFIG_WERROR unset): Non-canonical but
>>   parseable 64-bit integers (whitespace, signs, -1, or > UINT_MAX
>>   timestamps like `date +%s%N`) emit a warning and truncate modulo 2^3=
2
>>   across both 32-bit and 64-bit hosts, while unparseable strings or
>>   > 64-bit ERANGE overflows fall back to gettimeofday().
>>
>> Input                   Pre-Patch (64-bit)    Pre-Patch (32-bit)    Po=
st-Patch (32 & 64-bit)
>> ----------------------  --------------------  --------------------  --=
----------------------------------
>> "42" / "0x2a"           0x2A (quiet)          0x2A (quiet)          0x=
2A (quiet)
>> "0x80000000"            0x80000000 (quiet)    0x7FFFFFFF (clamp)    0x=
80000000 (quiet)
>> " 42"                   0x2A (quiet)          0x2A (quiet)          0x=
2A + warn (WERROR -> exit 1)
>> "42 "                   Clock fallback        Clock fallback        0x=
2A + warn (WERROR -> exit 1)
>> "-1"                    0xFFFFFFFF (quiet)    0xFFFFFFFF (quiet)    0x=
FFFFFFFF + warn (WERROR -> exit 1)
>> "4294967296" (2^32)     0x0 (quiet)           0x7FFFFFFF (clamp)    0x=
0 + warn (WERROR -> exit 1)
>> "18446744073709551616"  0xFFFFFFFF (clamp)    0x7FFFFFFF (clamp)    Cl=
ock fallback + warn (WERROR -> 1)
>> "0b1010"                Clock (C11)/10 (C23)  Clock (C11)/10 (C23)  Cl=
ock fallback + warn (WERROR -> 1)
>> "xyz" / "42_foo"        Clock (ignores WERR)  Clock (ignores WERR)  Cl=
ock fallback + warn (WERROR -> 1)
>>
>> Tested via `make testconfig` (40 passed).
> I am pretty ambivalent about this patch. Most of what you bring up in
> the commit message is in "who cares" territory for me personally since
>=20
> - 32-bit builds are going to be pretty uncommon nowadays
>=20
> - Fixes is over 13 years old and it does not look like anyone has
>   noticed this in practice based on searching linux-kbuild
>=20
> - The documentation states this is just an integer value; if people are=

>   plugging in arbitrary values, that's on them
>=20
> - Most people are just going to be using a previously generated
>   KCONFIG_SEED; can these issues happen with the default logic?
>=20
> That said, Julian and Nicolas are free to disagree with me.
Sorry, wrote up a whole review on this last week but then fell down a
rabbit hole with another series...

I do appreciate improvements to input validation for Kconfig, and we
recently took a similar patch improving KCONFIG_PROBABILITY input
validation.

But, I also agree with you Nathan that some of these particular bits in
this patch are just not necessary to handle.

If a smaller, cleaner revision comes in then I'd be happy to give my
R-B.

- Julian Braha

--------------N1B0s7j0n7AdZMYFuOHkCOmu--

--------------c5HntaBRVjPdisNjAnoBfb0c
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCawdx1AUDAAAAAAAKCRDElYPCBXNxII2W
AQDCRm3ZTYDGGokWxIvnTop4m9dEXBmUkbwBsd9iEowCagEAznn+8+OZ1WGpNhGdSiCIXJylmKoo
tpmsCzPVE2/H1Ag=
=TYh0
-----END PGP SIGNATURE-----

--------------c5HntaBRVjPdisNjAnoBfb0c--
