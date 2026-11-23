Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424292;
	b=Eu2LQrkxLAvNkV8E85lZNuq2ttOfZrJysneSqG3h/nF6wKvg+STggPLRSRkkxWbynAPD
	 RoYbLUwA1gwuhykKeyFRYendLNC/oqrUIJSXZ6rRdKfHI/3xC7Qoce9qD2sL6a57DrXx3
	 OKZR36aDc//kv/V9NeWRkrznS0u32+eTwX2ziy+j+8CHkfYwENWSr3U0OqP8x2I0I9qvz
	 urGDpEV0hpw4gYgPwA9LfVm6etDxgp2x1HtKS4FHz2GngmAz5uIRfaNRhEJWY0Bg3TeuX
	 zAWfxoUUbw0r3oowhtaLSFhfu4Y9A9tDkg9HaWathQhmLdwi5yaRm+aHLaNq3E9c4jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=l+9MbVvTDshgnA3ihP8j4dNe/hCNqTIen79WI8/6oxE=;
	b=SyEcQA7r9y+ECUiMSmtRlnbGAH6TjxkCHMpvNbOBqY3Iqe8nxayhaaNatpv3dHwckvey
	 nSHZLutIQsdovzFLn5MJPrDWuwBKw8fkk2t99Q/qa8ujhDNuokTojuODdKN0p5ZHnvRk3
	 zAVF9bn/GTnW71s/oY77BKS+HnC1sp6SEuWbPMqytWjV4qfFg3MtLmBk4V9uZvoIt4G+T
	 XdB5NY0KXN0bXS4FNrBg3IOI96u8odbOS1RDckOs6kymuCMLtbY5B7G0yQHskVEsuusV1
	 /iEQbayMsxcRyGgDQLp5PjcJyqylVd6ksWXqWzDuLemehuwhkI+DRTcOZRshKikFVKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KUI7vxQE;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F45606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F45606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KUI7vxQE
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso36238725e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795424290; x=1796029090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+9MbVvTDshgnA3ihP8j4dNe/hCNqTIen79WI8/6oxE=;
        b=KUI7vxQEHVSgYI0WTlM0iLgMy2gGH6gN5WINMssJRuZLubhxgA6SJdej7XEoGlOyjm
         i4dhZaiyMAhbmJuWcQRxoFcIRzAit0hWnSnf13BZg4bbyexTeSssEEugVydrZyoJvQu5
         4myY/NZd0HH/cqTLpISAnh4h1Tf5kp+h+ffzmbfxQoMbZBdXZ4ItwbDfW+Qrq4Pr7wxr
         VsBzC7uyUkxRk3gSL9lU6tztd9GAJWNvvE3HZI16zAVjS6Tznh/34n2GNhqe9ac6cdVw
         TcPURStYdLmYywEv6UDc8e7CtNA4rCcQMfwoIvR8D+M4WiBnbd6HwESUt+lvdAw+UZ1L
         LvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424290; x=1796029090;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+9MbVvTDshgnA3ihP8j4dNe/hCNqTIen79WI8/6oxE=;
        b=liqMXxRFuwnueX3UgrVbQwuRx1VExcQvuzZKSc5dHL6/YL5BlyimpnpPZAWP6qhEJv
         e4Sj2F0IuMaRt2OKmwC/04Ms3HZYNyJR+E4fbKBjvLNQNWIqMSEqDCV5BzQAdxyK7sOB
         X7ibYP58iZbo4UAjAYDdPknwi6dHN70YpZqoo31LEZ7zMKcNysq8c89rgDANI4vl0/ol
         UecNHKFPntHuSMjY6VlLuAn9v1rMen/1Bgf2HdIGwSipEJHb8FVfOeY/KQP8mmXyV1I3
         5fLSlXC5Kl5V8rR8CxhGQ85tDX9gjN2eEkVA3+v2ofDrcK4xAABAlSC2XkkROp+79y5O
         1BEA==
X-Forwarded-Encrypted: i=1; AL+hErF+6j2dfZrsFUqycgrvPf9Uk0LhvEFhKSKHy1JQ6+KlpaAAMlnGYPHHTUfzCvJuZfXegPTMFinTxHIfCeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z85lIZjAwt7KYkFCydCsGUtggtZy/oNpnLLJTAueRt5I+FsrUNb
	6icZll8tgC9dzTP/f0m3K2QIq3hpXFosPKyzKKW3wLi1mdiAd/jSjdzkrJTRc5s+teoix/QRcwC
	IOnWl
X-Gm-Gg: AZFdTZdEiYBlpmE4+EXM9QLGowd65OxzTH4/I6aTc6Bf+tsiaRhvq8U2kTkw7eIiMh2
	uQADnVY2gXJnpIK7Ik24zbKKuqFEU+vQLUiC+xrgmkEJMvChrJ4FfS9YWrRA4Rk+ofZGmwTeNQj
	QbdEnPpZwfu+aQ+C4JVm/1eCSB78wh0SJvzOJhuSbn3zH7z2GALMpYTGGwmSJ6Qwsmu8sjtthBh
	vr4ignGLKWqFUSBfAJOzmv0k4e5us9DYKfh/8Xl9uHiY2UW/jC6V2giafA7wagP53Z5FOcRUB/E
	YuzPTwUbE7hDWVA4guZ+72K+jl5sXmvGCBYKCDPLSFFjhz9p8eJjuJAgbJEyo4SFnaoCoG6rYAh
	ERnfOh1cIOZ4hHl1KByBRGlTBPNBJJKuEwVYccR4StRXwQ26Mk7U4u7DzlREbKIncLT28HzwTy0
	Ajxp7L7VgPx3BSoFRuaMVD5iKVkYAYKQH62pUTU+jpJdMAS+R2xHIFC9ktpPGK0S7R/sqKPogjU
	hY1cvwoqMKU3BDgyZKmszKtH1LQR+/nfD8ycD2O5LwDUUQyYFO2j6e2YRzZxh6u8+LGWGvN4g3W
	VQSAIwOPBMiDobCWSYWx5N6YEzPoVlIuTAk11qhRqEu086bf96hIGDAq+g1BuxbgXGBzeo2uFoU
	2hADxcX6iJ0ATck1jVx2X7bdckL0MmAnQHrIf+A==
X-Received: by 2002:a05:600c:3f0a:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb8880cde7mr211375095e9.22.1795424290183;
        Mon, 23 Nov 2026 00:58:10 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8849247asm331942575e9.7.2026.11.23.00.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:58:09 -0800 (PST)
Date: Mon, 23 Nov 2026 09:58:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, giorgitchankvetadze1997@gmail.com, 
	amin.gattout@gmail.com, antoniu.miclaus@analog.com, gregkh@linuxfoundation.org, 
	mripard@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/8] iio: adc: at91_adc: convert to
 device_property_*() APIs
Message-ID: <awP_vX8zyTNCZGUg@monoceros>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
 <20261123070101.53868-5-abdelnasserhussein11@gmail.com>
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
	protocol="application/pgp-signature"; boundary="yb7ur3sdfis2fllo"
Content-Disposition: inline
In-Reply-To: <20261123070101.53868-5-abdelnasserhussein11@gmail.com>


--yb7ur3sdfis2fllo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 4/8] iio: adc: at91_adc: convert to
 device_property_*() APIs
MIME-Version: 1.0

Hello,

On Mon, Nov 23, 2026 at 09:00:57AM +0200, Abdelnasser Hussein wrote:
> With no OF APIs or struct device_node left in the file, drop the
> <linux/of.h> include and add <linux/mod_devicetable.h> for struct
> of_device_id.

That's wrong. <linux/mod_devicetable.h> is a dependency hog and should
not be used any more. You can rely on <linux/platform_device.h> to
provide of_device_id and just drop <linux/mod_devicetable.h>.

Best regards
Uwe

--yb7ur3sdfis2fllo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEAB0ACgkQj4D7WH0S
/k4jWwf9FOlwkqlYHms84ZIP22YljXL5kC4jGI63Ce/xclPb7V+GpzsB75YAqYlm
GWJKN5/ikOKhG/Nz/hTDiqbmVIgcqG3XOULPz4itm7V2+ZTQyRvfQsirNJzDaxTQ
PFo7krPE3pBFSIBcvunsQr6/d+VMNUhHY0rSDcr2XsHs7BjG29muEdAbr/TLYdOe
iqt0GzTnTD96mAJSESDLQWCtgNb9pbl/El6PLhlXyWPmkhj3kIRMf92w75zB2zLs
JEpcrCMaIBg/wL3OE7CyZuiqEENsbh6jmorJXFqTOEps80hcJbNlOaN3RDTKNnG1
G1xKxDMU6BQx3J60p4ovhMokWQcSkQ==
=t6hY
-----END PGP SIGNATURE-----

--yb7ur3sdfis2fllo--
