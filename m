Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629018;
	b=UmeOtiD7hLpLhr+XSP0UKA5N9T4zLlMTC7/2v3/02CczObN2my+d88AltnWxEf3wq4OZ
	 HFWAlQRaRZCRQB+D7rwbTS4YOXlItzuMO1U8OAo46R0Dwcs1wXxBgbhZhhFSCf+Q8cMjB
	 0k9Ri/f2pSd9HYBfk0LcQ64ocYKoKyJUZbJPlkD/Mb3NHXdLjpf/ymF6r3f3U60igwy2C
	 Re9r5+kKsTSmN6end6IxE7gOO+wZ02iGiwow/Z22Cc2ibsDh0JvpJ5s0X5WWrSmUBoBV6
	 y/1v7r28CfG8c04tTrd0NS5ulQ79e7aToOAGDhUdr4d+rdew27qHXxiBsriWYTTPsew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2r80NKbvyJcHeJgMiyqjpPQiQ/SlSXTJKwo1z4Ie4Jc=;
	b=4VJon0ZdmN2lbnNja/TxJWXGMy4aKn+ri2jsc/Q2l/1j2XDi8HYJpo1rHw+iLR+7C9y8
	 j3x3S9U7oqx9cr5ATZhG63aaWifDP67elE4qJHwyttryJPP3pybDb3aVDpV58cVkMmkOv
	 woFoIowksIgB5NiPMipYLM2l/bzF7CtGkxx9mDjkpxfUTlrM9BYrdAGAT0BTCBht5OE2r
	 oWScpuPyVmQJdmg1/S9sGIXkpxg9lc0+LR4QlXmYH98AV8B7FWww1omZUhAjJ2Ij6MS5n
	 5L/BxKXbaZ2lYB/JTrTqEf5TMEgrBn3z7IIMmJOpBno40v+2h+wULADdCZPr0rRdz3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QvuWN5eh;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538A0606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 538A0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QvuWN5eh
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso56552255e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795629017; x=1796233817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2r80NKbvyJcHeJgMiyqjpPQiQ/SlSXTJKwo1z4Ie4Jc=;
        b=QvuWN5ehFUg68ceyYPph9eXz32ei8PyV9Jt6DENSeOk2rny2H7aSrAyj0h5GPpUTJJ
         bZ+GkkeqGZWCYHBc/ti03pNFU7P+8ctviGWKZD0Cp3rGR1eXNQS8JNsWUz7HtnMqqNyZ
         f+Cn4G2eyp0g6YCb6XPc7cZlUCtB/e21MLXcltpSpwWTjexlcROh3XwKrpzFfNHS7BIJ
         UIDpbbmmaigiNooNyvtYALFyBkBc3fCZjBCvtyQEQIInOFCtA9rrqHtU5SPGDiDBLYKa
         q89zYViiS8i6As7u0EP/MtueswhWvg25ZotKn2ey3n27RpZ+Fvoktb2de6MTZ4BV6LPZ
         aaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629017; x=1796233817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2r80NKbvyJcHeJgMiyqjpPQiQ/SlSXTJKwo1z4Ie4Jc=;
        b=CaOgxkTJs31LC3P9FC+kExe48763k+YzgRGKFKo9Bf/O7xFjDdX6tUKoeh+1PKUHW1
         k8xkfFho6ERSR8qHy7YNQdK07sAUN5TETSKN1fr0UjHfb33ckpOlj29zXNvtd2sb67zr
         dV5XKjbEbMkfnatZm3jv5Z9uoVoz+mJSvOJ82oa4lpGaOgPRqmBlG5aXbzoLWPPMHT+V
         vsgJBBr+VxpYgQCMSP0XJVe+htLbWF5w0eGFc5wXK0BH1VZg8718HoBaF2aawZyYNE9g
         BaqnQfXPkcRTXmvW9PUxG/RYAkcGkBpzwDEFINc0SAgw/YjS67sAhD5JgHCktfj1G+8T
         6h0g==
X-Forwarded-Encrypted: i=1; AL+hErH/vian58J7KLHh/LiWRp9YXuf3O8vklZimMbDd4kZynwlHCBIqDnUuwOaAmNmSelJISxvwyQ7X/Om7oiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xrUAVLVEe5obvE0cL3a4z75xKiHogTVPpLwkCiycCwlwb9m+3
	8Hq0kq11Q1N43/vs8n2fgzZlDqkEDv0kovfIQ/eM2hbRgE4VKlizI6KW2O6q4wpnLL0zbIBd7Nj
	ctNDezbk=
X-Gm-Gg: AZFdTZddvmA6D1fmqBxFQAammyS5Y2NWEmW5XQvVZRE5D4N79QTLvCwHNzZzz+FSrSg
	Z+A7nAzb3yL4hnWwgAfSQEW5X2+ZZaSnM0h+lHiI9nrmGeMJuBrbpx6dbkaQN+pawoJpJsia7pq
	xNkIx19oF3xS6vecP02xha1+Nut/ZDEZnmjQV7/c6Sn5lEY8peEES3n6IDmule1ocUJFA7dnfBU
	yeD9WneNzpLnQdFNqttpHvO9njYANaUxm7uriHXdADxq9mVL40POL6hMgtsg+mtxiNRoaUT8rbQ
	DSiJjHgtsABLCRsaSKbPLCCFczKW6mADEpLZrODHCiMs1+Xhc/ZL3d+L4OdvezcJVtLfOvOnTSZ
	t1cy/e4dLtHNFQbAa8VBEGKdh/RAuX4v/mC+gg93/5pqKBlUHADRRiNTFre+QvikSb7LZRPIeXS
	4LK4dwnwpVI7FFbPHEybak9lotqRUD+jpAlhZlWgyszYu84Dj4sZ+8WwXglH7lBSb6AWAcAaWkd
	GU5AJgKJ06FB0Gr0fA3RQIsm0R88mVStRFaTzuH7SjJQg/gQ0m4/tJ+FaNwdiyqrVDrLeKOux5D
	TXDyfoqPgtwFXmYcC8fR2M94oc+31ytCqMjssAWauELmrBo7tcQq2oZMO1aQamqrKNIyPtKIjPT
	TbO4vz3xzDGCoMTDJ
X-Received: by 2002:a05:600c:3103:b0:4bb:69d8:3e92 with SMTP id 5b1f17b1804b1-4bb8881f095mr389703615e9.29.1795629016675;
        Wed, 25 Nov 2026 09:50:16 -0800 (PST)
Received: from localhost (p200300f65f19a904452474b9d670397a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:4524:74b9:d670:397a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884911e3sm646404725e9.6.2026.11.25.09.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:50:15 -0800 (PST)
Date: Wed, 25 Nov 2026 18:50:15 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] spmi: Drop struct spmi_device_id
Message-ID: <awcfdfk1La-lwiMz@monoceros>
References: <20261125112158.938835-2-u.kleine-koenig@baylibre.com>
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
	protocol="application/pgp-signature"; boundary="n2umwzcpc4fcj75e"
Content-Disposition: inline
In-Reply-To: <20261125112158.938835-2-u.kleine-koenig@baylibre.com>


--n2umwzcpc4fcj75e
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] spmi: Drop struct spmi_device_id
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 12:21:52PM +0100, Uwe Kleine-K=F6nig wrote:
> This was introduced by commit 5a86bf343976 ("spmi: Linux driver
> framework for SPMI") in 2014 for Linux 3.15 and already then was unused
> and no user was added since then.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---
>  include/linux/device-id/spmi.h  | 17 -----------------
>  include/linux/mod_devicetable.h |  1 -
>  2 files changed, 18 deletions(-)
>  delete mode 100644 include/linux/device-id/spmi.h
>=20
> diff --git a/include/linux/device-id/spmi.h b/include/linux/device-id/spm=
i.h
> deleted file mode 100644
> index a821c42cfc9a..000000000000
> --- a/include/linux/device-id/spmi.h
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef LINUX_DEVICE_ID_SPMI_H
> -#define LINUX_DEVICE_ID_SPMI_H
> -
> -#ifdef __KERNEL__
> -typedef unsigned long kernel_ulong_t;
> -#endif
> -
> -#define SPMI_NAME_SIZE	32
> -#define SPMI_MODULE_PREFIX "spmi:"
> -
> -struct spmi_device_id {
> -	char name[SPMI_NAME_SIZE];
> -	kernel_ulong_t driver_data;	/* Data private to the driver */
> -};
> -
> -#endif /* ifndef LINUX_DEVICE_ID_SPMI_H */

With further build tests done SPMI_NAME_SIZE is in use however. So for
now please disregard this patch, I guess I'll move it to another header
but will investigate the situation first.

Sorry
Uwe

--n2umwzcpc4fcj75e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsHH9QACgkQj4D7WH0S
/k6CZAf8DVoU1f3FuT8qVdsDO7SBKog0xKU05wLqJfebMBiUrFRtgKnKs6gq/DHg
9s113wRYOnkBOtLuUSl4zfy5lo3UFQPTN00h4cgVTAJ40CdjFZ3ktHzIII/wS+W4
UKlzzz9KArz0RU9WmvtTC/5KDoalVR9T/fGAYDej1FNyU6+fT00yzYtgUlw9VDmy
LJcbJ4N2Jz3gJJ0u1mat7lI96jTZEPHSa7sFLpuSuTn4is94NiexWLtNIN1onZzg
gDf/60e5Ukg3oBDUHn4wQokPhmZmCVPM20ycfl3DIlmYf0/yHGQOn8sMcm+dJfQF
Xy1wHriImNuNsesBWsC6zXSb2WeRow==
=H46B
-----END PGP SIGNATURE-----

--n2umwzcpc4fcj75e--
