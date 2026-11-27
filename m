Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754012;
	b=Lh8YVUwragiurfmosVqbUWcdEF9It2N7viU4vZdCyK1VuHeguAiOZruZZNMYkVVG3w+j
	 ulpy7yO4va6SyvvPs22g+XI1y2Dq1NTWLul1CSY62//p0KgjGfn0KnkvvHYjdsDIVT0ug
	 yYgG1D2UA1terumYicj0jT22ep6KYcpZPNAVVIo2sm3mNVuaCA9tLRGurZmSUYDYEbHl+
	 x1NFlVUTkbjMCl4KTYzx456Ujs/IVe0SccyzPahopBH/BJLZsEC9BoMHPHQUB1IM1ZuX8
	 b3PE5lsnSDDXlc7FdbO35+CwAkATRr6EnenT1ggidY12wGU2wbDiZn+BQlPu5/mREow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754012;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=7rOhMtv2u2ZTS7Y7SzBLnz/8dNSyiaSieAM2fOven2w=;
	b=HmVrBJ1/vC+JxqoTdvkwtizyQpq2PiLgwjiacTPYZk4Dofa1+dwDSI7il2FJjCxUeRjA
	 2ucs7Aze7zOdjZ0Wj68cNsUHJz5Oohwhqa0scOohjf49dWWIf6OlW4T0hlzbjJVaCVTzn
	 Dbscw21lc1+lYf8euFsSyjrz03wI/TcGFZyMXj2Ox0G+R7Cr3HWuN35Xj5oAyOccZCoA6
	 /Forl/2eXFOuONyijULVkmXPSTgbqcjxcjLEPwrFn9wImxugUxe+UlFfXL18Rmi1tTOZl
	 hGAvWG1W+9f2oJUFE0gyy/d6NLqqgtIosPBg3At9rfTyIDlKr5E8b+G6b2wDQUcBwtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BEA606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2BEA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8520e83f715so7435311a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754011; x=1796358811;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rOhMtv2u2ZTS7Y7SzBLnz/8dNSyiaSieAM2fOven2w=;
        b=TiqrEJgifnMDpkPh3n9TAYNShyd2EyfqteCepJ7sY3v9zuGT9kewJyRV5zw7XhF9Hw
         bsNniAFYX2C6ydM3caBJShdayjwrCtlw4Q640BzB+uXWext+WRhNO2UtaGo2iTgapzoE
         Hq05+0oQBu5R1Ed+EE0sGkyHplpr+vkak5y2/f3fRlAZWEEoRTtofbDof2wAq0Mthp3Z
         3XIohUvgwRt111ewEkc1ZN9BqVOFrL/+uU6q9pIeh3tTBqIymN9MuIUxRNN9C91sECXj
         iTa78HcWAw52JjHmc7+6NOgzCxkA9Pfvra6eRzFBh5MGorDlUH5Mt4k+rvL9sVFrKfri
         nDdg==
X-Forwarded-Encrypted: i=1; AL+hErGb4KBTvKWR/Ic44bLt1pIptwKp+OppPnK4ZRhAj4/AUPP667AsQVnKBjQJn2DjY1VPimzyDv07OgtwZKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s5UAdtOZuAAfuWPLGkKGAf0rxFUGdcEfhsQRS+rC53t3qdhzG
	g0eNZaQO8pWrBrCpKNIvnGev6ixdoPt+q7/81Hwnd+KI8chgreJknpG5DGho9zzT/MH414tGOnI
	kfqCbonOIVfuN+dYfYqdDE9evSdj+1MaY4shddXTsOFkOHpv4NxYZMNtZSdY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f4d:b0:576:4f95:5305 with SMTP id
 5614622812f47-57a0ac32c49mr29972057b6e.38.1795754011163; Thu, 26 Nov 2026
 20:33:31 -0800 (PST)
Date: Thu, 26 Nov 2026 20:33:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b09081b.904258e1.78503.002c.GAE@google.com>
Subject: [syzbot] Monthly gfs2 report (Nov 2026)
From: syzbot <syzbot+list3a3ae45b81deecab1f47@syzkaller.appspotmail.com>
To: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello gfs2 maintainers/developers,

This is a 31-day syzbot report for the gfs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/gfs2

During the period, 0 new issues were detected and 0 were fixed.
In total, 20 issues are still open and 51 have already been fixed.
There are also 7 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 111     Yes   kernel BUG in do_qc
                  https://syzkaller.appspot.com/bug?extid=bad65435361712796381
<2> 80      Yes   KASAN: slab-use-after-free Read in folio_evictable (3)
                  https://syzkaller.appspot.com/bug?extid=4c7590f1cee06597e43a
<3> 41      No    KASAN: slab-use-after-free Read in gfs2_ail_drain
                  https://syzkaller.appspot.com/bug?extid=84a21b16aba9f279d96a
<4> 197     Yes   kernel BUG in gfs2_quota_cleanup (3)
                  https://syzkaller.appspot.com/bug?extid=af4d53576692f8956fd6
<5> 167     No    WARNING in iomap_writepages
                  https://syzkaller.appspot.com/bug?extid=5e659793378ad9e06387

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
