Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648350;
	b=2yxm1S2ewCrRCrOIYXIPJ0tUcV6SaYVWI53jTEoVnmFDk34+3dwnTuTPhzDkVNDXTP+F
	 oNQCbn1W2BXgegr9Qs/FFU2aAXc3CLQmZbOnuX5Hh16+Yhfv7xdDJGtFgVZuR65KfMbjZ
	 N1PdN1lSdd+qyksKCKUBXxFlbg3U3xZnQ79jxFeWOYIZdyak1DQWec6nTYpMNbMBhVVRM
	 pjeAkJxQmYHCJjDpTJjjibcfO++0MbqRw5Xhp5izMIKHc/RSxnstY258FVKXok7vV5r3P
	 Jllc0+QA+J4a9oMA7Q9zjz5t4+R4JYs9lZsSs8UXu1VxMeIQSKSKrhAb+eV39V2ee/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=;
	b=HIjQHZ7qmIkFoT7zHeoeUgKT1hdE/5pLOpXOeldqlHDBnWcBOH8B3lGTfUm/v+8A0+HG
	 PX04XgTudWUSYI9yptnVCLU3cl22SI7DMksh5KG2Lr9ZApBf42aLzZ1fDtvWRPcOgRAC3
	 I3/TzDXmOfiX3WI+hVDbOZ3LhLMU8ksNRlyNT0z6nHbkd2pBCCgX9i3830hRljMhLdiB3
	 GEy+XuwPm1Ywezn3xeHnPtmAoFRY61F0sQGJ/YXMNiyHhyiDqNrWvYxU6m1g8A3g87cV9
	 6XBj10r6fiLNAUHR+zNnARf4t7KJmwp8cYBtiAob7tv2R1YRcWk+dP2aFQbZtddRWgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=P9+vfVMQ;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD1D606A687
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD1D606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=P9+vfVMQ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so63450115e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795648347; x=1796253147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=;
        b=P9+vfVMQuEA5tApB3Ym+P8H7sPqn9qUi+CwY7nhtWJ/GEq21N+YuwnNdE7iVGw20bZ
         dgEYwQq4qLwfEZ5QGeH8wpnTY+9HTHRiTm9S56qrqXGzjRXUgjA6nZKHE5zoiuQgQ9DJ
         JSSekzHetnM6g9vN0zXnQ9SBK8tneNkTvPOSOwv4DVq8lAoPP2Vxp3IGuLXSpx20hrEf
         25UOybrnutUF1MB2Ba/f1r/iCHNGotD9Jq3BSyO415okFTxkzZRxdC2QjHIb3y+ysD7r
         S+zqG6SBRdD5fnuotFWNOiQLCPVOer5mKJZbhI+TbAdKrBrt7pDlfptq3gjwKl/DUjbz
         MVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648347; x=1796253147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=;
        b=kA+yr5PE/iMli4U9jnBtD3OMLn5YsqMeQwslbraCUC5kU/9Ytc0NqcUnQxEVNJ/X/Y
         uWCcXzn0aOab6/6dDzd0A9nTu7wBWm55zU54TmgvOQWK8207/2XBgU/gOeFGjxpmZ3iZ
         vVXCFWvZUBP48Lt0gMMGSVDG9cyjuc7ic0/pf8HPUVMjcWa6b24k5E5hR5q/O9hwiOBg
         TkBlU+mEnixSsmk0z1h7PzG4pMLqcRgfIhJflLiohSqCwfmUKf/HwsBZXAM7HJMbePTT
         Rrc2ueah6z3yTJBZW3YeVzGMRgLjX0ymQDeKJnx21PexVPieQbYHi0g7LBGO8dKMT8Zq
         0f3g==
X-Forwarded-Encrypted: i=1; AL+hErGEkjFxIuxZZLFoAJyStYGk417Is5yu9vGAYV4pO/9ncLhIyhFmks5A7XIcLedEgmaX8cF5NCBbR5w06TQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Jr8nE1TSFFa2MArcKC3GaygTsndUrbViy3YC/NRiZaZZRWWEw
	OHg/0UkeIkYrRWA20Vhfjn6dP7rhcrADhyoaO+o4Qb98zvwqFm85kHYimsWlCwckWes=
X-Gm-Gg: AZFdTZeaOWcajDOOTnzNicCghj3Ed1ZQ+VmeLVMnUDH5XxYKeXpDU74ILDT6Df0NWC/
	dfa4O0FFnCYqdkqEnQchm2m4GfCJPU0BkMRLDaxLg1swCafX3ykSg0PU6CeSaja5X8rQWVC705U
	jNt9tm1NvDJRBZwWg7yIueSjBpoqK1WX4K7oyVZaLjO3Q8WLSIKiiV3xBmzvki/BHqpIXLbBa5K
	kYQZ/V9kqryzHojTdyv1zA3gKKGjQ1rj5+Uc4i8OF+69BLQnMnk83jPxMR/OhUTK3YWxHCXJzGk
	XfahCG+Yx1aN2/A29Y6FAoe2uIQdtEOnVyzgXaZGiWx3+QFbihd9/fdp1u8T8CbntFbQyNUhq+t
	4TAAicoIyyQePKOa7YmGLM1ulzi6X3vludVzryztLF+KC/Vw07AGohCRRyHJlINmHM0NIhE4V8p
	rfzvt6HHE1SsRanWxJZkdLMiADu+vkKNVIrx0+No0uGtdeInmjWonh1hmx1iWFENZLBYVe5+Xmm
	GUg5Cijnl2RbY2HHuOZvMQ9l05qlmI4ria/vZSjm3U98NR4jysH3TkBdmu1GYxlwNyS2QmL2MfZ
	jE9wv1oxKtBeX8buHacP3N7GhQQPsnDQCxA=
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr395769935e9.17.1795648347566;
        Wed, 25 Nov 2026 15:12:27 -0800 (PST)
Received: from localhost ([2a02:8071:6e30:8500:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8533579csm480759855e9.2.2026.11.25.15.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:12:26 -0800 (PST)
Date: Thu, 26 Nov 2026 00:12:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>, linux-clk@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Mariano Marciello <mmarciello@google.com>, google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awdp3W7LWfQ3ZrIy@monoceros>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
 <awbJUwrBQw5TnowW@monoceros>
 <awc0sBl6q6A2Reaq@google.com>
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
	protocol="application/pgp-signature"; boundary="khx4cneo7r6erf2z"
Content-Disposition: inline
In-Reply-To: <awc0sBl6q6A2Reaq@google.com>


--khx4cneo7r6erf2z
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 11:19:12AM -0800, Brian Norris wrote:
> On Wed, Nov 25, 2026 at 12:43:40PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > > > +#include <linux/mod_devicetable.h>
> > >=20
> > > Please include the specific <linux/device-id/*.h> that is needed
> > > instead of all of <linux/mod_devicetable.h>.
> >=20
> > Or better still, rely on the bus headers to provide the needed
> > *_device_id structures. (That is <linux/platform_device.h> provides
> > of_device_id (for patch #2)
>=20
> Only very indirectly:
>=20
>   <linux/platform_device.h>
>   -> <linux/device.h>
>     -> <linux/device/driver.h>
>       -> <linux/device-id/of.h>
>=20
> > and <linux/auxiliary_bus.h> provides
> > auxiliary_device_id and of_device_id (for patches #3 - #6)).
>=20
> Also quite indirectly.

Yes, I already thought about making this more explicit. But this isn't
my primary objective currently. It's safe to assume that the provider of
struct platform_driver also provides of_device_id. While a forward
declaration would be enough technically to define struct
platform_driver, that is not sensible because most users of
platform_driver also need the definition of of_device_id and there are
too many drivers relying on that already.

Well, but having said that, the thing that I consider important is that
no new users of <linux/mod_devicetable.h> pop up. If you want to go for
#including <linux/device-id/of.h> that's fine for me, too. (And similar
for the other busses and *_device_id structs).

Best regards
Uwe

--khx4cneo7r6erf2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsHa1YACgkQj4D7WH0S
/k62MQf+OKGka4mPSwopQ0+gI2VWXrdB3QhqgUL8ffjUMb7jkBi86oA6YfcjNC/D
8aZRTb/LZNPgl7ygdsKPEfFKlbKH1yCA+9gfN/aS+x6ykkZUKdn1Ha8m8ImuN87s
ooG++TXgzYfljHdoCVeukZsRth0gqt+QTBWLDPPUCDzC543cmPPqIWNi0LXdgwuf
OFve6MraHVKSLw0TVigzWyx0MYat5C1Y5gWVcsnmShhh1D18CrPfvFcu4dFot6Zj
IsEZRk30Wuu42YCnSD1t+UeGc+VDD5hxC1JhUdvN7txOJr1NHKdNT11aByux9mPD
ityFQTt/321OJci6adJV7NMgTYNlPg==
=MU9a
-----END PGP SIGNATURE-----

--khx4cneo7r6erf2z--
