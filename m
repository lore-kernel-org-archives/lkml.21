Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615848;
	b=xefrgNLnIXAuhmR6JYOBM/DO5TDfcaqYz40QVwsZPsXC0PhBQxhCsqze3MKl362DTFUR
	 KSZlAyCgisQ4J3+RdBIgtmW0KPrKoY+fVAQqtqT6+Su2icGvwtLERuRNrHw+JPWXcTdv8
	 uAJLhFkEzk6r4MP98WSl+03VOPKMzOvydVHSTYhHZ2UW1h8mmmoWBB871slrJGO1bNSO2
	 BYjRtcXz5akdT7f2aENE08r/V6i3cXI5W7RCTMCv1sgJlXApq20l8IeJDKpCv5XCrNxpE
	 yLLA4APSXEIUtl53DjvR7xREOMOT4awTWgFH4GTFmA0ikySPiEo69J1AjLGozb9yy1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615848;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MvG2udng3DFxjfopgd41WWndiQho+1dwKgg/AssAfVI=;
	b=cZ8F3c401HsJqYUuwftmMzR7WgADaLKNM8LnEvgRkDv7m1gTQRiz45Sp/rl2gA2sTkuX
	 w+QkpPQeiphpI2JyASUipyrVwO6QKitT5HwaGdOc6JJ6ev5KaEsAKwAgJ00W/j8lD6Dna
	 O5YEsmbH7sHWUnY8PHk9Nb+2mzNWo2VqkmCHw9OvYwABxLpJZ8+KY1w0Xln8tGxFocxqd
	 5ReqxHXkNudF/3pc47zQTNmMImyavp3sOBkO54Yu0iQ0napP1Tx7cdYpOs0CgEggNXxw8
	 sZrXs3BqEKccOszSrMeVmJmdXXNAzervNGBz6UdMglzld/aJEtPdK+rUy7yfGJASmRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jvreFhGE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21A6606A339
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jvreFhGE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0251F000D8;
	Wed, 25 Nov 2026 14:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615847;
	bh=MvG2udng3DFxjfopgd41WWndiQho+1dwKgg/AssAfVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jvreFhGEoi3Y/lF1wD38ln+TGJjPKI1JP0HS83P5ZxOskLDIjKRLeIWgdbwgXcsGF
	 6IizzYlr9SfX2BnT+55b15GqS69UG4Jog9LlEZW8Yv+C1UIUdFeqEwXbexsD4cpWI5
	 xzbYO9KXDH97oUJlEQWhTUwMUcylgH6SQAXA1CI4aPX/zxgKQHmqwgm+lUk5puw9FL
	 9N/LBVRBnkem9GNTesf70W1YPHLfKQbn+QgCeLVIQGrYtwm/ynwMevPBbkjr6Zw0X8
	 DfvHA1I9gRLvdQ7IvqaXadd1UEfPo695geFLtoPnE5q/rG1q2SW0bOfh5OEqpWdW65
	 NxlYpSm4/Gwzg==
Date: Wed, 25 Nov 2026 14:10:45 +0000
From: Harry Yoo <harry@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	syzbot+527fed49e5b988882c9a@syzkaller.appspotmail.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] mm/slub: don't let kmemleak report rcu sheaves
Message-ID: <awbq19zVSt5cqM2V@thinkstation>
References: <20261113151837.123795-1-ngocthang2710.1999@gmail.com>
 <0e626675-c6f9-40d7-a4ae-de069154ada2@kernel.org>
 <avzduIJralOKBgxK@arm.com>
 <av3NBYxYXyYk_tjS@arm.com>
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
In-Reply-To: <av3NBYxYXyYk_tjS@arm.com>

On Wed, Nov 18, 2026 at 04:06:29PM +0000, Catalin Marinas wrote:
> On Tue, Nov 17, 2026 at 11:05:28PM +0000, Catalin Marinas wrote:
> > diff --git a/mm/slub.c b/mm/slub.c
> > index 45e077c7526c..13b8e57d6dae 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -6278,6 +6278,14 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj, unsigned int free_flags)
> > 
> >  		local_unlock(&s->cpu_sheaves->lock);
> > 
> > +		/*
> > +		 * A sheaf allocated with kmalloc_nolock() is not tracked by
> > +		 * kmemleak, so neither its objects nor the rcu callback queued
> > +		 * after it would be scanned. Fall back to defer_kfree_rcu().
> > +		 */
> > +		if (IS_ENABLED(CONFIG_DEBUG_KMEMLEAK) && !allow_spin)
> > +			goto fail;
> > +
> >  		/* Don't wake up kswapd, it will cause deadlock under pi_lock */
> >  		empty = alloc_empty_sheaf(s, __GFP_NOWARN, alloc_flags);
> >  
> 
> For the objects queued in a sheaf, rather than the !allow_spin fallback
> above, it's simpler to move the kmemleak_ignore() call in
> kvfree_call_rcu() before kfree_rcu_sheaf(), so they are treated the same
> as on the non-sheaf path.

No strong opinion on this but kmemleak_not_leak() would let kmemleak
track objects queued in a sheaf?

Wondering it'd make sense to mark bnodes with kmemleak_not_leak() as
well instead of calling kmemleak_ignore() on all objects.

> To Vlastimil's earlier point, kmemleak could follow these rcu chains
> instead of relying on kmemleak_not_leak(). However, with chain breaks at
> any _nolock or SLAB_NOLEAKTRACE object (including kmemleak's own
> metadata) and walking the rcu callback lists directly means digging
> into rcu internals. The annotation is easier to maintain.

Fair enough.

> (got lost in all the slub code, it was much simpler 17 years ago when we
> merged kmemleak ;))

Good old days :')

-- 
Cheers,
Harry / Hyeonggon
