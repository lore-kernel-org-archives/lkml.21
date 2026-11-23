Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450105;
	b=KM0G/eK5QLgL36UFegDJ0alK3mMhJeO6UgoeeJi3YxgvWfjHxYYWq01cRjR/mFVbxWpP
	 wszkSEnFn+fGNnJS+kFMTSKzxfNhYyoc0IotKy0PR59gegD8EnVroCGfyJluh00kdK0tg
	 R+0XIYVT9aWvtND3+/vC+K+cw/CInEtRywWvapQGtGh8iA1QE8wpUfoB/M2KXH17oBmKi
	 b0/Sg6kEyrYnxsi2HwAIoW3yFTzRvMstSamfqE2oFZcsv6jYOtTrQCkJY8GpvfuFhMgXv
	 BMgIMYKfdS1ZOtZx4IGCuTXDi27xFRmjIFMTPCZbmQaPkVQXJQeVLbuS/IyNLaQi3gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8tlETJgYRArPnEe5QoZQeui7vxNwy46TocTxWlEK7NU=;
	b=XQQtGTZo7zwZ+r7+QK18EMuGqXuHrOirg9byr0GbzPF4ohm0CfBohCVXKVkkMbCX5bCb
	 1u6A7omvDI8WEMX/iEAt/jlmNkOIcTfmwyVBdjrfgx4thJ4H/6M7WsVlY3Sx2MpLidDkg
	 o4fhGNUlXDgO5EZ318s/+YxiHueInRyoUXs+iN0GAv9tfovLI1tEhFqugu8criVKBgzdQ
	 tcq2+GBgGug8AgP6v1+0fW4Y+w/qKdbfTjy0hFE8Jtu98yv19593XNXgxu/Re5pdJdvZ4
	 bdrQkNHTINy1tB2MqrYt7XXmUHVmOk0d+GZ0sYQbJMvDyR5a7RUEXwmpOUNkoXhlz/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IKWGTaT1;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D866F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D866F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IKWGTaT1
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so27637125e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795450103; x=1796054903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8tlETJgYRArPnEe5QoZQeui7vxNwy46TocTxWlEK7NU=;
        b=IKWGTaT1PyQU6Ctzn+lllQdrtvE74VkGyc6miZNEuZQOgm1srNBiD7OoJmkkSan3SR
         YMZjwHrgIM5bkBzbFqDFSlJU3dkaPKmRBuFe3N/8DNF3cv1DgCG3azkwyBvPqOMNxg5O
         v9pQCAKRs+Tt/WBCP7Pm9iMNjk6dmtDb8TG8iPUPW1UaZS7IPj3avYNwIqJLZumwuyAr
         j8v50Wd+62TUnPoB8xTbPmaUdMiuu4XSwFAPh1fk4O4g0GUefObvimTZLfdosOQsnec+
         sDM3+OO6emPcoMOSY2tSsGTCOnSjxaudhRhjYMr87Ggh5T0INWvqMtweklzpWC67N98A
         wbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450103; x=1796054903;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tlETJgYRArPnEe5QoZQeui7vxNwy46TocTxWlEK7NU=;
        b=z78rr7HBbt0OvAk1HbiHmpYXi3juMHJYIjypNWgg6kCsqvagSJHpxeMWCVMc0iVSKc
         z8BmRm1tbct0yS/7SlHbzymoGif8bUY5cXCNgCbrJevn8NYPsK//F50iHE9ArgHfAc19
         YLqgfp5ce4DTNja/LEAgMz8XVjkZqBnCTrhBKh4DhzA5vmHRHQHgmcvxt9EW4menZNfd
         owgVDqAQ4VVAhPJ9YqcrDICjA82SRg0hkAhk//C1l8lay1gLAj+MTUMnQ+vJLIBEscMn
         Injz0aY9mSr9ygtTS9AdRUxBf/gLPJUje3C7SWThSytConHvINFL0xOy779rTnjx/yb6
         Y0Jw==
X-Forwarded-Encrypted: i=1; AL+hErFwtD3uddox5T6CD3xDmF9DtOKPTNCmM2C3rwofVu2j7Tofq3Q3zQMjpxlSlnUbbaxPX2g+lLaHnPH9a+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZeBTNTinmMwZxvF8S3ilJatGovAkAxteBJbUjUXR6tZyJZbHc
	zlJTXn6EVC2mgvny17ELNMmcRBZdSLynQZqgvWX/6Bocbr7jFTUCn0mZYGIG1EeU8O8=
X-Gm-Gg: AZFdTZc6c6JSnOPsuXYt7H8kfCs6d+lpPoAxoZQnE1+yNeQ9jMwV8/N1VA86/fcKz1e
	7egpj3cr30Y1ERSnHGkDwgvMRgRPwh2PmvTTMmR1Ddx/ROnYSMcq8e8YH3ZJugHVuWHTZaaN1jD
	ngct+rChYTquWXh700oqeWjUGXZNCBYtJZ/niWhfo6dMduPgeqSaolPNxPZm7DiTBseKs045N5B
	CQdSnSVc/jNvJPAa7xQHTtaNvE2lFOp31nylWR4pIMjWHm/AeeH2rUdNJRG9OaPx4cGwGcr/c7q
	T+SS2CR01T3R8FAEryu1OUSbO/NNCB2ZkYDyuHE0hy55vu7h/Lt8i6gNgwZboYvM4GSzuug6kFL
	19OUlWvqqMDgBSUEZ6E7iUh9md8FJeCOpmhgPsebpezVkpunyPkiCQpszfPSs96sHxR/w40M21F
	dr9+7ZVRwvD/8lxVnq8s4YeSvVCvmz7nuaUxXy+B1zSfA9gNFTtRbgfkJPdhUs0nLjZz1B99a6k
	7OPT/AxoyeRilNqrG6nYw3c3GKl2yLGQud39pnt77Z/iaGYnx70aZVsZRmLhom3c2AJI0B47FR8
	0Sjw0bRmUp58fCbPZ7wuYVFvHx3tT7Tbvd44B2L2BSu3b36eqGwkwRuWwqCcBuAN4920OmMTrtF
	QMn3jxpEJk7qFOsni
X-Received: by 2002:a05:600c:a088:b0:4bb:6473:cde9 with SMTP id 5b1f17b1804b1-4bb8880f2d8mr206557085e9.6.1795450103222;
        Mon, 23 Nov 2026 08:08:23 -0800 (PST)
Received: from localhost (p200300f65f19a90445515a0bd0762d9c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:4551:5a0b:d076:2d9c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb853b2437sm534662305e9.13.2026.11.23.08.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:08:22 -0800 (PST)
Date: Mon, 23 Nov 2026 17:08:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] extcon: max14577: Use named initializers for the
 platform_device_id array
Message-ID: <awRklgCVhlGY6tHS@monoceros>
References: <a4f99944ae965760fb3d532172a40137a9bfe938.1781620257.git.u.kleine-koenig@baylibre.com>
 <al4Rii8FZCT0nP3v@monoceros>
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
	protocol="application/pgp-signature"; boundary="p3tb7tqkamadw6pu"
Content-Disposition: inline
In-Reply-To: <al4Rii8FZCT0nP3v@monoceros>


--p3tb7tqkamadw6pu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] extcon: max14577: Use named initializers for the
 platform_device_id array
MIME-Version: 1.0

On Mon, Jul 20, 2026 at 02:25:42PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Hello,
>=20
> On Tue, Jun 16, 2026 at 04:31:39PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > Named initializers are better readable and more robust to changes of the
> > struct definition. This robustness is relevant for a planned change to
> > struct platform_device_id replacing .driver_data by an anonymous union.
> >=20
> > While touching this array drop commas before closing curly braces on the
> > same line.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
>=20
> this patch got a review but wasn't picked up yet. Is this still on your
> radar?

It seems it's not on anyone's radar. Should I resend? Did I pick the
right recipients for this patch?

Best regards
Uwe

--p3tb7tqkamadw6pu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEZPIACgkQj4D7WH0S
/k5VQwf/S/oTPXj6BwnsTUqeetGDznR+zWLDUUaukQqY4ZHwG7Ex24J1sn/IdqCx
EgGfESi95aUTTnqnvbpLUUmtNX98+OdF8pX3J5VhA+vqnHnevGWPo7wrq+0/Th70
Rv6eOLUrvaYDgNVnjTT8adE7dNn0zmxwGSjFdbINIUt93LWZaCJQAxJsvUQ8h5AJ
lQZTDpzLpH4WWB9OmC4k84MYU/ndmCDV37GDTJWZfd8EElGWIQIMnkeTvN1VDTcs
J6ioex4/8q5yv5vS8AUkWg63dr1/TSw2r/7lY8xKbGmalS8syzTSKUjE8xKx9Zwu
QfQbPhYTpTLgKDcuQioj2gmy3R39OQ==
=fEbj
-----END PGP SIGNATURE-----

--p3tb7tqkamadw6pu--
