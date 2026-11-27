Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769256;
	b=X2xjahqTuVhCVc3MYHbUmy72GOUz8gPnoUpYpGVnrmylOpfoOX2ehd1gn/hL2dTL3I9f
	 sgf/TMYgrl6TMIf9gL75qXye9wkGM42Jz0+rbQVfly1WZtvdn10gRs9MsYHrJpb/nIYx+
	 aiJR3WI4McZe9GaC5+njs4TfmS+XxPF9ALf1hVV3wX2H4tSgqYVP3/Tus656wDxLk2FyK
	 rTYOjPTdYRmpCplYHP0ufbfEoPm42k6EFAnT1Pm3+qoECJJcIrtYB4FEWhgmpWxqEXfqU
	 rmzhXCwRQwgD1+4lsbybDAYVbrM++r0ARd0Vn/0PmxBnSsfT8Y0zSdekwH0qnTy9CKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hFWAeWghUobS1SNh2HR/z8yfcl8Q4/5YjOR9+nLiaM8=;
	b=GbHcUR7e31m1TN9elgjOowLb48gvZu0PkhN5kDQUi8ACJMuOBr5D6JGtYaJe1so5uivN
	 N9mPbWGLwNavDyRVsaGRdafI9UOPZXfeWnJ6bcViJswRCb7hWwVErwIjUTwgjWvPoEfkY
	 fbw8IZtFLR24LSVLBESTDpbVB5UTXLt/3x+dF/XlSc52kmObFaqnKY8ty/FOExXKbDEps
	 +yUSj5RO8hBolKH5/Hc6LWEle/guoi40OLRpuVOpw5WlVPo+P3aUbDLgpLbVEddbHEylm
	 L3elqb16NHZP7/TQ5m4Vy/v0KlR/ReuHHFPBOozMlpc2hpjoLOiJsWRIZTwOWaSH1BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YRrEPwAX;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3D3606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F3D3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YRrEPwAX
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so82956415e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795769255; x=1796374055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFWAeWghUobS1SNh2HR/z8yfcl8Q4/5YjOR9+nLiaM8=;
        b=YRrEPwAXoqI5gP2IIQzDF7IMwF6mWmENF8YM+9EnjV7JeOQc93bnq1e8N27XjttZpF
         a1i0rHxiGEfrDBBvSq57VnSzKmbzUUcSTReIV6FSiAgxPanu+MLDwhJ68UsZNZ2KJHcT
         pzdxnynl3I3SfzEc5EtEyduv3QSvo5fQfoy4f3Pedo3Ah1wpXyeggYJINAWChbDw4zd5
         P7ob5ikcmiawzqcJrtlKQV6Rlx77LGgmdaC8rd88mSNvGD1rzhYjHuZ63Viagq6Dj9eO
         EDcHXwMJCLTUAb4UpkwMwcMxzdvujnZcbsu8+4oAHCht3UbCAZ5HZ1BIGIwFPYc8Q2Ui
         ZVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769255; x=1796374055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFWAeWghUobS1SNh2HR/z8yfcl8Q4/5YjOR9+nLiaM8=;
        b=zpvcfwkSs4EEIVqpihJ4afW6mVlEcLR785w2/lF4rSt+9lDc1O7fqM/YFc1FUB84vE
         go3boVrwIJhEbdRn5/fczHIWMyE6ojPR9+U3UaPDevJzzzptSB6I5pdIkBMPMoPyLHhI
         aqbVK70S/Bw3o0tyoEACwJGbDzHqVoW7lBtCOs7s07Wpx7ZvnfcDUl6BCiHePJCTsA5N
         iEqwXbUDBOFcTaiNAj2gLUptAlFEL9fxsdnvaLCYKxzUADlWx2FSl1lqZQP6pmdOphn2
         7h4fT2KOqYP+a4YV/uC/Q6ML1Ii7cPS0GZXx9oZWtmo9VTajdmn6F82M4bKWvASNncsT
         qrTQ==
X-Forwarded-Encrypted: i=1; AL+hErHd45v1A+bnAbN4aNm9xQxBRG4Yy3bcSgbwzO7sXD9g17MLJiLOjBR37Ei8Ni0UzRH/lUKjRUIbVzm67gw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YSpRzlLCNRcbCt3/F+b9+gbX5oboWslwdP6Zt55ia9WBmNBLN
	zEL6tUB9M0+56RSavbr8rLT5CTF6MSLFrhNTM/osa+rgIOMDGrld6aIz8wwciE+Eglk=
X-Gm-Gg: AZFdTZejmJYtzhjxz2vEja0JUUyQrXjMdhav4OyWuyyAS0d0I22nhc/vD0d4Ru+CoF1
	BYUVV7TolR71/hD/BkQPMUEa2GNrOcdsDuAYEcFY2INJhnUl/2Idk6c3xoxv8QkjiCWOH2ouuy3
	MFSg9VDo4jag0Mi3e0XHKyZO6SbuHh+vMEAT2yjhPcPZMced50Xbx1owp+NY7JSTLCSlMpAdrdF
	ufprYMoncwplna6zXbpP7CANk8LUr0bVqX4wJdv+BB8hIfBmeoHofPck29HJ/1fqBdMfFTQ9mzO
	0MHP7/kwnG8y0PfZlVMXhzPDrntPGtm/zGyIqs0+ZcAjRuzFPPduIje6mD0yw6uRz075xve4Uur
	+v4Q0KXXdylZqb5tcKhbNQ4e2uoM3T4Cfn5iJGZSA0KS8ZOaxDlGJ3w/7TjR3CtcrIIdBhgfY32
	oxiEx5hO7HteI6NYuqIDdXRPezH8+oFZ3rh4TutebagMsCiyTRG+LpPWzXff8jJkLQhc3dz0o3U
	p+VqUw7ENxc4EctPupniBNczzY17e95d9pma3hV2awDVpKVEbJXookmAJ1dqaBf4xPPKXbqrWZz
	bu/STRh5lrS/L1NtUB2RvzyEwBpwt8POkwiEbLpXV5qm87OmuthpI85WPCTBTPR/2hnfUW2TWYg
	W+cFoxIwhjKzGV5b1
X-Received: by 2002:a05:600c:4e0d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4bb88922a67mr460696165e9.31.1795769254732;
        Fri, 27 Nov 2026 00:47:34 -0800 (PST)
Received: from localhost (p200300f65f19a90496f529fbcf0b312d.dip0.t-ipconnect.de. [2003:f6:5f19:a904:96f5:29fb:cf0b:312d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884a3a3dsm662489995e9.10.2026.11.27.00.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:47:33 -0800 (PST)
Date: Fri, 27 Nov 2026 09:47:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 2/4] iio: adc: Add the Miyoo A30 analog stick MCU
Message-ID: <awlCneo6rrSJPgky@monoceros>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com>
 <20261127012612.1589039-3-romain.tisserand@gmail.com>
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
	protocol="application/pgp-signature"; boundary="kmxikfi6vr3vqamf"
Content-Disposition: inline
In-Reply-To: <20261127012612.1589039-3-romain.tisserand@gmail.com>


--kmxikfi6vr3vqamf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/4] iio: adc: Add the Miyoo A30 analog stick MCU
MIME-Version: 1.0

Hello Romain,

On Fri, Nov 27, 2026 at 02:26:10AM +0100, Romain TISSERAND wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/serdev.h>

Please rely on <linux/serdev.h> to provide struct of_device_id and drop
the include for <linux/mod_devicetable.h>. The latter pulls in several
more header files that are not needed and that introduce build
dependencies that are not needed.

Same for patch #4 with <linux/i2c.h> providing i2c_device_id and
of_device_id.

There is no need to Cc: me for new revisions of this patch set.

Best regards
Uwe

--kmxikfi6vr3vqamf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsJQ6EACgkQj4D7WH0S
/k7MsQgAmXkeM4wMAFcot67XUVVbBIBHe14nNZchUfh2WmvpAi0XpKPNzsTIHhjj
/GUImj+kXS7eSvVQxGljXF5pczIDQsuen39afEPHvvhSyg6oxGFTEXp7SfEeuHAD
vg+2SwwGvurRKj5+owpBWNRDeCDTZnwZratfLSZdfT9kL4xjk49xBptg1K/Ev1GK
oz7iX7B2LJSQr71EV4/vWigA10VXxR6nsgBwhKbQmBLv3jBGoiU6UQdZ/O/BewLM
kvwT7M6MH34lt3X1gC97PXjO4XwqYOdg4tQG9eDWqJ4kh4TUCIKB03AzOEGJ8n82
VMq7sXMm64yM6YZAUq6tCbzxKjFNag==
=yo0y
-----END PGP SIGNATURE-----

--kmxikfi6vr3vqamf--
