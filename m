Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684697;
	b=yBiK7QCFf1B0FNP/23bcY4mjFjC25Y470EdFt536KfoyfB6Co/Ayh1fo7UqupjrHVB/D
	 FtXsNPb8H7qcZJOKeUHBd5j5B58owvsXwoRDq8e9BWiQ/nNpQ5jXD6beA/l+536/JvF3Z
	 dxb/gTsooDx35dx+nbDRyR35Qi21M+ZvBq3ZRjyccIjVQGl6NIzs63fdJhDKv8p7C3RzK
	 l1f4jy/cWBOld7kiJTJMooN+o6Hae9NNkQl0R1oNBmXhfeoRi3isIEBbV9EP6dJw0/JVx
	 /D0PQj0hBkeaRWctgHL2zOv4NVc8T323iE8jEJ6Xob8h6TTaVy37NkC+Ohz2qpVQfRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YJ7q/+GsupT2Rad40vkEUvwwqt01kPVk/F4EqfpxWnw=;
	b=sVg7BYFEBYZlc4QadCChh8SX1qfcsnKv5IoYYHod/1cHeyaH447Wc7mTXmdNutQkIBPM
	 XEyQe3nrnlXq7YolKE/yM74Al6d2rAa2r2ybWHvw8QllSUnBMLuzO0k7YcPOnirnW8+MG
	 IkN3cqW2tJI6Vti8T9cAD9o7eW1VwaD3YBM1ShfQH+8oXRIW+Nsq4/ZojbGamS2glOuTU
	 mkyokZiG4eUPl2a7Lu+ddWw+w7epdRdsCmDWjxAN9XLuhHqC9/CMCSJIb4aAskuEpU6nk
	 qT0RSJoUN7XJ6GLYDhZylPtUdRH96B+/70BjjlAH9WLkQXXgPJn/B2ACuMwJVKd2dgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="bp/4yue7";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12F2606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E12F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bp/4yue7
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04bea9a93so60210675ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795684696; x=1796289496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJ7q/+GsupT2Rad40vkEUvwwqt01kPVk/F4EqfpxWnw=;
        b=bp/4yue7PkPucCAj28NQbm164mWfzuDTMNGpRUfpIn69MhtWFGj3oBqEgNKC6DWPoJ
         BKXGB0UXunApw+2f0Fnc/mve2g7UBUxpg1p97eXO64feJO2EO9Cfi8yDpMMx/3y9kpgt
         H7rMcOAKR+b/zg+hG4kkdH/czD9VbPs1YvaNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684696; x=1796289496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJ7q/+GsupT2Rad40vkEUvwwqt01kPVk/F4EqfpxWnw=;
        b=ox49J6H+jESlzeUZEgeTHt6u2fyjHSGINxdZX0gCMVyxlxbkvsPdHFdDE9Y8pRsrCA
         55XQboxf2IVqyMDVfKGwUr14PaWgaxcx8G1RaOuxkE3sKFbsGwQKAbMdDUS+tpBEs5WU
         lbGUpr3KeOHqTz5OpPzlH0UTCKwJAxo0AOx++2vCc9jfoVFOgvcGtui6l0EjMLoZy04u
         31mb/geBCPQA27Lk9ns94FlCgy4cacmM0fh7CRC/bF6JjZILW36F/AtzCtCQKqZg6JQ3
         sUNtuGewJ5UdPv7BVGQBMPS3KrdjP6z+uTHxht3gZsZqNNKh8+bQ/WqO09XAHb3FNY0m
         FZQA==
X-Forwarded-Encrypted: i=1; AL+hErGrtdIvoDDNkYS8gABTWp76xMi+ccZty1pQSu09j5dYMvz9d4bSR/Arf2SsETc4TzywRkDhKWm6awkGZhg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eRIbcccpBwJYUMNioTq72PbG2NXgIxqLAJ5N8bHhIVFoKXiS4
	2+5mPONbDN5vDy2wZ0uwPiHatqMBSmm6xY2jhmDUJUaNLluHIC6OZjWrRdlxXKWzx8du67K/No2
	5u4E=
X-Gm-Gg: AZFdTZcLtohviCI2lkW+Gz3gq7hRAsSaA6aJrQNZgOcOwMUBKTATPUMoNzN+gITjs1y
	gu7V9lvWr/L/Za4AQ3tsxL/qQ5QYxCpNfH0lP1/OJSaaIP/xzy/Yw8XucvcBjDLtZw0JEMLLMq/
	1cvpyTof3SXc0VzS/SG1ygq5H61//RA2dXxxw/2iHIBKldJHvxbpI94j//uIF4FrejULk5o3j0d
	r+nVNWK5NB0ZpI4BrGV6zee4J9Ml2XtNnwcfWMcSLJmfHs33ikmHkAms8BMRV+VqPdzssUeu2aW
	+JijEUCh1MBCkFvhCFuu0K2DtttyBzroQJ6eSf3QS4skGMbO8SQ7yN/ZVsQj/qRQLLKe6KdEehM
	7rM3WnJwqai7h6278a3LSfyTaUULeHOf/BojOI34ZzwLJqGeFZInUZ695aJVQM1yF88MFDH8hwc
	Jl7gJpYPZhivW9sS5IA06a27w9s98kdn8kqyI89wnMTAC7eTmPUJDG2zznoagMm4JDiThNsKUiy
	2IiofMw6vPPuH3I06k7BggKHWdmwVRWO7lPRvRXisOPbcJqDsUaVnDl3npJMGvunhLBW3iUi6OH
	elAUreB1aUAhrzzzgbiMu8OxxTqCW8rxkq1pcVUgau9oFR8rX71tqZXspzF7Y0b6PMnysj14v5d
	OJ4oGScB5/Fmr
X-Received: by 2002:a17:902:ec8a:b0:2f0:446d:30cb with SMTP id d9443c01a7336-2f0446d312emr219517545ad.15.1795684696292;
        Thu, 26 Nov 2026 01:18:16 -0800 (PST)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee85466sm98698785ad.4.2026.11.26.01.18.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:18:16 -0800 (PST)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so2092183eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:18:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF8oJET+PkDhbe4Yv1WeKUNhYXvlfd7B/fDydZnZeM1InNrkC9JuxTE/kONzwKur4INx81cJTg3J8AtLtI=@vger.kernel.org
X-Received: by 2002:a05:693c:8859:b0:386:b826:3f9 with SMTP id
 5a478bee46e88-386b82605b9mr10045446eec.7.1795684694765; Thu, 26 Nov 2026
 01:18:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-23-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-23-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 17:17:37 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhLFoHcCCPT8KzfeGR=_FE_-WXXjttWL8N9j5RyXdbdTw@mail.gmail.com>
X-Gm-Features: Aa3M54qPRICfCIh7RUjjGiJ_0TC4b-0YY-WXywPDgZZ0L82ERU6OYtXByrL3V2k
Message-ID: <CAC=S1nhLFoHcCCPT8KzfeGR=_FE_-WXXjttWL8N9j5RyXdbdTw@mail.gmail.com>
Subject: Re: [PATCH v2 22/46] soc: mediatek: mtk-mmsys: Migrate to new
 Multimedia DDP HW indexing
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
> The mediatek-drm driver is ready to switch to the new Multimedia
> Subsystem Display Controller HW indexing.
>
> Perform the switch by:
>  - Adding new "from_comp_inst" and "to_comp_inst" members in the
>    Multimedia Subsystem HW Routes structure (mtk_mmsys_routes);
>  - Changing the MMSYS_ROUTE() macro to use those, which performs
>    the migration of all SoCs in one go (as all of them use this
>    macro to declare their route entries);
>  - Adding new mtk_mmsys_hw_connect() and mtk_mmsys_hw_disconnect()
>    functions, making use of the new HW Component Type-Instance
>    indexing.
>
> Unfortunately, this change needs to go along with the related one
> in the mediatek-drm driver, otherwise functionality of the Display
> Controller will regress.
>
> The only way to make this possible in two steps is to duplicate
> all of the routes structure arrays for all of the SoCs, which
> would result in a total of around ~1200 lines changed twice, and
> that ignores the big increase in size for this driver during the
> migration process so, in order to avoid useless bloat, I opted
> for an inter-dependency between the two changes: mediatek-drm
> and mtk-mmsys.
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/soc/mediatek/mtk-mmsys.c       | 99 ++++++++++++++++++++------
>  drivers/soc/mediatek/mtk-mmsys.h       | 15 ++--
>  include/linux/soc/mediatek/mtk-mmsys.h | 16 ++---
>  3 files changed, 90 insertions(+), 40 deletions(-)
>
[snip]
> +void mtk_mmsys_hw_connect(struct device *dev,
> +                         enum mtk_ddp_comp_type src_type, u8 src_hw_inst=
_id,
> +                         enum mtk_ddp_comp_type dst_type, u8 dst_hw_inst=
_id)
>  {
>         struct mtk_mmsys *mmsys =3D dev_get_drvdata(dev);
>         const struct mtk_mmsys_routes *routes =3D mmsys->data->routes;
> -       int i;
>
> -       for (i =3D 0; i < mmsys->data->num_routes; i++)
> -               if (cur =3D=3D routes[i].from_comp && next =3D=3D routes[=
i].to_comp)
> -                       mtk_mmsys_update_bits(mmsys, routes[i].addr, rout=
es[i].mask,
> -                                             routes[i].val, NULL);
> +       for (int i =3D 0; i < mmsys->data->num_routes; i++) {
> +               if (src_type !=3D routes[i].from_comp_type ||
> +                   src_hw_inst_id !=3D routes[i].from_comp_inst ||
> +                   dst_type !=3D routes[i].to_comp_type ||
> +                   dst_hw_inst_id !=3D routes[i].to_comp_inst)
> +                       continue;
>
> -       if (mmsys->data->vsync_len)
> -               mtk_mmsys_update_bits(mmsys, MT8188_VDO1_MIXER_VSYNC_LEN,=
 GENMASK(31, 0),
> -                                     mmsys->data->vsync_len, NULL);

The refactor drops this vsync_len register write block, leaving MT8188
VDOSYS1 unconfigured.
Is this intentional? Otherwise please mention it in the commit message.

Regards,
Fei

> +               mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].ma=
sk, routes[i].val, NULL);
> +               dev_dbg(dev, "Connected %u-%u to %u-%u\n",
> +                       src_type, src_hw_inst_id, dst_type, dst_hw_inst_i=
d);
> +       }
