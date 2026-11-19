Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083217;
	b=qC5rq21/hSh+fzHZtkWA3bBbnUt06seLDICJtaEQB32Bd2kQwOTKh+1/SSGWxnhx+kHv
	 /pzHtte+WY3vhm7apf138DUiPyOHVhn9xli78JilBXCnLk7cNEMVK60Y889n5MuTp8A6/
	 EBW9LohGbRBCCgnCN7HHKrXWmgcbVJI1jOcoxP8zTy25Y1TsFtKdBC76yMjBoYoBjbOJq
	 fa+AnyDnz02BZcpiPwQX5tqlKDGE05YHnlkhYofnGGBgbh1OEICFv62a2ivPkf2V9iCWY
	 gXryPEMXqo7JFcm+Cw5VEvpAEwaZCpyelouLNFsbJMqqBrmdNPt/n7NwQ1vkdz3gmAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083217;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6DuZj7rpCDJ4RLnqAO8W7jTcTFXU6SWSY1XFYNYKyWY=;
	b=uNpKkOH0yCTt0W8y1czGZofRTSOj3WyQG9kX92DA3dVGDuyDDZrpMAw1kyMNkHw/r4hd
	 ARDxmeznmKIkDhsDauCpYFj+86711tI22mdgemzTNv0riLZ6X5P9q6EQwKUlE2ItlwAul
	 27KI61ZT2lBKIhmcKtuVlYiDq9wnPaO5wAf8MUIBVyTGBEqwm8bH2MDFiFXb1qBbjBA3n
	 ubTHIekM2wTsjUrNp1huyWtUT6ZOldpK0gHf71oQCHIgdanjxSEO5fT1hHltlcQPm4V5n
	 xW+XozFP1uUwj7O+7NA1eiwoRX9+aTRs4vpbKYGCJGUsRF6LwzJs9C4RPD/CKUznrfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSgXT4UZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10060A2631
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSgXT4UZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653821F00930;
	Thu, 19 Nov 2026 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083217;
	bh=6DuZj7rpCDJ4RLnqAO8W7jTcTFXU6SWSY1XFYNYKyWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kSgXT4UZxO4V1tQsElmCQVnTzGLg/D1NFK8Ql8iz/O/dvvjAYKDsKPeHj4sK4Y0Cn
	 yRIq6V5QcOhzvt4hASgD+jNOqQs2GkRTh8+oLn3y55zJXIvfFjB1tI1crzzsO3AW9F
	 wkZ3Ze+me/QgQsFYS8Iq2V5VIp0R9xOLBop+IZZzPmqT1asxSgLVmC45VN/BfQ3LXP
	 mx24GzFkc3YClfRp4+74alZIFFeDew+fndyg3NTNBhuz1A9Kx88n95mLsqVZDIGnDr
	 CINZDCPkQTrM8eKXrD2xqOQxAm4pbIsETyowT2iAqnRCKzZ47B87I6BVcoPV/OWmbI
	 bh+E5gNG7r0bg==
Date: Thu, 19 Nov 2026 11:13:31 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v3 14/14] irqchip/gic-v5: Invalidate the L1 DTE when
 allocating an L2 device table
Message-ID: <av7Ly_iLyiOAXQUR@red-moon>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-14-13c1859e8aa3@arm.com>
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
In-Reply-To: <20261118-host_gicv5_fixes-v3-14-13c1859e8aa3@arm.com>

On Wed, Nov 18, 2026 at 05:35:43PM +0000, Sascha Bischoff wrote:
> Allocating an L2 device table makes its parent L1 DTE valid, but the
> single-device invalidation performed during device registration does
> not invalidate that L1 DTE. An ITS that cached the L1 DTE while it was
> invalid can therefore continue dropping events for DeviceIDs in its
> range.
> 
> Invalidate the L1 DTE and wait for completion immediately after
> publishing the new L2 table. This also covers a registration that
> subsequently fails, leaving the L2 table allocated and its parent L1
> DTE valid. Keep single-device invalidations for device registration
> and teardown when updating individual L2 DTEs.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 7fff2db9ae08e..a05417bdd3a19 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -365,17 +365,17 @@ static __le64 *gicv5_its_device_get_itte_ref(struct gicv5_its_dev *its_dev,
>  	return &l2_itt[l2_idx];
>  }
>  
> -static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
> -				      struct gicv5_its_dev *its_dev)
> +static int __gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
> +					u32 device_id, u8 event_id_bits, bool l1)
>  {
>  	u32 devicer;
>  	u64 didr;
>  
> -	didr = FIELD_PREP(GICV5_ITS_DIDR_DEVICEID, its_dev->device_id);
> +	didr = FIELD_PREP(GICV5_ITS_DIDR_DEVICEID, device_id);
>  	devicer = FIELD_PREP(GICV5_ITS_INV_DEVICER_I, 0x1)	|
>  		  FIELD_PREP(GICV5_ITS_INV_DEVICER_EVENTID_BITS,
> -			     its_dev->itt_cfg.event_id_bits)	|
> -		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, 0x0);
> +			     event_id_bits)			|
> +		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, l1);
>  
>  	guard(raw_spinlock_irqsave)(&its->inv_lock);
>  
> @@ -385,6 +385,19 @@ static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
>  	return gicv5_its_cache_sync(its);
>  }
>  
> +static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
> +				      struct gicv5_its_dev *its_dev)
> +{
> +	return __gicv5_its_device_cache_inv(its, its_dev->device_id,
> +					    its_dev->itt_cfg.event_id_bits, false);
> +}
> +
> +static int gicv5_its_device_l1_cache_inv(struct gicv5_its_chip_data *its,
> +					 u32 device_id)
> +{
> +	return __gicv5_its_device_cache_inv(its, device_id, 0, true);

I would highlight why event_id_bits is set to 0 (actually it is irrelevant,
let's explicitly say so).

> +}
> +
>  /*
>   * Allocate a level 2 device table entry, update L1 parent to reference it.
>   * Only used for 2-level device tables, and it is called on demand.
> @@ -424,7 +437,8 @@ static int gicv5_its_alloc_l2_devtab(struct gicv5_its_chip_data *its,
>  		FIELD_PREP(GICV5_DTL1E_VALID, 0x1);
>  	its_write_table_entry(its, &l1devtab[l1_index], l1dte);
>  
> -	return 0;
> +	/* Invalidate the cached L1 DTE before using the new L2 table. */

Nit: it is not a given that it is cached.

> +	return gicv5_its_device_l1_cache_inv(its, l1_index << l2_bits);

Nit: this l1/l2/deviceid bits/index dance is a bit clumsy (I mean, in
current code, without taking into account this patch) but we can rework it
in a follow-up patch to keep this one as simple as possible.

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

>  }
>  
>  static __le64 *gicv5_its_devtab_get_dte_ref(struct gicv5_its_chip_data *its,
> 
> -- 
> 2.34.1
> 
