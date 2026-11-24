Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520102;
	b=0rTXAm9gDtzmW+BHldtgSLwi9FDiUGeJxZxGfHkpSqALrMVhqQc+KyRJ5V//CndaMRRK
	 2o6eQ+VdTET9hoogw29WLHTpZLcWzFt57V/AzlsBLeHg8FgvDUO9YTYBBA/mxqHdegt1B
	 z32/SAam1bVD/nh7Ymk4yJS44XIwyTcYrMdl90tpe8eWD+7UpRJpfDBWgLrQbXlTYPy8+
	 zuC6jb/FUE4vOCr+EJOe4fLSXoUswxtdJZDCsQdf4oCLrT3hvtqyfJVBU5u+CMU5UA33Z
	 jbL43kY5wP8gDpU5MkvocP8YywcXPaQz7ub4IVXIRuymi84L7yuc7l1IwqeA5iboM/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520102;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jzjjf75BdPt0KXw71TlYd0nbTXRabtrZA0M4R/TEScc=;
	b=CEcxpjpMyE9dN3Z35vIznmC3gL8Arn87uj2IgmSFjXpa+HXC2D88giZqARt04ZhkGBKc
	 vy5NR1N8HA9PZ4Dx56RKsAYRmoly6+phMG/VSu4SW/4jExxcxd4KeioxTVmR8RrWYGU5w
	 I57bvy/nvxv3urMq5TMQc5xsVYjAb91VFWkbNLmiUID6UZXH8opk8PjGvhwC7EUXtrEwb
	 9wDtBhZ23ccDuuz6H0YwKTpFvbgAowGt9/8SHbnMErNoSLCQcvJH1s/2vKYd3HHTk17Wn
	 FHWxJneUb0msxjTuZm50viJ5LIHbHNIZv9uXQlYqBK2UsjDwZBovLGeCokMDcKv63WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=csHsaRXA;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C58606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C58606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=csHsaRXA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29207339;
	Tue, 24 Nov 2026 03:34:58 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 487373F86F;
	Tue, 24 Nov 2026 03:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795520101; bh=itpBozBXqi58AIY5X5mlQrWFgkN3PFnqMCF9pr4abvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=csHsaRXAQZR5MoNxlzJcy5FWI5FvRHsk1CBrw9MSQnSLzdid07KslzEf0S4uwqb2Q
	 X8UrZYPH9ouIYUMqwFTdH9yVtsfu6oyyWoNJhGV/NOhliPP6Y9pMMxE/Yw17oQH4ks
	 Ke3uf2ryO5JCEn5sJeCUk1bExiGCuiFtj0LGX/Rs=
Date: Tue, 24 Nov 2026 11:34:57 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] arm64: entry: drop the unused tmp2 argument of
 mte_set_kernel_gcr()
Message-ID: <awV2YYTIqObQzenY@arm.com>
References: <20261007185512.2.mte-tmp2@mainlining.org>
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
In-Reply-To: <20261007185512.2.mte-tmp2@mainlining.org>

On Wed, Oct 07, 2026 at 05:45:01PM +0000, Bradley Morgan wrote:
> mte_set_kernel_gcr() takes a tmp2 argument the macro never uses. It
> used to, the body passed \tmp and \tmp2 to mte_set_gcr, then
> commit 82868247897b ("arm64: kasan: mte: use a constant kernel
> GCR_EL1 value") swapped that for
> 
>     mov     \tmp, KERNEL_GCR_EL1
> 
> and tmp2 stayed in the declaration and in the one caller, which
> passes x23 for it.
> 
> Drop it, both places.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
