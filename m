Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554891;
	b=zhhmrnvlvnCJIZJvY60QsJbIjMDPuGP2RhbbQqLniieqwzSwf1anqcbwE/rHDvWSgUDm
	 xZVi3IGNbRKlESNUngZCZYNBCKyK4SBsIeJxNBSOLuqo3XLpI2mGwOjL5J2GzJHNhWAfO
	 CsYbkYR66aJv8Ne9KsJSIKpwQhZMFFC4zy4AnffZreH82Rswuip9YZZGcJ/ke1KppcuwB
	 O5/Ts8tm1CUKGWrqv5EfqMPL2uYnqF9Upbpu9KQqVOF81PJoqq8upjhsm+pW46Vhj1TTy
	 MV/FZ5XQGEUtyi0Qr1lvkkOxp0W1lfpA9KreuxIN6Bvl1gFq3t1S2GkgBBnw6yS1/UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=W9arlbU5hy5tgNRpcN7WmEtmYSBI8GYP25HN7JEKy5U=;
	b=NwugaA74X0Pnq8IKPpOuTd0bio3se7CQunCPYKApZuYyIB9o+19GTlvme7etTv6eUeqU
	 JOe8kTG/ALHaI+sPnd0vNaZHZrRZJATwdLAEfeEiW4CHeA30Ooa4f6O2/wlif4B6XH/cv
	 B2s2you1Y8XDcV9EAzRS4Mty2eI+E+punLFJGhbmDmGHI6isthAUzNDe85wAQ2twJqCNZ
	 Q4ERoQdFkEnNb6BWrHxKZPMyV+IsPjKj8aQCoeugbE8QFXlLC25QFM1SRMiZDohXNbFe/
	 LPNcmunEbFIJPM2AVUUv/SU0pAFMQhXcZeAT/hoBsuxm8rxsTGTOGQk+gaHAYILw6sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G4Nlx9RE;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16D9606A335
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F16D9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G4Nlx9RE
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-943e8d35f74so494700785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795554890; x=1796159690; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W9arlbU5hy5tgNRpcN7WmEtmYSBI8GYP25HN7JEKy5U=;
        b=G4Nlx9REgrH/w4vF04NI0pyJhkibMqYvmuT/S5FuQ59WnxzHW11aE5qbRBOrpmRAfu
         VabKZjpHDmFss/jIdlTQOf1qheIDh9NSvFKaATJReeQt0YY+Sy598c7v9wwCgLswSazM
         +coSR3n8dpoDfReX42DOVcKF9ykbujkHNtfVFPz1xKw2IYDVE+jjWKGNF92cBWqcZzAI
         D/cTwDMbWsGKgXf2WddVv3Nuphcj9heRbdBFnBGZJrFoEtVZwX7AYXeyu0kDTJ9FHfto
         mXVFoplI8jq/pXMNeOIjFvbxwzgTZTR+p8nrBW4XVBIZ0e6+3l6+ToXotJr+Ta/GFoZi
         qj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554890; x=1796159690;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9arlbU5hy5tgNRpcN7WmEtmYSBI8GYP25HN7JEKy5U=;
        b=naVq7ogZ8AuPy/6B98VZc+G2hmlY/bxuf6BgfIFwXHIniwvqiXNnCEuWIceEIIs4/M
         D+4HJf+3KJlODODW4DxUvu5f3xXQa7yGfFAKC7MIZ17cH0jmqq3u/EQIoPqnpwHACpNG
         Puuy1MEX+7CJGAY4NW1J34OVeKQrWNaW47Yc1qyfLFTj8jFZ54CLAITvbTveKiQw8bhi
         OpuoI9giX52vKaswC46Zqashgwyu7IyDgDs2mLQAsBnWCrfQLBH4zaLkQscOFeYH0WmO
         1yIoXjAEOwzygqwBaoN3Aj5tIX13c83rblmq/bJtjwDWIrDs3k6CrU+Urj9wKfJlhX9L
         qlRA==
X-Forwarded-Encrypted: i=1; AL+hErFWIlpzPa9WKuPl4q/GXWmoGAsd4aeOG0T57oEQfrZ/6j5PlSh5MRSN5lZx5GiLjatNONcqN9q65S3VjTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BKqe6AkaNZLgXJ/JXAJhZThHwKyHmOQ4PopVN1GkSukEiO5Yz
	yp+cpKLXor+NV7+R0XyNTpBHwXEQcPMrJp/qh6FS6LJzKsREQcZOkUQtWTnigqWs89k=
X-Gm-Gg: AZFdTZcjoKeMLgpnd9XtTnRiS2pnpMhEbLKLf4LMI1t5vfWBuZDFq2TbSOMU+5qz3nF
	Nouk5cS03lGHPZ/qS391iDtDHQZAgGenFUPgJMwjqeNjQyegpudUk/Zmfnbnm1Bn3Oq8hexv2dI
	wfExpQoMxsz1yxnx99k9cFK822yB0s8uwuVxAW/JRXg2OQb+rIMl7aHIftgcbFZit4/w0qzRWhk
	UNed0ZhgAvYfS/yf9JcaKnsr8rOU8N+7XyubYs+jy1h3C1Ri0d3rK1pWRtMSk6FY7bvIsFdbwqo
	6uT0zLHphMQH2Osq6uceCOUiwmoQs1AZXJclaYrXgtconxGerBoH0w2Dn3f71mz9IAzZ/AUiSOV
	Bmnvo1TWujqJlRY+tu4p6sS5n6M+oYD7rd74fRQNpp4SjVDy47RPs1EayxCH2CR57gGSsS7oCh8
	x0zfr6B9h8BN2XiuHpC6lsYWnMtP/zR/wg7NdEygwEkBYdcQFX9S5noksl+veRrEdGj1qMMkQ+z
	IW/+/TRD/zkOen9y/qRjsmuSAazp0TcBnVcOTZgnRYrL1P9LTV0uSDjDirHblXpQlqkjr9cItcT
	4mNn2MNNbHFEtfDtMx+HSwptdh63tRsAhgCrGYJXLwUV97egRw9I6pd2JJW1ZD838IKa9OJqjqV
	m
X-Received: by 2002:a05:620a:700e:b0:949:735c:90c4 with SMTP id af79cd13be357-949bab1df97mr2669499685a.70.1795554889851;
        Tue, 24 Nov 2026 13:14:49 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0319fcsm1129758785a.4.2026.11.24.13.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:14:49 -0800 (PST)
Message-ID: <728acfd6e085408e7998bc9e7dfbb2d110cd53ed.camel@ndufresne.ca>
Subject: Re: [PATCH v2 08/17] media: rockchip: rga: move power handling to
 device_run
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel
	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, Guangshuo Li
 <lgs201920130244@gmail.com>
Date: Tue, 24 Nov 2026 16:14:48 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-8-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-8-23aa2cb74e61@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-VHje7+kFOoy685T8Rgq0"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-VHje7+kFOoy685T8Rgq0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Move the power handling to the device_run function in preparation for
> enabling multiple cores. This allows to power the only the necessary core=
s
> instead of powering all available cores.
>=20
> As the decision on which core the given job is executed will be done in
> device_run, we can only power to correct core there.
>=20
> To avoid unpowering the core in a streaming state switch to autosuspend.
> This avoids powering down the core when the next frame is scheduled in
> the next 50ms. The timeout maps to a framerate of 20fps, which should be
> pretty uncommon in a normal video stream.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> ---
> v2
> - also set autosuspend flag with pm_runtime_use_autosuspend
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D6)
> ---
>  drivers/media/platform/rockchip/rga/rga-buf.c | 12 ------------
>  drivers/media/platform/rockchip/rga/rga.c     | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index c0ea6003336bf..3f7c3c68e0cb8 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -242,14 +242,6 @@ static int rga_buf_prepare_streaming(struct vb2_queu=
e *q)
>  static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int cou=
nt)
>  {
>  =09struct rga_ctx *ctx =3D vb2_get_drv_priv(q);
> -=09struct rockchip_rga *rga =3D ctx->rga;
> -=09int ret;
> -
> -=09ret =3D pm_runtime_resume_and_get(rga->dev);
> -=09if (ret < 0) {
> -=09=09rga_buf_return_buffers(q, VB2_BUF_STATE_QUEUED);
> -=09=09return ret;
> -=09}
> =20
>  =09if (V4L2_TYPE_IS_OUTPUT(q->type))
>  =09=09ctx->osequence =3D 0;
> @@ -261,11 +253,7 @@ static int rga_buf_start_streaming(struct vb2_queue =
*q, unsigned int count)
> =20
>  static void rga_buf_stop_streaming(struct vb2_queue *q)
>  {
> -=09struct rga_ctx *ctx =3D vb2_get_drv_priv(q);
> -=09struct rockchip_rga *rga =3D ctx->rga;
> -
>  =09rga_buf_return_buffers(q, VB2_BUF_STATE_ERROR);
> -=09pm_runtime_put(rga->dev);
>  }
> =20
>  const struct vb2_ops rga_qops =3D {
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index d7f0712177b70..c24bc8e26b91e 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -37,6 +37,14 @@ static void device_run(void *prv)
>  =09struct rockchip_rga *rga =3D ctx->rga;
>  =09struct vb2_v4l2_buffer *src, *dst;
>  =09unsigned long flags;
> +=09int ret;
> +
> +=09ret =3D pm_runtime_resume_and_get(rga->dev);
> +=09if (ret < 0) {
> +=09=09v4l2_m2m_buf_done_and_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx,
> +=09=09=09=09=09=09 VB2_BUF_STATE_ERROR);
> +=09=09return;
> +=09}
> =20
>  =09spin_lock_irqsave(&rga->ctrl_lock, flags);
>  =09if (ctx->cmdbuf_dirty) {
> @@ -81,6 +89,8 @@ static irqreturn_t rga_isr(int irq, void *prv)
>  =09=09v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
>  =09=09v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
>  =09=09v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);
> +
> +=09=09pm_runtime_put_autosuspend(rga->dev);
>  =09}
> =20
>  =09return IRQ_HANDLED;
> @@ -801,6 +811,9 @@ static int rga_probe(struct platform_device *pdev)
>  =09if (ret)
>  =09=09return ret;
> =20
> +=09pm_runtime_set_autosuspend_delay(rga->dev, 50);
> +=09pm_runtime_use_autosuspend(rga->dev);
> +
>  =09rga->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  =09if (IS_ERR(rga->regs))
>  =09=09return PTR_ERR(rga->regs);

--=-VHje7+kFOoy685T8Rgq0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX+SAAKCRDZQZRRKWBy
9BvLAP9Q5/iAdKDJ6TMCJMFG+qc3MCvexx/cnmIvxTp7c1XLhgEA2wrgdWTeGaKA
sk6wt4xFNb7zeeIPPdyxQHP8JK17XQc=
=r19R
-----END PGP SIGNATURE-----

--=-VHje7+kFOoy685T8Rgq0--
