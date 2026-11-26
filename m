Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701885;
	b=p9jYVg7X/Be7RUYQQv2l242FsVSnGNYUacsQPmIjeFO2TQ06Mlz+Pwk8LKxp4iohPpmg
	 dCMil4/U6kalVQ0KEj12pAX/qamc6Tv/gk7hjRUB2+FoJKwHOWzCjc4xoHZI7WUfa6jo3
	 jaBt5aDZCd/OEHo9BOQ1Brg/tzYMM4Tl3SPKQmx1CqykU5jxEVuozHHp4JZAZax6IctZW
	 Hd4bZSVJgW7ep8aTQeqrAPpI0Lz3u9YWpfTGdjUgSrl7a3ty/avjMUlOMMrpHptV1en70
	 m4Z87vAtz++GjFwAy+elzU6fVBDK1UdO6tUDM1vfsmvxv7sZMNfcEV5mqSgBjW/4nhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701885;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pNMdGCArlzbSAdigoh9SFuXrBkD6+wA1jwUtEGp3Jfk=;
	b=w+/yUuVNbAGKyBrclqy3M4NY5izGbOe+z4Aff56CWST+jmPGiD0Ei3UlI4mnn7WKwzGQ
	 +5izdNpMLaFRxrTJcn0SNWs+Q11SPua8XJaWYQuxNhBmAWYlI+oFJ+/1B5JF45C+T5Hi+
	 2KX47xWSv63g/4Vo5pxK5HYUOI4fkV93AKn9KCUx/p3/mYHJdOSHqYaKxtj2oPzpctbVP
	 ukfPVdCuoW1f8H4wGh1qH/HG7n6CZw1jgmTjA3M8tq4wRtPF5v86qitAbWQhRwYG0//qi
	 cScMP3GO6UIxEktZE0jijq+YbleBSkc/ZJtq7jLPRErQqytj+bww+s9dS0QiraXu8iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZPhY/d2f";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255E0606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPhY/d2f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919831F000C6;
	Thu, 26 Nov 2026 14:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795701884;
	bh=pNMdGCArlzbSAdigoh9SFuXrBkD6+wA1jwUtEGp3Jfk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZPhY/d2f0Z0spfxLYiJQZAJ2Ae/g0/yUciIgcKYMpjN6X8VOLaeyjAGEnlJLIr6qW
	 v2qCp2VTfzE88g4PX2CHAmVIujS14JCS8YbnibHXrdRdqWfmTCI5LdAxX6wj8i+o79
	 ZK1Kr9L0gzQofpMoXIlS0MVSeMRPHcby9f+uJ7/xbi6fRocGEhsGuTK55x2wAdjzWM
	 +FLyZCiGy+u/WRD4flfGtNGqqxuYq1bF/G873bBzMZsFr9ZjNdBhwX1xdyaZ9fIZPl
	 Q2XvB7905yX4pG4JRqIprg3/GK8a0JGI2H0Xidp91J2YV0B906luegrwHlURBsezB8
	 pEbCfRw5EI+AQ==
Message-ID: <cfe8bf71-7b94-4cef-8b27-9e50c3229a4a@kernel.org>
Date: Thu, 26 Nov 2026 15:04:38 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] mm/gup: convert follow_page_mask() to return a long
To: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Yuan-Hao Hsu
 <aa9736195201@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Peter Xu <peterx@redhat.com>
References: <20261123195609.4115244-1-riel@surriel.com>
 <20261123195609.4115244-4-riel@surriel.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261123195609.4115244-4-riel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/23/26 20:56, Rik van Riel wrote:
> follow_page_mask() and its helpers return a struct page pointer: NULL,
> ERR_PTR(), or the page found. Change the return type to long instead:
> 0, a negative errno, or 1 with the page stored in a new pages[0] slot.
> 
> This lets the return type carry a page count rather than a single
> struct page pointer.

You can say here that we now make the interface match gup-fast.

> 
> follow_huge_pud(), follow_huge_pmd() and follow_page_pte() now store
> the found page in a pages[0] slot. __get_user_pages() reads that page
> back from pages[i], fills the rest of a large folio's run itself, and
> flushes the whole run's caches with gup_flush_pages(). 

You can say here that we will rework that next, to collect all folio pages from
inside these functions directly.

> The follow path
> itself never flushes: the caches are always flushed from
> __get_user_pages(), without any page table lock held.
> 
> The vsyscall gate area bypasses follow_page_mask() and fills and flushes
> its own slot the same way. The gate handles a single page, so it
> initializes the count to 1.
> 
> *page_mask and __get_user_pages()'s handling of a large folio's
> remaining subpages are untouched, and mm/gup_test.c

As willy keeps saying, there is no such thing as subpages.

"a large folio's remainin pages"

> (PIN_LONGTERM_BENCHMARK) shows no measurable difference for 4 kB,
> 64 kB mTHP, or 2 MB THP.
> 
> No functional changes intended.
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---


[...]>
>  		/* first iteration or cross vma bound */
>  		if (!vma || start >= vma->vm_end) {
> @@ -1523,8 +1536,11 @@ static long __get_user_pages(struct mm_struct *mm,
>  						pages ? &page : NULL);
>  				if (ret)
>  					goto out;
> -				page_mask = 0;
> -				goto next_page;
> +				if (pages)
> +					pages[i] = page;
> +				nr = 1;

Why not use gup_fill_pages() here?

But why do we goto fill_flush where we do another gup_fill_pages?

> +				page_increm = 1;
> +				goto fill_flush;
>  			}
>  
>  			if (!vma) {
> @@ -1546,10 +1562,11 @@ static long __get_user_pages(struct mm_struct *mm,
>  		}
>  		cond_resched();
>  
> -		page = follow_page_mask(vma, start, gup_flags, &page_mask);
> -		if (!page || PTR_ERR(page) == -EMLINK) {
> +		nr = follow_page_mask(vma, start, gup_flags, &page_mask,
> +				      pages ? &pages[i] : NULL);
> +		if (!nr || nr == -EMLINK) {
>  			ret = faultin_page(vma, start, gup_flags,
> -					   PTR_ERR(page) == -EMLINK, locked);
> +					   nr == -EMLINK, locked);
>  			switch (ret) {
>  			case 0:
>  				goto retry;
> @@ -1563,7 +1580,7 @@ static long __get_user_pages(struct mm_struct *mm,
>  				goto out;
>  			}
>  			BUG();
> -		} else if (PTR_ERR(page) == -EEXIST) {
> +		} else if (nr == -EEXIST) {
>  			/*
>  			 * Proper page table entry exists, but no corresponding
>  			 * struct page. If the caller expects **pages to be
> @@ -1571,49 +1588,56 @@ static long __get_user_pages(struct mm_struct *mm,
>  			 * for this page.
>  			 */
>  			if (pages) {
> -				ret = PTR_ERR(page);
> +				ret = nr;
>  				goto out;
>  			}
> -		} else if (IS_ERR(page)) {
> -			ret = PTR_ERR(page);
> +		} else if (nr < 0) {
> +			ret = nr;
>  			goto out;
>  		}
> -next_page:
> +
>  		page_increm = 1 + (~(start >> PAGE_SHIFT) & page_mask);
>  		if (page_increm > nr_pages)
>  			page_increm = nr_pages;
>  
> -		if (pages) {
> +		/*
> +		 * This must be a large folio (and doesn't need to
> +		 * be the whole folio; it can be part of it), do
> +		 * the refcount work for the remaining pages.
> +		 *
> +		 * NOTE: here the page may not be the head page
> +		 * e.g. when start addr is not thp-size aligned.
> +		 * try_grab_folio() should have taken care of tail
> +		 * pages.
> +		 */
> +		if (pages && page_increm > 1) {
> +			struct folio *folio = page_folio(pages[i]);
> +
>  			/*
> -			 * This must be a large folio (and doesn't need to
> -			 * be the whole folio; it can be part of it), do
> -			 * the refcount work for all the subpages too.
> -			 *
> -			 * NOTE: here the page may not be the head page
> -			 * e.g. when start addr is not thp-size aligned.
> -			 * try_grab_folio() should have taken care of tail
> -			 * pages.
> +			 * Since we already hold refcount on the
> +			 * large folio, this should never fail.

This code recently changed slightly:

commit 2d9bcd380585abc436f055fbb618b34f98882004
Author: David Hildenbrand (Arm) <david@kernel.org>
Date:   Thu Nov 12 23:53:24 2026 +0100

    mm/gup: limit pagecache folio refcount when grabbing references

So once you rebase on top of mm-core/for-next, there will be some smaller
conflcits but nothign earth shattering.


There is a lot happening in this patch. I wonder if there would be some way to
convert some of the functions before converting follow_page_mask().

-- 
Cheers,

David
