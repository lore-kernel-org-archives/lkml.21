Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787799;
	b=wYJkcGkkokXwYRczShoQ2p4BHwMtA7KWUmJqI3HxCn2d5grO3tiWBxihYvBvdHiOp6z9
	 IeUru2bQ5moFdxNPfzhe612ZjaFUZKrM4XQKdj72Mml31oC/+WxRi2cPXEVRDmHER8iL1
	 gtDwMvfulKQtZdY4KgC8Z3Wv4xuZFDn05AUuv+cUfiIDKrSgiefxagBW5SMpRxmvk/7/J
	 76s1QeBQLMNzIksECa7CN7ZG3RNIonVEl+lT8GUDol+5li13sNgpexeVrS1Ga0jGIGk4D
	 HF1tz4c7LmNezwVy8cxmDF3LX95CoRybZQqxmgp0cyi8C6e0AVxf1EcC+dO125tdF8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787799;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mDHZFcc4v4kqFFQEYuRlrYilSomjPNjJYmAG/IBsVQA=;
	b=pYIxNPJbvUhvLn8WMwtaBl6KWTA/7jzcgyIqpilVVrSgfqSxMgWxi2Ttoeod9G5RV2Ci
	 knZW6NpBCU3hO9BiF8q0GRxyK6Wq4AdJXLofZHFtbgk0Pmf6WtApqcoltGTT18veQ6eGK
	 fm43pt6mfMrWF90dg7QPzfTgRuMZHmXVZsnaEeadMB5UzDpaeMIOzt7lDGL+Y/Rwkb+fE
	 v46qdJwK8TlKCbu7UpCIiQH61gJAOLzs8gnJF25/eg0jGciz2LKY6COksZWMxynhOohDZ
	 G0JRKJbVdzu1AR1tcAi0HWyhe4lIYvz1CNtYszSSn9qQVh9/7q2TjRMHEVnoEdoTUig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=grVuyKYj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54ED606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=grVuyKYj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56721F00898;
	Fri, 27 Nov 2026 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795787799;
	bh=mDHZFcc4v4kqFFQEYuRlrYilSomjPNjJYmAG/IBsVQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=grVuyKYjKbiS1ihwdqXTmbKMjYlt3hKKSiZ6KB2oCL8luv27rt0HzarRUbDKzOxj1
	 HPsz162Ar1YxMaPCfZXxyhOStJ6PVBiXvFPMkwz8yrfC37t0kpzn8WzKSpEkSXiMHY
	 Erzy9zU5o49jWDf5Hhtq7VJUk8wDNjeUOwG0yEdPaxthQaTasFgEgagGAH8YRvBgRt
	 N1KBH3dbzZlQ9FIWujAYqk3hHIFDAV6HQRK1JSCMevdxyZ9A86mcIG1WCX9a1RCjNo
	 4d3QygwOtZ4gNdYeveGhrX6pLChjGzcxHH6CVnF0S0FgQCrjZW9XpyaIvHRzQQQ4mh
	 1r99LL31/6AnQ==
Date: Fri, 27 Nov 2026 13:56:37 +0000
From: Harry Yoo <harry@kernel.org>
To: Marco Elver <elver@google.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Chris Down <chris@chrisdown.name>, Kees Cook <kees@kernel.org>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mm/slab: add own entry points for
 kmem_buckets_alloc() family
Message-ID: <awmJTJc9o51igzad@thinkstation>
References: <20261124-kmalloc-entry-rework-v1-0-37b1631a67b5@kernel.org>
 <20261124-kmalloc-entry-rework-v1-2-37b1631a67b5@kernel.org>
 <awg-2hrOmY5U3vzS@thinkstation>
 <4cb6e0ea-5e6c-4ecd-b673-70b42864c694@kernel.org>
 <CANpmjNM8K=2qGb2qWGj-AnuGSRbT5KwPdu9z6e5i2JfH8_+7kg@mail.gmail.com>
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
In-Reply-To: <CANpmjNM8K=2qGb2qWGj-AnuGSRbT5KwPdu9z6e5i2JfH8_+7kg@mail.gmail.com>

On Thu, Nov 26, 2026 at 08:59:23PM +0100, Marco Elver wrote:
> On Thu, 26 Nov 2026 at 20:04, Vlastimil Babka (SUSE) <vbabka@kernel.org> wrote:
> >
> > On 11/26/26 15:22, Harry Yoo wrote:
> > > On Tue, Nov 24, 2026 at 05:30:03PM +0100, Vlastimil Babka (SUSE) wrote:
> > >> The way buckets have been implemented was to extend
> > >> __kmalloc_node_noprof() and two more functions with the kmem_buckets
> > >> pointer parameter, which means all kmalloc_node() callers now have to
> > >> pass NULL. To avoid this extra parameter with CONFIG_SLAB_BUCKETS=n,
> > >> we added macros for parameter declaring and passing.
> > >>
> > >> This can be avoided by creating own entry points for kmem_buckets
> > >> allocations and not using the kmalloc ones. They all end up performing
> > >> __do_kmalloc_node() internally.
> > >>
> > >> Since it's just 3 functions with few callers, do not try to do anything
> > >> special to eliminate code with CONFIG_SLAB_BUCKETS=n. Only make sure the
> > >> bucket parameter is changed to NULL in that case because it would be
> > >> ZERO_SIZE_PTR otherwise.
> > >>
> > >> The removal of the now-unnecessary parameter macros is done separately
> > >> next.
> > >>
> > >> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> > >> ---
> > >>  include/linux/slab.h |  16 +++++++--
> > >>  mm/slub.c            | 100 +++++++++++++++++++++++++++++++++++++++++----------
> > >>  2 files changed, 94 insertions(+), 22 deletions(-)
> > >>
> > >> diff --git a/mm/slub.c b/mm/slub.c
> > >> index 70df0a2e3876..6674caabbb6e 100644
> > >> --- a/mm/slub.c
> > >> +++ b/mm/slub.c
> > >> @@ -5732,6 +5732,34 @@ void *__kmalloc_flags_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t flags,
> > >>      }
> > >>  }
> > >>
> > >> +void *__kmem_buckets_alloc_noprof(kmem_buckets *b, size_t size, gfp_t flags)
> > >> +{
> > >> +    const struct slab_alloc_context ac = {
> > >> +            .caller_addr = _RET_IP_,
> > >> +            .orig_size = size,
> > >> +            .alloc_flags = SLAB_ALLOC_DEFAULT,
> > >> +    };
> > >> +
> > >> +    if (!IS_ENABLED(CONFIG_SLAB_BUCKETS))
> > >> +            b = NULL;
> > >> +
> > >> +    return __do_kmalloc_node(b, flags, NUMA_NO_NODE, (kmalloc_token_t){}, &ac);
> > >
> > > No type-based or random kmalloc partitioning w/o SLAB_BUCKETS?
> >
> > Hm that's right, that excludes it. I didn't realize that,

> > but also I wonder
> > if anyone would really choose to have partitioning enabled but buckets
> > disabled.

Dunno :)

> > It should be straigtforward to add it though.

> > But as long as
> > buckets are not disabled, the token parameter will be effectively unused. Kees?

That's fine as buckets provide its own isolation.

> This falls back to normal kmalloc caches, right?

Yeah.

> If so, if
> partitioning is enabled, it should choose one of the partitions just
> like normal kmalloc.

So we need to pass proper token

-- 
Cheers,
Harry / Hyeonggon
