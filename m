Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638828;
	b=QK9WLyOWgIs+mrEjxiW9rN1+g9nngWOW2VS6KqCzhWL80xgx/XJHNec0NeijhLhv1ONO
	 XYTuyVlqpMtSUvWgM7HK89JqM08ECuf1Enz4Y5LOzfMxi/tW+5i8tFScBS7TEENqLQWlL
	 iJ4rjzGLu6+2la38DBCuXzhHghWWnYLcvmsK6pB780ms9UBKJda1thSezXti9Nbw0vvYU
	 XXyLVMSCh4PVSNqDw/03EIFJQHJtJLuSTOsm6Zq6irYcJrsQtUAqdcqCtp9llS0aByRcB
	 ATdX3UG+dCmzK0SAvpb/nbI89aUuqFH+uU00zOzlGjd4f/r/4+IyUnGb1pNUcc8gBWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638828;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Oc3NJGpAs8FNeOb1kE44lSvp6vnsKf0LvOK+gGylU+E=;
	b=ghF5gx1NfzBJlbpPabK3N+aW4g4PPElkw8pRXOdRb/HXMS0vmri3+9SqfkkhsqmfoLmY
	 kcWOsHPzcnYCB/3TWs84hFTx8r/QYmDHpahfsRh/fq4Qp7sLzeAlP2/neCPC4otCbYSNe
	 nAFjlmz2nYFi+WZ8jz+BGd7utWZusgdYIdm9FNqZJBn6I26V8xtv9rPYGHh2dlNABszwg
	 8pROGrK1aikpVyoAEnKhzukZ9xBZGcPDffWYKSzI53YXY5V0oYPHIkL0oP/SkJ3ErIZSD
	 nYQpkGIh23sIUzwA8YtVK/HgaRrha3YcFhFg0v0v0pJEwNbbWLKRoR0bgcvh0Zk9jBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79802606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79802606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-57489477aabso6344946b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:33:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638827; x=1796243627;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oc3NJGpAs8FNeOb1kE44lSvp6vnsKf0LvOK+gGylU+E=;
        b=p/ZZaCeP1VrHhA+kIWIWPYC67x5k3TdmRsknDyTFGGipeGFUGD/3oxLRSmFroZja/q
         we0QT0xZpYHZ3yZjk5dFm++CJmgCQoW/nVgz1U46qImRbyQ7kM0qH86gCCAsYw4MGd58
         PhN6D5alE8361Kgp9JpEq1ztcy5uuBI4Uuovl3NP7yhalOup7EQlyGcW0pORDp+BubOt
         aFn7S1wohiWm3soaSOcjTsxngeyR3o30C3ieT4tFKOv0URj4sUhJecS1/P4ta7i7z/b/
         e+l5AUyoWUTgvj6narOZOBWr3YjAiXRt+gG0xLwGuOwXxv8A1s+v3mt3dZ+cevBTI3Zc
         72og==
X-Forwarded-Encrypted: i=1; AL+hErHi4M3LztA8i3GMMfZpaY2B8qdkM3cdKdkd61tZ19Niw/asJIoXMyKQUcSp9zot1IorgRCnZdtcJnx9S2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b3Nd4e/5Ii48NPKl2FCRbhahGTc/1zS5V802YGBBYv5YVBKOR
	XYkLKUFeSQOAayB9bb0MY6mjPOi6tc3uxYj0Huvt6yAozkEJjmqujI0SotNxaezx61qJAwvBDd6
	FoY4LZ47aUvErQen10LGBV5uL3l8i0krctPDIJOWmS6z89rvIAu8TW63ot08=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:250d:b0:572:f24f:c443 with SMTP id
 5614622812f47-57a056c81d6mr19190171b6e.8.1795638827424; Wed, 25 Nov 2026
 12:33:47 -0800 (PST)
Date: Wed, 25 Nov 2026 12:33:47 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b07462b.bb6e6ada.e0302.000c.GAE@google.com>
Subject: [syzbot] Monthly input report (Nov 2026)
From: syzbot <syzbot+list38d6ff782e475adefcb5@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 1 new issues were detected and 0 were fixed.
In total, 23 issues are still open and 76 have already been fixed.
There are also 3 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1097    Yes   WARNING: ODEBUG bug in corsair_remove
                  https://syzkaller.appspot.com/bug?extid=0a031a76585d1c7e737d
<2> 503     Yes   possible deadlock in __kernfs_remove (3)
                  https://syzkaller.appspot.com/bug?extid=1075f6dc93f398c1857e
<3> 12      Yes   general protection fault in wacom_report_numbered_buttons
                  https://syzkaller.appspot.com/bug?extid=ae7f998154426e723cbf
<4> 4       Yes   memory leak in __usbhid_submit_report (2)
                  https://syzkaller.appspot.com/bug?extid=e2c057ea576d2644e2be

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
