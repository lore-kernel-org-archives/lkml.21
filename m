Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447428;
	b=GjSksSPNHzbQHC8+jgbO6CRirytmPPk6tGaugvC5FeF+IkRsfm7vM3wnmeO1Gw0QQmT3
	 jtKTNagXezB+07BzDDXsZE252Ud0eDNTCUeoVDwUhsaT7e+oBHUpfTnT9Na4wVjGuRwh1
	 G33sK5YuHtf5f7+3xxOphz3GhxtzqAps2I+cmYvr0joiWLC9+0ZJt7X+28kT0hoP96SBw
	 bErC3vieOZbKJEknultPkbGwNSyAW8PUqU9ziG03m1kctAyxcBTn/DWO9OpGlZ18AubZ7
	 FKRf6x4GeZYiGkMbxec02XaPzXqDApJYaLmfq0Bc/W/oGk27ZZhfkYe6c8jH4K3XWbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447428;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Frm43ufNh8qqB/Bw6xfF1sMT8C8/aL6tF6RXXphvCaI=;
	b=chBNHlCG+fhW/4lvGd/QV6hwiIe0vtni/tYQU0pQCZL3j+yblk8Eju//yHcKLjlPVYg1
	 gk4PrMjTGDF8tgqr10wMDFyAXwobtmLxzYA9h24RwCBFoaYxCF/Q9xtq05H+Z7eauExr2
	 puFdnv0qutnDoaW3PpwIfPe4YdWTqHu3/kt8XGoQx7S3TLwNo1j2Yg11yUt+WutqUu8SU
	 Ud71h/kxbbwKpqlFfbcm3fkYg7iaQQec2e4n9IFILAqoo9pK04JM0dxGCrRViHWrGIKtW
	 5Bj6rmRPQhXfeyi6UVV8dcPikMsquK31SN7rnWbu/WO5jLMknciBglISLos89/lBekw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7492606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7492606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e9eso4137534b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447426; x=1796052226;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Frm43ufNh8qqB/Bw6xfF1sMT8C8/aL6tF6RXXphvCaI=;
        b=RmC0cgd4RkKsUimx4YbnRmtDhg+H7tQLnnByX0O5O4QBpAxMZYzei7OYtrSqJ9SZZM
         YnaoZEnrsb0qWzYr4tH41DQSr/w8bNQmsmaz2/uJkdO7cv9A/z8cebPa4EWbOcqkR37v
         k0tVJ4uBw74V9AkXT4wdVh2+xw1EwgryrMuDKPE/b18jt/GeL899L8XBStOYqRa1D97N
         J+rJknhs8ezgtEXc7UMDEgUnD+wQgPtx/QRwjFFoYKx4/oY3xKfghkGqI3KswOZ0SCba
         QhhVny4g9KgUiIhCpZtwmZx52VP5To/RjtNha17yT523xqk/oXrqGRu2WFIB5mdHVvpe
         OE2g==
X-Forwarded-Encrypted: i=1; AL+hErGj3URtoPU7JIH5QpTEGJBNAgrp0ciMJuM87XCgZElab7CnE3VQuZYj8usZ1huHDxX3PCvQoQZuQGktvoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NiwwUK9B/VOVboI3IVoO6PwBZ9r8znxZtt3GiwoIF8JWKS+eh
	e3UEPgLXcET80HjIPI5i4imTzopz0eSjIb3/Z7+4v7BWdElfzwwUxbuN84Ex/vdQxi7CeADp3hl
	janSDb+ZtlqNzSi4z3+RN8hEwipZ7eHtKdvjBwUWCYI6UAhXKHOEmv91gUy0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c3d2:b0:564:4d77:7051 with SMTP id
 5614622812f47-57a0a71b742mr13759393b6e.26.1795447426504; Mon, 23 Nov 2026
 07:23:46 -0800 (PST)
Date: Mon, 23 Nov 2026 07:23:46 -0800
In-Reply-To: <00000000000034ae0f05e9f94c79@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b045a82.9a2182b0.37b108.0030.GAE@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in jfs_lazycommit
From: syzbot <syzbot+885a4f3281b8d99c48d8@syzkaller.appspotmail.com>
To: dave.kleikamp@oracle.com, jfs-discussion@lists.sourceforge.net, 
	kapoorarnav43@gmail.com, linux-kernel@vger.kernel.org, qianqiang.liu@163.com, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com, tristmd@gmail.com
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
From 7e1a0b91e9efa8bec40fc5397ba6c4e683d72df0 Mon Sep 17 00:00:00 2001

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=885a4f3281b8d99c48d8

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
