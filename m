Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031370;
	b=NY8gUGSG6Y+iDvDdjVnBNjYhLi03lJdm88SxVJ2mgoSgpAJI3zDSNsz6x5xDKBgbZTiH
	 tAMuXK9WRBz3PbW6sWjunNbAMwdhuJUex1UY3lekMArXzLBZ0mJEUXF3x4tnwts1aGtGW
	 BlSwUx6HQEzPjD7CHNjlLZ8mA6O3opVa/KU0WxDlDf2DqaPci9fy2gnqs3tJ7chyN5tGL
	 BB9cr8EeXz89bCYY9S/g60as7QBKGaEo7eWcLLz9MOzAODD105rJ8GFlreYchEApJ/4Eq
	 c7vHbRW9lXRDx7EI6Hd7MDKUTymntAFPYC7jLhVg8qGstJZLpcMkj7g7HkH5YN1voIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=begQ9EMChlypyub//lxO47pq8KY9nrGwe5BuP1Bsh/I=;
	b=Fob6ahhaScvOuG9+yhDfm4FjTLoDVw7leW55pm1sm299J7N5gGOo+8mfpuFhJSe5f+E7
	 Pm4rjgxrNMVHkEejpf8rvVG8R9BgCdlLmN6sIFSKYLUJiE3i5UlEMV492k8oH6g9/VgQ5
	 DybidgzXHA7zdR8s0+8cyeFdL2SfwBhD4eO5aOctbhpjwDP5aIxscwEeHlbk1AYfmKWQh
	 Cv7xUhdrdz4qDOKQwy74ym3/qfanEf4ZIgJtEBrK+MJ+MPuyL7wAQbgLy8ysDYKo3AAFu
	 PC6aJ9A1bSOoyIKG3ULY9YRP269DzDIq/EOstXGCIj2o+i5VQqCqndmIvLO4Noxf5TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pOPRD+JY;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F3F606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2F3F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pOPRD+JY
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1015559a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795031369; x=1795636169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=begQ9EMChlypyub//lxO47pq8KY9nrGwe5BuP1Bsh/I=;
        b=pOPRD+JYIRGb+YJnsxHVLvoe689lNK/6EBCmEEAIjFWPYMvgT5x6zL8DqMbEzS0k9h
         ytC+KaJHZLC8/wbYqTxiihwCj2lP4eu+XWy03hHS2x+34xYiFpV0zkRsLrCTR0LJIlc0
         4QFi0sOkVH8qJZCIqi6nH12HxQz3q3wdC/+qS1YrYsN7Vf0lZ3P3YrlpnM1S6yDustMZ
         baRcfizOT2kchZJJlK6qJ4bEe1yQE96gLqc2kppP8KOcczrwPVIB55PmdJ0rCPqkTqKh
         wbVP7YDYOT7rrCuWIQfUtPspmd7lxicyzG6O5NNVfe71LRkElGJckOvpt+SQSf0M2EpT
         mp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031369; x=1795636169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=begQ9EMChlypyub//lxO47pq8KY9nrGwe5BuP1Bsh/I=;
        b=jE+P2BsjmNujUftFVrduIL4W6XKwKDK7hqIlhxKH+MyDgtxsphycNJDNHFFFjpBd5X
         EJx/+UBUBBy7poY6Lql7ZknPFjwpVExhNw60DOoGQcCUpLW0agqCxxNe6OaL8vkrzA4U
         Bi2phjeL2VuilG1HGjuulLd0XlgbUqFW0R+yaWl1DOOAl8YBO+tdMCyLnrb/HR3BzH/E
         JohIkZnIMMPsCEn8qFUqnUrGwoCDfwGCP031z0uVr6wLAZXJqB/pyR9kwreAjVC9f3qP
         84nxbbjJk1Feo3+eHdVJ8tfi/g/mLg0ITz3zkti9cgXdon+t79SXc669Tc5ulQyqFb5m
         MX7A==
X-Forwarded-Encrypted: i=1; AL+hErFsA1ENsyraO8OXWF/pCXHL88Dqiy8ySK939BOSS8q+7nOR9jJESWrU762ghBZQEA76+X/ccuPGvYiu1Xs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VXPgDuvzwDpAZXiYrpmI0NhUzZ1/3ORSDV8PqnRY8ZIn++u+J
	XH1Rt9vEUNFkgxMcw+c31waWUKH361vfNVeAqUlbQi3IiT9mbJJSx2AT8e4Qpi1Y/Q==
X-Gm-Gg: AYBFou3hGqV870TbO5xjG6gSFsKGOAmmZToFPaFvNl3c0OjOFOetH2+i/hDW5/J5Zcv
	xUBkTXACWov7QfOn9UPbC81P9P2xnvdX7dKgRe8rbWGmdVirku77c576u46/w3oURM7TXzL/0Rd
	4IYIHfXKSnDBT+UC38jprSXC0C1tJEUPuEcHZmvYZrSXzqICd9dCC6/qk6XDP1bCLohAeEJpClF
	wxqs1Fb9AxIQQDZqb8tKaU3jezaGddlzvwN1Jb1uwu2gVSDGq/w635iA4V3EnSZqgezMz0/BI1I
	CGByUjgs7edVdiiZpjg/AMA0nccq0khfvtV2A2bgUYE6S0PNGZEXP7Fc1fyaI94QB9SHiTA+QJa
	Xuu+DjQRFAEilIZDLgwqST7/kdiH6Wv8e9j9hvaiwQLiV1WxaR17oxrQYFQ4QOUbugM+uX913iQ
	8p3J/tC8xFlBXolXVRrCI9PTpQzaCtnTRlgSrKHQLtQw8lMcIFjrMSSOu6wrvdOH/1EXGWTtmCi
	IlFXwECVAFIiD2nsLmq2dhsATu1032AIUbEuiMdUOEeLrT9f8BYZ8vIWKOrNbwknkNKFnRpzhCx
	d14Dz9lpWDFFB4Ij0qzcC+7RPiHCg4nm4x92SE7OwrrGAG/d0Y+11yRIYXRDx1Y5rfqexpqcYWj
	lgDvFlxKtfF4ycqcaHMNu1Q1chfsQTHVFXW/oVpxc0MwSehGZFKr6gxrjFormyXHSd2N3UNHi4d
	n2Ds6XROEFeu2t
X-Received: by 2002:a05:6a21:7111:b0:3e2:9f41:9f63 with SMTP id adf61e73a8af0-3fe86fcbc67mr4347212637.1.1795031368444;
        Wed, 18 Nov 2026 11:49:28 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa28esm1692268b3a.17.2026.11.18.11.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:49:27 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Wed, 18 Nov 2026 11:49:24 -0800
From: Benson Leung <bleung@chromium.org>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: wilco_ec: Reject out-of-bounds property
 length
Message-ID: <av4BREfkXS_6DWkY@google.com>
References: <20261118101555.3467162-1-maoyixie.tju@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0+/jFHw+uzl8JT2D"
Content-Disposition: inline
In-Reply-To: <20261118101555.3467162-1-maoyixie.tju@gmail.com>


--0+/jFHw+uzl8JT2D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maoyi,


On Wed, Nov 18, 2026 at 06:15:55PM +0800, Maoyi Xie wrote:
> wilco_ec_get_property() copies rs.length bytes from rs.data into
> prop_msg->data without checking rs.length, which comes from the EC.
> Both buffers hold WILCO_EC_PROPERTY_MAX_SIZE (4) bytes, so a larger
> length reads past rs on the stack and writes past the caller's message.
>=20
> Return -EBADMSG for such a length, as the file does for other bad
> responses.
>=20
> Found with a CodeQL-based static analysis tool that we are developing.
> I used an LLM to help write this patch and a userspace harness. The
> harness runs the unmodified properties.c against a model of the EC
> under AddressSanitizer. It reports the copy for lengths 5 to 255, and
> nothing with this patch. Not tested on hardware, only compile-tested
> with W=3D1.
>=20
> Fixes: 0c0b7ea23aed ("platform/chrome: wilco_ec: Add property helper libr=
ary")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>A

Reviewed-by: Benson Leung <bleung@chromium.org>

Thanks,
Benson

> ---
>  drivers/platform/chrome/wilco_ec/properties.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/wilco_ec/properties.c b/drivers/plat=
form/chrome/wilco_ec/properties.c
> index 9951c8db04da065..4ca7e874804c28e 100644
> --- a/drivers/platform/chrome/wilco_ec/properties.c
> +++ b/drivers/platform/chrome/wilco_ec/properties.c
> @@ -70,6 +70,8 @@ int wilco_ec_get_property(struct wilco_ec_device *ec,
>  	ret =3D send_property_msg(ec, &rq, &rs);
>  	if (ret < 0)
>  		return ret;
> +	if (rs.length > WILCO_EC_PROPERTY_MAX_SIZE)
> +		return -EBADMSG;
> =20
>  	prop_msg->length =3D rs.length;
>  	memcpy(prop_msg->data, rs.data, rs.length);
>=20
> base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
> --=20
> 2.34.1
>=20

--0+/jFHw+uzl8JT2D
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCav4BRAAKCRBzbaomhzOw
wlEkAP0YtE3meJcfIV7SsU4KrV51INSVwLD3S2Ab1AIQPT0mUwEA1r1aiWdk5IZW
rKBNkqBRXuxitQ00OlnfA9TFU5KdbQw=
=LwpG
-----END PGP SIGNATURE-----

--0+/jFHw+uzl8JT2D--
