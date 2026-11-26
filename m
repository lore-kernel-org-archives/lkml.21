Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685150;
	b=HkhvkahXOp04EeG0tZY1074jIge3ZfK0B1ABawRb9J33u1QaiIsFhCyowCRMdaEby5Oo
	 DmsZlkpYkUi1aMJx1ZKk/sZvl6KgqXfUENzUZLOGWFIxnHrQcwaBkCIHRDI3tLjNBaemE
	 PbPAnRTDGmT5cCh2gZPXwWzewbnJiqQ8LCh4OaCALzRuxA1y/BKM7HGibbZOuKu/aB+Hg
	 9JUOQ/CEDTVGYHFwKs9LJ8NZtcWGCkPT6DcsU10JGDbVb/f5o0PjWA7/TYENWzD8mGw7c
	 P3p7R/NqpCbsz4iNk68YMx+xRBYJqNv1BmkflGYjZ/pn5EVNnx/HqKrJTZJTXP9EBZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685150;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=aKApNAjFNuW6/wq/vS146NocYcxpNSbPfKkUgd3vTt8=;
	b=mtbGrmgVatuMetP6BJUPftIcxp7j3BCmsArnrnfEhV2iAfaRxwn0QlTdo+SUvbwExwNB
	 WHRvaHGGo6hZdv2cXFA+T+i7oqgbj1m0FUAECUZO8Q+LW2+e/vmqLfQjZXOF11688zpsW
	 TjqDSMpyX9OHJzPhS7y5ElN6bH6e3DEHuQM+B43LOI8sPMrJ5kIy4CCCNK0jFEVrs3YtK
	 RwvKBvt56UTefVzTW4Enjb9Z7wut49712a9o5laFvAn9C6vL1YYlv4tmhjjzP6EFoCEDc
	 BEMqsrnAj5yL+hxSPduwcFOYw5S2lH4ecIvETcgcrK0BLUWLevSm3u9NvLpL5YduQLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="fytAJIt/";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB24E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB24E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fytAJIt/
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0D661BA8;
	Thu, 26 Nov 2026 01:25:45 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0FDA3F632;
	Thu, 26 Nov 2026 01:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795685148; bh=Hbxa4IjJkMzsMDpju7sU3gXs/jL+CVj1EcFYUSt0hhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fytAJIt/ajmL5jTVWMxzkakTC6xw3pTwIVq8nYP+1wRcqvdE7IH+DM9FsC6Jg1xZf
	 XLx+SPAJxFl1QVjR/2HSoORWNFHBnG2oJv3p1Z9KU3k9uvpvxcglm2rIMui5Imr/2W
	 m03B95GEVOoVhW7Zdm5fjeCfedMqHjBBIB3JIJHY=
Date: Thu, 26 Nov 2026 14:55:45 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: JonasZhou-oc <jonaszhou-oc@zhaoxin.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	jianhuizzzzz@gmail.com
Subject: Re: [PATCH] mm/vmalloc: avoid false sharing with drain_vmap_work
Message-ID: <gdy3cvqeppwda5zydfl3cq37gmihrbizbnio5bnandkl2brnt4@vw5s5wcbejoq>
References: <20260825104659.100134-1-jonaszhou-oc@zhaoxin.com>
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
In-Reply-To: <20260825104659.100134-1-jonaszhou-oc@zhaoxin.com>

On Tue, Aug 25, 2026 at 06:46:59PM +0800, JonasZhou-oc wrote:
> free_vmap_area_noflush() queues drain_vmap_work after the number of
> lazily freed pages exceeds lazy_max_pages(). Until the worker purges
> those pages, concurrent frees keep calling schedule_work(). Even if
> the work is already pending, queue_work_on() performs a locked
> test_and_set_bit() on the pending bit in the work item.
> 
> On the tested x86-64 build, drain_vmap_work and vmap_nodes occupy the
> same 64-byte cache line. The work item starts at offset 0 and the
> vmap_nodes pointer at offset 32. The latter is read by vmap allocation
> and free paths, so updates to the work item invalidate a cache line
> read by all CPUs.
> 
> Put drain_vmap_work in the cacheline-aligned data section. Tests were
> run on Linux 7.2.

Should the test be performed again on latest RC kernel ?

> 
> On a two-socket Intel Xeon Silver 4208 system using 16 workers, the
> runtimes of vmalloc.fix_align, vmalloc.fix_size, and
> vmalloc.no_block_alloc decreased by 12.61%, 5.78%, and 6.87%,
> respectively. HITM samples for the affected cache line and total HITM
> samples decreased by 96.55% and 13.36%, respectively.
> 
> Signed-off-by: JonasZhou <jonaszhou-oc@zhaoxin.com>
> ---
>  mm/vmalloc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index f4fa227a8d7f..6b4b287e91f6 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -1088,7 +1088,12 @@ RB_DECLARE_CALLBACKS_MAX(static, free_vmap_area_rb_augment_cb,
>  static void reclaim_and_purge_vmap_areas(void);
>  static BLOCKING_NOTIFIER_HEAD(vmap_notify_list);
>  static void drain_vmap_area_work(struct work_struct *work);
> -static DECLARE_WORK(drain_vmap_work, drain_vmap_area_work);
> +/*
> + * Keep the work item, whose pending bit is updated by freeing CPUs,
> + * away from vmap metadata read by allocation and free paths.

s/away/cacheline away/ instead ?

Besides the comment could be re-worded with some more detail perhaps.

> + */
> +static __cacheline_aligned_in_smp
> +DECLARE_WORK(drain_vmap_work, drain_vmap_area_work);
>  
>  static __cacheline_aligned_in_smp atomic_long_t vmap_lazy_nr;
>  
> -- 
> 2.43.0
> 
> 
