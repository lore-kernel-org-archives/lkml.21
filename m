Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124087;
	b=1rxn/xcoPLspqZnA7UGc7+vXo5jpiktgK2lFKy5wkbrIoQr0x03QS4YpdF3P0uZOZeIh
	 MAu5v5Kicaul0DrBPhyX+VDj8srtuH0ap9sCk9UVynEObA7Rh0hQBrDhNg7odWTGoUDQ/
	 127bef3pxyHjAWQsPpLgzw/56YWGiVC8bX6C81HkDOkFs7UHalFCMAHFDgacocMMdcEE6
	 qVGVF1B3G5CeY6VfTY8/EyPnlwYpcvhVzWCLLLlTsTJysU6lMDrfg9c5usxEZx7BVgcot
	 pHOMzF0geLw8AuIn7FUuKDGD6w1dywXzgTYoXtaDDPF59QpXxJmmHMR20SiyNgxbKIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=4PLRPYEt6tusU5aT1XxZRjXDBd+sz/kTb86+H3nHWAk=;
	b=fSfUzJ+kaKc3dQfER5lxgSIYTpJj3NyYGVcxkwYxt529vIIfYlltbGs4bpoy/SfRwL3h
	 x1mtafIgGZBxVTGBRisDHyMH4SLw6dROYmcGco6VtS0WT6bNBr8z5jDKaRu1ZctqA9REl
	 tHbIyJU7YiXmbt0XccI19uYmEG4D08zduEnVcEvNfY9BxMpWlURcxWp+dRpUSX2YbcPXf
	 E4KOdnhhI7adyXhjfdljfvHgXZ48eynEuqfk9VnPyQlPo+zD5u4OkmSqK1cLkg8S/KKnB
	 yiPRj9r1fGJhWrPlK5Frje2hwBKlsinByKpViH1y/M/pHCVubefnomskRSHJFTVk9Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y8sx7kPy;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6979F606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6979F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y8sx7kPy
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-92130d3ee15so3298466d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795124086; x=1795728886; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4PLRPYEt6tusU5aT1XxZRjXDBd+sz/kTb86+H3nHWAk=;
        b=Y8sx7kPyic2bavNpYGzSAMzW7BhhRL2PGJcSKHRBkPf5/Trq1xstO2LrxtRD/bBuri
         Fvnk/m9NSmAqfhFe8fDYY1SicQ8Gnpgu8EX2hSZKXfxtLXTuDTUC+qsg1bf3uqONy8HX
         SOBV2hfhNRFqgHrqTQeR2YZLmxhtMM/R29gf94ENwutwWmtoODGK171+MypP9yG3YWWt
         EWRiMEQCIasBhNe2fIDCpV/UsKMtd9iMw8WYsj2BUo3UirKDUbRdh97YkUfXYe+LA+Gd
         Rn6NaLGA55uJXRF7RYkFQ6ch52AFMBbj3+QraZGCtbb0yiH+DB9bZ1ZGl2jHdJUd1x3d
         woGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124086; x=1795728886;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4PLRPYEt6tusU5aT1XxZRjXDBd+sz/kTb86+H3nHWAk=;
        b=L4+jfi5FbhlGttiQmTuHIDiBcjqzJ/FzCCYhF6KtuFllhQQSohUSqFCVgwrruTQjPw
         XK0yFW+wgeJBMc2DmhZ7+aokH6EQFBCCEQ39prBsn2h7LUjZ1gZG6QHsGl7rmkrgVTeA
         g5ICC/T2OgDYN6EbMub7g83NXaWC0uG4NPbQpgrre8m+2tzQup9h7Zn0ipsNVWKT4WQq
         wNXKsB4h0fD8v801vPhGtiYkGqD+PPQJT1wrUHPu2Nt/kPB1AVAlpzvAzXNmfMYpWXKu
         wkfnCUZOLT6bbTtytRYhQPBr54fvNZwGrheFjzFsb5Tv4ujN2YCriIjRxBH2xR0seEza
         +PxA==
X-Forwarded-Encrypted: i=1; AL+hErHBWtpE6WV3psGfzfCIlZSQtZv/+YqIsbgfsQMKh+vyQM0GSooaO5hmhgmuEt0JfkTeVxL1nbkbO2b7UIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PkyzK4apRBFvfmPfH5u6/sc9gEPr77DileWzNk+iARtC7qECb
	vkD/cUoY7ui01CyP6olzquOsELAe3NeFBG7bI57Hy9HhLe2re0EuRFEgjFqJT/5AHiQ=
X-Gm-Gg: AZFdTZcu4fNIQml5k4aPNvQRhQ05OuoBt+80Ac+t5KzrAtZH1WeyMUHoDobIWufCOAk
	pS1TdVUg4XlxAxmq2ulvzk4k/S5koSXz6bBdfJcOILUpc/eKXaqIJVPzmcTBLegAkKousYuGiLY
	EwgpVKm9dzt4ClQufxj+TAKqPb+6lU3b7CJoUs01NwzmAleb+jz3wBDfhPPPS/RQUs6mQqDGH9B
	5kBYcUHP9/nQUM646gAUwcMhMmt35NbazjnzdqFUz7IiKUphc9ltwFDgqHOK26nP3TsKdsZc9D9
	PuNOo6PdZEwkpG3E2aqxWBrmMgbCk7YLEnrXdBhJxR7E4BFjwiLaCdV9mrIJIB15H+zfAAE/j58
	0rR01idRCYSk1T7DCQgIYD1UB7CCb0UFLI1WY+mATBs0u7ew+2t1hTN2ESqqczqFJGO3CTvtd3C
	TFUtDVKSx8QCZMAsibt/hesUSxeJBa918vKjBEIwIC4ITrnYrQ3FI2FLA87Iv4r9YQyhnPsNUnQ
	0xyKbGhVBlO//oDUKp2/H/FyecQkqYkSlcBhk4hrNk+zlfx4bfwVVXXhlXeR1c+N0K6N+b8aC2d
	Bb1k/oXSKsDEvKOHaeGnyMBnOpOhv2fZemIWyZrsDS5G9nnsQBTeDPE=
X-Received: by 2002:a05:6214:85ce:20b0:920:fd33:dfde with SMTP id 6a1803df08f44-92134aaeb65mr13172176d6.19.1795124086320;
        Thu, 19 Nov 2026 13:34:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm8767676d6.12.2026.11.19.13.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:34:45 -0800 (PST)
Message-ID: <0fe8752a8e772928ed9c86b022b4770a5c65a05f.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 10/28] media: mali-vpu: add firmware cache
 infrastructure
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Charvi Mehta <charvi.mehta@arm.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Rathinavel Sankaralingam
 <rath.sankaralingam@arm.com>, Shobhit Pandey <shobhit.pandey@arm.com>
Date: Thu, 19 Nov 2026 16:34:43 -0500
In-Reply-To: <20261119153758.1426673-11-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
	 <20261119153758.1426673-11-charvi.mehta@arm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-n9uFvmouF7zu3p1k930u"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-n9uFvmouF7zu3p1k930u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Before I move on, since I think you have enough early feedback,

Le jeudi 19 novembre 2026 =C3=A0 15:37 +0000, Charvi Mehta a =C3=A9crit=C2=
=A0:
> +=09n =3D snprintf(name, name_sz, "arm/mali-vpu/v%u/%s%s.fwb",
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0 key->fw_ver_major, codec, role_str);

Your firmware will have to be published into linux-firmware project for you=
r
driver to be accepted upstream. Depending on the state, feedback and clarit=
y of
your driver, I may or may not ask to ship some HW to verify your work. No
immediate action needed. Since you only offered a generic DT binding, its n=
ot
clear what upstream SoC can actually make use of this driver. Some informat=
ion
about this would be appreciated in your next cover letter.

Nicolas

--=-n9uFvmouF7zu3p1k930u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9rcwAKCRDZQZRRKWBy
9GkqAQDLRsHeO/IVaaYhuSlkJJ24RnPJjWX8LIvZrnkoUg8JcwEA46uq+Ds3k1yE
6EXC6M9FaZzEw7VAybZv0GKKCISBOAU=
=n32o
-----END PGP SIGNATURE-----

--=-n9uFvmouF7zu3p1k930u--
