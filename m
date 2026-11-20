Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179938;
	b=0ZBu434ouFLX/9DISQG9aS2xi40VBg8YJ+KE4orPkvy8H1zXtPT+YTWUxPyejJxeD832
	 wDy609txrF0uyVXZWvR8XN32z5251UC6u54rId1eEZNDGbpZxeZLTwzbvDVFqBcManhVE
	 WMISfxS4iDYtIAeLAv/oGTq7h/t/6IqMts71AGCMcxz8lwM5RSghOR1Kxa459c+bcOB5a
	 HmqLHSFp9lOQ6gl23eO66TfVE6zWAVxiE+Itzd/GaghLiLTfLSlGR2LIvM5Kqonw6kf+A
	 eqvOP0vKuOizrP6b3hltAnZ2JeSAtfu2EJPtEfeHLi5p6kp8Ypq9yP0AeOxufX6Szmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=mEAv9TaYjytd0TR+9Dd3BpQmE0JPDqq7e7RE/zyKiUU=;
	b=NP65mLqdFAGwZrI+1sJMaaV5NzsiVCq9phOyStr48zyjDg5HhKkmnq6A2f96jmkRKG2O
	 QeCCsq4rOsUJw7DQ29PPzXJo5PZJt6jcpFZWH1Th0Bd3NeqG2Z44qLu81j+GUuoL343/C
	 Wi+i+ol/VYvSEaSDX0irs0UefbazjlJGgNokVpNU8DWtVNAF6gc4sBXJGlWxf6m6mGRAM
	 I1QPMCeMU/l+GCA2hvHSLkEtinnBM2UhGKyTyJS5AXvveNoWzNZVmxmIXBYV9tQbHjqho
	 MzRYDm30q8/leAH/RUffYVW6gnuGtUcfm3dKiGkuYnFb84cNQVq8/hhzcq6dtYc2M/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ys7Ct5tW;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D0360A3806
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D0360A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ys7Ct5tW
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso149934066b.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179936; x=1795784736; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mEAv9TaYjytd0TR+9Dd3BpQmE0JPDqq7e7RE/zyKiUU=;
        b=Ys7Ct5tWfHjLSZ9TRLEKcaksfwSctB8ICcAZrwzMeVy8G2mFx2SkhW6AJqShB9IvBQ
         1K2vTqGM4xPfGY3Is3Ov687sBSRe6nPyEbuF6K+e9IQPIvx2jHiDBzGS1iW11MRVH4jr
         q4PN3O5TC33Jh0/rcFqqaNlnt42A3FuhXzV4A9U+5nO1DZfijvs8tJx3T0ZVaaUbgMfI
         rDR+i2jWoLEXNWt+kCi48zWkW7jTkpkPZTKuQEyk+vSI+WWZ/r7YXD+2vO5E/T7bxilg
         q+EUWAPcGYxhHUFX0pmXWeuP9UF7vHlnYC+5n6xL7W/YjZB/TG8iSLo0BoCroLPI8I9H
         gdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179936; x=1795784736;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEAv9TaYjytd0TR+9Dd3BpQmE0JPDqq7e7RE/zyKiUU=;
        b=QXtgc+KUXU8ElTbWTRx2F9l8F6jvfGqfGOdw3qZfmAyq6k3N0CcKN6MThM94aC6qnG
         hTdwyp8ZlyzMdmqr52mjrT4vl+6bPa29zYWBJPqHzos5l5hQqgVJsHtaFuad1thT7HI9
         N2eW6yyFEPi+g3QTH19TQlN2N2NpEB1zojCmODP9I+F4LbVIloWNGneTS92oW4SJ6RNA
         HfuxNJa4oU/JbrqeBktUeHH8BDi0UOa07FcUt9YS6aFuYV33G/c+87w/YR69oLjWlhEz
         vdNxW01oRzBtB73jZqpOwWYYGJWKxNHlGasOtk9YQZiP3RSFm4dx7nu48MoX3wDm4QfJ
         Vswg==
X-Forwarded-Encrypted: i=1; AL+hErH0j/ztl4AOAafFEEqLRX6QU0MbLI3LumEaV5EfjY2VUM5It9dTkhVnPHc7ypBTFGXUeSEyvpN4TVvDKTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q///bAjiWtmKeUERvqEWfzvVuLSiuqgPMYJ3OjfiLlmpTPvKx
	BeSI7zaQTUN9v92mHKlRtUeUVR0T9cEs/Gc3x87TIk0GjJMIP1E4KjU/Ksdvvg==
X-Gm-Gg: AZFdTZdKc0xiW9tPUkXE1zSbbQ8YZp11xyW+thkMwva4O5rG7ppsiNsQv/QPgw2N9Mq
	3+SWAZRIlh+m4FntiNtp8TJ5XiMgiYE+K91CQ2b53+RooO6eby2w/8/Zt5ZolfZmESFx2kfmCEJ
	KeV2wgpDV9wvWVkyzkHMWquDInM2E0UAXJwdREqCS6h/jIPoG80bEKlJFW1bCbQw5luvSO86lME
	Pb/0zsINETx4uNy7XOprPMCP/JHIUzhq0HtNIT6pivq2h19bN8+6Y9RONhCFI629BQAqEmo46Bu
	vUgiZ+TzZQhQdWFMasZrdEVvbeEIvphvBNE4RB3RGgiVOazYWgKScmLDCNpcLiiF9R5WCSy8qbX
	LzaPRtsuuQJSY3gOekz3j3pTD43lZUmB9I4Ea16yBEadnABXuYGGfCTkjlBAn4hBN7sekFFg0y4
	hk5Ht4vTVekSBacHLgQIjQdYDZTY0hwmOjHg3G4XUVDHfuI8HCkSYo7dBZHXcyu4Em5pjaknRp/
	jrQ+FNTNNf2b1n3NpyGBxmWiYkuntEJSbowMV2GcUxnxvU9T9K0gvuHgYaJO/LMcy9zOONAF6Ly
	lfBHxRP+zn2oGj/sfxla2Z7XMODIAMMwRFE0X+J77ukxzHtkpw+urQ4r
X-Received: by 2002:a17:906:9f8d:b0:c42:102f:15f0 with SMTP id a640c23a62f3a-c513a3a805bmr339355766b.3.1795179936189;
        Fri, 20 Nov 2026 05:05:36 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67cbfsm95760566b.14.2026.11.20.05.05.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2026 05:05:35 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v3 5/8] char: xillybus: Refactor flush function
Date: Fri, 20 Nov 2026 14:04:59 +0100
Message-Id: <20261120130502.17056-6-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261120130502.17056-1-eli.billauer@gmail.com>
References: <20261120130502.17056-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Previous flush_downstream() looped on wait_event_interruptible() and
wait_event_interruptible_timeout() without returning if an interrupt
occurred. Replace these with non-interruptible counterparts and use
wake_up() instead of wake_up_interruptible() on the relevant wait queue.

In addition, flush_downstream()'s @interruptible argument is removed.
Instead, this function either waits with a timeout only, or with an
interruptible wait. This is what the callers of this function requested
anyhow.

Fixes: a53d1202aef1 ("char: xillybus: Add driver for XillyUSB (Xillybus variant for USB)")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com
Link: https://sashiko.dev/#/patchset/20261109112800.48663-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v3:
    - No changes.
    
    Changes in v2:
    - Always call wait_event_timeout(), with a timeout of max(1L,
      left_to_sleep), so that the wait condition is checked even when the
      deadline has already passed. This addresses Sashiko's comment about
      a missing condition check in flush_downstream().
    - Added include of <linux/minmax.h> for max().
    - Added Fixes: tag.
    - Added Link to the v1 review.

 drivers/char/xillybus/xillyusb.c | 86 ++++++++++++++------------------
 1 file changed, 37 insertions(+), 49 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index f9c8591a679f..decc87f8e059 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/types.h>
+#include <linux/minmax.h>
 #include <linux/slab.h>
 #include <linux/list.h>
 #include <linux/device.h>
@@ -601,7 +602,7 @@ static void wakeup_all(struct work_struct *work)
 
 		mutex_unlock(&chan->lock);
 
-		wake_up_interruptible(&chan->flushq);
+		wake_up(&chan->flushq);
 	}
 
 	mutex_unlock(&xdev->process_in_mutex);
@@ -920,12 +921,12 @@ static int process_in_opcode(struct xillyusb_dev *xdev,
 
 	case OPCODE_REACHED_CHECKPOINT:
 		chan->flushing = 0;
-		wake_up_interruptible(&chan->flushq);
+		wake_up(&chan->flushq);
 		break;
 
 	case OPCODE_CANCELED_CHECKPOINT:
 		chan->canceled = 1;
-		wake_up_interruptible(&chan->flushq);
+		wake_up(&chan->flushq);
 		break;
 
 	default:
@@ -1127,11 +1128,13 @@ static int xillyusb_send_opcode(struct xillyusb_dev *xdev,
  * chan->flushed is there to avoid multiple flushes at the same position,
  * in particular as a result of programs that close the file descriptor
  * e.g. after a dup2() for redirection.
+ *
+ * If timeout == 0, no timeout is applied and the wait is interruptible,
+ * otherwise a timeout is applied but the wait is non-interruptible.
  */
 
 static int flush_downstream(struct xillyusb_channel *chan,
-			    unsigned long timeout,
-			    bool interruptible)
+			    unsigned long timeout)
 {
 	struct xillyusb_dev *xdev = chan->xdev;
 	int chan_num = chan->chan_idx << 1;
@@ -1156,21 +1159,19 @@ static int flush_downstream(struct xillyusb_channel *chan,
 			return rc; /* Only real error, never -EINTR */
 
 		/* Ignoring interrupts. Cancellation must be handled */
-		while (!chan->canceled) {
-			left_to_sleep = cancel_deadline - jiffies;
+		left_to_sleep = cancel_deadline - jiffies;
 
-			if (left_to_sleep <= 0) {
-				report_io_error(xdev, -EIO);
-				return -EIO;
-			}
+		rc = wait_event_timeout(chan->flushq,
+					chan->canceled ||
+					xdev->error,
+					max(1L, left_to_sleep));
 
-			rc = wait_event_interruptible_timeout(chan->flushq,
-							      chan->canceled ||
-							      xdev->error,
-							      left_to_sleep);
+		if (xdev->error)
+			return xdev->error;
 
-			if (xdev->error)
-				return xdev->error;
+		if (!rc) {
+			report_io_error(xdev, -EIO);
+			return -EIO;
 		}
 	}
 
@@ -1191,40 +1192,27 @@ static int flush_downstream(struct xillyusb_channel *chan,
 	if (rc)
 		return rc; /* Only real error, never -EINTR */
 
-	if (!timeout) {
-		while (chan->flushing) {
-			rc = wait_event_interruptible(chan->flushq,
-						      !chan->flushing ||
-						      xdev->error);
-			if (xdev->error)
-				return xdev->error;
-
-			if (interruptible && rc)
-				return -EINTR;
-		}
-
-		goto done;
-	}
-
-	while (chan->flushing) {
+	if (timeout) {
 		left_to_sleep = deadline - jiffies;
 
-		if (left_to_sleep <= 0)
-			return -ETIMEDOUT;
+		rc = wait_event_timeout(chan->flushq,
+					!chan->flushing ||
+					xdev->error,
+					max(1L, left_to_sleep));
 
-		rc = wait_event_interruptible_timeout(chan->flushq,
-						      !chan->flushing ||
-						      xdev->error,
-						      left_to_sleep);
+		if (!rc)
+			return -ETIMEDOUT;
+	} else {
+		rc = wait_event_interruptible(chan->flushq,
+					      !chan->flushing || xdev->error);
+	}
 
-		if (xdev->error)
-			return xdev->error;
+	if (xdev->error)
+		return xdev->error;
 
-		if (interruptible && rc < 0)
-			return -EINTR;
-	}
+	if (rc < 0)
+		return -EINTR;
 
-done:
 	chan->flushed = 1;
 	return 0;
 }
@@ -1332,7 +1320,7 @@ static int xillyusb_open(struct inode *inode, struct file *filp)
 		 * This can't go wrong unless there's a serious hardware error
 		 * (or the computer is stuck for 500 ms?)
 		 */
-		rc = flush_downstream(chan, XILLY_RESPONSE_TIMEOUT, false);
+		rc = flush_downstream(chan, XILLY_RESPONSE_TIMEOUT);
 
 		if (rc == -ETIMEDOUT) {
 			rc = -EIO;
@@ -1626,7 +1614,7 @@ static int xillyusb_flush(struct file *filp, fl_owner_t id)
 	 * the user pressed CTRL-C, that interrupt will still be in flight by
 	 * the time we reach here, and the opportunity to flush is lost.
 	 */
-	rc = flush_downstream(chan, HZ, false);
+	rc = flush_downstream(chan, HZ);
 
 	mutex_unlock(&chan->out_mutex);
 
@@ -1696,7 +1684,7 @@ static ssize_t xillyusb_write(struct file *filp, const char __user *userbuf,
 	}
 
 	if (chan->out_synchronous) {
-		int flush_rc = flush_downstream(chan, 0, true);
+		int flush_rc = flush_downstream(chan, 0);
 
 		if (flush_rc && !rc)
 			rc = flush_rc;
@@ -1833,7 +1821,7 @@ static loff_t xillyusb_llseek(struct file *filp, loff_t offset, int whence)
 
 	if (chan->writable) {
 		chan->flushed = 0;
-		rc = flush_downstream(chan, HZ, false);
+		rc = flush_downstream(chan, HZ);
 	}
 
 end:
-- 
2.17.1

