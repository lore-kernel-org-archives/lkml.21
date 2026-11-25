Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795568060;
	b=Am5PAEKtfzd275QxV5lpIn9OlAeXqGYRPmGt+a+u8Ptha5uVUrA/L1jXLKA4BmpEP6Sz
	 ZhvTt9oMgpyDKdF7JNd5AX8R2my8sqNu9ikUkBkH2bT2lcvpgTtfHXYauAgx7LM4kZBuN
	 6aI8tvfP5NuKbjjVmEGGR2ent661GO9lXzG8MbqFdFArcPFS4BDOEUUmrc3bCQSUxYmxW
	 Z7SZyzV1+2iCj8RjEaa6UBTenj2ibzxSVCglMiWhtirOBuN94eHDgA3q0QvGBm3jJNhuH
	 BdVAfHjdDkuUbaey45RROrWLmcbAf8PctOcdIvkJQ6kT/2GCstdqyxzVjfduZ8ACT7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795568060;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=h1N+AeVI+PflUoCbWUxNsgJmzWp5PNqAd2zKDZGX4m0=;
	b=BGAS/4zoi/Qt4YwUEZe15yV6npKxIh8Ca3O6H36ngbVo9Q+wpvVXWjDl2s9osWEA9zF2
	 Dn3ZpHkof7rF8cCTdBpSUgX43tgzEDzYvxumk2cDGukJPn1A0gEFUEgttozut49T6xt0+
	 OX2pz7/362pXLbQKhBFZdGlcuD2MwscYh5x5V9UGQWGtmQF7PZGTrN3Nnw+lxONmegwi+
	 Y+OAh09J1ABNMDrP2Dt6ZyJFkzFr82Ki2ff1UMdBE7GJP+syXIHWTK7VuY6XEeU/nj2m8
	 ANkjeOI4N5DNgf7aTbKIw8W6vZkaGpVi6ALm2CavkdIiYo8QPys12HT2DRoMaJHCThQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b="G/VUaUFb";
	arc=none smtp.remote-ip=202.108.3.23
Received: from r3-23.sinamail.sina.com.cn (r3-23.sinamail.sina.com.cn [202.108.3.23])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874A6606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 874A6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=G/VUaUFb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1795568058;
	bh=h1N+AeVI+PflUoCbWUxNsgJmzWp5PNqAd2zKDZGX4m0=;
	h=From:Subject:Date:Message-ID;
	b=G/VUaUFbTzSUAzA61pxcy+G44dVFQeV/D0+9ME9JTM8WheK3bK1oNA5X4aciI3Blf
	 UQlrOJVnt0sTnSXhDc9F6699vZOxdwyj38TwxINHODtseUNvsxBCuDzDRzZEQupcpT
	 XRkBuR4nro5/kL0v/8CSFXXVCjAmV01etuY18hIQ=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.244.128.109])
	by sina.com (10.54.253.31) with ESMTP
	id 6B0631AD000035FB; Wed, 25 Nov 2026 08:54:09 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 1500086816305
X-SMAIL-UIID: A7DDFD60D8604DCD85FE7D40D185317A-20261125-085409-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+97fde463a8ffb9e839d2@syzkaller.appspotmail.com>
Cc: jack@suse.cz,
	linux-kernel@vger.kernel.org,
	Tejun Heo <tj@kernel.org>,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ext4?] BUG: workqueue lockup in update_super_work
Date: Wed, 25 Nov 2026 08:53:56 +0800
Message-ID: <20261125005359.521-1-hdanton@sina.com>
In-Reply-To: <6b0576ba.a481e175.27cf24.0027.GAE@google.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Tue, 24 Nov 2026 03:36:26 -0800
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    a041bdbe1f3a arm64: Drop stdint.h type overrides from asm/..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=1410c1d9580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4e8e6c1701ad8af2
> dashboard link: https://syzkaller.appspot.com/bug?extid=97fde463a8ffb9e839d2
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
> userspace arch: arm64
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17576985580000
> 
> AI-generated root cause summary:
> The workqueue watchdog detected a 35-second lockup on CPU 0's per-CPU worker
> pool (`pool 2`), where all four busy workers (`update_super_work`,
> `smc_ib_port_event_work`, `srcu_invoke_callbacks`, and `wg_packet_tx_worker`)
> are in `TASK_RUNNING` (`state:R`) and switched out at `__switch_to`, unable to
> be scheduled onto CPU 0 while CPU 1 (`pool 6`) continues running normally.
> Because `srcu_invoke_callbacks` and `smc_ib_port_event_work` (which blocked on
> `rtnl_lock`) cannot resume on CPU 0, the stall cascades to
> `fsnotify_mark_destroy_workfn` (`synchronize_srcu`), `cfg80211_wiphy_work`,
> `reg_todo`, and `batadv_tt_purge`. The exact code currently monopolizing CPU 0
> cannot be conclusively determined from this report because
> `show_cpu_pool_busy_workers()` checks `task_is_running()` rather than whether a
> worker is actively executing on the CPU, and therefore skipped
> `trigger_single_cpu_backtrace(0)`.
> 
Incorrect, given the print -- The pool might have trouble waking an idle worker.


> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=97fde463a8ffb9e839d2
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+97fde463a8ffb9e839d2@syzkaller.appspotmail.com
> 
> BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=0 stuck for 5s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=0x100
>   pwq 2: cpus=0 node=0 flags=0x0 nice=0 active=6 refcnt=8
>     in-flight: 4867:update_super_work for 6s
>     pending: refresh_vm_stats BAR(5070), vmstat_shepherd, 2*nsim_dev_hwstats_traffic_work, free_obj_work
>   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
>     in-flight: 24:request_firmware_work_func for 42s
> workqueue mm_percpu_wq: flags=0x108
>   pwq 2: cpus=0 node=0 flags=0x0 nice=0 active=1 refcnt=2
>     pending: vmstat_update
> workqueue kblockd: flags=0x118
>   pwq 3: cpus=0 node=0 flags=0x0 nice=-20 active=2 refcnt=3
>     pending: 2*blk_mq_timeout_work
> pool 2: cpus=0 node=0 flags=0x0 nice=0 hung=5s workers=5 idle: 1171 10 1104 9
> pool 6: cpus=1 node=0 flags=0x0 nice=0 hung=0s workers=6 idle: 26 4849 876 4848 4769
> Showing backtraces of busy workers in stalled worker pools:
> pool 2:
> task:kworker/0:4     state:R  running task     stack:0     pid:4867  tgid:4867  ppid:2      task_flags:0x4208060 flags:0x00000010
> Workqueue: events update_super_work
> Call trace:
>  __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:792 (T)
>  context_switch kernel/sched/core.c:5583 [inline]
>  __schedule+0x1368/0x2b50 kernel/sched/core.c:7382
>  __schedule_loop kernel/sched/core.c:7459 [inline]
>  schedule+0x13c/0x20c kernel/sched/core.c:7474
>  io_schedule+0x1c/0xe0 kernel/sched/core.c:8146
>  bit_wait_io+0x1c/0xe8 kernel/sched/wait_bit.c:258
>  __wait_on_bit+0xb8/0x178 kernel/sched/wait_bit.c:52
>  out_of_line_wait_on_bit+0x130/0x184 kernel/sched/wait_bit.c:67
>  wait_on_bit_io include/linux/wait_bit.h:106 [inline]
>  __wait_on_buffer+0x6c/0x7c fs/buffer.c:118
>  wait_on_buffer include/linux/buffer_head.h:476 [inline]
>  ext4_commit_super+0x2b4/0x458 fs/ext4/super.c:6417
>  update_super_work+0x2dc/0x384 fs/ext4/super.c:817
>  process_one_work kernel/workqueue.c:3495 [inline]
>  process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3578
>  worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
>  kthread+0x304/0x3d4 kernel/kthread.c:436
>  ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
> BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=0 stuck for 8s!
> BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=-20 stuck for 3s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=0x100
>   pwq 2: cpus=0 node=0 flags=0x0 nice=0 active=7 refcnt=9
>     in-flight: 4867:update_super_work for 9s
>     pending: refresh_vm_stats BAR(5070), vmstat_shepherd, 2*nsim_dev_hwstats_traffic_work, free_obj_work, psi_avgs_work
>   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
>     in-flight: 24:request_firmware_work_func for 45s
> workqueue events_dfl_long: flags=0x2
>   pwq 8: cpus=0-1 flags=0x4 nice=0 active=1 refcnt=2
>     pending: defense_work_handler
> workqueue mm_percpu_wq: flags=0x108
>   pwq 2: cpus=0 node=0 flags=0x0 nice=0 active=1 refcnt=2
>     pending: vmstat_update
> workqueue kblockd: flags=0x118
>   pwq 3: cpus=0 node=0 flags=0x0 nice=-20 active=2 refcnt=3
>     pending: 2*blk_mq_timeout_work
> pool 2: cpus=0 node=0 flags=0x0 nice=0 hung=8s workers=5 idle: 1171 10 1104 9
> pool 6: cpus=1 node=0 flags=0x0 nice=0 hung=0s workers=6 idle: 4849 26 876 4848 4769
> Showing backtraces of busy workers in stalled worker pools:
> pool 2:
> task:kworker/0:4     state:R  running task     stack:0     pid:4867  tgid:4867  ppid:2      task_flags:0x4208060 flags:0x00000010
> Workqueue: events update_super_work
> Call trace:
>  __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:792 (T)
>  context_switch kernel/sched/core.c:5583 [inline]
>  __schedule+0x1368/0x2b50 kernel/sched/core.c:7382
>  __schedule_loop kernel/sched/core.c:7459 [inline]
>  schedule+0x13c/0x20c kernel/sched/core.c:7474
>  io_schedule+0x1c/0xe0 kernel/sched/core.c:8146
>  bit_wait_io+0x1c/0xe8 kernel/sched/wait_bit.c:258
>  __wait_on_bit+0xb8/0x178 kernel/sched/wait_bit.c:52
>  out_of_line_wait_on_bit+0x130/0x184 kernel/sched/wait_bit.c:67
>  wait_on_bit_io include/linux/wait_bit.h:106 [inline]
>  __wait_on_buffer+0x6c/0x7c fs/buffer.c:118
>  wait_on_buffer include/linux/buffer_head.h:476 [inline]
>  ext4_commit_super+0x2b4/0x458 fs/ext4/super.c:6417
>  update_super_work+0x2dc/0x384 fs/ext4/super.c:817
>  process_one_work kernel/workqueue.c:3495 [inline]
>  process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3578
>  worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
>  kthread+0x304/0x3d4 kernel/kthread.c:436
>  ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
> pool 3: no worker in running state, cpu=0 is busy (nr_workers=2 nr_idle=2)
> The pool might have trouble waking an idle worker.
> Backtrace of last woken worker:
> task:kworker/0:1H    state:R  running task     stack:0     pid:4368  tgid:4368  ppid:2      task_flags:0x4208060 flags:0x00000010
> Workqueue:  0x0 (kblockd)
> Call trace:
>  __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:792 (T)
>  context_switch kernel/sched/core.c:5583 [inline]
>  __schedule+0x1368/0x2b50 kernel/sched/core.c:7382
>  __schedule_loop kernel/sched/core.c:7459 [inline]
>  schedule+0x13c/0x20c kernel/sched/core.c:7474
>  worker_thread+0x924/0xbd0 kernel/workqueue.c:3674
>  kthread+0x304/0x3d4 kernel/kthread.c:436
>  ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
> Sending NMI from CPU 1 to CPUs 0:
> NMI backtrace for cpu 0
> CPU: 0 UID: 0 PID: 5064 Comm: syz-executor298 Not tainted syzkaller #0 PREEMPT 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
> pstate: 00001000 (nzcv daif -PAN -UAO -TCO -DIT +SSBS BTYPE=--)
> pc : 0000ffff92d12354
> lr : 0000ffff92c64e84
> sp : 0000ffffd134ccf0
> x29: 0000ffffd134ccf0 x28: 0000ffff92cb3000 x27: 0000ffff92cb3000
> x26: 0000ffff92cb3000 x25: 0000ffff92cb3000 x24: 0000000000000004
> x23: 0000ffffd134cdd0 x22: 0000000000000001 x21: 0000ffff92d00000
> x20: 0000ffffd134ce90 x19: 0000ffff92d01000 x18: 0000000001503538
> x17: 0000000ca3baf921 x16: 0000000000000017 x15: 0000000000800000
> x14: 0000000ca3c7df44 x13: 0000000000002490 x12: 000000007fffffff
> x11: 0000000000000001 x10: 0000000000000001 x9 : 0000ffff92d0e010
> x8 : 0000ffff92d0e000 x7 : 0000000000000000 x6 : 0000000000000000
> x5 : 0000000000000000 x4 : 0000000000002490 x3 : 0012c684c0000000
> x2 : 0000ffff92d12310 x1 : 0000ffffd134ce90 x0 : 0000000000000001
> BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=0 stuck for 11s!
> BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=-20 stuck for 6s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=0x100
>   pwq 2: cpus=0 node=0 flags=0x0 nice=0 active=7 refcnt=9
>     in-flight: 4867:update_super_work for 12s
>     pending: refresh_vm_stats BAR(5070), vmstat_shepherd, 2*nsim_dev_hwstats_traffic_work, free_obj_work, psi_avgs_work
>   pwq 6: cpus=1 node=0 flags=0x0 nice=0 active=1 refcnt=2
>     in-flight: 24:request_firmware_work_func for 48s
> workqueue events_unbound: flags=0x2
>   pwq 8: cpus=0-1 flags=0x4 nice=0 active=3 refcnt=4
>     pending: nsim_dev_trap_report_work, toggle_allocation_gate, nsim_dev_trap_report_work
> workqueue mm_percpu_wq: flags=0x108
>   pwq 2: cpus=0 node=0 flags=0x0 nice=0 active=1 refcnt=2
>     pending: vmstat_update
> workqueue kblockd: flags=0x118
>   pwq 3: cpus=0 node=0 flags=0x0 nice=-20 active=2 refcnt=3
>     pending: 2*blk_mq_timeout_work
> pool 2: cpus=0 node=0 flags=0x0 nice=0 hung=11s workers=5 idle: 1171 10 1104 9
> pool 6: cpus=1 node=0 flags=0x0 nice=0 hung=0s workers=6 idle: 4849 26 876 4848 4769
> Showing backtraces of busy workers in stalled worker pools:
> pool 2:
> task:kworker/0:4     state:R  running task     stack:0     pid:4867  tgid:4867  ppid:2      task_flags:0x4208060 flags:0x00000010
> Workqueue: events update_super_work
> Call trace:
>  __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:792 (T)
>  context_switch kernel/sched/core.c:5583 [inline]
>  __schedule+0x1368/0x2b50 kernel/sched/core.c:7382
>  __schedule_loop kernel/sched/core.c:7459 [inline]
>  schedule+0x13c/0x20c kernel/sched/core.c:7474
>  io_schedule+0x1c/0xe0 kernel/sched/core.c:8146
>  bit_wait_io+0x1c/0xe8 kernel/sched/wait_bit.c:258
>  __wait_on_bit+0xb8/0x178 kernel/sched/wait_bit.c:52
>  out_of_line_wait_on_bit+0x130/0x184 kernel/sched/wait_bit.c:67
>  wait_on_bit_io include/linux/wait_bit.h:106 [inline]
>  __wait_on_buffer+0x6c/0x7c fs/buffer.c:118
>  wait_on_buffer include/linux/buffer_head.h:476 [inline]
>  ext4_commit_super+0x2b4/0x458 fs/ext4/super.c:6417
>  update_super_work+0x2dc/0x384 fs/ext4/super.c:817
>  process_one_work kernel/workqueue.c:3495 [inline]
>  process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3578
>  worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
>  kthread+0x304/0x3d4 kernel/kthread.c:436
>  ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
> pool 3: no worker in running state, cpu=0 is busy (nr_workers=2 nr_idle=2)
> The pool might have trouble waking an idle worker.
> Backtrace of last woken worker:
> task:kworker/0:1H    state:R  running task     stack:0     pid:4368  tgid:4368  ppid:2      task_flags:0x4208060 flags:0x00000010
> Workqueue:  0x0 (kblockd)
> Call trace:
>  __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:792 (T)
>  context_switch kernel/sched/core.c:5583 [inline]
>  __schedule+0x1368/0x2b50 kernel/sched/core.c:7382
>  __schedule_loop kernel/sched/core.c:7459 [inline]
>  schedule+0x13c/0x20c kernel/sched/core.c:7474
>  worker_thread+0x924/0xbd0 kernel/workqueue.c:3674
>  kthread+0x304/0x3d4 kernel/kthread.c:436
>  ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
> Sending NMI from CPU 1 to CPUs 0:
> NMI backtrace for cpu 0
> CPU: 0 UID: 0 PID: 5064 Comm: syz-executor298 Not tainted syzkaller #0 PREEMPT 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
> pstate: 00001000 (nzcv daif -PAN -UAO -TCO -DIT +SSBS BTYPE=--)
> pc : 0000ffff92d12364
> lr : 0000ffff92c64e84
> sp : 0000ffffd134ccf0
> x29: 0000ffffd134ccf0 x28: 0000ffff92cb3000 x27: 0000ffff92cb3000
> x26: 0000ffff92cb3000 x25: 0000ffff92cb3000 x24: 0000000000000004
> x23: 0000ffffd134cdd0 x22: 0000000000000001 x21: 0000ffff92d00000
> x20: 0000ffffd134ce90 x19: 0000ffff92d01000 x18: 0000000001503538
> x17: 0000000d5ab774a1 x16: 0000000000000017 x15: 0000000000800000
> x14: 0000000d5ac496d8 x13: 00000000000026f6 x12: 000000007fffffff
> x11: 0000000000000001 x10: 0000ffffd134ccf0 x9 : 0000ffff92d0e010
> x8 : 0000ffff92d0e000 x7 : 0000000000000000 x6 : 0000000000000000
> x5 : 0000000000000000 x4 : 00000000000026f6 x3 : 0014dc9380000000
> x2 : 0000ffff92d12310 x1 : 0000ffffd134ce90 x0 : 0000000000000001
