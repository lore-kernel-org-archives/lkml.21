Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179709;
	b=3Afd2Pe2lVn4l6378ROCVxL47kdWKIO/cbwB1m3+7Um5p9K847WloMopxAfhWVZj7yG2
	 dzB9fFKudo9QI7bVi97GUkXAJYhYYPM+a7GDLCT3HvCS9Xlk/FdQAwICbIPhSWfd0GC55
	 oiAXosdRFxaiUiNcYTN33erErYCsRehkHWxWbARdFa07c9S1GIsej7yF3dgnzqv1GpxlQ
	 Xdr+VLsg3RZWBqg04FE+L5ptyoztzCdkbRCNUX3sHSwoIDRd4+LwSMsVshYN7DNp0qmSB
	 HfTzj7UxXWs/ly65EnHbXWrqDXWGZcm4PPuXhb7NyqYLo2A3q9eCcknU9ow0WN6SdRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179709;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:
	 Subject:Cc:From:To:X-Mailer:References:In-Reply-To;
	bh=jq9pSyaHWv4Kw1kTqN25StxuWddRltV8xaspOL8DIDE=;
	b=z4xSLxLXQX+HWmahBdsR2qzb5ydpPnLplfYB2YKJVFdNOHCrQ75laYT10MtHUNUqWvSs
	 w8wGky6OgxsKZ5DVN+KyBifu1C1QCh9WDMLGch7YzbHnwxUeHRNAIH3PIZSBPygzY1aVa
	 TSP0VfBt9S0G8JIB93udUH9jfpnfXjM0hdxlFHHHhVCssRrrKTHly8wWkUKNvMFVYpUSd
	 mIYGJQL+PPmeBPrvfeV18nKZQ1yElKbTAa46rogDBnWbGsqsJQsZrwSddLooETSGzfJ9U
	 7uX7/Je9F9/mP5g606z6y2MVlZ+i0xQ7fIvvjAmNcKmB+uMa33/JiGBrvHdO5XVZNQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IHosfg7+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 7FC4E606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IHosfg7+
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3B14B1F000CF;
	Fri, 20 Nov 2026 13:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795179708;
	bh=jq9pSyaHWv4Kw1kTqN25StxuWddRltV8xaspOL8DIDE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=IHosfg7+6ijOk2GwdsFMmLJ1yBRba7t1SKiEEdiEm01ZHolStTd2Iqghhq6HPaTsm
	 xSqi18IYvqZ1dGxJr/ZuXdixJbetPmHLrLIEzmF5PpIAUt8tNp61r+xpxQM4fJ5C7U
	 MlghUPc3xbIqXf3pouEmMZyXe+amw6T7LpJ9gk/UAJRE9esBLJ4Zj2byQnTHQ5czQw
	 rhZgCB59rHy23KZGi+AcWbi6zYaYP6rjhCqF1pMs53rw51E7/WMVw5WHLpFo/pU33c
	 KuKn6Uh9YllPfr7wpouLI7quSFB7bI+pCG+/8OBTHotlQ+Q4uGjMv8k8YgvIpIGW+4
	 MlAHqXxNZqHLw==
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
 boundary=b5160585304d341154d80d171af328992a125d9bc978c8ccad6ae73a7f56;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 20 Nov 2026 14:01:44 +0100
Message-Id: <DN023FDVIQ73.3GZDRYY1ZVBAB@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: winbond: W25Q512NW-Q/N/M: Fill locking
 information
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Archit More" <architmore303@gmail.com>, "Pratyush Yadav"
 <pratyush@kernel.org>
X-Mailer: aerc 0.20.0
References: <20261108192518.46803-1-architmore303@gmail.com>
In-Reply-To: <20261108192518.46803-1-architmore303@gmail.com>

--b5160585304d341154d80d171af328992a125d9bc978c8ccad6ae73a7f56
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sun Nov 8, 2026 at 8:25 PM CET, Archit More wrote:
> The W25Q512NW chips support standard Block Protection (BP0-BP3),
> Top/Bottom selection (TB in Status Register 1 bit 6), and Complement
> protection (CMP in Status Register 2 bit 6), matching the layout of
> other NW-family parts (such as W25Q01NW and W25H512NW).
>
> Add the missing flags so that software write protection and complement
> features are properly enabled.

Did you test this? We have a requirement for that, see [1].

-michael

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html

--b5160585304d341154d80d171af328992a125d9bc978c8ccad6ae73a7f56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCawBEuRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jsbgGAvgIgrGvnmz97qRwriGfJXgnP/ORGtOJd
qmLagh2CEtWqj68dzFnEno5+RNY41+trAX9LyBl+/txrVGm6NRmI9Q+ILkMTviX9
GrCnbf0V7Ce4NC13w10CQDIMYHB5vHxUL/c=
=7+uI
-----END PGP SIGNATURE-----

--b5160585304d341154d80d171af328992a125d9bc978c8ccad6ae73a7f56--
