Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968998;
	b=NcLlagqNpar0zEeuPWQWFQ6cd9P7ht1taDPQZAlyOMcMc01FBBIUIwndxZeUIotMcJnD
	 KLbJ3FDIblWo2XEd+Z9RxSkvK4viD+HQU3FMMaq0jtd1MKKNVbt0ztBlvtQ2SrDPj85UJ
	 P+4SPRhxXVo0+HQIesdzdh88ligfCt2ApS0/nEiG1MMBjBDR9il6r5YZO69N7E6mVsKST
	 XtbBCVpSOca3OojmyURNSSBv94p2NwU3xud2fvMBTPmnD+fepJXG6BrAA1kBsHv8OvFh0
	 0n23bHW55JB0JA3G3Z1f45WdJMfLctSMRNKVvoOoqgQOsoIeHpEID3lV447v1t2ArcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968998;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WwSqz9XCDJDsYvwx2pp3LvjG+xOgTavj+Zea0JWrFWQ=;
	b=kj/CLnGPqdqMH2LZc+TPfVoTHr5J2QFhRYY/729hHc/0yNAqbVD2r2ICa83jtyJHxSDm
	 5CTQsdqxXs9ccZHydtDjSCOcfZo0dqS2rREPIwvwqfqTYRf+FZhdIADaQ4ZpKbajNXEuf
	 KWDaJCkqCzytK/AL6Ir3rFspm3Ee8nFIVikx0VE8+RkP0yB6sL3+p32PXiOkFcPEW9xf3
	 UwQW1UdZA0R/9xheIlzZvpSb+i6tMNlY27wwiuNoubsj9GgeaD/M5Z466UHZ0RItM2Wlc
	 vKrCAB/CAqqYWxlDhBRRZvJBztUX/jBRkUM1q+Gchi1zQgpKEW0erGBhZqLqsGnC4Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lvuIIucM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CD9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lvuIIucM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD881F000C5;
	Wed, 18 Nov 2026 02:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794968997;
	bh=WwSqz9XCDJDsYvwx2pp3LvjG+xOgTavj+Zea0JWrFWQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=lvuIIucMMta+cj9/8B0eEqlNwskqETWuTEoa0S+H3gVSEa1mdrg4gIqH+/09sKMuf
	 rahbmBKfK5hc5igo+detbF3B3Qyva6LY/yHmx9CoHHz+uIMG/2UJuSrwDe/8x8jVVm
	 sde6Q0spbDaVHY9iH9h6bEQ1fZ6TVFXxvXT9cOMVfRh3qb08niP/7melOEFaOvGzUx
	 zYISJf5HOFQyIxRu9sfcDlnay/YHY7zUdsIuM1Xy8o9z1fwjqS9wkD/z5l9dIdSlgE
	 KZ6aJmkpTB8vvR320+oJpYp7l5i0LQlQ7QDcyFCtPuj7KqB0S6jqnR9sYG+nFn+8N1
	 ttowENQe8volA==
Message-ID: <00565d3e-c508-4764-8587-327c874adcc7@kernel.org>
Date: Wed, 18 Nov 2026 10:29:54 +0800
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
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 18/20] f2fs: support subpage blocks in
 compression
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-19-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-19-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> With subpage blocks, a cluster spans fewer folios than blocks, and
> several compressed blocks share a bounce folio.
> 
> - Require a cluster to cover at least one page. This raises the minimum
>   compress_log_size only when a page has more than four blocks, e.g. to
>   64KB for 4KB blocks on a 64KB page kernel, where the mount option and
>   F2FS_IOC_SET_COMPRESS_OPTION reject a smaller one. A file that already
>   has a smaller cluster is handled like one with an unsupported
>   compression algorithm: it can be looked up and removed, but opening it
>   fails with -EOPNOTSUPP.
> - Use block offsets and sizes for compressed data, keep each compressed
>   block at its block offset within the cluster, and count pending
>   compressed I/O in blocks so that a shared bounce folio is not
>   decompressed or freed early.
> - Submit only the written block of a shared bounce folio in
>   f2fs_submit_page_write(), at its offset in the folio.
> - Keep compressed files on the page based read and write paths, and
>   compress a cluster only when all of its blocks are dirty and below
>   EOF.
> - A folio with per-block state may hold uptodate blocks newer than the
>   on-disk cluster, so decompress into a bounce page and copy back only
>   the blocks that are not uptodate.
> - Cache compressed blocks one block at a time in the compress cache.
> - Lock only the unlocked pages in cancel_cluster_writeback() to avoid a
>   self-deadlock.
> - Attach a folio state to the multi-block folios of a rewritten cluster
>   before they are dirtied, as the other write paths do.
> - Attach a folio state to multi-block folios that have none when
>   compressed writeback starts, as the raw write path does. Otherwise the
>   write completion, which does not hold the folio lock, can detach the
>   page private flags while a task is moving them into a new folio state.
> - Take sbi from the dic to count the blocks of a compressed page in
>   f2fs_finish_read_bio().
> - Write the blocks of a multi-block folio in
>   f2fs_write_single_data_page() as f2fs_write_cache_folios() does,
>   taking the write_blocks_pending bias with a new helper shared by the
>   two and dropping it with f2fs_ffs_put_write_pending().
> - Count a read folio of a compressed file once in the iostat:
>   f2fs_mpage_readpages() counts the folios that go through its loop,
>   and f2fs_read_data_large_folio() counts the others.
> - Remove the -EOPNOTSUPP checks.
> - Remove inode_inc_dirty_block() and inode_dec_dirty_block(), which
>   have no caller left.
> 
> The bounce folios are now freed when the last block of a cluster
> completes, also when the block size equals PAGE_SIZE.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

One minor comment below:

> @@ -4277,6 +4354,46 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>  
>  	folio_zero_segment(folio, offset, folio_size(folio));
>  write:
> +	if (f2fs_is_multiblock_folio(sbi, folio)) {
> +		struct f2fs_lock_context lc;
> +		unsigned int to_blk = f2fs_blocks_per_folio(sbi, folio);
> +		u64 pos = folio_pos(folio);
> +
> +		if (!compr_blocks && !f2fs_verity_in_progress(inode))
> +			to_blk = min_t(unsigned int,
> +					F2FS_BLK_ALIGN(sbi, i_size - pos),
> +					to_blk);
> +
> +		/* Deadlock due to between page->lock and f2fs_lock_op */
> +		if (!compr_blocks && !f2fs_trylock_op(sbi, &lc)) {
> +			err = -EAGAIN;
> +			goto redirty_out;
> +		}
> +
> +		folio_start_writeback(folio);
> +		f2fs_folio_get_write_bias(folio, F2FS_BLK_TO_BYTES(sbi, to_blk));
> +
> +		err = f2fs_write_folio_dirty_range(folio, &local_submitted,
> +					wbc, io_type, pos,
> +					pos + F2FS_BLK_TO_BYTES(sbi, to_blk),
> +					compr_blocks);
> +
> +		if (!compr_blocks)
> +			f2fs_unlock_op(sbi, &lc);
> +
> +		/* The callers drop the submitted count on error. */
> +		if (err && local_submitted)
> +			f2fs_submit_merged_write_cond(sbi, NULL, folio);

We'd better clean up this if this is not a bug fix.

I think we can pass local_submitted to @submitted_p in f2fs_write_raw_pages() before
its error handling, so that its caller (f2fs_write_cache_pages()) can flush the bio
cache.

Thanks,
