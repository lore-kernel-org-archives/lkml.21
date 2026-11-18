Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969617;
	b=Q/25qIR4KoMPpXWAndZZKOTJk60c/o/49owAYuLTYlmn0UIsniyX98IBQ5ugC32FQ0Dk
	 uSR5Slsq+w30TKGpQD6l6Wha0Q5lWELOFuKxIW0AVz8z+6fw8YLGiZJBBDv1fzfNDXfwF
	 Bw8RKzzV1rqHJXGrB84jQEF0mHVSrNaHvvLS9xFsD+2HgbZ7Dey/VI9md3nOTNp5hY7Kc
	 HGDzJc/lgi/v2ENG3pS/R3kcPGIzjNTPkvTrsUTD5iLfKuOEog4DAC/s1NdqEEGalA32y
	 q2Cr98k+gRpp/Hemo43xqWhjW2QGUUeFrbOwX8X2efyqQuRv57Q8BewEDzLgJo2k9Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969617;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pN+R8iE5mrilm1yEawpmQGcShEPtoVSRmY5LE/o+UqM=;
	b=SSaxOwIVBApH0W9tZApPfyHuELdkcxc/12exYsmD00Z3PfZAjv0Gup17OaiJlqTh44aC
	 yLatGPv8lqp+ZkUwIpoZEMN5qk5wHr43ErggFCZtqzEw8telBJLjSEpPbLSlOPbSEa7SC
	 mMiNyXp6FnCe7JXmWiJmSxrj2ptTpHkzWcKeL8y7GhqSN2x1IbUCn7gmc2E3S8b8XMahK
	 aUNG9gsK3VqXd/3EwGjhG2R6QvBH/UMcmf1pctiPjpK1eZ6iE4+Rz6ThGj60FohxbIZ6L
	 au+0pKKTDXMfj3g2ISJpuPRTUPzkowrta5xvb0bB9Xu2IWsLzONKHThGmI7FwEK6/sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=re8ycFdO;
	arc=none smtp.remote-ip=91.218.175.21
Received: from mta0.migadu.com (out-21.mta0.migadu.com [91.218.175.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD90E606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD90E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=re8ycFdO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0YmCdvKvcbyA+q3izi5xAhGTNdvmCrKT8RtQD9KuPwU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794969614; v=1; x=1795574414;
 b=re8ycFdOaNbBIiMScTaXBZ6twyyXjxZvbfz90jzS97241xxo6zZdTBKsC3y+khI9fI0CQwZZ
 3Uh0RQ2ASHh1yNf93MMMEDBtvj1up/+cwHi5zQtvwb0iIjCTwIEIqP0favDb7UP8kgENez/AfJf
 wq10XozYV0hLlgmuovDwiKXE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ab029116bda70b98;
	Wed, 18 Nov 2026 02:40:14 +0000
X-Mizu-Trace-ID: ab029116bda70b98
X-Migadu-Flow: FLOW_OUT
Message-ID: <2c65fe4b-bea8-45e3-b51e-352139769a59@linux.dev>
Date: Tue, 17 Nov 2026 21:40:11 -0500
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
Subject: Re: [PATCH] mm: shmem: limit forced anonymous shmem huge orders to
 MAX_PAGECACHE_ORDER
To: Jingyi Sun <1045704958@qq.com>, Hugh Dickins <hughd@google.com>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <tencent_1B8BBAF215484255F04168752D9BA778EE08@qq.com>
Content-Language: en-US
From: "Luiz Capitulino (Red Hat)" <luiz.capitulino@linux.dev>
In-Reply-To: <tencent_1B8BBAF215484255F04168752D9BA778EE08@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/17/26 7:16 AM, Jingyi Sun wrote:
> When the top-level shmem_enabled knob is set to "force",
> shmem_allowable_huge_orders() returns huge_shmem_orders_inherit for
> anonymous shmem without masking it with THP_ORDERS_ALL_FILE_DEFAULT,
> unlike the other return path at the end of the same function.
> 
> huge_shmem_orders_inherit defaults to BIT(HPAGE_PMD_ORDER). On arm64
> with 64K base pages HPAGE_PMD_ORDER is 13, while MAX_PAGECACHE_ORDER
> is 11 because of the xarray split limit. With shmem_enabled=force, an
> anonymous MAP_SHARED mapping can therefore get a 512M (order-13) folio
> in the page cache. Splitting it later, e.g. on swap-out from
> shmem_writeout(), triggers
> 
>    WARNING: lib/xarray.c:1051 at xas_split_alloc
> 
> and the split fails, so the folio can never be swapped out.
> 
> This is the same problem that commit 9fd154ba926b ("mm/shmem: disable
> PMD-sized page cache if needed") and commit b66b1b71d7ff ("mm: shmem:
> avoid allocating huge pages larger than MAX_PAGECACHE_ORDER for shmem")
> fixed for the other paths; the force branch was left out. Mask it with
> THP_ORDERS_ALL_FILE_DEFAULT as well.
> 
> Reproduced on v7.3-rc2 in QEMU (arm64, 64K pages, -cpu cortex-a72,
> 4G RAM, zram swap): with shmem_enabled=force, a PMD-aligned
> MAP_SHARED|MAP_ANONYMOUS mapping of one PMD size got a single
> PMD-mapped folio (ShmemPmdMapped: 524288 kB) and MADV_PAGEOUT
> triggered the warning above in 3/3 runs. With this change: 0/3.
> shmem_enabled=always and 4K pages did not show the warning. The code is
> unchanged in v7.4-rc3 and in mm-unstable, but the test has not been
> re-run on those trees.
> 
> The issue was found with a research static analyzer for
> cross-architecture dependency bugs and confirmed with the QEMU
> reproducer described above.
> 
> Fixes: e7a2ab7b3bb5 ("mm: shmem: add mTHP support for anonymous shmem")
> Cc: stable@vger.kernel.org
> Cc: Luiz Capitulino <luizcap@redhat.com>
> Assisted-by: LLM
> Signed-off-by: Jingyi Sun <1045704958@qq.com>
> ---
> Note: this touches the same line as "mm: thp: always enable mTHP
> support" (Luiz Capitulino, v8 14/14), which is still under review. That
> change masks the force branch with ~disabled_orders but does not add
> THP_ORDERS_ALL_FILE_DEFAULT either, so it does not address this issue.
> Happy to rebase on top of that series if it lands first.

I'm late with v9 so no way my series will land before this patch, but
thanks for the consideration :)

> 
> Link: https://lore.kernel.org/all/752f528f0fed5cdc9de12b54260b0495d4e5a6cb.1789695931.git.luizcap@redhat.com/
> 
>   mm/shmem.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 10cef89b00b0..41bb3f2c6b63 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2114,7 +2114,8 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>   	 * means non-PMD sized THP can not override 'huge' mount option now.
>   	 */
>   	if (shmem_huge == SHMEM_HUGE_FORCE)
> -		return READ_ONCE(huge_shmem_orders_inherit);
> +		return THP_ORDERS_ALL_FILE_DEFAULT &
> +		       READ_ONCE(huge_shmem_orders_inherit);
>   
>   	/* Allow mTHP that will be fully within i_size. */
>   	mask |= shmem_get_orders_within_size(inode, within_size_orders, index, 0);
> 
> base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
