Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404641;
	b=ybLLNYdLRKbGk4SWvSu1zQXxRjD7j7L0GZxXPFuJWq7eJuJt2NLT7ZL2JIRWVuY4wdiq
	 BkPFjJw6zIJjaxulSFwOtUX8oMf/dESQVsw4XCCHyoGdzhSph/PDe1Eiy+ZOHcWYZehmw
	 VNCG75X0j2eakmmCcYmO8xSjlLdy/Iqp00SiHJFQGh55L8Lb/jLB4FiRsYrKhJKWg0HXr
	 tG1C/CcQj4qcIcDVZ+j0SIth9KY5pSwiKipCe4tbeMhmoj66vQVTcZpjB+J5Et4YV36r9
	 Z2AtdqBSTzH3XshY6q4xe9JwhUccYEV0iaVlb7XuujVSICUTJfWkNFGN9Y7FsOG8BPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404641;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=E8mORyd0QfItWSNlAxZGX4Z+8vVzlb1pdZBu2mZMk3A=;
	b=gh4lknsU/1ExjmzVAsmp2ptYoerOtkFiDvYHib2Ab4r3Ia7yCzUFLWMRqOn+wvWsyEqH
	 0d74jjqNWHP8EdRmqVI1kEKK15dOI+TPh/WV7AI2b7x9UPv3koj/yCZpX18BNA4rLkQXX
	 +OP3bQpXbhSpEpjs85hvVfsni1DRSFLP4+r/Gzqnw4CakhyEd8r5xzP0RvSAqDqK2ZBEr
	 UtpZPicazpR+zsh4oFJoMcQCWq0+HznT6Y7Qf/6Hv3CcBqBEvXVIr84es2Ar1KP+nmHg2
	 f81kmjaCxxEdxe6oMLlS8mjCO+ktiI2Sh/WdoYMxX3ArqinM81iKNF1w8loq9sHclmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4122E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4122E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cc89e86e9eso3547694b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:30:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795404640; x=1796009440;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E8mORyd0QfItWSNlAxZGX4Z+8vVzlb1pdZBu2mZMk3A=;
        b=ct60TfJP+NhaUA08juMhtrWYTnkAj8KoWLpGnEdgVEMAejtfJ3n7zkB1hLqyOj+0BJ
         XeO2UDhWWasJWLLHwNqAQzKB2CetOBGUg3v9NmnN/RNuKyXPwyB2Bbo/W6Y1X+W81tNf
         rMHECaCeDyqvwom0C6h0mJRmdIpqMyEDaIGtLAD0O6C5cZ9wpH04sQfOu3Y1sXmAaBej
         iTK64V1YQLy1jRY+HkWOomsmsWJiYCNskEoe8gQLDmJq9cxdCbCKruJc/Fqm+nAFFXgw
         mXvUJhhIne/Cs2IJm0qwL7d/Jl0LsiMBFFKjCK6t7JmbvYTSD9m4VTLMySsqnlHhTtlT
         qPUw==
X-Forwarded-Encrypted: i=1; AL+hErEhs9PjCTXNxqsUht6iE0kC8CrORBwVEYS/IXRnOGjHDtspIp4LlLq19duOSE+fCQtCoy+qv5tUzOGHGIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0qO489lbXMoPYrqBkG3/WcgkNxeGL+UILpVfxsm+2ta8nqLS4
	k4LaT0OktquqgX7HSNbKp7+qF2XcXArTexHuXipXy8pz242mRiGRVcVLx3Ufs7l3jFGCwaM20Qo
	pDHeKadpYE8sokP1HRobwi/CwSLP/JdIF1z7deOE0Bl8ZpPZ4vk0Kg2rk8kA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f0e:b0:54e:7cf0:c0b9 with SMTP id
 5614622812f47-57a0d2f1a5emr11534354b6e.64.1795404640210; Sun, 22 Nov 2026
 19:30:40 -0800 (PST)
Date: Sun, 22 Nov 2026 19:30:40 -0800
In-Reply-To: <6b022f07.44b41460.34b83f.0017.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b03b360.6ccd1e40.868ea.0024.GAE@google.com>
Subject: Re: [syzbot] [jfs?] WARNING in jfs_rmdir (2)
From: syzbot <syzbot+9c3df8acb6283d0cf12d@syzkaller.appspotmail.com>
To: brauner@kernel.org, jack@suse.cz, jfs-discussion@lists.sourceforge.net, 
	jkoolstra@xs4all.nl, linux-kernel@vger.kernel.org, sforshee@kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    4843f6873f7c Merge tag 'sysctl-7.04-fixes-rc4' of git://gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=146547be580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d16c0eae9c338e3c
dashboard link: https://syzkaller.appspot.com/bug?extid=9c3df8acb6283d0cf12d
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=167624ff980000

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
WARNING: fs/inode.c:408 at drop_nlink+0xc5/0x110 fs/inode.c:408, CPU#0: syz-executor184/6031
Modules linked in:
CPU: 0 UID: 0 PID: 6031 Comm: syz-executor184 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
RIP: 0010:drop_nlink+0xc5/0x110 fs/inode.c:408
Code: 68 09 00 00 be 08 00 00 00 e8 97 2a e9 ff f0 48 ff 83 68 09 00 00 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc cc e8 5c 69 75 ff 90 <0f> 0b 90 eb 81 44 89 f1 80 e1 07 80 c1 03 38 c1 0f 8c 5b ff ff ff
RSP: 0018:ffffc900037d7c30 EFLAGS: 00010293
RAX: ffffffff82529bf4 RBX: ffff88804513d180 RCX: ffff888030ee1f40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff21ab9f8 R12: 1ffff11008a27a39
R13: dffffc0000000000 R14: ffff88804513d1c8 R15: dffffc0000000000
FS:  0000555591620400(0000) GS:ffff888124701000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000562584310124 CR3: 0000000034aba000 CR4: 00000000003526f0
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
RIP: 0033:0x7f0f3afa4c47
Code: 77 01 c3 48 c7 c2 d8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 b8 07 01 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd2507eb08 EFLAGS: 00000202 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007ffd2507eb10 RCX: 00007f0f3afa4c47
RDX: 0000000000000200 RSI: 00007ffd2507ec70 RDI: 00000000ffffff9c
RBP: 00007ffd2507eb30 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffd2507eb70
R13: 00007f0f3b001ece R14: 00007ffd2507ec70 R15: 0000000000000000
 </TASK>
