Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811637;
	b=rxEoLi8ubBOkUKMYs7wXRkuOPML4Hig2MGUP6OtlaESVCPwWQHiNdXTxqvnOx0kuiaqS
	 5PrP6F/CaSgxyqOzoCXhw82bwXoh/+kxbeRjyS4a1W3Xlc7gCHZj+gs8GCGkQBC6PGfaF
	 IzWyz8KXBdMtaAqYVpPG94DvTrWl2lAGx6dLnv5H/cK0vG1iipyVxNZcnWj//3IWcoNxk
	 C752WrkNldCuSbNvUvcgU6r2m3VHkkWCVpMVZTif7ZgQVIWFls1k13bhdeSIWm8svVux+
	 QjeaTr+c94+N5RixoMOeQ8ayqeKBC/oMkRo50GMkiEgEPCyXZnoxsifqk8cODLqistQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811637;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=lP1cgy6AqB+I7ZmeBopot2A6K9z6x9VfrLRp1QcW8bA=;
	b=VRgUf5tQ9GLi3N39E/unwoe5+vAGj0VGR0x7BvTO9GbtMHkIpHnzJ8lZVZ0LyaG5szLS
	 rtJsOfojxVGtj6D87ruCsindVThvmpx60gZ7AmmAw56JPF5h0/EbjrOs0rsK3fzgIKN4+
	 RnAQfbRI5z3LSlvzcKBMCgO6kQavoWqTcbtYNHL+dTYwg6yGdVH5ic7Wj/QqwORRxn7YA
	 cA6NkcryTCduuQoDqWb7B/E9a18PusalbbX0tOw6Diuvy5bTKiiTF3Cnq4MU/J6WV6FGm
	 zdpYeIhwRNBUfgpxD9e0RK+KChDSjn+ZQ7F0e9jVT27JD+Hul/6AdEJEK3v3jUtS27Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E423606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E423606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-86287b38a31so7851125a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:33:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811635; x=1796416435;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lP1cgy6AqB+I7ZmeBopot2A6K9z6x9VfrLRp1QcW8bA=;
        b=rL4tqLRo8ZAvWrBQQ+njZxrJYrR3FvdJLXWKPe/xZnhaXrlX/yNHjx4WI88Nl1VVQG
         0j8+bCK6EefoK7oEwMKknHHU3R8zUOrf6VxzmiEE8xXAZOW0BCukHMq7u2mjC7CvS3xl
         UCSQjIY56zHot/xvodBaGKOBcCIBMEBljttqEqYarPZ/UWMnTzBkDreOyZGnMzVCoJuZ
         X/2QLkEH6rXTqT/Wt+tmBJmgvV6WuZ5fbuT7vLSS4g99zq2S/E+GiD79eCBC3mN+3J8d
         Osot/L+n0UcLp6J2QD20dhCgys178NESmwxz28GJ5xuaLugAB9ChllzuXi0WHgDIOLZ9
         24hg==
X-Forwarded-Encrypted: i=1; AL+hErGqjvfudFJEK/99Z027E4XUSWI8E6jwHBzqNXwU+Ff8u+CgZx9/Dvmjwl4qs1IbLUozh+SQqTaUYWNXOmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z84obwtN0Pngy0kZRAhN3Zg24tuef7nkh3jGA7Z1hP23JUQ4jVa
	Nj8q9tmleVrZ4X255Xl5x2pU3DpQ3Y9fyPLVF20JoBez5t3QF/I5AB1OWDYL0GbKZeQ7gJizjUe
	scDmj7Y3mXdSBpcZoqxEXqoiOCSDm12ephRu30jdiaUsrLzJiQ44LTuIUjVw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f06:b0:53a:9d3c:caad with SMTP id
 5614622812f47-57a0a4079a5mr28198618b6e.25.1795811635750; Fri, 27 Nov 2026
 12:33:55 -0800 (PST)
Date: Fri, 27 Nov 2026 12:33:55 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b09e933.c4dd33ab.25911d.0018.GAE@google.com>
Subject: [syzbot] Monthly nfc report (Nov 2026)
From: syzbot <syzbot+list420bf134b34a29c9910a@syzkaller.appspotmail.com>
To: david@ixit.cz, linux-kernel@vger.kernel.org, oe-linux-nfc@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello nfc maintainers/developers,

This is a 31-day syzbot report for the nfc subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/nfc

During the period, 0 new issues were detected and 0 were fixed.
In total, 11 issues are still open and 36 have already been fixed.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 347     Yes   WARNING in port100_send_cmd_async/usb_submit_urb (3)
                  https://syzkaller.appspot.com/bug?extid=89f5f8143d8e62af2b61
<2> 39      Yes   KASAN: slab-out-of-bounds Read in pn533_recv_frame
                  https://syzkaller.appspot.com/bug?extid=93f169a8e7d66864f800
<3> 11      Yes   INFO: task hung in port100_get_command_type_mask (4)
                  https://syzkaller.appspot.com/bug?extid=3decf7252f8521fa80ff
<4> 8       Yes   INFO: task hung in pn533_usb_probe
                  https://syzkaller.appspot.com/bug?extid=8996fbe184c5b84f89d4
<5> 7       Yes   general protection fault in nfcmrvl_bulk_complete
                  https://syzkaller.appspot.com/bug?extid=59d5e6a8ed04e6a000c8

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
