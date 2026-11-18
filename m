Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026862;
	b=CaY4ANdRlx8B27xZa15p8UZMoXuqSj3CjO6SLiTJ/4JDjuiVilXqZMhvHjFgf5GnCYmb
	 OhQiENMpFMW6HV0QzXU8kmjIZ1Lzoxs1lfSpphBxTUNCz1KDiy0Ipe0jLyVyh3Ghi3L18
	 eqUApiRa68V5bLYAT+v4RVfguiTiESunbHsyoRwUITwOg2LqwHp9cOsfdGgLujQU5ac8N
	 82KYsLKABJSHZ6vMW8zu847asrI1TrVKo14l0jjeI3m4TGS6UUD7lrRaByR9vf0gIDPXj
	 8s/g8mDgLi3aQGWU9Jro6rDoid/Gmi+l2kNUMdIdiVT+PXTsKBewQWMa8iSj6AXjzEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026862;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=fC/o+690xFeOhJ+JzH2oTAd50LQEela7FysgUirDDyA=;
	b=UvhEM4yPkM26HXqhZBeEM0IjlOxbKW4pbuvZ/4Eqdxr4ZXujJnNkyGsOxRPh54iCD2C9
	 r+SOj7tYnnutcY6ghk4kHv8+odnKyyti/3GclMkGwq3bsWG5cCblXs7HNOtwXi1UZCj9Q
	 rijiSJaojrY5eew68t/HRbljJ8kAGxMpsb/9YvtC9UKSd6ik50DK8Pz3ix9wJLXa+Krf0
	 +LjS7pPwTnc00O5NOaQAhzTwDFqG20MFbUoHhO/1WHWal2UZZv/6CHcRuOmtxQ2xIMqx6
	 /QTrJ8f0jKyDZ0bKx4PHdPDjs8So72GA2lwZgdqMx9BgR5wMQiBJoOc+rGrRYdyTHWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cg39Y1PP;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A4D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A4D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cg39Y1PP
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC4F41477;
	Wed, 18 Nov 2026 10:34:18 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B70B03F673;
	Wed, 18 Nov 2026 10:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795026861; bh=kBSVpK/I6ZvTB+IUP/Q/dHuUXEBOX2XmmHx+zAaFCGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cg39Y1PPXXlPTRSKeG6vjlS0SjRFTWEWM9L1/er6+cIGa6i9BBQBJCryc7+WHgEBc
	 dYsHVvtXrwHwf6prdOskWy+j5x2jyyj8+gzyW2TKcEWYyIzdwRKrRTRV/o4nNE3V9i
	 fZTVrd3kK0/U4JIi0n8f6ZLENJpyA8cJ2r2h64xg=
Date: Wed, 18 Nov 2026 18:34:17 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/6] arm64: cpufeature: Enable BBML3 on Cortex-A320,
 A520 and A720
Message-ID: <av3vqbBHGheAY06A@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
 <20261113145022.2592454-7-ryan.roberts@arm.com>
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
In-Reply-To: <20261113145022.2592454-7-ryan.roberts@arm.com>

On Fri, Nov 13, 2026 at 02:50:20PM +0000, Ryan Roberts wrote:
> Cortex-A320, Cortex-A520 and Cortex-A720 advertise BBML2 and are known
> not to raise conflict aborts for mapping-granularity changes. They can
> therefore use the BBML3 semantics, but their MIDRs are missing from the
> allow list.
> 
> Commit a7ac60414475 ("arm64: cpufeature: Extend bbml2_noabort support
> list") named A520(AE) and A720(AE), but added only the AE MIDRs. The
> non-AE CPUs have distinct MIDRs and need their own entries. Cortex-A320
> can now be identified using its new MIDR definition.
> 
> Add all revisions of these three CPUs to the allow list. The reviewed
> SDENs identify no BBML3 exclusion erratum for them.
> 
> Cortex-A510 remains excluded because it can raise conflict aborts.
> 
> Link: https://support.arm.com/documentation/SDEN-2877630/0000?lang=en&rev=0000-06
> Link: https://support.arm.com/documentation/SDEN-2444153/0000?lang=en&rev=0000-12
> Link: https://support.arm.com/documentation/SDEN-2439421/0000?lang=en&rev=0000-17
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
