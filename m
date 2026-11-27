Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771988;
	b=gLbfqRTK+n1Jqcou6Kd9wyRdZycbh33RrYGS6mpxokfwk+BgYTvkyhqqSlaeHZ5JY9UU
	 NiBCC59/mn/gZFE0FgyGGDsBKcg/kkV6qhlChdwTovsXn+oPzqISZ+8UvjGr1xMqvi6d7
	 4bySxFWVPFAJCMYXuU+YmBQCqg9KvOQbNWe9ViSfKvgvx5ozvkXGHd44dpdDa0nVwFpxt
	 zCIrwWm90ZEJK5XCWwuFGXfzMNAWnCXFF+SpNNk8r9MZjydArN7IAYTFk5HkdjraZ1ksJ
	 toOUNFvgebPZARU/4e+Z0aFTJIzAqv7/wI3+E0FHxv0w99s8pcpnRSO7rvF72uMXKWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z0HAmZPkkL929InieJ6NG6YqendguBQ6bWYFHNZs/RU=;
	b=ww25bHha6NlGZwoF/z1UDzCK8gun7YzJU6BUaqYHNT/pDIalcJBPfFJLi2zhY9ruV7vc
	 TmYta7WSNEBhLNj7GgVtMa36vAZZ6wR1Oih7LCuoBkQOaHqRzbzH3tQhfxhtZm+3fB28K
	 xTxGTHiLX9UFsddMx/HBTaijN5vRwcRgMauegS2HHCaILTXstPGgF8JALD9sojiQtYsEv
	 uapl0NG0rNU34PSgyzx8+me2M+G5zZDxrqlX9q8+/mocOR4HRAeuJMlOVa8TvCE2PrWmH
	 EateIvHym3yiscJtUjNh0wpSUkoMXjE/yTb7x2zE4WL8EQSrSmvUdrp2NgDYpMTCGTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ifWl3UT8;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4449D606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4449D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ifWl3UT8
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so3266360a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795771987; x=1796376787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0HAmZPkkL929InieJ6NG6YqendguBQ6bWYFHNZs/RU=;
        b=ifWl3UT8kJyC3f8Yg4b3QS+BfKyA2HKr8euTC1I/+uN+uQQkXtfJ4P5uYL6mOrGCiK
         xT8HVo00+UAi84XWBHgMN6GnCJORydvsIHOAFRYfCrdMCM6TFW/aoiQnNkuvOh3Y1WsD
         q7tX63D8OywcbGPq+Hz6qR0ItSkKvgLUdAe1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771987; x=1796376787;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0HAmZPkkL929InieJ6NG6YqendguBQ6bWYFHNZs/RU=;
        b=JKJf5bZ0uJHARoV3ls8KkPAtCXa1tjXNHBWsDI2tBlCHECvkcurJJQF4whKNN3hkG8
         ZNqTfgtdXMeZ6ywhFIz3uYgyitjMiSr+XU3IkyxG2ntGaE7V++PdV+ROaBh61dm1atg9
         fncxHPId1syk2CDGAdZ8pFswgEVluqQrywlIfZvyxB3+EVQCaa9BEPnKooCmryfIlSm7
         EoVF3V0plyPHrmKTXoqSWTstlzmoUWXfx7CZ52orcTH08R3Nde5eo2B3SfmhKlzwkVAu
         M9yHB0dUIf2vXnKTP6UilRhDbj1CKsx6fdTtF0+m+gEg7TbWtcH5WNf09r/89XoRl/Md
         UOrQ==
X-Forwarded-Encrypted: i=1; AL+hErGyKEUeScvgRK/fYhLFC9IGVe7dgWjlDp2EDUiffpMIm1kr+w6fQ6RWI2yo/z+AZ27ecCxbS4jjwHG1RTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9H/9g06CBDJzrkz4yuxdNl5Kr1U1j5eCWdyUaoTXYvE+Hsq5Oc
	4jrtpFQifS8pSOa2eDolcPjLRa+FUHhX4GtvuSTG1ly7UuX6f49AWdXH7k7DidOJCI4KeUwTCmr
	lDPOyXA==
X-Gm-Gg: AZFdTZfu7wqNJmnrGBl7XBhzXKAEYdwSvPMGCb4qCpAGhEgh5QRtQty3YM4shcONgAo
	1Sa1FmVjSq1iGGxtvfEhX6bBGXRDbX8mKpVJubJu0FfDkpeHtO7kxgDomJwqZV0+dVY5MyHYwsd
	vhZ4ROw9R9aXSZ1fdmIbi/KAP2a922k001CDgGsh2XObC0dpDdZXPS26zAIey+CsQYwUoRoN8lV
	AhwnG1qdDbxoTbkZuGTO+aLjDNVlJLew2n7H0TPz41Wdp/+rny5wKQlYAempzmRfoywHzp7NPZE
	dvvZKhyu+0CFoUwUvwFJSyFkLM+nkJEsD7JFbiwMnZTxQlhlWC4xFDP13NrPFPAjm/z/Jdgeuf0
	vpFw7ML4iu4RgxOUu233WvZLf3gQJYAkGlN0zkiRIQn0E63OpL5Hf+LFGg6WWhwiidv/aJECbVp
	sdNcI2rkbcpCV/MZa6S+AfkdPD3R6vsZnIqDxbH9lRLJIPUVByqr5snLC/vVVTyvnPX8/tRG3Vk
	6DHq/JoMx2wgm64UGMZJM5zt9QqBPRd0OjEm4kRrOqDzVau/+0AErkUECm0JJwas4so34ilBL83
	UJUPJHtxiy7UgRhIq+56ZByOkNL1tlhTJnLgZB4diP/SvWri7GAsKurJgPuBHGtD
X-Received: by 2002:a17:90b:3810:b0:3b1:bee2:223d with SMTP id 98e67ed59e1d1-3b41c9bc27emr22782338a91.53.1795771987386;
        Fri, 27 Nov 2026 01:33:07 -0800 (PST)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com. [74.125.82.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm21437812a91.10.2026.11.27.01.33.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:33:06 -0800 (PST)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2761c69fbso11215786c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:33:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGlLwI4ZI7uxG/dED8CPjvoZJjfGr+TAwVrKEvLGfZkpClBtKXgnanHgfLQS8hi67oxbZG73JqwroJmutg=@vger.kernel.org
X-Received: by 2002:a05:693c:414e:10b0:386:a1ae:6762 with SMTP id
 5a478bee46e88-386a1ae6d5fmr20784587eec.36.1795771985456; Fri, 27 Nov 2026
 01:33:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-38-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-38-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 17:32:28 +0800
X-Gmail-Original-Message-ID: <CAC=S1niK0HHMLpm+i9YLTeASvhM=qDy6oD2t24pa_32wKNsuqg@mail.gmail.com>
X-Gm-Features: Aa3M54pRArGKHVMgeqwG1e8L5StTOP94fleg1U4pb_vICTi6qu6Nmly90U-l36k
Message-ID: <CAC=S1niK0HHMLpm+i9YLTeASvhM=qDy6oD2t24pa_32wKNsuqg@mail.gmail.com>
Subject: Re: [PATCH v2 37/46] drm/mediatek: Prepare path builder for
 multi-controller architecture
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
> In preparation for adding support for the new display controllers
> featuring multi-controller w/DirectLink architecture, expand the
> path builder to recognize whether a hardware component in display
> controller related output path is getting its input from internal
> or from any external (to itself, but still internal to the SoC)
> display controller component.
>
> When an output path is found, it is also necessary to understand
> the enablement order (in terms of mmsys/mutex other than PM) of
> the controllers, as that cannot be done randomly: for this, the
> initial path builder will start storing an indication to whether
> a component is either in a leader or in a follower controller,
> and then a new function mtk_drm_set_path_orders(), called when
> binding all components, when initializing KMS, takes care of the
> looping through the path and setting up the order between all
> of the follower display controllers.
>
> As of this point, no multi-controller SoCs are introduced yet,
> so this code will not bring any functional change on any of the
> currently supported SoCs / display controllers.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |   2 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h   |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 374 ++++++++++++++++++++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h    |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_legacy.c |   3 +-
>  5 files changed, 351 insertions(+), 32 deletions(-)
>
[snip]
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index cccdd58b848a..75b3fd56d6af 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -185,17 +185,26 @@ static int mtk_drm_match(struct device *dev, const =
void *data)
>  static bool mtk_drm_get_all_drm_priv(struct device *dev)
>  {
>         struct mtk_drm_private *drm_priv =3D dev_get_drvdata(dev);
> -       struct mtk_drm_private *all_drm_priv[MAX_CRTC];
> +       struct mtk_drm_private **all_drm_priv;
>         struct mtk_drm_private *temp_drm_priv;
>         struct device_node *phandle =3D dev->parent->of_node;
>         const struct of_device_id *of_id;
>         struct device_node *node;
>         struct device *drm_dev;
>         unsigned int cnt =3D 0;
> +       bool all_privs_found;
>         int i, j;
>
> +       dev_vdbg(dev, "Populating private data for all controllers on ID%=
u\n",
> +                drm_priv->data->mmsys_id);
> +
> +       /* Avoid variable length arrays and allocate an array of pointers=
 to privs */
> +       all_drm_priv =3D kmalloc_array(drm_priv->data->mmsys_dev_num,
> +                                    sizeof(struct mtk_drm_private *), GF=
P_KERNEL);
> +       if (!all_drm_priv)
> +               return -ENOMEM;

mtk_drm_get_all_drm_priv() returns bool. Return false here or change
it to return an int instead.

> +static void mtk_drm_set_path_orders(struct mtk_drm_private **all_drm_pri=
vate)
> +{
[snip]
> +                               /*
> +                                * Paths are per-output: set order for th=
e new output
> +                                * by finding the order of the same outpu=
t number of
> +                                * the previous controller and incrementi=
ng it by one
> +                                */
> +                               src_path =3D &src_priv->data->output_path=
s[i];
> +                               src_order =3D src_path->len ? src_path->o=
rder : 0;
> +                               if (cur_path->order <=3D src_order) {
> +                                       cur_path->order =3D src_order + 1=
;
> +
> +                                       /* Order found: check next CRTC n=
ow! */
> +                                       order_found =3D true;
> +                                       break;
> +                               }
> +                       }
> +               } while (!order_found && max_iterations--);

IIUC, this only works for up to a 3-controller chain, which needs at
most 1 update (0, 1, 1 -> 0, 1, 2). When there are 4 or more
controllers in a chain, it needs at least 2 updates (0, 1, 1, 1 -> 0,
1, 2, 3), but the loop stops after the first update (`break` +
`!order_found`), leaving the orders as (0, 1, 2, 1). On the other
hand, when no updates are needed, `!order_found` spins
`max_iterations` times unnecessarily.
We need a loop that stops only when no more updates are needed, i.e.,
drop `break;` and loop `while (order_found && max_iterations--)`.

Regards,
Fei
