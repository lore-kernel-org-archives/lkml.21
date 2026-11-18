Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026065;
	b=mxK4qVMf0ftfib1PexCvvSaa/z5/OuFrR1eh7q29cxgO8/JBN5CvaCYYtPzd03dhaOFZ
	 QfspkU1rQzLOv9M5gTfvL71EV/JatlMlRAknjpSshFLEUGe8MQdyCj+B5Z+Tap/8cDYxX
	 12D7JmGNzsMI+HYmHHZVEqcr4P9IAaG2+ql5KDRJfeONvlW8l8fTZGcPtRhfepiSkFq6A
	 p0Qe7XYxoWv/EYRyZPKnsqTwm+8Yu2x4gpqhLTmeG2VS38UuV79sGGetMvHjAwC/Yw2w4
	 rcWwTlCkgkg2Mc6kBLfok+yqhOYZzk5bmJmBmucSOix4jD1D5QZ9VQQz4zHvIXS1aog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026065;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=eIdeECoH3KwXtJ/iYslgCA1a0PSh51Qhx+6wORXWgFM=;
	b=jL5QPBZ4K4WLx+7mCbxucFoiGOPLK//wy/K82u8k0oW9HBu+b0bq+WEfZbMmTjrb43CL
	 qOPGrayPPLZIldwMFH2W0Cy9vVwZtYyhg6Tq8ghFq79+tqjJqqRmBQkRkMO6JTcipC4L3
	 01P/C7411zt0m9WOAfGWSGXU8gW3dGvU6bvZbAQPVDk3s1rf6C3I5xJ90WPi4aGEd04Hw
	 Zx9vH4CE3CMsvQSdG/XH5SmbzUPYWzziccLqVGtG8o2fW/8VMaIrIjvSHRix8t63+O52W
	 mLst8Wdpo+pmEq1ptS32NFDCjTLJP4dRiI+aP0YRUr222Cf+LBspZlijWRT8vIkjASw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CzcrPZWJ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF61606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCF61606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CzcrPZWJ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DF3D1477;
	Wed, 18 Nov 2026 10:21:01 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 101EF3F673;
	Wed, 18 Nov 2026 10:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795026064; bh=4P4WX07+JEXc1d0hl1AVcsLtuNqvMcFf6kS5fDV/nqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CzcrPZWJmR0fBQgCFoEthQSA0GU639/ZdS1pvrgf2S0Ey1bqNGSXzu2VR0IkUSptE
	 YrxaFg+0xJzM5xxC6tQvh84+/Jbm6uGIRspJZnri1YYIo2HWWMffkZ9LAIS2SklQFq
	 WsbjGuwXKSogDW+KMdC9ivK/PeZoNtDyU1WKi9p8=
Date: Wed, 18 Nov 2026 18:21:00 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] arm64: cpufeature: Check the override in
 __read_sysreg_by_encoding()
Message-ID: <av3sjKa4g6-pRE-K@arm.com>
References: <20261113095701.2042858-1-fuad.tabba@linux.dev>
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
In-Reply-To: <20261113095701.2042858-1-fuad.tabba@linux.dev>

On Fri, Nov 13, 2026 at 09:57:01AM +0000, Fuad Tabba wrote:
> __read_sysreg_by_encoding() backs the capability checks a secondary
> runs before its cpuinfo is stored, and folds an ID register override
> into the value it reads without checking it against that CPU. A
> secondary whose field is below an override the boot CPU accepted
> passes verification and comes online without the feature.
> 
> Apply the override through arm64_ftr_reg_override(), as the cpuinfo
> store does, so that it only applies where it is safe against that CPU's
> value.
> 
> Fixes: b3341ae0efa2 ("arm64: cpufeature: Use IDreg override in __read_sysreg_by_encoding()")
> Reported-by: Catalin Marinas <catalin.marinas@arm.com>
> Link: https://lore.kernel.org/all/abwXl35xQ2ze1XwJ@arm.com/
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Patch looks fine but I don't think it's worth adding Fixes tag (or, if
we do, we shouldn't add cc stable; my commit hook does this
automatically).

I'd leave it for 7.5, so:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
