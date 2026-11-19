Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100114;
	b=ktylKGqBHow7Fr4nkwlNC8t6aU2HHl14DJ+Es4SjyocEx9hcGSFdMrQjs/TE3CV8wwoY
	 G39izDNbFjsw68NvEk+s+7w2O1YNXmXfDZcP+8hSciSUdFEx5ZXIToBK0daQXBOIMFx0v
	 sMg+T+HPJ61fmuG0dKmiTJm2+6hv7axPFe54OdJtFc8dWNjOgjkZqMnpktaeAolP6AZ5I
	 0BCDRVrvAgETVUkFqCiF761zbQreFbmdfw1OyoyjBa3FHCeWU5NB+qJylw0Kc7nnUcAWo
	 cKGvdDbY/sFlCQ2bvmwO6Yq5+047A6ttSCYk4b13FeJfk7e9KYZFZUrXosOOVDw06aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=G+3w7qcryJEhye/h2qafkqEU5e//COD+Oo6UYEV8BlY=;
	b=hdfAFWKLWt8UXdS0duzRa0pfLb5si0oM2RbTAezYuPe8CWCJyJhCYfL/DZ8vHMcnpMAn
	 YBfkc9jAv/Ya8DRMnUu/MOX8S+26KNgyH9bJIjaC9XsXorkAiVXcXMszHABG5f9sSiEcI
	 8Emo6pqTqqjM5SubVTkBpZn5oOr9PA/FGzh4c9d2r6jXWynpoWD+bybZLJK6xA0Ar/IkC
	 b73ghuZt/a38S6OsAZZqV5Vjf1cB9s5SNs3rf+qtG5AnV0cg1hbOtpvOWhBDTe29TC8hv
	 3PWxlXAyV+g8PLbkHzqOW4XK60wQNeXA0YSfQnN3ibKBCbZM8SWP/3C2Yk7ePC3XN8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=U8SNLZUp;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB63606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AB63606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=U8SNLZUp
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c511cdd5a82so239678866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795100112; x=1795704912; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+3w7qcryJEhye/h2qafkqEU5e//COD+Oo6UYEV8BlY=;
        b=U8SNLZUpSmGooaNMNN6PYxECySXVz+MwMEK9xjhak0eCZ91ckA29HCyhgHzb10RV8b
         f4TvcU0VyWf709cOjM7r27zVdPNpfkwVfIkLyAi38VpTpqdIfp4gBtWA4C49tPHiLPFD
         OoyXlBOoXgVwGneT14LJARwicBIWqQn0lIlZE+0B9HXe/xQVKCDod0RtdHsCaPY4PHMg
         bq8zqi1IxyGwQjOpCfqTFiIONWpfPqlq09g16etOvi7LbT+DEEjCduYiA6YuAruU98a3
         d2Y10yr4F3Tyjsr79RmGaBD4MTJLGTniCwXuDfDMkrDyXboTIKZmfQJrNQxl5uocv5ke
         aOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100112; x=1795704912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G+3w7qcryJEhye/h2qafkqEU5e//COD+Oo6UYEV8BlY=;
        b=qv0VRFsiLRFZ3k0IXlbOmekLufikQvTE3ZzkdHmy7CEGYcMlUjm2N6naoo876ADi9a
         YvsDgCAnmT5y2pJLBwYNKxk94ossIxXPSqVF62/CjwlCOEyPf4jGw1qyxoRh6tzEMWZS
         PgzzikJxUJHmEWIR7HRvUewLwQZHdUUcCrzx1LK/k5auXHMzrFygGhfYldhp+2elzAkF
         XfRxiovvkft480M1rYpgkIjcIGw6JrSQPmxnM/dCfSIjau6lx9V4CGs5xGuG7a2zcpz6
         Jyig6Xng26WocZMrquJrPK4K/kCUDjVYLku0lgVXuAq40pzBocYZEttoNLJDdRoY/KjO
         IyUA==
X-Forwarded-Encrypted: i=1; AL+hErGUz6QeuoJTssyqmeEDyxQTnrxq1cOVpc1I8lUl02Wgw3+tGMFXkRyWTObpD+9lw30y6YeceSzcb+cArFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8u6lBxLc2SQA6YaWb9cA90rpWKEg/CO8licuSINeafQntRo37S
	Z55de7i7tX8qrXlu9xHy3GLPCudRVZBBRL9GcO+/fKoofdZYBOc4SJTKn16poiFTzBM=
X-Gm-Gg: AYBFou0ECPc3ymWh3iD4OyV6APicnfVIwtxDzAskShgVQ4Ii+uno9sV6mmaRkvKHOxz
	lIleu14oaPFDdL+7eGc6yx9JPdyF+XyG0LTgFqIr+ub6OuaGydnnjLRNo118OlctIy+Q3eKNmd5
	fJPV4SJEQt2/L2nHpewFoqF8oVfGzaXl5mLkoWcTb789HsHkPHTDJ1QIHvXy5iFAtXoXFvNILeX
	BqQpkzcyVwJuq2cT9xh6oipmxSCg4eBAWy0zXXO15w6Jcli6nQqXParBRxmy5eoCrA+iUFi2eTJ
	CRSd/uhXDFKlLnm1+vVkWhaPXiCOWh7VYaihYvrHE8pOp0lImipOZWRoRqA1JvIHzorZCCRQ49I
	/BYYK/fsf4/HZbuVtr2e2zAGlVNEB310C9qoeKNbY+AnH3IJkxIxhQnNPQ1ABi1v4/mQX5ZVhB1
	84vLYrIWMuvo5HYZJ0S0gqikqYe/Ha2fRJfKf3UmUf86MjYkElD2DdEYZKmdg7DhAAJOmFZQ6Bo
	ctcDOFAxx/kflS1hjP/jxV0WnjVwrBWEI4RaHZD0Hq9fmkvWt4F0LsHR0RBNy8Sigzo8sEGNxdx
	0tzD8A==
X-Received: by 2002:a17:907:ea94:b0:c50:aa10:d888 with SMTP id a640c23a62f3a-c513acab9d6mr6638766b.40.1795100111790;
        Thu, 19 Nov 2026 06:55:11 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm2503566b.40.2026.11.19.06.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:55:11 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU3XZ-00000000vhT-1zwc;
	Thu, 19 Nov 2026 10:55:09 -0400
Date: Thu, 19 Nov 2026 10:55:09 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
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
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261119145509.GJ3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <615C3DA2-4C02-4A8B-AEC4-70D498672559@collabora.com>
 <20261118193521.GD3115493@ziepe.ca>
 <457fe01cc1fbc5b6e2d7b5c9c167012b56fe86b2.camel@collabora.com>
 <20261118210626.GF3115493@ziepe.ca>
 <06d4eead-b765-44b9-94a8-6ec2d71d172a@arm.com>
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
In-Reply-To: <06d4eead-b765-44b9-94a8-6ec2d71d172a@arm.com>

On Thu, Nov 19, 2026 at 01:03:52PM +0000, Robin Murphy wrote:
> On 18/11/2026 9:06 pm, Jason Gunthorpe wrote:
> > On Wed, Nov 18, 2026 at 02:41:32PM -0500, Nicolas Dufresne wrote:
> > > Jason,
> > > 
> > > Le mercredi 18 novembre 2026 à 15:35 -0400, Jason Gunthorpe a écrit :
> > > > > No, not OK :/ We want to use GEM shmem, which calls into the DMA API internally
> > > > > through drm_gem_shmem_get_pages_sgt() -> dma_map_sgtable().
> > > > 
> > > > You cannot continue to use DMA API once you start touching a paging
> > > > domain directly. It is why driver_managed exist.
> > > 
> > > You are building a strong argument around something that is not what we intent
> > > this binding to be used for. If you had cared about the context you'd know we
> > > don't want to touch paging from userspace in this type of drivers.
> > 
> > Go re-read Daniel's answer and perhaps you can understand my confusion:
> > 
> > https://lore.kernel.org/all/3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com/
> > 
> > If you want to
> > 
> >     "We plan to alloc a paging domain when a video encoder session is created. Then
> >      we call iommu_attach_device() before a job runs"
> > You cannot use the DMA API.
> > 
> > You absolutely CANNOT attach a brand new driver controlled domain, use
> > the DMA API to populate it, and then detach it.
> > 
> > Then we have the issue that the rust bindings expose iommu_map, which
> > cannot even be used on any non-coherent arch due to lack of cache
> > flushing.
> > 
> > Further, from a Rust binding perspective all these unsafe things I
> > talked about have to be blocked by the Rust compiler:
> >   1) You cannot attach a domain to a driver_managed_dma=false device
> >   2) You cannot call DMA API functions on a driver_managed_dma=true device
> >   3) I object to exposing iommu_get_domain_for_dev()/etc to Rust
> >      due to how unsafe it is, but if you were to do it then the
> >      returned pointer must never be used with attach or iommu_map/unmap
> >      functions.
> >   4) Since there is no cache flushing a non-coherent arch must never be
> >      allowed to call iommu_map(), since it is unsafe to create memory
> >      incoherence.
> > 
> > Thus, what exactly is the plan here? Do you see my concern?
> 
> Yes, your concern is a restriction that you largely made up :)
> 
> This is very much *not* driver_managed_dma, which TBH is poorly named since
> it really means either "no DMA at all and thus fine to nominally hotplug
> into live domains" or "userspace-managed DMA with no chance of ever
> inserting DMA API calls at the right points".

Now you are making things up :) When we invented driver_managed_dma it
was explicitly for the driver to take control of the domain attachment
away from the DMA API. For whatever reason the driver might have to do
that.

I wanted to convert all the places calling attach to this model but it
was too difficult with no way to test on all the embedded hardware,
but I still think that is the right thing to do.

Jason
