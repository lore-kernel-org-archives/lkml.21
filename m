Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522760;
	b=OOZ6TkCSca7SP/nBJnlizbXfGXhXmwzep1KOWmFAxzdA2ezToXSVTAr8g4OGRUflXdsu
	 YGbfU6feWD1Bu5kLVJix9B309RG3r8DZRTZgp1uEd/lZv9T2ToLJ6ogvIBqsXhQ3nq2tc
	 YCCM9bK49qXr3i7m1HkL3FJcQckcBGkbMWpdSGAPIlKwfUqaxWMWCFpp65SroB9vjzwIx
	 7YwSxaoLaYwK/30lMxHVy1h7TpSV6CxHPJBgeAwUY2R6JJ9h3ioVB2VOILsoEjZpPxLLN
	 Wuz+LaxNdZgErsxLhKt0OaGFq35KM3h+CEvyCp40adSXkoJBipdAqQjZkJqRIOGv5GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522760;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=sHPa2z+1FTraZCO6FdoRMaKhFU7GFsXe6EE1nkrGRJQ=;
	b=NZbihaTZjOGYgRBr+e8D/zlHQkfU2ATIzXBhvP1KSXJyKbl6mhrYMcdje9ker8/CQGvb
	 szw89Xhv4kZuFyn6ZLIkfF3ZhVxavQz0OhvTAoSnyOez5UE08PvHbqN5G1pzMGiUudoRs
	 dHnvf8g29/48zpXgAXn6HZeHpvr3Exsi//GIYgICVE92sUC59ZGVG2y7MepOZrkLeIESy
	 wkZY8h/Mo+yTrVSPEfK5nAQ7VlLxYh8Q4BdZQ37tjjK571wfwLVZIyANlRnAwhg/RiQhh
	 sGcl5VTfCN/DUpT//dBT1ljsswqPtrwylP/zla3ggyAcuG3yS+Hbzy/qyfq6nvsTzXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LfnWPLms;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51A5606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A51A5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LfnWPLms
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D8F3497
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:19:16 -0800 (PST)
Received: from [10.2.11.19] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C32283F632
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795522759; bh=fy8LvUxVco45rPYAg/8+0Y0711j3GbM8FlbMCmL5I/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LfnWPLmsB4/Yo4DZLXyxfCFjDqAHa6ons3twT5c8WpB4AVjVefF8YEE/GIKL7qA1C
	 9staSOa0p4D2OhNB5TO/VkI/p4ROSNLN6dJno1rYA1JpqAmknCTrO71N/lNt5nULli
	 ldb+j4Muhn/+Q3DDUANzdmpzLeIebCjdOWbfCTGw=
Date: Tue, 24 Nov 2026 12:19:07 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Haoming Gao <Naixumogu@whut.edu.cn>
Cc: boris.brezillon@collabora.com, adrian.larumbe@collabora.com,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Fix overflow in fdinfo engine time
 conversion
Message-ID: <awWAu9ESYXXygiLP@e142607>
References: <20261121152728.210765-1-Naixumogu@whut.edu.cn>
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
In-Reply-To: <20261121152728.210765-1-Naixumogu@whut.edu.cn>

On Sat, Nov 21, 2026 at 11:27:28PM +0800, Haoming Gao wrote:
> The timestamp counter accumulates GPU ticks per DRM client. Multiplying
> that counter by NSEC_PER_SEC in u64 can overflow before the division by
> the timer frequency, even when the result in nanoseconds fits in u64.
> 
> On an RK3588 with a 24 MHz timer, drm-engine-panthor dropped from
> 768569012750 ns to 422647638 ns between two reads of the same client's
> fdinfo. The GPU cycle counter continued to advance.
> 
> Use mul_u64_u64_div_u64_roundup() to preserve the full product and keep
> the existing rounding. The helper was checked against a 128-bit
> reference on the board, including at the first wrap boundary.
> 
> Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")
> Signed-off-by: Haoming Gao <Naixumogu@whut.edu.cn>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index dc8d0191aef4..39b827a9b9cc 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -8,6 +8,7 @@
>  #endif
>  
>  #include <linux/list.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/pagemap.h>
> @@ -1708,8 +1709,8 @@ static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
>  	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP) {
>  #ifdef CONFIG_ARM_ARCH_TIMER
>  		drm_printf(p, "drm-engine-panthor:\t%llu ns\n",
> -			   DIV_ROUND_UP_ULL((pfile->stats.time * NSEC_PER_SEC),
> -					    arch_timer_get_cntfrq()));
> +			   mul_u64_u64_div_u64_roundup(pfile->stats.time, NSEC_PER_SEC,
> +						       arch_timer_get_cntfrq()));
>  #endif
>  	}
>  	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> 
> base-commit: 878c885830ef004a32e8974c4d1ae14e2ea30c5a
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
