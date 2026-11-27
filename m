Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770078;
	b=SKNVn6MA4S+4lAIXwhNn/KW83DtJ+wIJAjsdDVaBNc+fnfj6DzOFLPTzAcHo9WVERep+
	 0aV6+qlygAsuUJOABBWp7g/rcig2wbuHEoNsmBJuXIQn/OSwXOcOHmbbgcHDU4hRMr8kd
	 ZZm4hZO8NdHJKKjUJ/rwPu17r4Q797o1Znrb5hogqn8QTCS9ThsnKZv85BxSRUBhZMcZK
	 uNeYBGrW6NVqGS453Wp8Y3XgbSk9xxxGvBd3qf3y/Ih7rJ1SX+NhpWcm/mhx4nDGvIhxV
	 ZRp9F1i6XiRGtydtge2UEn6oIpVV9TYdttTHkF8AhaQe33pucFKh9+rapbjUp15PxZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770078;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=e01QIr9P+RAD45MEmIVWH+gThT8qQM3Uki49hXDrI2k=;
	b=22DExg6I32FdP+oR+v0XawV9Dn1OB8Ghk4iwcSLZho1usnhLxCOKZKB15uNSmBqdKcMI
	 ZQWOKcEUB9wGwPYJQ8aEZoXhkmNACdyKEV2gWcNz0h6YOUmZ8DVQx8J/rs3NyhgSGlmsL
	 qaVlEz3snMY2vO2Zr6XCzrlyIjclN0Y4jJ7xJK0k/1Pb62AAsrRW6ZbLU1GTxdHFRXSgQ
	 9tE+gQjgtQqh7inxoUI3OQeK1XRZpb8lOMIdD2sRNK0JiDWDJmZMN4OPpfJXCsPBSs4VL
	 iEon7MZQcIbbaYcxL19pL8H+7DpgPbJmLuw9ZayDe5DvcyOjXqaq3dpy/IgpckpxDiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185BB606A6A7
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 185BB606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f04ad2c46dso48976575ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770076; x=1796374876;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e01QIr9P+RAD45MEmIVWH+gThT8qQM3Uki49hXDrI2k=;
        b=xEDR2JsugiuqSrsrURzmzRnz7HBz1GAZlSRflcZrhd6jHIn91a07WIcGv+7WtJosmt
         eWu0W0IqdK+r2HNvxdga88l9gNlBcE8OMWWWK5dt6HEVDmVDwt2ZfNfGQHSOXlJpKq7i
         t/GocZfnbsv0eiYgienVU8TLZ/u2HhXk9RiRxo6xvrVPfLPBbZeI4qDFMobWeLG9DZtn
         u5z3Rl/IPuaACFd/Rl5dI9cHxR4XcaDrvmTiLXqN/WhyeRybDJVcvNFqzpMC3JV5xeO5
         JSKp7ZLRpIsEQKWauEPZmR/e7mUrFqvSDUg0wzAPjglhYUaiTVfZNtfTGTYHToZhDEl/
         zjPw==
X-Forwarded-Encrypted: i=1; AL+hErHf3vIZSQ+pv25scmc8rIewYhdybxCzgYUBlg19e6i9i2fCPlfbatvsdahNbG4PHqySP99qShvDhYqiqZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QLSB8QUGNh81IzL13F469Fv3yBPNZyPD24xSOk0HJP4xN37nO
	9i4d6n8h2l8slsPb0UX594NcCVAKJXZBGuvUr/BBROvEgGSf4VGhmcFL
X-Gm-Gg: AZFdTZffYGWiCYQK0Ka4lmGe31xHc+4mSuu4272B/CrqJJx35OLf2OyrOvyvudspGNn
	zApJ6i63vyGfhCYTViKARHg6E11ptke3wrlxsMZJyGLpLaO4RPMf5GD0kGkJ/9K7MHhrCKuO1Ow
	1omHcbOpWIDvPVAJuq/G0L4FGG6DHf40IZsjsUcCPSL+NZ2B3OMvZxqoBe3a1RAmOi74MeD6l9N
	oBhIatIkBFzmZbDvw8mEDB4VICdxXWg3i2V4a5q6O9yHmGtwpLUEttq+ybfTlSFF12AOuoCB4iN
	svGkCyhimpWxH404Sl7nH8K0uiw7RTo9RR8JGuUYyeffO1Bg2ZvvaT1oznsE1Yh0so0vMP6/QeZ
	iScWF5ssf5Cfk9wUI4Mkjx4Ok7GNU5WZitxudBcSnUhixkUyrRIky/gUyhiKoXcG+2nNimvx296
	adJPbJE39bym2dINLYJp6TDJ3+KHCKKXcmAoFSNZ6ZxW8R9g9XgJhMlYDyARkz19YbIx8euR2EY
	XfWErT0gCcbIvZrhWBWFQzb4k7ewEewupP+5okRMKLIOKl+Oo29Z6huaBpG+xxv3auK982TWw6N
	ZA+mRejokQlnE544ZfmRQwB//QjYcTSby15KmiIPi4CldTXTCqiaAfroqnRlzM5IIBrBCh+GWjJ
	Wn3slA/LrP5p8VFE/le2ABs17Tf2RSVZV2BNWTVjUYV9yZ8Vf49s+7lQ/HY/bfDhsIUI=
X-Received: by 2002:a17:903:32cf:b0:2f0:5e53:8db0 with SMTP id d9443c01a7336-2f05e53a72fmr187856455ad.25.1795770076052;
        Fri, 27 Nov 2026 01:01:16 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm117050725ad.57.2026.11.27.01.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:01:15 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, oliver@neukum.org,
 Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 [PATCH RESEND v2 1/3] usb: core: Fix use-after-free in anchor wakeup protocol
Date: Fri, 27 Nov 2026 17:01:12 +0800
Message-ID: <179577007251.23588.3651671046751993803@kylinos.cn>
In-Reply-To: <179577006613.23588.1120308700542393912@kylinos.cn>
References: <179577006613.23588.1120308700542393912@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

usb_wait_anchor_empty_timeout() and the anchor cleanup helpers
promise that once they return successfully (non-zero, for
usb_wait_anchor_empty_timeout()), no URB giveback is in flight for
the anchor any more, so the driver may free the memory holding it
(xpad, for example, embeds irq_out_anchor in its private structure
and kfrees it in xpad_disconnect()).

Two windows break this promise: the waiter can observe "anchor
list empty and suspend_wakeups =3D=3D 0" while a giveback is still
about to access anchor->wait.

 1. usb_anchor_resume_wakeups() decrements suspend_wakeups -- which
    makes the wait condition true -- and only then calls
    wake_up(&anchor->wait), with nothing in between serializing the
    two.  A waiter returns, the driver frees the anchor, and the
    late wake_up() touches the freed wait queue head.

 2. __usb_unanchor_urb() wakes waiters while holding anchor->lock,
    but usb_wait_anchor_empty_timeout() evaluated the same condition
    without the lock, so it could observe the emptied urb_list in
    the middle of that critical section and return before the
    wake_up() and the spin_unlock() had run.  Reading the two
    condition fields locklessly could likewise observe a stale
    suspend_wakeups value after the giveback's unanchor on weakly
    ordered systems.

Complete the locking protocol that commit fbc299437c06 ("usb:
core: Solve race condition in anchor cleanup functions")
established for the kill/poison/scuttle helpers:
usb_wait_anchor_empty_timeout() now evaluates the condition under
anchor->lock (a self-locking wrapper around the lockless check),
and usb_anchor_resume_wakeups() performs the suspend_wakeups
decrement, the wakeup check and the wake_up() within a single
anchor->lock critical section.

With the decrement and the wake_up() atomic with respect to the
locked condition check, a waiter can only observe the condition
true after every giveback that has incremented suspend_wakeups has
stopped accessing the anchor: the guarantee that the wakeup is
delayed until the completion handler has run now extends to the
anchor memory itself.

syzbot has reported this race repeatedly since 2019, most
recently as:

	BUG: KASAN: slab-use-after-free in register_lock_class+0x8d1/0x980 kernel/lo=
cking/lockdep.c:1333
	[...]
	__wake_up_common_lock+0x25/0x1e0 kernel/sched/wait.c:105
	__usb_hcd_giveback_urb+0x3ac/0x530 drivers/usb/core/hcd.c:1653

	Freed by task 7828:
	[...]
	kfree+0x14a/0x380 mm/slub.c:4390
	xpad_disconnect+0x359/0x490 drivers/input/joystick/xpad.c:2194

and:

	BUG: KASAN: use-after-free in register_lock_class+0xe6a/0x1120 kernel/lockin=
g/lockdep.c:1336
	[...]
	__wake_up_common_lock+0xb4/0x130 kernel/sched/wait.c:136
	usb_anchor_resume_wakeups drivers/usb/core/urb.c:958 [inline]
	usb_anchor_resume_wakeups+0xbe/0xe0 drivers/usb/core/urb.c:951
	__usb_hcd_giveback_urb+0x2df/0x5c0 drivers/usb/core/hcd.c:1674

	Freed by task 3889:
	[...]
	kfree+0x173/0x390 mm/slab.c:3786
	xpad_disconnect+0x1cb/0x530 drivers/input/joystick/xpad.c:1905

Both reports lack a reproducer; the analysis was verified
by walking the two stacks against the code, not at runtime.  All
in-tree callers of usb_wait_anchor_empty_timeout() (and every
driver which frees an anchor after the anchor cleanup helpers) are
equally affected; xpad is merely the one syzbot found.

Fixes: 6ec4147e7bdb ("usb-anchor: Delay usb_wait_anchor_empty_timeout wake up=
 till completion is done")
Fixes: 51a2f077c44e ("USB: introduce usb_anchor")
Reported-by: syzbot+7f5e98b052c766f47f68@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/r/00000000000090170a0614431f47@google.com
Reported-by: syzbot+59d3714b44d79d02f944@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/r/00000000000038435e05e9f94cd4@google.com
Cc: stable@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oliver@neukum.org>
Cc: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/core/urb.c | 51 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index ae0d61b5081f..bb1778d9e9db 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -139,19 +139,39 @@ void usb_anchor_urb(struct urb *urb, struct usb_anchor =
*anchor)
 }
 EXPORT_SYMBOL_GPL(usb_anchor_urb);
=20
-static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
+/* Callers must hold anchor->lock */
+static int __usb_anchor_check_wakeup(struct usb_anchor *anchor)
 {
 	return atomic_read(&anchor->suspend_wakeups) =3D=3D 0 &&
 		list_empty(&anchor->urb_list);
 }
=20
+/*
+ * Same check as __usb_anchor_check_wakeup(), but takes anchor->lock. It is
+ * meant for waiters which do not hold the lock: the critical section
+ * serializes with the URB giveback path, so once the check succeeds no
+ * giveback that has incremented suspend_wakeups will touch the anchor
+ * anymore and the caller may free the memory holding the anchor.
+ */
+static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
+{
+	unsigned long flags;
+	int wakeup;
+
+	spin_lock_irqsave(&anchor->lock, flags);
+	wakeup =3D __usb_anchor_check_wakeup(anchor);
+	spin_unlock_irqrestore(&anchor->lock, flags);
+
+	return wakeup;
+}
+
 /* Callers must hold anchor->lock */
 static void __usb_unanchor_urb(struct urb *urb, struct usb_anchor *anchor)
 {
 	urb->anchor =3D NULL;
 	list_del(&urb->anchor_list);
 	usb_put_urb(urb);
-	if (usb_anchor_check_wakeup(anchor))
+	if (__usb_anchor_check_wakeup(anchor))
 		wake_up(&anchor->wait);
 }
=20
@@ -835,7 +855,7 @@ void usb_kill_anchored_urbs(struct usb_anchor *anchor)
 			usb_put_urb(victim);
 			spin_lock_irq(&anchor->lock);
 		}
-		surely_empty =3D usb_anchor_check_wakeup(anchor);
+		surely_empty =3D __usb_anchor_check_wakeup(anchor);
=20
 		spin_unlock_irq(&anchor->lock);
 		cpu_relax();
@@ -874,7 +894,7 @@ void usb_poison_anchored_urbs(struct usb_anchor *anchor)
 			usb_put_urb(victim);
 			spin_lock_irq(&anchor->lock);
 		}
-		surely_empty =3D usb_anchor_check_wakeup(anchor);
+		surely_empty =3D __usb_anchor_check_wakeup(anchor);
=20
 		spin_unlock_irq(&anchor->lock);
 		cpu_relax();
@@ -927,12 +947,23 @@ EXPORT_SYMBOL_GPL(usb_anchor_suspend_wakeups);
  */
 void usb_anchor_resume_wakeups(struct usb_anchor *anchor)
 {
+	unsigned long flags;
+
 	if (!anchor)
 		return;
=20
+	/*
+	 * The decrement, the wakeup check and the wake_up() must happen
+	 * under anchor->lock: usb_wait_anchor_empty_timeout() waiters
+	 * evaluate the same condition under the lock and may free the
+	 * anchor once they observe it true, so this function must not
+	 * touch anchor->wait after that.
+	 */
+	spin_lock_irqsave(&anchor->lock, flags);
 	atomic_dec(&anchor->suspend_wakeups);
-	if (usb_anchor_check_wakeup(anchor))
+	if (__usb_anchor_check_wakeup(anchor))
 		wake_up(&anchor->wait);
+	spin_unlock_irqrestore(&anchor->lock, flags);
 }
 EXPORT_SYMBOL_GPL(usb_anchor_resume_wakeups);
=20
@@ -949,6 +980,14 @@ EXPORT_SYMBOL_GPL(usb_anchor_resume_wakeups);
 int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
 				  unsigned int timeout)
 {
+	/*
+	 * The condition must be evaluated under anchor->lock: when this
+	 * function returns non-zero, every URB giveback that has incremented
+	 * suspend_wakeups has finished with the anchor, so the caller may
+	 * free the anchor, which is typically embedded in the driver's
+	 * private structure.  A zero return (timeout) means a giveback may
+	 * still be in flight and gives no such guarantee.
+	 */
 	return wait_event_timeout(anchor->wait,
 				  usb_anchor_check_wakeup(anchor),
 				  msecs_to_jiffies(timeout));
@@ -1005,7 +1044,7 @@ void usb_scuttle_anchored_urbs(struct usb_anchor *ancho=
r)
 					    struct urb, anchor_list);
 			__usb_unanchor_urb(victim, anchor);
 		}
-		surely_empty =3D usb_anchor_check_wakeup(anchor);
+		surely_empty =3D __usb_anchor_check_wakeup(anchor);
=20
 		spin_unlock_irqrestore(&anchor->lock, flags);
 		cpu_relax();

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
--=20
2.39.5 (Apple Git-154)

