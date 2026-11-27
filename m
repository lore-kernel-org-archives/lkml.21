Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786135;
	b=FJWra5tF+aWG8m0v0zWDuPuWw0f5wBcrXqPpdvDckZBbURk2uBJHaZ3oSclPtIWYCZNJ
	 pdMIgorf4Txr3BOfB8uuXuF4B5VK+eMJeixSwpWxozaCR9wm4bnedIgFdSA1XUfDOjPUv
	 uyJHtf443A51cF68bPUUnyWwRLDuvYcRmRIXcEpVq9Xp/FVsKywsiHkYNQsFEmlP78Vce
	 vtmFgPXn6wfgDkyMRu32OAhYuBkcFrvjogMkMw/VJpFLDm2THntcZPvI9iiPQKDqdOwZX
	 SxcugeOy2VgWkfgLcjPzVwvxq6eHFaxPe7gK5yRx2hfI/wUXHdbiyhttlwNqbbUsKcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786135;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=e01QIr9P+RAD45MEmIVWH+gThT8qQM3Uki49hXDrI2k=;
	b=uVLNpY9WlIqN5NSv+7Ah20QoU7Krzwir9jfYtLvGQ54la8wVbud4Ns0uhVEgpvSbQJ/r
	 9IyCDcV2QopxCiKcElwULOHryzLtE4os26TYoXbGKgKPku0qukVzjdISVtG5WQ/TlX9C4
	 8PmKuG68TDXRlBDWzf56WyoJC0xqeUwrdrL8KKXXu2tuOKRDT26r35kYmCv4TEnyEpaQ5
	 fsHhMujzVH5ta+e39j2o5QPk4bPkDfCdFWy0UzpQHlmn0PDNTteoA4NCjypzlcvJGInZn
	 oXTPrERfFOPl07oAv0EOMv8i8Z2eqWIh0hA3dWI3sb/3iVaqTxBCa8JpugLa8fyTo1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF490606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF490606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cddac941ed1so3645014a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786134; x=1796390934;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e01QIr9P+RAD45MEmIVWH+gThT8qQM3Uki49hXDrI2k=;
        b=Jg/WwImuIFiFJ6i+RcS6LNe6BhJ5pQDjFXT6BKhSRVjiDx+TLMOxScIQtBn3e/oOFz
         cnzDUnGaCjazfF1KElQx88CJz77j/7EQACmlQlo5vT1RurPBFVLc7cxffyh01OlhX3J1
         L5iPf93B0DCcNgLtA5rZNTw7t5wIn0G4n1qvhuFrrMWXRWLl15EVqmvJj6/7rtFlWmCr
         9/+ElU+CN+NbS8zOl6aQm/AnlDXmkqy2YFYGbfgLYmU1qK6tEcyRtdAXFwyBs7TyDp4K
         Mk8jj7RoTT4yr+laI0EMZBEClhW1uA/6zwPxuNRTaF0xL1QB/CeI4WDwLcQ0FKqVk3zh
         xGSw==
X-Forwarded-Encrypted: i=1; AL+hErEh7oHx+geumHCXah3HBa42FosMFjnf81s+2jf2aL+/OAQnIQ+OUmu4PrD+50x5X4L4wD+BqxGVohxGyRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+w2s+G1BC7ita8CZa6OI7NAVPMD+Lhl5ftv1NxiOlnwsse2Fsg
	eLbf6eXywY7LNat6H67L64sfx48nQmXnAOp3DrQrSXWMXXCZEWmQCX4m
X-Gm-Gg: AZFdTZfAZj4gThWaolvuXT7y7Yc9+pjriPPmM4erqswK6Mq3UCvk177h2lNcjwxlmnu
	Xr/YkRntWFTApreJr55gaXWDDM5Jbwf1R0GI0I39htYiHs0SS61Di0e1FIj6qi5gLPZV4DNFOOZ
	lSDohZiIC+vGlsOX1DaK1lKO9a3cxVPAGPD7sHjrU80fELPAEN6MhAOCeRjAiwXeNEDF1T2QUWA
	/DDSRNadR5NceLhINDp59sqn0fZZ/qdYjy/HCeNckpQxVCX+Msxd/e030Dg7tTDbsVOH5866q+Z
	hekN8yTbjIhEafpkt8L1NVD5s5x4crDQBZpUM1pSmhdD3Bff4ZLtWW09r+mtiJr9sIK4w1cTRb4
	LOh4nMpY7DIjz0ZDDZOpjeT0A/ORwec+uXcrxKBQsdZHw56Bt43jLZWD2mmg/cFWkLQZuC2ewzj
	AdxNmjksjgP0DZXGNg+zLof3P1SB7SH7q6O6H5N90hg9D/x4iulgoc3puJjD+8+nVNCJXG+UbI+
	eulG+erm4esW5PfE61siDlFwYam2Fdd8PaURg9Z1pnaFOzclCV9XBKwyatF2FezGubZh0oga403
	XjMncTOW3+NNktDFlSjOT9aGwoVY/IuuOBmuLfv2KdL0SnPQS9q1VJoI9d3P7qbOty38QMq8hVb
	DCTnPAMqqjbYdndAAyAnTz8W88slya4qa/numTPxGQL/IWRYFnu20yTPs1oyLajk3A1k=
X-Received: by 2002:a17:90b:4ccb:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b41c7b67femr24262205a91.3.1795786134004;
        Fri, 27 Nov 2026 05:28:54 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm41143707a91.12.2026.11.27.05.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:28:53 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, oliver@neukum.org,
 Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 [PATCH v3 1/3] usb: core: Fix use-after-free in anchor wakeup protocol
Date: Fri, 27 Nov 2026 21:28:51 +0800
Message-ID: <179578613111.44635.6383445613775882412@kylinos.cn>
In-Reply-To: <179578612505.44635.14553263875690325600@kylinos.cn>
References: <179578612505.44635.14553263875690325600@kylinos.cn>
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

