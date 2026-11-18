Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026969;
	b=gEtxQS8rrD9IwLLZ2F6wGj7clTUfj0eCNsa+fBab5YIJiQS2uiEzy3L9o+MT/QmP7qOR
	 J5YLYBoSqqPJ1nmkEHVlBAWISDjrKhRQfYgZVDjBgXqWlkHtPGQrxjHWY3ZQEDX3wYrSq
	 natpCBgaoTFjdYe+uEt8FSAsN4ECRXA+mGOxn+JgDz0WVbPRZPF8MuT7MHE1kjanr34hS
	 WN8MpPgrPBQeMfPWIaw1qOJ5bUMz+MvDbs1eeaJicpTN9yOsjIMF4920VadwDy8vw3/1i
	 nCHCeHOQCdZpz52jRtVCk6RqLPw6FAJejbE0KPzBYHJxVfUoUAlWfeFEJwGmeO9AlCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LWsePn//34GWKr66eI/3X8mjEEJpdHv2YAD5pLDzxFA=;
	b=x69Q8FicC1EXuwrwtln9ig8W8e/9+1GsyTNgzjQe8jJf0gweJPYp/j6ZZ3K2NO2mYSux
	 7CIY7pErVXTzFbDuQFv5YqnCTsj7yt4myNoUWsc87joZWIDn1l+R9CBwPoE/2PF2FigkR
	 PmvF+WCXhU7enBHNJwR65OzWg2qpXNB7i0QRZ/X7mg05D+phALZVrk7sigXiTr7fmxtJm
	 sVxBsKaTSuzqyTHEZ2+20dqokHi5c8F7aI7/Bo6aAEMRCxjSiFGGPypmhzEtXdzRMp0m4
	 WnSR0y1ZGVgD7/f0gwfpED0Gj0Id4k522QZeA+yqOkfmqR3WgCQgVcTzyzzQUeZ6LAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZPldBpq;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BC6606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51BC6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZPldBpq
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-55650fe1f0dso657617b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026968; x=1795631768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LWsePn//34GWKr66eI/3X8mjEEJpdHv2YAD5pLDzxFA=;
        b=nZPldBpqZpFVG6VU8Us2hU+bdQZXSF7bVeKG7vxCPD5lm3UFmbvB6q9gj7QhVPQKU5
         DREGmJRSjVlxGZD2rNTK1ULbpW3kXUbBuhatjT4STnwYvks0Sk78utnlCXLWEYhwCHDY
         TQ8weyICB8quPge89Q4ZguRfsl+xgVLzeSSVDyeQ3JeIAfouHXzbbGt2rdhO4RTY8gBi
         UbEgxn6pQXvx8ElWpnGSuEp7B4ZNoZmNSA9l/S2rxEBu5B3E9NRC4rcmrmzeV85XJ9IH
         5K2AY3XrUG1mqeI3/0KrxbajpaLSRWUyPgYE/5BFnrr5sQc2vwq5dlK3BNAhmgcrFuW5
         XhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026968; x=1795631768;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LWsePn//34GWKr66eI/3X8mjEEJpdHv2YAD5pLDzxFA=;
        b=SvAA6iGdrHEm4mm/tslE+r02ejIKwBzy9RbmQrKgbg7jCBU6JGFrYK8wBOrvrw9FRF
         CvrFg/bA/dALLmfEYpPrGzP9jOF3na4WwSm3BTpGLqnu9MWU0luvWwb4Y9xDXgejhZnN
         gHXHcoZIxyPZQyVLtTrFuGWBiU5ZvqVMsvCzPdxgqMPt6ZZaQcFvJc1dDFLok2ndoHT+
         NrFhUxBgNU6CUch768SX5E8csLAXcOim0RDdkWNNexw/6Xp7qCl9gRZ6C0rTjd5fBJnB
         0hqsOAueBd8OtebGpXxlYyXPOdVTatNwJg9CaCNdV6ISGOQnxfWamOd0WPLLUJm0AEGc
         TIqA==
X-Forwarded-Encrypted: i=1; AL+hErF4ZTgjB3N3nVJqAGQZZHTtw/9p6jHHHliw1TtdU0TdCzhLylV6uh6yjdy2AP0o3ANubYFGOJ3YXhnDzek=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E7j7igkaLt+ct/Yo68kRECoGbryL3o0VLU+18mteFOr3vgihs
	aIQnC7v0k6PCzwOPH0v3YmDy2bUgUruyepXGuQnTD8Sy8cWlWbXAUAGk
X-Gm-Gg: AYBFou0kD7LIr0UpyJNf+4biuXR3duYibCCxnCqB2WATMZ8ZjpGWW9iQyLmUPDo931o
	Xv5yV2/VBBrZldKbQKp6LMTFkoWRgZqxga/MujLmjSxr+DuqUMzU7SVSSCTKo0Q4cfFpQO6z4lV
	MCEafgArua506kb3BQ3ylFcHTi1PBIiOmUvMDzFNoG4mmfUFh3eAFJsT+LHIpwdrmWoPrBCplQc
	L8mNhIF0LwNxghKrdvFmZxlO2Nyi+fRulyUQhTUQIuJnjnkmItdUJJtqsr06VxWYfP+KXrIUH0T
	h2vZ/CYolmPUumA/Ruj1+cUqynDtC0zzpIqr7PJ42xXwER9NzOY+3fIbb9wHeQzeXNjkjkzewif
	L9ughxws4lZpRM0vewnAazv1nabp4HHtKWmIobyr8coPzBwkuU+1Gt/ovtYNMNDXkM3lgvc5Zac
	z9NusVmenrE97VGOGx05pH5gd+9/g1klhEwwDEkK/QnFORYICPX983JM2hHH47C5QgdoX2OIN6S
	VtTA2fI8XAHq7QCJ4epzJVk2+xpra3qAONBLRbtVXTtzzuMf5pyhZaUtZXeALnbupbYQgeP4s5E
	/f2v+LNd2GccaDpCf3X/QNAcgY379V0hc9dGyEG6QJH5Z3Pnw9zolPJlD9lj
X-Received: by 2002:a05:6808:250b:b0:4e9:7d56:846f with SMTP id 5614622812f47-5773e750e7bmr4246129b6e.41.1795026967884;
        Wed, 18 Nov 2026 10:36:07 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:40::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b74412113asm2969800fac.8.2026.11.18.10.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:36:07 -0800 (PST)
Date: Wed, 18 Nov 2026 10:36:06 -0800
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, Kiryl Shutsemau <kas@kernel.org>
Subject: Re: [PATCH v2 1/3] mm/page_alloc: drop unused gfp_mask from
 zone_watermark_fast()
Message-ID: <av3vX31XxmBT6uh6@devbig011.atn3.facebook.com>
Mail-Followup-To: Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, Kiryl Shutsemau <kas@kernel.org>
References: <20261116232346.788145-1-joshua.hahnjy@gmail.com>
 <20261116232346.788145-2-joshua.hahnjy@gmail.com>
 <b2093f38-e3e3-494e-a27b-afc91c578053@arm.com>
 <7770de02-3f4a-4db8-9e02-5e95b148b809@arm.com>
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
In-Reply-To: <7770de02-3f4a-4db8-9e02-5e95b148b809@arm.com>

On Wed, Nov 18, 2026 at 09:12:51PM +0530, Dev Jain wrote:
> + Kiryl if he has different opinions
> 
> On 18/11/26 8:29 pm, Dev Jain wrote:
> > 
> > 
> > On 17/11/26 4:53 am, Joshua Hahn wrote:
> >> zone_watermark_fast() has not used its gfp_mask argument since commit
> >> 2973d8229b78 ("mm: discard __GFP_ATOMIC") switched the watermark boost
> >> check from __GFP_ATOMIC to ALLOC_MIN_RESERVE.
> >>
> >> Remove the argument, no functional changes intended.
> >>
> >> Reviewed-by: SJ Park <sj@kernel.org>
> >> Reviewed-by: Chris Down <chris@chrisdown.name>
> >> Reviewed-by: Zi Yan <ziy@nvidia.com>
> >> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> >> ---
> > 
> > Note that this series:
> > https://lore.kernel.org/all/20261116125103.2894162-1-kas@kernel.org/
> > 
> > needs to use the gfp mask. So perhaps drop this patch? Otherwise we will
> > just make noise on the list by adding it back :)

Hi Dev,

Thank you for your review on the series. Also, this was a really good
catch, thanks a lot! I'll just drop this as it was just meant to be a
cleanup if there was no new user, but it seems like there will be a
real usecase.

Have a great day!
Joshua

> >>  mm/page_alloc.c | 12 +++++-------
> >>  1 file changed, 5 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> >> index 9e1261521b6a3..4d829e5eac49d 100644
> >> --- a/mm/page_alloc.c
> >> +++ b/mm/page_alloc.c
> >> @@ -3675,7 +3675,7 @@ bool zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
> >>  
> >>  static inline bool zone_watermark_fast(struct zone *z, unsigned int order,
> >>  				unsigned long mark, int highest_zoneidx,
> >> -				unsigned int alloc_flags, gfp_t gfp_mask)
> >> +				unsigned int alloc_flags)
> >>  {
> >>  	long free_pages;
> >>  
> >> @@ -3877,7 +3877,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
> >>  		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
> >>  			mark = wmark_pages(zone, kswapd_watermark);
> >>  			if (!zone_watermark_fast(zone, order, mark,
> >> -					ac->highest_zoneidx, 0, gfp_mask)) {
> >> +					ac->highest_zoneidx, 0)) {
> >>  				skipped_kswapd_nodes = true;
> >>  				continue;
> >>  			}
> >> @@ -3897,8 +3897,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
> >>  
> >>  		mark = high_wmark_pages(zone);
> >>  		if (zone_watermark_fast(zone, order, mark,
> >> -					ac->highest_zoneidx, alloc_flags,
> >> -					gfp_mask))
> >> +					ac->highest_zoneidx, alloc_flags))
> >>  			goto try_this_zone;
> >>  		else
> >>  			set_bit(ZONE_BELOW_HIGH, &zone->flags);
> >> @@ -3906,8 +3905,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
> >>  check_alloc_wmark:
> >>  		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK);
> >>  		if (!zone_watermark_fast(zone, order, mark,
> >> -				       ac->highest_zoneidx, alloc_flags,
> >> -				       gfp_mask)) {
> >> +				       ac->highest_zoneidx, alloc_flags)) {
> >>  			if (cond_accept_memory(zone, order, alloc_flags))
> >>  				goto try_this_zone;
> >>  
> >> @@ -5245,7 +5243,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
> >>  		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK) + nr_pages - nr_populated;
> >>  		if (zone_watermark_fast(zone, 0,  mark,
> >>  				zonelist_zone_idx(ac.preferred_zoneref),
> >> -				alloc_flags, gfp)) {
> >> +				alloc_flags)) {
> >>  			break;
> >>  		}
> >>  
> > 
> 
