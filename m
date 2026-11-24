Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530642;
	b=0dZDZ0Whuwe4UCGyUTmPYp65mBPpKhSMmKueSVzEYcA/JXdBUMxapR5/nbynA7LRzmL1
	 OioUb/VKhSxKcdeO7wTamCm+HnL1xmVvlc7WOizjy5derwPKPNw8iuHQ0QgXd25a8BpVn
	 tfBIAN+x8XyGNoERuXYQfJLTTFiKfIx+/nPLl+2F8NdsEvVK+FTPG7p7j6dgZ8H3auRtF
	 WhQCggAxUFMUIkqGFZDFpyGEUxwXAEZWWKHALgdpm4STGQp4DjzaVU0WrxYq7VFL+lY1k
	 OilAtKeZUP3yvyJwsh8tqIBh9P+ZTuWsW1FZ2oZO8HNLjQnaaf2bjLxwr50oeaw53RQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=;
	b=DBGJid/Zls/0m1KMrL94kMtDxXA/YTAnQd0FdHwU1sMWJ7GKvQAxnN3Pt9gCoAbmDfUs
	 6cA7zsZRgY/jlwMErOIgs7fyNw5cdQzTGzJzY5REpXK6uwIdi3t7SPv2Di7sbv2i4+rNB
	 yWKDEehFBJBof7BPKKLWMFVeJ75Z3LGdQHRlDCIg2NuD0xGsa3AFh0KB87R3B1VFXlb3q
	 Zwi9+uZpi6zVAl2cTK3sZuK+9hn1jr+PHQueos04Q1q6zbjQosOImcDuy5ld4eUELhluY
	 qA0GlqO8QkyT81DLGyehUAC8YG03VhHmCzRndg1d2BN+LvwKNhM7hYcJyhkMSaf7oOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=FkZP0FZ7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399FF606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399FF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=FkZP0FZ7
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so1772367b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:30:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530641; cv=none;
        d=google.com; s=arc-20260327;
        b=dLO7FLR56xS7h3MK21A3uAQ17dVKevgdiQCXtRnKp0TSmAL7a/y5Hw3GYGuOU/iA4l
         eP8m+zUDGm6CcbghMHgl/Apc087D+AKOUGnhvylsF351zSF9S9W8BBBjwCdRLFDbemAn
         0u3zrJPgr2ijN6EjXrOAH5dyQMhKJnZczonOqe+IvN3+8JJMUbiBfPW+FlGdyg4O6bY6
         U/oKYTfjAunN8k/BaczWtJALxSckyCAZmmraCf4smIpzvJHtBxCm46iXcQI9sixQtA/Y
         IAJMM7ttcxQGrSNyRcry65IrdCTx59zrmmrKxzbzSRZy3xV+351tAlsudcn4rWHKVYLf
         TtBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=;
        fh=mXF7wWoixFNPqjjQcKJu0TvTqjFHitn5/B0B7UIL4XM=;
        b=tAYSerZXZLR/VDIIuUoG2nTOtAYROqIKu5uWMe4aatZDKJ17cXCjRUwUMfn3has0f+
         k9dhxRSyR9XpUzLZAjd293PLl+Jj37EG5+L3/XmGr2BrCHrkRfLbkHJJOKe7PwqtTy5H
         U8EZE7BJ0Rt7xLF/LTmjdIoklv/RGegDHTFOmnO+FqFWmc0/32dXesJZC/suHE4nmRg/
         iPQKIUOLbw+UdRRY2VphBSKOGJMxLPPmw1xYDQO0XkYG1/nuwaYNJMXjDvvPzBAsJLlt
         x3W3mjJ48QYYplI4OYjex43VW6SKGBWanmz3DLauBtuosFpTM1VBEh8u1mf+xVAIOmr2
         zwgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795530641; x=1796135441; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=;
        b=FkZP0FZ7Nx4zOaygn8gVPi/OZg7d/o7JiO1MoX8zDpOKgdv9zSmiUoUR6J4jXlKC+e
         XljHyz/hUv+BG58ShWXPZCSok0QeHKhWL3WI+/soU7Pcw0KsTvsdQRXVt2zpzxYUEKB8
         vJgZysuGB7EY2DRLKCBKKab+qEKPWqXFlVXp0UvJtN4aRrwdBFRK4IdEXVCJsp5onll9
         ueSDCAJix6XoBYo6RseohzEXhgKWIiFhVM1AKAubC5ab6EQ0ksErIf3JEcUbPhpYdVay
         sJl45Wh8VUEm/C5Y/bAHIWLbGrTv5xnK05fsWc6neGgFrIKaV40ZR5PruK8L8gWj6dAK
         c/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530641; x=1796135441;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=;
        b=Q/WmtEJCU6N3J037mIqw6PEL3wvUcvCbJNG3F5qFNdV45vLBh0cFck1+9+DpwhEyvy
         SFOEzBZnHA50dk8eUuKNU5+/8yzYMb97PVQhsrvuC1BNh2H40R/bhFTOjwmcnGev23f2
         +hXx2CxTFRCQqWQSiyyvYOHT8C/7MW9dHbXLi7AHv3nO9cEezePtsMz7JCLPEOJsRzs4
         LmkRxepUEi9oegQn8IPfKSQbf1hQdQyP+0Hm/vj0YtE7zz7ezDR8hbrFa/7pyceiLcT8
         RLSMlD5O3uX1o+DFP02+0xiPHEukiaQajzXa482YXFNK1Naetf03Kwml6G39FKYd0Kdo
         F7rA==
X-Forwarded-Encrypted: i=1; AL+hErG/uXp2cXmfTZSqLxvYxCNqEYnnpXxYgD82ZoKX464nmHYPnSGmRNdncpX6veACg068cfUlNctf6RlYOHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BodMCxXmlpQVgIJEuE+88jZeVk7TavClY4vs8/PrwTnnKOo9f
	I7zsWykbZMfCALEVfNGJNdMELw+sA8iRyU2Eu7tLQzbIXHaNbB+Fgdn/GVFUmPLdAoBhyXO6R6i
	H82pCJUB9uE0KqfzGT5Z//FXO58ph1Ujyk6Sj5JgWVw==
X-Gm-Gg: AZFdTZfEeUBclWXO6ykQyvRT6z67B//9HBLjIKladFU7KZk0cC7HrcFXKrf0dnHISJF
	MxzCBjpziw7Uu3fxepklxi3jGVzz18Vf8CRMrLvTzpTsMTXkGjKe3opKzIcDU2FC6D/jMpXrXiL
	0sUTKttNR6cLk9mWiep75VVyOCs26JCtOzR6OrK60dfq/t1Z22NPWtJm8+L88/GSPqDwwCGlsfI
	bJkwaV7ha+LaRwb+HeoGvcLyedcUqYTpZBsm91FJQAusISGnQ7ySBwb+X1uYGWjN60haZ+l8Hkz
	X0fU37bwyCK3Xd6fbF3sDZKSK024DbveRXQRc9AMyAW5JlFL+FB8SDufy0TNRttnauDQxol4Gab
	UHmU1HDYpDnl6O6Z6Z5pVFjbfkCT4qkd3lw==
X-Received: by 2002:a05:6a20:2589:b0:3f9:797f:3869 with SMTP id
 adf61e73a8af0-4014d359938mr14437260637.47.1795530641542; Tue, 24 Nov 2026
 06:30:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-4-angelogioacchino.delregno@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 14:30:29 +0000
X-Gm-Features: Aa3M54oeKn_H5KtwYJP7Cgtm4lKr9C1ncfB30nHv_jvzqMcIUhZDyb3veHGchVg
Message-ID: <CAPj87rOEtG9JqJsEZkatqrWUkerO9Xx93MBUrXXChJwCokE0Vw@mail.gmail.com>
Subject: Re: [PATCH v2 03/46] drm/mediatek: Export OVL Blend function
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com, 
	Paul-pl Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

Hi Angelo,

On Tue, 14 Jul 2026 at 12:44, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> +unsigned int mtk_ovl_get_blend_mode(struct mtk_plane_state *state, unsigned int blend_modes)
> +{
> +       unsigned int blend_mode = DRM_MODE_BLEND_COVERAGE;
> +
> +       /*
> +        * For the platforms where OVL_CON_CLRFMT_MAN is defined in the hardware data sheet
> +        * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB888
> +        * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB8888.
> +        *
> +        * Check blend_modes in the driver data to see if premultiplied mode is supported.
> +        * If not, use coverage mode instead to set it to the supported color formats.
> +        *
> +        * Current DRM assumption is that alpha is default premultiplied, so the bitmask of
> +        * blend_modes must include BIT(DRM_MODE_BLEND_PREMULTI). Otherwise, mtk_plane_init()
> +        * will get an error return from drm_plane_create_blend_mode_property() and
> +        * state->base.pixel_blend_mode should not be used.
> +        */

This hasn't been true since 9813e158d13d. I know this series predates
that, and this is just existing code, but it's another instance of
'lie to userspace and fix stuff up behind its back' which we should
get rid of ASAP please.

Cheers,
Daniel
