Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119055;
	b=SS3+mCYGkS3F0PRifhM/i2o0ngJwl2VxDq1hzd2dP8yq+dobiwATzsyp2qq+dlBl88CQ
	 e0MAASY4t7CcdfFPMpyKYP0AQj57FiwQoo3d79JChd39AgFGHAJ8Uei/ANE8E01VUGYnN
	 XV3piHgn/0HQ9a4fuJz0uIzoP2KZQ1hcoinBcusoSWYhIMCi5NDPbsBdWwJcR7h6j+71c
	 pmqP5ufAdbaCm4kW9PhQxZkBE2/x9Pfmu+88hmBo/i800T8oSzaC+Ou+fakdCvEJxOt0n
	 0UoTz1L8Om422gKOHPXLeH1Ok/OMWTqRt7tghzZ95JGpFnlUJt5KYn5G/WoPQ/DxuYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=8aqv+DwVQzSb2PSvDQkheb2OINfUMuqmq/Dn5ckO2bU=;
	b=2ASdXgccNeiOrtpkaross9gPtFFmIi+G5hbTr51xCPYbCrAfsaVg+gAUz/3JZl1e30L3
	 Uiur45mrjkAb93mSqWH0ipJPk9Ile8RjvU8jt6b5dlwhna5NTadkrT/0B7lUR0ashnNhA
	 scnT6nW0xqV41vny07wGs7Du9cnUvAG5j2AOp/yistbHcBGVhVhwybpLw6cam8sHB4xGR
	 Zdk2T5XYYJRuda2hmjpGNC3gFsoBzwdmJOdy+DVv/wKOzGYxEj1lFDumoI8Jnd2XnbLft
	 hRULEFYr6WyFXE4HEoygNl4fcEUWEOlaF0GpPNORht4938Sbljj7Xtk4aMVdxpy8+aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hyGQcQ+k;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F097606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F097606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hyGQcQ+k
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f2049ea7aso14431985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795119054; x=1795723854; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8aqv+DwVQzSb2PSvDQkheb2OINfUMuqmq/Dn5ckO2bU=;
        b=hyGQcQ+keDK2b+poWfXaBz3rTfz1FyheOYiUzJEERYAMhFZyAu6PuvsqtyX6pjeesS
         RPo/zf+sr9tDJlWK7LXyI/JwnAF7qkNwpYO+juoobzUbk0BUFczoNvQWEGADycDW2iwF
         y7jXJjMSOIhu/MUmTcjReZe3qIh+eFzLgqwR6LVOhkzMf0koL12QfW68TIcDa6ESyTAX
         A9hpOxUza4P7LOMWuFbIYg7gicCapbN+ffcwUDGx9yF0j4jjlLHoiZI6aajcrdXNLT9q
         oyXtSD7jOBruYl34nyNNIo/0UAbvOlzJE8VI6uN8Ph4wXC/te+u0l1swEJRdwwPBFBRP
         Hcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119054; x=1795723854;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aqv+DwVQzSb2PSvDQkheb2OINfUMuqmq/Dn5ckO2bU=;
        b=19Z7gvSpvhweBvjvTLLUsrflloFVIGBEJG3fPQgf7YYtgutc/dN8W5KPpu6l8gBryf
         /yKfvDS2sgGNquHNAWWnT8V+etF9fXzMP4tKkeK7o1gl6osVhEmH0cFvkT29YRJSLmX6
         /0BO8Fchxdx8WSWMHJL7fZCIFMShzIxABCAH5c0gJT5Q6lNkuIz/W6o3NJlZQU4kOc7H
         +S0M3WRfnOgvvU4AxW+lvdP6KU0C6qu1ycfGNaFnTmnTIfIuWaL5fD5Zo/6+nAN7YHb3
         beZ9cv7lEIjta0F4OsHsuuvcml5OuDK7tGpq6XoOm4yC1XxuO4FhZM2paZxzRDkhTUc9
         F1VA==
X-Forwarded-Encrypted: i=1; AL+hErHztpSZqV6+5zylCNq/YZZn69O2wDCoP/pRahn4YDbqpByV5jKFaPCsYcVxvb0fQMOvmlqW60/gOmwaREU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+5tqli26MKQN1h/SQpQ7hCZ8M9QxEwZcBRqRzdMkzO7IDVzrl
	B6nN0wLOBOpJj/AZSMs+ItZxRXNDi1+2AIWjQsRK233UteRz5PHmt+/cDtzuvqEGR0lHmZw6CDO
	TgBDaRRo=
X-Gm-Gg: AYBFou0buiPWvTJychF/mKusFT1o8DS1GbL46axOKEYSubrv3Cvx0IhQJj/XS/g9wZd
	brX2c1LpXm8lCUTQUzrnVnkWnl85kFZE2TBRZH6GksomW+fBdgQJlnckyQSQPhQWECfFyV1wCNH
	MkdJKZXHPsNKLUY796oFAD+GwWkf6o04kHVGYV8raxJGIzVHsqltbXIuAkCO6QOEMfI2I0Lq4WD
	AXsV8ahP9oUlGV80h9WnFqkoOn4LIgc0xt5xNrPrOCP6isT2Zr65WP29wLQJ4FUYiX/8kkZl1ZN
	5CRMYj/LqhEi5FVILThcAT4V8FYVK+QemqhCuboSMRRuirc3wpusnSmYU79G4XmYwlyfWu9rQ5M
	WyDyUkaPGU0YXLADMzAYWR2vCtemXFPaHRmnUzU8tx1nlJUYvE1k3W38QwfYTvqqxpO3telvEC8
	KT38CKhEbEVtypsIVoF2+TGi+Oq7YjUummAR4FJayDHhhziyo2sMAvdsb4w+tuXJE7bXV9FNkT4
	LxaB+OBMaeqfJehoGnmtZ1Uxiz6Ww6PZTgTnrA7QfGi/vkIOwc68OrFc77MXTvfUXEXf1dAvQhi
	InPZvsE0brfGa+Q1MvYTh6vq6sFifCuoLW3tJiT+KeOE5lNAGE7VGwE=
X-Received: by 2002:a05:620a:480e:b0:949:7502:6a5 with SMTP id af79cd13be357-949bab2275emr133918285a.57.1795119054458;
        Thu, 19 Nov 2026 12:10:54 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3ba04bsm37578685a.24.2026.11.19.12.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:10:53 -0800 (PST)
Message-ID: <91e8a132f2ddff24b30c244dff0a8389afa313fa.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 03/28] media: mali-vpu: register V4L2 decoder device
 and add querycap ioctl
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Charvi Mehta <charvi.mehta@arm.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Rathinavel Sankaralingam
 <rath.sankaralingam@arm.com>, Shobhit Pandey <shobhit.pandey@arm.com>
Date: Thu, 19 Nov 2026 15:10:51 -0500
In-Reply-To: <20261119153758.1426673-4-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
	 <20261119153758.1426673-4-charvi.mehta@arm.com>
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
	protocol="application/pgp-signature"; boundary="=-68tdt8CJA0v7u8ZWQyHT"
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

--=-68tdt8CJA0v7u8ZWQyHT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 19 novembre 2026 =C3=A0 15:37 +0000, Charvi Mehta a =C3=A9crit=C2=
=A0:
> Register a V4L2 M2M decoder video device for the Mali VPU.
> Add open and release file operations that allocate a per-file session.
>=20
> Implement VIDIOC_QUERYCAP to report the driver and decoder identity.
>=20
> Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
> ---
>  drivers/media/platform/arm/mali-vpu/Kconfig   |  1 +
>  drivers/media/platform/arm/mali-vpu/Makefile  |  3 +-
>  .../platform/arm/mali-vpu/mali-vpu-device.h   | 15 ++++
>  .../platform/arm/mali-vpu/mali-vpu-probe.c    | 59 +++++++++++++-
>  .../platform/arm/mali-vpu/mali-vpu-session.h  | 26 +++++++
>  .../platform/arm/mali-vpu/mali-vpu-vidioc.c   | 78 +++++++++++++++++++
>  .../platform/arm/mali-vpu/mali-vpu-vidioc.h   | 15 ++++

nit: I'd say rename to mali-vpu-v4l2.c to be consistent with nearly all oth=
er
drivers.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-68tdt8CJA0v7u8ZWQyHT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9XywAKCRDZQZRRKWBy
9Gk9AQClEgbrQYsilxSJEOtw7LEwCrwtEVoSpQ1tbx+me1p3KwEA6yr3WzRocwTb
/VnV9DMVgAS6/9EfRVX6UUJhsXdqnAI=
=Gwtb
-----END PGP SIGNATURE-----

--=-68tdt8CJA0v7u8ZWQyHT--
