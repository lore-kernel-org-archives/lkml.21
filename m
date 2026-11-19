Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088368;
	b=Z6ureazcCQAY/JIhaySvQAwkGhCPFDmtYtLotyXW7YXn/e0zfaJJ7v3U5orSjNFtLXap
	 v2rSm3l42tSnlcPaeYsby0b42iiVVzXOJ9+blat80NOlSOpIEhp6TmuJ600ZMl/e9QgnQ
	 uWcQkKU7RDwodoVKtFaDi5ZvtpGgx4inun0ZIjZ5J2sGWTrYAWwLtQuiJci/WN6cBd3pn
	 oJe9fhvdHRK1zn0xI4HzP4en3cWN1zNIqv2ZJQERcJkYpfchFCE3V6S7kId5aTkaBu2sn
	 PCUooFij/TEW/F8kb2ErNlU4GqDD/VjdfWKIY+rutrdmZ/MZCDeFtmEX0p5VDjes7Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088368;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cQD8U7kLvADZ0yYkLsPv4bSnvaN23quZm/iwStveKV8=;
	b=qF4yU0uRR530GKCIWVD9c8DkNJPUtHtzQcK5xMSebsJVVSE0Kq/yGZZSId0HX5ehyUWm
	 8/Nwch93aotf6nz1u0wDys2YYFmk97YXDtGTdcGNtohFo/TN+qj0P+h3B1Tm+MNOfjY/i
	 lPIa6z/EWE9nfOlMYDnassqdsV8mkltHjAzr1+ZqpoDYzPu2o2Mj6Bt9kB4EyqZP8eIkk
	 hUaLd/gUG7r8xAAHhqvcXALQH7osh4JMo3ueLZxyXy/SxNc0l3+SPFNagVWlKouqfg0wk
	 eYPyvRmzcUXy1Gw64pCuu/LqBo8fJ3MSkovrIHe58pd3V73jGIpzMsDNc63F+Dm5yQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dFDlsVIv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B880606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dFDlsVIv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD821F000C4;
	Thu, 19 Nov 2026 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795088367;
	bh=cQD8U7kLvADZ0yYkLsPv4bSnvaN23quZm/iwStveKV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dFDlsVIvTFH12CswKDuycZpa+XlcUuvcfZebYeTqea/BjWW4xKWUZ+KHKpsoqA2gP
	 i+Hq0F7eBpDJNO2xLCmNdATdp05y3spfSziYaKyJjzZvHLvaSQwxBFlwwu1J6EC0CF
	 Msn+1rFCBUGv/08SqCdHYgovmO9wBdCf2zXuGuNPHB447Hghn0SiF/exzY0msS/8vu
	 MrcYXohRbDQR1DNLDDO17V34TuOVbscVARVlZQP9L2JTJH20SmQHtp3e1mPUEerWaE
	 MS5gVpcZuB7SaLtEQP6WAYCPeOKfk6+jyDQvaliZKuO+0Lo+EjsMB8BjKsSurYnKDk
	 F/q/85DAZOulA==
Date: Thu, 19 Nov 2026 13:39:21 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Chris Mason <mason@kernel.org>
Subject: Re: [PATCH] mm/mm_init: don't subtract managed CMA pages twice
Message-ID: <av7f6WK8zipAigbg@kernel.org>
References: <20261119-cma_managed-v1-1-385751505e24@kernel.org>
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
In-Reply-To: <20261119-cma_managed-v1-1-385751505e24@kernel.org>

On Thu, Nov 19, 2026 at 12:19:06PM +0100, David Hildenbrand (Arm) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> With hugetlb_cma_only, the "reserved" value in the "Memory:" boot message
> can be wrong (small or underflowed).
> 
> When mem_init_print_info() calculates the reserved memory, it assumes that
> no CMA pages are managed yet. However, some CMA pages from hugetlb might
> already be managed at that point, 

How about I change it to 

  However, hugetlb may have already initialized its bootmem CMA areas,

when applying?

> so we end up subtracting them twice.
> 
> Fix it by only subtracting CMA pages that are not managed yet.
> 
> This has very low urgency, as it only affects a boot message.

Agree :)
 
> Fixes: b1b7c045e808 ("mm/hugetlb: initialize gigantic bootmem hugepage struct pages earlier")
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: improve description and comment ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
> This should go through the memblock tree.
> ---
>  mm/mm_init.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

-- 
Sincerely yours,
Mike.
