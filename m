Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941138;
	b=sMtxhXHsMuLFSjHHtOKg0sDpUL8gy1r0wab3IjrbihlU5wnqUeH0tZb/0asNzByP50jR
	 Ww4YmBvAgJC3nJQ66in8fObZ4+3IaLsOSEYjbbc44jpCXXUvy5iw0nosUDmfGGmrZd+vB
	 1oPrdtGQ8pwO3Tut/1SwG+KyqI+4eDeq9CrLWcv7patE+UALDE3ahzT0h5UW0PCaP1Nfs
	 B4JewZXjipFi9LHc2uIsZWLLnc//mQcjpVO8Ex+9IMIwShicVxwp7C2rJBNbLn562J+Cc
	 ulVhDJrtsZQAJFNae9S4zOfzz0fWSZUIX+2v448QHC+KbVT+L981foYAYRY2mEqL9dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941138;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=cOqaP46PLFxzgdDLVSJLsLGHQGUz/ur0viZK2nMoNYo=;
	b=nodfT0anR2bH3RRTzSJg9TM5P2vdsOpWRe8IM0yjUAX2Qp8LTUaEN/fw6cUIVMZvaKJ0
	 4IsliOlC5IEpdPtQOLWWH0FGirNBEIkrX8iB/6UAS/d9BGLeu5LPKdIBDC7+35so1YJFZ
	 r4btka7qByTnm0XvkREUEZ31J51DVqYxd+bmA4Bc5PlXXn9cNyTNxF1mGCqN1OsPv9IvG
	 2UY7P0+15100GQAmBOhVgkOhSuS7/Col/aCC2e9a+MvqljwINg863WTRgHvtJwLF6NKUg
	 pNpIora63tGaf8BLuwH9OPRHoFiQNZy9eq2p33O/6GiC5/cuirNShY/dEEXNGQfRpCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5862F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5862F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4adc1aca8c2so136648fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:45:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941137; x=1795545937;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cOqaP46PLFxzgdDLVSJLsLGHQGUz/ur0viZK2nMoNYo=;
        b=sFFaikbRwV3VwpgqCYaa9STEtAXwIOmEmKcuv2pK/qSQeOTwyzYSDZ4wzVl6vs5gPW
         tmKPxvLvDrcQwaVooA30Wqa6wKkBUUnM+TeUHIaYpA3ixMOPwZr6U8PbRi+HoCxSd5Vs
         O3nTbD69NIb2NHmCvdRqnY0t5OfTFtAI7/kkpP0lfnohfUbMl2F7ueJ8QHarw4Moztf9
         bjVN5kC8z6z6FRpwV72mLdckyqqqqZJA7hJd09crzC/VnCDc6r6JTxonhJ9lYmyQ5dY7
         Vz1hpDhUOn2Z/27U3N99HjL5Y8+txaEIeUve8nmVq6DsqmDXF6ScLjHQ1YxV9iKoacp4
         ex5Q==
X-Gm-Message-State: APuU4Z+UQpd3JUby3AmSgJWERCE/mbFKoUbJy2bVDALPu2LXchZCP1OD
	F6hGHM8B1AqyEsTHIIVr4uKuNyxOwxafNfHEzj9aaMp/Ud6F1+dmMH5JrTuSgGq6eGnbW7LRNFx
	08qt/XnWvg1Ac6921lFLwZMXIncJDA2abl2KIwbyBtSKf8tWv9jr8ut3wM04=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f4f:b0:4e9:3412:14ac with SMTP id
 5614622812f47-57740e3f9fbmr680210b6e.33.1794941137188; Tue, 17 Nov 2026
 10:45:37 -0800 (PST)
Date: Tue, 17 Nov 2026 10:45:37 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afca0d1.8f566acc.2517be.0006.GAE@google.com>
Subject: [syzbot] BUG: Address IPV6ADDR:IP on device lo is missing its host route.
From: syzbot <syzbot+af16ddc8fd22a1d135f8@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    aebb72744764 Linux 7.4-rc3
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=126084b5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d44b06612b68f56
dashboard link: https://syzkaller.appspot.com/bug?extid=af16ddc8fd22a1d135f8
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=166084b5580000

AI-generated root cause summary:
IPv4-mapped IPv6 addresses (e.g. ::ffff:127.0.0.1) can be configured on the
loopback interface (lo) because ipv6_add_addr() does not reject IPV6_ADDR_MAPPED
addresses. Because addr_is_local() only considers link-local (fe80::/10) and
loopback (::1) scopes, an IPv4-mapped address is considered non-local and can be
retained during interface down or MTU reduction events (such as MTU <
IPV6_MIN_MTU on lo, where addrconf_ifdown() is called with unregister=false).
During addrconf_ifdown(), retained permanent addresses have their host routes
removed and ifa->rt set to NULL while setting state to
INET6_IFADDR_STATE_PREDAD. When subsequent device events or modifications
trigger DAD processing on lo, addrconf_dad_begin() immediately concludes DAD
because lo has IFF_LOOPBACK, invoking addrconf_dad_completed() and
__ipv6_ifa_notify(RTM_NEWADDR, ifp) while ifp->rt is still NULL and lo is UP,
triggering the pr_warn bug message.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=af16ddc8fd22a1d135f8

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+af16ddc8fd22a1d135f8@syzkaller.appspotmail.com

IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
IPv6: BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.


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
