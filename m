Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055765;
	b=pfeZH2sjAyADP3hJC6UiXk2jHovWAV5VrZm13yp0aScEvarBumDoGnApk/vSOZbG9/Qb
	 SMMOWuABeDTqeWPTufgjDpLfk7z+FPSi4/og3RaujH8qdehxZGqFYNoQ5vNtok+Uqb42D
	 jlBaDWh0WJz6Q1csTlUcK0b7ddDuGr3f01dQdwz2tWNnLEe2F758or47J25eLmb3WYii2
	 wupuMQcWMApCBhpaegzj13PJVDYOZtFKoXK5Jo5MIpMwh6ynGtYcor+pdVinxRp1236r0
	 2VnvF1WZw+WUMIDIknkwKnHEtgpNJ7WEvuf87SN0UKIQbAH7v7r1hXYrxVoAlwVj6rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LAgaXmCfEK7Kg5IJDDmFVyuWJC85mgF0v+fDK2Xp/bw=;
	b=CTnNWATWJnJXiiE+d3FeUbR9cHnb4c/mfspwFpPTYGGo4p99P0OHzHqJ5DHasHUHw8m6
	 q+WEqrkHurBSqudEMynwAAPqT9XS77tg2WDF3K56NYd2gJQFJyRL8wPRVN7OmR0+hlMER
	 Q+UDjJ+iRyesqkLsCTs8Dok9DPqo8+Prhx8WeVagzHy5q7UJvN/XcbitYqI8X+qGP7nSy
	 aNEqe+tYjm8R398/uMegb42RPAy6uBFQmuGPvZq09KVtojkIBzTkiDI/lsp0Bvz6fxa4c
	 xSgbfTmOgTFeCIddyFCKIm8TO4neIhjq2nDh6IekkmuxPKvPnqDHRAmY104KTUU5XFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6SThBR9;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C054606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C054606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6SThBR9
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f8cdd30beso2162977eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795055764; x=1795660564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAgaXmCfEK7Kg5IJDDmFVyuWJC85mgF0v+fDK2Xp/bw=;
        b=C6SThBR9HZbdM5GxhSJfDME3wXnGHhp2x8pwuacrXG7U5B55zwQbRRJUC/Vdbc735N
         02dLYWrxDATms45t/r8FS70Jj0M6lY+dgj2WdrLfbfT+pQWHQtdYO2xKy2DLvNftjHk0
         cH6j94bKYg9PzoRf3EVmku3IRhAU/c612Fv/TGMFJZElPCS8DB/9gob5Ho19E0c4BoJF
         zG30yHNNfTU2aSwkxN9cXpPu9ORWwHgSDx7ltsYK93JUf+wIu23ZzCUkYlbiVZgCJSKb
         McaVsR3eYl/YadSEPZby6AWNLFoH1NEYKVm3dqr+AeuwCy5eCKt49COVEL9FFwMeF7T/
         jFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795055764; x=1795660564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAgaXmCfEK7Kg5IJDDmFVyuWJC85mgF0v+fDK2Xp/bw=;
        b=0HV5VZWPrYnE4N+yIuaqDyEJAO2XAlLYfzVriLMUgZeg0Pwn50jezngR2gLEVKGyq1
         RS5vyH5eivSttINh2aL6dP7igkTl+jyFCZy9yH1w++cUoCBk1WzbjZqxTXvJVvTfZykJ
         gPw+EbzUx+op5Nm7o+DSfxKgx+p6KNFXAh4+hPnEiGrBTYHbG9Jp59mHy0TI4geeKMqa
         s0tz1GYkB+I2ptrpw8nR7qNK+iMSpbLq1qhEJg+V7+H61Y3R2wh7ub8DLOXrqSLfVJfe
         IdlaqC0H66ri0Gy543h6pR94Q2QqH8RAnHLH9DvQP1tSJ6Bnvka08UuhjkjstkV4TIjp
         bNRQ==
X-Forwarded-Encrypted: i=1; AL+hErES+WPof6ifvfBcWORts7XAr+xlGUs3St7ckmW/ViJYG+I7yUbsMobr0BqI6zD3CfCZMRxhv0oqzsenH6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JbRsaPGl+H7BLo7eFToFfYCxdNYmuXsoKq7Y0/BZRx1h1dVt0
	c8uyaH4ZJzXlp3FhmJhPWfiYep9uf2lxNKChp4gePhEgQOLemhsSEGdpcfBSiHiiQh0=
X-Gm-Gg: AZFdTZeMpQlsJ6ucchPdUDDu8RSDM+TH5JlMSEGMHwkuYAhreC3l3KgFGtsYmDs89Dk
	lgr150Yr6d1/K2jzHo+DJ0nG5zrMho/H3O5zKy5PR2pzfyiloq/RzJ+ydhJcdVmv91Lc3T8SKsg
	ODh+rzqM9elSmqWmzFir78SqTP1d/8NE9rj0iL14M/iUNLrw8KfsPYEroXPNVH54r1eOCe9Fcxd
	FXNRO8lAVdG8yyEdPa9nLKXqmT2bnlwLd+An/OjzH6FXCH9JpE323cbmZaUoISbxza4lfCraW5h
	gt2mtXTkA5CMEmu2WBjvtnTKst4S19YsLoDxkf2vCePyGHtqU3jjk7CsUv8+tov6rKJlxFsuR9x
	jxIXBA31SpHCzQxRvYpdbBKrwoUD4Rs1S34dZi9RkcmSnfxJYMc92qmE8oK88dBApYEtma6D1zf
	wwePha1jCVSRi/RZDvXDSYjzzqp6qahtoyyoMRY8MVFyLxw0e7WLkV/erBl3A2+GXuAaARZ083x
	INgXZ7Wuz6a5BWbLnAnpVS2Gq8cRBgPSdPd+zEpnia6rd/YWGvNJSpF95RLV9LRP3+fwYNYcnOu
	q6nWzuXDSgdIHMPjb6ZGP0DYKDP0tqvTWuiLcy3ZIsJL80zUNnK6YQA9mGSDbV4EKqGjLIMga84
	F0Lyoj3tkSnyUIB14MbVccJWMEnQx1UwSs9nKySbM
X-Received: by 2002:a05:7301:6199:10b0:36e:a265:8ee with SMTP id 5a478bee46e88-383c93ad9a7mr1685398eec.18.1795055764182;
        Wed, 18 Nov 2026 18:36:04 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:38a8:0:f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm12497550eec.26.2026.11.18.18.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:36:03 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: westeri@kernel.org
Cc: andreas.noever@gmail.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] thunderbolt: cancel pending DP bandwidth requests on teardown
Date: Thu, 19 Nov 2026 10:35:58 +0800
Message-Id: <20261119023558.1495581-1-shunsheng1218@gmail.com>
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

tb_queue_dp_bandwidth_request() queues its delayed work and keeps no
record of it.  The retry path in tb_handle_dp_bandwidth_request() queues
the work again with a 50 ms delay, and tb_deinit() only cancels the
bandwidth group release works.  The flush_workqueue() in
tb_domain_remove() runs before tb_deinit() but it does not cover a
delayed work whose timer has not expired yet, so a request that is
waiting for its retry can run after the domain has been removed and the
tb structure has been freed.

Record the queued requests in tb_cm and cancel the remaining ones in
tb_deinit(), which runs after the workqueue has been flushed and before
the domain device is unregistered.  A request is recorded and queued
while holding dp_bandwidth_lock, so tb_deinit() either sees it and
cancels it or the request is rejected before it is queued at all.  A
work item that is already running hands the ownership of its request
back to tb_deinit() through the canceled flag.

This covers the list and the delayed work, not the lifetime of @tb.
dp_bandwidth_closed keeps new work from being queued, but it is not a
reference on @tb.  Both in-tree callers are reached from the DP
bandwidth handling in tb.c - one from the bandwidth work that runs on
tb->wq, one from the control channel event path that tb_ctl_stop()
stops - and tb_deinit() runs after both have been drained.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64 with aarch64-linux-gnu-gcc 11.4
and CONFIG_USB4=m.  The affected hardware was not
available, so the teardown path was not exercised and no fault or
race injection was run.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.
---
 drivers/thunderbolt/tb.c | 59 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 57c11ba13459..470e32e8b9f7 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -57,6 +57,9 @@ MODULE_PARM_DESC(asym_threshold,
  *		    events and exit if this is not set (it needs to
  *		    acquire the lock one more time). Used to drain wq
  *		    after cfg has been paused.
+ * @dp_bandwidth_requests: Pending DP bandwidth allocation requests
+ * @dp_bandwidth_lock: Protects @dp_bandwidth_requests
+ * @dp_bandwidth_closed: New DP bandwidth requests are rejected
  * @remove_work: Work used to remove any unplugged routers after
  *		 runtime resume
  * @groups: Bandwidth groups used in this domain.
@@ -64,7 +67,10 @@ MODULE_PARM_DESC(asym_threshold,
 struct tb_cm {
 	struct list_head tunnel_list;
 	struct list_head dp_resources;
+	struct list_head dp_bandwidth_requests;
+	spinlock_t dp_bandwidth_lock;	/* Serializes the request list. */
 	bool hotplug_active;
+	bool dp_bandwidth_closed;
 	struct delayed_work remove_work;
 	struct tb_bandwidth_group groups[MAX_GROUPS];
 };
@@ -76,10 +82,12 @@ static inline struct tb *tcm_to_tb(struct tb_cm *tcm)
 
 struct tb_hotplug_event {
 	struct delayed_work work;
+	struct list_head list;
 	struct tb *tb;
 	u64 route;
 	u8 port;
 	bool unplug;
+	bool canceled;
 	int retry;
 };
 
@@ -2752,6 +2760,7 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_switch *sw;
 	struct tb_port *in;
+	unsigned long flags;
 
 	pm_runtime_get_sync(&tb->dev);
 
@@ -2872,13 +2881,22 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 	pm_runtime_mark_last_busy(&tb->dev);
 	pm_runtime_put_autosuspend(&tb->dev);
 
-	kfree(ev);
+	spin_lock_irqsave(&tcm->dp_bandwidth_lock, flags);
+	if (!ev->canceled) {
+		list_del_init(&ev->list);
+		spin_unlock_irqrestore(&tcm->dp_bandwidth_lock, flags);
+		kfree(ev);
+		return;
+	}
+	spin_unlock_irqrestore(&tcm->dp_bandwidth_lock, flags);
 }
 
 static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port,
 					  int retry, unsigned long delay)
 {
+	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_hotplug_event *ev;
+	unsigned long flags;
 
 	ev = kmalloc_obj(*ev);
 	if (!ev)
@@ -2888,8 +2906,23 @@ static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port,
 	ev->route = route;
 	ev->port = port;
 	ev->retry = retry;
+	ev->canceled = false;
 	INIT_DELAYED_WORK(&ev->work, tb_handle_dp_bandwidth_request);
+
+	/*
+	 * Record the request and queue the work while holding the lock so
+	 * that tb_deinit() either sees it and cancels it, or rejects the
+	 * request before it is queued at all.
+	 */
+	spin_lock_irqsave(&tcm->dp_bandwidth_lock, flags);
+	if (tcm->dp_bandwidth_closed) {
+		spin_unlock_irqrestore(&tcm->dp_bandwidth_lock, flags);
+		kfree(ev);
+		return;
+	}
+	list_add_tail(&ev->list, &tcm->dp_bandwidth_requests);
 	queue_delayed_work(tb->wq, &ev->work, delay);
+	spin_unlock_irqrestore(&tcm->dp_bandwidth_lock, flags);
 }
 
 static void tb_handle_notification(struct tb *tb, u64 route,
@@ -2996,11 +3029,33 @@ static void tb_stop(struct tb *tb)
 static void tb_deinit(struct tb *tb)
 {
 	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_hotplug_event *ev, *tmp;
+	LIST_HEAD(requests);
+	unsigned long flags;
 	int i;
 
 	/* Cancel all the release bandwidth workers */
 	for (i = 0; i < ARRAY_SIZE(tcm->groups); i++)
 		cancel_delayed_work_sync(&tcm->groups[i].release_work);
+
+	/*
+	 * Cancel the DP bandwidth allocation requests that are still waiting
+	 * for their retry timer. They are not covered by the flush_workqueue()
+	 * done before this function is called because their delayed work has
+	 * not expired yet.
+	 */
+	spin_lock_irqsave(&tcm->dp_bandwidth_lock, flags);
+	tcm->dp_bandwidth_closed = true;
+	list_splice_init(&tcm->dp_bandwidth_requests, &requests);
+	list_for_each_entry(ev, &requests, list)
+		ev->canceled = true;
+	spin_unlock_irqrestore(&tcm->dp_bandwidth_lock, flags);
+
+	list_for_each_entry_safe(ev, tmp, &requests, list) {
+		cancel_delayed_work_sync(&ev->work);
+		list_del_init(&ev->list);
+		kfree(ev);
+	}
 }
 
 static int tb_scan_finalize_switch(struct device *dev, void *data)
@@ -3353,6 +3408,8 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 	tcm = tb_priv(tb);
 	INIT_LIST_HEAD(&tcm->tunnel_list);
 	INIT_LIST_HEAD(&tcm->dp_resources);
+	INIT_LIST_HEAD(&tcm->dp_bandwidth_requests);
+	spin_lock_init(&tcm->dp_bandwidth_lock);
 	INIT_DELAYED_WORK(&tcm->remove_work, tb_remove_work);
 	tb_init_bandwidth_groups(tcm);
 
-- 
2.34.1

