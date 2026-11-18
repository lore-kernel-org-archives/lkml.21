Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018223;
	b=wAc1TlfVj6nCw67jlf/E0katp0HErBcODS6ryO0E3H4zEf6ip8u0GajqwsxWo3lAP/9/
	 kt4OkiJ8T7xK5jEFIcvGivc2s1uemAqOIeA5PKWKj8rGEoBim/GkEy50IfFHLQSzz3cRQ
	 bXu/mbjOusQ8o97glVA82GqqZPSnJyXa2ngtTk2H7LfaA4MpTcQOotumaaRa+HXhWdJY2
	 F6dxQ3RwMsqV1ENHCiWrlU8AH4UUndjrRU2Gq/AVYehcCM/UyaGuqglhiCNYEhOHPhLCc
	 WNLL2lkfKbvXrMKVKP9fn2d/vbH0NnrmzsImTW/vzg7vnuHxfdEycA8+g2sz3tQ4OqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018223;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ZNwKoLmqeSwPydDAhEghKLHqTvIumd5TXBU/hrH7FpA=;
	b=ro3fns6y5Iu6VQJ9zsS6gIUDpgsgLRgRZ0ByCp/q8lc1JSKeM9YfluI2CqUtme5jyfZo
	 4qeG3GxzGScA3R5jgYKGlFUsDOUUnHzqg58c1vLW3t1t7qasVqrXOea+lWqL9yFx/CfHC
	 +opubiAXNQCnH3v8SzP3TxR7QLICQi20lM5KtzweqDH1HsEI4bXADHzKr6Rn4w00Ov0lF
	 RQbMTZzo6bIXrSaF1r8+xc3jyJkhpvBN+yHwVuV2/VCGCf9IskJRbFktIqRRdHfOOsBeD
	 CD8ml1UMrm1n32hF48GJ6IXEQRBkcz+9y6LVxozUItKPLbr/Alwj7pqNj2LIYN61Hog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C3xuFqWJ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E43A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E43A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C3xuFqWJ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EFDD339;
	Wed, 18 Nov 2026 08:10:18 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A57E93F673;
	Wed, 18 Nov 2026 08:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795018221; bh=/+padZQ2w+TGhQW06d2Ojc/kEfJW108rtB1jBbALpjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3xuFqWJDbpH6XEiCkUlBwXIN543SWfJMKcxccXPy9d2AfNHicO5Hj5c/DuD5pNr1
	 KL4sq1hvast3EohM39v1bobaW+vQojqjNZn06FNSorkFZZme6DRTBtRQZSNYzWihaW
	 9wAFlw5V69dS7yYPdmIqhzWvUOcJuuKEdBg21ZEI=
Date: Wed, 18 Nov 2026 16:10:16 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+527fed49e5b988882c9a@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm/slub: don't let kmemleak report rcu sheaves
Message-ID: <av3N6DGiOFK3e3Yw@arm.com>
References: <20261113151837.123795-1-ngocthang2710.1999@gmail.com>
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
In-Reply-To: <20261113151837.123795-1-ngocthang2710.1999@gmail.com>

On Fri, Nov 13, 2026 at 10:18:37PM +0700, Nguyen Ngoc Thang wrote:
> kmemleak reports full rcu sheaves as leaked:
> 
>   unreferenced object 0xffff88810005f600 (size 512):
>     hex dump (first 32 bytes):
>       e0 79 f0 2b 81 88 ff ff 20 00 b4 81 ff ff ff ff
>       00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00
>     backtrace:
>       __alloc_empty_sheaf mm/slub.c:2854 [inline]
>       alloc_empty_sheaf mm/slub.c:2874 [inline]
>       __pcs_replace_empty_main+0x260/0x2e0 mm/slub.c:4806
> 
> The second word is rcu_free_sheaf and the size equals the capacity: the
> sheaf was handed to call_rcu() by __kfree_rcu_sheaf() and is waiting for
> a grace period. At that point the only reference to it is the ->next
> pointer of the previous callback in the rcu callback list.
> 
> That previous callback may live in memory kmemleak never scans, e.g. the
> rcu_head of a struct slab queued by rcu_free_slab() for a
> SLAB_TYPESAFE_BY_RCU cache. Slab pages are frozen (page_count() == 0),
> so kmemleak skips their struct page. The chain from rcu_data is cut and
> the sheaf, typically allocated long ago and recycled, looks unreferenced.
> Since the sheaf is then not scanned either, the objects it is about to
> free can be reported as well.
> 
> Sheaves are allocator metadata and are always owned by a pcs, a barn or
> an rcu callback. Mark them with kmemleak_not_leak(): they are never
> reported but still scanned, so objects queued in them stay referenced.
> Allocations that can't spin are not tracked by kmemleak, so skip them,
> as alloc_slab_obj_exts() does.
> 
> Fixes: ec66e0d59952 ("slab: add sheaf support for batching kfree_rcu() operations")
> Reported-by: syzbot+527fed49e5b988882c9a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=527fed49e5b988882c9a
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> ---
> Reproduced in QEMU (syzbot config, 2 vCPUs, numa=fake=2) by stalling a
> grace period with a preempted reader on CPU0 while CPU1 interleaves
> rcu_free_slab() (filp slabs) and rcu_free_sheaf() (maple nodes freed by
> kfree_rcu()) callbacks, then running two kmemleak scans:
> 
>   before: 16-18 sheaves reported per run, rcu_head.func == rcu_free_sheaf,
>           plus maple nodes held by them
>   after:  no sheaf or maple node reports, no new warnings
> 
>  mm/slub.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index cd671b934719..e01416ae0b4a 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2856,6 +2856,14 @@ static struct slab_sheaf *__alloc_empty_sheaf(struct kmem_cache *s, gfp_t gfp,
>  	if (unlikely(!sheaf))
>  		return NULL;
>  
> +	/*
> +	 * A queued rcu sheaf may only be referenced by an earlier rcu callback
> +	 * in memory kmemleak doesn't scan (e.g. struct slab). Never report
> +	 * sheaves, but keep scanning the objects they hold.
> +	 */
> +	if (alloc_flags_allow_spinning(alloc_flags))
> +		kmemleak_not_leak(sheaf);
> +
>  	sheaf->cache = s;
>  
>  	stat(s, SHEAF_ALLOC);

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
