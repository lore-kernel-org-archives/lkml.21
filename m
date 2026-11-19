Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117767;
	b=zmJQH+iiPZJaHI1DJB/b//nzcrNDTQNBA+r2oAQKwOoHU0sdsGMLguCAgbKqrBxyVBBV
	 iSNnROPX8CtGfb9kF7xBUJokjM4V1OWgXImH0BqRIIiMrEU8Qoq6dxQOj7IJ387pgdn0L
	 2GUCQELgAvaqRUXuyNxfmQiRiLXOIh+7C6OFEjh7E6UuFm+zNHXqImDIbpZJrFC5CQbJK
	 ciuz2gNQR/cIlCYwA4NKvk5UNLbfSur+/3R8EVtr5iVz9HFgP3RmsjTb9f27QqpkHkE45
	 mcYuztfosvatTP2ST+L75eLbA/guOqyzHXlRklPDXpIkD2Q/VMm66VT4346A+oos+SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117767;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=SOc/V947bqgPfUt+7TNkBZnano1Ny2EIvdcRrWgekSI=;
	b=Kf6UG/LnxNeLJB5kZZROMYfR2bk8mofyFI2DP20HtMnXwLXWX4BOPJmV0KeVOWkgrJUz
	 /vChq4jnPNhfaSSoy3QwQvsCWx7effnOXYK33AhUGztmqjYBg1QrIO24aFjycBAwWLHxh
	 Qfw2T6zlx7e01jqqjmOP5nURQOPXLmd5S5FkbArhsXbfHlJ9dDHDonpAIWkP6vEXk132s
	 rUep6aL2cfzlxSnaS8dTTXbyH7/g2y+w/9da6S/KlpDhD31rNO1Wqc8xItjJZtYzwBBlI
	 5x7Pv7cO0vD3nhGGsqZwtOds1Mgw1bu6yVU2CA5DBVElZFNmsVl82/uztlUz0MBbj2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3B760A2613
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E3B760A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-571bc0b66d7so215767b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117766; x=1795722566;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SOc/V947bqgPfUt+7TNkBZnano1Ny2EIvdcRrWgekSI=;
        b=kZ1WDc9Nvr/7fekKxDiKZDdBYnZas+quW0UOb53VBFdECcmqxgYmcrLUte5ppjzNic
         UOoAdEUtcM5hVxxH59UkomtaQAdJlnL6K1dXCSY+oJVQBRlzzYw9mwRAMrQJYwWXdH6I
         mls5ctyKkOJE+ZcH/um25tW3sY1+eJ/GF1lcfoX6wt1fOkBjCSKpFIByVmn9yjJQvlvg
         s73G0HoTxz1U7uCNMsz1KhDmMEs/WGKQNmsf96HD3G4ju24IB3FuDw/dqBfDcNsypjxE
         0Soy5I4AHnlsOeW1L8o+2AjWZAexDaJYvV+fO3pCbg/ZEXXgY7h9obDksrnoZtAelqZD
         ntJg==
X-Forwarded-Encrypted: i=1; AL+hErGmh1F+r9eAYIpvJWslM49X4Fe76fjY3AQDawg7suRrNH3n2QfK+FOaRo6IlkiV0PTWyOs68kmN1hyylOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zZqlaDq+ANdpnXKbscBdbeQUwM2pQpmodTaqhPI11edhn8seT
	317taop2BsH4mHaoRiQq+9RPUgaFHdLrR2pdVgYy35866EMaKpvu273yWlytIYU5sOV+y+7m7ga
	FydY57N9Ft/6Tx4OM+IT6HOBIqSmy06RHd6KLulKK40ksvI8nXWuClEvBnc0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6711:b0:578:df6a:2658 with SMTP id
 5614622812f47-57a0ba543d5mr1129394b6e.38.1795117766532; Thu, 19 Nov 2026
 11:49:26 -0800 (PST)
Date: Thu, 19 Nov 2026 11:49:26 -0800
In-Reply-To: <6a2c4b8f.be3f099c.2836ae.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aff52c6.4ea6388a.d0c9.0000.GAE@google.com>
Subject: Re: [syzbot] WARNING in update_curr_idle
From: syzbot <syzbot+e671c2192fed8645642e@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
c095741713d1 sched/fair: Fix newidle vs core-sched

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=e671c2192fed8645642e

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 11 trees can be found at
https://syzkaller.appspot.com/upstream/repos
