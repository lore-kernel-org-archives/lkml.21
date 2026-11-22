Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795336235;
	b=AA7MUMPOOk9FA8RhLPJyuYCzoqZpcwwtqqaNubM1ki6gUP9b1siorU9rVjXMLYEYiebE
	 4/asRqUYgqZhviL9Xib8Ws7JrGkTae9WX1f11xPaS/qrDbIQYcs+As3MsnrbKRt9yUipj
	 +bEn5UCoo4nBSy1whwIdHJkx1RGnJgLm5SMg2HZnq93YDggmqDoM+3kQZis/q+IijWEJB
	 shpMz12xd6Ti7bJ3DbODNQkhAuX8Av1HeCHZpkbLYS6b1Vd1HNbj41C/EB2E0hPOCl59v
	 +riPFnVKwcS79tTfZphvkuQkRbF6UUuVJI5/APuLh3UwVXpMvqt4Y8DJ/QVEmYoaDXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795336235;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KVMitbvzEEmSFg6nLCYHtR7hh58gjDs1Bk3LU+etKdY=;
	b=nzs/5LCnHZUBLbqcuNBvR++/xlAFEIKUENd5cPgJkpRJNbY99CO91NbMSSGpIT7ZROfC
	 ZDMU58ziOvIK8nWJJr9byGmN++rjFmyfFTxQ04vJohNaRGYwZ+k1y3dLoPPdcCcKMzBdr
	 G7oBc5NuEAWPhRqWBWBHPBUXSxKvJuyX6hqz+HIKFRr2mO+PskWGCjPaql+QYWwopRLdU
	 Dma7aS58En3hw8SG0q+G7hSJl1IdnVTCnQcLFUMuZTE9yOj122dP1wLEJ5tUv1gGmL1ZP
	 0iQVvZS48YKg6mDXgO63yg8NnQIkfVzUcZ5O+EtgQdua0OnTFgycgYfHuokM00+gFtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPAQabU1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAC8606A332
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPAQabU1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C9B1F000CA;
	Sun, 22 Nov 2026 08:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795336234;
	bh=KVMitbvzEEmSFg6nLCYHtR7hh58gjDs1Bk3LU+etKdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZPAQabU1BePmrMq1hSvC/gXYeHpMv3hsNLTgYgFsbsZYBjvoU8F4SYPbgn8HM2+BK
	 tUMLsw4qdWSYeUp4pXwpk37kzBAbexTs1c1AB6VDDUfpvOU5J+Vfv0q3OmG8I4BBxw
	 +pNt684TZ0TN9fTBbI7KcvEdfr1XSn1ZymwRHSMPLggHzBGe/Us6OOJ/QydJc0S7V9
	 bijhgr2ro3phmAKTKfhcOC325q3RUyPpFNV+GYAVKhD+htss+SuaoPRf7Ji4xHs4mO
	 lgvkGxuaBcRLQklnKHzCb+KyLI2+KXtX2nH6eBNMigJIZJMDIsvgyQBLBQtIhDizBB
	 Jm55vrsim8/jg==
Date: Sun, 22 Nov 2026 10:30:28 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/secretmem: Keep locked memory accounting until
 inode eviction
Message-ID: <awKoJJ6bxqBltonr@kernel.org>
References: <20261030152407.113568-1-pocj8ur4in@gmail.com>
 <20261121164020.1465498-1-pocj8ur4in@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121164020.1465498-1-pocj8ur4in@gmail.com>

Hi,

Please don't send vN+1 as a reply to vN next time please.

On Sun, Nov 22, 2026 at 01:40:20AM +0900, Baek Kyu, Kim wrote:
> A secretmem inode can outlive its original file. An O_PATH descriptor
> opened through /proc/self/fd keeps the inode and its unevictable folios
> alive after the mapping and original descriptor are closed. The file
> release path nevertheless drops the locked-memory charge, allowing the
> same user to reuse RLIMIT_MEMLOCK while those folios remain allocated.
> 
> Move private-state and locked-memory accounting cleanup to inode eviction,
> after truncating the page cache. Keep secretmem_users active over the same
> lifetime so that the hibernation guard covers retained secret pages.
> 
> Allocate private state before inode creation and release it if the
> secure-inode helper fails. Attach it immediately after creation so
> later failures can use iput() for cleanup. An LSM denial inside the
> helper can call iput() before i_private is set; skip private cleanup
> at eviction when i_private is NULL.
> 
> On arm64 QEMU with an 8 KiB RLIMIT_MEMLOCK, the original kernel allowed
> an additional 4 KiB secretmem fault while O_PATH retained two pages.
> v2 rejected that fault with SIGBUS and allowed it after O_PATH closed.
> Injected LSM denial and file-allocation failure completed without a
> crash; file-allocation cleanup returned secretmem_users to zero.
> KASAN, lockdep, hibernation and long-running concurrency were not
> tested in this v2 run.
> 
> Fixes: 97d34aa65c29 ("mm/secretmem: properly account locked pages")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
> ---
> Changes in v2:
>   - Allocate state before inode creation, as Mike Rapoport suggested,
>     and free it if the secure-inode helper fails.
>   - Guard private-state cleanup in secretmem_evict_inode() because an
>     LSM denial can call iput() before i_private is set.
> 
> Link to v1: https://lists.openwall.net/linux-kernel/2026/10/30/1883
> 
>  mm/secretmem.c | 58 ++++++++++++++++++++++++++++------------------------------
>  1 file changed, 28 insertions(+), 30 deletions(-)
> 
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index b3f79ad56790..5a7378b62bb2 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -189,14 +189,7 @@ static void secretmem_destroy_inode_priv(struct inode *inode)
>  	free_uid(state->user);
>  	kfree(state);
>  	inode->i_private = NULL;
> -}
> -
> -static int secretmem_release(struct inode *inode, struct file *file)
> -{
>  	atomic_dec(&secretmem_users);
> -	secretmem_destroy_inode_priv(inode);
> -
> -	return 0;
>  }
>  
>  static int secretmem_mmap_prepare(struct vm_area_desc *desc)
> @@ -216,7 +209,6 @@ bool vma_is_secretmem(struct vm_area_struct *vma)
>  }
>  
>  static const struct file_operations secretmem_fops = {
> -	.release	= secretmem_release,
>  	.mmap_prepare	= secretmem_mmap_prepare,
>  };
>  
> @@ -264,39 +256,34 @@ static const struct inode_operations secretmem_iops = {
>  
>  static struct vfsmount *secretmem_mnt;
>  
> -static int secretmem_init_inode_priv(struct inode *inode)
> -{
> -	struct secretmem_inode_state *state;
> -
> -	state = kzalloc_obj(*state);
> -	if (!state)
> -		return -ENOMEM;
> -
> -	state->user = get_uid(current_user());
> -	inode->i_private = state;
> -	return 0;
> -}
> -
>  static struct file *secretmem_file_create(unsigned long flags)
>  {
> +	struct secretmem_inode_state *state;
>  	struct file *file;
>  	struct inode *inode;
>  	const char *anon_name = "[secretmem]";
>  	int err;
>  
> +	state = kzalloc_obj(*state);
> +	if (!state)
> +		return ERR_PTR(-ENOMEM);
> +	state->user = get_uid(current_user());
> +
>  	inode = anon_inode_make_secure_inode(secretmem_mnt->mnt_sb, anon_name, NULL);
> -	if (IS_ERR(inode))
> +	if (IS_ERR(inode)) {
> +		free_uid(state->user);
> +		kfree(state);

Please don't do cleanups inside if (err), use goto.

See https://docs.kernel.org/process/coding-style.html#centralized-exiting-of-functions

>  		return ERR_CAST(inode);
> +	}
>  
> -	err = secretmem_init_inode_priv(inode);
> -	if (err)
> -		goto err_free_inode;
> +	inode->i_private = state;
> +	atomic_inc(&secretmem_users);
>  
>  	file = alloc_file_pseudo(inode, secretmem_mnt, "secretmem",
>  				 O_RDWR | O_LARGEFILE, &secretmem_fops);
>  	if (IS_ERR(file)) {
>  		err = PTR_ERR(file);
> -		goto err_free_priv;
> +		goto err_free_inode;

I think here we lost free_uid().

>  	}
>  
>  	mapping_set_gfp_mask(inode->i_mapping, GFP_USER);
> @@ -309,11 +296,7 @@ static struct file *secretmem_file_create(unsigned long flags)
>  	inode->i_mode |= S_IFREG;
>  	inode->i_size = 0;
>  
> -	atomic_inc(&secretmem_users);
> -
>  	return file;
> -err_free_priv:
> -	secretmem_destroy_inode_priv(inode);

What prevents moving this between iput() and return err?

>  err_free_inode:
>  	iput(inode);
>  	return ERR_PTR(err);
> @@ -335,6 +318,20 @@ SYSCALL_DEFINE1(memfd_secret, unsigned int, flags)
>  	return FD_ADD(flags & O_CLOEXEC, secretmem_file_create(flags));
>  }
>  
> +static void secretmem_evict_inode(struct inode *inode)
> +{
> +	truncate_inode_pages_final(&inode->i_data);
> +	clear_inode(inode);
> +	/* The filesystem root and failed secure inodes have no private state. */
> +	if (inode->i_private)
> +		secretmem_destroy_inode_priv(inode);
> +}
> +
> +static const struct super_operations secretmem_super_ops = {
> +	.statfs		= simple_statfs,
> +	.evict_inode	= secretmem_evict_inode,
> +};
> +
>  static int secretmem_init_fs_context(struct fs_context *fc)
>  {
>  	struct pseudo_fs_context *ctx;
> @@ -342,6 +339,7 @@ static int secretmem_init_fs_context(struct fs_context *fc)
>  	ctx = init_pseudo(fc, SECRETMEM_MAGIC);
>  	if (!ctx)
>  		return -ENOMEM;
> +	ctx->ops = &secretmem_super_ops;
>  
>  	return 0;
>  }

-- 
Sincerely yours,
Mike.
