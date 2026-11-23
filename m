Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397140;
	b=DLMYf/Y1fry4lDRaDFbdOdFmmgxpKW25RvBlwncCnYffDzNP9500aiFePG/7SRS1giJY
	 BfzIT8IN6F8KEqmR7fTM5eCbCyA2NLjxI3HpvWuJ0G4kY5CFPjFo+nzWPNr11vTu/7hGD
	 Z+Six95Mz8BgHFTLh5JkwWnjuEVoQEy3QbRsIHGeAljD9NQygx4TMLdvcWKV0hy+t5fRv
	 5SSs1CRbuo9Yo690teXT90JrdHlPcatuTaj3/VtWtSmuogB2S1eW0WiQ7FQGBMzCiKyFf
	 DfxlqvaZdP3/8VDCOT4r72ev5n66dwppdsspupGk8LUJyt+B2wodsiIZU+eUjS8f5tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397140;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=LliMgjnXMFNyw0KxKrefKqjXgD5lvXyOXgtZPmEuFlM=;
	b=NzIE+ia/s6N6GsMzXLWED6rUoEfZafp6D6KF35+oqjxeIHrNSngklg7AqLZ1YPr/izdk
	 V8y1U+kn1jvT0uFFjwrOMjgxFv6easzuoBQcpc4vhzadfVXv4EBrQ8kAl+/Xf8fEGCIt/
	 T9lCV8avWIeYgr8TPX+8FDbiY13NnOznTVypBmo8EwTP0sEN9no8pe795dJY9z1lPg2mS
	 TSMrInkboBaveEE30twnQgnZ/ujRmdpcfVYd20Jgy9geZgbGt2BOZTs7H8Fghq7GjxHOS
	 oeOwneB+3zKff1k1fE+/ZpwXCAhDwOqqSy2R9B9n2UWu68b0xmgvfQrn+G5SWeYGbCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="GT3jbs/W";
	arc=none smtp.remote-ip=210.79.60.112
Received: from mail-m60112.netease.com (mail-m60112.netease.com [210.79.60.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7926E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7926E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=GT3jbs/W
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5594cef32;
	Mon, 23 Nov 2026 09:25:29 +0800 (GMT+08:00)
Message-ID: <0befeff5-c51d-4c4b-a85a-b00835889664@rock-chips.com>
Date: Mon, 23 Nov 2026 09:25:27 +0800
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
Subject: Re: [PATCH v2] phy: rockchip: inno-dsidphy: fix 1.5 GHz rate units
To: ZhuXiangyu <1194781887@qq.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <tencent_6A9CF9A2529C8FA2C04933F2D5D1A259B506@qq.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <tencent_6A9CF9A2529C8FA2C04933F2D5D1A259B506@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa2060212fb03a7kunm415fa07ab4eba9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTE4YVhgfQxpKHUweThkYHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=GT3jbs/WA5Wwx71x54Vye2Ydhd1iE17VsTClqOa7d6cCPDGkX8CbWc7o5X5NBn9zVdfZp66mexixazzG2g15WTqX1CcAUxdW9phTnwi4Q3mrOlCnuuuoIcf97JxnBauQ3YUyHxV9cVtSWjEJSZ1e0IFNxhHEsVjUMi5/Uzre2S8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=LliMgjnXMFNyw0KxKrefKqjXgD5lvXyOXgtZPmEuFlM=;
	h=date:mime-version:subject:message-id:from;

Hi Xiangyu,

On 11/22/2026 1:11 AM, ZhuXiangyu wrote:
> The 1.5 GHz Innosilicon DSI PHY timing table stores its rates in Mbps,
> whereas the other timing tables and the lookup loop use Hz. When
> enabling a mode, the driver compares inno->pll.rate in Hz (e.g.
> 372000000) against timings[].rate in Mbps (e.g. 400), so no entry
> matches. The loop falls through to the last, fastest entry and programs
> an excessively large TLPX/LPX counter, preventing panels from decoding
> low-power DCS initialization commands.
> 
> Convert the 1.5 GHz timing table rate values to Hz so the lookup
> selects the matching entry.
> 
> Tested on an RK3506B board: the panel receives the low-power init
> sequence and the framebuffer console displays properly.
> 
> Fixes: 785a9d5bb145 ("phy: rockchip: inno-dsidphy: Add support for rk3506")
> Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
> ---
> Changes in v2:
> - Split out from the combined drm/phy patch into a standalone phy
>   subsystem patch per Heiko's review.
> - Limit recipients to phy and Rockchip maintainers/lists.
> - Fix Signed-off-by author name formatting.
> 
>  .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> index 6ad04b0c..fcf7aa17 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> @@ -282,20 +282,20 @@ struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1ghz[] = {
>  
>  static const
>  struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1_5ghz[] = {
> -	{ 110, 0x02, 0x7f, 0x16, 0x02, 0x02},
> -	{ 150, 0x02, 0x7f, 0x16, 0x03, 0x02},
> -	{ 200, 0x02, 0x7f, 0x17, 0x04, 0x02},
> -	{ 250, 0x02, 0x7f, 0x17, 0x05, 0x04},
> -	{ 300, 0x02, 0x7f, 0x18, 0x06, 0x04},
> -	{ 400, 0x03, 0x7e, 0x19, 0x07, 0x04},
> -	{ 500, 0x03, 0x7c, 0x1b, 0x07, 0x08},
> -	{ 600, 0x03, 0x70, 0x1d, 0x08, 0x10},
> -	{ 700, 0x05, 0x40, 0x1e, 0x08, 0x30},
> -	{ 800, 0x05, 0x02, 0x1f, 0x09, 0x30},
> -	{1000, 0x05, 0x08, 0x20, 0x09, 0x30},
> -	{1200, 0x06, 0x03, 0x32, 0x14, 0x0f},
> -	{1400, 0x09, 0x03, 0x32, 0x14, 0x0f},
> -	{1500, 0x0d, 0x42, 0x36, 0x0e, 0x0f},
> +	{ 110000000, 0x02, 0x7f, 0x16, 0x02, 0x02},
> +	{ 150000000, 0x02, 0x7f, 0x16, 0x03, 0x02},
> +	{ 200000000, 0x02, 0x7f, 0x17, 0x04, 0x02},
> +	{ 250000000, 0x02, 0x7f, 0x17, 0x05, 0x04},
> +	{ 300000000, 0x02, 0x7f, 0x18, 0x06, 0x04},
> +	{ 400000000, 0x03, 0x7e, 0x19, 0x07, 0x04},
> +	{ 500000000, 0x03, 0x7c, 0x1b, 0x07, 0x08},
> +	{ 600000000, 0x03, 0x70, 0x1d, 0x08, 0x10},
> +	{ 700000000, 0x05, 0x40, 0x1e, 0x08, 0x30},
> +	{ 800000000, 0x05, 0x02, 0x1f, 0x09, 0x30},
> +	{1000000000, 0x05, 0x08, 0x20, 0x09, 0x30},
> +	{1200000000, 0x06, 0x03, 0x32, 0x14, 0x0f},
> +	{1400000000, 0x09, 0x03, 0x32, 0x14, 0x0f},
> +	{1500000000, 0x0d, 0x42, 0x36, 0x0e, 0x0f},
>  };
>  
>  static const

It seems I cannot apply your patch. Please consider rebase it.

Other than that, it looks good.

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi

