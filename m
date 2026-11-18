Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015450;
	b=oiPINpju0qENVmMPRP6xGXbKrXRKNYVQSAV6Wt1lbEsaIABNDwYV8wlSE/c/FSK4ObtL
	 yFwiE5vyUzXFctFFX3AdrKjN9JMUzFEKkRvUZ98GXrF6JiZu5C6RpdjseEZPldL77t7H8
	 FZpbiBsuCjEUBEJX2QtlHQ8c6zCb1vQvDKNxB/qAQyexltRttYbWO9Pkhvp0GZBZxBlhS
	 PLXbL4gXQr+TYIqb6kkWFNGRRoHowDJePMRIPe30xpzYEtbjXCZsmECFfqyT4RsLmZW8f
	 NV72HVUiRfSoq+wAdUzmQX8SxfunRfRbZbecxt0G5tMU02lycEfOtnf4U+vK3PkBQ1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015450;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=kmbZsgxhAIphLyAq/9MzstI8RqJRMtPM/mJm1aFe5zY=;
	b=Sujj7qmGesDmMYzSjvBFXjwUkx1S25Kt3TqJ1yfZh7pc3xTp8ax0gQKRTyGFIKYv8IE5
	 O4edbMjzU/SBIzig2w2dXRzIuDXDz4NvydVatKsoOdY05gwRxHpjcMnowMQDSOmiV2B8V
	 1DIk692SD0u3OPavlgSkkXgedywHgZZfXhuOWfzoSW4BZyLENpJ0cLy3nnbHBnMMg84Ja
	 aU2kRz1U59CGpl3pywz5iXUsRT+WK48uIg+KjFuZGfC6wsqx1ZYO1WiGMAKm3EFnqP3Xw
	 dUJ9dX1Rv5MtB5E6oaZ1yolExPM6tGanfYHd32wxz7ktRP0B70lBpDAnpsgbfa1FRJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GejiRf9F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F4A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GejiRf9F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD06D1F000C4;
	Wed, 18 Nov 2026 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795015449;
	bh=kmbZsgxhAIphLyAq/9MzstI8RqJRMtPM/mJm1aFe5zY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GejiRf9FZHvFECNkOxFs0RKue2gUVx2t1vcqbfLWa+GPDu8mcfukPU/9mFbi/HePp
	 PW640i+HsCuLY+ihoFtc1U9ZnsUEDx+fhNkkv+gr98AMEs77WIS3XoSuXgMajAU2I+
	 pQlcBIaYDyaTxnCoxsn6AwOaogjWs8TU3D0SgZmDd4g20L7KQB0p9dSEO2wNDKhtnW
	 2Yed6XeDFmXS54YB4dk9DQ6Ey6RkArhWqDcJ1E0F3nNBF4a80gYQgoqlD50fPtTAWu
	 ysO8+h2yxaEb+uWOF93OWPviMzF3fqP7mF3TukdmIvM2uBwf9bp7RPOU+MGrIIXZzy
	 qKUXUPtrOoAYg==
Message-ID: <3e4b8ed8-c435-4fb6-ac74-b3a9eb40504d@kernel.org>
Date: Wed, 18 Nov 2026 16:24:04 +0100
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
Subject: Re: [PATCH v3 0/3] mm: hugetlb: fix CMA-related issues
To: Qi Zheng <qi.zheng@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev,
 akpm@linux-foundation.org, osalvador@suse.de, azpijr@gmail.com,
 lance.yang@linux.dev, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1794046188.git.zhengqi.arch@bytedance.com>
 <b1c1c835-180a-49e2-86c0-bc3f65981728@kernel.org>
 <7e733c3b-2aa2-406e-a5ca-cd9a2c872f9f@bytedance.com>
 <bc6ffcff-3aaa-43da-91b4-82f27513c761@linux.dev>
 <1e0aa28d-f81b-411f-92a3-6038c3961443@kernel.org>
 <c3906ff3-c5ee-4672-8bab-2318185268c8@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <c3906ff3-c5ee-4672-8bab-2318185268c8@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 07:55, Qi Zheng wrote:
> Hi David,
> 
> On 11/16/26 8:07 PM, David Hildenbrand (Arm) wrote:
>>
>> Hi,
>>
>> sorry somehow I missed your mail.
>>
>>
>>
>> Ugh, what a hacky mess people created.
>>
>>
>> That would be cleanest. Would it break existing setups?
> 
> Yes, this requires an existing user to explicitly configure a 32M memory
> pool.
> 
> But in practice there shouldn't be such a user today, otherwise the
> misalignment issue would have surfaced long ago, wouldn't it?
> 
>>
>>
>> Another quick-fix idea could be to always allocate larger folios first.
>>
>> That way we should avoid any holes, right>
> 
> Ah, this looks feasible. How about the following?
> 
> (If that looks good, this could go as a stable-first fix.)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 6fba92b0f6749..32e65ce347c90 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -4556,6 +4556,22 @@ void __init hugetlb_bootmem_set_nodes(void)
>   		node_set(nid, hugetlb_bootmem_nodes);
>   }
> 
> +/* Return the largest early-CMA hstate below the given order. */
> +static struct hstate * __init
> +hugetlb_next_early_cma_hstate(unsigned int order)
> +{
> +	struct hstate *h, *next = NULL;
> +
> +	for_each_hstate(h) {
> +		if (!hugetlb_early_cma(h) || huge_page_order(h) >= order)
> +			continue;
> +		if (!next || huge_page_order(h) > huge_page_order(next))
> +			next = h;
> +	}
> +
> +	return next;
> +}
> +
>   void __init hugetlb_bootmem_alloc(void)
>   {
>   	struct hstate *h;
> @@ -4571,9 +4587,19 @@ void __init hugetlb_bootmem_alloc(void)
>   	for_each_hstate(h) {
>   		h->next_nid_to_alloc = first_online_node;
> 
> -		if (hstate_is_gigantic(h))
> +		if (hstate_is_gigantic(h) && !hugetlb_early_cma(h))
>   			hugetlb_hstate_alloc_pages(h);
>   	}
> +
> +	/*
> +	 * CMA ranges are aligned to the largest supported size. Allocate larger
> +	 * sizes first to keep the early reservation cursor aligned without gaps.
> +	 */
> +	h = hugetlb_next_early_cma_hstate(UINT_MAX);
> +	while (h) {
> +		hugetlb_hstate_alloc_pages(h);
> +		h = hugetlb_next_early_cma_hstate(huge_page_order(h));
> +	}
>   }
> 
>   /*

I think this should do. Best to send out a proper patch.

-- 
Cheers,

David
