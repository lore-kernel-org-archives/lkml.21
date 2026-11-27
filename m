Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781866;
	b=gnuuiHHGT3pTWL4CgIYN2JkigFFODcmmplPzCtCa/gmqxCBNmoWJQQJ6jIH4jjJs9uu6
	 koW2TmRTLGCYrK6+YWxl5Xp8usyDFsBtJhZSbeNbyh2UdpWN9fiPVgCQhOoaKQ3wpj7nC
	 yZryINvmkC43j5Ch5P2mz+GHTuLHhyIBm2OJBpFN4knUm17/EC3IDy3je0plLFfM3QxCq
	 6yDKKLf54mHK2Y38+jn2JUIxr29WkNtVtYr0+v5r/YxFO51bRDbigpiwGzs5jF0Hmw0Ss
	 3d8BR3Aiqdakh1PYSUaG0IytznGtdaHmRH452j8Efv58VYPmIynVBGZE7tzD0kxbybw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CwowVZ3rKUKS7aekHm2EGIj95zoVj8ccIVxOo6VaL1E=;
	b=b9iFuM54eG/E7Y0Sahmx1lIMByIY3iheMQYOaCZPXerC1Co594JZe/Uf4/B66jCww5QO
	 uV1mKQbYuZPvHXN+yvbZ+zIN8YPC32KlgChkUEbqmFmlwKy1Kogst2wvNPOZDtCLlLiLp
	 EFgQ3ZcoiLal3EdQRjPGljEFUVuYGjiuQo/ziS0TntT0jXM4z+XXcEg3rOXH06JnC2337
	 zNGfdt88o2NVMfcWmBfSNZRZYUf5XRvCUh07lFkM3Lauoh5G/QF8hRgGWGqo74+tcC+/p
	 V0WGCAHvkkqpIJUd7Nqoy7fg5KNbKwKJ7P5nBV8g2QxluHWz4yNRSo5fJ03iSZiOx0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VStT1ica;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81FE606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B81FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VStT1ica
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so5311586a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795781865; x=1796386665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CwowVZ3rKUKS7aekHm2EGIj95zoVj8ccIVxOo6VaL1E=;
        b=VStT1icaAeLfzGScPe9CdBMUfeQwHlELRjWXgQwof7WbcoT3BzVeAZWti+hSkJdNaj
         ZmETPUGZ6uEAo9AjcsJ3i0Kjmli7tijAHBBKi3QGFnxa1s7kAu1SWeo8KDmLxNK8vqVM
         nQ9vsvKapSrPVOTl9yCAyxrgT6JMZLxnZp8nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781865; x=1796386665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CwowVZ3rKUKS7aekHm2EGIj95zoVj8ccIVxOo6VaL1E=;
        b=Hh9Jm6L0zNIq/N37/2GS0yJ0oIJg/+72cdsfx1i3KGQ5GSyotAu69pY8Yh4z3IRyPI
         s8/tmex4m9ZT9bOlKXF2eBFHLwMbLm9IdgDDCLBnyDQmJ9pDtXiB0y3LrE04O/ZdDHu9
         C8fQSnhbq7W5xtMXiVWI+RAYjsGD2/IDSRpV6rKwk/+tMLjgIeqrFu3iWqChQqruQBx+
         0almD+trXTZYJ/uvO2pjE4qwFk9ERj8xLtxCBEvJpsUwNl3aOjUCWJlcv61pcTyFf7jD
         uAbc48bnh/2HKekKXvabZPqqGevi+e8OOuIM6Isag97eWI1+Cj6XQjL+aq/Y4EyaUQtD
         qa/Q==
X-Forwarded-Encrypted: i=1; AL+hErFHI6+JXEoBi4bCt5KtNNvamHztQH09l8/UnOJjDxKUTglih7mthpvkae6M2u8gbg7C4ybn4lfDe1nZijM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8K0lDLdLsujug2OOpSyAvM9qm5Qq7XQDyZsW95tSJ88ny+3WZ5
	eZmxwDlR5ytccCAjD/8HWIyHtkR1PaztngCWyJrWbjpWYQf/Z7jDISirUCePBu+1wh8wYgShvQS
	tfko=
X-Gm-Gg: AZFdTZfzJlDUlNlhhzOhThN+LTAtOI5l5ayrW5fmyIngzEl1ku7ZfIsI0/1VWQbH7xS
	Yg/m/DCR9Xy7C2tELTl3fDDqUXgiC50AHoAbLvTElDGYnjFs+UaO+0f+pTEL+YZTJw7tzMM60IZ
	xxdcbrmD3jJSL+PkZTluUhg2IczQc4qLIht5Gdni1BNL13QInvHTghdr261MUg9ivshiBAs+7P/
	T33BoEMNYCx22hFVIO9tddeSHwH71bpIG2bU/XRbiM+4P61eAPrNOOfQog3xO9Zrh/m0S9RkLda
	COuFdv+KlpVYoBL87Wc0ksT8uc0IRdDg5haebXg5rl0YVfe/NTuO/aCUTo+w0fGDb6o0vhQVg3Q
	WQi3DnL8ezUT0TUaDya9urjztq7BE+TyeRU+TfF3vsDBXhphhlShDs77JliWSumbrJZLx0/76Ed
	QHhO2jxXPULKfdVnYTylo9LMuVOqkcz7dcFQzrXiQgUaiWrvprC3SfOHQOEVAEq+xKw11DJmBZE
	QLoiBUrg6S7APpRUKISlir5PcYypC+mTPEmflQbnfm+Anu19EozmeNW2EKJZubUeaa/emXwPx6m
	SNPkPU4ZuHsXisGQopgKGHLKyRqidvangCo0PlANk3i5Nu4MSDWQe8gCR96rkSoGyVs=
X-Received: by 2002:a17:90b:1649:b0:3b1:2810:dfd6 with SMTP id 98e67ed59e1d1-3b41cb50c4fmr24707720a91.64.1795781865031;
        Fri, 27 Nov 2026 04:17:45 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm40927912a91.5.2026.11.27.04.17.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:17:44 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38644aedba1so12073612eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:17:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGndNISPlhaw6lK0NMq4CrMOzP/g61g2T5Wy6iUnKMEbfaCalQcsGWpTDzg8ImRNrmU+BgVJ/hSy6ViHUQ=@vger.kernel.org
X-Received: by 2002:a05:693c:83cf:10b0:386:b526:24d1 with SMTP id
 5a478bee46e88-386b52638e1mr15336839eec.9.1795781862885; Fri, 27 Nov 2026
 04:17:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-44-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-44-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 20:17:04 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh0FpfDy8VqHJA=+bBtqZF1K5FYWF25pL1sAi4Q4MSSkg@mail.gmail.com>
X-Gm-Features: Aa3M54pcv7nTzvpglkL8e2ZqGsoE7ZtTuNgXg7WMfrQxU5jsZk3Rpl5MWtMoFKo
Message-ID: <CAC=S1nh0FpfDy8VqHJA=+bBtqZF1K5FYWF25pL1sAi4Q4MSSkg@mail.gmail.com>
Subject: Re: [PATCH v2 43/46] drm/mediatek: Add Two-Dimension Sharpness
 Processor (TDSHP) driver
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
> The MediaTek 2D Sharpness Processor (TDSHP) is responsible for
> performing image sharpness adjustments/enhancements in a display
> pipeline.
>
> Even though this hardware block supports adjusting the luma and
> contour 2D histograms, frequency weighting, luma-chroma gain and
> others, this only introduces a basic configuration which allows
> to bypass TDSHP processing in an effort to forward the data from
> this block to others.
>
> That is necessary because some components cannot be connected
> directly in specific pipelines; for example, in MT8196/MT6991
> pipelines, when Display Resizer (RSZ) and Color Correction (CCORR)
> components are required, it is necessary to pass through TDSHP as
> direct connection between RSZ and CCORR is not possible due to HW
> limitations.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile         |   1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |  10 ++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |   8 ++
>  drivers/gpu/drm/mediatek/mtk_disp_tdshp.c | 167 ++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c    |   3 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h    |   1 +
>  include/linux/soc/mediatek/mtk-mmsys.h    |   2 +
>  7 files changed, 192 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_tdshp.c
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_tdshp.c b/drivers/gpu/drm/=
mediatek/mtk_disp_tdshp.c
> new file mode 100644
> index 000000000000..31f57c567137
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_tdshp.c
[snip]
> +void mtk_tdshp_start(struct device *dev)
> +{
> +       struct mtk_disp_tdshp *tdshp =3D dev_get_drvdata(dev);
> +
> +       writel(DISP_TDSHP_CTRL_EN, tdshp->regs + DISP_REG_TDSHP_CTRL);
> +}

mtk_crtc_ddp_hw_init() calls .config right before .start, so this full
register write overwrites and clears DISP_TDSHP_PWR_SCL_EN that
mtk_tdshp_config() just set for 8-bpc pipelines.
Use a read-modify-write for DISP_TDSHP_CTRL_EN instead (or drop the
redundant write here).

Regards,
Fei
