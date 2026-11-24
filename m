Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530821;
	b=xt8Nz13rCiPTcbso8ZiR3GHikn7m2Hfoe8UM+fTqUy8mAcTAqsCr7Aopn1LfC8KthYB5
	 EBqFmX55bS1ffHDnNy1fr/6DHJ/AhBiI+VWpARDJdCx9s0dFEus/eLRNQl1JbSf4LSq41
	 /PFsu662j+T+mxCbLVKeDrdoXhL8BUEHueZOeY+hI8NuXlu1MDmPoRU252DT3umrj8gbx
	 WtVka5tl1Q7aiNdgk0FRJkayXAEAdloS66BhlHt9XSyuMuTjjem2zsZLbCOIQlcgAXxQs
	 nWaNDryPDb663DyQ8N0JznGJ+KEAYUIVLsmhoJlbOaB7iI13vcMfOjD7nsvxi7FqFgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=;
	b=EadnUHW5BMKpuXLlBwd4ecYI2dL9qDz5uOt6nxo2KTh3do2RO+n3Zm3zEuIavz83JVek
	 rVJ6koodYkgkK+LFLFtcjkCeFQN1EC4ts5OrhT1b3FtCv28XvDyIp0M4K3WZZ7GQ6PTv/
	 SdW5YqekRonMLsy9ygYzSDw6qZJ9l3GZ5Bed01dRjRi5mKevEaLWqKxXaChdPHC8LJThu
	 P4/WQ2dUvHwJ8+GD+IIpuLV5k3KoRyJnY7dDVBd2eXYaBXJ4YXkA1ZPED15ScyLp8bRT/
	 I8uPEiJE2h3NkPNe/a2C/W49gGC8fqGQdaRBxESyKwHhHIgKV7ldXbZqNQdoF0GJK9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=NTI3g5Hn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345D8606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 345D8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=NTI3g5Hn
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2327751a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:33:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530820; cv=none;
        d=google.com; s=arc-20260327;
        b=PWnBoV4GeUcfQ8naeIPx877F+j7oO41X+awPUedJA180q8fF6BHJYWtKxKw+zI8d7R
         cvG/+PF+3KpmnR/xtA/fCEcgD0uMU9DvVqabUxqt86Pp5QDHY+rpG1in6E9O/ZJF3GX3
         TBwsbBYMEgt+rBm4WRZo8BYoFSHvMuqkyBUTK8ZkKrI1u5Rwnu5VNHl53XGx+gp+SKWp
         JUbfp1bhSbpEUWgeUjsyTc82Dxj2xd52yku/HxdFnkSaMl+kwqxCk566+H4MmXeVe0bm
         Hl+2mMt01J8YVtLef2VUdG5KphEQxTvFerFMoh752aVc8yQ2HtN8SGrKjRReYtykLPii
         WNkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=;
        fh=ArFuTHQQYJ1D8ADrPcyXH1Ze0AQh2E7T+q/vTk817Yk=;
        b=eX34bHT1veCQhHyWWu74qOfyx+CbdaxA7VecNU8R36ZeSJSvaNKJMLo0iUZ/9hfLHX
         ZhreXZu617H0iGY7rY4JDf44l1JSrybB8alhl8I7U0wDOMCuM/dFfHyRah20Sa1RimBp
         O3hTn8oI7KKJDU/AEku0O3quWZpX4pBeo3+y7GBSOy1PqyHwI//qFBOApsDBoTND0MJp
         S9EhaLrV0rlbKYGk01M4ekETCWjtXaE/nRj2TI2SL2UzaozpkJJ1TNGcw8dXV/dsn4dM
         BWKKwpUKtdlzn3ZiW817eBd2wfFleDYOp7y7aiiY9cYyWE5pNUGrOJii66iAw3/+lC65
         Ztqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795530820; x=1796135620; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=;
        b=NTI3g5HnwmY3QU092sHAKzcVOSZSiwWeh5F9EjH8JInIwlai1kHmJyvo1SbJ0BSwiL
         rCQoOJWeb7M687ssSIStp4KyeYdwJqMnVQgBsYISeeYYvIHbQgtbrqYpuKp5CrJd8ElO
         XhgrEVmaCGNI+F4OZEIawA8+zaxINkqJmLpmrpT/MvzlZLQVg7TdsdaC/j/5PeG6mTJ6
         7mi3Fqon7RbZb01Q/nnHy/WUdrsjEs9mxILoBbUu7E8zhxUQ+1pGKysNrOkgM8RdWfNW
         1WqP6y4qCYsNmU9K+J5nCYFvUJtEOT4w8CvmSRMhqApaNlFiYUwl40CPrAwxoJAdEB5Q
         9tIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530820; x=1796135620;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=;
        b=umMQG0+6eDABnakPxI3m/cIaHIEYMg2phnDeG9Qdkp9x46af2ofSoDHl8IsnYA9t+Q
         d1qQiZoIXx9/FIeZiqiNi8Qay73ZQVnE/6sSWBCqHv9x/Qsvr0fXrqOnWHa2z6B+hT5Y
         3dnchWMLGPLy2A8me+rHU8vIPeh7CvCS9tfDMHRAOMrAwQau2jBrQFDiFwzbecQ3Fn1O
         J8HZb0TNyMIL8xFogDN9GUuA4XGqRkKvvasZvO/3k25UJezPdXe3VEWQv1JSxpRcBp8m
         WqQreghxwRZDSoiq5rRk0VC1ho6Gt2yYTZkS48g2xkLc9V2ojDBW1KsSUeFLf56qOP4J
         dliQ==
X-Forwarded-Encrypted: i=1; AL+hErFvK+cgJK3YN90cXlkhPdLPHCZlMD2jOu7u7lcB+F+NlsZnmj15yC0n3U/A0TayG47sSByKtYqIBY7Mkvo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cOU6yn75ERuQzGndwQFF80Cb0wmRLT/7i6niHkZuiPV/q/qHK
	of65ScXZqx12AorkuueJSoOJP5qJVwSqpKkvf1aKZRAHh2OnYOvRQB50Jx8pZ7fO0Jgkje8V/Mh
	JRYImmlob52FqQG1RFDutEpxDtBN2pVAaLXpMZsziTA==
X-Gm-Gg: AZFdTZdfxXDi/BCtn4pig550YOF0S3jZTQxmm+kzjqy+N6jpB/8n4p9MW6nUfSIJCO2
	mV3W4xvkllyvhMItageRKQxNMIn3EgLsmbb9T0xD37FtaeKiERxIkr4glqB1ARaz6Chd2DxKAiT
	7ckU20hG15TNXUwBYoC+dRW6p9p4lwu+5mEJzrvwOeq4bYBMDh0AVdlungEyJdUxnUTV+vEGmFV
	Datf9lWImLCk2VB4jSakRLdvBov8RgkzuhQem14HcW/5cetX4W5wxa/+T7hqEiNH2Mw2fpsCde8
	1P4q4P8CXULxXLjL+TemDaQ+jd06sbKCjvl2dZSpRnCTmQvZhIrQC7wN9Ra9Ea3jeAECj8JKMY0
	OmRBN0VvoRFU0ieHkdfQuyvubkroHZJnh0g==
X-Received: by 2002:a17:90b:2f8c:b0:3a2:b16d:928b with SMTP id
 98e67ed59e1d1-3b41c95aec8mr12847695a91.46.1795530820492; Tue, 24 Nov 2026
 06:33:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-32-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-32-angelogioacchino.delregno@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 14:33:29 +0000
X-Gm-Features: Aa3M54oxOcYmQorjTkd5D-GkJnjfCGVao0VGN1bH7KpMt9eEOWMLLFoUmIq_rhA
Message-ID: <CAPj87rMW6c0BMELjn70vsc+mkMxegDbSgQC-8BEDGspFyxzW2Q@mail.gmail.com>
Subject: Re: [PATCH v2 31/46] drm/mediatek: Add support for Display Layer
 Blender component
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hi Angelo,

On Tue, 14 Jul 2026 at 12:46, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> +#define DISP_REG_OVL_BLD_L0_CLR                        0x20c
> +#  define OVL_BLD_BGCLR_BLACK                  0xff000000
> +#  define OVL_BLD_BGCLR_RED                    0xffff0000

We probably don't need a #define for every ARGB8888 colour tbh. :)

> +void mtk_blender_config(struct mtk_ddp_comp *comp, unsigned int w,
> +                            unsigned int h, unsigned int vrefresh,
> +                            unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_blender *priv = dev_get_drvdata(comp->dev);
> +       u32 val;
> +
> +       /* Set ROI for this Blender */
> +       val = ((h & GENMASK(15, 0)) << 16) | (w & GENMASK(15, 0));
> +       writel(val, priv->regs + DISP_REG_OVL_BLD_ROI_SIZE);
> +
> +       /*
> +        * Set both background color and constant layer color to Opaque Black
> +        * (ARGB) for eventual Alpha Blending to be effective
> +        */
> +       writel(OVL_BLD_BGCLR_BLACK, priv->regs + DISP_REG_OVL_BLD_BGCLR_CLR);
> +       writel(OVL_BLD_BGCLR_BLACK, priv->regs + DISP_REG_OVL_BLD_L0_CLR);

Would you believe that this does not in fact need to be black, as it's
been configurable since 4c684596cde4?

Cheers,
Daniel
