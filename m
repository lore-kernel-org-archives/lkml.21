Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107968;
	b=dkTRLjmHdeGgph/0j1+781o46jer91tjmGX2NXA6N0387RUmRDhnK/Chn6i3OAsESNrC
	 wSSsJ29Ovr9t2CO7fCjsW7kOIR6D3XkbJaVjo8o3CJq2vZEKAVFvTHd0Bgmu4QxgWtWb7
	 dKNsC5u4qIcEJR3G9gnnvs/LqO+Ks/QQlzdDBtVfn23m0eK2kTP9kRxAM4nSMqoxfFE/W
	 Hld8FCqPD9MJzvVeRtkMwNK9QS5tVsFkG5JiBIR2St5ZGpTiSNRXeG9XarE21Yt1Cf0nF
	 Ccv6T4w+Dt5IlsXwMvxIyofNeyv26U8kEif0M+p+PYyGUvPRRUCCyVY6G6uOsVa+P3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107968;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=M118Bq4qG+fvAk7cRNW6vz/xHAeyvgF0gxIP/5adlFc=;
	b=Yx3A4hme/+lqNR3VQXvK/H0vn8PeLMHQrHaF+/C3QnO6M/wjIbquMtR52P4+uz7yZqCD
	 jvUeeQ9xCmP28+vonysYrIu3AcsiLvWTZC+FEzhNoUe1O/Xnmc9ez9rdklA3htVjbmFa2
	 4r15pocr1qpO2sUhcFcpW8LaXfAWzcm2rQSftr1qtepoHPhdm8Qs+92jvkYhdsiNfYQaG
	 wK+cAEJZhLDmPyB+9BWo06uPUEznBKjUAXlxy6ABteFYmRuJsa1bW5szs0rzKE/rj2q3+
	 rid1lBif0Qc/ZQEe3ZVFZv3Uq/lelqXWkh/p8/AbjYgOs5OXMu3FRbv3JZuu7DyJMLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O8Uodhrb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F7C606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O8Uodhrb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACDB1F000C8;
	Thu, 19 Nov 2026 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795107968;
	bh=M118Bq4qG+fvAk7cRNW6vz/xHAeyvgF0gxIP/5adlFc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=O8UodhrbFFlwGqaHVvd5Mvauk7njRUBxMaON7Wa0SpioC6+vdgy9M8tQ09zxHhrxF
	 lGofD0WoVkRPFhrZ+70sM/v0SFGRsPjPQsjkDh2pJZyG6N+GcZIrnWb8JBLaXEgMRx
	 k8AMraCYCQvtFzG0EWI+y2JIeTphuc7Kt4Jcv4GtahwBvy90TzDyCqkBBRok3vypkh
	 rYYkrEOrK4iYz2mTvRVLRkoOqPst6PUO+v3qo4HW7PoMiBec5/RWn7lr7VqWw3omiG
	 7MkFV9Pcao3uFEiV+ggPB+wskYUMo1FcsozEWmnIi8WkphujmlbodFngsf1Eo++QvQ
	 c+tL523KvvSMQ==
Message-ID: <e4c0fcf1-b70e-4d22-9c4a-5829e1438ce5@kernel.org>
Date: Thu, 19 Nov 2026 18:06:03 +0100
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
Subject: Re: [PATCH v2] mm/shmem: avoid zeroing new folios twice with
 init_on_alloc=1
To: samridh@modal.com, Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261118-samridh-shmem-send-v2-1-f2ea01bfc178@modal.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261118-samridh-shmem-send-v2-1-f2ea01bfc178@modal.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/18/26 21:28, Samridh via B4 Relay wrote:
> From: Samridh <samridh@modal.com>
> 
> shmem_get_folio_gfp() clears a new folio before marking it uptodate.
> With init_on_alloc=1 the page allocator has already zeroed it, so the
> folio ends up being zeroed twice.
> 
> Skip the clear for a folio that was just allocated when
> user_alloc_needs_zeroing() says it is not needed, like anonymous memory
> does. Folios that are already in the page cache but not uptodate, such
> as those left by fallocate(), are still cleared, and so is every folio
> on CPUs with cache aliasing.
> 
> Time to write one byte to each page of a new 4 GiB memfd mapping, with
> shmem_enabled=always and init_on_alloc=1 (median of 24 runs on 6.18.55,
> x86_64 VMs):
> 
>                   before   after
>   Xeon 6975P-C    0.625s   0.420s
>   EPYC 9R14       0.216s   0.160s
> 
> With 4K folios the times change by 3% or less, and init_on_alloc=0 is
> not affected. We found this while running gVisor, which keeps sandbox
> memory in a memfd.
> 
> I wrote this patch with help from an AI coding assistant (Claude Code),
> then reviewed and tested it.
> 
> Signed-off-by: Samridh <samridh@modal.com>
> ---
> Tested on 6.18.55 with this change backported, on Intel and AMD x86_64
> VMs, and build-tested on mm/core for-next. A simple test fills memory
> with data, frees it, and then checks that new memfd pages read as zero,
> with MADV_HUGEPAGE and MADV_NOHUGEPAGE on the fault and fallocate paths.
> It passes on both machines with init_on_alloc=1.
> ---
> Changes in v2:
> - Use user_alloc_needs_zeroing() instead of __GFP_ZERO (Baolin).
> - Link to v1: https://patch.msgid.link/20261117-samridh-shmem-send-v1-1-1b897ff562d9@modal.com
> ---
>  mm/shmem.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index c769d0bc7df9..1a78d15a768e 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2810,8 +2810,11 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
>  	if (sgp != SGP_WRITE && !folio_test_uptodate(folio)) {
>  		long i, n = folio_nr_pages(folio);
>  
> -		for (i = 0; i < n; i++)
> -			clear_highpage(folio_page(folio, i));
> +		/* init_on_alloc already zeroed a new folio. */
> +		if (!alloced || user_alloc_needs_zeroing()) {
> +			for (i = 0; i < n; i++)
> +				clear_highpage(folio_page(folio, i));
> +		}
>  		flush_dcache_folio(folio);

I do wonder whether that could go into the loop, because I faintly remember that
user_alloc_needs_zeroing() is disabled when CPUs have dcache aliasing.

In general LGTM, but I'll wait for more feedback from shmem maintainers.

-- 
Cheers,

David
