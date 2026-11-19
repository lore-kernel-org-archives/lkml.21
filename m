Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081684;
	b=PaUbmddwvEN3P9UGeUG8UZB1oZydi1aSLq7Wf3QjN6AFGNjBvhpjKPcYH6BVa0NdcFu5
	 hYME0LK3hArAEMUuzcHzCFTUQrmInPrRNiSLvrma2J/pgkag3JSIxoc6DkEfMgX3g1+0u
	 zgT1hflFjJm6Wjgi7ScwzrI5WE3wIgP+NcefWHhbPuVCskQj0O5q5X0xPv5NugMJcXCXx
	 XuBbtUI9fET6n/AH+yJYaaWPA5i1C97FxUtM0PhBhvecTTxXdqECIDDXcqKesc7z3YgcL
	 BLPhHGLS6sAg9e9rmeV5LnE71Aawpwx97520ydeA6M1Klu+m0QtCYqfBvDTMUqUvN9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081684;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Rwi+y2oMgzTK3c5t6qt3n55zaa6rzIKpGf6mVulcFRU=;
	b=i0XSWXG99jAnNAemL1uS4YhUwZ1BeHwdvRacpMZkclXsyydlz1+nkH4BIQ1EdOqDVyCN
	 SPBumyVDj/jDjLUtqNL9st8fYbfUhcbzMLTTGswE3R8T+K0Y6rKJnkrAkcpIMc7t563ju
	 O9Heu6foCfhUycEsyuVUfGHw6526YQGKj669me1PSWTHRxRE6phvPOHhWjBhw88z8kmAV
	 gDybFf+nnBWpvlqGyGVf2Y8NFy7JDfk5yIlu7Zh2cRckJe2MKt2svKaTpzmsISxJsQj2k
	 tk0CDGDMpLOXdM3j7P7Iy03XSRu6+29cPOKOtciummDeIU5EOMi1LRoOcxtBxadI74w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PHdNXUz8;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A4B606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A4B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PHdNXUz8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E70B219F0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:47:59 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A78DB3F882
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795081682; bh=pc2AKAjzdVqoK2Jc7Nq7Y1VxQXYoLYZk9Ke7OpUrCLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PHdNXUz8a9pypkohU5wLtb3wNrXfENxhvOtt6pestGLmTfUf3nYZbrKpiKfNtkhOW
	 ZNCksNXgGnvKCNRMYmlEX3jLiZJkwRf82Rlx1Zt8MKAdECkw6YndFa8hCM2q83YpK7
	 k4WKEJi50KHPx3S9snHDSBDDJndq1aplBwWRCJyE=
Date: Thu, 19 Nov 2026 09:47:58 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>, linux-kernel@vger.kernel.org,
	Akash Goel <akash.goel@arm.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Chris Diamand <chris.diamand@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 02/10] drm/panthor: Rename neural accelerator feature
 macro to NX
Message-ID: <av7FzqjoPGxrPN5O@e142607>
References: <20261118175332.519657-1-karunika.choo@arm.com>
 <20261118175332.519657-3-karunika.choo@arm.com>
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
In-Reply-To: <20261118175332.519657-3-karunika.choo@arm.com>

On Wed, Nov 18, 2026 at 05:53:18PM +0000, Karunika Choo wrote:
> Rename GPU_FEATURES_NEURAL_ENGINE to GPU_FEATURES_NX.
> Update the panthor_hw helper to use the new name.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_gpu_regs.h | 2 +-
>  drivers/gpu/drm/panthor/panthor_hw.h       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu_regs.h b/drivers/gpu/drm/panthor/panthor_gpu_regs.h
> index 5340966caef37..c7581b6d4c5be 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_gpu_regs.h
> @@ -67,7 +67,7 @@
>  
>  #define GPU_FEATURES					0x60
>  #define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
> -#define   GPU_FEATURES_NEURAL_ENGINE			BIT(4)
> +#define   GPU_FEATURES_NX				BIT(4)
>  #define   GPU_FEATURES_RAY_TRAVERSAL			BIT(5)
>  
>  #define GPU_TIMESTAMP_OFFSET				0x88
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index eeca936f44bae..f770dc40e6216 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -64,7 +64,7 @@ static inline bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev)
>  static inline bool panthor_hw_has_neural(struct panthor_device *ptdev)
>  {
>  	return (GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) >= 14 &&
> -		ptdev->gpu_info.gpu_features & GPU_FEATURES_NEURAL_ENGINE);
> +		ptdev->gpu_info.gpu_features & GPU_FEATURES_NX);
>  }
>  
>  #endif /* __PANTHOR_HW_H__ */
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
