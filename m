Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758349;
	b=BCuxEPFm72LLQ1vjUrnBsXmuFouLGOoSdjlDSwdYWY12Xm4E6FWUffLfk8eJhincsIR2
	 WXYpyrtb6u9M/LPfZeKcS7GK9USWmu6uz6DvnvICK/oCiB9SBheJE5R/3zgoIFZYMZ405
	 MXUVcpM52+6uLZw2QQDYR/TYwaDC6X+upZE6Zn8g1L4t4NrebKAlWyby5mkRz3jcU5dBv
	 LaCALx1oRHDxebbDrfI4ePzE7x/RbG4+HCmqsE/JIxU/gr04eQDDc8aHQbx4nsXr1ZMIt
	 hnzI8ROqribROIcIEK6c0rCxwZhS6OmJYcA6WvEos8OEkgsmFwC/jVC6T0VspcASPYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OJyrNxxqSswpG73uJSwhGXWXiwyA3wVRnNN/kTlq4Co=;
	b=QA7CH3ZWfV/c3ddFoUEvw8meRteoiBIEfdw5m6sLN1vSkKPL715AtYaoq8hLEIHCEDZ/
	 dXXN/6jPf1GSZoSQ5HoV0FsEylEABMVmuxir0kaGWW4JzrPF/FDvdUKeARdmEhQwJCiVz
	 FOzv2XbcUpVwl8iBZf/G0R0/u41EdOBECpc3Ut0eTn7Mo3g35ZdfBI1+UsW1obaGYxLuI
	 QjCsa0ejWDn5iO9jSRdCECcMjfhWp+vXcl228+FVLJ5qfee3R0pRhUQLIIrtNN0+w8pCR
	 cA2/g+88xtEREfPzpogKfmMz4KbTiy1aOkyHGXt3E/oXAyL6RiOr83FleXknJ71DLfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mhe+kyK0;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D73D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D73D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mhe+kyK0
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso3149010a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795758348; x=1796363148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJyrNxxqSswpG73uJSwhGXWXiwyA3wVRnNN/kTlq4Co=;
        b=mhe+kyK0VVGVYeJouQ09m8H5WI3njxmJANGLkLkHkwybehLVRDQvLBiqm8eTo5D7i0
         PTMo1vbOJfvvklt3uSmZ/0w8nNOzuhkpg5qSog4jnLH0q+foAqHpJYdNBLm7fhhqeVCU
         BqY6Vg1licMPi+uR3cXoFxQ7XzZeDl19PuQcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758348; x=1796363148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJyrNxxqSswpG73uJSwhGXWXiwyA3wVRnNN/kTlq4Co=;
        b=UWcx2Pmm4cMt89DFYTPz8et4j5f8Z4xHRqzlteBYCZsnIMODpHoU1TcjRHHwItz0k0
         u3QgAg/nCJre847eW+pt4oihsbjLPCS/GXrCEAMoXleFxb1ZkaUN36pL79HE8DWxC3Q/
         kNf8tRCTi0RVZt7K1fDWmp2+DgQGvGlhEwp0nW4jba03MHl9MC+iwm6sGfRPj2af7puI
         hlKJPyFwdeGT6rWxFYc9GFMc5Z8Qkej0JSWJf6oSn3GtrOGTPOTEdzAb0mkLFgxKHBjo
         NpPlK/sXAPdqjvcfNvv79hQ6zOyKArv8VgVLWxofqS5TRgTq382Y1IAI3xhEubjrMMEV
         zPgQ==
X-Forwarded-Encrypted: i=1; AL+hErGw8EX95U55F9lvI2dCpwf98Hl5Lw9xJn3BpDqtjtBgvOOUG1f7qoumQBWShbwqeBQCuWtABmskEsAiUdU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j24bpnFekYuVpWQ0pAGM4Ba08Wc4dRDpECESPTDMdjfXyU01W
	g8l3XiO/fH0IphuaFl+n1NATp47B4d74oqxclyUrcMhiiUqaUhUB2lYzddBNckqm6ZdIfk2Z1sX
	I5nqXMw==
X-Gm-Gg: AZFdTZfwELvA+k1Wy2AVHMvGge29OlN48u/iqM2yU7UG9Yu0GKZZ4S6VVdEILfzuShE
	cZu/i8LQsdFzO9Vr229Sri8cQJFI/0m1H8GFqs8zTKWKsUFQbWW8DyvVIidKoZE18SBelUn8fLy
	cvI6KAqZogFe7MeUlNuszxCn85CYgt8UU4U8uIz1N0QjjigX5nBjOeEzYns3Mgo4Q1ulYOlt9yF
	wHahYoh44mZ/FcG+px67ejqwW0v9K2PG2yEHeK9G6CioVKEjiSTCZFoHrIKnVESMVTNUnvziQI8
	QkVUeQIfIspqcy1vDm9jisaiaelr6lqO0GsmAPvJKmNFMdgDxCMetqx8KOwJfysbh20xDNCBdEH
	ZcHh2aKj6VLABqvPcAcyrueeiu7oX0YDMELPCcEkOxq5Dp8fLNMCtCaMDV6vk2JXfMMmvM8dqDw
	VgbrYmaw4G3BkhNolJFVO9pBg1uo5URgyJCYgFdTPQNZv7g4QDXJEHLq7ARs4/nGarOueQOza8j
	pg752+R8MaNW9zSbIcb7Jqxu2OaeD1/1K/VGXuvvxM741fgfo+FNTN4E9PmSlFWFnoWQdauv2ke
	gFyT2pJtDJdYGdr0w3VJrghDYEdGjvXs7gwDA8ijFHf1GTXXOy4/nofyKj+MwZs=
X-Received: by 2002:a17:90b:3f0f:b0:3b3:ba43:54bf with SMTP id 98e67ed59e1d1-3b41c925a7amr28331559a91.27.1795758347766;
        Thu, 26 Nov 2026 21:45:47 -0800 (PST)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com. [74.125.82.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b53479b149sm2196828a91.6.2026.11.26.21.45.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:45:47 -0800 (PST)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b546061d58so17890879c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:45:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH8FHKW448FybG6JnhxMlJUOCBKkBHL9k2YjrpoGNGCqJ4yWAV9wSn3ifvJM6RIiyCmaTsmObs9Ys26nsE=@vger.kernel.org
X-Received: by 2002:a05:693c:87d2:10b0:386:b5a8:1c5b with SMTP id
 5a478bee46e88-386b5a82496mr13605222eec.18.1795758345905; Thu, 26 Nov 2026
 21:45:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023075642.3671805-1-fshao@chromium.org> <20261023075642.3671805-2-fshao@chromium.org>
 <21a907f61fe983203120d44dbc4fa84269feee69.camel@ndufresne.ca>
In-Reply-To: <21a907f61fe983203120d44dbc4fa84269feee69.camel@ndufresne.ca>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 13:45:07 +0800
X-Gmail-Original-Message-ID: <CAC=S1niZJjX92misxLioPnpoFJNfJEjWuaHsH_iiQ7TGs2afDQ@mail.gmail.com>
X-Gm-Features: Aa3M54qNDjQhU6gA65neybgLv3Xn13aUHMcLYLRb3RcSnItlV06t95c1GfEEZAc
Message-ID: <CAC=S1niZJjX92misxLioPnpoFJNfJEjWuaHsH_iiQ7TGs2afDQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: mediatek: vcodec: Return source buffer on
 NULL va in stateful decoder
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 3:17=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Hi Fei,
>
> sorry for the delay, so many patches...

No problem at all. Appreciate your time and review!

>
> Le vendredi 23 octobre 2026 =C3=A0 15:55 +0800, Fei Shao a =C3=A9crit :
> > mtk_vdec_worker() peeks the source buffer with v4l2_m2m_next_src_buf().
> > If vb2_plane_vaddr() returns NULL because the buffer has no kernel
> > mapping, the worker finishes the m2m job with the buffer still at the
> > head of the ready list. v4l2_m2m_job_finish() then schedules the same
> > job again, which fails the same way, so the decoder never makes
> > progress.
> >
> > Remove the buffer from the ready list so that the job is not scheduled
> > again, and return it with VB2_BUF_STATE_ERROR so that userspace gets it
> > back. Print the error before that, as the buffer must not be touched
> > once it is returned.
> >
> > Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video=
 Decoder Driver")
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> >
> > ---
> >
> > (no changes since v1)
> >
> >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c         | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_=
dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_=
dec_stateful.c
> > index aa9bdee7a96c..a4cbb7c76998 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta=
teful.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta=
teful.c
> > @@ -348,9 +348,11 @@ static void mtk_vdec_worker(struct work_struct *wo=
rk)
> >       buf.dma_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf,=
 0);
> >       buf.size =3D (size_t)src_buf->vb2_buf.planes[0].bytesused;
> >       if (!buf.va) {
> > -             v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> >               mtk_v4l2_vdec_err(ctx, "[%d] id=3D%d src_addr is NULL!!",=
 ctx->id,
> >                                 src_buf->vb2_buf.index);
> > +             v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> > +             v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> > +             v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
>
> I did some research as all this felt very late and defensive. My conclusi=
on is
> that you should validate this in vb2ops_vdec_buf_prepare() (mtk_vcodec_de=
c.c).
> This will let you remove this defensive check. Buffers that failed to map=
 (or
> unmappable/protected memory?) will simply not endup in the queue. It will=
 also
> give an immediate feedback to userspace.

Agreed. Early rejection, fewer manual checks and less code overall is
much better.
I sent v3 as a single patch:
https://lore.kernel.org/all/20261127-vcodec-null-va-v3-1-e24521086062@chrom=
ium.org/

Thanks,
Fei


>
> Nicolas
>
> >               return;
> >       }
> >       mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=3D%p DMA=3D%pad Size=
=3D%zx vb=3D%p",
