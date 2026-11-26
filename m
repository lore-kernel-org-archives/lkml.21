Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703800;
	b=vnoAzWZCIpZZ2/CaibJ45HiLjZVwjDL79FZmn7esCd3170VId8ZBy7oJ/8mpwbSy0IzZ
	 bXTq3/3791pPSU/aow9b/GoiF2R1s9VmjphVBxBPmNminWpWKvvaZjixO8IjIZE8jPLLa
	 LkhUD60dSCTrz0lmQGrAfbkavow0p01T9s4FCRkxoUGiSgqVg8Qbk5YoQSBKOvuV6UJnw
	 v7EGdXGOOuLVakhN/kfcshw/qc2UTSIg/XaSpBfzJLEQi2NLw3er8d4FdmT23AWzRahDH
	 xZFzbBBWjMnFOgSnOMDJLBOeN+9pRcSM1cRu5V9ZDzxEb11cLfThsvoCSME4QkeSUJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SrVpOL/vsmOkgEFx/8WAFupqNXkkubNUnl9sC+8oIJ0=;
	b=lSYOYITw6SRFUvD6RYWXJXTgjHUdFisoKpy1//HNhCtxFXv8YlhlQDuGukTP6OI1EZIv
	 PyoC8udNS3ytgkA9G3/ucBktZTSJu6BWyKJTJsN78Dct0f4XSv6BSKNSVtwg/UOmaiNXL
	 iLB5hSg2E4wRuWGpv/Blo2VYKVBiRS2bBLwRFBpiEpNdZ2cbWTBZA8uzF2ANfjHpwlkG8
	 mWGZbMWZIvRiEDMeljvQTicCjeEjBK8rgAQ4W0DhJIImAa8SYaWTTJBXxCKO5cTiMbzf6
	 3+wDp1JbMgv52rOlPsC7RKqt4Tg4eg+kySt8f+l3LuPqeq7Xk7IXY07fCdZJYktnUXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ll2ieohY;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C76606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C76606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ll2ieohY
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so75746025e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703798; x=1796308598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SrVpOL/vsmOkgEFx/8WAFupqNXkkubNUnl9sC+8oIJ0=;
        b=Ll2ieohYwEjw7jYZgh40Vz+Dj2ApGO1hxH6w3r/29uiXkJYbBTcAIsBesXHIn7ePkq
         xbuUjZCJ/CdRZRURtPdlnoCCArqL9rbtybBnuXrGZ1nG7yDkkwebZ3moyLYzL72AS7/K
         8X/G32FRmLn0nTFc+qJrt8PdEh5Y6fDSavg3DIV7yVRtjOJnwUeTeZlapDDM7Bfu6N1m
         NCwIAjod+GRMVQhgQa979MbaL8LE27wT6xjmJpzF/5I5tAUR9enFlDEAiJHCJtyn05Tr
         H1+10eQJ4RwwdNCfB3QOwEL8AM/B49mBU1CleRPeohoyoYwlTcIv6d2sp02q6o+N8deI
         niNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703798; x=1796308598;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrVpOL/vsmOkgEFx/8WAFupqNXkkubNUnl9sC+8oIJ0=;
        b=U45S5ekq8MUr9REQSd1JK+IRChGVMuGmhP3qVElkPkwORlxVeRGBkj4snlSXAFvXbB
         3xv9NHmMFOz/R/fsmEqfIVfLiieE0nQP+JcTkonnM0TLfZ7HO8T8sAo8jEiYWoyL7KvI
         gkZlRGT1a7LbUsQfTIUljX2V4iuxFxt1ah6ORBW9CuzdZU9Y1/+1FRiHSecj6l8V+ZcR
         P4yf6NDzMEIdLJ1nwykfUZtv0q4JKKpeiQNHPH2CHBqruGuwZcN6sTEqrmE/Pbl1eexQ
         BM+6qqdnUVg7A4zgMhg2xxSFIbpcXQt4YAo4a1dR/t7WFVRBxTdwi+krpjsE1Ed8/smJ
         0+gQ==
X-Forwarded-Encrypted: i=1; AL+hErGK05MT153WIzp8LdHx9SYmwzo+HmgkQ3Wl3adGmN7F94tOzkjSOiqMmHm31bYcr22qiZrz8FpX59n4Brw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SQi+sORPkEiF69iijXstXyxzWVG4aFAOP/Klp30n6Xot9V62+
	r9+JDSHXZJ/1mUqh0u1BHfspRLUct9UXxPbQxVajOOQ1CtqVev+5LDQQ0UfPCN1Ad68=
X-Gm-Gg: AZFdTZcrSDLunXKd6bHSR1G2rtZQBgZPagoBKL6fINRVGi3RaGTtLG97o/ldsaI5Zsj
	c8/0FEX+gKAOvZzReAiYZYE9Z/FTIu6HrAFtWWHf0i51vi+5510avFfG5HT/rdBN353iPrYrpLP
	sHn7GA84fjs0zbw66ZTJdADc+E260T6iVxfryaxfHViRImuB/XLidmuL4or9XTTOQXNmovftD+A
	q/8juBhe8KOalVSfq499StkBwLABJNOhZOUMSpCviSzRV8moKLheF0TZCe0klB+T5KOZSKxtwwl
	dWd6HuqH5Ut5tXPfXrqtyn3mZPs/oeeX5LMKWV8GgF86FyUhb0grDHHCnuunbNjziv4S2GSSjv6
	bC3XitHLE2+4167HpSpBLIdYDBd23EEfmdJq58/uc1O90ulxRTwG7sx3/IhZ0fapWhkh9+AWQbU
	T30DETSW4eJyijigCmehMnKLpDsUTCiuYVUhpfBBrDlap2K6RsuUNFt4uieAKZLAoAijzrDpm2B
	SHR8FfZ6p9UCltT39yc0GwFQmE0p+y24ENZ3BqgBSsk5eWZXeDk5PKo4LFbGCpENGLY1WobaEhq
	LK1scoGAlKs2UK68EAbBtK7vg0wo
X-Received: by 2002:a05:600c:1548:b0:4bb:7347:d5df with SMTP id 5b1f17b1804b1-4bb88814405mr445502155e9.13.1795703798534;
        Thu, 26 Nov 2026 06:36:38 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm340799515e9.0.2026.11.26.06.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:36:38 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:40:37 +0100
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/28] dmaengine: bcm2835: Fixes for dma_abort
Message-ID: <awhE5UEnOtrXWX5l@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-6-andrea.porta@suse.com>
 <awXmrhJ4HToyCxOD@lizhi-Precision-Tower-5810>
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
In-Reply-To: <awXmrhJ4HToyCxOD@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:34 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:43PM +0100, Andrea della Porta wrote:
> > From: Dom Cobley <popcornmix@gmail.com>
> >
> > There is a problem with the current abort scheme
> > when dma is blocked on a DREQ which prevents halting.
> >
> > This is triggered by SPI driver which aborts dma
> > in this state and so leads to a halt timeout.
> >
> > We attempt to abort the channel, which will work
> > if there is no blocked DREQ.
> 
> use imperative mood descript the problem
> 
> >
> > It it times out, we can assume there is no AXI
> > transfer in progress and reset anyway.
> >
> > The length of the timeout is observed at ~20us.
> 
> wrap at 75 char
> 
> >
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 32 +++++++++++++++++++++++---------
> >  1 file changed, 23 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 063e1b2aabe3..51e3a40dbaec 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -419,7 +419,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
> >  static void bcm2835_dma_abort(struct bcm2835_chan *c)
> >  {
> >  	void __iomem *chan_base = c->chan_base;
> > -	long timeout = 10000;
> > +	long timeout = 100;
> >
> >  	/*
> >  	 * A zero control block address means the channel is idle.
> > @@ -428,19 +428,33 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
> >  	if (!readl(chan_base + BCM2835_DMA_ADDR))
> >  		return;
> >
> > -	/* Write 0 to the active bit - Pause the DMA */
> > -	writel(0, chan_base + BCM2835_DMA_CS);
> > +	/* We need to clear the next DMA block pending */
> > +	writel(0, chan_base + BCM2835_DMA_NEXTCB);
> > +
> > +	/* Abort the DMA, which needs to be enabled to complete */
> > +	writel(readl(chan_base + BCM2835_DMA_CS) | BCM2835_DMA_ABORT | BCM2835_DMA_ACTIVE,
> > +	       chan_base + BCM2835_DMA_CS);
> >
> > -	/* Wait for any current AXI transfer to complete */
> > -	while ((readl(chan_base + BCM2835_DMA_CS) &
> > -		BCM2835_DMA_WAITING_FOR_WRITES) && --timeout)
> > +	/* wait for DMA to be aborted */
> > +	while ((readl(chan_base + BCM2835_DMA_CS) & BCM2835_DMA_ABORT) && --timeout)
> >  		cpu_relax();
> 
> use read_poll_timeout()
> 
> Frank
> >
> > -	/* Peripheral might be stuck and fail to signal AXI write responses */
> > -	if (!timeout)
> > +	/* Write 0 to the active bit - Pause the DMA */
> > +	writel(readl(chan_base + BCM2835_DMA_CS) & ~BCM2835_DMA_ACTIVE,
> > +	       chan_base + BCM2835_DMA_CS);
> > +
> > +	/*
> > +	 * Peripheral might be stuck and fail to complete
> > +	 * This is expected when dreqs are enabled but not asserted
> > +	 * so only report error in non dreq case
> > +	 */
> > +	if (!timeout && !(readl(chan_base + BCM2835_DMA_TI) &
> > +	   (BCM2835_DMA_S_DREQ | BCM2835_DMA_D_DREQ)))
> >  		dev_err(c->vc.chan.device->dev,
> > -			"failed to complete outstanding writes\n");
> > +			"failed to complete pause on dma %d (CS:%08x)\n", c->ch,
> > +			readl(chan_base + BCM2835_DMA_CS));
> >
> > +	/* Set CS back to default state and reset the DMA */
> >  	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
> >  }
> >

I'll drop this patch in v4. As sashiko pointed out, it brings back the
NEXTCONBK/ABORT sequence that commit 9e528c799d17 ("dmaengine: bcm2835:
Fix abort of transactions") replaced after finding experimentally that
it does not abort the control block.
It is also not needed for the 40-bit channels, which have their own abort
sequence.

Regards,
Andrea

> > --
> > 2.51.0
> >
