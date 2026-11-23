Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456148;
	b=HPel41eHmI3/HQ71Sd8pic/Oyh/yRSzN0XnvpBrwS2bQlsxA73eNRvmZ9trrcGxLko63
	 thO6Hgf5BocqP4L0Y0f2FDo+MRQoTNfO0DykahhTTRmD0aoCCPQqhad4qNHmOlfEk98LU
	 0XrxxfOSuUSC/ceW5wAPdsBEjBGVzNyPlR0ZubRPtSoH/jHtwpKp4hAb64edf6/+XKK5P
	 rGn+NXKeU1lv5x60NBP5ynxh29359AThWklVgbKqpVncZAK5cTYDi0eLfYoDDoas7AJ8H
	 BPf6rj3bRCSK4cGd9IL6gWNIIZLIdCtIztooyG7YXyWMJ8tUaSDB4mmCYm+sFda0Vsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uy8AXENEvxp8VrMkoOr6XkIXIF2ZC5d2aIua+WZN33M=;
	b=5O31/0MLUMOwU/fJhtOmlgNngfZgupzjAGj5ujf6n27s6E5s7BDCfZT+Hfiq8cans3nJ
	 daxqcoqfq114j5mgt/+AjmSvXIypsPOye/Nir2Y3UWMKeIzdwWBhRo7kuodDOMY+13J8q
	 eHFiCspMgJKf2UPA5sglt3LpfTq9X5li3a6BW+3iuNCmPyavCJoEkr9/yHLLkG7vVxql0
	 S/Pp3VjSPpZ2CqrY66kU4VpLDu2u5Pvh5fMbHAX5M+K6wu/gtplTkCB5FbTGnQyvzFqyf
	 rL/kMpPQvjhWKVEzcpqrseODa3Sa0pOm0+rh/KnU70TBy14X/uHKpiqbKp2n1Dnr6hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E+U3Z/pt";
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378C5606A33C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378C5606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+U3Z/pt
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4adea5b7a2fso1246023fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795456147; x=1796060947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uy8AXENEvxp8VrMkoOr6XkIXIF2ZC5d2aIua+WZN33M=;
        b=E+U3Z/ptuWbt1LbrPJU5mV0HDinFu/fEoH7IMgN+/VAckFU3nQPSnL6sZVPO93qas4
         jt/bYTHO0Fj72Rlg1LBCt1/uj19WEpHnSQe6HSEyUQ9CWq9pa86WUm9BHNvVDyH7YvRQ
         nAsNrA4L0vV9ebltvTgb8GZjKEIcD0xe237W7ejXSwLbdeiP9HcNvJmOrHKTk6VxuJtp
         ATc2Pqz7bb3bopSkfMJAxAnsaus6Xp4eBtLNg/qQ84o8N7UXZxOn2+Y5miPkdiSPoHP1
         6vyucGncLZvPtaIIFJNxF4Op08ckymUDqXFYF9l/XlNJ1gmZqazuS7gE72eJzBgHyS/d
         l50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795456147; x=1796060947;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uy8AXENEvxp8VrMkoOr6XkIXIF2ZC5d2aIua+WZN33M=;
        b=T39caiG+Ex3gfvjkBBpB9TG+pdvyZa83yUsB6cqjOOB0PBuh/siUjJkiXbougKEbtn
         +sjVdWl29z/cei9bzo94sYIx6GQ6uELQisNvxfqIm/EwecwLXvRqK406ZIfS3w8mPomX
         RdICWR2aoh3thRkW83S7yUFe9f8zyHiZIkztvTgvORsuR/Fwp+OSYhn21WOAfEvqk+3/
         mGq1YU0rIWnPLLsMpQtOIeG5Zl66cxYzGeo+6eQw72W8d4F6FL5ooVgRRlqz3zmcCRQa
         6oK83dU57DrrEAbF2R9xC/iteA/TwRNRnbdUM4fxgPU6FRGdWQnJGxJA+o3+vzTorZ/C
         qEig==
X-Forwarded-Encrypted: i=1; AL+hErF6Fwj/xPZdfVJHy+gv/0D1pRS6Yxwk2bPobNt/bAT5h1ENTzuo4IC0DPxx94ep/H/whfYuMhniqweZIOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mqQzRqrps3SwfyyaRSAzSisqzBM2xYy7XiYMT+vpf+M3GtgWJ
	wtRFy4tbTHhBkDQz8Nj+0C//4XorQ26ihyWOJmdPC3UTMDZZgSfPAGLE
X-Gm-Gg: AZFdTZdZlBmL7iQYbY0gmjbcmDiX/UWpW4kTDlI5/KbaBwkyLrSEYW4S2DJB0Xt7zL1
	cRO4an+Tnis1cef1FpXcmGn9i+p+RPvPUkAv7bRv5GGIYZLtNK8JbFm5sNKrrfjW/g5O0O4Wgqd
	DqBgvkSPbDH+22KC4qvsG4TlBHpGgXClFgPxkW1KyrVJht7b9wCC6f0kdPH8oN4u9RB1DD76coF
	huCYaq8H9ro0yNajJXKllAnqRk+FxRNPs1AJqgMcElJo/ZOMkW6stOCNstnMKdoXSPFWkTHbbUT
	lHiAQ/vT8LFGNaTkNlIWF2MY4hkmtjQTK1ryfbkFRs7dFfAcCvw5u+gHsSxUZ/sxV9M6+L+DbZK
	LoE1ucdOZo7D/RBFYddhmirs8GMAnf0gM5KlEG0vYNkeQhH/IYnJirWtoypmzTJPCDEYPnsxGhe
	JvAH8Y8z0UVT9THRdmWwQH7C4Ejx+tdkQ3fUEC/gaT9rg5ihtp2ovnVDyC1VqSef2DqZXrhUYoC
	Gn3j0TwRbe7yE6Fi/1y0bojxD61Lz9uqH6/2if+9CG2yjaqOLCoxcL6ieGBlGr48vDEKrJCQDd5
	oYSpK7YxhzqPEmeUs4fHJihgX8RjgX2qnLBJa55ZmwQWr8XeLOd14x/SZsc=
X-Received: by 2002:a05:6871:295:b0:4a7:4b64:3818 with SMTP id 586e51a60fabf-4bc85eefab2mr10911425fac.39.1795456147071;
        Mon, 23 Nov 2026 09:49:07 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:e::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bcf0794755sm10740921fac.10.2026.11.23.09.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:49:06 -0800 (PST)
Date: Mon, 23 Nov 2026 09:49:05 -0800
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v3 2/2] mm/vmscan: consolidate promo vs. high watermark
 checks
Message-ID: <awR8ZuldFtf93uNF@devbig011.atn3.facebook.com>
Mail-Followup-To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261118230539.3789231-1-joshua.hahnjy@gmail.com>
 <20261118230539.3789231-3-joshua.hahnjy@gmail.com>
 <84ba8739-1f1c-4838-b607-e6181fe55002@kernel.org>
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
In-Reply-To: <84ba8739-1f1c-4838-b607-e6181fe55002@kernel.org>

On Mon, Nov 23, 2026 at 02:44:31PM +0100, Vlastimil Babka (SUSE) wrote:
> On 11/19/26 00:05, Joshua Hahn wrote:
> > There are three sites which all check the watermark that kswapd reclaims
> > zones up to, which is the promo watermark when NUMA balancing memory
> > tiering is enabled, and the high watermark otherwise.
> > 
> > Consolidate the pattern into a helper function. While at it, remove the
> > include for <linux/sched/sysctl.h> in mm/page_alloc.c now that the
> > dependency on sysctl_numa_balancing_mode has been abstracted into
> > vmscan code.
> > 
> > No functional changes intended.
> > 
> > Reviewed-by: SJ Park <sj@kernel.org>
> > Reviewed-by: Chris Down <chris@chrisdown.name>
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Reviewed-by: Gregory Price <gourry@gourry.net>
> > Reviewed-by: Dev Jain <dev.jain@arm.com>
> > Tested-by: Chris Down <chris@chrisdown.name>
> > Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> > ---
> >  mm/internal.h   |  1 +
> >  mm/page_alloc.c |  6 +-----
> >  mm/vmscan.c     | 22 +++++++++++++---------
> >  3 files changed, 15 insertions(+), 14 deletions(-)
> > 
> > diff --git a/mm/internal.h b/mm/internal.h
> > index 566cbd2dce485..8beb5b263ca1f 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -68,6 +68,7 @@ unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
> >  				gfp_t gfp_mask, const nodemask_t *mask);
> >  unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru,
> >  			      int zone_idx);
> > +unsigned long kswapd_wmark_pages(const struct zone *zone);
> 
> Can we inline it? Seems wasteful to make the allocation fastpath call to
> vmscan.o just for this.

Hi Vlastimil, thanks for taking a look! Yeah, sounds reasonable to me.

> I'd probably put it in mm/page_alloc.h as we're trying to split out the
> monolithing mm/internal.h
> It shouldn't be a problem to include include/linux/sched/sysctl.h there for
> sysctl_numa_balancing_mode, hopefully.

Doesn't seem like it will be an issue. Let me send out a new version for
this with both changes then. Have a great day!
Joshua
 
> Thanks.
> 
> >  
> >  #define MEMCG_RECLAIM_MAY_SWAP (1 << 1)
> >  #define MEMCG_RECLAIM_PROACTIVE (1 << 2)
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index e7a7863e381ab..31a670eb4832c 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -45,7 +45,6 @@
> >  #include <linux/mmu_notifier.h>
> >  #include <linux/migrate.h>
> >  #include <linux/sched/mm.h>
> > -#include <linux/sched/sysctl.h>
> >  #include <linux/page_owner.h>
> >  #include <linux/page_table_check.h>
> >  #include <linux/memcontrol.h>
> > @@ -3805,10 +3804,7 @@ should_skip_kswapd_zone(struct zone *zone, unsigned int order,
> >  	if (waitqueue_active(&zone->zone_pgdat->kswapd_wait))
> >  		return false;
> >  
> > -	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
> > -		mark = promo_wmark_pages(zone);
> > -	else
> > -		mark = high_wmark_pages(zone);
> > +	mark = kswapd_wmark_pages(zone);
> >  	return !zone_watermark_fast(zone, order, mark, ac->highest_zoneidx,
> >  				    0, gfp_mask);
> >  }
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 9959ca158ce83..9af50783fc824 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -478,6 +478,17 @@ unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru, int zone
> >  	return size;
> >  }
> >  
> > +/*
> > + * The watermark kswapd reclaims zones up to. With NUMA balancing memory
> > + * tiering, kswapd keeps room above the high watermark for promotions.
> > + */
> > +unsigned long kswapd_wmark_pages(const struct zone *zone)
> > +{
> > +	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
> > +		return promo_wmark_pages(zone);
> > +	return high_wmark_pages(zone);
> > +}
> > +
> >  static unsigned long drop_slab_node(int nid)
> >  {
> >  	unsigned long freed = 0;
> > @@ -5212,7 +5223,6 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
> >  static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
> >  {
> >  	int i;
> > -	enum zone_watermarks mark;
> >  
> >  	if (unlikely(sc->proactive && signal_pending(current)))
> >  		return true;
> > @@ -5224,12 +5234,9 @@ static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
> >  	if (!current_is_kswapd() || sc->order)
> >  		return false;
> >  
> > -	mark = sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING ?
> > -	       WMARK_PROMO : WMARK_HIGH;
> > -
> >  	for (i = 0; i <= sc->reclaim_idx; i++) {
> >  		struct zone *zone = lruvec_pgdat(lruvec)->node_zones + i;
> > -		unsigned long size = wmark_pages(zone, mark) + MIN_LRU_BATCH;
> > +		unsigned long size = kswapd_wmark_pages(zone) + MIN_LRU_BATCH;
> >  
> >  		if (managed_zone(zone) && !zone_watermark_ok(zone, 0, size, sc->reclaim_idx, 0))
> >  			return false;
> > @@ -7131,10 +7138,7 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
> >  		enum zone_stat_item item;
> >  		unsigned long free_pages;
> >  
> > -		if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
> > -			mark = promo_wmark_pages(zone);
> > -		else
> > -			mark = high_wmark_pages(zone);
> > +		mark = kswapd_wmark_pages(zone);
> >  
> >  		/*
> >  		 * In defrag_mode, watermarks must be met in whole
> 
