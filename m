Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431488;
	b=GrmUthtNaPvbqS3FvqUN6BBoa3MXs6FHEN8cyuJZUxOKoEMX7OSF+NWUihzUf5el1If6
	 IJUcLg6Hhjb6AOT2xcicYpX/dbZdjhcfW55exyj+NzQvl2oxvJJJBGsDpgxdJATk1XTTQ
	 L0J4mStldC1gneIvVGZ5TCRFzIKEptdOSfGh9rTgU6ISM/V6WvYjSvHC91ggC805LGJjW
	 dRjLx4jQZF0gjDgPS8AEkEGWbA71XBfBmpRr8SZHZtgs7fvwVc9vNTfPgrHzuOwt/7nFK
	 gAmk9ujXq2pSc3WHnwtrwJPgZ6hPPpOsdCfC/aLedgGnX4Gqn2gzlFcNUjFCoZEEAbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431488;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=55vp1rgyy0L+BcAK3ve3ZlJ1e2OePWPl2FZy/TQWsXw=;
	b=MRXO2Q4SWZzhI/vVeEyF9GYb0BQt2T2oflNHlgMRTD0plh08aHq7VCNTpTtDDnwuXKag
	 zQYQCk4R1ZW0K9kfYBggpzzk9Q0WreEfHPwDLo6jAhwVLJEd/rZXEWUrJv8CG75OMxgvy
	 yfVCjP4020tdOnONDf/fv2C7OpgzoFqSAqD6JNPP4TnSLez3B+W5xOJUwTmyTK3f1UtDL
	 UrYwV4xkdikHcmy2bYa8EZOiEl5X2FfYNA8eaIuc+PeOH55WukeQWcMCi0uWKIORlDA+j
	 JYEkielGq93QS+inSnzfo/cQ1ZnICImybFMZh+dxjSCcl9femZ/i8QMYJsXGQ0QVClw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fMCqUx1r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C847606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fMCqUx1r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C4B1F000C0;
	Mon, 23 Nov 2026 10:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795431487;
	bh=55vp1rgyy0L+BcAK3ve3ZlJ1e2OePWPl2FZy/TQWsXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fMCqUx1rfzUSVGsb2g0v260dZoKckJsNK6pNC67P0cpDtalX7T7xXKtnQ/MLFd4vf
	 xSiYl3UhLsnFAeJrPoa/UIjXiAv+jZtjdgr1ePFEzaS1IPb4nJigdsx0q7QSthD3dn
	 LmSMuBSDjgL9FZn12KGwEhm4lm05VY0L0cWmljwrqfIn6p4lB4eU2JsSkkVDZYgARS
	 2ByMtEXj6klidW0eWPtax8Q53EA3FSqnRVRK3qk5m1bcJtfBBj/Rqx5BBC4UpopBbK
	 pcbUrNkETezyGAWE1C2xAkTn1lBZd+03j9gKeQNwgvRogqYWRtnRbqzJnomX5aUV+C
	 RDVnZS5UIAOIw==
Date: Mon, 23 Nov 2026 11:58:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
	David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/8] drm/panel: Add sro_install hook
Message-ID: <awQb7eQd6P7NatX4@houat>
References: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
 <20261122153032.2782768-3-dario.binacchi@amarulasolutions.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ha574b4xdcjtwxnj"
Content-Disposition: inline
In-Reply-To: <20261122153032.2782768-3-dario.binacchi@amarulasolutions.com>


--ha574b4xdcjtwxnj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 2/8] drm/panel: Add sro_install hook
MIME-Version: 1.0

Hi,

On Sun, Nov 22, 2026 at 04:30:02PM +0100, Dario Binacchi wrote:
> The panel bridge assumes the panel is enabled whenever its pipeline
> is read out as active, but the panel is left marked as unprepared and
> disabled. The following disable is then skipped, and the panel driver
> never gets the chance to acquire the resources it will release when
> unprepared.
>=20
> Add the sro_install hook, called when the state read out from the
> hardware is installed. On success the panel is marked as prepared and
> enabled.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>=20
>  drivers/gpu/drm/drm_panel.c | 16 ++++++++++++++++
>  include/drm/drm_panel.h     | 10 ++++++++++
>  2 files changed, 26 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index bef0e6af73ba..daccf98e5513 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -346,6 +346,21 @@ panel_bridge_connector_readout(struct drm_bridge *br=
idge,
>  	return 0;
>  }
> =20
> +static void panel_bridge_install_state(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state)
> +{
> +	struct drm_panel *panel =3D drm_bridge_to_panel(bridge);
> +
> +	if (!panel->funcs || !panel->funcs->sro_install)
> +		return;
> +
> +	if (panel->funcs->sro_install(panel))
> +		return;
> +
> +	panel->prepared =3D true;
> +	panel->enabled =3D true;
> +}
> +
>  static const struct drm_bridge_funcs panel_bridge_bridge_funcs =3D {
>  	.attach =3D panel_bridge_attach,
>  	.detach =3D panel_bridge_detach,
> @@ -360,6 +375,7 @@ static const struct drm_bridge_funcs panel_bridge_bri=
dge_funcs =3D {
>  	.atomic_get_input_bus_fmts =3D drm_atomic_helper_bridge_propagate_bus_f=
mt,
>  	.debugfs_init =3D panel_bridge_debugfs_init,
>  	.atomic_sro_readout_state =3D panel_bridge_readout_state,
> +	.atomic_sro_install_state =3D panel_bridge_install_state,
>  	.atomic_sro_compare_state =3D drm_atomic_helper_bridge_compare_state,
>  	.atomic_sro_connector_readout =3D panel_bridge_connector_readout,
>  };
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 58113ea7d63a..66f9fc0828f1 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -148,6 +148,16 @@ struct drm_panel_funcs {
>  	 * Allows panels to create panels-specific debugfs files.
>  	 */
>  	void (*debugfs_init)(struct drm_panel *panel, struct dentry *root);
> +
> +	/**
> +	 * @sro_install:
> +	 *
> +	 * Acquire the resources of a panel found enabled when the hardware
> +	 * state was read out, without touching the hardware.
> +	 *
> +	 * This function is optional.
> +	 */
> +	int (*sro_install)(struct drm_panel *panel);

In the panel context, I'm not sure "install" is the better word here
since we don't have any state to install in the first place.
"sro_enable_resources" maybe?

Maxime

--ha574b4xdcjtwxnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCawQcPAAKCRAnX84Zoj2+
dvBkAYCiIabbXhEPWOXGEzLDWnXhRX31FO3NJrLjEZgy0AX+Ptd3X5P9XLNjRF5b
eMxjDcYBegOfUhSrwp8IqSnJA4SnFZqhcZrXkZHXfCwqO1x8/7P3c4D0ivrNpsLW
bUmdSbMXFQ==
=C5UR
-----END PGP SIGNATURE-----

--ha574b4xdcjtwxnj--
