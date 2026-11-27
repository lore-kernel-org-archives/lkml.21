Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754012;
	b=Lko3MM+QX35IpHfmniAiCGS8QkHZZtNa+lrLBPSfKqC68NtiUTzeXL7tfQQOdRPugMrX
	 mTO8rauu0fTTzEEFu6Unz5IcI7WUBbER7zNfyavF3ZTps3R21xO2Yu0uguoEK/gzyQ5ea
	 AiU4HKonBQWnJPH4z2sGk+W7sYCxOnrAzdfIb56y1pTlAe7RVKtL4rkeV/HHYX8OHFXKn
	 gIl8XNgc7bLkTGSxGWHBlpP2DFUjcveQ8jXeYqIvOMFFMoCqfN81pDNCkQW51Nq/OYxfJ
	 EoRa8xev3kSYDumH+fCyiEp5RWgc0vaV52visyvmt8bTM9LvmozwWmxkc4x4QJM4HUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754012;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=RtCl9bLKvCJGn7zLPcTxsOwpUTUjtSTIamyZWGlNDQI=;
	b=mcFxlYnumhTFwPrC80sXesqLW+7qCl7jZpPsD+J8nWKMi8cWE9xC1tsSRRtMKgYJCoK6
	 LUakTPJa6m+qCdwZaJCu51PHcfSgnVUUNMca6XjIzpBNFwATeeJfQY8aDBztnVyPkR6XC
	 aesgibC4okZgB9kfwAJhM8njqVPJ4dBx4/eSh2Edh8WR6PL7mkVVbHTtuzjP0AU05I1ob
	 tNGBV5Dv55gwMMEdIQ5bE6i4i1ArS7C9b34eo3POME5i2uysR3zuFVOJp++lobmCf3V3H
	 /UB0q/lp98tepAUAQZm5iHyWzM+HZRJN2hOx2yJUQ8+wDWHWrg0laW/ULR1u92LjYpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3CD606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B3CD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4e778acdbc6so8890445b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754011; x=1796358811;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RtCl9bLKvCJGn7zLPcTxsOwpUTUjtSTIamyZWGlNDQI=;
        b=yuVQinYlfCGE06gtTnytmF1LyrqTxCtpReUqmcXlp7GGK9QTqUbzHcjeqsX+Ujt7fx
         gOMQ4BKcb1fYlMgC+0ubzHqcLiRcJMBK6bVQukSt8654nBWos7C77p3PifbqMBlpKyGQ
         ZNVjYvUDpGkMimqX4wQKFvq6WUBx6ZZ/2CQGxZVcfTvuqL4D6kTVHwqmXFOhkpgp+iCJ
         smvKhC6XiJ17zjrhZbLcPGG7Kk8FJFQcMy/y/3mHi5I/8BxfKt7YncGZBB5+tF+bKSYh
         26QOQ7Bcju8TGWChpUFTJpsYoH+fe/agtEfztkoTQCGDERDSkiXNmmnpuwhG9feEwcdo
         5SOQ==
X-Gm-Message-State: APuU4Z9qpTLvpBaHLKIr6pZdfBas0Winff7F3MSEP/MTPEr2lMfzx8ez
	vEGPD+xcuVuuKRi9B/xbsZbhrcmfnoWc82/lsxQPC7i+zvqJDHRHqLBaSYrrNU0tVqbnC2RsP+s
	xAP+xn6ORaITkwhz76/JWypwc5lI03Ey+hHIR4hzLbKk8q8nYntn3tDUSSkY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:23c7:b0:4f8:716d:793e with SMTP id
 5614622812f47-57a0bb86478mr22640780b6e.46.1795754011369; Thu, 26 Nov 2026
 20:33:31 -0800 (PST)
Date: Thu, 26 Nov 2026 20:33:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b09081b.904258e1.78503.002d.GAE@google.com>
Subject: [syzbot] Monthly mm report (Nov 2026)
From: syzbot <syzbot+liste51eef8f5d72764a3f34@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello mm maintainers/developers,

This is a 31-day syzbot report for the mm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/mm

During the period, 1 new issues were detected and 4 were fixed.
In total, 73 issues are still open and 387 have already been fixed.
There are also 38 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  50019   Yes   KASAN: use-after-free Read in copy_folio_from_iter_atomic (2)
                   https://syzkaller.appspot.com/bug?extid=6cc93ec9a4035badb85f
<2>  9208    Yes   WARNING in trace_suspend_resume
                   https://syzkaller.appspot.com/bug?extid=99d4fec338b62b703891
<3>  752     Yes   WARNING in ext4_mb_load_buddy_gfp
                   https://syzkaller.appspot.com/bug?extid=fd3f70a4509fca8c265d
<4>  380     Yes   kernel panic: System is deadlocked on memory (2)
                   https://syzkaller.appspot.com/bug?extid=c61d6962d0b7e698439e
<5>  313     No    INFO: task hung in migrate_pages_batch (4)
                   https://syzkaller.appspot.com/bug?extid=f523acb98cd782b4872e
<6>  197     Yes   INFO: rcu detected stall in sys_unshare (9)
                   https://syzkaller.appspot.com/bug?extid=872bccd9a68c6ba47718
<7>  155     Yes   INFO: rcu detected stall in kthreadd (2)
                   https://syzkaller.appspot.com/bug?extid=bb0c3b50c40032b58091
<8>  152     Yes   INFO: rcu detected stall in dentry_kill
                   https://syzkaller.appspot.com/bug?extid=0635dc2e2c3c21a6aa04
<9>  152     Yes   INFO: rcu detected stall in sys_sendmmsg (7)
                   https://syzkaller.appspot.com/bug?extid=53e660acb94e444b9d63
<10> 134     Yes   INFO: rcu detected stall in sys_setsockopt (4)
                   https://syzkaller.appspot.com/bug?extid=6e61d59e9d2150c8492b

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
