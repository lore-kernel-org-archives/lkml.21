Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793366;
	b=qigsm3iJGXW88jOIkrl/CpCR/JcXKTrfRnOPvqDZAHu88SO507pRAOni6cpvUsORnBbx
	 JL+F+ArZQiaxZ31LpaFuAhMYSwz+NY/6oT7nSGkkEsB9+LIU6XpLI9CJlyZNQB47+M504
	 kI3svkd6UvXiI/CM9ZGNpAjnGYwTL8zJgUSZZSJFwUgoWYEGyaX2elFJA+wtMKq2Ae7Hz
	 Mjr12a0tM8ybCMCzHxDNMWoBPFV1oL1znBKABNsWKE9VMy7QT1IAo3kl1jhkcDDrG5oIv
	 N7qmXIFclCRo7IeZlGbqNhCy8DufUOZai9G6oKLFEpu3L74rWWT58dyKFNvihMt5W2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793366;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Last-TLS-Session-Version;
	bh=UKnCi2qkck/ki+Zdr0a3lGJDjFcwDbzsZFvcHMM3mnc=;
	b=u3w0ms7TiOaMwnDrxPChJR7pXcz0zmSxMs2uyBonFhQS9rkyl9+s04yz4w9izDP2Z32P
	 z7lrh8bHTM3m1hiOBF3+Z5ZrCsN6cXz11f3mvE0qyxhrL+f0fOQmjXLC7N3FKHnnW5v9X
	 G0/KZAeEgNAjksTilq1vReOtKpL46B+Ie0764SAiuhLtG/1oY+lJr5utLzLHqWoTB2MXs
	 7O+DSI9iVyUJqehfxsIE3JHIWafdn9x2CziCL8uehI6wH08k8edq6cHBdTcwEAt5RG0b9
	 MGRCpNQe/goL0frhAcD15oPmgVcQZYf5U9zlC7Jb3J4Y5M5Jh1ul/XJdyYllmE92t+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=a0zdRd2N;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A59606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A59606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=a0zdRd2N
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 286A1C6223E;
	Fri, 27 Nov 2026 15:29:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 579EB6049C;
	Fri, 27 Nov 2026 15:29:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CCFF11E90BCA;
	Fri, 27 Nov 2026 16:29:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795793363; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UKnCi2qkck/ki+Zdr0a3lGJDjFcwDbzsZFvcHMM3mnc=;
	b=a0zdRd2NUZBPGPKVGHjAD+vTaLjfzr1Dy8rg38l4LtKF6VzyM6ovYr9mN78+3Ru9z9uVAG
	BgpFKTBqAO2Ip3XsZQzbqvHYf9TjeCQLtlVjIwjO3TV6aI6JC8y2juUu8xjYK7VS30aj47
	pwQSAblrA0otVRjXSEa/XoIqRcQ9BMcCMVez7UgCMfM2zuQ9uUbXSu6V5djVXupRklZbI1
	zs90fs3gqltPeO29Q0DqD770tqesty2GpZrr9mKhBKmXy9DMW0TSzPLTYgKw5xcw1m0WIy
	exj4ixnjqvojDiCeGA50MHT/ZG9PD9YJtC9IfDxeLIedBOWVMvblGzzI/vGjMw==
Message-ID: <fd408d339b9a21a94649276c156ff3ab18a9b9e8.camel@bootlin.com>
Subject: Re: [PATCH v5 6/7] spi: cadence-xspi: Rework resource discovery
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 Petazzoni	 <thomas.petazzoni@bootlin.com>, Bharat Bhushan
 <bbhushan2@marvell.com>,  Sunil Kovvuri Goutham	 <sgoutham@marvell.com>,
 Tanmay Jagdale <tanmay@marvell.com>, Jisheng Zhang	 <jszhang@kernel.org>,
 George Cherian <gcherian@marvell.com>, Witold Sadowski	
 <wsadowski@marvell.com>
Date: Fri, 27 Nov 2026 16:29:17 +0100
In-Reply-To: <179574292141.838304.9533014529156283849.b4-review@b4>
References: <20261120115925.173568-1-paul.cercueil@bootlin.com>
	 <20261120115925.173568-7-paul.cercueil@bootlin.com>
	 <179574292141.838304.9533014529156283849.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

Hi Mark,

Le vendredi 27 novembre 2026 =C3=A0 01:28 +0000, Mark Brown a =C3=A9crit=C2=
=A0:
> > The previous code worked, but calling
> > devm_platform_ioremap_resource_byname() on ACPI where resources aren't
> > named causes warnings to be printed, one per call:
> >=20
> > cadence-xspi PRP0001:02: error -EINVAL: invalid resource (null)
> > cadence-xspi PRP0001:02: error -EINVAL: invalid resource (null)
> > cadence-xspi PRP0001:02: error -EINVAL: invalid resource (null)
> > cadence-xspi PRP0001:02: error -EINVAL: invalid resource (null)
>=20
> > =C2=A0#ifdef CONFIG_64BIT
> > =C2=A0	if (cdns_xspi->driver_data->mrvl_hw_overlay) {
> > -		cdns_xspi->xferbase =3D
> > devm_platform_ioremap_resource_byname(pdev, "xfer");
> > +		res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > "xfer");
> > +		if (!res)
> > +			res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> > 3);
> > +
> > +		cdns_xspi->xferbase =3D devm_ioremap_resource(dev, res);
> > =C2=A0		if (IS_ERR(cdns_xspi->xferbase)) {
> > -			cdns_xspi->xferbase =3D
> > devm_platform_ioremap_resource(pdev, 3);
> > -			if (IS_ERR(cdns_xspi->xferbase)) {
> > -				dev_info(dev, "XFER register base not
> > found, set it\n");
> > -				// For compatibility with older firmware
> > -				cdns_xspi->xferbase =3D cdns_xspi->iobase +
> > 0x8000;
> > -			}
> > +			dev_info(dev, "XFER register base not found, set
> > it\n");
> > +			// For compatibility with older firmware
> > +			cdns_xspi->xferbase =3D cdns_xspi->iobase + 0x8000;
>=20
> Shouldn't we go directly here if res is NULL instead of trying to do the
> ioremap, otherwise we'll continue to get errors?=C2=A0 OTOH if we *do* ha=
ve
> the resource then we know we're supposed to use it instead of the legacy
> one so we should propagate the error instead of guessing.

ACK. I'll send a new version.

Cheers,
-Paul
