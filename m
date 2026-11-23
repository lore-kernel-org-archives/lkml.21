Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425142;
	b=MEsXlmUosbMoHi3qJ1mfWbLd8q/OQQ59u3fUQu9X8FtaCh5wYJ7pl15o/tfCwEIRu8Fo
	 8PoLMpOzcmrNt2u2ZXUiTDvT4qPxqb3bwJuPCqEdX9CLgHhhjkw8a0JTl76b3p2yBT+Tz
	 ccoRZiIf46y+pw/ar5Iqox/lkMiidpT0rfkeL1XCZ5uU4+Vme7oIC1NYqJOObiaV7GGfR
	 s7YCqn1AVYpTGFxHmvGGrRpVLqXf1PPewx/fI2TQzNJTIhy7mMfHspCuEz3JJsbpGHsrL
	 wj+m8/+qGyJtJ5BGWd1PbHkibxwfpSlNdmI3PIHzjIvu1JMl54hzjSZozkOX/X7dHJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Tp89dF8YY1ARvK+OBSuLLNP8DWZPqFRGRfU48585E7E=;
	b=xnDOnCAZt6htzEDiD9XEL9aBibuoAOxVScg7/KQX7k/F2WAFr93sjl8yHchFKrqhP6O8
	 PavDlujEFY2lub8zVUun16OfCBdipEOf7jHgoDJvzBWqBCWC+cbODM6qWBM6ulsBtVX+B
	 95vi6N2luj8AlypbuvjDS49w2HaUOyhT+I0d7Qntpk2XsJS5T6wNdzMPz5qyhs7qtwJ67
	 IS71ATXpNfCJSnnk2rzAEGc2sdI66mmIq+XdzmUQymlS1cZVlm9VajlftGoUtlLLmwYBo
	 nJfT6W2O3AKvHn7dC8A/UgWJU2/gjmXuKpuKbGKuCe6wt/ksOaU2RuHs/qkCz39YfDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTtY7Qka;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55029606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55029606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTtY7Qka
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so37035665e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425141; x=1796029941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tp89dF8YY1ARvK+OBSuLLNP8DWZPqFRGRfU48585E7E=;
        b=RTtY7QkaPQlmvIa34G1hdGwq8fJ+QUzt+ZIxlGfUM2qUDQ+5Jl0Vjj2UMlruQP/QxC
         zm3ruMiBHFjnQTyxvstJS5qqTFLJ++GnnTZ2++I/dUN2JpLIkg/f8YZmXak8+Tf+tnwb
         8S9tVSThJGLFE3Be7ZvXDL0KTFIPjhTtkF2BOlcIrs/z0jVXPF4YTwQArAuukfuPAAvJ
         yqFlYNgud6xkd7IdLe9NoNHFwcnd43fJSAA9w2gS/0E58zT4fGjaXjP+VMQlnqctfaSv
         u2POc5I4VnK6wl7+R4teE59+PlFSKAtaz5lD1+gqsPsBvB+5L9WAlScDZj29ZdLvyaaw
         tseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425141; x=1796029941;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tp89dF8YY1ARvK+OBSuLLNP8DWZPqFRGRfU48585E7E=;
        b=A6I23GNyO0XoSacyva5UdaTgp+9r+60hxNli71FVKHyERjEaAEan6wCIG47Feu8fn2
         YGGiHZmleoF7G/aMIFzgWcvfjCJedbD8yEKFtLiCi5lA7hnLbwrvB/hifxJ+6UzmkpzI
         yFkeFanKgyPISXDP3NtkqXKkU/4LEFdVhtbWwJG52SQrNiFHXuQZeipMlTdJNkM1cekM
         nfkcxKOfEYT8nH+w5xHdjJY1T/ZjUF9A0i/+ev8fHZLpl/yxU94bf665f/wWcC+D5V6S
         r9p8tuoiwuw37X+jhMY9CjlnQ7WbhKnbRwRLZfX82jY3x02XKR/xToMgX4eLctUgiZDe
         JSmA==
X-Forwarded-Encrypted: i=1; AL+hErFNb+fT1Yx4RpUCp0kFT2YhnVCMOv0ROxadoBV/59wk20IT+1tr8t1QwMRq5hLPb5nLEh54EeUXokq/u0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FJHaE4MosCUrlRMIacgQOWjf0QqFkJd6KWd8FuIcOi7LgIF8e
	ZsLr9KrTL/qB/cpbl+6VI2a69QBgRbBQNg1+AcgOEUF6KTPQ0nfgtxkWinhlWu/d
X-Gm-Gg: AZFdTZcelBn+5DCFL3Z9OlH8k6q1JmWA7Ai/81SvhqcJJcWggon6FAjvJqRdULkI3NB
	T3gt3q2jLwlwxl1DZlkYBR+9LXpEHmsyr0C7L5ntdAJN9fCj8oB5BEz5LM7oJxBQNFe9CubLUGY
	JlmUHC72rEp45mBVC4VPm/XfUuGg1nnO/r9EdUzzphp1jBn7QmQrKy/Zw/oL0rY8X0TLQPZ3P+B
	sOEKaIIxW9UvrrkcHkFILtYVEb4CPtgBL1m6L2YjBZWYnw1OuNdP/lQc1j2r+35gM9ot9kMZslz
	nB00xEx266LWq9JAW++MV+3/o2j2p2zJNDTSD4HLCXMD6WdfQ0xZz5NdTI/dybWxm5E/Qqejnxh
	J/F2U46AUQcB2iOE3ep21xF5OI13elJQDzsgpbqmh7xakDUd1uEcDa46UfVunpP1HMn84jFKMO9
	L4V8XVNy2iATeryNtpXqAYVbvv7cfMKZBRiiyZ1yxs3oC8ZXUjbDHABWF5mjs7qtU5GjqdrD8zN
	FSQxe25ToD+GuAVe9dbSRYvhMwZo9qNu12BC/Rv48VxPLry5u9xDWDw6idAjAhDCvacmVi5v6gA
	a1NyGSh/TQ9Xp6v1jsKDn6w53Vwp2x9jAhTpli8te/FmG6Mcqo6Bs9KynmOduzVGmg==
X-Received: by 2002:a05:600c:5308:b0:4bb:76d6:1f5d with SMTP id 5b1f17b1804b1-4bb887ca192mr233195625e9.2.1795425140506;
        Mon, 23 Nov 2026 01:12:20 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm440327975e9.0.2026.11.23.01.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:12:20 -0800 (PST)
Date: Mon, 23 Nov 2026 09:12:19 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/23] Squashfs: convert SQUASHFS_ID_* to inline
 functions
Message-ID: <20261123091219.110f9dc6@pumpkin>
In-Reply-To: <20261123034304.261742-6-phillip@squashfs.org.uk>
References: <20261123034304.261742-1-phillip@squashfs.org.uk>
	<20261123034304.261742-6-phillip@squashfs.org.uk>
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

On Mon, 23 Nov 2026 03:42:46 +0000
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
>  fs/squashfs/id.c               |  9 +++++----
>  fs/squashfs/squashfs_fs.h      | 15 ---------------
>  fs/squashfs/squashfs_helpers.h | 27 +++++++++++++++++++++++++++
>  3 files changed, 32 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/squashfs/id.c b/fs/squashfs/id.c
> index ea5387679723..5630f5ec159a 100644
> --- a/fs/squashfs/id.c
> +++ b/fs/squashfs/id.c
> @@ -24,6 +24,7 @@
>  
>  #include "squashfs_fs.h"
>  #include "squashfs_fs_sb.h"
> +#include "squashfs_helpers.h"
>  #include "squashfs.h"
>  
>  /*
> @@ -33,8 +34,8 @@ int squashfs_get_id(struct super_block *sb, unsigned int index,
>  					unsigned int *id)
>  {
>  	struct squashfs_sb_info *msblk = sb->s_fs_info;
> -	int block = SQUASHFS_ID_BLOCK(index);
> -	int offset = SQUASHFS_ID_BLOCK_OFFSET(index);
> +	int block = squashfs_id_block(index);
> +	int offset = squashfs_id_block_offset(index);
>  	u64 start_block;
>  	__le32 disk_id;
>  	int err;
> @@ -60,8 +61,8 @@ int squashfs_get_id(struct super_block *sb, unsigned int index,
>  __le64 *squashfs_read_id_index_table(struct super_block *sb,
>  		u64 id_table_start, u64 next_table, unsigned short no_ids)
>  {
> -	unsigned int length = SQUASHFS_ID_BLOCK_BYTES(no_ids);
> -	unsigned int indexes = SQUASHFS_ID_BLOCKS(no_ids);
> +	unsigned int length = squashfs_id_block_bytes(no_ids);
> +	unsigned int indexes = squashfs_id_blocks(no_ids);
>  	int n;
>  	__le64 *table;
>  	u64 start, end;
> diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
> index 89b998f57a2b..25dd89a2c6ad 100644
> --- a/fs/squashfs/squashfs_fs.h
> +++ b/fs/squashfs/squashfs_fs.h
> @@ -107,21 +107,6 @@ static inline int squashfs_block_size(__le32 raw)
>  	return (size >> 25) ? -EIO : size;
>  }
>  
> -/* uid/gid lookup table defines */
> -#define SQUASHFS_ID_BYTES(A)		((A) * sizeof(unsigned int))
> -
> -#define SQUASHFS_ID_BLOCK(A)		(SQUASHFS_ID_BYTES(A) / \
> -					SQUASHFS_METADATA_SIZE)
> -
> -#define SQUASHFS_ID_BLOCK_OFFSET(A)	(SQUASHFS_ID_BYTES(A) % \
> -					SQUASHFS_METADATA_SIZE)
> -
> -#define SQUASHFS_ID_BLOCKS(A)		((SQUASHFS_ID_BYTES(A) + \
> -					SQUASHFS_METADATA_SIZE - 1) / \
> -					SQUASHFS_METADATA_SIZE)
> -
> -#define SQUASHFS_ID_BLOCK_BYTES(A)	(SQUASHFS_ID_BLOCKS(A) *\
> -					sizeof(u64))
>  /* xattr id lookup table defines */
>  #define SQUASHFS_XATTR_BYTES(A)		(((u64) (A)) * sizeof(struct squashfs_xattr_id))
>  
> diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
> index aafc75a3a435..b9c517a50642 100644
> --- a/fs/squashfs/squashfs_helpers.h
> +++ b/fs/squashfs/squashfs_helpers.h
> @@ -105,4 +105,31 @@ static inline s32 squashfs_lookup_block_bytes(u32 inodes)
>  {
>  	return squashfs_lookup_blocks(inodes) * sizeof(long long);
>  }
> +
> +/* uid lookup table defines */
> +static inline s32 squashfs_id_bytes(u16 ids)
> +{
> +	return (s32) ids * sizeof(unsigned int);

What is that cast for?

The choice of types looks odd for other reasons.
You have 'u16 ids' but the caller passes an 'unsigned short',
in reality 'unsigned int' is likely to generate better code than
a 16bit (or 8bit) type.
Put u8/u16 in structures, but use unsigned int for variables and parameters.

Changing these from #define to functions is likely to force the compiler
to add instructions to mast the results of arithmetic operations.

I'd also guess that the 'id' is a fixed size type?
(Yes, I know 'int' is going to be 32bit - but that isn't the point.)

David

> +}
> +
> +static inline s32 squashfs_id_block(u16 ids)
> +{
> +	return squashfs_id_bytes(ids) / SQUASHFS_METADATA_SIZE;
> +}
> +
> +static inline s16 squashfs_id_block_offset(u16 ids)
> +{
> +	return squashfs_id_bytes(ids) % SQUASHFS_METADATA_SIZE;
> +}
> +
> +static inline s8 squashfs_id_blocks(u16 ids)
> +{
> +	return (squashfs_id_bytes(ids) + (SQUASHFS_METADATA_SIZE - 1)) /
> +		SQUASHFS_METADATA_SIZE;
> +}
> +
> +static inline s16 squashfs_id_block_bytes(u16 ids)
> +{
> +	return squashfs_id_blocks(ids) * sizeof(long long);
> +}
>  #endif

