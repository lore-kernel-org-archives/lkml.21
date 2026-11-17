Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941414;
	b=L6bWxKFXor8Qu+jVzncQrtov5Tv48WALNa9IRsnHaDHeGzmi5fqz79ohsBffzcDI5c/Z
	 PjAWBCd3UybNzU/ENmDVMdAhCmtcY3AjWlfMSCq+gwOilseo054ffy9alpRYf58jLYZxo
	 7o8claGC+Qp2tpmyHI5tPPEbMO16dZBd5jr/b9F4lAALRueyye6FfyhLp6B5HHptty2lR
	 mnYKOswLZVXBKt0UGJp1HSjb1HgOYa4+o8dPd7wSI75UMQWO9ATrG/k+BtVE/+/TgWHeM
	 hgwclqPhK7C6N5dMfHBDq701biV40wUq39uSyDbnzIAcPtYQw66W8EgEPT6qj88wmuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941414;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=p9NeYt/WaadBbJ1e2r7STVt+39oaMfNx6g36ELKjJJk=;
	b=JJifPw3HjUQRLvVTJQJEuMf2C4yw5Qy5GOGsRr25qaJwGIBVfpsHMNLAFxuKQcI6ntV9
	 H/ItI5P4aJ319kqp2z+hCKljaNlh/a7kWM346+QyqBpcZeqtcEN/u8kXNn9lhS7kB7Ptw
	 Ygpg6rR1gmPrT6zh2TuwXoCPO/r1fW0CQ2qJb2SffdSRHtL0GDi8f+Yz/yK8p1YhcCN10
	 6sF/W2j7l5fHX+rXxHIS1CGTNJfbt2zP4nKXONtMjarRZLYgV6Yp42sOy8Sa4u2C1BJ56
	 MK/7LiIMfMo+EmsaKdQsrmp6DIbBYwa43Zs+vDJV36lbxPViXWYYYcnC28bUo7xGF9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UCFUmzxo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D63606A89E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UCFUmzxo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE181F000C4;
	Tue, 17 Nov 2026 18:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794941414;
	bh=p9NeYt/WaadBbJ1e2r7STVt+39oaMfNx6g36ELKjJJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UCFUmzxokdhP8BS9o8k3QR2qX66z/9rsmtmeOyKd/DoKxSiXtmar4cr8fQJ4TLnNT
	 x35aaxWjfhY3ocQe4oJIPu24u3K9xjdd1gtRsvygj6UF7udROGtFvYJbhdHB+rfKBr
	 ZcQ1IGvYbUFS8U4CdeKD8k5xZYTj4dPiAYOx/qvHhFnkpUcO97LOdty03BX5/5HQy3
	 xhJY6eK9zHQSw48Fin2SvXkxBWPwHFsg13hXr/1WdEgvKRcA95u0GKTyWKlhet91Bz
	 mIsYTqAKlQBKy0S4j8dljG/cKuxCZAiPgl/fVMGFvxsVFKQX0ufKZbfXvsDx433B2l
	 4YGLhwXCutNZg==
Message-ID: <e745f91b-3312-47b9-965c-510bf0a0b7f7@kernel.org>
Date: Tue, 17 Nov 2026 19:50:09 +0100
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
Subject: Re: [PATCH v2] mm/page_ext: remove unused page_ext_iter_get()
To: Shivank Garg <shivankg@amd.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Luiz Capitulino <luizcap@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261117-unused-sym-page-ext-v2-1-900f4c3c6856@amd.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261117-unused-sym-page-ext-v2-1-900f4c3c6856@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 17:26, Shivank Garg wrote:
> It was added in commit 9039b9096ea2 ("mm: page_ext: add an iteration API
> for page extensions") but has never had a caller.
> 
> Signed-off-by: Shivank Garg <shivankg@amd.com>

Added to page_alloc.git for-next, thanks!

Hm page_ext.h should be added to the PAGE ALLOCATOR section. Wonder if
Andrew's patches adding various missing bits included that too.

> ---
> I found this with the kunused scripts [1], which I wrote with LLM's
> help. The v1 cover letter [2] has more details on the scripts and
> how LLM was used.
> 
> Changes in v2:
> - Split out of v1 [1], as David suggested, and based on
>   page_alloc/for-next. No changes to the patch itself.
> 
> [1] https://github.com/AMDESE/linux-mm/tree/shivank/kunused
> [2] https://lore.kernel.org/r/20261026-unused-sym-v1-0-82ca2dceabe1@amd.com
> ---
>  include/linux/page_ext.h | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
> index 79c53ec45dfa..52a8b70c525a 100644
> --- a/include/linux/page_ext.h
> +++ b/include/linux/page_ext.h
> @@ -167,17 +167,6 @@ static inline struct page_ext *page_ext_iter_next(struct page_ext_iter *iter,
>  	return iter->page_ext;
>  }
>  
> -/**
> - * page_ext_iter_get() - Get current page extension
> - * @iter: page extension iterator.
> - *
> - * Return: NULL if no page_ext exists for this iterator.
> - */
> -static inline struct page_ext *page_ext_iter_get(const struct page_ext_iter *iter)
> -{
> -	return iter->page_ext;
> -}
> -
>  /**
>   * for_each_page_ext(): iterate through page_ext objects.
>   * @__page: the page we're interested in
> 
> ---
> base-commit: 3a99594e62fce8c646e8aac01d38af16d6833a40
> change-id: 20261109-unused-sym-page-ext-3fb8316ac777
> 
> Best regards,

