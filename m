Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125878;
	b=TqQBmwdsJljCQKkoZHwht6OZJnthbMdDMKXjxHztqi0NitBfyd8NVWKubCjLsGwtSdel
	 u//jEWzj31D7FFs2ro5bhmlo6oPnqL/41HCpIooMGZ3VsAhBu758lrQmtBFqaDMnAWzEQ
	 rGSaFONYUO7N3cVEqWfyVHYcQ3RhF6QZJekXvfhN4IMj1cA+VPT9wkWXdsIobCqMVTw7T
	 Ge97YxleA/pgJVOgkSUT1HMbDGtRlOtiMO9wakkS7CKcmxZDEVbwVQdlg/8JRQ0knF6sR
	 tshsSu25CiEU4kqErEpSMsDrZgJVuK86Jv31gpZsure2wyTe8jx1Ptd+GxAKMyOqLXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125878;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PI7G2oNkJyP4qTtg2yF+n/o1C/UwLBkBdnZWxPffPSM=;
	b=5DJGnM7jT68uWDXaNyU1S6JCmhQBuuFkcRDqksSczGLpQxYWwPMT2hq1vDeLFniF/Xea
	 w4EUrgzt2idfuZB/Oj61jMOkxybYfvmYdwRVJQgmtYGAYTgaAyMtPKzGhL8CyMo3ns6AK
	 jiY+5i+NsYBNsqCbT6X1zWiImT2mL/rohy9WVw3cLR0QTKoS3slYk+maURfCYna5m1CC/
	 CBGexWz9fsb/yWTyMsbfH4DOrXEcUoQBec5qoMl5LSr+q6d0SLPKdSslGG9/OUq8SCycc
	 p5zG2rgkpYdjPaShfePXB8Pr7Zf1KaynDHXqj+qNxyT03lFDDj8bE1ely09PcmW6ZAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U1JaDGAF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3CB60A2613
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U1JaDGAF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FF41F000CA;
	Thu, 19 Nov 2026 22:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795125877;
	bh=PI7G2oNkJyP4qTtg2yF+n/o1C/UwLBkBdnZWxPffPSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U1JaDGAFwasS7MYay0oPg1k0PaGyii50B2MJqs3mm6k1/gkmRCAeYt+Vx98uWf0RO
	 0cCL5CkoCcJrS7YB7BwETQC8KYr2rrzxEcBhnHaOxSqs3/7ej/bmwHe+IZgw4dM/0s
	 FEvP7LUrARGVFW/gJ527xrfJ/vbBQamYn/hvm7PXjzhPKQa7T4y5YxPY+hV1S/TTTW
	 7iGZpbYkSnj+QugGhTABjkE5p8uXqIKEQtj4iXDM6kGk7KYVRuYxSo9/SVfbtPkLw4
	 dFBQKllaYZi6O+uvFIruwlHWUtIS7lBLpQ9E8GXs9hKqigtUz85jQcW2Yb/+K0GJ1t
	 lHsvUtEMlqiHg==
Date: Thu, 19 Nov 2026 23:04:34 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Haoxiang Li <haoxiang_li2024@163.com>, airlied@gmail.com, 
	jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, simona@ffwll.ch, tursulin@ursulin.net, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/vma: Fix a memory leak in i915_vma_pin_ww()
Message-ID: <av9xxr03wFlfWwhv@zenone.zhora.eu>
References: <20261118153205.2432736-1-haoxiang_li2024@163.com>
 <179507544606.16202.12430112951192190652@jlahtine-mobl>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179507544606.16202.12430112951192190652@jlahtine-mobl>

Hi Joonas,

On Thu, Nov 19, 2026 at 10:04:06AM +0200, Joonas Lahtinen wrote:
> Quoting Haoxiang Li (2026-11-18 17:32:05)
> > i915_vma_pin_ww() allocates bind work before retrieving the object's
> > moving fence. If the lookup fails, it jumps to err_rpm, bypassing the
> > fence commit at err_fence and leaking the work allocation.
> > 
> > Jump to err_fence instead so the fence callbacks can release the work.
> > 
> > Fixes: 8ec5c0006c50 ("Merge tag 'drm-intel-next-2022-05-20' of git://anongit.freedesktop.org/drm/drm-intel into drm-intel-gt-next")
> > Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> 
> You seem to be spamming the different kernel subsystems with patches and
> never respond to any feedback, so if you could just stop and do something
> else.

The patch is correct, though, and I'd take it.

If Haoxiang is not responding to other patches then bad for him
and I'd give the same suggestion as you did. But if we are not
taking this patch, then we would remain with a clear known
liability in our code.

Andi
