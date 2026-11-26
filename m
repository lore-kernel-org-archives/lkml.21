Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679555;
	b=SJTPUY1cePUkgNYiY9n5L3pC/T+u8qtWU+g1fJ48OFzp0ABOCxZohAKJ5cHa/5ABYw8f
	 TO+2mdB1tlcu/Qs6OChbsW/MJpJTYHDqsFrZMJ3RzGdaTxlpKsHoNCAtavlg/slSwk7uR
	 lRtFhRZ6P4jv2AY1FHZhumbXUG3yA81jF84ODlNjhn+Bbw1ce2C2JQllRgQ++mLiGCCoy
	 HPdZfhMIP7AufhELI6sSIx1p+H0GuZXxGcxzhZTXJPn851KSG6ihuknGANwQCF9LA4EM2
	 9MtWa/koZ/kkz0v5j87ccqbDV41t3vIR/wfToJmG2SJB5a3Br4jBchZ/rWGLnDlSLtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2BAeP825lkaxoabnMfIBpo2jQjykn0ii0H1E+c/o1R8=;
	b=MHFVfo6ZzEfLPA8TythfP0jXwpSUnykQkHpl+p40X7pWnVQ17lm2yU5XInJa/rR2fuc5
	 altP9rH8Ef44z0Ozkeh7NWGsK6a3BhtAlLX0MEsqg2TxkCbqiiDKC8HJJoM2wPGs61Snn
	 a0ddj/f1NJPRV/INnhJHFNC8U5iTXuFxQbuA0avh7LX07b28ztsDpdoMFCoY1mA+/v2oA
	 TpFhsHN7vIfU2Cya3/8QF1On90SISGHXY9m33qKO9CN/xpShRwYDfr0U9Dxy9AckVubbv
	 8ckPAdCpf1DBWsqvF7IDwBRE1Qal6aVsj6DqnVKw7BPdWlmV6yp3ztvwkBXM4GA8KDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k5Qoffxa;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEF4606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BEF4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k5Qoffxa
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0481b35c9so39567505ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795679554; x=1796284354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2BAeP825lkaxoabnMfIBpo2jQjykn0ii0H1E+c/o1R8=;
        b=k5QoffxaAWzqcFinJy0KX0duv9o86XS7LCK3TSZakkuQrjfy57FV0UpB2F5SczMSdh
         zYQoFKUfrSxaKC+Ax8I9cMX05xbgBZlIcp4m0pFBEnXn8eQDDWX9UhsZ7teQkBaouo0e
         ZsW6QtjjSDd+54AycoSTr/RsC5AJDX2hv5axU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679554; x=1796284354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BAeP825lkaxoabnMfIBpo2jQjykn0ii0H1E+c/o1R8=;
        b=l7noBiurov15OV6H8HiwvUaNehi4mW0Cf08F9sIphXK+aP1+W0PfwyOP1bzbRN/Ypq
         YlVjXUCuFKpjN25AytW+68BVNdnE/gHtRWnZ5l9J+I9GycEvx2yoxYKGj61aCgZ2baBr
         U+LcT34uCFN7yHVMr8hchhnN/3piSfoJ9SPTQQeTE5/2ic3vOngB8YHCvCuRTEVx3ESV
         En2NUY7CFaGnzy2bQvph7PiWKoEfhsoWA8r2ja7cmXmxZ36nHlAZM/yvn6JRvB10SXcu
         JQIHq9H1ukC7Z1398KM616VWgVwWhS1g+GJly0Tao7UQn561f5ujLKunzWA7PcUOqtUp
         4NkA==
X-Forwarded-Encrypted: i=1; AL+hErHPjAig7TzcZHs48j8zvHnPBwLB3Bm+Jxapdmhz0yEh36FlV6dbqj+1y7FItnK5LPhIOyXloqVz+QH4HUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DEDzhzdZVeqhtgpBUvP79SjK23kBGg9GhQIsx8yzDrnVAb70L
	VdqnzC2RNviVHo4jRwGqhDuKqpPfVrZ1nPyy10mBymI1N7Po91M2CtZLAcO4ZQ2j2K3y0rIIci0
	PXbK10Q==
X-Gm-Gg: AZFdTZfh6rVT3W9jPB3TMBZrmmVEASWK9OYs3G+92Rqnmq69I/oNh0qgfdfVC+11lrj
	nCqlTfz2UPicb2DQCnP6GM6kv6io59VVWUt6p1JyhzI9BI+PyHbKkwj+inOsaY3uSX/DLrGoYGU
	VeBb+m4A3dFGTnH/t2Tn2tI7WaX0WJXf4LWGXbvLSWktXyd8BQ9bBs9bASh1z2QzIvy//ET19Gj
	s+NB2A7qAUpQpLa0wqvCb+VdRMesGtQavLp0dcbHylDUOCXH+w3ywymIPFEIBh7ZCS2OAOYntLN
	ma3EVhNVAnKNt/9UJzyTs7VuHheUbvC362cum4BJshPkgldWeyXihWJAetF+z04u65BhB/ovIWp
	FxF+OIDkyw4g2ndINDCZTgR7PeKA/zgpT6ad3Y2MuACQj7BLmOW+DnsGT9bJd0arBaRlxJB9w2E
	FB84l1Mk3sEyq7gQdecja8A1FgvK07opBZ0Pw4id2ohcCvpvsnUciH+YWxaiOKoVn91Z2xzqRpc
	NNbBdvnOiMMcPrpowAfsGbnv6FOV/uqv79WUAngwf7VF0BDmO0puu1YRemdS2oE55LsjHhb7kmr
	YpnCJDuNPcw24zbyrrsF54B0uqqT3dVTtf3T/+BvOrBmM3GAF8mGZiZhpMX9DXgEidI=
X-Received: by 2002:a17:902:cec4:b0:2f0:436d:bdc1 with SMTP id d9443c01a7336-2f0436dc431mr177820315ad.33.1795679554443;
        Wed, 25 Nov 2026 23:52:34 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f15663fsm97825375ad.76.2026.11.25.23.52.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:52:33 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386c71feeeaso3102171eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:52:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHDKIz6z4OIQ4yDd6eCi9LshfCgaBTQc1gwxiMyPHOX3i4//gIDzj8yIZjSwf4SKS/8+F2WvtWHQT3TCaU=@vger.kernel.org
X-Received: by 2002:a05:693c:87d8:b0:386:b896:319c with SMTP id
 5a478bee46e88-386b8963d3amr10022337eec.35.1795679552269; Wed, 25 Nov 2026
 23:52:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-18-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 15:51:53 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngJz=WR=dynO0O4FiAW3rqADNCvEGa9cPn1b-Dfkxi6LQ@mail.gmail.com>
X-Gm-Features: Aa3M54pxRAeFEOdKGCuQ1O6Bt_XOraD0DZxugIMunZCy7TNnnfXexdvBZJe7MKU
Message-ID: <CAC=S1ngJz=WR=dynO0O4FiAW3rqADNCvEGa9cPn1b-Dfkxi6LQ@mail.gmail.com>
Subject: Re: [PATCH v2 17/46] drm/mediatek: Add support for hardware
 multi-stage layers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 7:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for adding support for newer, more complex, display
> controllers like the ones found in the MediaTek Kompanio Ultra and
> Genio Pro 5100 (MT8196/MT8894), add support for multi-stage layers
> as in newer hardware, there is a special strategy using multiple
> hardware components of one (or multiple) display controller(s) to
> form one single layer.
>
> Multi-stage layers are one more step towards extra flexibility of
> the Display Subsystem, making it possible to change capabilities
> of Display Controller Pipelines depending on the final application
> of a board: for example, one board may choose to use fewer layers
> per pipeline to achieve more pipelines (more concurrent outputs),
> or more layers to achieve less, but more capable (as in offloading
> and in achievable bandwidth) concurrent outputs.
>
> This currently adds boilerplate to support this hardware, but does
> not yet implement the IP-specific support for MT8196/8894, which
> will be done after all preparation is done.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c           | 304 ++++++++++++------
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  15 +-
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  12 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  12 +-
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |   2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   9 +-
>  drivers/gpu/drm/mediatek/mtk_disp_wdma.c      |   2 +-
>  7 files changed, 246 insertions(+), 110 deletions(-)
>
[snip]
> @@ -992,15 +974,15 @@ static int mtk_crtc_init_comp_planes(struct drm_dev=
ice *drm_dev,
>                                      struct mtk_crtc *mtk_crtc,
>                                      int comp_idx, int pipe)
>  {
> -       int num_planes =3D mtk_crtc_num_comp_planes(mtk_crtc, comp_idx);
>         struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[comp_idx];
> +       unsigned int num_planes =3D mtk_ddp_comp_layer_nr(comp, comp_idx)=
;
>         int i, ret;
>
>         for (i =3D 0; i < num_planes; i++) {
> -               ret =3D mtk_plane_init(drm_dev,
> -                               &mtk_crtc->planes[mtk_crtc->layer_nr],
> -                               BIT(pipe),
> -                               mtk_crtc_plane_type(mtk_crtc->layer_nr, n=
um_planes),
> +               struct mtk_crtc_hw_layer *hwlayer =3D &mtk_crtc->hwlayers=
[mtk_crtc->hwlayer_nr];
> +
> +               ret =3D mtk_plane_init(drm_dev, &hwlayer->plane, BIT(pipe=
),
> +                               mtk_crtc_plane_type(mtk_crtc->hwlayer_nr,=
 num_planes),

I hope it's not too late for new comments...

IIUC, mtk_crtc->hwlayer_nr is the CRTC-wide plane index, while
num_planes is only the plane count of the current component.
When a CRTC spans multiple 1-plane components (such as four EXDMA
blocks on MT8196), hwlayer_nr is 1..3 but num_planes - 1 is 0, so no
cursor plane is created.
You might need to forward the CRTC total num_comp_planes to
mtk_crtc_plane_type() instead.

>                                 mtk_ddp_comp_supported_rotations(comp),
>                                 mtk_ddp_comp_get_blend_modes(comp),
>                                 mtk_ddp_comp_get_formats(comp),
[snip]
> +static int mtk_crtc_init_layer_stages(struct mtk_crtc *mtk_crtc)
> +{
> +       unsigned int prev_master_layer_component =3D UINT_MAX;
> +       unsigned int master_layer_component =3D 0;
> +       unsigned int comp_idx;
> +
> +       for (comp_idx =3D 0; comp_idx < mtk_crtc->ddp_comp_nr; comp_idx++=
) {
> +               struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[comp_idx=
];
> +               struct mtk_crtc_hw_layer *hwlayer =3D NULL;
[snip]
> +               if (master_layer_component !=3D prev_master_layer_compone=
nt) {
> +                       hwlayer =3D mtk_crtc_find_hwlayer_with_comp(mtk_c=
rtc, master_layer_component);
> +                       if (!hwlayer) {
> +                               drm_err(mtk_crtc->base.dev,
> +                                       "Could not find layer master for =
%d!\n",
> +                                       master_layer_component);
> +                               continue;
> +                       }
> +                       prev_master_layer_component =3D master_layer_comp=
onent;
> +               }
> +
> +               /* Add the newly found layer stage to the correct layer m=
aster */
> +               hwlayer->layer_stages[hwlayer->layer_stages_nr] =3D comp_=
idx;
> +               hwlayer->layer_stages_nr++;

hwlayer is declared as NULL inside the loop. On a second stage
component for the same master layer, the lookup above is skipped, so
dereferencing hwlayer leads to crashes. Declare hwlayer outside the
loop.

>         }
>         return 0;
>  }
> @@ -1039,6 +1112,7 @@ int mtk_crtc_create(struct drm_device *drm_dev,
>         struct mtk_ddp_comp *dma_comp;
>         struct mtk_crtc *mtk_crtc;
>         unsigned int num_comp_planes =3D 0;
> +       unsigned int max_comp_stages =3D 0;
>         int ret;
>         int i, j;
>         bool has_ctm =3D false;
> @@ -1121,20 +1195,54 @@ int mtk_crtc_create(struct drm_device *drm_dev,
>                                                 &mtk_crtc->base);
>         }
>
> -       for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++)
> -               num_comp_planes +=3D mtk_crtc_num_comp_planes(mtk_crtc, i=
);
> +       for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++) {
> +               struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[i];
> +
> +               num_comp_planes +=3D mtk_ddp_comp_layer_nr(comp, 0);

Passing 0 instead of i here skips the `pipeline_index > 0` check in
mtk_rdma_layer_nr() and over-counts num_comp_planes (also carried into
patch 38/46).
Pass i (j in patch 38/46) as the pipeline index.

> +               max_comp_stages =3D MAX(mtk_ddp_comp_stage_nr(comp), max_=
comp_stages);
> +       }
[snip]

Regards,
Fei
