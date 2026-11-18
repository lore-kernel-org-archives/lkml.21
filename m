Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017996;
	b=bZo1IvcZp3cDeF2yrvH3cFQOOMl4hvaNk9pfAlQgcGk15nvMs+wo9laXYndKMjB90s0O
	 C8h5g/+qWlYXUCqb0PHgt2wZjY6bQnXvxDtZ7yiaRDWRBXUTBoWa4iaOnPVur+5oKCWo4
	 BOcR+tRWoTMe977K59vRdqQMnw/4LTaHY5jSlXtI8koNFdnfXxriGiSEpPzAEJLoHH0O2
	 3sBvpBS9oOy2Qfe0wh6Qwod/LqYDtWsaKatSFBpKaDxKUkTlW8DdTAkWxPLhxI6BSPXQc
	 uKOIaqLY9GkKkqtZ37N0ab50LU8ismNVmYCbRXjDMAAR5WAVjzlnhiY9HayGu+2AF1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017996;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=xTCU+RoK1YPlyX0Acm2jpVyoheKI6U5GNoIs3mZD/FU=;
	b=dxXSK0aeFIYjC5RNkALy1GkXnQLryl+Y0Ke5ROvkAmGKxRfQiGWypA8pUrPpcBbfX2s9
	 60BodRMPLWDQemlH3Ay5oF38Q6Clv13zGi6lsJJboeeVcWNWSt7JKFoKziopqBc7PnzFJ
	 q4/XJdogpyS4jZAe1TnhVGWpk4/4xlTjLVAjlU5nU8S3STosKbw8cdJiG+94+SrhiDBLr
	 NGfFJijqe3pz6ApD1ZDBkQuMmIwM+f3Q/Y5BxiK+iiMA3+Hv3Yvn71+CP8jAhyJCyXrfO
	 3R6zO2LRrZVoeWmomLliVRACnkvMEOuyxksq28ove1PrfGOUQi1d3A9Hz0sq54CDRxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Lps8hBf3;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCE8606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FCE8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Lps8hBf3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E428C339;
	Wed, 18 Nov 2026 08:06:31 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9C3B3F673;
	Wed, 18 Nov 2026 08:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795017994; bh=MP+B+gRf4KcD50ABMTgIEP0ELDxT6FWXcXxgwQFXDHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lps8hBf3xR3dtzY/3UFzglc9UPB0HaBODeW9ds8xMelngDfVKsey6Ae2d9lnvbuz0
	 y5auJ8Q3w1PoXP5W3ueeIaFLOLB/+31P5TAdKEclcuV+s9axHrxBY5Iwi93zgbAiLQ
	 Gw4dAyU0monCTipOJYTL3fw6qimV6iSa+CL6Kql8=
Date: Wed, 18 Nov 2026 16:06:29 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+527fed49e5b988882c9a@syzkaller.appspotmail.com,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] mm/slub: don't let kmemleak report rcu sheaves
Message-ID: <av3NBYxYXyYk_tjS@arm.com>
References: <20261113151837.123795-1-ngocthang2710.1999@gmail.com>
 <0e626675-c6f9-40d7-a4ae-de069154ada2@kernel.org>
 <avzduIJralOKBgxK@arm.com>
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
In-Reply-To: <avzduIJralOKBgxK@arm.com>

On Tue, Nov 17, 2026 at 11:05:28PM +0000, Catalin Marinas wrote:
> After some back and forth with claude, I think there are a couple of
> places where kmemleak fails to track. Since commit 9aec2fb0fd5e ("slab:
> allocate frozen pages"), kmemleak no longer scans the slab structures in
> scan_zone_pages(). We could do something like below:
> 
> diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> index 20c0eb41c873..47446af5fc9f 100644
> --- a/mm/kmemleak.c
> +++ b/mm/kmemleak.c
> @@ -1875,9 +1875,13 @@ static int scan_zone_pages(struct zone *zone)
>  		if (!(pfn & 63))
>  			cond_resched_tasks_rcu_qs();
>  
> -		/* only scan in-use pages belonging to this zone */
> +		/*
> +		 * Only scan in-use pages belonging to this zone. Slab pages
> +		 * are frozen (zero refcount) but struct slab holds pointers
> +		 * such as the rcu_head of a slab pending rcu_free_slab().
> +		 */
>  		if (page && (page_zone(page) != zone ||
> -			     page_count(page) == 0))
> +			     (page_count(page) == 0 && !PageSlab(page))))
>  			page = NULL;
>  
>  		if (page && first && page == last + 1 &&
> 
> 
> I don't think this is specific to sheaves, SLAB_TYPESAFE_BY_RCU may have
> a similar problem, though I don't remember to have seen such reports
> yet. It should be covered by the above.

This still leaves a hole. Scanning the slab descriptor recovers the link
through slab->rcu_head.next, but the preceding callback can also be
free_object_rcu() whose rcu_head is embedded in a kmemleak metadata
object allocated from a SLAB_NOLEAKTRACE cache. This would break the
chain.

So I think we should keep the original kmemleak_not_leak() patch at
allocation.

> However, this only fixes the links through struct slab. The rcu list can
> also go through a sheaf allocated with kmalloc_nolock(), which kmemleak
> doesn't track. Any callback queued after it is missed (together with the
> objects queued in that sheaf that may come from ordinary kfree_rcu()).
> When kmemleak is enabled, could we simply avoid allocating sheaves with
> kmalloc_nolock(), i.e.:
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 45e077c7526c..13b8e57d6dae 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -6278,6 +6278,14 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj, unsigned int free_flags)
> 
>  		local_unlock(&s->cpu_sheaves->lock);
> 
> +		/*
> +		 * A sheaf allocated with kmalloc_nolock() is not tracked by
> +		 * kmemleak, so neither its objects nor the rcu callback queued
> +		 * after it would be scanned. Fall back to defer_kfree_rcu().
> +		 */
> +		if (IS_ENABLED(CONFIG_DEBUG_KMEMLEAK) && !allow_spin)
> +			goto fail;
> +
>  		/* Don't wake up kswapd, it will cause deadlock under pi_lock */
>  		empty = alloc_empty_sheaf(s, __GFP_NOWARN, alloc_flags);
>  

For the objects queued in a sheaf, rather than the !allow_spin fallback
above, it's simpler to move the kmemleak_ignore() call in
kvfree_call_rcu() before kfree_rcu_sheaf(), so they are treated the same
as on the non-sheaf path. kfree_rcu_nolock() currently only has a kunit
user, freeing kmalloc_nolock() objects that kmemleak doesn't track
anyway.

So this second hunk isn't needed either.

To Vlastimil's earlier point, kmemleak could follow these rcu chains
instead of relying on kmemleak_not_leak(). However, with chain breaks at
any _nolock or SLAB_NOLEAKTRACE object (including kmemleak's own
metadata) and walking the rcu callback lists directly means digging
into rcu internals. The annotation is easier to maintain.

(got lost in all the slub code, it was much simpler 17 years ago when we
merged kmemleak ;))

-- 
Catalin
