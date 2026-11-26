Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704349;
	b=G1UHfx3CgOJqaCnLSyqAYVkQrUZ9Pb+U32IS4O05tsx61UfJvKjohrVaVhiUwIrLgq4a
	 C3MBAo4A796nvQo2uV3MIx+3jY+SC0k8zzKPzhI366o+spm8WyWI+SpIY3nmEKJUvz5Pu
	 PZFJDR1vpvCCGDYZxjMjyKnzOlDEPAe1488U278tVf5yZj21YngASg7Nhd7jXw6NlrECv
	 WszB0QWdGd6hq05Sh8XsK0N9MmMEXXsMyAVBs1QVUY7/SGPJH5EH196b8ZAgkl5rogT2P
	 eLyj1DNicMVGFwy49o06FwIoYdFQg/EtGPAgsEglaBtFaJ9ZQQ1HI08VX7x49Qxbj/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704349;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jL8G5ucVxhl6XpniwOn5qtswk6ptTrbZ5+4HABky+sU=;
	b=xHKNTgaPSrKLa++QdfyL0QllKx8g3gS/UfQrSXzw0RLZG9s3hZNThcRDXTzsSxN7us4X
	 00i90xpZUWekPQbX0WJl7nHbPh7ZHt+OnvdkV5w2lk/EL6Op5qbQptjdYl0AbQKvlXp+g
	 QjOpUu2swhhgIil27XQnplfo1x/5rn2hj3NT3j5bJJ3g6DKh9PwFSGKQbL+aMcV+GN7iR
	 LFeg3CJr7d2TqAGjdZ8fCxRlKENoxbeJCosndtttZHflcms2EdAWZJMUthpsseuUhgvLR
	 bw4kc4kNss5MhxG0zFXpkjwfYoUjt+1RmxZ30ULeXyeBFsCmvUCbpc5ot1V0ZFaYlXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYpHcabK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EF2606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYpHcabK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143091F000CF;
	Thu, 26 Nov 2026 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704349;
	bh=jL8G5ucVxhl6XpniwOn5qtswk6ptTrbZ5+4HABky+sU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QYpHcabKB8A5uWvZwYP0lVVKukfxNBAoWXWIiefHci3pC7KeBZuK9SW74oFBLaL/n
	 cqoy/YByLDr3wbHOeVLQpYgccznfeMUzUqdPzyy/mCPSRwNus9t2fEJhvgOyNiL3Ik
	 CpxHXbHuwbSmrgI4HhKBY+dqG7HxT/ovasWRAo0bThZaUsMYGqyANx2X2Anu9ZHqac
	 RWPcSr0SxN5twTU4v1fxRR5LjIFgxbooxghKmaVh6D3j6/M3FOYhCY0I3/Zdg+WZ6G
	 iOxtN+NF8R5vwquyyXJSd3DGD1douEkXCCA5EFXRUm/A1kmTGvX3KeW7M5TR77O7KZ
	 gdo+aWcLq46mg==
Date: Thu, 26 Nov 2026 14:45:47 +0000
From: Harry Yoo <harry@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable+noautosel@kernel.org
Subject: Re: [PATCH 1/3] mm/slab: update the documentation of sheaf_capacity
Message-ID: <awhCltyLWlLRBtsG@thinkstation>
References: <20261125-sheaf-doc-update-v1-0-4a579abaf0b8@kernel.org>
 <20261125-sheaf-doc-update-v1-1-4a579abaf0b8@kernel.org>
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
In-Reply-To: <20261125-sheaf-doc-update-v1-1-4a579abaf0b8@kernel.org>

On Wed, Nov 25, 2026 at 08:35:12PM +0100, Andreas Hindborg wrote:
> The documentation of the sheaf_capacity member of struct kmem_cache_args
> describes sheaves as an opt-in feature: a non-zero value enables sheaves of
> the given capacity, and zero means that no sheaves are created.
> 
> This has not been the case since sheaves were added to most caches.
> calculate_sheaf_capacity() now calculates a capacity from the object size
> for all caches and returns the larger of that and the requested capacity.
> The requested capacity is thus a minimum, and zero selects the calculated
> capacity, as pointed out in [1].
> 
> Update the documentation to match.

> While at it, mention that a non-zero
> value makes the cache unmergeable,

This is not something we want to guarantee in the API?
Otherwise LGTM.

> that the requested capacity is also not
> used when slab_tiny is enabled, and refer to the debugging parameter by its
> current name, slab_debug.
> 
> The updated text refers to the slab_tiny boot parameter, which older
> kernels do not have, so exclude the patch from stable autoselection.
> 
> Fixes: e47c897a2949 ("slab: add sheaves to most caches")
> Cc: <stable+noautosel@kernel.org> # slab_tiny is not in older kernels
>
> Link: https://lore.kernel.org/r/8a73da1c-0167-4aa5-a62c-4190327685cd@kernel.org [1]
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  include/linux/slab.h | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index ad645967a3ee..64daeb239f78 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -351,13 +351,12 @@ struct kmem_cache_args {
>  	 */
>  	void (*ctor)(void *);
>  	/**
> -	 * @sheaf_capacity: Enable sheaves of given capacity for the cache.
> +	 * @sheaf_capacity: Minimum capacity of the sheaves of the cache.
>  	 *
> -	 * With a non-zero value, allocations from the cache go through caching
> -	 * arrays called sheaves. Each cpu has a main sheaf that's always
> -	 * present, and a spare sheaf that may be not present. When both become
> -	 * empty, there's an attempt to replace an empty sheaf with a full sheaf
> -	 * from the per-node barn.
> +	 * Allocations from the cache go through caching arrays called sheaves.
> +	 * Each cpu has a main sheaf that's always present, and a spare sheaf
> +	 * that may be not present. When both become empty, there's an attempt
> +	 * to replace an empty sheaf with a full sheaf from the per-node barn.

>  	 * When no full sheaf is available, and gfp flags allow blocking, a
>  	 * sheaf is allocated and filled from slab(s) using bulk allocation.
> @@ -375,10 +374,19 @@ struct kmem_cache_args {
>  	 * Bulk allocation and free operations also try to use the cpu sheaves
>  	 * and barn, but fallback to using slab pages directly.
>  	 *
> -	 * When slub_debug is enabled for the cache, the sheaf_capacity argument
> -	 * is ignored.
> +	 * The allocator selects a default capacity for the sheaves based on the
> +	 * size of the objects in the cache, with larger objects giving a lower
> +	 * capacity. With a non-zero value, the capacity is at least the given
> +	 * value. Use this to match the expected maximum size passed to
> +	 * kmem_cache_prefill_sheaf(), to avoid low-performance oversize
> +	 * sheaves. A cache created with a non-zero value is not merged with
> +	 * other caches.
>  	 *
> -	 * %0 means no sheaves will be created.
> +	 * When slab_tiny is enabled, or when slab_debug is enabled for the
> +	 * cache, no percpu sheaves are created and the requested capacity is
> +	 * not used. A non-zero value still prevents merging of the cache.
> +	 *
> +	 * %0 means the calculated capacity is used.
>  	 */
>  	unsigned int sheaf_capacity;
>  };

-- 
Cheers,
Harry / Hyeonggon
