Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697676;
	b=ZyiO6/rH+r1XEChyltHEMvx2kBJTBbqStCoOhu4CylovfanPblKsyHO0fR1XYnxfzwE2
	 Cz1SzulEMO6XTtMlf20op3jr7RhZmnYOZleNuxt0kLxzS/YfGu99CZx5Pv2HMjggebRT/
	 HjNrZLmQ8cl7ChLMOftFPT2Tlo7CVUDDZvPeUD7xsQ/rzogNUgTXR3OS3zdUTWa2PgWrR
	 /cmhU0ZIq5BkRN4MMWOeXw/649B2l4+6pZK2tQQVFMtou7c8lCkfctmpqdpYX3oQg/f/p
	 G2oMbB+qB3CabzLHBR4efad92yEA1EnTUChc5BmxUJ8mEofRbNlc29yoIP447O7BXsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697676;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=zkWfopv7ojWziK2+hPK7yInVZt0kcWSrrg5OSpM0fCg=;
	b=OA37I3ckaCf0hgzzwBJrQZDyON/GVYJJPbZkM+cg8xtbd0sGQxxCD5GJBAOcDiHMuN2k
	 KCqn5J3s7327bciaAEMV49gfSqTm/+NWU8f87JOJvsJkGqFXD8GFr+fEJVGlCHAzk7qdr
	 yCVcQZYI5FyX18G28KzOBSIdix0qg8ELuIXjT47wPRqn9HmwEAL5d2TOaOt6Rhhpo4htn
	 NjsFR6V7khbWfh28KMnYp0h1l88zF0Mnd2Ru/RJl+FGTKjDbR9lj66Bcq85h1ae9A1KwP
	 OBitzqF4OUiaEEdYlFU/mjc+lcvw6ugFI0X1aa7yIzsntDY1Dng0aUo+YqeEWC+BNUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ji0cBEjq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28B1606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ji0cBEjq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0921F000C0;
	Thu, 26 Nov 2026 12:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697675;
	bh=zkWfopv7ojWziK2+hPK7yInVZt0kcWSrrg5OSpM0fCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ji0cBEjqr0ypcXtP2ymmf+/8EDlVCQib1En2BfROUfVed47Smhhbtd/6Bunz0iuAR
	 aiEnf11vay4I9JgBMWHY0HNnpLxAwvyUwlyxODiz37/lntcL5d9GP9xiYM45+5+9lm
	 dUbk7Lfv2KrKDb4X2wTKONgbdRSF+OlPe75tM0z8gHlAOk+ppC4hS3c9oL/FnSXkcY
	 0SqmRCocXJNwEQYvTSH1Xda7BrAGeFmmHd3Nw/E+5YjTTvP3wocmFwYITWTOofYwlc
	 mO0c3ASTqe27J5FMjwg9DbvbrkanVfyNYdfo5I4vo1s8n1wyFF4mQFfYeV1hdQW5AD
	 WgMMR2A27QZ9Q==
Message-ID: <98fecdf0-6409-4499-90e4-63996f33db90@kernel.org>
Date: Thu, 26 Nov 2026 13:54:26 +0100
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
Subject: Re: [PATCH] mm: free the swap slot of a dirty swapin folio
To: Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton
 <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Barry Song <baohua@kernel.org>,
 Kairui Song <kasong@tencent.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Yosry Ahmed <yosry@kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>,
 Baoquan He <baoquan.he@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Youngjun Park <youngjun.park@lge.com>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>
References: <20261126094318.244973-1-alex@ghiti.fr>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261126094318.244973-1-alex@ghiti.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/26 10:42, Alexandre Ghiti wrote:
> do_swap_page() frees the swap cache of an exclusive folio on a write
> fault only. A folio loaded from zswap is dirty: zswap drops its copy on
> load, so the slot no longer holds the data and only reserves swap space
> until the folio is reclaimed again or its owner exits.
> 
> Such folios add up, and they are expensive to free at exit: on a large
> production workload, the exit time doubled when zswap was enabled. A
> third of the increase comes from the folios left in the swap cache,
> each costing about 3x a resident page to tear down; the rest comes from
> freeing the zswap entries.
> 
> So free the swap cache of an exclusive dirty folio as well, so that the
> slot is released at swapin, as is already done on an exclusive write
> fault. The folio is dirty, so it would get written out again anyway:
> the only cost is a new slot allocation on its next reclaim, which write
> faults already pay.
> 
> On the production workload, this patch removed that third: the exit time
> decreased by about 15%. On a simple microbenchmark, 4 GiB of anonymous
> memory in a memcg pushed to swap, read back, then SIGKILLed in a QEMU
> guest (mean +- stddev of 9 runs):
> 
>                      base            patched
>   exit time    989 +- 24 ms       502 +- 28 ms   (-49%)
> 
> The cost is paid by folios that keep cycling between zswap and memory:
> each reclaim allocates a new slot and adds the folio to the swap cache
> again. On a kernel build in a 600 MiB memcg (-j4, defconfig), this is
> not measurable (mean +- stddev of 5 runs on bare metal):
> 
>                        base            patched
>   time (s)        592.4 +- 1.1      592.4 +- 0.9    (+0.0%)
>   sys (s)         256.6 +- 1.5      257.5 +- 1.4    (+0.3%)
> 
> In the worst case, random reads over 4 GiB of anonymous memory in a
> 3 GiB memcg, so that half the reads are zswap read faults and the task
> spends all its time in the kernel, throughput drops by 1.1-1.4%
> (mean +- stddev of 5 runs on bare metal):
> 
>                        base            patched
>   reads/s, 1 thread   37310 +- 182     36889 +- 77     (-1.1%)
>   reads/s, 8 threads 291937 +- 802    287954 +- 373    (-1.4%)
> 
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
> 
> Notes:
>     Previous discussion:
>     https://lore.kernel.org/all/CAGsJ_4xBtKGqXFP4zvp+Qn+tb4X7aCvXn+wqDqot_cXR92DjhQ@mail.gmail.com/
> 
>  mm/memory.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index d477a4f986bc..dac0f0a24bc7 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4711,10 +4711,13 @@ static inline bool should_try_to_free_swap(struct swap_info_struct *si,
>  		return true;
>  
>  	/*
> -	 * Free the swapcache only if we are the exclusive user and
> -	 * this is a write fault.
> +	 * Free the swapcache only if we are the exclusive user and this is a
> +	 * write fault, or the folio is dirty: its copy in the swap slot is
> +	 * stale then (zswap loads are exclusive and dirty the folio), so the
> +	 * slot only holds swap space.
>  	 */
> -	return (fault_flags & FAULT_FLAG_WRITE) && exclusive;
> +	return exclusive && ((fault_flags & FAULT_FLAG_WRITE) ||
> +			     folio_test_dirty(folio));

Why not more readable as

if (!exclusive)
	return false;
return (fault_flags & FAULT_FLAG_WRITE) || folio_test_dirty(folio);

But ... isn't this zswap specific? Why do we have zswap specific stuff in this
common code?

The comment already gives away that something is not quite right here.

-- 
Cheers,

David
