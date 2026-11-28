Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795836452;
	b=NfOZRokpoC/SRML6yr6N+e3c9agaPUQh+S5A894RhwqkybVYSI6qnVb7aROU+HlwgmN9
	 txZ5bBuZVrI4pGSH2VJFkr3kKtotDChq1/+rTee0X8/Z9KP1rqwIln8cR2FUWN9wpM5UP
	 e8wnnH/YH/neuOueTfP9cW3inwJFMLOriIHny94P1BN6A0SnKbjMR8+7/XiQx6nu4Kc8j
	 aJiXao0m3koAd2MCNB1tU/JIgeO2J6ze/UqsUxGe/UIYvO7qwZssV2XBzvdgJw2RKPzmt
	 2YMDsmt4bsHXHCS0TrZiUjQ3i+jw9D4o+hLIJ1BaD4FIPAqm7Ic3siB63lYvN/dBGag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795836452;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=V6yd2WiMQDnkgmWaLVy9/F+hOxiOeH3B2t22ru+0YjE=;
	b=s8t5iWboWAJhwUkYVz82ZZ2g4VG+cCaBb3ulHNySKc97RqlYsRZSaKvNy095cbnlJPPf
	 E244bUhhZRHwmvuyjZxVX5wto2F3SdzNDSjIjd+gyu5u3JL1L51mXXrWSxJhCNS03kUSc
	 QqEclv903yWABSnsjAPAS9slE8lu76umI1EB6ldY+kg4J53WlMi5iVdaoO9xgZwKrW14X
	 XMQqrGo8pxtsNdXF8xgUOEodd/DQoEqtlnpnJQUdHo0+eP2NPmdhE1OPMPlH0JnoCBQbF
	 3D27mvNq1m+/zJ+jOBnVfoBT0W/VkT6bf/3QArJ3slyjANh433Z3tdpooutDDCVaxaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD61606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BD61606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4e778acdbc6so10037290b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:27:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795836451; x=1796441251;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V6yd2WiMQDnkgmWaLVy9/F+hOxiOeH3B2t22ru+0YjE=;
        b=yH9FpHyaEAnyW75OUh902aH3HiG9ApIDVQv1UL7lV04NFzGUaR+UO8517Q79JtEt2n
         zfwLL2q9xvpvTGOvS8yHjmavgBgyk8nPqc73FrAcX/uiCE9XvuunpjMoA/lSyp9TgbW4
         adIOU8GMgB0DIUTfHtPrkzPhX9158OMNkn3JIunDKSDYumN+02mka5H7HS31HWeXmVf4
         Nm09zTrq33QchDxf3qMrfF3SGyYz0kDAMWU0WGaKdEB2ceHEO9ldhUAgLLmY73VYaHLk
         U/kftiecLLD8pg719YJIdjqoCHgusyrBEQDVrSBb4J2TUQ4p8Ky5SkEvs5wWz84pew80
         Luqw==
X-Forwarded-Encrypted: i=1; AL+hErFLfdgDw+IElkiT5wJucEWQJ7cpDOG+P4d5/4jk+ace6YW3uZ4F/v0OWk1h/Vj0ID16hWb5mVxY5CYSssc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ocySihkL/33DLVFA1ep1/NvD7DcxokcYu+U+pcC33JcwzBIxW
	cJT3zzl5QT4ereS7rQGr8gUOa5zD1CdR5WRXdFe6/dIvYdJnSXjnVWJ9EEAkFvbocQ0xHGkPbGW
	MiyyEA184xPf+hnPQjFSMPLp9ET4kLZyAEDT9O6qelzLia38dC7XVzxPkKnk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1394:b0:510:7dc8:5ff7 with SMTP id
 5614622812f47-57a0a40536cmr30024229b6e.19.1795836451226; Fri, 27 Nov 2026
 19:27:31 -0800 (PST)
Date: Fri, 27 Nov 2026 19:27:31 -0800
In-Reply-To: <6b08920a.28411dd9.2968b4.000b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b0a4a23.8ccee5ca.1045fd.0285.GAE@google.com>
Subject: Re: [syzbot] [mm?] possible deadlock in ocfs2_evict_inode (3)
From: syzbot <syzbot+00969d07ff718daa64c0@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, david@fromorbit.com, 
	joseph.qi@linux.alibaba.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	muchun.song@linux.dev, qi.zheng@linux.dev, roman.gushchin@linux.dev, 
	syzkaller-bugs@googlegroups.com, zzzccc427@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    822ba3a89c78 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1126c1d9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fbd0fc734eea62ed
dashboard link: https://syzkaller.appspot.com/bug?extid=00969d07ff718daa64c0
compiler:       Debian clang version 22.1.8 (1~deb13u5), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1326c1d9580000

The issue was bisected by AI to:

commit f277230d002d03ed98b814b735f9d3d01b42020a
Author: Cen Zhang <zzzccc427@gmail.com>
Date:   Fri Oct 30 04:48:56 2026 +0000

    ocfs2: serialize inode journal access with shutdown

reasoning:      https://syzkaller.appspot.com/ai_job?id=b27b6c0b-8dab-4c8c-85e0-28d030057ea0

AI-generated root cause summary:
ocfs2_journal_shutdown() holds down_write(&osb->journal_shutdown_sem) across
jbd2_journal_destroy(), which invokes shrinker_free() and acquires the global
shrinker_mutex. Because mm/shrinker.c acquires shrinker_mutex across GFP_KERNEL
allocations (establishing shrinker_mutex -> fs_reclaim), while
ocfs2_clear_inode() acquires down_read(&osb->journal_shutdown_sem) during inode
eviction reachable from memory reclaim (fs_reclaim ->
&osb->journal_shutdown_sem), lockdep detects a circular locking dependency
(&osb->journal_shutdown_sem -> shrinker_mutex -> fs_reclaim ->
&osb->journal_shutdown_sem).

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=00969d07ff718daa64c0

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+00969d07ff718daa64c0@syzkaller.appspotmail.com

The bisection result may be wrong.
If you agree with it, please also add:
Fixes: f277230d002d ("ocfs2: serialize inode journal access with shutdown")

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
kswapd0/84 is trying to acquire lock:
ffff8880434b82f8 (&osb->journal_shutdown_sem){++++}-{4:4}, at: ocfs2_clear_inode fs/ocfs2/inode.c:1326 [inline]
ffff8880434b82f8 (&osb->journal_shutdown_sem){++++}-{4:4}, at: ocfs2_evict_inode+0x2dd8/0x43c0 fs/ocfs2/inode.c:1343

but task is already holding lock:
ffffffff90297e80 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat mm/vmscan.c:7339 [inline]
ffffffff90297e80 (fs_reclaim){+.+.}-{0:0}, at: kswapd+0xa53/0x3a20 mm/vmscan.c:7712

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (fs_reclaim){+.+.}-{0:0}:
       __fs_reclaim_acquire mm/page_alloc.c:4388 [inline]
       fs_reclaim_acquire+0x71/0x100 mm/page_alloc.c:4402
       might_alloc include/linux/sched/mm.h:316 [inline]
       slab_pre_alloc_hook mm/slub.c:4673 [inline]
       slab_alloc_node mm/slub.c:5011 [inline]
       __do_kmalloc_node mm/slub.c:5530 [inline]
       __kvmalloc_node_noprof+0x134/0x820 mm/slub.c:7143
       alloc_shrinker_info+0xe9/0x400 mm/shrinker.c:101
       mem_cgroup_css_online+0x84/0x7b0 mm/memcontrol.c:4404
       online_css+0xbf/0x310 kernel/cgroup/cgroup.c:5903
       css_create kernel/cgroup/cgroup.c:5983 [inline]
       cgroup_apply_control_enable+0x9ed/0xda0 kernel/cgroup/cgroup.c:3474
       cgroup_mkdir+0x1220/0x14b0 kernel/cgroup/cgroup.c:6188
       kernfs_iop_mkdir+0x213/0x360 fs/kernfs/dir.c:1304
       vfs_mkdir+0x411/0x660 fs/namei.c:5428
       filename_mkdirat+0x284/0x550 fs/namei.c:5461
       __do_sys_mkdirat fs/namei.c:5482 [inline]
       __se_sys_mkdirat+0x35/0x150 fs/namei.c:5479
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (shrinker_mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       shrinker_free+0xdb/0x3b0 mm/shrinker.c:809
       jbd2_journal_destroy+0x606/0x7e0 fs/jbd2/journal.c:2204
       ocfs2_journal_shutdown+0x517/0xb40 fs/ocfs2/journal.c:1125
       ocfs2_dismount_volume+0x3c9/0x860 fs/ocfs2/super.c:1874
       generic_shutdown_super+0x140/0x2d0 fs/super.c:723
       kill_block_super+0x44/0xa0 fs/super.c:1852
       deactivate_locked_super+0xbe/0x110 fs/super.c:558
       cleanup_mnt+0x204/0x2a0 fs/namespace.c:1396
       task_work_run+0x1d9/0x260 kernel/task_work.c:233
       resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
       __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
       exit_to_user_mode_loop+0x204/0x770 kernel/entry/common.c:101
       __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
       syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
       syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
       do_syscall_64+0x336/0x540 arch/x86/entry/syscall_64.c:107
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&osb->journal_shutdown_sem){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3209 [inline]
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
       lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
       down_read+0x45/0x320 kernel/locking/rwsem.c:1574
       ocfs2_clear_inode fs/ocfs2/inode.c:1326 [inline]
       ocfs2_evict_inode+0x2dd8/0x43c0 fs/ocfs2/inode.c:1343
       evict+0x6bf/0xc20 fs/inode.c:829
       ocfs2_dentry_iput+0x24d/0x390 fs/ocfs2/dcache.c:407
       dentry_kill+0x1b9/0x910 fs/dcache.c:857
       shrink_kill fs/dcache.c:1317 [inline]
       shrink_dentry_list+0x209/0x310 fs/dcache.c:1334
       prune_dcache_sb+0x119/0x180 fs/dcache.c:1416
       super_cache_scan+0x362/0x4a0 fs/super.c:225
       do_shrink_slab+0x6d0/0x10d0 mm/shrinker.c:452
       shrink_slab+0xea4/0x1210 mm/shrinker.c:683
       shrink_one+0x396/0x10f0 mm/vmscan.c:5327
       shrink_many mm/vmscan.c:5388 [inline]
       lru_gen_shrink_node mm/vmscan.c:5466 [inline]
       shrink_node+0x631e/0x6c50 mm/vmscan.c:6472
       kswapd_shrink_node mm/vmscan.c:7265 [inline]
       balance_pgdat mm/vmscan.c:7436 [inline]
       kswapd+0x1ff4/0x3a20 mm/vmscan.c:7712
       kthread+0x38b/0x480 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

other info that might help us debug this:

Chain exists of:
  &osb->journal_shutdown_sem --> shrinker_mutex --> fs_reclaim

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(fs_reclaim);
                               lock(shrinker_mutex);
                               lock(fs_reclaim);
  rlock(&osb->journal_shutdown_sem);

 *** DEADLOCK ***

locks held by kswapd0/84: 2, on CPU#0:
 #0: ffffffff90297e80 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat mm/vmscan.c:7339 [inline]
 #0: ffffffff90297e80 (fs_reclaim){+.+.}-{0:0}, at: kswapd+0xa53/0x3a20 mm/vmscan.c:7712
 #1: ffff888014a04100 (&type->s_umount_key#56){++++}-{4:4}, at: super_trylock_shared fs/super.c:642 [inline]
 #1: ffff888014a04100 (&type->s_umount_key#56){++++}-{4:4}, at: super_cache_scan+0x94/0x4a0 fs/super.c:200

stack backtrace:
CPU: 0 UID: 0 PID: 84 Comm: kswapd0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e2/0x300 kernel/locking/lockdep.c:2087
 check_noncircular+0x12f/0x150 kernel/locking/lockdep.c:2219
 check_prev_add kernel/locking/lockdep.c:3209 [inline]
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain kernel/locking/lockdep.c:3952 [inline]
 __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
 down_read+0x45/0x320 kernel/locking/rwsem.c:1574
 ocfs2_clear_inode fs/ocfs2/inode.c:1326 [inline]
 ocfs2_evict_inode+0x2dd8/0x43c0 fs/ocfs2/inode.c:1343
 evict+0x6bf/0xc20 fs/inode.c:829
 ocfs2_dentry_iput+0x24d/0x390 fs/ocfs2/dcache.c:407
 dentry_kill+0x1b9/0x910 fs/dcache.c:857
 shrink_kill fs/dcache.c:1317 [inline]
 shrink_dentry_list+0x209/0x310 fs/dcache.c:1334
 prune_dcache_sb+0x119/0x180 fs/dcache.c:1416
 super_cache_scan+0x362/0x4a0 fs/super.c:225
 do_shrink_slab+0x6d0/0x10d0 mm/shrinker.c:452
 shrink_slab+0xea4/0x1210 mm/shrinker.c:683
 shrink_one+0x396/0x10f0 mm/vmscan.c:5327
 shrink_many mm/vmscan.c:5388 [inline]
 lru_gen_shrink_node mm/vmscan.c:5466 [inline]
 shrink_node+0x631e/0x6c50 mm/vmscan.c:6472
 kswapd_shrink_node mm/vmscan.c:7265 [inline]
 balance_pgdat mm/vmscan.c:7436 [inline]
 kswapd+0x1ff4/0x3a20 mm/vmscan.c:7712
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
