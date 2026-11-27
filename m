Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754012;
	b=1vSQCLsgyq1nU7GnJyxjqqgY+NHt1HzhJn3mbXtKWFogLG7TQugMIooLZF5uKa+hO8C0
	 D5nFmhFm+TUx4WznkFEH+xOSKbPR9cHwBa7BuerKTOGbPH3Q+Uo6h+FRrCogkWQBZDlIk
	 uNySWtT8ZzFOGnNUC8WAECkPz1KVPv7jSdaOzjrVrDtTEFvukAw6kngtIpTDdmZgMZkFg
	 r3Kh6aTRrotGEqa4ocyE5Sj0+pj+lLZuk3TPhL9sILoKhkiqjeS1VQZxsHJFGUKE7sh67
	 UDBnIEGg6tZZXpNFJ0l+2h4a9AJh6Sw4IvTRklVQHO7nBEDVl2ORc3Xtx6pRsWhKO2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754012;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=2dhXw0zfnp8cVCgUurE6Um5lhjtBVnxHBaJDVg1JQUA=;
	b=FzGusnpXGFUS/Gy+WxwaLOediRRbEqpezoH5ma2DoT0UwX/k41ldSKu9FQeYswuWFsin
	 x4RbzR6hWeMWldSkFgyNI5Yl+UzJVLqHNf2O6moKDH9HNB3kBNQnJ//lRi+/IqU+AjOOA
	 TMRXGF4I9ekTmmxVgcKDcEJ8RFoii0+kPX7nKzQIwIvyT5okIc0JOTV0CuGY19JiZGaPB
	 ihnZZZqlr01j62R90dHwkrUcFxWcbL2ExB/GPli5nmzD9l5Sd8HTMgvt1bHpEiOAYFx/m
	 HjCfJS2YsHnwpgT8SzUcQIOjIovXvVmFGJRYinwr9nVMdR6L6nrObrC2+o5JujLueOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA730606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA730606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-54dbbf252cdso7589990b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754011; x=1796358811;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dhXw0zfnp8cVCgUurE6Um5lhjtBVnxHBaJDVg1JQUA=;
        b=zAR0LkdN4P5L/uC2oIMjjWf2q4FD/2BygoYXyC9RLzodYYid8pOS+2LL6G38wqfyzZ
         Nt74uQOGb7QeJbujvoBGmgwWBu/W7mI+jePQhherEPZD/AWjDKyoOnWE4kWi2EiOMilG
         1bu5t9o30mxqMun2EifgV/Z51/oESt8fJ1Z62OpXrhkW3SpbVzykh2G8O5aQyB1ugiGN
         h9Ef777YlftKVOOtgtJ/bJlyLYteugt7IQr7Cww4VYVKJ4vmw5P/IcF/XT7JbNH9tKp7
         fb8fMcHyr88r4l8jizDkj9LjIaZHfuwU7PssmqfnnSH128TZbM7NhxyF9tJQ8Q5eOdg+
         rBXQ==
X-Forwarded-Encrypted: i=1; AL+hErEJZEJ4S1gGAkRH4AMTp80Dxt39aSooET0aZu+18UPlxc9CL47sOcZ0YaUMzphh4yE6B7xndoFuxG/7PzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ILvCp9JCtrTZeZmmjdZGdeG/JxQdsGrXEwgUrU3vna9/ucDUM
	q4nzzvtv4DyJSmqKGysIpVaX3GCOtAvzBGmLy+m/vmKmoGcBt2cNyx+1uJyUkRX2Ro5Ijc1Hh7+
	PRBP6dLPq+3PBIeoiGrtPJWAvEbiKIO5enosNwBoEBjNwcDgURiI2vpyPUtY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:318b:b0:4fb:ac9b:b06a with SMTP id
 5614622812f47-57a0c6b5401mr23997648b6e.48.1795754010881; Thu, 26 Nov 2026
 20:33:30 -0800 (PST)
Date: Thu, 26 Nov 2026 20:33:30 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b09081a.904258e1.78503.002b.GAE@google.com>
Subject: [syzbot] Monthly driver-core report (Nov 2026)
From: syzbot <syzbot+listcda40a291aae20a5f196@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello driver-core maintainers/developers,

This is a 31-day syzbot report for the driver-core subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/driver-core

During the period, 2 new issues were detected and 0 were fixed.
In total, 24 issues are still open and 83 have already been fixed.
There are also 15 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 261     Yes   KASAN: slab-use-after-free Read in disable_device
                  https://syzkaller.appspot.com/bug?extid=4393dfdddf166f2de2b0
<2> 103     No    INFO: task hung in usb_disable_device (2)
                  https://syzkaller.appspot.com/bug?extid=5cf28d3643d94bfb0821
<3> 43      Yes   KASAN: slab-use-after-free Read in lockref_get (2)
                  https://syzkaller.appspot.com/bug?extid=227dbc9afd022922d624
<4> 20      Yes   general protection fault in bus_remove_device
                  https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
<5> 6       Yes   BUG: unable to handle kernel paging request in usb_driver_release_interface
                  https://syzkaller.appspot.com/bug?extid=863936f50214e843ae0c
<6> 12      Yes   kernel BUG in sysfs_break_active_protection
                  https://syzkaller.appspot.com/bug?extid=dcad997ed2b5bd95cc5e
<7> 4       Yes   possible deadlock in device_register (2)
                  https://syzkaller.appspot.com/bug?extid=a246ab421a728c78b4ad

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
