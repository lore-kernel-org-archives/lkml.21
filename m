Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190874;
	b=0k4cesYegQRU51BD9P3dzHcfXHTsNL/ppXKkJLwaZiPTlxTYY7NH6rBxWTf6TTmHUTwN
	 IWsOkF/3kF/GZ3ibbxBnipz14TM02Z8Z7+N4Me0eyeR+B9IfDG4q/cCg7bVDmRHOdMeSQ
	 X2ko6dME6tg1TfCjwarTlCW5ZEROFqC8tYjYIIhf5cEd8SV8qElQSUqvd9lElazdJG/22
	 ipgOsBXzO7dP/O25zH0RSrVPq9VTDKV4CBfLCN5Ojw6mf6gJSRbS9UlgQ/sGhlVDh2s5N
	 06QgwiCQNJqu7r0N+sSb8YJksvAvKx07i01niN7e1nZafz9KRlzSOzSaFsWAwNtJT+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190874;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-SRS-Rewrite;
	bh=mD5J0pRczEgNvhN4q/+TpB36xpd0+3c/0OdpcRtKnHY=;
	b=fXP+OZAOS62XywqzSoHQPl/QyWVcrnw/pxzXyD9iW+Z+Pr12UtzzhOR5Gp9vTVCOX0h7
	 pD/k8dUijpJJlkBY4vZArK02Nax+Zfhn0Iozc9pM+i3en9ObT4fjU/+xCogTexrvRPT0p
	 0GxRRLCw1fYYKG7pw+N/XPSdWU+dLdEDkFjilg2v5E3AkpCLOnE0h2ARPfQn5r+55jl2o
	 RwJv9sLKXymfBchN27rVhQr3XOzGiM6lqsd+TVooS7TrOHbR6dY7LDQeVOZrB+dmqWHDL
	 wfJ+g6s2JKEyXIgc1Hyo/GAeULF/7MXgnbqoWVABWQ1fM5gLFGElsslS08clOYMs3sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=none smtp.mailfrom=bombadil.srs.infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TiA7FmQN;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF2E606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DF2E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TiA7FmQN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mD5J0pRczEgNvhN4q/+TpB36xpd0+3c/0OdpcRtKnHY=; b=TiA7FmQNItcckq2QxPbVkvOHJs
	na+dnA3pWdEUev1B/jkGvouhqSE6VAFHHaAr7Flm4qZlm9vCo6zvv/OXRMgBHlWU3yJJk+x8lzd7Y
	ScX/lMhKaZlXJZ+zO30Ckc0xsZWLUarVTnKVNF5XgUrrp6NrXrXeKZj88Q+OQrXeDtlMjvxx5j7rt
	gJJonHI//DKoSAA5WcqlPSwzxn8OxyJPlHRx5NUqDae1ZxgQG9xCplr6vMz2Hdln505ZZCKJfYbyO
	hExO4v67ImntEuSeFxTRNVqVHxIm8L0fp9TBKx9YvV2YCRlvwUM+fL4V3Yccn1cfIr9+RXfM1rQAk
	lYQGNGJg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR9S-0000000FW7F-2vVK;
	Fri, 20 Nov 2026 16:07:52 +0000
Date: Fri, 20 Nov 2026 08:07:50 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jan Prusakowski <jprusakowski@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
	Yonggil Song <yonggil.song@samsung.com>,
	Hans Holmberg <hans.holmberg@wdc.com>
Subject: Re: [PATCH RESEND 5/9] f2fs: truncate blocks allocated past EOF by a
 failed direct write
Message-ID: <awBwVtp4y_bYK7fn@infradead.org>
References: <20261112143355.2923939-1-jprusakowski@google.com>
 <20261112143355.2923939-6-jprusakowski@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261112143355.2923939-6-jprusakowski@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Nov 12, 2026 at 02:33:51PM +0000, Jan Prusakowski wrote:
> When a direct write extends a file, f2fs_map_blocks() allocates the
> blocks past EOF and maps them into the dnode before the bio is
> submitted. If the write then fails, i_size is not updated, but the
> blocks stay mapped past EOF with whatever the disk contained before.
> A later extending write or truncate can make them visible.
> 
> f2fs_preallocate_blocks() already handles this for blocks it
> preallocates with F2FS_GET_BLOCK_PRE_DIO: it marks the inode with
> file_need_truncate() and f2fs_file_write_iter() truncates everything
> past i_size after a short write. But the preallocation is skipped in
> LFS mode and when the user buffer can't be faulted in, and then the
> blocks are allocated by F2FS_GET_BLOCK_DIO from f2fs_iomap_begin() and
> nothing truncates them.
> 
> Mark the inode with file_need_truncate() also when F2FS_GET_BLOCK_DIO
> allocates a block past EOF, and truncate after the write if the flag is
> set and the file is shorter than intended. Skip KEEP_SIZE files, where
> the truncation would also drop the blocks reserved by fallocate().

None of this fixes the issue in case the system crashes between these
ѕteps.  f2fs really needs to grow unwritten extent support or find some
other way to not add the mapping until I/O completion, otherwise this
remains broken and exploitable.
