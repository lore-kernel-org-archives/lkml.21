Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704649;
	b=TdT7h3LfyDZIpLM2rrb0fW28oytriC3FLLy5YCzP8V8Sfglrx+UKMqiTto4JbRoPrAuI
	 nktD6xS+HLfdvbuITakRAH8VZlc8xxR5RYRd3Yo9ty55Ud6xVfETaxjt88PEQ3dmme4Bv
	 QHPslcEb8jnCACmRGhxR/LwxmeoRsb2QBhkicZZH2zNKNNSURhTdG/ZCUBCHjNiCbORoD
	 VfOxoP034utBA9parLF3+M4/1Yb0SRUGo//Y3wyMwHuVpb3ETkuNuIYloJJi1E2IN3Ku/
	 wUvZxfWBN3uUpZq1yTYO/1IDnL0PwI/j9IZS6Xx8QgtbnRoMl4dC6NpWSOPyfDLd1aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704649;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BzSAPriKmxmZ03qlrGTjPQb+mIO8/xB1Y5Fffpd+Qhg=;
	b=GyVkF4a4JWOYOV06LPAS7XMa4Fn8jP27Nk6O9hRSfU+ClwiXBWLd0WiPT4Uee3b36IOa
	 Z54WQLikestkKw8/og67NxYFKsDSfw5Wwcfn4Z6I6EASn/bC2wuQxTCIBXntaugnS6duR
	 7ExkLXou1PdpN7p58oxfoAY34Wv++al4T1ouwOCP6ZGLL/RuMobWnMzbiwfpxV6CR8ruS
	 rdHuHg0sWEKzg5qvU/9gr7CFQMwJHUjwfx81txrTGouVlXrRW/h7YyfaBSMQKwTpqsYRd
	 KzpRVHcP1+jhYKZ60R6qpTGTg5k51DjaI+5VHtEJ9lbS0FgHQF9FIXg0RAk8+37PUcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MM+gUYz+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336C8606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MM+gUYz+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483411F000C0;
	Thu, 26 Nov 2026 14:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704648;
	bh=BzSAPriKmxmZ03qlrGTjPQb+mIO8/xB1Y5Fffpd+Qhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MM+gUYz+XJKZVtDO1r3vHu7u0mJoELV97fiUr5JmWVbgdezUW/SGv6YKykagd0xt3
	 I9NATohIFrMUVuJFVMe5LRFYNBBp/oLRjbtLN5+WA7W4H9umU//F3gZzTamN2tsgEJ
	 ypCZd3CPfAOYlv+mN4CE4FggGv93FugE1G68LEN92D+yzgrjDeKuHH/BJM1WwaOTe2
	 l0YgAbMdg8e9S5kRXBR22JB3Z1DgLK2IecmBTj1An/IrX6f3Z1W7WPkX6ZZSA8I0va
	 s+bR3ZLtetWrVOXpzFJsMDEXEcTHG9oolFPcxTnvN4vhDzZSzsJ63xfDJxjOY+6aes
	 NmfSu1e9lbCsg==
Date: Thu, 26 Nov 2026 14:50:46 +0000
From: Harry Yoo <harry@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mm/slab: document that sheaf refill does not require
 blocking
Message-ID: <awhG_gYUbcm_y74R@thinkstation>
References: <20261125-sheaf-doc-update-v1-0-4a579abaf0b8@kernel.org>
 <20261125-sheaf-doc-update-v1-2-4a579abaf0b8@kernel.org>
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
In-Reply-To: <20261125-sheaf-doc-update-v1-2-4a579abaf0b8@kernel.org>

On Wed, Nov 25, 2026 at 08:35:13PM +0100, Andreas Hindborg wrote:
> The documentation of the sheaf_capacity member of struct kmem_cache_args
> states that when no full sheaf is available, a sheaf is only allocated and
> filled if the gfp flags allow blocking, and that the allocation otherwise
> falls back to allocating a single object from a slab.
> 
> This has not been the case since commit fb1091febd66 ("mm/slab: allow sheaf
> refill if blocking is not allowed"). __pcs_replace_empty_main() now refills
> a sheaf whenever spinning is allowed. Only kmalloc_nolock() disallows
> spinning, and it allocates from the kmalloc caches, so for caches created
> with kmem_cache_create() the refill is attempted regardless of the gfp
> flags.
> 
> Drop the condition from the documentation, and describe the fallback as
> what happens when the sheaf cannot be allocated or filled.
> 
> Fixes: fb1091febd66 ("mm/slab: allow sheaf refill if blocking is not allowed")
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
