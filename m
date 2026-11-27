Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789047;
	b=tsE2YT4hokX4vYQ5J9QMbQ2jaEKleCE9+BLZcPhQStLcc48QIRPaw9s10oNcStHEKlDA
	 /HDDBjTlWCPdE0O/W3+myQs91iokIbqLzLM/PTYlakWY2di66b5o6C7l8BLQ/c8E5LvdQ
	 CiZ1PkxrgXSCj2d5Q0mxYjY4pat3I7SvjKgwPJ1cXplgosHdathcBBtbWXo2N4XNo6JYU
	 ECcVU2XkYSH+Spsf7RkCZeGajJsMh+2C6oO7V3y4iB2nJjao+5AhQk0dWaR/+yIEjOsVo
	 zex9LVnMk9oeaZ0uG+MUFem8WavkkwjgOxIpjeyqJAAf1aexAICt5cYTzlqBOUdNEIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789047;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=+9TlhA78tXzEv6nxeKR2L1L0a+Bsd9ApBvKNN+/IX88=;
	b=VNp1KsM19KPo4itRfTiNN0nQacD0FI/DoHOoVOG43Qtp3gXA9TZEOBFmPeB9fH/vkrKy
	 ZdvKL6Rv+o4jCyC+Zgc2AbWLTM5tQ42R052kjn2YloJnLmuWVydotDQBwgTqBOYQP59cm
	 iGolfCzYhIUl0dkHlm/xwJqG39BR2XrHhWJ6iz2CAQ2xb/MGuNDAoJw4P5gxw1sUYv/Nh
	 k7+Of1t37iHzGrwj1n1U+FeWwOVzAyAdKXR4yf1v3HBj5zGUeeso8FOIpah6OhQs240ff
	 7KevPEJHKDFuRVRn9DgdgrxXP4V9edaNpDJRDf1pLfecnXDsJLmlYXiTpQ5hzpyd+SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XqlRBVve;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED2606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29ED2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XqlRBVve
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795789048; x=1827325048;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=qt0CQ1SvtkAQ0LnetpX4R/T2bdeVCeqh/9sH90gW4l4=;
  b=XqlRBVve6m7S6rQPYd01bJ19i1SdbUXuFcO2NnSHGUHN0OH0ubf0EFu6
   LXWIzHjeEyirjCLLSuDcM8du1tliT17j9Ti1zQmo9qqcep2QKXJQtPcKD
   jg60McXWdX5+0ChfxuKOJWFIgta/Me0E3MBaXsHS0KzjREcGUj7Q0uqsG
   HRwMB80+OvfBbcWsbrenvELvWscDbpBj1/dLR3Mx98eL942UgDVzPdQKp
   ZE3paiGHkFw6FFMOEqxHOA19o6dKmOT03noDwG9c0eAGzoix+Jg7MdwNa
   K8LoV663jYQ/fmto0gcjjiZ2GoVazieF8tQyezm8s4wCyh9K0WkFkeFuR
   w==;
X-CSE-ConnectionGUID: 6eou6nufQmGUKGTzxI6JBg==
X-CSE-MsgGUID: DN8IQKfeS5yMIIHCFnuSFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4604290"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4604290"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 06:17:27 -0800
X-CSE-ConnectionGUID: tXncEY86Rx6WjJiuYy30Wg==
X-CSE-MsgGUID: YlaUFs3GTuiLUjwF5ADF7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12430993"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 06:17:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Bin Luo (University of Electronic Science and Technology of China)"
 <luob87709@gmail.com>, rodrigo.vivi@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/i915/display: hold frontbuffer ref across
 dirtyfb fence callback
In-Reply-To: <20261127133935.1461-1-luob87709@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261127133935.1461-1-luob87709@gmail.com>
Date: Fri, 27 Nov 2026 16:17:21 +0200
Message-ID: <8247d106ca535db291d2f85a3b8bea7956c6ccd8@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 27 Nov 2026, "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com> wrote:
> intel_user_framebuffer_dirty() stores the raw intel_frontbuffer pointer
> in frontbuffer_fence_cb without taking a frontbuffer reference. If the
> framebuffer is destroyed and its owner frontbuffer reference is dropped
> before the reservation dma_fence signals,
> intel_user_framebuffer_fence_wake() passes a freed intel_frontbuffer
> pointer to intel_frontbuffer_queue_flush(), causing a use-after-free.

Please describe a real world scenario where this "if" can happen.

BR,
Jani.

>
> Take a frontbuffer reference via intel_parent_frontbuffer_ref() before
> registering the fence callback, and embed a work_struct in
> frontbuffer_fence_cb so intel_user_framebuffer_fence_wake() only
> schedules the work item and drops the fence reference in atomic
> dma_fence signaling context. Perform intel_frontbuffer_flush(), release
> the frontbuffer reference with intel_parent_frontbuffer_put(), and free
> cb from process context in intel_user_framebuffer_fence_work(). This
> avoids calling intel_parent_frontbuffer_put() in atomic context, where
> dropping the final reference can sleep on xe or deadlock on non-irqsafe
> locks in i915.
>
> Found by static code audit.
>
> Fixes: 1bb2af547a4b ("drm/i915: Handle dma fences in dirtyfb callback")
> Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
> ---
> Changes in v2:
> - Embed struct work_struct in frontbuffer_fence_cb and move
>   intel_frontbuffer_flush(), intel_parent_frontbuffer_put(), and kfree(cb)
>   into intel_user_framebuffer_fence_work() so intel_parent_frontbuffer_put()
>   is never invoked from atomic dma_fence signaling context (fixing the
>   sleeping-in-atomic/deadlock issue flagged on v1).
>
> Testing note:
> Compile-tested on x86_64 with W=1 and KASAN for both i915
> (drivers/gpu/drm/i915/display/intel_fb.o) and xe
> (drivers/gpu/drm/xe/i915-display/intel_fb.o); not runtime-tested on
> Intel display hardware.
>
>  drivers/gpu/drm/i915/display/intel_fb.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 9d71f59..ee0665c 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/dma-fence.h>
>  #include <linux/dma-resv.h>
> +#include <linux/workqueue.h>
>  
>  #include <drm/drm_blend.h>
>  #include <drm/drm_gem.h>
> @@ -2141,16 +2142,26 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
>  
>  struct frontbuffer_fence_cb {
>  	struct dma_fence_cb base;
> +	struct work_struct work;
>  	struct intel_frontbuffer *front;
>  };
>  
> +static void intel_user_framebuffer_fence_work(struct work_struct *work)
> +{
> +	struct frontbuffer_fence_cb *cb = container_of(work, typeof(*cb), work);
> +	struct intel_frontbuffer *front = cb->front;
> +
> +	intel_frontbuffer_flush(front, ORIGIN_DIRTYFB);
> +	intel_parent_frontbuffer_put(front->display, front);
> +	kfree(cb);
> +}
> +
>  static void intel_user_framebuffer_fence_wake(struct dma_fence *dma,
>  					      struct dma_fence_cb *data)
>  {
>  	struct frontbuffer_fence_cb *cb = container_of(data, typeof(*cb), base);
>  
> -	intel_frontbuffer_queue_flush(cb->front);
> -	kfree(cb);
> +	schedule_work(&cb->work);
>  	dma_fence_put(dma);
>  }
>  
> @@ -2160,6 +2171,7 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
>  					struct drm_clip_rect *clips,
>  					unsigned int num_clips)
>  {
> +	struct intel_display *display = to_intel_display(fb->dev);
>  	struct drm_gem_object *obj = intel_fb_bo(fb);
>  	struct intel_frontbuffer *front = to_intel_frontbuffer(fb);
>  	struct dma_fence *fence;
> @@ -2185,6 +2197,8 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
>  	}
>  
>  	cb->front = front;
> +	INIT_WORK(&cb->work, intel_user_framebuffer_fence_work);
> +	intel_parent_frontbuffer_ref(display, front);
>  
>  	intel_frontbuffer_invalidate(front, ORIGIN_DIRTYFB);

-- 
Jani Nikula, Intel
