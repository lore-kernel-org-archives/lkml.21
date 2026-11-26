Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714306;
	b=PzzocyFjoxnkbBC8lzyC9UiK/MP56/TEW5hj8jFBzePAPUUHpBRkjftU1gG00pyBm7bs
	 oA3NpzudY899rJ/ns3WYZ3m1MH6N8rv6Qd/WlltNIraLPsy06rsuau4GsfwSHLiHi97Fd
	 mzSXmbrZBUWVbfbsra0TQsFT8JJtsQ5cFOsMEi76LQzNCN54JPGO1gLVXG9pful5MTXM8
	 I/JkvhfCGVAA//0uwDY/XR7GZUJ/4BKFLsKTNvQsTQNMdokT5SYeMH8ctWVkv7niF9Cp1
	 Ds65nGJGuz9WpQ3iXoDobtKVlDlUdH2l4MV+ZAL3dqP6P9apqM7SuIgzgw94mnwurQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714306;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9HUCZiy2quHvccCBYdSJSRZhJ3H3kNX4EhrUAFG7u2A=;
	b=yhl7r8QDTBktuDpYc4eUduxsJJ3rwG/dny8Iwhuq72cFfcSQSSLphqsw94Ka0ipJ6jJ4
	 P1eSlYb5BF6RhzjoWdGpiEy0G5erB07SCpHKwtd6aFM6Gm+w+tO5CQaE7+hPXJjhgFciM
	 V59QVbk/j7v5Q0DbVKII3uh76e4TyCell3Qi9kLQQzvx/SoYUkEUO7rW8himYnWM4etUX
	 Bru8DjsHyQrh8eYUI1pRXzGKe8eOLR5FEa7pt14kRHSNBOqx+Bzq8+BQcrQEmzXHKrGYG
	 hepp3cys9LspzvoRSVgvncunNzk1rNq6yTuz/9itormOqIAuPqX74JzP52VpHp60kqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vk0P0HaC;
	arc=none smtp.remote-ip=91.218.175.187
Received: from mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0848606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0848606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vk0P0HaC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MAnj9AeLx2CatsU7+RfQyrT3OT/zDZrzsXxxkfYhvOU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795714302; v=1; x=1796319102;
 b=vk0P0HaCE5dtSVE9qrLUNcy1y38KFzhDPUeuAsPTXMp+2gH5K33YHqDOaIBPJg/lltCExjFX
 YFYt2ptkB/c/uUK0acL9Q7D4EsqlHPIikGyaJYIv+O4L3frycMbcKgqf8cobUgFtQvyXOZEUiMe
 C2AnYjWjDK/kLIlg5wg3iQrg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aae18d56f02ffe49;
	Thu, 26 Nov 2026 17:31:42 +0000
X-Mizu-Trace-ID: aae18d56f02ffe49
X-Migadu-Flow: FLOW_OUT
Message-ID: <7d940be4-913f-4324-b1a3-1f72ee90be45@linux.dev>
Date: Thu, 26 Nov 2026 18:31:41 +0100
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
Subject: Re: [PATCH rdma-rc] RDMA/siw: Honor the sg_offset in siw_map_mr_sg()
To: Andrew Stellman <astellman@stellman-greene.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261122191128.65369-1-astellman@stellman-greene.com>
From: Bernard Metzler <bernard.metzler@linux.dev>
In-Reply-To: <20261122191128.65369-1-astellman@stellman-greene.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.11.2026 20:11, Andrew Stellman wrote:
> siw_map_mr_sg() builds the first PBL entry from sg_dma_address() and
> sg_dma_len() of the first scatterlist entry and ignores *sg_off.
> ib_sg_to_pages() includes *sg_off in mr->iova, which siw stores as
> mem->va, so siw_pbl_get_buffer() resolves an address in the MR to a
> location *sg_off bytes before it. rdma_rw_ctx_init() passes its
> sg_offset to ib_map_mr_sg(), and isert can pass a nonzero offset.
> 
> A test module registered a one page buffer on siw with ib_map_mr_sg()
> and sg_offset 0x200, which gave mr->iova at page offset 0x200 and
> mr->length 3584. A user space client then wrote 16 bytes with an RDMA
> WRITE at mr->iova. The bytes landed at page offset 0x000 of the buffer
> instead of 0x200. With sg_offset 0 they landed at page offset 0x000,
> as expected.
> 
> Start the first PBL entry *sg_off bytes into the first scatterlist
> entry, and reject an offset past the end of that entry, as
> ib_sg_to_pages() does. With this change the bytes land at page offset
> 0x200.
> 
> The issue was found by Claude Opus 5.5 running Quality Playbook, an
> LLM-driven code review tool:
> https://github.com/andrewstellman/quality-playbook
> The fix and this changelog were drafted with Claude Opus 5.5 and
> reviewed by me.
> 
> Fixes: 303ae1cdfdf7 ("rdma/siw: application interface")
> Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
> ---
> Tested in QEMU on v7.4-rc3 with KASAN, with an in-kernel test module
> and a librdmacm client over siw. A reproducer is available on request.
> 
>   drivers/infiniband/sw/siw/siw_verbs.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/infiniband/sw/siw/siw_verbs.c b/drivers/infiniband/sw/siw/siw_verbs.c
> index 80ef4cb95fc..c5f67c8e7ce 100644
> --- a/drivers/infiniband/sw/siw/siw_verbs.c
> +++ b/drivers/infiniband/sw/siw/siw_verbs.c
> @@ -1505,8 +1505,15 @@ int siw_map_mr_sg(struct ib_mr *base_mr, struct scatterlist *sl, int num_sle,
>   			return -EINVAL;
>   		}
>   		if (i == 0) {
> -			pble->addr = sg_dma_address(slp);
> -			pble->size = sg_dma_len(slp);
> +			unsigned int off = sg_off ? *sg_off : 0;
> +
> +			/* The MR starts *sg_off bytes into the first entry */
> +			if (off > sg_dma_len(slp)) {
> +				siw_dbg_mem(mem, "sg_off %u beyond first SGE\n", off);
> +				return -EINVAL;
> +			}
> +			pble->addr = sg_dma_address(slp) + off;
> +			pble->size = sg_dma_len(slp) - off;
>   			pble->pbl_off = 0;
>   			pbl_size = pble->size;
>   			pbl->num_buf = 1;
Excellent catch. Thanks very much, and sorry for the late reply.

Acked-by: Bernard Metzler <bernard.metzler@linux.dev>
