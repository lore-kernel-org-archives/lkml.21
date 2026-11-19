Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101006;
	b=3mTVcPxDtSw7sn0D9SofA5Pb/803JqGdHis1iEeY9hrr3me6e4eGFOv+nfCpg5rP6PsJ
	 NdezVCkB8n48RKAPWq8PQzU8t6AFD09aOXR8gof9dX1iO9P0tn5wN0fUUIqv32cbcKUMd
	 kaTdy/rKvOrTwUvHGYRgIGYaJoZRGdwRK/XHa4UYd/NnIdh7Y2URdWnM12cfWnowy1A+B
	 EO8WfbUKpD1o4jE0Qm8JAHPogxkCW5b/e3tp5pZr002N/c6LJuQ9bg5LYJRaIeib9nHBC
	 sMbkHBKDcDZMfIDEPW+QWmqGK9+WLhOqMsMdwusFlSZsRhGabnhYx9QtNs/iGRjYS7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101006;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=RyuDBlQj+p4iLBEgjEysj+ffCHoI0uxKXMeog5rn1Ko=;
	b=WJ2vWTXGYyETnJrgOAJuVs3p5/O+RK4Oz/7vEfnamWROwTP/UYedMYreAtAg6NnBtJMi
	 vhV6E2rIQHE8IDrMP3EmBkJoVPZcSf48NaflPPanYQU90SgFDwkAnpVU+F4oUhGoeMW6O
	 TloJWBzy116LaHuHMsOu9joSFzc5YQES6AqbA2kBlLpydofsn/VH6NaagSbdBKNH0bkZZ
	 7rHUKjm2ASaiHGShRu24FwauO9/eHN2TNPwilIJS9KB3oZAKFhAId3098svgrtgbbawNc
	 RFQgyyZ/d46S9tJRsomJTinEVFss3V4LA5J+PdEbkXT4c+wUdjR/bxPZBtgAECgf3UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=anilXYKM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ACF606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=anilXYKM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3BA1F000C4;
	Thu, 19 Nov 2026 15:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795101006;
	bh=RyuDBlQj+p4iLBEgjEysj+ffCHoI0uxKXMeog5rn1Ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=anilXYKMBkC76ShgbbpejKFraPrmJWR5M3JpJurCAaNTLLJyn8IfzSGYxdD1fJ4UH
	 ID153pUxwNS1MdVylXeUR3TVxUbqC9TosoOda5tPByOvrPdiRLAZHf6ceFNNJVs3xp
	 KRbWgmA8zlqIsTPXZEkM4nxcn9Eb2d2lPvRi4+oQ=
Date: Thu, 19 Nov 2026 16:02:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Habil Eren =?iso-8859-1?Q?T=FCrker?= <habilerenturker@hotmail.com>
Cc: Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com" <syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com>
Subject: Re: [PATCH RESEND] char/hpet: Fix missing TASK_RUNNING before
 put_user() in hpet_read()
Message-ID: <2026111926-finisher-captivity-64ce@gregkh>
References: <20261117111633.52928-1-habilerenturker@hotmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117111633.52928-1-habilerenturker@hotmail.com>

On Tue, Nov 17, 2026 at 11:16:37AM +0000, Habil Eren Türker wrote:
> hpet_read() sets the current task state to TASK_INTERRUPTIBLE within
> the read loop. However, when data becomes available, it exits the loop
> without restoring the TASK_RUNNING state. The subsequent put_user()
> operation may go to sleep due to a page fault, which triggers:
> 
>         do not call blocking ops when !TASK_RUNNING; state=1 set at
>         [<ffffffff85b6d1eb>] hpet_read+0x21b/0x6a0 drivers/char/hpet.c:285
> 
>         WARNING: kernel/sched/core.c:9187 at __might_sleep+0x94/0xc0
>         kernel/sched/core.c:9187, CPU#0: syz.0.873/9126
> 
>         Call Trace:
>         __might_fault+0x8b/0x140 mm/memory.c:7480
>         hpet_read+0x56f/0x6a0 drivers/char/hpet.c:309
>         do_loop_readv_writev fs/read_write.c:848 [inline]
>         do_loop_readv_writev fs/read_write.c:836 [inline]
>         vfs_readv+0x5d8/0x8d0 fs/read_write.c:1021
>         do_preadv+0x1ac/0x270 fs/read_write.c:1133
>         do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>         do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
>         entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Restore TASK_RUNNING before breaking out of the loop.
> 
> Reported-by: syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=fc3a448093c17a792368
> Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
> ---
>  drivers/char/hpet.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
> index 285c6037417a..7ad319c6d942 100644
> --- a/drivers/char/hpet.c
> +++ b/drivers/char/hpet.c
> @@ -290,6 +290,7 @@ hpet_read(struct file *file, char __user *buf, size_t count, loff_t * ppos)
>  		spin_unlock_irq(&hpet_lock);
>  
>  		if (data) {
> +			__set_current_state(TASK_RUNNING);

Shouldn't this be set_current_state(TASK_RUNNING) instead?

And why hasn't this ever been noticed before, what changed to cause it
to show up now?  And because of that, why is there not a Fixes: tag?

thanks,

greg k-h
