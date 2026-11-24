Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509974;
	b=M6395nl0vlPFQ1zghhC/MK8EiRu8gQaBjV582YXGo+VchT7l/q/LrVMEe6XAOp5nYbtQ
	 mGTR0wfZn0yQI7l5vNuhJ9Odg352ULVj+cKiQ/7W1YevGQnIWu1Cs7QHrbL18IGXoNgN6
	 ihsTag7uzF3TFiAisI4VriSjA0keLDLuwXfoFzmu1UmDIq0IH+lF+tMqJvfpBSAByCgZd
	 KrDSybYZxdticKCPd2rKgjLjDaJcYNLV10T8QDu7+H1r1iw49c81hu7NK/hyZu58RgfFH
	 Uxe5CcewXVxbBAXjvCUmtwuWjZPvhT/ykB7FiYnAhDKf4ZHIofl4Ycc/ZUztwvB4Btw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0TvqhGwoqXKi1btWus3QmSvbkCq/HGEso+gSOvj9VJo=;
	b=HRxvM/atZSmh9E1KItATtfzFxwWSkCeCziHfJTpRkZHVc0uV6McS9Heuxx46Eh5nPHV0
	 acrDKoSZRYIn4bIlHDrioC22zM/piXfSOkWmiDPDW5DKjNSGkANJkhWIBXJdu4geSJ1bx
	 cCfnznZnNimyA2WriqAo9jYQiLz6FRTn4xGPGVNGbaxC6o5CpTjvQPuW/sjHIYD7hnhTn
	 gSLu/1xsLQ6g+NXufU3/WYIr91cZ3B2+Mh2411k70jyhGFIEKKp1oMEqv9MOZfdMPgj6j
	 4b7V5zVRcFDuB26hRpEnL0egfyWvLfZ7e+AWYdmoJCrD1+BbtTqZAmjm/wQ/zdCJlBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iPPjisk0;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DAB606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69DAB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iPPjisk0
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so38695195e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795509972; x=1796114772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TvqhGwoqXKi1btWus3QmSvbkCq/HGEso+gSOvj9VJo=;
        b=iPPjisk0qvM+y8GbYt8JwpGyacQ2fKofc3axRo+Kuza60a63bGiJobj5KMx+2f8aJU
         dUlZy+5BGPle3f3XHsIkPEyNaGFOnJqQ32WEkljcKV9gDVU93nDF9+o/0hEawAjHzt4h
         yzN2S1G6KjlxgGdolMg2tSlTjkooXgm6TIJqfwFnhNpAU/SDhAjLla251A7TphMZ0ZOZ
         JsXtAiTLfrzNxMzB5/cFjw9T/RviXuHqyHhPneq+dEE1RXyE+QsdiV1MYOAmX0mcFKLm
         v6zbnzTrGXcAuNU2cGYXlPyOGrzuod/S/cPN0P9pwoFehEX6sTCWg0DfgvtGZPmz3u2t
         VcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509972; x=1796114772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TvqhGwoqXKi1btWus3QmSvbkCq/HGEso+gSOvj9VJo=;
        b=hZXht/hHVvYGa0ozg9wwTHUXhPvETxX6UGkT6XaRxI5Hb/5jzzMKnTuGtvM6xzntHB
         MuamrLJg/RSHT/meVfMfBoKF2ejXe4ipwRX2c/D1jnZjBq/Pp89r69Qwm0dVqXI+spCP
         ykAqcNcWGY4/Npzz9onAecEc5gOprOlKKX6IQ0Cff/AbqOqdLC08Ony1Q2/L8IbTuv9v
         edRc2UVmdVQUCkyrXAS2rxlqt0DMcsns3pdgTgPE89/esl43jWTZKF4G7rh94SlbMz3n
         zcKLjhaw2BIe2YJWWMdYEf+9LjvPdBXULk8gIXffwo0pzaWYBuXtnnN2nX2rJxA17T5W
         BGyw==
X-Forwarded-Encrypted: i=1; AL+hErGvls1NRwyNLmsvin+mKcoUQx/q/58qJh5c5cNuENyMx4J82+1XzISqI4zflypEQvf49gGUWh9YqJZkUi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r+vQYTLeo85dXiUgIXER+yN5gqh0+Z2Lkomsjbj2kajPdUAFC
	rsM5sasASFTd6T3LF4+OVCMQuV1wuCLh3JFfqypKMiUizGcGa2UNptjAwy1ELJnKZlc=
X-Gm-Gg: AZFdTZegw87PnibtVdJYMlMPNybC9/vM984BWbaLx8wcKVDBjC0wvnk7oLvJQeTxUV2
	UAkTTYmyHZ1eyhempdL+beLwjQSdJrLnC44hgXW2gPHUjrfOM5kQ5t8zJEaEZ7eXcwnsipPwJVX
	7rLty/OAfZbKbYv2sV8Pc59HBBiuwKmumnhMVTVcw/UBIcHGfd4aczFeeBPRy1Ty4SDwwqDs+uu
	qW5+lpXpBnScX65G7QZ/t4iieFibSlpLtCLcDz2ViXmx61wHWxN5kkzWd+rD9S/QdTGGqpINPOw
	CuJIN6+kJ658B9f8dBsaB5Xneb99FIW/F8fKQLL2uuTtMWbu/1K2PSyDFGN3Niq568yuHfoUzPJ
	IQ6AQ3k2wiRCJgarEyj20zzQkF2qKnePUSeC2szgBWg+3JRIjSMWkXn5PLI8L+sn3hT18thMd3t
	d3jLzBAcM9PE9u59sUTfnlcgwyuu0XItNBPm9pK3uIplEevldAHVA0R1PHFFxDti1AK85onOr/D
	EtRDnqPEQC9CyGY/8qW8NuI9EiH8s92n2GAhNbbDnasHBXHZ06t5k6CxYAnSwWugTVqYQIZeI+o
	np8mIxAUokX5UNy4b0EG8nmXuVmfHfHXe7p0
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr269806305e9.7.1795509971737;
        Tue, 24 Nov 2026 00:46:11 -0800 (PST)
Received: from localhost ([2a02:8071:6e30:8500:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906c089dsm218993645e9.1.2026.11.24.00.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:46:10 -0800 (PST)
Date: Tue, 24 Nov 2026 09:46:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-phy@lists.infradead.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <awVOJ5OgaqN9l-ol@monoceros>
References: <awR7nSOWkxRm-iP6@sirena.org.uk>
 <c631c19d-4fcc-4881-a6ec-9dad24419fe4@kernel.org>
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
	protocol="application/pgp-signature"; boundary="2v7ytnhtnhl44wdf"
Content-Disposition: inline
In-Reply-To: <c631c19d-4fcc-4881-a6ec-9dad24419fe4@kernel.org>


--2v7ytnhtnhl44wdf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build failure in the final build
MIME-Version: 1.0

On Mon, Nov 23, 2026 at 07:29:57PM +0100, Krzysztof Kozlowski wrote:
> On 23/11/2026 18:45, Mark Brown wrote:
> > Hi all,
> >=20
> > Today's -next has a build failure in the final build for arm64
> > allyesconfig:
> >=20
> > In file included from /tmp/next/build/include/linux/phy/phy.h:25,
> >                  from /tmp/next/build/drivers/phy/qualcomm/phy-qcom-uni=
phy-pcie-28lp.c:15:
> > /tmp/next/build/include/dt-bindings/phy/phy.h:15:33: error: expected id=
entifier before numeric constant
> >    15 | #define PHY_TYPE_PCIE           2
> >       |                                 ^
> > /tmp/next/build/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:47:9: =
note: in expansion of macro 'PHY_TYPE_PCIE'
> >    47 |         PHY_TYPE_PCIE =3D 1,
> >       |         ^~~~~~~~~~~~~
> > /tmp/next/build/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:127:27=
: error: 'PHY_TYPE_PCIE_GEN2' undeclared here (not in a function); did you =
mean 'PHY_TYPE_PCIE'?
> >   127 |         .phy_type       =3D PHY_TYPE_PCIE_GEN2,
> >       |                           ^~~~~~~~~~~~~~~~~~
> >       |                           PHY_TYPE_PCIE
> > /tmp/next/build/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:135:27=
: error: 'PHY_TYPE_PCIE_GEN3' undeclared here (not in a function); did you =
mean 'PHY_TYPE_PCIE'?
> >   135 |         .phy_type       =3D PHY_TYPE_PCIE_GEN3,
> >       |                           ^~~~~~~~~~~~~~~~~~
> >       |                           PHY_TYPE_PCIE
> >=20
> > I did not specifically identify the commit that triggered this, it will
> > be some include file reorganisation which causes PHY_TYPE_PCIE from the
> > DT headers to become visible to the driver, clearly there is a
> > namespacing issue going on here.  I have ignored this for today.
>=20
> Commit b28eecc89399e5371483f03fecded33a26a8e655 was not really built and
> exposed all drivers to DT bindings headers. Referencing other headers,
> including bindings, from kernel-wide headers is another suboptimal
> choice here.

If drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c was more defensive
and added a driver-specific prefix to its version of PHY_TYPE_PCIE, that
would help, too.=20

Best regards
Uwe

--2v7ytnhtnhl44wdf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsFTs0ACgkQj4D7WH0S
/k7tiAf/dew2lryT6QqTEvFx5msFUZSgvbIZlgyPgHvK86ZsrbcI2FIIYAap8U1U
BnjjyUNWxz3TNGrPHnIzqdgnG5LNbgBIufAaZW/WQ53YThImappJJyO4iAUtOlhO
pgoWl1KgbgD1DpnP/fwOAFdGo/XXJ/DiTqCdL98crYqs9ySIpkA2+sujb7jeyjYA
f/IWlA0PWvELCPs0Su2uNfuHWPHUz+5w0foyng9Crf4DyYZy5QqhRcN1wBzn69x3
DFXZqCUpE91s+G2BnS1FmoQGrAENkbtf8yn6EaIkdUYWxCI/9HTqixQ8YTegxpKP
MxAM/T2486aerXd9YUCUyw0yfMRgqw==
=gqwl
-----END PGP SIGNATURE-----

--2v7ytnhtnhl44wdf--
