Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022444;
	b=43N0Lwk4wlc8Rdb4HMjeQZw78zUzje2NIdOtASqC17z8kj6dirN0Kaao6pkd6R2GbEc0
	 pRQJ11P6NhDJA22R+X+OBpBNgpEYqPPdVRYH53vBV/6JPEN5gbqh1RuMy91XGzrQOMuH+
	 iefFuD1FtT2Uy2J3ZC4wYVgq1UzTgrTvceKWtc1KzTDZKgPtoOp53mCSMZT3aJbbnB5P7
	 u0hmOs47tPgwfyd5Cczb1M6zDkcbsmjXpR3BX8a9xCzZ77yUkomRJ17608C0tPUEZ8gvN
	 yNCxqjXU9oOWRv8QLI6YAhNQkcDFy97XJdfb7eIwbiCgEnmKp7guWhhonI8rNreTTEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SRfc3jO8hm18W0szPkGpvbbiPNrnIxXO2mcSwqeDpDU=;
	b=JVxxWz4CAag46+CtFP8Rm2OhXxHSEL1WwwZ4WvImgI/FfFCyc7la3eGy85CIS/Wuf61j
	 GSccyCPILAzaSTvCP9KM2uCLVo9hEVdf8dKVAPvNvlcBPXIe3jqGqIez1E0JS6Mufj0kv
	 BZXkqDK0VghDzdqNNKA5LVzFhtMh43gpgHezI4XU6lzypwvkunqVZssyzapx0hUzYpK0K
	 RzUFHx8ryptOmPzJloFyWCq2M0iKqqeoW0d4WBvDW89+di/lIhDjuKf++kA9mbLqqcZ6k
	 sm2V3wqH8fdjdBSuKNaF1AQA7obep9pePZKG3H2zkWhcoWffWmiSC77zH0EMeZfsUrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WhGkV403;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C949606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C949606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WhGkV403
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9e53d011eso10421935ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795022443; x=1795627243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SRfc3jO8hm18W0szPkGpvbbiPNrnIxXO2mcSwqeDpDU=;
        b=WhGkV403gAaXYtMtIXmIVHPSJ730WqC1tp5CIJQJGXnsK84Pr1Bb7YSmoW3Co+qCbG
         vFidlrFTH4ZhrdB8+wdCsO/0VfMh2PBrXRLPm/2O/rGIujrBdOG2IkA466/XUZI5OnBD
         Gwwh4nVdVf+3I8tyL8MmnWtA5JSOQsJmA/udeWNsgydSrC+gHTptJ8nlCKNuAqgA103G
         1TdMpfwalrqM2F/hZVjj7G5eoH6k7vgoATWaLyXhGEgNGruxwwJLGhrdV9ah2Af8hkiS
         PnvGgxNjTaTPxwK+BFUqWe+2EOrc7KAR+Fn5Kte+dUfQEKfpqq06Ay/kXJEIxt98p/ei
         co3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022443; x=1795627243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRfc3jO8hm18W0szPkGpvbbiPNrnIxXO2mcSwqeDpDU=;
        b=mzeanHFwqkOWiFTJB2unGDLcVprlkC2G1CbgQQLZukv/LYCj2IDXS36xFLjqA2VbYt
         U+Zk9ZFKJzhE3ymH2fYCzlP19OTdY2DrDmtH4xOfRsesd4j2ZrljDpUu9KmICeR85Twc
         sco6tRD3+/UhQ37MKr2Od5W8BuSjZ6oqIx3FqdOK2k/bCteV1Zhh80WYL6kU0Kwj3eYR
         xTG5Yod/6WSRg7lFTl8TQPwaW+uwpEkpwelF4KKXpX1RDElB0OtX/f9UvjJe+b2Qv2bK
         U391v8K09v/hmsWFfgdOUBKB2HJg5q/aTaK77R9MTpgei/ggVp5OGmIP3B+GSvdWlITP
         MGkg==
X-Forwarded-Encrypted: i=1; AL+hErHrOhOiwDefHX6ooWWBAqiOw17O13hck3icmDAftZrCgu0K+fhUEX/icli0C1nDdQ8pak66MIalDXk1vQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dko7Jbhj5l8RFk7+bu4DWTsa92Lc/sa+s9m9LaZWBkrJSL7Us
	hp9TP+oq/oHn9dAnXZu6cCI/B3m0gZVsVRYfJY+4lQYEzc4P927G8XYlAiuwwU/xew==
X-Gm-Gg: AZFdTZfI8/a32lwDih0GTsJK3mhUERuwEN6g0D7zLC8WD1YWA4jqFCz0cFWKBtr0hPf
	8hU9ffa+eHL4W7h9aPHxmR4X0O8kARMMaiAhKfJxNZ0YJRdfnoO9HWs0EkHasXeRFjQq3NXlbiC
	L0CAl6CCLKUjxejoG6on+fpo+9ytW+kkdGrv96gdBXHS5mup2ByAJWxslfpV98bLHxuDE+/nLHm
	yqhLKk/09M2FWVleFOHK4DRj3DtxCfwo79ENBh2wNtUR3gmGX2uSw55kLZIowA6iQAeb2ue1TQe
	32MB3BzgKnp8+gwC06VhgOhEDwMpER11l5eoH7fRX1kHqbqEvzARnV24glufc5LVOQ04DfVxE1+
	Wv7lKUu18+Omk4TSJYk29syrghnL6Q2oqKi5/Kana2SoyVqeUgL5aZSCgd+CzJb0PnAeBRHdoCa
	gkOONtP3uTGaY08bBdAWUhllqCVbUMKQkG16+k5w5f8AEz2EFByBIMWzmTltSr1E9O0Jysz7g5N
	ZMu470KFo/WfKFKV03GbwSBbDosdbvJ8FYQby5yLigqGdoWZNY8k0evtcrM1O9Kt7bwbfMKQ0jS
	hth5fX9+XiYtA9cOwyW+Bs3aggprG/US1le4gBp/MAEJtLAVGJh+WlsUmePAws0x6iX4gnXuZ4f
	ziSiao/XJZov/vD7YoYrTpl918+QO1L/8nvP/BLIJRjEq7LsBYtFyMtvHQK8AJr69LB43EksNl1
	5fOYzNnx6BiZI0
X-Received: by 2002:a17:903:41d1:b0:2ef:f280:40ae with SMTP id d9443c01a7336-2eff73f226amr35872235ad.12.1795022442252;
        Wed, 18 Nov 2026 09:20:42 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6192086sm17258795ad.38.2026.11.18.09.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:20:40 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Wed, 18 Nov 2026 09:20:37 -0800
From: Benson Leung <bleung@chromium.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: bleung@chromium.org, lee@kernel.org, tzungbi@kernel.org,
	groeck@chromium.org, jthies@google.com,
	chrome-platform@lists.linux.dev, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: cros_ec: Drop OF node reference in
 ec_device_probe()
Message-ID: <av3eZZE6BHDuNci0@google.com>
References: <20261118062949.1250-1-laixiangwu@cmss.chinamobile.com>
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
	protocol="application/pgp-signature"; boundary="voQ+Totwkhxp6RIW"
Content-Disposition: inline
In-Reply-To: <20261118062949.1250-1-laixiangwu@cmss.chinamobile.com>


--voQ+Totwkhxp6RIW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Xiangwu,

Thanks for the follow up. Looks good.

On Wed, Nov 18, 2026 at 02:29:48PM +0800, Xiangwu Lai wrote:
> ec_device_probe() calls of_find_compatible_node() only to check
> whether a "google,cros-ec-ucsi" node exists in the device tree, but
> the reference held by the returned node is never dropped.
>=20
> Scope the lookup to the UCSI block and mark the node pointer with
> __free(device_node), so that the reference is released automatically
> when the block is left.  Keeping the lookup inside the block also
> preserves the short-circuit evaluation of the original condition:
> the device tree is only walked when the EC_FEATURE_USB_PD,
> EC_FEATURE_UCSI_PPM and ACPI checks already passed, instead of on
> every probe of every cros_ec device.
>=20
> Fixes: 17f95281839d ("mfd: cros_ec: Don't add cros_ec_ucsi if it is defin=
ed in OF or ACPI")
> Suggested-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> Changes in v2:
> - Scope the lookup to the UCSI block with __free(device_node) instead
>   of a function-scope variable with a manual of_node_put() before the
>   condition, per Benson's review: the v1 lookup ran on every probe
>   (breaking the short-circuit evaluation) and the node pointer was
>   tested after its reference had already been dropped.
>=20
> Link: https://lore.kernel.org/r/20261118013935.1573-1-laixiangwu@cmss.chi=
namobile.com
>=20
>  drivers/mfd/cros_ec_dev.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 529a23b80..b8d363b7a 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -271,14 +271,20 @@ static int ec_device_probe(struct platform_device *=
pdev)
>  	 */
>  	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
>  	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
> -	    !acpi_dev_found("GOOG0021") &&
> -	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
> -		retval =3D mfd_add_hotplug_devices(ec->dev,
> -						 cros_ec_ucsi_cells,
> -						 ARRAY_SIZE(cros_ec_ucsi_cells));
> +	    !acpi_dev_found("GOOG0021")) {
> +		struct device_node *np __free(device_node) =3D
> +			of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi");
> =20
> -		if (retval)
> -			dev_warn(ec->dev, "failed to add cros_ec_ucsi: %d\n", retval);
> +		if (!np) {
> +			retval =3D mfd_add_hotplug_devices(ec->dev,
> +							  cros_ec_ucsi_cells,
> +							  ARRAY_SIZE(cros_ec_ucsi_cells));
> +
> +			if (retval)
> +				dev_warn(ec->dev,
> +					 "failed to add cros_ec_ucsi: %d\n",
> +					 retval);
> +		}
>  	}
> =20
>  	/*
> --=20
> 2.50.1.windows.1
>=20
>=20
>=20

--voQ+Totwkhxp6RIW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCav3eZQAKCRBzbaomhzOw
wnVSAP9WrAENDjApVabuubZU7RXGbf5xkUu2mC8dIJ42VlH6BwEAy249hyi1G7wN
76T5cX1voG3/ZitraD385Vac7ho9bQk=
=8b3R
-----END PGP SIGNATURE-----

--voQ+Totwkhxp6RIW--
