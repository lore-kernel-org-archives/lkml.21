Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772463;
	b=AlLMQnaEL5eaAasiMsSOJMMdm0hviUH3GHxtm4sK7/zLUKdVVV7SXytz/v6ZUZ1N+CYQ
	 OggZALKkJbXq7EJm4Hukw71WNCXr+DacBvwQ91Y1Em9gjHzCRdeg/i/Z+CTRnAmr2ZB7G
	 YeO8STmx2i7KNq+2DSlNutcmDSoMSgzqPBXg1Qot3MJk4NzmFZx4HiSjJNKupfrfSv8Fn
	 4OA7CP2i6l8IgWXo+PBchldszY2IOOLX/4KuqXcJ8Iv9pi+KI5Y57KQpHl4pXf8PtKtZ2
	 zYZI0SsIkSkJ6+q24xqhAHJAJZ2QXvdNJMOrPAJp4W5B7MzDuAPlE516dMVKICosdpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772463;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=C9OgxsyxGDfiYMeXl9nYjqHBB8TGybNB9VLNpBH4JLQ=;
	b=JlM5MHzWMxaLUh/d2yRKyIDkjV5CSOwku+odeVXe6wwTDYPwZbR3DV1o+O4e9XN3DBGS
	 /ANulYf1EPQLPisQG1pkPdaywxkodSxui0nik17idxelarICT5k/EWXW9VpfMVi4S/oLP
	 jGiuwzeCHcsY9XiQrvSYfpjVSbg968CrMlphullS1roY9I7MSZGuH9XGEj8Gv1h9GboCq
	 1GcUWo0p9wWUs5hfIGDfykg93CuMARSMsljrr1aq+OVfPmWhonsnkkroIcQ4w5hOljOWF
	 oQUOdz7y3saFG2fuZrnCuUYCznCR028Vbdwvx8Csv0MDUas/ko89Pne9zkowa9vg5eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=g26l3vzC;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5465F606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5465F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=g26l3vzC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=C9OgxsyxGDfiYMeXl9nYjqHBB8TGybNB9VLNpBH4JLQ=; b=g26l3vzCi4Rk+qFHbrjJiFh+9S
	vaVASSH1QZa+DPJMPmNbKCZyNcqEmVY3pwWrtcx9T+cr5Me4NANQrxFTdG3AoAY+ioAzCAPSSd8Lj
	vcP7mFbiiI+7uSbOaIhjb6ZKnbHP8VwOH3eSeOuXZUmosd1iNpCgtaHGlVjyEqARyPVK+spklFuYD
	Fjc2VTPBIp5zs+qF9CMfMJKoJ4lrAaRCBpwT+3bltOF+ELRxfe/OwHYQ1HVHgeNs1FxI2qw1iRGkP
	kHHzorhdb8p1rwEwd4jTg0q2eULnb1X1TuLMwOTVQRzPjsaboPnGAX6bj5gPD3uYy217JD7BFNzJF
	EQxG35yQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsRu-00000007Wkc-3yNc;
	Fri, 27 Nov 2026 09:40:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EFCC230316A; Fri, 27 Nov 2026 10:40:57 +0100 (CET)
Date: Fri, 27 Nov 2026 10:40:57 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christian Loehle <christian.loehle@arm.com>
Cc: mingo@kernel.org, vincent.guittot@linaro.org, qyousef@layalina.io,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, jstultz@google.com,
	kayracizmeci@gmail.com, wvw@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND][PATCH 0/2] sched/uclamp: Fix dequeue accounting across
 static-key updates
Message-ID: <20261127094057.GP49833@noisy.programming.kicks-ass.net>
References: <20261127083542.3172843-1-christian.loehle@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261127083542.3172843-1-christian.loehle@arm.com>

On Fri, Nov 27, 2026 at 08:35:40AM +0000, Christian Loehle wrote:
> Static-key updates can let enqueue account a task before dequeue observes
> uclamp as enabled. Patch 1 checks the task's effective UCLAMP_MIN active
> flag on dequeue, so accounted clamps are released regardless of static-key
> update progress. The early check keeps the unused dequeue path short, and
> enqueue retains its static key.
> 
> Patch 2 picks up Qais's idle-flag wrapper cleanup from v7 [1].
> 
> The measurements below are for patch 1 on v7.4-rc4, before adding patch 2
> and rebasing. Each cell gives fix / always-on percentage changes versus
> unfixed, with CONFIG_UCLAMP_TASK=y throughout. The unfixed and fixed
> kernels keep the uclamp key disabled while always-on performs accounting.
> 
> Nine fresh boots per variant, 20 measured repetitions per boot. Changes
> are geometric means of paired boot-median ratios.
> Positive time/latency is slower, positive throughput is faster.
> 
>  Workload / metric              │ i7-13700K: fix / always-on │ Xeon: fix / always-on │ Orion: fix / always-on
> ────────────────────────────────┼────────────────────────────┼───────────────────────┼────────────────────────
>  messaging-processes / seconds  │        (-0.06%) / (+0.09%) │   (-0.40%) / (-0.21%) │      -0.38% / (-0.31%)
>  messaging-threads / seconds    │        (-0.19%) / (+0.05%) │       -0.86% / -1.77% │    (+0.10%) / (+0.11%)
>  pipe-processes / usec_per_op   │          (+0.18%) / +1.56% │    (-0.002%) / +2.41% │        -1.17% / +1.19%
>  pipe-threads / usec_per_op     │            -0.78% / +0.88% │     (+0.01%) / +2.91% │    (-1.61%) / (+0.53%)
>  schbench-256k / rps            │       (+0.002%) / (-0.04%) │    (+0.004%) / -0.05% │    (-0.20%) / (+0.03%)
>  schbench-256k / wakeup_p99_us  │        (+0.42%) / (+0.51%) │    (+2.33%) / +10.62% │    (-1.44%) / (-0.37%)
>  schbench-4096k / rps           │        (+0.00%) / (+0.00%) │   (+0.00%) / (+0.00%) │    (+0.00%) / (+0.00%)
>  schbench-4096k / wakeup_p99_us │        +32.68% / (+12.93%) │  (-10.66%) / (+2.71%) │      (+3.03%) / -6.99%
>  tcp-stream-1024 / Mbps         │          (-0.24%) / -0.69% │       -0.61% / +1.07% │      +0.36% / (-0.52%)
>  tcp-stream-16384 / Mbps        │          (-0.03%) / -0.29% │       -0.57% / +0.23% │    (+1.04%) / (-0.82%)
>  tcp-stream-64 / Mbps           │         (+3.05%) / +18.60% │    (+0.12%) / +23.54% │        +2.50% / +2.09%
>  tcp_rr / transactions_per_sec  │          (-0.57%) / -1.68% │       -0.66% / -1.33% │      (+0.10%) / -1.58%
>  udp-stream-1024 / rx_Mbps      │        (+0.19%) / (+0.17%) │   (-0.41%) / (+0.32%) │      -1.58% / (-0.63%)
>  udp-stream-128 / rx_Mbps       │        (-0.82%) / (-0.15%) │     (-0.38%) / +1.54% │        -1.31% / -0.69%
>  udp-stream-16384 / rx_Mbps     │        (-0.31%) / (-0.49%) │       -0.35% / +0.30% │        -1.52% / +0.61%
>  udp-stream-2048 / rx_Mbps      │        (+0.02%) / (+0.06%) │   (-0.24%) / (-0.09%) │      -1.18% / (-0.74%)
>  udp-stream-256 / rx_Mbps       │        (+0.33%) / (+0.29%) │       -0.72% / +1.56% │        -1.76% / -0.86%
>  udp-stream-3312 / rx_Mbps      │        (+0.38%) / (-0.07%) │   (-0.04%) / (+0.14%) │      -1.18% / (-0.54%)
>  udp-stream-4096 / rx_Mbps      │        (-0.06%) / (+0.22%) │   (-0.24%) / (+0.08%) │      -1.31% / (-0.66%)
>  udp-stream-64 / rx_Mbps        │        (-0.18%) / (-0.17%) │       -0.57% / +1.20% │        -1.51% / -1.45%
>  udp-stream-64-pinned / rx_Mbps │        (-0.94%) / (+0.90%) │     (-0.28%) / +1.63% │      -1.21% / (-0.30%)
>  udp-stream-8192 / rx_Mbps      │          (-0.25%) / -0.39% │       -1.54% / -1.01% │      -0.96% / (+0.15%)
>  udp_rr / transactions_per_sec  │          (-0.72%) / -1.69% │       -0.94% / -1.55% │        +0.44% / -1.84%
> 
> Separately, paired log-ratio t-tests with Holm correction across the 69
> fix-versus-unfixed comparisons retained only significant regression:
> Xeon UDP_STREAM 8 KiB throughput −1.54%.
> 
> [1] https://lore.kernel.org/r/20261126012836.15205-3-qyousef@layalina.io
> 
> Christian Loehle (1):
>   sched/uclamp: Always account active clamps on dequeue
> 
> Qais Yousef (1):
>   sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE
> 
>  kernel/sched/core.c  | 27 +++++++++++++--------------
>  kernel/sched/sched.h | 10 ++++++++++
>  2 files changed, 23 insertions(+), 14 deletions(-)
> 

So we're going to do this first and then Qais can work on issues still
plaguing his approach? Is that the thinking?
