Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694291;
	b=sp/pqJD3a9t6mt8l0AQtW8QnlpRQIjz+idqdS+BeW6mrLhpcoDa3rGxSW9RaUoOsOVzy
	 QcYESyGkleZ4/T2zoXNwlSvV2FUgjmmgFCdL3f3n3fidSNhHXTx/ceg/JxvdKnD/lGYt7
	 j4FQHQk9H3pr6nawGGj7/2jELnyBPUm5d1g9E1kYAvw13tmytwDU+H5/i8ebXtRHABBgD
	 uA7uk1QcCViVHO66pkQG/+JnDpmrwTRobKP2bw5axA31j2VFUTuMm0AkRUeYCxKFvUq0r
	 swWqjL0r8xiwLE761SvVfGILUy6vAR2Art/jYJhDM/hRJZM8ru1R2QLiMM61JLLJKrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694291;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=iQW6r4UZTY8RpdKAaydRLhL6rNwNReecY11ijRbcSM8=;
	b=caZ2BCUFSiXrm3C7qgn/6x4LFGKfqxpIIZ35IAu69z4aCyqSXopbDJBpn6pVmixQoqJr
	 ygu8ACoHmklqdQ0e5SDKzqEy3K0V3rbjWd0/KKa50x/DhqnUS3JUhazmua6bbbSS4p4om
	 o+PpRxWW7o9UFXqXsjWq08hSjoIYYqzfAJCPyLRhIdKk10kxEWkNv2iNjEwpRfPUX8S0C
	 lPzypilTpPb4B3XhspPh3rkfv82Dirz+8ejZrp7urDwi2VUhjLlJybQzqxZ7tqi1VIJVd
	 a1cODt6n/frakMqLxLFByieQA2NKxMz0xCzfQjs7hPmCBGlhDQhlS+DohUT2m2Uy6sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=rB43Zaxv;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yvrwvHgC;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A332606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A332606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=rB43Zaxv;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yvrwvHgC
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A8CA17A0500
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:58:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 26 Nov 2026 06:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795694289;
	 x=1795780689; bh=iQW6r4UZTY8RpdKAaydRLhL6rNwNReecY11ijRbcSM8=; b=
	rB43ZaxvN/3HgZ8FbOy1U6R3eAa5IrAJpM/neOE3gx4jtTWpsQBq9ZLw2MFy3fku
	ZPpoAn2CIiNnFT7N74BOeFt54LWh/B40cjsvSVkxt7Rqb3zM/rPnYByC+w1c+kV7
	c+QCijLbAGZMyAQvHBZFOo6wmzG81nOoGOyULDd7okquEaH9slR1yRClLeyJiCHG
	6IvVH+6x0sCkFco0IvMdU744UGqDGf+2TGtT28rwifbBHOEp0fPcE3aeXj7nnnZO
	p39RwbtSWs2RUDqP8nBGMrZYBAO9mM1eL+Y3b3CznkjcjP2LOH8U1ExV3pRqDVzp
	lH9knkD/yGmHRUmfbSZRtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795694289; x=
	1795780689; bh=iQW6r4UZTY8RpdKAaydRLhL6rNwNReecY11ijRbcSM8=; b=y
	vrwvHgC5/EY9XWL1dg5aS3G4wjt+0Et+Yu3sweiQjS580uPot8jPTRmzWEP7/nyD
	zurIw3uF50KtkDuSJElKqKp1obA3/mcSGWnMS/fyO6nDQSsjPc1pbc2LT+Zs0w8D
	X7sJWDZihF7dJni7qXOPzBo2PnhN7jV8uPKK+dBTLAjmosSYMhKdww7635tXH5wY
	pS/WH50kUeJvWHYJXGyiWnUNAdSroe6k2KEx/u/PPQfWDG5qAHzt47jWHKdd8W4E
	iQ9oKtKsCoxB5nCs4bL+DyMzFKgPsHPFQjO9vmFS8YfqNrU3Kw1vtdo/vK2ZmflF
	w+R+jXEBL9KEnFc1UC6kw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795694289; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:WwyySpBY92+Gm74KxhyfW+UFoA4NhKM12HI3mD3+MpY2KTG
	dzszeLrdH7HOXGk3uiDALD67N+hZVdYj7ppBOn7YZvx5i1TGdYvq2sdAjKhE5ncj
	JF/z0ChJnhsirLWc2ZGI8L0nayeeHLj/d9JQEyRvFpVjp0aBpB09WL3NlG3EyMAG
	sdG1rGslj8GQnAcypz/OEShSPrGYm0mbHMGmkuvc134GvkSSqCK5YjImN8pLq+JD
	Ocd753crL4pbRkV3EH3mRUjsPwWu6ObLt3O+3abccAFP9PzS4i88k3AYWJqo+K64
	3IrbECqeQ+vrJP82tmZnodus6DO/gh86MU11a1Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:2QmgQCQCZxf2l3/728nfKWATWfWOTsCmwjr04Ag9cL8=:dOEAWIeel+AGrymSiWHAvMAANVKg8O2dcbt2sPHjXo4=;
X-ME-Sender: <xms:0R4IaxR3bCbMBGseP_7AR5XWWLPBAo7_HmhfHWNizGjPAW-nZIit6A>
    <xme:0R4Ia3WSZmVHUfVnjbuNnJ7zI1W2_ZWhtN6lktefLj1SVOmbZOEARnYhEFr-cFSRo
    AiJwR2mwz96Af2fhuxcpv5WPzyebNKaCGCPwKpKCGpHLBr1iN8ikVpQ>
X-ME-Received: <xmr:0R4Ia7Syw0HPNvtDBo7o9Ns2ly-yLFIggogZoy0J8nUIJ7pebhJyV5KyrnKCCEMjK4vTj2AiINaUX569VF76-rWsvzx6QYI>
X-ME-Proxy-Cause: dmFkZTG0bzJWOKv9yAufAK3CGuu/qiL0R3alEF/1g2C8PJgS0X4PnevIcCPjHhGpa6E705
    ZaVlr9a8PgKzmK9Ar+OmBXZAH/YgQuRCNV8BiqmRNKpOsx9IqdYpcSbG7OhPJoFFzEzV/2
    5MJumn6yLU+YrRYcbpNl50I9KN4eYyOr5aytFZV9po+zEGoPHH5XOPi4Obi69tS7yc4lyA
    JBISblMZet6xqQZsslT04gsniVLOSeB/+jEyKqFAZJhGTKB0IfJiRWZlKcCWG7L6J7C7vf
    eVLdpoPwk04hSooAr6Bq9O9Mwg66kXw3+bStaO16huDMmlw0jRRBBpAecwKt60HRPocxWq
    WXOix8zG0psqQY29AN5J4wjKC4o8ZAVKOl0h/5YMPoVKpFrQAkGl7UbwReZ3itG/1HFqDG
    ds1Mz8HgaVOysi9aLRHuyBdePZgH0uoXJ98g0OdcxODl9O0CgawYkiLiK8d1//6Xrf3vYn
    JZQN82b7y4Aj9zubA2sL5EQA81IOduiu7feL8OuHAxcmjL4C82Gt/gFgAb0dgn9jwVsBiu
    RBwGfugHhm0vEPH+Vkj2AXYin20YmAUiqitd0RX5WkF7zsZOcCAyrfbk+0GdrQYkO0SR0w
    tFLTgmUYYCaYBovWwIaK2i2rGvvmguKDiD9tptslI3zoGeC7jFxxvAAFWIlw
X-ME-Proxy: <xmx:0R4Ia_3PRdkR0PKMpn2hgeBVO7tPY2nTwBq4-evdI_91udFYlKsutw>
    <xmx:0R4Ia7e08Lr6TTbBacEQffQTfrvY-Fl4AzLI8KfEnydg4gcEy61o4w>
    <xmx:0R4Ia3PTj_5XfyhyDHgNMZhBS01gHJLAAcnQS5zRaLclzy41d7lntg>
    <xmx:0R4Ia_XC-tb5sJa5uK-RI24ZKm3npYYwNpjteunQtiWrvIi-tW-F1Q>
    <xmx:0R4Ia4ltjkTHPzRZqSo0zg_7r1pBDATWqZjRi7ksEwinTN1aXYHS_SZ0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 06:58:08 -0500 (EST)
Date: Thu, 26 Nov 2026 12:58:06 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] thermal: rcar_gen3: check for sensors before reading
 the fuses
Message-ID: <20261126115806.GN3898744@ragnatech.se>
References: <20261125060429.GK3898744@ragnatech.se>
 <20261126013626.2168810-1-shunsheng1218@gmail.com>
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
In-Reply-To: <20261126013626.2168810-1-shunsheng1218@gmail.com>

Hi Yaohan,

Thanks for your work and persistence.

On 2026-11-26 09:36:26 +0800, Yaohan Li wrote:
> rcar_gen3_thermal_read_fuses() reads the THSCP register through the
> first TSC. If the device has no TSC resources, priv->tscs[0] is NULL,
> and the read causes a NULL pointer dereference.
> 
> Before hardware calibration support was added, leaving the
> !priv->num_tscs check at the end of probe was safe because TSCs were
> only accessed inside loops over the discovered sensors.
> rcar_gen3_thermal_read_fuses() introduced an unconditional access to
> priv->tscs[0] before that check.
> 
> Move the existing zero-TSC check right after discovering the sensors,
> before reading the calibration fuses.
> 
> Fixes: c3131bd5586d ("thermal: rcar_gen3_thermal: Read calibration from hardware")
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes since v4 (split out from the withdrawn 3-patch series):
>   - Split out as a standalone single patch per Niklas Söderlund's feedback
>     (<20261125060429.GK3898744@ragnatech.se>,
>      <20261125113106.GM3898744@ragnatech.se>).
>   - Rewrote the commit message and added the Fixes tag per Niklas's review.
>   - No functional code change relative to v4 patch 1/3.
> 
> Testing:
>   Compile tested only (no Renesas R-Car Gen3 hardware): arm64
>   (aarch64-linux-gnu-gcc, CONFIG_ARCH_RENESAS=y, CONFIG_RCAR_GEN3_THERMAL=y,
>   W=1, 0 warnings) against 666539eecdf4.
> 
> AI assistance:
>   AI tools assisted with initial static analysis and commit/patch drafting;
>   the author manually reviewed the probe/remove paths, verified commit
>   c3131bd5586d, ran the arm64 compile check, and takes full responsibility
>   for the patch.
> 
>  drivers/thermal/renesas/rcar_gen3_thermal.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
> index 9c64cbc2ee670..a96f02d4a8adf 100644
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
