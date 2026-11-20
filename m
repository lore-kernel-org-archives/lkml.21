Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215936;
	b=i2GrLS5jnhCqDueLTpLpZ0O6dva8/CKOtY5G0FhAk1XjlaaxsbMUE3cpYau6qaI0lp6G
	 Bh7U/GfJ0YauSm5yICrPeFgEFYgvM/nGUMjwHYfXpN2fkgbcKY27qx0EY1K2ARp5AXbSa
	 1mmOiqaJEBRO8VlMwZgQNLI8R+DC6Sp47QJqKb1ri+6V6U6p8C3jJMbtfEAWwV7b1El6R
	 m6O1ZiqiUuHzpx24S4vgTSgrD0lCD8xBXViZDXDRH5t6J1CNlmzy8St7oGZ8ydJKLeYBH
	 zJu/JXJARWBEeZnr5xCUfw+G8C6YQaJ8XfdIBLV+IsIG++Rjx+1LscBg8DhcoTHUzuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=eJ5BpJRw2McaWgy6GPAJWhZZHCtWtK9atUe2DqC0wZY=;
	b=tOu0zf3zbdIBuqf83AwA+mJhii7iuv8Ry7pyI5WRSzuzT9j8bD96XXmZ9tcL84ivOuV5
	 aE1i8VB4TRgukBBcM2nCz1xJ3Z8wJ6F1K/idK0BftJhRk28xPAQlQtLQRXBXKZxtHq6f9
	 G9zmOINDV0wNFzbCnef3vOWkvi6sxpeq1A6IE8xr9PVnl8jt9XaHYWPNvygCslRnFTeGz
	 SSjsGc9bbvqIw2afMrT/5PmS3U/m8a2rju3Tn7Dixf8XR8wm2IQk3haHkc+bUvRhNIrI8
	 pcJjPruT1KQ+LyzMPfuxkquTQpiu5u5ScIaUJxPQ8MkdlUpk5h3ikUJkVx8T0cvm9Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ptkSyi7n;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF1B606A6A7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF1B606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ptkSyi7n
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55b8cd4e2abso16133091cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795215924; x=1795820724; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJ5BpJRw2McaWgy6GPAJWhZZHCtWtK9atUe2DqC0wZY=;
        b=ptkSyi7nsLbE59qnwPx2tZbawmCy5vyYjicmivEDp8PBaIsjFzc/aXkVPwDoC84brK
         5iAIg6+7PU+zCiqTKAuD1ThgFNX6hR00fMtN26ljWvTvNuzvDhqcavYHk7G1ScFHAokU
         4aSlHaWKpkZEpYp3ulcTRFBvJ6YsozZtcfeqT8uQnXhDhZaZPt1qDJFUXOCfD88yUW0U
         fusubl3CR1mPjNPmp5XLcUYPbvU7QBlhISD2/0scq4p2rrqRX658hIGlVN+Ta2iLNbFr
         W/2HykMDbXKChtURt8SMboIWPpr5viytTysYzU7r20WORy3BHTzKin6P3b3LM5zwAz/J
         I9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215924; x=1795820724;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJ5BpJRw2McaWgy6GPAJWhZZHCtWtK9atUe2DqC0wZY=;
        b=eDy96OtNEmsjEtumMO6NDbvL5TvpjggMpT7YOkXfaAybZRSwcArTznaAyPWjyi9hz1
         nw7BcrMTukwj6CK2eKp3AbtKYmDnZHMrKFo/t8We2mhFn7jCEC7N4OXxVHbhoEBQomiD
         KtXskDla1cfAHWC5ZWTKMX/VXWN2f2G7MjZ3pSuPA1CHTrKE+urS6nweXo4A6/+orfOP
         bjfN56NsPWn0LidQc0raN1KUco4nN5s+soGUo28gSBX7BVEfcuFVO2KZuCBBF3+Odewq
         GFxyTxPMU1yyjr+yL2ZLMzGs3ZJCd75toTTNMUqeo3+ug/nRil9dyW8N95xFWTT7ad9v
         /l2g==
X-Forwarded-Encrypted: i=1; AL+hErH6B6uQcaor17IeDJHVdDr6wPVde+8D64JdgJyUET6h5B9YRO5wo/ZrXCoM8CtP1GtSHbWMm1mTqZRHX50=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p0FlZFdSXopynCSdWn0q+3u1aU3QwNJJhD2E7kQs8vOd9IV7E
	0SJerMItHRZlu83TDS392ywJJz3vj8j+JLluA7cPhvZGg73jWZLKJxLXJ3DOzvVA6fs=
X-Gm-Gg: AYBFou32hwAMu0fTZH7tTL+Vps6PR9C7jGwTBnVrXyC9JBMGIiYlCVkUMYmob3HLy3S
	DTY8qjBnaVColJ7ZR0Xdn2QlnohgZBoSkXJ9u7qjBNUsCrM9ZcPEzP0HI60t94pppV5Y6FNPBOY
	1F/yKkkSEeHIbuCoH5X075o1V3FLnRI0elWT6gSSUY5beMzNp/dBkxW+W0BYISkGk6Ipt2dU8cJ
	tl6Z//WsxWBxl/1MGBHfd9zhSNeDHJk9HTcYpB/WmhKi05lUGbRMpqhJjFyb99CnFuZJTu9gD/b
	Iv8Bl17qu52lePq6gprkbXzqcLQeveuFPtGUEG6FAQbveBb1S5LPuLC9ohd0hvsC/al7Ua3Wlfj
	4Lwq/cJle5h9iMHkBDfaRZm+UvDbwCWFyEzJyWhAbVTXe5ksxE4G8CSBZO89gguECKGhWkNSonh
	ROZ9iVlT15IFvdvlNrdqn4KaXu0TxKbeRzeB8rdbbyfAZ4AxYRb98SJhVnO2e9fczUMY+W/RxxG
	8qnrcXaXtoWjD75erSWIDRimp0w/rKIe5b9Qp1tGhJjx+VM1UpmzS/68AMUXdeDRdamwKZf9l/6
	c5Hsi++85rfVwPNlEMGlGYxLEooJIl9Ncsknxv5vef55vWhWz03c+R4=
X-Received: by 2002:ac8:5cc9:0:b0:55d:36cb:d2f6 with SMTP id d75a77b69052e-55d76994ab8mr78951971cf.8.1795215923589;
        Fri, 20 Nov 2026 15:05:23 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882bf70sm35229321cf.11.2026.11.20.15.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:05:22 -0800 (PST)
Message-ID: <c328eb172979255e0998fd126db313651a471d7a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rkvdec: Use dma_map_resource() to map RCB SRAM
 buffers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Lukas Splavec <lukas.splavec@puresig.cz>, detlev.casanova@collabora.com,
 	ezequiel@vanguardiasur.com.ar, mchehab@kernel.org
Cc: heiko@sntech.de, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 18:05:20 -0500
In-Reply-To: <20261114094916.28744-1-lukas.splavec@puresig.cz>
References: <20261114094916.28744-1-lukas.splavec@puresig.cz>
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
	protocol="application/pgp-signature"; boundary="=-mVFMrjNK4prCvdK9IMd/"
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

--=-mVFMrjNK4prCvdK9IMd/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 14 novembre 2026 =C3=A0 09:49 +0000, Lukas Splavec a =C3=A9crit=
=C2=A0:
> rkvdec_allocate_rcb() uses the CPU virtual address of the SRAM buffer
> as the decoder's IOVA and writes it into the IOMMU page table directly
> with iommu_map(), bypassing the DMA API. Only the low 32 bits of that
> address are used, which falls inside the IOVA range managed by the
> allocator. The IOVA allocator does not know about this range and
> considers it free. Under load it hands out the same IOVA to another
> buffer, e.g. a capture buffer, whose mapping then fails:
>=20
>   [   66.930512] iova: 0x0000000082100000 already mapped to 0x00000000ff0=
01000 cannot remap to phys: 0x0000000168231000 prot: 0x3
>   [   66.930674] rkvdec fdc38100.video-codec: dma alloc of size 16588800 =
failed
>=20
> and decoding cannot start.
>=20
> Map the SRAM buffer with dma_map_resource() instead, so the IOVA is
> allocated by the IOVA allocator and the mapping is created by the DMA
> API, and release it with dma_unmap_resource(). Without an IOMMU,
> dma_map_resource() returns the physical address, so the separate
> no-IOMMU path is no longer needed.
>=20
> Fixes: e5640dbb991c ("media: rkvdec: Add RCB and SRAM support")
> Signed-off-by: Lukas Splavec <lukas.splavec@puresig.cz>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-mVFMrjNK4prCvdK9IMd/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawDSMAAKCRDZQZRRKWBy
9PMfAPwOi/tB/Jf87fecrO+PluXuT7royZvxIrCNZmOHBSuEegEAlBEB69ZnNtbu
KA2zhN0q8/7t1JDmNdzQt64epCy1WgE=
=cLZV
-----END PGP SIGNATURE-----

--=-mVFMrjNK4prCvdK9IMd/--
