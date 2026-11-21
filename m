Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795305225;
	b=CBWLkHrnzNMNR/yKzztzRRU+AsXtw7cAamODODs04S6gijIhiEsaAD+J35+xvUaBN+6m
	 Sf7J3RaMJp2dd5f9Z36AErxXe946+gz8ldL9YO7Tk767KlLfseV+n0KXeJf/V4ZOD8ieL
	 w4JWLqoA5Sdho8siy2S8+mWYvD15aKXlztCiC87+kDRyflFICPv4hTQ5o306sdTWDLiLo
	 bW0Rofv6X3ZMJIvMxPWWtELRF3h9zH+5XesOt0vOlywbdaHOP4HD4dghaip5LZAY3Q6Qu
	 KibUqaIMvytLBbViNgLDoiymgi7SOyROOB1xda8pXBwEmhWvr06t23R+F1IhpqIL43g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795305225;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=vZ13yZUDXEAiLgw52sVTkt2jSZ2fFyk58zq45eFLEyo=;
	b=MdlwemBJqbprJl4cp1JQUi/2tqbnb5HQDaDeM5m2Je9VZSjw6fXJs3Jc2DFlV4zQpmIy
	 cvX22usgsE4ll5cZ+tjoOpJHmLU0yncNF0YKPxIrB3/Eh9xiO3Kehgke5r7f7xjN9lwfh
	 lhxIyrAt0a0fFdzRDIm9A03AoreyR8ou3+KpLXbrFilCqjg4lT9UcWJS+w0aq3MG6UN/O
	 WZ3DwesuCULLfY7sA6kagZkV4iq7qKh/w8T5jwdV+xPF141rmAl6ALAUb7szsmfMtO6cu
	 6l++Weq4+0Rhbm9cNLWTBRTnZyO1wqa1+2SgqiuFKJNvJ6oPUXMSMtfaLB0HNb8CwKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9573606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9573606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4dab94dc3e7so5189547b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795305224; x=1795910024;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZ13yZUDXEAiLgw52sVTkt2jSZ2fFyk58zq45eFLEyo=;
        b=R+tg3JcgLKX1DUhFSuUACn3DhXkrJAmcu7nOCGrb9VvAIStkHFXrlJ+1/eoVqmPFtC
         bVloimHtjbb4TIh/6xEmaSRRFfgyAa0ZEFkTd9KTB9Z5NbHNjCsvAea0VHfH7wnTBTzM
         90owSNZcpvLtrgqOMyCQtNxjITDxVLjVj5zGWRzNV8crU4bdaLShJAbRqJZZsmP5ZQaq
         dgEB1d7wh9Yr6RPLIYPkPdgt4xgCMF6sirZlROcoI37d9Uol5h9MlH3D0pljaD3yEm9C
         arNMYyIPROosW0PwTHOnhojKtpaHL50b7oq+nVs/YSFC3IwWTKnb2zJPdzdOGj2fPvVv
         XBfQ==
X-Forwarded-Encrypted: i=1; AL+hErEPhRDLkGt+fxz8PjzsGEes3eibFDlnlAaiwIS/8xV0gSeh2HGAJLmHdasyFoKosMvW+QtAXO3it9BcLpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9doIRFzjRuh/8EKCnZktkMS2UqAF4rUMDzW332l8LAELQcrV/D
	Z2RQFdnADS+LVfemL9TlSjs9Xwq0FbyrTX5YQ7seNxUKP/lEJ8cVNEMRWxPQov3ShzvP526mEvi
	Dbu6iDNAGn4tcKKZpCTbbcqOJgCbunmGzfY8Tak/QyLI8R9H4NSZyAIBUMAg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1386:b0:4f4:d7:b15b with SMTP id
 5614622812f47-57a06c1b02cmr7326661b6e.4.1795305223709; Sat, 21 Nov 2026
 15:53:43 -0800 (PST)
Date: Sat, 21 Nov 2026 15:53:43 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b022f07.44b41460.34b83f.0017.GAE@google.com>
Subject: [syzbot] [jfs?] WARNING in jfs_rmdir (2)
From: syzbot <syzbot+9c3df8acb6283d0cf12d@syzkaller.appspotmail.com>
To: brauner@kernel.org, jack@suse.cz, jfs-discussion@lists.sourceforge.net, 
	jkoolstra@xs4all.nl, linux-kernel@vger.kernel.org, sforshee@kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d0f871bfb831 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15d3bc11580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d16c0eae9c338e3c
dashboard link: https://syzkaller.appspot.com/bug?extid=9c3df8acb6283d0cf12d
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9be5c77a65c2/disk-d0f871bf.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/71f40d657e8b/vmlinux-d0f871bf.xz
kernel image: https://storage.googleapis.com/syzbot-assets/66c9f33ae1f0/bzImage-d0f871bf.xz

AI-generated root cause summary:
When JFS loads an inode from disk in `diRead()`/`copy_from_dinode()`, it only
checks that `di_nlink != 0` and copies `di_nlink` verbatim without verifying
that a directory inode (`S_ISDIR`) has a valid link count (`>= 2` and consistent
with child subdirectories). Consequently, on a corrupted JFS image where a
parent directory `dip` has an insufficient on-disk `di_nlink` (such as `1` while
containing subdirectories), removing a subdirectory via `jfs_rmdir()` (or moving
one via `jfs_rename()`) drops `dip->i_nlink` to `0` while `dip` remains live. A
subsequent `jfs_rmdir()` on another child directory unconditionally calls
`inode_dec_link_count(dip)` -> `drop_nlink(dip)` without checking
`dip->i_nlink`, triggering `WARN_ON(inode->i_nlink == 0)` at `fs/inode.c:408`
and underflowing `dip->__i_nlink`.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=9c3df8acb6283d0cf12d

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9c3df8acb6283d0cf12d@syzkaller.appspotmail.com

------------[ cut here ]------------
inode->i_nlink == 0
WARNING: fs/inode.c:408 at drop_nlink+0xc5/0x110 fs/inode.c:408, CPU#0: syz-executor/5603
Modules linked in:
CPU: 0 UID: 0 PID: 5603 Comm: syz-executor Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
RIP: 0010:drop_nlink+0xc5/0x110 fs/inode.c:408
Code: 68 09 00 00 be 08 00 00 00 e8 97 2a e9 ff f0 48 ff 83 68 09 00 00 5b 41 5c 41 5e 41 5f 5d e9 92 8b 29 09 cc e8 cc 72 75 ff 90 <0f> 0b 90 eb 81 44 89 f1 80 e1 07 80 c1 03 38 c1 0f 8c 5b ff ff ff
RSP: 0018:ffffc9000529fc30 EFLAGS: 00010293
RAX: ffffffff82528194 RBX: ffff8880678164d0 RCX: ffff88803564ddc0
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff21ab838 R12: 1ffff1100cf02ca3
R13: dffffc0000000000 R14: ffff888067816518 R15: dffffc0000000000
FS:  000055559535d500(0000) GS:ffff888124704000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555595390ac8 CR3: 00000000414ec000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 inode_dec_link_count include/linux/fs.h:2276 [inline]
 jfs_rmdir+0x416/0x850 fs/jfs/namei.c:395
 vfs_rmdir+0x3e9/0x700 fs/namei.c:5533
 filename_rmdir+0x276/0x510 fs/namei.c:5590
 __do_sys_unlinkat fs/namei.c:5765 [inline]
 __se_sys_unlinkat+0x71/0x1a0 fs/namei.c:5758
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff7bfd68677
Code: 77 01 c3 48 c7 c2 e8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 b8 07 01 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff92aabc68 EFLAGS: 00000207 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 0000000000000065 RCX: 00007ff7bfd68677
RDX: 0000000000000200 RSI: 00007fff92aace10 RDI: 00000000ffffff9c
RBP: 00007ff7bfdf751b R08: 0000000000008580 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000207 R12: 00007fff92aace10
R13: 00007ff7bfdf751b R14: 0000000000022252 R15: 00007fff92aaefd0
 </TASK>


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
