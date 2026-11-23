Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448998;
	b=PjDrYdZGD0XiNOrpr2L84asH3tfrqP2xM1/gFa1g5CJD6yHPgsOLWq2wQJJFpPVILsmg
	 A87ixo/hI3gMuHYDed7j+lB5ZQhQCJn+PhOR7taeEyjwk9DjUBdVBBPo8wzkKCwmePYdW
	 JznsAeynPHv0rlmrjrwTDh9vEjX5ByfjN11wOPE14ZwEsoornjHaKftJcqO+lJvtjjXBi
	 flVrpJo5zRdxJhOZYZNuTGwj+9vgyXg7CtwoXfl9gQgqrNkplXDg6mHWJK/OSh9BuZy2V
	 Puf9Hfjxgmpt4DgeMaYhBuQyHoLV7mLmqQB/Dm8L04+Kmvgfa/gWI2mefS/HDe5yEfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448998;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SCQzlcbNwCmuhr5iFrK9gJq6siqjEJF99ctxEcILNVU=;
	b=eVWi0Pas0f3aY3nXfTURBReWqSINlcGbJUlL2PANne+x/E68F9GFP1EdUtatc2KXADAV
	 +u8OVQX3v3WF+xzKyK3kbz6AQ0orSIRjAvGw5SZKSL2/zRTYYfCEEE4aLQmTKBGL3GgHs
	 vRxdM+tOCDgFiG47EYD9i49LmRZJHeMK4vJcZLjZ8NvOCwIFy8kgO2qVrDPM+WXRktOJR
	 UfcrGBnRd7o6YrE1gA6/pWWAu3r4X1DgOZbJbvPAdCiB4BU5Vtc43nBMdUgL8ngSDLd4f
	 c9YlZD7zssPcG2BpJOccxTrAf07YxS32/jkBgniYftO+CpqOnEGFoZ6rm6VFXKb+DQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhxF28VO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1887F606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhxF28VO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D731F00A3C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448997;
	bh=SCQzlcbNwCmuhr5iFrK9gJq6siqjEJF99ctxEcILNVU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FhxF28VOIx6y+hROoeNp60dLhhrLpae7rXzvw5rF7qUHPlYBCLyMDNMQrcWOhiw+K
	 JOho/jbZlZPyi/MQG4qrbOTx6O2AC+OlL0ImJHsNE0LlHpxtBfDzhLu35Yc3hfleS2
	 ihgiKn7z2XWHEBsgVwvIEcniBlcJpVjzCmrj4zEmHNqUfPvlqH3QNhxNUqR4e/eo3H
	 h6lnzAzDOV+cx6KIn2xsrZSX3gL8aAGSYVRRpmSdUv6WOpi6ANFIcZ0ulo0yf2is4j
	 URk3Qs2PoDSTaxmIQ3BmGcwDoC8R99MU4xDeAYvMS3AV/kqFPabpp+UfMAigDS9p7q
	 wXQ2sWK9pU6yg==
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-380c28f9e35so4566215eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:49:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGK7ynVbQnRkqub6dqgXiqEoYPrFlFnZXo6yzdelJGhCmP3pUiuxe80ev3s6Ln3Wqiv+wpnAF8+Zd5wV6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/odU+XwA3/081RpKi27nMT11p5HflNbLuzyEvrtL3o2TED2RYq
	Lcoyb9xl7AzIXkPrmmHbgFbTuF9wk77anfhDbvJikXWP11tuC2quRb0JHWpheVHkbAA564XolYg
	agXIJvp4gCV85ikcqqb5bY9AneKivfA==
X-Received: by 2002:a05:693c:8943:20b0:386:af00:e9a6 with SMTP id
 5a478bee46e88-386af00eb48mr3600530eec.2.1795448996995; Mon, 23 Nov 2026
 07:49:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011004248.1117649-1-agentzoan@gmail.com> <20261011004248.1117649-4-agentzoan@gmail.com>
In-Reply-To: <20261011004248.1117649-4-agentzoan@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 15:49:44 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8NSXSj64NBQN11kLs1ik0YXWH1FZ5gzJtzWYNEozQ7Lg@mail.gmail.com>
X-Gm-Features: Aa3M54oYdPL6VD3WqMQ7QRwBmptZ5_Vy6FcQra7b4AqYYR8h27_8PCC_wigfSRA
Message-ID: <CAAOTY_8NSXSj64NBQN11kLs1ik0YXWH1FZ5gzJtzWYNEozQ7Lg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/mediatek: mtk_crtc: Pick the connector route on
 every CRTC enable
To: zoan37 <agentzoan@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jason-JH Lin <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Nathan Lu <nathan.lu@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

zoan37 <agentzoan@gmail.com> =E6=96=BC 2026=E5=B9=B410=E6=9C=8811=E6=97=A5=
=E9=80=B1=E6=97=A5 =E4=B8=8A=E5=8D=8812:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> mtk_crtc_update_output() only picks the output component of a CRTC
> with connector routes when connectors_changed is set in the commit that
> enables the CRTC. But connectors_changed only says that the connectors
> changed in that commit, not since the CRTC was last enabled. A connector
> can be attached to (or moved to) the CRTC while it is inactive, and the
> later commit that only sets ACTIVE then has active_changed but not
> connectors_changed:
>
> - If the CRTC had never been enabled, the route slot is still NULL and
>   mtk_crtc_ddp_hw_init() dereferences it (mtk_ddp_comp_clk_enable()
>   and so on).
> - If the CRTC was driven through another route before, e.g. a CRTC
>   shared by an HDMI bridge on DSI and a DisplayPort output that is
>   switched off (DPMS) while the monitor moves from one to the other,
>   the pipeline is set up for the old output.
>
> update_output() only runs from atomic_enable and the lookup is a short
> loop over the routes, so do it on every enable.

With modification, applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capab=
ility")
> Assisted-by: LLM
> Signed-off-by: zoan37 <agentzoan@gmail.com>
> ---
