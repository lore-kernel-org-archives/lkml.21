Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781504;
	b=Rwz59OY+UwkSyWZUE7l51Lb1UW0MYzfgjy7GgPWnIvUEgX1Mf9+UK24mMkrwK5uwYkPR
	 mPdVcaxJ6yUek5d5EXYMobA7RxWtx7PItgqIc9rHaQt8/6B91VjJd3losRMjS9F1UEG2c
	 sUP9uHQpUzTg+lxgi1riOvu/tD9Aw0oborOrZSLTENITgv6bFIlWXVg5tKTfrEptPpvis
	 SOLu8hj7GdLw4l8wMF+3xn0TTVxHFSKg7svVl8OP+R+Z54PN3U/c2gXeUBxyAE/x7pbN0
	 wVzv3uG/eotN0+G6xBQtiK1W4BNHtN2oXQtUh+F5Ia13SnOZMUp2+QYN0CoEkxoNGlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Bm0qgyTwGAnzbvTI065ip0cEVkfj4VNUXrWOH1TrcSc=;
	b=03theAdYdWuaspm+jFxExpPUfRHBy0m/h8fccvlzQfd3AkFOl2NjHG5GCXiFSncsx55i
	 jayJdFSqYUn47RSu2GdDH+LdPvC1XyJUm7E6yK/YqdIDM/mPFiRzI+duINu5Ew+xU6YwQ
	 KtJqoOJW4FTtgVTPVez17v1bmDNeknz3VqLnAsasdxs+Ag8xyG62UQwO2GlaTINi1IPAs
	 XRrkDSflBlEHI8tkyaXw4Y5jKG7SoQwVbvNg6JKBiGqcji9hq1E4hLeZRcTKxCcypkGlx
	 B3bTdsZ9R9VALrA3Qv3liEePfvjOLAkh0OwTV4T+Uggwex276v9PR7hHOO+B8xkPu/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TCDQOCPj;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8949F606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8949F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TCDQOCPj
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f0414c1062so48136755ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795781503; x=1796386303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bm0qgyTwGAnzbvTI065ip0cEVkfj4VNUXrWOH1TrcSc=;
        b=TCDQOCPjbPiYmV0XZ41YC1MB+b33tMYqj6lw6xjva03I7e7wEEXXP/646WFRZbCRm9
         XDlJet2an2yi76CUuy0f/PHo/8EJGG/okTk1hxhrbv8zpEyvjo+7XoK4uMtI32e0gc3O
         3ZLOuULRMMHIWA7JfPBpoBFaLd6IcLgZ67rgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781503; x=1796386303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bm0qgyTwGAnzbvTI065ip0cEVkfj4VNUXrWOH1TrcSc=;
        b=2qIrDWSNGckoXkpKwbA0qp1VZ3OrInfoFATvWKplaOcKQEjWH0r83eD/5nAjZEb0q4
         h9NvSmnoj/5656RQCgWJ8Kjfmsl0cp3GeX2y5aCuv8e5DZMjUoxZdtUi5/X5Cw895Zl/
         fuPJYNIua7Gmf2G8b7sqNMrdxJ7fOoXBkKZNBZTbTg3uOPP3AGMPMGsiMfhA/8MlUasW
         EUrasZYTGWTLxwFZn5eJTsdCjgwoK3m/yd/E2vwzBMnwxEiZWsxVr9xSCxpEuVn37w4q
         zahUsSjRrHmwVCf6fd8aPCZgnJlVSXwFmm/pFJuNHM7QLgmzLf+XIyN1e4jLsAERxlat
         Kyfw==
X-Forwarded-Encrypted: i=1; AL+hErFdR58gZ/QhitcDKZ7Y5lz1IAao5F7Vsn+80lBozdlKU9AW7x2MHHY2iclycuQH1WbgLgGkSMPu+1OcLeo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JijgMo2IsvdMtPMrkBkw+OMMmLg4m0hwwumj7tTvahlCNoYsQ
	S7+WKuSLeNzLfPKZp0Y1WYsn4Keg1Q7ypeXa2hLU0kpyhWxIeePqxo2ymViZqkKy8GYbh7TYY9y
	k8VOeWQ==
X-Gm-Gg: AZFdTZf8dER5bG66Q7QamdXOSztaR4DHEQJo3AhSS3WLaDaNBLFmx9XUwagXgrQvDqw
	pjFPccW1UfRVF2okDFed1+0OAZw4FFsDeUfoDXMfh+FS8Ef9kW1VZepZGFw65d4AKM6tF8lqvSs
	YURX84m3rP6zqWECDXqHOCkPJsth/whItEW51Ab5KlRzCkU9nmgvXlQ3t0Phy8MRC9rLXi/66Br
	bqgQuuZuiwHiQK9bVzTmboDdZ/BrSZ1AKHuPMF9xMdiD2INaKOFw1nL49aECv7KACm0rIIOr9ET
	vxZEqMWvOdgwXsci3T8hheRQyehoP1MssYbjWL0A3OqrPDzl5BYZiKg9pJOqU8O/1sQsbXd1n/m
	0uGKm/F81Azs0AJkLGKOBxUm7RnV3Da5WfQs6nHcPZiY1fhL9SmMrcmFN87DB0tSv6IQUR374uM
	0+/HiUV0kP2JOi28WW5I2BnEkjcJDzhnwuAsbNNVeA1Ik7A9ULs2yKYohODlZ0W8OBh6SWRmtNb
	mPSAGh1JOinIkDQzVfxlVu2tIwfOXMBktnwSnvMAfgKVIN/AbRcHfKeIDGi++/1jEP2/y6fC9Fe
	qkS9pVmaIy8iz8uAcnI7X5Gqj2j54tJTSgunapk/YdHgFWVnJ9eUe2PL4U7KaxLKxjA=
X-Received: by 2002:a17:903:22c8:b0:2ef:e563:d2a2 with SMTP id d9443c01a7336-2f11414c317mr16040495ad.57.1795781502680;
        Fri, 27 Nov 2026 04:11:42 -0800 (PST)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com. [74.125.82.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm119355055ad.58.2026.11.27.04.11.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:11:41 -0800 (PST)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-385c497bf94so7833354eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:11:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF3c+XKptY7nCLaROpaS64IfN+54sf+C5+WTesD0W049PxiPqg9F4tTWjgYAUFuFGGNMpf2N/1Rddb/u50=@vger.kernel.org
X-Received: by 2002:a05:7300:d0af:b0:386:a3fe:4503 with SMTP id
 5a478bee46e88-386a3fe46b5mr17622667eec.41.1795781500168; Fri, 27 Nov 2026
 04:11:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-40-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-40-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 20:11:02 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhVwaXYehnkOhZtp1HVMPbgf3hHyq0nzUa0xBZKZtSc2w@mail.gmail.com>
X-Gm-Features: Aa3M54oBRoREnUteIhw_cWqJHnKQjoLmcsIuuFawJHqYqFGvJvM1giC0E8ZPK6Q
Message-ID: <CAC=S1nhVwaXYehnkOhZtp1HVMPbgf3hHyq0nzUa0xBZKZtSc2w@mail.gmail.com>
Subject: Re: [PATCH v2 39/46] drm/mediatek: Introduce MediaTek Asynchronous
 DirectLink Controller
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
> Add support for the MediaTek Display Controller's Asynchronous
> Direct Link Controller.
>
> This is responsible for managing internal I/O connections between
> multiple display controllers in a leader to follower(s) topology,
> adding the ability to enable data exchange between multimedia
> related controllers and the display controller(s), and between
> multiple display controllers, effectively changing the hardware
> capabilities of multiple display output paths.
>
> For example, this could be used to support multiple outputs with
> lower resolution and/or color depth, or to support less outputs
> but with high resolution and/or color depth, up to 8k60 in some
> MediaTek SoCs like MT8196.
>
> Moreover please note that, on new generation SoCs, (MT8196, MT8894,
> MT6991, MT6993, etc), the Asynchronous DirectLink (DL_ASYNC) sub
> component is required to be set up in order to achieve any display
> output at all as, differently from slightly older ones (MT8195)
> where a display controller reset resulted in default valid outputs
> being set, the new ones have a "muted" configuration by default.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile             |   1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  42 +-
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  33 +-
>  .../gpu/drm/mediatek/mtk_disp_directlink.c    | 434 ++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  12 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 160 ++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
>  include/linux/soc/mediatek/mtk-mmsys.h        |   4 +
>  8 files changed, 661 insertions(+), 26 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_directlink.c
>
[snip]
> +       of_port =3D of_graph_get_port_by_id(node, of_port_id);

`of_port` is never released with `of_node_put()` on any return path.

> +       if (!of_port)
> +               return -ENOENT;
> +
> +       for_each_of_graph_port_endpoint(of_port, ep)
> +               num_links++;
> +
> +       clks =3D devm_kcalloc(dev, num_links, sizeof(*clks), GFP_KERNEL);
> +       if (!clks)
> +               return -ENOMEM;
> +
> +       link_ids =3D devm_kcalloc(dev, num_links, sizeof(*link_ids), GFP_=
KERNEL);
> +       if (!link_ids)
> +               return -ENOMEM;
> +
> +       i =3D 0;
> +       for_each_of_graph_port_endpoint(of_port, ep) {
> +               struct of_endpoint endpoint;
> +               u32 hw_port_id;
> +               int ret;
> +
> +               ret =3D of_graph_parse_endpoint(ep, &endpoint);
> +               if (ret)
> +                       continue;
> +
> +               ret =3D of_property_read_u32(ep, "mediatek,port-id", &hw_=
port_id);
> +               link_ids[i] =3D ret ? endpoint.id : hw_port_id;
> +               clks[i] =3D devm_get_clk_from_child(dev, ep, NULL);

`clks[]` and `link_ids[]` are populated sequentially
(`0..num_links-1`), while mtk_direct_link_config() /
mtk_direct_link_clk_enable() etc. index them by `comp->inst_id`. If
endpoint `reg` values are sparse or don't start at 0, this reads out
of bounds or hits the wrong entry.

Maybe calculate `max_ep_id`, size the arrays by `max_ep_id + 1`, and
index by `endpoint.id` (with bounds checking), or look up the entry by
`endpoint.id`.

> +               if (IS_ERR(clks[i])) {

Early return inside `for_each_of_graph_port_endpoint()` leaks `ep`
(missing `of_node_put(ep)`).

> +                       return dev_err_probe(dev, PTR_ERR(clks[i]),
> +                                            "Could not get clock\n");
> +               }
> +               i++;
> +       }
> +       dl_port->clks =3D clks;
> +       dl_port->link_ids =3D link_ids;
> +       dl_port->num_links =3D num_links;
> +
> +       return 0;
> +}
> +
> +static int mtk_direct_link_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *main_node =3D dev->of_node;
> +       struct mtk_direct_link *dl_async;
> +       int in_mtx_id, out_mtx_id;
> +       unsigned int num_ports;
> +       int i, ret;
> +
> +       dl_async =3D devm_kzalloc(dev, sizeof(*dl_async), GFP_KERNEL);
> +       if (!dl_async)
> +               return -ENOMEM;
> +
> +       dl_async->data =3D device_get_match_data(dev);
> +
> +       dl_async->regs =3D of_iomap(dev->of_node, 0);

of_iomap() returns NULL on failure rather than an ERR_PTR, and leaks
the mapping on unbind. Use devm_platform_ioremap_resource(pdev, 0).

> +       if (IS_ERR(dl_async->regs))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(dl_async->regs),
> +                                    "Could not get regs\n");
> +
> +       num_ports =3D of_graph_get_port_count(main_node);
> +       if (num_ports =3D=3D 0)
> +               return dev_err_probe(dev, -ENOENT, "No Input/Output ports=
 found.\n");
> +
> +       /*
> +        * Get the Trigger ID for DL_IN_0 and for DL_OUT_0, as all of the=
 other
> +        * HW ports have linearly increasing IDs.
> +        */
> +       in_mtx_id =3D mtk_ddp_comp_get_mutex_trigger(main_node, MTK_DISP_=
DL_IN);
> +       out_mtx_id =3D mtk_ddp_comp_get_mutex_trigger(main_node, MTK_DISP=
_DL_OUT);
> +       switch (num_ports) {
> +       default:
> +               /* fallthrough */
> +       case 2:
> +               if (in_mtx_id && out_mtx_id) {
> +                       ret =3D 0;
> +                       break;
> +               }
> +
> +               ret =3D in_mtx_id < 0 ? in_mtx_id : out_mtx_id;
> +               break;
> +       case 1:
> +               if (in_mtx_id || out_mtx_id) {

mtk_ddp_comp_get_mutex_trigger() returns negative error codes, while
ID 0 is valid. Check with `>=3D 0` explicitly.

> +                       if (in_mtx_id < 0)
> +                               in_mtx_id =3D 0;
> +                       if (out_mtx_id < 0)
> +                               out_mtx_id =3D 0;
> +
> +                       ret =3D 0;
> +                       break;
> +               }
> +
> +               ret =3D in_mtx_id < 0 ? in_mtx_id : out_mtx_id;
> +               break;
> +       }
> +
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Could not get %s port 0 t=
rigger ID\n",
> +                                    in_mtx_id < 0 ? "input" : "output");
> +
> +       if (in_mtx_id > U8_MAX || out_mtx_id > U8_MAX)
> +               return dev_err_probe(dev, -EINVAL, "Implausible trigger I=
D found\n");
> +
> +       /* IDs are now validated and safe to assign */
> +       dl_async->dl_port[MTK_DISP_DL_IN].p0_mtx_trig_id =3D in_mtx_id;
> +       dl_async->dl_port[MTK_DISP_DL_OUT].p0_mtx_trig_id =3D out_mtx_id;
> +
> +       i =3D 0;
> +       for_each_of_graph_port(main_node, port_node) {
> +               u32 port_id;
> +
> +               of_property_read_u32(port_node, "reg", &port_id);
> +               if (port_id > 1)
> +                       continue;
> +
> +               ret =3D mtk_direct_link_port_probe(dev, &dl_async->dl_por=
t[i], port_id);
> +               if (ret)

Pass `&dl_async->dl_port[port_id]` instead of `i`.

mtk_direct_link_get_port() indexes `dl_port[]` by MTK_DISP_DL_IN (0)
and MTK_DISP_DL_OUT (1), so on an output-only node (port@1), using `i`
(0) populates `dl_port[0]` and leaves `dl_port[MTK_DISP_DL_OUT]`
uninitialized.

Also, `port_id` is uninitialized if reg is missing, and early return
inside `for_each_of_graph_port()` leaks `port_node`.

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 75b3fd56d6af..4f39df23c51e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -804,10 +822,27 @@ static int mtk_drm_of_get_first_input(struct device=
 *dev, struct device_node *no
>         if (ret)
>                 return -ENOENT;
>
> -       inst_id =3D mtk_ddp_comp_get_id(ep_dev_node, comp_type);
> +       inst_id =3D mtk_ddp_comp_get_id(ep_dev_node, ep_in, comp_type);
>         if (inst_id < 0)
>                 return inst_id;
>
> +       if (comp_type =3D=3D MTK_DISP_DIRECT_LINK) {
> +               struct device_node *remote_port =3D of_graph_get_remote_p=
ort(ep_in);
> +
> +               /* If there's a remote port this input is active, otherwi=
se it's unused */
> +               if (!remote_port)
> +                       return -ENOENT;
> +               of_node_put(remote_port);
> +
> +               /* All even ports describe inputs, all odd ports describe=
 outputs */
> +               comp_type =3D (crtc_endpoint + 1) % 2 ?
> +                           MTK_DISP_DIRECT_LINK_IN : MTK_DISP_DIRECT_LIN=
K_OUT;

`ep_in` and `ep_dev_node` were already put earlier in this function
(patch 37/46).

Also, `ep_in` is fetched from hardcoded `port@0` and `crtc_endpoint`
is the CRTC index (`0 =3D MAIN`, `1 =3D EXT`, ...), so `(crtc_endpoint +
1) % 2` misclassifies `CRTC_EXT` (`endpoint@1`) as
`MTK_DISP_DIRECT_LINK_OUT`; this is always `MTK_DISP_DIRECT_LINK_IN`.

> +
> +               dev_dbg(dev, "Found First DirectLink %s with port %pOF an=
d ID %u\n",
> +                       comp_type =3D=3D MTK_DISP_DIRECT_LINK_OUT ? "OUT"=
 : "IN",
> +                       ep_in, crtc_endpoint);
> +       }
> +
>         /* All ok! Pass the Component ID to the caller. */
>         comp_def->type =3D comp_type;
>         comp_def->inst_id =3D inst_id;
> @@ -848,7 +883,7 @@ static int mtk_drm_of_get_ddp_ep_cid(struct device *d=
ev, struct device_node *nod
>                                      struct mtk_drm_comp_definition *comp=
_def,
>                                      bool controller_arch_v2)
>  {
> -       struct device_node *ep_dev_node, *ep_out;
> +       struct device_node *ep_dev_node, *ep_out, *remote_ep;
>         enum mtk_ddp_comp_type comp_type;
>         int ret;
>
> @@ -856,10 +891,16 @@ static int mtk_drm_of_get_ddp_ep_cid(struct device =
*dev, struct device_node *nod
>         if (!ep_out)
>                 return -EINVAL;
>
> -       ep_dev_node =3D of_graph_get_remote_port_parent(ep_out);
> +       remote_ep =3D of_graph_get_remote_endpoint(ep_out);
>         of_node_put(ep_out);
> -       if (!ep_dev_node)
> +       if (!remote_ep)
> +               return -ENOENT;
> +
> +       ep_dev_node =3D of_graph_get_port_parent(remote_ep);
> +       if (!ep_dev_node) {
> +               of_node_put(remote_ep);
>                 return -EINVAL;
> +       };
>
>         /*
>          * Pass the next node pointer regardless of failures in the later=
 code
> @@ -877,17 +918,20 @@ static int mtk_drm_of_get_ddp_ep_cid(struct device =
*dev, struct device_node *nod
>                         dev_dbg(dev, "Found connection to external mmsys =
%pOF\n",
>                                 rmt_ctrlr_node);
>
> -                       of_node_put(ep_dev_node);
>                         of_node_put(rmt_ctrlr_node);
> +                       of_node_put(remote_ep);
>                         return -EREMOTE;
>                 }
>         }
>
> -       if (!of_device_is_available(ep_dev_node))
> +       if (!of_device_is_available(ep_dev_node)) {
> +               of_node_put(remote_ep);
>                 return -ENODEV;
> +       }
>
>         ret =3D mtk_drm_of_get_ddp_comp_type(ep_dev_node, &comp_type);
>         if (ret) {
> +               of_node_put(remote_ep);
>                 if (mtk_ovl_adaptor_is_comp_present(ep_dev_node)) {
>                         comp_def->type =3D MTK_DISP_OVL_ADAPTOR;
>                         comp_def->inst_id =3D 0;
> @@ -897,10 +941,26 @@ static int mtk_drm_of_get_ddp_ep_cid(struct device =
*dev, struct device_node *nod
>                 return ret;
>         }
>
> -       ret =3D mtk_ddp_comp_get_id(ep_dev_node, comp_type);
> +       ret =3D mtk_ddp_comp_get_id(ep_dev_node, remote_ep, comp_type);
> +       of_node_put(remote_ep);
>         if (ret < 0)
>                 return ret;
>
> +       if (comp_type =3D=3D MTK_DISP_DIRECT_LINK) {
> +               struct device_node *remote_port =3D of_graph_get_remote_p=
ort(ep_out);
> +               u32 port_id;
> +
> +               of_property_read_u32(remote_port, "reg", &port_id);
> +               of_node_put(remote_port);
> +
> +               /* All even ports describe inputs, all odd ports describe=
 outputs */
> +               comp_type =3D (port_id + 1) % 2 ? MTK_DISP_DIRECT_LINK_IN=
 : MTK_DISP_DIRECT_LINK_OUT;
> +
> +               dev_dbg(dev, "Found DirectLink %s with port %pOF and ID %=
u\n",
> +                       comp_type =3D=3D MTK_DISP_DIRECT_LINK_OUT ? "OUT"=
 : "IN",
> +                       remote_port, port_id);
> +       }

`ep_out` was already put above, `remote_port` is logged after
`of_node_put()`, and `port_id` is uninitialized if `remote_port` is
NULL or lacks "reg".

> +
>         /* All ok! Pass the Component ID to the caller. */
>         comp_def->type =3D comp_type;
>         comp_def->inst_id =3D ret;
> @@ -1200,8 +1278,13 @@ static int mtk_drm_probe(struct platform_device *p=
dev)
>
>         hash_init(private->hlist.ddp_list);
>
> +       if (of_graph_is_present(phandle))
> +               node =3D phandle;
> +       else
> +               node =3D of_find_node_by_name(phandle, "direct-link");

of_find_node_by_name() calls of_node_put(phandle) on borrowed
`dev->parent->of_node`, walks the whole DT past phandle, and leaks the
returned node.
Use of_get_child_by_name(phandle, "direct-link") and put it when done.

> @@ -1273,12 +1363,45 @@ static int mtk_drm_probe(struct platform_device *=
pdev)
>                                                    node);
>                 }
>
> -               ret =3D mtk_ddp_comp_init(dev, node, &private->hlist,
> -                                       private->data->mmsys_id,
> -                                       comp_type, comp_inst_id);
> -               if (ret) {
> -                       of_node_put(node);
> -                       goto err_node;
> +               if (comp_type =3D=3D MTK_DISP_DIRECT_LINK) {
> +                       for_each_of_graph_port(node, port) {
> +                               u32 port_id;
> +
> +                               of_property_read_u32(port, "reg", &port_i=
d);
> +                               if (port_id > 1)
> +                                       continue;
> +
> +                               /* Even ports are inputs, odd ports are o=
utputs */
> +                               if (port_id % 2)
> +                                       comp_type =3D MTK_DISP_DIRECT_LIN=
K_OUT;

`comp_type` is modified in place without being reset for even ports.
If port@1 appears before port@0 in DT (not preferred, but possible),
`comp_type` becomes `MTK_DISP_DIRECT_LINK_OUT` on the first iteration
and stays `OUT` for port@0 on the next iteration (also carried into
patch 40/46).

Compute the type per port instead, e.g. port_type =3D (port_id % 2) ?
MTK_DISP_DIRECT_LINK_OUT : MTK_DISP_DIRECT_LINK_IN;

> +
> +                               for_each_of_graph_port_endpoint(port, ep)=
 {
> +                                       struct of_endpoint of_ep;
> +
> +                                       ret =3D of_graph_parse_endpoint(e=
p, &of_ep);
> +                                       if (ret)
> +                                               break;
> +
> +                                       ret =3D mtk_ddp_comp_init(dev, no=
de, &private->hlist,
> +                                                               private->=
data->mmsys_id,
> +                                                               comp_type=
, of_ep.id);
> +                                       if (ret)
> +                                               break;
> +                               }
> +
> +                               if (ret) {
> +                                       of_node_put(node);
> +                                       goto err_node;
> +                               }

Similarly, breaking out of `for_each_of_graph_port_endpoint()` leaks
`ep`, and jumping out of `for_each_of_graph_port()` via `goto
err_node` leaks `port` (missing `of_node_put()`, also carried into
patch 40/46).

Regards,
Fei
