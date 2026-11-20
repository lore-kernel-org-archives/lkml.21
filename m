Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175295;
	b=Z/L96uZ+G1pfNksnh7yLEMDLD1EAjsMiio84l3DKka3dBh7bwFOir3Rf8VnX24IWhk6k
	 qMozLt9BGMqRFRZcg+LCwEFAswqLHAJgDiJ5VyVci/PGBh25uPdpF7qB2ocezWhWgKdcr
	 6Rx4opZavo03tpT/WNrNvNiYObbYp1XZiCp3zG8l45jf2gvBKydkNP6HfSFO1hIoRQCKn
	 M7pT/NEYQZ85HutUVASlgSj9d4BiMH3T0owRDENCaorRHC/cb54v9aAvXJlDI4SHgzu+s
	 Qo0GG+MQ5N4c4jxyAaFwDmFsdovNOJRAZPy3eVUMl6IB7cKD14Vqz663BRafvhxoPiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Sw86TAA6SyN/v/4JSFIXw0cd7MgHiDkuK2mBM34qIhw=;
	b=sWe7zCbBsyFFmCTEpn5ULcjeqIs7i6yujRy3Hy6oM386G06/GCoZtifuEP/YSfSK/FPX
	 kZoJdo42pRkyZpN40703vOllvo7cEd1vBcl344CRtB7gx/+SNlNnS7XvEw1KOUSUtvFW3
	 +ukJ7YeioPty6a/w1pLjf/93bMxY/86cW+EoKfkZHCnKLPk+jGoRAPT2J7EmKNPbQ4xLe
	 DIqoRLCPggDRT0QIJ2/Mm+6quFKslRxHOjzwMlD7BDXpRbB+1G0teZF2XtXMZZQQ+J8d2
	 8uwaoK8DLym0c1jNPGnC62HRuIkaUwLOXooAWeHbJpQb8uYGnQGw3nnY2gyRB0P2nfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EnQ75zMz;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46072606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46072606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EnQ75zMz
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a9be758734so472326f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795175292; x=1795780092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sw86TAA6SyN/v/4JSFIXw0cd7MgHiDkuK2mBM34qIhw=;
        b=EnQ75zMzFcsNYIhOhj5WtMC4nneDEbxdDpsvgL8astfv40uZyk67gSwidrESCxcxgZ
         6HloHebJbnU/LlJzBN01hH1ymx3dMgnJ2CpjPumtCyIwKBU1td5gFp50m1VcKYxUZ9Ev
         yfXgo5wWFe+H4adnPWg7z/9Q78U7sIOmbYUZtyDW9jl5OLW63yAqO5uSuMBDyyuXouJQ
         ZBGs5pNG4E3ulZg5uauzgiMJjwm7M+VRo2IQeRQV9rfTRaLb/p7rGUXOW2xH4Odkxpwv
         41qCvOWfsA6rk6ZJFxIt6ZuT1Y8Y76DHrhBaKeR1IrvBndYIiWgHo5Tg1COGV5tXgPJM
         ka6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175292; x=1795780092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sw86TAA6SyN/v/4JSFIXw0cd7MgHiDkuK2mBM34qIhw=;
        b=kM1kzh+ZONdBYWIGklS6KaPM6WLgbxOyoNthrTsdTsgl2BNZQWAz66tTIFEAEzEzyO
         9llO13LsUnH86mcj425jGWVxmW54pxJAbucuMhPuluklxmHidj2EvzB0dfvvp61V8d1H
         iod6n3YZ2mE38WFwNWROzmbPJ3oUgVmpN7NAi8IBCli8GhFzUmZsAIN0HpQLHRgrz7h+
         ATzYYXuylom9ZL5IGyU/It451Tw9KO2XO0aKF9dHeQfygT94jUMfxGnBeh8DyNIxwztF
         YS2nqCcvpDt9qf61jB7sSlnFVKqETOWKFGfRYbtRk3C5E1v70ejpOQ8JDiry25j3CFf1
         OgAg==
X-Forwarded-Encrypted: i=1; AL+hErE/hJvV1J4Rz+K5xupAxic1Nq4yDuk72z19mfiWVE8K+OWH30qbN3glgbKXfxY9KQIjf0rfWD3cEJ1LSTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+apt7dZl3WUDv41+q49j0CV7/pBzK4tcbWBV965OagkLfgX2OT
	6tQz6BHP4yjATQ43JUNe13YAP2pXF03x3Q0wgOKHKjSyDTSf5I9Bg32ozwZD/ynOWm0=
X-Gm-Gg: AZFdTZddf9eZ6meHbJ6mam9yGR37ldudsLaXIpp+39f7tJ2Mt7kmAOrkmI8jk6Mjn6n
	eFTiCQ4tkgeEL8kO1o5RfNnE2m+cIVzOZzJCQ7/g8f1Q2hspg+IL9E84xmd1QonaOooH09OIvIS
	eq00hDxjIETRuGFgktXT2u/GJlA10jjqywewBPOGZXvgeXZBGV6POYZvb4+RBa+zixxuZUxYGyQ
	gDwQc2E4PP+Zp4xct1guI+MyK5Dng/Po/XcQv8oEzYqmkrZNIyFginv0NYUqnccKenAljSQOset
	LWSBuiOYzjk630xJ4UujFDMJWVbRXUIByT4z0QWWqS7sYx4WB+jHdPbAADdl4ZFQCnBt2F0DHeE
	QJzgzzevaIUL7Pleqn+TD+RSlX6Sd7vpBatHunMg9yj8rOtGAwB3gH6XBQqiNdNcnKOg6UpVH7V
	jVt9/m2PAEY1Ksn5fEo943VZka3imxHoZd6nionFnz0or99U7LC+9/EGesijouM3HGHwXqmuvyQ
	DmkmXU4LG3RBL7sGQ9LOKTZKwKkkchKMOrEYl1lp1Zhii77OPPEuSvjEhRgWrI2AgHBKNXbCNPQ
	IJ5Iad2dv7IlI9t3Vk0Gvb8S0pH8O4PlzOwJh9T5MBFjXbIovQ9CJkhBeqJvCMa4UCDWz0BINz4
	PXuVNnV7q2YgoSDIZ3ixEoGtHtQOjN3ktQseYSg==
X-Received: by 2002:a05:6000:1a8d:b0:4a4:6669:7f9 with SMTP id ffacd0b85a97d-4abb400bca6mr5874552f8f.49.1795175292597;
        Fri, 20 Nov 2026 03:48:12 -0800 (PST)
Received: from localhost (p200300f65f19a904be03815e1634e776.dip0.t-ipconnect.de. [2003:f6:5f19:a904:be03:815e:1634:e776])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab658e2c8csm5394408f8f.2.2026.11.20.03.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:48:11 -0800 (PST)
Date: Fri, 20 Nov 2026 12:48:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Charvi Mehta <charvi.mehta@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Rathinavel Sankaralingam <rath.sankaralingam@arm.com>, 
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: Re: [RFC PATCH 02/28] media: mali-vpu: add Mali VPU platform driver
Message-ID: <awAzFsX_VUbzTqK4@monoceros>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-3-charvi.mehta@arm.com>
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
	protocol="application/pgp-signature"; boundary="qvydzoq4zesd354o"
Content-Disposition: inline
In-Reply-To: <20261119153758.1426673-3-charvi.mehta@arm.com>


--qvydzoq4zesd354o
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC PATCH 02/28] media: mali-vpu: add Mali VPU platform driver
MIME-Version: 1.0

On Thu, Nov 19, 2026 at 03:37:32PM +0000, Charvi Mehta wrote:
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>.

> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id, so
<linux/mod_devicetable.h> can just be dropped.

> [...]
> +static const struct of_device_id mali_vpu_dt_match[] = {
> +	{
> +		.compatible = "arm,mali-v76",
> +		.data = &mali_vpu_v76_variant,
> +	},
> +	{},

s/{},/{ }/

> +};
> +MODULE_DEVICE_TABLE(of, mali_vpu_dt_match);

Best regards
Uwe

--qvydzoq4zesd354o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsAM3cACgkQj4D7WH0S
/k5DkQf/cgk6stCU1NBfAdhEZ+zxJ6rOBVYVdtcPuivB9POWQAiF75S+YotgohjC
s22HbJ19JiNT68r+8GqaNce4eND7JuioyoyehC4Ghmq+KPZu2sbNqvUQieLSPPcu
9jbJOJLywY7Yr1eNrw4/HciN0FUf+G6HU5caxEZsBmTqt/Q1Op1E3NKChCuNYNpE
mUjAyuwDLWFcqtLlePnqTWbzoruWjKoG7jOGNwmYyisMB6C63WD27Q+nixcbJ114
bEXA+AZ0gKnvFQ8uw31kcG9U3V+dfiQ5FDNKEATVVPW1wmEvd3v581ruaKEeUOw8
jTnn3+G6WqcROn9Q+kwxllOO/p6b8g==
=dMOh
-----END PGP SIGNATURE-----

--qvydzoq4zesd354o--
