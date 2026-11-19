Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097690;
	b=hldTEut2fcJusJ9GNlauYNpBz8c0P/FfqheU0kYk7Tgoix+kv48TUrtX/sdVz/kvcvVv
	 naTyssUY2D/6Mtt1bzNLYBHvAMgoCIQRQ2RN0035Y4u7gYiU5BDN64oWn0vvHACYHFxuL
	 GYp0N2ex1ir0DolhLDOaWY0HnY2Cqp7sHrxju8EK/S4xkvOxF8ASiWniD5Dpu4UiDh49J
	 UrGIaPIyLZHqxb9ZUygLRGUem+qP2TImjpJV44Pspidgi4QKaXqVwoGxzZcMT4nLRbRvD
	 oq48gXQPLXZHu8TRGKdPGfYHR1aSq7rYgtdGLVHtr908cmQ8xSRwYHDFTmEQRiyDhQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097690;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DcPqm1efY1u10/jS9r92DaXZ2yl2W+SYFGtX9YH3QdI=;
	b=pH0hHylxYoYlu20zXzpIsVOGuZTDdeLLK+NT0BpSqbFk1mBOMAoqX+XT5wu7L1pZqHsL
	 Qn1DWhNtthBRzCi7iY7MqTVctFyY4nIAn2X1Co+1Sp3YM8fNo/kYqUf2tUMaXfImnviF5
	 F+FT4p1CYFMpNyamkHs4v4Fa6xAPTwPw6ntUGAHkbbzOAYRU2cpn5GuTu+CiwjZxNSWfH
	 Uz0aVQ9rwl7CXL0ZZUerF6B1SnCmhIkL7BxNYzqJTX/aGZaHMHtSvDAg9uA+tfn4in6Um
	 MFXTTq9k+Zma5b/Nqp/0kwYHylO3LNUk+tEG/cSNuFlx9SOZBOtbDbfJDh578Y3HhSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K1MgDb2g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E10606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K1MgDb2g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10ECF1F000C6;
	Thu, 19 Nov 2026 14:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097690;
	bh=DcPqm1efY1u10/jS9r92DaXZ2yl2W+SYFGtX9YH3QdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K1MgDb2gZVShp29kT/sYUWT6EW/IwTmoUGqDv445jUhdKCynKr0p3MX+rSn4baCwj
	 nMQtVOk+ZF9+Fkt/+ZGxCJBXQ5/H8oT3VvFkHJ9rvHIRgvfrL0diepCuAREs52pDlu
	 jsl5hSqJ5sCFBvc61ytvZPvKuj6Q2uR8ZE1lOUmipvPdcCIuN1RcMnm5BzpwBD/Dz0
	 VWdDcDMTi4wDHNYlX1he8ubObKyQn9TUPDXnFkGskYWFVOBQtGM1gtZkGvSyEwZa3Y
	 drrStqtNOr5grLG/IfkNRaO8aSBdJjXI9fg6MV1EmJUlWAEiQWUZdS+WZxTDL2gkfP
	 m1LD7RUdLsvgg==
Date: Thu, 19 Nov 2026 14:14:45 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH] locking/rwsem: don't let a read lock steal from a queued
 writer
Message-ID: <av8DKviO1fVURLcJ@gremlin>
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

I know the cycle is grim on workload (equally so for us), but ping on this, as
we're relying on this behaviour for a series [0].

I could re-implement as an optional mode and respin [0] if necessary, but Peter
objected [1] so hoisted the rwsem change to here :)

Thanks!

[0]: https://lore.kernel.org/linux-mm/20261110-khugepaged-latency-fix-v3-0-6eea743cf9a3@kernel.org/
[1]: https://lore.kernel.org/all/20261103115159.GK1813469@noisy.programming.kicks-ass.net/

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

--
Cheers, Lorenzo
