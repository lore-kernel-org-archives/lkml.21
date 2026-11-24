Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547503;
	b=B8JY0kBRwB9sOyf5uFm7Rs49ODbDZbDpxksSXccn+TumkTmrgx8tmozW3gLaRRWaWV3b
	 1NWvfk4UokggN1BA6jBHQYnp17RlzSTvYVNH/m9Hju7fifWsWia0QDrXhK0WccPeJSZda
	 pvHsDZQXWm39JNih3FyXz2Ejqc/ZE4RRj+jUm2B7ViBZG/VVCdvkuekEXjmI/Iqrb00j6
	 EuQkr/0OV5Z0Ppgu2whGnVbmq4oWKR9RTpVGL5PHCVguylcIcVkQNOGB7Fme4SJgcu0Hj
	 J+54bUMereF8tXZsAPbqymtzTHYiko7/DVBwGccxv+pOmTEAMwVALUUlIhpS1KvHW9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547503;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kG9KFuO5noY6NMq45ErFzEPvkfSOGdlMRpWtZSUSF5A=;
	b=kkL3bUsJ61FJ7eoRHUUsxguj9iLeOX83tWS1JJADTyEOsUfR7Pm8d1yHPQ2GDQqHxidd
	 HRWcXZWgoOySLx5hZs7QWr0Y01Ppd+dfXjbiTTlqEJttP0WdJcTl3CFY5oSKXwgMdC3Mh
	 0DuZpltrVUe3DK0ycRosn/9Dnk2TXeQ7jarEqUp4hUlpcwzqmWQRuRIbw5pvVWIeQ5ixX
	 lS4CO4wG0OcWKmDZfMgyVvCD/ofcTVhLIH44EvbDsTPRPUUwuMPANS1vxUe593ueCtsf/
	 VomF4aoQquYlziUlF3Z9SoY4m/r6WMKeDn/19ZgHNGwVYQnLIhtrCqM7p/hNQftRFeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EPtawfgx;
	arc=none smtp.remote-ip=91.218.175.240
Received: from mta0.migadu.com (out-240.mta0.migadu.com [91.218.175.240])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E425B606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E425B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EPtawfgx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=krsH8e935v+VecwkMh4EwZ7mke8ED/SG+KRG804l55Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795547499; v=1; x=1796152299;
 b=EPtawfgxRftuInZ4wRV6mgFF4duRaUJu3Xw3DwxgDWlr7zXHR67FG4Xy/hRflpacF6GrKJF+
 M+sLjf5Hy6ky0H8r2Q/jIleffXONht8/bQAlhqsL1JTR7Ak9hpi0L1VZ6yJUtMRVPPIPyuPu9AH
 xqz7Gsfzgyv9TSbvw3Fc4zgA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bc4a3746771a1fa5;
	Tue, 24 Nov 2026 19:11:39 +0000
X-Mizu-Trace-ID: bc4a3746771a1fa5
X-Migadu-Flow: FLOW_OUT
Message-ID: <eabf4f7d-c3e7-4914-ae2f-e2688c992e86@linux.dev>
Date: Tue, 24 Nov 2026 11:11:36 -0800
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
Subject: Re: [PATCH for-rc] RDMA/rxe: Allocate the MR page array with
 kvzalloc()
To: Qiliang Yuan <qiliang.yuan@linux.dev>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Li Zhijian <lizhijian@fujitsu.com>
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhu Yanjun <yanjun.zhu@linux.dev>, stable@vger.kernel.org
References: <20261123-bug-rdma-rxe-large-mr-v1-1-8d0748ac4a3f@linux.dev>
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20261123-bug-rdma-rxe-large-mr-v1-1-8d0748ac4a3f@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/11/23 1:26, Qiliang Yuan 写道:
> A user MR keeps a struct rxe_mr_page, 16 bytes on 64-bit, for every
> PAGE_SIZE page it covers, in one array allocated with kzalloc() when the
> MR is registered. Before the array, the pages were kept in an xarray.
>
> With 4 KiB pages, the array of an MR larger than 1 GiB exceeds
> KMALLOC_MAX_SIZE, so registering it fails with -ENOMEM, and the first
> attempt warns:
>
>    WARNING: mm/slub.c:5459 at ___kmalloc_large_node+0xe9/0x130
>    Call Trace:
>     __kmalloc_large_node_noprof
>     __kmalloc_noprof
>     __alloc_mr_page_info
>     rxe_mr_init_user
>     rxe_reg_user_mr
>
> Allocate the array with kvzalloc_objs() and free it with kvfree(), so
> that MRs of any size can be registered again.
>
> Registering an MR over THP-backed memory, median of 3:
>
>    size     before (ms)   after (ms)   change
>    1 GiB            5.3          5.2      -2%
>    2 GiB        -ENOMEM         10.8      n/a
>    4 GiB        -ENOMEM         21.1      n/a
>    16 GiB       -ENOMEM         85.9      n/a

Thanks a lot. kzalloc_objs only allocates contiguous physical memory,

whereas kvzalloc_objs can allocate non-contiguous memory—making

kvzalloc_objs much less likely to fail when allocating large amounts of 
memory.

Reviewed-by: Zhu Yanjun <yanjun.zhu@linux.dev>

Yanjun Zhu

>
> Fixes: 12985e5915a0b ("RDMA/rxe: Fix iova-to-va conversion for MR page sizes != PAGE_SIZE")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
> ---
>   drivers/infiniband/sw/rxe/rxe_mr.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/infiniband/sw/rxe/rxe_mr.c b/drivers/infiniband/sw/rxe/rxe_mr.c
> index 13cb28d3916f6..fbf4d89947383 100644
> --- a/drivers/infiniband/sw/rxe/rxe_mr.c
> +++ b/drivers/infiniband/sw/rxe/rxe_mr.c
> @@ -157,7 +157,7 @@ static int rxe_mr_fill_pages_from_sgt(struct rxe_mr *mr, struct sg_table *sgt)
>   
>   static int __alloc_mr_page_info(struct rxe_mr *mr, int num_pages)
>   {
> -	mr->page_info = kzalloc_objs(struct rxe_mr_page, num_pages);
> +	mr->page_info = kvzalloc_objs(struct rxe_mr_page, num_pages);
>   	if (!mr->page_info)
>   		return -ENOMEM;
>   
> @@ -186,7 +186,7 @@ static void free_mr_page_info(struct rxe_mr *mr)
>   	if (!mr->page_info)
>   		return;
>   
> -	kfree(mr->page_info);
> +	kvfree(mr->page_info);
>   	mr->page_info = NULL;
>   }
>   
>
> ---
> base-commit: e7732ec135b501e87ab060d992b3b5f2ec4396c9
> change-id: 20261123-bug-rdma-rxe-large-mr-f752a49d8365
>
> Best regards,

-- 
Best Regards,
Yanjun.Zhu

