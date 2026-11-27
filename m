Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773018;
	b=jjheNFOvlJuFXfqc/89T8UZGbJL3wCz4ve9YfVWAh5P3oDSIo7OYMuypFO7all5oL8rV
	 x0w1U9lqCXu8zQSPoinff67Q8WgGtRGtqIllgngKepAiHCf7IVbKJblk//ttXZa9QFV93
	 dJmivngVnJZlc7bNQduC/7x9CU/vjBuGnJDH2lFBNzrn3hlSIofeTpRQiJrbMBQsR+aKL
	 CxqUnwHiutnccOeJQQw21f4oi+HLsEDezQS2t5Di2vE9u/R/Fac4Ti5eq42Nw4YN0hIhL
	 JbC5Gv4T046kaC1bCSzcmgi//f7oFiM9XAydv1gYUuomMnwY4it4XyVHVfzH8ld98uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=boETkwQRINmTUcZXT+YyuDLBIOBuUgawyIhAIU5X7H8=;
	b=Y0MD3ObjWlpgl6+Unq0JtGc3Xabdpwr5cZiORiTEHn7TM7rFoOyiUbfgmBnLS3wqWJwN
	 z6HuHI8iulZPYV4XT9UTD0jg/4r6h45mZQxMxepQieQselRiqNWcbvELGkEemkwYneQvY
	 IO3i3Lnl7xx6dc4cska7Km8wQpm6121m7sM7poQaxcrHXi61cB3H50abErmSVSQ3uJdWy
	 4Wpc/r0/kvWgiAWTNGnqRxV80N8ofLRUT4asfnXJcum9cFpfDJiKkwndEZ16bSAdXjG/1
	 rfpToezd28meUrF8GYuXK7+4U7HJDviGsIiFVGpL/Ta73Gys8IlWBpEs8GZ2KttZfyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WvufzrgU;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E11C606A6B3
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E11C606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WvufzrgU
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso73104925e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795773014; x=1796377814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=boETkwQRINmTUcZXT+YyuDLBIOBuUgawyIhAIU5X7H8=;
        b=WvufzrgUKcZmqK6huYPRAyEGEWCMv2xipmCmmU561BzYmqvZRQKI5SVTcTNmefn9iF
         TRmoPqFL2ttAkRBKj4Ku/8D2zcguWoizTxnl2FmOln5Rr40MvrgvYH6ZQpodWeGl7BFE
         rBMCUThY8fBhWCRnIVJ2XqrXF4v1bNvO+eE9+yBPpo0NA93N30gkIoj5jRzx2WDe+iyz
         f4xldICCBGKTkOQVxyGNbd9GpuwPWBP8YJPTQq9kn2hsKf+2UuwYKJ6aZIT/Bi+nwY80
         CHkgGa2psH/nWBqzV6kjHUtV8CNPRNDowWGBYCDUn5QLJ1O20XEsikS9kf3wDE6jr5o8
         /sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773014; x=1796377814;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=boETkwQRINmTUcZXT+YyuDLBIOBuUgawyIhAIU5X7H8=;
        b=q77QzwDikBwo8ZoHiKJPC380NGM4ZzjcpgT3FXc4ww9fCQDFMNebsD3c8kFHbDZO3q
         a7AzIsafTjpO0IZZL6QFzL4ECTL1AJaYBgN/BPuel3UcUw0y4ZVDNkeJ1HSHW96BALay
         eA2LfzZwokshnNGmW0E/uDuTrXA5bV1GuEAoATq5g877LwN/vd3iskGFklNGOFwqzWLp
         2juxgieMa/628zhsXfH4UW+eHi+zY6eSqD9/gKAP68mFhro+khrHmO2e0MecBEDtJ7Uk
         iyzHyDjn5eOjbjvpK6MamvqC5fCjI5wI5nj/lGtHMVsr17b0XI1M87QX9exKW5nJNVuG
         cyyg==
X-Gm-Message-State: APuU4Z92FXDcRbxMxX5xNdMsVfJNJXjqUWDSnN0u0MKQAQtfLaSOBsYJ
	LgScLwfThq35lyZ3RyM1RN66nYdJksCc5ntUAOg4teHkrmaecljQI8QppTDuuprcl7k=
X-Gm-Gg: AZFdTZdwjV9IzGy5v4DVYsiRFtDGPq3keNG/Slgu6gn48jU5v6o1Ffm5VYsjfQcjuY8
	WlpErEiEYPUVq+HZhs/lNMunltSbQNWMjMyy0XCGH90yVOdxCAYWy7kCxy3U38RsKsN380umKOh
	6LeE2dkkc3Fy/TIhe9+MITduUxzS2wNMh4eTnRUNcNBLiXopfxow+N+L2O4UtmZwFEmTLuZxoXN
	5gBeb9vEJJg2dDM2AhedGMoeNv3AUkx8Da2p6NRp+wonsNMLdR1QRdkieYgeSYRxqAOhdelikRT
	aYAXAx3c+jBVE/Mgv//uzqO/87oiIDg71Ef9c0Krf/9LjIf4LBOhVnNUS8h812lfK8Js4/M4mpI
	WNbBK6ksLynqteCmz4FeBBuxcknFmbz0XyxdNUPUBFX2Ww2PIHgK1XgVSTqINiNUa+4gHrh/FbV
	ZfhS+sJPIx+a/DgL004C9NuBIIC+eRx/3dfb0BuSaay7ZTp4v2v3A9Z/bAwjpFqCPgIAmIYS3RF
	yU61q5E0sl9hIvqPWBwRS8zqN4wvFHIF1PXWN4jum+K1HM0XPxOQ70XX451asZV/7BP8KuRYs78
	saugYBheqI4EMt2j6Z6Nspoc/1HpnMGn1ue3f24bLdWe6fbdgA/27w/DtuHlEd/ieJRsHnoRgVq
	oli5Smy0fIZ9KrVVf
X-Received: by 2002:a05:600d:82c5:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb88822642mr543720995e9.31.1795773014384;
        Fri, 27 Nov 2026 01:50:14 -0800 (PST)
Received: from localhost (p200300f65f044d084f6d53af9d755e3a.dip0.t-ipconnect.de. [2003:f6:5f04:4d08:4f6d:53af:9d75:5e3a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb88f643adsm309326105e9.1.2026.11.27.01.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:50:13 -0800 (PST)
Date: Fri, 27 Nov 2026 10:50:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: extcon still alive? [Was: Re: [PATCH v1 0/2] extcon: Rework
 initialization of i2c_device_id]
Message-ID: <awlOvzxRjyQo6fOI@monoceros>
References: <cover.1779100597.git.u.kleine-koenig@baylibre.com>
 <aimaTrJvXFjbDDTB@monoceros>
 <aloDsjYyv3gCsx39@monoceros>
 <avxptCL2mq7Z3vPi@monoceros>
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
	protocol="application/pgp-signature"; boundary="xnk4q3g52uo3jksw"
Content-Disposition: inline
In-Reply-To: <avxptCL2mq7Z3vPi@monoceros>


--xnk4q3g52uo3jksw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: extcon still alive? [Was: Re: [PATCH v1 0/2] extcon: Rework
 initialization of i2c_device_id]
MIME-Version: 1.0

Hello,

On Tue, Nov 17, 2026 at 03:53:17PM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> On Fri, Jul 17, 2026 at 12:31:20PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > On Wed, Jun 10, 2026 at 07:10:51PM +0200, Uwe Kleine-K=F6nig (The Capab=
le Hub) wrote:
> > > On Mon, May 18, 2026 at 12:41:43PM +0200, Uwe Kleine-K=F6nig (The Cap=
able Hub) wrote:
> > > > Hello,
> > > >=20
> > > > I plan to do the following to the definition of i2c_device_id:
> > > >=20
> > > > 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_d=
evicetable.h
> > > > 	index 23ff24080dfd..aebd3a5e90af 100644
> > > > 	--- a/include/linux/mod_devicetable.h
> > > > 	+++ b/include/linux/mod_devicetable.h
> > > > 	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
> > > >=20
> > > > 	 struct i2c_device_id {
> > > > 		char name[I2C_NAME_SIZE];
> > > > 	-	kernel_ulong_t driver_data;	/* Data private to the driver */
> > > > 	+	union {
> > > > 	+		/* Data private to the driver */
> > > > 	+		kernel_ulong_t driver_data;
> > > > 	+		const void *driver_data_ptr;
> > > > 	+	};
> > > > 	 };
> > > >=20
> > > > 	 /* pci_epf */
> > >=20
> > > I want to work on that, but I'd need this patch series to be in for i=
t.
> > > Do you still have this patch on your radar?
> >=20
> > While I still have to make several patches land before I can modify
> > struct i2c_device_id, getting the patches from this thread in would at
> > least make my queue smaller.
> >=20
> > FTR: The series still applies fine to next-20260716.
>=20
> It's November and the series still applies to next-20261116. Does
> someone still have this patch set on their radar?

This patch blocks going on with the above mentioned quest. The patch
we're discussing here (well actually that *I*'m discussing only) is
IMHO trivial. The last patch applied to drivers/extcon that went through
the hands of the registered maintainers was commit 1bf0ba46d9d2
("extcon: usbc-tusb320: Make typec-power-opmode optional") from October
2025 (picked up in March 2026).

Greg's char-misc seems to be extcon's upstream, so I wonder if Greg
knows something about the state of extcon? Greg, would you merge my
patch without maintainer feedback? If yes I guess I should resend? If
yes, I'd expand the patch to a series adressing all the needs for my
quest also for other *_device_id structs.

Best regards
Uwe

--xnk4q3g52uo3jksw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsJUlAACgkQj4D7WH0S
/k5u8ggAhAMRa2RDQM+0uMVow57L6ZvyxN0KRrVeHOQiCMJFNTCz2FHmd6H2Q2Tj
VHvcQUSrRBX8vPfM4m0B/B2aZqn7D1UZTlENwLwL0ycrhFyoyyB6cSLFENUD1CeU
g5X/6fnd7aVGdbZ0aviaJ+1RrTYhJ6+JLiExfLxjve4zO3MQ+L1BRtUeH3CAVPAn
UqiXs4SxRGSc8zomoz1qSX2HXLMDnVwkjK4EKCNJYQwHV5ckqDCYbAMMF8xm9e5G
0r6XgHcsF0dv05TFzutYZXqBvb065fDaUDpqmWE9GKKuTPIbeRj9ZBUsRIdvFman
QzqzgBdumxgQdoigBQiYl9XLlpSfFQ==
=3sgm
-----END PGP SIGNATURE-----

--xnk4q3g52uo3jksw--
