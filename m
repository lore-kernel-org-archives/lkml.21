Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619294;
	b=M6T1iNEiX712x5GEKAd5zNqmMrssYTjjMMK4fTEFZX4fr59SdhdC8ifacY6b5zwEQZah
	 BgE7wnk7gIrmdyW4eOrKZBIKynUh9zvkpcv+Q5uBp4SF4kquL2o/L63AbYDT0ItcG1h2f
	 4mRWJNyvDDDBRqk4o6DaFn08sbgrvqjEvNeR1Zxx8oNwITL5ZgPlFjuqPYja5nSIdB8ME
	 EJrE2PhyxQA5UnmBNn4ORAF0TV1XlM1rmXq/H6Wc1/Lme/rZKAlR3iKzbbFdxyp5a4tiY
	 RWfcSWOtrBl0k8KAKWIFiBWgpr5kQjGaNiXGk9ZWo7LczMfKkqLekFvk6qEAW5EyrPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619294;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ab6sDbemIaeRzn7SHeKjklD9tikH4paIVcHamWm/hko=;
	b=edIdNhVQ6xAWi5jyvCe0vel1R9BebA440+AK3j1yFU9jkvYOMNchioIo+lliUhQzPven
	 TE70iKnCSbxxNYpVz7L1QDVv4yuL/B5la40TxJ27DXW7Ebj7L4xJyBIPlzES9y4LQPJ/W
	 8W49hvsc8+f7zm0tLMwoKfrrTq7DnUmhHT+WCepWNJpy7QKG9hM6XeFBPsg5lJ8Smc03M
	 C7/Z3cP8UAeiqYhcAzeDf+4JGY016aslr0OmszFeX+NM4HWW01+XeU33YtoCP5jARHQPB
	 NkdA1k/qyPC4zGRp2ti1FvEBhrxEZACwk4WywK4ojqUKVE01ut/+PY3UK27w7XAiPeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S7DabLGt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4DD606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S7DabLGt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C7C1F000D1;
	Wed, 25 Nov 2026 15:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619294;
	bh=Ab6sDbemIaeRzn7SHeKjklD9tikH4paIVcHamWm/hko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S7DabLGtDTOKMSvXXcu7iMdY7NRE3qud2szwhRNeTv70gjiwDzZFLTsBbgZv55wAf
	 hEcaHeIhYNfO9760VtVwtjDxve5IRjoxq6XhrSG/EBCadMCUkqyW17HVSk5B5JNlEI
	 27Wd01QLoTGAYutUCXdP9aUSDr2rbWI2jI8cFI7qSiG38+hgMVpXZUMVh95tva1N/P
	 DBpfpu06cOBb7OV/4BMN1D26nLSh4sTnltp5MYZzGl2pIuW6oDxceV34bNKB2xze/q
	 NQGEMlFoszpqGFv9v63LwXs05Z3WRZgrxQnz42mccNV5dprMdnAC7EuOLlG6GYDVZq
	 AzkCkjqGawQ1w==
Date: Wed, 25 Nov 2026 15:08:12 +0000
From: Harry Yoo <harry@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Jan Kara <jack@suse.cz>, Quan Liu <qualiu@nvidia.com>, 
	Lee Trager <ltrager@nvidia.com>, Seth Forshee <sforshee@nvidia.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/slub: Respect MPOL_BIND when taking remote partial
 slabs
Message-ID: <awbyHcZjHYvOizeI@thinkstation>
References: <20261119160430.1113397-1-arighi@nvidia.com>
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
In-Reply-To: <20261119160430.1113397-1-arighi@nvidia.com>

On Thu, Nov 19, 2026 at 05:04:30PM +0100, Andrea Righi wrote:
> When the local node has no partial slabs, get_from_any_partial() and
> __refill_objects_any() take partial slabs from other nodes.

There's a tradeoff between memory usage and NUMA locality and the
kernel by default favours reducing memory usage.

This could be tuned by /sys/kernel/slab/<name>/remote_node_defrag_ratio.

> The scan
> only checks cpuset_zone_allowed(), not the task's mempolicy, so a task
> bound to a node with MPOL_BIND can get objects from nodes outside its
> policy, even though new slabs for it are allocated on the allowed nodes.
>
> slab_strict_numa doesn't help here: when the local node is in the bind
> mask, apply_strict_numa_policy() leaves the node as NUMA_NO_NODE and the
> allocation takes the same path.

This sounds like an issue to be fixed in slab_strict_numa?
NUMA_NO_NODE allocations should still honour the mempolicy, no?

-- 
Cheers,
Harry / Hyeonggon
