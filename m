Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529931;
	b=xWdBJIaxNYVGSRso6HZl0ZQiyqJxsjITcwOHlOgihrydSZsxLvREYAD3Tx0aT4Whvm0N
	 9IE6f4t6IzKyq9onurTBb8iL4uBj2I1ynM5YvHDxTWn8Wx8ylPR5cTj1FBdCin7bIZ0ME
	 O9wGRsB0XS5FgubhJn3wuLajEa8O7E7EQQW1fpa/By44wEniVMnoYDPGKTS5wITNOP9Fi
	 xRhgb6WaiNeKZyofd2d+oHUpwwxxaqZCZsLrl0rdPYQTLz5YfNUhszALPK20KQkK670iN
	 YezWkU15pjXELL/ZjHD0tP37xkwFNytDlmRTjfzm5HJ1w/RyaL2rtmqrkISSPvHuSmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529931;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Last-TLS-Session-Version;
	bh=46BX4oLS8fj8nv8LSmObDobgH5Uq6ZuRpVuuI9FlxbY=;
	b=T/GKm0KwQA+D7MUtkddpyNaJUgrcMMgT/bB08Jw+N6wQoWdnp7XMFzkN7knTTmKQKVMa
	 OuaKBmg5wdNIvunMx6g8a7TOA1IL2CmdouZ7gfi2F66ZB12qGR1L7K540NOjCzaCWzn90
	 pMYvO/AaVpptLHXlnb5G4T+1/SWkiX36wjF3TfSV7iMDmwaqo6hwHcU1iEfzf1UCvcjZF
	 xSdiRuxwnplQI7rUij40v2TkXuK5xmQe1AG0u3LfZBqJrq6XdQRDBMrLw/3WEGdFjQvj2
	 nvc3MwiiNsH8rSs7U7vKDSPxpz4Xjcz1vIzykg30KGBdPglSLANmDe8Ks3jN99/Wq1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Y3peUFXa;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C28606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08C28606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Y3peUFXa
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 42A6EC2C648;
	Tue, 24 Nov 2026 14:18:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3F97601E1;
	Tue, 24 Nov 2026 14:18:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2A9C11E680B3;
	Tue, 24 Nov 2026 15:18:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795529925; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=46BX4oLS8fj8nv8LSmObDobgH5Uq6ZuRpVuuI9FlxbY=;
	b=Y3peUFXaf8Uyr482w/PrenOXIwd4bwsG9VtUekHP08HQq/4RjxY22vUm6F+m+rc0BHZ/g2
	jq5WbHnvFXtrDDPF/BlHbxXXoIaIlLfJLGBgpe53AiH6lBfZ0NN4ehivQcGGAAl3TGUbPL
	vT00lVaXOj6ZbXNno4bAhzLPhtMEzbZyDGJF0v/HFFfxgdrMyegwsfACWI1VRwM4OgL9db
	9DVDUwEWghc717rmgWmWNjg/rUM73bBUGtv0QN/3wQTBBb2AW7uUzmQG6nBIM/QWqn3gn9
	zOg6eaZ04h5yR/mmF6djOx2eb2CDEeM15VBgYZZulNPwwnCAc+lo5we5ImTj2Q==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Abhash Kumar Jha <a-kumar2@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 s-jain1@ti.com, y-d@ti.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, devarsht@ti.com,
 u-kumar1@ti.com, sjakhade@cadence.com
Subject:
 Re: [PATCH] drm/bridge: cdns-mhdp8546: Power on/off the PHY in probe/remove
Date: Tue, 24 Nov 2026 15:18:37 +0100
Message-ID: <sHjduanPT-iixJKPff7sVg@bootlin.com>
In-Reply-To: <df69d165-3750-4b64-b458-a2be7a3ca0e1@ideasonboard.com>
References:
 <20261124101747.2432344-1-a-kumar2@ti.com>
 <GrHOVCfQTneYbXFLczyyAA@bootlin.com>
 <df69d165-3750-4b64-b458-a2be7a3ca0e1@ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Tuesday, November 24, 2026 at 2:26=E2=80=AFPM, Tomi Valkeinen wrote:

> >> However, I fear there's something wrong with the torrent driver itself.
> >> I didn't study it carefully, but looks like it supports bootloader
> >> enabled PHY, and it then sets 'already_configured' field. When that's
> >> set, all these calls, and dp_configuration() are ignored. And that fie=
ld
> >> is only cleared on system suspend hook. So it looks quite broken, if t=
he
> >> PHY is enabled when the torrent driver probes, the DP driver can't
> >> configure it at all. Blanking the display or even unloading/loading the
> >> DP driver does not affect it.
> >=20
> > Hello Abhash,
>=20
> It wasn't Abhash.

Oups, sorry. Hello Tomi.

> > I am currently rewriting the torrent driver in order to fix various iss=
ues.
> > But I am not sure to fully understand what you mean by
> >=20
> >> if the PHY is enabled when the torrent driver probes
> >=20
> > This is not possible. The DP PHY is only available at the end of the pr=
obe
> > of the torrent PHY. So maybe I am missing something, could you clarify =
by
> > what you mean by that. But yes this flag 'already_configured' is quite
> > dangerous since it assume that all the registers are properly configured
> > by the bootloader.
>=20
> I meant that if the DP PHY hardware is enabled (so was enabled by the=20
> bootloader) when the torrent driver probes, 'already_configured' will be=
=20
> set by the driver, and then when the MHDP driver later probes, MHDP=20
> driver won't be able to configure the PHY at all.
>=20
> But all I did was a quick read, feel free to correct me =3D).

No, you're right. I'm not sure why, but I was convinced otherwise.
I=E2=80=99ll add this to the list of points to be corrected.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



