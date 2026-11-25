Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586675;
	b=BrWGNQqfTG0Zyvr6zkcHQPHPjIKKqaRx7hMQ89KU2kmXsfggWf2Nz22kRq4QszHPzW7P
	 8JI3M8hDJniZxKlYAHeA+6K5smb9yoU0eyIrIAr0cKcYilQkGZNJ+2M1NDzAnwWeMnu5Z
	 EAZz/c6/baqP0CC333dQ+2c5t4w7SBqDIH+2XeTAr1SMm/7XQl8KSHkVQZ5Ct83WmxXKF
	 mLmB8Wd3udei/td4x73lvtZj5qUacISnGjeQeeQ//xGFupJhYVgma3QNRe4KEytl5NNfH
	 Q7cKbSZax4JRW8hrJX3R8NxfpfcnZOWPmPpDCNgYJA9vh1YO22Fo4XHGoTDGqRcn8YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586675;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=7Epil4PtGZfPz4YyI8mpzVy50A9b9V+tgSilC5wwwPc=;
	b=laG+9dD6rOBaAOhpeYdTLQRyzqcN8QQ4W9OtU8ixYXiN4vuT+DUu7TNWGVgJXZDV+FJN
	 OP4GW3I6GbtOi9sdUlUZrpCz/65E5s/ktMgTvo/5/slmsbawD2JQVzAxId0lYFtnrLfYu
	 wC8pGzLV5mm0c5HcgS6ATCYVcRsrZuh56IScQLjmmOxamf13BEsHoKaF/y+cc8C+TE1hv
	 3MFw8i9xCHjFdU3pFaJp0Ov5JzTCXIXkw4hCxBOBMcoNHOA7t/UcG2RqHeLTDkD3tvL+H
	 s40TtP89T/5+aVqnRNQ/WsLmtqZRB3Fouhunf0DmzUVB57FJgL8iPGKd+QP0Lk345Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=pAsySB0t;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JiWIx2VG;
	arc=none smtp.remote-ip=202.12.124.148
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166B6606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 166B6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=pAsySB0t;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JiWIx2VG
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 63FAE1D0063A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:04:34 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 25 Nov 2026 01:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795586673;
	 x=1795673073; bh=7Epil4PtGZfPz4YyI8mpzVy50A9b9V+tgSilC5wwwPc=; b=
	pAsySB0tpM9qAYqkBdTKiGTG5K5FPkntlkCmYB5YAvB8FAWaUkuUoHlkraoZEiW4
	Aej7i0bElhBbLgeutkC7Ww8c0F5SzHiE+jh753QxazdoqtMLa+qPSSm7suHgQbW9
	vBehedOlTDUK6Amtjf4lXmOI1uxsBh+9ki1OV8PtIs5QQlJ4fAfOgnKOqB3QOjp2
	Rxoc6nrlVvmHJ5ze5Ek79Olauij+4F/ANRwESJOXLowZ4Mpuh6wJLCiamdMFdJv6
	ifsaZoHjIR3Cgb89AXl4wb6oZ+McfyJwtVnnWpK/bkFvgLouhcSHwuEhX4cOJ8tz
	S62/kFmN2EUNYZeTkcdbQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795586673; x=
	1795673073; bh=7Epil4PtGZfPz4YyI8mpzVy50A9b9V+tgSilC5wwwPc=; b=J
	iWIx2VGAIAluj3NNhn71fnJrX8214XLtmV0izi5w1M9soCnM3GlWvqWEGTQ/WEPS
	agT00CG9Py/cGagYEopeSroTtg5EKe3vMptGq3Za34ASXtdh78qyk1AiDciGpyTe
	GsGJAulV63U/vatwjw2MeacKtXkM3gBtdixwiw36KuTDpGKVz4FRKULANeKhlCiw
	cLATpoDFK0t3ZDAnmmM3SqGvyrbC7dQfgUd8Xa7QhQ/LgB6K9ttpVC0PbP1zDsg6
	a/KXiHOLuoWomQikbr0oT8IMqaJ2/TrSafm3y/TdLw8kjy4WoHYJIYs521XndIl6
	qOUAwhEPpBf+SuDUyqHag==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795586673; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:MhrOEWsbtQj4CCBmmypPBkoGgerRdqmVe5GHrEWO8lzaDbP
	Up3ykZobzVGYdi+RVfiZSDWT80IPnCexKbCFpSYufUGFHy63Tx+mcdQkF9KtONXX
	IgL9S/sQfHYi7VXwNi7jD4QM7ucgvJeRzB3ZR/a8NcTH2aFHUiWPMOoNhMZPBALh
	zAXrjhxQDAFcAvPgvAgRknJXbOrJSMAhLGUMkhF00Jz8kB1EZVzkhFMHo26ZRw7k
	Q0flvGfg2wgF0lt9d32mgI5JIwWONrMzBG36+fxRztiykQVm1xGlMjIYdxBnQr+U
	3NaXoPhuLN6Vo6tWPkP0Ou4+x144KyIkxMLC+eA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:y5PHGR4qiwNyE/UjmfbhM1rqkhy9QZJ0Q87ERQMI+gQ=:oX+79zdqtahGJCAA1wRCQbzUqooIPwfe5lkZzxhoaIs=;
X-ME-Sender: <xms:cHoGa0Gf-Q9kbrJom9WdNChY2r6BbWDuKrzjdBBgrZI6Blu-RvxG5Q>
    <xme:cHoGa9zq6lGfPr2zsvkYgKLkqsGxCSQFTy8u0ea5bk3vgSCWCXsST8OPhOy6POx4u
    fcercS2JvvCsiX8qeCybIdUh8IN9_RlRnsphlwrD-vUuwAcuF18hoKc>
X-ME-Received: <xmr:cHoGa-2j3gO5Aepz2LAmKaZoLCYH7xZq38g0ptDC0CuGs0FxCndACBV0HPofwZuXB9nHUYiBEACEnoMbcagUg8eKjv8VTs4>
X-ME-Proxy-Cause: dmFkZTEjh66Usaj5wCBteC9/n4m04jt0OikNODyhj1mehMTaaXXPWYm5BLZA7iGopWBR2r
    J5pvMD5mm4CxopDCZANuUbNvm5CeL8Cc6JLNHw1RQ0vbTQQV7t01z5rK0lyq372hvuTaFO
    pLsHWHVmkjop8PpWoUrl0Ox81vWGF+itC7WntgdlDt8bLEXRQLGJzVicpzBao8dy2NEv6u
    vEYGFIEJmncGMYi9KgdZmQM7rGakjLMqciIZlpJgtUrYguZZV9W7aajMEdnTMgzH3BXP0R
    ThKlif/jrP1jIudQcB00ZoR/0F695gmgIOyXTjfm4YVbLa/jNIjdD1CDAXjneGY5Vt+8Ui
    W6OJLG5Tnm4xV/iI5fdZTn1B1aGf5HNy1unNX98k8intATyi0ArJalgsXMAeyRQSiCnpUc
    RFeFDy1hbps9YRNZW9BrtpMCNNd5VpCtbcqXoUfcuaTePjBzHot+RoX96CDdJBqN/WNsls
    UI66e3GnwB2I6dXIjkfiBQ4rwmTTm0dg0n1S2Bjx8uFjs8icl5NpkOmOvUtMJUH0eAeE1C
    R4E/YRDmb0l2ejUj0tiGwlTUwwYQetFKqRAes69e66CMOQSNy7Fu4CDr/w8HoMPNhQE3jJ
    9MyhurgTVpapRbQWd1DXJ0ni1QnNMsVa9I3vl9Qx8GbYTDhQN20dTuHPNBRw
X-ME-Proxy: <xmx:cHoGa9qgWslgZFVmaYlGPdxdWm_E1XNcKqgnIfYp0KtJh6hjxv0yOQ>
    <xmx:cHoGa7WRuPB4GTlKBLHRFVHLAmVKPy1aBRwlcCMcn-GvWgKjs4wPLw>
    <xmx:cHoGa2qpz8ooNNkaSewkI1KVJEQGqeDTOojfts4uZx94niUqpjogpA>
    <xmx:cHoGayA2dmL23rNtK3hSQ2hM8oRxHTOK1OluZeXWxnHxBsH2ziYLRg>
    <xmx:cXoGayOjIobTuNxChOtlEY00vY_hmLtoZ0iJ1tA9SsCJae4qmYbvbv70>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 01:04:32 -0500 (EST)
Date: Wed, 25 Nov 2026 07:04:29 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] thermal: rcar_gen3: check for sensors before
 reading the fuses
Message-ID: <20261125060429.GK3898744@ragnatech.se>
References: <20261124095110.131258-1-shunsheng1218@gmail.com>
 <20261125030327.953450-1-shunsheng1218@gmail.com>
 <20261125030327.953450-2-shunsheng1218@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261125030327.953450-2-shunsheng1218@gmail.com>

Hi Yaohan,

On 2026-11-25 11:03:25 +0800, Yaohan Li wrote:
> rcar_gen3_thermal_read_fuses() dereferences tscs[0], but the check that
> rejects a device without sensor resources comes after the thermal zones
> have been registered.  Move the check up, so that a device exposing no
> memory resource is rejected before the fuse reader touches tscs[0].

This commit message makes little sens, how about:

When checking if a device have the thermal calibration fuses set in 
rcar_gen3_thermal_read_fuses() the first TSC is used to read the THSCP 
register. This read is done even if no TSCs are initialized and if so 
will lead to a null pointer dereference.

Fix this my checking that we have at least on TSC initialized directly 
after probing each TSC. Before adding thermal calibration fuses support 
this was geared against that each loop was over priv->num_tscs but that 
assumption is not true for rcar_gen3_thermal_read_fuses().

Fixes: c3131bd5586d ("thermal: rcar_gen3_thermal: Read calibration from hardware

> 
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
> 
> ---
> Prepared against v7.4-rc1-1969-g666539eecdf4.
> 
> Compile tested only: arm64, aarch64-linux-gnu-gcc 11.4,
> CONFIG_ARCH_RENESAS and CONFIG_RCAR_GEN3_THERMAL.
> 
> AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
> author reviewed the reasoning and takes responsibility for the content.
> ---
>  drivers/thermal/renesas/rcar_gen3_thermal.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
> index 9c64cbc2ee67..a96f02d4a8ad 100644
> --- a/drivers/thermal/renesas/rcar_gen3_thermal.c
> +++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
> @@ -557,6 +557,10 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>  	}
>  
>  	priv->num_tscs = i;
> +	if (!priv->num_tscs) {
> +		ret = -ENODEV;
> +		goto error_unregister;
> +	}
>  
>  	if (!rcar_gen3_thermal_read_fuses(priv))
>  		dev_info(dev, "No calibration values fused, fallback to driver values\n");
> @@ -588,11 +592,6 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>  		dev_info(dev, "Sensor %u: Loaded\n", i);
>  	}
>  
> -	if (!priv->num_tscs) {
> -		ret = -ENODEV;
> -		goto error_unregister;
> -	}
> -
>  	return 0;
>  
>  error_unregister:
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund
