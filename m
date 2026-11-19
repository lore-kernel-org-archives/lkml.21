Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074798;
	b=BgjJu5ILY9VKtYSgDwvgM++CnHOtG+953WEVcE4ymZd36/DWtD4Q6UI5BY1c02zsm4JE
	 n4JsOQfFodPEedfUjKLV36XTpLi8/hqnZ6xtTPRMgJdHmBiDcEzeUQMpF+Nyq76dZijPj
	 9d0EStfRtENPVqt+K73Q6hk7XOEURtkwXTtbIWiJlBRQpiH9cbdSf+HutATUsegkEnTcn
	 R+AOAuaS+MERJkh5vgAqL6AGq38Zl8Cptak4/LFkymHNbE0HIWkf0dmdaAP0XTAUuUoH3
	 nCgGCrVvM4T97cRDcBRUwa+2fumOfzKl87s/XFB/TU5HMx53awq5txiY4KrKnqkM+8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074798;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=JO20nQ2be7X8mLaByweDn6y6z9bbk8glFXExRs8wKNI=;
	b=PoxY9qSIy+EzSq+daD5M8ktZJhAo+XJI5HKwzBtN1aIoS+0ZIW7/TOwKkK/H+iT5c+VH
	 OnhXJJkh/1qd+FUjOAz0hkK6FfCaWo/EJxNpBICh4XmVe3IEmeZVibCjFSoQdfpVhFAsj
	 v9s+Itc3djLc49aKgvYhEnwH6vTfLimJXhDQGdnm6onTCVH5GD6Z6tbD33xcGfKogIN19
	 bJvC9wrL193BmI4kFFfGkutYIag646hgR1s7/7mSiIgqxcswB+DbzUR/gbFx4KSeqETtp
	 Xf7qG3NqCqQDARnP58zu1Xoti5KN3bNnaNHwUzPt+W/qCvHn4O9D379wNfPdYc9sEIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Vn+ozZgu;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8083606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8083606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Vn+ozZgu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795074796;
	bh=MUwt9KfpyJd9a2TBoMoV2jG2Vpo8Te/ybW2eWXncKqE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Vn+ozZgutN5WDR8GCmpvLL3pVPuV/A0XSubOkLlYwNSurXN8Ju9lV1QLuVmqdNi1R
	 LYjpLeUu3Y/GwkUAkixqWq8KU3CgaWWLKF19aSWSmldiWDkPfQw83UlN7vE12bd2HB
	 DNnDWfKI2ChVHA6PY2iNkUPzt7wRq3srk1+5DUwtpYI6qpvREZZ1IB/793+ONpB2sr
	 LJysqecSZl5KeXp9P/HK1hUKH3wxh4shxL3lp/l5Yt2/PJsVdgHXimEwXhJYZULZNt
	 FZUKO1dXqP5yzqMKHrV69IgoIl6q4TgxbjKTnB3YGRTemTBFNjGPTZrkyYVionn+/a
	 Qw9gA5gumrEjA==
Received: from fedora1.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A34FC17E047C;
	Thu, 19 Nov 2026 08:53:15 +0100 (CET)
Date: Thu, 19 Nov 2026 08:53:11 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, Akash Goel <akash.goel@arm.com>, Lukas
 Zapolskas <lukas.zapolskas@arm.com>, Chris Diamand <chris.diamand@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 03/10] drm/panthor: Move register access helpers out
 of panthor_device.h
Message-ID: <20261119085311.7a53e88e@fedora1.home>
In-Reply-To: <20261118175332.519657-4-karunika.choo@arm.com>
References: <20261118175332.519657-1-karunika.choo@arm.com>
	<20261118175332.519657-4-karunika.choo@arm.com>
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

On Wed, 18 Nov 2026 17:53:19 +0000
Karunika Choo <karunika.choo@arm.com> wrote:

> Move register access helpers out of panthor_device.h to allow reuse by
> other panthor drivers that will be added to enable v15 support.
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
> v2:
> - Picked up R-b from Liviu
> - Fix includes raised by sashiko
> - Link: https://lore.kernel.org/all/20260922205441.263661F000FF@smtp.kernel.org/
> v1:
> - Includes "panthor_device_io.h" directly in "panthor_device.h" instead
>   of peppering multiple files with the header.
> 
>  drivers/gpu/drm/panthor/panthor_device.h    | 73 +-----------------
>  drivers/gpu/drm/panthor/panthor_device_io.h | 84 +++++++++++++++++++++
>  2 files changed, 86 insertions(+), 71 deletions(-)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_device_io.h
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index b55a3f9edd414..4add31b12cfd7 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -19,6 +19,8 @@
>  #include <drm/gpu_scheduler.h>
>  #include <drm/panthor_drm.h>
>  
> +#include "panthor_device_io.h"
> +
>  struct panthor_csf;
>  struct panthor_csf_ctx;
>  struct panthor_device;
> @@ -495,77 +497,6 @@ panthor_exception_is_fault(u32 exception_code)
>  const char *panthor_exception_name(struct panthor_device *ptdev,
>  				   u32 exception_code);
>  
> -static inline void gpu_write(void __iomem *iomem, u32 reg, u32 data)
> -{
> -	writel(data, iomem + reg);
> -}
> -
> -static inline u32 gpu_read(void __iomem *iomem, u32 reg)
> -{
> -	return readl(iomem + reg);
> -}
> -
> -static inline u32 gpu_read_relaxed(void __iomem *iomem, u32 reg)
> -{
> -	return readl_relaxed(iomem + reg);
> -}
> -
> -static inline void gpu_write64(void __iomem *iomem, u32 reg, u64 data)
> -{
> -	gpu_write(iomem, reg, lower_32_bits(data));
> -	gpu_write(iomem, reg + 4, upper_32_bits(data));
> -}
> -
> -static inline u64 gpu_read64(void __iomem *iomem, u32 reg)
> -{
> -	return (gpu_read(iomem, reg) | ((u64)gpu_read(iomem, reg + 4) << 32));
> -}
> -
> -static inline u64 gpu_read64_relaxed(void __iomem *iomem, u32 reg)
> -{
> -	return (gpu_read_relaxed(iomem, reg) |
> -		((u64)gpu_read_relaxed(iomem, reg + 4) << 32));
> -}
> -
> -static inline u64 gpu_read64_counter(void __iomem *iomem, u32 reg)
> -{
> -	u32 lo, hi1, hi2;
> -	do {
> -		hi1 = gpu_read(iomem, reg + 4);
> -		lo = gpu_read(iomem, reg);
> -		hi2 = gpu_read(iomem, reg + 4);
> -	} while (hi1 != hi2);
> -	return lo | ((u64)hi2 << 32);
> -}
> -
> -#define gpu_read_poll_timeout(iomem, reg, val, cond, delay_us, timeout_us)	\
> -	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false,	\
> -			  iomem, reg)
> -
> -#define gpu_read_poll_timeout_atomic(iomem, reg, val, cond, delay_us,		\
> -				     timeout_us)				\
> -	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us,	\
> -				 false, iomem, reg)
> -
> -#define gpu_read64_poll_timeout(iomem, reg, val, cond, delay_us, timeout_us)	\
> -	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false,	\
> -			  iomem, reg)
> -
> -#define gpu_read64_poll_timeout_atomic(iomem, reg, val, cond, delay_us,		\
> -				       timeout_us)				\
> -	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us,	\
> -				 false, iomem, reg)
> -
> -#define gpu_read_relaxed_poll_timeout_atomic(iomem, reg, val, cond, delay_us,	\
> -					     timeout_us)			\
> -	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,		\
> -				 timeout_us, false, iomem, reg)
> -
> -#define gpu_read64_relaxed_poll_timeout(iomem, reg, val, cond, delay_us,	\
> -					timeout_us)				\
> -	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us,	\
> -			  false, iomem, reg)
> -
>  #define INT_RAWSTAT 0x0
>  #define INT_CLEAR   0x4
>  #define INT_MASK    0x8
> diff --git a/drivers/gpu/drm/panthor/panthor_device_io.h b/drivers/gpu/drm/panthor/panthor_device_io.h
> new file mode 100644
> index 0000000000000..ce417c64abb44
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_device_io.h
> @@ -0,0 +1,84 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2026 ARM Limited. All rights reserved. */
> +
> +#ifndef __PANTHOR_DEVICE_IO_H__
> +#define __PANTHOR_DEVICE_IO_H__
> +
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/wordpart.h>
> +
> +static inline void gpu_write(void __iomem *iomem, u32 reg, u32 data)
> +{
> +	writel(data, iomem + reg);
> +}
> +
> +static inline u32 gpu_read(void __iomem *iomem, u32 reg)
> +{
> +	return readl(iomem + reg);
> +}
> +
> +static inline u32 gpu_read_relaxed(void __iomem *iomem, u32 reg)
> +{
> +	return readl_relaxed(iomem + reg);
> +}
> +
> +static inline void gpu_write64(void __iomem *iomem, u32 reg, u64 data)
> +{
> +	gpu_write(iomem, reg, lower_32_bits(data));
> +	gpu_write(iomem, reg + 4, upper_32_bits(data));
> +}
> +
> +static inline u64 gpu_read64(void __iomem *iomem, u32 reg)
> +{
> +	return (gpu_read(iomem, reg) | ((u64)gpu_read(iomem, reg + 4) << 32));
> +}
> +
> +static inline u64 gpu_read64_relaxed(void __iomem *iomem, u32 reg)
> +{
> +	return (gpu_read_relaxed(iomem, reg) |
> +		((u64)gpu_read_relaxed(iomem, reg + 4) << 32));
> +}
> +
> +static inline u64 gpu_read64_counter(void __iomem *iomem, u32 reg)
> +{
> +	u32 lo, hi1, hi2;
> +
> +	do {
> +		hi1 = gpu_read(iomem, reg + 4);
> +		lo = gpu_read(iomem, reg);
> +		hi2 = gpu_read(iomem, reg + 4);
> +	} while (hi1 != hi2);
> +	return lo | ((u64)hi2 << 32);
> +}
> +
> +#define gpu_read_poll_timeout(iomem, reg, val, cond, delay_us, timeout_us)	\
> +	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false,	\
> +			  iomem, reg)
> +
> +#define gpu_read_poll_timeout_atomic(iomem, reg, val, cond, delay_us,		\
> +				     timeout_us)				\
> +	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us,	\
> +				 false, iomem, reg)
> +
> +#define gpu_read64_poll_timeout(iomem, reg, val, cond, delay_us, timeout_us)	\
> +	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false,	\
> +			  iomem, reg)
> +
> +#define gpu_read64_poll_timeout_atomic(iomem, reg, val, cond, delay_us,		\
> +				       timeout_us)				\
> +	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us,	\
> +				 false, iomem, reg)
> +
> +#define gpu_read_relaxed_poll_timeout_atomic(iomem, reg, val, cond, delay_us,	\
> +					     timeout_us)			\
> +	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,		\
> +				 timeout_us, false, iomem, reg)
> +
> +#define gpu_read64_relaxed_poll_timeout(iomem, reg, val, cond, delay_us,	\
> +					timeout_us)				\
> +	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us,	\
> +			  false, iomem, reg)
> +
> +
> +#endif /* __PANTHOR_DEVICE_IO_H__ */

