Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986654;
	b=jyr7+w+Z62riPGA9J3GvKNC00gR/a+K5NF+amFA9h6CHSkVRba6D+yyQvbMjcglRctTY
	 1ywEb80UgzTJEn1Cg+MepBZF0gVzNQf8gZPsx+nybl5Tl7z3zEi8DyuPEZ5c7HAnKTY6v
	 V+j8S2nFAYWDLgqhXcXWaAWqvn3GNr1fhTGt06Jk2tf0FKNOu/8Ab8BCt6yLA8gWSnpL0
	 MjDc1f17ILUFC6g3eG0X+SFVwpwGTc1G+ztaeu7+1Vzl/5QWdX/I1wOZ2Vs4/pGo7C+5r
	 4L63t3gQU9N+MD3d05TuIJqDTsjNxU1v18/qTyKO1gN95BhCcD+jzBfWB9TLr8PpuGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ASyBpmXHjPxODfoAaOAjUELu06FPP/hyvP9ugEGG5NU=;
	b=qKc93EpNHrNCRuXaqul0GibNx+G/ZfOczGrs3uSjP4nBViqOoFXDivpwOEUuoCO1oyF9
	 SgT95EvVrypxEY5CzQ2jm2PE4sJBBfLOID2zt62E8ELBgo2+iGtCtdMXKnZDI/TbbWREW
	 HEZD6F9my8nNUde21TuhJTe29KLTGmvVG3ppr9hTOjBXGJ71c6z29WXRwd6Cnh7okbrDL
	 rm5fLXs5SLvUdkaw97qZyK6/5emTt7GRPMznB9HOBjJdka8BtSN26YcjzXDAZceqkxOZj
	 Jr64Vd0YL8eSWtAWFWNQ7U8NHqSAhM9ukkxRYRe8xeDzu0fv3NsNFqONh18NlWEBR0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lJC31m9T;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C11606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05C11606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lJC31m9T
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1ae58d17cd9so598442c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794986653; x=1795591453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ASyBpmXHjPxODfoAaOAjUELu06FPP/hyvP9ugEGG5NU=;
        b=lJC31m9Trc2IWUKqGEi8e8nXTWJ25jo/yM3VBbFv4pkg12qo1fBHxwEFw+1o9jbAIQ
         eIPe5Yxun23an7FI9p/10xrhpZDamtX1T5TGTTsyIRkq3TIXumiO00JsiYSNae2TxZCf
         1wm63rJhPoKBMEhnXKVd8GFgW2/Fx0U8bPhfafW+XdJ/JQTVx7YMyRpDUOyBtSLKVWkF
         AbK3lRqM0wGrRGXODpeTCmwfzD4E8sxbKfZ+cG9lRoPXrcDkgpY4RSTdOaMGbwqXdsEn
         pSpqGBQX7N3T3CLGRJiRieXqMUGEQZyhclpedJuc/AkG1bGX1yq3U/Pi7g5ssads5rg6
         mEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986653; x=1795591453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ASyBpmXHjPxODfoAaOAjUELu06FPP/hyvP9ugEGG5NU=;
        b=hlmAlO8XzRdFnWV3QLp1TEXZTgclDIVI3Llva3hjBgyidqXlmT7mu+4k7OtMQb+hnN
         QHQr0r9ObVYgX8IVEHjjvszdUOuMKJUicGZvo05AbGFg1JidprE9+FQHQMbUXsUcsICq
         L3i7k9jUuuD+kcF9DMx1y3vXIGv3jpOpQ/tdNbndUviFYQShMqNkJl/gAEr2nyDmFilo
         McGEuUxFrJJ+nwxxKdoKjr2nlJ75y+vYaHpPQydHMMjwYVtmPKvMvV+ArK2Xq/Nocc4V
         peiGTKkLxIRQuP2UEsKbcpVbI1XQektSgLCFD1xtguz+0sDsnbAUSbxNYZ6tNcsfTTbg
         roVg==
X-Forwarded-Encrypted: i=1; AL+hErFexqiM0niLn/FsueX9K6FkiND28MBXe9CdlItqdltymS3kUZP4qDsDsIMIMTwFVSif9Pe2Vkvbu7BQWdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z90Iogq3sLcQaqdZDREoJxqSAtQTZioP+y/m9gjqGfcFoCvsel0
	A6rH/P843YPdePc0BJOmuLpKnI/vWF5aZroJic7cFit929gqQg+y+1ZcymvT6JLcvfo=
X-Gm-Gg: AYBFou2sgqEAakqqE/y9X/a9llEG8YYSKR4tOXPbrWQJnASx6MH2sHlM5RB0mbn7zCq
	Pg9HnZUQ/oG6XxiJOXoE19TkWElq+1Mtyz8hJH1E0LkwrUM9jh23K0HSJ/pHikAi827T/+ygXmK
	NqWwqewkbOi9j4h4eM+bhoPe66StF2FoUZMyEDHW7ZUaITtHV2yM9kz3r4nwX6WgztVs9MDI0lO
	A08n0fHofNXxksSnYQfJqW/qcfY2HIP+KmnJvGPBW6HOCDent1mfDHOEtHGgzP6vEh9M8Qtr+5u
	Wng56W2FusgnMxD4zIYIvgdROHoTV1GHnMEfay3sZCH+Tjhects/q2r+YbLVq+lBfj6Dg+W6FX2
	569fQVV5RX98+uD9ITcQDrMKwiVdGtO46oiuu/6DGQidZVUrqEXSh77JJ5rJPYR+626F14eStpS
	/kfeYOjpK4TmpXNeS0T5bsNnzTepCkbccm7ZhPeWQVy6upo6vN34Rasqfchtij9x51JxQWk/A/x
	lrQVhtu+1l4Y/UivDo4hgbL7e1CIIr4nOFVyuXKVrlJVspVrE9LK1qCqNZmrBqKmcOLMf4kUej+
	adkk3mi9rSlxafDhqVYRl/T1dGztdkZ1c+n6JEqSnsssBFtyIPCTabVgXiDbPaBFgawhedJdzq5
	sFl6G6G41AiG/loHQym1YXwm4OLn8xxgdrNl3AFXY
X-Received: by 2002:a05:7022:3f01:b0:151:2e62:fe6d with SMTP id a92af1059eb24-1b543cd9699mr1846378c88.22.1794986652558;
        Tue, 17 Nov 2026 23:24:12 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc596sm4004103c88.10.2026.11.17.23.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:24:12 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	tomas.winkler@intel.com
Subject: [PATCH] mei: bus: serialise the client callback lifecycle
Date: Wed, 18 Nov 2026 15:24:06 +0800
Message-Id: <20261118072406.1259798-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mei_cldev_unregister_callbacks() cancels rx_work and notif_work but
leaves both queueable.  mei_cl_bus_rx_event() tests cldev->rx_cb and
then queues the work, and that test is not serialized against the
unregister path: an event that read rx_cb just before it was cleared can
call schedule_work() after cancel_work_sync() has returned.

That leaves a work item queued for a mei_cl_device whose driver has
already been removed.  Once the last reference is dropped,
mei_cl_bus_dev_release() frees the device and mei_cl_bus_rx_work() runs
on freed memory.

disable_work_sync() cancels the work and marks it disabled, so a
schedule_work() that races with the unregister is dropped by the
workqueue.  A later registration reinitializes the work with
INIT_WORK(), which clears the disabled state again.

Both producers run under bus->device_lock: mei_cl_complete() is reached
from mei_me_irq_thread_handler(), which holds the lock for the whole
interrupt thread, and mei_cl_notify() is documented to require it.
mei_cldev_unregister_callbacks() runs without that lock, so the pointer
tests above can still pass on a device that is going away, while
mei_cl_bus_dev_release() flushes the client queues under the same lock
before it frees the client.

The registration side has the mirror image of the problem: the callback
pointer was published and the work item reinitialized before the lock
was taken, and a registration that is being rolled back clears whatever
callback is published at that moment, which can destroy a registration
that started in between.

Give each callback an explicit state that is protected by
bus->device_lock, and serialise every transition with a per-device
mutex.  The lock order is conn_lock -> cb_lock -> bus->device_lock, and
device_lock is dropped before waiting for a callback work to finish: a
registration moves the state from idle through registering to active, a
failing one owns the callback it published until it has drained the work
and reset the state, and an unregister or a disable waits for an
in-progress registration before it stops anything.

The work handlers read the callback pointer under device_lock as well
and call it outside, so the pointer is never dereferenced while another
thread can replace it.  None of the in-tree callbacks calls back into
mei_cldev_enable(), mei_cldev_disable() or the registration helpers from
the callback itself - mei_wdt schedules a work item instead - so a
callback cannot wait for the lifecycle lock that its own drain holds.

mei_cldev_disable() keeps registrations out for the whole disconnect and
leaves the gate set afterwards: it is cleared only by a successful
mei_cldev_enable(), so a registration cannot slip in between the stop
and the disconnect.  enable(), disable() and the driver binding are
serialised by a second per-device mutex.

The driver binding is gated as well, but it is a per-binding state and
not a property of the device: mei_cl_device_remove() closes the gate
before the driver's ->remove() runs and mei_cl_device_probe() reopens it
for the next driver, so a rebind can register callbacks again.  The
connection gate is not touched there - only a successful
mei_cldev_enable() reopens that one - and a probe that fails closes both
gates again after draining the callbacks it managed to register.

Fixes: 57080e88240a ("mei: bus: unregister callbacks upon me client disable call")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Testing: compile tested only (arm64, gcc 11.4).  No MEI hardware was
available, so the removal race was not run.
 drivers/misc/mei/bus.c     | 253 +++++++++++++++++++++++++++++++++----
 include/linux/mei_cl_bus.h |  28 ++++
 2 files changed, 258 insertions(+), 23 deletions(-)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index cfb87ab8667f..277e21ac07ef 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -426,13 +426,18 @@ static void mei_cl_bus_rx_work(struct work_struct *work)
 {
 	struct mei_cl_device *cldev;
 	struct mei_device *bus;
+	mei_cldev_cb_t rx_cb;
 
 	cldev = container_of(work, struct mei_cl_device, rx_work);
 
 	bus = cldev->bus;
 
-	if (cldev->rx_cb)
-		cldev->rx_cb(cldev);
+	mutex_lock(&bus->device_lock);
+	rx_cb = cldev->rx_cb;
+	mutex_unlock(&bus->device_lock);
+
+	if (rx_cb)
+		rx_cb(cldev);
 
 	mutex_lock(&bus->device_lock);
 	if (mei_cl_is_connected(cldev->cl))
@@ -448,11 +453,19 @@ static void mei_cl_bus_rx_work(struct work_struct *work)
 static void mei_cl_bus_notif_work(struct work_struct *work)
 {
 	struct mei_cl_device *cldev;
+	struct mei_device *bus;
+	mei_cldev_cb_t notif_cb;
 
 	cldev = container_of(work, struct mei_cl_device, notif_work);
 
-	if (cldev->notif_cb)
-		cldev->notif_cb(cldev);
+	bus = cldev->bus;
+
+	mutex_lock(&bus->device_lock);
+	notif_cb = cldev->notif_cb;
+	mutex_unlock(&bus->device_lock);
+
+	if (notif_cb)
+		notif_cb(cldev);
 }
 
 /**
@@ -517,24 +530,63 @@ int mei_cldev_register_rx_cb(struct mei_cl_device *cldev, mei_cldev_cb_t rx_cb)
 
 	if (!rx_cb)
 		return -EINVAL;
-	if (cldev->rx_cb)
-		return -EALREADY;
 
-	cldev->rx_cb = rx_cb;
-	INIT_WORK(&cldev->rx_work, mei_cl_bus_rx_work);
+	/*
+	 * cb_lock serialises every transition of rx_state, so a
+	 * registration that fails unwinds only the callback it published
+	 * itself and never one that a later registration installed.
+	 */
+	mutex_lock(&cldev->cb_lock);
 
 	mutex_lock(&bus->device_lock);
+	if (cldev->disabling || cldev->unbinding) {
+		mutex_unlock(&bus->device_lock);
+		mutex_unlock(&cldev->cb_lock);
+		return -ENODEV;
+	}
+	if (cldev->rx_state != MEI_CB_IDLE) {
+		mutex_unlock(&bus->device_lock);
+		mutex_unlock(&cldev->cb_lock);
+		return -EALREADY;
+	}
+
+	/*
+	 * The callback pointer and the work item are published under
+	 * device_lock, which every producer of the work takes, so an event
+	 * cannot observe a callback that is not backed by an initialized
+	 * work item.
+	 */
+	cldev->rx_state = MEI_CB_REGISTERING;
+	INIT_WORK(&cldev->rx_work, mei_cl_bus_rx_work);
+	cldev->rx_cb = rx_cb;
 	if (mei_cl_is_connected(cldev->cl))
 		ret = mei_cl_read_start(cldev->cl, mei_cl_mtu(cldev->cl), NULL);
 	else
 		ret = -ENODEV;
+
+	if (ret && ret != -EBUSY)
+		cldev->rx_state = MEI_CB_STOPPING;
+	else
+		cldev->rx_state = MEI_CB_ACTIVE;
 	mutex_unlock(&bus->device_lock);
+
 	if (ret && ret != -EBUSY) {
-		cancel_work_sync(&cldev->rx_work);
+		/*
+		 * cb_lock is held and rx_state is STOPPING, so neither a
+		 * stop nor a new registration can run here: the drain
+		 * below cannot disable or clear a newer callback.
+		 */
+		disable_work_sync(&cldev->rx_work);
+
+		mutex_lock(&bus->device_lock);
 		cldev->rx_cb = NULL;
+		cldev->rx_state = MEI_CB_IDLE;
+		mutex_unlock(&bus->device_lock);
+		mutex_unlock(&cldev->cb_lock);
 		return ret;
 	}
 
+	mutex_unlock(&cldev->cb_lock);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mei_cldev_register_rx_cb);
@@ -558,21 +610,47 @@ int mei_cldev_register_notif_cb(struct mei_cl_device *cldev,
 	if (!notif_cb)
 		return -EINVAL;
 
-	if (cldev->notif_cb)
+	/* See mei_cldev_register_rx_cb() for the locking rules. */
+	mutex_lock(&cldev->cb_lock);
+
+	mutex_lock(&bus->device_lock);
+	if (cldev->disabling || cldev->unbinding) {
+		mutex_unlock(&bus->device_lock);
+		mutex_unlock(&cldev->cb_lock);
+		return -ENODEV;
+	}
+	if (cldev->notif_state != MEI_CB_IDLE) {
+		mutex_unlock(&bus->device_lock);
+		mutex_unlock(&cldev->cb_lock);
 		return -EALREADY;
+	}
 
-	cldev->notif_cb = notif_cb;
+	cldev->notif_state = MEI_CB_REGISTERING;
 	INIT_WORK(&cldev->notif_work, mei_cl_bus_notif_work);
-
-	mutex_lock(&bus->device_lock);
+	cldev->notif_cb = notif_cb;
 	ret = mei_cl_notify_request(cldev->cl, NULL, 1);
+	if (ret)
+		cldev->notif_state = MEI_CB_STOPPING;
+	else
+		cldev->notif_state = MEI_CB_ACTIVE;
 	mutex_unlock(&bus->device_lock);
+
 	if (ret) {
-		cancel_work_sync(&cldev->notif_work);
+		/*
+		 * See mei_cldev_register_rx_cb(): cb_lock keeps the unwind
+		 * private to this registration.
+		 */
+		disable_work_sync(&cldev->notif_work);
+
+		mutex_lock(&bus->device_lock);
 		cldev->notif_cb = NULL;
+		cldev->notif_state = MEI_CB_IDLE;
+		mutex_unlock(&bus->device_lock);
+		mutex_unlock(&cldev->cb_lock);
 		return ret;
 	}
 
+	mutex_unlock(&cldev->cb_lock);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mei_cldev_register_notif_cb);
@@ -815,7 +893,14 @@ int mei_cldev_enable(struct mei_cl_device *cldev)
 
 	cl = cldev->cl;
 
+	mutex_lock(&cldev->conn_lock);
+
 	mutex_lock(&bus->device_lock);
+	if (cldev->unbinding) {
+		ret = -ENODEV;
+		goto notlinked;
+	}
+
 	if (cl->state == MEI_FILE_UNINITIALIZED) {
 		ret = mei_cl_link(cl);
 		if (ret)
@@ -849,12 +934,79 @@ int mei_cldev_enable(struct mei_cl_device *cldev)
 	if (ret)
 		mei_cl_unlink(cl);
 notlinked:
+	/* Reopen registrations only once the device is connected again. */
+	if (!ret)
+		cldev->disabling = false;
 	mutex_unlock(&bus->device_lock);
 
+	mutex_unlock(&cldev->conn_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mei_cldev_enable);
 
+/*
+ * Stop one callback for good.  cb_lock serialises registration and
+ * stopping, so a second stop waits for the first one to finish.
+ *
+ * The lock order is cb_lock -> bus->device_lock.  device_lock is dropped
+ * before disable_work_sync(), because the work handler and its producers
+ * may acquire device_lock; neither takes cb_lock.
+ */
+static void mei_cldev_stop_rx(struct mei_cl_device *cldev)
+{
+	struct mei_device *bus = cldev->bus;
+
+	mutex_lock(&cldev->cb_lock);
+
+	mutex_lock(&bus->device_lock);
+	if (cldev->rx_state == MEI_CB_IDLE) {
+		mutex_unlock(&bus->device_lock);
+		mutex_unlock(&cldev->cb_lock);
+		return;
+	}
+	cldev->rx_state = MEI_CB_STOPPING;
+	mutex_unlock(&bus->device_lock);
+
+	/*
+	 * The producers take device_lock, so the drain must happen without
+	 * it or they would wait for us while we wait for the work.
+	 */
+	disable_work_sync(&cldev->rx_work);
+
+	mutex_lock(&bus->device_lock);
+	cldev->rx_cb = NULL;
+	cldev->rx_state = MEI_CB_IDLE;
+	mutex_unlock(&bus->device_lock);
+
+	mutex_unlock(&cldev->cb_lock);
+}
+
+/* See mei_cldev_stop_rx(). */
+static void mei_cldev_stop_notif(struct mei_cl_device *cldev)
+{
+	struct mei_device *bus = cldev->bus;
+
+	mutex_lock(&cldev->cb_lock);
+
+	mutex_lock(&bus->device_lock);
+	if (cldev->notif_state == MEI_CB_IDLE) {
+		mutex_unlock(&bus->device_lock);
+		mutex_unlock(&cldev->cb_lock);
+		return;
+	}
+	cldev->notif_state = MEI_CB_STOPPING;
+	mutex_unlock(&bus->device_lock);
+
+	disable_work_sync(&cldev->notif_work);
+
+	mutex_lock(&bus->device_lock);
+	cldev->notif_cb = NULL;
+	cldev->notif_state = MEI_CB_IDLE;
+	mutex_unlock(&bus->device_lock);
+
+	mutex_unlock(&cldev->cb_lock);
+}
+
 /**
  * mei_cldev_unregister_callbacks - internal wrapper for unregistering
  *  callbacks.
@@ -863,15 +1015,8 @@ EXPORT_SYMBOL_GPL(mei_cldev_enable);
  */
 static void mei_cldev_unregister_callbacks(struct mei_cl_device *cldev)
 {
-	if (cldev->rx_cb) {
-		cancel_work_sync(&cldev->rx_work);
-		cldev->rx_cb = NULL;
-	}
-
-	if (cldev->notif_cb) {
-		cancel_work_sync(&cldev->notif_work);
-		cldev->notif_cb = NULL;
-	}
+	mei_cldev_stop_rx(cldev);
+	mei_cldev_stop_notif(cldev);
 }
 
 /**
@@ -895,6 +1040,24 @@ int mei_cldev_disable(struct mei_cl_device *cldev)
 
 	bus = cldev->bus;
 
+	/*
+	 * Serialise the connection lifecycle: enable(), disable() and the
+	 * removal all change the same state and only one of them may run
+	 * at a time, so the gate below is stable for the rest of this
+	 * function.
+	 */
+	mutex_lock(&cldev->conn_lock);
+
+	/*
+	 * Refuse new registrations for the whole disconnect: the callbacks
+	 * are stopped below, and one published after that would survive
+	 * the disconnect.  The gate stays set until a later
+	 * mei_cldev_enable() connects again.
+	 */
+	mutex_lock(&bus->device_lock);
+	cldev->disabling = true;
+	mutex_unlock(&bus->device_lock);
+
 	mei_cldev_unregister_callbacks(cldev);
 
 	mutex_lock(&bus->device_lock);
@@ -919,6 +1082,8 @@ int mei_cldev_disable(struct mei_cl_device *cldev)
 	}
 
 	mutex_unlock(&bus->device_lock);
+
+	mutex_unlock(&cldev->conn_lock);
 	return err;
 }
 EXPORT_SYMBOL_GPL(mei_cldev_disable);
@@ -1147,8 +1312,33 @@ static int mei_cl_device_probe(struct device *dev)
 		return -ENODEV;
 	}
 
+	/*
+	 * A driver is being bound again: reopen the gate that the previous
+	 * unbind closed.  Only the connection gate is left alone; a new
+	 * driver has to connect the device again with mei_cldev_enable()
+	 * before it may register callbacks.
+	 */
+	mutex_lock(&cldev->conn_lock);
+	mutex_lock(&cldev->bus->device_lock);
+	cldev->unbinding = false;
+	mutex_unlock(&cldev->bus->device_lock);
+	mutex_unlock(&cldev->conn_lock);
+
 	ret = cldrv->probe(cldev, id);
 	if (ret) {
+		/*
+		 * A failed probe must not leave an open gate or a callback
+		 * behind: close both again and drain what the probe
+		 * registered before handing the device over.
+		 */
+		mutex_lock(&cldev->conn_lock);
+		mutex_lock(&cldev->bus->device_lock);
+		cldev->unbinding = true;
+		cldev->disabling = true;
+		mutex_unlock(&cldev->bus->device_lock);
+		mutex_unlock(&cldev->conn_lock);
+
+		mei_cldev_unregister_callbacks(cldev);
 		mei_cl_bus_module_put(cldev);
 		return ret;
 	}
@@ -1169,6 +1359,21 @@ static void mei_cl_device_remove(struct device *dev)
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	struct mei_cl_driver *cldrv = to_mei_cl_driver(dev->driver);
 
+	/*
+	 * Close the registration gate before the driver is asked to remove
+	 * the device: a registration that races with the unbind must fail
+	 * instead of installing a callback that nobody would stop.  The
+	 * flags are published and both locks dropped before the driver
+	 * callback runs, because it may still use the callbacks it
+	 * registered and may call mei_cldev_disable() itself.
+	 */
+	mutex_lock(&cldev->conn_lock);
+	mutex_lock(&cldev->bus->device_lock);
+	cldev->unbinding = true;
+	cldev->disabling = true;
+	mutex_unlock(&cldev->bus->device_lock);
+	mutex_unlock(&cldev->conn_lock);
+
 	if (cldrv->remove)
 		cldrv->remove(cldev);
 
@@ -1397,6 +1602,8 @@ static struct mei_cl_device *mei_cl_bus_dev_alloc(struct mei_device *bus,
 	cldev->cl         = cl;
 	mei_cl_bus_set_name(cldev);
 	cldev->is_added   = 0;
+	mutex_init(&cldev->cb_lock);
+	mutex_init(&cldev->conn_lock);
 	INIT_LIST_HEAD(&cldev->bus_list);
 	device_enable_async_suspend(&cldev->dev);
 
diff --git a/include/linux/mei_cl_bus.h b/include/linux/mei_cl_bus.h
index d5d29451eabf..d3ddfcf2d4df 100644
--- a/include/linux/mei_cl_bus.h
+++ b/include/linux/mei_cl_bus.h
@@ -15,6 +15,20 @@ struct scatterlist;
 
 typedef void (*mei_cldev_cb_t)(struct mei_cl_device *cldev);
 
+/**
+ * enum mei_cb_state - lifecycle state of an mei client callback
+ * @MEI_CB_IDLE: no callback registered
+ * @MEI_CB_REGISTERING: a registration is in progress
+ * @MEI_CB_ACTIVE: the callback is published
+ * @MEI_CB_STOPPING: the callback is being drained
+ */
+enum mei_cb_state {
+	MEI_CB_IDLE,
+	MEI_CB_REGISTERING,
+	MEI_CB_ACTIVE,
+	MEI_CB_STOPPING,
+};
+
 /**
  * struct mei_cl_device - MEI device handle
  * An mei_cl_device pointer is returned from mei_add_device()
@@ -31,12 +45,18 @@ typedef void (*mei_cldev_cb_t)(struct mei_cl_device *cldev);
  * @rx_work: async work to execute Rx event callback
  * @rx_cb: Drivers register this callback to get asynchronous ME
  *	Rx buffer pending notifications.
+ * @rx_state: lifecycle state of @rx_cb
  * @notif_work: async work to execute FW notify event callback
  * @notif_cb: Drivers register this callback to get asynchronous ME
  *	FW notification pending notifications.
+ * @notif_state: lifecycle state of @notif_cb
+ * @cb_lock: serialises the lifecycle of both callbacks
+ * @conn_lock: serialises enable/disable and the binding state
  *
  * @do_match: whether the device can be matched with a driver
  * @is_added: device is already scanned
+ * @disabling: the device is disabled until the next successful enable
+ * @unbinding: the driver is being unbound from the device
  * @priv_data: client private data
  */
 struct mei_cl_device {
@@ -50,11 +70,19 @@ struct mei_cl_device {
 
 	struct work_struct rx_work;
 	mei_cldev_cb_t rx_cb;
+	enum mei_cb_state rx_state;
 	struct work_struct notif_work;
 	mei_cldev_cb_t notif_cb;
+	enum mei_cb_state notif_state;
+	/* serialises the lifecycle of both callbacks */
+	struct mutex cb_lock;
+	/* Serialises enable/disable and binding-state transitions. */
+	struct mutex conn_lock;
 
 	unsigned int do_match:1;
 	unsigned int is_added:1;
+	unsigned int disabling:1;
+	unsigned int unbinding:1;
 
 	void *priv_data;
 };
-- 
2.34.1

