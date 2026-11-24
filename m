Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515769;
	b=NUW9L5C0A7v/N8rP5O90k05RH3EoGi/QcefBNXgy1vFCox1q/PWFHhrNafJiNPqU7sKY
	 Big3hYgNZjQuKsvKREN56TItTcLBR/ANBwQMGiPxOtpBneqUzChjsVF/jNdNQ7lG0y26D
	 2r+VJQAONm6NdpE2Ccwf4epi16ocMbA+Jpa3/deMBHclLvfRWHZwRUUHOnBaCe+irWij+
	 S79ZrMI4t24skPLvyL9l+yNhDz1421BJaAT7A4pXCuc4CLsfAdkpzK7US9Ez5E0/wJnZ2
	 aUFCe5FhHfIEQDg7G1ayYwYJPnoBKEiHTebEZ59HiwKrW89DqIW5agDVVxnJvB5cjcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
	b=I35IQ7LTatxTH9OFrv151IKLbo24lKXPjRARwmk3uvFD96ktUThguWGHzW4HQyLpDiij
	 Mcn1dmyiEXIwRMJv0q//qyXvkpw0sB88eGGldDa+jWTvXZRyiciplyrwe2a890jeT6z4H
	 xdv16554qh9aeqnTxdXSg/ytV2ncfxW0rlDbz8o0kg5GaGG2bJN2xTflxw1UG6RJr6Mv4
	 xNca2oBixewW1gyYy9yh72tQ8wa09JMTB6hWBvIV7/D5CWDHVcSFF0DOxi5BW39mCm5Fm
	 /ieegRwZViC5PP8aWPa01/a67gwFN5D/bS7ku73N2JtmeKZNCmDHaf8zteXa/jjNuCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Bm9BA46j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A42606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A42606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Bm9BA46j
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4d86f5328so28450727b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:22:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515768; cv=none;
        d=google.com; s=arc-20260327;
        b=bsElgBjzL+YWYltf5nXirXWvRFDWFfmFr33pbjreMwlxWHY96FE1yGhQ9IkK4WJyam
         cLl6QlgFGJ99ABe5sf6EHSK123upYYcszYR52pLyU39r/ABzwxW6CuxIIUQbGbQRqCww
         /bnbjZwk5KSzc0bAqwYBil0g8hcmfmLi1PLjcFvMHoYk91UEqNYedl67qLd+WPv/daD4
         gKT11iU8/ykQnvh3px0GkE2hUi3mcx+H3P+W7dkMQdYekIkS+s4NJ1JABd8QpJi/GsxO
         Fk34WAko+gGkEGg4i9Xb07YOSavf87ORsneklie2SgJQkkPhxynREPxvwd0PSQmsU1Su
         UL/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
        fh=vRRjeS7SNHLII97YZhn6Azv56L7vGkr6XXEK0rGH27k=;
        b=ndyLr2y5P1+fgO5OjsZ1RPEAo6RlPeiUP0TqT2MUr6Oq2vrFxmQTnHQl2IYFZMHcKc
         Pl8A0mVIL7p5mVaVMFIFg7RE7mM2zyBmFZHZi3qYpEO+IB+VulznfAZE9Gji5KEcVf8r
         UmSiqY/ctH/5/0Q1ns/aiTKGWYwDhHUT+V4Kd1lFP8XYSwdoUdrmw05ddCqU3pbxuG3s
         SLQKPOipCtktC5teI5TSxZkIIfB2tQMr6oCbgstNCYUGLjZHZoLVeeS3y6+j1R9hg02p
         mC/yCZ8dyzUKWB48308SfluuzLwe4GXY+BdZmKnWPAVxfacv1RIZXCaSqQpvispiwyU9
         PHwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795515768; x=1796120568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
        b=Bm9BA46jg0az0SQSgSx6vZdjy/b9Gb3NDHMH9kCWaawFTBeRUTP5Q97RgijmT4chfE
         5q/7h1CwDlDX9jRehZ2/Vvd28U6TvZvSdu1ak7T0KwtrQgGPjyHWRGYgfFVROXgzVjOH
         Nolqbt68eY3TDImPYngjsV/+G5qRlGqk8FC0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515768; x=1796120568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
        b=CglD+JHeVy2qP+rAOXI3Qwj85JDB27sMYULIOh86UVW8QSyxITy9ZeSAB8G1FIojRF
         4PGLPa4Mx5b20Xp1vQmZTavP/WapYyx7jpfmOqocoU61wQgQAa7USHsBuEV5Woon7BBQ
         nnPzbOCQDiac79nhg/iC4sbX+hT1Cg9hDgin+QG0muYmYOI2R4NlkSnGCOxzEs1C5DZg
         EORo1XUC645ELWNpIeE9kGmuwuOzsfRx+7f9CagMuTvyIPAGNzl7q8dfu6u43IEWlRFo
         6Kzw16nYfDl0FMuL4jstqRSMGmhCmVDACMrxMssxcTJKE+qKnqicHNld1bVaev4zJoW5
         O3OA==
X-Forwarded-Encrypted: i=1; AL+hErEGzn7EkWsMx9Vv6nBKbflkwhB6W9sI44S7Y1xkvs6Z/Y0G1IomnDlrMlPB1PhP5p3SdNr9Q7q0ylzMZBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8t3hcoMA9aK0Cit3LR8rOck/fz1P+xuC7Pi6kSo/NKQ6Qo+SAE
	FQ11BFlJMV/kXbrVPWPzN4UuHSD/JAJ9xe29RZz6ozrjHDKsuESmoku853vVv3A1aEVwOae2ZMs
	O5p4lhc2eb0YnzmohIHXzM1Mz3TXiPNNNAkoawyMq
X-Gm-Gg: AZFdTZcSz0rB2lJf3iMXZFVcomp571opkUW26ZDxc3JH3iSYtkQQ5QgsOKKdxZyThu9
	VWs8W+c6ObHKQEyHPD03ueOequQ0gBiWKDVF8dvAB1K3zXcyY/EsNFIFjhnmmNXvHapmnZt1u22
	MWvQ39HajMws3dQgE3r08lMVvfz0XRCWVbLuZ3M9h+RROrTMl/DlFf9JRtCdsjKVqOJ02JDhaiW
	v6n6gB+wuqc5haJh8ErZcsu88LyWwtFxBolNZWQnEmwDadEc4++usLLGS3VwKDd6U4XVOs7/Y/B
	xnh0BiSpftdL3qPeKHmSvx4aBWBrEDO5q0PeukY4FcwtEBs3UhJAtcoiCvgc2RX3Fc4zk+dMPeN
	fgdZLxHR/W3F6ntCBiExo8po+JawrOeAam0NGklewKp5UUKbh4Q0CQ7Uk4+YmS6gLV+Y=
X-Received: by 2002:a05:690c:6e8c:b0:8a8:7e5a:dc2f with SMTP id
 00721157ae682-8b5204440fdmr67264947b3.12.1795515768163; Tue, 24 Nov 2026
 02:22:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124074041.115251-1-wenst@chromium.org> <20261124074041.115251-3-wenst@chromium.org>
 <19cd5949-05dc-4107-bd2b-d8ad1e2332eb@suse.de>
In-Reply-To: <19cd5949-05dc-4107-bd2b-d8ad1e2332eb@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Nov 2026 18:22:37 +0800
X-Gm-Features: Aa3M54pNfcesZWo4EiEVJfs9QKzf9OEio3h9s-Qk4g3wBzB4RP2yK5vRHxNLzEQ
Message-ID: <CAGXv+5HSV7MJ96qTcOp+JaKWtmmYYWAmDROrT18pZ9PztNCJ-g@mail.gmail.com>
Subject: Re: [PATCH RFT v3 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Liu Ying <victor.liu@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 3:57=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 24.11.26 um 08:39 schrieb Chen-Yu Tsai:
> > drm_fb_dma_get_gem_addr() returns the DMA address to the "unclipped"
> > framebuffer. However some display drivers want the "clipped" framebuffe=
r
> > instead, as they are also using the clipped coordinates to program the
> > hardware.
> >
> > Some of these drivers are open-coding drm_fb_dma_get_gem_addr() with
> > the source coordinates replaced, while others have been incorrectly
> > converted to using drm_fb_dma_get_gem_addr(), which would end up
> > causing incorrect parts of the framebuffer to be displayed if it were
> > somehow clipped.
> >
> > Add drm_fb_dma_get_gem_clipped_addr(), a "clipped" version of
> > drm_fb_dma_get_gem_addr() for these drivers to use.
> >
> > Cc: <stable@vger.kernel.org> # dependency for next patch
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Use new drm_framebuffer_get_block_offset() helper
> > ---
> >   drivers/gpu/drm/drm_fb_dma_helper.c | 37 +++++++++++++++++++++++++---=
-
> >   include/drm/drm_fb_dma_helper.h     |  4 ++++
> >   2 files changed, 37 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_=
fb_dma_helper.c
> > index ab0f37d8a5ff..0aaf4926db4e 100644
> > --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> > @@ -60,15 +60,16 @@ struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(s=
truct drm_framebuffer *fb,
> >   EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
> >
> >   /**
> > - * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for framebuffer, =
for pixel
> > - * formats where values are grouped in blocks this will get you the be=
ginning of
> > - * the block
> > + * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for unclipped fra=
mebuffer,
> > + * for pixel formats where values are grouped in blocks this will get =
you the
> > + * beginning of the block
> >    * @fb: The framebuffer
> >    * @state: Which state of drm plane
> >    * @plane: Which plane
> > - * Return the DMA GEM address for given framebuffer.
> >    *
> >    * This function will usually be called from the PLANE callback funct=
ions.
> > + *
> > + * Return: GEM DMA address for given framebuffer, unclipped.
> >    */
> >   dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
> >                                  struct drm_plane_state *state,
> > @@ -86,6 +87,34 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_frameb=
uffer *fb,
> >   }
> >   EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
> >
> > +/**
> > + * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for clipp=
ed
> > + * framebuffer, for pixel formats where values are grouped in blocks t=
his
> > + * will get you the beginning of the block
> > + * @fb: The framebuffer
> > + * @state: Which state of drm plane
> > + * @plane: Which plane
> > + *
> > + * This function will usually be called from the PLANE callback functi=
ons.
>
> You should mention what clipping means in this context. It's not obvious
> what it's clipping against. Or maybe point to other docs that explain it.

What about:

/**
 * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for the start
 * of the visible (CRTC-clipped) part of the framebuffer
 * @fb: The framebuffer
 * @state: Which state of drm plane
 * @plane: Which plane
 *
 * A plane may be positioned partially off-screen, in which case it gets
 * clipped to the visible CRTC area by drm_atomic_helper_check_plane_state(=
)
 * (populating the clipped coordinates in &drm_plane_state.src and
 * &drm_plane_state.dst). For example, if a plane extends past the left or
 * top edge of the screen, only its right and/or bottom portion is visible.
 * Drivers whose hardware cannot clip by itself (i.e. accept negative
 * destination coordinates) should use this helper instead of
 * drm_fb_dma_get_gem_addr() so scanout starts from the visible portion of
 * the framebuffer.
 *
 * For pixel formats where values are grouped in blocks, this returns the
 * beginning of the block.
 *
 * This function will usually be called from the PLANE callback functions.
 *
 * Return: GEM DMA address for the visible part of the framebuffer.
 */

> > + *
> > + * Return: GEM DMA address for given framebuffer, clipped.
> > + */
> > +dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
> > +                                        struct drm_plane_state *state,
> > +                                        unsigned int plane)
> > +{
> > +     struct drm_gem_dma_object *obj;
> > +
> > +     obj =3D drm_fb_dma_get_gem_obj(fb, plane);
> > +     if (!obj)
> > +             return 0;
> > +
> > +     return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane=
,
> > +                                                             state->sr=
c.x1 >> 16,
> > +                                                             state->sr=
c.y1 >> 16);
>
> I had to look several times to spot the difference to the regular

I suppose I should add a comment to make the difference more visible:

    /* Use clipped source coordinates state->src.[xy]1 instead ->src_[xy] *=
/

> helper. In any case
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

If the changes above are acceptable to you I'll send out a new version
with your tag kept.


Thanks
ChenYu
