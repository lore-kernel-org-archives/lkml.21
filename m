Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178015;
	b=Ufc84xGQ+MGilwovvY4CgsFUDWuX/mnvpC8QGjOiux07q7qjwRcD+msT74TBThUBQclb
	 KcqBS9HWDfUD0COjWp0sMiScL0EpOBTuXbVDXSgl+S5mdH3mJbYn7L+JwEToHCS3Il0rd
	 SZ5E0wSTF4ILeMMkWoSR1isepLOyGZGEgvCQCu3n2oJdhH2UsK59PMnDMPmsPkaHtvc1M
	 5IcKCpwvwa+2rFg+VVNCtDYXpduAsrdwscWtMs/e2MoXlfg2kUjv5AyVXwnPzBvq1Rsli
	 1cSitaSnSMYs4Q+/ikfku/zF314pJ5/p8oh1DXHbMpN94MMr9uSQ2N88NY102KhfNrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178015;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:Cc:
	 From:To:Subject:X-Mailer:References:In-Reply-To;
	bh=Cd4xaVepHD72b7QviLbxkG3jPYSQ+lzF4/87vIxXYlw=;
	b=S4VYwvBT8Kg/OE8+wP4WxuxGH/2QTSRqudKB3YS4DgagiL+ca0oXNOqAtfG2/objHR/4
	 gPwA0fINRYqOUURX9nWu++X6glKJxqrR0jL3s0xPuzVBg6JcM0s0iSBBfSzojGEQWSWIM
	 jLOD8p0oEucOoRv0XybCp41WV5Z6DFogtDibdTDuTm7Q7lDzHEcIdXQ149nTsD/sWGolL
	 gIZxW6Jm6Lf6N3gKik1UT0d8s7P1vjWI2KipHsBzqWTR1qevlG6oPZoOthpK7YXilsmPy
	 ZtKChR7zOSKHdUDIUGQDlg6si8OpdPx3gDCmyfTeNxLcWm/szLg0rQGUvZcQ+Y1pRPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z47ZNjNR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id C9078606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z47ZNjNR
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 900061F000D3;
	Fri, 20 Nov 2026 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795178015;
	bh=Cd4xaVepHD72b7QviLbxkG3jPYSQ+lzF4/87vIxXYlw=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=Z47ZNjNRpA9CyKNaylkPEkwMygpR3kcuL/gT9XIn892aoeg8o2G6nKyaHsLEhp6dj
	 qC/Gcoq4O9fB/ayzLR4w1bswm7EeG3KFmj4yCRR8dEashZHo4lL9Xw1+/crZxQLU3a
	 rQVIIL8tDP6euNmGIpuXqWHO8oSsJh1eUTMRDZ/mE8Ux9hqVcOVECpe0SD32s97KHz
	 Ey+teYRqtAzd+L4nK92DSVikbtt6+8w8NEh1XDCMUYVE1frIMtCHEhS7JhvBujClJK
	 OGsOBsgLhCZpZNvmEUbXDGeC1L56gG6OuwtDF3ZjKv4N2fcP0zzNq5qrXL8TigIdOz
	 WpKzCaAbBQztw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=9582cc259129a8f4ebe4b845f7eb0ba9f1675c988c8d1e0c944e8705bca3;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 20 Nov 2026 13:33:31 +0100
Message-Id: <DN01HTG5U6PY.1I5VK9AJ07JLO@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michal.simek@amd.com>, <git@amd.com>, "Amit Kumar Mahapatra"
 <amit.kumar-mahapatra@amd.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Srikanth Boyapally" <srikanth.boyapally@amd.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Store GPIO info for resetting device
 during resume
X-Mailer: aerc 0.20.0
References: <20261120-nor_11_20-v1-0-70332a54037f@amd.com>
 <20261120-nor_11_20-v1-1-70332a54037f@amd.com>
In-Reply-To: <20261120-nor_11_20-v1-1-70332a54037f@amd.com>

--9582cc259129a8f4ebe4b845f7eb0ba9f1675c988c8d1e0c944e8705bca3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Nov 20, 2026 at 12:01 PM CET, Srikanth Boyapally wrote:
> From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
>
> Upon resume, SPI-NOR triggers the hardware reset API to reset the flash
> device by toggling the GPIO. This step is necessary because after resume,
> the flash needs to be put in SDR mode. To facilitate this, SPI-NOR needs
> GPIO information to reset the flash device. Therefore, a gpio_desc member
> is added to the spi_nor structure to retain the GPIO information and
> utilize it for resetting the device.
>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> Signed-off-by: Srikanth Boyapally <srikanth.boyapally@amd.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 11 +++++++----
>  include/linux/mtd/spi-nor.h |  2 ++
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 90524c58602e..11227f8fa8ea 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3389,11 +3389,14 @@ static int spi_nor_set_mtd_info(struct spi_nor *n=
or)
> =20
>  static int spi_nor_hw_reset(struct spi_nor *nor)
>  {
> -	struct gpio_desc *reset;
> +	struct gpio_desc *reset =3D nor->reset;
> =20
> -	reset =3D devm_gpiod_get_optional(nor->dev, "reset", GPIOD_OUT_LOW);
> -	if (IS_ERR_OR_NULL(reset))
> -		return PTR_ERR_OR_ZERO(reset);
> +	if (!reset) {

Please set this the proper way in spi_nor_scan() and just use it
here.

-michael

> +		reset =3D devm_gpiod_get_optional(nor->dev, "reset", GPIOD_OUT_LOW);
> +		if (IS_ERR_OR_NULL(reset))
> +			return PTR_ERR_OR_ZERO(reset);
> +		nor->reset =3D reset;
> +	}
> =20
>  	/*
>  	 * Experimental delay values by looking at different flash device
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index b3e3c6b10186..46b1f92a490a 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -374,6 +374,7 @@ struct spi_nor_flash_parameter;
>   *                      settings that can be overwritten by the spi_nor_=
fixups
>   *                      hooks, or dynamically when parsing the SFDP tabl=
es.
>   * @dirmap:		pointers to struct spi_mem_dirmap_desc for reads/writes.
> + * @reset:		GPIO descriptor for device reset.
>   * @priv:		pointer to the private data
>   */
>  struct spi_nor {
> @@ -415,6 +416,7 @@ struct spi_nor {
>  		struct spi_mem_dirmap_desc *rdesc;
>  		struct spi_mem_dirmap_desc *wdesc;
>  	} dirmap;
> +	struct gpio_desc	*reset;
> =20
>  	void *priv;
>  };


--9582cc259129a8f4ebe4b845f7eb0ba9f1675c988c8d1e0c944e8705bca3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCawA+GxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i+IAF+JMf0qAHeaawsOdQyUSgx97VR4Xj5/77x
sC0kOwHMuzvBbaakKD/Vs6k/7fPLxd/rAYCu8W7HFLv1JUDjtdhNE6qWAob3Ae4/
hIrMfmbPavGNziIF+dVDy78K63tG7oF7q/0=
=1hpv
-----END PGP SIGNATURE-----

--9582cc259129a8f4ebe4b845f7eb0ba9f1675c988c8d1e0c944e8705bca3--
