Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541955;
	b=elfNHLXIg7wRcvjr9S3wMuq23B84fEcZ151hpBOQchrE/SNljCraGV6BAEQbRu+Ri7KJ
	 /yjpVMgH+W9CIexKe3jfuHBmmrgDHFmS+O1zKYFVThTN8n53N1dMSLDzaFTm7REL+MWxs
	 7zClYrfdGIM7j5GcNfUH++XX3CIEPrXv642aq7Em5b5tOpiIy8wst0rOBIXCnN42vrE/+
	 Bc2mse2m1113Xga0LXQXJvjtTHj3TqpH3uxyArX4ITH4QWuulT+c/aByfly7jZ72vNA5d
	 OWviGCctN0uzqgti/XJdtf18iTatEL+H1JgYBMdeRdiochVYJhaZHFT6WYxEIHhNT/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=WBc309mYer5H7Xpcaba+ynW+B/78kXK1Bb+NRGqzY3M=;
	b=ckQnlZoQlmUv4jTMqG3+SF6GpAYe6Blhj91sXs22ANQsaIZnlL6IyzDDvXGdliS4yUMb
	 truZViRnWfqCOOsnMvQHapd3G064zEhKPcfxZsT8HrK3o6ufuEV39PGSQa1jAUOQ9oYqD
	 JOW6g7Lp4BIgi30KoAVoWM2MD+sodCcMqNeSi9nptqoL6oqYxjn3r6KK2q/FwUl04f2Mw
	 sn5ZaTGrPgrNWWSQiacHgxoLrVi/vZ84co5l7e1zKb0Wu34ktGY+aj/2hBqDYTCtMWxlz
	 2PTMSaAZw9V10RRMsoCZWxcZbmqSiOqbXGqkpW5djEzxbNCdcbRIBZn0UUZSANruNhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BbBJL9iX;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6EB606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA6EB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BbBJL9iX
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b2d14968c9so45648657b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795541954; x=1796146754; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WBc309mYer5H7Xpcaba+ynW+B/78kXK1Bb+NRGqzY3M=;
        b=BbBJL9iX19HFseLAZpNMrqk/cz7C7E4ItEZffQwvgffTsuM2UkPlOcyFFO+hg3yoPU
         BUaZAoyQvJdVhcLwgpFfY8dI+Y7oT6holR3Hn3ahHvRGxrVlELlG8o7Q4jpq9nds3JZi
         AEyDvCkLriXUxvZo7EiARVg7iHJsTN87EGyT7cub36IMWAs1LaZcY/JxYp76MWvRTPnA
         AY6g8pwMQ2V1dd0/t3kXGJFoeuVNqD9EEZC4yzKLY6Y4BpombrpMwyNtGmiecVgsOyNX
         zQE0g24FH43+nmbvst4iWIPtgaN6zibyjDMGN8AeSJ1FrzyFpd8cSNC5/G+qyhAsorMh
         lb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541954; x=1796146754;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBc309mYer5H7Xpcaba+ynW+B/78kXK1Bb+NRGqzY3M=;
        b=kIkEeFlf6RzM+tQ8Y4GFdAGKyLvEnV51PH/uAuaUSLbjMlaSgtcxvvcUTYypzKuuf4
         FgRUCsNBPodSIl3x0fyUrKaWRpUJPm17Cpioe74Zg9J6fHqTx0+sIYxVRJ5o79t40EI8
         asFLEfMn8pI+GxtNp7yPJrjOZQDaE4QLa9Dgn2yFSlCU2YhbJGTafEHeJaq2m5V3mHDP
         IxMv+rWr1P+rJ6JQlq95LAortAMeDW+nYmhlVhHOKhELxT6xyDAKeMnkMYnS3FNhmPd2
         ikqwtEyUgugNt3tb0mv5JsfFuGdocLN4hsWvT7CUNx3tUDRudeVtq7HfbgACGjNEcLN/
         L0Xg==
X-Forwarded-Encrypted: i=1; AL+hErFlUNsAyJMnyPHqHMlrgUDSuKutKc9AHJWWpZtWvHhJVYW80q3YhgDJa8N0PP2Hcg66Xr1Y/CW8OicF3UA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TyteaP4bO7v+erMy08f/PcZxO6UF/gr4Cj60Y/F3iy+YCLlTk
	B3Lw9le3e5XW6kW3C0KaCrJxTiqUwMOAxEVUumf6BOwscZmopXRX9Rg1J+r+HfCyTV8=
X-Gm-Gg: AZFdTZf9DptWXQiuJgz/o9PvkXjmo7nHYvhMcq0gD6kL+zUD3mgzEczFKPNZXM4pvhO
	Lu7xBX4SZ/yO76Hm1eBjDLE/kTjq2/BXbYsf/XVoP9loL4/kMz7KG6NamO+Mdt1py4WV/l/vVeS
	e635HVD93zrmA0iLHzp9Bd5HNl3uHuiuAtJC+iEByVA1A6jbBQbTYTYQzqeWJEecnlh+UPGHa9X
	DVLDzkobPbILygEOMHDHwVllsLwR41Tt4RC6mD5QP/hYqm7+s1ibPxkSgOZTHfepX2/4LgNOfBL
	VsK8zdczXWwjthhulMf8gp38M3n2j7AV+Rh7KUnf4rvhOcXKlP/l4MF1mr7DWcu4QCzT8jB6jYN
	J5lXN6X8o2NHqF1529z55ubt+abka94f76kNPug0GNtoa74vkTvL/uEYuYpjyjfG9UICeNOmxqw
	V3CiC877TZgpeDuD19PPw7KTLAG16aB6g1eSiLKvIZYyQK+RlWGDpvPW9V9kyK6CLKwv/W/3HdY
	Z7NwxMHxTDpTDwvwUNEbuI4KDhF94paSrCfBc4L6/boMzvsKQV11AsNwjSmgIm0f2kkGOWeRysr
	oWK/mjxErEmfpa4UCQ8d2WbNKIUJkp/dQuNtyLqOaespNacGcNPOto8=
X-Received: by 2002:a05:690c:990:b0:8b5:6a83:5e0b with SMTP id 00721157ae682-8b56a835f62mr4475197b3.13.1795541953703;
        Tue, 24 Nov 2026 09:39:13 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520354be4sm61097717b3.43.2026.11.24.09.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:39:13 -0800 (PST)
Message-ID: <87e98f2bca7ceb60fe0b786a2bf63711ada2572c.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 07/28] media: mali-vpu: implement TRY_FMT and S_FMT
 ioctls
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Charvi Mehta <charvi.mehta@arm.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Rathinavel Sankaralingam
 <rath.sankaralingam@arm.com>, Shobhit Pandey <shobhit.pandey@arm.com>
Date: Tue, 24 Nov 2026 12:39:11 -0500
In-Reply-To: <162bf4ec-c23a-49c6-ad7d-7485a5cce2b7@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
	 <20261119153758.1426673-8-charvi.mehta@arm.com>
	 <3415e7b52c3d05214ec125b2b4f8612129c53ae0.camel@ndufresne.ca>
	 <162bf4ec-c23a-49c6-ad7d-7485a5cce2b7@arm.com>
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
	protocol="application/pgp-signature"; boundary="=-EcivsMOo8ZMd140z5HSW"
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

--=-EcivsMOo8ZMd140z5HSW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 novembre 2026 =C3=A0 17:26 +0000, Charvi Mehta a =C3=A9crit=C2=
=A0:
> > This is suspicious, the vb queue already do some locking in most of the=
 vidioc
> > call.
> Both queues assign `&sess->vq_lock` to `vb2_queue::lock`, but=20
> `video_device::lock`
> is unset. The V4L2 core acquires it for queue-management ioctls marked
> INFO_FL_QUEUE, but not for G_FMT, TRY_FMT or S_FMT.
>=20
> video_device::lock is unset, as this driver uses per-session locking and
> format ioctls are not required to be serialized among different sessions.
> The explicit locks therefore protect format access against queue operatio=
ns
> and asynchronous firmware updates, which use the same mutex. They do not
> reacquire a lock already held by the ioctl core.

I missed that in the review, please document carefully your locking somewhe=
re in
text.

Nicolas


--=-EcivsMOo8ZMd140z5HSW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawXLvwAKCRDZQZRRKWBy
9LX2AQDqtWe+/c2doI6o6r2GLVgta+8/CIYTXwIAm9OktAVFEgD+JCsYrreT/btu
r+NQEKefI1SmP+05yKhjlmTDl1hgKgw=
=bWwD
-----END PGP SIGNATURE-----

--=-EcivsMOo8ZMd140z5HSW--
