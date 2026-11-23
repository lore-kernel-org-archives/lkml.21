Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424146;
	b=grJjMxJrMYMW9ZM/cO0Et4Gh50f2JMNG6krbA5u9pRF6kq58j5f98EoVLmjZvhD2dhqj
	 OKoPiHKR1FJmeEepRxshWFriFXZ0yGPAngdELILP+LPcJui3o1XMKXWomVdyz0Y3U4NkL
	 CjQln8CeD0Kr/QSUl5l2T/Gy6sLH8aU9sc68Hpp7QQM9YmgXFmXOTbnIOvwaS4q6vdWtH
	 pmpq/etxXYzkkEQC0MB92a1W48FDqq7MLYoqa22n6I9H4cmpgXM45YC3PhP3CFcLPD+If
	 VW0I+jf5XLTEEdHDYaIloldoq8KVqVtn45nu07AD3zlInQEoCuLvGPNqRA2Y5pBBGnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=f9MB3bWT0jyY4n2Kpgos+T2A2jxKzbR0OabGMZP+mY0=;
	b=qvrQQ7IAKxRVsrRgmB+huavhL1/jfmBITsK2oYWkHyrDyJQlAAlEBf5k/qap5kYAZy21
	 sWMSEzyzp7OvOiaYiUQv6nXE6IZanHBA6StZJa4DVOoqtbycKQGvD6tZH5BL8iXoqzE9U
	 acNYZApI3F1+uoF76qjvDvzD8OmCnl5JZsZrXEqzbP/v+MfxIcHcUGYUZju7E2rqoBU3E
	 WfrfOxyKdD8A7hBr78e1pvCl8kbwQgZSt/PhLvqmNT8J4/uyyQz3l3pA3oSlMfPqlpbXx
	 SCZc+P9IfaBxmqq8+9oh3JWcpPi3n8+7+J6Fb7hAxD8YVtaBQXkwDuDUU9ujfaVY+KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mP+n1NDd;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC82606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAC82606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mP+n1NDd
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so28713865e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795424144; x=1796028944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9MB3bWT0jyY4n2Kpgos+T2A2jxKzbR0OabGMZP+mY0=;
        b=mP+n1NDd/D0s8lxqJL3tG8GRauiJoUDrkAIVwyOJAH2kuHDDZRcWEVWjsqfIiHxoFS
         z7dO92Ze1yXpoNijQ0QsgC5GZJtZdC6CJCn62UvTBp/rjFGq44e1qd1aF6mvseodzhV2
         5fTmDW9ugwWXjI8xCrWcISVADVqHTMYMeIz3xPGym6UMdgn3h3TBZ+tdG70SlzHOUBhY
         l7szPfmrVsHBrE5f3ds1gyd/KfwmawNn9lCpkwqmROk3cxxCJS3l35KejjZOcbMzjfeT
         aHLndUyCnJEfzZAwk5KT1gFTknUfotNECA7IXGbjAEjRbX+XF5sacR+C5vSWubzsUhVa
         e9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424144; x=1796028944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9MB3bWT0jyY4n2Kpgos+T2A2jxKzbR0OabGMZP+mY0=;
        b=NbqjICSg8DV1c7bTuv2bc78PgqSs74VdoontVUi4YEVpeFMPzl7Gv2Vq1g34orui37
         6uirF0YFUfsnqUDWDkQtfuX3bRzpVzjA2ZaPT7LE3iAMJBsCGKsT1wU1l4tw3Bg9RGhq
         zk8DIgMDhtO1xcQ9q8lG+ntlKqSCiIuDEiMyf9n9XWR+/u8TTbTshkDPqy8titDVuRFR
         HIJGBo2Yv27L349VUto9E+tKLZfvVVPCUn/uuKgmuO37FDG8AmAtUrcDZdBIL6sybVS9
         zw6aIbgaDdipDnw2vSEX05foPNfr6cC44BIyi6M2kX8KZobYW7aGqcj+Wwj3MOK4XD2U
         AtsA==
X-Forwarded-Encrypted: i=1; AL+hErFYbsWY/8EPgIKz20bCaJi6QXgl72KFHRDLcDrZCOt/O+pim5gdfL712/YIvfISbou7iuJ0PoMVQuPaR1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nl+0W97OtxYqOYLPigvVvxY8Erwmt/pLcHJbMpNKnDzY6m+Wp
	Wv69Fk9WE/pJddukvQSJ+udMrkODHcsxtBGCU8ZB3LBoZlUiLHEk63IQ2A/ZyPeIbTY=
X-Gm-Gg: AZFdTZd9ZLNhMEga0SjMtnqUK/npj9Ima+RuRRmpE0bjZ2IjEv9cgEyKxcUfcHrtquU
	+UfZHS4HzW6JMPpMvpu1N/6jAO4+sPpsmPohei3bQYeZ42hEjZMPtMBTb4X1ODdau1s4+uxZNpK
	C4aZUTpCgjvJgg85AhQv+5AY8lp2ezDOmebM631TwXEgg52k+czd7+aj3uR4K8NCh1iDbuKuJMd
	kMC8LnjLwc3ip25Ko4HiJZi19a9VSgwnErBRW6JUZZf3p/wdxjBSg88AZQV47Y+tQwtiSejW70i
	Rxg5EnXM4WczW9ajCRdj/s2T0iMNISR90U2VOLQVss0FMZDbJ89Rnk0GVB8AoowBbPnT+oDac6P
	SmK1c98K6DJd0qfcW9MFlGPbpNTM6TEgoNoUhw3qptWOdvATjgeyeONH3dwRdi6ESfnBzwyGNb/
	hLMocC4V5O/rSDcqiWVp7fT4NcZsOOjXp1nxDDIJm5ZVQSbn0dlYeY4s/9CJSEQWuTuH2eCPLzj
	3dYwHtdidIP45PLgHMBxe0hng/CYrM/agvpJIANsEvah5tLOLw1u8NDesPBkd0nmHiw1XyjfxIj
	bwFNJLFKnzuVzfNk13Cim5qr4Ng1LQAf7s6IgTNQyUlTyzZqBUvFsjmyQIPDiisPkcWqNgzwzYd
	h0XWmaz6jbhYC3FfL
X-Received: by 2002:a05:600c:4f84:b0:4bb:5f3b:25a9 with SMTP id 5b1f17b1804b1-4bb88820f39mr208644975e9.30.1795424143773;
        Mon, 23 Nov 2026 00:55:43 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6bc8ce06sm20503412f8f.47.2026.11.23.00.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:55:43 -0800 (PST)
Date: Mon, 23 Nov 2026 09:55:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Kees Cook <kees@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Florian Fainelli <f.fainelli@gmail.com>, 
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH] w1: mxc_w1: Use devm_clk_get_enabled() in mxc_w1_probe()
Message-ID: <awP9_l7UNqElhewY@monoceros>
References: <4b99426a-d831-4d55-9b3c-ce83ba9fb081@web.de>
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
	protocol="application/pgp-signature"; boundary="fwfemldnzzy4vyl7"
Content-Disposition: inline
In-Reply-To: <4b99426a-d831-4d55-9b3c-ce83ba9fb081@web.de>


--fwfemldnzzy4vyl7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] w1: mxc_w1: Use devm_clk_get_enabled() in mxc_w1_probe()
MIME-Version: 1.0

Hello,

On Sun, Nov 22, 2026 at 06:03:00PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Nov 2026 17:52:20 +0100
>=20
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>   keeping duplicate source code.
>=20
> * Omit a clk_disable_unprepare() call on an error handling path
>   and in the implementation of the function =E2=80=9Cmxc_w1_remove=E2=80=
=9D.
>=20
> * Delete the label =E2=80=9Cout_disable_clk=E2=80=9D.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Not a big issue, but for me the commit log is too detailed, most of the
things mentioned here are trivially visible from the patch. So I'd just
write:

	w1: mxc_w1: Simplify probe routine using devm_clk_get_enabled()

	devm_clk_get_enabled() combines the functionality of
	devm_clk_get() and clk_prepare_enable() with an automatic
	cleanup callback registered to disable the clock in the error
	paths and at unbind time.

	Simplify accordingly.

> ---
>  drivers/w1/masters/mxc_w1.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/w1/masters/mxc_w1.c b/drivers/w1/masters/mxc_w1.c
> index 06be7bf0b715..f40ea120127c 100644
> --- a/drivers/w1/masters/mxc_w1.c
> +++ b/drivers/w1/masters/mxc_w1.c
> @@ -98,14 +98,10 @@ static int mxc_w1_probe(struct platform_device *pdev)
>  	if (!mdev)
>  		return -ENOMEM;
> =20
> -	mdev->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	mdev->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(mdev->clk))
>  		return PTR_ERR(mdev->clk);
> =20
> -	err =3D clk_prepare_enable(mdev->clk);
> -	if (err)
> -		return err;
> -
>  	clkrate =3D clk_get_rate(mdev->clk);
>  	if (clkrate < 10000000)
>  		dev_warn(&pdev->dev,
> @@ -118,10 +114,8 @@ static int mxc_w1_probe(struct platform_device *pdev)
>  			 "Incorrect time base frequency %lu Hz\n", clkrate);
> =20
>  	mdev->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(mdev->regs)) {
> -		err =3D PTR_ERR(mdev->regs);
> -		goto out_disable_clk;
> -	}
> +	if (IS_ERR(mdev->regs))
> +		return PTR_ERR(mdev->regs);
> =20
>  	/* Software reset 1-Wire module */
>  	writeb(MXC_W1_RESET_RST, mdev->regs + MXC_W1_RESET);
> @@ -137,13 +131,9 @@ static int mxc_w1_probe(struct platform_device *pdev)
> =20
>  	err =3D w1_add_master_device(&mdev->bus_master);
>  	if (err)
> -		goto out_disable_clk;
> +		return err;
> =20
>  	return 0;

This can be shortend to

	return w1_add_master_device(....);

=2E Looking at w1_add_master_device() there are error paths that don't
emit an error message, not sure they are all -ENOMEM. dev_err_probe()
wouldn't hurt.

> -
> -out_disable_clk:
> -	clk_disable_unprepare(mdev->clk);
> -	return err;
>  }
> =20
>  /*

Best regards
Uwe

--fwfemldnzzy4vyl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsD/4sACgkQj4D7WH0S
/k77kgf9EmPcIEwAzVRo6kECyMEJc45Xjnn9AdThD7oC/Gx6VUMQQbPauzt2UPVq
EPGTRco9qjVrbKq5TD+9PnMqvp5YpyujTitlI/4Ot30bdC17egDfWuTjZJ3tkh0J
yXyV1jzLTy2HUKizAclwIdiVYb+ma7idz7GXO4uab/wsXytomYiuffn41vxTC6uN
EStMlztHN7uFwxmiiies0bPR9k2pMqP8HbFcHI5b+DYJc3AGTwfZ9RUBWNrux7tb
V3yWHM69SXZzWDVhDEQd/mxBjlxfXztMiI14uz2I1W2cLjNd+7shMWip4SQTGrxi
gcS1M6jY+9uF29+WuZSxazEv+bsT5A==
=o1fQ
-----END PGP SIGNATURE-----

--fwfemldnzzy4vyl7--
