Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169503;
	b=IEsKR9hyxfWnQa9Ap1sYbP4XgaxxQ/7Wai/WIBJ6aFaSk4JhJ6tShTkkRx9Ur2Cn7Mmq
	 LyhoN/gEURLoxmmCpug9pntSdhqHpIp+cNdq7XJG2VZVV9aSYsXtd4BZ7U5SXOiezNPDo
	 ZJvV3AiUOiPbClYxypYK9SjIrcRrfY7ExODhAto3m7NTekpUBkwYWo+neIVAqG/BRnjml
	 QCUMkMH8xLgfboezbfwiqTloFWIeEpgbucSxG/7nh7w/j8l3yH6YaMfYI3si91JopCGex
	 OMg0UgszWbM9Dqrs+rBYCRszlsFG+X7zFreqkbd4+7KxwWdHSc1qp7YwdXrW2hxl0Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169503;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gX3mLQC7ilPSH2BMyBrpIhR73ceBwKOo+TT9X1EOLu0=;
	b=IIxBCljfAFjNb0hGl9ys8PkgqRhNRpraPAZExOyd9olOkQ3UHDfnhbUMD26IgGIB+EZC
	 IMTxfmQKroS9A1J6AMROsciZHK1JyG1vMmWax+veA97bYR0jhkQlPsvxKLmKWAvvqpx9o
	 8fgbD6+p0QRslCiRRj/WRyeoIHOplHejdSRPx/K/11YTwrh14uDmJGDbxNQ5UiJWGdiBU
	 40kIhUjlcZ6wCVQvEAYJ++Hska6g7rYOBqLRH/mPzv3BSscUB8jCUUOENNgEUYW3rbHE0
	 /SY8yAin5+KJz/dy8DPLEi+f95H9OPNLsFGLY4pZI/sS0c+id0oJXs7ILXj3/ML60Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=deLSRCTp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C775D60A2607
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=deLSRCTp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C0A1F000D3;
	Fri, 20 Nov 2026 10:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795169503;
	bh=gX3mLQC7ilPSH2BMyBrpIhR73ceBwKOo+TT9X1EOLu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=deLSRCTpxYpJPHrUizPrOQ+4IE+x9rzCbJRhp3B8Kt8ujsumOiNYgcZyxdvNIx+0F
	 HpylfNoVYtk9ARdYA5wbHh10CsL3cY2vae0vrCqyiubGAGt1hM5sGrxtsVP9lGD9HU
	 aZwM0uftYP/bOowFAqrd2knay7BeU9KOqbZh+vHxB3DcmOaTSi+2PPDsjhFjunh9+X
	 tgZrw2oquUcGbuAIj1PyZCTVJAldKJvMMmgfU+hunDGHHzNOO4pETlNbYqS/b9oLz+
	 hL0RDo24CHmarvGqyzZIxkt4K3MBk51cFW2yrYb5aTKg4OV4CcRoxmVR6aVcf0Nvox
	 ZawXSxqa7GA/A==
Date: Fri, 20 Nov 2026 10:11:39 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Ding Feng <dingf3ng@gmail.com>
Cc: Ma Wupeng <mawupeng1@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] mm/msync: return ENOMEM if len overflows for msync
Message-ID: <awAZLIPNrcHeNr6a@lucifer>
References: <20230321074035.1526157-5-mawupeng1@huawei.com>
 <20261120051413.46167-1-dingf3ng@gmail.com>
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
In-Reply-To: <20261120051413.46167-1-dingf3ng@gmail.com>

On Fri, Nov 20, 2026 at 01:14:13PM +0800, Ding Feng wrote:
> Hi,
>
> This patch seems to have stalled with the mlock discussion on v4, but
> the msync part does not depend on it: a range whose page-aligned length
> wraps to 0 always covers unmapped addresses, so msync(2)'s "ENOMEM The
> indicated memory (or part of it) was not mapped" applies.
>
> It is still reproducible on v7.4-rc3 (65e4fd942), and the patch applies
> cleanly there. On a one-page anonymous mapping p (arm64, QEMU):
>
>   call                              unpatched   patched
>   msync(p, SIZE_MAX - 4094, MS_SYNC)   0           ENOMEM
>   msync(p, 1UL << 40, MS_SYNC)         ENOMEM      ENOMEM
>   msync(p, 4096, MS_SYNC)              0           0
>   msync(p, 0, MS_SYNC)                 0           0
>
> Tested-by: Ding Feng <dingf3ng@gmail.com>
>
> Andrew, could this one go in on its own?

This is from 3.5 years ago, so please no :)

This doesn't really matter all the much and is a nice to have I suppose, so
let me send a patch for it to make life easier.

>
> Thanks,
> Ding Feng

--
Cheers, Lorenzo
