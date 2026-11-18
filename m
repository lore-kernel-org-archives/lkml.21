Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.213
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008363;
	b=xtMac0bILXXlOVXbHYnhyGMHoTfRM0Kl3FISIkm/xHfPbrC/H5WffCbiaRSFjMUIJ2+z
	 /+1Av3WVkSOGeRkqc+YDt9cGyEJE3uy1x/LTmdE/J3xRp0GVQUA/CN+5Kx037nsWOE/FU
	 wOnLpVQhaGheWCWN5O2yV1y1UNDedcW3TVonBHXIPhWcVqrXRGwK2iOlYL/4VxHVsN7G+
	 YMZdDHjOKEGs4FrWqqZlhQZ7XfexZH6v4++5eTAuvgWZK1KKdXbBc2E2aBoHT/4I6poYS
	 dr8gFfIUSrenDK5iWTScLawlonYdqn8I0nC8RIi3hfnJ7g5y3+1nuJFMnIVdgybS1Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008363;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nTxoScPK+PaRXauFch0tTuVGwOPEhY/Ag42egEIJ0uY=;
	b=C9GUgAyblPd6nkwplDKobwH31CwDk5w+NcU63IjF//hBGmX6nvl3TGJQg4zUj/W9eu0T
	 mXjj3dwin1D4Y7py+sIbgd+MewI5KmFDmit57Ttlm77eMAbVIVrsYPPU9+AHExgcpIcfv
	 abKH/anxsHMpXZ1d9LHg3VudDRqf/2JWLPKVBoFTNFa2UjGzTLoMcEkUeHMVqttDTDbOC
	 Nl5AklE9noqy5MW81zujWvApLsUwgEoYQDFnGudaKdGCOPuRQ+fzqP/5dbbwDit6zk8k5
	 M2ZKV3w6RpTDWS4oE30p7FF6qB0WnPKOqH9KNc+2G8LVK0mpXu6HQ6T2dF4zSrt++sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YLTxS9Yo;
	arc=none smtp.remote-ip=95.215.58.213
Received: from mta1.migadu.com (out-213.mta1.migadu.com [95.215.58.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7AF606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B7AF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YLTxS9Yo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j4hyvkpO0ykBnvTe0xuElkbIVVm/NwfBxx0mBlzXPi0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795008358; v=1; x=1795613158;
 b=YLTxS9Yor2lz4H+zz37Xjo1mArFQ/J/liMC5scXP1YCK5HNibwczqGyTTJ3qZLFPBA1PsCxr
 Q6H5SyfH4G3gW/UBHOmNVlM6dNwF8FDkOO3dIWXVucEa3KMN2vH+mUXrsddxReMknmKBTviZaia
 Pm0hTsbdafHUvPZxG1dfnsGo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 317c6210a24ea451;
	Wed, 18 Nov 2026 13:25:58 +0000
X-Mizu-Trace-ID: 317c6210a24ea451
X-Migadu-Flow: FLOW_OUT
Message-ID: <11f7d4ff-b3f1-4d8c-a37c-887d354596da@linux.dev>
Date: Wed, 18 Nov 2026 21:25:44 +0800
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
Cc: cui.tao@linux.dev, sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched_ext/for-7.4-fixes] sched_ext: Don't route tasks to
 SCX before __scx_enabled is fully patched
To: Kuba Piecuch <jpiecuch@google.com>, Tejun Heo <tj@kernel.org>,
 David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
 Changwoo Min <changwoo@igalia.com>
References: <20261118102453.1315267-1-jpiecuch@google.com>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20261118102453.1315267-1-jpiecuch@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello, Kuba,

在 2026/11/18 18:24, Kuba Piecuch 写道:
> scx_root_enable_workfn() sets scx_switching_all and calls
> static_branch_enable(&__scx_enabled) before switching tasks, and
> task_should_scx() gates only on scx_enabled(). static_branch_enable()
> patches jump-label sites in address order rather than atomically:
> task_should_scx() may be patched before __schedule().
> 
> If a concurrent fork or sched_setscheduler() runs in that window,
> task_should_scx() observes scx_enabled() and moves the running task
> from fair_sched_class to ext_sched_class, setting need_resched on the
> class degradation. The following __schedule() can still observe
> !scx_enabled() in next_active_class(), skip ext_sched_class, and pick
> rq->idle while the runnable SCX task is still rq->donor:
> 
>   WARNING: kernel/sched/ext/ext.c:3840 at put_prev_task_scx+0x405/0x7a0
>   Sched_ext: enq_select_cpu (enabling+all), task: runnable_at=+0ms
>   Call Trace:
>    __schedule+0x5cc/0x1100
>    preempt_schedule_common+0x12/0x40
>    preempt_schedule_thunk+0x16/0x40
>    __sched_setscheduler+0x8d8/0x920
> 
> Gate task_should_scx() on a scx_task_switch_enabled flag that is set with
> release semantics only after static_branch_enable(&__scx_enabled) has
> finished patching all call sites and scx_switching_all is updated, and
> cleared on disable alongside scx_switching_all.
> 
> This bug was found and the patch was written with the help of an AI
> coding assistant.
> 
> Fixes: f0e1a0643a59 ("sched_ext: Implement BPF extensible scheduler class")
> Cc: stable@vger.kernel.org # v6.12+
> Signed-off-by: Kuba Piecuch <jpiecuch@google.com>

The release/acquire gate looks right on both the
enable and disable paths.

Applied on top of 700a332c3fe3 (for-7.4-fixes HEAD) and ran 25
scx_simple load/unload cycles in qemu under a fork and
sched_setscheduler() storm. The baseline hit the reported warning on
its own 14s into the run, log below. The patched kernel went through
the identical run with zero warnings.

[   14.225125] CYCLE-7-start
[   14.352153] ------------[ cut here ]------------
[   14.352157] WARNING: kernel/sched/ext/ext.c:3840 at put_prev_task_scx+0x4e4/0x750, CPU#2: storm/91
[   14.354627] Sched_ext: simple (enabling+all), task: runnable_at=+0ms
[   14.372849] Call Trace:
[   14.373019]  <TASK>
[   14.373164]  __schedule+0x52d/0xe60
[   14.373395]  ? bpf__sched_ext_ops_running+0x62/0xac
[   14.373709]  preempt_schedule_common+0x12/0x40
[   14.380061]  preempt_schedule_thunk+0x16/0x40
[   14.380628]  __sched_setscheduler+0x815/0x8a0
[   14.380918]  do_sched_setscheduler+0x154/0x1f0
[   14.381220]  __x64_sys_sched_setscheduler+0x1c/0x40

Tested-by: Tao Cui <cuitao@kylinos.cn>
Reviewed-by: Tao Cui <cuitao@kylinos.cn>
