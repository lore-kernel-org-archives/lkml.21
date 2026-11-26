Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703080;
	b=lm1vmm+XLtVB6RcDT7pfx3tDi4hA1dEo/Tt9PdxK9LukWngWKqlsZDg1WttlpHrjp9dN
	 63nhXXEGytmkEtIq4AJTbD8zJyZmhVCa46cFLbIB2rqM0TE+F5nWY3MSx9ezlq6Y8RzNo
	 bKHPn+LUxaTYTjXv4t/4X4V97oKtm+yK3+F3u09PYEhg5gSqKVlxSci9PjmGBON0vFurK
	 mERPseiPsyfhQ2BJ8YIWnB6AU7aG2cfBcvKNnUm1y41JzTcADs6wugdTjKkAIRCqUU2Vg
	 I7a0hKSO3Zj3EZPhUFqy/tJfBNoKYemmiConmyLKYZYc3jngUJBjmInynwCILZx6j9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OHrC46cIWChCBmJPkyR2Sr/R2tdqnLfv5l1cfknsL0s=;
	b=XKeVJgquVSrrigd5fC7VdPY4/fWm0uO4LmhvmpBVj/oHn78AbuGv6Bn3Sjyzbs8IL4f2
	 jfpRnvGlF4Hsk/t2AG+ArVTIJrkZBImCY3vfekgTx3XtuhLOVlm9s+soKoljHaX7M1QsD
	 3wOgbMPZD8k1zE+/EdkuXgPeWceoMc4waR7eiamPIYvEEA7x7cNGQutfI4KL1tsoaKsal
	 rwgXICSiuk5MpC/hxrMXymw8I00sWQ/0CR+QlqnD0McRqMQSXGK1pmt7BSVHHrEHpsKCK
	 TmTnLcOfh3lM6jfZI+1zIQRiMtuLrQtBZV1SCRlshHdroxvHwi5OJLSBRZOZ5tWYuuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y9IePDbQ;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E7C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E7C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y9IePDbQ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e47347279so4319118f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703077; x=1796307877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OHrC46cIWChCBmJPkyR2Sr/R2tdqnLfv5l1cfknsL0s=;
        b=Y9IePDbQYBGAkTYC0UHzY0Ah22gBklCybCgN+2CP0TmoVzaQZEcUDck8ROwN3qZW10
         BUyKC9hPyddCf8J9QcIBzdHVTNC0f238CW2OjgElb5lwGbF0hbmWyJ0Lglc+rP8oVaoY
         SqyBBY3RudJZHO+opBNWuKse+7RQofX7isIY+R5+ASa0f3e/7kzGa6bUA6KVe7CBx8PA
         XFE0CYFbb75jRu2VS2xEKwS96T9FRb79/jmeTXxkijja6HeWozniJBaMTKsCNOtExekd
         l4mKGaLzKTHI3hSiGKA11FxzTRI60c/1bU6CsrmubRPXRnOg37jW1uA/rnQITqlULocA
         CNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703077; x=1796307877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHrC46cIWChCBmJPkyR2Sr/R2tdqnLfv5l1cfknsL0s=;
        b=CJrO8cV2jKOl4Cfhdk+/RMt4sd6nXWTaZs3KLW36m8NYhnpkRKO1Jg3R2spzpd+vGI
         CybcL9jbLCMmVAR9mwHBqEiufXHWntpGzRbb460uFtRrTeimBh7dRG3PW0yfJogpBLbn
         pYzhIyahLG0R6450Epf29lnWk5LyGm33yevn1bzZXYGFDmtmB4S2gFKGZtmto6ltgjCX
         //U6gs64ZFg34Ln5fHUc3vPUYd4zzPKJ4GtGvpryhjtfrT1cHEgEPiU5axptes0ljH4T
         HPfbHQO0Qz83IH5MdXMMJYVkZ0yYPViP2Pn8SfMgjRjai8CVfd2oV6mIIMz19XPjQM/C
         Lwlw==
X-Forwarded-Encrypted: i=1; AL+hErGByGKIshPWBYBJ9JdReZg91QOX8IXBVib9ZGbx3A8WQOXCPmFrXK5JPyYXjRpD9rNL8WzQaVLfmkIE6l4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LO9QiQzgbGB5e77gl6rS74Zg9eAlau6CzWNeaIOjwg/FLQK6Z
	o7ZHow+j5J8+jdpykVbFQNNn0m6de8D+HyvmcJagKT07H5U4sz/IWq33K7uC/Scq2Ec=
X-Gm-Gg: AZFdTZeFbryJocwOa4xsd38ZyLnSx2bHJk+XG+Q0HqkHu4gG+JLHnd3fLcU1msUkhvq
	rVvF5k8x5PXRqAbH/xV44oB3lWM0HJnC0FCQI4XVtticXjxcreJk6ISNOrYjcJCWzh0U+HC13Wz
	siEEZDUoaj7O6kM3TwFSCuIqAtIb9bMTMWXcDTt6/aDh9iDLxc48bimpa0tgA1u3kjgEKQUX8wB
	9Moo9c5rWrf/5uGTx6WPvLkcZckBdPnwH+GGVvNa0Q1V45NUSs8rma8fVRvSRPAn6ZQWfYo2UET
	53Izrz/9tAQn+xHvly4Da3GcMAB27YaSG1FXDmgsqd6JQpDKIIjDOl/zfHGe82uFeR+wMmAShWI
	wBfD9dKr98MBr/7ZxgqcPRmslQ5pd4unavimJPUB1nPUUDQ/mjMJ3QX7v/KBgsKiwM2O2W4id7v
	414kkX8JGtPm/1oZopgfJ9yTrqDI6/hZaamdbLei51YlIeIi2BToooF9IikICVTB1DIg6V33hIN
	sZb9kcuTOS4bx4lgFZrVTjbPMK0k/nYE2laT8+FEQst0O5ML+mLII+ce8auY8HKfBqwX7sXl10G
	N9KV6Lt7Dyy4X2pi8Hl+pi8wTbMD9+U55iF+FJm+HaeNZufx9A==
X-Received: by 2002:a05:6000:4008:b0:4b6:8c1:bc3d with SMTP id ffacd0b85a97d-4b608c1bc69mr17794667f8f.57.1795703077525;
        Thu, 26 Nov 2026 06:24:37 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm41189410f8f.41.2026.11.26.06.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:24:37 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:28:36 +0100
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
Subject: Re: [PATCH v3 02/28] dmaengine: bcm2835: Add support for per-channel
 flags
Message-ID: <awhCFGZ8f6f4h5Ku@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-3-andrea.porta@suse.com>
 <awXjgCtgR5wtadnb@lizhi-Precision-Tower-5810>
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
In-Reply-To: <awXjgCtgR5wtadnb@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:20 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:40PM +0100, Andrea della Porta wrote:
> > From: Phil Elwell <phil@raspberrypi.org>
> >
> > Add the ability to interpret the high bits of the dreq specifier as
> > flags to be included in the DMA_CS register. The motivation for this
> > change is the ability to set the DISDEBUG flag for SD card transfers
> > to avoid corruption when using the VPU debugger.
> >
> > Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index b19182c6e3df..690f5ba1c439 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -137,6 +137,10 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
> >  #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
> >  #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> > +#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_PRIORITY(15) | \
> > +				      BCM2835_DMA_PANIC_PRIORITY(15) | \
> > +				      BCM2835_DMA_WAIT_FOR_WRITES | \
> 
> Your commit message said "ability to set the DISDEBUG flag", why need
> other flags here?
>

Right, the commit message was incomplete. Besides DISDEBUG, the flags carry
the AXI priority and panic priority, used by the BCM2712 HDMI audio channels
in patch 28 to keep the FIFO fed, and the wait for outstanding writes.
They have the same layout as the CS register fields, so they only need masking.
I've reworded the commit message in v4.

Thanks,
Andrea
 
> Frank
> 
> > +				      BCM2835_DMA_DIS_DEBUG))
> >  #define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
> >  #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
> >  #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
> > @@ -433,7 +437,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
> >  	c->desc = to_bcm2835_dma_desc(&vd->tx);
> >
> >  	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
> > -	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
> > +	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
> > +	       c->chan_base + BCM2835_DMA_CS);
> >  }
> >
> >  static irqreturn_t bcm2835_dma_callback(int irq, void *data)
> > @@ -460,7 +465,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
> >  	 * if this IRQ handler is threaded.) If the channel is finished, it
> >  	 * will remain idle despite the ACTIVE flag being set.
> >  	 */
> > -	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
> > +	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
> > +	       BCM2835_DMA_CS_FLAGS(c->dreq),
> >  	       c->chan_base + BCM2835_DMA_CS);
> >
> >  	d = c->desc;
> > --
> > 2.51.0
> >
