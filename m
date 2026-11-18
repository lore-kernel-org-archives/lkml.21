Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988560;
	b=XwxlUoZ3c5jkQqL3sWNc/dHXCyzaw310Kf4GallFw8gberEKobnTX/FnHZ3Fwk0yhGBL
	 u3D452Tf/429Y8DJVoka1lgJCjZ1doDLjvy44L4ErllyLwfRaaFZ9nT66GnJpoduFU5Lf
	 y7ZQ6z5xiWPdmdnUPn4+fDnOs6lHkl7qM8aWmsTY4EdJRShwPgllOCuiWySzS6BvYDAlb
	 XGlhSNN6Z+3qcnvxNGRidBCQi4eszFaK0qC84QZEKbi2SGHZa/CQVwLl1uD/efwWFgCu6
	 3Lg3GXuho1IdGZcX9IVyvN42ujh2/9SzslkKNXLJc6IW22Yb8fjXJUluhW3Mbon+r3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988560;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=yoojdmS52xksREd25PZVdu2MX9Ot+zg4Wegw5yQYlu4=;
	b=F27TajDJvdvpkrTLv4Ia3DPbddHLDiN+JnubLQHkXd/66Lhd9VOJVp9vpTEIQuo4DUrD
	 VmPV6N+yfYt2JU8BfQzVPFid5sDmj68i6d6qrz2njZXXY56eumI5A46Ys9/T0V28ci1ps
	 w082E/mIsnxBHCgErDYYEVAVCJcdfOyFDZg9XsdGAa186NkyVcyaFDOksrZ4kKWBIB/+c
	 S7J7aqvCD2dfVJkxQbz3KAzwzQhIi1R+7LE4L+57Ja+wh9x8MnA7Z4+mFcdMW+tsXPxB8
	 rdaa2hRdkkofxUsETo+4IAXam8aWH3R7OhoZSKUxKMxZg7G2P2xyRL1iSGxqB+qFKMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=RyQFNc4i;
	arc=none smtp.remote-ip=103.209.128.75
Received: from mail-m12875.netease.com (mail-m12875.netease.com [103.209.128.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6445606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6445606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=RyQFNc4i
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 551bffbb0;
	Wed, 18 Nov 2026 15:55:45 +0800 (GMT+08:00)
Message-ID: <8e614b4d-b2be-4da8-8003-de88f22ab7ef@rock-chips.com>
Date: Wed, 18 Nov 2026 15:55:44 +0800
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
Subject: Re: [PATCH v3 2/8] drm/rockchip: vop2: Don't use uninitialised
 dividers on RK3588
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
 <20261113-vop2-fixes-v3-2-08ae37e83b5c@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261113-vop2-fixes-v3-2-08ae37e83b5c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1eda7965b03a8kunm1a1ddd1833dd04
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGR5DVkgeHktKSUlMSx4aTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=RyQFNc4ij2drw6Fx0nqJbDh+SFPMGM1Pqfbh0IhdR4KcOBgFgAMAIFpF/e2okYwYuUcCAohtps8YxDc0spFY7KMXP83tQQMfG/ESJAeh/zlQa5QQZh4F0HozwlE4sFb7RobNAO+ZD02FwVmFtA6gw0qFMA3yf1x3NBMlsCXp4qI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=yoojdmS52xksREd25PZVdu2MX9Ot+zg4Wegw5yQYlu4=;
	h=date:mime-version:subject:message-id:from;

On 11/14/2026 12:39 AM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> rk3588_calc_cru_cfg() converts all four dividers with ilog2(), but every
> interface only sets the ones it uses: dclk_out_div is left uninitialised
> for HDMI, eDP and DPI, if_dclk_div for DP, MIPI and DPI, and
> if_pixclk_div for DP and DPI. For HDMI and eDP the uninitialised
> dclk_out_div is then written to RK3588_VP_CLK_CTRL.
> 
> Set the dividers an interface doesn't use to 1.
> 
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Suggested-by: Damon Ding <damon.ding@rock-chips.com>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index c44648e1bc0d..f340aba5bfd1 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -1597,6 +1597,7 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>   		 */
>   		*if_pixclk_div = 2;
>   		*if_dclk_div = 4;
> +		*dclk_out_div = 1;
>   	} else if (vop2_output_if_is_edp(id)) {
>   		/*
>   		 * edp_pixclk = edp_dclk > dclk_core
> @@ -1609,6 +1610,7 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>   		 */
>   		*if_pixclk_div = K;
>   		*if_dclk_div = K;
> +		*dclk_out_div = 1;
>   	} else if (vop2_output_if_is_dp(id)) {
>   		if (output_mode == ROCKCHIP_OUT_MODE_YUV420)
>   			dclk_out_rate = v_pixclk >> 3;
> @@ -1622,6 +1624,8 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>   			return 0;
>   		}
>   		*dclk_out_div = dclk_rate / dclk_out_rate;
> +		*if_pixclk_div = 1;
> +		*if_dclk_div = 1;
>   	} else if (vop2_output_if_is_mipi(id)) {
>   		if_pixclk_rate = dclk_core_rate / K;
>   		/*
> @@ -1643,8 +1647,12 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>   		 * mipi pixclk == dclk_out
>   		 */
>   		*if_pixclk_div = 1;
> +		*if_dclk_div = 1;
>   	} else if (vop2_output_if_is_dpi(id)) {
>   		dclk_rate = v_pixclk;
> +		*dclk_out_div = 1;
> +		*if_pixclk_div = 1;
> +		*if_dclk_div = 1;
>   	}
>   
>   	*dclk_core_div = dclk_rate / dclk_core_rate;
> 

Reviewed-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon

