Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103823;
	b=Wtrpe7CvOBgB2vkm78X1yd3fGt1GUNSZif5YJFMnf6Hw+uy61TcNFZ7dzwQVfYTIF7Pe
	 6FZlvmEAtPPikd8Nt300Xu1Pa9WI25f6rcttGylMGZEl4gjmofaZB1suvYy25saTz+Ygx
	 whmlOhCjdzZUNGmobIsgnnOWHsNZZcmXBwjhzd75Jt/EUKkZTT1sXeTIzQH7pI74H7gaw
	 XQ5Q4k2OgaRxXpxKB+CtgTJH0ckWVD88IPhVv1svIixOK8FO+Qpllvz8393IPEW3bbU4A
	 ddMqzQ0awgfyZpW9zmMfO3XYQwungvxvZOcCZC2MtHjvNj6L9kAViK6tYTfzkSYc/5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103823;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gnXK3eI0LzM5e0oAZdia117Au3H1x4p+Ro2fs0XpX74=;
	b=N5t83PFLjP9CULoD5mMYXw75ayDQL0j768g8PISRZCTRPK5FqYEnhd18xiojQW93EdWV
	 vNRbVnrSCN4+ZpntG9NyjNgEGSzS/jdTRmWvt0hniTwp8CmPgwIl4X5jYQIjXup6jXqG1
	 QBeqtKYyjRKKnTEeeFYJq9QchWYMY4ajPBJBwdlygnFgvaAEAH8Y1mSgFP/0hwZQetV1M
	 njfS4sCS578SALIkkVnQoOXR/x0SCXGtFUH2Z2WEHv75Kr4PjDh0+TwnqX3+KUHSKhc60
	 eMOL8KgcLBxJUDGkr8RW97UGtzxLIZkMZ4bnE1wuxCfhwKDVpRFJIfrADfSB+JeutWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rHUmJS27;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95209606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95209606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rHUmJS27
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gnXK3eI0LzM5e0oAZdia117Au3H1x4p+Ro2fs0XpX74=; b=rHUmJS27i5nH1M5iciNxKFw+Zv
	IUWEq21qEYdjOT8T0tUnLOajdQpHSPshHUjHXEFbdnaVzLUJ7l/fsEoQuQwz83A9VcyIJNAGAwKwp
	K/Pigksnvm8QuQQSpnaUFeGk+tlXtTGTGUD3c24walAKbS7UPOR5dfhd22HMCtH4d5ayhrmfGvb3M
	3I9+AZCfsdfLU+aRCIKMvm1cUyu3NZrRsq1HdcW9TaG0RKxrdsEaMcBY4wGkN9rRmYkEU7uUB+Hgi
	gwA1+gQpUVm0Uae4pMHYNi/2vy7WBAsjTqVLowHB+M3h29wwU21kbK+lgrVI+rxDiR3hfhJ20ejOS
	wwI1H+AA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4VQ-0000000HQXz-1Ifp;
	Thu, 19 Nov 2026 15:57:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0A88F30072F; Thu, 19 Nov 2026 16:56:59 +0100 (CET)
Date: Thu, 19 Nov 2026 16:56:59 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH] locking/rwsem: don't let a read lock steal from a queued
 writer
Message-ID: <20261119155659.GB1779021@noisy.programming.kicks-ass.net>
References: <20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org>
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
In-Reply-To: <20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org>

On Thu, Nov 05, 2026 at 08:24:27PM +0000, Lorenzo Stoakes (ARM) wrote:
> Since commit 1a728dff855a ("locking/rwsem: Enable reader optimistic lock
> stealing"), a racing read lock can steal an rwsem from under a queued
> writer whose handoff timeout hasn't expired yet.
> 
> This is most problematic when an rwsem read lock is released then
> reacquired in order to relieve lock contention, as instead it will simply
> have the lock handed right back to it ahead of the intended beneficiary.
> 
> Naturally, this behaviour rather defeats the object of doing this kind of
> thing, so this is less than ideal.
> 
> Fix this by updating the optimistic read lock stealing code in
> rwsem_down_read_slowpath() to explicitly check whether the first queued
> lock is a waiting writer, and to not allow the theft if so.
> 
> When a steal is disallowed, keep the existing sem->wait_lock held when
> jumping to the queue code to avoid useless lock acquisition/release.
> 
> In order to perform this check, sem->wait_lock is acquired whenever there
> are queued waiters in the steal code, rather than the previous behaviour of
> only doing so when the reader count is 1.
> 
> Since failing to steal a read lock unconditionally results in acquisition
> of the sem->wait_lock, this doesn't seem likely to be a significant
> overhead.
> 
> Also update the comment describing optimistic read lock acquisition
> conditions to include this newly introduced behaviour.
> 
> Care is taken to ensure correct ordering of lock acquisition, lock waking
> and marking the lock reader-owned.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

So conceptually this is indeed what I meant -- ACK on that respect.

It would however be good if we can get this ran through some CIs to see
if there's some obvious regressions and whatnot.

> ---
>  kernel/locking/rwsem.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
> index b9c180ac1eee..cdb3dd6260bf 100644
> --- a/kernel/locking/rwsem.c
> +++ b/kernel/locking/rwsem.c
> @@ -59,7 +59,8 @@
>   * A fast path reader optimistic lock stealing is supported when the rwsem
>   * is previously owned by a writer and the following conditions are met:
>   *  - rwsem is not currently writer owned
> - *  - the handoff isn't set.
> + *  - the handoff isn't set
> + *  - a writer isn't at the head of the wait queue.
>   */
>  #define RWSEM_READER_OWNED	(1UL << 0)
>  #define RWSEM_NONSPINNABLE	(1UL << 1)
> @@ -1034,31 +1035,36 @@ rwsem_down_read_slowpath(struct rw_semaphore *sem, long count, unsigned int stat
>  	 * Reader optimistic lock stealing.
>  	 */
>  	if (!(count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF))) {
> -		rwsem_set_reader_owned(sem);
> -		lockevent_inc(rwsem_rlock_steal);
> -
> -		/*
> -		 * Wake up other readers in the wait queue if it is
> -		 * the first reader.
> -		 */
> -		if ((rcnt == 1) && (count & RWSEM_FLAG_WAITERS)) {
> +		if (count & RWSEM_FLAG_WAITERS) {
>  			raw_spin_lock_irq(&sem->wait_lock);
> -			if (sem->first_waiter)
> +			first = sem->first_waiter;
> +			/* A writer at the head of queue takes precedence. */
> +			if (first && first->type == RWSEM_WAITING_FOR_WRITE)
> +				goto queue_locked;
> +			rwsem_set_reader_owned(sem);
> +			/* If first reader, wake other readers in queue. */
> +			if (first && rcnt == 1)
>  				rwsem_mark_wake(sem, RWSEM_WAKE_READ_OWNED,
>  						&wake_q);
>  			raw_spin_unlock_irq(&sem->wait_lock);
> -			wake_up_q(&wake_q);
> +		} else {
> +			rwsem_set_reader_owned(sem);
>  		}
> +
> +		lockevent_inc(rwsem_rlock_steal);
> +		if (!wake_q_empty(&wake_q))
> +			wake_up_q(&wake_q);
>  		return sem;
>  	}
>  
>  queue:
> +	raw_spin_lock_irq(&sem->wait_lock);
> +queue_locked:
>  	waiter.task = current;
>  	waiter.type = RWSEM_WAITING_FOR_READ;
>  	waiter.timeout = jiffies + RWSEM_WAIT_TIMEOUT;
>  	waiter.handoff_set = false;
>  
> -	raw_spin_lock_irq(&sem->wait_lock);
>  	first = sem->first_waiter;
>  	if (!first) {
>  		/*
> 
> ---
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> change-id: 20261105-rwsem-dont-steal-from-queued-writer-04b11d9d406b
> 
> Cheers,
> -- 
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
