Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178985;
	b=5EVoWvHV0VWyQlfq9DmD2YU+6dFu1iNmwGoSxy+hi5MR3ZUTn25b5XWlvod5YuZNdkfi
	 KgA+tjA+MnMLAavmuzrCnNoPIrsMB4D4lvL2lXeaVKLYR2PSXMG+nJ6B76QwMAobXGHhT
	 dK+pe9Qi+jvYLckIPx8TJs5D2t+d0j9xsFs/blNTuFFmPR25rLVtv4KbWQXgRt1Lb4FfU
	 Ec4CK4YxjYoxjkJ8O2wSoMzVO2lJSxA5CqibA+7CfO1U+X+iR5nLxXa/ApYJ69/KYpKLJ
	 JygV4K5IQx5Pbu/gzuFXIeJAvlN9kFfWfKx0fP0zd95TprJOIY/m5jzYqJK/oyns64g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178985;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=N+v3sFpsELkV978xsbM9iHF9UbAncOfM+CUPVOODo2Q=;
	b=tokQrrhTi+MmIx5zuKl+swQu9a9RYYHUympGGG/4XBgMssIuuQy8zT3QFx62XjDpwGWN
	 PTysWfjojLWw3YQDC1p2eeGMpujw1Yd0us5Bdq8J0Vo5+iFArOmqNrboebVcuhdIVXKhZ
	 lEECbhsXx3r+c3JhmynBdO8FWBC6qBa4ImgWGxIBICZlUuOoXLB7h/1mLuUOK5+nvHuHt
	 z7I3m13IekisHy28Xz3df9Boo94v5o3+gzRatpmCr5FWABuhYK7YZ80pUvZ9l8hUTy0lG
	 J+8z5wedLcTXXHrWwJGs3K9x7rjazbHSEg4ao4vGPywnWuVZDVhBkrNIrMzCj8pe0og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD39606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD39606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4ad9bc6aa91so1085781fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178984; x=1795783784;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+v3sFpsELkV978xsbM9iHF9UbAncOfM+CUPVOODo2Q=;
        b=ALfDsteupkCgRJCjRelyt0RlD/EZUbJ8HrJZ3WTWJua/cSBC+JrcFzZfYyUoku2C8R
         IDiXZefighGnrRd16PukFtwWcbuB/MTWWc3dFEcx3JCYCwTvAGeukPSvDJga9T2Ko7Mo
         6KF1v4PmqdqXVEUHZk3S4HGCBIxoMGKHvNUWmuPWlopTg5EI1iS3I5XPpOFCFHj1b/hl
         6OzsrU2OwX3TF0V6jhaIDuOL44gk5Lj1mgPXw+RTtU5dJKL7IpdJl8nJ2Sr34MmMWakK
         3Qk6kPoHScaLOCE7C67a9lmedJztXwjKTYeRqpZnOEwJFGmdA0P1tebwgfbbl1rAFbpk
         a5Wg==
X-Forwarded-Encrypted: i=1; AL+hErFF2Y0vshe7PScIOrUo8Pt32yln9rI5gXKkCqOCSv49G9EOUwkHwnrufT6ZP3eMi0j5WzWjVYnlumqNFHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oC0EJgI8162CHKx5Hx+TnUuyCM+MFSQurRPLuHX2t6NtYjBse
	XjRp87ksN0c4zk8Qkt6Cff0Q5e7nUFybcJHF5S7DEM5qer/F0Oh3jRRKyJkQ4Vd0yCsEzVp8p6l
	VEy+MBuKYl8xSdGzbHdY9susNafbL3ebjjUniFSQpGehaCXECLH6HMzt8eQs=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f4c:b0:4f2:ac42:656b with SMTP id
 5614622812f47-57a06d1a84cmr3891005b6e.7.1795178983970; Fri, 20 Nov 2026
 04:49:43 -0800 (PST)
Date: Fri, 20 Nov 2026 04:49:43 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b0041e7.9fc8cf76.202198.0005.GAE@google.com>
Subject: [syzbot] [ext4?] BUG: unable to handle kernel NULL pointer
 dereference in strrchr
From: syzbot <syzbot+1d23ad199a3bfd6f9149@syzkaller.appspotmail.com>
To: jack@suse.cz, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sandeen@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    65e4fd942f72 Merge tag 'selinux-pr-20261119' of git://git...
git tree:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux
console output: https://syzkaller.appspot.com/x/log.txt?x=1102b185580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3299dd89908ef903
dashboard link: https://syzkaller.appspot.com/bug?extid=1d23ad199a3bfd6f9149
compiler:       arm-linux-gnueabi-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=165e3abd580000

The issue was bisected by AI to:

commit 98f18c76c2c3089183c35d2c33e468ad6c03d86b
Author: Eric Sandeen <sandeen@redhat.com>
Date:   Sun Feb 23 19:57:41 2025 +0000

    ext2: create ext2_msg_fc for use during parsing

AI reasoning:   https://syzkaller.appspot.com/ai_job?id=f0a661eb-7c3b-44be-becd-54ce0bd776b2

AI-generated root cause summary:
In fs/ext2/super.c, ext2_msg_fc() formats log messages for filesystem context
operations. When fc->purpose != FS_CONTEXT_FOR_RECONFIGURE, it unconditionally
executes strrchr(fc->source, '/') without verifying that fc->source is non-NULL.
During filesystem configuration via the new mount API (e.g., fsopen() followed
by fsconfig()), fc->source starts as NULL and options can be parsed in any
order. Specifying an option that triggers ext2_msg_fc() (such as "dax", "nobh",
or "reservation") prior to supplying the "source" parameter passes a NULL
pointer to strrchr(), causing a kernel NULL pointer dereference.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=1d23ad199a3bfd6f9149

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1d23ad199a3bfd6f9149@syzkaller.appspotmail.com

The cause commit was identified by AI and may be wrong.
If you agree with it, please also add:
Fixes: 98f18c76c2c3 ("ext2: create ext2_msg_fc for use during parsing")

8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
[00000000] *pgd=86b45003, *pmd=df702003
Internal error: Oops: 205 [#1] SMP ARM
Modules linked in:
CPU: 0 UID: 0 PID: 4221 Comm: syz-executor704 Not tainted syzkaller #0 PREEMPT 
Hardware name: ARM-Versatile Express
PC is at strrchr+0x4/0x20 arch/arm/lib/strrchr.S:16
LR is at ext2_msg_fc+0x64/0xbc fs/ext2/super.c:94
pc : [<81be3be4>]    lr : [<80207988>]    psr: 80000013
sp : df969ed0  ip : 00000000  fp : df969efc
r10: 8665ce00  r9 : 86c5a600  r8 : 8665ce00
r7 : 00000000  r6 : 825897f0  r5 : 82533520  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : 0000002f  r0 : 00000000
Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 30c5387d  Table: 86801300  DAC: fffffffd
Register r0 information: NULL pointer
Register r1 information: non-paged memory
Register r2 information: NULL pointer
Register r3 information: NULL pointer
Register r4 information: NULL pointer
Register r5 information: non-slab/vmalloc memory
Register r6 information: non-slab/vmalloc memory
Register r7 information: NULL pointer
Register r8 information: slab filp start 8665ce00 pointer offset 0 size 128
Register r9 information: slab kmalloc-cg-128 start 86c5a600 pointer offset 0 size 128
Register r10 information: slab filp start 8665ce00 pointer offset 0 size 128
Register r11 information: 2-page vmalloc region starting at 0xdf968000 allocated at kernel_clone+0xc4/0x440 kernel/fork.c:2798
Register r12 information: NULL pointer
Process syz-executor704 (pid: 4221, stack limit = 0xdf968000)
Stack: (0xdf969ed0 to 0xdf96a000)
9ec0:                                     00000000 00000000 00000000 9b02fc30
9ee0: 86c7ab80 86c5a600 86c7ab80 fffffdf9 df969f34 df969f08 80791374 80207934
9f00: 825897f0 0000006a 00000000 00000000 00000001 00000000 fffffdf9 9b02fc30
9f20: 86c5a600 df969f60 df969f5c df969f38 80632b70 8079114c 80501748 805015b0
9f40: 00000000 00000000 00000000 86c5a604 df969fa4 df969f60 80634f3c 80632ab8
9f60: 86801c00 00000001 00000000 00000000 00000000 9b02fc30 00000000 00000000
9f80: 00000002 00000001 000001af 8020029c 84563300 000001af 00000000 df969fa8
9fa0: 80200060 80634c2c 00000000 00000002 00000003 00000000 000653e0 00000000
9fc0: 00000000 00000002 00000001 000001af 00000000 7eb39e0c 00000002 00000000
9fe0: 7eb39c90 7eb39c80 00010330 00027e10 60000010 00000003 00000000 00000000
Call trace: 
[<80207924>] (ext2_msg_fc) from [<80791374>] (ext2_parse_param+0x234/0x2dc fs/ext2/super.c:598)
 r3:0000006a r2:825897f0
 r6:fffffdf9 r5:86c7ab80 r4:86c5a600
[<80791140>] (ext2_parse_param) from [<80632b70>] (vfs_parse_fs_param+0xc4/0x13c fs/fs_context.c:132)
 r5:df969f60 r4:86c5a600
[<80632aac>] (vfs_parse_fs_param) from [<80634f3c>] (vfs_fsconfig_locked fs/fsopen.c:306 [inline])
[<80632aac>] (vfs_parse_fs_param) from [<80634f3c>] (__do_sys_fsconfig fs/fsopen.c:466 [inline])
[<80632aac>] (vfs_parse_fs_param) from [<80634f3c>] (sys_fsconfig+0x31c/0x514 fs/fsopen.c:353)
 r6:86c5a604 r5:00000000 r4:00000000
[<80634c20>] (sys_fsconfig) from [<80200060>] (ret_fast_syscall+0x0/0x1c arch/arm/mm/proc-v7.S:67)
Exception stack(0xdf969fa8 to 0xdf969ff0)
9fa0:                   00000000 00000002 00000003 00000000 000653e0 00000000
9fc0: 00000000 00000002 00000001 000001af 00000000 7eb39e0c 00000002 00000000
9fe0: 7eb39c90 7eb39c80 00010330 00027e10
 r10:000001af r9:84563300 r8:8020029c r7:000001af r6:00000001 r5:00000002
 r4:00000000
Code: 00000000 00000000 00000000 e3a03000 (e4d02001) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   c:	e3a03000 	mov	r3, #0
* 10:	e4d02001 	ldrb	r2, [r0], #1 <-- trapping instruction


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
