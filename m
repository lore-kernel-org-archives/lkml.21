Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627509;
	b=gZCvco+vAGm/ZHsUwajVHm9iVpfvxwnXhV2rYvWGwiTQHF6l55qZAr+Y6uOx3ZaAg+bj
	 7xge2he4ld5xYLKtogAVbtoggAZOWYUWLiBEp/fqLPu3a2GhW3zH4672RfPAz18Yr6Vbo
	 +6ewxsQCR2M91jh8FlID6zoL8lV8lxE0ult64CrCrqB9fGGpfXi9WebaXBXfGJ84aOF/j
	 EDwdkqPlFHmhhHAuW76LeRTecq1eCeDskPQcT8ohMXh5RLp89O4JtkZiybVpRSAW1GrzE
	 SG8BIJbdWAjZwfz9teWFm4CfrV5wmjkvi5SYyTTmpCPmHNhWb7J0B2cV8pJem3MpEiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/2ZiDJ9tq36ZHWmXeHMEUP2iypybL2OmKVpnewLrfEs=;
	b=UlhGPgddI5evk/VLkfNyj1ZLR1nXU3ehkdGKzq2EUH9/Fd4iVoKhJyrN4REIltrhR8l7
	 texBqy49qvGyu3YtER6ORSiZHbpPf1FsucQFicHjluIoyh9x0cISJSrYEqhYdsY3mFrQq
	 YbVee19CnhIH+2cLUM4A0fxztMLYD+sEx9/Wh/1auN1wOJ36vZEHDKI8O0nmFyaxFh4BJ
	 dD8AZVJkIYPBczv/bka5b6MwZflKEjLg8JR1zozNABPxLzhf4xsbD4iYUxV2FxtLOpyLj
	 vsEP48B1wlmXoRqlatVy4W9JxLXScFayxD9uu41hM/uDHMUmlknL+lLaWpcmbmvPRvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=agASAMky;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B9B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B9B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=agASAMky
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so5367271f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795627506; x=1796232306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/2ZiDJ9tq36ZHWmXeHMEUP2iypybL2OmKVpnewLrfEs=;
        b=agASAMkyh7IeB5xcxG2SynQpZ9cwqr9s6pyhZje4+5sgtLYF17fiy4iKBPZ3zR93Bo
         IHFhWwUhkkw+zJjiYLOI8PuYuGv8QaHDxmsxGmkRnRLNf2LZjXI0+k7pJkj0Qm3MDQX5
         Vm/X8/CQt978aK3oG2S/3+AjAjzy8BIBo4NaftuGTaVeHlaKqaPfAVA045b2MYwksz4F
         eVK3XLqVp6tfXrU4ITxnF5oc1Jw7Jthwz16IaUBwraGMnBL/6JTdSx1WRmDZhIxjr/MP
         CCH2zcKnJo1tuyTbDAIiMAjxpA3/bXg9GG+6ssbf6N4oygCF8Lo39aW6YDK6Dm9BMySj
         EmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627506; x=1796232306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2ZiDJ9tq36ZHWmXeHMEUP2iypybL2OmKVpnewLrfEs=;
        b=1esZytDxcOA9LnrdJKsDAZ2yWf55CZDIk5MMU4DSdUJz4WD57iB0UckOvmubmWCC10
         vQ/lyjxMwVWg13VpWi3+dJwcP2KpYGGm8GJ9PEoyWtBBdmz6duc9ahFez+tAr8/En0fu
         dOqfokJtkbDH1Fs3NeRQXBAv8VkZp9tvhpCxvgJ0/dQXGKwP060vA/12s0eL25N3AG9x
         k9ajRs7pJHhIQ1+Mzs3CX8QFZ0U/CDnAC4jieSCK/eI/0pPg8RQwi6cS/GQasfr1ZnMo
         YfyZgDMin6OG+EoEESz7UcCJBS/UA/b5Gr880sfCm9/fKeP/fVNMI8Lo3S4RstFNHpke
         McNg==
X-Forwarded-Encrypted: i=1; AL+hErFFaEOQlJsgOLiM1tQkFqugSqqCRc+yGb6lDr2eja9SiGeLISL1IKSo7EcsHXy/855FVw5FAFJ4tPIicQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fiHYQH4vLdDEplLpdytJU5znNsbyeJFf5eI11vKozFTpAyvVE
	4568QGnFvFPoxK12pXEWZv+RgoAGUJ5DW2i03a05RxkIq+eHLs+GM1JjxdyEe6ZE18A=
X-Gm-Gg: AZFdTZeWPUbmKesjgD3t1/KFZ1US4idAbHY4NMqMQigC3dSQy8ZbV/jMyi1porkl3Uh
	OON3QAjau7CvnyWWJI79/ClGG4+mYi547DanB4poXCWoPJ4mneEdMVHnWrfNs7yh5ASgPXVSVxJ
	Ddc11tOg0uK7cD/ImaAXoldbsZubUQpiXwMZ+OBfUP3Yd/qTGhHnoJ+Sg3GSJoq8CrXHCuDrsve
	Y+l9XBvc647woRyndSC7DRLyq3kw9exJBBOTOPMhY8Ab+v3U7QvFQ82D3Yz7FBo8MhyXlSSm8G7
	EGEjx/FWhJDouHnyjSc4HLd+QcBq2JWGAQV52yA1MKOLDEmFdnGGXftiFiHeQpJ8WedwWiGgpUi
	ZGhLh6+/ay8RbhU/uQ8lpuntFFYMT9yPV9Z4S3GqwVzcJuKrn3ewlUq+MDz4wrmfh1wQOw3bHTB
	qd862yQu/h1wsWc65tf7HGNeGAkH/Xkk0d7yDjYKiSoCdrUor9fFxN4C2jlfXGJ3aTFTtSMMrIN
	n0mTWJRZ6DsqjubbU4Cpvh3jPdzWZ20rRShFL3JKvsBRAIgAGDRdTHiwjOOOo3ypBhL4vorsks6
	7GNmvYf72y1H+a1vV5sgBtr+T0UEMc520eHonyzFUlyQz8W8TBmYUjkqUSGmNDu0byMHABgygmg
	M2AZ5batoHFaYlnGw7g==
X-Received: by 2002:a05:6000:178f:b0:4bb:c85e:d565 with SMTP id ffacd0b85a97d-4bbc86e17b5mr436127f8f.55.1795627506305;
        Wed, 25 Nov 2026 09:25:06 -0800 (PST)
Received: from localhost (p200300f65f19a904452474b9d670397a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:4524:74b9:d670:397a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab658e2d1bsm37047838f8f.8.2026.11.25.09.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:25:05 -0800 (PST)
Date: Wed, 25 Nov 2026 18:25:04 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Joern Engel <joern@lazybastard.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Michal Simek <michal.simek@amd.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Brian Norris <computersforpeace@gmail.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
Message-ID: <awcZcuSbse5g3FWK@monoceros>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
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
	protocol="application/pgp-signature"; boundary="nbybrdipqtjlxyaa"
Content-Disposition: inline
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>


--nbybrdipqtjlxyaa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 04:28:26PM +0000, Pawel Zalewski wrote:
> This series is converting lists that contain the *_device_id structs,
> to make use of named initializers (which they do not use currently).
> This work is part of the on going effort in the kernel associated with
> device-ids [1]
>=20
> The plan is to convert *_device_id::driver_data to have an anonymous
> union, like it was introduced for PCI and I2C device ID tables.

Not sure I understand that. PCI and I2C wasn't converted yet. ieee1394
and zorro were.

> The goal is to increase type-safety (most of the existing casts are gone),
> to improve readability and to make use intent a bit more clear:
>=20
> ```
> union {
> 	kernel_ulong_t driver_data;
> 	const void *driver_data_ptr;
> }
> ```
>=20
> But for that to work all lists containing the structs need to use named
> initializers first to avoid triggering -Wmissing-braces for that field.
> This effort is split per every subsystem into:
> - pre-clean-ups that convert the lists to use named initializers
>   (which is this series)
> - actual implementations that make some of the modules use the new
>   driver_data_ptr member (which is not needed in the mtd subsystem)
>=20
> That way the task can be fragmented into manageable and independent chunks
> of work and makes this effort easier to review.
>=20
> Patches 1-3 implement the named initializer change.
> Patched 4-10 are just churn to unify the list termination and can be drop=
ped.
>=20
> [1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@bayl=
ibre.com
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

with or without addressing the nitpick I had for one of the patches.

Thanks for going through this
Uwe

--nbybrdipqtjlxyaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsHGe4ACgkQj4D7WH0S
/k7Hxgf+JDQD3nuNyQeHxxoBDQbZLCdeqai2FGzqlA/wVP4ILYtl0Hj2B4Uvb51m
TWG5nlrssz3YpBalM5hoN7zT4/kYrvYV+kEZwlQ0rRaST1L1WSsaI+hIrd+sFqjI
E8CbBh9BDS8e2lqRUB02P2qNgrLW8OGoqjf65o8A416iktJ3LaEisuhLP8aVKb9O
G9s0nSWXydrbhPM3eKUGdumEvZViZRDTbdQOOZ3Ont4s0nic7RCuY5HxIJAv5u7h
n+QP/LXiSy/47VdwvRwqyJDfGxZnUzMHMxb0X6NQg1g1C/xCJFt3XHlD/eUHbI7K
axkOeY5ogCnXHhh12ds+XESv7iHqCw==
=xvDo
-----END PGP SIGNATURE-----

--nbybrdipqtjlxyaa--
