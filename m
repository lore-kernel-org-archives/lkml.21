Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795862776;
	b=Jg8Om/UA3vv6yNy8f1gNuy8nnVAExTFEQNnUfbsgEp3wklZew2mCmfUvyedWAYTZo4uu
	 4/XjwNguF+sFzTGseGNQTfnmxqdUHEVdT8XQrprFvDLKTK4uDoLk0Ytd+gv7Cu57cPIHs
	 0kooW2A/rslF6e9KOGuIGt6J8CydD3Q3KU/qCBGBcGmB9IYM4R+zl7teaKwVS3ysYvRzK
	 6KSwG7xW7z8EFSCmHgMmztGgKUTyNV/WyaHbgXnXZP2fxuDlNOa+lc+eEQOn1nWDYxc5d
	 1rHWSslYLRMiHcbdkFtwKoCP4ubznJuuR7FblnrsaumWO902mMHKsmBWwpSSB3wKrxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795862776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=58a/+1zqValJNPe+f+fBjEPUXE4JHOS5ilKixH5EXsM=;
	b=Q4SLc5HA+h/opZypxkq8LhTNZmxZ8NDLRNGDiW0nzmPSw/5NyoNilXKIVJOxB1phy8jd
	 MdF0mQ846CjrTg9Z70VUDEGoSuHKpVpjRKKID65rdQ2vc8+P2nzvd7s9HYhu/8cm2x6AM
	 cE+ah+XF2SlXZdyQFkZFFGxO+bLvFYYNjMci7zW+LNl3sl+9gG9Rbq6HR5DqSrIt6dXWN
	 kybEPhdgtlOBD74Xb2R51i4hiL0V8nMyq0YLVHrV465kjTomHserZz9nVl7oDuDGJitLS
	 Kv584BSECl/0G2YbcfQm8u33wcohZPWbm6xHosQSB4HaRe/n3TsQihtQg801yvkgyIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qEjED/nH";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B333606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 10:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B333606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qEjED/nH
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso33722325e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795862774; x=1796467574; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=58a/+1zqValJNPe+f+fBjEPUXE4JHOS5ilKixH5EXsM=;
        b=qEjED/nHy7RJsOmIY0mw1cYEX8pVGsl9KiW9f3/puk3+BXAvRcvCUKHinRZrOYxMjP
         lJpR+A2rNIyWE/aIX6vnXXMwbIx/X89Uzo5SLso9vXn0HU7Rj7s80yqnCxm3kbdS5qVo
         dFOLbs9I39qgdnDAEFj5vEBCtcP93d4zvIcSDWc7ymCo3gxvchxFlxSIhUM4ZqPKJbMR
         1bwDK5C2+4IeVMTWvI2r87z+8szgbZjuqXQH+xCZihSvPQpFbmQ+UmQ+ZpyKIl8bKs3N
         pdMxISq+cWcvXHlHmF0rSad/99rYVMd1nMbe0hcuYQHQjYUT5YK5lbeQNDVpljENcgct
         As9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795862774; x=1796467574;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58a/+1zqValJNPe+f+fBjEPUXE4JHOS5ilKixH5EXsM=;
        b=X2vP5xqMKWrSN3m68f2tTv40LKCuSVV1nv5vjGMj9XzLq2sIARJ9esPD2geAF3dX6W
         egb0YH/rRI3PsjZPITrtVlsTlAj5ZYPDfkyhH7UmxjiVMGfMO5RwuCd7ISNbiPS+GJQv
         dtlZEc4Y+fjE65lNzlKyBBkb++pBihzjUL3sY7xxaGSOrr+zitmdeRr5hwhkJcuZecz+
         i8+j7xEN1twxMk7Y7DR47/THuQL+Tp9NsXPyncaLQ887hyC0nIjJsud4HSLdR8GfYVQG
         yRDDhXRYvvh9MtaOIYbvwFUxfjlfT1yAHWa3+dmOtvuuSkyWe9yxEg8AgtKmq1OkdmiG
         TG2Q==
X-Forwarded-Encrypted: i=1; AL+hErFZdZigAOAvpLjP9iLqDcL811n0SkaaegKc3EMLgfwobKk8M7ZwmPJGGd0Db8Jf1X8s/l623fB2ySM47xc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WBzjOs+NqBI+z3UKnu99SZ5c/nL6gCaIA3AON/Jk1Kumw7vP+
	eHPciPL6M/NO+BEeRra20l3QZYIpzyez6Qoq1yY+otNZp34cvd2kXmp3
X-Gm-Gg: AZFdTZcf8vvUzUlQ93ZA9mSoDY+kLo/TIhuY0gqV6x9eS2dTiMBZNJpIS5MWvuGFJVY
	hFVaXevZUZpxAreBAS5EZYazvc0/+pJlVRiVerWcavxlyyswI6atTc9uw+8nSEpDll3fgdVIiXk
	am57D2VUgF3O34KUHA7dj9pTZNToqEQgE4bW7651Wo5T19TyhA7xYgOb1MCZdnlVg8ROUuhnUfx
	b5o6hWaI1PI6tQ29NehranlcvOBPCtdnXufrIuS6W2sksjYZ8Cb7BeqbYES8DAtxdfrXOui2MuV
	W/17sqxhh44NhDV/1uFXuwiYDmUFaVxp7yng5HL0ZnOB9iDsAfkcpSa3p0nE/6HVKsw6Wbqkvi2
	DU+atKTcbItn3nX7dQ277YWBOnhyBiZQ9muUNPapcDJb2RIj7unNzlvDnukFCYXUjN904tGLlzv
	2y9HRXMaGYfV738XNxb/rpcd8rsaZ84t//Ctct6HFjqw2XqGyiiMS1lHsUR6erETCUJWUMPHPJL
	8Z2kFXIg4Jb78J98lDEHQIRCuPtjHVAsAJlegkvuYXpouuodaBjPch3vIHU8UEZNiDtsw1E8RHo
	ZO2OcivVg8bdQwjK0tVcPwOjuGuhSEmcXMSYSpoZqDZl6XGKwO6gMfHF9TWoeHGP3vb2RvWeOho
	BENBHMSwgsPMZpCEtCw==
X-Received: by 2002:a05:600c:19d0:b0:4bb:ac6c:de67 with SMTP id 5b1f17b1804b1-4bbac6ce1aemr163926935e9.14.1795862774223;
        Sat, 28 Nov 2026 02:46:14 -0800 (PST)
Received: from [192.168.0.41] (bl22-190-205.dsl.telepac.pt. [2.83.190.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm828517335e9.14.2026.11.28.02.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2026 02:46:13 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <fc17e915-d4d1-4847-a915-03a8d8daf55e@gmail.com>
Date: Sat, 28 Nov 2026 10:46:11 +0000
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
To: Priyanshu Singh <singhpriyanshu9838@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
 <4335df02-3864-4635-8429-a2946bd76a00@gmail.com>
 <07f2e58e-d576-49c3-a3ff-91e499d412e5@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <07f2e58e-d576-49c3-a3ff-91e499d412e5@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZSpO0HVhptVQBf1zPLRSpuW9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZSpO0HVhptVQBf1zPLRSpuW9
Content-Type: multipart/mixed; boundary="------------rUOHdxu0LED0EUWmKulj2rVt";
 protected-headers="v1"; hp="clear"
Message-ID: <fc17e915-d4d1-4847-a915-03a8d8daf55e@gmail.com>
Date: Sat, 28 Nov 2026 10:46:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: warn about malformed KCONFIG_SEED values
To: Priyanshu Singh <singhpriyanshu9838@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
 <4335df02-3864-4635-8429-a2946bd76a00@gmail.com>
 <07f2e58e-d576-49c3-a3ff-91e499d412e5@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <07f2e58e-d576-49c3-a3ff-91e499d412e5@gmail.com>

--------------rUOHdxu0LED0EUWmKulj2rVt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Priyanshu,

On 11/27/26 01:59, Priyanshu Singh wrote:
> Hi Julian,
>=20
> Thanks for the review!
>=20
> On 11/25/26 23:30, Julian Braha wrote:
>>> Switch to strtoull(..., 0) and consume trailing whitespace so
>>> whitespace-padded seeds are not discarded. Reject 0b/0B prefixes
>>> explicitly so C11 and C23 builds behave identically.
>> C23 builds aren't supported yet.
>>
>>> Emit a warning whenever KCONFIG_SEED deviates from a canonical unsign=
ed
>>> 32-bit integer, and exit(1) if KCONFIG_WERROR is set. Otherwise, reta=
in
>> Yes, it would be good to improve the input validation for KCONFIG_SEED=
,
>> especially to reject negative values.
>>
>> In a v2, could you make this part more explicit (add it to your bullet=

>> list of changes above?)
> Sure, I will add negative values to the bullet list in v2.
>=20
> One quick clarification on negative values before I send v2:
> Documentation/kbuild/kconfig.rst currently only states "You can set thi=
s
> to the integer value used to seed the RNG" and does not explicitly
> forbid negative integers. When KCONFIG_WERROR is unset, is emitting the=

> malformed-format warning while preserving modulo 2^32 truncation (and
> exiting 1 under KCONFIG_WERROR) acceptable for backward compatibility,
> or would you prefer negative values to fall back to the clock seed even=

> without KCONFIG_WERROR (along with updating kconfig.rst)?

Negative values should probably use the clock seed fallback, but there's
no need to update kconfig.rst for this.

I really doubt that users might read "You can set this to the integer
value used to seed the RNG" and think that includes negative integers.

>=20
>>> Fixes: 0d8024c6ebad ("kconfig: allow specifying the seed for randconf=
ig")
>> Improvements in input validation are good, but 'Fixes' is for bugs.
> Agreed that input validation improvements shouldn't carry a Fixes tag.
> However, on 32-bit hosts signed strtol() clamps seeds in
> [0x80000000, 0xFFFFFFFF] to LONG_MAX (0x7FFFFFFF), so half of the seeds=

> printed by randconfig itself cannot be replayed on 32-bit hosts.
>=20
> should i split v2 into a 2-patch series?
> - Patch 1 (with Fixes:): switch strtol() to strtoull() to fix 32-bit
>   replay of [0x80000000, 0xFFFFFFFF] seeds.
> - Patch 2 (without Fixes:): add malformed input warnings (negative valu=
es,
>   whitespace, >UINT_MAX, garbage), KCONFIG_WERROR handling, trimmed
>   regression tests, and any Documentation/kbuild/kconfig.rst update.

We don't really care about 32-bit hosts, but o/w yes: this approach is
fine, I think.

>=20
>> In a v2, you can remove the changes for binary 0b/0B handling.
> Makes sense, I will drop the 0b/0B handling in conf.c along with the
> corresponding test cases and C23 mentions in v2.
>=20
>>> +				seed =3D (unsigned int)val;
>> This cast is unnecessary, you can just do 'seed =3D val;'
> Will remove in v2.
>=20
>> This is *a lot* of test code for input validation of just 1 var. Could=

>> this be simplified at all?
>>
>> Is every test here absolutely necessary?
> Definitely not, I will cut it by half or more in v2.

Thanks!

- Julian Braha

--------------rUOHdxu0LED0EUWmKulj2rVt--

--------------ZSpO0HVhptVQBf1zPLRSpuW9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCawqw8wUDAAAAAAAKCRDElYPCBXNxIB/J
AP9gyChxWqxUpAJDxj+NIVLS+FlsedP1lJV9ATgQnxuT6AEAksTgGy2un17kk8noShT2iOEvE5R8
9BClDNbDU6grRgI=
=/mKU
-----END PGP SIGNATURE-----

--------------ZSpO0HVhptVQBf1zPLRSpuW9--
