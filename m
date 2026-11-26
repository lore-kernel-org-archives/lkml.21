Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691188;
	b=cy5fhuMFRVhWdOMvp3GEYWs7Tyvbssq86GqGyBpRdgJl7Jl17kVwkJFuUcFkgsBftYRs
	 21qX8dm5QuXE2Ag3m7aWpC8OGfBj0NmPPhtgokxrElbopcoBxLCRw6hAigXeLYARSNOMb
	 xITTiMUj7oUwwLE20XmePJsm69lqXrm9W19FZ4HSFJ/38/bxl0pdWPs/KyncDiWnZ1Ke1
	 13/jjKq8M3MT26JmKwevvfLE9rjZ1Tt+3anpFR43dq3Pani6EupXzHdkBKt+bUOWCscIF
	 AExoGMuVv5nd1lRMeSoEW4p5yiFJ5m1C2pepbfqXX2MfcegrNNnZsa8geato+Cx/tTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i/lQFYYSgifKwpBl4Z4gLxmp/LsgZ8d5yEoRR702v7k=;
	b=ne9e6Do05u3TjVJw4Gtv7sV3TY5rYsFRbLd/9O6iV69jIkkwmdWKX99c6Ksd6PiaeK2g
	 66RAid0TZzRzrVoNububS8SMSRLfygIedkicYrEKm24ga7fZB9uaTnh8RrJvnF049I6tQ
	 w5ccYI6GpAQBblGa/MJKcYAtlnSwYHuhIQcwtoJzPBkh9qSjdkT/kzMsEauy94CDzI6DH
	 j86K6xCDus6N7o3+5ck64WKuT5igVbrKdtXq7F325V1Ip7hh8fYenobL4cpzeluhcq3vb
	 WrMNJXnFzLSZmra6zIhiq1O26ksq88pf7z/EgCxXs2PY4O67saE0/t9+KofSxRytntw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ErAcX0gh;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F215B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F215B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ErAcX0gh
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f04e3bf46dso50936915ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795691187; x=1796295987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i/lQFYYSgifKwpBl4Z4gLxmp/LsgZ8d5yEoRR702v7k=;
        b=ErAcX0gh0e+0NHSe2vnQqUcDvRIGNblK/7W+7aYn4+tTIytP9N5hn8c62IBVirMURZ
         9aAaHEK8pVnSj2q6wp5hvDzODRFTfl1k46Y/6PpWPgABBRYJtMHQXQkZfO/wZ8CuIu+P
         zpU/b6ogVoj+7ZwnAhpPiSwxfuXu4tI91RUcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691187; x=1796295987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/lQFYYSgifKwpBl4Z4gLxmp/LsgZ8d5yEoRR702v7k=;
        b=c6m14hTYwHDU052cBykfNVtDkPdgLWMWBdodpDc0BOYh2wcqQgN6oHJqRf0j80KxBt
         eUiuellls7DssDoOwMn5YFjtVjyEycB1JJoWNnK9L1QyLcRjqAuf8mBTvI6JThB940SU
         UniZF1wLqlwN3gTchoqPSL7vS7x1A8HcRen2rmiG7hzg57cw5/+IalwN9ishLCFP3fGb
         oaq95HOirxMLWJB3paBLszXBIW61B/vWCIQvJTm8KOUTVT6pcZiZrdiUAbF72h2xlh/n
         mkMPtc886S5dcEUrQNAeigyeEafK8wGHJMxSnIN23XvnLWNhJmpEYQcoyzIDJMxr8ypu
         e06Q==
X-Forwarded-Encrypted: i=1; AL+hErF+6a4VjC7F4UvG7flnAUwWCzALfN29f2PvgTxBjwot1kPPB96f2mJtLDZ77N27RMljwAC1b1S9xa+AUXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NZR9RMFhiLr4gYpCY6d9arEMge1V4EuzHjES/7RKLYZzU7/zN
	Rp4rW+BSPoqU9RXEWXPx0H+V77DLNKC4C4Px9l2izUdd31hqOKihOVOtrMk21WSpdZiZrz+YRNg
	c6ZY=
X-Gm-Gg: AZFdTZcUlgiXRlQ+3GIKFmNs9Uz7hXmEANGNaDjwru4wW3MxSKFngVdPUypAkq9s5/L
	3t7LJNEx8ZKZMpyVMu3is2tXu+SMrsxVQWd4u/SZ4pSSzifC9z0W2fDoFkJTFFfbxwIJ8opXoIb
	Mn7eJ7V+jTPZAB6U08LhU+jmLzrgKWtCm0KufX2Gwox9fzbB6HIaFR4bw6/L7MJn1tNR5+Zl5Dc
	lzGtdS727ypEARexZTx9mWS6fZHn+vlAKykmG6FPhnf5s/pzCFeqxYGSKGuVqGxJE5XIEWng4W1
	dZF+IqUkUvPTyQSIfgBZy5Dm5rw1ac293HZH8ZXPGLxhBEGJMnd+mjAM/uABy4OjW1yV4yJhKrh
	xh+JOZo8A2sV4QQbQpz2LA0N3D7zkL1msdMFse4JOUE5ys8lYMu1DfT5TItNoOd3iDtmP274roO
	RuuDHKZ+WFk/Rr4qkWiW4E0L+7dJIW/95XD9bEEAaXmWho+WCr6ZG1HiuerjbY3gH4Y56g24JyO
	EJ+DzOv4bt4fmTVSkTTHZKuo9kF02biOoLiS3fq+COOrBDyz9ZWE3jR2LwRpYKqDCIEQlkxx7IO
	7L/58p72YBOgJOOxXyLMu+joDGV1zg6kssqFgetiQc3obyUMUl6pAHUK34XxyGxKuIG3Xk8e2My
	xjmDkG03y7/oL
X-Received: by 2002:a17:902:e788:b0:2f0:6a92:721d with SMTP id d9443c01a7336-2f06a9273d7mr166997595ad.36.1795691187303;
        Thu, 26 Nov 2026 03:06:27 -0800 (PST)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com. [74.125.82.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0817ab27fsm71274765ad.35.2026.11.26.03.06.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:06:27 -0800 (PST)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so2593039eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:06:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGHafqbbbcZbqWJHf5sU3BJ0fncnvkjwug8zEPLnzA+imaCizYcMrd08Is5iRbvXvbWDvOb38kyE3IMAR4=@vger.kernel.org
X-Received: by 2002:a05:7301:240a:b0:386:cd71:b714 with SMTP id
 5a478bee46e88-386cd71ce89mr5908411eec.35.1795691185712; Thu, 26 Nov 2026
 03:06:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-37-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-37-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 19:05:47 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngQC33xKiYRYT1qq1jqJj+7yveiwu1CQrouv8Ud+dPtfQ@mail.gmail.com>
X-Gm-Features: Aa3M54q46fTI_3jhRSfuxLJf-vqFgr66vNyr9HYUTk_fEMF24HCMszULS2t_YS0
Message-ID: <CAC=S1ngQC33xKiYRYT1qq1jqJj+7yveiwu1CQrouv8Ud+dPtfQ@mail.gmail.com>
Subject: Re: [PATCH v2 36/46] drm/mediatek: mtk_crtc: Dynamically find
 suitable CRTC DMA device
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

On Tue, Jul 14, 2026 at 7:46=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Now that the vblank and config components are being dynamically
> selected, the only hardcoded strategy that is left is selecting
> a DMA device for a CRTC that is being created.
>
> In order to support pipelines including an embedded multimedia
> controller (like MDP3) chained with the display controller and
> pipelines chaining multiple display controllers together, stop
> assuming that the first component in the pipeline is suited to
> do DMA operations and implement support to dynamically find not
> only a suitable DMA device, but also the best one.
>
> This finds the first device that provides DMA and the first one
> that is also behind an IOMMU.
>
> The criteria for selecting the best device is to prefer a DMA
> device behind an IOMMU; if not found, the first DMA capable
> one is selected instead.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 68 ++++++++++++++++++++++++-----
>  1 file changed, 56 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 3cb2d1a28987..16c9ff2cfe32 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -1132,6 +1132,60 @@ struct device *mtk_crtc_dma_dev_get(struct drm_crt=
c *crtc)
>         return mtk_crtc->dma_dev;
>  }
>
> +static int mtk_crtc_find_suitable_dma_dev(struct mtk_drm_private *priv,
> +                                         struct mtk_crtc *mtk_crtc,
> +                                         const struct mtk_drm_path_defin=
ition *path)
> +{
> +       struct mtk_ddp_comp *dma_comp =3D NULL, *dma_comp_mmu =3D NULL;
> +       int i;
> +
> +       for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++) {
> +               const struct mtk_drm_comp_definition *cdef =3D path[i].co=
mp;

`path` points to a single `mtk_drm_path_definition`, did you mean
`&path->comp[i]`? Or use `mtk_crtc->ddp_comp[i]` directly here since
patch 38/46 switches to it anyway.

> +               struct mtk_ddp_comp *comp;
> +
> +               comp =3D mtk_ddp_comp_find_by_id(&priv->hlist,
> +                                              cdef->type, cdef->inst_id)=
;
> +               if (!comp)
> +                       continue;
> +
> +               /*
> +                * Check if this is a legacy OVL_ADAPTOR component and, i=
f so, this
> +                * has to forcefully be the DMA device for this CRTC: ass=
ign it to
> +                * dma_comp_mmu to force that.
> +                */
> +               if (comp->type =3D=3D MTK_DISP_OVL_ADAPTOR) {
> +                       dma_comp_mmu =3D comp;
> +                       break;
> +               }
> +
> +               if (!comp->dev || !comp->dev->of_node)
> +                       continue;
> +
> +               /* Find the first device provides DMA... */
> +               if (!dma_comp) {
> +                       if (of_property_present(comp->dev->of_node, "#dma=
-cells"))
> +                               dma_comp =3D comp;
> +               }
> +
> +               /* ...and check if that device is also behind an IOMMU */
> +               if (!of_property_present(comp->dev->of_node, "iommus"))
> +                       continue;

Checking `#dma-cells` (a dmaengine provider property) and unscoped
`iommus` can be fragile: if the leading plane reader has no `iommus`,
this loop keeps scanning and can pick a downstream non-plane block
that has `iommus`.
Maybe filter by `mtk_ddp_comp_layer_nr(comp, i)` to skip non-plane
components instead:

if (!mtk_ddp_comp_layer_nr(comp, i))
    continue;
if (!dma_comp)
    dma_comp =3D comp;
if (of_property_present(comp->dev->of_node, "iommus")) {
    dma_comp_mmu =3D comp;
    break;
}

Regards,
Fei
