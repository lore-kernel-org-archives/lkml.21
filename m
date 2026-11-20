Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178899;
	b=dhxm+JY0+y0ltbaI4fwmqSz0JrjdpkMKNOLp1QgiOhs7L931fULvizMLnOjZbKabVi+q
	 V4l+ZnS9yAWUw/l+kLzlFPVZphwng9RtnOm5kHs+wAlSFae4ZPLh8+CExMsCBq3L1r0+B
	 oN2pJxClCdRaZUw/+SWX6YTvYOHj4AMVxNW5DnfwhF9mQYAib/Db+iGibCDtjmBywFHwx
	 8YpLBUQfpko/7yw67Goe26nQwTFQSH6kysYkJ8lHCKQAKvvVGONL9zusqH52BZkc+gf7g
	 xvi/Uw87JlUTETlmU5YUm3345gzx3J60rlf8Mjg4i/MabCp83zaVN796o35DeZTawHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Icgma9Kv9kWZcaE/yU+qaVnjv6tg95OZMT3Yfi+/NhM=;
	b=chKbb3dYj9Vmlvbds73jQxgO+JFVeIUjCcebJ06z3yrx38ikhtk9bDBb6rV/dJOoPCM8
	 KofYOEOcD6mvfRfpqfMxwU3pu8XuNnfo6ECznM/IoV3qQfl91PMlejQ+GkISPBM5dLUeS
	 2Ex/W350hlL22TMx+6AqqTuT8/Nk22hlo2XKnpgeziuX1EZuMt9OGg39LTD2+zD3Fa7/i
	 dyU7u0eahrkwHS7lqoQfK0B4JbMeJXjDvOQxC4GUDQf2xgS0cmxx5D/Fna3RcDF5z+wsX
	 Va4zLYsco+1bUDehFkELcLSHAkrSPXcSXdOPSIG6EQYmHJw03xssdMXuQaeFdqLgBIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkjWwBw8;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AA6606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6AA6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkjWwBw8
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso148916166b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795178897; x=1795783697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Icgma9Kv9kWZcaE/yU+qaVnjv6tg95OZMT3Yfi+/NhM=;
        b=kkjWwBw8HvmIFnAFYPVPSopq5PjHqpJeOy7Cn4sXpkWKvXc63IXIwV9IH3ii89T5pW
         NX0EV23BHq0nYf0Y9RkGuz2O4npqyyODDLnWYleXUwjas7zhqbJobQeO9QizzlmE7Rfo
         mptqOKqFeIglhBoDy/VSslV/GJ3AkMLA9P/hwTEPvRi5Ln33mw5gq7eY4kmo3OQjdlT+
         BJnY8dMf0SqaFgiJ2h8IZ7eTghOIKEUn3BNAKcP56elPNlOffW9t1ZaanZSTR72s4NI5
         llgNNqu9TqzxtRQW6G27lL3QcJ777JGswQ5TKz1F+aXeeeM59iWdcTtvl6me29rwBccP
         cGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178897; x=1795783697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Icgma9Kv9kWZcaE/yU+qaVnjv6tg95OZMT3Yfi+/NhM=;
        b=kF6X70VqN7osxrgAJkcNQfNjQpGo13HwmzydkQ76HOs24KbQ82/MzG5mjL43RWEEza
         9m3yxvLHkV7oKxvejuT0CjYOdAryqfwkD1GuoU4rk4f0L8dgYg8Pe5mp47PoeBrJT9Ll
         VUUdd+/Jdwi/KBs1ZK9zX/wyzIecToyg7Jbg/O0RrWlUGnuD92BXi3bVUn6c5Uz3Sd4X
         fVmKhtxe9y5zk3MGLxay6DWLJB1/qOJ+Zu+jTJe8ynfgeiLK24uviNGHo6wuoY/PNyYa
         K8CvPyiPC21SooPNw1ic72jITzhZW6gywwv9dmBxMNLkqSwqGpX0i5/tU57Fxt0WpryZ
         uOug==
X-Forwarded-Encrypted: i=1; AL+hErF/MiR3KCq1R2KoNN+rsF2JImftGECe2Rupn/aG/Wp4bnFP49W32cFqDxeMJUg4Irt5sBJUbBh2O+A21ws=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LiVTxjfMr5c5AZCR6yWetMUa1Da45jcM6zi55O6JkGMXGKKs9
	pLFnRaPEIIaYJ/zckD2l12jifj2uDmIuXSDdw7ORChyUoj8Kpe4goZf4lAKvIReq
X-Gm-Gg: AZFdTZdnt0cAGrTyRCqx1qLE4c+IH4fq4y2RjG78t2woCvScFLpoxyOqSkxa4md3OUB
	/DVk8BVJRV8EIRoBOCLBw4aXNbeCSR143wuaBZ5tKsG1mqEp2XYcB0QWFhYlE5vyw/AaKMMyhr0
	t6vqXwxrrWo2Ku4mKHdkXEXgjrZgcP79UIKRYjZnZ1sQDCmbJSHjrPSm6EnZSPMqXcyk2K2cW6c
	nhmhJDwWIoIP1E2Fmw8z+8DjclKKMz32vIHPZkHwOAC0M4Buyat8kW93ktoG3tACpsEr9Pb864y
	1gR5aym7lpvo+pUyrTKdPVNY6BFFNvc0LqvCUVb8vaZyTh65dHVNwzSyTPKO7VADIihpModIw1J
	kLk4cD1WESEfjbwenbXrFwv0Ki5n951n3KZ9JgdsZLA+5LDvz3BzlqR4RLyNHjMmdUTtpBTucY/
	cZUW64r5xJYtTPu4FdohFMMhDoX+LmPV0su8VHj4rkVunFC8TWZm4dsRBjolQN2YA4+X1DIgtOn
	Ik0+DgCntfVQBE1BFzpDtx/1vx82KZ2UPAXcOxBD38SCUdzSDFuqBzbFVfwzqdPcfW7WxX3dvAT
	cAOhog2dSpBIvMsswp8qJyAekS/XjH1Cq6jddz7ezEncKygbbznEQFsuxapNjD8MsIOxIAPVwMh
	9GBEDxZPqW1GNbmrlRydGUPTi0OTei4DzmLNUJ1RlNSIEJFZE3TMe33wmR15/Pb5rqbwTV7UULr
	0yf97qUqSOmD+pd0QVPO2LQo/Ohcd/WsBBHFSnFSUZd7/FMXJD6Vpqe2ZhS/fVQrk=
X-Received: by 2002:a17:906:f5a5:b0:c46:6a50:40c2 with SMTP id a640c23a62f3a-c513ac7e167mr291983866b.39.1795178897193;
        Fri, 20 Nov 2026 04:48:17 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdf022sm91768466b.67.2026.11.20.04.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 04:48:16 -0800 (PST)
Message-ID: <ed43cd15-5740-4f45-88a2-0a700962d7c3@gmail.com>
Date: Fri, 20 Nov 2026 13:48:15 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [exfat?] WARNING in vfat_update_dotdot_de
To: syzbot <syzbot+b0aebd03565f5774f7f8@syzkaller.appspotmail.com>,
 hirofumi@mail.parknet.co.jp, linkinjeon@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 sj1557.seo@samsung.com, syzkaller-bugs@googlegroups.com
References: <6aa82300.a211d2ce.1a5198.0295.GAE@google.com>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <6aa82300.a211d2ce.1a5198.0295.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 18:38, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    5225b8eec4c9 mailmap: update entry for Jens Axboe
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=11cd61f9580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
> dashboard link: https://syzkaller.appspot.com/bug?extid=b0aebd03565f5774f7f8
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11b455f9580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13a1b615580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/fdabe739a017/disk-5225b8ee.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/ef60d7040756/vmlinux-5225b8ee.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/ccb7b942e430/bzImage-5225b8ee.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/be5074fab5f0/mount_0.gz
>   fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=16cd61f9580000)
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b0aebd03565f5774f7f8@syzkaller.appspotmail.com
> 
> loop0: rw=8912896, sector=102, nr_sectors = 1 limit=63
> syz.0.17: attempt to access beyond end of device
> loop0: rw=8912896, sector=103, nr_sectors = 1 limit=63
> syz.0.17: attempt to access beyond end of device
> loop0: rw=8390657, sector=98, nr_sectors = 1 limit=63
> Buffer I/O error on dev loop0, logical block 98, lost sync page write
> ------------[ cut here ]------------
> !buffer_uptodate(bh)
> WARNING: fs/buffer.c:991 at mark_buffer_dirty+0x299/0x410 fs/buffer.c:991, CPU#0: syz.0.17/6146
> Modules linked in:
> CPU: 0 UID: 0 PID: 6146 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
> RIP: 0010:mark_buffer_dirty+0x299/0x410 fs/buffer.c:991
> Code: 4c 89 f7 e8 a9 01 d8 ff 49 8b 3e be 40 00 00 00 5b 41 5c 41 5e 41 5f 5d e9 74 52 fb ff e8 ef 00 68 ff eb 8c e8 e8 00 68 ff 90 <0f> 0b 90 e9 a5 fd ff ff e8 da 00 68 ff 90 0f 0b 90 e9 cf fd ff ff
> RSP: 0018:ffffc90003b57858 EFLAGS: 00010293
> RAX: ffffffff825fc9c8 RBX: ffff888076b98460 RCX: ffff888020348000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000002
> RBP: dffffc0000000001 R08: ffff888076b98467 R09: 1ffff1100ed7308c
> R10: dffffc0000000000 R11: ffffed100ed7308d R12: ffff88806768a434
> R13: 0000000000000000 R14: ffff8880544440b0 R15: ffff88807688ba08
> FS:  00007fa0804ca6c0(0000) GS:ffff888124cd2000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007ffdc870d998 CR3: 0000000035986000 CR4: 0000000000350ef0
> Call Trace:
>  <TASK>
>  mmb_mark_buffer_dirty+0x2c/0x1f0 fs/buffer.c:624
>  vfat_update_dotdot_de+0x90/0x1c0 fs/fat/namei_vfat.c:917
>  vfat_rename_exchange fs/fat/namei_vfat.c:1140 [inline]
>  vfat_rename2+0xe3e/0x1c90 fs/fat/namei_vfat.c:1171
>  vfs_rename+0xbd9/0xef0 fs/namei.c:6208
>  filename_renameat2+0x533/0x9a0 fs/namei.c:6326
>  __do_sys_renameat2 fs/namei.c:6355 [inline]
>  __se_sys_renameat2+0x5a/0x2c0 fs/namei.c:6350
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fa07f59e159
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fa0804ca028 EFLAGS: 00000246 ORIG_RAX: 000000000000013c
> RAX: ffffffffffffffda RBX: 00007fa07f826090 RCX: 00007fa07f59e159
> RDX: ffffffffffffff9c RSI: 0000200000000480 RDI: ffffffffffffff9c
> RBP: 00007fa07f63503b R08: 0000000000000002 R09: 0000000000000000
> R10: 00002000000004c0 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007fa07f826128 R14: 00007fa07f826090 R15: 00007ffc6d0e6af8
>  </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

-- 
Krystian Kaniewski
