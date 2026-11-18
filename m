Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016583;
	b=hrPVs7hvvO+vt11S70HG0WWsjwtU3vLcrWie7MnquDMSQ9eelxwRVAqdwmGNHYK7rCa7
	 cB2ZadihpVsGWfivAGV1UmbvPSP30sYMIokLFO4KQpmCco/K9zhXk07X2X8CR2bI0fQ6A
	 b8j9ComvLDG5zJlvaX/i6N3B2zVGwS6Nkg+0JNPCcmjfYiWqmWLmB/3RAGNNSM74Hbzbt
	 4s3HimBrKRkVEMQ/cWyxNBEfRFgnF7jaLuVOe2M1WF54fl9VfeE3YA9u+pqmw/06prZ/5
	 MmnjOvG3szenOF1eZCcW9um/+VrzsiCZL6Dh4dc/UFAVQftH20BnOrW4AfCJmMOQmVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016583;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=KQ5oaAo2g4AxeKoLp9ICVB4rcwj10IiXbO1gaMudEFI=;
	b=JjZsjnNrOZ1MHfdNCYkotnE0quzgIwHgZL0zMs3jV3pyjPrPDcwQ1f6FICVZ2LLHLD8l
	 1+Cam8C7YWwoZeeUMZ/dmEf0ZD5t1027YY50LK2KT+GRpjI5Um/cRYuFFkAeF9RqhtYos
	 Nq2Nt3n/uMrXYzPtunb9TUEBgpR7LZGxP+k3YL6WujDDZLEilp5s4r8DOEDpBXqrX4qtk
	 WF2DXnAx72huszRCjUq2dzFdfziNNBH9Ejd2ujpEEfccLw/JsFWndY9+7CKjwGu5BOhbp
	 UlWday+LEFTOr2+LbTB4piyt/znypCSKtzMWDCCnvUykelnWZC3L49jyhMTp7uGpOEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AicKIVyW;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DDA606A338
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89DDA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AicKIVyW
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3EF71596;
	Wed, 18 Nov 2026 07:42:56 -0800 (PST)
Received: from [10.163.128.4] (unknown [10.163.128.4])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DFFF3F632;
	Wed, 18 Nov 2026 07:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795016579; bh=R2COxjpCbGZ0nol+4Q+5ncT7lyJrH77FgloWD2fkEvk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=AicKIVyWmUxwI+xckwdtAChNrjacuR/Jb4h/8E753JCvDT0wnlzzDOpEHF84OtlUB
	 wCbzIaNhRlizhRB0hP8nDSAFjbi0niDwlJ2o+LJ0NyabT63GvPNzh3sKBHL3Lwd2IY
	 wRu8EJIQnrwTL9Lc9Ov7xtwi1RmPD2cGi1KDfD2w=
Message-ID: <7770de02-3f4a-4db8-9e02-5e95b148b809@arm.com>
Date: Wed, 18 Nov 2026 21:12:51 +0530
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
From: Dev Jain <dev.jain@arm.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Kiryl Shutsemau <kas@kernel.org>
References: <20261116232346.788145-1-joshua.hahnjy@gmail.com>
 <20261116232346.788145-2-joshua.hahnjy@gmail.com>
 <b2093f38-e3e3-494e-a27b-afc91c578053@arm.com>
Content-Language: en-US
In-Reply-To: <b2093f38-e3e3-494e-a27b-afc91c578053@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

+ Kiryl if he has different opinions

On 18/11/26 8:29 pm, Dev Jain wrote:
> 
> 
> On 17/11/26 4:53 am, Joshua Hahn wrote:
>> zone_watermark_fast() has not used its gfp_mask argument since commit
>> 2973d8229b78 ("mm: discard __GFP_ATOMIC") switched the watermark boost
>> check from __GFP_ATOMIC to ALLOC_MIN_RESERVE.
>>
>> Remove the argument, no functional changes intended.
>>
>> Reviewed-by: SJ Park <sj@kernel.org>
>> Reviewed-by: Chris Down <chris@chrisdown.name>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
>> ---
> 
> Note that this series:
> https://lore.kernel.org/all/20261116125103.2894162-1-kas@kernel.org/
> 
> needs to use the gfp mask. So perhaps drop this patch? Otherwise we will
> just make noise on the list by adding it back :)
> 
> 
>>  mm/page_alloc.c | 12 +++++-------
>>  1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index 9e1261521b6a3..4d829e5eac49d 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -3675,7 +3675,7 @@ bool zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
>>  
>>  static inline bool zone_watermark_fast(struct zone *z, unsigned int order,
>>  				unsigned long mark, int highest_zoneidx,
>> -				unsigned int alloc_flags, gfp_t gfp_mask)
>> +				unsigned int alloc_flags)
>>  {
>>  	long free_pages;
>>  
>> @@ -3877,7 +3877,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
>>  		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
>>  			mark = wmark_pages(zone, kswapd_watermark);
>>  			if (!zone_watermark_fast(zone, order, mark,
>> -					ac->highest_zoneidx, 0, gfp_mask)) {
>> +					ac->highest_zoneidx, 0)) {
>>  				skipped_kswapd_nodes = true;
>>  				continue;
>>  			}
>> @@ -3897,8 +3897,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
>>  
>>  		mark = high_wmark_pages(zone);
>>  		if (zone_watermark_fast(zone, order, mark,
>> -					ac->highest_zoneidx, alloc_flags,
>> -					gfp_mask))
>> +					ac->highest_zoneidx, alloc_flags))
>>  			goto try_this_zone;
>>  		else
>>  			set_bit(ZONE_BELOW_HIGH, &zone->flags);
>> @@ -3906,8 +3905,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
>>  check_alloc_wmark:
>>  		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK);
>>  		if (!zone_watermark_fast(zone, order, mark,
>> -				       ac->highest_zoneidx, alloc_flags,
>> -				       gfp_mask)) {
>> +				       ac->highest_zoneidx, alloc_flags)) {
>>  			if (cond_accept_memory(zone, order, alloc_flags))
>>  				goto try_this_zone;
>>  
>> @@ -5245,7 +5243,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
>>  		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK) + nr_pages - nr_populated;
>>  		if (zone_watermark_fast(zone, 0,  mark,
>>  				zonelist_zone_idx(ac.preferred_zoneref),
>> -				alloc_flags, gfp)) {
>> +				alloc_flags)) {
>>  			break;
>>  		}
>>  
> 

