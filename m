Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629698;
	b=d0uTWwVn385/sHng9BNctE3yZBXrrUzfeqAzK8LSEgwga5AaYsiNcBjYhG0CeAwR68OZ
	 LRljmNXXjF8XzqhaCwjwCgd8TUVGXV4k9kCi1rD+JXNPytCMZo118xUBdbyP/OlMbEXCA
	 9HkhA4TF1xXnE9pnGp6ERyM3zi4UBorQhA5uMYBWXj3jje1K9je+H4poThTQ1qz8sYlFa
	 zgHZ5brhUQKtOs9/rr0xIufRNBl5N2BEdnrYvpnwm8/duRIrzXUa+m4roNMGYiSvcaBn4
	 s80S//QJDIm+Ht90YZkUjYUOvX3O1z2hu54wKEyjfopGtVf00xH9ryLmJyAjrwxVtjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SQBKkj/SFHaVJ5EFbKpZOuMYnMF6Smo0buP2OU5gYwc=;
	b=EamQDvVUI4RWKM94ZOByLnDKbj4+c2tnbWq4JNt87Ejjv77NSoubfpX8xj/Y7plJrUWJ
	 aNKrnsYTbOLtX6lAYXVKMWDoxYxcsr35Dx7uHe0+Zg251JSN1IFBpjtu2layQBVinX+Jb
	 IHu+sLYxWUiulF8janZJK6k/qTJQa580Z/5xgFddw8dDjS9QhJJkDXayGSbgRD+Qa0URC
	 WCcrV8Qf5pKJnTRuKoAljvvAN42wJQSPFntLALEUIbjM08KmCnvGGRFSin10xmWg8bi7U
	 5BKroD0WPZxqRwEFod2mHue+HSw8O6oimoc6IAV9NEelMokVxiULPviI7KQjmWzvxpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OCP0V0Ds;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ED6606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60ED6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OCP0V0Ds
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3832908f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795629696; x=1796234496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SQBKkj/SFHaVJ5EFbKpZOuMYnMF6Smo0buP2OU5gYwc=;
        b=OCP0V0DsOeEAYPzEoQsc4+xtigvdjLN14Zm/eOfE8tjoXmSf3nxYiUydo/HtLgj4/Y
         dWHC7ocBMsLKYG7YkNbRrMdJzkKJXRb7cZDVXqYI+tkWtgvpsqBA92Q3vgLcILlDU6Py
         y5qq6MNmglKZxwCgQfl9LW5/VBHq4D5ispBK1uKb9b7v6ys5lqPmiTgu7ltc0QKKGIyj
         aW54mEFs9u8BjIZhP1PMbQymnXBZ8KqdHrANPWgs8Asf9BjE1FnMd3o3tpeZNYQy/BNq
         HlLEGYaTyABq7E/5N4BswimCnuwwjdCSoWQcyrAFidvvyiCHFkca6p12ZQYuOSCOrLLB
         SGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629696; x=1796234496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SQBKkj/SFHaVJ5EFbKpZOuMYnMF6Smo0buP2OU5gYwc=;
        b=wQ7zpEqy4us+ybiGuAzcIyQQ/Z8l0XFaWDZ69eGfQdCULVtUS8iaQ7ZtINg0+w7ytY
         JFC5xVD5SzFB3E2hiSr6u/nmInbmdVjmBUWL7bYqzmZwp5ZIxG0UKwP3ei3YPw+pV/EK
         G/PGgbixzGUYzIIOXpvIMEf+wTcP9GIWQKujzfUi1PiuarJeEePK0Enkz3djUhdmFO3E
         g9jZDPSdIwRRfgTOJ8lY+TeLWppY6nQ0Ne25sVUe4gMHghRTu7EyKwLc1Mmu1+ruifLD
         HgMkstCmV77npXmbb3C2F+V/7B4yJickWLhzkyjoYQpEdw3dVaO2ZvtnYzJkm4Lgx41k
         TwVQ==
X-Forwarded-Encrypted: i=1; AL+hErHopuQ0Ile0ucLCqNFWDBh+V+F+z+5hwjw4BGqlPMNHcOb4hH41KQHMyCkZWqiQSD2wJ86qA0R7P3vasCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CZBPXRGFHew7u3mgYAKM4hY/8JFiIgukpS8Y9PBWn36NreyJQ
	zCEfrS+H3emE6e3f42po5GqoY5D1p7Ctny4SpBerSTZvrM9ld3UDXapG+0qmTGVzkWcBbiX9Wfh
	dP+R2NDU=
X-Gm-Gg: AZFdTZcaBsRNRH2gRJT2m27YxO3j6jkEflG16+IDrcrirzBz8s1hOeV6EnAEt7wb0G/
	GkQIE9nLQMvgDK6i6JVxR1fZ0e+P+fLSZKM6b77Dr/62PvI4CQk5TGMB43Wo9VRkJT/9bke37xS
	sxrTOwU7Zr3dymUAhkvJok10Hg1TeFnHSOIfJTIfEGlsIfLLdqiYclQRVHWmcYwmtiXaUjmWe96
	0+/4mAz2QSQaLzpPG2KcnGwAyaDRy2bMXAD++sca9Kut2FXZ9usby57RiUWBZZ50NMl7qPWfJya
	RsQgSv+NXOu+CYs9QnUuOirD5GYUxzCOU2Tq1r5pX0VHjn5FmORACSfRiUkw/QK1trTOra4j3Cv
	yv2M343Jxr71cH0XauRQIwJ/dr6MnwkCOLET5zf3Cj3n7XR/wiGDipZE48YdCJ4NUn0o1NWobIY
	ePlYe0iirVm2EPgoyagw/1EXGajAVKoLGyL5FVDNfKW8Jdzb/wuc2CHLnMrOR4eFp/Av5UDwK7p
	dm8fQrvDl17XQawWZTq1BjRI/96nItcN8HY1RQcHwizjaztFMxFu46Lqku4oUjvOSkI8HbSjAgU
	PXwpZGtRNtjwYZvFFFs419ThLQmIZ55dv5XeFKVAHyAbiIYFZkM85ZOZA6Y5Td0ZRNd/5HCisaM
	4/EVGBk1Myij6hmEA
X-Received: by 2002:a05:6000:2401:b0:4b4:2ce4:6dc4 with SMTP id ffacd0b85a97d-4b42ce46e8amr18390770f8f.48.1795629695670;
        Wed, 25 Nov 2026 10:01:35 -0800 (PST)
Received: from localhost (p200300f65f19a904452474b9d670397a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:4524:74b9:d670:397a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6bc8ce06sm34654162f8f.47.2026.11.25.10.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:01:34 -0800 (PST)
Date: Wed, 25 Nov 2026 19:01:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] spmi: Drop struct spmi_device_id
Message-ID: <awciArqa9haTL0_n@monoceros>
References: <20261125112158.938835-2-u.kleine-koenig@baylibre.com>
 <awcfdfk1La-lwiMz@monoceros>
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
	protocol="application/pgp-signature"; boundary="6oe7ykqcs6uc6lv2"
Content-Disposition: inline
In-Reply-To: <awcfdfk1La-lwiMz@monoceros>


--6oe7ykqcs6uc6lv2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] spmi: Drop struct spmi_device_id
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 06:50:16PM +0100, Uwe Kleine-K=F6nig wrote:
> On Wed, Nov 25, 2026 at 12:21:52PM +0100, Uwe Kleine-K=F6nig wrote:
> > This was introduced by commit 5a86bf343976 ("spmi: Linux driver
> > framework for SPMI") in 2014 for Linux 3.15 and already then was unused
> > and no user was added since then.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> >  include/linux/device-id/spmi.h  | 17 -----------------
> >  include/linux/mod_devicetable.h |  1 -
> >  2 files changed, 18 deletions(-)
> >  delete mode 100644 include/linux/device-id/spmi.h
> >=20
> > diff --git a/include/linux/device-id/spmi.h b/include/linux/device-id/s=
pmi.h
> > deleted file mode 100644
> > index a821c42cfc9a..000000000000
> > --- a/include/linux/device-id/spmi.h
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > -#ifndef LINUX_DEVICE_ID_SPMI_H
> > -#define LINUX_DEVICE_ID_SPMI_H
> > -
> > -#ifdef __KERNEL__
> > -typedef unsigned long kernel_ulong_t;
> > -#endif
> > -
> > -#define SPMI_NAME_SIZE	32
> > -#define SPMI_MODULE_PREFIX "spmi:"
> > -
> > -struct spmi_device_id {
> > -	char name[SPMI_NAME_SIZE];
> > -	kernel_ulong_t driver_data;	/* Data private to the driver */
> > -};
> > -
> > -#endif /* ifndef LINUX_DEVICE_ID_SPMI_H */
>=20
> With further build tests done SPMI_NAME_SIZE is in use however. So for
> now please disregard this patch, I guess I'll move it to another header
> but will investigate the situation first.

I think the fix is:

diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index ec97f12046f5..6d6805a5ae69 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -64,8 +64,7 @@ static int spmi_device_match(struct device *dev, const st=
ruct device_driver *drv
 		return 1;
=20
 	if (drv->name)
-		return strncmp(dev_name(dev), drv->name,
-			       SPMI_NAME_SIZE) =3D=3D 0;
+		return strcmp(dev_name(dev), drv->name) =3D=3D 0;
=20
 	return 0;
 }

which might be considered a standalone fix as there is no reason for
both dev_name(dev) or drv->name to be not longer than SPMI_NAME_SIZE.

Best regards
Uwe

--6oe7ykqcs6uc6lv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsHInoACgkQj4D7WH0S
/k7UrggAlyYu2HmH4/fGOIuZTO/qKfCJ1gbbHpFOk/meh0eExqMLiTsFb9WoWsGH
focej+ZyOdU1CIQ94L6t3lXarBZDqrz3mx2fIZIfFL7NG48kEpQenYc6lDY4R6Vm
uxhWxuxph/lJXsO45fSyNvpVU9SHsmNwZiVv+Nvuw0Zb6beme4pH4ANqzMZsJda4
W1aw+NodJNKKMpyxJMj/96XURemoK2x1y1hDhlZhoGIljxcLxuiq5AYTCghHw1TE
EHQ6ACHE+I3grjepu+7qj9E4og6XnHRhHPBfjQ16IF6Msn+7wUvSy50cQAkqUI1B
Swgl08p5++kuznD0yyzOA6l2uL/b8Q==
=d7Th
-----END PGP SIGNATURE-----

--6oe7ykqcs6uc6lv2--
