Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987832;
	b=ZuuuoNvxk1P0Xb4sNJfQWjYWXfEum/daXUJHXrJ6ugpkccYRqsV92tevIh8IfLjqOeCP
	 w40Yl5OODtYMGzMJ0EbZfaxPOGDDtB/Y4Q5NDOHJwkIyawVXGV0cIL046AoAO5WEo/dQ6
	 PCbOtOJxgrQIiFk8vci7OltlhOy9qUELLGhqluVAolymyXzEEVIVxRJ/i9LRQPR1wr2Rj
	 L372jXhTghSZ4YJDGtfoXCt3GggXNipETyxHPwQaY9Cg9pESjbZO2qeX53qVyJiS1gFEz
	 RfsS7M+393eYYSxbs+tGdflF347oCP6gRy1UQwi7jZtefKwLLwwLts1H9I9paUg1cVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZnHY355Lmina/i/sthQaqZuymWw1SBJp8dmE6kjbEPE=;
	b=ksDnPuf9oNF10HLw0VIxkmUjbas227Kt8lwB4WsBRe93oSe9QWTshK4+OkV2+dK1+9FY
	 N2+gDgwb/ti5cnDMto1l9xq+BEEzr6vdCEnJ9ju9nXXzyIyJShSHRMwUEy00xzK63u2WH
	 vR8Gl4jeqAvWE7WFTToAgMFG81WCsaBvlswGXUCxpfYT61wPQ5DVG9+bhXiSdP/EkwHMG
	 UE2pBCMoFS8UKDxdlc+kysSFb+EEM2p3gd5YIe3QJykMb0/EyCTB/sO9h0DbbA8y9od9V
	 ugXcBlhTnIiib3oS5D9h6bl/tbtEsKawGVlXMP2DWwld5SmKopdP91zO3BQbq36QSWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WpWuB4tE;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFBF606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AFBF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WpWuB4tE
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so53435f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794987829; x=1795592629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZnHY355Lmina/i/sthQaqZuymWw1SBJp8dmE6kjbEPE=;
        b=WpWuB4tEuz5eDTzgRMqfwCsaPFnT3I15+vdfIn2Uk3cbYgtMmrQdRquS/GF9Tbkq/Q
         dR0ngIvaa3Cc2RRmzlHUp7911UQhJJvHV/Fs//eh8jZA8APDItUN1P+QsT9pokDyLPzs
         2jSeF5+4MtVYpIIr020Ce8SwRIFG8QyGOjWnOtAqKBhL1IB/15f6sJeMMLMuqIEgd+Nw
         wMj4Lmu/3Bymdzbw0QpqUZGEwAdhozDReHammO9/WMYHrdbTOcVIqXhE/crYQwgMha4z
         Mb5j9p2VK+aLTtu8yCCcQbh1vp80kisF93kzJUHD+8pampEZDp6U8NIw0+g89gjuTdP4
         UC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987829; x=1795592629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZnHY355Lmina/i/sthQaqZuymWw1SBJp8dmE6kjbEPE=;
        b=HHdn3GEgeLfMW6DH7f8eD4BsjIZae5pg/KzSrhdxd0F1UG9GpggMYk+2mmrP8W6PDy
         G7rqUrosxKhdrmmunA+vLU1xPJLS/txtOYDtJJd4a1n5HMSwn0fYnJJvrrnC6+r/+68O
         SyLUwXuQZlkZ40ycD8ToOXET+hbzDMqW0haiobxbG/xMzd3SnpEgEbLjm9wVSXr5ZWbG
         krTG+Agy0gykyo+A3GNotgEgJ2lLZ6T6gOZTiFXhX1yKtnnOBdYHW7I0X5OHNteS9tkW
         hFjuFLxLUvY1BUI9YsNKL75ykFMfV6JD1EOPGL237d4LZxVa3EZDLRTtwtu9GQGZtHcO
         uMdQ==
X-Forwarded-Encrypted: i=1; AL+hErHFQTM62fX6pQIJY4rqJ9mbW0YjwkejDkgFSpzQEZH8gI8gKad+qZyYGzfcqAbNwTVSifZS4JhcbZF8P7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N/yd8I3Mvtdd2hj6+BP6JwudLAcmdzqobDU5EzBRFwbXBhsZ3
	0PuwGQKGQKdV6ra0e22sf6I0dS3OLlQF0JvV9eNLnddS6m9D0sUhdFmJyqFcboBqeZs=
X-Gm-Gg: AZFdTZckyWpXkzUZT8fz7+V0dEqtgYNmEJMiHNAykbuGZVWFX5P5gYt2VK4BO2M4mCf
	TQy0PfK8Y8wngy07MZT7f25EbfsC4BZPOg5GSrQvNAuGUZtLHN+9wNERf380NafVoZJ98OUB/u+
	OUMlaMP+u8ffT/HeSWiup6UcHMoHMrztnaCaqsdu3Z9CwC1QJz75z86N6QffSFAQvGp8WiE0F6t
	VJEfSz/YedxpzaGrJBA/N0Gao6uPxV+N6ZPmchNVj5e0F7XoZTqRpj7NJeLu3aEaK8e4zt1mtvl
	n3n5vFdTeAOR33ox7qbjeJ/b9joshfNkH6b5HGRRLjCyokOGUlXgho/bPa81Up5Dxkdrjn77Bxj
	rnXae4rhfsL2MZVPpXsEtWir1zgnDampdAzFxrwkQkluL56WtXNdJSnIKj0IFDmsYJA2m7Mjndd
	Rp5pEc4UjOgnlBmxFXqrj+9aCZTM1JNmKSokR1yLCRJx2g6fIznRiZhiAzfBKBS5+ZTXcQVxTf8
	mXRueWct0eSzeujQJp3wRifS1U9JzQTRujXDpzPJQ79pFzQ3BDVpmHWmIcV8+r1jcEr7GsyDA2+
	GpkYPeu4wnNRpiNQuaZyYYMeCsk/b/B1X1W6fLwhmMTOGIwQMMqVs/v7MzdIJ7TNe3B8eMAM4DM
	xiu4k0mPw1MZNZtE=
X-Received: by 2002:a05:6000:2c02:b0:493:bd29:a6e3 with SMTP id ffacd0b85a97d-4a63c6582f1mr3348907f8f.15.1794987829259;
        Tue, 17 Nov 2026 23:43:49 -0800 (PST)
Received: from localhost (p200300f65f19a904dea20c2220232395.dip0.t-ipconnect.de. [2003:f6:5f19:a904:dea2:c22:2023:2395])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4a656c11f4bsm3197026f8f.51.2026.11.17.23.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:43:48 -0800 (PST)
Date: Wed, 18 Nov 2026 08:43:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, David Lechner <dlechner@baylibre.com>, 
	Armin Wolf <W_Armin@gmx.de>, Thierry Reding <thierry.reding@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Karl Mehltretter <kmehltretter@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Marco Elver <elver@google.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Jeff Layton <jlayton@kernel.org>, Bradley Morgan <brads@mainlining.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Pnina Feder <pnina.feder@mobileye.com>, Mete Durlu <meted@linux.ibm.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Rio <rioo.tsukatsukii@gmail.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>, 
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH] driver core: Disable driver overriding by default
Message-ID: <av1UwuDq9JJkEYkN@monoceros>
References: <20261116110853.3418077-2-u.kleine-koenig@baylibre.com>
 <MN2PR02MB6863F6E744D2651D2520A238D47A2@MN2PR02MB6863.namprd02.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="v3mgawp7jou3triv"
Content-Disposition: inline
In-Reply-To: <MN2PR02MB6863F6E744D2651D2520A238D47A2@MN2PR02MB6863.namprd02.prod.outlook.com>


--v3mgawp7jou3triv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] driver core: Disable driver overriding by default
MIME-Version: 1.0

On Wed, Nov 18, 2026 at 05:51:29AM +0000, Michael Kelley wrote:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com> Sent: Monday, Nov=
ember 16, 2026 3:09 AM
> >=20
> > Driver overriding is useful only in a very limited set of situations
> > and then only with very few drivers that are designed to support that.
> >=20
> > Disallow matching via driver_override unless the driver explicitly
> > allows it or the safe guard is disabled using the
> > "allow_driver_override=3D1" kernel parameter.
> >=20
> > There are many drivers that don't expect to be force-bound and often
> > doing it anyhow results in a NULL pointer exception. To make debugging
> > such cases easier, add a new taint if such a forced match happens.
>=20
> As noted by Alex Williamson [1], there's also the new_id mechanism
> that can force bogus matches and result in the same kind of NULL
> pointer exceptions. What's your thinking about covering that case
> as well?
>=20
> [1] https://lore.kernel.org/lkml/20261028094139.12ea7c16@shazbot.org/

I didn't look into pci's new_id a lot. It sounds as if it should also be
guarded with a similar mechanism as the one from this patch for
driver_override. As my experience and testing capability with PCI is
limited, I'd not add it to this effort, but leave it for someone in a
better position than me.

> > Implementation detail: device_match_driver_override() isn't a static
> > inline any more. It grew a certain complexity (e.g. a pr_info()) and so
> > was made a regular exported function.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> > Hello,
> >=20
> > this is a rebase to current next of the series
> > https://lore.kernel.org/all/cover.1790612298.git.u.kleine-koenig@baylib=
re.com/
> > . It combines the functionality of former patches #2 and #3 (#1 was a
> > fix that was already applied). I also addressed sashiko's comments. I t=
hink
> > this matches what most people want in the previous discussion.
> >=20
> > As the rebase wasn't trivial and I merged the two patches, I didn't
> > apply the review tags I already received for v3.
> >=20
> > If this patch is accepted, a number of drivers that are supposed to be
> > force-bound need to get their .support_driver_override property set. I'm
> > aware of the following:
> >=20
> >  - spidev_spi_driver in drivers/spi/spidev.c
> >  - stub_driver in drivers/pci/pci-stub.c
> >  - uio_dmem_genirq in drivers/uio/uio_dmem_genirq.c
> >  - uio_pci_driver in drivers/uio/uio_pci_generic.c
> >  - uio_pdrv_genirq in drivers/uio/uio_pdrv_genirq.c
> >  - vfio_amba_driver in drivers/vfio/platform/vfio_amba.c
> >  - vfio_ccw_sch_driver in drivers/s390/cio/vfio_ccw_drv.c
> >  - vfio_pci_driver in drivers/vfio/pci/vfio_pci.c
> >  - vfio_platform_driver in drivers/vfio/platform/vfio_platform.c
>=20
> drivers/uio/uio_hv_generic.c also probably needs to be in this list.
> It's used for running DPDK against the Hyper-V VMBus synthetic
> NIC device.

Noted.

> [...]
> > +static bool __read_mostly allow_driver_override;
> > +
> > +static int __init allow_driver_override_setup(char *str)
> > +{
> > +	if (!str || kstrtobool(str, &allow_driver_override) < 0)
>=20
> If the kernel boot line parameter has a bogus value that doesn't
> map to "true" or "false", kstrtobool returns -EINVAL and
> allow_driver_override is set to true. Seems like a bogus value
> should default to false. If no value at all is supplied and str
> is NULL, it's debatable as to whether defaulting to true is OK.
> Seems like might want to insist on a value that indicates
> "true".

Well, the default without passing allow_driver_override=3D$anything is
false. Initially I wanted to have just

	allow_driver_override

on the commandline to disable the safe-guard but sashiko wailed about it
(well, more about how I implemented it). Maybe I'm going back to that
approach.

> > +		allow_driver_override =3D true;
> > +
> > +	return 1;
> > +}
> > +__setup("allow_driver_override=3D", allow_driver_override_setup);
> > +
> > +/**
> > + * device_match_driver_override() - Match a driver against the device'=
s driver_override.
> > + * @dev: device to check
> > + * @drv: driver to match against
> > + *
> > + * Returns > 0 if a driver override is set and matches the given drive=
r, 0 if a
> > + * driver override is set but does not match, or < 0 if a driver overr=
ide is not
> > + * set at all.
>=20
> Additionally, returns < 0 if a matching override exists but is disallowed.

Yeah, that comment is just taken unmodified from the old location of
device_match_driver_override(). Indeed needs adaption.
=20
> > + */
> > +int device_match_driver_override(struct device *dev,
> > +				 const struct device_driver *drv)
> > +{
> > +	guard(spinlock)(&dev->driver_override.lock);
> > +	if (dev->driver_override.name) {
> > +		int ret =3D !strcmp(dev->driver_override.name, drv->name);
> > +
> > +		if (ret > 0 && !drv->support_driver_override) {
>=20
> Using "ret > 0" seems a bit odd since the value is essentially Boolean.
> Suggest using just "ret".

ok

> > +			if (allow_driver_override) {
> > +				add_taint_module(drv->owner,
> > +						 TAINT_DRIVER_OVERRIDE, LOCKDEP_STILL_OK);
> > +			} else {
> > +				/*
> > +				 * If you hit this warning and you need to
> > +				 * quickly workaround this check, boot with
> > +				 * allow_driver_override=3D1 on the kernel
> > +				 * commandline. The right fix is to set the
> > +				 * driver's .support_driver_override property.
> > +				 */
> > +				dev_warn(dev, "Suppressed driver override binding to %s.\n", drv->=
name);
>=20
> Maybe "Disallowed" instead of "Suppressed" in the message? Even better,
> could the name of the device be provided? For example,
>=20
> "Disallowed bind of driver %s to device %s using driver override"

dev_warn() emits the device name.

> [...]
> > diff --git a/tools/debugging/kernel-chktaint b/tools/debugging/kernel-c=
hktaint
> > index e1571c04afb5..56215e0f5112 100755
> > --- a/tools/debugging/kernel-chktaint
> > +++ b/tools/debugging/kernel-chktaint
> > @@ -211,6 +211,15 @@ else
> >  	addout "J"
> >  	echo " * fwctl's mutating debug interface was used (#19)"
> >  fi
> > +
> > +T=3D`expr $T / 2`
> > +if [ `expr $T % 2` -eq 0 ]; then
> > +	addout " "
> > +else
> > +	addout "Z"
> > +	echo " * A device was matched using driver_override to a driver not s=
upporting that (#20)"
>=20
> The messages in kernel-chktaint usually word-for-word match the text
> in Documentation/admin-guide/tainted-kernels.rst. Any reason not to
> do the same for this one?

no, will adapt.

> > +fi
> > +
> >  echo "Raw taint value as int/string: $taint/'$out'"
> >=20
> >  # report on any tainted loadable modules

Thanks for the feedback.

Uwe

--v3mgawp7jou3triv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr9VzAACgkQj4D7WH0S
/k4x8Qf+L/hWtqlrgV77gKjkQ3o8g15MeCaKb8qCFvTvBbXXBo8rkw7NzS3wgss8
dRpsoTD8At5OtGl/6aGkB4RuygBxQg27jXRPPKVG1AilLnzSVM3hIyOpy3BwR/BD
/t1iXYWgfyEjnS3/s0knXZjJKQtRMhSmurudhbU8ecCq4sxjj4QqYAB5/cUitW8P
rVVRhzXG4rTyA1J4MH3NLynXrDW4cMh7GYZyRCO9qLYRNq1XEZDYxKWRYzk9B8Xb
Aa/QqtZSgnUNkoh3cwwkAJdFWjLh417nVzFA5e7YRIRMqzbR7Au9+b40/vS++4d0
a+EPr7Jty/qPVQ0cG6+31pQCliB06Q==
=V3Pv
-----END PGP SIGNATURE-----

--v3mgawp7jou3triv--
