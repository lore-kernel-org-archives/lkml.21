Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012915;
	b=2S4kgqomgRFrE7IC4OVz9CHTRy8sr42XGrZ738YhdAXWAmRTpWrrLarUpyZJWHpch7/U
	 Awmaq0EanjSA5MObxSosQXZqGHZ48QELWbAoa11HN3H0j6zjQ9d4HBMwWGhi1hAV9rQwc
	 22qBtxcnQyLR+02Ss5pZN7LTIS1VcAo6v9MAejQgOMxxaYwXiEAPmxyTOFBegHm/Kwx8u
	 vJRPss1B6Bnd4QPM1yARlP37p3//4AVhgJPxrxxhyXNS7LgdzzXP7jxDcIezgTOX4RPna
	 vvqubKQNQPh3g04K4QJpwLgptsUdC2dJRd0fW7GTvJIfZog7qgQZsywUR0r16/WpQHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012915;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JvlF7rNEGZrLTotZbfZAIsRH4i/BRLej2mSpI6TKCtE=;
	b=WgiTlu/LWePK0DI/p8BcJ0ckO1/v8JnUQ9/HTlggJ5pOk5p2FRz8BhmMaDRczXJxD0Gp
	 LPmRdpFdxvhk9RFmlQiPwq4UHNyYPX/a9L5/PAVfzx9XWnVPUqum/G/sPlBdHeBk0Vac+
	 ERcmeMVMec0IEy1X2D2+mwB6LcDYWBXGibABtSPsn3RttsIIdNLqC+qh+1B4rcYMNqdEw
	 sLjETxhdjAkB3VDF+YJtwe8fQUPe+jrd02fZvAP/xzHkTg++DXcjsNwiVIismcTns/W8a
	 ePmszj3TF9Q5uNU2X0mTnKxtx4j6QC5XrD0m8r/8V+C6x1Ahy9cuoTnNlcgY0ABT78w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qihszCwx;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2C8606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E2C8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qihszCwx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JvlF7rNEGZrLTotZbfZAIsRH4i/BRLej2mSpI6TKCtE=; b=qihszCwx4eu/Kg5dkYyyL1GfYw
	ieGz2/BEXYBA3JPCmijt5op8sNJNQr4tvBDDV6hAOzNY0BF5iPfDxXg1oD2hgct3qHYHBPCJeEMhZ
	Izq84GuH2+YzFpWasQE3wzYuJZU0an7j3dKVgOuqMFzfF87po4HeiPFPiYDr9979sdA+rrFNV/CGk
	gXdHJOFlcg5eramZuud1dsasSV0f9g8Xl/IzkNKl/z5PKBdwWxY1kugcTXSa1HzwQUo46i4nayxkf
	62gzAHtPOu07WurxnosY8iPhznbMkEjctzH1M2lli5O9J4+x0l3yOKt/tIFJO1IEqYt3bbk73JS2v
	ZOPF/q2w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgr8-0000000G9S9-3eXw;
	Wed, 18 Nov 2026 14:41:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C5B9F30057F; Wed, 18 Nov 2026 15:41:49 +0100 (CET)
Date: Wed, 18 Nov 2026 15:41:49 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ibrahim Elshahed <lshahed@amazon.de>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org,
	nh-open-source@amazon.com, Fernand Sieber <sieberf@amazon.com>,
	Roman Kagan <rkagan@amazon.de>
Subject: Re: [PATCH 0/2] sched/core: Fix stale core_pick and forced idle
 after SM_IDLE fast path
Message-ID: <20261118144149.GA1779021@noisy.programming.kicks-ass.net>
References: <20261117142704.6878-1-lshahed@amazon.de>
 <20261117142704.6878-4-lshahed@amazon.de>
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
In-Reply-To: <20261117142704.6878-4-lshahed@amazon.de>


On Tue, Nov 17, 2026 at 02:27:04PM +0000, Ibrahim Elshahed wrote:
> Here are the two test programs used for the numbers in the cover letter.
> 
> 1. init.c runs as PID 1 in a KVM guest with one socket, two cores and
>    two threads (CPUs 0 and 1 are one core). A cookied task yields on
>    CPU0. Each attempt wakes a SCHED_FIFO task with another cookie, in
>    its own cgroup, on CPU1 and migrates it to CPU2 0-50 us later. If
>    the yielding task then makes no progress for 20 ms, the core is
>    stuck forced idle ("STALE"): the program kills the task, removes its
>    cgroup, waits 100 ms without touching CPUs 0 and 1, and wakes a task
>    on CPU1. Without the series that reschedule oopses in
>    __cgroup_account_cputime_field(). mode=nomigrate is a control that
>    never migrates the woken task.
> 
>    Build and run:
> 
>      gcc -O2 -static -o init init.c
>      mkdir -p root/dev root/proc root/sys/fs/cgroup && cp init root/
>      (cd root && find . | cpio -o -H newc | gzip) > initramfs.cpio.gz
>      qemu-system-x86_64 -enable-kvm -cpu host -m 2G -nographic -no-reboot \
>        -smp 4,sockets=1,cores=2,threads=2 \
>        -kernel bzImage -initrd initramfs.cpio.gz \
>        -append "schedstats=enable idle=halt console=ttyS0 panic=-1 mode=migrate secs=240"
> 
>    The kernel needs CONFIG_SCHED_CORE, CONFIG_SCHEDSTATS, CONFIG_SCHED_SMT,
>    CONFIG_CGROUP_SCHED and CONFIG_FAIR_GROUP_SCHED.
> 
> 2. cschurn.c runs the same churn on bare metal on half of the SMT cores,
>    using the other half as migration targets, and counts a stall when
>    the yielding task makes no progress for 5 ms. It frees each woken
>    task and its cgroup shortly after the check (2 ms by default, second
>    argument), so it shows the stuck forced idle but not the
>    use-after-free.
> 
>      gcc -O2 -o cschurn cschurn.c
>      ./cschurn 300        # as root, cgroup2 at /sys/fs/cgroup,
>                           # kernel booted with schedstats=enable
> 

Does it make sense to stick these in the selftests thing?
