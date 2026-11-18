Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000094;
	b=InwC2v6sTkCH2tG5SzxDdZ94Sk0lTrBA1JuCjtugJqpwlD8u1VDrSjXfrwGHt1P4Z46E
	 kFE1HakWvtMk6OPHSLZ06qusKalyJDsYjm7HSvHZNbJOo2dbqniey8sPWncF0Iic6mnIv
	 //u5SzFj0BqtLiheEC8eDyi+CDD5eg6JlHIR2NW/gXLS9TExG6Ffp1J1bWFTd6VH+RyiX
	 8PV4w6+NRdVh4dQH4cePb1hBgESo0FVVh3coOxkjzc5vQ/Cbcwl4uvcr4dT9ILrpYe9KJ
	 hVOGjhTDcjODJA7gCkthX9Ji2vXWw0qJk3BdPgjXxCKkKU93WGYL75zyboHdDjgL9bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000094;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=5Z5/zjedC8T+CAY4SMgSU23abppwtiRyhcMgN9UWEQ0=;
	b=ZBn5MfC8da45TifLQAfxMARoh2+C+qaoxV/ozhbVfDh51DHJqTK/sV50RO8sis5jFQ1a
	 VNWKbrwVSchubI44KHcaPw0ZnrZUNJfTS2sohNHGr4DRKU0w41Hqj0AdlEHL0Dp/5f/PY
	 z27VlpWqIRfm8JkXj6KR4MWrtOFQRMvHJL5US8Ur52dBMqZeLAaJe/4FVDuqCWuebdotQ
	 oiCaf+JvfpVOoxubM+Zxg2BXxPxD5zJdw87HH3wM9LS3rn/iE+nFYW7VPrZEVdc3qeNiw
	 yjAU6JreEOIosGWNWBoHlOb9bwIJC8FEVhBgadA4+12U8acfIIlMsG3I+sU67tG94Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=dRStX11h;
	arc=none smtp.remote-ip=160.236.53.93
Received: from mail-m1602365393.xmail.ntesmail.com (mail-m1602365393.xmail.ntesmail.com [160.236.53.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A112606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A112606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=dRStX11h
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5523317e8;
	Wed, 18 Nov 2026 19:08:00 +0800 (GMT+08:00)
Message-ID: <0cd86b2b-004b-4a36-ab8e-fd3b50960413@rock-chips.com>
Date: Wed, 18 Nov 2026 19:07:59 +0800
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
Subject: Re: [PATCH v3 5/8] drm/rockchip: vop2: Only accept AFBC YTR for 8 bit
 RGB on RK3588
To: aiyengar1990@gmail.com, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Andy Yan
 <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Piotr Zalewski <pZ010001011111@proton.me>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261113-vop2-fixes-v3-0-08ae37e83b5c@gmail.com>
 <20261113-vop2-fixes-v3-5-08ae37e83b5c@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261113-vop2-fixes-v3-5-08ae37e83b5c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1ee57974103a8kunm31e77375358449
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGEpLVkgYHUMZT0tPSU9KTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=dRStX11hKIKXImeBPSFSnbL4EsfI4ippAvDWiIMjgZwMZsNT/qSSdtmiAfpCFt89dJ4cV435LnMtrQE35l6abkTOSitQjAvB++qhkLwniOfRYGWOa7YzW9QPxuBS9iSdHbj+zvbil7mXmytF+itkskDXYcYyHHEY34tnh6X3yiM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=5Z5/zjedC8T+CAY4SMgSU23abppwtiRyhcMgN9UWEQ0=;
	h=date:mime-version:subject:message-id:from;

Hi Arun,

On 11/14/2026 12:39 AM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> According to the TRM, the AFBC decoder of the RK3588 Cluster windows
> supports the lossless colour transform (YTR) only for the 8 bit RGB
> formats. An RGB565 buffer with YTR gives a black picture and
> POST_BUF_EMPTY, while the same buffer without YTR displays fine.
> 
> Don't accept YTR for any other format on RK3588.
> 
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index e8ef83d6924b..de3da292b05a 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -404,6 +404,11 @@ static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
>   	if (vop2_convert_afbc_format(format) == VOP2_AFBC_FMT_INVALID)
>   		return false;
>   
> +	if (vop2->version == VOP_VERSION_RK3588 && (modifier & AFBC_FORMAT_MOD_YTR) &&
> +	    vop2_convert_afbc_format(format) != VOP2_AFBC_FMT_ARGB8888 &&
> +	    vop2_convert_afbc_format(format) != VOP2_AFBC_FMT_RGB888)
> +		return false;
> +
>   	/* Different windows have different format/modifier support */
>   	for (i = 0; i < plane->modifier_count; i++) {
>   		if (plane->modifiers[i] == modifier)
> 

Yes, RK3588 only supports VOP2_AFBC_FMT_ARGB8888/VOP2_AFBC_FMT_RGB888 
with AFBC_FORMAT_MOD_YTR.

Shall we move this new check a bit earlier, right after the RK3588 10bpc 
formats check? Also add a comment and a drm_dbg_kms trace for it.

Best regards,
Damon

