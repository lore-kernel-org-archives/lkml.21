Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.80
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795501636;
	b=ZhyM8O71PWcTZmK+ZROKhw02MxDoMPQXt3gyNgNqP6utRnPid3zd0tOvDZ29pBG89cwL
	 HhCTV210oLbrA+aDWBs/icPb6sqcta0yT7AceiTMH87yeb4e8lNK3/zTp/+XXB24mknvS
	 uLeSBvg/EW9wQ+pEtixipj8MDgyc5c1KlgoMLVlMlihJf2m82s6ahmQxgUnzEWlT5pbvV
	 u6Tj1bMhnivmuYpxxDH/e3Y6o0Y2L6sRLF/KlhV9HuKLBtZw/hLMwDPa346LKWD3rwAb2
	 U5yomDN5AFXtvVERbVbrrAd0wZER1IZCJqeLxVV8a7Vt1nuwDd3henD9hnxfCUv1f/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501636;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7u094NZKZxpETVB03vTt5m2yLYD6kPFSRwEM5jWpjdA=;
	b=moLUzUufKiZvPu8Ms82ILuB5IkstVqKrT7e6v2rEPHbBGlXY5Org6PlSGSpx/gIeIK6O
	 PVBAElryRDmXZ1ALu1mv63UKAJBmjPoIota82EF+GxuVceoPC7q7sl23h684TVtHUov7J
	 BRqzNGJXOZVX89ceL6G0Gyy9jSwbkru6fmqnIt1J11aDgvI0Rm6OQv/CrL0erSZT84cyt
	 TAz4G43Zu/a24VMazGa6QS/yDlQPFokgo1LETmkpxLorICwP+delh2VMLofYTEMHdDrSr
	 q/2Cujgy+iywus6x97stsyUOkuLQUvZhyefJm27fi9mBYi7nhg1AFEFEXziz2S5FTgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Gh5wSmnL;
	arc=none smtp.remote-ip=91.218.175.80
Received: from mta0.migadu.com (out-80.mta0.migadu.com [91.218.175.80])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60646606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60646606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Gh5wSmnL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=473BHmUcpoTKfEKxqqh8pcmuw4bO0dBRaaAPnB0eK70=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795501633; v=1; x=1796106433;
 b=Gh5wSmnLFmCRHN4BGff7kZfKIiLvS5PAGUz6ExmleynNnCer02szrsjnDVBZzSKPcPmTcz1+
 NynYpWjjXmLjbYeCbaoAKmqP5crQ7wSWzBanfAAeM7Zw2JQtKZl6DxHCg+O56u7pGhwmZv6V09e
 2ftwTAORAx96bmja1ZFz2TkI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 948f5afaef9c9964;
	Tue, 24 Nov 2026 06:27:13 +0000
X-Mizu-Trace-ID: 948f5afaef9c9964
X-Migadu-Flow: FLOW_OUT
Message-ID: <fd8bf876-6e10-4183-96da-8778f8c4ca3f@linux.dev>
Date: Tue, 24 Nov 2026 14:27:03 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 4/9] bpf: Add log support for cgroup prog
 link_create
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 kpsingh@kernel.org, matt@bobrowski.net, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 martin.lau@kernel.org, mason@kernel.org
References: <20261123152743.19629-5-leon.hwang@linux.dev>
 <ec5343ff7b660c9126b72574cd89cbd54772bd4291d4af16f1b9e39f16939398@mail.kernel.org>
Content-Language: en-US
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <ec5343ff7b660c9126b72574cd89cbd54772bd4291d4af16f1b9e39f16939398@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/26 00:04, bot+bpf-ci@kernel.org wrote:
>> bpf: Add log support for cgroup prog link_create
> 
> TL;DR: The new bpf_log() calls in cgroup attach run under cgroup_mutex and
> cgroup_bpf_mutex, so a copy_to_user() fault on the user log buffer may stall
> other cgroup operations. Consider logging after unlock.
> 
>> diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c
>> --- a/kernel/bpf/cgroup.c
>> +++ b/kernel/bpf/cgroup.c
> 
> [ ... ]
> 
>> @@ -1045,23 +1060,33 @@ static int __cgroup_bpf_attach(struct cgroup *cgrp,
>>  	atype = bpf_cgroup_atype_find(type, new_prog->aux->attach_btf_id);
>>  	if (atype < 0)
>>  		return -EINVAL;
>> -	if (revision && revision != cgrp->bpf.revisions[atype])
>> +	if (revision && revision != cgrp->bpf.revisions[atype]) {
>> +		bpf_log(log, "Cgroup revision mismatch: expected %llu, actual %llu.\n",
>> +			revision, cgrp->bpf.revisions[atype]);
>>  		return -ESTALE;
>> +	}
> 
> [ ... ]
> 
>> @@ -1143,13 +1168,14 @@ static int cgroup_bpf_attach(struct cgroup *cgrp,
>>  	cgroup_bpf_lock_hierarchy();
>>  	ret = __cgroup_bpf_attach(cgrp, prog, replace_prog, link, type, flags,
>> -				  id_or_fd, revision);
>> +				  id_or_fd, revision, log);
>>  	cgroup_bpf_unlock_hierarchy();
>>  	return ret;
> 
> Can these bpf_log() calls block other cgroup users while the locks are
> held?
> 
> cgroup_bpf_attach() takes cgroup_mutex and cgroup_bpf_mutex through
> cgroup_bpf_lock_hierarchy() before calling __cgroup_bpf_attach(), and
> the new messages are emitted from inside it (and from get_prog_list()
> via insert_pl_to_hlist()):
> 
> cgroup_bpf_attach()
>   cgroup_bpf_lock_hierarchy()
>   __cgroup_bpf_attach()
>     bpf_log()
>       bpf_verifier_vlog()
>         copy_to_user(log->ubuf + ..., log->kbuf, ...)
> 
> log->ubuf is the user supplied log_buf, so if that page is not resident
> (swapped out, or backed by FUSE or userfaultfd), copy_to_user() can sleep
> in the fault for as long as the caller chooses.  While it sleeps,
> cgroup_mutex and cgroup_bpf_mutex remain held, so cgroup mkdir/rmdir,
> migration, BPF attach/detach, BPF_PROG_QUERY and the cgroup bpf release
> work would all wait.
> 
> Commit 40aec6bab02e ("bpf, cgroup: Protect cgroup_bpf state with its own
> mutex") split these paths out from cgroup_mutex to avoid hung tasks, and
> before this patch the attach path did not touch user memory under these
> locks.
> 
> This isn't a lock ordering problem, since cgroup_mutex -> mmap_lock
> already exists, but would it be better to record the message and emit it
> from cgroup_bpf_link_attach() after cgroup_bpf_unlock_hierarchy()?
I think it's okay to call bpf_log() inside those locks' critical
section, even though copy_to_user() could unlikely trigger page fault.

I didn't have good idea to address such concern. Probably, in
cgroup_bpf_attach(), prepare a local buffer before
cgroup_bpf_lock_hierarchy(), pass the buffer to __cgroup_bpf_attach() in
order to store the log messages, then call bpf_log() after
cgroup_bpf_unlock_hierarchy() if __cgroup_bpf_attach() returns error.

Thanks,
Leon

