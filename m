Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988107;
	b=Yo6FYC2iCXZ+1vs0fp3YpduCo4/uX0P/IqKzxDCk4J9wuLj+fmCHx/lMhDBGcpEVcrZ3
	 H/UE+qLar3JfLc4Mvl2sLjf2xLSYHtD7jaXbHZSuWT15fJr3w9w2gt1Ms0glyPGBx7mjk
	 Mg73I1UzhDagQRs1ozTvX97bBfHuLMBfx+lgOHrJlGAqqJhXTbf8DBZ0z83KxEcjVJGbw
	 jaGYeryJGQLMnDveocFZdWBzZfp13OUBAtQb/TSwz+SNXFosu0x2bSsQlAF3slgb7WBUr
	 YwVtjRJms8coaiswAgA+pTDwIX9mOamOv99lWHoIAUYqB0ok5Lray6uAtzTv5+ZhbKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rfa2Ndd+oOG8KQIoHfUwwZJYDQDCRfNRCZHUN7HT2WM=;
	b=TC4kwbLhIGuQWQPDrPGKnqEbyLuJrpi1sBXVCgFmeu5oULTLd2tjzN3vNdAS36d9RpuO
	 C8WpdL2FWe2Uc3r70YA8EJPegd2zs+SiCSBvMOs5SRJc/+2zHu58sOV5C5NUKDLfhn12M
	 3fX3u4ie1bC5LspEprJsgHN5yEXcTMynwrZIML2v1qo+XP1bCMfdum19o1OCcIsl2RpwZ
	 mVSvsK8yefeQTX9XBqu02hbHvT6RVNZfdn3Hpz7OrcLR9zF7WfT0VuDHs1olAZvU4dSQg
	 Yz9aklY3VZghenneRD1L39VIRTlp4VJH8q9kg4LfsGAlF4Pq2LKCCCrMCWGzlmUkPhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lVOkRoXE;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399C3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399C3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lVOkRoXE
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso4541485e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794988105; x=1795592905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rfa2Ndd+oOG8KQIoHfUwwZJYDQDCRfNRCZHUN7HT2WM=;
        b=lVOkRoXEQv03jFeLFmgGaDFhyaUWdtHCGz9SJdE1T0pcYuPc3Xv6qZ419qMYrIoPe1
         OZR8t/NNRoG9/FOAgXcvzu1eBy/bUm/V7LaAGjPyWnnPwnpNFkSBEQHMlpHqQUdxpe20
         DMfAobKzMwZkhZcZhN37ybCSCqnDIBkeg1pHw1qH3PwV1q788E71DPL4yHonAfWjOJ4P
         1KlWbP2/sxrPXrAXlfrQdCM3IF1g42GoUjwfyDtEojrJrAcuFbMhW0A53CXIbS7AKC2V
         +tcxBvBShBfC0OY6OAs46d9ceTKbYBUaxI/inJOX8b2GkpT7je5hAizsTnLa9CYHVF1r
         ztdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988105; x=1795592905;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfa2Ndd+oOG8KQIoHfUwwZJYDQDCRfNRCZHUN7HT2WM=;
        b=b4W+0Df1cZqfmJ9spwYAulo9n3++CftM2HJE4dWJu5QwG0qRqkgDdSjVB7P7SsPKJh
         GIccQjzQ2tVrSvgLMkXgxU9zaHC7tvBCv2mdSi37M3SzcdF3tf04mPysbgBbXfK7jvxv
         MTL9trsDC9+rurfzJdgpzoPKbOZI1afIRa0pi6wRuQo5yqbL5VCJE3WTKhA32FTX3z9H
         zNuToV+wDGQuMbgykW162VF8xLB9qqi9GhTGd8pCrfK2wWKXfzLMftHc2+A4/Ce/UTet
         kREtxan3BjljJjJ7P6cqHw2jL8Few+oRm4ECmsvYr5YZce5AQS4fuZdI11XFkG4eDXUh
         nqwg==
X-Forwarded-Encrypted: i=1; AL+hErG5NIeVb+JnZrI+zXorp2x92i+URTulyYbLYLv0R7wqkV9/LsGY9GulhC2N13kZjMEpnj6pjdUD5pl0Wz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mJgqBRpDo18jQky6sBbkeOWsk34Rwcmt+mTdOzS8dZBIYa+zz
	A/AiXEnlQL5sJlefwGkrUr2GYwy2AOjeSSKTuC+SxN2j0jzSz4w+YAZgxBgt3ruBDuU=
X-Gm-Gg: AYBFou2PnpN1dsLkFwbnOYVOnkwcVEMZl1YAf2o2W7epvvDlSPoDiMjHCBrj4fEuCi6
	2fXNUQt12yYIFualqWn0e2Jo0049Bi+kEPS4+MAhy+sDTMKiidUC5BWz+rvvzndeTMviP5ZRmlC
	0muBxEFTe8rj43dCJS9wBlH75uuXCltLx0IVq/9sNNDJhOCuNvi32plhpDeJgJj0PLu9GHI6mdi
	WSATbzLCA9bvzwMmXvSmUshb1aMAXsBAVQUylWLaoYcyPSI034ySlkDMVgtGTKD6tSqtB1TkDAB
	pSBMgqFE7D5fMpiCPmdHQJ2BX3XXnYSB/asGqEseXm9+5VNrE3ndac713+Au4YKxw3iOJ3eIT5m
	zLHDSFw9NuJWaQwZZGoSK7KRmXDzcbnW+wNdwslI7P9tSivTgDgrBpsV8uKWUv3Xcxb8lNXEKjd
	XtfeUkjj6bc/Nk9B/maV7uevVHNezg634YJebzZQGm2wKZueFWKyG+xMAykeO7s5vXBK5aVkWvD
	ys6T+I3XoBRfzbSIMA0elUMolH1sHfIQXOq2wbc1U+MO9p3f0q0wIFsZCxKIKyaDBVErF8+o7ML
	FFc7kR0q6oUf+jEGpNFbodnakue7F56czVds/S5DdyqSI2eBO6xJglDWf2j/zYTz+tvMlUX8Nfr
	igWAyEVtI1eCeqauOEMWPXqE7II+H2WxXsFSv
X-Received: by 2002:a05:600c:501f:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb7da462b2mr31427555e9.29.1794988105583;
        Tue, 17 Nov 2026 23:48:25 -0800 (PST)
Received: from localhost (p200300f65f19a904dea20c2220232395.dip0.t-ipconnect.de. [2003:f6:5f19:a904:dea2:c22:2023:2395])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb7d001a64sm47962885e9.0.2026.11.17.23.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:48:24 -0800 (PST)
Date: Wed, 18 Nov 2026 08:48:23 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Adil =?utf-8?Q?H=C3=BCsrev?= Tepe <tadilhusrev@gmail.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/panel: add Novatek NT36525 panel driver
Message-ID: <av1XyXE9VsmDQuyo@monoceros>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
 <20261117173319.1852638-1-tadilhusrev@gmail.com>
 <20261117173319.1852638-3-tadilhusrev@gmail.com>
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
	protocol="application/pgp-signature"; boundary="a4po6jazqfpixeh4"
Content-Disposition: inline
In-Reply-To: <20261117173319.1852638-3-tadilhusrev@gmail.com>


--a4po6jazqfpixeh4
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/2] drm/panel: add Novatek NT36525 panel driver
MIME-Version: 1.0

Hello,

On Tue, Nov 17, 2026 at 08:33:19PM +0300, Adil H=FCsrev Tepe wrote:
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>

<linux/mod_devicetable.h> doens't only give you a definition of
of_device_id, but also pulls in a lot of unneeded stuff and thus
introduces useless build dependencies.

<drm/drm_mipi_dsi.h> already provides of_device_id, so just drop
<linux/mod_devicetable.h>.


--a4po6jazqfpixeh4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr9WEQACgkQj4D7WH0S
/k40FAf/TncjaPwzM6TMWHC0aVkQVFbPwvWHgOtKsJALddK9tvV9iUEX/t3z4OYC
2Pw0xd4BFpl2wkMQ75SUIuvye7326vcAZeDzEtQlPBth9JhC33iVimAMK0FpSsvE
0/AXXkTDUE/GAKaEvDsQ3bZNimMNNhB5LADAei5yAPmVh4TbBc4QHOP1cH+EtYXq
8q8BiItYRchUZoLNDWHmjHW4oTYTDLFfPMMmp7hTATYVDcwtjD1RLvwMLpIHqlQY
NJ50k0zz0HuXn8C//vtaTKTnNgur9aBJzePKuKDs4u6cYqMHewZS7a7MYuj9wTJk
uitb980Rg5LMsiRY96UDrtZKYIYheg==
=WQ9s
-----END PGP SIGNATURE-----

--a4po6jazqfpixeh4--
