Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036882;
	b=sRYi7E6nWMejM+QoefVATbvco0YpOjgHbbMvXz+i6Rymcd5wH/FmEVdDx4d6KJAAxFAR
	 nZLHn4cSJefeD7dzO4GgDP5HVy93aE9Bo1/5ZmRrHIOnw3k3HU/omG1N9XY46ZdNbyEJu
	 SgzBUQ6pLiRyM+YgdgAtkmwDVkLvHjK8vlL/4spHRwcAwE5oe1Zl18LCrbDN+ajvh9R3I
	 5NU4ns6NsTEdoygbE+NW/947X805WsfcNiHJqcUnUHRtn20eh9MYOL4WIA9nnBjYl+t1c
	 /I906j55sa4UHLlhDo982IQGQGYD9eTB7tP90PY4Vr5uin6IVpnm7PD/WMUObBcLOrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=b5FVwTr0+ioK5OPo7LsDsfPzhpde0ciar5bplP2bt1E=;
	b=V+kY+N+RxTm3jGNLwPGygfrPMAb6DcLXH6jaW1j5tE7Jo/uI2RS1pqFpXBHoayNLQQOK
	 AB/GKEVCWiOMzsll1BfXqSPrhlM3u+G52pg3CTb8mSHoeiKz8F/pi1G/22uVTCntbxuTk
	 ckhK7cQcmiaqUije5UGlwSHWFwdQFKLPjO0Y03i7D7mHaB06MBpljbKPrWtTDagU+tgj1
	 b9shEwgmExuCCUzG5F/lkGAT2M49zvhTL/MLVqaJdY0TsaA21j4/AxgQYkvmrLdfYSgYM
	 QfOPBPN0iF6Zyh3A/fkreKJdtbOLKO8EOx0iZ80KwcVtedxyJdiejSYQLUCTzVCkuQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g4P/U7/X";
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8615B606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8615B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4P/U7/X
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-48eee44b908so910308fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795036881; x=1795641681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5FVwTr0+ioK5OPo7LsDsfPzhpde0ciar5bplP2bt1E=;
        b=g4P/U7/X5JVhDKpXx+aF4gM6CKLZQ22DNGcRH2WWTXxm47faYrl7kOKFig8G+q58HC
         RvDqK1AH3G6oOh/e7OEpKEAHdFQfH+YYSinYBekGfGjpJkuNLgj3xIidkjkojcPbIJl4
         1Twj9cQMCp8hT4b/ETE92diaEenFdQdcCVWDuI3gMXVAKNalaWCBJWoGfns4yWzWKq0W
         MSX2QM4G+NtJgNGy1fuZ76VAcUx4b0/DjkEO1NY85o2NlWzf4lwF8XKqfsVwVXEk8ZU2
         Oahgdqh2RKqfq9z+1nraYWGzn0qvFCIDAuKZPC1xcLlhzq5fGq7hAxsdhgxjl9QDb/Q7
         qDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036881; x=1795641681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b5FVwTr0+ioK5OPo7LsDsfPzhpde0ciar5bplP2bt1E=;
        b=1MBeOGA9xco6Yvi4Co+xYPvJ1VmUrWKqGb/ZU6hudg4Cn0pg1BmU90/tpGrPKPsXCf
         Piumo+F2HGpr+OTe79kHz50tKUJns5D7P4KCVM+nW87YsimXV59a8TFFruhIAUAJ6FZ8
         ZTz3SJCSFc6GhU0w/YyMyldNBT9fNKnyfP7bu5ODitky3lyWQoYTpovM7gXIdD3CLXba
         12M0Y3qXKjVrXZP9ASowjtUHL7xt+3PRY7Ru9sxvMCzd29nXy7sV/BKAXhY09JkDfJ2n
         lBUjZqaTzTjkFvQJ6OrEZiMvr99Pjli//ba0uPEc8x0gVHRvBpkWbltG/UK8WgYDipQX
         ZQPQ==
X-Forwarded-Encrypted: i=1; AL+hErEFUqirjlXRisMZY+6tM8PGRcvUVIsm9DOdp+XhpfxcHgda6qAtP9mkSvBvZNQlc6Ilsfpz5qJV/dpAUCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R1hYLqwD79ZsAbWtqwEx/KipL4Gs3+lnzkH0KXCgcbB6eufV/
	ZI2ji3YVHvWeIDyaAGeKC3T4szxlg6exre6IKCUBSctVafdfk8pnYUpd
X-Gm-Gg: AYBFou2Evnyi9oPryoNFSuFkR7ILtN+i8LPzvP5bQAN+IIG5p9MWPgLomv/hMA79hg2
	9Ca4UTW2qJoNJjpDJcW+mzutp/k2kInBrZ0cny/vnPH4MW83y8GIVnFljFyshDysIAjiuP0TD8J
	SlLCVtYfpHJuP8szRjNkTikibyt2xJm5mgiFQKrgLgGPqnYqgePuZxbzQCfu1lCDH8a7fq8Hc3I
	gKAHqnJ7kxsRZUzoVrrM9/NB7r+66/mh6Cmiyq9bmqZdsh3tJyVo9eJ7yNdZpCUumXtZ4RJgHjE
	wxsoe8IXmlm8q94O+5WSs1fDSD5ht19zBeOi1shxlGi3VaJOkUEhNJux7TmvSFmlL2vVqwVaxEg
	j1ovCzLrg/4ssjZ5b6/qmNiuc/tyrBhYKBjLOkJtZZ0XnbAmAHM8f6SKciAVPtmx4gaP0plXdaz
	Cmz42euQB+K2A6ZeShaknvEsHUZm0A0b5F5U1rSihNJOJE92noo2l17ZisHDT/oEXPjPfLgQg4K
	tLo/Bt8YE2zleWFLGv3/7GA0WhlKsELUNHtNxtbjKsD1RljhpPEbKw453KX1yrnqU/CBw0w9WMn
	2BpFjxQDCNyctb4DZZh0WiqqO6aYoYaFrQV1zIpKyeH642A9+UtM3twPURCC
X-Received: by 2002:a05:6870:262:b0:4a7:6c8a:f47f with SMTP id 586e51a60fabf-4b75d26dc2fmr3227807fac.37.1795036881334;
        Wed, 18 Nov 2026 13:21:21 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:4f::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b744928389sm3266157fac.12.2026.11.18.13.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:21:20 -0800 (PST)
Date: Wed, 18 Nov 2026 13:21:20 -0800
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v2 2/3] mm/page_alloc: move the kswapd node skip check
 into a helper
Message-ID: <av4V1AzQXSZbtSei@devbig011.atn3.facebook.com>
Mail-Followup-To: Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261116232346.788145-1-joshua.hahnjy@gmail.com>
 <20261116232346.788145-3-joshua.hahnjy@gmail.com>
 <bf8692ab-f5b6-4ffe-b5ad-02ad59182cc0@arm.com>
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
In-Reply-To: <bf8692ab-f5b6-4ffe-b5ad-02ad59182cc0@arm.com>

On Wed, Nov 18, 2026 at 09:16:51PM +0530, Dev Jain wrote:
> 
> 
> On 17/11/26 4:53 am, Joshua Hahn wrote:
> > get_page_from_freelist() checks many conditions for each zone, often
> > with a big comment block explaining the conditions.
> > 
> > Move the kswapd check and its comment into should_skip_kswapd_zone() to
> > make the zone iteration cleaner to read.
> > 
> > While moving this, also resolve a checkpatch warning which complains of
> > a waitqueue_active() call with no corresponding comment explaining why
> > the lockless use is OK in this case.
> > 
> > No functional change intended.
> > 
> > Reviewed-by: SJ Park <sj@kernel.org>
> > Reviewed-by: Chris Down <chris@chrisdown.name>
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Tested-by: Chris Down <chris@chrisdown.name>
> > Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> > ---
> 
> Thanks looks better.
> 
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> 
> But see below.
> 
> 
> >  mm/page_alloc.c | 47 +++++++++++++++++++++++++++++------------------
> >  1 file changed, 29 insertions(+), 18 deletions(-)
> > 
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index 4d829e5eac49d..43929faffb989 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -3785,6 +3785,32 @@ static inline unsigned int alloc_flags_cma(gfp_t gfp_mask)
> >  	return ALLOC_DEFAULT;
> >  }
> >  
> > +/*
> > + * If kswapd is already active on a node and the zone is below its kswapd
> > + * watermark for this request, keep looking for other nodes that might be idle.
> > + * This can happen if another process has NUMA bindings and is causing kswapd
> > + * wakeups on only some nodes. Avoid accidental "node_reclaim_mode"-like
> > + * behavior in this case.
> > + */
> > +static bool should_skip_kswapd_zone(struct zone *zone, unsigned int order,
> > +				    const struct alloc_context *ac)
> 
> Make this inline? This is the very hot page allocator code that's why :)
> I may be overthinking but in page_alloc.c I do see functions with similar
> size being marked inline.

Very reasonable! I think it's just a few checks and bitwise comparisons
at most (apart from the zone watermark checks). I'll make that change.

Thanks Dev!
Joshua

> > +{
> > +	unsigned long mark;
> > +
> > +	/*
> > +	 * This means kswapd is asleep, so don't skip the zone. This is a
> > +	 * lockless check, since a stale result only affects zone selection.
> > +	 */
> > +	if (waitqueue_active(&zone->zone_pgdat->kswapd_wait))
> > +		return false;
> > +
> > +	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
> > +		mark = promo_wmark_pages(zone);
> > +	else
> > +		mark = high_wmark_pages(zone);
> > +	return !zone_watermark_fast(zone, order, mark, ac->highest_zoneidx, 0);
> > +}
> > +
> >  /*
> >   * get_page_from_freelist goes through the zonelist trying to allocate
> >   * a page.
> > @@ -3796,9 +3822,6 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
> >  	struct zoneref *z;
> >  	struct zone *zone;
> >  	struct pglist_data *last_pgdat = NULL;
> > -	enum zone_watermarks kswapd_watermark =
> > -		sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING ?
> > -		WMARK_PROMO : WMARK_HIGH;
> >  	bool last_pgdat_dirty_ok = false;
> >  	bool no_fallback;
> >  	bool skip_kswapd_nodes = nr_online_nodes > 1;
> > @@ -3865,22 +3888,10 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
> >  			}
> >  		}
> >  
> > -		/*
> > -		 * If kswapd is already active on a node and the zone is below
> > -		 * its kswapd watermark for this request, keep looking for
> > -		 * other nodes that might be idle. This can happen if another
> > -		 * process has NUMA bindings and is causing kswapd wakeups on
> > -		 * only some nodes. Avoid accidental "node_reclaim_mode"-like
> > -		 * behavior in this case.
> > -		 */
> >  		if (skip_kswapd_nodes &&
> > -		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
> > -			mark = wmark_pages(zone, kswapd_watermark);
> > -			if (!zone_watermark_fast(zone, order, mark,
> > -					ac->highest_zoneidx, 0)) {
> > -				skipped_kswapd_nodes = true;
> > -				continue;
> > -			}
> > +		    should_skip_kswapd_zone(zone, order, ac)) {
> > +			skipped_kswapd_nodes = true;
> > +			continue;
> >  		}
> >  
> >  		cond_accept_memory(zone, order, alloc_flags);
> 
