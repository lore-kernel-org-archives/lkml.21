Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700448;
	b=C2xIRiPZTGoroIwv8GqxTzArgcDOBiFF0MPjg4fvxN/ifMszmDxFaUbMNcE2WEsja2D8
	 uuOja8DN9mOw6JYzkUEx3FPBJMVDkXVgdisMkazNd5u0BEdyDNyOnyltG4xWl+xQocDQd
	 OtydWDD7w2TobV3MSUCbXGcEWbpE1pQEMG6U5k7hrzdK8YawgGWmpfXeiLOKuCUemGGjM
	 PPbX3G/aR1btPRzLfDbEsA5JJ4ovwduFLdWvEq38/UyNLIv1mBtliBSLjtpVIHW6KqXTX
	 b/iP1Mku81Spb5EdmTonwaJecFhuCb0VAU2NZ9c8LYbLh2suhZtbXySVW09/5KlXVGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700448;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bAOfoeKeKxAJG4Ybe8EL4xCrZltisidYWdcuZ9V3nfQ=;
	b=5Y6QrFIBo0Riz5sj+wfaPmkm6Z1VUU7ondN52/P0FuN6WncCB2GARJVp0sadMs63f8E3
	 6dkrq+7HwSjwUkqCTV70+CjQmFZtoK35xuo3FVKNt4SeZkdApLh4vdNjpFd2FvRl0DmFB
	 yN1GotjdH9ES0kJanhhSUeCSTkDrsx0I1+twBfBf1rxLTFm2xdV1nVA+00KnW/qWcpU6p
	 of5ClZAwYa53FxSprAzf5FnnZY+ja63Ghdrjwxs7wTGZnHRqeUVSxNWXnOmhrxN3LDYIj
	 Q5OJ7sVTNv12EYhVbg7MpsQjwzSBF1hbaIIK7+n3kiv+1/hv76d5i+r2HdB1bjMqDNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZFs7hwb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E00606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZFs7hwb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D991F000C4;
	Thu, 26 Nov 2026 13:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700448;
	bh=bAOfoeKeKxAJG4Ybe8EL4xCrZltisidYWdcuZ9V3nfQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WZFs7hwbk36kn+GBI+c8t5i41KZDS/3/LAf7XexggQnLBjkPuU2Cs+By6As13zHew
	 20d0NGnspLYu8J2+pSXdKWbU3G7QINN0gUQbUx0b0xxRx5oYaY8EGhKpkOUDz4FpCf
	 pzS1LWE8oM9SKlYCFHeBNg4C999Z47GIHYcJZLunaElbCzb2iKad0xroDdKnCud33D
	 VA3+cpirnfuYW+akGOCckeJwVbZnuiS7cMA7O8ng93jjI0HNMCgx/7eHUFHk09AIHd
	 qW2UgwQGkw7ncPYnpTLP9pDHJRWSFAP3NvqHXmXsYJthg+/XUz9tzEqJG5Ytk/SPDl
	 28zW+KzoPtlVw==
Message-ID: <33f7be76-390f-42c7-935c-d2ad3d77ef6e@kernel.org>
Date: Thu, 26 Nov 2026 14:40:41 +0100
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
Subject: Re: [PATCH 1/9] mm/gup: break out gup_fill_pages() helper
To: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Yuan-Hao Hsu
 <aa9736195201@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Peter Xu <peterx@redhat.com>
References: <20261123195609.4115244-1-riel@surriel.com>
 <20261123195609.4115244-2-riel@surriel.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261123195609.4115244-2-riel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/23/26 20:56, Rik van Riel wrote:
> __get_user_pages() fills pages[] in an open-coded loop, and the
> GUP-fast PTE, PMD and PUD leaf paths each have their own copy of
> the same loop.
> 
> Move the store into a gup_fill_pages() helper, shared by the slow
> and the fast paths. The helper keeps a pages==NULL check, so the
> fault-in users that pass no pages array (faultin_page_range(),
> populate_vma_page_range()) need no conditionals at their call
> sites. Cache flushing stays open-coded for now; it moves into its
> own helper in the next patch.
> 
> No functional changes intended.
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  mm/gup.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index b0a0019de80a..e0698d2075b4 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -710,6 +710,25 @@ static inline bool gup_must_unshare(struct vm_area_struct *vma,
>  	return gup_pages_not_requiring_unshare(vma, flags, folio, page, 1) != 1;
>  }
>  
> +/*
> + * Store @nr_pages consecutive pages starting at @page into @pages.
> + * The caller must hold at least one reference on the folio, so it
> + * cannot go away, or get split while the array is filled.
> + *
> + * Some GUP users only fault pages in and pass no pages array.
> + */

Drop all these comments, they don't add a lot of value within this file.

Any implementation details should be commented in-line, but also that's not
required here.

> +static void gup_fill_pages(struct page **pages, struct page *page,
> +		unsigned long nr_pages)
> +{
> +	unsigned long i;
> +
> +	if (!pages)
> +		return;
> +
> +	for (i = 0; i < nr_pages; i++)
> +		pages[i] = page + i;
> +}
> +
>  #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
>  /* FOLL_FORCE can write to even unwritable PUDs in COW mappings. */
>  static inline bool can_follow_write_pud(pud_t pud, struct page *page,
> @@ -1579,9 +1598,9 @@ static long __get_user_pages(struct mm_struct *mm,
>  				}
>  			}
>  
> +			gup_fill_pages(pages + i, page, page_increm);
>  			for (j = 0; j < page_increm; j++) {
>  				subpage = page + j;
> -				pages[i + j] = subpage;
>  				flush_anon_page(vma, subpage, start + j * PAGE_SIZE);
>  				flush_dcache_page(subpage);

Ok, two loops. I assume on architectures we care about that would be optimized
out completely either way.


Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
