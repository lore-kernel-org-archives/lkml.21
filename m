Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698032;
	b=m/OFwuJOqbs4l2UO7vpjaL7dDCe0bd+su95UIsT8IYcOEJOMopQ86i2kFgCy6CsfJpID
	 4fG5h2ovgolD7ZK2LggbFaisnyK1669tlWg3/EZNtAdUVva8JXDn/GqyFk01VsLDsMmXU
	 oytg52azW+s+6pulsULAQM3IeSA9uS4b1P6Ne6FDCdJ0EP0ZcjoZ47JP1lJ2oUKEVsuDz
	 PLDgLft9jVA7tGOorsm7AbXhuia7uOPXrfcpz7ll16SNBjpmEOStLsqblyzpz6Jz//z/s
	 0GV3XgKRZ1jIjBgeJnXuVfbbpbzZ7mocKvL+eopwfEkbHd65Fc5POdvR0BuI9PHNfIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Db7swx/z5fRcWKIKhx/36FX+1LnzR+96h9IjzqTpdvs=;
	b=WqOJVn57ZY/vD3SDwpEwK7Wji6fwwijQ+/1m6vqK1/YnhgZOBlCid9O0JVidjoaptwpx
	 Cz9H7jqRg1yPI+ttb5ofa6M9VmNKXjiYiJN4jJd3a87vlaUcZbLr1wa/xSuZvI9ZwZpI9
	 ynadssQVNCLHxEiEEGvUz9P/i22M6uAmBG0hrVvrnv1u1lrkJX5D3fet8w5deCKzTuoJ0
	 NXvWAt4XtPmnMFTp6K4hqNQCSwZFRgacjiMvy9VC/0ltiJoQ53nhXbeypgyNdIkMAt0vJ
	 iLnVVrjKh12lq7wOVUYuhIzUkJQzr34p5GF+4VmAwVZTc1A6+KI95wBf+QFUng+mJMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Vjg2M7n/";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7865B606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7865B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vjg2M7n/
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so3837090a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698032; x=1796302832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Db7swx/z5fRcWKIKhx/36FX+1LnzR+96h9IjzqTpdvs=;
        b=Vjg2M7n/jvQqi8Iu5gHLylk8W4DSsHak/aphtHnbT9mabryXAmvjC/sAlK9iQIo6Rr
         s1WavyhtUn00ODNDDXumZuNMzeTRrHke+qEfRMh7QO73j0pYn6hTiZ0rAHRRhXmGOteF
         5neoTKx9c9ajzyj4JZXmwUFzS34FisGo7iq/rTpTv1hZSu/Hsb2zjzvp6BqXdjiYGwV6
         +uet5W3DYizwCp/l91AI2whL6qA97od71hcC00MkfRuCSJBUOinafAtkvjB546rLiroZ
         zHee/9MOFc/gKO7nKKB6EOANaJBU4JR3apm5u6oOtt2rbwiInYCVn8B0Cm65HRQ3WElv
         QxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698032; x=1796302832;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Db7swx/z5fRcWKIKhx/36FX+1LnzR+96h9IjzqTpdvs=;
        b=rt98cjohjv2cYGmphWVYQFAjnKvZu55EQrojTSvnVEBFQM6ECqn8ZE3MI4dXOjDg/5
         X4jm/AubKjXbnbbGyFJGkh6vGWrtE9fYx8yxyyYEz3TbKR4MnDnr1k50Mc2/GiP5+tcq
         21dHyXkdwjYufHj1f62/jXougWfCxFABe28eLpUWjJY8fBUjOmujCQ4LYsNoLuRtq0AF
         nbTOh3NbHLz8ZVIqlgEtsMPkfZYuYBisBDwC7jNZkIPCXH63s0BNUT21yFFQe081y0kq
         e6cW58j+LMirSQ3ZQNcK1CivMv61J+sdsHtdWi3+w00bj+V3FVwSJxlpOLiLbSFBcU3P
         uxNw==
X-Forwarded-Encrypted: i=1; AL+hErG3fL4XlxP26kKv1yevxifp3sWDJVaiyevUPtn2dM1WtK/w9OfRDB233UmwbK0NxRawBNwDxUMZVVjcUXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SGcuyOfQAhuOrSFmXH8W3hQ5JiyLxGRRBFXWYIh286HYaieIT
	xh5xft3f6lPxfMwIUZtPgdauiTqrWJ+sPK+30GDidVWAEUWBMPBP5kyW
X-Gm-Gg: AZFdTZdxDwmRr3NZCRzj/v5zXJ7uIewCeSHWwnDvjWokdhU3gUEufL+b6kVterwIbmb
	fi+ERyMc5PhAZKzKTkYynWpn75q+8q1IWSg7dCqAIX9lfJ2eMzRuiUsY9is5su9UBFpfLSipANY
	BUI5ioG8oBllwhiGMNDlbVnhjQmxDKtHVq3p4w1Ilm+zsIXY5MDTOZFn761uRzXmbLKwVL5ngZ4
	9P30sFaqSLk8NssO5UBrICTtVteVzTgIKeSAecZR4DnOwwU960DuUOFwo5kbzZ/7qYvgVL5vGyP
	TgUKDOL2mVloorHeErWnuP9ne+VW938ItKegq/DU59fzlkW7fQE5IGKJpLmrpYMbkSS/rEq4Zw2
	i1e65nqeLZ615uZG6xf1y8Ng5XDcNd9EVGEIXGoCetfMHWn2PT3fsmjFHfGBlqxu09p54sawscq
	v3qmuJzMH2roHzbNJxteDbpYuRO703oQm346Lsq6F5vsiFfvcnxctkIrkky0xh709hOTlavDqsP
	QcRlyP5nF6rVRiEynB65AHjvdllypKW88ef0HBzzakV+RkDV2OutQaAqjbiGDx5aQZVeA4LESRl
	BSJD8Ko+x6A+KqFtpZiu6Xe5Nlc4mIhhlBnAUp+YCsi0j5giUBBb
X-Received: by 2002:a17:90b:2cce:b0:3b0:a7b5:c046 with SMTP id 98e67ed59e1d1-3b41c9759cbmr21021163a91.54.1795698031561;
        Thu, 26 Nov 2026 05:00:31 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b0f482bdsm17077789a91.14.2026.11.26.05.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:00:30 -0800 (PST)
Message-ID: <772ec0ea-da77-42e3-a281-8b8b7f364bf9@gmail.com>
Date: Thu, 26 Nov 2026 22:00:25 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v4 08/11] PM / devfreq: rockchip-dfi: make RK3588 use its
 clocks
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
 <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-8-517a68c008fe@collabora.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-8-517a68c008fe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/19/2026 10:01 PM, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> So far, RK3588 doesn't have the pclks for DDRMON used in the driver, as
> they weren't modelled before.
> 
> However, they are now correctly modelled, so the driver should use them
> when possible.
> 
> Instead of unconditionally getting them for this SoC, add a new variant
> member that specifies whether the driver should let missing clocks
> slide. This is needed because we want old device trees to keep
> functioning, as otherwise we'd be introducing a breaking change for
> literally no functional difference here.
> 
> Fill out a clock name list for this variant as well, and hand it to it.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 2b9d9b26b11a..c51d7eeec394 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -117,6 +117,18 @@ struct rockchip_dfi {
>  	const struct rockchip_dfi_variant *variant;
>  };
>  
> +/**
> + * struct rockchip_dfi_variant
> + * @init: pointer to the variant-specific initialisation function
> + * @stride: address offset between the DDRMON per-channel instances
> + * @ctrl_single: whether only one DDRMON instance monitors multiple channels
> + * @max_channels: maximum number of memory channels for this SoC
> + * @clk_names: pointer to a constant array of constant clock name strings
> + * @num_clks: the number of elements in the @clk_names array
> + * @clocks_optional: whether not finding the clocks is non-fatal. Set if the
> + *                   DT binding for this variant didn't require clocks in the
> + *                   past, so that the driver remains compatible with old DTs.
> + */
>  struct rockchip_dfi_variant {
>  	int (*init)(struct rockchip_dfi *dfi);
>  	int stride;
> @@ -124,6 +136,7 @@ struct rockchip_dfi_variant {
>  	unsigned int max_channels;
>  	const char * const *clk_names;
>  	unsigned int num_clks;
> +	bool clocks_optional;
>  };
>  
>  static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
> @@ -806,6 +819,11 @@ static const char * const rk3399_clk_names[] = {
>  	"pclk_ddr_mon",
>  };
>  
> +static const char * const rk3588_clk_names[] = {
> +	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1", "pclk_ddr_mon_ch2",
> +	"pclk_ddr_mon_ch3",
> +};

For proper operation of this patch, the following patch should be applied.
The following patch is applied to other git?

https://lore.kernel.org/linux-rockchip/20260921-rockchip-dfi-cleanup-v2-6-43ff34ac8599@collabora.com/

> +
>  static const struct rockchip_dfi_variant rk3399_variant = {
>  	.init = rk3399_dfi_init,
>  	.stride = 0x14,
> @@ -826,6 +844,9 @@ static const struct rockchip_dfi_variant rk3588_variant = {
>  	.init = rk3588_dfi_init,
>  	.stride = 0x4000,
>  	.max_channels = 4,
> +	.clk_names = rk3588_clk_names,
> +	.num_clks = ARRAY_SIZE(rk3588_clk_names),
> +	.clocks_optional = true,
>  };
>  
>  static const struct of_device_id rockchip_dfi_id_match[] = {
> @@ -885,8 +906,12 @@ static int rockchip_dfi_probe(struct platform_device *pdev)
>  		for (i = 0; i < dfi->variant->num_clks; i++)
>  			dfi->clocks[i].id = dfi->variant->clk_names[i];
>  
> -		ret = devm_clk_bulk_get(dev, dfi->variant->num_clks,
> -					dfi->clocks);
> +		if (dfi->variant->clocks_optional)
> +			ret = devm_clk_bulk_get_optional(dev, dfi->variant->num_clks,
> +							 dfi->clocks);
> +		else
> +			ret = devm_clk_bulk_get(dev, dfi->variant->num_clks,
> +						dfi->clocks);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to get clocks\n");
>  	}
> 


-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
