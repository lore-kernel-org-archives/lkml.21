Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525265;
	b=nh4SI0PtJMHDxmA/8y964B1W9YCcsF39xDSIvV8LOHOpbi2+jtTAgRLS51Cuho70p8Id
	 nEt1OJnDCyyI0/WeQhkq0BOs43AJaYTP1iSTXz2+pFdQa6FPx/mQB8ANHUswLEeilX2e+
	 Z7xvkQxHgIGg7pDB70Aj6a9BcqZ39kYFhT4Ru5deZ2X8DOz6jDMfiXNQ2PnXQypzxCFlL
	 Z0xjiZajYwJm+Q7YZzDTwmBQMv0Qo9h6lOgjCZTkTrIk2pNwiH16YrWn3rlhu3vtd0bUl
	 BwldnJqCh+eGvZ2WbsdowohR/fptVIHMVtXpwAa5DIfonQVQ8iTWH53VaBar0NdS0RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525265;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Last-TLS-Session-Version;
	bh=2OoFqbIw2558qu9p0TplqOx23UrycORISC5gKvb7MV4=;
	b=Gc4fCCR0DqLZ/iCntnoENhbBvE9dc6+kv8SekHckT48Za6JPFYsnFv4Jtizj9eXH9ZXM
	 n8C9EyAALnQ9u/zto1JW957msTMZaqk62HpyUeVbFXJQnnIVHQqbJAs8cdZ7i5kFfQ5nE
	 9y9ntKi53bnhQCHUL1I+AN2+YYPMc+mPVctdXQrF9XeFW1LQDOP9ww9khgja9ikFxh22z
	 88ylFkYp4v6InSTo6zVyd3F/h9m9LIyObQ2YNSFWbAPwmWQxYoT9QQmaU+BsdyVb9BPJI
	 FWlUXEnR7rLp/rZGyEkW4CjJDN/ev0nyJ0QcLqc5NFn3kzi5PWzzEnvbmKSgMyeXDDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="MP/K3Qzi";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA946606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA946606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MP/K3Qzi
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0FE7BC2C648;
	Tue, 24 Nov 2026 13:01:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77D9A601E1;
	Tue, 24 Nov 2026 13:00:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4456611E69923;
	Tue, 24 Nov 2026 14:00:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795525254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2OoFqbIw2558qu9p0TplqOx23UrycORISC5gKvb7MV4=;
	b=MP/K3QziHkdxV7a2wSXZqNNArXb30E0FIBT0KZvtKLQcVpLGzBvIeuCUhlrHNmECliC81J
	/6hHaVHXCIYJ25DM/dJgcVRRNuXjAIcJH4C9nq+IOaFTxgFLL5s44Da92ZNdXDgn3rMqlK
	ysx5jVKklTwT9FKpEFkgY83Y0FPq6UJLQ+nnIjgw/5pRI9kTvw25xIKuNmrRCurSz95ntS
	PpDFPWQZYajQ7STo/z2PqKIlIpUEQ3GsYNmYazpyOSasP+8CvWA5qSNGu6e2wkMaO6dl2l
	y/bBlaCmpB63NTmoghS+26iSfcBFvibbwHPu4mRzAA6EkecMoZ+WWxzvMHDqxQ==
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
Date: Tue, 24 Nov 2026 14:00:46 +0100
Message-ID: <GrHOVCfQTneYbXFLczyyAA@bootlin.com>
In-Reply-To: <0a42d03c-f6cb-4d61-be9d-53b89b29753d@ideasonboard.com>
References:
 <20261124101747.2432344-1-a-kumar2@ti.com>
 <0a42d03c-f6cb-4d61-be9d-53b89b29753d@ideasonboard.com>
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

On Tuesday, November 24, 2026 at 1:53=E2=80=AFPM, Tomi Valkeinen wrote:
> Hi,
>=20
> On 24/11/2026 12:17, Abhash Kumar Jha wrote:
> > The driver currently calls phy_init()/phy_exit() but never
> > phy_power_on()/phy_power_off().
> >=20
> > Follow the PHY API guide's recommendation to call phy_power_on and
> > phy_power_off along with phy_init and phy_exit respectively to be
> > compatible with different PHYs.
> >=20
> > Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
> > ---
> >   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 11 ++++++++++-
> >   1 file changed, 10 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/driv=
ers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > index f47717bd10798..86e850a4752dc 100644
> > --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > @@ -2369,6 +2369,12 @@ static int cdns_mhdp_probe(struct platform_devic=
e *pdev)
> >   		goto plat_fini;
> >   	}
> >  =20
> > +	ret =3D phy_power_on(mhdp->phy);
> > +	if (ret < 0) {
> > +		dev_err(mhdp->dev, "Failed to power on PHY: %d\n", ret);
> > +		goto phy_exit;
> > +	}
> > +
> >   	/* Initialize the work for modeset in case of link train failure */
> >   	INIT_WORK(&mhdp->modeset_retry_work, cdns_mhdp_modeset_retry_fn);
> >   	INIT_WORK(&mhdp->hpd_work, cdns_mhdp_hpd_work);
> > @@ -2378,7 +2384,7 @@ static int cdns_mhdp_probe(struct platform_device=
 *pdev)
> >  =20
> >   	ret =3D cdns_mhdp_load_firmware(mhdp);
> >   	if (ret)
> > -		goto phy_exit;
> > +		goto power_off;
> >  =20
> >   	if (mhdp->hdcp_supported)
> >   		cdns_mhdp_hdcp_init(mhdp);
> > @@ -2387,6 +2393,8 @@ static int cdns_mhdp_probe(struct platform_device=
 *pdev)
> >  =20
> >   	return 0;
> >  =20
> > +power_off:
> > +	phy_power_off(mhdp->phy);
> >   phy_exit:
> >   	phy_exit(mhdp->phy);
> >   plat_fini:
> > @@ -2424,6 +2432,7 @@ static void cdns_mhdp_remove(struct platform_devi=
ce *pdev)
> >   				ERR_PTR(ret));
> >   	}
> >  =20
> > +	phy_power_off(mhdp->phy);
> >   	phy_exit(mhdp->phy);
> >  =20
> >   	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->exit)
>=20
> I think this one is fine, so:
>=20
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>=20
> However, I fear there's something wrong with the torrent driver itself.=20
> I didn't study it carefully, but looks like it supports bootloader=20
> enabled PHY, and it then sets 'already_configured' field. When that's=20
> set, all these calls, and dp_configuration() are ignored. And that field=
=20
> is only cleared on system suspend hook. So it looks quite broken, if the=
=20
> PHY is enabled when the torrent driver probes, the DP driver can't=20
> configure it at all. Blanking the display or even unloading/loading the=20
> DP driver does not affect it.

Hello Abhash,

I am currently rewriting the torrent driver in order to fix various issues.
But I am not sure to fully understand what you mean by

> if the PHY is enabled when the torrent driver probes

This is not possible. The DP PHY is only available at the end of the probe
of the torrent PHY. So maybe I am missing something, could you clarify by
what you mean by that. But yes this flag 'already_configured' is quite
dangerous since it assume that all the registers are properly configured
by the bootloader.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



