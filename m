Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098715;
	b=i6lfmnM7+bJeuq96SUQIHHyYY8tkcS3FvyqYU3VH9olDb3Yj5QCi8IQmBtFmjhNqL9bv
	 w9sbkd9BmpvhUlhif/ZY79MC3NVxRyuR1fOqZSsH3eWVmLlQUF864LiOO1MnC1spReYpP
	 NsofPpzuRfEg2n5Jwh9Hm4cYrLwct9iCrfLm4W42QtibXYzyEnLQXg/NerzpB0t41eIfh
	 nfL8be0ghsR68DZFDSNoA7C8rYWSB6NJFOmGen69Wo1kQTNH2m1xSQgX81scukDFcjgun
	 252nuhjk6F/ErlOBDeHE+Kv0dY7shnQRsEmnsE9B7jIZxvj114nl0yMxbEmACLaEugw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hL7cJlK2xvTgQa7LLQ9HzeCYEg5UwEM/V8Y7DTV8aIk=;
	b=j9L616IAqMaqT9ARx3dd1ywZ6SlVcMotQeIL4HsFxRUTDxL5lZI2xNKzPsb/08n8Tsj3
	 n5Q3qfhkzSet0+f6o9xpm2gwpTe3r/WSH6hxYYedVHA5Fo/lQTBESTn9uTwyRXpr1TsCJ
	 ep4McbutXsiCrXxyYe3iWlX/29FGICW4cTMPgAG2KZTFvKIkOZhp0o5MqQNUJu/x/wjXW
	 aG/6LgchvOxNcePhIFz8wkUpvHRS3dFh7e3gp8acpmhtZu3RWWxM2nkkwMKF1RkWDVIL6
	 74e3ewFccKEwp8otDHi6WgJNcdEDq6NKCYtT3HntuIoAceBQRh8rv/j0WurokQk05fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nc3zegcp;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD8D606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD8D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nc3zegcp
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-921276742e3so7922416d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795098713; x=1795703513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hL7cJlK2xvTgQa7LLQ9HzeCYEg5UwEM/V8Y7DTV8aIk=;
        b=nc3zegcpdDuJOHBk9ZcUtuhB6YmaHPoNp1hSAk3wpKKveFlc5sDOso+cviKfEFelGM
         pV375ZXtz6O3Q2NtdVRYNdjmJmBuetfA6eLQJihsorBv+nWhd8AgT6xf1yJByF6wykYB
         mRJWU5ejUgQBXmn1abv8BeztiYm/WJ7R3Gr3BGtApfk+NFMy2R5xXgSzQTIKvi8N5EDI
         14AbKUFXl2d+KPtdaN0xj7Vu2/KbBbi4yLQ/7s3Gw4rLYSA+1m26Rtoq8YmhS0Zubex9
         wcGqu4ZY3UyjUakKJ0LKBnxE06dGBWOuBMUUIMdVOyv+qSU9X6vnivLBPA/9k+XjMKZY
         kNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098713; x=1795703513;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL7cJlK2xvTgQa7LLQ9HzeCYEg5UwEM/V8Y7DTV8aIk=;
        b=Q0+jsb0RNAQhE6nz9D4+x0qfUNu8VBsxkzV35RlcIemYLaZCXAIonu4sqMONSaSost
         eMDwrm/Ih2xsUQ3wiHwu9R25XQG5TerlodYgMna1pwRf6blIF1ElQpmE0JhYGH5XnESU
         1W8jPFtZTdJe4RNY0IR/W8CVewOG1xSYClyorCuFbhdFkvrJR1Yktwclf4kdc18agKFz
         Wo1AOWo2NMcidfMZAbe7xpiQqw51eSnwAPIKUUHq2uA/po4YHThRuUezw2ZFj7K2YDsx
         sSdPQyJVN8e78Lc1IwDgXz+uEoAUGR4xiMGJZYcwCIZA8jEV3Agdr6kjQqnAHxnv8mCF
         CRQg==
X-Forwarded-Encrypted: i=1; AL+hErHCH1QGkhzK08q8YpVvsClB1cIebjNtUY8AN8FZCF0RR3H9VgkzlGYte1wxckGLtWkDl9lSSv2lSPtsAAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zKoyN3KF/3t8ISgi6chUfpJPjdwuROdnBRtLRypvrOAUpz93g
	H3H4td1C/4vzplf4GqOu+jeJoonMzNunLUvwn31HjTFl7hxM61hzeOhUwZ8ZLfbnLKU=
X-Gm-Gg: AZFdTZdvwsvPrN3o34T54MCyI7MlGOtJX26MLay75kn52NMoSrkule6xWzJeV8Ywnfv
	H4SjrYGGzwCmrFa1zii0gfGv67AXpZEgHkvEV9wwuXVXodywDWnew5zTsmsQovg1/6IbCOmcBj+
	dVLRX3/bdaoxLLC9ze4UOx9aOTWl1SQuaGYC6Gwi+20yxJlBudCpijAwgfM5ojPF95obS0vHLv7
	qAIMEyvAd602eNQWBSw2UK76ygu0haNOoYKYqf+CTlPygXU2IdK4QCZVzdvf+ZfiJtnvHEgeqe8
	jQF7Gs8ctYmx34mdIRLOvH8qZJMql/ZOUUmmHv8uhmi3Bz6McmJLA45bO73whg9d53RJnRcq7/l
	oiGLJGiPkSQ4iN9xjNktdH4cFGFACFOtYekpd6YSjRDXV/79MYysSBfnhuOSG9ClZavqvdCJDy9
	H2pLaF9FMbPq/mDYGcDleWrbvoOJju25T0jAaaHaJ86BJxGaz2Il8znHXJ/k/mBIP5V0UCK6tC0
	S4pqBWrgOvfQdTQzYxsfT+3Oae5ECn74PqJUVckDjB3Qjs8UCzewh7rtpfkAxMDlmMge/KwH7pU
	kSSzHw==
X-Received: by 2002:a05:6214:2482:b0:921:2e91:eb51 with SMTP id 6a1803df08f44-9212e91ebc4mr18407586d6.57.1795098713268;
        Thu, 19 Nov 2026 06:31:53 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134042c21sm194846d6.35.2026.11.19.06.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:31:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU3B1-00000000ssw-0FAP;
	Thu, 19 Nov 2026 10:31:51 -0400
Date: Thu, 19 Nov 2026 10:31:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
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
Message-ID: <20261119143151.GH3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
 <20261118160909.GC3115493@ziepe.ca>
 <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>
 <CF2BE3BB-4F16-49FC-8421-B2B823BB7BB4@collabora.com>
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
In-Reply-To: <CF2BE3BB-4F16-49FC-8421-B2B823BB7BB4@collabora.com>

On Thu, Nov 19, 2026 at 10:25:24AM -0300, Daniel Almeida wrote:
> > 
> > I can't speak for the actual intent of the Rust drivers, but
> > giving them the benefit of the doubt, none of that fearmongering
> > should apply: the valid use-case is just simple time-division
> > multiplexing.

To be clear, I think the use case is a reasonable thing to ask for,
but since when is this flow valid? Does something already do this???

And why didn't you disclose this immediately after my first question
"how do you intend to use this"? It would have saved alot of time.

Below is exactly something I think drivers should not be doing:
 
> > A = iommu_paging_domain_alloc(dev);
> > B = iommu_paging_domain_alloc(dev);
> > iommu_attach(dev, A);
> > iommu_map(A, iova_x, virt_to_phys(X));
> > dma_map(dev, X) //still needed for the underlying memory
> > ... //tell dev to do the work for context A using iova_x
> > dma_unmap(dev, X);
> > dma_map(dev, Y);
> > iommu_map(B, iova_y, virt_to_phys(Y));
> > iommu_detach(dev, A);
> > iommu_attach(dev, B);
> > ... //do some work in context B
> 
> Yeah, this is basically exactly what we want to do..yet Jason has been
> repeateadly saying you cannot call the dma api at all once you allocate paging
> domains. So now, I am confused.

Especially from Rust where we are supposed to be enforcing strong
safety invariants. This is not safe, and it is not following the
meaning of driver_managed_dma, it is not good if there are multi
device groups, cannot work DMABUF, and is exactly the sort of weird
stuff we keep breaking down the road :\

Sure with a lot of care this doesn't immediately explode today, but I
don't think we should be setting this as an API direction, especially
for safe rust.

All of this is very related to the PASID discussions from a while
back. The goal there was to allow the kernel to DMA map to a PASID
paging domain. IIRC the direction was to wrap the PASID in a struct
device, maybe a "fake/limited" struct device, so that the DMA API can
be used, dma-iommu.c manages the paging domain directly, and things
have a sensible driver API.

More like this:

 dma_dev = iommu_alloc_paging_dma_dev(dev)
 iommu_attach_pasid_paging_dma_dev(dev, dma_dev, pasid);
 dma_map(dma_dev, X)
 dma_umap(dma_dev)

With the additional twist that alot of embedded HW has apparently
choosen to not implement SSID but instead has a pool of SIDs that one
device can use, functionally similar to SSID.

We'd need also API support for unbundling the DT iommus=[] SID list
into something that the SIDs can be attached more like a PASID.  That
need, I think, has become clear with all the DT tricks and fake busses
to try to work around this issue. :|

Jason
