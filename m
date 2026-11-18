Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=47.88.81.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995319;
	b=DTJnW9L5K8ed2PZESRjgyh+mg41iPJSEV1u/qPnteWXt5neJTmjvs7mK8rQ62OjwBNpi
	 vmJRXxjFsXJ3xA8ec3eWz3rgjpRLBVyOoCHKptyenOjOS/fWf/RwoLFyQ+NIIhwXIzkEU
	 1NvJt2TQ4fJy9Bsf1pK7R/qqOgFOtzDSDhtpGee5Usdm7TvzU2U2xGX/OqyW5EYVXDpya
	 ogshudRHOJuFPBFyTs7bVt58JFJmvcVUBKTWhwS/z7sNSW9w93Jvijvy94iZr7NSbwzef
	 8RKDQRxlaF44BltOP43dGmL17uaVbQ2DawYsN6nGtTgdcOfeTPC3MfJ3wgvyfD13nEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995319;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=/PG22HUnpipGjaN800i0S6Qg/5eh4aaNl1rldurwMEw=;
	b=NhH7HgXNetN+aHXBOI0jpCLppEaAWfhv4H9cKxcFYlRbwhMxheUADoCB+j3FjmPkX2qB
	 oGOeb9ho9xsq+odVfpXPAI7iwI0JOzPZ1LFDZrCa/JjHNe2ORmfC6Fz2nmddcSXsSOoKX
	 k5KbYAReU4+BbedPXdKrApSr7Ldjp5psQx1e2fOKD+LIAjLfuJglRtee3MWHtHbmGEpTe
	 4pek+11ZSsCNjOBu2Rv5cOpqY1nDg4d8o46By1AoZqxv3jDJfAq66Xj9P+W2J5vxGEPoy
	 omUDpPH8uDRG/DPxzCjTfVymXOCWt9iLL79kIFfljRlK+tPneuPPLK/1wyQbu0A70YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="SD/4ffKk";
	arc=none smtp.remote-ip=47.88.81.140
Received: from mail-m81140.netease.com (mail-m81140.netease.com [47.88.81.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F00606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F00606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=SD/4ffKk
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5520d7b24;
	Wed, 18 Nov 2026 17:48:24 +0800 (GMT+08:00)
Message-ID: <abc2d0e2-521c-4ae8-8a8b-e41c8f2bc482@rock-chips.com>
Date: Wed, 18 Nov 2026 17:48:23 +0800
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
Subject: Re: [PATCH v3 4/8] drm/rockchip: vop2: Fix the HDMI sync polarity bit
 order on RK3588
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
 <20261113-vop2-fixes-v3-4-08ae37e83b5c@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261113-vop2-fixes-v3-4-08ae37e83b5c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1ee0eb96103a8kunmdffd083c34ef57
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUNJVkhDSk5CTU1KSE0dHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SD/4ffKkoOL31/82SahftnhWFXNBC2jzLaHRzM6GbsP7Hbz3SM51Nc/ri1edybUEcvBM1vA6QZGVF2GKQEQxxlf/94JzVNKPVwCz54XpfMjMuHYMB7p5dV1v6A1h3RsDGFwHhPp1FIvUv9mwhNUdb1w6+7TO8NXhAb4sKHf6wsY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=/PG22HUnpipGjaN800i0S6Qg/5eh4aaNl1rldurwMEw=;
	h=date:mime-version:subject:message-id:from;

Hi Arun,

On 11/14/2026 12:39 AM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> In GRF_VO1_CON0 the HDMI vsync polarity bit comes before the hsync one
> (bits 5 and 6 for HDMI0, 7 and 8 for HDMI1), but rk3588_get_hdmi_pol()
> puts hsync first. Modes with mixed sync polarities go out with both
> syncs inverted: the HDMI controller sees 1920x1080@144 +HSync -VSync
> as -HSync +VSync in VIDEO_INTERFACE_STATUS0.
> 
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 3e654cb99ddf..6d08988d7007 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -1683,13 +1683,13 @@ static u32 rk3588_get_mipi_port_mux(int vp_id)
>   		return 0;
>   }
>   
> -/* The sync polarity bits in GRF_VO1_CON0 are set for a negative sync */
> +/* GRF_VO1_CON0: vsync bit below the hsync bit, each set for a negative sync */
>   static u32 rk3588_get_hdmi_pol(u32 polflags)
>   {
>   	u32 val;
>   
> -	val = (polflags & BIT(HSYNC_POSITIVE)) ? 0 : BIT(HSYNC_POSITIVE);
> -	val |= (polflags & BIT(VSYNC_POSITIVE)) ? 0 : BIT(VSYNC_POSITIVE);
> +	val = (polflags & BIT(VSYNC_POSITIVE)) ? 0 : BIT(0);
> +	val |= (polflags & BIT(HSYNC_POSITIVE)) ? 0 : BIT(1);
>   
>   	return val;
>   }
> 

Oh, this is a good catch. I verified the RK3588 HDMI sync polarity bits 
are arranged differently from other interfaces.

Would it make sense to add two macros for these bits under 
RK3588_GRF_VO1_CON0 in rockchip_drm_vop2.h:

#define RK3588_HDMI_VSYNC_INVERT	BIT(0)
#define RK3588_HDMI_HSYNC_INVERT	BIT(1)

rather than using raw BIT(0) and BIT(1)?

Best regards,
Damon

