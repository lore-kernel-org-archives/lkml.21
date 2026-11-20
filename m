Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179942;
	b=hj2Q4LIqrw1f6YTVd1EUvluRxYRvlSf+++x6svhtQhln2YC+jHpd2pYVTZnWkTlQlo3k
	 YtnRazy5RCNne+xwIyn23fVf/MOZ0V2nUWRrld+N4oryUAOoCBb88USgWLjE2WPctZfy8
	 gl8jCGiYJ5uUeqME6LX2zQko/PCFvtMNYTkrr3URynTydQqjjkTidAP9z8a2wzkgUvd4A
	 n3IN8PryM9woL9d2IzI4BXTRFoPKNiFb1/y0K+DDnSlD0t1xQDiVCvn0e4yJeisSu6Bal
	 O2FB5dU1gKdJ9bya5a82oosvAdJA+5LqNJPZxnkCl0z5LH/z8TZILier7bbamgwn2Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=fdYcbEEa+Mf3eVJx5v79dmTdBCUYWNOSkiBg65kpgws=;
	b=AhoY395O8ayaE4SrZlENpE5NRmXuDOZe8bqZ4u9YVv1p6u4pb8R0r2UvYv57CK5jm1sA
	 ugrW2aTuj9WFeDq8c7ocLbN4yQkUU63fUVxs9iztQ0shuQmGdoyQcryz1IGx15ijY9Kxj
	 2vf+ZVt/EWf7Xk3EmIjywBV69ew1gdKJJAiNbqNf9c2TlHFbkpQVUsdJHFJyJcQTMpQt/
	 M0OtBM+d0V0tTGppWgIDzx9/hIKb25efD/hWez6QnzKEP2yVR26vOBvqaO0gK5Nwb4K2g
	 dt3NQDq0o5d0upcoB1tNAjyjkIoU5Dnr+eg9S1VZ2cZrg1Bjdzc73OkRZA+2ae3SJNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EL9W9K4T;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E08560A3819
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E08560A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EL9W9K4T
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso1006946a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179940; x=1795784740; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fdYcbEEa+Mf3eVJx5v79dmTdBCUYWNOSkiBg65kpgws=;
        b=EL9W9K4Tr10C4Swz0QVeiXW57h09aENHUa4FcAMXNPutYzj+BPukOg2jPqOkjf8HBW
         u9hjUIJGZ52s1AHrz7B0RbmVULoMkX5aW8OHzYzUUUZw4gSN3i3NzJVQhTN0RnND4s+b
         yutfXzekcvK//mna1ftQA3Q59NQKRJvIIJvt39hMbmE8R0NvYCvmUd6ctWZhDS42O7he
         GGG449bV9Ap6LfQ0/ETGl1/BvtmQLUcJ4nJCO1T4ZomYX1nbOWXHdH2OCMNc+9XvnA7y
         UJia67hd8HftQG4wg8GzJ7LZDUCvwC6N4iQSIwV/AIo3uX0Glt2yfFGg5f0HpqYjfs5B
         QY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179940; x=1795784740;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdYcbEEa+Mf3eVJx5v79dmTdBCUYWNOSkiBg65kpgws=;
        b=oio1LlSJE01ID+qIPRRqkVzv1k+8EZ2b27AnuLNEyf86UbzmmfjvfWaPZ3cxN8XY1f
         PtqCXL7+zju1VOAgJS9ZLv1rJN+JQidDG3ebhSHyix2QiW3gpuqK1O5LtIPabt4a7+fT
         JMy0n0veR4zkrrqsjiDBxJMUE3YUq86QiSNrtJWKDKcnSvgyoc4kn6mPA6BHYjR7t2WX
         LE4pWiRErQiVyiMHUbqhKkTd93JM6/1uD/4Ce/9JIuVWh8hk6Xtc5RTQq6LNUVem9aT/
         5/WICsoTfFWdaTFPLc4l2QR3auy46inc3GvpdF+Xd27UTVMZeKA25Mx3+41rkD+1JJos
         v2+A==
X-Forwarded-Encrypted: i=1; AL+hErE8wVqJNstfNQsJ/DB8LpQf4WR/ZVBkTOXO9WC3ZlDxnoeQu/PF4iusE7YZU6Dv2mwcTXoMwIN9so8up4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rq2t98UgPRUtn0DxSOk08zxELtimA7bli6jdQj6IbdAuAqUX8
	gvA5e+S7h/N1AtxP9Y+vBodeemxAhNzCMac4wZViN7946oOIYBgtMCyu
X-Gm-Gg: AZFdTZdyzYooR4b+78R9ww8VpgayFbCAxMFjl2qzI6SjcBqXaLyobZjIY2FBwnrw/Ws
	s8EMt6WYElqspnx7Z3RYhNXqL436wsoxaxf4CR0/Rhsj0nlwTgY5iCW806QqQXUC/EXyekSyvr0
	D+Ff83CncgPu0nje6MGgRH3L2n71Gbq+udhqQKdVUebpU6/9qGo3uqUzBa2FE6Obw5YW46+EAXh
	4kuz7VtkFraKfiWdUjybTBQ6YhlMX/S4mzCsjWCo0Lquep763K5egOTS2uylbNKepN3TO39vgWX
	AsLOT19BEB6wnsmF6kkTClJ+zuj86ZdW8hlNwRdS1ZMnG7O8j0YPRVupwfsPRRu9GmmHPzCY3k+
	NR2GFdd6zWBvMvlmBglWiUK5SElDFUQ6XClX4SKOVK1h62lJiMpzyW3bqERKd2Wj5kTtz0mPQ4X
	SY2Z/q/W2DBQ+eMWDjvuAg+VOQTG9TcxccF0/Ay5hyb/WPPsREkKs7GdVUBKFxqCnqSqnwrtvNY
	/oYGnFs0gVUowCAyyJYsh1RcjVn2nh3bIUuI5U+lVrWB5CTJ9ihY+eF0EQcal607qE1+Oz3bLy5
	yoGT9QGymW2YM/bakN+8HQ6wO5364nF3AXB3nYeGkkInwVD3rF4sHdPt1gtBw2gcPY3zRJhULNr
	pVg==
X-Received: by 2002:a05:6402:448e:b0:6b8:9728:86d2 with SMTP id 4fb4d7f45d1cf-6ba37e94b8dmr2350027a12.31.1795179940235;
        Fri, 20 Nov 2026 05:05:40 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37120beesm1116229a12.36.2026.11.20.05.05.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2026 05:05:39 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v3 7/8] char: xillybus: Avoid indefinite sleep of work item
Date: Fri, 20 Nov 2026 14:05:01 +0100
Message-Id: <20261120130502.17056-8-eli.billauer@gmail.com>
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

xillybus_write() may sleep indefinitely with rd_mutex taken while
waiting for a DMA buffer to become available for writing. As the work
item implementing automatic flush also takes this mutex, it may sleep
indefinitely as well.

Thanks to the Concurrency Managed Workqueue (cmwq), there has been no
visible problem with work items sleeping forever, but this shouldn't be
allowed by design.

This commit makes the autoflush work item return immediately if
xillybus_write() is invoked in parallel, and record that fact with the
help of a new struct member, autoflush_skipped. This way, the work item
doesn't attempt to take rd_mutex, avoiding sleeping indefinitely.
When an autoflush has been skipped this way, xillybus_write() compensates
for this with a direct call to xillybus_myflush().

Fixes: 48bae0507410 ("staging: New driver: Xillybus generic interface for FPGA")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com
Link: https://sashiko.dev/#/patchset/20261117115902.41359-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v3:
    - Consume autoflush_skipped only when dont_autoflush reaches zero, so
      only the last active writer performs the compensating flush, as
      suggested in the v2 review.
    - Added Link to the v2 review.
    - Rebased onto the updated kernel tree (devm_kmalloc_obj() conversion).
    
    Changes in v2:
    - Added Fixes: tag.

 drivers/char/xillybus/xillybus.h      |  3 +
 drivers/char/xillybus/xillybus_core.c | 88 +++++++++++++++++++++------
 2 files changed, 72 insertions(+), 19 deletions(-)

diff --git a/drivers/char/xillybus/xillybus.h b/drivers/char/xillybus/xillybus.h
index 98c7ac4dd1f9..cd3cde833ce3 100644
--- a/drivers/char/xillybus/xillybus.h
+++ b/drivers/char/xillybus/xillybus.h
@@ -77,6 +77,9 @@ struct xilly_channel {
 	int rd_full;
 	spinlock_t rd_spinlock;
 	struct mutex rd_mutex;
+	struct mutex autoflush_mutex;
+	int dont_autoflush;
+	bool autoflush_skipped;
 	wait_queue_head_t rd_wait;
 	int rd_ref_count;
 	int rd_allow_partial;
diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybus/xillybus_core.c
index 9cae835c4399..3433f07e4286 100644
--- a/drivers/char/xillybus/xillybus_core.c
+++ b/drivers/char/xillybus/xillybus_core.c
@@ -84,10 +84,11 @@ static struct workqueue_struct *xillybus_wq;
  * Blocking on the wait queues is allowed with mutexes held, but not with
  * spinlocks.
  *
- * Only interruptible blocking is allowed on mutexes and wait queues.
+ * Only interruptible blocking is allowed on mutexes and wait queues,
+ * except for autoflush_mutex.
  *
  * All in all, the locking order goes (with skips allowed, of course):
- * wr_mutex -> rd_mutex -> register_mutex ->
+ * autoflush_mutex -> wr_mutex -> rd_mutex -> register_mutex ->
  * allow_isr_lock -> wr_spinlock -> rd_spinlock
  */
 
@@ -519,6 +520,9 @@ static int xilly_setupchannels(struct xilly_endpoint *ep,
 		spin_lock_init(&channel->rd_spinlock);
 		mutex_init(&channel->wr_mutex);
 		mutex_init(&channel->rd_mutex);
+		mutex_init(&channel->autoflush_mutex);
+		channel->dont_autoflush = 0;
+		channel->autoflush_skipped = false;
 		init_waitqueue_head(&channel->rd_wait);
 		init_waitqueue_head(&channel->wr_wait);
 		init_waitqueue_head(&channel->wr_ready_wait);
@@ -1190,7 +1194,10 @@ static int xillybus_myflush(struct xilly_channel *channel, long timeout)
 		/*
 		 * Indefinite sleep with mutex taken. With data waiting for
 		 * flushing user should not be surprised if open() for write
-		 * sleeps.
+		 * sleeps. Note that timeout == 0 is used only with
+		 * synchronous channels (with rd_synchronous true), and
+		 * the autoflush work item is never queued for such, so
+		 * no risk of work item sleeping indefinitely.
 		 */
 		if (timeout == 0)
 			wait_event_interruptible(channel->rd_wait,
@@ -1237,6 +1244,13 @@ static void xillybus_autoflush(struct work_struct *work)
 		workitem, struct xilly_channel, rd_workitem);
 	int rc;
 
+	guard(mutex)(&channel->autoflush_mutex);
+
+	if (channel->dont_autoflush) {
+		channel->autoflush_skipped = true;
+		return;
+	}
+
 	rc = xillybus_myflush(channel, -1);
 	if (rc == -EINTR)
 		dev_warn(channel->endpoint->dev,
@@ -1246,8 +1260,8 @@ static void xillybus_autoflush(struct work_struct *work)
 			"Autoflush failed under weird circumstances.\n");
 }
 
-static ssize_t xillybus_write(struct file *filp, const char __user *userbuf,
-			      size_t count, loff_t *f_pos)
+static ssize_t __xillybus_write(struct file *filp, const char __user *userbuf,
+				size_t count)
 {
 	ssize_t rc;
 	unsigned long flags;
@@ -1260,9 +1274,6 @@ static ssize_t xillybus_write(struct file *filp, const char __user *userbuf,
 	int howmany = 0, bufpos = 0, bufidx = 0, bufferdone = 0;
 	int end_offset_plus1 = 0;
 
-	if (channel->endpoint->fatal_error)
-		return -EIO;
-
 	rc = mutex_lock_interruptible(&channel->rd_mutex);
 	if (rc)
 		return rc;
@@ -1405,12 +1416,6 @@ static ssize_t xillybus_write(struct file *filp, const char __user *userbuf,
 				if (channel->endpoint->fatal_error)
 					return -EIO;
 
-				if (!channel->rd_synchronous)
-					queue_delayed_work(
-						xillybus_wq,
-						&channel->rd_workitem,
-						XILLY_RX_TIMEOUT);
-
 				return rc;
 			}
 		}
@@ -1450,11 +1455,6 @@ static ssize_t xillybus_write(struct file *filp, const char __user *userbuf,
 
 	mutex_unlock(&channel->rd_mutex);
 
-	if (!channel->rd_synchronous)
-		queue_delayed_work(xillybus_wq,
-				   &channel->rd_workitem,
-				   XILLY_RX_TIMEOUT);
-
 	if (channel->endpoint->fatal_error)
 		return -EIO;
 
@@ -1471,6 +1471,56 @@ static ssize_t xillybus_write(struct file *filp, const char __user *userbuf,
 	return bytes_done;
 }
 
+/*
+ * Prevent the autoflush work item from sleeping indefinitely by having
+ * dont_autoflush non-zero while __xillybus_write() is invoked, as this
+ * function may sleep indefinitely with rd_mutex taken.
+ * The work item terminates immediately when dont_autoflush is non-zero,
+ * and announces this by setting autoflush_skipped. Perform autoflush before
+ * returning to compensate for a skipped autoflush if necessary.
+ */
+
+static ssize_t xillybus_write(struct file *filp, const char __user *userbuf,
+			      size_t count, loff_t *f_pos)
+{
+	struct xilly_channel *channel = filp->private_data;
+
+	ssize_t retval;
+	bool compensate = false;
+
+	if (channel->endpoint->fatal_error)
+		return -EIO;
+
+	/*
+	 * On synchronous channels, flush is performed after every
+	 * write operation. Autoflush is therefore irrelevant.
+	 */
+	if (channel->rd_synchronous)
+		return __xillybus_write(filp, userbuf, count);
+
+	scoped_guard(mutex, &channel->autoflush_mutex)
+		channel->dont_autoflush++;
+
+	retval = __xillybus_write(filp, userbuf, count);
+
+	scoped_guard(mutex, &channel->autoflush_mutex) {
+		channel->dont_autoflush--;
+
+		if (channel->autoflush_skipped && !channel->dont_autoflush) {
+			compensate = true;
+			channel->autoflush_skipped = false;
+		}
+	}
+
+	if (compensate)
+		xillybus_myflush(channel, -1);
+
+	queue_delayed_work(xillybus_wq, &channel->rd_workitem,
+			   XILLY_RX_TIMEOUT);
+
+	return retval;
+}
+
 static int xillybus_open(struct inode *inode, struct file *filp)
 {
 	int rc;
-- 
2.17.1

