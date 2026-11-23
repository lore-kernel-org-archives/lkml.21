Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425323;
	b=0WocVaeu7xFq2SpDWnofTrLwlYUadCljpVPXka9xhMDBCXOuTdiZ++nUH83Gzm/2m4C6
	 UHRmsISzPCBhfKG0GHDeWURGHyFJrw3hDAwhH2dVNrgU2YIv5GZoo9+Kv1gUOMS3je5yc
	 NXVQYZN304LFa/hWv/Z9RjYsWLPiw6YwFR3YfLpBeEeavQCzBb4AM8Ytz3TCTvJtLUGIx
	 bIxCFpOLAeY5N+gashPVeDFyXq48uCbYWC4E+PuYVxQdUMQZKzZX/fAp85rQgwRHivvJl
	 VbeuuX1qQxkjT50DOwCumxSmLLM9YfD6P0zj7ZC4R+xqlBt3W9tgx7lbxgY9ymbQqhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BhUhnZ9mLK0XzOkkr30rJWgENsy42TO4Q4G/XB+4Qeo=;
	b=197ULEQsy8gRxMmt/rAD8EVxqzgEggcDNs71DrlqdJW9JFpYSbF4sbVmdWO9+JEC/mPH
	 dyHz/vhUmr4zueJVF+z++FvrQyc/HaMQ6JW+KY6jBGMJNPP7xm6IGBaMj7+tV9DHacu2K
	 2V3ZSvEUs56avRbCl5UBG7ltjIm7Aw8bU6SK7tLirRlVRvA8AOEHxv7PToaG5IbmlcPej
	 qjICHxIQHplVQOzGK01byQBeUehbWtR+ZQ0FnJiR7HlxIgoog+QcT0h0mCMGIPMT92WKH
	 t8zVvRc2t/RkAvce7IzLKnW8U+lJU6Etwa1QYHQuCw+rb70vDP3bA3HlBvhcb7mHiKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I04VBYWM;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2374606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2374606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I04VBYWM
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so18721445e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425321; x=1796030121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BhUhnZ9mLK0XzOkkr30rJWgENsy42TO4Q4G/XB+4Qeo=;
        b=I04VBYWMF4kK3mhewAx3n8tYIxuuAOGQCbu2P8QF88rTsux2JKxenX4O7XUsYnFPNu
         NxeQ7CLwhYl+9PBH6ozySTKNqlqzBb3PHyxUAQkvkDf2wGl21VEdG+nRXaAo7fb3cS0h
         RuhPCxYvEUX8qrSVleN/VZCkMrB5dJ4nXGHIoE72dsq6k3W1vgByHSPLZ7IyfkskoOMT
         U90nO20VvIma1g7FPMvXBPY5W8d6PpS8BUERo8jWczg0R4qiOHGDmYrNAa2BjQN08yH9
         txF2laMxV1WYeNpATju8TebkrnrOnD/DGR2BcqEu4rLggaesmaGu7neVWc5c/foZFbBJ
         N5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425321; x=1796030121;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhUhnZ9mLK0XzOkkr30rJWgENsy42TO4Q4G/XB+4Qeo=;
        b=HXuY9vd01GdjAuSvmCL5hMlcHwz/cVBcM0orsj+lDaeCRj3YGmAozMSMOdo9B1QoKq
         iZuiriSM1AKo1F04N5DA+BxGYbEV5+tyVb6KPboKzZoox0mY54LL+I5w4Ytv6ApkXgxF
         Zmaxspe8l3T8nC7MvPZn0zAtvtDQaa8QPFc7qAq2ayhepvQAaOg2i2f/K3IxNxv/24Zr
         KQFmDmyoI6kXiw6AB+QaxsInN+TQ//xSPfh8HZ2Q8GOxHTb1d6iW2DExtk2Wx8CtyCXQ
         52II+7yO56ksX0oG0YIZHASvaVEVWbYgr8Q/cYA7Y+FPWPwFNwokbTBtF/xnLxdb8omu
         hZSA==
X-Forwarded-Encrypted: i=1; AL+hErH28Ih5aofZ3BIYz07T94yVIVNqqhVJct49pyhRBk+dGVOiw7noO9VMsJHyadnzR2O7nR7UZUdimpffmH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FnyTE9+5eN/bGzHwhCJCfvBG2VEV+rhQZb12ZSQfEyd7jDwUq
	etTacXSv8hkuc+NNLIwUTbf0hi3aKVQgnMla0xhu84JmC5zg53Hmka6p
X-Gm-Gg: AZFdTZdgxqAvDxWvdqq7rD1Do7FUe3/pMdKyMoaR/pY2J+ErX/NM8YNwIWf6h5uh19b
	fvFDJWvF7anZZFD9QFr7kKUdZyzoRRucBd9kOEljDP7ewD/8VUyK/igjR0b2Zv2LJrKBhlUAiDf
	I1yvtE+YQUILWhrkVB6+wvJJY5FGHvTQA7Hkhr2/28WZ4C/lfs8ctwVwfAXSYZiz+siuVr9foh/
	GFgFhEZpi1jddgph1CEIOz1N3W8S5yPoq4osgbjYt4d+SDunkqcpD6Ie3CR3DPO67/8TJGBo0KN
	8TSw/l0/GPLv63LchpT2k/JJU/ncuTCD4fAawieN+/JbX7Dc/Ja7XMO6m313hbb3+wbXFRGGEaB
	Fc1AK8csIu1URJ7HPphaOTpahJ20ltL+xPknZb7cKUfS9TWgumFvEDAzJn15YeT/czrt7SY+li0
	s7bHWuvSPgND8sZWoczPo6XY/zGJl9key9XD2tm347r2rLP1EoV70wNXrxEhvTYSfGJ5TeEwm5f
	Hvg2Wz4ReRb/rhG/SX0R/hquL6/50Betpw6heQDieBk5BdO/QvTc2m3lObhF4RdYc/0X9n58ADP
	KvXCicaU7OsHQX+xBu5lqn5CVCKlWSOzOrL5OWArZ/00JPtXr6QRu3qU19IzwuWuMx9HkdyTszM
	o9eVUCLXGHC8=
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr69557485e9.2.1795425321225;
        Mon, 23 Nov 2026 01:15:21 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm288443385e9.4.2026.11.23.01.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:15:21 -0800 (PST)
Date: Mon, 23 Nov 2026 09:15:20 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/23] Squashfs: convert SQUASHFS_INODE_* and
 SQUASHFS_MKINODE to inline functions
Message-ID: <20261123091520.360fa40a@pumpkin>
In-Reply-To: <20261123034304.261742-3-phillip@squashfs.org.uk>
References: <20261123034304.261742-1-phillip@squashfs.org.uk>
	<20261123034304.261742-3-phillip@squashfs.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Nov 2026 03:42:43 +0000
Phillip Lougher <phillip@squashfs.org.uk> wrote:

> Convert old fashioned #define macros into inline functions.  This has
> the following improvements:
> 
> 1. Inline functions are typed, which makes the width and signedness of
>    input and outputs explicit, which reduces errors.
> 
> 2. The inline functions enable more sanity checking to be added in
>    later commits.
> 
> 3. Inline functions are easier to read than #define macros, which
>    improves code comprehension.
> 
> Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
> ---
> v2:
>   - Remove squashfs_inode_offset() additions to TRACE statements.
>     This is now a separate patch.
> ---
>  fs/squashfs/inode.c            | 24 +++++++++++++-----------
>  fs/squashfs/namei.c            |  3 ++-
>  fs/squashfs/squashfs_fs.h      | 11 -----------
>  fs/squashfs/squashfs_helpers.h | 19 +++++++++++++++++++
>  fs/squashfs/super.c            |  3 ++-
>  5 files changed, 36 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
> index 82b687414e65..bc7c81d442f2 100644
> --- a/fs/squashfs/inode.c
> +++ b/fs/squashfs/inode.c
> @@ -33,6 +33,7 @@
>  #include "squashfs_fs.h"
>  #include "squashfs_fs_sb.h"
>  #include "squashfs_fs_i.h"
> +#include "squashfs_helpers.h"
>  #include "squashfs.h"
>  #include "xattr.h"
>  
> @@ -108,8 +109,9 @@ int squashfs_read_inode(struct inode *inode, long long ino)
>  {
>  	struct super_block *sb = inode->i_sb;
>  	struct squashfs_sb_info *msblk = sb->s_fs_info;
> -	u64 block = SQUASHFS_INODE_BLK(ino) + msblk->inode_table;
> -	int err, type, offset = SQUASHFS_INODE_OFFSET(ino);
> +	u64 block = squashfs_inode_blk(ino) + msblk->inode_table;
> +	int offset = squashfs_inode_offset(ino);
> +	int err, type;
>  	union squashfs_inode squashfs_ino;
>  	struct squashfs_base_inode *sqshb_ino = &squashfs_ino.base;
>  	int xattr_id = SQUASHFS_INVALID_XATTR;
> @@ -128,8 +130,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
>  	if (err)
>  		goto failed_read;
>  
> -	block = SQUASHFS_INODE_BLK(ino) + msblk->inode_table;
> -	offset = SQUASHFS_INODE_OFFSET(ino);
> +	block = squashfs_inode_blk(ino) + msblk->inode_table;
> +	offset = squashfs_inode_offset(ino);
>  
>  	type = le16_to_cpu(sqshb_ino->inode_type);
>  	switch (type) {
> @@ -181,7 +183,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
>  		inode->i_data.a_ops = &squashfs_aops;
>  
>  		TRACE("File inode %x:%x, start_block %llx, block_list_start "
> -			"%llx, offset %x\n", SQUASHFS_INODE_BLK(ino),
> +			"%llx, offset %x\n", squashfs_inode_blk(ino),
>  			offset, squashfs_i(inode)->start, block, offset);
>  		break;
>  	}
> @@ -241,7 +243,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
>  		inode->i_data.a_ops = &squashfs_aops;
>  
>  		TRACE("File inode %x:%x, start_block %llx, block_list_start "
> -			"%llx, offset %x\n", SQUASHFS_INODE_BLK(ino),
> +			"%llx, offset %x\n", squashfs_inode_blk(ino),
>  			offset, squashfs_i(inode)->start, block, offset);
>  		break;
>  	}
> @@ -264,7 +266,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
>  		squashfs_i(inode)->parent = le32_to_cpu(sqsh_ino->parent_inode);
>  
>  		TRACE("Directory inode %x:%x, start_block %llx, offset %x\n",
> -				SQUASHFS_INODE_BLK(ino), offset,
> +				squashfs_inode_blk(ino), offset,
>  				squashfs_i(inode)->start,
>  				le16_to_cpu(sqsh_ino->offset));
>  		break;
> @@ -291,7 +293,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
>  		squashfs_i(inode)->parent = le32_to_cpu(sqsh_ino->parent_inode);
>  
>  		TRACE("Long directory inode %x:%x, start_block %llx, offset "
> -				"%x\n", SQUASHFS_INODE_BLK(ino), offset,
> +				"%x\n", squashfs_inode_blk(ino), offset,
>  				squashfs_i(inode)->start,
>  				le16_to_cpu(sqsh_ino->offset));
>  		break;
> @@ -335,7 +337,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
>  		}
>  
>  		TRACE("Symbolic link inode %x:%x, start_block %llx, offset "
> -				"%x\n", SQUASHFS_INODE_BLK(ino), offset,
> +				"%x\n", squashfs_inode_blk(ino), offset,
>  				block, offset);
>  		break;
>  	}
> @@ -359,7 +361,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
>  		squashfs_i(inode)->parent = 0;
>  
>  		TRACE("Device inode %x:%x, rdev %x\n",
> -				SQUASHFS_INODE_BLK(ino), offset, rdev);
> +				squashfs_inode_blk(ino), offset, rdev);
>  		break;
>  	}
>  	case SQUASHFS_LBLKDEV_TYPE:
> @@ -384,7 +386,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
>  		squashfs_i(inode)->parent = 0;
>  
>  		TRACE("Device inode %x:%x, rdev %x\n",
> -				SQUASHFS_INODE_BLK(ino), offset, rdev);
> +				squashfs_inode_blk(ino), offset, rdev);
>  		break;
>  	}
>  	case SQUASHFS_FIFO_TYPE:
> diff --git a/fs/squashfs/namei.c b/fs/squashfs/namei.c
> index 65aae7e2a859..2260a3f05fde 100644
> --- a/fs/squashfs/namei.c
> +++ b/fs/squashfs/namei.c
> @@ -49,6 +49,7 @@
>  #include "squashfs_fs.h"
>  #include "squashfs_fs_sb.h"
>  #include "squashfs_fs_i.h"
> +#include "squashfs_helpers.h"
>  #include "squashfs.h"
>  #include "xattr.h"
>  
> @@ -197,7 +198,7 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
>  				off = le16_to_cpu(dire->offset);
>  				ino_num = le32_to_cpu(dirh.inode_number) +
>  					(short) le16_to_cpu(dire->inode_number);
> -				ino = SQUASHFS_MKINODE(blk, off);
> +				ino = squashfs_mkinode(blk, off);
>  
>  				TRACE("calling squashfs_iget for directory "
>  					"entry %s, inode  %x:%x, %d\n", name,
> diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
> index b406e52a83c2..6d993531a5df 100644
> --- a/fs/squashfs/squashfs_fs.h
> +++ b/fs/squashfs/squashfs_fs.h
> @@ -107,17 +107,6 @@ static inline int squashfs_block_size(__le32 raw)
>  	return (size >> 25) ? -EIO : size;
>  }
>  
> -/*
> - * Inode number ops.  Inodes consist of a compressed block number, and an
> - * uncompressed offset within that block
> - */
> -#define SQUASHFS_INODE_BLK(A)		((unsigned int) ((A) >> 16))
> -
> -#define SQUASHFS_INODE_OFFSET(A)	((unsigned int) ((A) & 0xffff))
> -
> -#define SQUASHFS_MKINODE(A, B)		((long long)(((long long) (A)\
> -					<< 16) + (B)))
> -
>  /* fragment and fragment table defines */
>  #define SQUASHFS_FRAGMENT_BYTES(A)	\
>  				((A) * sizeof(struct squashfs_fragment_entry))
> diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
> index 94edc7f46ae4..afef13cd6dc0 100644
> --- a/fs/squashfs/squashfs_helpers.h
> +++ b/fs/squashfs/squashfs_helpers.h
> @@ -32,4 +32,23 @@ static inline bool squashfs_compressed_block(s32 size)
>  {
>  	return (size & SQUASHFS_COMPRESSED_BIT_BLOCK) == 0;
>  }
> +
> +/*
> + * Inode number ops.  Inodes consist of a compressed block number, and an
> + * uncompressed  offset within that block
> + */
> +static inline u32 squashfs_inode_blk(s64 inode)
> +{
> +	return inode >> 16;

Do you really have signed inode numbers?
Shifting signed types is likely to hit UB.

David

> +}
> +
> +static inline u16 squashfs_inode_offset(s64 inode)
> +{
> +	return inode & 0xffff;
> +}
> +
> +static inline s64 squashfs_mkinode(u32 start, u16 offset)
> +{
> +	return ((s64)start << 16) | offset;
> +}
>  #endif
> diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
> index 5dabc5770f1b..0e511dd29d58 100644
> --- a/fs/squashfs/super.c
> +++ b/fs/squashfs/super.c
> @@ -33,6 +33,7 @@
>  #include "squashfs_fs.h"
>  #include "squashfs_fs_sb.h"
>  #include "squashfs_fs_i.h"
> +#include "squashfs_helpers.h"
>  #include "squashfs.h"
>  #include "decompressor.h"
>  #include "xattr.h"
> @@ -286,7 +287,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
>  
>  	/* Check the root inode for sanity */
>  	root_inode = le64_to_cpu(sblk->root_inode);
> -	if (SQUASHFS_INODE_OFFSET(root_inode) > SQUASHFS_METADATA_SIZE)
> +	if (squashfs_inode_offset(root_inode) > SQUASHFS_METADATA_SIZE)
>  		goto insanity;
>  
>  	msblk->inode_table = le64_to_cpu(sblk->inode_table_start);

