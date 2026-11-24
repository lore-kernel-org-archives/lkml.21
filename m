Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795482577;
	b=3Ic2k8cfvpqVgfR5eOOrUMIEnO+4Q6Wt5zZIoninVu4I1c1xS6Ow/+UtLiIpQsyGnxZk
	 KMAF3tJACV4+Wl8tsR5hVYHovYIwM/5wVu8z94tgY8tdcUWvk6gobAmegENiBIUU/qVHl
	 X/iBWht7LUiREz37+O2BKsN237tcvX5xMnufe0J5iW0uOlLvOx7w1EwMDQElEwfc9+vCa
	 7LAnRWBy/ay/g75jp70Yq5uNihvSiEs5eoeW6rL73CvE994U1CIa+tYV9Oc0zaMDxhgRt
	 rVP6OTFWu+o+ku4a4QGRAVlVoi6ZYWxcSyAjk/6pbco8nTyjbVuCg4pwwSyTMBFlVJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795482577;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=S+rk+LA09xBCq5HQJBG8ElFV8Jt85SZfdemsg6HWWr4=;
	b=oGWk7J97SWHOlvgv7mk69jzBVowpBk91K38YRKK1EjxUXMSCtAOiVSMainhwSLgayJu1
	 qe1tzbRkCTMzr58z89MIJPaFY1gpS86Zn9ASitZScB1eqWry/viwLCDEdeJO0TN+DQ4Z/
	 Cr1LxUbUK9MC/GhZXVQLy3ZyQH6rLvm3D/i3Pg8upHXCRwD9meoHw3WKEFPXUv7Pc6zFB
	 0FCCQ3j3jutxFFkb8aGrptC+H35ZhkteHIne6A7Jy57LjqmUcqWpziTIj47JqCTealQxS
	 2SecYoFoXSr99Isw9WfeE1LN8eOOnm/OdF4MFvYW7Vcr8QYhNSuK3CzmP9hnSuTJ0jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29559606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29559606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4db3db8687fso5093394b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795482576; x=1796087376;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+rk+LA09xBCq5HQJBG8ElFV8Jt85SZfdemsg6HWWr4=;
        b=Z9/RmQ18HqkIUP4R4z2Q4+BwAm9BIyjpOdawDQmQRbu4Zyf5ueR7ShUUZmRSd+9JVr
         qrvk2L6H/k233Z29kFHTbOTQEBQcRjLv/Ozm/hLecrPTSFiZI+AidzUV6qUrxbBMhidh
         8FWQNBdNDnwrglbZjdQtuIMMOwKXUGDh0KyU3OVmGAo+t8UuW0xHlOJcR1lWNfzDWFC2
         O5cOXsQWUt0f+NKFfDKTP9L3vGEvBr08OuX8wy5zG062I2gCYaL+DQ+JqfukkItMmgw2
         WIiWqxDMH4CHWziANub9cjxAWPL5IT3ox17kPhopAZSQMYXLB1LqIGXQh5gbZTl4BAhn
         Nn3A==
X-Forwarded-Encrypted: i=1; AL+hErHkPZO8FDswgwA34ctClYudrYzaG8SW74uTQHJuSfK/sQFzMZkynwM3p35poudlvAoc+urEMyQh6H1tkX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xjeHY8ChEQ/7kC50LFPPkEjaYSlEjkJOm2v9cz/wwAwyjc9q+
	cz0tAo57YA+TjrCRC6y6xRiKdPLdTmMRZNhbif2Rs/Jb2qzrOYuLYQcMx0vB0zBGK2d2Z0LL6zH
	VRIj0gaLvAVlaDLgyEHE3+fOtR1DaHJDuYcl3Wowx7buiCoIk4C0//VTYp90=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1d3:b0:571:846e:6f09 with SMTP id
 5614622812f47-57a0a93089dmr13267309b6e.10.1795482576074; Mon, 23 Nov 2026
 17:09:36 -0800 (PST)
Date: Mon, 23 Nov 2026 17:09:36 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b04e3d0.44b41460.34b83f.0035.GAE@google.com>
Subject: [syzbot] [kernfs?] KASAN: slab-use-after-free Read in kernfs_find_ns
From: syzbot <syzbot+8c2fa00c27ecafd148f5@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, jgg@mellanox.com, 
	leonro@mellanox.com, linux-kernel@vger.kernel.org, parav@mellanox.com, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    141b164bbe18 Merge tag 'char-misc-7.4-rc4' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=112cd64d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3cc6a7ee2d24d208
dashboard link: https://syzkaller.appspot.com/bug?extid=8c2fa00c27ecafd148f5
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-141b164b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/478e08a2cc3d/vmlinux-141b164b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/eee52d3e125b/bzImage-141b164b.xz

The issue was bisected by AI to:

commit 4e0f7b9070726a34bbd87a74e407d4cced6d49ab
Author: Parav Pandit <parav@mellanox.com>
Date:   Tue Feb 26 11:56:13 2019 +0000

    RDMA/core: Implement compat device/sysfs tree in net namespace

AI reasoning:   https://syzkaller.appspot.com/ai_job?id=da36c11b-5fc0-4338-84f1-1ee9327b331d

AI-generated root cause summary:
In drivers/infiniband/core/device.c, remove_one_compat_dev() unlocks
device->compat_devs_mutex immediately after erasing the compat device (cdev)
from the xarray, performing device_del(&cdev->dev) outside the lock. When device
unregistration races with network namespace teardown (rdma_dev_exit_net),
rdma_dev_exit_net() calls remove_one_compat_dev(), observes NULL from
xa_erase(), and completes without waiting for device_del() to finish.
Consequently, cleanup_net() frees struct net while device_del() is still
executing, causing device_remove_class_symlinks() -> sysfs_delete_link() ->
kernfs_ns_id() to read ns->ns_id from the freed struct net, triggering a
slab-use-after-free.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=8c2fa00c27ecafd148f5

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8c2fa00c27ecafd148f5@syzkaller.appspotmail.com

The cause commit was identified by AI and may be wrong.
If you agree with it, please also add:
Fixes: 4e0f7b907072 ("RDMA/core: Implement compat device/sysfs tree in net namespace")

smc: removing ib device rxe0
smbdirect: ib_dev[rxe0] removed
==================================================================
BUG: KASAN: slab-use-after-free in kernfs_ns_id fs/kernfs/dir.c:321 [inline]
BUG: KASAN: slab-use-after-free in kernfs_name_hash fs/kernfs/dir.c:334 [inline]
BUG: KASAN: slab-use-after-free in kernfs_find_ns+0x116/0x800 fs/kernfs/dir.c:915
Read of size 8 at addr ffff888038ebd168 by task syz.0.0/5354

CPU: 0 UID: 0 PID: 5354 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 kernfs_ns_id fs/kernfs/dir.c:321 [inline]
 kernfs_name_hash fs/kernfs/dir.c:334 [inline]
 kernfs_find_ns+0x116/0x800 fs/kernfs/dir.c:915
 kernfs_remove_by_name_ns+0x5c/0x140 fs/kernfs/dir.c:1793
 device_remove_class_symlinks+0x178/0x190 drivers/base/core.c:3551
 device_del+0x400/0x8f0 drivers/base/core.c:3953
 remove_one_compat_dev drivers/infiniband/core/device.c:1036 [inline]
 remove_compat_devs drivers/infiniband/core/device.c:1047 [inline]
 disable_device+0x248/0x330 drivers/infiniband/core/device.c:1339
 __ib_unregister_device+0x2c9/0x400 drivers/infiniband/core/device.c:1571
 ib_unregister_device_and_put+0xb8/0xf0 drivers/infiniband/core/device.c:1636
 nldev_dellink+0x3a4/0x440 drivers/infiniband/core/nldev.c:1905
 rdma_nl_rcv_msg drivers/infiniband/core/netlink.c:-1 [inline]
 rdma_nl_rcv_skb drivers/infiniband/core/netlink.c:239 [inline]
 rdma_nl_rcv+0x6ef/0xa40 drivers/infiniband/core/netlink.c:259
 netlink_unicast_kernel net/netlink/af_netlink.c:1336 [inline]
 netlink_unicast+0x8ef/0xa80 net/netlink/af_netlink.c:1362
 netlink_sendmsg+0x7f0/0xb20 net/netlink/af_netlink.c:1921
 sock_sendmsg_nosec+0x14e/0x190 net/socket.c:800
 __sock_sendmsg net/socket.c:818 [inline]
 ____sys_sendmsg+0x49f/0x790 net/socket.c:2713
 ___sys_sendmsg+0x2f8/0x3d0 net/socket.c:2770
 __sys_sendmsg net/socket.c:2802 [inline]
 __do_sys_sendmsg net/socket.c:2807 [inline]
 __se_sys_sendmsg net/socket.c:2805 [inline]
 __x64_sys_sendmsg+0x1b1/0x290 net/socket.c:2805
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7bccda94d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7bcdbfcfe8 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 00007f7bcd026180 RCX: 00007f7bccda94d9
RDX: 0000000000000000 RSI: 0000200000000580 RDI: 0000000000000004
RBP: 00007f7bcce38136 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7bcd026218 R14: 00007f7bcd026180 R15: 00007ffe0b26c528
 </TASK>

Allocated by task 5352:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:351 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:377
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4720 [inline]
 slab_alloc_node mm/slub.c:5033 [inline]
 kmem_cache_alloc_noprof+0x2b4/0x600 mm/slub.c:5047
 net_alloc net/core/net_namespace.c:494 [inline]
 copy_net_ns+0x1de/0x780 net/core/net_namespace.c:571
 create_new_namespaces+0x3f0/0x6b0 kernel/nsproxy.c:132
 unshare_nsproxy_namespaces+0x144/0x190 kernel/nsproxy.c:234
 ksys_unshare+0x532/0x890 kernel/fork.c:3306
 __do_sys_unshare kernel/fork.c:3372 [inline]
 __se_sys_unshare kernel/fork.c:3370 [inline]
 __x64_sys_unshare+0x38/0x50 kernel/fork.c:3370
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 45:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kmem_cache_free+0x182/0x650 mm/slub.c:6757
 net_complete_free net/core/net_namespace.c:530 [inline]
 cleanup_net+0x5e3/0x810 net/core/net_namespace.c:722
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888038ebcf80
 which belongs to the cache net_namespace of size 9920
The buggy address is located 488 bytes inside of
 freed 9920-byte region [ffff888038ebcf80, ffff888038ebf640)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x38eb8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
memcg:ffff888035b4a481
flags: 0x4fff00000000040(head|node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000040 ffff88801dee6000 dead000000000122 0000000000000000
raw: 0000000000000000 0000000200030003 00000000f5000000 ffff888035b4a481
head: 04fff00000000040 ffff88801dee6000 dead000000000122 0000000000000000
head: 0000000000000000 0000000200030003 00000000f5000000 ffff888035b4a481
head: 04fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5297, tgid 5297 (syz-executor), ts 105409296999
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1860
 prep_new_page mm/page_alloc.c:1868 [inline]
 get_page_from_freelist+0x225d/0x22e0 mm/page_alloc.c:3950
 __alloc_frozen_pages_noprof+0x211/0x450 mm/page_alloc.c:5492
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab+0x7d/0x5e0 mm/slub.c:3499
 new_slab mm/slub.c:3550 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 kmem_cache_alloc_noprof+0x394/0x600 mm/slub.c:5047
 net_alloc net/core/net_namespace.c:494 [inline]
 copy_net_ns+0x1de/0x780 net/core/net_namespace.c:571
 create_new_namespaces+0x3f0/0x6b0 kernel/nsproxy.c:132
 unshare_nsproxy_namespaces+0x144/0x190 kernel/nsproxy.c:234
 ksys_unshare+0x532/0x890 kernel/fork.c:3306
 __do_sys_unshare kernel/fork.c:3372 [inline]
 __se_sys_unshare kernel/fork.c:3370 [inline]
 __x64_sys_unshare+0x38/0x50 kernel/fork.c:3370
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5011 tgid 5011 ts 69340115409 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1402 [inline]
 __free_frozen_pages+0xd1a/0xe10 mm/page_alloc.c:2958
 __slab_free+0x269/0x2c0 mm/slub.c:5926
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:361
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4720 [inline]
 slab_alloc_node mm/slub.c:5033 [inline]
 __do_kmalloc_node mm/slub.c:5530 [inline]
 __kmalloc_noprof+0x302/0x710 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 tomoyo_realpath_from_path+0xf2/0x640 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x283/0x560 security/tomoyo/file.c:827
 security_inode_getattr+0x12b/0x310 security/security.c:1918
 vfs_getattr fs/stat.c:263 [inline]
 vfs_fstat fs/stat.c:285 [inline]
 __do_sys_newfstat fs/stat.c:555 [inline]
 __se_sys_newfstat+0x133/0x440 fs/stat.c:550
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888038ebd000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888038ebd080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888038ebd100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                          ^
 ffff888038ebd180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888038ebd200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about AI bisection see: https://goo.gl/tpsmEJ#ai-bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
