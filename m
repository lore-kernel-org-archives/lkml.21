Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615001;
	b=lWreLoOXtOnwggnqJRLYQ0YwCLD0ZH+dxAjkx6Z02xvqGa34L2w3gav1jCOJ9F7DEPsK
	 BXDmJ0jQKhvb9KjdAO8krBpr364Y7lcX/IS5oQdtIsx1j4eELMEau/y6++tgp6bnIx+x1
	 uSwrWgAvs79Qi0YhxgQkZ05LQkNs8OGaelw/UWIzLVpBV9jKjkFSwl2V+nJHJB/WFqdQv
	 d02X6B6Rb0xCHrRh1yB9xGEcpaM4et7wDvWzcuDr44B1ZpeRP2vQiEqtxY9/EndrNU74x
	 u8lUaawD/F6Z28hQO5x/DFeKnBugNwbFof+J/dS7bx/dwSdSBjjFPqFBJCgiyDfLWIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SKfTFdP79TJIiK/IHIsdkjWeWKirqSGz/eYpNrW014w=;
	b=RUDcRtRgMrGTybcXNuEFcOuGHmPIT76tXEJ82CfGyOTdjs6UvMjv8BrOZ95ZDmQTvDRk
	 +kGZFyYCNtNGPem1CwPJgUmiqrb4yNNMRgHro+v0OjOCwL55Z+JjMU5fDramG+sOhEU67
	 +VkRLXezSNkjzI+vUEfUYLa50kQV2ZIpxwwiZ7folYXEVI0+IVZ1W8ZGa74H20e2bg7LU
	 BpP1CfaVtGrYknq0gAc+tj/yQfTqIisgvyaJVczSK4TF3u5Asx71vMshCHt4KdjL++0mp
	 XOMbIp5oztsSNTQSDkQ1EOVLGN+OfBL5DiNrHNesu54Hx5GGbdwC6zdJUbnaN/QYiMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AuDBfpmi;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AF9606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51AF9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AuDBfpmi
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso45879995e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795614998; x=1796219798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SKfTFdP79TJIiK/IHIsdkjWeWKirqSGz/eYpNrW014w=;
        b=AuDBfpmijTQXn2LX91e+5iw6Rhh3kgPWAumMiR/eyuNHRKjRlh78dMek6HfmnVG+oc
         YqzqpYIsMSNTY3wmZLhle+4XAToGCSby8NNDJEAEX6YN/gTdqAzuUCGULIGZzMQMVC0E
         LEWAu9IqO9yTtQTqgChzEPuy4Dd6w1ibsAKTbG/JN22xPFfs6TLURWhPpDqgCwkxAJ4M
         MxaDno+fRrIicJCOy+EHmhomdxiQZ0Z783aNb5Jov6aclMxKIfl3ua1jDZCtLYMuHWqZ
         JW225Psv4VNJs09zYjyFp13ZqKkphjjAnj4bDvgwRaq5Lyjyf57EoJIyk28EVSqJF6qT
         zSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614998; x=1796219798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKfTFdP79TJIiK/IHIsdkjWeWKirqSGz/eYpNrW014w=;
        b=rHpisscIcQmYq8u8FsESxxDYBj/XbBPLk0c4BewgpPHTwDm3BcYj6LdFtP8OuMVhse
         60z2bYpGQm7ZfWTBjZx6krzbV5zmNk/2gYKQmwOpZ0DhKMYMUj85+q2NGfQxLAvgcBIr
         LO0wOAhQibO2HqEn3dWoNYRyRDeC3+0W9Ki4zJCZWUBUG62QsT+VrnrnaafPzF04B8FD
         ZYQ153i2xv2KnVaHejQsqjkk0829VEEENvf2nDteysKSop914XYDhazDsoRBY/cuerel
         bEi4FgdOLI00siG5R8MzBdLfVLjmy2CWrYjRmRkX1SXqwPWTVY/uGIz6pflS76sGK34t
         fvYQ==
X-Forwarded-Encrypted: i=1; AL+hErEN+abJmwQobrDjJpHDMzDv2e7Ed5IAe6u9UjQgig+7Yh/MJF8PuRrd2pV/8wIsyVdrJXfEMlCapz710Qw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1WIfWDPiwUHKYxpsuFhD4c1ix9ORss5IoO7o5IYgT4c5pXtEl
	d761qeBkot5gNMNU8mZJZtfi+DN4L0lKqyiRsjKx+Z5KYBJcRIRYkIF04zV0u2A5C2Q=
X-Gm-Gg: AZFdTZfgj7rCIyPpYcuaRnb8ynFq9Z6CYQqZ0EchYcx0B4uUkuvtU2upUXnznXQcf/y
	QW4Nl9br4B2iWocv1Kp9uYdNfkuYQej4iOuv35IRnNkMbIjFzZAoVfyaQDdDUHzcGy/WqgGtqhA
	JN9QCX5e4BNyeoIKxvu82s+snvgDSLg/yYCQeJQp4SpqgS87O7yF1veY/Jlp7QpOyx1e/cfjy3Z
	5sdNRET3869j5PoVV/72kAkigOCom4cJrT5uMbyyk4e23jCok6v6oVb5kPhUysQuxmIYHlnK4Pp
	ScndxxhOiT/ynj5YZPmV8x0rmOADr9+DNZAP7FqxnK31TA4YRgo85EiYeHyOFn+tSvJP+1FZKLi
	mHDBw6cv9NLYGqEVrE9hjcjcSS+dyGBDCgS0cmaiTsz7is2ZFOxerzvbSAqw+sxX1pJrkk496ib
	WKVs9e9UY4tKYSnX5+LEVwpOuzEPiLrX42H1dtesc/gT+WWYliEg2B1AzAJcYEYlcXJ93DOwheg
	Oq2zdfKGEf/LsFeACECHTnsIZUMCFTVg3pdnFSLkO+7A/oP47X06X/rS9UmaQqSCEBJ6fbuEH35
	r/iJRQHDXxJuAWBx+ZGf62AZeQQBJBkp938=
X-Received: by 2002:a05:600c:a085:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb8881092bmr371132685e9.13.1795614998619;
        Wed, 25 Nov 2026 05:56:38 -0800 (PST)
Received: from localhost ([2a02:8071:6e30:8500:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906640a2sm282014205e9.0.2026.11.25.05.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:56:37 -0800 (PST)
Date: Wed, 25 Nov 2026 14:56:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>
Cc: Andy Shevchenko <andy@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] x86/platform/intel-mid: Use named initializer for
 pci_device_id array
Message-ID: <awbLZws4fZq5gLVP@monoceros>
References: <20260507154043.3113348-2-u.kleine-koenig@baylibre.com>
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
	protocol="application/pgp-signature"; boundary="zfr2vmpejlu2lumy"
Content-Disposition: inline
In-Reply-To: <20260507154043.3113348-2-u.kleine-koenig@baylibre.com>


--zfr2vmpejlu2lumy
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] x86/platform/intel-mid: Use named initializer for
 pci_device_id array
MIME-Version: 1.0

Hello,

On Thu, May 07, 2026 at 05:40:43PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> While being more verbose using a named initializer yields easier to
> understand code and doesn't rely on the two hidden zeros in the
> PCI_VDEVICE macro.
>=20
> This doesn't introduce any changes to the compiled result of the array,
> which was confirmed with an ARCH=3Dx86 build.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
> [...]
>=20
> diff --git a/arch/x86/platform/intel-mid/pwr.c b/arch/x86/platform/intel-=
mid/pwr.c
> index cd7e0c71adde..1739971478ff 100644
> --- a/arch/x86/platform/intel-mid/pwr.c
> +++ b/arch/x86/platform/intel-mid/pwr.c
> @@ -471,8 +471,8 @@ static const struct mid_pwr_device_info tng_info =3D {
> =20
>  /* This table should be in sync with the one in drivers/pci/pci-mid.c */
>  static const struct pci_device_id mid_pwr_pci_ids[] =3D {
> -	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_PENWELL), (kernel_ulong_t)&pnw_info =
},
> -	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_TANGIER), (kernel_ulong_t)&tng_info =
},
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_PENWELL), .driver_data =3D (kernel_u=
long_t)&pnw_info },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_TANGIER), .driver_data =3D (kernel_u=
long_t)&tng_info },
>  	{}
>  };
> =20

Andy and I are not in agreement how these pci_device_id arrays should be
written and unless Andy let go, we won't be able to agree on the right
style.

Can we please get a maintainer feedback on this patch to be able to
progress on the pci_device_id quest?

Thanks,
Uwe

--zfr2vmpejlu2lumy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsG6Q4ACgkQj4D7WH0S
/k6J+gf8CndB/eUA/0VfApXONkQ5oMbpNz0KgQRIoSFykcdNapihqzPnIejfeWtK
urz0svK7v6Wc5Wubg5pQSHU0eMFR6B+7rmIHdul4/fRcmnwtEm27dndQcgrdwm3t
MrNmbMApKFe0jWKbudMO2ip9vDjkPSCQLY760tHrJnh7jl1URrEjinUTFg8oJrfZ
kXyRyIy4bkG860HahSOE390H9XLqaKD8rxFyJ0GKjey3UHxgsiwf/7ZUT3S9RDbs
31ZK9uOgET8DYoaCZyiIutsz+uxqAUcZkb7xgRUt0OwK7onk3xG8TnN+r7HN+QSs
7DqCUlE3LTQLbF8zDs8OwK0EesaPoA==
=V9ED
-----END PGP SIGNATURE-----

--zfr2vmpejlu2lumy--
