Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509149;
	b=YSpwUCkkztnlLYEUBeOPXyA4Ne5jLbW+I4nc6cM9s00gHhUJz630EClyXYFmTuIOKUBP
	 mqlRinEwwhFaUP9IkK6aeFM/Jvrff9KUDKNYNAzBuhH6pDUnMJ+97aSrjGeOC4b3sM7O7
	 rEYYqYDB10QuUxOAol8ufv2h2pUbqlsWaYSeiE/DRJploQciyAqZ8WMDm1/jD91Ubu787
	 7AeTW64Ak5fDT3Zy4jkAa3Lmt++r3rhIMJu1eNBCE+vJlzO1K0NKZPqfQN5HvTSIe97HD
	 lBRb8vvoMmI6HoN1b9ApKi0UcpTGr8OHhip4tLUchboabAjZoovapOha3Ue8RjayOzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509149;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=j1n4BLDC6UJC3OYdgIxV0NPxCD6elUvFzLH7wgRsrvw=;
	b=vgRTjed7stwnRlGCo/8iekzEuQbygOyHh3dQIPS9kDuDxdhFHRo5yA/tkr5V/jea1hgS
	 L71itYcSVqi4hOf1vLpy3BKG5P6P7+JPX4kUOeeOmCMbfn4qS9Zykf5brWjJzYh98DOVW
	 N/qo0PG9KWv+cRRCVYJuViJucnC+1tpu4z44WWYy9znz3RopdBoJ/l+WUhxT5unnSXEES
	 xl7AW6oShf2i1jvrgBA6hkSkQcBRamyqN8MVP7cWVIaqFKa8rhT2nF75nAEH699jHMT9u
	 B8dye2Oxtkl8hcsF0Hcz3ylhUWP+uK1e1uUFkWN6WdhsgLyXxURtPRP0ttEdBwEXf0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pwghcZm4;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C516606A331
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C516606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pwghcZm4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795509144;
	bh=i4TvzjmkEgsJuovEHkaCz+7f5NuSNzbUgm74DFpCC7k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pwghcZm43i/JhqD8jWCPOurrwQAEhythwtfC+u+crj6xV46rkMa19PBLfEn4ZIQ4R
	 m3Xap2BHZzVPpDTyY0ABrZydRskrK9rkx/vwWVFmi19zqJCTed5ILjpoMoO60+9w4U
	 CsZD/vwtS60InJ2B4IxZdrDZm0o3X6kj4H6bMjEHnUU4m3tNBWyjLFQfqFW8WJoFaj
	 SX2/npTN32F5x31RJ25EV5hlrMk5J2PcG50mAs0uxLmQIWDrzGfZ8WlHFFN0DSAton
	 624080qsuJp5H90G1ihR/pqjETvm7oRKIYrbzOcF1GuO1XQYErjfXaGEMzZLmzJGCz
	 TQRjTKtq0iCCA==
Received: from fedora1.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E32AD17E00B2;
	Tue, 24 Nov 2026 09:32:23 +0100 (CET)
Date: Tue, 24 Nov 2026 09:32:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Haoming Gao <Naixumogu@whut.edu.cn>
Cc: adrian.larumbe@collabora.com, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Fix overflow in fdinfo engine time
 conversion
Message-ID: <20261124093215.44d38460@fedora1.home>
In-Reply-To: <20261121152728.210765-1-Naixumogu@whut.edu.cn>
References: <20261121152728.210765-1-Naixumogu@whut.edu.cn>
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

On Sat, 21 Nov 2026 23:27:28 +0800
Haoming Gao <Naixumogu@whut.edu.cn> wrote:

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

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

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

