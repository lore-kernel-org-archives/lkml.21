Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972179;
	b=I3xuFtQAl2ygjog77vsEQhS2VUnWziiXKyYtUsz8fphVjUIheiwlMSM9SwyEDNf7L5VG
	 GHxpqEsIPOK/DxxRHHkx41zNgX1m9GhX4Qvgpl56Db1pYuNXWbPKMxhU/0d53AbzfKrr1
	 JGep1fWbgLGcwBaCoeF3S7trIRTsF3BmQTOlsFgvzZ2J+VQSKHdomHHYOzSoT3QT8D/VY
	 zWPFjXIA76yViotqFOsV7+W5L/qzjSpMRa8MfLWVsnD5mfjkHoK1xrJzt3/8NjX2QL7/q
	 CUT6PpYqOCO3+7vMCIePAiTiZ0+7m/dJi4sCqHSvit0L2yJOvXp2lFmRL66nxvucuWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972179;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Mki19R+whqSBkL5T0lsD36JsiA8ufO+JBFHQiX4NirU=;
	b=G6QJT1GuIm65as4QDzBLfUlmGLFzawNf/upx/8iWBPyQur9zPkIew6kYWzpcCwBwz/0y
	 tUJnnRy5eq2PWStQgsSuQ6Xg2pJ6cloRg/2zV2ydh8Z5wYzW7UrxdEFcIwGjDMiZlcuB1
	 hE9c0REu8lOcWjHuZUMVDOlKAXfHECsmZ3JVd08jNdnlH7BaGD8q7j9UjgIZxwP5ugkeR
	 PI1QgJu95aN2RL9McbFZZI8KZbR/FF4cBMYxgZvTGRVrMiyDSDbiQKdjWgt5k1Itxl4BA
	 xjlGzbltHkzxCRwJFE0mNk6FfJPJFf2RLbMBlhm2LzvGhD0DcRlfzf6IIyl+tqNc2YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aPDZ4wre;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817C8606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 817C8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aPDZ4wre
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Mki19R+whqSBkL5T0lsD36JsiA8ufO+JBFHQiX4NirU=;
	b=aPDZ4wre3i6RRXNzIUj0EULaFe1YvQ7dI70rIz9IK6aWZsKFcN1NIcdRCQ23Eb
	91kyUQ3WVgX4hQrq04QN9+F4UXjDMEq02TL/U+Ba14Vg7XDnLT7tWngexNRFMJPJ
	F5TLpkfF6d3z6jh5xfTz5S24Rhz5a/apuWFEjWyrFIgEs=
Message-ID: <2df33679-680c-4fc5-a279-e0e38025f22e@163.com>
Date: Wed, 18 Nov 2026 11:22:27 +0800
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
Subject: Re: [PATCH v2] exfat: hold s_lock for cluster-chain updates in
 __exfat_cont_expand()
To: Youling Tang <youling.tang@linux.dev>, Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>
Cc: Yuezhang Mo <yuezhang.mo@sony.com>, exfat@lists.linux.dev,
 linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>
References: <20261118015802.899847-1-youling.tang@linux.dev>
Content-Language: en-US
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <20261118015802.899847-1-youling.tang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3_1TzGf1qIqilIw--.17073S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWFW8GF15Jw18GF43WrW3ZFb_yoW5KrWrpr
	W5Ka1rJF4DX34kW3yfKr1DZr1Fg348tF4UJ34IkFyIyFyqqr109r9YyryayF17tw4xGrs0
	qFs8Wa1Uu3ZrGaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRLXoxUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+BWdO2r9GfU5ZwAA3u

On 11/18/26 09:58, Youling Tang wrote:
> From: Youling Tang <tangyouling@kylinos.cn>
> 
> __exfat_cont_expand() allocates clusters, appends them to the FAT chain
> and updates ei->start_clu, ei->flags and i_blocks without holding
> sbi->s_lock.  Readers such as writeback call exfat_map_cluster() with
> s_lock held but without inode_lock, so they are not serialized against
> the expansion and can observe the chain metadata mid-update.
> 
> Hold s_lock around the cluster allocation, chain append and i_blocks
> update.  This nests inside the invalidate_lock held by
> exfat_cont_expand(), matching the order used by exfat_truncate().  i_size
> is published via exfat_pagecache_isize_extended(), which takes the
> straddling folio lock; since writeback takes folio lock -> s_lock, this
> must happen after s_lock is released to avoid inverting the lock order.
> i_blocks is therefore updated first, under s_lock, which also ensures a
> reader never sees i_size beyond the allocated chain.
> 
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>

Looks good to me:

Reviewed-by: Chi Zhiling <chizhiling@kylinos.cn>

> ---
> v2: rebase onto exfat/dev and adapt to __exfat_cont_expand().
> 
>   fs/exfat/file.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
> index 9dfd99ad9265..c7991e98a07a 100644
> --- a/fs/exfat/file.c
> +++ b/fs/exfat/file.c
> @@ -105,6 +105,7 @@ static int __exfat_cont_expand(struct inode *inode, loff_t size)
>   	if (ret)
>   		return ret;
>   
> +	mutex_lock(&sbi->s_lock);
>   	num_clusters = exfat_bytes_to_cluster(sbi, exfat_ondisk_size(inode));
>   	/* integer overflow is already checked in inode_newsize_ok(). */
>   	new_num_clusters = exfat_bytes_to_cluster_round_up(sbi, size);
> @@ -116,7 +117,7 @@ static int __exfat_cont_expand(struct inode *inode, loff_t size)
>   		exfat_chain_set(&clu, ei->start_clu, num_clusters, ei->flags);
>   		ret = exfat_find_last_cluster(sb, &clu, &last_clu);
>   		if (ret)
> -			return ret;
> +			goto unlock;
>   
>   		clu.dir = last_clu + 1;
>   	} else {
> @@ -130,7 +131,7 @@ static int __exfat_cont_expand(struct inode *inode, loff_t size)
>   	ret = exfat_alloc_cluster(inode, new_num_clusters - num_clusters,
>   			&clu, inode_needs_sync(inode), false);
>   	if (ret)
> -		return ret;
> +		goto unlock;
>   
>   	/* Append new clusters to chain */
>   	if (num_clusters) {
> @@ -147,15 +148,19 @@ static int __exfat_cont_expand(struct inode *inode, loff_t size)
>   	ei->flags = clu.flags;
>   
>   out:
> +	inode->i_blocks = round_up(size, sbi->cluster_size) >> 9;
>   	inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
> +	mutex_unlock(&sbi->s_lock);
> +
>   	/*
>   	 * When extending file size, call exfat_pagecache_isize_extended()
>   	 * to update i_size and ensure the straddling folio is properly
>   	 * marked RO so page_mkwrite() is called and post-EOF area is zeroed.
> +	 *
> +	 * It takes the folio lock; call it without s_lock (writeback uses
> +	 * folio lock -> s_lock).
>   	 */
>   	exfat_pagecache_isize_extended(inode, oldsize, size);
> -
> -	inode->i_blocks = round_up(size, sbi->cluster_size) >> 9;
>   	mark_inode_dirty(inode);
>   
>   	if (IS_SYNC(inode))
> @@ -165,7 +170,10 @@ static int __exfat_cont_expand(struct inode *inode, loff_t size)
>   
>   free_clu:
>   	exfat_free_cluster(inode, &clu);
> -	return -EIO;
> +	ret = -EIO;
> +unlock:
> +	mutex_unlock(&sbi->s_lock);
> +	return ret;
>   }
>   
>   static int exfat_cont_expand(struct inode *inode, loff_t size)

