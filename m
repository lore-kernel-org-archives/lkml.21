Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075974;
	b=4MUW8CQMuGv02K1o7nXqQzRlKxD67XlRdxpsEGwo1ZORupC1m36c4+5VZF6gQq98Ab+d
	 UwqGA3n0zL6OZYL1gWFPgaYFuCuFdsbi1eKiqvrvE/Vpha4LOWqhoty7hJHIwg5f1sZtx
	 KrDVweJ1WAOE6YDKTEjCHsqqO5SM6G9SyoDZpXFTkcabtA+YA0297l2QIMgwa+c1FEb6m
	 AiDjdc4cZ/j3tvsFCIy8cYxxzASpZUZJkX/z62X+IrtYCc0z5eE9bNOcb8Pmh63Cor7Aw
	 UhEoG8A6bTJte+HT3DI2gJ0t2UU9N5B6uTAHLdeO9FjxnNA7r/tj8gOhPWG3gB/0bJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075974;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=sEDo3geuRJ+ZCobWdClIXQoiN141yKNKjwU1nkwOgXc=;
	b=01Ld+BDBKnlx9798yVE2zPzpVBujAvrIyG+CJF3OstE1pwox0BrejrhY2vwc+Dnbyllq
	 PUtSJU7eVNrvby6RLoo6DXdHUhDJ5o5mmj1MlUrDy6Uf9NAmVPFb/3wFxs7GRKxuropdm
	 yx6KtXXUZmAmWvPjMh+yTv+t2uzAyofxi+ZD7UWled3OpANC8/jzUwzraYwoywmVcy9dm
	 V5s+DY1f3VSAT1toV/Pa9BI388i52lFaOFAHo0bcYHgATXCo/SiSFFsfpVToMjcSgmdH7
	 B931dgOUpkyp+lN4Ygg1P3NLhAxUBJZ5DGNdWuupnFDOJDg0CxDSlE+7440X3IHZtYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MIbIGg58;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F422606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F422606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MIbIGg58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795075971;
	bh=ZQMB01aIN8qNya3qxG4hUX6cPbDHbcS4V5cVbvOVu1E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MIbIGg58jv9Q0GXJQ4L0ldxK2bdoC2tZ42YFmhF/UfmuU+uNUI2FqAGuQXfGfA1Iy
	 Ybse6WJbktSHZcs2SR/LdKxAIF7LfeOrr3WKzGe1Lbva68mkYqWpB+hMOTAVYLP/Ge
	 EvIKEt/nxZdVdKcaDwUvGuu26i6h0wOksN0A5/umH6d+B5pSwf2BO69kP54p8C/S4v
	 Zh6Wv5/1C94dmAv98dmGQTE5L2kHvpDR25kCyYOTcRpIw/Th11e9VxkW40VMWEe60T
	 aww5sgUC/kvUYiFiQSfElHbFYXUS611ZAHM77CLetC3BcVm6aT048frg6KjZjLC6oS
	 N8neO27b5xV6A==
Received: from fedora1.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FC7F17E02F2;
	Thu, 19 Nov 2026 09:12:51 +0100 (CET)
Date: Thu, 19 Nov 2026 09:12:46 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, Akash Goel <akash.goel@arm.com>, Lukas
 Zapolskas <lukas.zapolskas@arm.com>, Chris Diamand <chris.diamand@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 10/10] drm/panthor: Skip devfreq when no OPP table is
 present
Message-ID: <20261119091246.58b806e9@fedora1.home>
In-Reply-To: <20261118175332.519657-11-karunika.choo@arm.com>
References: <20261118175332.519657-1-karunika.choo@arm.com>
	<20261118175332.519657-11-karunika.choo@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 17:53:26 +0000
Karunika Choo <karunika.choo@arm.com> wrote:

> On Mali v15 AM systems, frequency scaling is handled outside panthor by
> the AM_GOVERNOR block, so the GPU DT node may not provide an OPP table.
> 
> Make panthor_devfreq_init() return early when dev_pm_opp_get_opp_table()
> returns -ENODEV, and guard the devfreq helper paths against a missing
> devfreq instance. Also make it so that frequency can be queried even if
> the devfreq instance is missing.
> 
> This keeps devfreq enabled for existing platforms while allowing v15 AM
> systems to probe without a local devfreq setup.
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
> v3:
> - Omit drm-maxfreq-panthor from fdinfo when the maximum frequency
>   is unknown, as on AM systems without an OPP table.
> v2:
> - Directly call functions instead of storing function pointers.
> - Picked up R-b from Liviu
> v1:
> - Only skip panthor_devfreq init when OPP lookup returns -ENODEV instead
>   of direct DT-property check.
> - Support frequency query without devfreq.
> 
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 29 +++++++++++++++++------
>  drivers/gpu/drm/panthor/panthor_drv.c     |  5 +++-
>  drivers/gpu/drm/panthor/panthor_hw.h      |  6 +++++
>  3 files changed, 32 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index 2249b41ca4afe..d1814b5197221 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -12,6 +12,7 @@
> 
>  #include "panthor_devfreq.h"
>  #include "panthor_device.h"
> +#include "panthor_hw.h"
> 
>  /**
>   * struct panthor_devfreq - Device frequency management
> @@ -164,6 +165,19 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	 */
>  	table = dev_pm_opp_get_opp_table(dev);
>  	if (IS_ERR_OR_NULL(table)) {
> +		/*
> +		 * On v15 GPUs, frequency scaling is handled outside of panthor
> +		 * by the AM_GOVERNOR block, so the GPU DT node may not provide
> +		 * an OPP table. In such cases, do not initialize devfreq for
> +		 * panthor.
> +		 */
> +		if (panthor_hw_is_gen5_am(ptdev->base.dev) &&

Could we have a property in panthor_hw or panthor_soc_data that
reflects whether devfreq is delegated or not, and move this commit
before the one introducing v15 support?

> +		    PTR_ERR(table) == -ENODEV) {
> +			drmm_kfree(&ptdev->base, pdevfreq);
> +			ptdev->devfreq = NULL;
> +			return 0;
> +		}
> +
