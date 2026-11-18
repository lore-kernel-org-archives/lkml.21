Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972592;
	b=mQ8NcFImbzuMnfrbKEOSn4NYZ3Shst+A0y9m+ndLr4GEs0iWVDO8FfVYKtPQd52wFNnL
	 Qyrm9WvSQ+LHgD+DZy+cIpmbYkpAMNSwcn5ICt0ciQeKnwsP4aANa7mALpbWFtSNeY+3h
	 K7C0sarQUjDO/bdl2covyEFFgyFwDr3Gwf5aMa1BAUKejhcy0rdwOsMPChhe6Mg58BgeB
	 azaIYUQp9FKHF67aoP8EwRP51eApQicRPUTwjIEXGadzqx3hksoSDD1lvHBuP27IPsw5S
	 w642u9MfkWco5M+DITXTTHIvteTOyoCOTwkiqefG/glo4snJZuZdT9c9+K/1KQJUfmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972592;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IMLr7cDs8jSU5K/R3Qlsx01wbp/x5n9NRNsZwAR7Ef4=;
	b=t11FdSUwlmGLpy1ZmZ+yxa8sB00uKvp9LPGuaLJe/BGQgSDbTs2yiuw2gtE+mwR7+AaQ
	 G37/h77hD+i9C0OugzOSViwY1zbGadnOOWQFr8mdYlH6s/zrGJ4hBSPs6ZdQCeM6T2LDB
	 TBeF+W1NROTBj9outLMplly5rhZ3QTwz2sV98oNJhFtFX/tGnz4giqPTd7KsGrxCx6nNO
	 2FQMj9tT5VdjGHHcDdgn2aE9ADhcfPisMt25z5NsQHM2UX6xh70PFYIuCMAt93pYjkLK4
	 o9GR+n7bCvqnNJ5omDFkcTYo5JhCH9kdXhuwO5i+uLLr9gBpP1WKwEjiTfCFx4cedxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=TvEqUEM4;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59287606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59287606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=TvEqUEM4
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794972582; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=IMLr7cDs8jSU5K/R3Qlsx01wbp/x5n9NRNsZwAR7Ef4=;
	b=TvEqUEM4LZK/cCDFe75dqgjFqc+A3H0IDYhJzLCj0RU9xeehmF72NUMqZj2aCvwWoNqK+N13bnlIMokeMWkosztjWhO1Uonn9xMQ02NJzN/p2atOAFzQ3KzRMEqe6QVI2bcNuViZFZwRC5HQZPyN5Sx4mPePCK05uq3MXfdhWqg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XF.Bvbd_1794972581;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XF.Bvbd_1794972581 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 18 Nov 2026 11:29:42 +0800
Message-ID: <8d90ee6b-ed72-4ace-b667-42e35c5baa5a@linux.alibaba.com>
Date: Wed, 18 Nov 2026 11:29:41 +0800
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
Subject: Re: [PATCH] mm/shmem: avoid zeroing new folios twice with
 init_on_alloc=1
To: samridh@modal.com, Hugh Dickins <hughd@google.com>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261117-samridh-shmem-send-v1-1-1b897ff562d9@modal.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261117-samridh-shmem-send-v1-1-1b897ff562d9@modal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/18/26 3:32 AM, Samridh via B4 Relay wrote:
> From: Samridh <samridh@modal.com>
> 
> shmem_get_folio_gfp() clears a new folio before marking it uptodate.
> With init_on_alloc=1 the page allocator has already zeroed it, so the
> folio ends up being zeroed twice.
> 
> For SGP_CACHE, the only mode that clears a new folio, ask the page
> allocator for a zeroed folio with __GFP_ZERO. Folios that are already in
> the page cache but not uptodate, such as those left by fallocate(), are
> still cleared. With init_on_alloc=0 the zeroing moves into the
> allocator, so a folio is zeroed for nothing when the memcg charge, the
> page cache insert or the block accounting fails.
> 
> Time to write one byte to each page of a new 4 GiB memfd mapping, with
> shmem_enabled=always and init_on_alloc=1 (median of 24 runs on 6.18.55,
> x86_64 VMs):
> 
>                    before   after
>    Xeon 6975P-C    0.620s   0.416s
>    EPYC 9R14       0.216s   0.158s
> 
> With 4K folios, or with init_on_alloc=0, the times change by 3% or
> less. We found this while running gVisor, which keeps sandbox memory in
> a memfd.
> 
> I wrote this patch with help from an AI coding assistant (Claude Code),
> then reviewed and tested it.
> 
> Signed-off-by: Samridh <samridh@modal.com>
> ---
> Tested on 6.18.55 with this change backported, on Intel and AMD x86_64
> VMs, and build-tested on mm/core for-next. I also wrote a simple test.
> It fills memory with data, frees it, and then checks that new memfd
> pages read as zero. It covers MADV_HUGEPAGE and MADV_NOHUGEPAGE on the
> fault and fallocate paths. It passes on both machines with
> init_on_alloc/init_on_free at 1/0, 0/0 and 1/1.
> 
> The idea came from David's comment on the __GFP_PREZEROED RFC [1].
> One thing I'm not sure about is whether flush_dcache_folio() after the
> allocator has zeroed the folio is enough on architectures with cache
> aliasing, so a second look there would be welcome.
> 
> [1] https://lore.kernel.org/all/b258160c-5287-43dd-b56e-268c403b85ea@kernel.org/
> ---
>   mm/shmem.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 5cb628cc9c6b..d2c6781e86a5 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2692,6 +2692,7 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
>   	int error;
>   	bool alloced;
>   	unsigned long orders = 0;
> +	gfp_t zero_gfp = sgp == SGP_CACHE ? __GFP_ZERO : 0;
>   
>   	if (WARN_ON_ONCE(!shmem_mapping(inode->i_mapping)))
>   		return -EINVAL;
> @@ -2770,7 +2771,7 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
>   
>   		huge_gfp = vma_thp_gfp_mask(vma);
>   		huge_gfp = thp_shmem_limit_gfp_mask(huge_gfp, gfp);
> -		folio = shmem_alloc_and_add_folio(vmf, huge_gfp,
> +		folio = shmem_alloc_and_add_folio(vmf, huge_gfp | zero_gfp,
>   				inode, index, fault_mm, orders);
>   		if (!IS_ERR(folio)) {
>   			if (folio_test_pmd_mappable(folio))
> @@ -2782,7 +2783,8 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
>   			goto repeat;
>   	}
>   
> -	folio = shmem_alloc_and_add_folio(vmf, gfp, inode, index, fault_mm, 0);
> +	folio = shmem_alloc_and_add_folio(vmf, gfp | zero_gfp, inode, index,
> +					  fault_mm, 0);
>   	if (IS_ERR(folio)) {
>   		error = PTR_ERR(folio);
>   		if (error == -EEXIST)
> @@ -2810,8 +2812,11 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
>   	if (sgp != SGP_WRITE && !folio_test_uptodate(folio)) {
>   		long i, n = folio_nr_pages(folio);
>   
> -		for (i = 0; i < n; i++)
> -			clear_highpage(folio_page(folio, i));
> +		/* A folio allocated with __GFP_ZERO is already zeroed. */
> +		if (!alloced || !zero_gfp) {

I don't like the GFP flag hack. Why not use user_alloc_needs_zeroing() 
to decide whether we need to zero folios, like anonymous memory does?
