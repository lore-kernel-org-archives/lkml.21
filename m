Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786141;
	b=PJYt/GA5I01aGHCpDQ3DutDhRhZbD8Ak+IhGPLQSla+o/rlylEvo+dTnagqGTaiiaQAQ
	 ZxrhwZsIz0u085PdGa61ZTXBgxibdnAzh7jCuMcX2M9UM1+M9BK6McBOiYbxJcmawj9d5
	 7+7t2elEr2Uq+2Fkl1gALx0SwbLRS49t32fKx9LvqAnXaeGp01CxyHAPbxIlRJZ0fygLw
	 ymrP7HEhlnUrKnNp0PFTwQcPZL4phFJuiPtimroTYxUq+FeaDn+0+Q8WdINZgi2nUFgfG
	 4ORVTU5Q3Ghdg2OxprGmw7E60lK3kN5gr4N6qdNxpixj5EGQPsXIIDGv79q1WHLv5YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786141;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WZ64iBX9cRqAfCFxJg7SKRaQD69RArxRnmZ3Tat1fcM=;
	b=L2NZsvzGmZDID5yaHsiZZo7AV/jjzyr7YIhH1F00aoBrfFFq/5dWF2ggiOVabmryKcJr
	 bXrfB46tVriYD1KW6pNrMq05XByd9QjjTvNKfLikQy6mdjgGe298LUl4CsQvxw1fr5qHc
	 s8TMt3aYARr26E/+r+z7HVzdfu0O1TuZBPOOvjUXhzR5x08lMAUaX98iFPEUcKgAVd94L
	 Vf/jkdEtK8b5mw9IwwJNOn56kr8Fl5e/Xz5Dnnbk8UiG5E5xjyTigSLfklEHOEh0H9wEx
	 +CvZSIrFF4rcVf5+SfdN7LG7ngliuNIpbZ9gxMtHNchwMIbivjeIVN0muzoSjr9jHiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A20606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5A20606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso4645385a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:29:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786140; x=1796390940;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZ64iBX9cRqAfCFxJg7SKRaQD69RArxRnmZ3Tat1fcM=;
        b=e+j6KJ4F132v2t7SNoqd+pb2Mq96HE5ZtslGTOPdmwebWB5W0hI7Hd9uYW82N1w1cZ
         H+psG/voqKFbKhA625ZmOUGo+ux3kvagdlnqBx/JTbn55vNAirtAOXHcqNzYCPxnb2Cm
         NLxISvucnimviaAWO+2RuU4JLJfd1KTEGyV0CVEpxugqDXDS0IT+Op1MnhU9IethApLg
         HzpK+zzQazrbN7aAr6q3BUvFy5rg4vsnnUg3ICIah5H88dYf3lQE5carX/HWDkGspns2
         g0HrDfRgFf8OHdNS7PRDQLU6t9CKLCaRmnt7ppLKgHIZKKK7LejTndVm9gQHl6i2O8+3
         BTAg==
X-Forwarded-Encrypted: i=1; AL+hErEzq+z9V6eL8rlLKRnMkogDPQQLrwWYLx+1+69RHAL4w+AW1DhjfsRTtgZpAhnYY8byc7JJZ1dpCMhZR1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z14hRvfUHMqWmst0eKn4L5ssIWLuKE+Jv6QWuH/QbTT2IE6o1
	iZvQEtifQdC+vJdmPNty1AsCyiLOmi4SB/tlpNQ5VP7+fHlIFFhvW720
X-Gm-Gg: AZFdTZcseC5V2sh06nYW8OT7EihpaPSRyuHURlVPeU2jhs72481FHOsSXl5gC9OUrVJ
	9FPMZLPHuNUnyT8KUfT2t3O9BsS2gd6BOVxeGZitIGntZhFG94Zm9Z0HA9u2gWuyC8S1MzyvOcK
	tuQMcV4ZAzCSNTgi1Lw8zfwThdgPFDnQUTdeydLE74IFVBaebG2BYsBP6AIm+JSP9yVMAt78j+G
	SjHqAYGDhYmDRthP1ncByDTXqE04M8NpuZWdLpmBxtFsBnfD/bzIDGxA4qH/YMy+B38vTGhVHO6
	CxGwpi6K91Mg/Y0ABbcIjvBde+Z2f6iaqKjueLhLGiewyhqPMt4PXdBlRG4xntYVFXlwmZQpgrN
	YI/JbCEU+dZ+M0pvFG4QWhzLD59+IydzrNV0io8gr9GQWX+x+9V4v8YHxSDkrFC44h+LzQ4yXVY
	0ouOp9JAn8+jTJtOA9n59JkNdMUozkeWMMv7dYa+ugOMyQqIl0dOEI82MWjtnNNumsX+Abr74Ij
	JAyIC0smRbE0dL63+eYwqSp/PljXV2WAuz8QFjZFYQi/uCLA+NnUMmxyL7E+hTm4ob6sT3BJVTX
	lc11gLr5VLmzq5uB7KX10bpoAMPs9w2q1OjQb6y0KRBRLEr8HLaIcPiuWcT93qfr6k+1AlP2UXj
	gzaVWjs/wKiXGEISFCmlLwrup0S3pY0XkQNfMkysFJUiuaA==
X-Received: by 2002:a17:90b:2416:b0:3b4:a6ab:b846 with SMTP id 98e67ed59e1d1-3b4a6abb9e0mr7253839a91.17.1795786140042;
        Fri, 27 Nov 2026 05:29:00 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm41143707a91.12.2026.11.27.05.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:28:59 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, oliver@neukum.org,
 Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] usb: core: Close anchor capture-to-increment race in
 URB giveback
Date: Fri, 27 Nov 2026 21:28:57 +0800
Message-ID: <179578613710.44635.10714432326136808343@kylinos.cn>
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

