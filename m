Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022100;
	b=vIwkpzXjjoSiq9r9jSZIY0bUjcML1vZPG6iY8efuRYh0I8/Wfo2ylK2xR2aEfN2rdRpA
	 9usDkqA32QqdrNNX9fJqZ4UZ22mpT08cCinp47aUcnCeD0IzQuhYpUQUOu8A2aUsaIqEm
	 pI0ueggJ8A4eS4bmNhCWqt818WKX8PqKpXb8dBp5somLPt8sx0f5zhw258+VRrRqRmMkh
	 op1Ej175elFGx+RrzeYUgsCKJu4ozEPyksLQw9uSRN5TnswhuCGT3PZhfTyQtJFTLgrzb
	 sxD48JHtH5E1Hu/fIWxRBVFmlQOpyAACl+ppxZ8NvsaVjoUgVZipeSC3wcyoZJvqLeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022100;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gX24UlkehAbyugxYOTBhxkmtprZYy49+19QytOdeMto=;
	b=XrJcRPPKHB6txEYlw6bck+DMsrOo+BEmyYu9U/K5cUDerNApcS7CgcGg2IzVp3jOnaH5
	 CrSTH/uHi4MyKEpLa+EeIyy9AcWpZHc2mCJeU3+gy6AdiO+0zViDNjrqN4jSqD7OyUVCf
	 M4RS0eDOBmFTicIex8JzC5KCHVCQb/jsYJ5l7ttcjTTaTjWYrWtVFNqVT7mZUmrxf/gck
	 1YQJf9mqsgrMFXGLn5h/h6DAGSGlXBNkyaM14oabzfERDeIrfa8HQncU5JGIpqmn6V08J
	 5a5Aj0c/HnruSCb+1RVqYBx6iUuC1MkuoOEeF3gCOVPaDcTx87F3Ncv2M56F1ZfQEAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="E/+vJZDo";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5B9606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE5B9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=E/+vJZDo
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9459F1596;
	Wed, 18 Nov 2026 09:14:56 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 603573F632;
	Wed, 18 Nov 2026 09:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795022099; bh=YhZWMU2wfiNBJL8lajkRtTzt8g9FwIp0WP7TV6KuxmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/+vJZDoIknDKiVOE54ix103UrqX6vGzX3Cs/DWxZ6xKR03TsPMPUzk6+9Cm6cYNZ
	 m630MRvBVyYrCIBy27/azkL2irePALActhdOYM1tXEXVgJn37LTU6d4Y7J5cH4hswP
	 n4w93RTh9CsSB3nnZ/9/V5ouSNqLBErersKxK87w=
Date: Wed, 18 Nov 2026 17:14:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2 1/2] arm64: module: Emit BTI veneers for cross-section
 calls
Message-ID: <av3dC9SRzdZc6REO@arm.com>
References: <20261005110511.157016-4-ardb+git@google.com>
 <20261005110511.157016-5-ardb+git@google.com>
 <autdMwEbDqF2u0Wr@arm.com>
 <536669c0-1e59-4d9c-9601-2691689da8bf@app.fastmail.com>
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
In-Reply-To: <536669c0-1e59-4d9c-9601-2691689da8bf@app.fastmail.com>

On Thu, Nov 12, 2026 at 12:11:02PM +0100, Ard Biesheuvel wrote:
> On Wed, 4 Nov 2026, at 17:28, Catalin Marinas wrote:
> > Apart from those, I don't have other technical objections to the patch
> > but I wonder whether we'll find alternative options going forward that
> > make this fix redundant. E.g. allocating .init.text and .text together
> > (you had an RFC) or a new execmem_alloc_near() to try to place them
> > nearby.
> >
> > In the meantime, would something like the following work for us instead
> > of the veneers? We won't free the .init.text module section but this
> > should be small. There's the ppc64 precedent.
> >
> > bool module_init_section(const char *name)
> > {
> > 	if (system_supports_bti_kernel() && strstarts(name, ".init.text"))
> > 		return false;
> >
> > 	return strstarts(name, ".init");
> > }
> >
> 
> I've done an experiment to simply combine these unconditionally, and the
> impact on module .text footprint on a typical config is negligible (~10k
> per 100 loaded modules). That would make this change unnecessary, and would
> allow the init PLTs and init ftrace trampoline to be dropped as well.

I forgot about this thread. Thanks for testing. That's fine by me to
make it unconditional. Would you mind respinning with the above? I guess
we still need the Kconfig checks.

Thanks.

-- 
Catalin
