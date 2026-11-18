Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995450;
	b=FY0UPiNqqComQ5sUrEVbaSqBl0/svqzP/oBwNf86bQiIxdy2cMjdpS2zgupez2H7o2Ye
	 FnALNdoJ8gWKzB4vBbzk2EXc8MACAp1XA1LALYFGUvjNb99boEvRXKRglEfJmOMSZrTlt
	 09q9/vw9+ukvf2Q9N0EszaxU1wUk2iOROtOJtPeV7gaWUfDPpews7v49kdk9S9fhShb8d
	 0m9PZ4GHig0n8ETNi7akqkVRxy3ME83wr3+YOwysgt3BMVs9QzMCqO7ffaH7CURvmLZy6
	 b+aYPfdzDqiKSnTG4kC6MHMq8TKyb8uRM32cirfthHkdexvAFKHnA1NIshCk7s530kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995450;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sip8MOxQ14qtH7OEbhwEmEcfkAVdDDdsrxzfAF6moMs=;
	b=YbQgHeDsdA7KezzQLfL+SYi+9ZioqP90B/1kA4xBIJuWHS6Ny47gTVh8TUElcR3Le2vP
	 G5UVuVXvfT7aUGBjGuQHdw0oQedGfuhfRdNZyL+R23+N+vPp8BuKJJIx3d45knoJdtBO4
	 anDtfsAyCKAaUPqCcsp+8SeLYXpa+l0hwBRgfIXGylzdDAFMsN5I+Gftz73I4jhXkARyr
	 Nk+S7Aj4Nebl7bI0gCIC+OH8V2Ap5M33p/aPNQpL5T77WTYTHN6pcX4QVzbzgGgpcPCk9
	 18NJPYFzy66zeFaDdWTF0lGmN2XyBndnbyPespb20SAgP5/5Yd2qawQq9y/D+wUn/fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fEUuEoZt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DD0606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fEUuEoZt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930381F000C4;
	Wed, 18 Nov 2026 09:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794995450;
	bh=sip8MOxQ14qtH7OEbhwEmEcfkAVdDDdsrxzfAF6moMs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fEUuEoZtj+T1g5XxEGGea51aJtI40E5FEa7gGfdXuh1rCBAC7rBu3c+Nlu26PlDdc
	 MNrTLNG67SW3oSTyQroJtE1hx6PEieY7XQWdQnUxtzt0qRZNBQNxjeiOxZmDiC27jI
	 nnKH8xHgBuIXu3527CXofm7N7BfdGORGV3QzdhRPez/Yl/gTrEqFOQsjsfAu2rwh8Y
	 xG93fZEyE2FNWSJjZDXhZmmI2b+1HuTSwDzYLFQ1jRi9mfBcU2a05IAc5/DjCM3+jL
	 +DeLJfZOeoPoCVYPkOdAaey5YORIfZpVYb9CTH8HB9EKA6iO9qWo3IYpMmjFaCHQV7
	 1lv9H5GE9rO2A==
Message-ID: <17456889-f94b-438f-85b3-45e9d51272ee@kernel.org>
Date: Wed, 18 Nov 2026 10:50:44 +0100
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
Subject: Re: [PATCH] mm/page_alloc: don't undo another caller's pageblock
 isolation
To: Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261118000014.1474617-1-d-tatianin@yandex-team.ru>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261118000014.1474617-1-d-tatianin@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/18/26 01:00, Daniil Tatianin wrote:
> start_isolate_page_range() fails with -EBUSY when a pageblock in the
> range is already isolated, after it has undone the isolation it did
> itself. Commit 2c7452a075d4 ("mm/page_isolation.c: make
> start_isolate_page_range() fail if already isolated") made it work this
> way, so that users of overlapping ranges, such as CMA, memory offlining
> and gigantic hugetlb pages, can use pageblock isolation to stay out of
> each other's way.
> 
> Since commit b2c9e2fbba32 ("mm: make alloc_contig_range work at
> pageblock granularity"), alloc_contig_frozen_range() handles this
> failure by jumping to its common exit path, which calls
> undo_isolate_page_range() on the whole range. What is still isolated
> there at this point belongs to the other user, so this takes the
> isolation away while that user is still working on the pageblock. The
> page allocator can then hand out its free pages again.
> 
> Return right away instead, like offline_pages() does when
> start_isolate_page_range() fails.
> 
> Fixes: b2c9e2fbba32 ("mm: make alloc_contig_range work at pageblock granularity")
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> ---
>  mm/page_alloc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 12fac9084c48..151a8d64783d 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -7335,8 +7335,9 @@ int alloc_contig_frozen_range_noprof(unsigned long start, unsigned long end,
>  	 */
>  
>  	ret = start_isolate_page_range(start, end, mode);
> +	/* After a failure, whatever is still isolated belongs to someone else */
>  	if (ret)
> -		goto done;
> +		return ret;
>  
>  	drain_all_pages(cc.zone);
>  

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7d9c29ed8feec8bfbe5e5f673ba2b5926da11375

-- 
Cheers,

David
