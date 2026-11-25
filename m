Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620331;
	b=Mg1ACK+vP1gH3Lff7m+ub4cF5uATo70NPd9HEAnOtlv1+mnwDtmNdihcLft1oUn0ZOl9
	 ERz9fLiPzIcEIGdZxT7h3OK9hTlVRupkUopSiNln8pNLRija1v7UxkgNcKYGjesOjeTcG
	 iVCf24KaXa7I3jPR5Jp9aRBQ6cuGFIPfIp8Lk8Pbwm3bV9SuY+9I4V9u6XJl9FXhNdk5E
	 pL9q1sFwasaIpcOxmJgh0GKNlZH6PqvzaxXS1PEvdQ8N8VR5tun1D30fp9aX4s/Xh5C6J
	 6E3UqcySpHgV8FSTeq3M5D4zg1qzhbrQCWWbUS04oVZOhCvoGUuJcYr44lm9KJOxK3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
	b=yTTAg5jNGF37JGrNUyz02lbnz1kXU3WB3HTVE67mvc/5Qx4BHIBoB+XWo0pVD8YFGkXu
	 9gLilTs6Z6I5MgNcNsxSTIwFtQm7/eY59cZ1kwT9fOE/j1WP0rd3QjNahE9fqCmOL1NsA
	 4z5o6MQ238i4JFi12H/wgRZadXnSK8FhWj508mzqs3gaPI0amVQcQVSknqJWlus/34zWt
	 pzc5fC4HzCkm/P8TXc0I8e0IFyDLELor2aONBCcUue67e2AqbxoeE3Ycq4qKf+YI2Ywg0
	 GkLbaZlhAiG4QIP6UUosVpLq+4Dugyqk78qgEGKHrLoGYN5RqvvvDToDwg64CnivFmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iFk419Bq;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0CA606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B0CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iFk419Bq
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7d2e14babc8so3472920137.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795620330; x=1796225130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
        b=iFk419BqbfBi/6ObNDUZ2vsXpKfzRGG8soL1vwWsfo3s0278JXjr9iY8LX249svZsi
         r6zCWgQOJswtMqBkGndgaQ0IvnnCAjGp65TR4XQNdfZ5sZPg0BgeutzGHAq8cM2f0LQv
         k79Pa3Mi31cvvRuTHw0jZ0595qcyP7Hk6uoobP2Z5yd2mn/yT4hXNKxz8+kfBrSxNLDf
         QHFAAQ74iOvDW0Lv4NLZloAJyTvOPgRcIasINF2MuVmMIVyHVBduWP93wMPTk4SQT8Wq
         iiMNt8SR9mbCr9h27gdplCbxaAkt1KGPe3OqaB/mp7PDl4S4WFrxi6Ipq3bM+f7oWh6E
         wrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620330; x=1796225130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
        b=R2eG0u0WkWjLbQvM6tnTEU9WTtP94TJrdBJDfJDzQZ98ajjJz6aT2MSslEDbEY8Neg
         d3A4qjs0/uCs8WP22/fwD4Ttrgp76hUjbO8X5Ir5euFUPXyZlp7LBHDSBtHk0vxMu+gU
         ZfybMjvoQeZImelpIzzW4rIOhqWBtZe3xBkfLa4KkoNH9DodjiDvDVzyb+JrxQLTdVG4
         n0S/XICIrREF1tvds+vjRVJU3WCUjmO2pGcqHLSBx7NuAIq4xvMx+ti92HKsRQev6QN8
         ePwO+Q1HZtjzCRiixhrXRqEv1Rs3IkllcGzEGWhZkGSqgFKV0w7DP0cLGvl49y3gO6X+
         a/5g==
X-Forwarded-Encrypted: i=1; AL+hErF34Sgs1C94LR7WDi+MhkwyFk0RkKYqJ2EWw5vUKWS4klxy1ThD31KXqT4rLToyqFbaDEW7gN08OzcfA24=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QkYQihxaJ2CqK2uChM8xr4SZG4A+LpO58eFG9BlU19aaf/jt+
	17Q3VAR7pV4YBrZKQpy9CsmFUoE09xgTzf6d+x5PISzLgGxU6f9PVJLDSxuGL/+EVio=
X-Gm-Gg: AZFdTZc6EaZXzIfn7ueuCAOyPEXKxPRyxSG0dxR3VrN6I+2qhtdLpjhIZQpTRkvkpgS
	EzwLNd6maj58TzsRq900EAKcIv0hS/N0UfNPrlZJ3KpN9lNz+Y/bCgbLd8OoWfqq+Nf0aKIftc8
	9VoWITkSabYjoBjLUjaAWjgrfkmhHsSBS8X5dw85ClMGVn1M0xiyOOoTZ1/xWqNX6q5asA+iq70
	98u7nBg2K7DB0xba2Z2d/RRNIEOLnGfKhTS8wDnjoN98Y50Um+Tgxka/pf4F3RAeCNTeC5KUaGT
	ZlcqAfKsVCO73A9m4N0Lq8Iysep5EJRMQ8btf3wGrvXJTqtj/T6H8SGaEyppGQx92VaR8fHLamu
	ynWkWwpaBdl2oxL2y29zYh7STWm+ZnnIsKWPv+F3HdBnjzNZIBu1BeaWFCdKw8C5DS2om1zWT89
	4Kd6NA1OcFcKW+q/D9mCeIC97mHrXjDFUY3i0iPxCElP76jSdSiMN1YeTI8sUlF12rcHpsEA3NK
	rw3Flh7verSGwpO7j7dFHDJxgZXw0ogoQJtmfw7gCnwXujKxMTgcg3ZuPZ7bgPC5o+cOK9syLhQ
	N6/O/6bEJiBqHODzuERUJCd70AU=
X-Received: by 2002:a05:6102:3e8d:b0:7c3:fcb:180c with SMTP id ada2fe7eead31-7d739572406mr10710273137.20.1795620330327;
        Wed, 25 Nov 2026 07:25:30 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213479655asm165007476d6.4.2026.11.25.07.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:25:29 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWEsD-00000001rUc-0W0U;
	Wed, 25 Nov 2026 11:25:29 -0400
Date: Wed, 25 Nov 2026 11:25:29 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@linux.dev>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
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
Message-ID: <20261125152529.GK246011@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <awGWcq_nKWShC81B@fedora>
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
In-Reply-To: <awGWcq_nKWShC81B@fedora>

On Sat, Nov 21, 2026 at 09:02:42PM +0800, Peng Fan wrote:

> Do you think it is reasonable to have chan device(not platform device) do dma
> allocation? 

?

Any struct device that works with the DMA API should be able to do
memory allocation consistent with its DMA parameters. That's an
integral part of having a working DMA API.

If you are asking if a struct device that can't do DMA should be able
to do DMA allocation, then no, obviously it should not be able to do
that.

AFAIK the main issue in most of these cases is the need to get a DMA
capable struct device for a particular SID because of a confluence of
decisions the HW designer has made and the Linux limitation of struct
device baaed DMA.

> I ask because if we allow chan device to do dma allocation, we need
> to provide a dma channel bus for iommu_buses to fix tegre186(TBH, I
> am not familar with this platform, it even has iommu-map for the dma node).

If your question is 'should I be able to have a "board file" that
creates DMA capable struct devices from C code" then I think that is a
pretty "smells bad" solution. Especially if you have to then create
fake busses and add them to iommu discovery.

The DT should create the iommu devices as platform devices.

There was yet another thread about this, so we are at like 5 drivers
now with this kind of need? This was my suggestion on what an API
could look like to solve this general problem:

https://lore.kernel.org/r/20261119143151.GH3115493@ziepe.ca

I recognize it would not be so easy to make, but it would be easier
and safer to use.

Jason
