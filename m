Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105447;
	b=1kEwlOumhyBL0N52TF/i4Lnl3axTVf2Mvkjn2y23ZUhbikOVry4I1v69U0Iv6+mOMSHk
	 4XQ8dXrnMeRyKy+NSu/raLtQNKisDtNm8mp2SVxAl5FXYr7JMifJCh3xc10cyNE6T9WnI
	 yQBilVewfcjBjy8J38P6KwA/7BMSOvTtt+n8zTe9gVu5hMm1EkvMzMqlBYqh4v1gMaEoj
	 iNjgvXfVLVYoH8yhlqhpBaX47dmbFnE4xwwKFM3TvhxjlYJd37VDAQlzdCEl7JUQAEpz/
	 v8XK76Yv7D5V671QhQytITebKK/wnJNknRDV42/5kStUg9cBk6jiM1AAKSicr4B2HhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105447;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=odcg3p3L88lG9gCK3IAVBvbz/Hl37jfw4+T+d2IH0/s=;
	b=JVVGQ/L3rLTJZH6naMZUadmLPwcuziXPMFZpZ6FgGosLxeoOywMhGD33Qt+cMGzQeMOL
	 UXe8EzKAefL+fMJir/yhrcP3M6ZTleccxf1D2VrNAhkcwOI3l2Y6EAshSnpyDS5VjHrhS
	 pgAuzl/mzwDjLTB7zNFMzyvWg7CJHasxru06lbPVaQUxB+lxvB+JrQkLyYrS/KkEvW60Q
	 FDyEJ9RCOajBVGqEwp5ail2KrFft3jIrE2nbqkf+fZepubqYo/vxmI9rjsXPUWxbjUK7b
	 6Jf5qu+0EyOnJdspQpBEhzAtOI4C1KL2LVH4VUu+OdCEad3SHoR9Wg9dOP+GCQQVLoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hPXLV/Ym";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CCE606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPXLV/Ym
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1111F000D0;
	Thu, 19 Nov 2026 16:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795105447;
	bh=odcg3p3L88lG9gCK3IAVBvbz/Hl37jfw4+T+d2IH0/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hPXLV/Ymhknnr1TC7THKSqp3McWXOOo/qQTtfkertJ8eIcnURYDPElWxrxFRsCHQv
	 VKAD2si8hxOHsz4CRAbUluwBBa3tTp4qGvswqDr/znt5Ci9Ruj47fNRmik0t48gQ4U
	 NJXlA+Nesgswxp+BvbR/HVrPHaB3/gGtq6XAfxIQugNlsV+7vklvN2qnNpAZrMU2yK
	 og3FJAuNOHYnUNLBDXIo7wc0ok4Yd+8yL/BPTSI56RxZhVHf418yxjac95cGD+0iKw
	 2F5UCaJGlG7cZTK0O4U0Qk/KzPBI9Di3h2WOmWV3rVOTxrvoCzck7IGcjW1MK09Ds6
	 /hNMLPg/HITAA==
From: Vinod Koul <vkoul@kernel.org>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 neil.armstrong@linaro.org, mani@kernel.org, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102072139.3588-1-sreekuttan2156239@gmail.com>
References: <20261102072139.3588-1-sreekuttan2156239@gmail.com>
Subject: Re: [PATCH] phy: mediatek: mt8195: Check PLL driver setting return
 value
Message-Id: <179510544374.1370333.8388939289479267591.b4-ty@kernel.org>
Date: Thu, 19 Nov 2026 21:54:03 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 02 Nov 2026 07:21:39 +0000, Sreeraj S Kurup wrote:
> The mtk_hdmi_pll_drv_setting() function can return -EINVAL when
> the requested pixel clock is outside its supported range.
> 
> Currently, mtk_hdmi_pll_prepare() ignores this return value and
> continues with PLL initialization even when the driver settings
> fail.
> 
> [...]

Applied, thanks!

[1/1] phy: mediatek: mt8195: Check PLL driver setting return value
      commit: 5597a97e4842f3c67689093e9bf1215902babf08

Best regards,
-- 
~Vinod


