Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503844;
	b=4QUnAvDe16LzhdG+MAvXdbdI8IfTLLYDxCV9BKwSnOzMlb9AWXmxMg4ZQgQ92MSTwzCK
	 61AZCc52mirY02pukHn5pxCtViOrcGSka5D93cc9xxTJpQeWx20dR4rSo+UczNKtZPd8v
	 wItb/AH38/j+mfuETn86VH78Pgudh7rQiM3Ddkz3YAQrM23bUzmwdGIWbyxvLVsvpBenL
	 +L2mF5hN0J97m40p+5i18JKvMLI7bgdD+ozxZmvjU2dim8OhxKMYic3RqhXjbPmQDiZkf
	 9obx0CbV2PKe60H/tkVdlUDpP4zjkQf7DDS20I6ySw/4HLdI8BWn04UFvLwZiyFFEVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=u9CfLSB0A/imouTNwCscyC2a5gvZbUF9dxOANpM616M=;
	b=HDP2t3N2LVbsUJ3nS9L7gAjVn1j0R5KtKoJX6LCsFswoQvPi+E2ryNq+4GPLYrtUT3Z/
	 3+4rZ4/mEinQs2yWImn+QG0+vCngl1qXqx6Jv+bybhJeQ0Q0PkMgmG/MUf8mALQM7Aqdq
	 TvCS3RG/+ki6MnKQEt57ncfq2VuBT0qIMKDqkiI1tk6uM4R2xw32z+Nn45t4nVCAzDkhs
	 BdfnHkArNftNk0hFBQHd3pqEdWhBHIHjWRt0jrb07EQFh02TBjnHOwkSsYscrJdkJxhYG
	 HAJC91pPxZfN/M7RvBh13nacGq3ccGYgpU7W39gKIogvGBu2h+vO3JR2GwtQ89Vh7cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TSd5EhdS;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5FD606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF5FD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TSd5EhdS
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492690dd5daso3123904f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795503842; x=1796108642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u9CfLSB0A/imouTNwCscyC2a5gvZbUF9dxOANpM616M=;
        b=TSd5EhdS5HWoldS72aSwl8raqNrMw4qaQGCtOIDFAWntsggjKhZVLj6dUDuxMfbVby
         R/rpzCXcvYfpE6AVYL3PB0ZuZHCzrP1UZuiJ/PrDKTGxgeEgfX0drypqw9APEzT317Zp
         4Pzd4g2Cso40ADMvMC7bNNP69wmAcUoETtmRG9r+sxd3cYFCIC4pMq5X4vBHE8PtOALf
         qPLTZ92Z9GZiNTr8MAMYdzf0rD3fydxsUFvqpNdPhPBKVp29fVfpF528SSZcNEHYvLfm
         U59qxqYdZFmy4UxZQDtm+P/g3ejj4LKAnH5R7dc+Wy+k76UCbfCPYL0inPdIamT/qmya
         Qbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503842; x=1796108642;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9CfLSB0A/imouTNwCscyC2a5gvZbUF9dxOANpM616M=;
        b=TXhnq6uo0BAz+3HGkuaMkd+INsuAKPl8uES7Rm/x697u+CF5oOz7qiwzm2MYLxyuUd
         auTtcR8XHLXfVTiOH7+pkUEAWgZzKE9pnyHNVJFtXcFkq6nTYQIrzKJ3ROSBHTKQaRxj
         zX7i7sVD37T02AyFz/rUM97MaBhqBsxZ/FVTnDRQJ4OosxvH3hfEU0emk0qjafWUlFD/
         G4yRZaZSqJJY7zfMXlc5+IubmQUelYBhAg3JJ5TxZ11g/l7bZJG+RpZIm8H6N7t2LLEd
         3JZG+xxh+T2oJ001c/r2h59E8F8KJmCbpnUu+j5p9oWnKY9ZZ/WWhtLNfZtmeVXrJLRp
         bu7w==
X-Forwarded-Encrypted: i=1; AL+hErGNSuC8FEvzlUGUuWtMkrXW731nK4nYJSaaXcBk2HEoPs1Eh+zdQ9nTGOTXiu6uGEiHZiLjAMp5bCZ8xEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QhCbo2RI7+RIy/QmV0s7GK26FYRWT6rtR2NGV94QWQr1yPgGZ
	+B6kOqGo432NpXpdC7XElxjJ5NuUr0k01HEPayK+TFAbWpYV608pxRHIgvbwMO2J4QgbKtv14jf
	Lj1PF
X-Gm-Gg: AZFdTZfNFzczRhf/+/R9Aezm8uk25gZF3WxAX+QHnL3brmDqroezcdSSOCTaiBw714j
	tXfY6wd1FpzHnO6Qb2a8TeQjvwn9o3jcFAWRsXyRZosyiQibOYPW28W0AHS9MSZ4hzGTj4lz92C
	PH9K0kJRGfBqoCj36CgTXllgNrZRbnVNzCQlYD1jX4ZHLiUoL700DDYAeNm1tq/y6o/NLEv7uUc
	mwF+Sbt+m48rjwZAECuxLPakhzpJoefuBWMSuEBm8sfE/ZhScI0wDsRx/+axQB37MQeukqfqhw/
	vjiagV8KCJIbLebWmNgSWP4LFUi2mgKNsHbM2vjGo2wlq5MYU0cGhgLN6geIzUFeGgNwTrw6zql
	AgkbQYsHgZOdiRmk1JRdVRcwGzo2E6QvhAzMuXtaPYe80eb8FiAGbaaSczmN/pteb7b+MyeDNGi
	ihiIdIbbelXhKsr6xKkCAemguYHSIKAas9s0PxmefRYmQ06PiDXIUjtwQ5rxJTEzry0UZ4qwGdD
	HHkigF+gHCi6kZGeZWmVprJ+Q47J/tVBjGQ1YIyXu6h2kHDEN78Lr5N+meW4QXvNLbz97BH7CFU
	GEUyz6YQLi7A7o+XCWZKV8GNPq4VVVAwdA==
X-Received: by 2002:a05:600c:8b5c:b0:4bb:741d:ea0 with SMTP id 5b1f17b1804b1-4bb8880f621mr286056745e9.17.1795503841981;
        Mon, 23 Nov 2026 23:04:01 -0800 (PST)
Received: from localhost ([2a02:8071:6e30:8500:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884911e3sm490535995e9.6.2026.11.23.23.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:04:01 -0800 (PST)
Date: Tue, 24 Nov 2026 08:03:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Eddie James <eajames@linux.ibm.com>, 
	Jonathan Cameron <jic23@kernel.org>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] iio: pressure: dps310: include what the driver uses
Message-ID: <awU0bh5ChdbAsArK@monoceros>
References: <20261123220649.36887-1-zoone.rupert@gmail.com>
 <20261123220649.36887-8-zoone.rupert@gmail.com>
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
	protocol="application/pgp-signature"; boundary="fszsr5ckxyppdn25"
Content-Disposition: inline
In-Reply-To: <20261123220649.36887-8-zoone.rupert@gmail.com>


--fszsr5ckxyppdn25
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 7/7] iio: pressure: dps310: include what the driver uses
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 12:06:49AM +0200, Rupesh Majhi wrote:
> Include the headers for what the driver uses directly and drop
> linux/iio/sysfs.h, which it does not use.
>=20
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
> ---
>  drivers/iio/pressure/dps310.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
> index 7581ea4c99ba..fd17fa38e9fc 100644
> --- a/drivers/iio/pressure/dps310.c
> +++ b/drivers/iio/pressure/dps310.c
> @@ -18,28 +18,40 @@
>   *   c0 * 0.5 + c1 * T_raw / kT =B0C
>   */
> =20
> +#include <linux/array_size.h>
>  #include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/bits.h>
>  #include <linux/cleanup.h>
> +#include <linux/container_of.h>
>  #include <linux/delay.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device/devres.h>
>  #include <linux/devm-helpers.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> +#include <linux/jiffies.h>
>  #include <linux/limits.h>
> +#include <linux/log2.h>
>  #include <linux/math64.h>
> +#include <linux/minmax.h>
> +#include <linux/mod_devicetable.h>

don't add <linux/mod_devicetable.h>. I don't know what made you think
this is needed, but it is not. i2c_device_id is already provided by
<linux/i2c.h> without the overhead (and useless dependencies).

Best regards
Uwe

--fszsr5ckxyppdn25
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsFNtwACgkQj4D7WH0S
/k48zggAl4Iig3L62WdS6ePjBytal8tQRFPGsxyBA1NXxl2jcHEwwl14ShW1cBmP
P+sG7lpdy/pLgyQH+GduRAlUtQugN+nE5imRC0GBeBHUUhI1f+2fk9MEKSkTGdM+
jYrfBEQNUYreumF7jFT/3xtzexQYQs3JrKBxQazIqC3iPg6baCXjCjQxn97bNYxz
lGFVy1AmRyu1ZvcDzWUciIpN3RzavRG8OulTFsnLeYUppq+mgBUx0mTSPvx+Mx1S
l+b5LBbZjAih5nvEIxl+l2NPhqTwp8l+qLgdZlJ69ZaIFQicBXwYedGvwuVtf1LK
MFYVpywwKtcVCMTqx6RmKhDGWJMPvg==
=cIBF
-----END PGP SIGNATURE-----

--fszsr5ckxyppdn25--
