Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703379;
	b=rihEW6sgQ5gFZYzLNEGwpW/oeGEbGZ3kHCYREW2lt99/Pjw+kA4tTN+UncXw18ZktZ4H
	 7bsAxSaOyAnvRYxHf1na/7egjxymWLDlwTJ4D/383AfbcsnBXX+5O9+G4UNqivIX55nH3
	 JkXpsqfE6TviHqjWGq9umr0s7mSGx4VoQKExByu5wAvUd4yrjDz7x6RwK05npPobqqAn7
	 BC3Pnrd/AVHSOm2RnYJqOLfx9nY1+SEGKcplVStDuDQ9BeVBJi4JgmlLPhrbTf3dAjadW
	 8KNakKsbTJicOMpVNYpP6UlxS4c+vtbjlDcKep0b82HV9uYOAEs30Tc8TjH45M/om1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Go0TMbxFIn6Uh64J5GWsZj276nuCgaJAlCWObxr0QGU=;
	b=qE4kjkLRiQbAsXLMvtSuFN+7xSrrJE9a38HX6yf/YgVk9x1nfkOPDRxDU9gEQt/j35gr
	 mA/HQfoydLLuqbB3wGbrJXhUXWTdC85E1EZMRARmQjzSzOYHq67lbQftqQIqZ3Yn2F+IF
	 TGaIGttyPz7gOVOyY1NHx6a6zLLe5bBtM2k/pZxe0sroo5uVOIqfYZ4CD69wXEJFUuOuB
	 NFHsXz/zouLpzT7WHOOfrgBlZh7lJtx1nzOCCFJst+0J9LImcYxvT8W9hIiIR2Aop1Rhp
	 VP68Xn5xV7zQUjb/PuCGspIeCESTOqYeiGf8tE1tnow+p2JRyFT0ZnWU0MgkUiKvIsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PWEEudbb;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339E3606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 339E3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PWEEudbb
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so64153005e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703378; x=1796308178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Go0TMbxFIn6Uh64J5GWsZj276nuCgaJAlCWObxr0QGU=;
        b=PWEEudbbvGnzIy34gsbFCJT4T+eg3K5+6YYQHB4CGAhOtLllM5FfnYgYspoarjVh5f
         ehTkLppm1eR6I+2+MGI/a3SALbd8GUjB+FAizYwAGglZXPq4iR0aod6GD/p4iy60jACR
         kleu0KCTP9fr/mQuDVEJVOf9B8ffdZfXgtCpZx/ryML2aW62S44bJvlC8QhUP7lvJDKh
         vwoFqQudoiIUKWPk4sUgJVn9WidPnUwa2lXOiF/3MAThKP3EMC9Ag8dVFPBvCfwIHfis
         ONMx8t1ijmj7xkykO0gMsUxWfUKr3/2bEIJJcjwhYn/uMcjYivynbhfkxxRkeEOfR5Xw
         JADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703378; x=1796308178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Go0TMbxFIn6Uh64J5GWsZj276nuCgaJAlCWObxr0QGU=;
        b=xbgUqLIpXEn5MxBJNxKSSnj2gkFck52+yZCLTzzq7iThpyy4wjUTioV4G0srLVzSOl
         ik1hLMUJya6kYl3QY3oQ0Mmp8xEMlqb/xqz7sUqQ5DmpNh4ulRr4BsxSL7RDgkW0RNdm
         pC7RgfKk5azQhJPKV/YOybrMMnvIWqZ2elSVdfXffhUTlS6Zw2WpmCIZD1quX03W7fRC
         GuUEfF310fCP9QCnKapv9L0j52rR1S6Y9tHQirBekMqKNbN1qu+NbOEI1QG+OTjsIg8K
         sTwXjEVWJe72Al6i8OAdsQRRqQqD2IDcEStIensP6WRB/Ffw6kS6WEYF8YktSd7zhcxq
         TAsw==
X-Forwarded-Encrypted: i=1; AL+hErHOV4f9avD8sdvVGxa+I/MRSJbUct/7O7A36gP8ayWBmxr9duazMVpT5rQmCWhDeRqbFKkR1xBZhSeprAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fKxT0dQ/DiC4zM9vYXZlVNPEZH9XfnjiLNMwfI2BeF/Yf8hT7
	VmjVCNzaczda6oDtSsVS/LfwVraUmkpPsQ3Pr33yItjwdpCePIMuKVoSKKhN0xxcuBI=
X-Gm-Gg: AZFdTZdk48JhflmrJBOczpwRya3MnnlthTqvyIXL1oaKCJ0Teerbp6mVjaRj3XinRpZ
	q8Cv+RVL/sWhSdrZQFMcl2YVxqMqZcuM22gkhUtCxYqaaDEsGYnTy+xkaNUWgCas6qGJbxQ/RgM
	IohDNgMOFCV34nUeWwkZbH4Xi60k27uPLCAs9t9VpFOWItska+5uko0gIAlZfynKvuwf9yVEqZQ
	O4jAMWCZDCvJbs28V3iTqPpykpMh3wlzCUdQpT5X35ivJUkvYI6pS+JuOx10dQyz+rjhOt18Hvm
	2pDrqnV6tpuvIo794ZZ52UjLKjPOejtdALcNz80dAuGhuq28NvjBJve+8Dmk2GxNxgUGvy1uokW
	0MHiH6NQ+rzsFOhwKafwmndtYpIP2FXJvuOsIO0Pc2TKGwKajwUSHASHOkwa5NLKwF0YgfuEPjC
	tJxVV3ki5Vir0KQmNJoZqI88FseueYQUjK0/OfvZ0nYpV3fxyUrN0Bx5AyqFB9WnoeQd3xUgHLt
	unVyQiDA7aXbNuJmKg6MfTFgfxRxqP7qKY1FgUXCsLVU86JpPxknql+rYR1qSKDdOxZtuEbX9dh
	ayhT8YkNV4OMPhBMnssEVRVfr5YH
X-Received: by 2002:a05:600c:a085:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4bb8881e6c6mr419119205e9.21.1795703377520;
        Thu, 26 Nov 2026 06:29:37 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm365232415e9.4.2026.11.26.06.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:37 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:33:37 +0100
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
Subject: Re: [PATCH v3 03/28] dmaengine: bcm2835: Add NO_WAIT_RESP,
 DMA_WIDE_SOURCE and DMA_WIDE_DEST flag
Message-ID: <awhDQbBKe0vLWbdr@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-4-andrea.porta@suse.com>
 <awXlR5RAVl8XMVxA@lizhi-Precision-Tower-5810>
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
In-Reply-To: <awXlR5RAVl8XMVxA@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:28 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:41PM +0100, Andrea della Porta wrote:
> > From: Phil Elwell <phil@raspberrypi.com>
> >
> > Use bit 27 of the dreq value (the second cell of the DT DMA descriptor)
> > to request that the WAIT_RESP bit is not set.
> >
> > Use (reserved) bits 24 and 25 of the dreq value
> > (the second cell of the DT DMA descriptor) to request
> > that wide source reads or wide dest writes are required
> >
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> > Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 25 +++++++++++++++++++++----
> >  1 file changed, 21 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 690f5ba1c439..118ba2f71dc8 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -145,6 +145,21 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
> >  #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
> >
> > +/* A fake bit to request that the driver doesn't set the WAIT_RESP bit. */
> > +#define BCM2835_DMA_NO_WAIT_RESP BIT(27)
> > +#define WAIT_RESP(x) (((x) & BCM2835_DMA_NO_WAIT_RESP) ? \
> > +		      0 : BCM2835_DMA_WAIT_RESP)
> > +
> 
> why need recorder these information at in hardware control block if it
> is reserved by hardware?

These bits are never written to the control block: they live in the upper bits of
the DREQ cell of the DT specifier and the driver translates them into the S_WIDTH/
D_WIDTH/WAIT_RESP bits of TI. *_PER_MAP() masks the DREQ to 5 bits, so nothing leaks
into the hardware.
v4 will move the definitions to a dt-bindings header and adds a comment to make
this clear.

Regards,
Andrea

> 
> Frank
> 
> > +/* A fake bit to request that the driver requires wide reads */
> > +#define BCM2835_DMA_WIDE_SOURCE BIT(24)
> > +#define WIDE_SOURCE(x) (((x) & BCM2835_DMA_WIDE_SOURCE) ? \
> > +		      BCM2835_DMA_S_WIDTH : 0)
> > +
> > +/* A fake bit to request that the driver requires wide writes */
> > +#define BCM2835_DMA_WIDE_DEST BIT(25)
> > +#define WIDE_DEST(x) (((x) & BCM2835_DMA_WIDE_DEST) ? \
> > +		      BCM2835_DMA_D_WIDTH : 0)
> > +
> >  /* debug register bits */
> >  #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
> >  #define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
> > @@ -605,8 +620,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
> >  {
> >  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >  	struct bcm2835_desc *d;
> > -	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
> > -	u32 extra = BCM2835_DMA_INT_EN | BCM2835_DMA_WAIT_RESP;
> > +	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
> > +		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
> > +	u32 extra = BCM2835_DMA_INT_EN;
> >  	size_t max_len = bcm2835_dma_max_frame_length(c);
> >  	size_t frames;
> >
> > @@ -636,7 +652,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
> >  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >  	struct bcm2835_desc *d;
> >  	dma_addr_t src = 0, dst = 0;
> > -	u32 info = BCM2835_DMA_WAIT_RESP;
> > +	u32 info = WAIT_RESP(c->dreq) |
> > +		   WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
> >  	u32 extra = BCM2835_DMA_INT_EN;
> >  	size_t frames;
> >
> > @@ -688,7 +705,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
> >  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >  	struct bcm2835_desc *d;
> >  	dma_addr_t src, dst;
> > -	u32 info = BCM2835_DMA_WAIT_RESP;
> > +	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
> >  	u32 extra = 0;
> >  	size_t max_len = bcm2835_dma_max_frame_length(c);
> >  	size_t frames;
> > --
> > 2.51.0
> >
