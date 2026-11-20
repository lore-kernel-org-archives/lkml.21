Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196013;
	b=glUZ32s6lwc/Kl7r4KSev8MiK1r6Qi2aXhokVKR4JsVWiVj/H+aqkyRwQkhlQHLF4cAO
	 kYU5ybf5SKbbkm/j9aVxJTZ0mAXb6JCHlBBOkjZSQBVQb3GmLmHCIdeKiaodTRRfjl87+
	 6RVyO/ZiVVLAEQNVKOZ9VgX1OxQoWESbBjgIt41ygLLT67f9IU9OxDMm/vv3yqydgVRT9
	 /2J9zdewiCwJIKZOTJTRBg/u4Wj+kbY9HJ4ZX6AePEXkGkA1hoydydOx5RRL95DS3w63B
	 U6Dtrejzx6IzzUsHr8jhkUACREjQa5DWbJjNuzv5Z+PbA5gvFpgvv8Ch99Ura/5+EZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196013;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Arq4ZupDcmhiLMBgMCtvkojQM2xEuqkXJFom5GjrF7k=;
	b=oJyL0MJ5HhEVME3V5hoPB1V6jDointFbbCqqFQMfaj6o35t1xcUc15n8k1J7wYJcJNmJ
	 WSq8C7wv9A3yLqa506QDqtiq1v5Bb3JIXzdNQrzqBvl0YWHd7G522PUYAjNFom1oiNPMH
	 z9ftdIn/p+TElCDKfeLyCcTA7yzPEbwcjsSZSE8cqnJF3sPYK1raMzYPN3kPtnUKlgB42
	 LoneiKfqVefFxuDtV5SU5cajmQ7KMLVAc6f+9FfNyas+7dAXGs+4TSM3hKs+Ryz4pMVbG
	 K/LpzxYGbyAb+vSmjDaEKNw8gBW6ZYDJcvIde2kuLjheFdQIcnzu4RPRkGAuO+ELePg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6IHrBc4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B42606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6IHrBc4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1541F000CA;
	Fri, 20 Nov 2026 17:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196013;
	bh=Arq4ZupDcmhiLMBgMCtvkojQM2xEuqkXJFom5GjrF7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X6IHrBc4sPEWvfGtTrmXHiTVGJ8pC6ELePyhHwK2UqV7GGN32ejxyrelfCct720gJ
	 H6UiJgwngKpOcZ+h1OayvsXTWmwqGoLNj9VvXh0knCCMxbJoW6azz/VWUKaCPUXZqE
	 kcAOcw20iuqvVY0FvoswQPFDRBo7w6V9yaQo0OFvU2aPdWnZT0MhPe2hX/KNBE4ffG
	 pCismMxf43LQSGcnY/znHctajMbuUeMnT0EfKPCUAES0nZTKvAXjiG1DT5oD0li1oH
	 rJyCt/SvaBxu8V3cJlLTnMvMGYXMAwS/6fThFdkWX3H5ptbwNy3HtaNEvPRcxiVqOv
	 vFvJ7XylkykLw==
Date: Fri, 20 Nov 2026 17:33:28 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Christoph Hellwig <hch@infradead.org>, 
	Yuan-Hao Hsu <aa9736195201@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v5 5/8] mm/gup: break out gup_lookup_pte() helper
Message-ID: <awCD56Ncl5_Tjrl6@gremlin>
References: <20261116210127.3837898-1-riel@surriel.com>
 <20261116210127.3837898-6-riel@surriel.com>
 <avxXgTBaJkPN6XOh@gremlin>
 <89e41824f1371b5880029f264e19b5d0589ae22c.camel@surriel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89e41824f1371b5880029f264e19b5d0589ae22c.camel@surriel.com>

On Thu, Nov 19, 2026 at 10:04:04PM -0500, Rik van Riel wrote:
> On Tue, 2026-11-17 at 13:48 +0000, Lorenzo Stoakes (ARM) wrote:
> >
> > > +		need_no_page_table = true;
> >
> > This is set true but not used anywhere? This is dead code no? Am I
> > missing
> > something?
> >
> > Patches should be incremental but adding completely useless locals
> > incrementally
> > seems silly?
> >
> > > +	}
> > > +
> > >  	pte_unmap_unlock(ptep, ptl);
> > >  	return ret;
> >
> > I'm guessing you forgot to include the code that works with
> > need_no_page_table here?
>
> That code is in patch 7. The check isn't needed
> yet in patch 5, and it got shuffled wrong during
> some refactoring.
>
> In v6 the need_no_page_table thing will be in
> patch 7.

Right, I think I need to see it in context to judge really :) but obviously we
can't be introducing completely dead code like that, even incrementally.

>
> >
> > 'need_no_page_table' isn't a great name either. Maybe is_none or
> > something?
> >
> Maybe pte_is_none?

OK, let's see how that looks in context.

Since you've not replied to the rest of the reviews I will assume implicit 'ack,
will do's or what not on those? ;)

--
Cheers, Lorenzo
