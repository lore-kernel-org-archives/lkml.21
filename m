Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795816653;
	b=aPwExS3V4PgbU/j3Q4hvE/9VlC6em7GUTkqzByem68XdtqVpSlhRe1A8nQ+FoxOrslSj
	 x//d3hSDhXrEDSvGDxpGGMKWO3Zfaplwl1piP5HB5+ooLT6gqabU1mabDKMhIUdjo9cAi
	 QVMZhlSQ5dOwdh7TVnhahi2ISfHN+3vZvgQfN19wk3MDv35f9fmsSqpsm4wu9R/EZk+uM
	 09TAd7tHBk8G9lODEVNRe3rLoVd4DzvYqNvddrq7x/Bdyx/HnE6SPV0vs6JUIupzoYced
	 uHot2TnFNhY1jOh0nedDdvdRGYvlZN0LIjxeEivLXaRWNKtnAb6Gb9QULss77+iZSjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795816653;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=6h2Be5vq4BhohYg0FpSh9pBi8qTo4Axywk+YvYQQYPk=;
	b=SfMmqvDH15qdPDDDMftgZmolSGh7du/tfQQ2q0Kvri4Y7n8ts70claQB5jxgHSt81cCv
	 BxMXEt4y8S6d/wJFZGxCsOw2asMMMZnTTAavZQGDUXPR+/F0rCfzzrw2u62WJ9siKNZ+R
	 4/mCOHc3PmKDXyn65TUGdMwRLOMx1etaoNglAqm/HJh0JgSlu8qyvwP6zCE0UCeHhun20
	 K0TGT0KhDyDbCSbvzDPBBRF7VWDINCTnVoR245YZ1rf9AupP1uSZLmRQ7B4OvURLoJ9bN
	 XHaPaA7XCotPgRTJySrZ9SqqyRksRzoG8oAa3KR96OcCGd1uGZg/F0lr+wOTvC7FTLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3AF606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 21:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D3AF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c7f887ac6bso13828576b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:57:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795816652; x=1796421452;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6h2Be5vq4BhohYg0FpSh9pBi8qTo4Axywk+YvYQQYPk=;
        b=mLLY46qCaYwkWm9t9ZZZtwUsykfnc0d8TtgRSlwOzDlwez9Ue91t1iCDFU8Nxe7tBm
         x3GjJEU+6M6/eHz4dZK6+Xv4EqkXQpfbINIyGVYOD6+5skdXhhFcHnLc92zwjPxBM5YY
         DczBt6vkj773eUd9tkGiWc/uVrY/80Ax4a9Qq1nOycbGqp+Jlo0ra8sBhMRM4TSmHKd7
         kA2L/3Ij9Z9l6g95aJULZySydFA1T4AcyU+yPrRjoBLuLXVXGGmmW++/8XHoAUY1nFNN
         VP94BZvkZD/inTdaxjEw8yLXLf9tU6gsyFgkMzI55ITSkJHZmHU7YO3HAA3up7/8tWdv
         ZwZw==
X-Forwarded-Encrypted: i=1; AL+hErGs2BVqxtiUrod66b2kWFR0thRnk6gCRh+7uvlSLOjP/rDLkBaWYAB4MuUK3LMNX3XIP+J4cG0tpkU0pKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cAqwRMmK89FmV1Vc+Daa2SfDsBE/u4a5XXWTaXOafJnXm3g+w
	l6Gr+TUVr1A1s4lVaF10E/8sRHOWLz9J9I2K/uh1vfPyvzfwibqEQvAW0bhGORl9L06wfQjO8eI
	gCnWTnM22sHEDtR6iQAzFF2ODadj3dtQCLa6MvHR7zVdwXjDyvqDcsHCe9qg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1911:b0:4df:5cd0:89c1 with SMTP id
 5614622812f47-57a095040ffmr27187642b6e.23.1795816652578; Fri, 27 Nov 2026
 13:57:32 -0800 (PST)
Date: Fri, 27 Nov 2026 13:57:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b09fccc.15291bde.1a1328.0230.GAE@google.com>
Subject: [syzbot] [block?] WARNING: lock held when returning to user space in blk_mq_freeze_queue_nomemsave
From: syzbot <syzbot+0c1cc7a4dd90af186bc8@syzkaller.appspotmail.com>
To: axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    822ba3a89c78 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17f77865580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=284ed4d28353a6ff
dashboard link: https://syzkaller.appspot.com/bug?extid=0c1cc7a4dd90af186bc8
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=113c81bd580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98fce4d0b21b/non_bootable_disk-822ba3a8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/69ce5f1e81fa/vmlinux-822ba3a8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/21de7918f654/bzImage-822ba3a8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0c1cc7a4dd90af186bc8@syzkaller.appspotmail.com

device-mapper: ioctl: device has been removed from the dev hash table.
================================================
WARNING: lock held when returning to user space!
syzkaller #0 Not tainted
------------------------------------------------
syz.3.98/6416 is leaving the kernel with locks still held!
locks held by syz.3.98/6416: 1, on CPU#1:
 #0: ffff8880587709e8 (&q->q_usage_counter(queue)#59){+.+.}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x15/0x20 block/blk-mq.c:206


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
