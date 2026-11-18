Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795030524;
	b=z2YYq5G/KF4VJlSkzXwVPJrHHuzrqjfZZQhkvHxApNQN3T1IsMtvRrQCPxxwA3JLRTbH
	 /mOT+hXXwA8NMrg+G99tPhji5yEWBDVUTmGef7NENjo8MovHlmAKdrykCW5sBgK6SoVOV
	 2QetMXTXRLz3jBg+zzq+JYhgkpXWqsBMrWG3l89lEg1MpNpYGeHhvW6/nTYFckyF5Jjzh
	 fJk9hYbLeyRJjjg7haOXqAvvTmpCN5QDSu3LVV8UJpNQPVPt+h0aL4Md2zQdM9+obDMnX
	 4RFPGQfKAw56YRZ2VlTBOiE06rkvtOb6EXXUIGowDMx2ryV/sCTYOLxWjPKWmuRnRhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=svDhZvS2nvuMtlSX/aJAYIzvYs1mM+RCPAdRdKGv9lw=;
	b=aGZnrLP3Cps4O8TEwx6yY7fDAATD7v+ut8s1NgEDXdimAZmiv00tNSKKgjElW9nVTn92
	 gf1FR4A2vvon8kbHWgQ1JISpJkks5dfAy7FmOEDCxScGXhha5XW3MVXjMtlKLFbCV6JKh
	 zkxrvZHyIcyVIjNYKyehJFr3Mg4HSbgqRXWkwv4iAPu+S6IyKkhV9Xx78wqm/PVIf4viy
	 dXH41fsj1AMf3z55mHpnjnlzOeYxfTIwaLruEOOfdtvmsX5DwtBza9332Efw56oxMb0z0
	 /WJ+tbMXVMgMLQtRQtp/PeFOwkSYs9mK5DIKZ+mUsAe1Mes3DXApshD8TX+XWSRP2ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nYrfU8ls;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60696606C419
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60696606C419
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nYrfU8ls
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53634b8328eso13301881cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795030523; x=1795635323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=svDhZvS2nvuMtlSX/aJAYIzvYs1mM+RCPAdRdKGv9lw=;
        b=nYrfU8lscKvsCv08FhVyznw1+/ixOPZ5ujpSMFdgTglW28ZRDyvsT3l5OCv1zPVx5z
         p4Bbyu+r1usWuZLpn2zdQt/tLjNOqC4Y6zda09XyAuzgsfWEuL25PHehtYAAJ1L3VYoU
         9soQcIMgLcZ0a14wdZ3uW2xGHG1Lm+GgdcVdQBlv6Se15wewe1zioxmPGH+2IP+agESf
         zvQTTrIs/JtT2lpwYVT3J18WLDFvp+SsvLrIucO15OemadjveZK+DGPJzXtDkOYtRB+d
         18KjvIE/D9SHH5jU+SMqOdyb24y5LDFYdq/zXgZKk6MHIDMPvufWJoyqqMJ4REj1YSp9
         ZMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795030523; x=1795635323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svDhZvS2nvuMtlSX/aJAYIzvYs1mM+RCPAdRdKGv9lw=;
        b=GQGgn9+cc1xiTycBPDFI72eDr7asMq6JGC0bP+3H87XiCBJOEmQI4SC43Z+1Zj0N+5
         JocxEeveDB1U2FlgkKu1qjZJi5BbuGmSpZz7r8BnO5xJ+xFVcpZARWfr+t77toNTTfpL
         KDl0aRpvycgekY25cZ7EEoy+8DHyKd/uo8ZCe+h6FT5M3rRRBRq2qmOBb/LKT7ugaIGG
         wBj7y7S9MQyLlJW0/ZM5sldfMMld4O6dec6e3FS1OTBH9M/869pN5Wx1bQ6M4Mcoprqm
         d4npSFiEYsTDDG0QotnJ8ogfJldoN3Bgb5yAZ2JKXZjlSR6AWogf4X4H6fZUjM6yrbX6
         JYWQ==
X-Forwarded-Encrypted: i=1; AL+hErGpXUySPHj7ExQBc+o4v5mQcMehNh/PHHVPrww+7ogPL3ja5ckdIBm48KcXPDvlbPrAE34NZUi2FeNr2/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vIQDYszqX/ZZJ9VfyKJgqIamPKALlpbh/IQxaLdfSYPo7DJGl
	O2kSvzjENZCmnJgzL2CAIQpTiSP4ik02dgSdQEV38xfbZN3umyO4SXqrolEglvl94Fo=
X-Gm-Gg: AYBFou0fa1xr9198nqSBv+kgQMhwFo6jvjS6PZ2o/DoRebiizmWusRBi84P2vOHG1UW
	2iEIJ0NJOdTOrSEn8rMa+kBKSaf2vjQo/GOqKloQTtJYAWb1ZzevBmiXxz1dOy8ymZ/nSTM4e7q
	PAKcio0u/6bphD+N/+qZe3fxxMTRtSX5iNEYW4VMP0T0WOa0u9Rh5cgRu3wZPcFuTMf22uTOH8F
	MYwTpX2SaaUeH+dErB841DAjUOUSdpGFxIvslUQKBxlfqyOhKe90nBbi+DMhmTmhcejrzkJf79S
	X04t6oYC7JDHlDez6yDxvwpsVLUslZ8LS3X+qQj9mpfqTT349ecIaNKnFejuBFLDtHQ/VGmd9NW
	GZvgw2IIhAteBT93EmRo/vwZiZjUF2yIIM0EomkGck0QEKhFg90pdUUvJf666XLRy3UR1N+M0ti
	xPdUTgZ+P/dgRwPlAZEyDtMOH4uLtA+kVr6s3jFglLn6uXpvDyB4xe3HZ3xdGJykPKroN8+Zqju
	akwktYbpdm3J/GXVcBvURvkbp+coeZ++8nwv1MFHCR7gZIO5iVvNv30oOL3pZOoaOuKcwggdrTJ
	1su+hA==
X-Received: by 2002:a05:622a:4c08:b0:55d:2dd1:48c8 with SMTP id d75a77b69052e-55d5a80a719mr59797531cf.67.1795030523112;
        Wed, 18 Nov 2026 11:35:23 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66b24f4dsm7057611cf.5.2026.11.18.11.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:35:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTlRB-0000000GGIL-2q4J;
	Wed, 18 Nov 2026 15:35:21 -0400
Date: Wed, 18 Nov 2026 15:35:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, iommu@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261118193521.GD3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <615C3DA2-4C02-4A8B-AEC4-70D498672559@collabora.com>
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
In-Reply-To: <615C3DA2-4C02-4A8B-AEC4-70D498672559@collabora.com>

On Wed, Nov 18, 2026 at 04:11:40PM -0300, Daniel Almeida wrote:
> 
> > On 17 Nov 2026, at 17:20, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > 
> > On Tue, Nov 17, 2026 at 05:09:11PM -0300, Daniel Almeida wrote:
> >> Hi Jason,
> >> 
> >>> On 16 Nov 2026, at 16:38, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >>> 
> >>> On Thu, Nov 12, 2026 at 02:00:07PM -0300, Daniel Almeida wrote:
> >>>> This series adds a Rust abstraction for IOMMU paging domains. A driver
> >>>> can allocate a domain, attach it to its device, map pages into it, and
> >>>> install a handler for its faults.
> >>>> 
> >>>> This will be used by the upcoming rkvenc driver that my colleagues
> >>>> Detlev Casanova, Nicolas Dufresne and I are working on. More details on
> >>>> this driver can be found by watching Nicolas Dufresne's talk at LPC 2026
> >>>> [0].
> >>>> 
> >>>> As part of the security model, each client will have its own IOMMU
> >>>> domain. This is needed as the submission model will let userspace set
> >>>> most of the encoder's registers directly, so the kernel cannot check
> >>>> every memory access that a job makes the encoder do. With a single
> >>>> domain, one client could make the encoder read or write the memory of
> >>>> another client.
> >>> 
> >>> How do you plan to get the paging domain in the first place?
> >> 
> >> We plan to alloc a paging domain when a video encoder session is created. Then
> >> we call iommu_attach_device() before a job runs, and detach back to the default
> >> domain after it finishes so the next job can attach its own session's domain.
> >> This is so each session is isolated from each other.
> > 
> > If you do that you can't use the DMA API at all in your driver as you
> > have to set 'driver_managed = true'. Is it OK? If it is why not just
> > use VFIO?
> 
> No, not OK :/ We want to use GEM shmem, which calls into the DMA API internally
> through drm_gem_shmem_get_pages_sgt() -> dma_map_sgtable().

You cannot continue to use DMA API once you start touching a paging
domain directly. It is why driver_managed exist.

If you want to use the DMA API you need two struct devices and now you
are into DT abuse land.

So what exactly are you planning on doing

And why do you need the paging domain at all if you are using the DMA
API?

> The CPU mappings are write-combined, so the only cache maintenance is the clean
> of newly allocated pages, which dma_map_sgtable() does in
> drm_gem_shmem_get_pages_sgt(). 

Yes, this is why you should be using the DMA API, that doesn't explain
how any direct use of a paging domain will work.

> The mappings themselves are chosen by the kernel driver. We don't
> care about what the actual IOVA is. All we care about is that a
> given GEM object is mapped to a given domain, and that we have some
> IOVA representing the start of the allocation, such that we can pass
> that to the device.

Wonderful, what is the paging domain for?

> > Are you sure you shouldn't be using iommufd for this, tied into your
> > driver? It was intended for exactly this use case, to allow drivers to
> > delegate their translation to userspace. Though that doesn't relly
> > solve the questions about what it is even being attached to..
> 
> I had a cursory look at iommufd, but it seems like:
> 
> a) it requires IOMMU_CAP_CACHE_COHERENCY, which is not offered by the rk_iommu
> backing the RK3588 SoC we are currently targeting. In fact, IIUC, this does not
> seem to be possible, since the encoder is not cache coherent with the CPU?
> I.e., does iommufd expect hardware cache coherency/snooping?

*Linux* expects coherency, if you are DMAing direcly to user cachable
memory and you aren't coherent there are issues, and minimally your
driver would have to do the cache flushing.

Which we have deliberately made it so drivers cannot do to force them
to use the DMA API.

This is one of the unresolved problems if a driver tries to use a
paging domain directly.

> b) there is no way to do what I said above about GEM, i.e.: there is no
> connection between iommufd and GEM.

Right, because you started out saying you wanted userspace to control
the mapping and put user memory into it. Kernel controlled GEM
mappings is something entirely different.

> You seem to be saying that what I'm proposing here has a few pitfalls that have
> come up over the years. Perhaps we can massage iommufd to make our use case
> work? I can volunteer to do whatever work is needed, of course.

I am very confused about what you are even doing. Can you explain more
clearly please? What does you DT look like? What do your attach calls
do? How many struct devices do you have? Who is calling the DMA API?
Who is mapping the paging domain? And who handles cache flushing
issues for your incoherent architecture?

Jason
