Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.83.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396376;
	b=jz+db/PADeIA9PgpB1lAYdpSjzrPUmaay56wUt4rh4oMNfU5PJ9DvvCZLURK2/5eNWLh
	 ZXAKmUNfxbiirGOIQi/Vw2Pubz6uC2B2YirVhQpWJKrzJo6cLVAKAxXrDhBSfT9Yv4Ba/
	 8lkUOZ/XRvCHpgMmVPQMed/H1XzLx9GjrhigtbjqpN4FIJggl/u4Z7cJctO6mfc10wjuI
	 XqUVGMNawBHGcmnDqLICOvrafgF2FOjjn0BlCIo5i8aOb40d22zX+GaKwryivcdpYJQf8
	 1EjY6JEGd/DvjinaOy9CQOBjvbw4zJRLSVyvf0DNQjFjQFEAnhBatN/5R8Q5TGFiYsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396376;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=0Gp1eyUb1TRq0HLGTC1lCi4kXREArXMUBnkCXCJmk+g=;
	b=t8gisx50qKKd9GSNeLc5Sm+Y42ehUrX026NUC0+yUIJ3f1lSLIBpiOK62aC6Hi+jSOHC
	 JJPhqXNMqo5Hryebg8u4Yyi6n1+K7FJvhPIL386Lu9tV2zPNE8mX2OleMmDisPzcGzqHS
	 KcglUE5XM4aSwAKRdWNgBfZnBFUNE6LGGlWVWjA5e2fL96dL2VM76IuqNPF/f9ZyL2kT8
	 /uyanvL5/Vkid7F5ULjmWtmu4ZATvk6helb/NNLsnVl8tYHnCsyT/UzBT4ygiAYmzuLuk
	 ieAM960N5aFMgx426FlVZERDt5y7ENfBTvU9wrIsaZfEugg+NsPmNsZiuAhfHv9CLhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=XfVFItQf;
	arc=none smtp.remote-ip=156.224.83.146
Received: from mail-m83146.xmail.ntesmail.com (mail-m83146.xmail.ntesmail.com [156.224.83.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199BF606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 199BF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=XfVFItQf
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5594437e6;
	Mon, 23 Nov 2026 09:12:44 +0800 (GMT+08:00)
Message-ID: <04e31b87-e766-4fb8-a361-0e92b1ab12ae@rock-chips.com>
Date: Mon, 23 Nov 2026 09:12:42 +0800
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
Subject: Re: [PATCH v2] drm/rockchip: dsi: enable RK3506 PHY data lanes in GRF
To: ZhuXiangyu <1194781887@qq.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <tencent_C4C715C962613597F98212938F8940633306@qq.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <tencent_C4C715C962613597F98212938F8940633306@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa205f6674d03a7kunme2eb5a24b4b784
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQkNCVh9OSUMZQkJCGBgfHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=XfVFItQf3zmtTWT5dWXxy2+IBA8SoihxLBFhsNLWJcR0kd+7H5NxCN2UyNu0YbRlNkuiCF9rw4bezgW1BndNvr62M/1nDpAcngQmjKtky4966raCiSNBJY9/C7Wgv5JxF8h18TGc6sW32EFQM/dv5qqsrGHFw04XfoWBG7cS2Is=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=0Gp1eyUb1TRq0HLGTC1lCi4kXREArXMUBnkCXCJmk+g=;
	h=date:mime-version:subject:message-id:from;

On 11/22/2026 1:10 AM, ZhuXiangyu wrote:
> rk3506_chip_data currently only clears the turnaround, force-rx, and
> force-tx-stop fields in RK3506_SYS_GRF_SOC_CON6. As a result, the DSI
> PHY data lanes remain disabled unless the bootloader happens to enable
> them.
> 
> Set RK3506_DSI_PHY_ENABLE_LANE0 and RK3506_DSI_PHY_ENABLE_LANE1 in
> lanecfg1 so the data lanes are reliably enabled by the driver.
> 
> Tested on an RK3506B board: the panel receives the low-power init
> sequence and the framebuffer console displays properly.
> 
> Fixes: cabeacc7eadc ("drm/rockchip: dsi: Add support for rk3506")
> Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
> ---
> Changes in v2:
> - Split out from the combined drm/phy patch into a standalone drm
>   subsystem patch per Heiko's review.
> - Limit recipients to drm and Rockchip maintainers/lists.
> - Fix Signed-off-by author name formatting.
> 
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> index 30d6f83c..116cc140 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -199,6 +199,8 @@
>  
>  #define RK3506_SYS_GRF_SOC_CON6		0x0018
>  #define RK3506_DSI_FORCETXSTOPMODE	(0xf << 4)
> +#define RK3506_DSI_PHY_ENABLE_LANE1	BIT(9)
> +#define RK3506_DSI_PHY_ENABLE_LANE0	BIT(8)
>  #define RK3506_DSI_TURNDISABLE		BIT(2)
>  #define RK3506_DSI_FORCERXMODE		BIT(0)
>  
> @@ -1727,7 +1729,9 @@ static const struct rockchip_dw_dsi_chip_data rk3506_chip_data[] = {
>  		.lanecfg1_grf_reg = RK3506_SYS_GRF_SOC_CON6,
>  		.lanecfg1 = (FIELD_PREP_WM16_CONST(RK3506_DSI_TURNDISABLE, 0) |
>  			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCERXMODE, 0) |
> -			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCETXSTOPMODE, 0)),
> +			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCETXSTOPMODE, 0) |
> +			     FIELD_PREP_WM16_CONST(RK3506_DSI_PHY_ENABLE_LANE0, 1) |
> +			     FIELD_PREP_WM16_CONST(RK3506_DSI_PHY_ENABLE_LANE1, 1)),
>  		.max_data_lanes = 2,
>  		.max_bit_rate_per_lane = 1500000000UL,
>  		.dphy_get_timing = dw_mipi_dsi_phy_px30_get_timing,

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi

