Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423760;
	b=NkK2LyGZ0g3Bt8W/w0nhoC+vVUeS9I8Ndv6B5BRnIg0aqY7cONcar7vDoCVO+gw2CQWc
	 Im1m4luUTcK24cEiq7RTADCJz96OjZl7YXnavGiQ5xrTWN7gSiLdM5v2mcnGJtCC7Fx0T
	 Ef7ike2BunIFWFJYkBDjHeq0puqw8M0qouYAkWwQwffrvAz9uy6mIUH4D9yUJYbHesKLG
	 mjttKDBBES2iqhnwsqjhqMjacXQJUlbQctMN4XRy6V/abq/Gjeu2Cmil0AMzpQG8vlyLS
	 Tw55JSxkXmiNvARXWsKE43JJFHQmMPYLKnnzb3u4QgJW3ZMbCzTIDtWDxq257TH/TBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423760;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Subject:
	 From:Cc:To:Date:Message-ID:User-Agent;
	bh=7bArORR+Sc910cfoLgXZsZ7HS3c7e2HSv+CH5UD+b08=;
	b=132x9VMjcHhNSUM/lbQK8cR0dLVP1IAPBmmjwSyinaoJpknucR/5C+MTPtor6hEhmLwD
	 gz2FB0wN5Oni8kkbiTuCUmsfr2pTSaxMULK8yQgiIl9ILlIlEqVKRcgvuemH7+SJ5v7e7
	 wzQ4npVdHJcgsSXo/tiao72N/os5v5FV/FK4opnZFTTtw91sfPHb/oEDnq+YFw+nxXPRT
	 B6dr/gLXP8iF2y80ABOao9frvN14f41kXAgnHzgDTLBeTunr75RXcAxHECA7VWlfelIBt
	 FoZ67c4kT3bebJb5wtkh22tl8b8QrgNL5ysHh+Ys9ReB3Q4Sm8A8jJt54p8uCxS83Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=InUpxntz;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C24606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C24606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=InUpxntz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795423760; x=1826959760;
  h=mime-version:content-transfer-encoding:in-reply-to:
   references:subject:from:cc:to:date:message-id;
  bh=VDqfNAPy2JKnA+2i2Uf52316VUmvieSrk/qcFA0i+U0=;
  b=InUpxntzV1tWt/iCZDQdq1tPR+GmYE4sW/+MBcaEQ1ghiSLYgWbCVkFU
   0JA+/4/S3w7vbEgJzPsy/oxd9KWcwsf1+tUwDCJOwpBYtBnouN/p8m5F0
   iN+0Z4bTuxDqPgXNUHma3EEHn1Xx4EOYgNZvOfIMGS/962+LujDbnkcB1
   VR7qpXUvUY+ZU+uQ0OFiMpZu4CitCcWjQQbek893zuKmz7eNrmry5jzih
   slOknBYq4ase1CrQNrpP1m9cU6tgsz2kiXZlHls1zqbu2A5FrjeMx9jmJ
   1u+/bTMUR7vfxE5B8D3FAJWCWvQpKEuF05Sjiv9mwb9J1Ca9sBELM1b38
   g==;
X-CSE-ConnectionGUID: KU1QQvZTRcyGcnpIuVfYiA==
X-CSE-MsgGUID: BcmUJe/uSpKHplZjBawnxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4124628"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4124628"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:49:19 -0800
X-CSE-ConnectionGUID: 53nR6vN8RIOQLC9WAMKPyQ==
X-CSE-MsgGUID: M+4leTqeQEeILi+di3OUFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11582492"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.224])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:49:16 -0800
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261121071713.335337-1-haoxiang_li2024@163.com>
References: <20261121071713.335337-1-haoxiang_li2024@163.com>
Subject: Re: [PATCH v2] drm/i915/vma: Fix a memory leak in i915_vma_pin_ww()
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Haoxiang Li <haoxiang_li2024@163.com>, Andi Shyti <andi.shyti@linux.intel.com>
To: Haoxiang Li <haoxiang_li2024@163.com>, airlied@gmail.com, andi.shyti@kernel.org, jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, simona@ffwll.ch, tursulin@ursulin.net
Date: Mon, 23 Nov 2026 10:49:12 +0200
Message-ID: <179542375283.27957.3540837456636790784@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620

Quoting Haoxiang Li (2026-11-21 09:17:13)
> The memory allocated by i915_vma_work() is not freed if
> i915_gem_object_get_moving_fence() fails. Change the
> goto label to do so.

That's better.

You still did not touch the title of the patch, however.
If feedback is given to you, do not submit a new version
without confirming that you addressed all parts of it.
Consider this the last notice before getting ignored.

What you have is a memory leak on error path without any
assessment about if that error path is possible to hit.

Please realize your LLM is very eager to over-state
the impact of any findings. It's your responsibility to
understand the impact and write the commit description
and title accordingly.

> Fixes: 8ec5c0006c50 ("Merge tag 'drm-intel-next-2022-05-20' of git://anon=
git.freedesktop.org/drm/drm-intel into drm-intel-gt-next")

You should just re-create the merge conflict and check which
two patches conflicted. While it's within possibility that
the merge commit itself summoned the error handling code
from thin air as a trivial 'git blame' might show. It's not
very likely, so needs to be looked into.

Regards, Joonas

> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
> Changes in v2:
>  - Modify the commit message. Thanks, Andi!
> ---
>  drivers/gpu/drm/i915/i915_vma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_=
vma.c
> index 16782d8579a8..4ba1c9ea5ecb 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1470,7 +1470,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i9=
15_gem_ww_ctx *ww,
> =20
>                 err =3D i915_gem_object_get_moving_fence(vma->obj, &movin=
g);
>                 if (err)
> -                       goto err_rpm;
> +                       goto err_fence;
> =20
>                 dma_fence_work_chain(&work->base, moving);
> =20
> --=20
> 2.25.1
>
