Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795237724;
	b=b/NqwJStnI9BFpZ39xX6qPtsKR03lOEhkKD6/CVEmn23jsUoV99/0dZNuBEdPgG1wPZp
	 IQQYvNHaEFBMU0wAcSSYfaPmWn001zFa+29WA1EG2q5bpaRK+HqE+brxwbAPfBBqWWhsk
	 3YY2ZhkyG+tMepkPLl4iowyYrT6FrEKLJBS+viM5MUFrd2hW61CNmod0TnUiqfv0kKSPU
	 LLLp9dQsF2kQFEmjdN0jTYisdltTKoBVRVe+pBbZlhvogTmSfPqOar8vDHqXe/QJS26PQ
	 Lnp+Vb9621KJmUPpmA8xP/0VGTNmIAveiB5ifx+lMmdux2kJKJ8INmqW5KumSU7ArVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795237724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Bb3283Kau2Gv+8vqVQKXj4fop71Bdd6l4YGCq/10EcE=;
	b=QlLnOgz1J8wjFvHi5asrCdTUQtKNI5zQjM1R8+dijdBMuMSW5xuezOPZ0G0ELTVGGtgS
	 kqke9xTPgOJtKk2CeAH/+umCOwaNT4b4rufgfd/UQq6Ezpe5ppFZR7e22PSzvyrI+ruKC
	 Ses6tqatLbVplJBaTfmzPZMtwWCCQ4mGamOWyGzmD1CaHA62L5tpVjcqD8eJnXMgsjW+5
	 cn+oSSwUgwBSLMVbK8iw8dATQzXh1dn9dhku48/FBcUd7DZRel+GhEQOblVeBWM+6Xcsj
	 CDRhjqpNrHt69qhQ4ccpfEprGOzhIBaWDs7iHII9YfrtkXTxHpOQ7hQ67b2sjPrQlOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gq8cZIzf;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC1E606A696
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC1E606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gq8cZIzf
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f046b0adc0so7072695ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795237715; x=1795842515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bb3283Kau2Gv+8vqVQKXj4fop71Bdd6l4YGCq/10EcE=;
        b=gq8cZIzf+Qb7sTo4hGDzb7GED1vLLhFGQihjRYcVKITQeqp+NTPJHitWdZnbtmQSnq
         Cc98oclcQyO8R4unTqH3fqB1+SSxBLQYG1ylnURgzL7zhcYgqAVh7zzpYsHzc1nks+9P
         clRRk7K3aTudSZ9DCOuP8L2ACsxJV5M1DCpj6gd+DAk36TUMQHNCuVawsqQ1XJsUK0S2
         gcEM/DvyFWEhc7e9pGD2WRR2om4/CTSbcxVpjaGTFBHeEAETEWKFzYhdQCoAjHj9yHNZ
         nH2/yGWEG0Ih0VbDoXVwdeS6ukJkPg7g92VnhBWXj8E4jFDOSE5IeJOvBMk2uaCi5hiB
         Qhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795237715; x=1795842515;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bb3283Kau2Gv+8vqVQKXj4fop71Bdd6l4YGCq/10EcE=;
        b=EvrwaqC3z1qJ70vNV4aLWL8PC/pnRt+0bItifm/6mz26tKcfHhZQ2C4FwV1QN6iGoX
         XE6XSmsJRKlD/NulKBjzcBS36UDGu8kGy+pWJfj89G3tu+12fwL32ntx2e6ByYnB7X13
         a4Sqpj1qwmOAQI5KcqhnwF7rER59qgb3L/aUn8GMDVTKHf7ptVGntECrlViv6cz+HQ8R
         37CclbLvgDnOoQ1fJjfoZjBY23DBRnSiA0tqIyPR39ZeimLmUDM8qCJ/kkhWzUwv3Ypa
         Duc+eCumv0i8rJ6uNIRd2SZRBV5wb/hA/l0RvV2Gd+v59XXBbP5Ja7L4dnTNTCSVsK/V
         +Sjg==
X-Forwarded-Encrypted: i=1; AL+hErHELcy3Y/RruiAvHqFsG14HVM5rfXsnsauwFcXvS2nNIjBk3fkUTJya279H6NFPVW7EG7WfDPWmo4SU1dE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2MMYmK3yja6TgzH1f4CnEccjwf/byxAeRMGXUoW099HueYO76
	nzab1FFKn4zcvh6Zn0uR+tGTJQpx9hkNJbiIlC846YQOgKUaCMTRbvKC
X-Gm-Gg: AZFdTZc8+N4TvFKeMpIgkdKmIIeQzr93+yCvftb/ASQ0trh1f4JP9DL14v3P0ht0FXS
	Ix4Bl3i3041vax3lYxlG/P4LRfcnPs3ibLmU8jsI6slz4GrBtEWMymUJMf1+FMyLgNAP+N++/0z
	xs8lGcy2RyAa99PkVEc7ORCQdYrzHkRZM0nkPQ8NxwvS544wNN/4VPXlwTl4MSr4++ZcbCyEtGg
	qooAt6aJrCpJl3wb3jIpVKobLEQzH267ubLudZX+8I6FdqscmDtO1mTUC+hii3TzBShSmsztT1y
	GHrhXxYS7V3R2+iELW0JqfAUZNhG0usiNPUq/Vr34r/uI1bX1yQIP66JCirLEsoKaqBtCHBj2TP
	v4vNzuJuUyRI8yQUj2/UPvxEsmNAhs3myZ8GCuAOHWh0wrhfGZFIdLZfPjMlea8CL4u5klrIb8M
	zjuKH/yrpLi4x1C93hZi6KzB0mcvo3c5Njf4wfCtcYUeTiMjUpKTHK2GDnWobf0YMUy51jrlTd8
	AND24elODbTvsdAQtmBuHWtPMNjMqVEtMvyrCFFkFc+gec4kGDXu/MQEKRotWtni9dXDj0pwK46
	gyaThzbE87BiU4x4BET0A+i/hGUniyOTWTvxouDVro9PFFdJ39HluLD3IvW9+VEa1hlwVg==
X-Received: by 2002:a17:90b:39a7:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b41c9638b9mr4472697a91.40.1795237714620;
        Fri, 20 Nov 2026 21:08:34 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm6883300a91.8.2026.11.20.21.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 21:08:34 -0800 (PST)
Date: Sat, 21 Nov 2026 13:08:18 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v7 8/8] gpiolib: remove the shared GPIO proxies before
 freeing the remaining IRQs
Message-ID: <20261121050818.GC17013@rigel>
References: <20261120-gpiolib-chip-removal-v7-0-aambrozewicz@nvidia.com>
 <20261120-gpiolib-chip-removal-v7-8-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261120-gpiolib-chip-removal-v7-8-aambrozewicz@nvidia.com>

On Fri, Nov 20, 2026 at 10:14:00AM +0200, Adrian Ambrozewicz wrote:
> gpio_shared_proxy_to_irq() returns the parent chip's IRQ, so an edge
> request on a proxy line holds an IRQ of the parent.
> 
> When the parent is removed, gpiochip_remove() frees the IRQs still
> requested on its lines before it removes the proxies in
> gpio_device_teardown_shared(). The release of a proxy line request is
> serialized only with the proxy's own removal notifier, so if
> gpiod_free_irqs() frees the IRQ between the release's irq_has_action()
> check and its free_irq(), free_irq() warns:
> 
>   Trying to free already-free IRQ 22
> 
> Remove the proxies first, so the character device on each proxy frees
> its IRQs before the rest are forcibly freed.
> 
> Reproduced on arm64 QEMU with a shared gpio-sim line and a test delay
> before the release's free_irq(): 3 of 3 runs warned; with this change,
> none.
> 
> Fixes: 1e4f6db614a3 ("gpiolib: support shared GPIOs in core subsystem code")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20261103-gpiolib-chip-removal-v5-0-aambrozewicz@nvidia.com?part=7
> Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
> ---
>  drivers/gpio/gpiolib.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e0ba17a73c4b..57024a1b042b 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1461,12 +1461,12 @@ void gpiochip_remove(struct gpio_chip *gc)
>  
>  	/*
>  	 * No new interrupts can be requested through the character device now.
> -	 * Have it free the ones it holds before forcibly freeing the rest, and
> -	 * both before the irqchip and its mappings go away.
> +	 * Have it free the ones it holds, also on the shared proxies, before
> +	 * forcibly freeing the rest and removing the irqchip.
>  	 */
>  	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
> -	gpiochip_free_remaining_irqs(gc);
>  	gpio_device_teardown_shared(gdev);
> +	gpiochip_free_remaining_irqs(gc);
>  	gpiochip_irqchip_remove(gc);
>  	acpi_gpiochip_remove(gc);
>  	of_gpiochip_remove(gc);
> -- 
> 2.43.0
> 

Everything it touches was added in patch 7, so it needs a dependency note as
per my other patch comments.

Cheers,
Kent.
