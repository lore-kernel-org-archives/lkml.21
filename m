Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445632;
	b=kZiclBkE4DrVW2aBbRzX3kpjvHBgs2IKe8YOL4Gh/RhTnuQLnHwAepDJkBLWNK9P71oh
	 CmuW1d9vxUAQAB+mDh6Sw3t/lmyI0z2l7hwwD7lBYRBpZyggktXrvLTNYKDppt4JWD6Dw
	 dWGAx1jGTwNUtMZVP3qu6BH4myft+8japnNNNMBcDSKNaNP2MCBl6eNaFVUIaVc2ka5BL
	 1WYPBqnhodYHUJaKr0yO8Vp7RkGi/DUYw8ocnEC0s5kB4wiWjemu8E9WFXDg3M+X5OcA3
	 N2VXphAXpbhhwdUEolvnUGYTzjL4tiu0UW95n+CpsjN4WX4gibggsPFylcu+1GuRw7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445632;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XOgaYnpSDCV8c4FBL+2M/FIYjDvQARUxjvg7P2w/uio=;
	b=2QsL6VtUxnMiIsEnBfy/+q/rzjQBWOVzrf1UEcsVgawdpRdwN+qqzY0n3J4tRuRTYxe4
	 nAudcB6GhusOJI4ZPPgIVgGTSEi91bGGcVkGSVxCzCyHhj0qruuysxn+gVZ00K0omXmaq
	 e8QxGV9gzmfj0ITc695MbUWNCqak3eYZTHsx1u4EsUVXEFU29UMkJYXrD17BFAIBzscYf
	 5ruusojUSb+U2DGICtBtetsiVlbqcpX7RDlupWuwId80atElC9LMKo00XIWRAKNR2p8m9
	 52GM5kqUOdN1AmO10w88LrlX/d51wtLvKUR21drzTU+WAhIUJeEPUghuY1oxdSrhLcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9ajy5V8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D1460A3828
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9ajy5V8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930C01F00AD4;
	Mon, 23 Nov 2026 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445632;
	bh=XOgaYnpSDCV8c4FBL+2M/FIYjDvQARUxjvg7P2w/uio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P9ajy5V8xj1bYJOOCY4ozKOGfNE4jQ+9h7s6ubC62eLgBZ9o9p9s/n6iPFeKSMD8I
	 ZoChcmgGPzdbfcDkVqrdoO5oMWzGIWBMeGBiULkTRh2jlx7oxwBzZlu9YoBgoBetVN
	 phKHl+GeDMZHNODGnape4QtIXV53U+URUeAjVsahlv80IeLVkZ/G8AEvadGnzvZc0R
	 Wupnt74DMLYJhzVcgkW5mdH30whTZFriDo1jSeUBe56A04GnWW4NlgZYuuiR0qdOCk
	 iGfDly6kVUgOpGmaDLwYRT07NpjRX4YewRcR5xcMpH8Tq7buMLKS+BLu+vXscUN6an
	 5b5FZFV89I/4A==
Date: Mon, 23 Nov 2026 14:53:50 +0000
From: Harry Yoo <harry@kernel.org>
To: vbabka@kernel.org, akpm@linux-foundation.org, 
	Hao Li <hao.li@linux.dev>
Cc: kernel-team@meta.com, cl@gentwo.org, rientjes@google.com, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	surenb@google.com
Subject: Re: [PATCH] mm/slab: don't set SLAB_MAY_ACCOUNT for
 KMALLOC_PARTITION_CACHES
Message-ID: <awRTBHzBQtxDHTzT@thinkstation>
References: <20261111125628.375624-1-hao.li@linux.dev>
 <179544526759.3606123.1000047458494853310.b4-ty@b4>
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
In-Reply-To: <179544526759.3606123.1000047458494853310.b4-ty@b4>

On Mon, Nov 23, 2026 at 02:48:19PM +0000, Harry Yoo (Meta) wrote:
> On Wed, 11 Nov 2026 20:49:10 +0800, Hao Li wrote:
> > An allocation with __GFP_ACCOUNT set (without __GFP_DMA or
> > __GFP_RECLAIMABLE) is redirected to KMALLOC_CGROUP and will never hit
> > KMALLOC_NORMAL or KMALLOC_PARTITION_CACHES. Consequently, neither of
> > these caches requires objcg slots in obj_exts.
> > 
> > While KMALLOC_NORMAL already skips setting SLAB_MAY_ACCOUNT,
> > KMALLOC_PARTITION_CACHES still carries it unnecessarily.
> > 
> > [...]
> 
> Applied to mm/slab.git for-next, thanks!
> 
> [1/1] mm/slab: don't set SLAB_MAY_ACCOUNT for KMALLOC_PARTITION_CACHES
>       commit: ec81fa8f7dbcf89d9b4112544f76f47c8eb5c725

Just for the record I added Fixes: tag per Vlastimil's suggestion
but didn't add Cc: stable (dunno if Android would need it (due to random
kmalloc caches), but it can be backported later if needed).

-- 
Cheers,
Harry / Hyeonggon
