Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549581;
	b=3opeG2r6bbk+JcWqhNeHIT4fZxvRYXu3hr2PAZJ7D74vekkGZv1mlvskzCoAD6r6TL/B
	 TmKBjPXRvFclc3QvJ446nwh5gGtuRTL2JR6LmrP0dAMBlC42jPIzHa7Og24IlBs0m0QOA
	 Bm9zYPiN/P3mdcEiO5Y027UdhQEMIfzQGtPYC0eTO6tlmoih0k3osJR1Bd5Y1kZgzjc49
	 AlppJshLUhKgC6UaTNTdncILhOdVb1KTHNon5qSPJUK9DXudF9ED8BK1dYtDgDmwX8LRH
	 mQmu+whio/8FVX8EM5wmgbyKakjrEebh5yT89Qak7ED+7R91/P2qoT6Soa9q4nwHF+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=cCMOaZdag+2OcXEDMl2EbRqTcxfKhXeKWu4Qydoaad0=;
	b=3bC/FWDS3jp/djKUXMaGb+9CZVDyMs3Oa5UcCJaP3MqfeIMJB24Z4cX9mcY2l2BOpwCr
	 Ey2NYMpNY98Fh+lupft6wXdARV3Pq2yByFKTOOXm7Ak8f1ZW2ZlyBGiEjaexQQog3LYel
	 zxIKJ+P3DLjx5vnn8GDkQ1DaEZyUihT3Ud/B2Jo9AIdIlQP/LR2nXq+KxJFr5qz830HjX
	 gmHFDHa/wBsnT4N/xgcoRK+1FKAJybhBzZnORx0kkx4QYQbSEv3OUeReTceleZo/UoMe9
	 Nn2WmQezoHP3djKVaxQJ/n/42bvyJEyO9XbINRI3a5DjnN/8cQxP5+EbODQHXYy4HOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hNzo9bKF;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E88606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01E88606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hNzo9bKF
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55ade1de0b4so58632161cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795549580; x=1796154380; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cCMOaZdag+2OcXEDMl2EbRqTcxfKhXeKWu4Qydoaad0=;
        b=hNzo9bKFfhVQc9qzPT4XFVGb8WWDhkAsWzEGNeoMtQsVv/UieKFHIx8duXK+pVyc+7
         K5tuXAPvt7SnRa+oW1TYccovCbxEoQMg8PMSal3gZtNqnBkfc9eaI8iRduIFPXdXeGyC
         7IqbxUGwhapkSK1PkTGpbVYuC07dIRe3KRRo51bldaV5T8p/83gXtSNREqT8fVb1HMZP
         lRwnNEOCDprIXQY+fn4dNi7XyHXAEaKdOG2aZhU8DQiLg94XiGTcamJqB2smYFg1x/Sg
         siI5MDO2hfLOudZP5xdAkje683/c7T63Kjq3de7kKz2KbuVb5db1oTFbL+o0yYQz2SQS
         i3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549580; x=1796154380;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cCMOaZdag+2OcXEDMl2EbRqTcxfKhXeKWu4Qydoaad0=;
        b=Lw8Z0dP19pnt2E8lpmUwiBYEDVJVtPgKqg/sHAJ1jUAnigsPxYnPs0wLXzKVBytbVY
         go2eJRwAvHswvBiYDdxJ0OCFhHHskoDNhfFZurhtJfy6gF6FdfwO4yyd7sIGgqBU/h6D
         OYwG/M26XBpeM8hY8MBuoBaTWPGi6FdYLexq+y61E1wOtRNXjMXCWelqOaK+m3+Jlpk+
         aI/N3W34hXjjLY66xN8coyiiVRWG8aV9OvFFT7GJ0t2qVaaJy1yjMjQa2qVMtDoK7Q3I
         b3EsbHhnCqcPwFbrrTShPi3JCPmaZKt9FRqThVOx4XrA9q/YiF+Zhfaj8GpUulk1YpYF
         Oipw==
X-Forwarded-Encrypted: i=1; AL+hErEqI6fpYoOpJQmlP+o80x48P2L49esJEYE4sAxlKlZhv5R5lshxStlrbJA6BhW4OM6OIpmM6foSvrxQCjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z81uuml2uFBiN8/vScI1Eeod925O+oubZdW2rhIJuwg9xJ36r6O
	zUloTjIgZo/pOFsJZUZo+4kKgzkjO/gK1G4X1FzXQV9cLoZ+9bcFUJPKJuChC1EvlKE=
X-Gm-Gg: AZFdTZd6gjANsHQn+n/+PTJLiXnCsI9mjOaXpjgoH5DZG2a4xUAYj+nAVbOZKudVf+H
	69v3aCrEgLTB75IdiEUu6aejY82/MTmIJM+U1V0iY9p4xjL7SkVSBVX7jZCgVOzKxoRHWPheb5w
	AcZ56IHd1vOsMhSlnpr3e14eIFtotbKX1K24A+A0ZNVLCpBMicegXdEzxk5b3Aj38jjWf+Cbx9F
	m/vUzqME9e4tEvebqcH2Ui3Dus0FY0Kifm9fFm3A7FLTAWUao5w8EziVwXB+pQMyngFU/J/oaEg
	39XCdSpkahoVh5lz5AVE5t3LLxYpChv9583PpM8dRd5yOBkEkabgUCkoT3rFObBhTJ8fX6YgK1F
	gzD+X+Bdn8LOsDzNTd0ygZDqA7Za+SmnzID2DRLghAmcPijdYS1vIhexy/eewotQsaC0iu1wQ/W
	l0etkQ1k7gHFdKilJoz32qIeJuxcO6e4p+9OCqNew9819iusmhTnf3SpaibZbYXdzO5P0GFrgZB
	oJsmQJVsF6ypNWJXUo9NwlUDeOl6xsWayQKQvwkqkdgrMduPxIum9PUuE/1CB0jiCE+mktusBAT
	sIUx9Q==
X-Received: by 2002:ac8:5c8a:0:b0:55c:66f0:5bfe with SMTP id d75a77b69052e-55d76a6f55fmr288174681cf.22.1795549579924;
        Tue, 24 Nov 2026 11:46:19 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882ea2dsm135596661cf.15.2026.11.24.11.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:46:19 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVwT4-0000000113s-3B2s;
	Tue, 24 Nov 2026 15:46:18 -0400
Date: Tue, 24 Nov 2026 15:46:18 -0400
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
Message-ID: <20261124194618.GC114530@ziepe.ca>
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>
 <20261123165716.GM179082@ziepe.ca>
 <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>
 <awT8prWsj11TBdmP@nvdebian.thelocal>
 <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
 <20261124142032.GN9566@ziepe.ca>
 <7a5a2d3a-e42e-4dc0-8d22-8dd1bd249501@amd.com>
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
In-Reply-To: <7a5a2d3a-e42e-4dc0-8d22-8dd1bd249501@amd.com>

On Tue, Nov 24, 2026 at 05:02:31PM +0100, Christian König wrote:
> The whole conversion from phys_vec to DMA addresses is something
> some API should provide based on the data the exporter/importer have
> negotiated (e.g. p2pdma_provider for example).

Yeah, probably, and this is exactly why I think it will take some
time. Building a new something in lib/ like this is not a
straightforward task.

But also, this:

> > You need to negotiate the actual C data types too, especially if you
> > want to do that nasty idea where dmabuf populates an iommu domain.
> 
> Yeah agree as well, but to be honest that task is negligible. We
> first need to figure out where to put the code.

Means you need to get the phys_addr_t into the dma-buf code so it can
do this conversion.

I'm still absolutely NAKity against allowing any DRM driver visibility
to an importer's iommu_domain if we do this hack.

I don't see how to meet all these concerns without making dma-buf into
a "converter" framework...

Regards,
Jason
