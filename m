Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795734687;
	b=xuMlpAqRBq5t6JL06dhJA1rVnImddSvgBFKkSCW5us/LOwgytziuYC3SueAhPAH6vGVJ
	 mx70Pqc7i//ghNf5p7Pqjj+iLbqy1rgjXDzKxcft+IogOBIgHteekJmI2rinexUJpJ8Vg
	 vrxS11LO7p+3fJD7RFqlLuiEEDJtHXjZ5juPiyKwU0MZMGSkHIUczavNQx2mn2rlQFzoB
	 KrJX0P+S4yqTmExrS9zZB7wbyTmxPGYi2vwKTnv0tRqgruuLldVgLlErSo6tW9g1F1b9X
	 IkyH98XqddYQz4NQmhFaUNSgrFksHcUyxalLVs77mkvQZj1os0EMsPS9OcJbLkFWVOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795734687;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=FgnmKyRD83LLGEWyCykRou31U3vHdZMcJrl0VNsYgBE=;
	b=oRfB+qG8ndTEng+GUSRMol6y6bQFtHxIAw8T+A8egwDbLIpD4mc59fwaQDN8wUHUv9dk
	 OOwsPMY7596B22SraunUTXg94//5fCm7alkBA/lYplQnyQyogrHm3GaIH0DthwXI2FhBs
	 OJS3VubBsQZ5z/0QIONc6DZYQyMJRGhKY62f3KSqDjPuljEUa4eqeT0We1EKDCjBYf8za
	 df+iGBWUvvQ3Xs6HJAc1fgIFWjmkXFth4R5ARsyqWKN1M3MG9dWfmx7X+w/GqLcINJ/22
	 Ff1NeY92Lrvcd7Zd9J14AMqcaHOEiRpcqoBT6PX+QJ909rxRMPQJQiMRWiO5JVMbBKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hjO8H1ny;
	arc=none smtp.remote-ip=95.215.58.21
Received: from mta1.migadu.com (out-21.mta1.migadu.com [95.215.58.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F94606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F94606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hjO8H1ny
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OFk/33AZgL2b1+f3ha2elENhd1aKhKZnsNw7dCkoNMg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795734684; v=1; x=1796339484;
 b=hjO8H1nymqyLkGKmYIgaZwXm0lOL5YzEOM5jrRHREccOGK08OoE1PjKoO18WtSd3TirwGjyo
 WbtFZW7kF52B4HLb69ADBrl7Y6rpTdhpYZSVDiqmHYHC6yJk9Z8y9xQ9pOKkBT3Sz1OAZmY5sSS
 SGff7cTCWad4f4SQLwbupLcQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id efa1e852fab11779;
	Thu, 26 Nov 2026 23:11:23 +0000
X-Mizu-Trace-ID: efa1e852fab11779
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 23:11:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Zqiang" <qiang.zhang@linux.dev>
Message-ID: <82cc8eec748b2d3e7fac306652966353ec9d763b@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] gpiolib: Use srcu_dereference() in gpiod_get_label()
To: "Bartosz Golaszewski" <brgl@kernel.org>
Cc: linusw@kernel.org, paulmck@kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <ybhhwqv2xgg4g3ormfcc7lncbo75irefvdk7yn2vsctjydefyz@n65bjszpepbm>
References: <20261126084233.17381-1-qiang.zhang@linux.dev>
 <20261126084233.17381-2-qiang.zhang@linux.dev>
 <ybhhwqv2xgg4g3ormfcc7lncbo75irefvdk7yn2vsctjydefyz@n65bjszpepbm>

>=20
>=20On Thu, Nov 26, 2026 at 04:42:33PM +0800, Zqiang wrote:
>=20
>=20>=20
>=20> The srcu_dereference_check() already evaluates 'srcu_read_lock_held=
(ssp)'
> >  internally, so passing srcu_read_lock_held() as the extra condition =
is
> >  redundant. all callers of gpiod_get_label() hold the desc_srcu read =
lock,
> >  so replace it with srcu_dereference(), which provides identical lock=
dep
> >  coverage.
> >=20=20
>=20>  No functional changes.
> >=20=20
>=20>  Signed-off-by: Zqiang <qiang.zhang@linux.dev>
> >  ---
> >  drivers/gpio/gpiolib.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >=20=20
>=20>  diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> >  index 5dd4d142cf52..47ce89bfb578 100644
> >  --- a/drivers/gpio/gpiolib.c
> >  +++ b/drivers/gpio/gpiolib.c
> >  @@ -124,8 +124,7 @@ const char *gpiod_get_label(struct gpio_desc *de=
sc)
> >=20=20
>=20>  flags =3D READ_ONCE(desc->flags);
> >=20=20
>=20>  - label =3D srcu_dereference_check(desc->label, &desc->gdev->desc_=
srcu,
> >  - srcu_read_lock_held(&desc->gdev->desc_srcu));
> >  + label =3D srcu_dereference(desc->label, &desc->gdev->desc_srcu);
> >=20=20
>=20>  if (test_bit(GPIOD_FLAG_USED_AS_IRQ, &flags))
> >  return label ? label->str : "interrupt";
> >  --=20
>=20>  2.17.1
> >=20
>=20What is this patch? A v2 to the one it's replying to? A separate chan=
ge
> (in which case it should be a new thread, not a reply)?
>=20
>=20I'm confused by this thread.

This are two separate thread, I sent them together at the time, but it se=
ems
that the title was lost, sorry=EF=BC=8C I caused your misunderstanding, I=
 will resend it.

Thanks
Zqiang


>=20
>=20Bart
>
