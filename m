Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034312;
	b=hwWyr7fgaeq55znadpsoTGY3nuGkkRELP1ECelGcoylaa04NFzsYjU9EWqK1LtsIJe/T
	 dnJzgvnFEcLEa4AuKtcG2WjPK5tbTG2IswfuqCWCvOi9c9tT5dKzm0RfMxRpbT4Qhx+6b
	 EOlRBThqL2XZj+we17E99aNh1FK+PBKhmPKm0fa3W45z+BQENqmUMirWsZomuwcKtA6K2
	 UnCfEIxK+5o2OrJgVQVkIguCsMEEW6nsAIOtElVxi/J4kSXPEUZY3pQIVAN9dIKOICTVq
	 jV88EmT7I1HnClCCYuw93852XxS2LWLpCYnMb3c098Ou4RpXSQg5jWjzwuEGTTzfI5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gl3uARuCLrvmOuEUSt0jl78CwT5lLVAwnYwWKnlCtjg=;
	b=W2llyYfQ7wrbQly263HN+84wbPgRHtFrWj2dNcLu8gWbr2q7YmtlrD9RirEeFGEX401g
	 0TVB40Lwl7Sc3PpK/zwC9dXdQRFSuvlvHEpNn4RVIs8h4/yag/ctSEYtfMSw6vbsQQjSH
	 NowzSofpKhweRZe7SgLW9CfQFu0FCv09etrhwSX1onEv9QpOmSVXSMBu0PQeoNXWQNFQD
	 3QHHzZtVZjSyoZt30d1AXWav/tOyqHQeA015ClTnEIdo7PVm7lsPC2G3A4jdpz+dEQtqB
	 WJ8H2BTpi13CMbVSaZ+wDY+OAVAj9ZY4qjsF3xe0mTUSqJjYM4AB7vQvuOJFP4x93qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aMjMPqIK;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9F5606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D9F5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aMjMPqIK
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so15432715e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795034310; x=1795639110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gl3uARuCLrvmOuEUSt0jl78CwT5lLVAwnYwWKnlCtjg=;
        b=aMjMPqIKTeoUDpBgnMIqwkeYUd0CBMu/ebiA1IObULvrIXU2b8hu0MhxRqN4vGMBe2
         6e4QpLWrODjeS8x/3VFhJV2e+/oPGqmXBLolqnoJ97EtdwZTBsJ+3vP4khGLjB9U7S1c
         ic8Sf4Ko+ZV6WOHmoSmTrXW/zlCyWfP3ygTRmYzsBAGynkOK75a8nG3jc8V1rCfQSAb+
         s3zRFpYRITW/QUa5bUD4mXjprH5yy6u8KowlmJrdBmbL5A8MT5ymTHsCzoUEYM5gzSqC
         gGc5WYxxqGGtjQklZfBz936Jdp4ZAV7QHQNn1ySvjQ1cEyXyynywM4Klj+/3HWPUYhK1
         Sypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034310; x=1795639110;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gl3uARuCLrvmOuEUSt0jl78CwT5lLVAwnYwWKnlCtjg=;
        b=A5zkapt3Z4n5HAnZk/fSEL4eUKBmZMMjiz4+axMC8Tg0t8geTzzc96ULkp0taEtlOr
         3zbnAC1sWIpDJri+hAfalaOOHj7aRJuRrHYU/HHoQVNvx0BI5upTAgkxQ8zwvqaeljAP
         AOaPvLojWPWwVv1pQpDWoKk80vn6KucbCoVJVvrJbvj6r9PGLb8sj9UoWqbW+b7R+IDd
         mQQURs4Oc2FsQYv63otOGcMVNzOVxZcr3tCGzK0xk5J8eQr+tZSTtSVM/KevbDmr8U0Q
         N7qsF2ppw6j8URVICQTQpgVbg+Fh/Xn1OVIv0pWVBKmAII/Ptxzbovgo53ST0SCyIs90
         Tmdg==
X-Forwarded-Encrypted: i=1; AL+hErEqCI+S3ryBYq862iVdzT/lDqH/ndPYHyUXTL/ZxeN5VoGIMJxvvKEhrpRqMW63MPuyssSxwr+yYpcvb3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2tPaYPXidC4wUR2UaZ2oAbAR/MLgd76bWsQSX3AkwfNonz+Zg
	acyrOlly07CHPecYzVUjAB6terYIQSpt3w1U2nqGjE7qhzIiP8g5gsKGdTAa+2BlIac=
X-Gm-Gg: AYBFou20lEQ2XVMXjduS+5XYueD6d4seCWKQeMc2E3u8t5E9f6pzjQGA+lIhar+oJd9
	oCOB7ELRhpeKoVwttdMDBteI9EJpnpL7yVpRhn0mboD2XGbLGIl5D9rl4vuqZRkcLJFoaC0f8PO
	L9rzAzDEiJSYGsTEEGlwACZT0RVr2BOuaNNleEfqiHFLJyD6F+reInzRxuW6taYtEd58akVFQ+m
	JbCSZINwrFGt11gg8PtrFlR+qS+u98F+JVDGhKlylFR7mgFxEGHLgR6Y5dkIojjZF0bti20W4nZ
	tKPona5xOu5921GDVv2rTFO076+nlZ5TmY2JkugVIa7NIC/szd8RGjI8kAZw0diBlzxE4Dc2+PN
	xYLBft+PKQDiBPpjNxLcVUXMSvaZKq+YPnGd+83fPRKLWWVruy5AeCgfJGT24ng24iuNYY23MZX
	oHpducioI/UCvJj6l9oDkWVB6S7QcCOFgU3ggb0mUl137kht5RUpgOpRUHeQ7+foqUtEx+zY11w
	LfrcCO/P4O4s57Q/AXM//mwbolJv9CYYY0xGEprq3bYQBbVhVDMC9yQFh4C+u4NKjkWx0TTtxG+
	CkCFYc21oCocfgb+19jkSg==
X-Received: by 2002:a05:600c:6298:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4bb7da1b37fmr77157215e9.12.1795034310161;
        Wed, 18 Nov 2026 12:38:30 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f687baaasm841803a91.2.2026.11.18.12.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:38:29 -0800 (PST)
Message-ID: <da879d7e-7790-4507-bfbc-55a78fe20ddc@suse.com>
Date: Thu, 19 Nov 2026 07:08:22 +1030
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
Subject: Re: [PATCH v2] btrfs: fix bytes_may_use underflow after a failed tree
 block allocation
To: Vlad Poenaru <vlad.wing@gmail.com>, dsterba@suse.com,
 linux-btrfs@vger.kernel.org
Cc: mason@kernel.org, osandov@osandov.com, josef@toxicpanda.com,
 fdmanana@suse.com, boris@bur.io, quwenruo.btrfs@gmx.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, stable@vger.kernel.org
References: <20261118170332.992625-1-vlad.wing@gmail.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <20261118170332.992625-1-vlad.wing@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/19 03:33, Vlad Poenaru 写道:
> When btrfs_alloc_tree_block() fails after btrfs_reserve_extent() has
> succeeded, its error path gives the block back to the block reserve,
> although the block has already left bytes_may_use. Each such failure
> leaves bytes_may_use a block short, and it underflows and warns in
> space-info.h when the global block reserve is released at unmount, or
> earlier.
> 
>    btrfs_alloc_tree_block()
>    |- btrfs_use_block_rsv()
>    |- btrfs_reserve_extent()
>    |  \- btrfs_add_reserved_bytes()  <- bytes_may_use -= blocksize
>    |- btrfs_init_new_buffer()
>    |  \- alloc_extent_buffer()       <- fails with -ENOMEM
>    |- btrfs_free_reserved_extent()   <- bytes_reserved -= blocksize
>    \- btrfs_unuse_block_rsv()        <- block rsv += blocksize again
> 
> Since commit 19d7f65f032f ("btrfs: convert the buffer_radix to an
> xarray") in 6.16, alloc_extent_buffer() can fail this way under memory
> cgroup pressure, because fs_info->buffer_tree is memcg-accounted.
> 
> Return without giving the block back once btrfs_reserve_extent() has
> succeeded.
> 
> Fixes: 67b7859e9bfa ("btrfs: handle ENOMEM in btrfs_alloc_tree_block")
> Cc: stable@vger.kernel.org # 6.16+
> Reviewed-by: Boris Burkov <boris@bur.io>
> Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>

Reviewed-by: Qu Wenruo <wqu@suse.com>

Thanks,
Qu

> ---
> v2:
> - Shorter changelog, built around a call trace (Qu Wenruo).
> - Dropped the code comment (Boris Burkov).
> 
> The code is v1's apart from the removed comment, so v1's testing stands:
> its reproducer leaves bytes_may_use below the global reserve without the
> fix and not with it, and fstests btrfs/002, btrfs/220, generic/475 and
> generic/476 pass.
> 
> v1, with the reproducer:
> https://lore.kernel.org/all/20261113170926.1468850-1-vlad.wing@gmail.com/
>   fs/btrfs/extent-tree.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
> index 9b0a5c6b96f3c..8d4c66bf850bc 100644
> --- a/fs/btrfs/extent-tree.c
> +++ b/fs/btrfs/extent-tree.c
> @@ -5433,6 +5433,7 @@ struct extent_buffer *btrfs_alloc_tree_block(struct btrfs_trans_handle *trans,
>   	free_extent_buffer(buf);
>   out_free_reserved:
>   	btrfs_free_reserved_extent(fs_info, ins.objectid, ins.offset, false);
> +	return ERR_PTR(ret);
>   out_unuse:
>   	btrfs_unuse_block_rsv(fs_info, block_rsv, blocksize);
>   	return ERR_PTR(ret);

