Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541468;
	b=2p2iR9u0ebHdV/oH/yyVWDcFY7YT5det+VFzbQr4c90JVFoz8TjNVOcuzKVpIf+7TD+9
	 9xZWddJZ4f0okD9sX85l2zFbBDuZG85x9N0/2Jb/hwfxw8RCh2I/Zb2cXg0X9nVj1//bx
	 UcLPhyKkb85/n2lHM8TaIcF7Gx2aThjpk9a3cyJPD3CTULHjlt031OtKnEiGlWQO9BoMT
	 7XCuKTc9hfN3OFYKJLwF14Kewb/ZgrRA3UwoRyEQFGLqbqOQWdERte/hq6jgn0tv+ITue
	 i2r+LXUkYAROM2nizVQPSeMmuqpagNTLk/p/JjDIbGu6PRruHF/LZftrvEa250yxwuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fsuE2RHsVzmHIFl8GD1CJUdOQe+hJagCxzxdFX90vqs=;
	b=BuVk8UH4kboXTZGys3rkcYIQxdEYEnlz5p+QPZrv2XxAfZkzaybWKsOh7LX2/ERKRa0l
	 C/wenBh8FS+DEvlHQiYg9g+clU4tYDVoo2EwghYYCfi8X8GmQnWf8xFfsTf1lEa0ZYG9V
	 KqlLxgpXWdWh4XicK+pjN2t+aNoneOwTgHiYwSmgIBmO9lG1+oz3IoxCwaUrb21NSEEsG
	 n7MklQYPFYV+98cYqsFMhZe79jz2xNvcYwfZ2W02A8OW5BIfY9y4cQ80pfWp5eXYSa22w
	 3Mq35+KeMVJ4Rqr7NAgWQtuzIOUU6VvyZJlZtDd4DaslTLLedDSEri398jM5ittc8og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DRgZaMIi;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541C8606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 541C8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DRgZaMIi
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb76bb36c7so4191855e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541467; x=1796146267; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fsuE2RHsVzmHIFl8GD1CJUdOQe+hJagCxzxdFX90vqs=;
        b=DRgZaMIiikqI4SQ1PtZOK8WFeLrHcYfdwfwfKpLTEDuSk8jsRKshQEApEAJg8q3VAe
         qiFRW/0tKo/NXd8fHvFsQbtOceDtdvuxht17c4VaHkQWNe1otEamsXAS9px+uoOYDoKC
         Z+2S2PkIzOI0xfltkvjS11+GK7uQJWxMjO/6wPjDgegiCi4IXWyNfzfySCCyyrrSxhYI
         a3NOqj5Qa8M0IuBwlaQ5VKTXJlztmc4DD813VirX7v0D5ckkbjtsnLinYKdQyL9UZHK3
         ArBEVRmPx2JOzdrhHiVCuWxDOCAF1oXuE+sat2IC5gfucTVUeDhE5u2CV+9YsYwclrVW
         rlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541467; x=1796146267;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsuE2RHsVzmHIFl8GD1CJUdOQe+hJagCxzxdFX90vqs=;
        b=KeDrKvvAKAxPessP2JMt4b/KPDGCRj+iQSIxvPx3mZFbDavQfskn2phF+fF5orPjPv
         TmIyBL6KbUxXIaogwdty3576SqfFcEMcm8zZU+6+qgcqzO8ma9kZUGEYSR4Apmd55ZGf
         ReVPin90/FuJBNB9tW9o3x4s3aAlhth2y4xMJC1/YiHSuw+rHoLC8vQe5TX4Plgh1zIb
         WnAq6yPpap+DOaU9v1yUDqQoxTxfQu8Y8SJ/sH9v92VF+vPcxNyivLIDTRsxJ283vFuN
         FVZEzCCebbbcMas8nHZVntUQbhEBbiSEX+NqGjAkHCiqOHnlaWGm6CCFbq1QdfonDvQq
         PmHg==
X-Forwarded-Encrypted: i=1; AL+hErFlQLq7xkYyy3aPtsVHDncOMrGwJnvb/9V1EQqXLbG0jrQwF+83Eg99zvLk0ZAxbHd/dIGmwmcXp2MF3Xw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+46hDzIeYvtrUeolQy8vFkYQ2AQZeYHvW48uedtXjOT8FNZUT4
	YJA/s1nwgslgsFrw22yh3oarnneLdEEzqPuSBaoMPZzHLBKz64I0HpRI
X-Gm-Gg: AZFdTZcSqjVZ7Dw7zwcQAVONdGSOYsjaCCZrsoH4+ksgajdfFitN2tveTKpZ82agXj6
	sxHjlhHe+POWu4fuMmjviEXOoKp7+8H/4i/23kq+ATtZwEbtA7kenGDHlU+KsSRn1EBhl8OVOpK
	fgHQHCsUoZmx3hp6P9Zz1Ox5VI37oSSc0IanjYDwecHK4aJ76wnx4T4nWr4ub/yDxJnSTRiYWIv
	yglN+yzfj1XX3i55eZwGOVE68IEm9pTm4Tra2lxGfZFYyS9x/sfgEiMyEP425MIrFe1ez+J7ZXe
	ZtW2dAzy+HBCLV3izI0g6d7OktMUQ6Jgaa4CX0V9DwIN2ib97vstDeUs8sJ2hXtWzDtwFiFmWpd
	iky+UGZNr1SSbGIrEB979WiNHW6QH0SpkS37519QNOUxVyLS8xUYCcRoYEreP5yYdvvsqmWqOKZ
	gLkYoydqX0NUWWhRlAg9ZmtEmlNloaSSqNWaUlsI+KpEQQJofX4bBll8TlDx6NdCUCdRhX1Tqnp
	DML/y4CxDt7rGQibBvQNxrNudRojXJt8tez6hQAOytz5XGgWVkVbzEQsnOcTQA/XhPy7OfFenBS
	/yWhljOTyB97sIQVYgPs/WEY8YqWcNULAfwIMIGLgjkSvA1r0Nb0WgiF
X-Received: by 2002:a05:600c:8284:b0:4bb:6c01:de9c with SMTP id 5b1f17b1804b1-4bb887f55c1mr274062465e9.2.1795541466396;
        Tue, 24 Nov 2026 09:31:06 -0800 (PST)
Received: from scheduler.schedules ([85.100.65.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm27734296f8f.18.2026.11.24.09.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:31:05 -0800 (PST)
Date: Tue, 24 Nov 2026 20:31:02 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	lukasz.luba@arm.com, rafael@kernel.org, linux-pm@vger.kernel.org, tj@kernel.org, 
	void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev, qyousef@layalina.io, christian.loehle@arm.com, 
	pierre.gondois@arm.com, sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Subject: Re: [PATCH 00/18 v3] Improving latency of short slice tasks
Message-ID: <awWc4Ca5Jj7H_kzW@scheduler.schedules>
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
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
In-Reply-To: <20261106151947.3991524-1-vincent.guittot@linaro.org>

Hi Vincent,

On Fri, Nov 06, 2026 at 04:19:27PM +0100, Vincent Guittot wrote:
> This is another round of scheduling latency improvements which fix
> some remaining corner cases and start to fix somes cases when multi
> short slice tasks are running simultaneously on the system.

At first I wanted to just run some hackbench tests on this series.
It was supposed to take like 10 minutes. It took me 2 days.

I tried to apply it, b4 got crazy. So I tried to find the cause.
After some little changes, I was finally able to apply the series.

Then I tried to deploy the series, it didn't deploy. I thought my VM
was going crazy. But everything was correct. Then I realised that I forgot to
plug in my ethernet cable.

Then I started gathering numbers for the base. I ran 5 tests 2 runs each.
I thought it was finally over and I could sleep or
start doing reviews that I was delaying.

Well no. It crashed on the last test, while doing hackbench.
I tried again, and it crashed again.

My machine is a Zen 3, 8 cores 16 threads.

Base: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c

Okay... Well here the logs:

<4>[   73.401173] WARNING: kernel/sched/fair.c:10295 at fair_push_tasks+0x1a7/0x220, CPU#10: hackbench/1904
<4>[   73.401182] Modules linked in:
<4>[   73.401314] CPU: 10 UID: 0 PID: 1904 Comm: hackbench Not tainted 7.4.0-rc2+ #44 PREEMPT(lazy)
<4>[   73.401318] Hardware name: System manufacturer System Product Name/TUF B450M-PRO GAMING, BIOS 4604 03/22/2024
<4>[   73.401321] RIP: 0010:fair_push_tasks+0x1a7/0x220
<4>[   73.401325] Code: c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f e9 1d cc c7 ff 0f 0b 41 0f b6 86 6d f6 ff ff 3c 01 0f 84 db fe ff ff 0f 0b e9 d4 fe ff ff <0f> 0b e9 af fe ff ff 0f 0b e9 9e fe ff ff 41 8b 84 24 e0 0f 00 00
<4>[   73.401328] RSP: 0018:ffffd1a74b5db8c0 EFLAGS: 00010046
<4>[   73.401332] RAX: 000000000000000a RBX: ffff8c0985518000 RCX: 0000000000000000
<4>[   73.401335] RDX: ffff8c0c9ef1d510 RSI: ffff8c0c9ef36b60 RDI: ffff8c0c9ef36b00
<4>[   73.401337] RBP: ffff8c0c9ef36d80 R08: 0000000000000001 R09: ffff8c0985518ff8
<4>[   73.401340] R10: ffff8c0985518000 R11: 0000000000000000 R12: 0000000000000000
<4>[   73.401342] R13: ffff8c0985518000 R14: ffff8c09855189c8 R15: ffff8c0c9ef36b00
<4>[   73.401344] FS:  00007f54a42536c0(0000) GS:ffff8c0ce0f9a000(0000) knlGS:0000000000000000
--
<4>[   91.767339] WARNING: kernel/sched/sched.h:1722 at cpuacct_charge+0xbb/0x1a0, CPU#6: hackbench/1933
<4>[   91.767347] Modules linked in:
<4>[   91.767468]
<4>[   91.767474] =============================
<4>[   91.767476] [ BUG: Invalid wait context ]
<4>[   91.767478] 7.4.0-rc2+ #44 Tainted: G        W
<4>[   91.767481] -----------------------------
<4>[   91.767483] hackbench/1929 is trying to lock:
<4>[   91.767485] ffff8c09a59abe00 (&mm->mmap_lock){++++}-{4:4}, at: __might_fault+0x3e/0x80
<4>[   91.767496] other info that might help us debug this:
<4>[   91.767498] context-{5:5}
<4>[   91.767500] locks held by hackbench/1929: 3, on CPU#1:
<4>[   91.767503]  #0: ffff8c0c95e1c460 (&pipe->mutex){+.+.}-{4:4}, at: anon_pipe_prefill_and_lock+0x123/0x210
<4>[   91.767512]  #1: ffff8c09859d0ec0 (&p->pi_lock){-.-.}-{2:2}, at: fair_push_tasks+0xae/0x220
<4>[   91.767521]  #2: ffff8c0c9edb6b60 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x25/0xb0
<4>[   91.767530] stack backtrace:
<4>[   91.767533] CPU: 1 UID: 0 PID: 1929 Comm: hackbench Tainted: G        W           7.4.0-rc2+ #44 PREEMPT(lazy)
<4>[   91.767536] Tainted: [W]=WARN
<4>[   91.767537] Hardware name: System manufacturer System Product Name/TUF B450M-PRO GAMING, BIOS 4604 03/22/2024
<4>[   91.767538] Call Trace:
<4>[   91.767539]  <TASK>
<4>[   91.767541]  dump_stack_lvl+0x6e/0xa0
<4>[   91.767546]  __lock_acquire+0x8d9/0xc70
<4>[   91.767558]  lock_acquire.part.0+0x8e/0x1e0
<4>[   91.767566]  __might_fault+0x57/0x80
<4>[   91.767571]  _copy_from_iter+0x4e/0x770
<4>[   91.767587]  copy_page_from_iter+0x9a/0x130
<4>[   91.767591]  anon_pipe_write+0x524/0x7b0
<4>[   91.767602]  vfs_write+0x424/0x580
<4>[   91.767610]  ksys_write+0xc8/0xf0
<4>[   91.767613]  do_syscall_64+0xed/0x1560
<4>[   91.767628] CPU: 6 UID: 0 PID: 1933 Comm: hackbench Tainted: G        W           7.4.0-rc2+ #44 PREEMPT(lazy)
<4>[   91.767635] Tainted: [W]=WARN
<4>[   91.767637] Hardware name: System manufacturer System Product Name/TUF B450M-PRO GAMING, BIOS 4604 03/22/2024
<4>[   91.767641] RIP: 0010:cpuacct_charge+0xbb/0x1a0
<4>[   91.767647] Code: 00 00 00 48 03 04 dd 60 a1 33 bc 48 01 28 4d 8b a4 24 08 01 00 00 4d 85 e4 75 d3 48 83 c4 08 5b 5d 41 5c 41 5d e9 60 e7 c4 ff <0f> 0b eb a6 e8 ec 1b 05 00 85 c0 75 ae be ff ff ff ff 48 c7 c7 c0
<4>[   91.767653] RSP: 0018:ffffd1a74b6c3818 EFLAGS: 00010046
<4>[   91.767656]
<4>[   91.767659] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
<4>[   91.767661] RDX: 0000000000000000 RSI: ffff8c0c9eab6b60 RDI: ffff8c0985940fd0
<4>[   91.767666] RBP: 0000000000000a41 R08: 0000000000000001 R09: ffff8c0985940fd0
<4>[   91.767670] R10: 0000003b3993930c R11: 0000000000000000 R12: ffff8c09859d0000
<4>[   91.767674] R13: ffff8c09859d0000 R14: 0000000000000001 R15: ffff8c09859ab600
<4>[   91.767679] FS:  00007f54a41c26c0(0000) GS:ffff8c0ce0d9a000(0000) knlGS:0000000000000000
<4>[   91.767681] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[   91.767685] CR2: 00007febee499a78 CR3: 000000010685f000 CR4: 0000000000f50ef0
<4>[   91.767689] PKRU: 55555554
<4>[   91.767693] Call Trace:
<4>[   91.767696]  <TASK>
<4>[   91.767703]  update_se+0x167/0x2d0
<4>[   91.767715]  update_curr+0x2b/0x190
<4>[   91.767727]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
<4>[   91.767729]  enqueue_task_fair+0x251/0x840
<4>[   91.767729] RIP: 0033:0x7f54a4366332
<4>[   91.767732] Code: 08 0f 85 91 41 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa 55 bf 01 00
<4>[   91.767733] RSP: 002b:00007f54a41d5d68 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
<4>[   91.767735] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f54a4366332
<4>[   91.767736] RDX: 0000000000000064 RSI: 00007f54a41d5da0 RDI: 0000000000000022
<4>[   91.767737] RBP: 00007f54a41d5d90 R08: 0000000000000000 R09: 0000000000000000
<4>[   91.767738] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000064
<4>[   91.767739] R13: 00007f54a41d5da0 R14: 000000000000000d R15: 000000003c659170
<4>[   91.767744]  enqueue_task+0x88/0x210
<4>[   91.767747]  </TASK>
<1>[   91.768009] BUG: kernel NULL pointer dereference, address: 0000000000000000
<1>[   91.768013] #PF: supervisor instruction fetch in kernel mode
<1>[   91.768016] #PF: error_code(0x0010) - not-present page
<6>[   91.768019] PGD 12803e067 P4D 12803e067 PUD 10acf4067 PMD 0
<4>[   91.768026] Oops: Oops: 0010 [#1] SMP NOPTI
<4>[   91.768029] CPU: 7 UID: 0 PID: 1929 Comm: hackbench Tainted: G        W           7.4.0-rc2+ #44 PREEMPT(lazy)
<4>[   91.768034] Tainted: [W]=WARN
<4>[   91.768036] Hardware name: System manufacturer System Product Name/TUF B450M-PRO GAMING, BIOS 4604 03/22/2024
<4>[   91.768039] RIP: 0010:0x0
<4>[   91.768045] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
<4>[   91.768048] RSP: 0018:ffffd1a74b6a3740 EFLAGS: 00010046
<4>[   91.768052] RAX: 0000000000000001 RBX: ffff8c0c9edb6b00 RCX: ffff8c0c9edb6b48
<4>[   91.768055] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8c0c9edb6b48
<4>[   91.768058] RBP: ffff8c0c9edb6d80 R08: ffff8c09859d1020 R09: ffff8c09859d1020
<4>[   91.768060] R10: ffff8c09859d0000 R11: 0000000000000000 R12: ffff8c0c9eab6b00
<4>[   91.768062] R13: ffff8c09859d0000 R14: ffff8c09859d09c8 R15: ffff8c0c9edb6b00
<4>[   91.768065] FS:  00007f54a41d66c0(0000) GS:ffff8c0ce0e1a000(0000) knlGS:0000000000000000
<4>[   91.768067] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[   91.768070] CR2: ffffffffffffffd6 CR3: 000000010685f000 CR4: 0000000000f50ef0
<4>[   91.768072] PKRU: 55555554
<4>[   91.768074] Call Trace:
<4>[   91.768076]  <TASK>
<4>[   91.768372]  </TASK>

Without Proxy Exec, this just disappears.


I just wanted to run some hackbench, I wasn't ready for doing all of this :-(.
And I had 4 hours of sleep yesterday. I need a break on this.


Thanks,

Kayra
