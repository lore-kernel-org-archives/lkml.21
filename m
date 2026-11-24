Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528842;
	b=E14HNH7yN/G37+QzdDz7DNmGO/oodN55KhmNiIX1eOWQ2ovjUM0LJJWxN5VS5O/3V7WI
	 pKwADwJT9G7BNQ2bobb3NBF3h8k1OmbrA3sEpNvM1GOOxEX44OtwwicOlQOnIXaRPtxXZ
	 cjBAy6cH3vgnCTSjTJvbylb2Iyrdk5DTgBziZ1wpXq1XJSrLZd1Fa+VOBgQfSI9Mp3xcE
	 SDJwwkIwxAUypKo8W8x+j3utV/bdHluVLlU1ABJDCrcn9JDmjnaXO9KSMHyQtqbeG3MPA
	 mciK8jpOaEp0Uvwg6AoYfaVW0UBQpC+zO+9bTk9Bm0p2qZL3x268nkewptAotkkGRCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=o+7iSwGfMjtzT2Y6Ygii4nLjUX3g93NcfuA7HOwwEkw=;
	b=Lk37BxH+jSJzjpzIYqGrm2flzKtpxJ9f7vI3wW1MiRKZ7jNtNOobfDyl3OMCBAWk9++k
	 Hvum73T7QL4uGZ/ngB0TL52Aw0JJ9hzAdbzbOTZpqwKP4nEqioBuhDi+HLpJ7CRo3+xw3
	 frthfONAfFZ9XgVufEVDQ126B1AxdX8UDBTWUvQ99VOw+n96DvBKbRne0mualWoszoLGQ
	 TkAApsC2e+C9lXWC+pPNybZgKzzzOfbsoYGFSFBt7q1xKL8PJiEBvEPjpoy4TV//6bgIy
	 KfYaT8c9JLMpQAlbA2DE0QN5NNVtOoAFoGOs/7sjfCtlz3Iw5RO7NAYHmUc1gGC8P3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=V30Q+iur;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8F6606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED8F6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=V30Q+iur
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e30c26a4so1089074566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795528840; x=1796133640; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+7iSwGfMjtzT2Y6Ygii4nLjUX3g93NcfuA7HOwwEkw=;
        b=V30Q+iurO56H29PrX9q7wVWHAj934LHyh9dyaSa8KHPs1wYEL79KlkRZ8Ndk67ZYFP
         8Moy2ZuuvXyGxj6hxEU5MHXoHu4tO+Fkx1FOmb3i6VmcSl2yRSR7ozCFXelACXZQQdpH
         73eeCdMmnAdK5bgaPJM2yLbbq+7EGbpzKQXhHQ+LiUd9gwn3Zcp08lnZgZpi+N/nP0qn
         CCEUWkIh7w7v7yFw7Ka90+w4XwePfoZZMNmE95Z67q//yab58k2vPq4mUMHNrX/ny0rT
         lztbpD17efmc4Yo1kTZgqTWxQyLSdMFoAnYsApctQXm4VrrSm5WoZqx2pG7gjDZXr6oU
         zvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528840; x=1796133640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o+7iSwGfMjtzT2Y6Ygii4nLjUX3g93NcfuA7HOwwEkw=;
        b=Bi7YNwa/rfsjg3iZLE4UsueN7M/dKE3BrNvXXiBMLUwrpdJq/YtmP1bgSYoX3eWl0Z
         sTAmWlYcsb8HC+7BbpUuK7tLUpWAXTBV15YR0usVR3aHTpC6Vko7f+S94ZnhQdytR7q4
         HIv7A9HjtSI7GVvinMpZrzGKriX229Tu9BnpxrbAhoT7xHzQx/xvluXLSdsCekBknsCQ
         h9F8a9N8/OlhGqy18xpiQXKQHjOEsMkj0CBXZeXTJzs+EuwFUyWW0DXc+XXe4TCXQYL6
         F8xMEPw8ZEJDDjiPg51CWiBo3B/oq83HpUXKZwvPvIkisUyNp8qux+bfeT03RD9633jg
         WIAg==
X-Forwarded-Encrypted: i=1; AL+hErE9+nHvqiRLhJPfliTx0LwQ+ZquGAtBvbPwX2k5a9/eCFcKm5h4W5jJOl0//w8ygQTyAmPTERE3JuuwHnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fS045wPEq7ood415ojGTOoKUKR7tSVGrHP2v5Slvuqdvnv1+b
	jxteGs3mTy2Iq869yQcgpubXB9l5yxu7ZhIsT6Uj4mSRA2WUL41xUtJw22FmL53NQtM=
X-Gm-Gg: AZFdTZecrwljO3KqGpcgl+B4C0YegNS+yF9jSFtR20Md7UKziy4igh5IV4ZW/Dr/s5o
	gnqXxemurUs3YvyCgj3gGeXaER8AkC/P7d8Asy5HXiSoSYYwXmttsx2xV/BQ9nx63fztZ90Bq7k
	H9u3qUQXReYoh42gQFSw82rU/lu78N4xapHLngg6C2E+R3qvrV5fgHXP1hAbWyr52oJOEZBYhcv
	5K0gkRfe0ZW6Z5vgyxdfet6kNyDnAQqKtDz/rJzNLAVHmg2BHSpgKvSaOGuZcvmumdYX1CMyAA5
	tJC+8Ih5FPr/8suO4G6m74KA/frzPKtw64x246qId5k9L3ttc59QaLmSdm0tOi3IIJ0qC6JprXG
	1u88UGvzA1kIRr/ygexym11FvBl9KTB4d3diAw9Utn8tahdQVikb8DWR1iI6WJyj/7IxBOmlGYX
	TiZSD8bUCj/s/4W2/BSBCSKxOloxJU1aqaMAFEJJKFXpgJGgPfHs6UwgTWBeMB13KZy/4UNx8HZ
	M4cZO+PsUUpyz0dA7IK4Xv279S+t3JLrQyXqXMo4KXK6wFwjOD8IRNFLuavmCkOExEIxB49RURe
	dNgmLg==
X-Received: by 2002:a17:907:3e86:b0:c36:777f:824c with SMTP id a640c23a62f3a-c51315851d7mr1405271066b.4.1795528839874;
        Tue, 24 Nov 2026 06:00:39 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm6492195a12.13.2026.11.24.06.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:00:39 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVr4W-00000000QnE-3MAi;
	Tue, 24 Nov 2026 10:00:36 -0400
Date: Tue, 24 Nov 2026 10:00:36 -0400
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
Message-ID: <20261124140036.GM9566@ziepe.ca>
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>
 <20261123165716.GM179082@ziepe.ca>
 <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>
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
In-Reply-To: <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>

On Mon, Nov 23, 2026 at 07:37:41PM +0100, Christian König wrote:
> > Part of the design of this series was to allow the conversion away
> > from SGT to be done incrementally without breaking compatibility.
> 
> Do you know the joke from the hitchhikers guide to the galaxy where
> the dolphins are happy for exactly the same reasons?
> 
> I'm pushing against this plan for exactly the same reason because I
> think it will make the conversation away from SGT even more
> problematic than it already is.

I think it is well proven that trying to do big bang conversions in
software doesn't work well. :(
 
> > So it is effectively this:
> > 
> >> The framework should then either connect the SGT directly if both
> >> importer and export are using the "classic" interface 
> 
> Yeah but that should not be a separate mapping type, it's rather
> that we just convert back and forth from DMA addresses to SGT for
> compatibility reasons.

The mapping type is to support ualink/etc that don't do "DMA".

Only DMA API can create dma_addr_t's, you can't reuse those types for
something else.

And you still need a scheme to negotiate exactly what kind of
connection you need. Focusing on the SGT is missing the big picture of
why this was organized like this.

> > As this is actually quite complicated and needs discussion exactly
> > what it will look like.
> 
> Actually that is the easy step I think because quite a lot of
> drivers already convert the SGT to a DMA addr array outside of the
> DMA-buf framework anyway.

Given the importer an array is not so bad. Getting the sgt out of the
importer will be a debate.

Jason
