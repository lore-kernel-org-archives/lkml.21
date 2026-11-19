Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795062830;
	b=tqTb4VIUU+Rqppd6sA0lBF2vWD3MTiIl5Aw3ib+6b+Wr3sfKIp53W7yz0Z3Mw8FmyVZZ
	 rQqtPINF1n9sxh1oXW0nJ5sQr6nJ6uWqoUMEgPhARS3Ri1Gs98qzhwvcHJt9rKErrwQ7q
	 q9sLRYB7bnwjWja6T4eDjbGw223XzwFXyepVnlHeoV+LkvWtnLqDZf5pOtdx5IrRfH1fm
	 j99TrCt6/puxnZnl8NoXClyPKU0COhli+6nfU46OkhuAYWHN5+3g7IbgGCx/nWNuXlf9D
	 IhrO/dIue5dFf5X3BhvTdKUOghTqJfBQHpMP4lJ8BlDFm43r4bCq6dTKz6SN62hE0Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795062830;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=7TD0Md0mVnFdPLU1Yyiv7w9mu5gUlK6e+evzCk4KI8U=;
	b=Gp5VOT9uPNWJY4sS8ZFnLmHh8L8eYqV/aDxnfKWwrpOt0Ai9AkPVcBYl6qWH3lbG/ANM
	 uXQZF6ibXWWLgZtF30mqqrtgdaEJG1dFq1UDr04joUubar4JbcHLrr7kboxe5zgBdzHj5
	 QjobMx575N9lCJYQaLDXcbSvrKpmVpeCoSuKqCnKy2Dz5IweGDFWdxVQgyHND6ZG63rIu
	 ezkyowzT+R0YhhGiRh08d0rhGUssM/2pGAcWSWI5EcKMvbfTa0YbVf/1RkIDEAmcKgebM
	 67S6V3eR8QByV2JPLeBNGqwc8bRqV4fdHFM/WKMCjRHYhKnIU0NrQlTR6lEzzkx4qIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21E8606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B21E8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-846863cd436so1792048a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795062828; x=1795667628;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TD0Md0mVnFdPLU1Yyiv7w9mu5gUlK6e+evzCk4KI8U=;
        b=PWf5342lH8/gitrZvhR4NEmFpEH8YSpUPoXTNxYccfayxUl5+9Fv1FchJbET8R9cyw
         1/ItC8pPGEHceWUa+8uToeex/JNaaiKugkytkOM2BPDlLLOYjTtPYDVcKrUBxVvc9QZ+
         pi8cqRWwLMO5MYR3Pg6x+zcvilsx18+tZBB6W+UUR7AokzLXD1YjV5FjN4Xg0/lhUCvX
         Qr05Mfh3c0yDtdiUVzqCDsZ6nlCO/9/errblEogcUM8y1HvbOslqWNQGddybLC59NyA+
         EYMFnj/Mxk7Li76Kd0jMRPJg8jFtzWEw64aH6RV8po9HpJpLxqVW5rBLYRDlQR77oI9E
         sMyQ==
X-Forwarded-Encrypted: i=1; AL+hErFb1Xfiw/wOgC/spM6ekU9m/0N3LVSABMx+/z6wRKYKdvwBfrHbmQKlI6APBCc7erB6sOrL1i1eQRreZ+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+aHaKM9USFkMAQZhjWWq4AhCkp2wKZ2XaUy6jkD9TbwGh644F
	eFT0owo+qLEzjBgBpYNTCssY862QyfFZkVHzy+83EfSxfZheEE2mnayQexmYIcrOzgDuNRKZZbo
	cNSGkFpRlfzJhuJpHOKX53YOO7w83mAIeSxoaJExMX1QXm009ApkzPNBvotw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bc7:b0:571:9502:8303 with SMTP id
 5614622812f47-5774171cd65mr5660064b6e.50.1795062828749; Wed, 18 Nov 2026
 20:33:48 -0800 (PST)
Date: Wed, 18 Nov 2026 20:33:48 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afe7c2c.902182b0.170f33.0000.GAE@google.com>
Subject: [syzbot] Monthly acpica report (Nov 2026)
From: syzbot <syzbot+list0ad76eb042dcf70ab97f@syzkaller.appspotmail.com>
To: acpica-devel@lists.linux.dev, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com, 
	pawel.chmielewski@intel.com, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello acpica maintainers/developers,

This is a 31-day syzbot report for the acpica subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/acpica

During the period, 0 new issues were detected and 0 were fixed.
In total, 5 issues are still open.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 14      Yes   KASAN: slab-use-after-free Read in acpi_ut_update_object_reference
                  https://syzkaller.appspot.com/bug?extid=c6c92a97a9907f92fa1c
<2> 380     Yes   KASAN: use-after-free Read in acpi_ns_get_attached_object
                  https://syzkaller.appspot.com/bug?extid=5725792ce6a9938d1b24
<3> 2       No    KASAN: slab-use-after-free Read in acpi_ns_check_package
                  https://syzkaller.appspot.com/bug?extid=e1268acad3c273b12120

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
