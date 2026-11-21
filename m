Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795274445;
	b=b8fYwSmlwa2wQhskGuMhEFpkTG11gnnDQe5/Jvqe1s4ifjkzon6GQsQL5Y9CoKsPeQya
	 r/0LZa7eKshyqqjDR/nVWoe6HCnpD7g9ehgRznLZMiTEdZ4oYpGf82w3zFXQFz+rID2uK
	 JcBan8oWGNVSi0cUCF2UaOiXrxbR3aUXX8KZoCAGVRcxQ2bL9IvIZsadRI0L5PJL0DS5H
	 p2uYghRu0uXN9ccmDRgUur3cX64Ch9thctNo35vjtrFehk2pnYXLSSUxFDKK2mbRZgbyH
	 zOze0/ouizMikXa6AWlOQ1i/W8NZ8i+uwQtllumqjaRCkpd0fXPUENEP4hfeT79seBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795274445;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=RGNZV1WddiEIKOXX92+o7s7I8KiRzoYOEAA3GVq946Q=;
	b=vOkg8OxLBAujqG8cyxJXp16M88/NI92N0bQzWZ8XN706xAHzvV8AKBluPtTwFMh68v8y
	 cLvwgwCucpLyenajfX3whN5gg0wDMKXwTCbEMjKGVnQEt/EMrqR/32en6s0AbY1DUMXC0
	 mkou1qghOeko/CgnH7o87RrgmTn79fzcAQ0+zUne2uJrKqOqX2DfkaKRw7B069UaWJeMl
	 drvo9tm50O7SWJWxlhj6pkxX7g5D/GbADtQ3Zoms0vrYkl98Y7Yky5CGGt7s5ZUD1rMZ2
	 moLDVU5DouZtumVWkkix7J4dBy+WCFNp9io9ViBxaMLC6bMomuXABYVpWLgzvCqG3ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A626606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A626606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-862bca06702so3759482a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:20:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795274444; x=1795879244;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGNZV1WddiEIKOXX92+o7s7I8KiRzoYOEAA3GVq946Q=;
        b=s/dA6WweCPEJF7Ey0Ba8YQxjeR2kvqxFvjbLP3jYG3TKdMKqhzWwSJbHuDeke4V/0h
         4WxncaSQj5BX1mRk0lXxMeaZ627JJTog82fQz4ka/cuUjFRPzQXRP6fJNKHdySSWLd7M
         0oHOb+mudCnVrE//kSJ3fznb5G835Ydy3ftCOlgjiFonMQgd41DkACUYHETvfYEDys2+
         dDhxCnHSdaoVKmWexrPr+2gya5GX0MqOZv43aTTz7j+PKWG4d7TT8A8NZrfMI0ChV7c5
         VJCNfx0R4YinaOw2Xc7saZ07cZW6iMfCaDCc4CgpTTwkYmeoSlIT4aPREgGL7mqz5KIs
         kgiw==
X-Forwarded-Encrypted: i=1; AL+hErH5Y7k5NrcL0d7X1ACLquemuL4A0IXG6lG+8YGKysrMe4Zr8/rcj/9LCj8SGXQb06jh4yXKgaXp9YArU2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zaWZQ07GBj5774d6GLbQebMea55MLSXYIHumSkEUAmq5O2Jxa
	wepycsGgxLb0j30nsLbI/SSTjdXjinOcjZnFy4m2OrqyFwW28iITUwSILlFg+TtrgEt389qPlU1
	y5SpPcxJF79CWsgBP61r/k++mWAi9YSnBxCXUxAiCUkCg5+r+csZWlYJHx5s=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6615:b0:55c:844:9904 with SMTP id
 5614622812f47-57a0950377amr6764358b6e.17.1795274444163; Sat, 21 Nov 2026
 07:20:44 -0800 (PST)
Date: Sat, 21 Nov 2026 07:20:44 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b01b6cc.44b41460.34b83f.000e.GAE@google.com>
Subject: [syzbot] [jfs?] general protection fault in dbDiscardAG (2)
From: syzbot <syzbot+29eda1328acf6cf2dbfb@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com, yun.zhou@windriver.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c44104f3642d Merge tag 'drm-fixes-2026-11-21' of https://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=152232d5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d16c0eae9c338e3c
dashboard link: https://syzkaller.appspot.com/bug?extid=29eda1328acf6cf2dbfb
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=178024ff980000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+29eda1328acf6cf2dbfb@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 32768
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000003: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
CPU: 1 UID: 0 PID: 6036 Comm: syz-executor802 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
RIP: 0010:dbDiscardAG+0x648/0x8f0 fs/jfs/jfs_dmap.c:1726
Code: e2 cd 8b e8 ca d3 b4 fd 4c 89 f7 e8 b2 50 2e fe 4c 8b 74 24 10 49 83 c6 08 4c 89 f0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 f7 e8 7a 97 c7 fe 49 c7 06 00 00 00 00 48
RSP: 0018:ffffc900045dfcb0 EFLAGS: 00010206
RAX: 0000000000000003 RBX: ffff888033c86000 RCX: dffffc0000000000
RDX: 0000000000000001 RSI: ffffffff8dafc369 RDI: 00000000ffffffff
RBP: 0000000000000001 R08: ffffffff90d5c8bf R09: 1ffffffff21ab917
R10: dffffc0000000000 R11: fffffbfff21ab918 R12: ffffffffffffffff
R13: 0000000000000001 R14: 0000000000000018 R15: ffff88805b83d7f0
FS:  000055555cc9f400(0000) GS:ffff888124801000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8926b53000 CR3: 00000000416f4000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 jfs_ioc_trim+0x436/0x680 fs/jfs/jfs_discard.c:106
 jfs_ioctl+0x291/0x3b0 fs/jfs/ioctl.c:131
 vfs_ioctl fs/ioctl.c:52 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl+0xff/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc8f47440fb
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007fffcecef320 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fc8f47440fb
RDX: 00007fffcecef380 RSI: 00000000c0185879 RDI: 0000000000000004
RBP: 00007fc8f47a0c12 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fc8f47a0b8e
R13: 0000000000000004 R14: 0000000200000004 R15: 0000000000000002
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:dbDiscardAG+0x648/0x8f0 fs/jfs/jfs_dmap.c:1726
Code: e2 cd 8b e8 ca d3 b4 fd 4c 89 f7 e8 b2 50 2e fe 4c 8b 74 24 10 49 83 c6 08 4c 89 f0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 f7 e8 7a 97 c7 fe 49 c7 06 00 00 00 00 48
RSP: 0018:ffffc900045dfcb0 EFLAGS: 00010206
RAX: 0000000000000003 RBX: ffff888033c86000 RCX: dffffc0000000000
RDX: 0000000000000001 RSI: ffffffff8dafc369 RDI: 00000000ffffffff
RBP: 0000000000000001 R08: ffffffff90d5c8bf R09: 1ffffffff21ab917
R10: dffffc0000000000 R11: fffffbfff21ab918 R12: ffffffffffffffff
R13: 0000000000000001 R14: 0000000000000018 R15: ffff88805b83d7f0
FS:  000055555cc9f400(0000) GS:ffff888124801000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4008a5d708 CR3: 00000000416f4000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	e2 cd                	loop   0xffffffcf
   2:	8b e8                	mov    %eax,%ebp
   4:	ca d3 b4             	lret   $0xb4d3
   7:	fd                   	std
   8:	4c 89 f7             	mov    %r14,%rdi
   b:	e8 b2 50 2e fe       	call   0xfe2e50c2
  10:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
  15:	49 83 c6 08          	add    $0x8,%r14
  19:	4c 89 f0             	mov    %r14,%rax
  1c:	48 c1 e8 03          	shr    $0x3,%rax
  20:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  27:	fc ff df
* 2a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1) <-- trapping instruction
  2e:	74 08                	je     0x38
  30:	4c 89 f7             	mov    %r14,%rdi
  33:	e8 7a 97 c7 fe       	call   0xfec797b2
  38:	49 c7 06 00 00 00 00 	movq   $0x0,(%r14)
  3f:	48                   	rex.W


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
