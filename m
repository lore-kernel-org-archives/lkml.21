Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470701;
	b=CM+r/cjL/lpIybPDXXw6/5RMIsdadJ90lI/7s5EKdamn6NdqFS2j5vJNuVp8TIJz4o0f
	 hteZFOnIE2BUR1MD0TzTBzvw+zgyf72QOcDeU1LmP9mnQmblgM025ftoDiWqwTNpL+xop
	 NmR8XM+lIkteTnntDihmSPvW1BxzzYNujPgyyNofEe+vm3a1jJCLb38/nwJ7+LzZ8YWlF
	 WaJR/NCg5n9JmuHWIXbwrksf4c8LEqkFUB7hdh+Y2pbpPiGINXmEc5GnL5jn/5hD8q3E6
	 AqwPi2Evg8cBk0+H+1a+GSP5m2IWigiYg7zUbXNHM78t+Vo1AUjuggbMqxx9e51iwfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=2Hs8rCyGsw/DQ1uI+RqDlzXciGD3XvAd/zH1v+QjQxE=;
	b=4qzYkw2fSNVTBR03I+pe1KjSNaIOVd99wPscwtgjaNLfKgFQkRqumMXKf9TEslDSId6v
	 UgzFucVFc9TbIPtuLBvFEtYcjfho7fX2pQZPMMREfIqtbjHGAgBneV0E6TEbvbiXg8BCF
	 7tm+Q++0w4sKqShAGooxgF0LZW41QYFFDGjnzj4Y52o/8kuBffobvGWxFHCHsx4TBMta4
	 eRzf6N7ZQub4R9oa8KuWdwONNVHvODhI+/LAxNBIa6HTqn0JIG8iBom+HAd1fQWKz5XgV
	 AuhKjIrd+IivGddYY0URWuJfQUOHlHuMZEzEK9JXwR4HCcuE1elaL9pok3N8Hr6m5eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=piCHQ0my;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACAB606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BACAB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=piCHQ0my
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso3194875f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795470699; x=1796075499; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2Hs8rCyGsw/DQ1uI+RqDlzXciGD3XvAd/zH1v+QjQxE=;
        b=piCHQ0myYf4CbDx9pBcTwF2BhbPVeA92N6bZ4QLuFa8KhORRfgJDbxWWP5rq4UEeuK
         mzkuJ9RwE+MoyYZyKDTzRbfab2+hcxJP1VlKiSxh/4xZXs8G5hQ2lhJqMTtSHVy6/8mm
         fWAqSh4nkvraOEQcqAoxwyJLVcGf8XhNfW2F8hBTo2ELMRJyQHZOWzhnQyi5XaooQDUZ
         0UsZq6VXCIwv8bY7lIYDNjOmQf6H1r7m4a0HWvOL4K/Mx8GCLyZKEA+O9irkjhxkTsxB
         nfAZ1HJ3+y5FSYIfLiqrs+v6HSJe2bdrHEiTP8+IEPZ5XebVFJiMYQ4FsGDOYkOkrtC6
         +/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470699; x=1796075499;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Hs8rCyGsw/DQ1uI+RqDlzXciGD3XvAd/zH1v+QjQxE=;
        b=f+wc1B1ENwOMp7q41Xf3FCB0sosGihwmaylVWdybgWROge7PDrXQnzI7YJbH/NfuCE
         WmkPmQNdj2AiHtf7t55tmectl7K4f0d4OE/+2s1QBsgdQSLifgdIoIZUDv+yhWxEVks0
         0Pyo9ST/gPYTU/cSS8JaBgN/tmQ38x+BFAjvPHPvsbwwrIbLeFe6ubhasi4xZPdi27sw
         tKbUELaRKXJ/i6BWuOaEhGQAoyNMwugZkflJM1JgmMgUam00kHDespELZCa4kIbRm0vc
         NlephoYStvsZlK6z2PaNDjetZjzKf1O33rD0wq9VV8K1O8TY/0t4Tb1ommdI/DUbIddF
         EEcg==
X-Forwarded-Encrypted: i=1; AL+hErH3GMARBk3Jirl/tUiZY21nSXnjIA9aS5OYWOGtAykmovHGTMikyE74Bk22wabaVff4cDU26XBTT23BhUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3Nim+pR0GJmAh4NZKqK8618VHez/bCqv+2afkh6N+w448os2W
	8FbVVyJpJLtUPTbxIFPmNdiWq+d2ljatZDl2O7mhr2qPyOhZd47Lj7BfWvPy7BpKYg==
X-Gm-Gg: AZFdTZeQcNE4FtYAirbWszDAg6/7ofuNOkqsNViB4rrGiUBJe0TpOQvy+cwqEvB9E/H
	Rjj59ipR/TMBfENXEgTBZtkF9RwD3KEzLKZbCzyfwlFYJep14kk6MRBs+wiaZnNFXOhjFfC6zX7
	F0X4FUVOoV1J8gsSxhhKBbcvBCbmzDaIIAzkTY0pKClWRTQQwaMO5ZTcTecX9yd11PiffQ9ODYi
	03RJ2TxMjs/skAakedcrAFDe5xFoc5kenttlV8jJb8eTWbNHLppkjDD56Q0+x5mYdDnueqIGow9
	z+5N8pTHZmDhMQiUdRlONogikQs9koOg5jeKFV5W+jXUPOX16DOj/KjjTxu4h5gndmaQBswJ8zB
	C0/IYUFnA3DqQA5u3Y19FAKwup4veJBzFDidg/1i9NSOfxYzc9V2V+aZx4mC8UlTOa+R2RASFZ2
	Tcp7h7LOGo130CPpQ3eEJiQoVdoyt3QalLuxTIRUw4Qlc2+x/xE7zWQjjvEY+8YfGQKiOADR0qu
	4m4N/aR2tg//Y0zLpRTkBJxiIALekzvjsuxvcoAFp9L748SXUEuMqngR2vcYEC6FM8qG6dHIXlr
	3AFkrK5t1XGFNLfVTuQQjhRqJyG86Qf9eKroWQC3bO6yaDQLtmj7J9L/lo7hH/LWi1yRAKjpW0w
	=
X-Received: by 2002:a05:600c:1c08:b0:4bb:7757:fe6d with SMTP id 5b1f17b1804b1-4bb88804c5fmr321884935e9.11.1795470698614;
        Mon, 23 Nov 2026 13:51:38 -0800 (PST)
Received: from elver.google.com (124.100.205.35.bc.googleusercontent.com. [35.205.100.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm24254809f8f.49.2026.11.23.13.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:51:37 -0800 (PST)
Date: Mon, 23 Nov 2026 21:51:33 +0000
From: Marco Elver <elver@google.com>
To: syzbot <syzbot+00f5a4ef4bcb8f4d19f1@syzkaller.appspotmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, horms@kernel.org,
	jhs@mojatatu.com, jiri@resnulli.us, kuba@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] KCSAN: data-race in fq_pie_reset /
 pie_calculate_probability
Message-ID: <awS1ZXUKIPtEd4J-@elver.google.com>
References: <6b04828d.71deaa98.2984e6.000b.GAE@google.com>
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
In-Reply-To: <6b04828d.71deaa98.2984e6.000b.GAE@google.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Mon, Nov 23, 2026 at 10:14AM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    b6a9fa34ce41 Linux 7.4-rc4
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=118e58e9580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=886d2ddd2d6b664e
> dashboard link: https://syzkaller.appspot.com/bug?extid=00f5a4ef4bcb8f4d19f1
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/1cd533522ae8/disk-b6a9fa34.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/19d6c1c369e3/vmlinux-b6a9fa34.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/dfb541770724/bzImage-b6a9fa34.xz
> 
> AI-generated root cause summary:
> During qdisc teardown in `dev_shutdown()` -> `qdisc_put()` ->
> `__qdisc_destroy()`, `qdisc_reset()` calls `fq_pie_reset()` without holding any
> qdisc lock and before `fq_pie_destroy()` stops `q->adapt_timer`. Moreover,
> `shutdown_scheduler_queue()` has already replaced `dev_queue->qdisc_sleeping`
> with `&noop_qdisc`, so `fq_pie_timer()`'s call to
> `qdisc_lock(qdisc_root_sleeping(sch))` acquires `noop_qdisc`'s lock rather than
> `sch`'s lock. As a result, `fq_pie_timer()` -> `pie_calculate_probability()`
> runs concurrently with `fq_pie_reset()`, racing on `pie_vars_init()` writes to
> `flow->vars` (specifically `vars->accu_prob` and `vars->avg_dq_rate`).
> 
> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=00f5a4ef4bcb8f4d19f1

|  CPU0 (kworker: cleanup_net)              CPU1 (timer softirq)
|
|                                           fq_pie_timer()
|                                             // dev_queue->qdisc_sleeping is
|                                             &noop_qdisc
|                                             spin_lock(&noop_qdisc.q.lock)
|                                             pie_calculate_probability()
|                                               if (vars->avg_dq_rate > 0) // reads > 0
|  dev_shutdown()
|    qdisc_put()
|      __qdisc_destroy()
|        qdisc_reset()
|          fq_pie_reset()
|            pie_vars_init(&flow->vars)
|              WRITE_ONCE(vars->avg_dq_rate, 0)
|                                               // reloads vars->avg_dq_rate == 0
|                                               qdelay = (backlog << PIE_SCALE) / vars->avg_dq_rate;
|                                               // -> Divide-by-zero (#DE) crash!

> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+00f5a4ef4bcb8f4d19f1@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KCSAN: data-race in fq_pie_reset / pie_calculate_probability
> 
> write to 0xffff88811d293640 of 8 bytes by task 13 on cpu 1:
>  pie_vars_init include/net/pie.h:103 [inline]
>  fq_pie_reset+0x11e/0x1d0 net/sched/sch_fq_pie.c:552
>  qdisc_reset+0x51/0x2e0 net/sched/sch_generic.c:1118
>  __qdisc_destroy+0x60/0x220 net/sched/sch_generic.c:1157
>  qdisc_put net/sched/sch_generic.c:1189 [inline]
>  dev_shutdown+0x2e0/0x390 net/sched/sch_generic.c:1558
>  unregister_netdevice_many_notify+0x999/0x15e0 net/core/dev.c:12761
>  unregister_netdevice_many+0x19/0x20 net/core/dev.c:12845
>  ops_exit_rtnl_list net/core/net_namespace.c:188 [inline]
>  ops_undo_list+0x21d/0x410 net/core/net_namespace.c:249
>  cleanup_net+0x38d/0x5e0 net/core/net_namespace.c:713
>  process_one_work kernel/workqueue.c:3495 [inline]
>  process_scheduled_works+0x582/0xab0 kernel/workqueue.c:3578
>  worker_thread+0x56c/0x770 kernel/workqueue.c:3659
>  kthread+0x248/0x2a0 kernel/kthread.c:436
>  ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> write to 0xffff88811d293640 of 8 bytes by interrupt on cpu 0:
>  pie_vars_init include/net/pie.h:103 [inline]
>  pie_calculate_probability+0x425/0x4c0 net/sched/sch_pie.c:417
>  fq_pie_timer+0xf6/0x1d0 net/sched/sch_fq_pie.c:403
>  call_timer_fn+0x36/0x280 kernel/time/timer.c:1749
>  expire_timers kernel/time/timer.c:1800 [inline]
>  __run_timers kernel/time/timer.c:2375 [inline]
>  __run_timer_base+0x40c/0x610 kernel/time/timer.c:2387
>  run_timer_base kernel/time/timer.c:2396 [inline]
>  run_timer_softirq+0x31/0x70 kernel/time/timer.c:2406
>  handle_softirqs+0x109/0x310 kernel/softirq.c:669
>  __do_softirq kernel/softirq.c:703 [inline]
>  invoke_softirq kernel/softirq.c:542 [inline]
>  __irq_exit_rcu+0x40/0xf0 kernel/softirq.c:786
>  instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
>  sysvec_apic_timer_interrupt+0x74/0x80 arch/x86/kernel/apic/apic.c:1062
>  asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
>  __preempt_count_dec_and_test arch/x86/include/asm/preempt.h:123 [inline]
>  __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:211 [inline]
>  _raw_spin_unlock_irqrestore+0x1a/0x30 kernel/locking/spinlock.c:221
>  free_frozen_page_commit+0x223/0x3a0 mm/page_alloc.c:2909
>  free_unref_folios+0x8c0/0x980 mm/page_alloc.c:3099
>  folios_put_refs+0x2cd/0x320 mm/folio.c:1065
>  folios_put include/linux/mm.h:2429 [inline]
>  __folio_batch_release+0x8e/0xb0 mm/folio.c:1125
>  folio_batch_release include/linux/folio_batch.h:101 [inline]
>  truncate_inode_pages_range+0x287/0x780 mm/truncate.c:452
>  truncate_inode_pages mm/truncate.c:530 [inline]
>  truncate_inode_pages_final+0x68/0x80 mm/truncate.c:565
>  ext4_evict_inode+0x459/0xea0 fs/ext4/inode.c:273
>  evict+0x301/0x570 fs/inode.c:829
>  iput_final fs/inode.c:2036 [inline]
>  iput+0x44f/0x5d0 fs/inode.c:2085
>  dentry_unlink_inode+0x29a/0x2b0 fs/dcache.c:510
>  dentry_kill+0x135/0x4f0 fs/dcache.c:857
>  finish_dput+0x16/0x1d0 fs/dcache.c:1032
>  dput+0x43/0x50 fs/dcache.c:1073
>  __fput+0x45c/0x660 fs/file_table.c:520
>  ____fput+0x1c/0x30 fs/file_table.c:541
>  task_work_run+0x145/0x1a0 kernel/task_work.c:233
>  exit_task_work include/linux/task_work.h:40 [inline]
>  do_exit+0x4a7/0x1530 kernel/exit.c:980
>  do_group_exit+0xfe/0x140 kernel/exit.c:1123
>  get_signal+0xc49/0xd30 kernel/signal.c:3113
>  arch_do_signal_or_restart+0x96/0x480 arch/x86/kernel/signal.c:337
>  __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
>  exit_to_user_mode_loop+0x161/0x940 kernel/entry/common.c:101
>  __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
>  syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
>  syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
>  do_syscall_64+0x23b/0x3a0 arch/x86/entry/syscall_64.c:107
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 0 UID: 0 PID: 6734 Comm: syz.1.1114 Not tainted syzkaller #0 PREEMPT(lazy) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
> ==================================================================
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 
> -- 
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller-bugs/6b04828d.71deaa98.2984e6.000b.GAE%40google.com.
