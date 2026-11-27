Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795812845;
	b=iHMhRVzf7K+CPSuKq91fonjClZD2ohE5gmdnILFdG1oNXV3NEbLj/rxLWFV3MOSWEAC0
	 q14BfTSLcT64NvrkhZZQb4xo529OS+7bWfU/11Clo7712w0us/h3TLJLtBTNtcZSIOn6I
	 d3tvzSVPPpSVn1TlOE51fwcsauWTFmwDBB3d7vcVbNV8GPHh0ZvJGkDDSjLDb7xaxF7z+
	 K037FGPAM2h2yZU1MLxEhzWqqS1q9OUciq9OzkkDvwf3WQ2PAycKmptFq8X6nkOU/WKAd
	 81KPubzAhVvExEqgOCmEMgWk/Q3mbHdGpBjTCaIvVbb+Ti+EvpRrWlbgM8KvRiivEZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795812845;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=30A5sG4OOpqgEWHeWVWkAaJ/pqruXKwg8mOdrb94tek=;
	b=okPxSVVqSVBHQbUrC1NpDmSGQJnw2O7Iw8eYLn62RWVdH58zXja10m+EDl54uWGC75O3
	 Q0R7ggxFlXzjOwaxUs5V8anhlyYA2nI2XrCOZWzjYA+L5qFpN3ALXJBaPerbnuH87QmlF
	 z7uqfqpYLpyE7mURYi8IGZjD10c8QtN/RokPgXmTZQE1mcGCaRmIx4cFYu1Pg/DOSICvs
	 VttqPHJX+i7yULD5HVF8m3ho6dit743wtaTisJ45jp9nEOvuJ0r4NzlOqBOAu79ga0U0A
	 VUbUoOdMPwj8AMPfmhjt+xIJ/jQRmYfCJdeZm8lt/lVTjxSpB9ihoctX7RClsx5S88A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mtp7nbnU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D60606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mtp7nbnU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83BC1F000C1;
	Fri, 27 Nov 2026 20:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795812844;
	bh=30A5sG4OOpqgEWHeWVWkAaJ/pqruXKwg8mOdrb94tek=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Mtp7nbnUYSLW3JtPs8D+h69zMH0qpKErDh4rSTG+jz9jk0etROOAYfRHwhYYoNLiH
	 SkFcPACjrecFNcl0p6VF2kT3Ulx8VA7kr5bwa3BskV8zYbRATp7N7EOk4epCTbx2Bd
	 pyLq8l/zrty28XDmtAELK2hqlrnzR6qhIWDBgiQqEOcvyQhh9kx8k6Mj/DRpguUC7G
	 1lItrJPZV0ZcTAEa8wgp1I7F7NHXt++t/mA5Cg/zMeAR4jRIn6t1ZVXiKRtb4xL2pc
	 ySMwmQqsgP18IQ95R3xGju7sMWukaTaBf9oUmZB1CMBMxuLobvoQGYbP62QVXMoUor
	 1/svWbvGOrIdA==
Date: Fri, 27 Nov 2026 10:54:03 -1000
Message-ID: <61d55bd46d48bcf8ca03aa7ce517d000@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH RFC 2/3] workqueue: Offload WQ_PREFER_PERCPU work from isolated CPUs
In-Reply-To: <20261126152458.742942-3-marco.crivellari@suse.com>
References: <20261126152458.742942-1-marco.crivellari@suse.com> <20261126152458.742942-3-marco.crivellari@suse.com>
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
Content-Transfer-Encoding: 7bit

Hello, Marco.

On Thu, Nov 26, 2026 at 04:24:57PM +0100, Marco Crivellari wrote:
> Many WQ_PERCPU users don't need per-cpu execution for correctness, they
> only want cache locality. For them, running on an isolated CPU is just
> noise for the isolated workload.
>
> WQ_PREFER_PERCPU covers this case. It implies WQ_PERCPU, so by default
> the workqueue is a regular concurrency-managed per-cpu workqueue. When a
> CPU is isolated, its pwq is backed by an unbound pool running on the
> housekeeping CPUs instead.

If the need is just affinity, wouldn't an unbound workqueue with
WQ_AFFN_CPU do? The only material difference between WQ_AFFN_CPU and a
percpu workqueue is concurrency management, and the pwqs that get switched
to unbound pools here lose it. If concurrency management isn't needed, is
there any point in this mechanism?

> -	if (is_percpu_pool(pool)) {
> +	if (wq->flags & WQ_PERCPU) {
>  		obtained = pwq->nr_active < READ_ONCE(wq->percpu_max_active);
>  		goto out;
>  	}

Why does this switch from is_percpu_pool() to testing WQ_PERCPU?
Concurrency management is tied to the pool, isn't it?

> +static void prefer_percpu_wq_update_pwq(struct workqueue_struct *wq, int cpu)
...
> +static void wq_update_prefer_percpu_pwqs(const struct cpumask *cpus)

These two names are too confusing.

Thanks.

--
tejun
