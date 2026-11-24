Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530037;
	b=Dd88geaCVAiIVUUjBBLekdCTM8BjSwBLCULjHL83wvSVZELeYNSSQm3BGyNTV1Ew+bNP
	 osVNTWrD1CQNWWJLNuzmbkR4m5vxTglhsd5SFfPzdY41/9YxsYObu4+KgT/GdAsVwVb20
	 2+7vUnmxO0mMfM2r1VUkTXj1MrmZKUQ+pVwd1ZnOh5S6UhxdzgImkoDg+/otAG1IeAON7
	 n6EXnkfde4WYXIt2ee5pNcVXAqzrw+62irRgPGqlKH9aRL3MLPNZ720i0tGRfQKY166Ek
	 4b9muromHgwAspBrweoJLChtUkYoE2n8df9OVxHdCerylIvO7ZzMAp5U+ZrWzzsdJCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Hoa2uDGRiz+jXLxbcD4HBQF2SzMfWsHt0csEQeOTfAo=;
	b=2yzbijTquuXEaZcmGfoJRtD2CzE8vMGlMde+XGWqKacyA8o8Wc9CdHuFU+hxQGhSHZ4q
	 ItEexN5g6Jk7jcrmLa8qU70n4Z+h8SmusiA90d18ofqcypuSmCtKdvsa2zstOPhuW9lTt
	 V6hluoViHKFyym6Xt6US58+LoLyVZGa2fGQN0jOcEo0Fmc4ntan6nGjo+Z3GEWr1NHXVF
	 DlNvpj6/d8uEMTsxbHpPnr8pl6I4XyVqMdjnBwWNKRucjXMaZ+WNFvV8fz0RzCcLNMFu1
	 Fk2F/Z4RGolk8pH3sGBTxYD7o6sL3GxYTlm7/v3AESJQiOjAjq82Lcw7EkLTr5gJVmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jBiTgo2W;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD50606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD50606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jBiTgo2W
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so605935366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795530035; x=1796134835; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hoa2uDGRiz+jXLxbcD4HBQF2SzMfWsHt0csEQeOTfAo=;
        b=jBiTgo2WnjFhpkgbIBu6On5by8ux66WiKBLBzWJdf4Pf6RCn1pmz1agYiK7SMfaxFg
         3/2YrNhOySAcSPgNeJdOxPH8P45jGqKY5S64rDyy/GqimZuTwtSLFUBdu/5vJlpZdzzr
         s4bwl1Rg4R2P3YXWI3cJVNf2474sYNB2WqyefKmd2Q9zmRyjanVGbBx1PSJBmR/NBbVb
         Em8am7TBb+PrC/eYOYbEaS+JpnHnvhpW0bM+eu6neOm7LPUdBWC1Zs5EIHxnkkBtcy2S
         FqTLqasaecjeohA6M/KuBjaSrElM71neIK7tdakJn6qod53aVVQSxRc62gnUmZLJzDVT
         ZSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530035; x=1796134835;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hoa2uDGRiz+jXLxbcD4HBQF2SzMfWsHt0csEQeOTfAo=;
        b=glnUrTIODnnz7/zM67MqgiYaxyaIhqMgYxgvOv2sSd8GCzCARWbJXHbyLJFqAAaP/q
         i5OFK/1z31fA2tufBIfsAavvbnXOYdqIu9tslDgJBM7G86FgRnP9ddbIWvv1glBoVGRh
         M3sKoVDXVcl8wOqH+4Ibl3Wxqyv3vDy8KBf/yMABh3torBE/AUKPC5a9FmUJb4WmUp1j
         d3oinqC41wL3qdBzPYSNXIjogbzzjzoHQv3Eojnpc8qypEmym1sn6zD9l9oXjUDUkN9Y
         jUeO/96CKfv71iW7lekIkpmUGhkjBVhH7OHNB6wRSlm8y1SIV76toNJ/TbzlxzmedaJh
         GiFQ==
X-Forwarded-Encrypted: i=1; AL+hErExHSQRe0DBcvg/4+SB9P3v/5xvIfJ4ao4rO4YQjQuruHLZJDRBPHuaRUYu5yN1ugCI8/P6zy7qnPAq698=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fYJCKc0/BsOjNlcPfUu31+KSy6OghdKTq70sriX/561+Kuo/8
	CZ8Ju0NwZ7ovserBTVWj7tQgqe3yf089U5/hKQ1804CjRlGv5rcXTEngQbqM27QJqaI=
X-Gm-Gg: AZFdTZcK9U3vzyknETjJo7DbzGdkKpbmO/pwhcdodD+BBD+g7l3GZklGWx/p4ZFxvR3
	J+vEtpAumIY7cIH2x9sQVTg1qrD1wTuUOZnNNK4oBxljuZQOWqotDaAMZVG4Qg/wNXriulIS3qL
	eCA3rkhLDmRTiU/aBy5D67xkvbX/pa3inALP8+pADyvAK+NQMG6oIGjlAV82Z2AKYZf/ESJeHpz
	iUIQSz36I77lVPlbiHFSFfu5jA7KAT9OLAUiSQfPad1bqy8FPrLd3G1XlzZo8r49+mCqhT+dUst
	tJOw5xhZ9VQbDN+is8XQSs7rKTvgOBAwiva4poe7npUs/HqanywF2FD/Fx3vKx6BhtZtzM0tCep
	pXrEpGOCoYN2ZyuGLlyb+t7jymTZdO24xj3orRw/bL29QTagm04m8UZjee/uQYDLJF/7SGw0pLj
	V18hyTK05qWmiOrk0DjnDmV2YUm0sYZ2KEIXmGePdAQoqc/Ou01xgmnH8HL0nl1/g5V9JAMTPOO
	8vw8F2Yf8/NM86ZXbiWf/PyDpIYVzD4SHoctPD+7GPaJ3SomhP8eSFqYf1f7sl3YTJAzgO+PA0X
	T8BWGaXKYPL8mBLVzLPh6QQDj2c=
X-Received: by 2002:a17:906:eec9:b0:c51:5589:35a1 with SMTP id a640c23a62f3a-c515589d211mr891019366b.5.1795530034479;
        Tue, 24 Nov 2026 06:20:34 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8dc60sm518286266b.34.2026.11.24.06.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:20:33 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVrNo-00000000RS3-1UVp;
	Tue, 24 Nov 2026 10:20:32 -0400
Date: Tue, 24 Nov 2026 10:20:32 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Alistair Popple <apopple@nvidia.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Dongwon Kim <dongwon.kim@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Felix Kuehling <felix.kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>, zhipingz@meta.com,
	treding@nvidia.com, jhubbard@nvidia.com, chaitanyak@nvidia.com,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH v3 03/24] dma-buf: Add the SGT DMA mapping type
Message-ID: <20261124142032.GN9566@ziepe.ca>
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>
 <20261123165716.GM179082@ziepe.ca>
 <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>
 <awT8prWsj11TBdmP@nvdebian.thelocal>
 <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>

On Tue, Nov 24, 2026 at 01:36:21PM +0100, Christian König wrote:
> > The core then negotiates compatible types and adds converters between them,
> 
> I have strong objections to that plan and would potentially NAK it.
> 
> DMA-buf should *NEVER* accept CPU physical addresses nor provide
> conversion between different address types.
> 
> Keep in mind that DMA-buf is solely a container for DMA addresses,
> nothing else and it should not provide any mapping functionality
> whatsoever.

dmabuf needs to provide support for drivers to help them use the
interface, and going from physical to dma_addr_t is absolutely a
common task every driver must do. I don't care how you call it, but it
is a service that must be provided by *something* and matched to the
needs of dmabuf.

I will definitely NAK any direction to open code dma mapping in every
driver again. If we are going away from SGT then we are fixing all the
DRM mistakes, including the wrong open coded DMA mapping, sketchy use
of SGT, and abuse of P2P that seems to be endemic in drm.

Meaing the exporter constructs a phys_addr list, gets a P2P provider,
and some common code constructs what is passed to the importer. I
don't care if this is in "dmabuf" or some "dmabuf library" or
*whatever* but it must exist as common shared code.

dma_buf_phys_vec_to_sgt() is the template how to implement this
transformation.

> > and having SGT as a type is what allows that. It only exists for unconverted
> > exporters and importers and eventually goes away once everything is converted.
> > The idea being we don't have to convert everything all at once, whilst also being
> > able to add support for different interconnect types. Are you ok with the SGT
> > type if it is just transitional?
> 
> Not really, it just complicate things.
> 
> What we should do with the mapping interface is to add the
> information in which domain the DMA addresses are to be used.

You need to negotiate the actual C data types too, especially if you
want to do that nasty idea where dmabuf populates an iommu domain.

Jason
