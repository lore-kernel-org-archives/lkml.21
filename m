Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013994;
	b=k0tPwAqqs7AOb5uk+b2AZaTyfLxCr0f1kYXemmtpWuPLpwD3o2nLdfSJuYqmR4618+4I
	 PyYmcUcsIGT22RHmQUDwbvhlyWblxwf73hCMltcIkADYyEYdCqxGMYVeMQyjj0p3/4FeA
	 noMZ0/ezNPpMyxmQS0DUM6/ddaB42bi9AmmjwQcIi5BGW+QbjRZBwKjfbpUxYLisBDnZJ
	 k4oVLD6h8xsUOuHLjBDrZzJWvwOW78lWjxhgpPvyx6HMz3SaJAhNNfOajB7GWgQJb45o3
	 B7kfreO+NJI2998ke1ZDgpLzuN/vQlgDUB5cmJz2XG4yHisTj84rJekkuIY1H0M3B6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013994;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UHA2gSMreq5NvV78ff3NkuJxnwpR2g2o/LhjS2wMs8A=;
	b=ZuRKKYg3A/sZtjvlcyN1Quk8/hK8kauNV2BgCeHJwPa7bKjL0xJwgJTnH4bmX42EwCPz
	 NRIgONWN83+hb0R1K0j5bAEJYBr/6JH/5B3oa9CB9oEzzKhcitxGdZfGgJT4lv1+aBpe0
	 6LZTNdN5Eg7kMUHHNaHlku5mbo5mhHRIDLh3p39NZaLpf2md1MdVYGz3hCzxb0U9Mdfj2
	 klUlN7CHHWPQgdCC9BLfScP+9QxEVo9pt4pYcagagRnFoagEMFK4kvoD+OKVGLR3kdoBm
	 1ULQOfrfGhpc7qwhDD6hGgV8Vxtogh4Hc4PXC9KE3bL22KMB/rQ4EA1In4vxHc6bYtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HNQAplAi;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59ADC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59ADC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HNQAplAi
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A55EC1477;
	Wed, 18 Nov 2026 06:59:50 -0800 (PST)
Received: from [10.163.128.4] (unknown [10.163.128.4])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66DC33F632;
	Wed, 18 Nov 2026 06:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795013993; bh=YniiAGhFs3f6RndqIyYnDs1IU7RZgamrSEyiFvFrpD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HNQAplAiLMoNveoYkT2JyRS41v1GiH0guf1kxhNgsdRvvQf0dUA2DKfmDGxR0PNwu
	 FhzNBR1nlLkEfVfyBrjg85ooYVWz1HickJ83DYukJrIarRHYwLEysWl/ynz+SXDJbu
	 7pboArrQDJja4AqSVQAiXmFjvdRYLVxq9adSxc+g=
Message-ID: <b2093f38-e3e3-494e-a27b-afc91c578053@arm.com>
Date: Wed, 18 Nov 2026 20:29:44 +0530
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
Subject: Re: [PATCH v2 1/3] mm/page_alloc: drop unused gfp_mask from
 zone_watermark_fast()
To: Joshua Hahn <joshua.hahnjy@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261116232346.788145-1-joshua.hahnjy@gmail.com>
 <20261116232346.788145-2-joshua.hahnjy@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261116232346.788145-2-joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/11/26 4:53 am, Joshua Hahn wrote:
> zone_watermark_fast() has not used its gfp_mask argument since commit
> 2973d8229b78 ("mm: discard __GFP_ATOMIC") switched the watermark boost
> check from __GFP_ATOMIC to ALLOC_MIN_RESERVE.
> 
> Remove the argument, no functional changes intended.
> 
> Reviewed-by: SJ Park <sj@kernel.org>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> ---

Note that this series:
https://lore.kernel.org/all/20261116125103.2894162-1-kas@kernel.org/

needs to use the gfp mask. So perhaps drop this patch? Otherwise we will
just make noise on the list by adding it back :)


>  mm/page_alloc.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 9e1261521b6a3..4d829e5eac49d 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -3675,7 +3675,7 @@ bool zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
>  
>  static inline bool zone_watermark_fast(struct zone *z, unsigned int order,
>  				unsigned long mark, int highest_zoneidx,
> -				unsigned int alloc_flags, gfp_t gfp_mask)
> +				unsigned int alloc_flags)
>  {
>  	long free_pages;
>  
> @@ -3877,7 +3877,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
>  		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
>  			mark = wmark_pages(zone, kswapd_watermark);
>  			if (!zone_watermark_fast(zone, order, mark,
> -					ac->highest_zoneidx, 0, gfp_mask)) {
> +					ac->highest_zoneidx, 0)) {
>  				skipped_kswapd_nodes = true;
>  				continue;
>  			}
> @@ -3897,8 +3897,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
>  
>  		mark = high_wmark_pages(zone);
>  		if (zone_watermark_fast(zone, order, mark,
> -					ac->highest_zoneidx, alloc_flags,
> -					gfp_mask))
> +					ac->highest_zoneidx, alloc_flags))
>  			goto try_this_zone;
>  		else
>  			set_bit(ZONE_BELOW_HIGH, &zone->flags);
> @@ -3906,8 +3905,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
>  check_alloc_wmark:
>  		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK);
>  		if (!zone_watermark_fast(zone, order, mark,
> -				       ac->highest_zoneidx, alloc_flags,
> -				       gfp_mask)) {
> +				       ac->highest_zoneidx, alloc_flags)) {
>  			if (cond_accept_memory(zone, order, alloc_flags))
>  				goto try_this_zone;
>  
> @@ -5245,7 +5243,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
>  		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK) + nr_pages - nr_populated;
>  		if (zone_watermark_fast(zone, 0,  mark,
>  				zonelist_zone_idx(ac.preferred_zoneref),
> -				alloc_flags, gfp)) {
> +				alloc_flags)) {
>  			break;
>  		}
>  

