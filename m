Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084104;
	b=YXQmwL0kZl/RGJHO4wRjD2c6OZonIhMCQlrjl6SFLgnTnLIn+xIxIbOoYcuJ4vFzyLA9
	 aZQyTLpZImzhlAx9LI0fvkalCFcDdee3iaFqm+kH4lNNb7v+fQGuquvwVZTJnCWuGawJm
	 j5OOEXWd32bDhKI/XegGoXk3gU8KhnvMjtrpmPfKDQtxIY/b+usqcwFudKeReAY/fBUY/
	 x85ZxODTDn84mQcS8nI8wcBclWvc++kuP3+60TzdYX81SJkXsjdRl10qE+RMWkk/JmH9o
	 w2HLQgaigpJO4r3SI9eRMx8SUy45Uiac6+uhv7XoXTtnLcD7YkviL6fGspmC0u2UjJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084104;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GwmpfKbzBaA5litqwA08DZDKcW/oDAfDTawJvYW617E=;
	b=fN9uRRU5SvyRXooPfIXvGsm7u/3c4LZw2JBZ48pwtaK4iiKI86YsR/ITiUJHPc3TPr7w
	 oA2BhfugwZhqllpmYyEhumc9jMHRcc5LLu5tE5oQAYAc2RuJJbz7gaiuAuGFeIkANpi/5
	 C35y9BDkYM2jec4Ox4nFhtMKIDSMM3yxmba3QGG7dwumc27yuuv/kCUvYDyAq0oQWzBd/
	 W88YsHJgn991CtaFlv5VnTS2k/EtEu0gbkX/96B9ETEPXgVuZL9j9mqVDwK5AjW3eei3b
	 AzioErSyMFZNZZCr5n/EtqLJs8q5mhWPJz72H2VP9H71DYbqECKL2Axvyu3hkRMQtSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lia5Iomq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B598606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lia5Iomq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC0C1F000C5;
	Thu, 19 Nov 2026 10:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084104;
	bh=GwmpfKbzBaA5litqwA08DZDKcW/oDAfDTawJvYW617E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lia5IomqCBm/EgMjeJyuFpyAlPDD26vNSN2KNaqbKEAhqdPmb7hVt5zHU5O+ypSmT
	 Y4srfVW3sFmmvybA/YHfC6MjgyxwOKBMnG4R+PMggrYQLRziydg350kPsDIxjh0hIa
	 SGfg6DC+hXhui8asvYps3AgUii/REXnS6WdDQk6pdrWlb5jG7IugRB9dzSyhCd6Gln
	 A6gLW507UJlrAEXtaG37oHNe0pAEm2yedd5i3fbka+MDkebljcvAr/ploKnhtS2XB1
	 TqJlI9YZbfYGxfx9RxES8GvUEmlXI8coK/4ZSPQe+wfx7Y3ahQNAAZx4X6ivAzWBY9
	 1KR353gTNmHRw==
Date: Thu, 19 Nov 2026 11:28:19 +0100
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
Subject: Re: [PATCH v3 12/14] irqchip/gic-v5: Retain the ITT when device
 invalidation times out
Message-ID: <av7PQ4iniwWC9goF@red-moon>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-12-13c1859e8aa3@arm.com>
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
In-Reply-To: <20261118-host_gicv5_fixes-v3-12-13c1859e8aa3@arm.com>

On Wed, Nov 18, 2026 at 05:35:41PM +0000, Sascha Bischoff wrote:
> Device registration publishes a DTE pointing to the new ITT before
> invalidating the ITS device cache. If invalidation times out, clearing
> the DTE in memory does not guarantee that the ITS has discarded a
> cached reference to the ITT, and hence the hardware could still try
> and access the memory. Freeing the ITT on that path can therefore
> leave the ITS accessing memory that has been reallocated.
> 
> Device teardown has the same problem: it frees the ITT even when the
> invalidation issued after clearing the DTE fails to complete in the
> specified timeout.
> 
> Retain the ITT on either failure path. Continue returning the
> invalidation error, and free the ITT during teardown only after
> successful completion. This deliberately retains memory on hardware
> failure because a timeout does not cancel the operation or establish
> that cached references are gone.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index db13011ef6d93..cfa86aa68bf3c 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -540,8 +540,8 @@ static int gicv5_its_device_register(struct gicv5_its_chip_data *its,
>  
>  	ret = gicv5_its_device_cache_inv(its, its_dev);
>  	if (ret) {
> +		/* The ITS may still have a cached reference to the ITT. */
>  		its_write_table_entry(its, dte, 0);
> -		gicv5_its_free_itt(its_dev);
>  		return ret;
>  	}
>  
> @@ -570,7 +570,9 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
>  	its_write_table_entry(its, dte, 0);
>  
>  	ret = gicv5_its_device_cache_inv(its, its_dev);
> -	gicv5_its_free_itt(its_dev);
> +	/* Only release the ITT once the ITS has discarded its references. */
> +	if (!ret)
> +		gicv5_its_free_itt(its_dev);

	if (ret)
		return ret;
	
	gicv5_its_free_itt(its_dev);

	return 0;

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

>  
>  	return ret;
>  }
> 
> -- 
> 2.34.1
> 
