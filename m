Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185749;
	b=zWeZhd0P81Fgru+BRBj9Vca/vwJ/W31Tb6+Hvpuh2RBrSDsq6K+JEsHsCSpTXyqaDT+l
	 Lkt7Gs7DGHwLNqF15BTxy/l+HQ9+152Yb6FeWLFDncC+VuGCOSvFoUrSXA3KE5ecw7/aS
	 Zmq8z6Sw4e1KXk4zg2FRlzDthgHgG3hniE2A/L36sS7tYuFT103rqVzBUbR6UHSixSIHS
	 ld8Y2LFxC/BXZwK4MQQSORvug3nk/idgx1LonW+0CCKGHY+1W+TITd6EoevcgpcxMRvOe
	 TerNfTL5Lk3BstYHfEfT3RNDIbm6RF2CIxUBrXWtBwZ8WrR0rcH49OmfQkbb2Odv2aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185749;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=qbd+z81NWcBJ3UbzNi7GzHSjiR7on5yG5EEeouAnung=;
	b=26RX1cpJXZMsQNSV5zZea9RMeO6HZ3C2gka6/3qEvf4QN8OVgcmHfa7R5c5LflQQh6O3
	 7+t1y5qObxSfVUB3h8rHEe5KhKpVHepZ9TvFoaI5P2YiJyo0GMA7/i7sR+cNub0a/bwNs
	 5xddGe3JgYvjIPUmeG4OH1YQHRVENELShsmZ6cT+oK/H9CYefB4XTcod5dAC/527Dj9MF
	 MpsvkWQzHx25TKjIQDshM8+CtDyGBfTqHT2C+/Ql0FssyCLq9w9JWp1giyKMFOvUd0Yoi
	 lxN4ZlAT/rmhMdPVqNe+S14t3Nr67MgOQgE9ciA4eWdmXHwadXEwUPoYtzP6jCfllzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ny2sWYgn;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FBB606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25FBB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ny2sWYgn
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A3BFBC6221F;
	Fri, 20 Nov 2026 14:42:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DDB99601B9;
	Fri, 20 Nov 2026 14:42:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0D8C11BC0232;
	Fri, 20 Nov 2026 15:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795185740; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qbd+z81NWcBJ3UbzNi7GzHSjiR7on5yG5EEeouAnung=;
	b=ny2sWYgnB0zcWHeFXhqxhDIAWQ/uV1VQzEEqCRq0frSEgIqGk0A/Gnr16gKIM/7MkE8G3Y
	Dj81WUujkTgIygPti1bkzTol8TEO6lCcIikzANbIIz9JsdQguQvKy+ZskThQzoVvwiFImN
	ANv6xsoO9kd+7yRJvQmXW5XinY6o210rhfzz1pDFd1wbNowGtBfLLgcifRK1mXcQ57HSSE
	W+CrBat6FC4flKNMgU5QC43LywpdbagUOGBJVu+eQhirnHhKXtfyTU6I4iJWgHXVY94oMC
	E6BVwAjHuXZOYLo00D9sQDoL4Queg25DHL5gvFaP98HIwXURNSC9YxMG30bvxA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Boris Brezillon <bbrezillon@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: atmel: release the NFC IRQ before
 controller cleanup
In-Reply-To: <20261108-submit-atmel-nand-irq-teardown-v1-v1-1-341643c83ee3@gmail.com>
	(James Hilliard's message of "Sun, 08 Nov 2026 14:07:31 -0700")
References: <20261108-submit-atmel-nand-irq-teardown-v1-v1-1-341643c83ee3@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 20 Nov 2026 15:42:16 +0100
Message-ID: <87tslba7jr.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 08/11/2026 at 14:07:31 -07, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> The NFC interrupt is shared and devm-managed. Controller removal disables
> the clock used by the legacy binding before devres releases the handler.
> An interrupt from another device on the shared line can therefore make
> atmel_nfc_interrupt() read the NFC status with its clock disabled.
>
> Release and drain the handler before freeing the controller resources.
> Track successful IRQ registration because probe also uses this cleanup
> path when requesting the IRQ itself fails.
>
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/n=
and/raw/atmel/nand-controller.c
> index 0bdbcbb50d94..9a724de67624 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -263,6 +263,7 @@ struct atmel_hsmc_nand_controller {
>  	struct completion complete;
>  	u32 cfg;
>  	int irq;
> +	bool irq_requested;
>=20=20
>  	/* Only used when instantiating from legacy DT bindings. */
>  	struct clk *clk;
> @@ -2334,6 +2335,9 @@ atmel_hsmc_nand_controller_remove(struct atmel_nand=
_controller *nc)
>  	regmap_write(hsmc_nc->base.smc, ATMEL_HSMC_NFC_CTRL,
>  		     ATMEL_HSMC_NFC_CTRL_DIS);
>=20=20
> +	if (hsmc_nc->irq_requested)
> +		devm_free_irq(nc->dev, hsmc_nc->irq, hsmc_nc);
> +

That's a terrible approach, completely defeating the main purpose of
devres.

Your problem is a devres ordering. The fix should be by teaching devres
the right order instead of open coding the fix. So you need a
***_clk_cleanup() helper which does:

	clk_disable_unprepare(nc->clk);
	clk_put(nc->clk);

and you want to register it before the IRQ request so it is triggered
after:

        devm_add_action_or_reset(dev, ***_clk_cleanup, ...);

Thanks,
Miqu=C3=A8l
