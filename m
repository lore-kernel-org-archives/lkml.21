Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660385;
	b=f7jXzrJsmEFJjZBSI22ZDijuupxS/fDp6zTL4xSLCPPlJN/ggNDZivNBb1yjp4urlN5e
	 gbI4YlhkzntdpuAnCc5VrUSYuXsdAAkpwrqvFQup5SuijkKUF7y6RmH+PffQeaO0PlQqH
	 if7JE/16Q94/LMqJSBvipFtMxjJ4bsE1Z+8xtD+g/UFtKHyNQhi2fX5UDg9vWhV+PIqD4
	 u3QBcBQIlvlLC5RuUaeI3qSk4As9/0BQP3/sboWA99+wldmT8lcKRaSJbVRugCpy/wR5s
	 88y8TbGOjhYK8b6fRx90qP9pnWjipxwgT4YyXD5axLvQCufCKsZ95ARbgZfWS1xJwaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660385;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HiD1u36Sh655aUUtC1qomsVPCJ8WLORnRRt/rJBwQhg=;
	b=j+V2yaD6aCpQVWbrVAgY4nm2PvChxsqyEYOmWrySKwmkzoHXRmJivQ1dBApd3S7XNjQy
	 /7OEKjtG/ANFSyPjF9HUeN5JyNwQm8SjYi/zBPB+sMxDpnt9yHrPiwBbKuRCpOWg1qvTG
	 2CvJPo+vyPOPrtq124fDnHBkmJfJwVeZvWbmu8f0leoVOgtnvcCZUcekJCJ37e9SMAppF
	 fHC9CgAAeWOocA/AjJTRrul43FC/ZKETz1dN1v1ndBVIJO97/pyX9cAKYvZYPCvLgfGDw
	 iIgxxJ20LuaPeW8HtDiKzSWe1kWeKHBDZQu8ndD+rfTrW6FQtfbELeD94GvrTqpnLkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LN07QGUu;
	arc=none smtp.remote-ip=95.215.58.78
Received: from mta1.migadu.com (out-78.mta1.migadu.com [95.215.58.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD43606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD43606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LN07QGUu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IMVdEzKWNpKOqlmEHdSpYMl54ZmgvLStDfPo/U9GPOg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795660383; v=1; x=1796265183;
 b=LN07QGUuW+4+FNVzKGfwCPNCb7Ht+B0T5ldYP0mYBMuuse+BUJZFKGd1JNMbH7GGqEIO7GN8
 LW3YljpBPrXAkHPNyDNidnf7iJ9FxnWmPxpaQxGljsOm2IESFuLjtiduW7aLUtcbuBBddba9On2
 zgdPM9OYyyc8Bgb6vq1zF8rw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 10347b5feeec9f22;
	Thu, 26 Nov 2026 02:33:03 +0000
X-Mizu-Trace-ID: 10347b5feeec9f22
X-Migadu-Flow: FLOW_OUT
Message-ID: <2981e641-4f68-421c-b09e-fedc485e9cbb@linux.dev>
Date: Wed, 25 Nov 2026 18:32:59 -0800
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
Subject: Re: [PATCH rdma-rc] RDMA/rxe: Zero the AtomicETH compare field in
 fetch-and-add requests
To: Andrew Stellman <astellman@stellman-greene.com>,
 Zhu Yanjun <zyjzyj2000@gmail.com>,
 "yanjun.zhu@linux.dev" <yanjun.zhu@linux.dev>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261125132605.44412-1-astellman@stellman-greene.com>
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20261125132605.44412-1-astellman@stellman-greene.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2026/11/25 5:26, Andrew Stellman 写道:
> init_req_packet() fills the AtomicETH compare field for compare-and-swap
> requests but leaves it unwritten for fetch-and-add requests. The field is
> eight bytes in the transmitted packet.
> 
> With init_on_alloc=0, all 200 fetch-and-add requests captured between
> two rxe devices had nonzero bytes in that field, including printable
> text. After this change, all 200 had zero there. Compare-and-swap
> requests sent their compare value before and after the change.
> 
> Set the unused compare field to zero when constructing fetch-and-add
> requests.
> 
> The issue was found by Claude Opus 5.5 while checking rxe for other
> unzeroed memory, as Zhu Yanjun asked in his review of the rxe_mmap_info
> patch. The fix and this changelog were drafted with OpenAI GPT-6
> (Codex) and reviewed by me.
> 
> Fixes: 8700e3e7c485 ("Soft RoCE driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>

Thanks a lot. I am fine with this commit.
Reviewed-by: Zhu Yanjun <yanjun.zhu@linux.dev>

Zhu Yanjun

> ---
> A reproducer is available on request.
> 
>   drivers/infiniband/sw/rxe/rxe_req.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/infiniband/sw/rxe/rxe_req.c b/drivers/infiniband/sw/rxe/rxe_req.c
> index 4f353abd76f5..a1e7fa48c665 100644
> --- a/drivers/infiniband/sw/rxe/rxe_req.c
> +++ b/drivers/infiniband/sw/rxe/rxe_req.c
> @@ -483,6 +483,7 @@ static struct sk_buff *init_req_packet(struct rxe_qp *qp,
>   			atmeth_set_comp(pkt, ibwr->wr.atomic.compare_add);
>   		} else {
>   			atmeth_set_swap_add(pkt, ibwr->wr.atomic.compare_add);
> +			atmeth_set_comp(pkt, 0);
>   		}
>   		atmeth_set_rkey(pkt, ibwr->wr.atomic.rkey);
>   	}

