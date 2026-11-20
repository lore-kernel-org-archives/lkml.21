Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162636;
	b=w7LIneYedoevTmWpzoRmv4+Q7HtyU0G+IM6HDa+EdN/aSS1QQGNTX6i06CPpVGCiRZIk
	 9MFnROO0i1eNwzbQLNbknTipU+hKCK4yizp+5KPl6ixu+3zXrNOmCq4JYuVHgSo5CvaRs
	 rNqc//vqVUYUXqDeQH8STqvhoa8JvA9GWJxr/quaHOdZlnu+mQpyeZIE+ahSNarhPP54z
	 qwu7BkE2/ORKK/iVvhx+YhTicOpGbv3qJiKK/ugd9E3amfnYFnCfYJGzwbl94w2CfJyD/
	 KybUKdFOZ+gckfhWmilesqXCk29YCs9xQZbR6pTUCHcL7JfQh29/dR9dEtkH0GR7HsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162636;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jwFTtMFfvcVwzXF6nx1Da9qZEN/vmSO2J86DAeNP2u8=;
	b=yurh17MumB5p8qJDDl5Pfh7Dp77vXe+y8mv6m0Qu1dakPnOCsDa8qioSlJLEVs9trkKA
	 FkOYcUQ5z+wUMAfY+mQM1HTiGVngq+ldIGLYjvs0NzumSbMfj3/bJO3idYBvmedPCnWz2
	 mHkn24H5rI3pfSts/ugZEFXwvRm1NxbGOeExpZ3tHewSzqhaq1OL0rqEhbu/I7u+goGmP
	 Gp3VNYK7ZZqPrJEAIRP86rU1qFMMhO+v+9lgPvxoIgrpAZoney5Nzd6u2sHW2Hq+J2Vak
	 ufvcQRCnV8y429ypxLL7qgyJwVBjxiGHZR3Hrg++3dHqD10qgS4cfU02bnFxeDcOxiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=cEdlTmmH;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nCKLOIvw;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB3360A2611
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BB3360A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=cEdlTmmH;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nCKLOIvw
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id BBEFA1D0031D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:17:12 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 20 Nov 2026 03:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1795162630; x=1795249030; bh=jwFTtMFfvc
	VwzXF6nx1Da9qZEN/vmSO2J86DAeNP2u8=; b=cEdlTmmHxEnHiI85tBQw1SRrF7
	CFl9VZGjes1s6KQARcG7DawjivqzuAJzyP8Pj/aQFiGEiukDkbMxt9j5zV9l/d5G
	17pcSo+78jYiW40OH082VPqINUAjQayZud2VAw4+bdaMYObDz1pYUA3DJcsBO5ov
	kEazcCL+s62lMkeN07gLELULna9jZ1x7Jaobii2ekgYzgk3jmFgEE8J+Z42Wj+iN
	lchTL40hJKVqeVY6UVuZzI/27QFu01XNGKCsWqNp8C8o8lDbc6D9eVgtdi+xyM8c
	bCaoDkip/884RoF2QYw6vJb4Y36oLwK4v46h+zCX9G7XAL32dExc+rRGxJKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795162630; x=1795249030; bh=jwFTtMFfvcVwzXF6nx1Da9qZEN/vmSO2J86
	DAeNP2u8=; b=nCKLOIvwxfZSvqErQRD9FfYoIAsmXKcj686TgzCojf/izKYMSoV
	eLSzYhu1ClW7N/jz34MLWhl/5AEshx5lAFBVvo+QTrItKF+zBo6c7/7ROs0Q7FaY
	0DZQK1wy3yqVjeL15B8deGmbU79BDcXc/lJamRW5gC0AcJ3+ajmMb7cjfrkJksF3
	VTPQZLFU5NG5nREOJ7rhjnMfuon8nYiD6pM128S7mfVMxHbJry6P3UI6lE+I7oI4
	BsKkOxk2ZwUBWIBh+FazBXeK8SIOX2gZ/b8uTUJuQNHfs6oCVDcL/FYgV0uxe2Ev
	F9iK4ECeW4tX8oJ4Tm2wmJx3dpQeREjOihQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795162630; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:paOEJTNva6revFl5wVx4EE92QFJ/fxr/i6QLu5zO+cwdIk9
	0tS+x4w3I9jl5WemSR4rfXlgwXAaNCH2BQ3iOmJf8mrWu7E0LO2Wh+zvr/lNB6mR
	tlMWfAtrPEswWcefp/H5JYaLYOK7z/oP1qkAob+6jFHyBRYDe9yKDrq/HuoWnJcW
	6w8W19QccL6gCAG1x4VnYvuTjDYaVeQdXHi91P5BJf8bVGhBCGneCdRyie3O4So9
	TwVIqOeaXVoLiwhWqEtDH8qgxWCLhl1cLdbDSNrZcluS2nFIM90UqXi5u6cfCOVj
	vJ+F4hmtOWs4bS6w9mgZ9nzHAAbnyRQPsLyFH9g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:GX5f8IQVvBa/luY/rOY2bKax6TBVGP42jGz1Isrqisg=:WFaABMt+2M9VQuY5/ka7NDvEJk47H7/082hXEpKLbFs=;
X-ME-Sender: <xms:BgIAa7bQjPK7h6KCyHZdv5wJdcDJW0w7-MUpDjTAQU6e7OTotMgfkg>
    <xme:BgIAa2zhIEY1Ji-yewbI0Zoudicq9ECN_ZXt-QEOePqq-hPl4-zYwdAbPygFWgcat
    RX4oCmW-PBKUvLCSd501Cg9n7wvb1dtVeo7L-UnR1OhzCgbN-w>
X-ME-Received: <xmr:BgIAayaU0iA9mcaZ1mqlJodZRPymUvv45nFe8bLMBpWhGwZOsIiz7l3H9obd6Olrsda36nl-ELzGO2A6E7GII_WRD-7zaoxK2RRMzJseqEQ>
X-ME-Proxy-Cause: dmFkZTFQ7DaCH96GS+eQ+DbvcQ6sPsqlIf+L00Ykku0I46uDDxi6HexIxb9TybVBL7Rc4K
    LF6I66PWAXS6RNIJpNbboMGZQYc8X4ASiz6bmeI1J1EtHYtxvEpy74xuYDulpAPIWXNECs
    81yxljtHzkcvvoeGnoyyGyTO/UV3W/i/Kjn5uPNS0jJOIY5mHPs6yR7YSYPiZm/eREVcYo
    K+OxlfbxFoNWadz9eeCLtLPpy5+MKlm2LoZ9vJD9JoIqksG9hfxJFFtr3gHSeufxBMq8Jn
    1Dg7o0DAwbZHtjzooFUzXq1337f5CiuA1GgjNJAmac8b0QYWeaI+5mEuPp9CRUPF/FXWUb
    TqTDvM0dUYOjv1mNXl2BmPxbh5z9CsSNBhiZxEaoNRS8KLWM3Ow0F6HUnrhw15cvGVXOos
    oDaBKwg8ddrhTP3cu53YxaIWlK+JQl8wOCHWNMGCfUwh+2RxNz90skJZbqJjd2FGOeQ+9O
    e27lG8YYHWPiZyZ+CWD1h5I4WqotOJXzElkeIazxImMRWkIn5ROIQR0QRIIWPgr4wkBIEB
    Fa8WcIFl5cCzW4MAoC+hIt+Ak88Nr9/EIrdesJIa8ViHZEuW83awuCuXhw4qjmVGQ3415n
    oC3v/5pHr9bTZVEnerG0T404At7CwxkbSGjCYWwNKg/xAEBTEiwwDkP3Zv6g
X-ME-Proxy: <xmx:BgIAa_xMADmTgtPoxpP021rF056i7cHHXvTMd5_VKsxhG02EDa3x8g>
    <xmx:BgIAazHPYbdnO4RQSzd1Cix4450KdL2uOaTnrtYMFyEOcvv4Y7vRDg>
    <xmx:BgIAa_xhXo97joRl6pqVPRK2xRTaCkz0QAHw-E0pr5PpH-RII1EuBA>
    <xmx:BgIAa2Mls0fBHZ5eggvspoX1L9RVtWYSxp8aN5m01KUh2Rxz-XIf6A>
    <xmx:BgIAaxO7ZioZWdikzasnlINF1D2Mkf8JdsSnpmK0SnQqecgtQDi0oyyy>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 03:17:09 -0500 (EST)
Date: Fri, 20 Nov 2026 09:17:07 +0100
From: Greg KH <greg@kroah.com>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: bryan.odonoghue@linaro.org, heikki.krogerus@linux.intel.com,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: qcom: Release connector fwnode after
 regulator lookup
Message-ID: <2026112052-unmapped-etching-4bca@gregkh>
References: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>

On Thu, Nov 12, 2026 at 10:18:36AM +0800, Xiangwu Lai wrote:
> pmic_typec_port_probe() looks up the "connector" child node with
> device_get_named_child_node(), which takes a reference on the
> returned fwnode.  The node is only used for the VBUS regulator lookup
> from the connector node and the reference is never dropped, so every
> probe leaks one fwnode reference.
> 
> Release the reference right after the regulator lookup, mirroring
> the parent driver which already manages its own reference on the
> same node.
> 
> Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the connector node")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 2 ++
>  1 file changed, 2 insertions(+)

I picked up an earlier version of this:
	 https://lore.kernel.org/r/20261025-typec-of-fix-v1-1-06bfc16a7846@ixit.cz

