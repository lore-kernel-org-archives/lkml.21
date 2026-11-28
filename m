Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795833874;
	b=EHMeoPRY00EPq7Oh3wVuPzzf3bTZcax3fUcLynJU+SG6y5stmd4924q5GreQtYZo6OYK
	 fSI1M9eP40k0eiPpQTuKaAyrzP3i4rgo07DtBWNuAwd/NdQlTKZ5gACAIT10/fNl4gGmU
	 gJlAStzvAxBBTjge/eBuJmqYTPd+CFa+Bf0VhaG0tU+KRitRmyEoceWeHHmmG0WTXIqks
	 5VxzMuxX2o49jWz+9WDoq+q7mWAg4APkq7jSYefDCco1D4M5xxMrWT9AnvD71J4EBkSmx
	 J00XwqZEbmHQLtmprZQoNU6DrLYfAvWW+JiiLf0kF5fbjQaJ2xz1qFaEY6NMUwwaDTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795833874;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=ue2KKjiThCuDjqLS+2LhXvDvD4UnXfjeOEQGTBf2/fU=;
	b=dV79vjYLo+L0EKtrDRXFyxvrxYSA+eskjdiPQOzUIlOm3LARosWuvgxonWp3y9ofQqMJ
	 r1QyElrzTqX/KkVLNHlaoBqYX0CliyKu0h1M/rvNA6YQzK5XLreRyuvtKdCM9BxnI6uLG
	 tzw1k0aeL47YjtfWPPvJwNvyvgMsS8gmI2/0pIerjWOV1OGdRYkrGPSmFDONWG2BxgRF9
	 p5lUxRbeI6LlT6lih368HePpbGHa/HcTyT5Z8y2RAPuUsaLUTGVJDm8OFk/eFM8lzYxOB
	 HLaUlmPiMxcQAMdk56xGgtix5Etkcj5rVsc6qQ4Dm3BZdc1gjbTCnBKEW4HTFPiCeaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864B606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0864B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5384e381fbbso7441079b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795833873; x=1796438673;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ue2KKjiThCuDjqLS+2LhXvDvD4UnXfjeOEQGTBf2/fU=;
        b=0bENTA5kQlceLTVXnLhH6pxLpFB8Fl2KCa6+LabhyaFMbkJTHIh860UYNYM6CUNj5P
         5IUy9+Aw5VbhEe2s7p+5lUy9b1VIoS5i0obzCO1pgdoOEVJx3TErctunZoLL5sM4bnv/
         33crTneHrdSN3GGTuHLSuU1JXf+z0r+mdi7QI/hAePRHsNHCCh36CSjdT+cQ2reMKQRX
         5NpzneLxbFvaoYwuvHdTVv7xhCZQ23VpiIT8oK/ICsjtnh4TDHO60ZYFFipW1u8DC0Vj
         BYX5NFYokUeG4ZGvof2cnyIkPij7C5zLJaMAVVpI7zRr1pZyICGIty+fhzxTeeK91gRz
         Rl9g==
X-Forwarded-Encrypted: i=1; AL+hErH313LDH77cQIuPuV9t1XlXW2/6CQ4lPk65eLRPm/lvE7X2K35hd9zk9jollmz2VLtoN5Epo2mGKuhavbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UQ0tijEivCuP5w8abVELulcRVZlnOAoAAVi0mL0vkJ89mV1+C
	WXkwKiKqWlAMmfk00jql4aX4N8EpGhvb2eN3j3Kr3c5EAaVo5NlOpkHreZUXdtau8sA/aLKWPSJ
	afMhmWMXVxo5iDuczAiux9sDxRXS/fMMSPe9Cuww2Jee6C9jOjZdrgMDduSI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fc9:b0:573:4ad5:7e4d with SMTP id
 5614622812f47-57a0ac2fa3bmr31103941b6e.35.1795833873107; Fri, 27 Nov 2026
 18:44:33 -0800 (PST)
Date: Fri, 27 Nov 2026 18:44:33 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b0a4011.8ccee5ca.1045fd.0282.GAE@google.com>
Subject: [syzbot] [jfs?] KASAN: slab-use-after-free Read in txUnlock (4)
From: syzbot <syzbot+706dff62c3dd6a366ff9@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com, yun.zhou@windriver.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9437ee8b6cf6 Merge tag 'net-7.4-rc5' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11a0a9d9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fbd0fc734eea62ed
dashboard link: https://syzkaller.appspot.com/bug?extid=706dff62c3dd6a366ff9
compiler:       Debian clang version 22.1.8 (1~deb13u5), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98fce4d0b21b/non_bootable_disk-9437ee8b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/46d14ac9bcfb/vmlinux-9437ee8b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/42455feaffed/bzImage-9437ee8b.xz

AI-generated root cause summary:
In `fs/jfs/jfs_txnmgr.c`, `txAbort()` iterates over all `tlock`s of an aborted
transaction and calls `LogSyncRelease(mp)` (which decrements `mp->nohomeok`)
whenever `tlck->mp` is a `COMMIT_PAGE` metapage with `mp->lsn != 0`, without
filtering out `tlckBTROOT` locks. During `txCommit()`, `diWrite()` in
`fs/jfs/jfs_imap.c` rebinds inline B+-tree root locks (`jfs_ip->xtlid` and
`jfs_ip->blid`, marked `tlckBTROOT`) to the on-disk inode-extent metapage `mp`
without incrementing `mp->nohomeok`. When a transaction aborts after `diWrite()`
succeeds on one inode in `cd.iplist` and fails on a subsequent inode (e.g., due
to an I/O read error) while `mp` also has `mp->lsn != 0` from an earlier pending
lazy transaction, `txAbort()` over-decrements `mp->nohomeok` to 0. This allows
writeback and memory reclaim (`metapage_release_folio()`) to free `mp` before
the earlier lazy transaction runs `txUnlock()`, resulting in a
slab-use-after-free in `jfsCommit`.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=706dff62c3dd6a366ff9

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+706dff62c3dd6a366ff9@syzkaller.appspotmail.com

Read error 10 at 0x4000
read_mapping_page failed!
Read error 10 at 0x4000
read_mapping_page failed!
Read error 10 at 0x4000
read_mapping_page failed!
==================================================================
BUG: KASAN: slab-use-after-free in txUnlock+0x951/0xde0 fs/jfs/jfs_txnmgr.c:927
Read of size 2 at addr ffff888033cf69b0 by task jfsCommit/117

CPU: 0 UID: 0 PID: 117 Comm: jfsCommit Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 txUnlock+0x951/0xde0 fs/jfs/jfs_txnmgr.c:927
 txLazyCommit fs/jfs/jfs_txnmgr.c:2684 [inline]
 jfs_lazycommit+0x59f/0xac0 fs/jfs/jfs_txnmgr.c:2735
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5355:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3f/0x90 mm/kasan/common.c:79
 unpoison_slab_object mm/kasan/common.c:354 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:380
 kasan_slab_alloc include/linux/kasan.h:257 [inline]
 slab_post_alloc_hook mm/slub.c:4720 [inline]
 slab_alloc_node mm/slub.c:5033 [inline]
 kmem_cache_alloc_noprof+0x2b4/0x600 mm/slub.c:5047
 mempool_alloc_noprof+0x1ba/0x2f0 mm/mempool.c:572
 alloc_metapage fs/jfs/jfs_metapage.c:264 [inline]
 __get_metapage+0x4ef/0xee0 fs/jfs/jfs_metapage.c:761
 diNewExt+0xa53/0x3020 fs/jfs/jfs_imap.c:2275
 diAllocExt fs/jfs/jfs_imap.c:1952 [inline]
 diAllocAG+0xbed/0x1de0 fs/jfs/jfs_imap.c:1669
 diAlloc+0x1e2/0x16b0 fs/jfs/jfs_imap.c:1590
 ialloc+0x8c/0x8e0 fs/jfs/jfs_inode.c:56
 jfs_mkdir+0x1dd/0xaf0 fs/jfs/namei.c:226
 vfs_mkdir+0x411/0x660 fs/namei.c:5428
 filename_mkdirat+0x284/0x550 fs/namei.c:5461
 __do_sys_mkdirat fs/namei.c:5482 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5479
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 83:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3f/0x90 mm/kasan/common.c:79
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:599
 poison_slab_object mm/kasan/common.c:267 [inline]
 __kasan_slab_free+0x70/0x90 mm/kasan/common.c:299
 kasan_slab_free include/linux/kasan.h:239 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6637 [inline]
 kmem_cache_free+0x184/0x660 mm/slub.c:6764
 mempool_free+0xec/0x130 mm/mempool.c:717
 free_metapage fs/jfs/jfs_metapage.c:280 [inline]
 metapage_release_folio+0x544/0x6b0 fs/jfs/jfs_metapage.c:637
 shrink_folio_list+0x22e2/0x4e80 mm/vmscan.c:1570
 evict_folios+0x3326/0x4390 mm/vmscan.c:5104
 try_to_shrink_lruvec+0xf22/0x1630 mm/vmscan.c:5278
 shrink_one+0x312/0x10f0 mm/vmscan.c:5325
 shrink_many mm/vmscan.c:5388 [inline]
 lru_gen_shrink_node mm/vmscan.c:5466 [inline]
 shrink_node+0x631e/0x6c50 mm/vmscan.c:6472
 kswapd_shrink_node mm/vmscan.c:7265 [inline]
 balance_pgdat mm/vmscan.c:7436 [inline]
 kswapd+0x1ff4/0x3a20 mm/vmscan.c:7712
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888033cf69b0
 which belongs to the cache jfs_mp of size 184
The buggy address is located 0 bytes inside of
 freed 184-byte region [ffff888033cf69b0, ffff888033cf6a68)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x33cf6
flags: 0x4fff00000000000(node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000000 ffff888033cf4000 dead000000000122 0000000000000000
raw: 0000000000000000 0000000200100010 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 7598019346
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1873
 prep_new_page+0x22/0xb0 mm/page_alloc.c:1881
 get_page_from_freelist+0x22a1/0x22e0 mm/page_alloc.c:3963
 __alloc_frozen_pages_noprof+0x211/0x450 mm/page_alloc.c:5505
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab+0x7d/0x5e0 mm/slub.c:3499
 new_slab mm/slub.c:3550 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7546
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 kmem_cache_alloc_noprof+0x394/0x600 mm/slub.c:5047
 mempool_init_node+0x1f4/0x510 mm/mempool.c:272
 mempool_create_node_noprof+0xb8/0x150 mm/mempool.c:336
 metapage_init+0xed/0x150 fs/jfs/jfs_metapage.c:293
 init_jfs_fs+0xfd/0x4e0 fs/jfs/super.c:969
 do_one_initcall+0x250/0x870 init/main.c:1432
 do_initcall_level+0x10a/0x1a0 init/main.c:1494
 do_initcalls+0x59/0xa0 init/main.c:1510
 kernel_init_freeable+0x29d/0x3e0 init/main.c:1745
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888033cf6880: fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb fb
 ffff888033cf6900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc
>ffff888033cf6980: fc fc fc fc fc fc fa fb fb fb fb fb fb fb fb fb
                                     ^
 ffff888033cf6a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc
 ffff888033cf6a80: fc fc fc fc fc 00 00 00 00 00 00 00 00 00 00 00
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
