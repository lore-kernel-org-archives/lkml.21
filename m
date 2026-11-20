Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201307;
	b=Rr/OKaZeKlIEPOW24v4R1pAJ621UffMKjC7NdR1mTUxEoSH8Hub6zbENwnWVGsAmTtzJ
	 A1XqDwNmFmbE6cCYZE2yOUjZqtKnQrWcCgzFZA4OFgVS2kbVsTOLNoKTZ5u7IQSEACnXR
	 2hn+kg/zRrpXYB5yfVNFh/Ls1khw2eDPcLGxFQNnzO2P2yvaBvuGniTOxPHhsojzX5wEf
	 FH1pfmcfd0aRR6KfrUTVfRQ0sedLjdxA4/W3TKYbP8g2AmVSorsJJdSGELVvjBFSVRg1Y
	 QBM0gWdUl7nJkzqaGo+QO6Ea4t2ZQ05dpI+Ifb8zqxQPr67SFVmL3dg+ZUR2uBmgA9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201307;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jAbXwSHlaOeW7scWA+gsgK03fkcumfiN9Y1Ul0ztR3Q=;
	b=uf9oYmXBVyQE1g2qmeN0rG+dEytOSZ3stsS3/Bkr1UFqX9CLT9Br/rP0M2+Kjec4JaHQ
	 KpQ+4NG8PLGpaIaqempfK1ziGjSb4OZqOzbUu3xviYO6Byzcq9gTVLeK7Vmy2VjCiqKtn
	 Skf/WazmPHOx0pPzKQQlEncsoebyzQyVqE0ut1Vi/+bZjzeTpAHU0JidFc4vk1qWmXxT9
	 WctclFnsuHvwqj9HLd0j6cBe0lb1qJl9jAUwGXmqSX30464r7LHGHlBGlZ6X7uV+tJWNf
	 svPZVuK9sRddPllv6nORnIINZg/096BaC9sw8p2BMXSwTm35VIC2SxxJgHk+SeTBZ4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NQ1LZEED;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A584E60A261A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NQ1LZEED
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A581F1F000EE;
	Fri, 20 Nov 2026 19:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795201306;
	bh=jAbXwSHlaOeW7scWA+gsgK03fkcumfiN9Y1Ul0ztR3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NQ1LZEEDRLTXfx2Bbod9UFTu8QRPTlWXQpgWKnXFF2ftGYX0kGP+sicczSIXP3BgB
	 TNm2f/Pmwp4WpLdfA4qRxWQIdF8mzgzIvc4GlkibwUkm2VfgLKUm3VSt7IhvMQl7KE
	 4MRztHy0i2f/0Pdjf4MVtB64Sv7xvsFNjaIQa5QFZxXmJwbO6lkNH4KJJBN8c2tfLE
	 uMDcBaTvoXGX9j7lp8aOFR9N1+5JxmG2yiKBJFLpxKxqxqgEe9RAHI40aIoJj3E84b
	 skJKY1TjCKV4FawPSUC+uPEB2iPXJkI8fcfuxnlwy37kRAlvCtLjMv+yqZhJWL6gYL
	 zPeel2LWt5xfA==
Date: Fri, 20 Nov 2026 19:01:42 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Christoph Hellwig <hch@infradead.org>, 
	Yuan-Hao Hsu <aa9736195201@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v5 5/8] mm/gup: break out gup_lookup_pte() helper
Message-ID: <awCZDX2IG2VKgSKx@gremlin>
References: <20261116210127.3837898-1-riel@surriel.com>
 <20261116210127.3837898-6-riel@surriel.com>
 <avxXgTBaJkPN6XOh@gremlin>
 <89e41824f1371b5880029f264e19b5d0589ae22c.camel@surriel.com>
 <awCD56Ncl5_Tjrl6@gremlin>
 <5f18488c8234ee28e9c638abacf4961311d866f6.camel@surriel.com>
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
In-Reply-To: <5f18488c8234ee28e9c638abacf4961311d866f6.camel@surriel.com>

On Fri, Nov 20, 2026 at 01:10:47PM -0500, Rik van Riel wrote:
> On Fri, 2026-11-20 at 17:33 +0000, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Nov 19, 2026 at 10:04:04PM -0500, Rik van Riel wrote:
> >
> >
> > Right, I think I need to see it in context to judge really :) but
> > obviously we
> > can't be introducing completely dead code like that, even
> > incrementally.
>
> Agreed. That's been cleaned up now.

Thanks :)

> >
> > >
> > > >
> > > > 'need_no_page_table' isn't a great name either. Maybe is_none or
> > > > something?
> > > >
> > > Maybe pte_is_none?
> >
> > OK, let's see how that looks in context.
> >
> > Since you've not replied to the rest of the reviews I will assume
> > implicit 'ack,
> > will do's or what not on those? ;)
>
> Those are all "will do's", or rather already done
> but not posted yet because I'm combing through the
> series for other nits like that to address.

Ack, thanks!

--
Cheers, Lorenzo
