Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009183;
	b=TvEKmcxk0rsIXiJJt8AoSWMOtbr5ofosw+Xz0+qa11Jfxugx4XTgm4vyVzqkki2IvRsm
	 0afzDXamShCrGQwgVlkmWzN8eOSTS7jKrHICiVUu7ItcUb7zUk9sgaJjjmdNqaC1QuCsT
	 wRSb1hl/iLDu9OLD9lJ4IZj5DAHyKQNjS/3X9sgk8pJ4V2dyddemgcq880w0a6k07DF+1
	 LB4WhgtfZ+czjUz+hRRN3BjshA4mVe+oMToujbpxH3NJJ1duM7g28ZSqafveofYj25z5j
	 jsGrGPu12CrJ5Jmq6DVXLcWq5UZ8tok3LwvDhstfE+SuV3YzhGtprAz93e9L2sqhy4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009183;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=H16wPM7V43qGhOUqYIC9Lq66inZTiW4pkuJdkCDBv0k=;
	b=JLiCgxr69oUpUvX8l7PnGLWHLUiFMu02aS1qkU8RHaxiCfW8GK36TeWXFdvNLd63gqWg
	 USWsVucNBJgq68d08pGIdyCGpjMAzDqo/UNMPwLfmlow/UI+Vqjp/0aQMrqQXa74vEO+3
	 B6ktH4Wm3KcHK8eGo10IYUhf58PJ6+4whCFhJdEdL4mk3XU2z4VNQ2lzMuDRYMLE0ySs/
	 sFNUDZaxmTKU2oelKM30/2wAhy3eAvlMlo+1WPt12phZkPzuXEKB7UrUih07SJcCo8ib+
	 DLJ6J47HS8UHzEfMcpGOegdHmbVRZvixDtlQ0WgJc3sn0BS++pTsWWWv/bAPxZKYiVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QnXDe1Br;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF5B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QnXDe1Br
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57A61F000C4;
	Wed, 18 Nov 2026 13:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795009183;
	bh=H16wPM7V43qGhOUqYIC9Lq66inZTiW4pkuJdkCDBv0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QnXDe1Brr0lrrc+WoVXWDQAuB6mqEFMBO+0+D9laEIhooYb5UkBJwdxFGdNoFKZ8o
	 WsN/4VSJX8Ukxv40UAWQeosgaBpENKCEoKAhEJU/n0HJDVG7RFGt5Tf+O6Qqk0oOjB
	 tUWVsP80MgMO5zLwbQe5JOvapb4ltLtoalyxyxnqfxQKI2Ncsk0gfqz5wwMgWAyR0R
	 wSEiN0O+h+OsCr45zE/AVP0h9V7vjw+iklvGxntQ/cwEjQ668fX+q7ZNvsAWAuCnbX
	 ByuKEzWtSQ71KctGcmmul6ypubbhZDF4k5uirUtO+pJuonoIRG+0CxaBJLCwoUTHn7
	 9DPdbMnx3vQEw==
Date: Wed, 18 Nov 2026 15:39:36 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shivank Garg <shivankg@amd.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Luiz Capitulino <luizcap@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/page_ext: remove unused page_ext_iter_get()
Message-ID: <av2qmOfuu9QMny5o@kernel.org>
References: <20261117-unused-sym-page-ext-v2-1-900f4c3c6856@amd.com>
 <e745f91b-3312-47b9-965c-510bf0a0b7f7@kernel.org>
 <20261117111336.ee49c0d4722a042c071c68b0@linux-foundation.org>
 <5541ef01-f9c0-4ce1-b77a-5bb81c6cfdd4@kernel.org>
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
In-Reply-To: <5541ef01-f9c0-4ce1-b77a-5bb81c6cfdd4@kernel.org>

On Wed, Nov 18, 2026 at 11:10:45AM +0100, Vlastimil Babka (SUSE) wrote:
> On 11/17/26 20:13, Andrew Morton wrote:
> > On Tue, 17 Nov 2026 19:50:09 +0100 "Vlastimil Babka (SUSE)" <vbabka@kernel.org> wrote:
> > 
> >> On 11/17/26 17:26, Shivank Garg wrote:
> >> > It was added in commit 9039b9096ea2 ("mm: page_ext: add an iteration API
> >> > for page extensions") but has never had a caller.
> >> > 
> >> > Signed-off-by: Shivank Garg <shivankg@amd.com>
> >> 
> >> Added to page_alloc.git for-next, thanks!
> > 
> > Thanks.  Helps.
> > 
> >> Hm page_ext.h should be added to the PAGE ALLOCATOR section. Wonder if
> >> Andrew's patches adding various missing bits included that too.
> > 
> > Nope.  I'll add the below.
> > 
> > A few things under mm/ include page_ext.h so perhaps more mentions are
> > needed.
> 
> Thanks! Stuff that includes it are its users and not necessarily page
> allocator itself. Nothing jumped at me.

The whole initialization part is in a way mm_init ;-)
 
> > I'm presently carrying no patches which alter page_ext.h or page_ext.c
> > 
> > 
> > 
> > From: Andrew Morton <akpm@linux-foundation.org>
> > Subject: MAINTAINERS: add page_ext.h to MEMORY MANAGEMENT - PAGE ALLOCATOR
> > Date: Tue Nov 17 11:05:44 AM PST 2026
> > 
> > Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> > Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
> 
> Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> 
> > 
> >  MAINTAINERS |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > --- a/MAINTAINERS~a
> > +++ a/MAINTAINERS
> > @@ -17779,6 +17779,7 @@ F:	include/linux/compaction.h
> >  F:	include/linux/gfp.h
> >  F:	include/linux/page-isolation.h
> >  F:	include/linux/pageblock-flags.h
> > +F:	include/linux/page_ext.h
> >  F:	include/trace/events/compaction.h
> >  F:	include/trace/events/page_isolation.h
> >  F:	include/trace/events/page_ref.h
> > _
> > 
> 

-- 
Sincerely yours,
Mike.
