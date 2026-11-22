Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795315659;
	b=IFUdIzkD5OKKymyeCUyzKnRUUIWzeWGo2pwgNJPuQPws9bZbQeDfH/tllCQKzECbyaym
	 F3YrMk4q0BU6cYX8uaciF9MN33sPZ5mUj6W6s8rryY8n9ODLwgnCWhRUOilaL1m9jah+v
	 IolhNAn2zDmXpac0PpbhXj51bvtTrODo/uYJU/V3AZ9O8IeRjJyh4NZAfVyW2ALJjRBF/
	 xFUCjVtj+SD5kRk4DT5YUYcsQDE/KhLf2FNZahnJyugCI+1JPSBdKTUInK402PDQaAO3r
	 un4Ck4hJsxWmSJyEXF/68QmmdAWdAQiTXLRY/0G5INBgrKTYhquE2/T8YaxlxU6VmYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795315659;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=lL/THoILJiW6pgxs4ubqmloSb9umCQCZoio7Gq7Xgjs=;
	b=JZ3fRQ1RWOa00adT2baG5gb1FNgoOQQa3KPuFYGVBV8Evbpc/qy5N6OKb68bM+1e8Sx/
	 DHBh4yVUPy+KsuwJYoNT25APMs3V5GFqSV4IRPygFW724sFmVIGkaUDUmSoALkYg7EJvC
	 +i9G7wahv6UHlaiHWYMVP/A6sCRHtqCWaPXB50tSQBpK4/uzohA1juhRZkkFONrl0Ga2I
	 KKGsMLHHZB+KW9SZ+CtuNeS3XZCY6r8hCtjCsnJz2PpdKitin7GoopGIjvM4j4aYBLTKL
	 3WVaeW0UZFpwQomgzph3A5vSkaoc9mHu59ZUeC/rsMqJ0BwZF0WHf/P+h/ibjXAk5Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6969A606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6969A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4dab94dc3e7so5353052b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795315658; x=1795920458;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lL/THoILJiW6pgxs4ubqmloSb9umCQCZoio7Gq7Xgjs=;
        b=0NUmVy593IvT9E1LczELJamDdjZN5FNWXcoJCJU82s9Jaja3xOk5bcdt4Y6ap5CCr8
         e4P20zCxxp7O1ownIcld62+4K9MSOd0/EgniQYJtJadRZBlfJGn9vsImMYzV2aeAwHln
         VhIMa+eCReDQWAJY7BZZy2r8Nn+M362RPqjiw2ZEc3Orykvul5MPDAoczMQHJsXy16ON
         fLCODpE8bmbDBzOsUh920k9WNEzruUpyuPl8vCBuWQ/5s09dw9XBrnCQQdAXvUSSWkHD
         OMA+BWPuI0HGTu6D61Mbixz+43wf4LTb6g5WfxqwSXoGF1L+aSZTSRhMFP80xfu4Oezk
         oZrQ==
X-Forwarded-Encrypted: i=1; AL+hErHv7EX8rXIqxpDmdhKBpOxq+GlymDgd4p+BWcsM6fCqQAmaXVxDjZgIxM/0bh2lmlITIDW65RiOsCy0YJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XJh/deY+uhdWgnYsLuKn6vp9HucKEFxDpZ+B6UtwbLXvGgfNS
	8KdnXqK4TUna/PA8r3kZgqdFWZair5DpgMHK7HEste0148eb91d37RMZ9/aW6ugn11qTqNylGmE
	gBzcmp0FE3H6x6VeRAv7WAbx4/vaYwzTY6q3n6+0fKmE8kwf3fVGWu00b/1g=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1711:b0:568:e5f:5dbe with SMTP id
 5614622812f47-57a0d0ee5b6mr8092694b6e.61.1795315658438; Sat, 21 Nov 2026
 18:47:38 -0800 (PST)
Date: Sat, 21 Nov 2026 18:47:38 -0800
In-Reply-To: <6b007186.91c4c7f9.2424d6.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b0257ca.6ccd1e40.868ea.001a.GAE@google.com>
Subject: Re: [syzbot] [ocfs2?] possible deadlock in shrinker_free
From: syzbot <syzbot+38fdbb551940270021f1@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, heming.zhao@suse.com, jlbec@evilplan.org, 
	joseph.qi@linux.alibaba.com, linux-kernel@vger.kernel.org, mark@fasheh.com, 
	ocfs2-devel@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	zzzccc427@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    f802b6558eb8 Merge tag 'xfs-fixes-7.4-rc4' of git://git.ke..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=141d98e9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3cc6a7ee2d24d208
dashboard link: https://syzkaller.appspot.com/bug?extid=38fdbb551940270021f1
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10918a03580000

The issue was bisected by AI to:

commit f277230d002d03ed98b814b735f9d3d01b42020a
Author: Cen Zhang <zzzccc427@gmail.com>
Date:   Fri Oct 30 04:48:56 2026 +0000

    ocfs2: serialize inode journal access with shutdown

AI reasoning:   https://syzkaller.appspot.com/ai_job?id=0e68af1a-9a2b-4aad-b8ed-125ab8c4ed0a

AI-generated root cause summary:
ocfs2_journal_shutdown() holds down_write(&osb->journal_shutdown_sem) across
jbd2_journal_destroy(), which invokes shrinker_free() and acquires
shrinker_mutex, establishing &osb->journal_shutdown_sem -> shrinker_mutex.
Meanwhile, shrinker_mutex is held across GFP_KERNEL allocations (e.g.,
alloc_shrinker_info()), establishing shrinker_mutex -> fs_reclaim, and memory
reclaim can reach ocfs2_evict_inode() / ocfs2_clear_inode() via
super_cache_scan() and acquire down_read(&osb->journal_shutdown_sem),
establishing fs_reclaim -> &osb->journal_shutdown_sem. Lockdep reports this
3-lock cycle as a circular locking dependency because it does not track the
mutual exclusion provided by sb->s_umount via super_trylock_shared().

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=38fdbb551940270021f1

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+38fdbb551940270021f1@syzkaller.appspotmail.com

The cause commit was identified by AI and may be wrong.
If you agree with it, please also add:
Fixes: f277230d002d ("ocfs2: serialize inode journal access with shutdown")

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz-executor875/5689 is trying to acquire lock:
ffffffff902617a0 (shrinker_mutex){+.+.}-{4:4}, at: shrinker_free+0xdb/0x3b0 mm/shrinker.c:809

but task is already holding lock:
ffff8880421282f8 (&osb->journal_shutdown_sem){++++}-{4:4}, at: ocfs2_journal_shutdown+0x4ec/0xb40 fs/ocfs2/journal.c:1122

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&osb->journal_shutdown_sem){++++}-{4:4}:
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
       shrink_slab_memcg mm/shrinker.c:569 [inline]
       shrink_slab+0x838/0x1210 mm/shrinker.c:647
       shrink_one+0x396/0x10f0 mm/vmscan.c:5320
       shrink_many mm/vmscan.c:5381 [inline]
       lru_gen_shrink_node mm/vmscan.c:5459 [inline]
       shrink_node+0x631e/0x6c50 mm/vmscan.c:6465
       __node_reclaim+0x2f4/0xa10 mm/vmscan.c:8012
       user_proactive_reclaim+0x699/0x8d0 mm/vmscan.c:8202
       reclaim_store+0x69/0xb0 mm/vmscan.c:8268
       kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
       new_sync_write fs/read_write.c:575 [inline]
       vfs_write+0x612/0xba0 fs/read_write.c:667
       ksys_write+0x150/0x270 fs/read_write.c:719
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (fs_reclaim){+.+.}-{0:0}:
       __fs_reclaim_acquire mm/page_alloc.c:4388 [inline]
       fs_reclaim_acquire+0x71/0x100 mm/page_alloc.c:4402
       might_alloc include/linux/sched/mm.h:316 [inline]
       slab_pre_alloc_hook mm/slub.c:4673 [inline]
       slab_alloc_node mm/slub.c:5011 [inline]
       __do_kmalloc_node mm/slub.c:5530 [inline]
       __kvmalloc_node_noprof+0x134/0x820 mm/slub.c:7143
       alloc_shrinker_info+0xe9/0x400 mm/shrinker.c:101
       mem_cgroup_css_online+0x84/0x7b0 mm/memcontrol.c:4396
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

-> #0 (shrinker_mutex){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3209 [inline]
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
       lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       shrinker_free+0xdb/0x3b0 mm/shrinker.c:809
       jbd2_journal_destroy+0x606/0x7e0 fs/jbd2/journal.c:2178
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

other info that might help us debug this:

Chain exists of:
  shrinker_mutex --> fs_reclaim --> &osb->journal_shutdown_sem

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&osb->journal_shutdown_sem);
                               lock(fs_reclaim);
                               lock(&osb->journal_shutdown_sem);
  lock(shrinker_mutex);

 *** DEADLOCK ***

locks held by syz-executor875/5689: 2, on CPU#0:
 #0: ffff88804f39a100 (&type->s_umount_key#56){++++}-{4:4}, at: __super_lock fs/super.c:60 [inline]
 #0: ffff88804f39a100 (&type->s_umount_key#56){++++}-{4:4}, at: __super_lock_excl fs/super.c:75 [inline]
 #0: ffff88804f39a100 (&type->s_umount_key#56){++++}-{4:4}, at: deactivate_super+0xac/0xe0 fs/super.c:585
 #1: ffff8880421282f8 (&osb->journal_shutdown_sem){++++}-{4:4}, at: ocfs2_journal_shutdown+0x4ec/0xb40 fs/ocfs2/journal.c:1122

stack backtrace:
CPU: 0 UID: 0 PID: 5689 Comm: syz-executor875 Not tainted syzkaller #0 PREEMPT(full) 
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
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
 shrinker_free+0xdb/0x3b0 mm/shrinker.c:809
 jbd2_journal_destroy+0x606/0x7e0 fs/jbd2/journal.c:2178
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
RIP: 0033:0x7ff9dea5b657
Code: a2 c7 05 24 da 09 00 00 00 00 00 eb 96 e8 51 09 00 00 90 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 d8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007fff91194d68 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007fff91195610 RCX: 00007ff9dea5b657
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007ff9deac527a
RBP: 00007fff91195210 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000f1aea66
R13: 00007ff9deac527a R14: 00007ff9deac52fe R15: 00005555828d9760
 </TASK>
ocfs2: Unmounting device (7,0) on (node local)
