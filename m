Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122229;
	b=HNOBRE/tSmHZJCiUiHMSoRnx4QiI9kFba+Bxawz//nnXd63wmAVPgmmK61o0g7NpCv7p
	 3VhJ7MxQCfFAIKtxVFVgXFE6Mku9teqOgP12mGxgIq21zL0BpG+MF5JRpy9t8JUJHBlEa
	 vMEo0KDJ0gWdgy8ZHT5XVPQSKOyjc64VUy+KpkwD8yUy5Z/MgJpoUNVjqFYoAm8VAx1tG
	 RxQ8nayy/5HW5QS/ueQjdPmk7r3YZk8IYJpsUWlFsgZNL+Y4YoVmoUNfhzzGdC7t2I4H5
	 jS4SLFMDS7BBY/xeTXz5F3+xO5TFzGf0eGWDGHOEtopZjgZqQiPzE+GvOXXi+XNOAQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122229;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=ADoGAwGu14Wz564rAon5ZmMI2VllXYZSkfNNgMDJ6h0=;
	b=KlxHv39CJ4KYzoVzrSUmimreq3GE2eyT9Our7g59ks1qFaBqjTtVTusOMRbR4HJf6FPr
	 792vYdr3b+rXph7sdKU8TImafodDftabg23p9iZXWVc6e79ibKgOGzssqcMzT8I4cwJTX
	 hxGWHaJeqlDpz7P2NBkOKJzRV05iz1ZqcFkNfmsSpK+jKz9uWPyI8ym9egBpJavzbT0uI
	 4k+4mI2YUlIAxcYXduJLSEgcvCFLmIBAeXIElGU1lEgT31n0SiE6zJihud/uBMTN5TtXj
	 hdoEXCKdyoZnKbdI20T7yaypUgupoHMb/maYPElZezJoKvsO4T0nqib/73h+rE8wCuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EEB606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1EEB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab4f652f9bso265138b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122227; x=1795727027;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ADoGAwGu14Wz564rAon5ZmMI2VllXYZSkfNNgMDJ6h0=;
        b=ynWILC2h1MSyQ7zNy0OHNjZQUOTkO+Ua16qhagrK1n2Do/7TzJoROG5uNgTZm6Hu3Q
         a4izw0RsUtbZtyxelYL/n+YFt/dln+dmEHMB4/4VTT/OuT8pXC8F4srGyw4SkiawIRLl
         ElgGPLrQ784n4ddUOowI6D2nSjLej/bsAvTVKF1SdADiliXwzzUP0vtVviTbHEGTlAiL
         dDpDfwMb0Ly5of2bgGTpmbyWAMBOLQ2/nr/dNdVaMjFkBZqTk763XBAVcJ/ytVIRWizR
         /EoAi7KUWx4wYXk7QHUyp/BceZMD8+u4usOYJx+JgY7rWg4v/Q8q/AaH7ZvffAO+P+wG
         u03w==
X-Forwarded-Encrypted: i=1; AL+hErHkIHX3RXptHc+Q4MgLELAGcrCHI33GXVMptT5YaCiqqUr9brT9Lc1s7RjDw4sBiBnUrvALsyXqTjdM7Ww=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jt3hSOQfnDp1ntmQiAjaR+XLhxu6PzB0qQL/x5SDNWS2myCLX
	65LlR+Kok+etJ7KYQvz4qhmMkp7a4NeYVYWowrsY3xouf08Xr/Atu4WU0Rz0J3r3qeRA3wVnhgG
	ifyO5AuIjcthZoRF109xLT5qUWJq1Ka1vYiaRcvIeOiCSJTzGN21wks2UoOk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1814:b0:54c:7ce7:33ba with SMTP id
 5614622812f47-57a0a922959mr1352672b6e.28.1795122227551; Thu, 19 Nov 2026
 13:03:47 -0800 (PST)
Date: Thu, 19 Nov 2026 13:03:47 -0800
In-Reply-To: <6adb54ac.d1cee5ca.8df35.0007.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aff6433.1204dc2f.31261f.0000.GAE@google.com>
Subject: Re: [syzbot] [rdma?] WARNING in __rxe_cleanup
From: syzbot <syzbot+fef38133c495aeb48297@syzkaller.appspotmail.com>
To: jgg@ziepe.ca, leon@kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	yanjun.zhu@linux.dev, zyjzyj2000@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    a041bdbe1f3a arm64: Drop stdint.h type overrides from asm/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=14adccd5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e8e6c1701ad8af2
dashboard link: https://syzkaller.appspot.com/bug?extid=fef38133c495aeb48297
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f37403580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11d60153580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ed0e5cdd75d2/disk-a041bdbe.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/219ccd252cd7/vmlinux-a041bdbe.xz
kernel image: https://storage.googleapis.com/syzbot-assets/adb21ff27181/Image-a041bdbe.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fef38133c495aeb48297@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: drivers/infiniband/sw/rxe/rxe_pool.c:212 at __rxe_cleanup+0x244/0x28c drivers/infiniband/sw/rxe/rxe_pool.c:212, CPU#1: syz.0.17/4954
Modules linked in:
CPU: 1 UID: 0 PID: 4954 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __rxe_cleanup+0x244/0x28c drivers/infiniband/sw/rxe/rxe_pool.c:212
lr : __rxe_cleanup+0x244/0x28c drivers/infiniband/sw/rxe/rxe_pool.c:212
sp : ffff800098747650
x29: ffff800098747650 x28: 1fffe0001b49bc03 x27: dfff800000000000
x26: ffff8000987476e0 x25: 00000000da70a250 x24: 0000000000000000
x23: dfff800000000000 x22: ffff0000d512d5b0 x21: ffff0000da70a250
x20: 0000000000000000 x19: ffff0000da70a250 x18: 1fffe000359d3e28
x17: 0000000000000003 x16: ffff8000898b7000 x15: ffff80008b586000
x14: 00000000005ab704 x13: 0000000000000001 x12: 0000000000000003
x11: 0000000000000000 x10: 0000000000000001 x9 : 0000000000000000
x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000008 x3 : ffff800084641254
x2 : 0000000000000000 x1 : ffff0000d15d0000 x0 : 0000000000000000
Call trace:
 __rxe_cleanup+0x244/0x28c drivers/infiniband/sw/rxe/rxe_pool.c:212 (P)
 rxe_destroy_qp+0x80/0x270 drivers/infiniband/sw/rxe/rxe_verbs.c:661
 ib_destroy_qp_user+0x2d8/0x548 drivers/infiniband/core/verbs.c:2182
 uverbs_free_qp+0xdc/0x188 drivers/infiniband/core/uverbs_std_types_qp.c:34
 destroy_hw_idr_uobject+0x90/0x120 drivers/infiniband/core/rdma_core.c:579
 uverbs_destroy_uobject+0x23c/0x4f4 drivers/infiniband/core/rdma_core.c:172
 __uverbs_cleanup_ufile+0x1e8/0x334 drivers/infiniband/core/rdma_core.c:959
 uverbs_destroy_ufile_hw+0x88/0x210 drivers/infiniband/core/uverbs_main.c:1003
 ib_uverbs_close+0x54/0x200 drivers/infiniband/core/uverbs_main.c:1018
 __fput+0x338/0x74c fs/file_table.c:512
 ____fput+0x20/0x30 fs/file_table.c:541
 task_work_run+0x1cc/0x25c kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x570/0x1a64 kernel/exit.c:980
 do_group_exit+0x198/0x238 kernel/exit.c:1123
 __do_sys_exit_group kernel/exit.c:1134 [inline]
 __se_sys_exit_group kernel/exit.c:1132 [inline]
 pid_child_should_wake+0x0/0x104 kernel/exit.c:1132
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:816
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
irq event stamp: 2998
hardirqs last  enabled at (2997): [<ffff80008697a52c>] __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:219 [inline]
hardirqs last  enabled at (2997): [<ffff80008697a52c>] _raw_spin_unlock_irq+0x30/0x80 kernel/locking/spinlock.c:229
hardirqs last disabled at (2998): [<ffff8000869540f0>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:484
softirqs last  enabled at (2638): [<ffff8000800204f4>] __do_softirq+0x14/0x20 kernel/softirq.c:703
softirqs last disabled at (1173): [<ffff8000800204f4>] __do_softirq+0x14/0x20 kernel/softirq.c:703
---[ end trace 0000000000000000 ]---
rxe0: qp#17 rxe_destroy_qp: cleanup failed, err = -110
