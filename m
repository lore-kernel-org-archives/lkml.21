Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079939;
	b=WCtcAxb/sSJ62l7p3/JuTftYAktTGmWWiCWOvQ9SjU/w0SEZArE29DLu32NFukB4ZiBf
	 JLSX8ruZIvoSUrRamMQ/SOzoUIcFDYkrJj0mehEy6ll5MCqjjakR850T9RCWAxxgDVYr9
	 EwyaA1qcWnxpEmN+lzBTeDRigwLv1Dbn1tno0xgs7Oj98XaLnPnrpGQSmSZ1fP+cyEiZj
	 e0FzwwvetXKd2Fiy1C6BKReFCvMoNc/lFBj0AYhbClxEG8o5cvCeqUEKAAWecELxBfIvK
	 /1kFSputEhY85OeO5oAh6uJUmbXQ81QkTnSkmJw1iGlF3gbJPL3sQAV9lnD/e/vdU1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079939;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9vXtiwxZ9b/ia2h9vVrH0bvt+6pBsP1BUbpXNBoP+Xw=;
	b=i6RcTI1pO+pxJguaFqBFKiv4199PMClQWdiI/F1q785LK5M33KkvBuXacTSxXD00TxRI
	 1lFjv5ORDyQUxpQagIme/CMH4CtXKjPzGcZB7lhlrr8m5hOX7agQjg65w4ZWNq5nevPDG
	 2YVUliQJ8jWRAF+uIPbMZ/sbvfVDeoq6/DY687cBiNC+E5PY1Ie0H2rA/YwUSoxHoz/oh
	 yjYMfZG8OBNNCJNClhhaPWDb3QJt6xCqTz1lYxITFyoCwF3sTBJ+Ww9+2caBxsrZ4KQ8K
	 Bszrt5p8xrlDc0Psbgx1hNj+JOON6DBWg9Tj0PYSGoQEbTtITj/4rxFFdkFLiI1uwFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=W28zOZJV;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0057C606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0057C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=W28zOZJV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=9vXtiwxZ9b/ia2h9vVrH0bvt+6pBsP1BUbpXNBoP+Xw=; t=1795079938; x=1796289538; 
	b=W28zOZJV1VQNaKZVc5qRWLbtmQ51fJa9TXMHJTqx4jEkP9VCGPXd+ICEASU60ZMedoqlPP0gt11
	6y5wXKybqpaEKWp4by98sJ87GHjTRS89AX+e3sjjEiOJ/gBCPkiAZ+9Bl/j/+Uu9pn5vj644rk/FR
	D6RkM4+M4UV5iKGArUETFKxEr5g7vyW2jVO0G8Q7fhdRfI7muHwA22le1LEgnWHwr0FLpNVNPIqj3
	NMpy9+9FSoLguGHq/2UDZBwZ3y7mSxYRrZuLiy+REsYzEk8zkbiHDIY3CBJyF8xo7y6FXeTvZxp5i
	KnJDCH6hyNdp24pAuBInyot85EgYYXzEIo6w==;
Date: Thu, 19 Nov 2026 10:17:34 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Albert Esteve <aesteve@redhat.com>
Cc: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, luca.ceresoli@bootlin.com, louis.chauvet@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/omap: dss: simplify omapdss_device_init_output
Message-ID: <20261119101734.2bb8bae9@kemnade.info>
In-Reply-To: <CADSE00+-9Br_eVWRc=+i+OnthqZYfaMZ57Gxp5fXmqFXrMqf3A@mail.gmail.com>
References: <20261117184019.430513-1-andreas@kemnade.info>
	<CADSE00+-9Br_eVWRc=+i+OnthqZYfaMZ57Gxp5fXmqFXrMqf3A@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Nov 2026 09:32:11 +0100
Albert Esteve <aesteve@redhat.com> wrote:

> On Tue, Nov 17, 2026 at 7:40=E2=80=AFPM Andreas Kemnade <andreas@kemnade.=
info> wrote:
> >
> > During reviewing of a regression fix is that function, questionable
> > possibly unbalanced drm_bridge_put/get came to light. Sashiko
> > review pointed out that of_drm_get_bridge_by_endpoint() does not return
> > NULL, so the questionable code is simply unreachable and therefore does
> > at least not harm. Remove the dead code.
> >
> > Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  drivers/gpu/drm/omapdrm/dss/output.c | 10 ----------
> >  1 file changed, 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/oma=
pdrm/dss/output.c
> > index b5cef5093a883..cbb9b2f1a2133 100644
> > --- a/drivers/gpu/drm/omapdrm/dss/output.c
> > +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> > @@ -20,7 +20,6 @@ int omapdss_device_init_output(struct omap_dss_device=
 *out,
> >                                struct drm_bridge *local_bridge)
> >  {
> >         struct drm_bridge *bridge;
> > -       int ret;
> >
> >         bridge =3D of_drm_get_bridge_by_endpoint(out->dev->of_node, out=
->of_port, 0);
> >         if (IS_ERR(bridge)) {
> > @@ -34,20 +33,11 @@ int omapdss_device_init_output(struct omap_dss_devi=
ce *out,
> >         out->bridge =3D bridge;
> >
> >         if (local_bridge) {
> > -               if (!out->bridge) {
> > -                       ret =3D -EPROBE_DEFER;
> > -                       goto error;
> > -               }
> > -
> >                 out->next_bridge =3D out->bridge;
> >                 out->bridge =3D drm_bridge_get(local_bridge);
> >         }
> >
> >         return 0;
> > -
> > -error:
> > -       omapdss_device_cleanup_output(out);
> > -       return ret;
> >  } =20
>=20
> This looks correct, it is dead code. But removing it makes the return
> value meaningless (every path returns 0), so it may make sense to make
> omapdss_device_init_output() void?
>=20
No, not every patch returns 0.

Regards,
Andreas
