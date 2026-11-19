Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096353;
	b=TTeqbQdjn9BqRbNnZvSrW+QqRXV7RfhIc5vE7cy5A2Mc0I7HFfkl71cHMWNquxyD5vTj
	 vE3bUH6ygbu5dIB7kG06EOvoDDz7GKGn20HoORjBGotIs7EoUkhEtdeAUYCbax+27TWsJ
	 IqIvf21kbq+GcjI+swK1Tj9keEmehSKZol8bVkB4QVOzIDwD/OdR6S9GDfgn4FYjkz3c2
	 TV1x0yX8bWX+xAXZpHym4ezNoJbI9A0ofA+uGpwfYte371IkVmUJd3mKYKmjc1jJAOl78
	 Bkem1liZF606fPYaiYT8jGyC0Fba2M5jx320El0LpQ9Njliv4hNE1pz72AtDJ88UB7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096353;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UKOQ7E14OsMkUnf+EX/rvNDiSBgYSQs10TYnXzahgPc=;
	b=BsgbxplawSIyUy3zS03fN54hbzCQIT76TVYLpo8z+yiPhRpnbH7UAcbnm8WzvqHOEbdj
	 OkwVpHrFi0EjJi4Nb18YxTP+cEAEmb7rgBMTHNnMgQUu4/RrfQLscwm+IwvlSBjhq2NWc
	 v5ot7o3uN2ArVR/M9WleAh7tefzzO7u1Er1AkKP7/MyovVJE9ww9cvVLGGHsR7Hkb5bmd
	 Kl531mShjqVkAGFz/OW5lcr01Agq8dBRE1eoAQGaNmwhiSxeJZBouO7AdMIejEBs4MUit
	 Tlq0CydLHIVzc61lWPC8eAJZqapdkOaUJcdHIGM8IKGKCLVmCH2qxofJzbQ/NoaNS/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WqpfWz/7";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 25142606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WqpfWz/7
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 509271F000C7;
	Thu, 19 Nov 2026 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096353;
	bh=UKOQ7E14OsMkUnf+EX/rvNDiSBgYSQs10TYnXzahgPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WqpfWz/7n3t7+hLvZXP0jy7XcjLXOhJCsEmBiRDMB5fJhAbDFRVwG0Jh0J3qBHRF1
	 z5pjZRVvJ7hH3dLAdgjm9nUJhvJ7sQr9O4kOeujR1xveGMbHQr+EvosiRb2DPf96rn
	 Ey/FgSplm8ZpcFdaibpOFTK2z50jBKsX7sUeN2aDxMicVrleQ7uXq42v72zjX77xMV
	 FLOHbwy1RK3iM9k1XILJc6gZLAUKNPO8ZPjta/cnVsPz6RJ6TyWHihiiD1jqJDXqcN
	 /JMX/wAQ6xwiy0pTRxxbL15B2tTL4qduYaI3Saefr+HiNbIxK77ZxODaJGcL3SSv4H
	 2G8f0grAS+QmQ==
Date: Thu, 19 Nov 2026 14:52:29 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Michael Walle <mwalle@kernel.org>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 01/11] nvmem: retain the provider node until device
 release
Message-ID: <hgntc5ggkvhu7xuq5d3hzeufyxugy25lcqmot2d3q2idysmhhe@if5i3oixucea>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
 <20261117-submit-nvmem-provider-lifetime-v1-v1-1-3cfbd48812b5@gmail.com>
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
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-1-3cfbd48812b5@gmail.com>

On Tue, Nov 17, 2026 at 12:38:08PM -0700, James Hilliard wrote:
> An NVMEM device can remain referenced after its provider unregisters.
> Keep a reference to its OF node so retained devices do not depend on the
> provider retaining the node. Drop that reference in the device release
> callback, including registration-error paths.
> 
> Fixes: 1333a6779501 ("nvmem: core: allow specifying of_node")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/nvmem/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 7d4cce8e2742..802637f375f8 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -570,6 +570,7 @@ static void nvmem_release(struct device *dev)
>  	gpiod_put(nvmem->wp_gpio);
>  	nvmem_device_remove_all_cells(nvmem);
>  	ida_free(&nvmem_ida, nvmem->id);
> +	of_node_put(nvmem->dev.of_node);
>  	cleanup_srcu_struct(&nvmem->srcu);
>  	kfree(nvmem);
>  }
> @@ -973,9 +974,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>  	nvmem->keepout = config->keepout;
>  	nvmem->nkeepout = config->nkeepout;
>  	if (config->of_node)
> -		nvmem->dev.of_node = config->of_node;
> +		nvmem->dev.of_node = of_node_get(config->of_node);
>  	else
> -		nvmem->dev.of_node = config->dev->of_node;
> +		nvmem->dev.of_node = of_node_get(config->dev->of_node);

While at it, you could switch to using device_set_of_node_from_dev().

Bart

>  
>  	switch (config->id) {
>  	case NVMEM_DEVID_NONE:
> 
> -- 
> 2.53.0
> 
