Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795613546;
	b=BAwFRT9lohjLVnhOYDs/odqW+AD1MY2CZl9QJziPRYm33lNihKVP2+zScpFYGw++2zDE
	 gv2q03hmmwdeJiGC/Ed2G4I7cFK6Hqj4tdl5yJtBngg1AJmzQdYBrOuZTMHdRTqti5Ony
	 GH+IT8SGwywLMOYMHIdvRgGkBEO8ucEQGqTND8eJhnxRXp0dNwPrEp/YDycQf/mt+3KeY
	 Bu+PNH7a75Evi2RVYpE4wJ4GAB8k5bIvmmxgtfdYrCr8RQVzYgQKBMd7vvnpvWSxr/7Hc
	 Zc195NAkTOOlK1gidG2HtLDWmgEuJYs/K1NuDeEUItLlnwTseFXKAkC0PNc5yZDo0NA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613546;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=kXriJ12nanvq3fONeNExM0l6Xut6OO1yD25gyHIznDU=;
	b=EETVGNZ8yh7H2xG2bDtxHzcL2Aw4pmcqUgvidVnBk/SmlHTon1+ytNNvM2K9mEAWXMbf
	 H6CkmTdQeoXSzqaob3QretvxLjIgqFlqAWuQm6sGWKUIqeEZQudUwql7gqPqGhmADf36R
	 jGm2as0ufTFJZng4jaUlsV4PFjVxFpS3Dv5W5ikV6t8APxkZPyfVuhMI1Wc7tDg+9q6OI
	 WvcUxcjOHXZyKPnHCKKGbXaNFdNP+Y0EtRXbgyFdYjWuvPa1KkrO99uVeDeOiACCNoU/p
	 z7gQdgx8gqM537QwhRA+dhHnMSmKsPGVuUjUCJtOVyA1UuM0P5PBadnEtApzXQ6cOmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=khqzPxx2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4858D606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4858D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=khqzPxx2
ARC-Seal: i=1; a=rsa-sha256; t=1795613482; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P2e9XZhl1ZU5FbpTQcAnfUO17UtygsI7B5nDQsisjpgyX+paUBdDhR7HaYtPw+lPXPPgKYCVZ88n+bCecW9kaF40Q31tOhJBJteBenOotAUVy26uPcznGeKZf91uiyx7gWLEj4EYKH3ui6RRv+fl7LRmR2AajDCY7Z+r06ozX4U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795613482; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kXriJ12nanvq3fONeNExM0l6Xut6OO1yD25gyHIznDU=; 
	b=Y0cZZzzCV/32anipb73oQo4SPF+E9lBbCJ2QnCqebWIxbPB118O5tLmustKG/R9AAIa1Hl/UwIq/pkoJ8LlACoiAWdPEH+URJx9CFqYRsG3Qj6dqkF/74C+s4hY4RefG6P4iflvfNrI7ZMaED2Qbi9WX7FY7mAT28CtwPUCDIt4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=khqzPxx20hWb5r2Pt8E8aUt3NXH/rGIXlXPEW7YcDT1NiTVJUncYby/E7W/zOz5JEpKp4BWKPvQVo+pa3OP3kwc0DE4WMHNaopfOvAu6JnbyQLWUCdS2qemwxntd52DxDKWWIFiE+56dTGph/D498EwFx8zMtn7beKRfC1t2ayo=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=kXriJ12nanvq3fONeNExM0l6Xut6OO1yD25gyHIznDU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795613478339261.5282445166183;
	Wed, 25 Nov 2026 05:31:18 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 6300B180642; Wed, 25 Nov 2026 14:31:13 +0100 (CET)
Date: Wed, 25 Nov 2026 14:31:13 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Tim Surber <me@timsurber.de>, Heiko Stuebner <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andy Yan <andyshrk@163.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Daniel Stone <daniel@fooishbar.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 07/15] drm/rockchip: vop2: Reset AXI and DCLK to
 improve robustness
Message-ID: <awbibXdVMfiHd50t@venus>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <20261105-dw-hdmi-qp-yuv-v6-7-1bb63ef5766e@collabora.com>
 <20261121023139.3515640-1-me@timsurber.de>
 <3c203ba7-6a0b-45bf-ac88-9928ad0b4a11@collabora.com>
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
	protocol="application/pgp-signature"; boundary="3zhaupgthbvlu3go"
Content-Disposition: inline
In-Reply-To: <3c203ba7-6a0b-45bf-ac88-9928ad0b4a11@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/295.600.19
X-ZohoMailClient: External


--3zhaupgthbvlu3go
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 07/15] drm/rockchip: vop2: Reset AXI and DCLK to
 improve robustness
MIME-Version: 1.0

Hi,

On Wed, Nov 25, 2026 at 03:58:18AM +0200, Cristian Ciocaltea wrote:
> Hi Tim,
>=20
> On 11/21/26 4:31 AM, Tim Surber wrote:
> > Hi Cristian,
> >=20
> > On Thu, 05 Nov 2026 03:00:41 +0200, Cristian Ciocaltea wrote:
> >> @@ -953,6 +974,8 @@ static int vop2_enable(struct vop2 *vop2)
> >>
> >>  static void vop2_disable(struct vop2 *vop2)
> >>  {
> >> +	vop2_reset_assert_deassert(vop2, vop2->axi_rst);
> >> +
> >>  	rockchip_drm_dma_detach_device(vop2->drm, vop2->dev);
> >=20
> > with this patch my RK3588 board (FriendlyElec
> > CM3588) hangs hard sometimes when the last CRTC is switched off. Withou=
t the series
> > or with the AXI reset in vop2_disable() removed it does not happen.
> >=20
> > Here is a minimal reproducer, run as root, with a display on HDMI and f=
bcon on it:
> >=20
> >   python3 - <<'EOF' &
> >   import fcntl, os, struct
> >   fd =3D os.open("/dev/dri/by-path/platform-display-subsystem-card", os=
=2EO_RDWR)
> >   try:
> >       fcntl.ioctl(fd, 0x641F)        # DRM_IOCTL_DROP_MASTER: leave KMS=
 to fbcon
> >   except OSError:
> >       pass
> >   while True:
> >       b =3D bytearray(struct.pack("6IQ", 2160, 3840, 32, 0, 0, 0, 0))
> >       fcntl.ioctl(fd, 0xC02064B2, b)                         # DRM_IOCT=
L_MODE_CREATE_DUMB
> >       handle =3D struct.unpack("6IQ", b)[4]
> >       fcntl.ioctl(fd, 0xC00464B4, struct.pack("I", handle))  # DRM_IOCT=
L_MODE_DESTROY_DUMB
> >   EOF
> >   while :; do
> >   	echo 4 > /sys/class/graphics/fb0/blank; sleep 0.3
> >   	echo 0 > /sys/class/graphics/fb0/blank; sleep 0.7
> >   done
> >=20
> > This hangs the board within a few blank cycles. In
> > practice I hit it when a KMS application exits: it frees its buffers
> > while fbcon takes the display back with a full modeset.
>=20
> Thanks for reporting this - with your reproducer I could also trigger the=
 hang
> on my Rock5B board, after ~15 cycles.
>=20
> > This issue can be fixed for me by moving vop2_reset_assert_deassert(vop=
2, vop2->axi_rst) from vop2_disable to vop2_enable.
> >=20
> > --8<--
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu=
/drm/rockchip/rockchip_drm_vop2.c
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > @@ -913,6 +913,9 @@ static int vop2_enable(struct vop2 *vop2)
> >  	if (ret)
> >  		goto err_put_pm;
> >=20
> > +	/* Reset while idle; doing it in vop2_disable() can hang the SoC */
> > +	vop2_reset_assert_deassert(vop2, vop2->axi_rst);
> > +
> >  	ret =3D rockchip_drm_dma_attach_device(vop2->drm, vop2->dev);
> >  	if (ret) {
> >  		drm_err(vop2->drm, "failed to attach dma mapping: %d\n", ret);
> > @@ -973,8 +976,6 @@ static int vop2_enable(struct vop2 *vop2)
> >=20
> >  static void vop2_disable(struct vop2 *vop2)
> >  {
> > -	vop2_reset_assert_deassert(vop2, vop2->axi_rst);
> > -
> >  	rockchip_drm_dma_detach_device(vop2->drm, vop2->dev);
> >=20
> >  	regcache_drop_region(vop2->map, 0, vop2_regmap_config.max_register);
> > -->8--
> >=20
> > Does that work for the cases the reset was added for (the RGB <-> YUV420
> > switch glitches and the DSI panel on the EVB1)? I can't test those here.
>=20
> I briefly tested the RGB <-> YUV420 mode switches and didn't notice any o=
bvious
> regressions. For the EVB1 we need Sebastian's help, as I don't have that =
board.
>=20
> Would you like to send a proper patch in the meantime?=20

The EVB1 only needs the reset during probe/bind to restore the
system into a known good state from the pre-initialized state left
by the vendor bootloader (showing a logo bootsplash).

Greetings,

-- Sebastian

--3zhaupgthbvlu3go
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmsG4x4ACgkQ2O7X88g7
+prOBQ/8CIcEvayzY+dKqCYk8ubLy7cDwOCac13+BQiPvnRi5oLrN39ARC/iNBvS
GiMUV6zzuH3oCywAI93gA/aepQV1hec8gLCnUOAGyEjxHhxtwvn7tItqbJLIFwLZ
ZHzRE827mZr16haAJOtX+2euDOkkLyGHUEc56nkIw6jFzKoRnQ/ZMiR9k85Xgxm2
Btcov3VWdZDX7URwKk0WRaxMHeM4YZHF48fl80GfrjVfco1RZvMZ+lPH0jTvYCRR
3bE0B+vnX1puiGSuG2JuKQGgkPk1skslAV+Jl8qAoRLb0Bq+xAWw87arapR9gXjA
7P7JbvOSfxPYQD4/JzB4wC1gW914dKwD+LiR3OxoQwDLvphX41Vx43+j4iYHBAFE
vUTWBs8jDMDuRd/1dyv8NHufCCAPHL5eDHe2kqpF6heRSm5CAB20rkRVCsas2EC/
O7QKb8fYKb/SNvft/bmWcGK+gvJeZ5xnSFtfwtUslJ9TdgMLs1oQU4F2AK2aXsWr
dIaqTyvso2ifyclIcIyTr6o2BEr1zT+GrRwQWWXnL1skXqw7ECpF+wuajuZxqZp+
+dhOZnHS54E7XnIFLYubA3i1LrSqUIP451Z/MeCwGxZN1n5rcmsxsBsPA7BIQoIN
rIqdogcEkTBTkNeizE0oltQuKttbNkaujsmcTBlXLzyD0Y7BUVc=
=7qpV
-----END PGP SIGNATURE-----

--3zhaupgthbvlu3go--
