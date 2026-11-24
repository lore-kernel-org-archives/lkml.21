Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517826;
	b=GdNt9+D28Jhi5eA5q055oxnwNyLNOWjm/c0IA5qBZS4ppn9AaCnqR43BfCdwU+6a2HYE
	 1UNNnDTXe5k+QNiaX+JWB2DBetFd2V5pD9rPln9WqwPMpH1tIXF52tpRe1pBW1opYQF2O
	 ZhdBPx0vglYCBIPRjWmFSNHz1PWVqpcinrPbH2K+9jIKRD7ZxnJLhnLWZz1mWHjY8k9OI
	 1TtHMdciZFwQelaRN1mB1W10F+dtA0DSSwM7Ul07LWkrv7RpFeeNgrR9aermPDcqeKjYY
	 M6wdXGnQahgD9UqSEJaj2kGxZxDftj4AMXQxUbiEd8TiOGx1VU9tRntvawAa0NBE/sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517826;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=eWfNs5UKK6nPf+1ag3e5zkit4hCoF6BydMaQazyRAfw=;
	b=LTp5T1ZJaotrxXYpfxqQtmE7dTRyx30VnnjzeClDwlKnnRR7diVaN2WrDetEAioIPTl7
	 3SB0+7vPiE0ygezexhsbZZl+rs4Onx7ZyNnxBb4QIIFsXU7i7JlNyXsKbpsq4LKznz4+Q
	 rjwk8EfvHq0pNqkK9a3/bR3IzB6BY5z6AtiPg+dKjd0+7u6mHvhNrtvTsZwOo30/IXHEQ
	 wyKirnh7Oi/IeBpvJjRHUrUsjFRHOC/y9NFzyUlGJcsyml+vJmCmPxztVbRyRlHTDM08A
	 NBtO3HJKQHzInsGrCPdN52xAKDjoLJbIpMuaOkI3zz3pKu/fkHVaQBzoauKlawb1O1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=pYfbCTAF;
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B37F606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B37F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=pYfbCTAF
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795517821; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=eWfNs5UKK6nPf+1ag3e5zkit4hCoF6BydMaQazyRAfw=;
	b=pYfbCTAF558Xnz1Pkmz87Ok9XMSj7GcPc8fegugk04daaHNEHSb+cfxPzCL2Eh1MPl4bbFE7cKDWObDvXTVFPm24DuyT7FkaNgrMIRSRPD9Ct5ErF6gVXxrB1lgsGRDNuiupxfPnkxg18jxnb/WHXpdp48uiAiIFQ3Liu4oKRg0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XFOG4e2_1795517820;
Received: from 30.221.129.142(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XFOG4e2_1795517820 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Nov 2026 18:57:00 +0800
Message-ID: <f59ba679-8c22-4ec2-8799-af24d4fd7158@linux.alibaba.com>
Date: Tue, 24 Nov 2026 18:56:59 +0800
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
Subject: Re: [RFC PATCH v10 3/3] ocfs2: switch dio write path from buffer_head
 to iomap
To: Heming Zhao <heming.zhao@suse.com>, mark@fasheh.com, jlbec@evilplan.org,
 hch@lst.de
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261124045501.10281-1-heming.zhao@suse.com>
 <20261124045501.10281-4-heming.zhao@suse.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261124045501.10281-4-heming.zhao@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/24/26 12:54 PM, Heming Zhao wrote:
> Converts OCFS2's DIO write path from the legacy buffer_head
> infrastructure to the modern iomap framework.
> 
> The buffer_head based ocfs2_dio_wr_get_block() is replaced by
> ocfs2_dio_wr_map_blocks(). Instead of one cluster per call, it now
> hands iomap a mapping of as many clusters as can be described by a
> single struct iomap: up to 16MB, stopped at the first cluster that is
> not of the same kind as the first one (hole, unwritten, written).
> 
> Implement ocfs2_dio_end_io() and ocfs2_dio_end_io_write() to handle IO
> completion. They convert UNWRITTEN extents, updates inode size (EOF).
> 
> In the buffer_head path, ocfs2_dio_wr_get_block() stores dwc in
> bh->b_private, enabling it to detect the first call for an IO chunk and
> invoke ocfs2_add_inode_to_orphan() to protect the extent allocation.
> However, iomap doesn't provide a similar private field. Therefore, moves
> ocfs2_add_inode_to_orphan() from ocfs2_dio_wr_map_blocks(the buffer_head
> counterpart to ocfs2_dio_wr_get_block()) to ocfs2_file_write_iter().
> 
> It is also impossible t pass The dwc to iomap_dio_ops.end_io, the iomap
> ->end_io callback cannot effectively distinguish between I/Os initiated
> by different threads concurrently. For example, when multiple DIO write
> threads operate on the same inode concurrently, the end_io callback
> without the dwc context may incorrectly delete an orphan inode created
> by another thread, leading to a crash. The fix is to move the orphan
> inode deletion from end_io into ocfs2_file_write_iter(). In
> ocfs2_file_write_iter(), inode_lock() serializes the write threads,
> and IOMAP_DIO_FORCE_WAIT ensures that the function only returns after
> the bio completes. This guarantees that i_size has already been
> updated when ocfs2_dio_del_orphan() is called.
> 
> iomap calls ->iomap_begin() once per mapping but ->end_io() once per io,
> and the latter only gets the kiocb, so the kiocb is used as the identity
> of the io: ocfs2_file_write_iter() passes it in iomap_iter.private,
> ocfs2_iomap_next() forwards it to ocfs2_dio_wr_map_blocks(), and each
> unwritten record stores it in ue_owner with the cluster range it covers.
> 
> Doesn't like ocfs2_dio_wr_get_block(), move the zero operations from
> ocfs2_dio_wr_map_blocks() to ocfs2_file_write_iter(). If do the zeroing
> in ocfs2_dio_wr_map_blocks() would zero blocks that earlier mappings of
> this same dio have already written, as i_size is only updated at dio
> completion. this will makes xfstests generic/538 failure.
> 
> Assisted-by: LLM
> Co-developed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> Signed-off-by: Heming Zhao <heming.zhao@suse.com>
> ---
>  fs/ocfs2/Kconfig      |    1 -
>  fs/ocfs2/aops.c       | 1600 +++++++++++++++++++++++++++++++----------
>  fs/ocfs2/aops.h       |   36 +-
>  fs/ocfs2/extent_map.c |   34 +-
>  fs/ocfs2/extent_map.h |    3 +
>  fs/ocfs2/file.c       |  282 +++++++-
>  fs/ocfs2/inode.h      |    9 +
>  fs/ocfs2/mmap.c       |    2 +-
>  fs/ocfs2/super.c      |    3 +
>  9 files changed, 1509 insertions(+), 461 deletions(-)
> 
...
> +	/* The allocation below sleeps on locks. */
> +	if (flags & IOMAP_NOWAIT)
> +		return -EAGAIN;
>  

I've made a mistake in last review thread.
We can't just move this check before fast path, but have to use trylock in
ocfs2_lock_map_blocks().

e.g.
static int ocfs2_lock_map_blocks(struct inode *inode,
				struct ocfs2_map_block *map, int flags,
				bool nowait)
{
	...
	if (nowait) {
		if (!down_read_trylock(&oi->ip_alloc_sem))
			return -EAGAIN;
	} else {
		down_read(&oi->ip_alloc_sem);
	}
	...
}

And pass 'flags & IOMAP_NOWAIT' in caller.

Thanks,
Joseph

> -	dwc = ocfs2_dio_alloc_write_ctx(bh_result, &first_get_block);
> -	if (unlikely(dwc == NULL)) {
> -		ret = -ENOMEM;
> -		mlog_errno(ret);
> -		goto out;
> +	/*
> +	 * This is the fast path for re-write.  The range which is in the file
> +	 * has nothing to allocate nor to convert if it is mapped already. What
> +	 * changes the file size is done at the end of io, no matter what the
> +	 * mappings were.
> +	 */
> +	if (lblk < eof_blk) {
> +		probe = *map;
> +		probe.flags = 0;
> +		ret = ocfs2_lock_map_blocks(inode, &probe,
> +					    OCFS2_GET_BLOCKS_CREATE);
> +		if (ret == 0 && (probe.flags & OCFS2_MAP_MAPPED) &&
> +		    !(probe.flags & OCFS2_MAP_NEW)) {
> +			*map = probe;
> +			return 0;
> +		}
> +		ret = 0;
>  	}
>  
...

