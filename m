Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795739841;
	b=TmtN0TA021qASr+cdPMFtPjK40MGs74NKmmi9pV8GRokyM3jWb20lF+aqWqHCbi8wbXq
	 vi62fYze1bjXHLzP3NKGKauv1bm1OyEIR/D7/xOe3Lzy02bYTVvZyV/O6bkcHjXoph+X1
	 +5yXNapiHZszdmoKlM9sdLRt+Bf4/TKG0k8ZhS9Y0mwA+T7oBgQ6mQFHwmIteuUO17njq
	 amqtjSKIjygtGVX+nm8a26tyt6L+iIRVE3IC9zHRoxIIXTU9OXr+O1QLCdhYX6YTv1E/3
	 LQiaADy7cwCm/ycH5iOdgr7xSp9aqmVmlwP+09gbipj0jsxyEJIl9xoIElLE7BHs7wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795739841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=BYEpToCdu/Jrl7504w/3VIKWXqy3i8TunCn9olVHqm8=;
	b=VHzBMWhIdpQe+yjflFrKeAWEdIrbQ2OQFb3ckrKDF5zLPEqZb8EPjZJW7VoKV3JggyAU
	 Sykpa6IkKnV9RA/BZ9IXeONq9U0P0UM4nhn70MifD4uLwCfXTJeNfUR1E5leDpqfA1obl
	 cJWtODrSfhFopAR/VM8Iuz6G6rqscC2oWLFiQvuvAZrRhDrRl3FQ2JdWfLjCirtCijMZc
	 ge2kKY7Utyf7yU44BgS/d0t0MFKfMArh2V6kzq2umsrqQTdvg1hqfMYBJFN+k9AMytpAG
	 He7YFNnh6rHDOPf+aWbrMxdCpIF3XuuQbLNzLn6vKQatbfD4HvLbN/0Ifz27fohxzbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RYi3Edqp;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E69606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E69606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RYi3Edqp
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53644ab1f7bso66730001cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795739839; x=1796344639; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BYEpToCdu/Jrl7504w/3VIKWXqy3i8TunCn9olVHqm8=;
        b=RYi3Edqp0iJYoWgnyFakqRlcBMM8VcDiE8d4VlY5bSzWrQs7C3jbXpEvdsf5xbs0HR
         k8SJFejOERTl3boet9eADaubxky0nrElyxMPXPWpVpP4P4sFBNoLT0vNQZStolAgoetA
         AVu2Mh8zCbpacWNyUVPHGl3RGM6A9CQHETQIX4aOfJBdNhGQef7KqYfIDR6ufufdP8LP
         5jHoiOvsTjxDjWW0L90H9rgfkvqlxNkDfm7h3cX67l/8MpA/9M1cz2dLCiNt8o5kr/5Q
         JdnVCeij4xVh62dHP4PJZYsGnouQAS5wg9J0Y6QCTQui72S1909B3CcTDDr25xXeCo8X
         2BJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739839; x=1796344639;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BYEpToCdu/Jrl7504w/3VIKWXqy3i8TunCn9olVHqm8=;
        b=zCvnLzgfxD5Qwvu8ZvKLmIdWwRy1QbbSBBObfVGueZvkAspF21NXCfWy8ASk0U3L7B
         R5dLLthSAXdXtx3OAmrAJHEubjx9dOuIOv4YODtWxEjILQS8B4eKDygK0CerPNGH5yto
         T4bXPH+JkRAGh929TzIhfTvQ4TFAaQJy5BVsp5aJ1Mzfd3PDKkaXeyuuO69y75WvubUf
         Khm/qVFtfyO2Cune99CJuerCe64R+y86QIZJsVR09/alp5PLg/9Il3eWUCe5FuEJ0JIB
         gVy8yzRU2bkjye8JtDV/El5rNjdbaHqn58+cBOHWqq14RjXzTa5igpwGgO0pYTVyzngO
         P0ew==
X-Forwarded-Encrypted: i=1; AL+hErEMIhoXZuGE/9BZ3sWKoxXiF8ugWLJoGHPseKW+DV6q4kEUvtfMdmojeVu4DuJvJxXcUyTmzCj7JYf7LVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yENvtLVflt7ra2ubF3pD/cVcqVKghfOpAD6Xy5PBxDKKVqX2R
	KaIZwGg/AmNdDsBVJYPNK9Tq+pOXr6dlaSO++Udubj5chTGpQWJn3dtQSP2/4FmVjN4=
X-Gm-Gg: AZFdTZf3oUCGqee3QyV9mlo/dPg5CHNPfPDmHBCaT3mFgSQlLjvoHdZT0WHAMOUJ3tW
	ezGIBiSu6v/h0qCxKhwC1Zuh7vLKhJ+MHC/+QUmmM9Tmddc+XbhKGc2bNVLFuZ3s+lJl0U2lbcU
	WUbVw7ztx06GD8RAROQCR13GuQOlI1edU4LAdJhvjCQ6jVNuZtQmeHJN4pryt3NKfj+JH2Xo7KH
	54cLMr3xSbUd/qqu2uVWH8A27/4FN/P1pWP9vnNMEoybKTyxk9mSdaDA5SSA9k1RN1GEH9wBvEi
	CRV+A1yt1baJo93jNnFXNQ9IcH7mXkvb7qtfuyHlOsJYWieEO+h01DBM5o3u+TN3c7mkEblD/cl
	rRgl6XVmvar3cPPbAZw2L03zD4dcCb8BiMEBKpvvGhHZLo5uAbq2fAYIqFGb2Lxarc8iiIvcxPI
	U5vzihH2OhcBCGE2laGW6k9XNSwEOXU2r3ZeL0WFOKdn6AfW4Pf5WzRFJGO3BWNbbiqriUWruSG
	Hp5Km3zRDB1WMwubGQsFVE39NbhZDkZliLrJ7v6dxB+NWRkQXe/Lv/qxCWNcbb09LxmHQMV7coh
	0jw8Jw==
X-Received: by 2002:a05:622a:1f13:b0:533:8900:4eae with SMTP id d75a77b69052e-55d76a168d0mr403124891cf.13.1795739839275;
        Thu, 26 Nov 2026 16:37:19 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm192115611cf.17.2026.11.26.16.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:37:18 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWjxm-00000005OdJ-0d4j;
	Thu, 26 Nov 2026 20:37:18 -0400
Date: Thu, 26 Nov 2026 20:37:18 -0400
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
Message-ID: <20261127003718.GR246011@ziepe.ca>
References: <20261124142032.GN9566@ziepe.ca>
 <7a5a2d3a-e42e-4dc0-8d22-8dd1bd249501@amd.com>
 <20261124194618.GC114530@ziepe.ca>
 <awZ_Os1pXelOGaFP@nvdebian.thelocal>
 <fb9a6b12-c134-4e40-86a5-dbcb59c0b91b@amd.com>
 <20261125155559.GL246011@ziepe.ca>
 <5fb8bb60-7d9f-49b1-899c-40a890fdc14b@amd.com>
 <20261125190705.GN246011@ziepe.ca>
 <awfMy1d8ICL6mr9i@nvdebian.thelocal>
 <a8c00bbf-dddb-4207-bcdf-af58d27116c5@amd.com>
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
In-Reply-To: <a8c00bbf-dddb-4207-bcdf-af58d27116c5@amd.com>

On Thu, Nov 26, 2026 at 10:58:13AM +0100, Christian König wrote:
> Would it help if have a call on Teams or similar services to discuss the whole thing?
> 
> That might be easier and especially faster than by mail.

I think that is a good idea, I suggest you and Alistair should pick a
time and see who else can come. From experience eu/au/eastern na
doesn't jive :)

Jason
