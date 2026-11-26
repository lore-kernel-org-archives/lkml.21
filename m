Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795736989;
	b=Q3s2SRdUxnr1DNrUYxWtmrn9nL+lFxHZlm/2BBO6wb4JLyRPhtES3Kcu3dKZP5qKuuQl
	 HZ9uTNqI2TyBGjT89Ukl2GWfaXk3RMwqGRm1hkUyOUpL7qqSvlpl3VKh9QXBaQCHvtw0L
	 Gim+taSwBBgnnqsFIixD50E5p9umTfNnjOK0IFIMrObM1tMwzLuWw71R7nMmgI1C5WVkQ
	 o/yuu4PULuFM4LXZobb7VcXtapITnKYOgCJVU7IzpnC1xhTQUjQPEa6VXyPgCQ9cd15gI
	 WVdfsh3hgvUuQHja9Ava9BIzDCIok/Ebg14DDnjX6mUkxVMRWswogK4QPQd9P21wfGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795736989;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8KXjkAEHAX5IhHajnQpG4gGNF1WXOK7byi/0lbAhyxw=;
	b=SeJV2KZfudsO8NnAyuMar6elqdAHufMKEB8rxpr7e4Y4NZ4eTGOs3GqCQMGgcPj5x/5k
	 a0w/eEf0fhsg8Sax1KMQMjHz6Ki/gVonGbFtUtujeZiZEXitRDE19cDbt40S+VEDIzPUH
	 3UTITN1kyr9MQDmQLMNZwLXP4f25RhM+c66A5qfVlFAGDlvld5TDnUtJ9eaZP1SDKbRJo
	 A9tq0INWLEQ+vBygZQxQjj78mlJke+FSrEqDwbN6a5fO3J5QLiwRkETRy3R1RjVLrBk4l
	 9c//uevVCW82CtNM52Yz8eF8tFX0tWsytd1r/A8NKQPkeONkpG4HfO5G5oIDlW5OUsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=qmEDT5D1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6FF606A332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=qmEDT5D1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73BC1F00893;
	Thu, 26 Nov 2026 23:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795736989;
	bh=8KXjkAEHAX5IhHajnQpG4gGNF1WXOK7byi/0lbAhyxw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=qmEDT5D1CdW0tkoYGMksPK0Lmkn5Q5mqY+zZBkgQngQialuNCt2u2twSIljZ0RhDS
	 Mrr6NKoTTjcBPDPiyF6jVKR5dmS75gtYhngRD9iM+BmwmMiLIMin6bm76J5VpV89eL
	 Cb15SuLk5qy+sI7xjVSEfDtotQXL/PcHeHZrEZEc=
Date: Thu, 26 Nov 2026 15:49:48 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Shuai Liu <847807867@qq.com>
Cc: phillip@squashfs.org.uk, squashfs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org,
 syzbot+f1290205423d04eee4cb@syzkaller.appspotmail.com
Subject: Re: [PATCH] squashfs: fix NULL pointer deref in squashfs_lookup
 TRACE
Message-Id: <20261126154948.e81cd1dedea46e56dd33c258@linux-foundation.org>
In-Reply-To: <tencent_DC2C02F2FD4DBEB8416265132CEED7D2AA08@qq.com>
References: <tencent_DC2C02F2FD4DBEB8416265132CEED7D2AA08@qq.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Nov 2026 19:19:24 +0800 Shuai Liu <847807867@qq.com> wrote:

> In squashfs_lookup(), commit 5b515c0ec855 ("Squashfs: don't compute start
> or alloc memory on empty directory or index") moved the TRACE statement
> to before the block/offset variable initialization, so the TRACE was
> rewritten to use squashfs_i(inode) instead of squashfs_i(dir). But
> inode is initialized to NULL, so squashfs_i(NULL) evaluates to an
> invalid pointer which triggers a kernel page fault when
> CONFIG_DYNAMIC_DEBUG or DEBUG enables the pr_debug() call.
> 
> ...
>  
> -	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(inode)->start,
> -			squashfs_i(inode)->offset);
> +	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(dir)->start,
> +			squashfs_i(dir)->offset);
>  
>  	if (len > SQUASHFS_NAME_LEN)
>  		return ERR_PTR(-ENAMETOOLONG);

Yep, thanks, Phillip squashed this bug in the v4 series.
