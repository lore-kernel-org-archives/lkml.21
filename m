Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635339;
	b=G7f3jX+fHea218GP0aPy/svPnco2iPcuSfB+0HxFi6rUp0kw/0vhgrRJi7Ec5XOB+2s/
	 epvtg6Ag7ZRVbcpJPXH5xeNfu2VaDYKp5tB/u9U0cEnrBz4vyKSG6n5F2c1xHl/RArVQI
	 fcR/75sD7KXotbUpBupa8dIfWBlDdtRgAd2V/D2aVPuUy6Gogw8LhIzu11v8sqMhR2M7K
	 KGkZQ4OO/w7lcnW9K0g1HuOfwvhELjENAOB8/vU0lnP44n1hegEJt98TSWk7ujiBCoIY9
	 aK2JG7C2IlGJpwtgU7qN0/2gn7wC0tmI+cgJCcyHunHXVIol6ecbFimNd3gYLOmutCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635339;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=J16zb1Ctmxjj4viGGPpXWizsVsOTqEcxg8H1/pGkPyA=;
	b=C7P0pHZbq0xJDq295BVPq/YoikbrAjL9eMY5CDG+XU+ZewbL2K8+szUxpXMxHt9vgafE
	 zB+IDJeqlGdWVREqlzJjhrS/B/giVd7k8wwVTKPPDLDkOM2j1PeiLRXe96zddjcZqAmM3
	 8ijFOePkebkn3Wyn0UQ4lLg1lMNq5u+CjHpmTurReDeSN6lU1edaQpYgy2oykkzzWgnSz
	 84/syLXA+7FhqUrx3uYnxBKYpOXbf+jwBE7ibfAahxBBI/GGOHLAcW8B8TVFrORVLUANO
	 fj0oU2ciF0x1R1Zrnxm7SJvGT+urci9ZVZZlBNKUaC4NjQCjG2w5d6oQY6sJwzYJzig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=BlcS5iMC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934B4606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=BlcS5iMC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40EF31F000C6;
	Wed, 25 Nov 2026 19:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795635338;
	bh=J16zb1Ctmxjj4viGGPpXWizsVsOTqEcxg8H1/pGkPyA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BlcS5iMCT7yAwq7lIHqSzzXNh1Mxt2Je8g0hVSPb3wBTiacydjRxAP7iaWWnqIuBO
	 er7Zs8hkKDu7ZFNAGXsQ5Qo1VGv0f4eHqaZKrvQPxzNXbnCcOZe5+rduaAYA1L0y8R
	 JSaKGixXq/zwswHUrguiZGgS/nwsOroDUPhEcu0k=
Date: Wed, 25 Nov 2026 11:35:37 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Egor Shalashnov <shalasheg@gmail.com>
Cc: linux-mm@kvack.org, dennis@kernel.org, tj@kernel.org, cl@gentwo.org,
 zhengqi.arch@bytedance.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] percpu_ref: make percpu_ref_switch_lock per percpu_ref
Message-Id: <20261125113537.bdb168bfe8962ef1aefc097b@linux-foundation.org>
In-Reply-To: <6c943754-05b5-4017-9145-0d145766909a@gmail.com>
References: <01612865-faa0-4fe5-8184-a177f104843f@gmail.com>
	<6c943754-05b5-4017-9145-0d145766909a@gmail.com>
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

On Wed, 25 Nov 2026 18:55:55 +0300 Egor Shalashnov <shalasheg@gmail.com> wrote:

> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Currently, percpu_ref uses the global percpu_ref_switch_lock to
> protect the mode switching operation. When multiple percpu_ref
> perform mode switching at the same time, the lock may become a
> performance bottleneck.
> 
> This patch introduces per percpu_ref percpu_ref_switch_lock to
> fixes this situation.
> 
> ...
>
> I would like to revive Qi Zheng's per-reference switch lock patch
> from 2022 as a standalone change.

This is a nice little change - it's a shame it was buried inside in a
larger patchset back in 2022.

> Our workload maintains many independent percpu_ref instances and
> repeatedly performs kill, waits for references to drain, and reinitializes
> them. Multiple CPUs execute these cycles concurrently on different
> instances.
> 
> All these transitions compete for the same global switch lock.
> Reinitialization also clears the per-CPU counters while holding it.
> As the number of concurrent transitions grows, this shared lock
> becomes a significant bottleneck.
> 
> With a module-local adaptation of Qi's per-reference locking change,
> we observed approximately 2.8x to 6.5x lower operation completion times
> in the measured workload. This motivates using a lock per instance
> so that independent transitions can proceed concurrently.

Well, an unpublished module isn't very useful for us.

And an intense microbenchmark isn't as interesting as a real-world
workload.  So can you please provide more details about what "our
workload" is doing and some measurements on how much this patch
improves that workload?

> @@ -109,6 +110,8 @@ struct percpu_ref {
>  	 */
>  	unsigned long		percpu_count_ptr;
>  
> +	spinlock_t percpu_ref_switch_lock;
> +
>  	/*
>  	 * 'percpu_ref' is often embedded into user structure, and only
>  	 * 'percpu_count_ptr' is required in fast path, move other fields
> diff --git a/lib/percpu-refcount.c b/lib/percpu-refcount.c
> index f8d9068..5d46602 100644
> --- a/lib/percpu-refcount.c
> +++ b/lib/percpu-refcount.c
> @@ -36,7 +36,6 @@
>  
>  #define PERCPU_COUNT_BIAS	(1LU << (BITS_PER_LONG - 1))
>  
> -static DEFINE_SPINLOCK(percpu_ref_switch_lock);

lol, yeah, that'll do it!

It does grow percpu_ref by 4 bytes, but LLM estimates that a busy
machine will have 10k-100k of these floating around so not to bad.

And I'm told that this will cause io_ring_ctx's hot fields to spill
into a second cacheline, but that can be fixed up by reordering
io_ring_ctx fields.

Alternatively, this looks like somewhere where a hashed spinlock will
work well.  A static array of 32(?) cacheline_aligned spinlocks, hash
the percpu_ref* onto one of those.  That'll get 90% of the benefit
without growing percpu_ref.

