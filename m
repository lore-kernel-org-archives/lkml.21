Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795497646;
	b=xJ5k7zSM3DZqPPezDdxHOBSIEQil8OhsXejE/NXWvWgffgi7MybmBq3hr/vfrU91aCs3
	 Gid9tzH/ZCdjJyrvsrY4JfMcle7TO+2NPHAm3GjlAkCnxhw27i+g1yVk033CByU71Iw+V
	 aq2WVjyXdDQvx7oRPkM9BSgNENkK7DnUCwk+bZfoKxg++Gv0TMJtuwxfPXZGNiPsYqziR
	 svvs6NPaYXCQc1jo8riAR+Ij5hVwx7Noxx+JBEanAhnk1Yiu5QnztAlbAly/Um5aYaf4k
	 +fDxulEV/DNz+z3U/St7rqwL8opvviQ05XNmbIUJladSW1LjBtvA0xjL9TZDb7QBZqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795497646;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HHEfeb/HG/M+BRVHRw4kn8MAzbxsATW49wX/1og7PUs=;
	b=3sIbdTkUF5LzIO5ESM6vLNKjn74Ne4PIxYPqB+puc9tiXPnxQf06GJzCHsAzDVJhp2/B
	 etPH3oVz+zRRd5PL5I0LRqEgu1AC9jSvusnSBawlHj+AtBQA4lrRvUQJ/+k6GMFm9wEMb
	 alHF7qnihmVDTL8q+ywUdAYQCU8xZA6V3TItrVufBmYz5BM0Bvh1ScPAFf4b9Rby2ZXYH
	 6ef2oWmzrUL3wt9bdbHHBIhzI4wEH0iJCNsqdkYPQ0Idiq9tZPBDGeyPN5xdGYZ4INMyd
	 atf6XsGnCgXGEB5Dk0qvgYr1qmrJytTzHX/xKjWtkQfZsIiG5pKJ4meUDy2SNecQZdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PsJkKPTH;
	arc=none smtp.remote-ip=95.215.58.91
Received: from mta1.migadu.com (out-91.mta1.migadu.com [95.215.58.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B599606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B599606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PsJkKPTH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/FLpDUQaN5zSNJauElzR553aGFbKTy0m62Qa9BEG34w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795497644; v=1; x=1796102444;
 b=PsJkKPTH7oTCW1wmCW4uRkE/h5HX+Z/oMjXGD8MlvNB0mB6c3jIxta5gVTrYx6DBfNgP2O0B
 ol8eNLmqWwwHt7GKP19R/6oVm7RHivu7wF1fkuquZO6JuAcqlKsA6p5Z/y4SDRoCBs8NaM/n0xV
 ijJConrDx0Bwu7tHVJm758oU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0d2e7a79f004113c;
	Tue, 24 Nov 2026 05:20:36 +0000
X-Mizu-Trace-ID: 0d2e7a79f004113c
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 21:20:29 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Waiman Long <longman@redhat.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH bpf-next v2] cgroup/rstat: disable preemption in
 css_rstat_updated()
Message-ID: <20261124052001.GB555944@shakeel.butt@linux.dev>
References: <20261124031642.40616-1-kmehltretter@gmail.com>
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
In-Reply-To: <20261124031642.40616-1-kmehltretter@gmail.com>

On Tue, Nov 24, 2026 at 04:16:42AM +0100, Karl Mehltretter wrote:
> BPF programs can call css_rstat_updated() with preemption enabled.
> The kfunc calls __css_rstat_updated(), which requires preemption to
> be disabled while it queues an rstat update. A cgroup iterator can
> hit the lockdep assertion on both RT and non-RT kernels. The
> cgroup_hierarchical_stats selftest can also hit it on PREEMPT_RT:
> spin_lock_irqsave() on trace_cgroup_path_lock leaves preemption and
> interrupts enabled there.
> 
> Disable preemption in the BPF wrapper after validating the CPU and
> before calling __css_rstat_updated().
> 
> Fixes: 36df6e3dbd7e ("cgroup: make css_rstat_updated nmi safe")
> Reported-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> Closes: https://lore.kernel.org/r/20251119111402.153727-1-jiayuan.chen@linux.dev/
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
