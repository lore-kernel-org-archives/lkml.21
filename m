Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104990;
	b=d0w1cf4WHUgWxJsHxMIeSKtk6dWe32aV3o92JFSamuuwbhv6qXWEP3DQFmbhqNlT8KTm
	 BlxEmJ6aSDQmJJGBgnKq7phP65hy3lMT/OurvoC7ORoxZ7KxwJGlFInQ8b9JwMaReiSIn
	 A+VVlAn+wFIfCNiVjmIx0O5wvnfXdP3meZ/+nNTJ6hFAhn3SforkjLFtYoycwV98/NcHD
	 6hbt4zQoZTgDMIK2eCMiQIiTOT+qKQO2O1uVBLVIQVweROoKHhHdGQgSvms3SESXyu1Yk
	 yOuOvVaD8tzjl9kPM8woaxGo+Hs0Ilk5yIIrTkMHbmggdO33nQRDQmZw5wKoMnptBXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104990;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=g7Xv7QGvpqlF0rgc7dliYwjjlUALvSkvyb8DRMu/inQ=;
	b=uqmstQItaKWQ0krc3Eo2s5gZ4t8Y0TgOkU5uYthtSOtjCAzLHQ6j+out++dAzt5L4bWK
	 iO2xiSrlauXCxEVdKdC/SkpIOIdM9SsDvkS92cCDLiMjdXt1OyB1oC483DfrM5EITWBSr
	 OkFojHkXJE1NP+R/cWkmE4uygCVkUguyT/iyMQcnCD0NGxHfB1cKd2c1NI3TLXCJAdlOx
	 fQZPV2+1usORP8y2K1C6peHHaP+HjRAEc74U+XkLXqEqVMPThZwwQ+bxXsxK+jiX/Ql1C
	 lihsm9QJFC6XL4VamKT5p0OK9oL1riznzq9hA6QtydMJrPJHiNj3sDjbRc/yfA3xtKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QXx54Ws1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70D8606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QXx54Ws1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C621F000C4;
	Thu, 19 Nov 2026 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104990;
	bh=g7Xv7QGvpqlF0rgc7dliYwjjlUALvSkvyb8DRMu/inQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QXx54Ws1TRvcHlhHVzvMxz7gqy3TPeuvdZRpsAwjajZN7GcX5hit+wBUGVIkg+MIs
	 M50LQaiO7e1FLrCMwsUteNL82pgH3VP/H9le3Xt8zEV5vKMtEYBwAXLlcC1jzuFyAW
	 lw+OFZ7bqVZeym7Pq0th9dWs20oLF76zhMOpdipaA+EfHVdiz2cUlNAAG+Umr3eDcr
	 T1pxE94QhIflkauEqpKT6u/JsHm3hb/hkOMCVBt2Q/8FMpZqh1RVoCHwfgWnfD5VNi
	 BdUIpgb0kUR+v3YVG7ZFJu47ffpbUYhHdH43sEhXd+uYGEfH2+cKBmgmvgQktVPt7V
	 Gp+tnWGQDlWlA==
Message-ID: <81418de6-3c5e-4f5c-a447-98f338f5096f@kernel.org>
Date: Thu, 19 Nov 2026 17:16:24 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/gup: unshare-check every page of a pte batch
To: Rik van Riel <riel@surriel.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>
References: <20261119105701.3f57ac54@fangorn>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261119105701.3f57ac54@fangorn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/26 16:57, Rik van Riel wrote:
> A write pin over a PTE batch can hand back pages that a later
> write fault replaces under the pin holder: the process writes to
> the copy, the holder keeps the old page:
> 
>     pin holder                          process (mm owner)
>     pin all 16 for write
>       batch passes unchecked

All PTEs must be writable or all pages must be PageAnonExclusive

>                                         write to a tail page
>                                           fault copies it elsewhere

Which copies only if !pte_write() && !PageAnonExclusive

>     read pinned page -> stale
> 
> For every FOLL_WRITE call the helper returns the whole run on
> the head page's credentials, never reaching the per-page loop below.
> After fork, a FOLL_FORCE write unsharing only the head leaves
> the tail pages read-only and non-exclusive behind identical
> PTEs, which batching (PTE bits only, never the exclusivity flag)
> covers at once.
> 
> A page pinned for write must be exclusive to the pinning process,
> and one vetted PTE proves that for one page only. FOLL_GET and
> single-page FOLL_WRITE keep the shortcut; multi-page callers run
> the per-page check. Writable batches and GUP-fast are unchanged.
> 
> Without this fix, the pin holder sees stale page content,
> with it the pin and program address map the same page.
> 
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
> This fix applies on gup-7.5-ptebatch in mm/core.git

I was confused when I read the above.

I fed this to Claude and it told me

1) The path it describes can't happen.

2) The patch fixes nothing.

3) The changelog contradicts itself.

But you said that you had a reproducer. So now I am even more confused. :)

Can you share the reproducer and against which branch it ran?


-- 
Cheers,

David
