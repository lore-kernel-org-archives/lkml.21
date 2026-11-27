Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776623;
	b=OfRo4hB5vQ+gocwQLXhCmXOBlGoR72iu04STK9NQ+B7ZIRZ+XpFWqR24wwmdUjUMrdUU
	 mDbrAwvYL/vDs+v/10+X3Ibil9xEYHjCPfZNx6KJN1KbAusg4jUajVJPRIBuZCbOJcnaF
	 YmopMec3zHpJdnf/jgnRZUWbTu8iK6XtSB3AYusimHQ7ziR1FxLyT8JReqKFS1BlIkAqj
	 gVpeIFXAUNmziTXPax5pSmorDPQwOwlrA2FdeDgsleY3YO7/juLy4vnqBSGHODidh7rhO
	 MmAt9iCTmSV+/QAg04fMTkEdOeFYuABa++cgOGH/6B20i6F7yPwVLHzsXUplfIW9U4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=g2Ork4q/Fz0rgLCbWsmRNw5g1k58/a2ERyPtpHF+EsU=;
	b=H4hKGPY9b/fHSTcZL0ijozMwytpBJYvldQFAPShOmcnL4+wTmIENSjZCZRNnBFf6kVPN
	 XAohSHtEHjbSy2bnoUdnWQpKxsCQG4GNxsjBXn/5rUfRsoMYWZfIVtO9tS+2t8JhmZdc4
	 i/v0iSPjt3oN/kxhMW8vHRHdHkNQbKkZ5MdlbdXeFgffFis+leM6MyuNfTlRqsYJE92pw
	 IR9WDM90noddXEr0cqrl8QcMlcYj9C96sWtvoCipsY48iw0qSmM88wQTzZ5pzYnLzbtjv
	 jRTH7wJhFlMKxW+B0NsaUu4gQQGCvHUh+O087G63rHH46aDMZNKkiLEnrhHu3s2D2gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Egs+NoJv;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE39606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AE39606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Egs+NoJv
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so4239832b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795776623; x=1796381423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g2Ork4q/Fz0rgLCbWsmRNw5g1k58/a2ERyPtpHF+EsU=;
        b=Egs+NoJvcZOBxOO4zHsjiHVtugb0NsEZxt28qkxQx9IgNsdoXRSJfHycZDqEcxakHX
         aSZ+INaUDtYXSNBg4Ztvu/Ct4Kq6erEebiY4iKtbPwwDeUHLGkpW0HUGlO2Qe20fOmOu
         34CBg5ysj+JW2HljElDJxUWEpBAgUbhP6UM3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776623; x=1796381423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2Ork4q/Fz0rgLCbWsmRNw5g1k58/a2ERyPtpHF+EsU=;
        b=yU8y0WLDzw5chLkKnRCgA6496Wp9FNWBtnmA1mNvDAd7rJfOFkvloiRxgnI118ECtB
         GOBPVzDXUdOpcre/X7e63U8++A/bqWppVE4mqC65Mk5Tdt1+XF1vpqCwGR+rYxhBFyA8
         Xibe3xSfVEgZ7hpwa3J707SmMwitDf8BP00Ro5t2fbP09omkImrts7q6nFDiTf67FqbR
         PXETc1Q94kzvlNCGWZI/mNAYn2AbkteSP6jW2x0qjBD169+cRYKsJVxnkFphR40VtkYk
         LoUApKOMq0h+H481XzE1uaSySZ/6vW1c/bY3T8RIVx7CpBgZ3LNTVAgUzR4R6AN1Gm9E
         tBnA==
X-Forwarded-Encrypted: i=1; AL+hErH9VFlB5e71YtZkTLDbz8fwtcR1yuagn+Ry2gH0xCtsuiiGt+eH/ef/Q1Iw0ZUqYQGeVkCsFbqc3O9sIao=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/17NbdJctCj0QQyFC4nZhVhrkEonU5TEHKdQ4m+/BXxfJHIOW
	JX6H4yZXHng0/vQxw+8zil6BviPtL7Qx6ome50uCkhDHZkLd/+TpuxlK5ticvVcUUkYpBwj1z8e
	GVkcFww==
X-Gm-Gg: AZFdTZe68ougT25q9x8fY5mlmq6/CZDc01TqlInlk3t0AIlL0isO3R7sX3loKumrZu9
	mKl4o1uNchXPraZlSCJqaRVEPq3XJMuQOMrqZryh6TYn7Eu407nz0GkPBGVZb8buSharWgWgMKb
	WMdrCI7jzimDvLLyJlHc9UYiTx8j1ynU64kUP2wrjTg1vcRPSa1I3b60+mOUCLWVED7tYMaARlw
	Iu+VhzwCrTpGdPauzoj/VcqnPNK6jZbVxhrGAkNHO6RoIqp04Ca0Dxhm3By5RFztbo23Xr9/RAI
	ba8sx+H9XOyxMY7N4LsUAOxHTF5hR0OYJVByvf3WkKXGyhLLjclLcNhqpxlV9oX+F2gNuA/kias
	tXg25SBj1qYCmW/gLF/JjIhlrytSFrSJv4n2a6bJ+quIsNISB9KB6IPNo3UQnibPGEo0l6y+HAN
	/1JNFA+SRelXS9FL7HIWas6i+86dAyt26FKLlSjtvZCkzpafebib9SCnVFbMfIUFOFMu+u7fsB8
	z1oMa+u0eHXQsq9x/wIUWmZDxbF8tt5hhHEpyuCcaxmEtBhYEqWLU2j17e8p5onInMNdK1Nf5/9
	HPuZpB/uVBYPO/t0nqwUNOjUv6DMOc6Pi+W9Y7e1bAxO5s0T+7DdDL/anbk/TFD66p0=
X-Received: by 2002:a05:6a20:c992:b0:3f9:a6b6:e16f with SMTP id adf61e73a8af0-4014d15a281mr24622496637.65.1795776622799;
        Fri, 27 Nov 2026 02:50:22 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d03adafsm12926943a12.23.2026.11.27.02.50.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:50:22 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386bd881d39so8853521eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:50:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH1A0EBATKVuWisjBlFnHE4Vw/5+s2wmybDTzra5uP2fgD6XpOjN0nxlWPkZYY+70EUEr58Cnlq+ENmDDM=@vger.kernel.org
X-Received: by 2002:a05:7300:824b:b0:386:9c6a:3e87 with SMTP id
 5a478bee46e88-3869c6a3f0fmr19991102eec.15.1795776620365; Fri, 27 Nov 2026
 02:50:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-39-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-39-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 18:49:41 +0800
X-Gmail-Original-Message-ID: <CAC=S1njuORK1R2QCwjh1Lk1yw15Povito9qr1ZV6QP-Dw=oY9Q@mail.gmail.com>
X-Gm-Features: Aa3M54rQkdVsbW33JjuQjGjC9MCiVwfA-JMszG-a0o7TcRXKKUJN-zbdfm4qHSM
Message-ID: <CAC=S1njuORK1R2QCwjh1Lk1yw15Povito9qr1ZV6QP-Dw=oY9Q@mail.gmail.com>
Subject: Re: [PATCH v2 38/46] drm/mediatek: Enable bring-up of
 multi-controller CRTC paths
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

On Tue, Jul 14, 2026 at 7:47=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Introduce support for actaully bringing up a full crtc path that
> features multiple display controllers: this enables acquisition
> and writing to multiple MMSYS and MuteX instances to connect the
> multiple display controllers and enable trigger signals from the
> various hardware sub-components at the same time.
>
> This currently only works for rather rare display pipelines that
> can make use of multi-controller without DirectLink architecture.
>
> This change is also the final preparation to introduce support
> for handling DirectLink Display Controller paths, found in the
> MediaTek Kompanio Ultra MT8196, Genio Pro 5100 MT8894 and also
> in the Dimensity 9400 MT6991, Dimensity 9500 MT6993 SoCs.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c     | 513 ++++++++++++++++++------
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c |   6 +-
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   4 +
>  3 files changed, 398 insertions(+), 125 deletions(-)
>
[snip]
> +static int mtk_crtc_init_multi_controller_properties(struct device *dev,
> +                                                    struct mtk_crtc *mtk=
_crtc)
> +{
> +       struct drm_crtc *crtc =3D &mtk_crtc->base;
> +       unsigned long controllers_mask =3D 0;
> +       struct mtk_drm_private *priv;
> +       unsigned int i, j, k, z;
[snip]
> +                       mtk_crtc->controller_idmap[z] =3D mtk_crtc->ddp_c=
omp[j]->controller_id;
> +                       z++;

`z` is uninitialized.

> +       for (i =3D 0; i < mtk_crtc->num_controllers; i++) {
> +               u8 controller_num =3D mtk_crtc->controller_idmap[i];
> +               struct mtk_drm_private *priv =3D mtk_crtc_get_controller_=
priv(mtk_crtc, controller_num);
> +
> +               if (!priv)
> +                       return -ENODEV;
> +
> +               mtk_crtc->mutex[i] =3D mtk_mutex_get(priv->mutex_dev);
> +               if (IS_ERR(mtk_crtc->mutex[i])) {
> +                       ret =3D PTR_ERR(mtk_crtc->mutex[i]);
> +                       dev_err(dev, "Failed to get Controller %u MuteX: =
%d\n", i, ret);
> +                       return ret;

If a later iteration fails, the mutexes claimed in earlier iterations
are leaked. Unwind them with mtk_mutex_put() on error.

> -       ret =3D mtk_crtc_find_suitable_dma_dev(priv, mtk_crtc, output_pat=
h);
> +       ret =3D mtk_crtc_find_suitable_dma_dev(mtk_crtc);
>         if (ret) {
>                 dev_err(dev, "Could not find appropriate DMA device!\n");
>                 return -EINVAL;

This is a legacy direct return. It needs to jump to a cleanup path below.

> @@ -1446,4 +1700,19 @@ int mtk_crtc_create(struct drm_device *drm_dev,
>         }
>
>         return 0;
> +
> +err_free_idmap:
> +       devm_kfree(dev, mtk_crtc->controller_idmap);
> +err_free_layer_stages:
> +       for (i =3D 0; i < num_comp_planes; i++) {
> +               struct mtk_crtc_hw_layer *comp_plane =3D &mtk_crtc->hwlay=
ers[i];
> +
> +               if (comp_plane->layer_stages)
> +                       devm_kfree(dev, comp_plane->layer_stages);
> +       }
> +       devm_kfree(dev, mtk_crtc->hwlayers);
> +err_free_crtc:
> +       devm_kfree(dev, mtk_crtc);

Before these error jumps, mtk_crtc_init_comp_planes() and
mtk_crtc_init_drm_crtc() have already linked `drm_plane` / `drm_crtc`
structs into `.plane_list` / `.crtc_list` under `drm_dev->mode_config`
(via drm_universal_plane_init() / drm_crtc_init_with_planes()), so
freeing `mtk_crtc->hwlayers` and `mtk_crtc` without calling
drm_plane_cleanup() and drm_crtc_cleanup() can cause UAF. Please clean
up the registered planes and CRTC before freeing them.

Regards,
Fei
