Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585016;
	b=kQJmZlIUsvgS8f+rC1ys5B4DpihuR2onVRgRRQ8lPDXZ3CXzv9HS6E/1F5c8do6VjK0y
	 eL+IU4sLYMqfke7LOvZCTGg7aEXzGGRtMmeDfau+7/YGUZcWefef/ju/1ZNNvZtEyW4rg
	 Ie4M2eywzmfjct1qondH8Qyoy3GVstbp1uNZcAuJOIgmaycMB+F0zO6527moSwcw5cwkk
	 nB3j6M7nArulgd2Pcpj37sp4WHFiFU8nil0K7xGMafdJp4JBYFp8lAh9AKjUcggQMYZBN
	 vE/7UYoT3VEnZzXUNpdKqrxFs/EreQYhMYjQ0tMaIArC3ojgJLw6h859aiNofI5GymQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585016;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-SRS-Rewrite;
	bh=6tY7qXPR+c8tZisw2M9xzYszGIvCapp/QNzy3udpL9k=;
	b=Z/GHEhX3pKUwIPBO7Erdq2DuJIMRpgMs0su8EvNVCQMqXVjnT3/OE7gCgwwnzGKr2YFi
	 k1LgpdStjQDQcfypdCJFM5vuxCy7ApQGvPMOtY9Hj9XGqkLTmdxFTDXVZcyaTl2Fgl0YN
	 r6uWMbsZxirXkfUxmeALsAPaGUU7lU5mPd+TMvB46NcS/1p/ivWVOI7ie66TJ5LWNbakL
	 TRJS1eou1Hw3y54lOu9/NxVkfe0Z8BMi/iHG6365yA3/yXyclGoJUIAN1f5OObt+OH7HB
	 Yab2HlOnvaMyvvavFlL9JoqcUhBHzDL0uwjW16nhHQdEegPv0oIc13gwAuwReYJPzqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=none smtp.mailfrom=bombadil.srs.infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hj+Mnvzl;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EA2606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64EA2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hj+Mnvzl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6tY7qXPR+c8tZisw2M9xzYszGIvCapp/QNzy3udpL9k=; b=hj+Mnvzlg2D6efDaM7VGu2tcWZ
	Wt3E5/jwvZcLhiACnZqF6kDijNXXjHGGUL21yLs44x16ORA0BlXLnmydEzfg3EkMqUob+ijhFbXem
	FLsdSScnK67WKo0xPL82Ya36hOwF5RcKMCrrq+RPms0w/DyT6bKVB1ipAToYSYV7aosO5RBbou9/0
	wIaQT5ACkeEKOY9XI682VV5JiedWNwyq/d26EIG2bi9sfXMsSFDvJr2ptqTVvXtqvAsReugOqcwv/
	VZfkJCbkzlRtt+cstChUoowdChjU0T6Pl/CpUku3eHCgfq98v9J9mMa/GW/7sUbQ/k+bM0TAE23KP
	CP1ux0mw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5gQ-00000008TSS-3Fz1;
	Wed, 25 Nov 2026 05:36:42 +0000
Date: Tue, 24 Nov 2026 21:36:42 -0800
From: Christoph Hellwig <hch@infradead.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] drm/i915/gem: Skip writeback of shmem folios with extra
 references
Message-ID: <awZz6sq_4cjIgUcq@infradead.org>
References: <20261119134243.3745282-1-kas@kernel.org>
 <av8n42vx3Q7zvQK8@zenone.zhora.eu>
 <awBIB3vjr_o-gfCn@shutemov.name>
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
In-Reply-To: <awBIB3vjr_o-gfCn@shutemov.name>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Nov 20, 2026 at 01:17:31PM +0000, Kiryl Shutsemau (Meta) wrote:
> > >  	while ((folio = writeback_iter(mapping, &wbc, folio, &error))) {
> > > -		if (folio_mapped(folio))
> > > +		if (folio_mapped(folio) ||
> > > +		    folio_ref_count(folio) != 1 + folio_nr_pages(folio))
> > 
> > I don't think we need this fix in the current tree. The i915
> > writeback iterator already skips the shmem folio in the case you
> > describe, so the new refcount check doesn't change the outcome.
> 
> Oh. It took me a while to see why.
> 
> __shmem_writeback() asks writeback_iter() for PAGECACHE_TAG_DIRTY
> folios, and shmem never sets that tag, its ->dirty_folio is
> noop_dirty_folio(). So the loop body never runs for any folio, and
> hasn't since 776a853a43c9 ("i915: Use writeback_iter()").

Heh.  I'm surprised no one noticed..

> That makes me question the whole writeback thing. What's going on
> there, and what's the plan?

I (and others) have been asking forever to get drm out of micro-managing
tmpfs.  I guess given that this code path hasn't worked for a year and
a half is a pretty good indicator that this instance should simply
go away.

