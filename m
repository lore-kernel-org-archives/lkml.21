Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553086;
	b=0JppLJMGUplHYyKGLraIbEwVlvhYewuK7C7mpSum800ABgmBLnfmrbF9p5FmGGRfUK73
	 diqzGm4lOHkf9w0vMsmB2dCIp5vV5OhpSg9yf3LR3RRRDvzWePrUbpitnOPY4FFL+JCuF
	 4heIoN41fQA4ESN15MqN2a16cx+ne+tmfUBulb00cqYlT9FrcSylWKymeBCaTPbciBEvu
	 MISV028H5AEdNUX9cmg5ggd8au6Tm2T8BjGauEWMidQP/muHL8IqRtsy3AD+NpExABctn
	 CpaWz2npS9LkdeyaQ4EPzEi7q2lhVn/PsxLOc2pTSbKLMTJwUgqjpBLk/LtU9t5LmgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553086;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=778WRg0Spsg6ThQN5OG8z6sQFFnFoKKXC5k3s3Hz4jg=;
	b=yE4dPLLY8w0wgqmT1VED7WlNmH6BNdeVgn2mGxcNfCwqJfAeGkLGhsjneM1myrM87UUJ
	 TDd0xZz3TA/0kHgpDbxKYEO/D6izxI//b6Sgi2zWYaVLExmvvsDDdk94cFlbv+up2Ybvg
	 3+ywBwArV3b9TOlNtxE/PHbbJyD++7OzFVWS5yKkFMI1sHPttosZvzFGMnC3ltngM2RTg
	 PN0n2NCzhL2SQlwJCno973qLoJV/sv9+VwZzIUgBSQ+e0aVvIEKi7NRmzadIcPCB/j/Sz
	 Uj8XK5TQ2i5IdmjJqnrRNHJCzmDWVtHqxsKSYyYwwWK2Hz8rjKX7uFayxCNDGuMtCHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43528606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43528606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5713cd0fb42so7099775b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:44:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553085; x=1796157885;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=778WRg0Spsg6ThQN5OG8z6sQFFnFoKKXC5k3s3Hz4jg=;
        b=lLCARuKKN8q7iUcGL29pzI3MW2VqeTDncAO+4qb9V9SZDnUP4gz6cc4H0oNffD1rYr
         JpqEzmw4YsuZS/BFnQVONrYJIGJcUwIeOXhGZXe8YS6shWBQMv8+o2pY81k6/p2TZ95s
         dg5/ixIDWOnEQEWZsQglQBbR7Z4O2O8lG1I/7i4lBTFu4AUmTxYrYa4yOuHHF0fy1yk/
         6q9jiFHcDDSFhSNt0xBmeCUMKOSRH68jM7dfQ2esxe6AF+SvoeNmcB6YzyRAvxf2/Kc6
         owZScZpEYy6i2pjigdQvKqG+k5KxtZ29vYajCpKqVTmtxn3k0+EMZYlr7uJq4DdQAkJu
         hSGA==
X-Forwarded-Encrypted: i=1; AL+hErFgsVlnUMiReryfUrPN3fXYeI4fSqWvLSYfExIkWA4sjnga3SfANmSRjb/UP2YNN9BVB2tcnWle2Zp4nBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tbZbPUwUVU/wvkoQngjufriPgmfBrWLvNDBheJCbBkFMtU5r2
	zu+VL3GF2yq5N5S/zSvvgekBcfehJ23cWxknZBvNYphvuVElRQejjLrdbis6xcVyfKWZwMDeKwg
	xSOoaKuGGt2kA019EF6+mTAB++BAuet4phl4ehZsH5P/OITD5ycTRs/Sq+sk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:319b:b0:4a4:989:bb1f with SMTP id
 5614622812f47-5797bb9eb89mr10884906b6e.9.1795553085515; Tue, 24 Nov 2026
 12:44:45 -0800 (PST)
Date: Tue, 24 Nov 2026 12:44:45 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b05f73d.3f72aad1.34e135.0012.GAE@google.com>
Subject: [syzbot] [squashfs?] BUG: unable to handle kernel paging request in squashfs_lookup
From: syzbot <syzbot+f1290205423d04eee4cb@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	phillip@squashfs.org.uk, squashfs-devel@lists.sourceforge.net, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3191063649db Add linux-next specific files for 20261123
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11c11b09580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fb153e9351b2d9fb
dashboard link: https://syzkaller.appspot.com/bug?extid=f1290205423d04eee4cb
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/74a1a5a80d1f/disk-31910636.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ad0d2b167151/vmlinux-31910636.xz
kernel image: https://storage.googleapis.com/syzbot-assets/256a3285e2fa/bzImage-31910636.xz

The issue was bisected by AI to:

commit 5b515c0ec855811ab62985033c44dde99c15f326
Author: Phillip Lougher <phillip@squashfs.org.uk>
Date:   Mon Nov 23 03:42:49 2026 +0000

    Squashfs: don't compute start or alloc memory on empty directory or index

AI reasoning:   https://syzkaller.appspot.com/ai_job?id=ce9f921f-d86e-48f2-a1de-2923ad7d27f9

AI-generated root cause summary:
In squashfs_lookup() (fs/squashfs/namei.c), the local pointer `struct inode
*inode` is initialized to NULL and immediately passed to
`squashfs_i(inode)->start` and `squashfs_i(inode)->offset` in a `TRACE()`
(`pr_debug()`) call instead of the directory parameter `dir`. Because
`squashfs_i()` uses `container_of(..., struct squashfs_inode_info, vfs_inode)`
where `vfs_inode` is at offset 0x40 (64 bytes), `squashfs_i(NULL)` evaluates to
`0xffffffffffffffc0`. When dynamic debug (`CONFIG_DYNAMIC_DEBUG`) is enabled for
this call site (or `DEBUG` is defined), any SquashFS directory lookup
dereferences `0xffffffffffffffc0` and triggers a fatal kernel read page fault.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=f1290205423d04eee4cb

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f1290205423d04eee4cb@syzkaller.appspotmail.com

The cause commit was identified by AI and may be wrong.
If you agree with it, please also add:
Fixes: 5b515c0ec855 ("Squashfs: don't compute start or alloc memory on empty directory or index")

BUG: unable to handle page fault for address: ffffffffffffffc0
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 1014b067 P4D 1014b067 PUD 1014d067 PMD 0 
Oops: Oops: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 6014 Comm: syz.0.29 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
RIP: 0010:squashfs_lookup+0x1342/0x14a0 fs/squashfs/namei.c:180
Code: e8 33 72 89 ff e9 7a f8 ff ff 4d 89 f4 48 b8 f8 ff ff ff ff ff ff 1f 41 80 3c 07 00 74 0c 48 c7 c7 c0 ff ff ff e8 ae 71 89 ff <4c> 8b 34 25 c0 ff ff ff 48 b8 f9 ff ff ff ff ff ff 1f 48 b9 00 00
RSP: 0018:ffffc900052a7740 EFLAGS: 00010246
RAX: 1ffffffffffffff8 RBX: ffff888055706400 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc900052a787c
RBP: ffffc900052a7910 R08: 0000000000000003 R09: 0000000000000000
R10: ffffc900052a7870 R11: fffff52000a54f0f R12: ffff8880796be340
R13: 1ffff92000a54f04 R14: ffff8880796be340 R15: dffffc0000000000
FS:  00007f65c65336c0(0000) GS:ffff8881232b3000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffc0 CR3: 000000007f2d8000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 finish_lookup fs/namei.c:1935 [inline]
 lookup_open+0x816/0x16e0 fs/namei.c:4648
 open_last_lookups fs/namei.c:4884 [inline]
 path_openat+0x7a5/0x20e0 fs/namei.c:5123
 do_file_open+0x23e/0x4a0 fs/namei.c:5155
 do_open_execat+0x12b/0x590 fs/exec.c:786
 alloc_bprm+0x24/0x640 fs/exec.c:1514
 class_bprm_constructor fs/exec.c:1580 [inline]
 do_execveat_common+0x167/0xbd0 fs/exec.c:1916
 __do_sys_execve fs/exec.c:2036 [inline]
 __se_sys_execve fs/exec.c:2030 [inline]
 __x64_sys_execve+0x97/0xc0 fs/exec.c:2030
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x00007f65c55a9519
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f65c6533028 EFLAGS: 00000246 ORIG_RAX: 000000000000003b
RAX: ffffffffffffffda RBX: 00007f65c5835fa0 RCX: 00007f65c55a9519
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000200000006b40
RBP: 00007f65c5639136 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f65c5836038 R14: 00007f65c5835fa0 R15: 00007ffe3ac97c08
 </TASK>
Modules linked in:
CR2: ffffffffffffffc0
---[ end trace 0000000000000000 ]---
RIP: 0010:squashfs_lookup+0x1342/0x14a0 fs/squashfs/namei.c:180
Code: e8 33 72 89 ff e9 7a f8 ff ff 4d 89 f4 48 b8 f8 ff ff ff ff ff ff 1f 41 80 3c 07 00 74 0c 48 c7 c7 c0 ff ff ff e8 ae 71 89 ff <4c> 8b 34 25 c0 ff ff ff 48 b8 f9 ff ff ff ff ff ff 1f 48 b9 00 00
RSP: 0018:ffffc900052a7740 EFLAGS: 00010246
RAX: 1ffffffffffffff8 RBX: ffff888055706400 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc900052a787c
RBP: ffffc900052a7910 R08: 0000000000000003 R09: 0000000000000000
R10: ffffc900052a7870 R11: fffff52000a54f0f R12: ffff8880796be340
R13: 1ffff92000a54f04 R14: ffff8880796be340 R15: dffffc0000000000
FS:  00007f65c65336c0(0000) GS:ffff8881232b3000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffc0 CR3: 000000007f2d8000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	e8 33 72 89 ff       	call   0xff897238
   5:	e9 7a f8 ff ff       	jmp    0xfffff884
   a:	4d 89 f4             	mov    %r14,%r12
   d:	48 b8 f8 ff ff ff ff 	movabs $0x1ffffffffffffff8,%rax
  14:	ff ff 1f
  17:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
  1c:	74 0c                	je     0x2a
  1e:	48 c7 c7 c0 ff ff ff 	mov    $0xffffffffffffffc0,%rdi
  25:	e8 ae 71 89 ff       	call   0xff8971d8
* 2a:	4c 8b 34 25 c0 ff ff 	mov    0xffffffffffffffc0,%r14 <-- trapping instruction
  31:	ff
  32:	48 b8 f9 ff ff ff ff 	movabs $0x1ffffffffffffff9,%rax
  39:	ff ff 1f
  3c:	48                   	rex.W
  3d:	b9                   	.byte 0xb9


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
