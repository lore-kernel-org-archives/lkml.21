Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795240881;
	b=cGkVdE9IE/FDF+eY3H6bSFtaZfHz0LihK+GirXM2/PSaEEHQW5KR8ZN3fYdmG7+e/zKq
	 IcvaTFp9W1dnW7AeWhWbE+eGKbfxzwTz7ZCf8QVXTWLAMzXw4tQnRb21el+Sf4JIV5RM7
	 jL5H2TTMTYr0XtkfHlYc5iU4mUlW5RiP9CZ89t0u0DMGL3zJcprMZbhhoSv2cRb7dXY63
	 6RxGrgLTN0v459aZltrRfKNHL/JyO2IwKXTJg3HcsyRLlHGrZ5jqSpwefvrZZTFs15AfF
	 IdUGIgnOC4AC6J/mdZNr3x2rq9JMOvdfbG600rolStDUk21KhxZAr0EL3OOAOlenwLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795240881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=224Uc4tdGl14OHpe8I6uXHMDyRc5b/bC6BZG730xv28=;
	b=EsxEBjFvKXFB3wZmH5QioPAHAwHRHyFM8wtDmViIc5KDod2hrK1uwECx+R7N6cpa3ePu
	 doqDk8E+YIAnHL/L2mvN0m1CUXjj1Hzb/zYkEq4MxD/DvWqLXKSvuzsBt6txEJn01yOia
	 cnydlxOhpx4lRnmxFvj8E+FPoFt5x3LrdQMA7dXZtMd2y9nW+XGXx9wke+2l8jCxqZEBL
	 3xh8UYLokexvbO9P1idnT0KyzMBcnHNzjiE65eAShPgJDwfJI5gl4RKAlLkn7FmtHlJlr
	 gv/JGbtBnUt+ZcfqXzMePaBCSQQSu7kE6A23Jhf2jFBCt97bRXNPe982SQ1N4MuoSmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tEOIXF8z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F17606A696
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F17606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tEOIXF8z
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3869b68caecso725924eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:01:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795240880; cv=none;
        d=google.com; s=arc-20260327;
        b=JvBpKtxpDeaeCLHlrB9dU8OED4T3+qIReKCwuPrXKCzKozfPIBrmn02CXgNzAaeCaj
         OBHu1JU1eh45OzsLYVcOpp39+/PdunvuZL/xykQZk1Xx/aVfRsLY7V4yeVIDT3D9rjrg
         2owGmtcLE0x6WTdA/a1lwz9Z2ximnACTPTlSRqQ06V+GA4TGupT/ty+J6rTEoYIimvNi
         wbMYb33ZD+Ix9GD38mbL9BTqpAk9xDlvqEaGsyLHRRLMFdf6LZLg+ZaV6j9MOLr7B05p
         i4G+Yq6hnlsrXbNVhoGDSWKkV8K3u/UHbY6bYLmRFogR7CFfeSXaN8vhZW5wzIN3uxo/
         Vmbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=224Uc4tdGl14OHpe8I6uXHMDyRc5b/bC6BZG730xv28=;
        fh=mpsY2ivvjEf1YaTXS6OZ3cF+p8xk60IlynsnMr2HukA=;
        b=EIfwdnMzvAjhUNvH1erW7AC+IgDHhqrvkebT+C84UIBwIWTBrE8NGtGn7Eo6ssPmbR
         Epek/q2mkxZ/QBg1ieZ4YuNgqZwedTDIdGQRZRz38GqdHyoloF9OUT/kDt+kcSfns1Wg
         RpGYZ5TvvIhH1nXk544tCsHMgyEO87MklHDY2DaCPZk9j30QCUWvbDOk+Fza5nB6EwAF
         BhRTqgDeojn4SLBS8X98Rn6C2kxeda3bBmJgO0u5yfDHC7zNyAycSVE5GzCr60SwbHSp
         ZWVGgeQWZezHH4E6KscYkbjoRcDMeI7lFnF6uywkD+04bdN8a4fBAinQ++SlWRSE9vnK
         fang==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795240880; x=1795845680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=224Uc4tdGl14OHpe8I6uXHMDyRc5b/bC6BZG730xv28=;
        b=tEOIXF8zOT6TI59P3S2WZoDI/6toupXQV8ZU4vDjAcNY4bFymszFVbIMTLD7pFZFPy
         4+iO1icqTU9Q8PnntX9zdO3c+m5DoK4TLr+qTd7EB3Nfd5FcXVq36ekjRu0TWTJCBV0X
         en0v8AvWU2lkMgfW6x0Bfd82ThtEd6WdbKsu2sXoolWpFr7+1ICTK05JIuHCtO0HDjkt
         HzMMECkfCO9k0M56Xp+pVlFGD5ONQIHmo2VtVbrQuAZsQcGexQuITTaEgsQJM4BU8Cg0
         4CCI/gpZ72EwLqpfFgr7C7bMTZY2zi+Ycsc9CBbJxEe0lAcFRB93+lAbLmrFnotqDGY6
         AaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795240880; x=1795845680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=224Uc4tdGl14OHpe8I6uXHMDyRc5b/bC6BZG730xv28=;
        b=UYijGpIic0awfKhA1K5xy4Uyo/qkguzIlepRfHnPNgIilzUBPFydEfh75UDQ+iCKge
         FQGvjHY13w4NnOTfiEuuBHQFjcTNMJAG6pjVi2VG0tk37MvLl67vFwNbo60mUVzVwUo4
         lfjEghjsc3n98dmFV6/F41orKdtfXnJQYWhi9g4lnLjYWCXAAV54cMDOQhcq38fEzmiR
         e26H/fzrIdP7HDM2HS3zuE6hqWXj51tEr87eFG9XqfE5uDF5pyjxVqjg31tU+3XrN8hz
         uzH78iJJpOqdp8K+qP/mS4AHX461ozXso9Q6q8GpmaRQ71955ONSzFYY/WOiSsebcHx5
         HLmw==
X-Forwarded-Encrypted: i=1; AL+hErEk9xBihYIwU/0lyJpacK+EOI7OpnJonjvV3ORr6X2qaPX29dt6TVKsyBc6s1WVshSV740vcFKo0B3L+6g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tMjccrjw6bN9LER3++Jijqs+B63VXyvd08SdhqIuAUrPYWOZ4
	MdYquWcrRzKhcCOI66xz1il+hkc0pfYzKif9AXwFIRlFu8eArfgkO4cqCBRo6QSIcdOUGI1xq+/
	gnmpAaAhEWuSbLdSSbxRNHKQkF5aF1k1ZuAtZ
X-Gm-Gg: AZFdTZfpOf+lYnCzuIBGwDPqrlJ33HTpGpHB0sMb842FdvOjnzwiJPEH2z1dPDOUYjt
	YTLGFo9KDtdfwhrCCz105qTcsZqv3wtj43iSL3PFhv2qnLZo7Zqwo4FyaojN4ssJ0OEeHrHbSlN
	uzoCiYL7rONXq6H1D/UEAmq9w1/F/WmE+alPaVaabeW8zbY1xL7qviUnul4gM3KFnTnxG8A+ffU
	bfJRkGXztYH/SrYrVCOGhKl/aDoe1SxY37eN4LXMsPnnORCjiFzw93+dCGmr5u0WWMHLEhpoQxg
	bW7goRGgibIEekpOpd39rx8wmni0CkPmKegd+g5SUw2cFQKOcvPK6MBPSdBffWTcxW8BJ5NXBdz
	pkev2FUlig/FRTiWh+49JhF2Bk5S9FkvhDE7ihFgKKnl0G2Zz9PtsoRCza7U2ZYHCjOAilB2pwZ
	8kUba+AqCrsLvpWMNjk9ztKHVyeTHaTA==
X-Received: by 2002:a05:7301:1884:b0:374:ba43:ae2e with SMTP id
 5a478bee46e88-3856f65eccamr4973269eec.14.1795240880388; Fri, 20 Nov 2026
 22:01:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006153619.304520-1-clamor95@gmail.com> <20261006153619.304520-2-clamor95@gmail.com>
 <20261120213147.GA2510168@killaraus.ideasonboard.com>
In-Reply-To: <20261120213147.GA2510168@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 21 Nov 2026 08:01:09 +0200
X-Gm-Features: Aa3M54qqRu5YpD_M-B645oU2wUp9Zhi2TFYXGvcBEXy6Ngu-pXKdX4X0B0Y-q1c
Message-ID: <CAPVz0n3-+m6ke=RmjWtTtDChBi6n695ndYsyQ7XN4WwNQtQUtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] media: i2c: mt9m114: Add get_fwnode_pad operation
 for IFP
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 23:3=
1 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 06, 2026 at 06:36:19PM +0300, Svyatoslav Ryhel wrote:
> > Currently, the driver's binding exposes only one endpoint, which maps t=
o
> > the IFP subdevice's SOURCE pad. This configuration causes failures for
> > many devices using this camera because both the DT binding and the
> > one-to-one pad mapping logic map the endpoint to the wrong pad. Fix thi=
s
> > by implementing the get_fwnode_pad operation for the IFP, which correct=
ly
> > matches the endpoint to the corresponding IFP pad.
>
> The discussion in the review of v1 died out after my last reply. Let's
> continue it there.
>
> https://lore.kernel.org/linux-media/20260721103845.GJ50424@killaraus.idea=
sonboard.com/
>

Yes, sure. Mt9m114 has only one fw endpoint which co-responds to pad 0
of IFP, pad 0 of IFP is sink. Implementing get_fwnode_pad() allows to
map endpoint to source pad (pad 1), the sink pad is linked to PA
internally.

> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/i2c/mt9m114.c | 39 +++++++++++++++++++++++++++----------
> >  1 file changed, 29 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > index c6c950d5c8f3d..583cf47aa652e 100644
> > --- a/drivers/media/i2c/mt9m114.c
> > +++ b/drivers/media/i2c/mt9m114.c
> > @@ -9,6 +9,7 @@
> >   * itself based on work from Andrew Chew <achew@nvidia.com>.
> >   */
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/errno.h>
> > @@ -1019,14 +1020,6 @@ static int mt9m114_stop_streaming(struct mt9m114=
 *sensor)
> >       return ret;
> >  }
> >
> > -/* -------------------------------------------------------------------=
----------
> > - * Common Subdev Operations
> > - */
> > -
> > -static const struct media_entity_operations mt9m114_entity_ops =3D {
> > -     .link_validate =3D v4l2_subdev_link_validate,
> > -};
> > -
> >  /* -------------------------------------------------------------------=
----------
> >   * Pixel Array Control Operations
> >   */
> > @@ -1383,6 +1376,10 @@ static const struct v4l2_subdev_internal_ops mt9=
m114_pa_internal_ops =3D {
> >       .init_state =3D mt9m114_pa_init_state,
> >  };
> >
> > +static const struct media_entity_operations mt9m114_pa_entity_ops =3D =
{
> > +     .link_validate =3D v4l2_subdev_link_validate,
> > +};
> > +
> >  static int mt9m114_pa_init(struct mt9m114 *sensor)
> >  {
> >       struct v4l2_ctrl_handler *hdl =3D &sensor->pa.hdl;
> > @@ -1405,7 +1402,7 @@ static int mt9m114_pa_init(struct mt9m114 *sensor=
)
> >
> >       /* Initialize the media entity. */
> >       sd->entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > -     sd->entity.ops =3D &mt9m114_entity_ops;
> > +     sd->entity.ops =3D &mt9m114_pa_entity_ops;
> >       pads[0].flags =3D MEDIA_PAD_FL_SOURCE;
> >       ret =3D media_entity_pads_init(&sd->entity, 1, pads);
> >       if (ret < 0)
> > @@ -2097,6 +2094,23 @@ static int mt9m114_ifp_registered(struct v4l2_su=
bdev *sd)
> >       return 0;
> >  }
> >
> > +/*
> > + * The IFP has only one fwnode endpoint, which corresponds to the pad
> > + * linked to the PA (PA SINK), while it should be the SOURCE for the
> > + * next media device in the pipe.
> > + */
> > +static int mt9m114_ifp_get_fwnode_pad(struct media_entity *entity,
> > +                                   struct fwnode_endpoint *endpoint)
> > +{
> > +     struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(entity);
> > +     struct mt9m114 *sensor =3D ifp_to_mt9m114(sd);
> > +     struct fwnode_handle *fwnode =3D dev_fwnode(&sensor->client->dev)=
;
> > +     struct fwnode_handle *ifp_ep __free(fwnode_handle) =3D
> > +             fwnode_graph_get_next_endpoint(fwnode, NULL);
> > +
> > +     return endpoint->local_fwnode =3D=3D ifp_ep ? 1 : -ENXIO;
> > +}
> > +
> >  static const struct v4l2_subdev_video_ops mt9m114_ifp_video_ops =3D {
> >       .s_stream =3D mt9m114_ifp_s_stream,
> >  };
> > @@ -2124,6 +2138,11 @@ static const struct v4l2_subdev_internal_ops mt9=
m114_ifp_internal_ops =3D {
> >       .unregistered =3D mt9m114_ifp_unregistered,
> >  };
> >
> > +static const struct media_entity_operations mt9m114_ifp_entity_ops =3D=
 {
> > +     .link_validate =3D v4l2_subdev_link_validate,
> > +     .get_fwnode_pad =3D mt9m114_ifp_get_fwnode_pad,
> > +};
> > +
> >  static int mt9m114_ifp_init(struct mt9m114 *sensor)
> >  {
> >       struct v4l2_subdev *sd =3D &sensor->ifp.sd;
> > @@ -2141,7 +2160,7 @@ static int mt9m114_ifp_init(struct mt9m114 *senso=
r)
> >
> >       /* Initialize the media entity. */
> >       sd->entity.function =3D MEDIA_ENT_F_PROC_VIDEO_ISP;
> > -     sd->entity.ops =3D &mt9m114_entity_ops;
> > +     sd->entity.ops =3D &mt9m114_ifp_entity_ops;
> >       pads[0].flags =3D MEDIA_PAD_FL_SINK;
> >       pads[1].flags =3D MEDIA_PAD_FL_SOURCE;
> >       ret =3D media_entity_pads_init(&sd->entity, 2, pads);
> > --
> > 2.53.0
> >
>
> --
> Regards,
>
> Laurent Pinchart
