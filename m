Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702920;
	b=G48b2AMc2uUiZw5IuOgKjEU1Jq2JXg1w2kY/RDlMXtVGzV7X/dH9IGuXLl8aA49Gg7n6
	 W0E1VBbZY6P7ldTcyW+chF086mDl0PVUpwCYWlNlmDx5bJO6WRHENxwtWv62wBiVdL6CI
	 qfu8q00H//50+sp7NIvFf4sAq4zRAqRrvgX9JjQG8AmqNdc5zJtF2JjMGcfFKmzKSmmXJ
	 i05uUC27q4cPV2dNhZ055QB3eHB+kKnLpnWAtzfOraXUtyj1guxQHL8suNJJtp3Q1fTdS
	 gf+D06nMYXyIcuES8CBziQS3KBtJU24/EcCXB3QLPVWLF0+UeYIhMwwbteiHG6Q+I4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3qO+cKDCyoLTk5ZwPdAZ2/NZCnSWYAmAoadmXtEy00E=;
	b=I2BcezRavQcJY4oYRqENibK4frV7IfHQ8lCNMpUv3vy/cZYFU5j/fZVfJQ+4D3zmTBto
	 0iNwet6ZktnxShHZBISEl2ghZ/R+fBGRfKRb4S7B1mYvp1hIyAr73UB0PedQ72HzXVC/f
	 6Jg8YPS/zixqfFYDGEE0uudnbedWXw4OzS7yEFVnYr1GwAYRCjNZIPe0QE6VXWs2IxMk3
	 VmBq2l/qq3eu7d1c8kBxEYl0djIkTsbIgpfzYkXgS2EL1+zd27pLGZ7yw/dMvfj1DsX2N
	 1KLxwMcd0VcWTGBFGZ2g3vdH8Yet2WQt7fYq0kHb45EzkGQIDi/qqzhwx0itDuMxd+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PbsRhuus;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB32606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB32606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PbsRhuus
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so17573235e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795702918; x=1796307718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3qO+cKDCyoLTk5ZwPdAZ2/NZCnSWYAmAoadmXtEy00E=;
        b=PbsRhuussMyQu1C9Z87U0zbKtI5UnEuDaxErAUa7VDsBHDhsXOGybk0MseNYgdS0WG
         3mp9KsvAeOdmhlcSsViIJgXJKbQB3ng+oNlNAGniIZcJmQMLwT2Pz3Brzw9BwMwInfSH
         1y4zlblZhDKwtkNoqvX0eFpvBJehVvQtpFK84rpdkG85M8YXQRzpnc66czzHFMN7eUWx
         /8yPAzE9EgmntLslEXnXJryayLZGqTOwnPL+BDXjTvUDgk5/y6h48xMO0FMYOAlmClxT
         hFmII7Gavou1Aaa9OnAnucLeaCSoGPc65bYTx41ZC2EB9wQ6IReFIy4vkWncwgl1ztL8
         Mltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702918; x=1796307718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qO+cKDCyoLTk5ZwPdAZ2/NZCnSWYAmAoadmXtEy00E=;
        b=VuRxw6HOH5WrEEmjlq/xWbb8DZNdP3wPMHRsEJML6oDcRvHgdoVbAy6z8giivzxaxK
         zLRUYzDknbZffvhU05JRH2il86ReI/BLDX2iYKfE0/LED3GZu82VaxCOEpIe2dmNbGLT
         bDzVGOuYfgNXQ9Fg45Z+1X26uaFQBf68yCPrxzntxWriti4ySx4wQhHRYEqCI1Cqtqe4
         +5kQOiastazz2bWzbRLcHLw9rCYoMvTTJGqgrXcpvX19DGzhXBmnPnHZZULok/vITlR+
         Cy4cg7eSN7Nzb6nH23FSxuD0B+l3Dabvut+xkwN4Vb1FvD+jGP+uACcqRk2yr2XrLpx3
         bnxw==
X-Forwarded-Encrypted: i=1; AL+hErEJ8c4s7rHxgF8LSDoqLR6dgFffdKbdFxXpthuqqgw1X3YpFDOdqWjxKCFnc4RXZaowxS5CGkVHBqwNmrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CuoJYj4v0/E8/dXjk8Yt8IFSHKVYCJiKBOlct63wCJSKm/kl1
	anT3YHqs0/1aJzOvlhz1fYMwN7tPeE+CykBus8QsTD6YaRv29+moJyhZA7vI7itPveQ=
X-Gm-Gg: AZFdTZeNGTDj3l+ERISH8BmmwjnjiTrCMgV9jL14ttYqOKdP23XInv/CP0ngsGRGUuM
	7lY0PvHyQEJBr+wtF5s5WVFcvKYlh8YYhoTrVHPmIGy/7r5X3QOPJDPRg0c4XbwmkFurljulPjW
	wDhknEfgOz0LrrBtR5bSanUcJeAWHXWPa2qgpb3o2ABQ/6HlSp9sN+UMgj1XyXh1KEtzQeBEKsP
	8omhkxrsuYLp0TZ7SIYWOfbWuBZDHeV3KqbFlQbaPtGuolkFQdSK+5X56YFrpEMqlujs+2GA/tL
	XgjIfn51i4aN4z+ym02da9asGnGt/gragoQeS5UBHIykvnw4craWKCk9LM0HuztQkaZhTR2ZG3C
	SULDjox9tg/QOyhyiaqwBGtLF2j8AXDsM+q+yntGHd4qa/S0+Su4gaMC/oVOyRgwTMp9NFNlM8z
	m0tnxcGMdhslYsb/mp8unpE+mbDpTm0ljzjpPO15fAskiJpuhxTgTdQjZueD3hfBx8PLfIOsCwh
	nDLbOiV6lWyrldG5KqfOdgisYNFZFOjxH7owQ7J+uNBxqkxT2dnfa5lfq5uSKIkpVp+k5X+S2BL
	wvltbBCd6X2NbikhGE0dxcfHutnJ
X-Received: by 2002:a05:600c:a08b:b0:4bb:6651:9eda with SMTP id 5b1f17b1804b1-4bb88922ca4mr401901655e9.14.1795702917688;
        Thu, 26 Nov 2026 06:21:57 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm831228715e9.13.2026.11.26.06.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:21:57 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:25:56 +0100
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
Subject: Re: [PATCH v3 01/28] dmaengine: bcm2835: Fix coding style issues and
 a typo
Message-ID: <awhBdHDVnmxNhQOM@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-2-andrea.porta@suse.com>
 <awXhjjB_9-N7RRBi@lizhi-Precision-Tower-5810>
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
In-Reply-To: <awXhjjB_9-N7RRBi@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:12 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:39PM +0100, Andrea della Porta wrote:
> > Fix the coding style issues reported by checkpatch: use u32 instead of
> > uint32_t, add the missing parentheses around macro arguments, which
> > could lead to operator precedence issues, drop superfluous parentheses
> > and long int, and align the function arguments. Also fix a typo in a
> > comment ('missmatch').
> >
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 83 ++++++++++++++++++++-------------------
> >  1 file changed, 42 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 06d830d36882..b19182c6e3df 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -51,13 +51,13 @@ struct bcm2835_dmadev {
> >  };
> >
> >  struct bcm2835_dma_cb {
> > -	uint32_t info;
> > -	uint32_t src;
> > -	uint32_t dst;
> > -	uint32_t length;
> > -	uint32_t stride;
> > -	uint32_t next;
> > -	uint32_t pad[2];
> > +	u32 info;
> > +	u32 src;
> > +	u32 dst;
> > +	u32 length;
> > +	u32 stride;
> > +	u32 next;
> > +	u32 pad[2];
> >  };
> >
> >  struct bcm2835_cb_entry {
> > @@ -116,8 +116,8 @@ struct bcm2835_desc {
> >  					       * AXI-write to ack
> >  					       */
> >  #define BCM2835_DMA_ERR		BIT(8)
> > -#define BCM2835_DMA_PRIORITY(x) ((x & 15) << 16) /* AXI priority */
> > -#define BCM2835_DMA_PANIC_PRIORITY(x) ((x & 15) << 20) /* panic priority */
> > +#define BCM2835_DMA_PRIORITY(x) (((x) & 15) << 16) /* AXI priority */
> > +#define BCM2835_DMA_PANIC_PRIORITY(x) (((x) & 15) << 20) /* panic priority */
> >  /* current value of TI.BCM2835_DMA_WAIT_RESP */
> >  #define BCM2835_DMA_WAIT_FOR_WRITES BIT(28)
> >  #define BCM2835_DMA_DIS_DEBUG	BIT(29) /* disable debug pause signal */
> > @@ -136,9 +136,9 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_S_WIDTH	BIT(9) /* 128bit writes if set */
> >  #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
> >  #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
> > -#define BCM2835_DMA_BURST_LENGTH(x) ((x & 15) << 12)
> > -#define BCM2835_DMA_PER_MAP(x)	((x & 31) << 16) /* REQ source */
> > -#define BCM2835_DMA_WAIT(x)	((x & 31) << 21) /* add DMA-wait cycles */
> > +#define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> > +#define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
> > +#define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
> 
> You touch these code, can you shift to use FIELD_PREP() macro ?

Done in v4: the register field macros now use FIELD_PREP.

Many thanks,
Andrea

> 
> Frank
