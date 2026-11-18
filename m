Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013644;
	b=XQgcKGp43fs2jLmphZ1l3iYenhnL32gt9BbUrL2D9gMbDjkkcNdEXxNtI/cgjLcHIUC2
	 ZPk+2o8sYqymLZeio8/lczsK6xFo/q149MctFqDHG4rq0QkZCt+4QwpGCNPI5RTxJB3UO
	 0dNX1WJr6N3tGNdPiQwfWcLzoJYSusATbkKUv10SakWae/cj6D5YdcB4wGU+YrLPMLpEM
	 siLfaQ/Wc3CByncCFXb6cvcOpEt5oDplbZsW5Urstkhw66wJAX10Gdgg1hCHsgUUl5Agm
	 RiGBZ+mZecMRefeS8GzlDS+u6o0qkD51Q6afjka3d7uPHIK7Qya4ewpQSTxFoXEUjjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013644;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=c9llALWESKPrD3L052TLjyFdye2OWdYYWEsPZsV5lV8=;
	b=p9Qpo+UEG2Y5H4xHWvq+2LzZd44Mqk9Dz5m0BjWhvbUZEytzmC7MPmlfNaytMm8oMxeA
	 il56ZOkxXyn7nobxEk/7TgI1Q5PWLV7f74GiV8gJfgCrb2aurWIXXO7ZBwd1DiBjjIEkv
	 a2F2wiHI28N8+MDh0S2VxykNYbQyhsf3pKn/CETyazXRsAw7fjIiHtJkeJl4F9Xb7Al11
	 rZS8Hdi45K6JCI16Dwve42FIeGkG/JuuYLkApUL91OWmSvwG+o5o3jw8Lo/RR4I/rvirx
	 co2LQ9QPC5lwgVITcDQAy7b/ER0z0KdOjgX6Ja7Vu7d/N4XIU54oXQN/v/IoPQrlW9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAf2aC7T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6668D606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAf2aC7T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB601F000C6;
	Wed, 18 Nov 2026 14:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013644;
	bh=c9llALWESKPrD3L052TLjyFdye2OWdYYWEsPZsV5lV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KAf2aC7T8WvsvxDAL+zNzVcwu4pHzLaEACn/qvggiafKriOSxMOw7zPIjwhK1B7iU
	 RxzBIeGovtEyPdwuMv+Jo1y1tLzbb6HT3H3bDFT84uqSAgSdBR0QzxhohBOlhQ+mb+
	 2d2i4O4nY2otRAAkPatZWk2VAjJPeR/IgDwjA41lIp0afg8h3iO0gabjBxBgeQFkRC
	 4tv5l5wvOT/6ycwWG9DbRtlGwO27iEMhXzH6p3nl+KaTfK8CMiuyTqpED59C0TjJnm
	 5TzLrWUL33gtUTV6jtXkjuTN7BbR3Wt0YtgkHhT1yW/d5oazOhNZptYpj8+0AemDkI
	 z4g0LmMcl+E6Q==
Date: Wed, 18 Nov 2026 15:54:01 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v6 0/2] workqueue: Make WQ_UNBOUND the default behavior
Message-ID: <av28CfFtO8Hph1x7@localhost.localdomain>
References: <20261116155051.157875-1-marco.crivellari@suse.com>
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
In-Reply-To: <20261116155051.157875-1-marco.crivellari@suse.com>

Le Mon, Nov 16, 2026 at 04:50:49PM +0100, Marco Crivellari a écrit :
> Hi,
> 
> Currently alloc_workqueue() make sure one among WQ_UNBOUND or WQ_PERCPU is
> present with the current default being WQ_PERCPU.
> 
> Per-CPU workqueues provide strict CPU affinity and concurrency
> management. Some users rely on these properties, but many don't need
> them, and for those users per-CPU workqueues significantly restrict
> what the scheduler can do with their work items.
> 
> Unbound workqueues now use non-strict (soft) affinity scopes, so they
> keep part of the locality benefits while giving the scheduler more
> flexibility. This helps system-level concerns such as power management
> and CPU isolation.
> 
> This series therefore transitions alloc_workqueue() to unbound as the
> default. Users that need per-CPU behavior can still request it
> explicitly with WQ_PERCPU.
> 
> The behavior changes as follows:
> 
> [ P1 ]
> 
>   - keep WARN_ON() if WQ_PERCPU and WQ_UNBOUND are present and drop
>     WQ_PERCPU.
> 
>   - defaults to WQ_UNBOUND except for WQ_BH, that it is always per-CPU.
> 
>   - WQ_POWER_EFFICIENT description, kernel parameters and konfig
>     description changed to reflect what this patch introduces.
> 
> [ P2 ]
> 
>   Documentation updated accordingly.
> 
> Thanks!

That's a big step forward.

Thanks a lot!

-- 
Frederic Weisbecker
SUSE Labs
