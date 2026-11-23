Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453039;
	b=0C+i3nWnfiU1tHBKSNZp6Q0MDaYWvEtCSIyBiTdCb+s+DwTz/jNwEwFT51nfF0sgYA+P
	 VNNeiRi2jzySRHxbwLYPj9IP7Re5N59LLNEalKxxfyJdPktVMcxQ6nAzW5AcdMJ8pmVs2
	 7m/OJm4SIuxN+JGwowvHKFcgwoRW/FxvkKWOnUZoBlCjNOadOAvw7pPpxB5n0YKCaB8yw
	 uc6X77z+bKcEMBDFr9FOthurF/P02vVUc3OFIwW0P6z9Uh7qSK71+yLTGbS2fDrLNSYR3
	 jq9GCF3acmolckmx7ENSWWvHHetmlo3OvwMiPvNGtV5cyTRw0Yo1mFGnGOhwaobfzZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=j5i4WU3qjrhh//MRl3wcVLLT33h5NdpwdC0V5dWlBjs=;
	b=Hl/IzoEdhtbkUG6DXkYL8bCdLT7S8U6wrJAuTooWrWcZCFMUeRdw45tMiYFUStwlUWru
	 JWKQP7xEwxRUimic9BtNw7Ta9yRHVMejG63vqFYvNWWe9UrBCKZ0EfJqlTRJSG57fKdsM
	 xlMP7kiz929xRvbFR6lvisOdXCtORq8Fnn6lTnVbKXE0MMMPzTKNC7voWLPn0WBsoxt0E
	 1u9d5/Ke1oVCOXGu7pxo54uHbP+0+sPQz679OWBsnfhpsO+dgL5NYO5c6bfax1Mer+0gx
	 9pPkVwAgKteJT+dGsqA457OsvrT/t/f2buxWWWE018FrUw+CNMMCYCzpydFTEx+u2rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AhgqFtUx;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F0B606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F0B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AhgqFtUx
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9496400270fso334159385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795453038; x=1796057838; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5i4WU3qjrhh//MRl3wcVLLT33h5NdpwdC0V5dWlBjs=;
        b=AhgqFtUxAkQppOlVHwr4sQwZVIp7IUGPtjYW1ZgPhelHowbnMq5+k5GDnpyrMpQ4QH
         cxZM8Neiv/9bH/kPoiZH3Aoqwr3PKOqe03k6A9rEDhNNu8cE7bMZ7ZN6cn5HMRCbglkh
         6TGicHFpPHiQmGNvl0XwYRDUPffckFT6Cr3T/FR9P3kqO8+q9ZGHdE4Escfknhdbv2XG
         UcS4CezJjEIVbAEerPQiNY3R8W6TDU8Dv5YeHcYf3//QXv8tVGMKplyYb2NJ13wU11xy
         39d11YeHjPmMuE/v7rn/Kn6ypXu+5QEE1j5feAfp5FK3hNt3swguJ5rblF+gM/EtT00g
         E1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453038; x=1796057838;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j5i4WU3qjrhh//MRl3wcVLLT33h5NdpwdC0V5dWlBjs=;
        b=SsHjwskxJjvWziFp3TDLg6l8yA4BYYBcYP4fCEhZwU3R8ulCwYnkPqEikjFnvdsZIl
         WiKV3HmeAJZJdHghZsaFuXsWaPAD8u/1PNDt7G+uEXsmUGGFP1sZkNJtIwXdpHm4iWEz
         2k9DOi11kMJq/Km3pOciJjsvtdvZFYFc7p77rPMblgDkYWrx7s9CPNDkkDEjBXTWhvN2
         zU+v2TqhctabaQvtisgX+aDTtyLecZLatjNiHIBpOuRBbpXpBzHcn0IGto+ReF8ack8i
         in+yUeoCqDV+3yW++kJK3xyMkK7IaMn8R0ZEdS5qWsKe20TgbKGw/o03PArIhLZrn0EF
         OHVQ==
X-Forwarded-Encrypted: i=1; AL+hErHnMh0Lks57uyf/H+VZa4m40JaAPLLkKZZDBH9a/ZEEUzCxDwuy9qzZqo6r4fv9BEcdiiVjkFTFdqyKJzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yu4Rek4zUpZGcPI1nG9sTtVq1LbBsskbtPYR3WDGrSZw9uyFK
	Vzh4DPSTnJ2zKRRXwAVz2aXJfKxXgGzhGgpFISXiOgQWC+cj1yA2Sq4P0Mkwic42zhg=
X-Gm-Gg: AZFdTZd2E9NxN95+eM+f+7/7m5EvfB9KnKzS2R52LbcMybYsjDvbyZmkzynP010aVYk
	s5LpSsokBOzej0bOC4ayXWzun96ib2JWb7s/yqZEZ2Rm6BL8TFrb5G/4sJ+DMuD5HF1lhlGnHWc
	7CjB/zpE0Sjs+mcCzkfRqqiZuwH167m9O5U75pOruoJsUbAsx1KEZzNuRBy6SLtMq1iaPGCcW6Y
	Ot6b/R+AHUq7+73Tq6tyGYbmDksa5rj4mkjrUIlItpEKO/FvnyIOXNpH22HMkqHgsiLK0T5ZobF
	Da825cG6uw/CP3XJuw7hO8lPUkjLRUKFYElEuxdIbjsGGTYwSQuG2p8Y2dHylkzIHbQCj9AgWE4
	jHg7aTJvF4YUJoTI6TCgSkTxS3+XGT8r9NctlivSo+qj/LSMhjmAuihUR3PqGxDx66UAc84cSX4
	/ppe3DSbNqKlYbW3XQ5WQRv6WtbaNiYsqhmUbcc8kA3LWHyxO2ihgUsLoIZ5NadM9rG3ZGRBDFz
	lFe+PzcEVjYTUxjncHxYuSIfMuxxy8PGAKG6l3yQwb+qrgXEg5V9IMmmGwmLqyK+J/Zw/pZoJBz
	SdYvsME/mzuQKHMQkYZoAuWyFtRR+ioHcx//ReN2lX1GVAwomGIZqM2XKhEI74ZUTG48XkliRgx
	LTiZPEPygR23flOGBIo7qJiLV
X-Received: by 2002:a05:620a:270d:b0:949:8109:8bcd with SMTP id af79cd13be357-949bab6d24dmr1950593985a.77.1795453037117;
        Mon, 23 Nov 2026 08:57:17 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb031601sm844162485a.6.2026.11.23.08.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:57:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVXLw-00000000woc-0Jy7;
	Mon, 23 Nov 2026 12:57:16 -0400
Date: Mon, 23 Nov 2026 12:57:16 -0400
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
Message-ID: <20261123165716.GM179082@ziepe.ca>
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>
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
In-Reply-To: <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>

On Mon, Nov 23, 2026 at 02:36:46PM +0100, Christian König wrote:
> On 11/20/26 06:55, Alistair Popple wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > 
> > The SGT (Scatter Gather Table) DMA mapping type represents the existing
> > sg_table/scatterlist based DMA mapping. For now it continues to use a
> > sg_table for map/unmap, but this will allow a future patch series to
> > convert to using a different data structure for importers without having
> > to convert all at once.
> 
> I strongly think we shouldn't have an SGT mapping type in the new DMA-buf mapping API.
> 
> Instead we should have something like either an array or an xarray
> of DMA addresses.

My plan was always to get there, but I don't think it is reasonable to
start there? There are too many places all over the place that are
just hardwired to do SGT right now.

Part of the design of this series was to allow the conversion away
from SGT to be done incrementally without breaking compatibility.

So it is effectively this:

> The framework should then either connect the SGT directly if both
> importer and export are using the "classic" interface 

And this:

> or convert
> from DMA-addr array to SGT and back if either of them are using this
> new interface.

Is something I imagined as a followup series.

As this is actually quite complicated and needs discussion exactly
what it will look like.

Jason
