Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789250;
	b=pPIuKRY4wmv/MwkuxVj0V9tY5OXjzY849kaZaOPO63J3QLlQteFUVTo0rRFAgFw2beVW
	 zOLGvvVzg8xqZq3CzL1OMMrLDckVdYrOKDxW2Q1R7MHzd/6yxuEkiMV7XA6t14dCiXHy2
	 QRfCgnk5ZCLZPreiyG4IXzah7n4A1LeozOOb18wXfw1dKpOgJUpwOZYSpgQc6DPQBG9sS
	 OrNJlStaluQerLCeL80rkBhhUYvAM4NAUQAtBaSmJYzOnREaOlXBzZRNn5wA2ZlzTRuRL
	 sl+0srWk+k3UB7PnIuBHFbpCGvZijNkBe9pYIeZnheOwrytOO+vGThlrljE4oF9MBxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789250;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Last-TLS-Session-Version;
	bh=6RlqKNDJafGcHvmloSCC6w2YY4+OIN/Uqr4hTcsP5MQ=;
	b=0PALGOMbQLJvuUtqve13y0jRbTOepNNixbczSNYWOuaAHkLSwHsTKcq9wT8s/fiCGrRm
	 iHTBL7ORl8NefurqYmlpJrzfDr3de7KWOu9jXAF92gDCo+9ORNb9r187v8GaHqG+6pBgh
	 EKYITEN+04m5Ut560UhBare3FLhNzMSOsBgPXdqVmR9nudQURv6NZ3ZHu4MIQoNEKxyHG
	 8ib4A/BNGg+2AEhDSYiQB9Jsz1Gk0iMMOjrXDpsgTk+5qod9KmJFABHyzWS/0j83fNeUV
	 g0gAdIWODo83hRA+fuy7HgpL0/YKaNZ13EzfCJp/vkex7YEWsO1ttw5Ff26IG7VRNkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="h/ULD6tL";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D840606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D840606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=h/ULD6tL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4431F1A1836;
	Fri, 27 Nov 2026 14:20:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 121EF6049C;
	Fri, 27 Nov 2026 14:20:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59AFF11E68FDF;
	Fri, 27 Nov 2026 15:20:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789237; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6RlqKNDJafGcHvmloSCC6w2YY4+OIN/Uqr4hTcsP5MQ=;
	b=h/ULD6tLmDGowQqyUTP1aYbbVNWg8QPINu60gPYqefLq1OTI7dUMXXliPCLPLkf+FSmNYz
	kfC88i/bB3lCgcLpzAhVEUrT162zs5PIElTR5dSUCUuTfQIJG7Vz/Ceus5GuanDOrFqb8q
	tIn335ycfv8GqUGyUImBsUKcfLxDq5IRVajoojr+BFhzgmDLPBBxFeofOfigmuF0yKktWM
	L87ZU4nsvBx5CcapclK9bWTVxMeMvlhdZuMucmSEyQnTQYGaS+nbhXBQkFcwiI6kJBPQsa
	LBFnghHAYFLRYF4j8YzMcsDXZGD1UTIrcmPhkXmipvUBv3G6wIoddzv/rCCwRw==
Message-ID: <83bea8441ea9b1fee1ec5144c335b5cd8e2de168.camel@bootlin.com>
Subject: Re: [PATCH v5 1/1] ACPI: platform: Add basic support for ACPI 6.5
 fixed clock resources
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Nov 2026 15:20:33 +0100
In-Reply-To: <CAJZ5v0g3e26eZG1_yRQzMfPvPYiiv0cHZE70V+_U+NR4kxEpJg@mail.gmail.com>
References: <20261120161020.297735-1-paul.cercueil@bootlin.com>
	 <20261120161020.297735-2-paul.cercueil@bootlin.com>
	 <CAJZ5v0jeJSx3C8hdU8iAtje-NGNz4DdaVGhE_T3WpVrODuwemg@mail.gmail.com>
	 <80b96fc3f728b59b26ebde1378f4222cf4b359b0.camel@bootlin.com>
	 <CAJZ5v0g3e26eZG1_yRQzMfPvPYiiv0cHZE70V+_U+NR4kxEpJg@mail.gmail.com>
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

[...]

> > > > +static void acpi_platform_init_clocks(struct acpi_device *adev)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev =3D &adev-=
>dev;
> > >=20
> > > Note that &adev->dev is not a real device.=C2=A0 It is a "firmware no=
de",
> > > quite like a DT one, but I guess it may be used for registering
> > > clocks.
> > >=20
> > > How is a platform device driver going to use those clocks though?
> >=20
> > They just use clk_get(). It searches the clock by device name, which wo=
rks
> > here,
>=20
> And they would pass the platform device as dev I suppose?

Yes, I like the fact that it does not change the API - on the driver side y=
ou
just use clk_get(&pdev->dev, NULL) or clk_get(&pdev->dev, "acpi-clk1") like=
 you
would do with a clock resource from DT.

> > I guess because the "firmware node" device has the same name as the rea=
l
> > device.
>=20
> For platform devices created by acpi_create_platform_device(), yes, it
> does, but if that is going to be relied on, that assumption needs to
> be documented in a very visible way.
>=20
> Generally speaking though, they should rather pass the ACPI companion
> of the platform device as dev, in which case that the name equality
> doesn't matter, and so the clkdev could be created during the struct
> acpi_device registration (and the corresponding cleanup would occur
> during the struct acpi_device removal which is rare).

I think I should update clk_get() then.

It gets passed a "struct device" pointer, if it has an ACPI companion, I ca=
n
just recurse on the ACPI companion's device struct.

Btw - I'm working on the v6 and I added the cleanup on acpi_device removal.=
 Is
there a way to test a ACPI device removal from userspace? Looking at
Documentation/ABI/testing/sysfs-bus-acpi it seems to only be for ACPI devic=
es
which have a _AJ0 method?

Cheers,
-Paul
