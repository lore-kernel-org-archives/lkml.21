Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638828;
	b=ETy8f+W3ZrIV/v3+eK/1hTL3GpLnj1jjVcYL1GnKyTe+1srQScVRdpgNxPouzdbJuVAj
	 oKNf8d5WIt7PdbT2z0htHi1znU1LQlsOhYWjtnRcrgYrbYzQ2PSzAGq6M0q9OgC5vso75
	 cDOLUvB5XRQ9rAUJlkovKqY4sv95BzcdIGtWK3YSsUl42FTltm+ENAXykPwtmssBs6gOW
	 8NyYD3Z9gvirdn3+O9NdT+LPFlHAb1NswlngaCAHbbIiXu7ac9em3mM/cjBzF1UGmXEig
	 /kASDzQY5u2yO2MVsGXRdozsmpUi+bf2S5wjK/MtBWci9NroohP7M/lBKdHKPQYMVhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638828;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=DKdFZEjspBKaCksbplAgcWaym3kv8iUnI1Z7i05QBJ0=;
	b=r7VasKDruA+XzLnyrZhP0+RJ2v7OPjR04iCGuvA+6NLS9u7MDg2ToyKWwcmq7LeedCgp
	 fLn3vc98UUVjDHlp15eya1OWADDBn0nmmUgNOuCrAhvDNOek9+ZO2vynLeHkLthVBTQhM
	 SjphjZUZ1zrXeZUVaF83Wl3/GmQaOGHWphRxuyoihRyOvzM/sTVe8SCNU9BafUoB3S8Sk
	 RKhi0kN8/aYPzXEetriQLcUqPmFg6KCn2GBN0kBqPA7q6cgpnGsNtyyayDpFnpI85uvTj
	 +pv5G+l2FIiMvJASepZqxkZqHAHtC+r4udrFFtf6Esh6zT0EeTxg4HLQhopPnWdKpbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765D6606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 765D6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5735cd94235so5815919b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:33:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638827; x=1796243627;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKdFZEjspBKaCksbplAgcWaym3kv8iUnI1Z7i05QBJ0=;
        b=uQ/c6ZIy2DcNe2k9nONrmJ2uSZNWCOG59zY+HFgrPDcOYacoDDFXOf3mNqaEFYcpuZ
         9gDp03USJCEwI0k8TU9Zs0kPymsnXiJml6Q/sNFXez+PI+7FjHuHJYphfdSx5Tm9sD6N
         HNjQWxwDB82+AuM/FcT7zHXuqxxd9gS6lfTB8bN6rhjNZPl2K5NkcSMOXaTz0uSWzMw6
         ST3nYVNWzZUzEeMF2FnyICL7z2TjjoERHgSENPNruEt5JkMMxZb79zZjIWVWse/xoDD+
         PI5oCqsiKQw9gIW46fY4b7exE5G1TxdWp1h8BLeLoDO5j94buoG58UjCIptQRxiZv8UU
         vW2A==
X-Forwarded-Encrypted: i=1; AL+hErGfydG8yRb64DKe1uC9k5O38miBltpSPpto5238bUwbjvRlRtzwMLcvLlmbUbJs2FmMk3x6LRoOwpZ4yq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u2dx0PhN+gph+/MsgeVdy7PPwBZrUYcuD5RKg/p1o/vc+JLxr
	vLKUmQgpDNQ/T6agkalUWiIECnjBBFU9clWyE9FDkVfnhFTjCnifoiZi6r7hkpYcRb2KVPtjY42
	FyMSDTQaThBVQcpblhAXE16c2ph1Ci7JnQVMoLluC866UirGmYCqzS58aRZc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f25:b0:540:5827:6d8c with SMTP id
 5614622812f47-57a0c5b9ac4mr21453481b6e.57.1795638827669; Wed, 25 Nov 2026
 12:33:47 -0800 (PST)
Date: Wed, 25 Nov 2026 12:33:47 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b07462b.bb6e6ada.e0302.000d.GAE@google.com>
Subject: [syzbot] Monthly kvm-x86 report (Nov 2026)
From: syzbot <syzbot+liste72734dcb7f580078332@syzkaller.appspotmail.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello kvm-x86 maintainers/developers,

This is a 31-day syzbot report for the kvm-x86 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/kvm-x86

During the period, 0 new issues were detected and 0 were fixed.
In total, 3 issues are still open and 83 have already been fixed.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1123    Yes   WARNING: locking bug in kvm_xen_set_evtchn_fast
                  https://syzkaller.appspot.com/bug?extid=919877893c9d28162dc2
<2> 376     Yes   WARNING in handle_exception_nmi (2)
                  https://syzkaller.appspot.com/bug?extid=4688c50a9c8e68e7aaa1
<3> 5       Yes   WARNING in x86_emulate_insn (2)
                  https://syzkaller.appspot.com/bug?extid=fa52a184ebce1b30ad49

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
