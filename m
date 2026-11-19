Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111396;
	b=aHHSIi/NlHzNAJMkxSTnX3+e8Y4snTcqlpBUh4uXCWQwIvaq61VXBoYKF7RlMBvSHklL
	 wnrj8Y2nBho3u1xTp1Bqe/R9UhphGh2GNm1EpLlg/K2NOVL5rMxeoogwHTDZRcyjvnP15
	 2Zcke5Oxtbn5cDzvuOfgqZ0SvH1wTtjOfwtwOsPhpSYpS9IUiYRGiwN3Jug8cKBxEJNfh
	 hxyOt3bu816QDsL7/RvEvcGRFrgqCmuM2qdXgCZ6bn8n/1JmiycxOdgNrDYOfQ3NwVAIp
	 QWbYm9YVyi5+lXIPKRO9q59z11W5CcfvCUgVzgTs7jtrs9/SJeXZRuGG59LCLOPm6lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=M3aTvEzquBrOiSj2mlzWhSxH+izz4607hFK76/YmCDk=;
	b=nmfPx1d6WsY+LeTL6PG4Qtu0QWoAbSxVjrIP0AjFqXWg9YrLW2VAiEJ0nd1TBsaNmDgA
	 MXvjXSqQp4P82Il8HQ5wY35nEPy6/ARa2N7dR3G36WRWM2SJn3EpieLJ/PMMgtd9IPuWb
	 U2fFP+aiwD9UxgvjM1PUW0TZdftiGECl+fQRiismxdWxIDvJdInIB+dEsHp5kQP6Ogu34
	 ZbZOXjDe5yMa8z5U/6xHi4UrRvQRhR49ETtzxq8wxIXg2j/0A++g+aL0FQnFxiFHRPPv4
	 sva8xC2NyGY1jMxT25CffxTQdgiy9G+dWXmats1D8+Cj7H1diDfazOq2BnfEasKt9Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MqSC4DAg;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4972260A2608
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4972260A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MqSC4DAg
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso18607305e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795111394; x=1795716194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M3aTvEzquBrOiSj2mlzWhSxH+izz4607hFK76/YmCDk=;
        b=MqSC4DAgywaLe4KR5xqH3of1cfPM/uiKIncJ6UtFG1Rz3EzgT0FwejXVHVXEB5ci/O
         TftKKjryaTOwn85SS2I+3aFA9HTGAdgvHGmGojzllNvS7zjClZgeo0806BhgRvBvccVj
         pvl8czaOEK+PvuDXD4lsl6dfvtzVKyaDgWW4eIHExXeBqxXaS5ZfSyOBf42VLPt+H7dr
         Xpy5nSgnEB+M+TzN25HAV+Ni3O55mUW8zFDnAALpU7+wX1zMSmRkAVqxlKqmk9SpGxvJ
         1LNGqpYHPMZ+Lx24Wg53TNzDWPAcMgGZEccrcDhpAnYU6Mji9Wo8fqGAcbKjCa0G/VWx
         4V8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111394; x=1795716194;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3aTvEzquBrOiSj2mlzWhSxH+izz4607hFK76/YmCDk=;
        b=vqookaCTfhmWMGyF1vnbDcLyV4yd8UBOVzI/IveBeid+sGlGSpC4eUMXBNXJVuABUR
         HkE0lJEZ9WAnDbbMxY5nMn/5oR0+mP035IybAxlB8wJ1KL1xM24/ZTYr0OuopKs2wS3L
         fV1QJzNGz3Rp18AR9Qe4/nqpLs6vPjbMUuxZCey5Uw1Qt02zR8Pfpzyv17vhRtJJ57oi
         +leWMcKdBxc5VC6rLOCnzbNl5Gpu0L2PLLeXRgeqOPxpF4LRZHqZwqaeQDSKBw686fEj
         8PZVPc3rpdKNKv7MBprRnh/+itsTpplRprY+djyrPj9JJuaL+GDsnwW1dSD74Dbx5wWW
         OMdg==
X-Forwarded-Encrypted: i=1; AL+hErHkwnTiV3Qb71AkDjD5LB+oz4M61uLuNe+6glcU7rusSy3bGjK0P72ZHPAyi0e33uuKiZjj9jIMeJFiuDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cKOJE+yGDa5Ta9K0rU+3nRTFYhgl1+uSBYniJDnWet/sOYp/7
	yu1loHSDWkTgLJfCZ+/w0nKOxUUKae1dIYEWgNp6wKeAFhhVUhyashMeFVq4XFdTBUs=
X-Gm-Gg: AYBFou27IKVKV13vdM23GE71f9i2dF/ZP4wAYPV17q1URS46UxpvzpAfbz0yf31NurA
	Hk/uIcn5I8U9qSKr5V1BDrhIGNiVLH89RLwxvCgkoAPBeyTZaM9TNJmDcZ0ueSsXtni2sl/L8bJ
	uay7/Kxj4be5tF3imirIBc0dnBYcl4vkJJ5rpMXfNiNOxi+MegrXgMMzm0B5xq5fxCh4C109vIA
	nkpQLE3fJtBT2+pStW5PsZavsuQegFS3bkcpWV1ZIAt0gvLP1NYVTwHPGtOohjaGGtKXUkiBagI
	LiBEiuk4VPEvrIoHG0InC61nkTLo728LtlBKhNbV2Q5AD7rti+3Ot9poGzRiqk1ALUQD0dRSbYu
	K+f1Q8e35H3srlY49+V6RYE4fOW8Zo86JhVm7liogZZkDt8DAhSGuL6QYFL3K/+JpY/fqCLGpHP
	awMIQgm9Pjvf0qrhtwfOGuqBJLc8Bj+6x3XiWArYdp5Dz4ajxxSWPzuslpkFTgQmzjrp9kbkxWs
	x20K+T6cC7OosTeYOT4OwM4lcD2YpvcbfOtSiNFcG7a/GWP/ORYAcJ5MZqXnsrMnf40X83iC8nu
	lrS/183F3/oxkGhdqhf7OIkIMJd//IIfIuUQ+iCzTxl5HTpjGNSLS6IikyR16hgBls8idb9n1TK
	Ytsu8o2TrrgtAbw==
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr7335575e9.29.1795111393609;
        Thu, 19 Nov 2026 10:03:13 -0800 (PST)
Received: from localhost (p200300f65f19a904994d80f004b20d71.dip0.t-ipconnect.de. [2003:f6:5f19:a904:994d:80f0:4b2:d71])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6c340df4sm1143252f8f.55.2026.11.19.10.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:12 -0800 (PST)
Date: Thu, 19 Nov 2026 19:03:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Anthony Krowiak <akrowiak@linux.ibm.com>
Cc: Alex Williamson <alex@shazbot.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	David Lechner <dlechner@baylibre.com>, Armin Wolf <W_Armin@gmx.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Karl Mehltretter <kmehltretter@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Marco Elver <elver@google.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Jeff Layton <jlayton@kernel.org>, Bradley Morgan <brads@mainlining.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Pnina Feder <pnina.feder@mobileye.com>, Mete Durlu <meted@linux.ibm.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Rio <rioo.tsukatsukii@gmail.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH] s390/vfio: Allow untainted use of driver_override
Message-ID: <av84kUIYQ_Idt889@monoceros>
References: <DMYH4ED3GWDO.29DGXPK4M82VR@kernel.org>
 <20261119051507.3306075-1-alex@shazbot.org>
 <aca4e70b-3a8a-475b-b2fb-ad9d1a44f254@linux.ibm.com>
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
	protocol="application/pgp-signature"; boundary="rnhi7e7twhetgmlw"
Content-Disposition: inline
In-Reply-To: <aca4e70b-3a8a-475b-b2fb-ad9d1a44f254@linux.ibm.com>


--rnhi7e7twhetgmlw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] s390/vfio: Allow untainted use of driver_override
MIME-Version: 1.0

Hello,

On Thu, Nov 19, 2026 at 07:14:47AM -0500, Anthony Krowiak wrote:
> On 11/19/26 12:15 AM, Alex Williamson wrote:
> > diff --git a/drivers/s390/crypto/vfio_ap_drv.c b/drivers/s390/crypto/vf=
io_ap_drv.c
> > index 8e69ed286bb9..2d47dc643269 100644
> > --- a/drivers/s390/crypto/vfio_ap_drv.c
> > +++ b/drivers/s390/crypto/vfio_ap_drv.c
> > @@ -62,6 +62,7 @@ static struct ap_driver vfio_ap_drv =3D {
> >   	.on_config_changed =3D vfio_ap_on_cfg_changed,
> >   	.on_scan_complete =3D vfio_ap_on_scan_complete,
> >   	.ids =3D ap_queue_ids,
> > +	.driver.support_driver_override =3D true,
>=20
> Does this really belong here? Shouldn't it be in struct ap_driver
> since driver_override is supported in the AP bus?

ap_device_probe() calls device_match_driver_override with
drv=3D&ap_drv->driver. So I think the assignment is fine.

Best regards
Uwe

--rnhi7e7twhetgmlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr/OdwACgkQj4D7WH0S
/k7x+gf9FZVgAr7FFBlDRjq6odYeaqNCOaCFNVlsdz+mmeuvFoiyhQGlFuLA5fBI
RI+cAKOjVw6JQLaNWU56WyXOjyMbZ9rX1X2wiPj4dx6oWxUQ0G4oyTpMx5M9e7yX
JKEEMhBjk2hmDBDO8qTnVhrPzy+7pp0orXoElqEDT46+aZRSeBMRcSLzripwP5P2
0GBczvM7k943oKVhZ/4VuYKxowT7ALpC+OTDKy3ALqIuhhIvTY0LGjWdrDU7XBx1
NWAf33X/vh9oQSepjVMFnBaOEpOdIayc4ILJCCVuX6stvlriJCTtFBVtzja/AGZ6
BrG53U8a5eWfIY/nnztu6uaaw9royQ==
=LHa2
-----END PGP SIGNATURE-----

--rnhi7e7twhetgmlw--
