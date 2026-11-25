Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581358;
	b=bdJYotvpBB5lyDfD1B7DD8jEUoBtXqsQRqYnFU+yxE2Enka+U82rhNjfzQTv4zBu9hqu
	 kKw3dewqb+zbwPB9U3aL6fI7DLJNJWz90KVMxlMDJS9BJ9XOWLoVwAmWmop61ah/8/DR4
	 /K8jaOMEbtFfap8GGUbDFSw9zq8fENxgJxNeDAOhBgLZXRagKP+bFqjOZzEidgHF2kBy1
	 KwuEgJpYDUhR8amNIU9RBOCCkhhpbhT4D2XZ9spa52pAwhTr9R4u64pc13nVuvi3gfPLm
	 QqZGiqmAqcqyg6LuUYXBEfZU01XiykeWF9YXFWk3Zzf/rzTGxcSxi1ALuTzzlSAhtiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581358;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jES9287MH9jWQ+5Q+HNtKHVTJlglstu0zwzo0JLxghQ=;
	b=Zu8cgIE9laDWe1981qLxYcLuCSOuwPQo7LwmzQQRZZW1i7G1np8IB5RsMyBrsSJtf0Xu
	 gTnIilwqE+UsmFUJ8anHhEhcsPuiWYhoxuOGAKzUU1Ri1ABUme1CxWJWghbGhK9Lc5lYm
	 pC9D7GKv1mf9XyrAEWGapo7UN+UpGKkAl/MpDu8t6vD94sFwA4k78q4I8XshcLGoCA8mp
	 sFPLLty27sX418oP8wpgCkvgqhjDZuiaKtI+A34PuPF991SfLLvVDNYJlIauALtbuLM6i
	 zbG8rPP1Rh8/94DurAt0QozJHTeBbemclb9jQXB8D5AeDFrOel/4aDZ5ejwuAYEKQUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WvdJsXl6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB02606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB02606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WvdJsXl6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51F1E339;
	Tue, 24 Nov 2026 20:35:53 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7362C3F86C;
	Tue, 24 Nov 2026 20:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795581356; bh=WlnWqEgxHO9OwEFiPYTA4lAxgT8kQaGYI8IyY6i07ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WvdJsXl66Zo/MMmirsJhxVtTutvItNPxsf2hjTwX8JArGnZY1sqlJnFnZxUoci7C6
	 M4J5pEg+e+fg3cxlVQ3dFhXFyitJv7vnskpqvh3rclkYNRgMFSfnrx9Z/Cdr/JMwKE
	 7dLyjzgFZBoJAJm8ecQJ8l4oHqEQa4b/CunjKtGE=
Date: Wed, 25 Nov 2026 10:05:52 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V3 00/14] arm64/mm: Enable 128 bit page table entries
Message-ID: <a54bdqfzj4eyoaaiekxxeqi27rc6pu6z2uufv3lblbyujclz36@egotqjcxv653>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
 <20261120190525.GC1133597@ziepe.ca>
 <aqcypbxidjbmjhuiujg2krseuy7v4lofrlq3upl4s7yjiq6bh2@3s4jqisdrkgd>
 <20261124135424.GL9566@ziepe.ca>
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
In-Reply-To: <20261124135424.GL9566@ziepe.ca>

On Tue, Nov 24, 2026 at 09:54:24AM -0400, Jason Gunthorpe wrote:
> On Tue, Nov 24, 2026 at 09:29:27AM +0530, Anshuman Khandual wrote:
> > On Fri, Nov 20, 2026 at 03:05:25PM -0400, Jason Gunthorpe wrote:
> > > On Tue, Nov 17, 2026 at 12:35:59PM +0530, Anshuman Khandual wrote:
> > > > FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
> > > > translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
> > > > arm64 platforms with FEAT_D128 enabled will now have two different memory
> > > > translation systems i.e VMSAv8-64 and VMSAv9-128.
> > > 
> > > Please don't forget to update arm_smmu_sva_supported()
> > 
> > Sure, thanks for the pointer.
> > 
> > Fow now will disable SVA with CONFIG_ARM_D128 enabled but later it can
> > be enabled back with SMMU_IDR5.D128 feature. I will probably fold back
> > the following change in the series.
> > 
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> > @@ -205,6 +205,9 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
> >         unsigned long asid_bits;
> >         u32 feat_mask = ARM_SMMU_FEAT_COHERENCY;
> > 
> > +       if (IS_ENABLED(CONFIG_ARM64_D128))
> > +               return false;
> 
> That seems wrong if the arch code is enabling this based on a CPU IDR.

D128 translation gets enabled when CONFIG_ARM64_D128 is enabled and also
HW has FEAT_D128 as detected via ID_AA64MMFR3_EL1.D128.

Besides if CONFIG_ARM64_D128 is enabled on any HW which does not support
FEAT_D128 the kernel would not even boot as there is no dynamic fallback
to D64 translation in such cases.

Hence a running kernel with CONFIG_ARM64_D128 enabled is running in D128
translation mode for sure.

> 
> I would expect distro kernels to enable this kconfig unconditionally,
> so this will break SVA for everyone.

ARM64_D128 actually depends on EXPERT and hence it would not be enabled
unconditionally in distros ?
