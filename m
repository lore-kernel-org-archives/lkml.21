Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.171.160.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852470;
	b=vuN9IJzxi5tDbfOuoMJE3p3a7uJ/rbQe0SkSq9oCuvnAg/ONdXaZLi+wKq365VLH1UID
	 xBtk88L05fRp8s2WSvqPlTGFZ9rolR1Pm3m+8/G2jxJTAdIPUKurVSRfDmDBA/pm22YUn
	 7/P1WTnYysQme1sS+QAhpBILkC4Z3tp/oQIpdXi/tkUwRgEj9Qmgc1uTkjdJZcp2AZDYI
	 e4ikbAEKtsoTu8TXDlnRkbz2eDdeA0daQSMvEnbdVDYE4o6AdaK+g3UIryiQfO8tAYIO8
	 WFSGcrLfi2Sh67KsCneT1yKCEfF+6Zddxd7ChO70b8+NYbuemqWXd1jFvwjRwriGX9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852470;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 User-Agent:MIME-Version:Content-Type;
	bh=kLtA5YexUJvNlgNTszCQLu10QwELUeE2+KWouWk5icA=;
	b=qxFiQsuOhed+ye/by9ZnFVi7BzdSkDJjbBYuTgUrYVrIQabxZQO5e8PmiNXJOIlIwWgT
	 Y2KmR8bkyE0lDqW0oNldpi9R7vwJtGDIz2Q8BY+PnwEpq/Eak1n8jxPGWIN+JOFcEAL/p
	 LOZ6MUrTd9kr9HnbJ1e0k1sA59LcQqcShqP/YmLN2i037m3xfKcoaYA+TsThyY0rZjKuk
	 29LhNZeQ2sjG2+4z45E7aBl6u8tS5686vtOFepa4/Aie4LvD8D+uORf94zoi48QeBGLFF
	 EI2CNqo9V6zhId1/osTRXyNY410/T4l1OcoVUDUbkarT/NRwucAScfMcm3lfhnHqBoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.parknet.co.jp;
	spf=pass smtp.mailfrom=parknet.co.jp;
	dkim=pass header.d=parknet.co.jp header.i=@parknet.co.jp header.a=rsa-sha256 header.s=20250114 header.b=LmvbaP5b;
	dkim=pass header.d=parknet.co.jp header.i=@parknet.co.jp header.a=ed25519-sha256 header.s=20250114-ed25519 header.b=J+4AED5k;
	arc=none smtp.remote-ip=210.171.160.6
Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABD8606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ABD8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.a=rsa-sha256 header.s=20250114 header.b=LmvbaP5b;
	dkim=pass header.d=parknet.co.jp header.i=@parknet.co.jp header.a=ed25519-sha256 header.s=20250114-ed25519 header.b=J+4AED5k
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id 14C3120BD2A3;
	Sat, 28 Nov 2026 16:54:28 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1795852468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kLtA5YexUJvNlgNTszCQLu10QwELUeE2+KWouWk5icA=;
	b=LmvbaP5bTjtY3VVDRTYYYPyxrUJeRflYE+qnXQ1kO25fVcYZdd/+mk2g+Hn2dheB3xj60n
	B1jshieqLMWPBZu24XUjumSgThlmRt0ppK6pPbzyiD3VMXlAtQzvC+ZRLMsT3VrTc3VN+O
	So4c+wKz9q6pZSglTTqvkE+Xi487YV3kCKqbZE+MaxhTQsjvc1JWuoGKYts24WghT1BMXN
	LMBrh5QnRjJAjB12HfhrFQwHSOY3YmbHO96ZMJNrjYHIqM4jDYFGIyipmky27pYw4vLPV2
	ohyz32Qq5H7g9NIJ1jlWjvzSIFt3I31V88PTASZm/6DkPmdjf9qdYRLgGLtDdA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1795852468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kLtA5YexUJvNlgNTszCQLu10QwELUeE2+KWouWk5icA=;
	b=J+4AED5kgSlvP9APL8Uuou30f1nzAU5FfB+quygvdg45Ewi1Z8OPug5kt4PAeM18iu32Rp
	XN/9HheZFYeZL/BQ==
Received: from devron.myhome.or.jp (devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (Postfix) with ESMTPS id 98EDEE002C5;
	Sat, 28 Nov 2026 16:54:27 +0900 (JST)
Received: by devron.myhome.or.jp (Postfix, from userid 1000)
	id 8AF172200208; Sat, 28 Nov 2026 16:54:27 +0900 (JST)
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Artem Novak <artem122novak@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/fat: fix typos in comments
In-Reply-To: <20261126213723.36535-1-artem122novak@gmail.com>
References: <20261126213723.36535-1-artem122novak@gmail.com>
Date: Sat, 28 Nov 2026 16:54:27 +0900
Message-ID: <87v75hpf0s.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Artem Novak <artem122novak@gmail.com> writes:

> Correct spelling and grammar in two FIXME comments in the FAT
> inode and FAT entry code.
>
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

Thanks.

> ---
>  fs/fat/fatent.c | 2 +-
>  fs/fat/inode.c  | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/fs/fat/fatent.c b/fs/fat/fatent.c
> index 2d10a815a579..234335e92aee 100644
> --- a/fs/fat/fatent.c
> +++ b/fs/fat/fatent.c
> @@ -376,7 +376,7 @@ int fat_ent_read(struct inode *inode, struct fat_entry *fatent, int entry)
>  	return ops->ent_get(fatent);
>  }
>  
> -/* FIXME: We can write the blocks as more big chunk. */
> +/* FIXME: We can write the blocks as a bigger chunk. */
>  static int fat_mirror_bhs(struct super_block *sb, struct buffer_head **bhs,
>  			  int nr_bhs)
>  {
> diff --git a/fs/fat/inode.c b/fs/fat/inode.c
> index 642e690632d8..7a0634c31419 100644
> --- a/fs/fat/inode.c
> +++ b/fs/fat/inode.c
> @@ -109,8 +109,10 @@ int fat_add_clusters(struct inode *inode, int nr_cluster)
>  	err = fat_alloc_chain(inode, &cluster, nr_cluster);
>  	if (err)
>  		return err;
> -	/* FIXME: this cluster should be added after data of this
> -	 * cluster is writed */
> +	/*
> +	 * FIXME: this cluster should be added after data of this
> +	 * cluster is written
> +	 */
>  	err = fat_chain_add(inode, cluster, nr_cluster);
>  	if (err)
>  		fat_free_clusters(inode, cluster);

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
