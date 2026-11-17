Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956734;
	b=s+CRW9gsvhUrpjpXOuboZMME6bZjlakXHc90GVMqpCJZasnTcFXy985UKkbCu4LWCJEh
	 QSE+tEua8kF0DZnJ03Wqb42WFqHaSC/0atpX/065ujoYLv+0u8s+Hk3U2K0BaM/XFe07F
	 KbtUp0BYgtpL85tb0Xsg8asvCMcZSkln2k9P2ni1za3PxAafQGHJozjtuH+N74Mfh8vVL
	 KR7hDNLHNuYGySc93U/jG7ftAc2mSflgYh3I/aN8Gec/VNlxdq9sY649KiASM998BdHWI
	 yOMivTANEpRESqdvTXxqGYIbGbv+Gy3JBjPJeDnXdcJGQ3TMr0hlGc/zh9hHWXMDsBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956734;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=k9hECHMo5h9GfCY5WPKMVv4Wl81tO8IuuIh5c8IoZ9o=;
	b=oQZ1I+J/90FdUmIsoOoYjqCiyL8fbOQVWCJ7+Nq8ScA37ZrxszybMTLDv0G0ROlDoTCT
	 hhbFxT62kg2CSSm4Y88mdxxw0DAyAlFJasI0AF+F6hYLW+mIKamUILgfBuBab4lLRAjgO
	 xvseVNfkRCQtr5M9FqbLLZcb5Khl2P6/ydarM16pIAGg9PXlCESJxJYbNYhyOUpDn0nqg
	 c0zpmNiEFn84iBJunVe05Qp3+6cvSNQ7SqoXpLOVmRfHyfmzAFHHWzgP2x8NUeetvAQyP
	 zY8HfJR6f5hZT1t5Qxf1Z+wdDC/o791pZ/+dRNpynK8U2lpeO7EyNOzeNnZQwUSOjFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=prv5Y31s;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426D4606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 426D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=prv5Y31s
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65BD9143D;
	Tue, 17 Nov 2026 15:05:29 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B051E3F673;
	Tue, 17 Nov 2026 15:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794956732; bh=80JOiYe9nFVbLZyY5qgUN4tX8EOBOfJzJ//RidlysA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=prv5Y31ske7iBSp/rqXiLJZUTDgOBxPFHIQ+oiGiF2V5G1DqHXKG7dU7+oUICNqCt
	 eNo1aFAHTJe8JmSwbgKJYm5jMACcMKMuiLV9G4HLpKL2/3urSVYg8lIB5V4qoVcRGe
	 rhl1WbBj6gFBFI5DwnFCHBxeSTQlYP2oVUjLH6aY=
Date: Tue, 17 Nov 2026 23:05:28 +0000
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
Message-ID: <avzduIJralOKBgxK@arm.com>
References: <20261113151837.123795-1-ngocthang2710.1999@gmail.com>
 <0e626675-c6f9-40d7-a4ae-de069154ada2@kernel.org>
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
In-Reply-To: <0e626675-c6f9-40d7-a4ae-de069154ada2@kernel.org>

On Mon, Nov 16, 2026 at 11:54:37AM +0100, Vlastimil Babka (SUSE) wrote:
> +CC Breno
> 
> On 11/13/26 16:18, Nguyen Ngoc Thang wrote:
> > kmemleak reports full rcu sheaves as leaked:
> > 
> >   unreferenced object 0xffff88810005f600 (size 512):
> >     hex dump (first 32 bytes):
> >       e0 79 f0 2b 81 88 ff ff 20 00 b4 81 ff ff ff ff
> >       00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00
> >     backtrace:
> >       __alloc_empty_sheaf mm/slub.c:2854 [inline]
> >       alloc_empty_sheaf mm/slub.c:2874 [inline]
> >       __pcs_replace_empty_main+0x260/0x2e0 mm/slub.c:4806
> > 
> > The second word is rcu_free_sheaf and the size equals the capacity: the
> > sheaf was handed to call_rcu() by __kfree_rcu_sheaf() and is waiting for
> > a grace period. At that point the only reference to it is the ->next
> > pointer of the previous callback in the rcu callback list.
> > 
> > That previous callback may live in memory kmemleak never scans, e.g. the
> > rcu_head of a struct slab queued by rcu_free_slab() for a
> > SLAB_TYPESAFE_BY_RCU cache. Slab pages are frozen (page_count() == 0),
> > so kmemleak skips their struct page. The chain from rcu_data is cut and
> > the sheaf, typically allocated long ago and recycled, looks unreferenced.
> > Since the sheaf is then not scanned either, the objects it is about to
> > free can be reported as well.
> 
> I don't get this part. The previous object can't be that much gone, RCU
> still needs to get to this sheaf at some point, so there has to be a live
> pointer somewhere?

After some back and forth with claude, I think there are a couple of
places where kmemleak fails to track. Since commit 9aec2fb0fd5e ("slab:
allocate frozen pages"), kmemleak no longer scans the slab structures in
scan_zone_pages(). We could do something like below:

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 20c0eb41c873..47446af5fc9f 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1875,9 +1875,13 @@ static int scan_zone_pages(struct zone *zone)
 		if (!(pfn & 63))
 			cond_resched_tasks_rcu_qs();
 
-		/* only scan in-use pages belonging to this zone */
+		/*
+		 * Only scan in-use pages belonging to this zone. Slab pages
+		 * are frozen (zero refcount) but struct slab holds pointers
+		 * such as the rcu_head of a slab pending rcu_free_slab().
+		 */
 		if (page && (page_zone(page) != zone ||
-			     page_count(page) == 0))
+			     (page_count(page) == 0 && !PageSlab(page))))
 			page = NULL;
 
 		if (page && first && page == last + 1 &&


I don't think this is specific to sheaves, SLAB_TYPESAFE_BY_RCU may have
a similar problem, though I don't remember to have seen such reports
yet. It should be covered by the above.

However, this only fixes the links through struct slab. The rcu list can
also go through a sheaf allocated with kmalloc_nolock(), which kmemleak
doesn't track. Any callback queued after it is missed (together with the
objects queued in that sheaf that may come from ordinary kfree_rcu()).
When kmemleak is enabled, could we simply avoid allocating sheaves with
kmalloc_nolock(), i.e.:

diff --git a/mm/slub.c b/mm/slub.c
index 45e077c7526c..13b8e57d6dae 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -6278,6 +6278,14 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj, unsigned int free_flags)

 		local_unlock(&s->cpu_sheaves->lock);

+		/*
+		 * A sheaf allocated with kmalloc_nolock() is not tracked by
+		 * kmemleak, so neither its objects nor the rcu callback queued
+		 * after it would be scanned. Fall back to defer_kfree_rcu().
+		 */
+		if (IS_ENABLED(CONFIG_DEBUG_KMEMLEAK) && !allow_spin)
+			goto fail;
+
 		/* Don't wake up kswapd, it will cause deadlock under pi_lock */
 		empty = alloc_empty_sheaf(s, __GFP_NOWARN, alloc_flags);
 

Not tested and it's possible I misunderstood how all this works. But if
it works, I don't think the kmemleak_not_leak() annotation is needed.

-- 
Catalin
