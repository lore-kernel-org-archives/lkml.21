Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071632;
	b=p7WNeQo65TevXw6wrKJolyJDIwvRrBk3VazrZFVF+7E4ly5LFxhONN/zowlD2TT4e8Ym
	 zG4dzqUDUBeuX7kDDMa76G0MuxU/VQ8o7yfILywq7FqBcIOUGs8ovb05VvaRvCc7h4Ko1
	 B5v+REwzZe1oFQZED7+laCOTkfvA0HUP0ujYOStGcLHNgbhY1VNoeN8Y8bV+fHV1slzg2
	 AJaDeNQo20/c0YdN9dIGpMF+raMntcvLKMGN0np6Od1RcK1z6ovfv89PfbFniQ/acGTz7
	 /9pIi6tSJYJXsA4kMPgg26T9sILL5vOW1vO10SKE4YilpbcNaoPyptVbd1co4quX+tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071632;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=43dOOzPr4kWGfR+oDKr9fjX9nu8m4LA8+j1vqIMP6kc=;
	b=JRFPVFw8cb7q673NbmNE629NQWoqk6YifwDpLrrWieZwQDMSwGIgErb+wAjyy2EShU8C
	 TyaEuuGoOIR/MfhVTAK31vUlbSTql6nHzvW/9hPxgFJ9qCeI0XceieYZdn4TM1ZT4Jukj
	 2JTfvenKOk4RTgyJHdZ4VvIxiV+uba40bqUjDzzulSGthX+TQVpNh2h/s980AZnkb9PL9
	 bmo4JOmWWGkRJ1y+Pkc6co4MxwyBiCqfDqeYK2ruORe9AsmBjryY36ZNXM9QVPs5lQWEW
	 f9PULp6z8jM2ksey8OBla1V5960UNIyhagR/XWZz1VBlxtExIaVrgtV37TPHNf8BPQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24DB606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D24DB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-85c1135c289so1435480a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071630; x=1795676430;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=43dOOzPr4kWGfR+oDKr9fjX9nu8m4LA8+j1vqIMP6kc=;
        b=KdXR8gpKMiBfU/YZbwKm/vP/yRC19jZb5MCwIvp1OpRJ+ktqYm9g1fE3dKpLqTv3GQ
         1rTlRfp8HIp6IRh7Prq7fRNC5ZLpvfXVlxuKfPrZjVIQ/sRRneTyduMVFPPFSAZFQjDo
         98Dp7um7Up34Yy2EjqYc6h1lzSH9nZt150fOtbLY1yx7faKca37MxYmpBf2Jh3wdqF4a
         E9fvgxkXZlF7xHb66FnHSUBTVpOhuG7fwgjU9ukRfqBwX347QGbwbP/WNKnB8/u8Dxt4
         3tXMnt2pXCALeosXoGq6EtSzlGHp+YWeM8yutQ46OCZDnrS8SSSgnEdlCJzURz69oxQC
         bOCA==
X-Forwarded-Encrypted: i=1; AL+hErFok8wgmeYoS9I45fAolrQYf5MU/GTnWOwKKJPACCihm1sKfIphzh5G9NkDrWUgK7W9R01z0TZPI0U4AhE=@vger.kernel.org
X-Gm-Message-State: APuU4Z82Frsf4ZO4akuY2aW52QNzkjw/pQeE+rVHLarz3PEeDktEAZxI
	TTKb9KSM/02FJaUyRpJsPjDp6d6ICJUjKYQTj7oSDbZoQDhCANZ+hOabvDJIDOIqx14YdaDlJCI
	fkxkiLcTTL86z7V9Ic8AXbOCdWeRyELu2H2zji7CB35qUBb5vnOMo6LgNMNg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5088:b0:4a4:744:a4ff with SMTP id
 5614622812f47-5773db24bc2mr5642223b6e.4.1795071630660; Wed, 18 Nov 2026
 23:00:30 -0800 (PST)
Date: Wed, 18 Nov 2026 23:00:30 -0800
In-Reply-To: <20261115075832.132109-1-xu.xin@linux.dev>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afe9e8e.92f98041.20636d.0002.GAE@google.com>
Subject: [syzbot ci] Re: mm/ksm: clean up scan_get_next_rmap_item() initialization
From: syzbot ci <syzbot+ci7e1f981ab411668d@syzkaller.appspotmail.com>
To: chengming.zhou@linux.dev, david@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, xu.xin@linux.dev
Cc: syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot ci has tested the following series

[v2] mm/ksm: clean up scan_get_next_rmap_item() initialization
https://lore.kernel.org/all/20261115075832.132109-1-xu.xin@linux.dev
* [PATCH v2 1/2] mm/ksm: extract helper functions for scan cycle cleanup
* [PATCH v2 2/2] mm/ksm: add initialization helpers for scan_get_next_rmap_item()

and found the following issue:
general protection fault in ksm_do_scan

Full report is available here:
https://ci.syzbot.org/series/cc51d824-2b5d-4c6d-bd56-c5bdb2bf5e12

***

general protection fault in ksm_do_scan

tree:      mm-new
URL:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/akpm/mm.git
base:      3dfc09a9493ddaa5e7722a29165d8450b55b4d3f
arch:      amd64
compiler:  Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
config:    https://ci.syzbot.org/builds/6f9c12e2-f68e-40ee-bbac-84e33b709dfb/config

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
CPU: 1 UID: 0 PID: 44 Comm: ksmd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
RIP: 0010:ksm_do_scan+0x5da/0x6f40
Code: c7 05 86 a2 b1 19 00 00 00 00 48 8d 43 28 48 89 05 9b a2 b1 19 48 89 4c 24 40 48 8d 59 20 48 89 d8 48 c1 e8 03 48 89 44 24 78 <42> 80 3c 28 00 74 08 48 89 df e8 47 3a 01 00 48 89 5c 24 30 48 8b
RSP: 0018:ffffc90000b47a60 EFLAGS: 00010202
RAX: 0000000000000004 RBX: 0000000000000020 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc90000b47c08
RBP: ffffc90000b47cd0 R08: ffffc90000b47c07 R09: 0000000000000000
R10: ffffc90000b47bb0 R11: fffff52000168f81 R12: 1ffff92000168f68
R13: dffffc0000000000 R14: ffffea00046aca00 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8882a77fd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f15aa3f8c38 CR3: 0000000170aa2000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 ksm_scan_thread+0x114/0x520
 kthread+0x38b/0x480
 ret_from_fork+0x514/0xb70
 ret_from_fork_asm+0x1a/0x30
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:ksm_do_scan+0x5da/0x6f40
Code: c7 05 86 a2 b1 19 00 00 00 00 48 8d 43 28 48 89 05 9b a2 b1 19 48 89 4c 24 40 48 8d 59 20 48 89 d8 48 c1 e8 03 48 89 44 24 78 <42> 80 3c 28 00 74 08 48 89 df e8 47 3a 01 00 48 89 5c 24 30 48 8b
RSP: 0018:ffffc90000b47a60 EFLAGS: 00010202
RAX: 0000000000000004 RBX: 0000000000000020 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc90000b47c08
RBP: ffffc90000b47cd0 R08: ffffc90000b47c07 R09: 0000000000000000
R10: ffffc90000b47bb0 R11: fffff52000168f81 R12: 1ffff92000168f68
R13: dffffc0000000000 R14: ffffea00046aca00 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88818bdfd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c27b575 CR3: 000000010233e000 CR4: 00000000000006f0


***

If these findings have caused you to resend the series or submit a
separate fix, please add the following tag to your commit message:
  Tested-by: syzbot@syzkaller.appspotmail.com

---
This report is generated by a bot. It may contain errors.
syzbot ci engineers can be reached at syzkaller@googlegroups.com.
