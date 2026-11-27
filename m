Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770084;
	b=A+P72GKytk6+qacUQ7ViWwxKyaevkEx6u6dBIJQCB2XF0VUlJZC/1FnaJfce932a8HDX
	 dBdlxUmgQuwjXOl6AFZ5aILbKAyBH67U+18PZ8Si/vRBMFAbpF0oG2yEXJEqfWA/0BWoU
	 qOlOsZXahKevIdmxlfsb67r5fgT4jRUOPO0juz0HAXZ21sJ6cfMOvjVgoxfRcKbg97M8T
	 poicSWQi+F3Bnrqn9xmkPZmV2qCl4FEp0qBypxsPlo7KuPESizcSEV9gtmqUw4Y2VdFvH
	 SEEK7Ap5rXtA7BP7ijBYu+ReYoPWArdd0FANV+nD2MKa8xwXfC9LeYXxAt/pjOhiD3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770084;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WZ64iBX9cRqAfCFxJg7SKRaQD69RArxRnmZ3Tat1fcM=;
	b=egJHM3NGKTJOv7QpWF3UxKDfheTKnxFDaL7QXXs+2b67T0SGAuGsO7TwtGASrj0/o52O
	 gxokJHPwhmBQMBg4gdNIgG6gmw950KECBtX4SG9fuv/6/+zS5I7raD/X9lAo2MpAOQIIS
	 zUzxtCWAY8g9Rnc4V8myLsvEdczApz+AGI0jqr0l0+vkdBhjxuRfuJyMPncIcF3LewlgU
	 lQd1jqQr2FI2zwH3Lx64orCvThC65FJ6+XQuANcI96e56qEFpMXyjoNf9+E3JMuRiyBbX
	 Gg8GQ2F215H6MjRuoZLQ3ss1ADrW18cQzHBrLOWppDEOQ5wIz8hkhTKP1XZ5VhwR08Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A37606A684
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A37606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f05b465cd1so1564235ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770083; x=1796374883;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZ64iBX9cRqAfCFxJg7SKRaQD69RArxRnmZ3Tat1fcM=;
        b=KrWt3qlp5GuS4wAeXHBGiZdXftZoSGW5ISW+GD6HxJw/K+FTdEGKAkYu8qLiRSmziH
         a1g2gn8HzHSmuiTvg4eUWChOr/Cqo3zK2siohMA/q9MDdmlLE1cm1dK1J259oC81Z1br
         xA2Rw7Qj2gIvpsb5KE32QelAa44EymBFNHSJKIeJCNEkfoRIWEYYL3mKr3E5zm2EY1I5
         5zhDmh2PVPKoR8RGcWj16cFGfyOIc9eBg2IpwlMEH04pWZDFfsy2juixTAkn+cH5HcW6
         3FD8j1osWQsRvBNVBdqqXioIYlgQU5J/4MUPcJD4wzY7SESS/t1gBD3T77A8L3qjscPH
         x0lQ==
X-Forwarded-Encrypted: i=1; AL+hErGzNeiNWFVWAjoQCI1xYc41snF7UmRFnmKdM4mGnyXX4NKEbl9WWOMdbMoZnUL/Jph5aMYmGyd1WFp3Qbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8krwhv5pWPZZKcVPUe4MvQz9q9sjEUiYRpZVNCn1p3DwjXUM3m
	x9IQBQ09gdB22N9gX+sAIz2VRj4lWY9IBRy2Ud8xBSHi/elaHPb33o2z
X-Gm-Gg: AZFdTZdZbQ05+yEqcDM+NWjwBtZ9jf/kfqppRJ7nswdQ9r1kz0Og3owkaMLyTCh3wRB
	k1ss7xwrYfgRMMJZn94TEgj25aizkUunn2XTJy4yJnjsl6i+iXLIAZ3KtlaIjUalQbpYhmovHpQ
	RLEXsIdxo6cuRJzSkj/LmAkzoMrEzp5kOwD0j9klXsWIV/oVFWj3FvTdW7QY/4FJTDIfY/rqjJh
	5nh1xeHjgKKVwTkKulb85mo+D+KKu9E01liq7779ONy4iYpG7UayjlICxxkCwLTMeoeVtS05s9b
	HvaD3HNdwem3wyYWpEx24SABGvxbvKioi+sPsp9jEUKBDclNXnTDREzT5MnkuDoxJm+fKxiI/Ap
	DAy125UBuhi4KIRyM8giyCW+Bz8z4EB5AuLfJoQatHChcvG7z2kHZw49QR/cuaMMt6QCRh9Jc2p
	zZlIVzChKhhKYkP2k3bxtU3VoZucFYs3NIc53QIOiifR28Zdunzk3sdGTp2uEqBqKJmOYDvViQq
	EqQ2Lu7DgS4FH/+2MErUdzj15xoydtVE+PFhYgwZuGiXF2PKvFu5RBLTtiCQBe8jtQXMnWlOQ1c
	NW9c0v3+9z09BZwZR30y6VsNkTUqUsWnFpo2ooYepttfc6ZGb2YlNprXOtDFKitGGxSE3BrD0Uo
	4gnqqGbXL5vEsyZ+tD10zgxRcwSgrO8oJZFvaBiDPsYEX+w==
X-Received: by 2002:a17:903:3803:b0:2ed:379:1592 with SMTP id d9443c01a7336-2f0ea5af0b7mr60270675ad.26.1795770082662;
        Fri, 27 Nov 2026 01:01:22 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm117050725ad.57.2026.11.27.01.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:01:22 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, oliver@neukum.org,
 Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 2/3] usb: core: Close anchor capture-to-increment
 race in URB giveback
Date: Fri, 27 Nov 2026 17:01:18 +0800
Message-ID: <179577007898.23588.10805062257297682962@kylinos.cn>
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

__usb_hcd_giveback_urb() captures urb->anchor into a local
variable at the top of the function, but increments the anchor's
suspend_wakeups counter only after unmapping the URB for DMA and
running the usbmon hooks.  Nothing pins the anchor during that
window.  If the URB is concurrently unanchored by another thread --
a driver calling usb_unanchor_urb() on its own in-flight URB, or
usb_get_from_anchor() or usb_scuttle_anchored_urbs() taking it --
the anchor list can become empty while suspend_wakeups is still
zero.  A usb_wait_anchor_empty_timeout() waiter then observes the
condition true, returns, and the driver frees the anchor (anchors
are typically embedded in driver-private structures); the giveback's
atomic_inc() on the captured pointer, and the later decrement and
wake_up() in usb_anchor_resume_wakeups(), operate on freed memory.

The previous fix ("usb: core: Fix use-after-free in anchor wakeup
protocol") made both the waiter's condition check and the wakeup
side hold anchor->lock, but its guarantee was deliberately scoped
to givebacks that had already incremented suspend_wakeups: the
capture-to-increment gap remained open.

Fold the pointer capture, the increment and the unanchor into a
single anchor->lock critical section which re-verifies that
urb->anchor still names the captured anchor, so a giveback that
lost the race to a concurrent unanchor performs no anchor work at
all.  From the verified increment onward, a non-zero
suspend_wakeups keeps waiters from freeing the anchor until
usb_anchor_resume_wakeups() has finished with it.

What remains open is the few instructions between reading
urb->anchor and acquiring anchor->lock inside the new helper: a
concurrent unanchor plus waiter return plus anchor free would all
have to fit into that gap for the lock acquisition itself to touch
freed memory.  This is the same residual exposure
usb_unanchor_urb() has had since usb_anchor was introduced; closing
it entirely would require a lifetime protocol change (reference
count or RCU) for anchors, which is out of scope for a bugfix.

No syzbot report has been attributed to this interleaving; it was
found by extending the analysis of the previous fix.

Fixes: 6ec4147e7bdb ("usb-anchor: Delay usb_wait_anchor_empty_timeout wake up=
 till completion is done")
Cc: stable@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oliver@neukum.org>
Cc: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/core/hcd.c | 10 ++++++---
 drivers/usb/core/urb.c | 48 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.h |  1 +
 3 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b319..f221425fec0a 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1630,7 +1630,7 @@ int usb_hcd_unlink_urb (struct urb *urb, int status)
 static void __usb_hcd_giveback_urb(struct urb *urb)
 {
 	struct usb_hcd *hcd =3D bus_to_hcd(urb->dev->bus);
-	struct usb_anchor *anchor =3D urb->anchor;
+	struct usb_anchor *anchor;
 	int status =3D urb->unlinked;
=20
 	urb->hcpriv =3D NULL;
@@ -1641,8 +1641,12 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
=20
 	unmap_urb_for_dma(hcd, urb);
 	usbmon_urb_complete(&hcd->self, urb, status);
-	usb_anchor_suspend_wakeups(anchor);
-	usb_unanchor_urb(urb);
+	/*
+	 * Capturing the anchor, suspending its wakeups and unanchoring
+	 * must be atomic with each other; see
+	 * usb_unanchor_urb_and_suspend_wakeups().
+	 */
+	anchor =3D usb_unanchor_urb_and_suspend_wakeups(urb);
 	if (likely(status =3D=3D 0))
 		usb_led_activity(USB_LED_EVENT_HOST);
=20
diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index bb1778d9e9db..174dc42c95c1 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -14,6 +14,8 @@
 #include <linux/usb/hcd.h>
 #include <linux/scatterlist.h>
=20
+#include "usb.h"
+
 #define to_urb(d) container_of(d, struct urb, kref)
=20
=20
@@ -205,6 +207,52 @@ void usb_unanchor_urb(struct urb *urb)
 }
 EXPORT_SYMBOL_GPL(usb_unanchor_urb);
=20
+/*
+ * usb_unanchor_urb_and_suspend_wakeups - atomically unanchor @urb and
+ * increment the suspend_wakeups counter of its anchor.
+ * @urb: the URB to unanchor
+ *
+ * Used by the URB giveback path, which must capture urb->anchor and
+ * increment anchor->suspend_wakeups atomically with the removal of
+ * @urb from anchor->urb_list.  Otherwise a concurrent unanchor of
+ * @urb (a driver calling usb_unanchor_urb() on its own in-flight URB,
+ * or usb_get_from_anchor() or usb_scuttle_anchored_urbs() taking it)
+ * can leave the anchor with an empty urb_list while suspend_wakeups
+ * is still zero, so a usb_wait_anchor_empty_timeout() waiter observes
+ * the wait condition true, returns, and the driver may free the
+ * anchor before the giveback gets to touch it.
+ *
+ * The verification of urb->anchor under anchor->lock makes this safe
+ * against racing re-anchoring, because "urb->anchor =3D=3D anchor" and
+ * "@urb is on anchor->urb_list" are changed together only while
+ * holding anchor->lock.
+ *
+ * Return: the anchor, which the caller must later pass to
+ * usb_anchor_resume_wakeups(), or NULL if @urb is not anchored
+ * anymore (a concurrent unanchor won the race).
+ */
+struct usb_anchor *usb_unanchor_urb_and_suspend_wakeups(struct urb *urb)
+{
+	struct usb_anchor *anchor;
+	unsigned long flags;
+
+	anchor =3D urb->anchor;
+	if (!anchor)
+		return NULL;
+
+	spin_lock_irqsave(&anchor->lock, flags);
+	if (likely(anchor =3D=3D urb->anchor)) {
+		atomic_inc(&anchor->suspend_wakeups);
+		__usb_unanchor_urb(urb, anchor);
+		spin_unlock_irqrestore(&anchor->lock, flags);
+	} else {
+		spin_unlock_irqrestore(&anchor->lock, flags);
+		anchor =3D NULL;
+	}
+
+	return anchor;
+}
+
 /*-------------------------------------------------------------------*/
=20
 static const int pipetypes[4] =3D {
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index a9b37aeb515b..362bfda497cc 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -20,6 +20,7 @@ extern int usb_create_ep_devs(struct device *parent,
 				struct usb_host_endpoint *endpoint,
 				struct usb_device *udev);
 extern void usb_remove_ep_devs(struct usb_host_endpoint *endpoint);
+extern struct usb_anchor *usb_unanchor_urb_and_suspend_wakeups(struct urb *u=
rb);
=20
 extern void usb_enable_endpoint(struct usb_device *dev,
 		struct usb_host_endpoint *ep, bool reset_toggle);
--=20
2.39.5 (Apple Git-154)

