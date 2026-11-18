Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013373;
	b=VUOo5h+Xj7jz7swfFmVZCgw8hrdkFpI3+On/H9bOZtc93Qz1cjpdLKWpgEsOrt1ebYM8
	 FdIcei0n5n0yNnb87rt/D4glJt0YHJ21NAgRBtxMYM7C7RbjIBecgU/KWcNkXVZxBHJxX
	 c3L1PPqkV81/JMo8a1e7AnE1Xoz6bGTHrxCklVv9A86aktS2j7T7rN6VyroEFoSt+c+dG
	 euqQY/cP8uCZ7dLy4fZUOO3ops1PvJlxlyRrgrgVFuX/aHKn8ghQIswduyiYC86x+YKQ/
	 duDjo82UVLu2Y+Dmf220sbDqcLHPxe81FHPW11XSRvAhVtNYIkTOSMDDd18mqMYWImg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013373;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=6aecPuy/bfG7NEXvSCIyMXq4vruHSbqfe32T5AuWN84=;
	b=KzWI77oxWTkSPcXbVg3aptomzIUPR9dcG9Q7JgPsWLGHz4pgZOTcCZguZnbiHOzucn8x
	 MGaydGD/sYL8rjd3kkQcnn18pZ5MduWxTBPuIq6Cjyi5BlwNh5EnDYlPvi9YuN7MV2pwd
	 VNpPJ8ofgtyVOtMQ0EW+S102Wu/og+xga8t3pqo3GKAXs8XTsHu8FThrqnXD0zLjIpR1S
	 aup0RebxaGFCH92F0ZCgHDX8RZF+TDR3GqsW/pIaM2T8k9JD8+bkwneVFVdW0Vpsap4L2
	 o/8yYVUs1pbLzzUfmM4wg6lXFfUWVPlxtYBE0FFzH0RcNGe2bmwU9Y+jvCHga4v12Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4058pxo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A46606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4058pxo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BE11F000C5;
	Wed, 18 Nov 2026 14:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013373;
	bh=6aecPuy/bfG7NEXvSCIyMXq4vruHSbqfe32T5AuWN84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n4058pxoe+NdTt2wOn96aaT7UReArsH7y7KjvvKi/PmNXlKe6IBhZIuilqAXby+WG
	 sUNZKYXYXvhco5nLY9sOFqXURD0qMEQDqHPU6dthD0+2TIxzY4RfVVN1yJKXlcTml0
	 WgdYmKPBeh2C9x9X4/91odTrx0L+/78711yjqorpJWwP3JDwogCfaW3d8bbneY2C/u
	 URwcEd5wYdKRAXde95uNp+wIHmeBRMTjmYalR73FW5dzmL7Vk1bGl2vkXc95FbOQFV
	 M5jRfJf52uXjT3GI+IFWxT/VTFAUpW86CTRFckiFWSaUYkmVgSM9Dg5IYKL/RPymIT
	 rgSjuYS3Z0rvw==
Date: Wed, 18 Nov 2026 15:49:30 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <longman@redhat.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] sched: BUG() in select_fallback_rq() at boot with
 isolcpus=domain on the boot CPU and CONFIG_CPUSETS=n
Message-ID: <av26-ojv3LkO2vXH@localhost.localdomain>
References: <20261117144817.265109-1-mathieu.desnoyers@efficios.com>
 <dd335ee6-c879-4bee-9ea8-6d9e9216fb0e@redhat.com>
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
In-Reply-To: <dd335ee6-c879-4bee-9ea8-6d9e9216fb0e@redhat.com>

Le Tue, Nov 17, 2026 at 10:13:02AM -0500, Waiman Long a écrit :
> On 11/17/26 9:48 AM, Mathieu Desnoyers wrote:
> > Hi,
> > 
> > With CONFIG_CPUSETS=n, a kernel booted with isolcpus=domain,0 hits the
> > BUG() in select_fallback_rq() during boot. CPU 0 is the boot CPU. I
> > found it while testing a SCHED_DEADLINE series [1]. I then reproduced
> > it on v7.4-rc2 alone. tip/master of 2026-11-17 and next-20261116 have
> > the same code. A proposed fix follows the scissors line.
> > 
> > Trigger
> > =======
> > 
> > Build x86-64 with CONFIG_CPUSETS=n. Boot a VM of 4 CPUs with
> > isolcpus=domain,0 or isolcpus=domain,0,1. The kernel panics before
> > init runs, in every boot.
> > 
> > These boot fine:
> > - the same kernel with isolcpus=domain,1,2, or without isolcpus;
> > - a kernel with CONFIG_CPUSETS=y, with isolcpus=domain,0,1.
> 
> I am now thinking about disallowing the boot CPU from being domain isolated.
> That will include using isolcpus=domain boot time isolation parameter as
> well as in setting up isolated cpuset partition. Will that be a simpler
> solution than fixing all these places where isolating the boot CPU will
> cause various problems that need to be fixed?

You can try that, hopefully nobody relies on that. nohz_full supports the
boot CPU to be isolated but it's a heresy.

-- 
Frederic Weisbecker
SUSE Labs
