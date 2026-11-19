Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104066;
	b=FvZw7mpCQoGPqkRjAIueWsTENXuq3wkm7vWPLo/g23edV8o/HVYRVuM2nUEPJzSlBMPg
	 zQagNT28CuQB7h0rcAAI7C0P0grCpcST334gpC9a1Soa5hPPKAK+0jnZ97TlhikSb3eIT
	 jfLKGEpxhGIsLeHEgjcbgGz5xpP0Jyxzt/4hsXdGxwHM+B2MawdmGGbaT9tlFFXO/d6EZ
	 pXux8DsFmgMMlWPmjiafMFIUdQUmd7OA78R5BxX0oUy4Y0GJvCXbAqTzO89jqWXJhgaA1
	 g1KlhZMyB/cCDgwHZmWPqZNbDkzOG2WC2SGPlt2OpvklSB09eUVCcpcwHgeXZ+9Ja/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=KfDm1ombW4h++zCNnSHkepgC1bowgwnhqlH8xoC2Q4M=;
	b=fhnu/NWzUDPF34iNq60XKEv7YiKR6N9pIVWnbxsXXjksuQPRNgCK4cJLSrUJtq/Xem6f
	 nWFUe+QuoqvhROH2e63cPvdwnqsMkSsvmoYitCRn4k7/SGuVv0m4ZehcTbkGvJwCT9Pus
	 QDSikOcznfxDUgfULVptG8qP1kQxzD9hPW4+5pgHJIwnZ6+Amsx1S/yEXBbBu+BYswEJ6
	 FgCQg+cKVEdzqMjwG57gBEj/nCaJBeCpX4/pC21NPd0ZZhaUHnt1AAWWGvs1otC5qmuIp
	 PCyZQWQAF0a53w3NT1SZXAWGL8eXSiETtiQHnQNCM4HPaA0omLRR6QQSUITPKeNUyGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tmXA3f8N;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50584606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50584606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tmXA3f8N
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d28f75d62so414314166b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795104065; x=1795708865; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KfDm1ombW4h++zCNnSHkepgC1bowgwnhqlH8xoC2Q4M=;
        b=tmXA3f8NwhT3z4gxbSh7QgwAAEJx1ktGA+D7J+dcvtJbMqMzR3KBITVFgdDBU4G6sR
         JSrIeOBO+Ggz6kAP7jSa/X5TFVmo/EmIFIBFp5YjTrpAz9kyU7uQvKYZJKUpP/UHeNAY
         px95itLlLTW6KnaksDRgTn4uf/i4VzoE1HhUcDc2kFkHcsJ5W+rQLOmMD5HTjwjwvMWv
         WLImbN61ePjj0ks27IlMBDAjkNbsgKqdO9SOnUCPvER8T5JfsBGOUXedoP3tho3RH0MK
         BikBvsQqoY9vHLoZO7ua6DnoyAxLw1xPQrY/VE8deK+f4yNamwJ/mDyqKGp7xPdGWRJi
         f6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104065; x=1795708865;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfDm1ombW4h++zCNnSHkepgC1bowgwnhqlH8xoC2Q4M=;
        b=17mC31NwjvgPcx9eVUmv8ziAWu6GBSLtH/rD6rjQfo4Pp453dCzB8wOKBqawWA/TA8
         J8x512AIs1JSxYClaFWzlKD+cVJMc1GEIyL/PP+swq/etKcRJcKch/R03RyYcCqks0hl
         HxkUi738pHCx799MbDoYHJHpoghMqFBZcvHYujB4Jw9kqyvdG0uSUccQc3iFkc3+0mYZ
         QnA2zNWY2Z5qKxXEMNbC8IgLDrllu47TZ/44LNHbfXbxkIFh/HPmc5hxxUlY3CCror9V
         U/Zciz/RJQQUkva022AP3Y0LsfMPd15K3p+aAeWNnykYmtan9o72jOX7yvJ1URPdzQ5H
         Bz6A==
X-Forwarded-Encrypted: i=1; AL+hErEJlMoHtau+tSPE/9irnx/RKxA4W2rWVkmm1OPqPX5pXnFSzzaOW+I9HWmPA010uOnKtQFcyzP6GfG3+G4=@vger.kernel.org
X-Gm-Message-State: APuU4Z///aFd5YZsz2VDZdZwGlHw9y14HU1GortP1Bn/ETujJ5n+DQV4
	RxHfxEYX14vnn1PBWztVC2y1S/Q/6byehOACbrMX7IEdvgY1/xyg4olyiy5srX75U84=
X-Gm-Gg: AYBFou2gAhrhmbxnR7LlwPRvOUcKrh2GUdqIOsFfkRVviM4iMKy2QNIPBByazqBbij0
	9rHNw0OdO5Z6OuGYMSHiLlVvMxuDHcYhUpOf7KuixkckAYtmMie4ayCp2r2Y6hzZ525lx+cg1Y8
	kVvGN0I8DOT7+Mh0tKiR+Tt1OS734eXxBLMS8DOV26FDX3A8J5ur8RV9En98vcGA5+jDhHfFJud
	yNuYVSv053GKy6dejHojjyQk7Rb9f0rkK5JOfrqobDVGiwEaES7ouAalgGEbsDMB6slgkcy8d7a
	Phmpo0u3qWieGiUsaxy759N3NhytlgBxpPAKpCqAguV8FaX82Y4PVYkEe7Wci1wyV3SVYSi2FBp
	j0ZeAEb1BKs7Gqr5razjrN7wjdt35AiJ/ZEO17LZ7Pwidgdy6en6YoEdyhh2df4IrjJAil+cz3u
	KqCf/7Ge5BdvbEn5vsjMr/9O0sUbf+A5ySpjkQB6puzTPx6JTtT9ch5vc8pny5HlpeAAbVZ24QW
	jghfKs06Y/hrapjkhvnrK8mVDwTqjuCKJ6Qwl0rieRNIuSCxDgBJNimLt7qQ+7kpeCnevemfZng
	GggaH1VsPchz8T4mQNFnFHiUicwn6oNajBY2kIdLMzeHsy5ia+5auB4=
X-Received: by 2002:a17:907:a4cb:b0:c4c:ddd1:cffa with SMTP id a640c23a62f3a-c513ab48b7emr32560666b.29.1795104064176;
        Thu, 19 Nov 2026 08:01:04 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee81sm9308166b.66.2026.11.19.08.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:03 -0800 (PST)
Message-ID: <41e428a6fcdcf3d0c10cada8743231797b3dd5f4.camel@ndufresne.ca>
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sascha Hauer <s.hauer@pengutronix.de>, Sergei Khomenkov
	 <shomenkow@gmail.com>
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
	 <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 11:00:59 -0500
In-Reply-To: <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
	 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
	 <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
	 <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-sAMgqgjjNcbq4UuGGMyk"
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

--=-sAMgqgjjNcbq4UuGGMyk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 18 novembre 2026 =C3=A0 14:27 +0000, Sascha Hauer a =C3=A9crit=
=C2=A0:
> > Would 3 bytes per pixel be acceptable as the default, and as a floor
> > for smaller requests, like the 2 bytes per pixel floor in 6/7 of your
> > hantro-based v1? 4:4:4 at quality 100 would still not fit, but the
> > subsampling is not known before the header is parsed.
>=20
> I haven't been affected by this issue lately, but saw it when the series
> was still based on the hantro driver. Yes, I'll change to 3 bytes per
> pixel next round and make that the floor of sizeimage. Would be nice to
> have a proper solution for this rather than either wasting tons of
> memory or risk having too small buffers.

The hantro HW can run in ring buffer mode, that forces us to copy, but I th=
ink
you can then perform decode without actually having the entire image in RAM=
.
Would need some experimentation. We probably don't want copy to mmap + copy=
 to
ring buffer (double copy), and V4L2 read/write are deprecated. Note sure wh=
at to
propose really.

Nicolas

--=-sAMgqgjjNcbq4UuGGMyk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav8dOwAKCRDZQZRRKWBy
9HpfAP91JjxhDbtoQ02FbQ9AFuc/QS5L4xa8oYqNcrceAeaDzAEAtc4iVSLgSAv/
fkehBAsK40dvdlTFZHBgCbrfEIFuTQ0=
=0Ehx
-----END PGP SIGNATURE-----

--=-sAMgqgjjNcbq4UuGGMyk--
