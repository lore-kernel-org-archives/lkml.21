Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939421;
	b=icxBmt64/72obVUmTudqo1NqiYNt9XBBhJXif4VcfShGYmlRIAa+e3ixhlM4EsqhzPP2
	 rU96pyHDX4Kg3WgJE/msGdG+bg2kDg1tFPjnLkLr9kn2IhO7KawX/yfTbVIoBNZ/n1zdL
	 2l1JdPyadCNLh7CNjw6n/g0bVZdcMimAAEbXHbBle7aNqBsgkOMdslvnzBfWkhQQDujHs
	 q9kS9RJhsAOpCrvGHlyZ/ct7M0pb36dRjT+BeFhTB7J/Zze42driFBI+TSz9/66mMD4Vj
	 ZnLjdq+q7NrF9sflk9ge2DtDl98wJcyhYfoaXZgyeSuZUKrH0SNhlQSAkxgDwVrLs0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pepFJC4WupF41wk+cSidNw5vmFTw1POO1gRenleZ+aQ=;
	b=UIv6q64MxsM+VNwRdssnHZgbREPxYy+gG/BIr+Epe3QLyPrm0Ce8fMF8ZDhUOg8mmd0Q
	 Qa+iQnAccGzs1wa1/zavY0kOgF1to/L900S2udNEld0Tdg7L8mbPsbflm8gA9dSNjBWTm
	 tPyM9OjIQx4jlTNti6pvYkjhmPXHyQQBE/kuDVdehdZ82dtvRJOEjUNOtG6L+gygtm/q4
	 c7VI4z9KqiuBSKqrKGO4NGmyvD5uj4IAKt+S4ajx5kNxX/5mQI+pp6+lA8MLT3xXKKqLv
	 ytY7/7XAIxvLDUIFqLMr+KL/u/poNdxiW5hDBRPQ9nZxd18efRfamwsuT2jSOxcIuOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="oR2/h2jA";
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9DF606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE9DF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oR2/h2jA
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5365d26ccbdso1254521cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794939420; x=1795544220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pepFJC4WupF41wk+cSidNw5vmFTw1POO1gRenleZ+aQ=;
        b=oR2/h2jAzlatMI8qr/+m1DFzN+AOiaSQgHdPXWe5z72GMo9l1CPO7f/2XlVcMdb/B2
         HRmaYUUcJTaFWTfKUc8Xk+XLRDQ4qs8suoHcYjExtCJ+bUPN22DItmiL//KxCV9mJkxB
         6uPBt9ZUIYvq6BEgYq0HPaAgB9Eg+HXh3wQOyyqXrlKTb8J7Fv4BcnJP47XUrI/ppZ38
         fWF5w0hkc/gBrxi3nFI852j0wmuAewg0IU+JVmVMRM6eqUl2XzkYg1dx2IUJOZwh8izG
         n/Nw+wIYfbB2Yh4xAMzqmPTFplWOwDEfXGfAYloQ+zAopYlpZwUpFUXTPl2+I786AYPM
         FmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939420; x=1795544220;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pepFJC4WupF41wk+cSidNw5vmFTw1POO1gRenleZ+aQ=;
        b=GNQsD1rbVpDfO3clygZh4Ovotg3RvRyn8Oa/LHUie6HIK/Kq8LNjKGx1uKI6cW/VD/
         UelUvoff/INlC8AEJgxoOMPBal2DmQzIwW9hFQ/TH7Hqz+AJlslj7n2Jin+2Kj8GgfRR
         lEihMXhq/qzHkmjyB74n900EqFmmVoGljzaMerM+rkkNDNRJ2JzTAFoNY4IJ1EqtrCU6
         RbKR9BHdt/nGAv4WNK+FfA6at86tyvFXjfKNRVoclvIT4GxuGHAmy5zUEBETd09Qf+CI
         nsIS3nRBi22Gy6r64qDhm/OAl8jb18WQWN0wOK3lmhZdbAuUmwTzB8hUNn/31fflsZGs
         WqMw==
X-Forwarded-Encrypted: i=1; AL+hErE8kuJ2/KRy9DA8LLgBj4xGYtm0SgUbeLvREzV7Ua8LsYRipWm/eZ+nNcLphBfXRySWD4zcyvuAWq/cd4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x/00e2/Ox1hf3s+JJHyudPlTJmGvt69YjSxpOuNz+6FksAnJK
	aloLqhU6ScK57+bPsN7vG290WNR/ptdEoQ6MHg2GRqI2L/skwgQNaT9csiismYD05Oc=
X-Gm-Gg: AYBFou2RPGNZ/AUuZCGvUilObJT82K0vnYeBFrr7KafywrhqFR674lzfg0JENw1EXs3
	U6DDEiFJzqeVq29knKHa3IzqSv57j5oyRGcPL9U+onUpt6MuSv9KI+74hKBD/j7oNGqF+H0UK5U
	CEv84a2jleZB92HTIKHJOb1yEVUS7FN8iMiCUV/gDgwvtP37sfANf/LP9YQSGAmeeJQslWOfXeC
	yTAqCpHAj5QrnOXI++CMHDfommPSpPKZDHvAA13EzvRPLAnve9g5ieZ2j41InM6MsXa9KEot7t9
	cvSTMq3H4bCH/SloOMyroyYPaWyB6Wov2NfGWZVcClRrNBd2fcgjGeHxqxGpULSim2AGkemHA1V
	8ezHQM69TJzbLakys82Txwe1JGyQIO1RPvU/cE3FWUt4BlOUZH+Gbh3tWwPimHRbhO0Tt8mrJdg
	ftjOeQDYxvbvzG2rMtawi1LQi7jQnvp+Y9YRReJwRJuiCQyicB31G/s/ucHXE88lnYy+xCsSJNx
	hgLhI5VXUSPleK9PjxMjd6JQcqy6euvqJxmsgkekFYnaT8HSCHV7+hyrkWioB/TxW5veQ94VTJH
	fE1C/g==
X-Received: by 2002:a05:622a:1b10:b0:55c:3b4b:45 with SMTP id d75a77b69052e-55d5a538613mr1980541cf.24.1794939419724;
        Tue, 17 Nov 2026 10:16:59 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d5907ee6dsm2590361cf.19.2026.11.17.10.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:16:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTNjm-0000000D0qg-02mP;
	Tue, 17 Nov 2026 14:16:58 -0400
Date: Tue, 17 Nov 2026 14:16:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@linux.dev>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <20261117181657.GF2606445@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <avxs_TU6FHn7MMx8@fedora>
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
In-Reply-To: <avxs_TU6FHn7MMx8@fedora>

On Tue, Nov 17, 2026 at 11:04:29PM +0800, Peng Fan wrote:

> - Keep the DMA controller as one device and describe its channel Stream
>   IDs in the controller node (ordered list, no per-channel child nodes and
>   no requester-ID map).
> - Add a generic dmaengine/IOMMU mechanism that assigns one of those
>   Stream IDs to each dma_chan_dev, so the channel gets its own IOMMU
>   context/domain without inventing a DT device.

IMHO what you really need here is some way to get the DMA API for a
"PASID" combined with some way to convert SIDs in an iommus property
into a "PASID".

How exactly that looks, I'm, not sure, but you probably do need a
struct device to do DMA with as that is integral to how the DMA API
works.

If that is a real struct device or some proxy, I don't know. Long ago
there was some work on this topic and struct device per PASID seemed
to be the direction people were interested in.

> - Use the SMMUv3 shared-SID support (still under reviewing) for channels that
>   must share a SID.

If you get struct device handles for the SID then you don't need this
at all since you'd have exactly N handles with no overlap.

You don't need to force the struct devices you want to use in the DMA
channel's model to be exactly used as the DMA device..
 
> This keeps DT describing real hardware (the controller's SIDs) and moves
> the Linux-specific unbundling into the core instead of a per-driver
> binding. Each channel occupies 64KB MMIO region and works independently.
> With separate DT node, it will be easy for us to do channel device passthrough
> when using Xen hypervisor. Now moving away from this, the remaining question is
> how to expose a channel for Xen/per-channel passthrough without a per-channel
> DT node, seems I need to add some code in Xen hypervisor to support channel
> passthrough.

Normally you'd make a VFIO driver for this, especially if you have a
"PASID". You really care about Xen? It is so weird in this area?

> >Again, since this is the 3rd - 4th case like this, it seems like a
> >popular hardware choice and we should try to do better to make Linux
> >support if we can.
> 
> Yeah, I saw QCOM VPU case and thought child node usage was agreed from
> Krzysztof's reply. So I use same idea here.

It was but at that point it was the only one. Now there are two QCOM
ones, this and maybe another I forget.

Also, IIRC, it wasn't quite like this, the DT was supposed to create
real platform devices. This kernel creates struct devices and attaches
them to DT was the first idea that was pushed back on when it became
too complicated.

Jason
