Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938989;
	b=n6FJZRmHvymRxt8ZErTtoPHfwVKI35ZSlYEhvJL98cuOZZSdgr06ft/joqb2TY8C9SvM
	 1Nayr+QN6uIN+B9lnr7ZzSpbUCjvLSdyemRz8rpjsgb0ez2LpyTVp5mguBKNMQ5hHL+jY
	 JFXBJAO4d+OgsXsG5a74+hPrp+lYLpB2+sZAvMn2NOjAOdZqfPPd2jHjbh+wgfx9hxkxF
	 6rv1vTnZF4mOTCK+CIhfakne5EpFkMywzTsBV4CaXYB+m/Nq5mlwgfIWkfko/b1vbPeiB
	 MEzPsHHDP9eVI1tVOGx1iSpZzlCv4fovcE3PkXQlCGT3kWIPDcCtSmvNk1LTYhwevaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
	b=EgXNfY1rn8ZqmCrZaTRuGVZpUynqqFQKIxrM2KBup6jh3qEcCuBRpNeFi0IdRJrYD3n4
	 Y/UK173DDKPIYMxfC5OO9+I7PcA1Nxu360tCAcybruESqVo+0chyL3v2uEWab2BBwhNmp
	 nABorSszn0Mk4KkWXr5VIZ5XA6pzNTqzdbIJ9jGJhW1ubwYAmUw7+9YXRlOOHHwFrV9Uw
	 VRaUVokgsK2ObXQkhOFQ7qe/KAX2y3FgmLmwaVGzL+AWa0IKNuY/vCDlX03mmSUaQIE3a
	 /5XAaxYGlFtu4l4p8cQPnuGwtC681TcTCwMPMWx9Deoz49/3/Va1Ux6jm00cTIAn2GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YdgkGfVq;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE60606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE60606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YdgkGfVq
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-94958650b09so15515485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794938987; x=1795543787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
        b=YdgkGfVqKKui0aiLSvR6mWBKZ1+mzuRPsqTd1Sr0W+MZWL+4jDUMa6VxrqybHVoEOD
         /J9StWy33w6SStG5yfMJ1osxetxqx0DcvagahjDxFaoR5bvIK/sTcU9tLwx5smKDKl8z
         Thd3LDvAg2KozZedUmsFRZ7M/o2KonYaJ7dX9uNkiLmZm6olw5l3ytILQ2BH7q/LCTQZ
         hklXu99iDf3yimqo438LAdEHeUhdpzKPK1S2nLYqC+CIJNx5UEsxm3OYqhNRy22HA1Hw
         0o9ki1uwEKN/F5ZWTLAXZMa/9Jx7RmbhF5P3N2MbpK74vWTuOK4zl6bckElmrsmM0+vU
         2VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938987; x=1795543787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
        b=BZxpB0JmuOdPLWUEHTFyGv7smZKtykCK0BRawq3b4fDdhAp3+meS4hXgSzQzmwUhpc
         L2KcCAcLeDia8DrPVAlm2u1RAxpoM4Uz32RB6Fiy36/wZbFuRBi7oASK/HZ1Lhaw6tMW
         KRKUc+dqUoFx5HG+0FtC40p3RFF16jBoOy+9R9oG6L8idzy5y86BRY7/zYbhDUaROmrm
         EHCe1sMygVNu++0J2tgq26dX7/wOlJ9+tSkGt+ROMWIKJjfHFQrJXH+GhkihJTDgZa8H
         LT93ENB8BilV+dF6zvIviJeaZGCiiTfSPKEryD0DoP3REq+Vmwwlgaf3IOfhnk/K8uuI
         M2WQ==
X-Forwarded-Encrypted: i=1; AL+hErGEJiN2gWbLAC9gq3wPnc3axG8xEy2UDFR9SC8AhsvOR4yCHo+5UOtW70fPWHk+w0856DBz0q6rEdFv76o=@vger.kernel.org
X-Gm-Message-State: APuU4Z86Yb/Kf21Cb0tkDf8TxsiywVG0jQTPCTwTGYiQ4ckVqfMEJGyi
	G6blCKKAC8Q6PO1mGUpWs4kP6th1Ns3YzlwELYe703WIf7ULRO8Za1MoH9yd4/1v0xY=
X-Gm-Gg: AYBFou3XjgrcVydmWbPF1KznDYYq4A+eq50FwURZNZgzH0e0JbuEkr4iw7pCBL1sE6d
	GPosLvueesLtOuhWDJ/YXj5Q6y6pbhzfKMn2p9bKILmJcXDvKQHp3jgxy154XGulIGDsQDjE8bM
	gxCHqR1My+PwlnnIbWIwBjqZNx2eGJGde1NGDHVhvbGnX7xtBh3f3u9qk9R9g3L3APZzemKI32+
	u7ZieChxu1WkuZd6Et1klZ00lfwBff9O4Is8IZpKgjr3chcmqLSSE98TsHbGkvIEZJE0+G5FWcl
	xFJpaXW9R5RvLS3fbOfyUp5+h2eejJaFbbaNLlfppaO0V+2+1M78X4ycN/jB2YKq4RolYbc6yGw
	kJy2OB/d80M0ZTFuoCENna44vnWXzU+VH5yD9IgtYdeNG6A56w3fZdstEmYSXRVtT5rfUhxFwHk
	btXvysG+gUjLoxRglP5QDwz5gF+LkJwFFX+8IZ4HQeqngXHkd/aALsP4yIuW/msq8fPH2ZgRGIM
	C+EIGKja0/c5WR1PCABEbR7ZgTQbP20st2rB8h2KpO2D9bvSMXSIg7VEJ6lXht5MLb4Hnue0uZ8
	gOaCh60=
X-Received: by 2002:a05:620a:46a0:b0:949:6ec7:68e2 with SMTP id af79cd13be357-94999650610mr89698785a.79.1794938987121;
        Tue, 17 Nov 2026 10:09:47 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b5c1dsm1155175385a.33.2026.11.17.10.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:09:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTNcn-0000000D06D-1Abm;
	Tue, 17 Nov 2026 14:09:45 -0400
Date: Tue, 17 Nov 2026 14:09:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Peng Fan <peng.fan@linux.dev>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>,
	Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/9] dmaengine: add DMA channel bus and fsl-edma
 per-channel IOMMU support
Message-ID: <20261117180945.GE2606445@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <avyGI6QmuZ3DUqc9@SMW015318>
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
In-Reply-To: <avyGI6QmuZ3DUqc9@SMW015318>

On Tue, Nov 17, 2026 at 10:51:47AM -0600, Frank Li wrote:
> > > In dmaengine each channel is already modeled as a channel device (see
> > > dmaengine_chan_dev()), and this series puts those devices on a real bus
> > > (dmaengine_chan_bus_type) as a prerequisite. The DT child node simply
> > > describes that existing device, so its reg/interrupts/power-domains/iommus
> > > are attached per channel instead of as index-matched flat lists on the
> > > controller.
> >
> > If they are real devices then why can't they come out as platform
> > devices?
> 
> It cause complex when consumer to bindle channel dynmatically.
> 
> for example:
> 
> consumer_A
> {
> 	dmas = <&dma_provider ID>;
> }
> 
> if each channel is platform devices,
> 
> consumer_A
> {
>         dmas = <&dma_provider_chan0 ID>;
> }
> 
> Consumer_A will have to bindle to chan0. Actually, dma engine support bind
> to any free channel. It will be problem when there are not enough channels
> for all peripheral.

That seems like something you should be able to fix in a better way,
like by having the DT know which DMA devices are usable by a consumer
so it can be pooled.

> > I think you are overstating how independent they are. Many single
> > devices have per "channel" resources like MMIO and IRQs. That's
> > totally normal. It doesn't make the sub resources independent devices.
> >
> > AFAICT what you have here is some HW designer used SID where they
> > should have used SSID and you are trying to hack DT to make that
> > usable because Linux does not support a SID as SSID model today.
> >
> > Again, since this is the 3rd - 4th case like this, it seems like a
> > popular hardware choice and we should try to do better to make Linux
> > support if we can.
> 
> What's your prefer?

If a PCI device implemented something like this it would use PASID.

I have one device with many DMA streams is what PASID is for.

Recasting your multi-SID as PASID somehow seems like an interesting direction.

Jason
