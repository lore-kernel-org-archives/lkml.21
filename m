Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886529;
	b=N9At/VuLVUg4uJvt8hHHWwkPhoMx2q7MizcQoBnwyHtbw2DicqQbQDK8gmPBqBWj4MCp
	 K/2e2tLEbhVPtEoz5yBEWAjvz08oxBQXPfLMm/As+cHCo/nC8MfyT2QyQyZ2W6MUfD1za
	 dyHC0F/VnxrhiApAMTRHQhanNsF+meRQIXg7GVQHOxddiZsWQ1I/pn0uov92hvori0NKO
	 8fbGXzKM6CWqAnV1LojJcD2VHT3I4F1ElYPnD9E2Nse2yv4tH7J1/0KzQrTjnYFnPgK8A
	 9wHrIhcYoaCIiKL2ZTJAO55e4/zKRMQ5chcxEZnb+qrcOcvAAtWfjPTDDj8ARJGI+Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886529;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WwiZc2KBx1fIpHwsENuqW3ABJGvetEHXL0OyCBITUTc=;
	b=D3RIZz2fl+BvbUN5DXu0yTvJ1+yfLOkSkoAj4Mhqx4g0oTJz64gCyhpR9vqv8oxb47bx
	 /m1Ira5Qe9wUvX7F/7FNxlUjmjgMMQjqJWyD17GohdYIcAAbMaWm+Akz/FVYM0dMq5Sn0
	 3j3SPDSWaQysqwMmokeDEMOn/HDWm8meetX+CEKsuyYgimbUtVOeo2iHcKTjr6xy8NYQu
	 k6sq3IXp6ru6C4WjOPTelgXmzfzwHE9HQMeI0EEAb+KvJvJN80KGaQeYa0utUqjk7deHk
	 IfNLMSjOTZWWTWuaMqfcvsvmhNtbazJ9k9rAqozlTvRlFvLoywgCiVvKLGrWRTRVr8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QDszPzeo;
	arc=none smtp.remote-ip=91.218.175.82
Received: from mta0.migadu.com (out-82.mta0.migadu.com [91.218.175.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA6C606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA6C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QDszPzeo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1+UCRr2bWvu5HBEUfsmgNjhgA4Aa79bT9LX73YF2hRE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795886525; v=1; x=1796491325;
 b=QDszPzeotCX0t5n5p+xOwaqgxenym5sxzheEjmS4HLhe1YP2CVfT+eykB8SthZ+kg3+H0BE9
 sP+umTlWZ+rc+8LcySUMiaJQRObgSOGqgDKb/tf9vLA5tVqtaciOaF57w39cByk3QjQeayTKIGe
 B0KC0LO+N2Tp09DOlLlDZiYA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2f83b088c200e9a5;
	Sat, 28 Nov 2026 17:22:05 +0000
X-Mizu-Trace-ID: 2f83b088c200e9a5
X-Migadu-Flow: FLOW_OUT
Message-ID: <cc328545-3721-45c9-bcca-fa4d851bc6c6@linux.dev>
Date: Sat, 28 Nov 2026 09:21:58 -0800
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
Subject: Re: [PATCH rdma-rc] RDMA/rxe: Bound MR copy and flush chunks to MR
 pages
To: Andrew Stellman <bugs@stellman-greene.com>,
 Zhu Yanjun <zyjzyj2000@gmail.com>,
 "yanjun.zhu@linux.dev" <yanjun.zhu@linux.dev>
Cc: Li Zhijian <lizhijian@fujitsu.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261128140840.59003-1-bugs@stellman-greene.com>
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20261128140840.59003-1-bugs@stellman-greene.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/11/28 6:08, Andrew Stellman 写道:
> From: Andrew Stellman <astellman@stellman-greene.com>
>
> A fast-reg MR can use 4 KiB pages on a 64 KiB-page kernel, with each
> MR page in its own page_info entry. rxe_mr_copy_xarray() limits each
> chunk to the end of the system page, not the end of the MR page, so a
> copy that crosses an MR-page boundary continues in the same system
> page instead of moving to the next page_info entry.
> rxe_mr_flush_pmem_iova() has the same bound.
>
> Limit each chunk to the end of the MR page when MR pages are smaller
> than PAGE_SIZE. For MR pages of PAGE_SIZE or larger the bound is
> unchanged.
>
> On arm64 with 64 KiB pages (QEMU TCG, mainline 7cd8495c0f16), a
> test-only hook built an MR by hand with two 4 KiB pages at offsets
> 0x1000 and 0x3000 of two different system pages and called
> rxe_mr_copy() for 32 bytes starting 16 bytes before the MR-page
> boundary, checking that the last 16 bytes came from or went to the
> second MR page. Without this patch, both the read and the write check
> failed. With it, both passed, and they failed again with it reverted.
> A 32-byte read within one MR page passed on all three builds. The
> flush path was not run.
>
> The issue was found by Claude Opus 5.5 running Quality Playbook, an
> LLM-driven code review tool:
> https://github.com/andrewstellman/quality-playbook
> The fix was drafted with OpenAI GPT-6 (Codex) and this changelog with
> Claude Opus 5.5, and both were reviewed by me.
static int rxe_mr_fill_pages_from_sgt(struct rxe_mr *mr, struct sg_table 
*sgt)
{
     struct sg_page_iter sg_iter;
     struct page *page;
     bool persistent = !!(mr->access & IB_ACCESS_FLUSH_PERSISTENT);

     WARN_ON(mr_page_size(mr) != PAGE_SIZE);

     __sg_page_iter_start(&sg_iter, sgt->sgl, sgt->orig_nents, 0);
     if (!__sg_page_iter_next(&sg_iter))

         return 0;

rxe_mr_fill_pages_from_sgt() assumes a 1:1 mapping between MR pages and
kernel PAGE_SIZE pages returned by sg_page_iter. When mr_page_size(mr)
differs from PAGE_SIZE—such as 4 KiB MR pages on a 64 KiB-page
kernel—this triggers a WARN_ON() call trace in dmesg, and stepping in
PAGE_SIZE increments risks misaligning MR page indices, offsets, or
entry counts if the warning is simply removed.

Please also modify rxe_mr_fill_pages_from_sgt() to account for 
mr_page_size(mr)
relative to PAGE_SIZE when populating MR page entries and offsets, and
remove the obsolete WARN_ON() check.

Thanks a lot.

Yanjun Zhu

>
> Fixes: 12985e5915a0 ("RDMA/rxe: Fix iova-to-va conversion for MR page sizes != PAGE_SIZE")
> Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
> ---
> A reproducer is available on request.
>
>   drivers/infiniband/sw/rxe/rxe_mr.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/infiniband/sw/rxe/rxe_mr.c b/drivers/infiniband/sw/rxe/rxe_mr.c
> index 13cb28d3916f6e..258f8524ef06b4 100644
> --- a/drivers/infiniband/sw/rxe/rxe_mr.c
> +++ b/drivers/infiniband/sw/rxe/rxe_mr.c
> @@ -333,12 +333,14 @@ static int rxe_mr_copy_xarray(struct rxe_mr *mr, u64 iova, void *addr,
>   		unsigned long index = rxe_mr_iova_to_index(mr, iova);
>   		struct rxe_mr_page *info = &mr->page_info[index];
>   		unsigned int page_offset = rxe_mr_iova_to_page_offset(mr, iova);
> +		unsigned int chunk = min_t(unsigned int, PAGE_SIZE,
> +					   mr_page_size(mr)) - page_offset;
>   
>   		if (!info->page)
>   			return -EFAULT;
>   
>   		page_offset += info->offset;
> -		bytes = min_t(unsigned int, length, PAGE_SIZE - page_offset);
> +		bytes = min_t(unsigned int, length, chunk);
>   		va = kmap_local_page(info->page);
>   
>   		if (dir == RXE_FROM_MR_OBJ)
> @@ -519,12 +521,14 @@ static int rxe_mr_flush_pmem_iova(struct rxe_mr *mr, u64 iova, unsigned int leng
>   		unsigned long index = rxe_mr_iova_to_index(mr, iova);
>   		struct rxe_mr_page *info = &mr->page_info[index];
>   		unsigned int page_offset = rxe_mr_iova_to_page_offset(mr, iova);
> +		unsigned int chunk = min_t(unsigned int, PAGE_SIZE,
> +					   mr_page_size(mr)) - page_offset;
>   
>   		if (!info->page)
>   			return -EFAULT;
>   
>   		page_offset += info->offset;
> -		bytes = min_t(unsigned int, length, PAGE_SIZE - page_offset);
> +		bytes = min_t(unsigned int, length, chunk);
>   
>   		va = kmap_local_page(info->page);
>   		arch_wb_cache_pmem(va + page_offset, bytes);

-- 
Best Regards,
Yanjun.Zhu

