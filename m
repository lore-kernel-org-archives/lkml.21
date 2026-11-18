Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017143;
	b=Qrb/X5qcc7CWvopV3w62TCpmBta5AgsjUpYzrsg5pRz+jLQ/FvbxK1saeVNRui0Ge6rW
	 GC7BTupHVUHmR2FRVZ5joNLggYxl3WeZrUNEJ94GuroZJnbUEumBj2h1otG1tXkGGQbpl
	 RLx2ROGVVqTzodOczue7r6ve047BRzw6y0tm3HIRRzgK2jo0Ft6ERL8k+KbrPB44e+OjV
	 ehDFGbXctsPL+T+ol5K/ZpVtWTsi2U0W/hCO4+fnxiEwXosuJBsaHJclICWfmzi6e9+Gk
	 P/VR1E+7MBfjIgLuuTT9/CftbHR2H9doZ0B91oFyY/CROrLi9PklL4jTdlgYzT0irPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EfRePTk2gRztSdKJ5avV8rU5JLkNM8X3BUaoJSKRKHo=;
	b=QNwwEcqFVxMZA94KMsSGS2fgnw28qk8FKBgUBIi2bEsdEMq/fsatrbjNH3a0W8VLOpkV
	 mStmps9csZzbwnWkqm5P+/yHVYCHnom67Q6BTtXinJjAXlhpQe8iNZCjbvxWgq2LdUuKQ
	 4ypp47RQx/mxGYc9++3UlAgg3OQmabKjrC+44gRRz3arFEnaR3RcfYctr4u2TSy1rNYLL
	 ajMCWoCyN6hpbfzrgXQRjWrXE/C5vkaiwUFHwgTb9DS/VUsFtSCfaAkBe1XfKQMHqiZSv
	 erduLuTMopfmx1P8fEN002ekr73OEu8yJOqKyP7SKD/GTgJoW7G4xrQhjrrltzttGZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzBa8FWr;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EA8606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8EA8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzBa8FWr
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4395d31228so176706266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795017140; x=1795621940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EfRePTk2gRztSdKJ5avV8rU5JLkNM8X3BUaoJSKRKHo=;
        b=uzBa8FWrZP7lNw+xbddRCcC0O3d7E2fj5uw6//BZxBE2tnMRH7xmxDA/t74tl3sklb
         4IDX9D2YnDk92d15jSQOR6lCXVhPQvUjvA8FvFW0aHolUaVWyZ75el4ViT9WU88CA9b5
         uKZFKe6Co4fcKrD90xtNVFoOhrohBfed5Jh+ls0yxsMsjFzGOaSmCIUd/3VsfWGEbmcB
         qVgmKGD88YmMaw5fNGOmX+fRoUo3eXlEOSQhZ1TFB7VwiwOqVWdBGuwJn9zsJKLsC0hF
         ev8cUHjavo3vQkuvvn7tgXRK80jaXFp5xCSfYpNhdj7FkxSNVvO+peWAPVtwM1F8Uq5l
         vYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017140; x=1795621940;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfRePTk2gRztSdKJ5avV8rU5JLkNM8X3BUaoJSKRKHo=;
        b=JXVZYTKIFBUivchSxvI5hOI4NzdSnm38FbEcbexJqzM2ArAFHp8FNFd3n+oYyXJHU7
         RnPpAOBCnN+78wvWmg73NtxEyawjLtZv8cVlZcu+P0epPFgXGLGJiG/cRjrAw3BDhaoi
         F+mADovQExAxGfEkk9/kyQKLUZdC/vN7XC/3rA+oBy8MBP2d0FGbglkEx1rFEf/jcSw4
         FP9QfOMsAQ+EwSre8+of+TrEl3Q0OMS6tMztRsbTOceIquPlAvfA3sGUw/x2Y7hG9yHe
         KCRSoB+XZ9pvKlDTO1gE4N+LFsVkMUlpJ0gZI7cIdKUTUgqq2+2AYJc+O0/3yA/8hQVs
         aWqg==
X-Forwarded-Encrypted: i=1; AL+hErEi0kSkGIJddmkh2/y/83imWIn0SlAOuiaKAyzFeLUuA4Y0svWgmWqM4jWV5bI0JO1gZ3lbTlGVe5jLTEQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T/NkVX2306J1bOyrVrSDcDnioHjjgAV9+BQphLdx/nkA1Y5jx
	ohGSg/eJ7+hQqNZNMtG7e5xc4IdGlrR5O3iaEnDbPg8VfeHHBoHpzVNN
X-Gm-Gg: AYBFou3KRrculDpma7ft7XSBzX2NLFV5R33dfg1XYuQqgLUdG3rD/OZDIIJLmbdTPXA
	GIazyb0zH1UFvZNc8P8rBQoCeokQZnqEbpD4IVxxLVGw+QAxEkMEvy/EewsUOBrvD5e94RM5Mfq
	8gNJSwXjEBmaUVcfxx21mMwdwINw04n3PV82OHjmtZ6ZTm+npVqYgUD8uosR6bRujTkKo0FIg5z
	ggKYcdFPYTS0zGANjnq4aHleJsD49/s/nrFm/W9XA6y0BLUioupmA9zPmFZgh0DTsVGCNd/tJhs
	Oz/n+XUrXNTZCXbyL8d5+xJpfWqpBEvphUG97l9xUWtUtHj+pq34+vPhZRR/Rmm/NDp71Vav4cG
	9ATRkfJUVFKqcL0UeIyWEP6pa8Mkgm6A+EaWXUaD96yt032aGI3ey9+yhxUiy/mAf08ki9Jbi/s
	wshLTH4OP0t6sAHXlDRSngJn4KqdIT6LLc5GJh20MK5OfTD0/BUaSKfjAGGfdHLIYhFDtIWFEPB
	2R+CIH0/PHDWC9nh7YlAnEc4gohM7VUuwGjE1uZA3O6IZdsWhLOqYcjypqzSyY8mHjjf1al05dH
	IFnvaA50IVZ78GcDfbV/IRvUWk95Fg2xUpNSzvCN17cSJ8mb
X-Received: by 2002:a17:907:6e8a:b0:c2e:4292:d268 with SMTP id a640c23a62f3a-c510e291950mr324922566b.16.1795017140041;
        Wed, 18 Nov 2026 07:52:20 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc221sm20006566b.9.2026.11.18.07.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:52:19 -0800 (PST)
Date: Wed, 18 Nov 2026 23:52:07 +0800
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
	stable@vger.kernel.org
Subject: Re: [PATCH v6 7/8] gpiolib: let the character device free its IRQs
 first on chip removal
Message-ID: <20261118155207.GE46152@rigel>
References: <20261116-gpiolib-chip-removal-v6-0-aambrozewicz@nvidia.com>
 <20261116-gpiolib-chip-removal-v6-7-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261116-gpiolib-chip-removal-v6-7-aambrozewicz@nvidia.com>

On Mon, Nov 16, 2026 at 03:47:10PM +0200, Adrian Ambrozewicz wrote:
> gpiochip_remove() force-frees the remaining IRQs, removes the irqchip,
> and only then calls the device notifier on which the character device
> frees its own IRQs. The character device can then free an IRQ it no
> longer owns: after its mapping was disposed of and the number reused, or
> from a release that races gpiod_free_irqs() and
> gpiochip_irqchip_remove(). free_irq() then warns "Trying to free
> already-free IRQ" or uses a disposed descriptor.
> 
> Call the notifier once the chip pointer is cleared and the SRCU grace
> period has elapsed, when no ioctl can request IRQs any more, and free
> the remaining IRQs after it. Have the release paths free their IRQs
> before unregistering from the notifier, under the lock its callback
> takes (config_mutex, or a new mutex for v1 line events). Herve Codina
> first proposed calling the notifier earlier [1].
> 
> IRQs that in-kernel users leave requested are now freed after the chip
> pointer is cleared, when gpiod_*() calls on the chip fail.
> 
> Reproduced with a test-only chip on the hierarchical irqchip: both races
> warn in all 30 cycles; with this change, none does.
> 
> Link: https://lore.kernel.org/all/20240227113426.253232-1-herve.codina@bootlin.com/ [1]
> Fixes: ec8b6f55b981 ("gpio: free irqs that are still requested when the chip is being removed")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 35 +++++++++++++++++++++++++++--------
>  drivers/gpio/gpiolib.c      | 28 +++++++++++++++++++++++-----
>  2 files changed, 50 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index ffa8175b78d8..3fc0a21c1273 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1590,19 +1590,29 @@ static void linereq_free(struct linereq *lr)
>  {
>  	unsigned int i;
>  
> +	/*
> +	 * Stop edge detection while still registered for the notification, so
> +	 * that gpiochip_remove() does not get past it until the IRQs are freed.
> +	 */
> +	scoped_guard(mutex, &lr->config_mutex) {
> +		for (i = 0; i < lr->num_lines; i++) {
> +			if (lr->lines[i].desc)
> +				edge_detector_stop(&lr->lines[i]);
> +		}
> +	}
> +

The desc check is not strictly necessary - edge_detector_stop() handles a NULL
desc.  The check just prevents a little pointless re-initialisation for
failed requests so I'd be fine with removing the check.

>  	if (lr->device_unregistered_nb.notifier_call)
>  		blocking_notifier_chain_unregister(&lr->gdev->device_notifier,
>  						   &lr->device_unregistered_nb);
>  
>  	for (i = 0; i < lr->num_lines; i++) {
> -		if (lr->lines[i].desc) {
> -			edge_detector_stop(&lr->lines[i]);
> +		if (lr->lines[i].desc)
>  			gpiod_free(lr->lines[i].desc);
> -		}

gpiod_free() has its own NULL check so the desc check here is redundant.
While it was bundled with edge_detector_stop() it was a free lunch...

Cheers,
Kent.
