Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617627;
	b=NWvsM3SRXiUEkMxPqJQ612P80EtdF3TO+63V7twJfYC4aMpQIgry/Z/vYhPbuZfwV7AL
	 2aJMmpoDt1LUUHs+4jPtZ5Z5Um2d5tslbT565VQHkzupQ6aiiuuWHKvCfT4XFKmCtdWEh
	 gkVctalEUZ5pM4C/5BsQ0MlJ45HJUl/roW303UYWssU3r65kn8vpQ3r3i+gWVfL+BFs0B
	 Ovxfmw77ArKtzhChx9rWgOhApzwTnHk0efUdjzZIFXy3Ew06LX0kgKaPiRx3HpM8OmHj+
	 g7YHgS0SjclZOUTfI9cB5sJWIRXKxulXRG7Di9B5j+sWZD6nbzelOB7IpKoq8BjdLxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZXxCXDhXt89FGj+2wCW0FFI+CiFy5a7DZCKDEUhio5A=;
	b=VEMj9SZ7KAhS7uCG+UZpnR/U3+6M496TfLRU7so/WzWEZjzwmudeLdS2a7POiD9fY1Fq
	 T4XZcSfaO3ZdBm5u7WM+rmQ5SHL1Q9wvWZU2X7QGdTUeePxL6WRQWxpesXlwH6dcZOK3h
	 HcklcrMOJRZit/EYFGOPS/7UksKsyId5k58rl/GzkhhGNGNveY0AlSk/WcgOsscCc/Xt8
	 VRpWGQkyRj0MPJz2++VIS4wMKr18X4evXRmXYt3eb6iCy/KNFW0FTkbwEWK5AZcdJiAuq
	 hof0Uj+jhiu/az/I50xbe8EVjoDZVdrb6XPrnJ3j1vxa0roigM+OrfttNOxEKRAf54g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=F7AI1mjn;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8113606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8113606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=F7AI1mjn
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-92157f2e8c1so39370066d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795617625; x=1796222425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXxCXDhXt89FGj+2wCW0FFI+CiFy5a7DZCKDEUhio5A=;
        b=F7AI1mjnXS/M7ae9PIOzXumxH1oPL5HE4Cz0Zj5Sc4g+QiyMIRqN3y7CnzX8n2rESc
         hZfGYN9O8jv8WbFa8ctKOcG1RgndYPnvA5NTj/80ChohLQKfiDhdwUhoWtbg+9Hxz+d7
         whfGrDn1kQd4gjM9D07g23ffVB7S/KzRLe+fhsKapU1OMNW5//kBoKxsOFXF8Jb+XNVw
         K1zsBTGfx94S9bwvh0YAvL/NiifWuI+pX0YP11tA16FY85dZzkXMcWJ7bw/V7Znvtx5J
         uC2Rjytx+ZJ8vyef2J3jx/Duil/D4U4BO1iOO4cPop9s0TN/rFjRnZ9c5zMUd/0xNF/9
         yHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617625; x=1796222425;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXxCXDhXt89FGj+2wCW0FFI+CiFy5a7DZCKDEUhio5A=;
        b=c8X4smBsp0wo2BEhi9psxxV6WZ+ZeTegmg71+RAGynzgKAFBlswGO8E03/+gP5+iD4
         qvcka7vNTMsR3yXj1xw51Jk/Ky8zlhngVhvjyInsQjptX3+OpBlSXDq/p7cs8oW79MB5
         QYk3J3SYCt6OlLHSuTqwYed4Tz5Vq2f3ZxKW0LmB8vGLStGUVkSQc+9sB2ppNoKzat+j
         yvXEHR0XZM/TiOrttFvwuUOfphBD7ExyL3PEbDEEtTWfADPdh2Q+rfXa0mtZp0gH396l
         TdPFfXUz7qCQT53rQ1n4lnn8yRV0kWWoz/EFxWpTZVsK8nsD8y0gMMwyzGasciKXjCPR
         sAsg==
X-Forwarded-Encrypted: i=1; AL+hErFTiJ3SSHvqJ7MWATBC7OVGDmzxzI8ePuexYGlDCY88nrWiaTPSaBA5hPeDjkO+GouKLKfvkvW1SW4UzSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2byAOGWqrnbuGyXzZwhEMm2PgZQY/4H2G3ylIrMCNsGqBhr6z
	udeYAdqiIOg/XqqmEVf7I11WzKzY94lirY7/8rGNoPy2i+mSfQjVzomuAPZ70OgxBBg=
X-Gm-Gg: AZFdTZd3oPjUD/EzyuZExU2dx+2dv5ao5tqs+AfADyloeUvKKvhgsTcREz+u3b+ybQC
	C3NaLDFP40NuU/n4oOH8ykQ/6rPJ0lQOJgDFmyHWWXCiQ4Y9lU6vqyydBj+JAYr5svfhXEoanNU
	xrSGgCEmpFEWZU+HCbXGWWjVNWP3AlxsKLef9nc55PYDN9ceYdAfXJUWX8BlfwtmywlgH0oh5bi
	FTZ7GMyJgxfScFdZeT9ii7y1N8TLWRtrelfO3Yen0Y6u5uVpbBTuia2olklQM1mT/49BOO+tDg2
	lRX1TjEWGgrcggJ5HOXThiG+pecZyb8Zs0ND1HGIEMH8crv4A0yREuVS/jaBhEU/Q7PsB0DInYS
	hyO7DesMtexJ540z0Yz9a+GRK90ryYIeSt7saAxh1P/BlIHHbyDuEnVnLmT9UpD+3r7R3twNrG9
	ld4yJ5QFdG2Ey+Lf81emXm940vfwDkbJEd3qdhxdUPt3AALbxKPMueU7pOoC1xE8x6tK+0NpUE8
	9OpWYdAtHHHSC5u+Tbv4UgtSNFL0olX1sJ5wdNxwoJmqaSRsRetiAApqfBpNgccWFkZRV2QaIau
	LawRLA==
X-Received: by 2002:a05:6214:e88:b0:921:23fa:2c05 with SMTP id 6a1803df08f44-92134b7aa62mr315798476d6.46.1795617625546;
        Wed, 25 Nov 2026 06:40:25 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921645f50f3sm61254106d6.24.2026.11.25.06.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:40:25 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWEAa-00000001lzg-24TM;
	Wed, 25 Nov 2026 10:40:24 -0400
Date: Wed, 25 Nov 2026 10:40:24 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH V3 00/14] arm64/mm: Enable 128 bit page table entries
Message-ID: <20261125144024.GH246011@ziepe.ca>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
 <20261120190525.GC1133597@ziepe.ca>
 <aqcypbxidjbmjhuiujg2krseuy7v4lofrlq3upl4s7yjiq6bh2@3s4jqisdrkgd>
 <20261124135424.GL9566@ziepe.ca>
 <a54bdqfzj4eyoaaiekxxeqi27rc6pu6z2uufv3lblbyujclz36@egotqjcxv653>
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
In-Reply-To: <a54bdqfzj4eyoaaiekxxeqi27rc6pu6z2uufv3lblbyujclz36@egotqjcxv653>

On Wed, Nov 25, 2026 at 10:05:52AM +0530, Anshuman Khandual wrote:
> On Tue, Nov 24, 2026 at 09:54:24AM -0400, Jason Gunthorpe wrote:
> > On Tue, Nov 24, 2026 at 09:29:27AM +0530, Anshuman Khandual wrote:
> > > On Fri, Nov 20, 2026 at 03:05:25PM -0400, Jason Gunthorpe wrote:
> > > > On Tue, Nov 17, 2026 at 12:35:59PM +0530, Anshuman Khandual wrote:
> > > > > FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
> > > > > translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
> > > > > arm64 platforms with FEAT_D128 enabled will now have two different memory
> > > > > translation systems i.e VMSAv8-64 and VMSAv9-128.
> > > > 
> > > > Please don't forget to update arm_smmu_sva_supported()
> > > 
> > > Sure, thanks for the pointer.
> > > 
> > > Fow now will disable SVA with CONFIG_ARM_D128 enabled but later it can
> > > be enabled back with SMMU_IDR5.D128 feature. I will probably fold back
> > > the following change in the series.
> > > 
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> > > @@ -205,6 +205,9 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
> > >         unsigned long asid_bits;
> > >         u32 feat_mask = ARM_SMMU_FEAT_COHERENCY;
> > > 
> > > +       if (IS_ENABLED(CONFIG_ARM64_D128))
> > > +               return false;
> > 
> > That seems wrong if the arch code is enabling this based on a CPU IDR.
> 
> D128 translation gets enabled when CONFIG_ARM64_D128 is enabled and also
> HW has FEAT_D128 as detected via ID_AA64MMFR3_EL1.D128.
> 
> Besides if CONFIG_ARM64_D128 is enabled on any HW which does not support
> FEAT_D128 the kernel would not even boot as there is no dynamic fallback
> to D64 translation in such cases.

Uh, gross, so it is like 64k pages :(

I guess that makes sense from a mm perspective.

IDK how this will ever get used in the real world like this though :(

> > I would expect distro kernels to enable this kconfig unconditionally,
> > so this will break SVA for everyone.
> 
> ARM64_D128 actually depends on EXPERT and hence it would not be enabled
> unconditionally in distros ?

Please add a comment to this effect, this not how the other things
work.

Jason
