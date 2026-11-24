Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526153;
	b=zVL/kgHJDjR5dx++pX/kRmlerwBA3zZ5+NJqqzYNsPlzREkx0PSVh/O5BHv6gqogfcoh
	 6qhUEok6QZBFhH9+SVgVMox2OJIgLWlrUNtnwveAJZgvjJyVhV6/dneeEMctdy0EJI72Q
	 t7N3j13ztmxPsVgnZTwx6nslPn6KLInPvMjBr+/teGxXrAUC4AaoaYcTDCJueSKbCLsvh
	 aShOrXZAAaY2+grac/DHv6PDDG1DnQ4AfMvSYVRHUfjhjKm7OKC33lvtWMt9JH73QK5z1
	 mGztHzmwXZJAssqBUSbpifSu2v36SqKkqyKxWQRdIvm4Lqg40RzJ5Bo+Kq1T3kCIXVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tuT74cz72c8LGaZEf/EXNbRDOp5lSq9neVcNGUi1Xnk=;
	b=YnVPnv1SE3SSaB3GNtc9bDIwzkf5mEExuaTNazrzbx9zU0tE81EnXfPRZ1Y6N4wjbJHi
	 /CkNlmbRzj26xleERBn0fPbjL0SoEqGr4SJC2RtYgaHpLvjypj7+ExDE+og7A63UH/tuF
	 boWoqlykkSA16YuA46Of3NaGlJjdQmCGsNuUXY9SQDgfLzL0IpczU3OAHHoVGnmqjZAEI
	 mESLLKvozJF71IxpB1D7D5kH3XL3EcESotcjMvPJNUHvkYVmpIK5JR8SOmfhqgPivVO3S
	 mVsZmSN3S2AnZ6HSd8Y0Sgf8kE8p/uN48YGPsQ0AorTKuykW3Vs+52dnY5RbN+9OW/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BTqIpOd6;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2B2606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE2B2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BTqIpOd6
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso35690385e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795526151; x=1796130951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tuT74cz72c8LGaZEf/EXNbRDOp5lSq9neVcNGUi1Xnk=;
        b=BTqIpOd68pWLD8LXUCoXpoi8tAzUUHdzQ6p6HHGgKtUp+FvnFlJeMGSW0XRLwsf0Fz
         OIVl33otepuQlzg28evxJncHfTam2yM6YZROtH0g6GCtb31Gpc9Z/NmZeUpeuMAZB+dZ
         6rApZ2nTPaBXez6jMsQ2LG9OPsYyRlisvaCdDYLJCl4rBp3iMsZsQzH8rufJF6mFqwt1
         LPjrWRigDHVlOK/12/Up94tsCBIXqbf24jGghoYEvjEx8aCTK9Ix7WZNtTZ/ubpJzLUx
         PZho9OeZ6wzfJiG9qmpqapzpW914BhoadgV2uhGMP08ovGtNtZmbX59yxHu7kGf631iY
         3W3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526151; x=1796130951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuT74cz72c8LGaZEf/EXNbRDOp5lSq9neVcNGUi1Xnk=;
        b=Qn/zvQfriZLVbeC+0nuys77VlEIxW7vz7HhiKnT2eUPYb7Xzqh5juLzs9xVJutktNA
         RLUrfBq+VrK7vlUOZkXxDcq/O/52XkvUvrqKjXJFCSndMqta18zA9iauiZoEKnNpRjfB
         inr/MZOsnKsC/P0IWnszhng83MIBbi4qXr/wyuKBzm1DMTldkfzLMM7oM0EIIZnsKcaz
         p5TIpTGEQvs0/woXdvpjkc94aGDWq3JnOApbU/m4tJoK6+VkFocaonVk0N0WayVJJeVo
         FcwrAZ43kQoj6LaoicqM9/9iQNNefXJbFck40EJKKn2M6oUtOdTaOP34l28g+5KQ03b1
         uniA==
X-Forwarded-Encrypted: i=1; AL+hErFviUiWaB78jksXq+tKNb4fO5/yL51aoPATAFRoAh+0aY3pJDnzCy4RO3RPRAt5W4hGfjPOL3DmJP0ZLbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KeL1YydmfuOWcB53DbusesMqu8rOavST1DV1to/V6Qg8/vkpu
	ur1TzoCxICxOWdpYitKfDLoncxw71Rl0i7ova9W2kumdix9EG73fcrg428khZgC3vYk=
X-Gm-Gg: AZFdTZfd/EMhaBoZt+7kUClOz7H7nSwpk8X8x2HeBLWEPe30g1j4C0rmfpi9neFGwp1
	wCI9zuWDtQQ28ytAo5XgRsnX92hzJMdw/sHzrgsUjyeQwZZNSsnJISyP/fuu90x3StB3QPMoaWk
	oZBnyOuf2kkViKH/TV+PKMKvidHmmMVaBylOpGOO/2raN7ohDSzP+RAyrgnrejbRSllnqsUR4cQ
	4SNmMXnocbPptYiyCaM/8dLI80tzzqb2qepxF6gN9eXsu6wC6KcE8fWDwrsJHBvOMD//x4AsO6Y
	OpEn9J9Dpbr8qBZpVAF5OAUoZ6K5AmVMeiasOTf17ykfZ8xS5Dvi20FBvZt2PvsCI2Rn/HGi10U
	fMYbPxzjvTHoDyQwh5zEcXVIl85dWmxyjcF088arZKvonWn5NY4N9ysteL/QCtnXzYjwAOA6UU2
	BZjBHmP53KYqvxSyNEMD+5UaclQHkbbLNaMYlB15DlkHpiF4yZoiRA8aUn0jZ3UYOj0eZkjfyB/
	mjHvHw5+Um9lEv1W+QzAEfL5ZYFPAI4skKQT7UfnHE/iHSpZuKufOMqUNy0gsJxplIOl0V9vIyx
	RhQT1Osz1v5xOIB8ztfJCR/FgDx8KpB1VgFeM4M8FULQhHSrZZF1J4oqeCRLJ6B+LoEmhJBEO1a
	aeqIJbwhCh/lkxkr0P4Ic/IfXlVTaS0mBb46sI58=
X-Received: by 2002:a05:600c:4f0d:b0:4bb:5c97:f4b1 with SMTP id 5b1f17b1804b1-4bb8881941bmr337984875e9.24.1795526151031;
        Tue, 24 Nov 2026 05:15:51 -0800 (PST)
Received: from localhost (p200300f65f19a9047f1ca7b446868308.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7f1c:a7b4:4686:8308])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884b39b6sm396762345e9.12.2026.11.24.05.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:15:50 -0800 (PST)
Date: Tue, 24 Nov 2026 14:15:48 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Charvi Mehta <charvi.mehta@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Rathinavel Sankaralingam <rath.sankaralingam@arm.com>, 
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: Re: [RFC PATCH 02/28] media: mali-vpu: add Mali VPU platform driver
Message-ID: <awWFan4TZChEmL4G@monoceros>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-3-charvi.mehta@arm.com>
 <awAzFsX_VUbzTqK4@monoceros>
 <fdabdd57-74f7-4be5-93a8-a6955d205791@arm.com>
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
	protocol="application/pgp-signature"; boundary="kbfofxqjlphqnytx"
Content-Disposition: inline
In-Reply-To: <fdabdd57-74f7-4be5-93a8-a6955d205791@arm.com>


--kbfofxqjlphqnytx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 02/28] media: mali-vpu: add Mali VPU platform driver
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 10:17:51AM +0000, Charvi Mehta wrote:
>=20
> On 11/20/26 11:48, Uwe Kleine-K=C3=B6nig wrote:
> > > +#include <linux/bitfield.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/device.h>
> > > +#include <linux/err.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/io.h>
> > > +#include <linux/mod_devicetable.h>
> > Please don't include <linux/mod_devicetable.h>.
> >=20
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > <linux/platform_device.h> already provides of_device_id, so
> > <linux/mod_devicetable.h> can just be dropped.
> Thanks, I=E2=80=99ll drop the redundant include.
>=20
>=20
> > > [...]
> > > +static const struct of_device_id mali_vpu_dt_match[] =3D {
> > > +	{
> > > +		.compatible =3D "arm,mali-v76",
> > > +		.data =3D &mali_vpu_v76_variant,
> > > +	},
> > > +	{},
> > s/{},/{ }/
> I=E2=80=99ll add the space, keeping the trailing comma for consistency wi=
th the
> other initializers in the driver.

Which driver? With your full series applied this is the only list
terminator below drivers/media/platform/arm. Note this is
different from

static struct platform_driver mali_vpu_driver =3D {
        .probe =3D mali_vpu_probe,
        .remove =3D mali_vpu_remove,
        .driver =3D {
                .name =3D MALI_VPU_DRV_NAME,
                .of_match_table =3D mali_vpu_dt_match,
        },
};

where the trailing , is right. My request to drop it only applies to
arrays where the empty initializer signals the array's end.

I don't find that documented in the coding style description, but with
next-20261123 checked out:

	$ git ls-files drivers | xargs -n 1 perl -g -n -e 'print "$1\n" if m/devic=
e_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*(?:\s\/\*[^*]*\*\/)=
?},?))/' | sort | uniq -c
	      1 	}
	      1 {
	      6 {  }
	   1957 { }
	    405 { },
	    490 {}
	    576 {},
	      1 { /* end */},
	      2 { /* sentinel */}
	      1 { /* sentinel */},

So arrays of type \*device_id[] typically end with the terminator having
no trailing comma. (But honestly I'm surprised about nearly 1000
trailing commas, I would have expected that to be much less common, and
drivers/media/platform even has more terminators with a trailing comma
than without. I'm embarrassed.)

Best regards
Uwe

--kbfofxqjlphqnytx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsFjgEACgkQj4D7WH0S
/k6mJwf9Ecz2SoCd8AmGmyq3W20lpLfNrHtMVzKLZ73vPVXUSeTOE9anlo/n5gwT
dkGiZeqHTi1VF+KBdtQnFvvcYsPujwiRAP5NPZfFoTlK6ozq7QAKFGuP68S3ABgX
oYIAu4FksdXvbvN62qVP5eb54vzthaRYiZ4oY31gHG00KwCLt+ul//+RB1Lj4rwY
I5fWK6hOQlER4U34qBHtTXc95xIicyybp8EQFn8C6oTwU53NJ2kf6cMxUR7ylqK7
VlrK2w6e9ol+WQrQiRHNVflApysdbORy94EnF9msQh8X2ECL4VQHSeEl2+u+eyey
zlAZgbX/HBZqGSqmU+XsLIuD23GGXw==
=vPI4
-----END PGP SIGNATURE-----

--kbfofxqjlphqnytx--
