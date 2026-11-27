Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754012;
	b=o+ff1ZJa8vcVcixO6J2JnojLh1Aicy+Zo6xJRk24KWElRTOInlNUCW2GBROXws8jjPsn
	 FUhy2Q592JKbq1zifvKPO23ovelIPIvuSZO7IJGw9KjfXW5CtE9Yu4SZR0j0Ryzktbu6d
	 qHwxmTbduXmTY2+zkAWVqePBObivE/kNRZ79zuvw9VGpXZZhkDc7XS8ZyXk5TWSSC2BC9
	 VOEuzSAFFSvZFv0j2N1RVt0pBAtHOSVhB72aa26cNxgKcks9gGa6U62UYVb+z3d1uEHoA
	 WQ8wVQYHBMHRp0y6Z/kcYR8fjSk09jl43SBwWh6MC29mm+JAR7XuhLyIczCGL+mO5sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754012;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=Vram2VEPZ6TSrLowbma06z/hID5VuOhEI/blIWrMXAA=;
	b=LV37DF3e+g08SegWnK+IJB9SldMav/sD681GIFrEBrSXjP8J0APbpE0NIIeQEOnxHqJj
	 GaLBMXno6kvRkRJJsARJJUXOnuN025lejKLmbKpff8tGvKdh7VfRT6Le+21Lb9pVRuvHw
	 +fTqF5EzD7NJlGI0aoOxO+WxzA4nSkBkJHeAz2jiiduJoJfzugtDfJyNIlTPZqsagJI3t
	 LkXQHyk676+LfL1js+gUkK1m6DgMsuHFl2kksHVGLPt6Z4cjD7ckaTSVsikKWr+lVPbOv
	 u0X8e/mwrbVz0BEc9Xy/OzgawuI/SN08dl6ZERLJExc7FyVEdZoXFxNZ6Z4k3LjzElg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3D6606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F3D6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-540537f959fso7672157b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754011; x=1796358811;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vram2VEPZ6TSrLowbma06z/hID5VuOhEI/blIWrMXAA=;
        b=HN0mSsslxqVxJS5190SrVEeBWpBfKSdJQIMXP4ntYgPGVmYfR/hdHZEp1zH6j3l6X6
         zOeZ7TcjeussBbeGK02dNOik7pWaPkqPSvqj4tySBMzQUQB3LiVrOFsYVGRNXKqMwmcg
         geddOlWlTT/z/ETkmocaujOxYKhidqIyjzmL75VroKn7kTJcUvX9+0oJ6nNJHa2CMOkW
         TUad0gufhkSr0YXLgQ3iAlasGEyzfGVMLsEm1hk5l2itv0JTUW4sIvGpaN8bY4U02OiA
         eNnDvOfRz8UiMkHXHA14MlhzkF3AwNL2GlDgHOy+MYngLYWr5Yt7CeUXdKbyVkmIywwI
         7XFw==
X-Gm-Message-State: APuU4Z+8skFchnYIwIr1GrWcHNLDZF+UFHG3bI9pdueTMEx3RXlTWKyq
	zIkzi9j4TECS9wQrrGtadB7rxjN6MT2Nfuo4iqheN4fFoKY6Mh4OfKU3BqK0/2kZ4TzPAGFyMxQ
	n8JNZsTEo3KOoFVRM9E93fWt2D18lh6RCwA2pLOKUAQ7QCkZZ0zEYs3S3tZ8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3084:b0:55c:844:98ff with SMTP id
 5614622812f47-57a0a93940fmr26505143b6e.34.1795754011609; Thu, 26 Nov 2026
 20:33:31 -0800 (PST)
Date: Thu, 26 Nov 2026 20:33:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b09081b.904258e1.78503.002e.GAE@google.com>
Subject: [syzbot] Monthly net report (Nov 2026)
From: syzbot <syzbot+listaf042537503196db2c57@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello net maintainers/developers,

This is a 31-day syzbot report for the net subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/net

During the period, 4 new issues were detected and 5 were fixed.
In total, 51 issues are still open and 1840 have already been fixed.
There are also 35 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  21752   Yes   unregister_netdevice: waiting for DEV to become free (9)
                   https://syzkaller.appspot.com/bug?extid=e2af46126e0644cbebdd
<2>  1084    No    INFO: task hung in netdev_run_todo (4)
                   https://syzkaller.appspot.com/bug?extid=894cca71fa925aabfdb2
<3>  1017    Yes   INFO: task hung in tun_chr_close (5)
                   https://syzkaller.appspot.com/bug?extid=b0ae8f1abf7d891e0426
<4>  647     Yes   WARNING in inet_sock_destruct (6)
                   https://syzkaller.appspot.com/bug?extid=5b3b7e51dda1be027b7a
<5>  576     Yes   INFO: task hung in nsim_destroy (4)
                   https://syzkaller.appspot.com/bug?extid=8141dcbd23a8f857798a
<6>  31      Yes   INFO: task hung in inet6_rtm_deladdr (3)
                   https://syzkaller.appspot.com/bug?extid=55141a0ffa0d17f01c71
<7>  3847    Yes   INFO: task hung in addrconf_dad_work (5)
                   https://syzkaller.appspot.com/bug?extid=82ccd564344eeaa5427d
<8>  2081    Yes   INFO: task hung in switchdev_deferred_process_work (3)
                   https://syzkaller.appspot.com/bug?extid=d6bbe0f5705cb8a5aa2b
<9>  1202    Yes   possible deadlock in __dev_queue_xmit (3)
                   https://syzkaller.appspot.com/bug?extid=3b165dac15094065651e
<10> 1200    No    INFO: task hung in addrconf_verify_work (10)
                   https://syzkaller.appspot.com/bug?extid=95263979a9c3af871646

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
