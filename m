Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778167;
	b=S+7S0THhtibYrNj3iMAg2X4QcIzjLDS6z6+mCYNKQTLIlPKxdRBpjt8oPsGTiTka74Wn
	 u3l9jYAy8ElsVG3H8vcRookbzBORfrzaHt/16esBeh3mXXMkJWtLY2LeyeBSxyA+8cyIv
	 JdMZ6cmdu3YNGdId1uSK23x0gRCiSrFcd3CRd71ZNHR8v/mP/3KyQgpa2ujkmUaxZkm4b
	 8Jbay91WlpY6BxtiwXDeW8gQ1nQIDVvunLJKThI08+LDnafQRLWZgozJtXw3bG7LGNP9O
	 TMUeGmV27cRBx1x+6MgbSsaOgm7+q2RG3rbJy5tG4lZH47w2P2TpVgornhURYxdZ0zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778167;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wVIP3V0dASlHnbidW10EsmdFMoz0Im16A967d61lYe0=;
	b=4GISaqows9IxBLRqWefFGLopuWpb9cnU7Lt/AcJSCJfjvhSpD9f3SARSV5hQRxVnsOpT
	 qM8boRz7/YXtX1PsrJMZxJGUEVApxnk9+Ain6h3qmPNoNN3GHX4rKdgGFCq7YQ0Qvj2qL
	 PypmOiLYiChJDfnjH4j6gAwvEkE3LA6Sfn7JGMLfNfu+Rllwnly/2CVphFJDhElyTUrgf
	 7G3Rx6Sf92AW1/73jMKEgE7AJBc8NGhqkVLgvDNoTS8D2wa4ddEVZFaQbThIiFlACGV0D
	 CJNiPHtIPovzVWjqYfDzgFTg74FryIUb2cQk/XeYFMXIkAvkmjLDT7QzpTFAETszLrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i7RRmo75;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178F2606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i7RRmo75
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600C01F000C1;
	Fri, 27 Nov 2026 11:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778166;
	bh=wVIP3V0dASlHnbidW10EsmdFMoz0Im16A967d61lYe0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=i7RRmo75djd2dNmsU3z02Sahk6nlMdtL+H1okXxRL6sjVqdTKfF5EklMXN9U57ly6
	 xzIvIikP9LGeTC/67DUdc3NxHtn1EXwly/PbMSKwT6EOh6pThyno16NUDfn5/Q9Fzo
	 1EcRreGAdu9IoLs0KDAj3wc4rNx3i6Yg2WF9yWq0RfSt5x+WEEz6FW7EGj8AKPet13
	 sjeMgfCMyaWILWiU7oVxxOFUeocCa/tB/mkBWw7Ep9+cQN6j2rKuUDiJKW2wUXICv5
	 h/mcdC3TPyCuKLdAXTiVEigj3Brlq6C6e3PaTIMPt96OkXDjJlCPm7nq3/X4AiCsnw
	 P2uKYoi6f7mcg==
Message-ID: <c55a06b5-f264-404c-b388-f74a283d123a@kernel.org>
Date: Fri, 27 Nov 2026 11:16:02 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] nvmem: retain the provider node until device
 release
To: James Hilliard <james.hilliard1@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Michael Walle <michael@walle.cc>,
 Linus Walleij <linusw@kernel.org>, Khouloud Touil <ktouil@baylibre.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
 <20261120-submit-nvmem-provider-lifetime-v1-v3-1-523610652402@gmail.com>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-1-523610652402@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/20/26 8:08 PM, James Hilliard wrote:
> An NVMEM device can outlive its provider after unregister. Take a
> reference to the configured OF node, or reuse the provider device's node
> when none is specified. Drop the reference in the device release path
> so the node remains valid for the lifetime of the NVMEM device.
> 
> Fixes: 1333a6779501 ("nvmem: core: allow specifying of_node")

Thanks for sending out the patches, Few things to remember.

1. None of the fixes have Stable Tag,

2. fixes should be first in the series, so that it becomes easy to pick
them up for next rc.

I have picked up few fixes with these changes but pl be mindful next time.


--srini

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/nvmem/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 7d4cce8e2742..03ea878874e4 100644
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
> +		device_set_of_node_from_dev(&nvmem->dev, config->dev);
>  
>  	switch (config->id) {
>  	case NVMEM_DEVID_NONE:
> 

