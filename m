Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486419;
	b=MS6V8qVW0Isy9vpA1xf27rk7Yabyl7EwJy1fYa4eawtG1VCEoK+ayT8veMDqg7UUyJ1I
	 MnRrF7e8qQVgNSzSIHzG63tMxOAwVeKZWUqi5oi2P9+QeUEU14HQmBGLRzGr4esIxrlex
	 bWQN08R+pif1B1dTkW98C1m44DC7HE0AwLLusRRdwQnDM0HDZc15ARtBph5lIO/RTcrST
	 CMwdsAbb4aPdg6VuKBsJ7VZp6fEf2fw5dhq5YIHjDcNi60FJdBy6ene2T1NCgdDwK4JIj
	 J0+Ejnq13VoqPQ0K3YFH9N8ErKE8kxlfsG9DWswM1DRCFHEwfd80X6CR1X7oEADmxTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486419;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=jl9dB7jJGIlY2PKhHfBeUr5m/KPu4eSitwR+RChvQeM=;
	b=jCuv9OLkOwwd1JWugg3IgFdzLQcdUrV/vK6lJhmjyx8Zfmbb79AJg4rgkm6EEz5NfAxD
	 0acpz2JTfdkUgXZGxX/lDwyOXhsZ2Udb37q2It3yic6oC5HEZxoy5fRjEsvjLKPQvjOCS
	 Jy3/tj3ByW6V2yf6sJf1G5YWTmn1sBb/7QlLCiEh37o2H4OyHRiNs+MjrqRNAXwvBRZmv
	 XXRjpQCNus76seTKgKhzcflh1/T2/eBFADnXaQUqj5Hgd6B0Py7AJg0vYBOtK8F0ZVrAX
	 u1wlCrts8YzFlriI2AOWCSC/0/iLP1HVL5nFjPivv41SvU8M6mVsVBbHAw5Dl4meVVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0D2606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E0D2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e4dso4916956b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486418; x=1796091218;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jl9dB7jJGIlY2PKhHfBeUr5m/KPu4eSitwR+RChvQeM=;
        b=yzIbgJJD0/fUpzTT/KvACWrDVqrx/bwtml+FE2YdOxW0jUVBqPlQUHAA3O+PCr87aq
         h6sEHw5uozUGsySUHOJmoBT8EW6aVbiCJ4ffONXDs+6uKcbqtyqmrjxdJfxyDcEHteD3
         rIV4vRvwpAk5rtulaq+HoHYiYVP4fCA0beHmFAVMRqfXRblj/fGFy3WAP/GqMWbrBklZ
         iJxAy9e054DpD1rdkQwEuBtbbjYUDoXAC281gv60q0FPRb+z1gG0BJp7rZmISbs3bzcv
         3a/X2SK/PwqrKNxNvaQ6NcHQ8NU8IZnsZhMJd84GrXTnJ0R++aMXdF/Bf9+bX0BGdvOn
         UA3w==
X-Forwarded-Encrypted: i=1; AL+hErF4krARFV7vx0aJXqhk5RhCrYHgCpqbk14v3MNKxpI7pDLITHrgZzgz+BQClxqQKUHGzT90zwT5PNdn/oA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JceZplarKvbYbMJAPOLCZW1+vQd9RtV8Kud1CU6kNAXl2oR/9
	soQE9eOoc1mA3SqZsPH58AELx6WOMEIVTkZzU7eCFs/5U4LANe8Q6drHtirWbuvCN4Ak1vrb547
	rXpD58RFkkKsCBNH1WTR/HKlYXdQ7+2ksMnwiwv3e4xn4oLBIPPmPvySMVqE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1484:b0:53a:65aa:152e with SMTP id
 5614622812f47-57a0a50658amr16332018b6e.35.1795486418522; Mon, 23 Nov 2026
 18:13:38 -0800 (PST)
Date: Mon, 23 Nov 2026 18:13:38 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b04f2d2.44b41460.34b83f.0037.GAE@google.com>
Subject: [syzbot] [fs?] KCSAN: data-race in task_dump_owner / task_dump_owner (2)
From: syzbot <syzbot+3b8f4ae71137f7af00ca@syzkaller.appspotmail.com>
To: adobriyan@gmail.com, akpm@linux-foundation.org, brauner@kernel.org, 
	jack@suse.cz, jannh@google.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sforshee@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4843f6873f7c Merge tag 'sysctl-7.04-fixes-rc4' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=149a7363580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=886d2ddd2d6b664e
dashboard link: https://syzkaller.appspot.com/bug?extid=3b8f4ae71137f7af00ca
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9b25bc73ef7f/disk-4843f687.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/acc9d8469c04/vmlinux-4843f687.xz
kernel image: https://storage.googleapis.com/syzbot-assets/83adc8d7ee5c/bzImage-4843f687.xz

AI-generated root cause summary:
During concurrent VFS lookups of the same `/proc/<pid>` dentry, `lookup_fast()`
invokes `pid_revalidate()` without holding any inode lock (including in RCU-walk
mode). `pid_revalidate()` calls `pid_update_inode()`, which calls
`task_dump_owner(task, inode->i_mode, &inode->i_uid, &inode->i_gid)`.
`task_dump_owner()` performs plain, unsynchronized 4-byte writes to
`inode->i_uid` and `inode->i_gid`, causing concurrent writers across CPUs to
race on the same `struct inode` fields.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3b8f4ae71137f7af00ca

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3b8f4ae71137f7af00ca@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in task_dump_owner / task_dump_owner

write to 0xffff88811b422a60 of 4 bytes by task 6557 on cpu 0:
 task_dump_owner+0x146/0x170 fs/proc/base.c:-1
 pid_update_inode fs/proc/base.c:2032 [inline]
 pid_revalidate+0x65/0xb0 fs/proc/base.c:2057
 d_revalidate fs/namei.c:1041 [inline]
 lookup_fast+0x232/0x320 fs/namei.c:1874
 walk_component fs/namei.c:2284 [inline]
 link_path_walk+0x5d9/0xde0 fs/namei.c:2659
 path_openat+0x142/0x11e0 fs/namei.c:5012
 do_file_open+0x16c/0x290 fs/namei.c:5045
 do_sys_openat2+0xa1/0x140 fs/open.c:1443
 do_sys_open fs/open.c:1449 [inline]
 __do_sys_openat fs/open.c:1465 [inline]
 __se_sys_openat fs/open.c:1460 [inline]
 __x64_sys_openat+0xf2/0x120 fs/open.c:1460
 x64_sys_call+0x1f72/0x2550 arch/x86/include/generated/asm/syscalls_64.h:258
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x11e/0x3a0 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

write to 0xffff88811b422a60 of 4 bytes by task 6556 on cpu 1:
 task_dump_owner+0x146/0x170 fs/proc/base.c:-1
 pid_update_inode fs/proc/base.c:2032 [inline]
 pid_revalidate+0x65/0xb0 fs/proc/base.c:2057
 d_revalidate fs/namei.c:1041 [inline]
 lookup_fast+0x232/0x320 fs/namei.c:1874
 walk_component fs/namei.c:2284 [inline]
 link_path_walk+0x5d9/0xde0 fs/namei.c:2659
 path_openat+0x142/0x11e0 fs/namei.c:5012
 do_file_open+0x16c/0x290 fs/namei.c:5045
 do_sys_openat2+0xa1/0x140 fs/open.c:1443
 do_sys_open fs/open.c:1449 [inline]
 __do_sys_openat fs/open.c:1465 [inline]
 __se_sys_openat fs/open.c:1460 [inline]
 __x64_sys_openat+0xf2/0x120 fs/open.c:1460
 x64_sys_call+0x1f72/0x2550 arch/x86/include/generated/asm/syscalls_64.h:258
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x11e/0x3a0 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 6556 Comm: syz.5.482 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
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
