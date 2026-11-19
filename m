Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109050;
	b=ZsrqPaeyVN6Kpdegf1damVc5DxyFTntcwgHbUHWFpxEeT+Rz1SEmIAJLCiN/6kBplONn
	 ItIplKigkLyJMpYkLhmaLDmiTrLUTu5qCV91rMh39zT08APIiSnQB+Lnhq7IE9P6PGfXb
	 Gk/lOjkADzIlsga6/n5zFaP58ILPx6PgEJ7kMeTFiVhx4+gosIUN++d90SjGG1P67y9VD
	 o81KTTKv+/yXKRmNfjn5ty0yU5IRM5qE4Pmo+3oEsKJ26wKuvkDGAFwP4rCJiGyUF28U+
	 GxcffT9oco/nWj8KAMbwokXpw1cA5v93aEbvWUzan/2Mju4CG6/TlshFM0UJyF0R7Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109050;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=qBQSOtzPb5Dyyy7UCfkkm4GoQy/f0qU0XzNeiniP9cA=;
	b=ycGW3jqyXOBGXh0CkfK9CNKNUgg1DaZYvtwz33kPfSfazHxYeKhJcdGbPL233Zj7aX8g
	 vETF4gpbi1lD3u3QhpgexBFybASgNJtTQ9wCVUdq2sDzYxqjMZq9aY1sz1VAPuzLmTTwG
	 oaiI13QFzrTq9rzFd8ydMolXQLe0XikHi8qDSSq6VchAmz1kZ1Mhx7taXbI89PZlpAp5S
	 NIiqsEOYb8smwq27kz+8jhOOSj1+wKr8jYfVPwLxFzdm8ILe3y3Q1GrptLD2biPw8pK66
	 63416jGPOT8f6AUo0djiSFFjW4+KzQlFAa+SCSdzE4TFE2wxC4hrui3sA/uH2biulAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kfgTh1Wc;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13F4606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A13F4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kfgTh1Wc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795109049; x=1826645049;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=UQ71sU6zYzd/SSWqHxnzrNKZt+CZBGWiDB4bggmKr3k=;
  b=kfgTh1WcQwnkrhwKKeVBF3w/WnPUfv3VcQ67Edex+06qexo8m3fVgnXq
   Wmn5sUKadCZLiepHwf6RY/nD4MWMlTAgCG3Qsiuyyre9KmqtUQx7Chgfp
   IjNsUPNWjbDvz22faxBYv7ntT5vANwBG6sC4Zg8PkCEuQwMWHN8xJgtp4
   cIYY7Xv273CnjmgJgD1uE5JsG0MoBytdca02iKXqoumtjqRjeLvI6Wm1G
   81BEJjnwF+VL6L3PpP3JEAyccF7abo6feI821tE7ESW1XceYKolESnb+2
   Dva3APf8VD91TaNO6Vhuvvcoedx4SjmTgUrnrzGeQ5n6ILcGsIA+wgnZV
   g==;
X-CSE-ConnectionGUID: QvCdJSz5SUeBPRpu0/73+A==
X-CSE-MsgGUID: G4Qll2xHRKe6Jet4WzHqOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3960122"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3960122"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:24:09 -0800
X-CSE-ConnectionGUID: 2wAT42UiTw2ulVwHCNzVNw==
X-CSE-MsgGUID: QgwcaKoZQ6qy+oLWx4PU1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10871779"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.91]) ([10.245.245.91])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:24:07 -0800
Message-ID: <7aa15f50ed768eae3d192312d90568c81956fcb9.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/svm: Initialize xpagemap to NULL in
 xe_svm_get_pagemaps()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Ian Rogers <irogers@google.com>, Matthew Brost
 <matthew.brost@intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Elkin Cruz
 <elkin@google.com>
Date: Thu, 19 Nov 2026 18:24:04 +0100
In-Reply-To: <20261119170716.1523667-1-irogers@google.com>
References: <20261119170716.1523667-1-irogers@google.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-19 at 09:07 -0800, Ian Rogers wrote:
> On integrated Intel Xe GPUs (!IS_DGFX), xe->info.mem_region_mask has
> no
> per-tile VRAM bits set, so every iteration of for_each_tile() in
> xe_svm_get_pagemaps() hits 'continue' without assigning 'xpagemap'.
> The
> post-loop IS_ERR(xpagemap) check then evaluates an uninitialized
> stack
> pointer on every fault/SVM VM creation.
>=20
> Initialize 'xpagemap' to NULL so IS_ERR(xpagemap) evaluates false
> when no
> VRAM regions exist.
>=20
> Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> -Wconditional-uninitialized enabled; fix and changelog drafted with
> an AI
> coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> -Wconditional-uninitialized; not runtime-tested on Intel Xe hardware.
>=20
> Fixes: 8a52f4d9b1ef ("drm/xe: Use the drm_pagemap cache and
> shrinker")
> Signed-off-by: Ian Rogers <irogers@google.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Thanks. Will add relevant Ccs from ("dim fixes") and push after CI
completes.

/Thomas


> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index bc6902b5bf57..22cc7ed19d8a 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -2055,7 +2055,7 @@ xe_pagemap_find_or_create(struct xe_device *xe,
> struct drm_pagemap_cache *cache,
> =C2=A0static int xe_svm_get_pagemaps(struct xe_vm *vm)
> =C2=A0{
> =C2=A0	struct xe_device *xe =3D vm->xe;
> -	struct xe_pagemap *xpagemap;
> +	struct xe_pagemap *xpagemap =3D NULL;
> =C2=A0	struct xe_tile *tile;
> =C2=A0	int id;
> =C2=A0
