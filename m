Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770025;
	b=P3aL5QaxzdbjCHDEIGvXy29uPlmumhtBaPGHxZnJcmqURrfla67ZKx3nXR2yst2f+2cf
	 TnT/TQLPA8S6ePXbPKyacLiFBidrw8mjT75gj2AzsE2N9JiBp/bL2CwsPQsB/gf8Z6A8U
	 qtZQcBoYnBE/QDChQmVoCsbJAxMj739Z8oEBdHeiU0DZfUjBObT62XzWwF/PNtX0sOjIs
	 NYJn3OFQmyuO2G2xim72/7S/MABSakbUcvN1KDJ8jYyTDKQbiymx6lCfMJeHNClJ1Vf2Q
	 1EQiRjco1F28drmWa6zE7TPU9T2wkUCGIAdPmPKalkbNsjwnQ/EbCUY/Smv47okjjWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770025;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=fN2y5fhHh/4cruvGZQSki6nc9ndPN4qcZFvy97L3aZE=;
	b=F2NFE6WLQr2y7pPLdVk9nSOR+K4XnIk4wqGkzUODDvvzyG6vou1k/2YwnitQRyYFwpGk
	 yVNBGnEZKnrWmIY7J3E29zcgxdhUU2qVagmC/9iHlRX273aP+uGfboV9iMJ+PjLU5VA/p
	 GNQRh2lcRMgreGY2mSK3FTbEME4esjUiqnKz2Q2j3Y9Xrcv6kP8+vQGBDkRDFAhgkr4Se
	 7gnr9Dm4e79rymx6O5ICyw85bAsQa+E70bOL3DMVNjuBxOTKFANyL3M3V1fx2mUujfcWb
	 QpBMxQkYbRgWX2niBzsWfkR2MywVhqpdbbPxJVGXK/0Qj+p2Rh80K/I5XF4TvWq+DrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C9F606A335
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C9F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f07a960666so55071785ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:00:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770023; x=1796374823;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fN2y5fhHh/4cruvGZQSki6nc9ndPN4qcZFvy97L3aZE=;
        b=LRxHEELLw6oDVmj7F1gAM2Rvbmh8JU5djrBXpKt/blX64ZDVstwdF5qIOTsX7V85iw
         yX+xfGu3+sUMjksm+jKfrFSuyvqsb3mw9nZp8hIN60Jmb26bH2Z+1Oseb7E3B8czQ7Og
         weQx2FGm47r75LhEdAB29XTl7NgUCt5YaaE662M9E50T4cby65qtaoasr1QYd8Ughdf4
         XSkcAE1NH74tXHdswpALuP2EPgqEunUuv5Nh80Be20YcVWrGvg87FskrmgoBhMjkKasW
         KzN9lhZ9xLi7S3YffZy5iQXL13LP7hhfko2g9QGF5seVyrR64ygHnIqqOVPbog0G61X0
         sMeg==
X-Forwarded-Encrypted: i=1; AL+hErG4GCAMw8Sg25xN5hp/sqdOP98SMic/ExUHYQjZoSR/Re+99bz1oX5fssBsoJizrKimRhRzbxo/6r2ejcE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ll/5Drcep9YYT7l8V+kKvaH8citDznHfhjdgfclVyUp34ND3U
	G2/uCu0tZsXzjsTW9tWi5ZU5m/Ugn/vgHab27Q1ZgXPp494pEFMV1wl5VBTCDGRjZgMhJA==
X-Gm-Gg: AZFdTZfVx+KH++fg4W3IeH4HLo0ShqXTB1WllUAwvrnVKHpI7bua6jx1kB7rmvOPHSE
	c04dyQvxDwNVLam0BWkOgVcPdhxVPUbDhYaL+8Iw14WdwdDwXtR5hH/Em7esX98xVZOlGPyUI4e
	rI07BNlpyanF8qTjewSeZwc3Nhc9d02PqFV5Jg+T/XGWvn+gMZ4rINXoFnN5Ell9vk215aqBN4E
	OhF8wG8IJicIOemT2i2ZEEycGDzpe9yGYHpSAKqC8wJkQRCLlzEWZzNtvdHUeu4u9qIOdobIJYO
	or1/CvsGx4bUJ34mkgJlV29QviiKmCCEQGHbXzuqkdxFq2eXjZnmaw5s1xV356VDEb9u+XcgbyD
	GtbE3Vx4ZkECIYjCMUMnggJja0Jb9byTgCvuprTJ2m6JXIbGXO5r1gLJnqmM0nMKjfhOUumPUAR
	++7HHddBxOPeb4efHxYt8Vj9wkkkS62w3GqpB6+k1jDOL5BZHr5c0RB0zQxD1g5243ZmYq8LvhX
	RvYljqLSjNCVHL/TLlpxKLylNNS/+gfFKVPH6+bPPkGq7SifLO4CrhlGRNfURLBcVR+Z/ijIHLX
	7Gg8b9JXs9pbTT2u1TxeJCaYsrJJJoGhnTzW7XzcaUilehQ5HHS6/ebGnTYNtLhPaYDnktTevnr
	LjnYIhEBVxAwy9NMtfotM7HqBA3Ji7rgPjJYDgeGB3sFBKw==
X-Received: by 2002:a17:902:dacb:b0:2f0:25ea:8fca with SMTP id d9443c01a7336-2f03f11e6f1mr266269635ad.26.1795770022824;
        Fri, 27 Nov 2026 01:00:22 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm117050725ad.57.2026.11.27.01.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:00:22 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Shuah Khan <skhan@linuxfoundation.org>, shuah@kernel.org,
 valentina.manea.m@gmail.com, gregkh@linuxfoundation.org
Cc: i@zenithal.me, bgmerrell@novell.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+b6f11035e572f08bc20f@syzkaller.appspotmail.com,
 syzbot+a7edecbf389d11a369d4@syzkaller.appspotmail.com,
 syzbot+bfa320b67fcbe2583c6f@syzkaller.appspotmail.com
Subject: [PATCH v2] usbip: vhci_hcd: time out unanswered unlink requests
Date: Fri, 27 Nov 2026 17:00:17 +0800
Message-ID: <179577001740.23588.17598940424505809386@kylinos.cn>
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

When the connection to the peer is alive, vhci_urb_dequeue() only queues
a CMD_UNLINK PDU and relies on the peer to send RET_UNLINK (or
RET_SUBMIT) before the unlinked URB is given back.  A peer that keeps
the socket open but never answers therefore makes usb_kill_urb() wait
forever.  The waiter is typically the hub work item, which runs with
the shared address0_mutex held, so every later task that needs that
mutex or the device lock chain - a second attach, usbfs open/release/
ioctl, udev - piles up behind it and the whole USB stack wedges.

syzbot reports this shape in three long-lived bugs:
  INFO: task hung in hub_port_init
  INFO: task hung in hub_event
  INFO: task hung in usbdev_release

Give every queued unlink request a deadline of its own and arm a
per-device watchdog; when the watchdog fires, it tears the connection
down through the existing error path (VDEV_EVENT_ERROR_TCP) if any
request is still unanswered past its own deadline.  The teardown
already knows how to give back every pending URB with -ENODEV, and a
RET_UNLINK that arrives late (or never) after that is handled by the
existing "already given back" paths.

The watchdog is cancelled whenever no request is outstanding.  Queueing
a request re-arms it to that request's deadline, so the callback does
not trust the timer's expiry: it re-checks the outstanding requests
against their own deadlines under priv_lock and becomes a no-op when
none has run out.  A peer that answers promptly is therefore unaffected.
Controller removal quiesces the device first - the event handler
stops the per-device rx/tx threads and drains the pending events -
and only then calls timer_shutdown_sync(), which also waits for a
watchdog callback that is already running, so the callback cannot
touch the controller after it is freed.

In a regular setup, any network stall that leaves the TCP connection
established while the peer stops replying (such as a wedged proxy, a
firewall dropping server-to-client traffic, or a hung server) triggers
this whenever a client control transfer times out into usb_kill_urb().
Verified end to end with usbipd exporting g_serial on usbip-vudc and
usbip attach through a TCP relay stopped with SIGSTOP after enumeration:
deauthorizing the device hangs forever in usb_kill_urb() without this
patch, whereas with it the 5s watchdog tears the connection down and
the writer returns cleanly.

A similar fix was proposed as an RFC by the syzbot assisted-fix
pipeline; this version arms a single per-device watchdog instead of a
timer per unlink request.

Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
Reported-by: syzbot+b6f11035e572f08bc20f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=3D58aef18c1ad93d87652f24a0bc7a74=
b6d98ac710
Reported-by: syzbot+a7edecbf389d11a369d4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=3D7ff8ae4abed51ff2354c1addb66414=
3ec26ca588
Reported-by: syzbot+bfa320b67fcbe2583c6f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=3D048da78aba1a3a6139509492b2be50=
5b2d223762
Link: https://lore.kernel.org/all/1d6db53d-07ab-46ad-adc4-d09c95b2c83f@mail.k=
ernel.org/
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
Changes in v2:
- Document regular-setup reproduction and end-to-end usbipd/vhci test
  verification in the commit message per Shuah Khan's question on v1
  (no code changes).
- Link to v1: https://lore.kernel.org/r/20261006125652.10296-1-xiehongyu1@kyl=
inos.cn

 drivers/usb/usbip/vhci.h     |  8 ++++
 drivers/usb/usbip/vhci_hcd.c | 83 ++++++++++++++++++++++++++++++++++++
 drivers/usb/usbip/vhci_rx.c  |  2 +
 3 files changed, 93 insertions(+)

diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
index 5659dce1526e..6222283d9551 100644
--- a/drivers/usb/usbip/vhci.h
+++ b/drivers/usb/usbip/vhci.h
@@ -11,6 +11,7 @@
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/sysfs.h>
+#include <linux/timer.h>
 #include <linux/types.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
@@ -44,6 +45,9 @@ struct vhci_device {
 	struct list_head unlink_tx;
 	struct list_head unlink_rx;
=20
+	/* fires when the peer leaves an unlink request unanswered */
+	struct timer_list unlink_timer;
+
 	/* vhci_tx thread sleeps for this queue */
 	wait_queue_head_t waitq_tx;
 };
@@ -65,6 +69,9 @@ struct vhci_unlink {
=20
 	/* seqnum of the unlink target */
 	unsigned long unlink_seqnum;
+
+	/* deadline enforced by the per-device unlink watchdog */
+	unsigned long expires;
 };
=20
 enum hub_speed {
@@ -124,6 +131,7 @@ extern struct attribute_group vhci_attr_group;
=20
 /* vhci_hcd.c */
 void rh_port_connect(struct vhci_device *vdev, enum usb_device_speed speed);
+void vhci_stop_unlink_timer(struct vhci_device *vdev);
=20
 /* vhci_sysfs.c */
 int vhci_init_attr_group(void);
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 39e8faf4c18c..220051339445 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -19,6 +19,15 @@
 #define DRIVER_AUTHOR "Takahiro Hirofuchi"
 #define DRIVER_DESC "USB/IP 'Virtual' Host Controller (VHCI) Driver"
=20
+/*
+ * How long to wait for RET_UNLINK after sending CMD_UNLINK.  A peer that
+ * cannot answer an unlink request within a control-transfer timeout
+ * (USB_CTRL_GET_TIMEOUT) worth of time is considered stuck, and the
+ * connection is torn down so that URBs waiting for their unlink reply can
+ * be given back instead of hanging their owners forever.
+ */
+#define VHCI_UNLINK_TIMEOUT_MS	5000
+
 /*
  * TODO
  *	- update root hub emulation
@@ -846,6 +855,67 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct =
urb *urb, gfp_t mem_flag
 	return ret;
 }
=20
+/*
+ * Is any queued unlink request past its own deadline?  Each request
+ * carries the time by which the peer must have answered it, and the
+ * timer may have been re-armed by a newer request before that, so the
+ * callback decides by walking the lists rather than by the timer's own
+ * expiry.
+ */
+static bool vhci_unlink_expired(struct vhci_device *vdev, unsigned long now)
+{
+	struct vhci_unlink *unlink;
+
+	list_for_each_entry(unlink, &vdev->unlink_tx, list)
+		if (time_after_eq(now, unlink->expires))
+			return true;
+	list_for_each_entry(unlink, &vdev->unlink_rx, list)
+		if (time_after_eq(now, unlink->expires))
+			return true;
+
+	return false;
+}
+
+static void vhci_unlink_timeout(struct timer_list *t)
+{
+	struct vhci_device *vdev =3D timer_container_of(vdev, t, unlink_timer);
+	unsigned long flags;
+	bool expired;
+
+	spin_lock_irqsave(&vdev->priv_lock, flags);
+	expired =3D vhci_unlink_expired(vdev, jiffies);
+	spin_unlock_irqrestore(&vdev->priv_lock, flags);
+
+	if (!expired)
+		return;
+
+	dev_info(hcd_dev(vhci_hcd_to_hcd(vdev_to_vhci_hcd(vdev))),
+		 "peer did not reply to an unlink request within %d msecs\n",
+		 VHCI_UNLINK_TIMEOUT_MS);
+
+	/*
+	 * Reuses the teardown path taken on other peer failures, which
+	 * gives back all URBs waiting for their unlink reply.
+	 */
+	usbip_event_add(&vdev->ud, VDEV_EVENT_ERROR_TCP);
+}
+
+/*
+ * Stop the unlink watchdog once every queued unlink request is answered
+ * or given back.  Safe from any context: a concurrent watchdog expiry
+ * re-checks the per-request deadlines under vdev->priv_lock and becomes
+ * a no-op.
+ */
+void vhci_stop_unlink_timer(struct vhci_device *vdev)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&vdev->priv_lock, flags);
+	if (list_empty(&vdev->unlink_tx) && list_empty(&vdev->unlink_rx))
+		timer_delete(&vdev->unlink_timer);
+	spin_unlock_irqrestore(&vdev->priv_lock, flags);
+}
+
 /*
  * vhci_rx gives back the urb after receiving the reply of the urb.  If an
  * unlink pdu is sent or not, vhci_rx receives a normal return pdu and gives
@@ -968,6 +1038,14 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct=
 urb *urb, int status)
 		/* send cmd_unlink and try to cancel the pending URB in the
 		 * peer */
 		list_add_tail(&unlink->list, &vdev->unlink_tx);
+
+		/* if the peer does not answer this request within the
+		 * timeout, tear the connection down
+		 */
+		unlink->expires =3D
+			jiffies + msecs_to_jiffies(VHCI_UNLINK_TIMEOUT_MS);
+		mod_timer(&vdev->unlink_timer, unlink->expires);
+
 		wake_up(&vdev->waitq_tx);
=20
 		spin_unlock(&vdev->priv_lock);
@@ -1029,6 +1107,8 @@ static void vhci_device_unlink_cleanup(struct vhci_devi=
ce *vdev)
=20
 	/* give back URB of unanswered unlink request */
 	vhci_cleanup_unlink_list(vdev, &vdev->unlink_rx);
+
+	vhci_stop_unlink_timer(vdev);
 }
=20
 /*
@@ -1143,6 +1223,8 @@ static void vhci_device_init(struct vhci_device *vdev)
=20
 	init_waitqueue_head(&vdev->waitq_tx);
=20
+	timer_setup(&vdev->unlink_timer, vhci_unlink_timeout, 0);
+
 	vdev->ud.eh_ops.shutdown =3D vhci_shutdown_connection;
 	vdev->ud.eh_ops.reset =3D vhci_device_reset;
 	vdev->ud.eh_ops.unusable =3D vhci_device_unusable;
@@ -1269,6 +1351,7 @@ static void vhci_stop(struct usb_hcd *hcd)
=20
 		usbip_event_add(&vdev->ud, VDEV_EVENT_REMOVED);
 		usbip_stop_eh(&vdev->ud);
+		timer_shutdown_sync(&vdev->unlink_timer);
 	}
 }
=20
diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index a678e7c89837..32b1550839d2 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -179,6 +179,8 @@ static void vhci_recv_ret_unlink(struct vhci_device *vdev,
 	}
=20
 	kfree(unlink);
+
+	vhci_stop_unlink_timer(vdev);
 }
=20
 static int vhci_priv_tx_empty(struct vhci_device *vdev)

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
--=20
2.39.5 (Apple Git-154)

