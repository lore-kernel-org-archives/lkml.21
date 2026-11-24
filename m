Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528466;
	b=yK3DrxVUDNiyJyRl+Hls94tYyMviQmhiygRI9rCXLgi6yqZHsjanNYYxRZdPtMm9RNcB
	 Jn7VddvLsAvyo7gvyKtxUPbsbKJr6xA3Cnr9LZQLGWuXEj/vFM9y7y7XPu5TGeaVGw8oO
	 hXAg8NzbpbFZq4MX4j4dvdWUjluQROveLsBcqA779nXJ/e51Av5eWpB56jDoj+fx61cD5
	 FD4/lcs8PrvAAVgvxQZw7WTBpzxC2lmy+gU5VulKfgmQhR2z7y94FieDFwmvHEVOXWOJJ
	 S1SGxtICnvVqgQknZJC4FhgzEFGjX1mI2tznnccpa3SpxfaOopbKzbJZJxNCDgty32Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jEatzr2wcCwXaEmVaXwZZOqjiW5YqebF/1TV72BGKDU=;
	b=BX6pjV8K51s/of7EIxl4pfwyAguDv0OyC6605vOD8WwbvQP22QrOVvoSH+8WgRmDHfOd
	 qy8PcyXXYRI3rfpxmlU6Gs6QTiQ0GP1UdaDCG2Em7+gK394KavCh+v+oq0bOG3FqWvUvl
	 IxnDYAYs6NJ85Y9WRZQFeXBeFvvBwHQt6JDV+oypjX6EVgfEakJ/5NY7wqMYJiD0T/Yqx
	 +DGUBppc7lEMqATMvt4TOUYkZb5MwRfv+Yy3TbPqu/Sxif8npJ1v0/VYe37UEiGuTHBHA
	 oYdCTiKn4s40BSBA1MYNA4S/VQAiGU5+d6Tkzy/LOkG4HRMRz5vT9viIkINqYB3q70w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=F0F1KHsO;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42761606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42761606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=F0F1KHsO
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5569551d19dso56773281cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795528465; x=1796133265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jEatzr2wcCwXaEmVaXwZZOqjiW5YqebF/1TV72BGKDU=;
        b=F0F1KHsO8mXWc5sORGA/HZez5gY5v1BHC2qHV7kzH0UcBQ4llWy6b7nuU9CK+daaaR
         NNvyV2Q7VfVzORWg4DEhVeEEchdvojHSsHlIbzHL3RuWnOmkerZelJ1DflEcohN0RCgG
         ge//RYEVy0UT+AlgH7a38/s7/CJkEfdFmdQ5SA9kxsMULKSoCL9Tn6EpXI4a60dmhxWr
         90SpfDBzW4P6IuqSQm4gviIsIa2OEH2ujaJfBFRrxWA5pzORJP/lWrqM1tlUBFv0Aw02
         4D6KPF6Dg/AA2ec0dD8LZykCs5Wg8sAj1lC8eh7K1ymVtqK3/AgkAhJ15tCII8L6+K7a
         t0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528465; x=1796133265;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEatzr2wcCwXaEmVaXwZZOqjiW5YqebF/1TV72BGKDU=;
        b=BbggUSJZUmZZ/n721N4wHmD8hI8KLGPuqcIKenVOb01YxJz0gL8jI09FMHxVEk+uW6
         INSCkzyJCPAODBANv8DdqKLSyyFahJL25m0NcjTFIty3AHTxFyOEQ8n7sd4DfRIVsahw
         GuG9Z5+4gwUmuIx4TCUC0rgsKnd7JZMArE1f+0OrMAmye1UoIJD5vWzAB3dxEvAErHiN
         AqhaUybdM8PJ2E7rK9ixDna7IYobLsQiL8qgcnr0S3zuhAV3FHqCbatioXJK8TTuBY1o
         munSLUDkkjrwFzWquhNHb/JH/HKTBOfn+//HSklNXzNrfZAjL4yZ6k1lY9/Pzm9xUoBz
         Tpeg==
X-Forwarded-Encrypted: i=1; AL+hErH+TP5O6srx4GblhUPVwnjLPj6WV0k/ujSQ8/F7zTjcH3bZdex8AimiyI1WpLbSHmDq1dyoOmzuIZ36u2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vB+wxGyjygxXxs2mYUORO+k5QurP6E+Hd6VDDmSeIEGIG4Jas
	Gsw0kYgmD5DEdsVj1gypW6nxdJY91yIjiSoXT7a1Gkya30UW+DHUPamxBhtKlOguAzo=
X-Gm-Gg: AZFdTZeYX/Bwgo+xNq0ezBT8LiwkH0mpKOe7Nm3xHgMx+OBLcQgr1v+9Gb92BnRR0HW
	N6vHf0vovNLvD0eoV6iaYk6XhsAbwASebTlbsJ58FgRVu+bUbl0F97DrzaOKKwU8Y9EQZwaRUzj
	XW6M3nPBV5TQbMbxcrnxbJkCy5PFrPXu8nx+W+gi50uFyxIoJDqNHsYyvQrDECIbrb1qWThVeG6
	sxMYxDB2GbZvY1mlsbtSel3O59AkNC7rflx8+0KxWu0awo8GhQdmSJb44Cz5PLQM2AdH758jRYH
	g2Yhc0kimwAA8+2n+atpalCTJlPEMdul+Y8lsp+Kvzq3khwRaBAq3OIf4fqcwiUyRPO91yiLOpQ
	5ZBRhTyClDrRHGh/ybf2mm93B+oLS+Fc+KPh6CBLNlplh1fYog+6KMgWUGUMubWeKJJxUpVwsbb
	BVhJMglA+nQTVH0yCWTo1xsgRcctG5XdvEHCy0LyGzf90SGWQko1C1qTK83hZ9dvjHPI6YHUxyE
	eJKhOkvEtZUpUda+a+ozvPFY4+aoaM1zjT3P+/gvj7i2Cbt7wR6FLvVF7Hh7z5HDu2pg0fSHxZs
	Dm6R8A==
X-Received: by 2002:ac8:5a42:0:b0:55d:3669:e04a with SMTP id d75a77b69052e-55d76a30b0dmr258015381cf.23.1795528465232;
        Tue, 24 Nov 2026 05:54:25 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788ae02fsm125554721cf.29.2026.11.24.05.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:54:24 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVqyW-00000000QaE-10f3;
	Tue, 24 Nov 2026 09:54:24 -0400
Date: Tue, 24 Nov 2026 09:54:24 -0400
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
Message-ID: <20261124135424.GL9566@ziepe.ca>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
 <20261120190525.GC1133597@ziepe.ca>
 <aqcypbxidjbmjhuiujg2krseuy7v4lofrlq3upl4s7yjiq6bh2@3s4jqisdrkgd>
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
In-Reply-To: <aqcypbxidjbmjhuiujg2krseuy7v4lofrlq3upl4s7yjiq6bh2@3s4jqisdrkgd>

On Tue, Nov 24, 2026 at 09:29:27AM +0530, Anshuman Khandual wrote:
> On Fri, Nov 20, 2026 at 03:05:25PM -0400, Jason Gunthorpe wrote:
> > On Tue, Nov 17, 2026 at 12:35:59PM +0530, Anshuman Khandual wrote:
> > > FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
> > > translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
> > > arm64 platforms with FEAT_D128 enabled will now have two different memory
> > > translation systems i.e VMSAv8-64 and VMSAv9-128.
> > 
> > Please don't forget to update arm_smmu_sva_supported()
> 
> Sure, thanks for the pointer.
> 
> Fow now will disable SVA with CONFIG_ARM_D128 enabled but later it can
> be enabled back with SMMU_IDR5.D128 feature. I will probably fold back
> the following change in the series.
> 
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> @@ -205,6 +205,9 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
>         unsigned long asid_bits;
>         u32 feat_mask = ARM_SMMU_FEAT_COHERENCY;
> 
> +       if (IS_ENABLED(CONFIG_ARM64_D128))
> +               return false;

That seems wrong if the arch code is enabling this based on a CPU IDR.

I would expect distro kernels to enable this kconfig unconditionally,
so this will break SVA for everyone.

Jason
