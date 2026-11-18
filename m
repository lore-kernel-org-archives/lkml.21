Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035989;
	b=cddIIIugsJD98lxky6njli6KHFjEeKjzlxrHUN/Ke4GGL291CJ9MCee5nFIBpxDnudBD
	 hJYwQamSTXzt444dwRmuu+tfJJGRhF6pWSpWdR63ULY0ufZz5MHkFPOxIHpDkfRi+dppP
	 krnV5GMtmEbQtzfYrP3xAWS3kLLd0i2UQRf1ilKKlSqxKtZ9A4ylgPmKclS5E4Iq/9X1W
	 n5gVFug8EtYKR549sdDBqbh14XPB7GVhN9JXlpKRVRoPFafI+C9znhkjY6bYpMfipcC86
	 2kyvtrW4nfm+9pqfxX3wGCpRlwciJIVEdAmNMxvfNxGUL2f1Llh0OweY0ZPfAParAgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=pZ3JtacZcjsrcECbYipQCJ4gvP+CBNK95VHZ3UWM6ww=;
	b=ePTgb4RjnUTk2ua7JwkAg6HQmd7VFAI9Zg82h/gBVKZpdnY54/7i7GJMpczkgoFpw2uF
	 BbL8qPY9yqM0HNbVlgdXxwVfkFUzCCXS7WqlPrAIMVH3YpRk0MaJpikfalQgRXFJdLU+o
	 g64DJYW/wjRp2Zqp4fcLCKj+wEHDAT8xpG+BXbEg5bCUk1b8wIlNTMy5/KlYyaxBfQmys
	 9GwwAth2wuKqLf/YtipdhM4dUd6M9SLvveeOwbHOWG2ex+RJrZOR4bTPJCVUDDbqL1nB4
	 hPZxU3ukh1oZhXy02GKYTtM3qDvawSLIFIyxWO8GzpPP0Mct+rA/3quFXOf8lOFv5pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KaGPGf7q;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AF7606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47AF7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KaGPGf7q
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-94958650b09so141192385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795035988; x=1795640788; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pZ3JtacZcjsrcECbYipQCJ4gvP+CBNK95VHZ3UWM6ww=;
        b=KaGPGf7qgbbucEYYgFiUG5ZMe+M+gxnIXYiye9EMd1ek0LBcp2J66fBc1Xzcclgaba
         zhk0t//rnYpdXx8D/U3P7c04aRbXHsc9p3gEu88aSdAFhG4CEesns7D25iI4aQ16pZtt
         S8snp761ySTocbmda8A/bjeZUWhM4lmsYOdbHlMPMAFDbpHtvMrvkrDKiVxOVAZRUsvN
         Ck6cFrhc+RDzjS8Tnw61iA+u2C76JaHcGvQbNPUjKr+2NIe0xkAh5MJ1LaNq/A37hCrg
         KhR0K+8sfg5nW4TVrjBBI8NXO19e4+0rDt0MXr8pnneeprrVvtUm9UOtPBm4K7/59349
         yQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035988; x=1795640788;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pZ3JtacZcjsrcECbYipQCJ4gvP+CBNK95VHZ3UWM6ww=;
        b=EwqGAcWgIat9/wFivdMghd8OkzXTNbzAVh/McLAfmjY3bQwSEM8cZCjbYaFtOY97pG
         lro4jLfRTi8fo5W13kEyg0NiT9wDLibkMYE9CNqKeM9HC0AARMfHO4EwC/5YAFT96/Vz
         2ohO8Jgg8GxrEKpaHspJvbz1aKlwrQpyynz/KHntcz4WI4sTH0AH85mCXKT59a/rHVL0
         aVsDlNF1+xh6vop3tZ+O/EFXvAth7oxxefHHLIPEIfjAXrheUE7GQ/u/N03ji+K7Azpa
         UWqAxY4OTGQg5cSm9U/EyoQxlvQSwW2a1j0HMfsvW0WG1mPrLj3ftKLtbMZFNw37Rj/b
         lQFg==
X-Forwarded-Encrypted: i=1; AL+hErHxML9xpVI56eT6DOJmzsxMrK3OrCPfbFBv6xKf4BKQvoBEX9R73k/Jlh8HQVUqv3AT0ZUcwDg9bf5bgsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+95DtoRYT+MkehUQxqW5f2z4v319AtY3ADZ0Fh5iMqGotr+65o
	DS1Uvl9aRSai2xJg1Lg17pgjEZEqCkt3NOdnSiz+JYHoGFmex/VK7/y4UIvv1i8/DW0=
X-Gm-Gg: AYBFou1xiXjF7q9fELN/mcwCl1WIGkS2rt0wB9PxGCVppEAU/2dvA6KZBQZKsl6ILPf
	9cyjpCbo0XdigXhkVrWL5R0e6Tgv3dtovcTtBvH0f/NnfbPxC4QDfYq6BTy1XmX0S+j5CcJytNN
	1uPHIF/DbdhU8om8mAA0v1w7OVGzleAKTKXmihTWAPtckzxgkC8eT1FBucr4gVUGmKalsuyrCGU
	RGKyVuvo+3eFOfVQjb8VJlbMkcideq8CcBm+U3MKtxGjfoK/jjIK6AYDwGvSiBwZvAaHNcLZ/1l
	F9gZpVaUORIb3DnNzaD2caD/3vGSTMx8oZTtnFVZ4wrRZxk1ux30IA24y2nM5un7j2URGyvGtJj
	yOzDpFuBdPLFQXGvJe7PX9wrh3kr78i/l6ZGBSbGM+LxGzFiD6CgrRLZDwxNOJscxRzpt2ZxD+O
	YoDRGXc/ck9uL2lsWCMbTAGiCWgfrXK3ELN1sOeMiPWmCohdwGdS/M9Qe43XP4Z0+StlGTisINU
	OTkwjQQC1Wj34pzRppwJlIcC+qnuVc5YJmH6rKmtBGkRDRUdq8T4HA76wwmf4O5xjZyPWCG8HdU
	gufAPLQkdm64KkkWec+qpeNwmM4=
X-Received: by 2002:a05:620a:4556:b0:93e:c12c:f121 with SMTP id af79cd13be357-9499964526bmr691694185a.77.1795035988208;
        Wed, 18 Nov 2026 13:06:28 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b8182dbsm271138185a.41.2026.11.18.13.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:06:27 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTmrK-0000000GRJU-0IJL;
	Wed, 18 Nov 2026 17:06:26 -0400
Date: Wed, 18 Nov 2026 17:06:26 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261118210626.GF3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <615C3DA2-4C02-4A8B-AEC4-70D498672559@collabora.com>
 <20261118193521.GD3115493@ziepe.ca>
 <457fe01cc1fbc5b6e2d7b5c9c167012b56fe86b2.camel@collabora.com>
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
In-Reply-To: <457fe01cc1fbc5b6e2d7b5c9c167012b56fe86b2.camel@collabora.com>

On Wed, Nov 18, 2026 at 02:41:32PM -0500, Nicolas Dufresne wrote:
> Jason,
> 
> Le mercredi 18 novembre 2026 à 15:35 -0400, Jason Gunthorpe a écrit :
> > > No, not OK :/ We want to use GEM shmem, which calls into the DMA API internally
> > > through drm_gem_shmem_get_pages_sgt() -> dma_map_sgtable().
> > 
> > You cannot continue to use DMA API once you start touching a paging
> > domain directly. It is why driver_managed exist.
> 
> You are building a strong argument around something that is not what we intent
> this binding to be used for. If you had cared about the context you'd know we
> don't want to touch paging from userspace in this type of drivers. 

Go re-read Daniel's answer and perhaps you can understand my confusion:

https://lore.kernel.org/all/3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com/

If you want to

   "We plan to alloc a paging domain when a video encoder session is created. Then
    we call iommu_attach_device() before a job runs"
 
You cannot use the DMA API.

You absolutely CANNOT attach a brand new driver controlled domain, use
the DMA API to populate it, and then detach it.

Then we have the issue that the rust bindings expose iommu_map, which
cannot even be used on any non-coherent arch due to lack of cache
flushing.

Further, from a Rust binding perspective all these unsafe things I
talked about have to be blocked by the Rust compiler:
 1) You cannot attach a domain to a driver_managed_dma=false device
 2) You cannot call DMA API functions on a driver_managed_dma=true device
 3) I object to exposing iommu_get_domain_for_dev()/etc to Rust
    due to how unsafe it is, but if you were to do it then the
    returned pointer must never be used with attach or iommu_map/unmap
    functions.
 4) Since there is no cache flushing a non-coherent arch must never be
    allowed to call iommu_map(), since it is unsafe to create memory
    incoherence.

Thus, what exactly is the plan here? Do you see my concern?

Jason
