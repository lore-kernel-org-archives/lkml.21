Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077132;
	b=dRH9pAjlJkXXNkuJWZidTHCh4eakdJigsBd70hST9yONpaQN1CBQbVzy/xGHrQ6B/q15
	 tSJ4YF2/HcQn1Z+aBo7khVSuZEJM7Ay8Gc1yT32QDFQf6N8ZzvRFmk9J35oCtaYIrienf
	 m1TYMtarzeoUjz9Y77lc+X/N4FcZTkGIkWLCKNnbtCzSuRxpyThoehtSPO6KmQ5/aetyB
	 9Bqio6FEBiurDNhhKFgpd4caKuMoeQK/4m15nX2mvjN73QnooJrwXsOOHw7/fSZaB1wFv
	 EHWxdpRUF0djL/WZDCR1J6o7Az8m/fW4Tru9k0/Hm++Z5ybFUD/PCey/wNFwNr3NwxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WnHFPanTA4CI2w/Oz9SgKC3BzcEiPWaw+HmC4ZcUF2Y=;
	b=3IWw+0ZKDowiHZiiUaSl5idJueTct9nkNE6Uc8Js/OheFVcdcmR1rxsHyWFpzBTaVvuo
	 oL7NDTuIanSMSKXw62MLxaaS8+lNRbJLTMQ0y3+zUcMGeZDCV1YZs8HJrTVQaymu3IJCr
	 wdHl3S97s6K04y+Hy7O5P3qny6/J0HsPG7TUmMrOmzo4HHWOPlTO3oAROWFKM/GU9iVbs
	 nW3Td1QIoJUzlmgRvfmyxpbIvobLygD6dm5n+YQpBGUIymEXyATXPN9+GYoCbpkVkDr1w
	 t5YX3Q6uatAyDB8wEqVI1QeBNF1WnNcdze2kmTP++VGivT76wF19nHe7ZWc0Fw68Dgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dsncDCGf;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2043606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2043606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dsncDCGf
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38431138772so756755eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795077131; x=1795681931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WnHFPanTA4CI2w/Oz9SgKC3BzcEiPWaw+HmC4ZcUF2Y=;
        b=dsncDCGfdFQogD46DJJPRpXoUDYcMytE28LdcfbbBIGYk066KMMH1/8dFrjy+r71bF
         kiQLfH7IWM8TFlHg6GIUSDU06U6KWbUUPmreEAT/EqZqbTfAekfWhHmULRivXJ71UZCS
         fHBzhE0ifBIKHEM9LPw9X+8aWqZ3bSRuNjXMbAfJ1PirrJEZ3ycoQg3UTHFaCK9bKUP9
         N88Vs1p+TP4BlzEvRYvqKM6P7kls+hIXhS+FnaubQ/GesIVliNL5i1v94ijH4Wd6aX6F
         w87dUiVZKfTrU31+DJiVUm8PKIcz39fDwybeBGgWmEms8me0x5pHZxQwIExFydKhkMWV
         Bnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795077131; x=1795681931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WnHFPanTA4CI2w/Oz9SgKC3BzcEiPWaw+HmC4ZcUF2Y=;
        b=HI3HhWAVNGqgs0jM6EVplYf6xtewZHGgeS/7xE8DSsKBNKeebHjCrrLMhDZIr0/DNN
         yHb5vHa6Xy5DrZHaqJm92b+tlCJ32V1ZBEU6s+ADrsMWXq1gLiup2hxvgbZFIs5en/7D
         EPQycXawQ77Z8km5IU2EZQCKeNmRbVMELM2IcUMqYI2t5F9mdgjLskR2BD7eOZopdvfm
         uYO2y8V5n4htI+t/pfLJCJbFE6oIliS9spmjdvxZM1XJrcaqg72cuVf1StQryylsLN8G
         5zWVDDYPxDr/d7I6nAAFFY/UoSoBFIOOUmeqkHDkdJxjcmrs6/gkF+PLsInakRb1cOzc
         5x/g==
X-Forwarded-Encrypted: i=1; AL+hErHoo3N8NVgXwwLdlcTM78fZg4faSfHNyPPatD+mg9ynRKw8mWAZA8bTyVfxrEJolFFvJ9toRVYmfFSMdkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z98X+3ewT6pm/E+YsSyq5GOXW4or/84rJwgpfjZ9NQiYavJum/s
	jvhz+2Gmnrj+VgLaDlZiy4zBWvyhXnF1T/eacDh23wKaeNzOpnZcUfzg
X-Gm-Gg: AZFdTZdpCf39qbqEVOilsIMlAc8vQ4zMGN0da05SziUO4QuTmujh/uj605CX2slDpMh
	S09EwXgXV8rnnPraIEZ6cIXysbV/F+gBW3udaYUadSWEST/2SetIXUaBi688cUpeZ6h9draZWvY
	qgVhEux+FV/fMbKU9NwQlI8n/Qr3qJ2RIVS4Okecz2mOBY3k1t/WkX9RX078yNypXi4Rzi7NWWy
	YENAwXJawkzLLJ8K/vdzPx3MzkdkkexXvZ21F2hh7VpueGs5kJkUJ8H11q/zASobaECI8Yxats/
	QcFvI8wGuNfWO5LYRRxDoPKyzzETslSZP6VwztJjHOc9+UG15bAbXDVSLtBhkDuvK1ryf7xY5PZ
	4oQGu+4PoTiWUUMghZeNqMtiscOA6VB9QjynYXVY4RXSrzgAqAaPzAz85Z9tMXjWUrldCsjO516
	JdaVm31nCefYebHL5AyKdHSDkeuoYxXLz8mZZGwCX9S27xihhgQbhTLYuyQFbd34CnhhCV8JpxT
	kYTqS2gNcPQsJ5KDVxXiSpT7+y1mHNidrjVJgOyvAIuM3weZPPkI3b6OPhFZleTE8hwFpKsYSdn
	69GwoJ7RRmP0keym2MMbKyKdnPFwHPvL5WbpIvDq/bWdpO0BkzD3QzR1pj/J3Hpy8+xdBXY+05P
	QfyNynI9uYR2Y/uQzgdUrQK2JfgZCS/tFM8DY/5R4V4T94w==
X-Received: by 2002:a05:7300:c00b:10b0:37f:d740:51d7 with SMTP id 5a478bee46e88-382821d4abfmr5546176eec.41.1795077130540;
        Thu, 19 Nov 2026 00:32:10 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72e52easm14580609eec.17.2026.11.19.00.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:32:10 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] firewire: keep the request alive while the event is queued
Date: Thu, 19 Nov 2026 16:32:05 +0800
Message-Id: <20261119083205.3437874-1-shunsheng1218@gmail.com>
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

handle_request() builds an event whose payload points into the
fw_request that carries the packet.  The reference that keeps that
request alive belongs to the client resource, which can be released
from another thread with FW_CDEV_IOC_SEND_RESPONSE as soon as the event
header, including the handle, has been copied to userspace.

dequeue_event() copies the header and the payload with two separate
copy_to_user() calls, so the request can be freed between them and the
payload copy then reads freed memory.  The same happens for an event
that is still on the client list when the request is released.

Let the event hold its own reference to the request and release it in
the event destructor, which the three paths that free an event now use.
The other event types are allocated with kzalloc_obj() so that the new
release hook is NULL for them.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against linux1394 for-next (d99221005abf), where the cdev
context-analysis work has already landed.  Compared with the same change on
mainline, the only difference is the hunk context in
fw_device_op_release(), which now frees the events under client->mutex with
scoped_guard(); the change itself is unchanged.

Tested with a controlled lifetime test: drivers/firewire/core-cdev.c is
compiled verbatim into a module on a KASAN kernel built from this tree
(x86_64, QEMU/KVM).  The test queues an inbound request event, releases the
client reference the way a SEND_RESPONSE ioctl does, and only then copies the
event out with dequeue_event().  With this patch the payload is intact and
the request is released when the event is freed; the same test against
666539eecdf4 reports a slab-use-after-free in _copy_to_user from
dequeue_event().  All three event free paths - dequeue_event(), the shutdown
branch of queue_event() and fw_device_op_release() - are exercised.  The
FireWire controller was not available, so no bus timing was exercised.

The test was re-run against the for-next version of the file: the module
compiles drivers/firewire/core-cdev.c from the replayed tree, and all 13
checks pass there as well.

All event frees were re-audited: the three struct event allocations go
through queue_event() and are released only by free_event(), and the
iso_resource_event objects hand their ownership over with
retain_and_null_ptr() / no_free_ptr() before they are queued, so no path
frees a queued event with a plain kfree().

Checked against the list traffic and the maintainer tree: Takashi
Sakamoto's "firewire: core: consolidate lock scopes for event waiting in
dequeue function" (2026-09-20) is merged in for-next.  It fixes a different
race and does not touch the free path, and this patch is rebased on top of
it.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.
---
 drivers/firewire/core-cdev.c | 44 ++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 03598f7e55470..d96226a5f45c8 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -201,12 +201,13 @@ static void schedule_iso_resource_auto(struct iso_resource_auto *r, unsigned lon
 }
 
 /*
- * dequeue_event() just kfree()'s the event, so the event has to be
+ * free_event() releases an event with kfree(), so the event has to be
  * the first field in a struct XYZ_event.
  */
 struct event {
 	struct { void *data; size_t size; } v[2];
 	struct list_head link;
+	void (*release)(struct event *event);
 };
 
 struct bus_reset_event {
@@ -226,6 +227,7 @@ struct outbound_transaction_event {
 
 struct inbound_transaction_event {
 	struct event event;
+	struct fw_request *request;
 	union {
 		struct fw_cdev_event_request request;
 		struct fw_cdev_event_request2 request2;
@@ -330,6 +332,13 @@ static int fw_device_op_open(struct inode *inode, struct file *file)
 	return nonseekable_open(inode, file);
 }
 
+static void free_event(struct event *event)
+{
+	if (event->release)
+		event->release(event);
+	kfree(event);
+}
+
 static void queue_event(struct client *client, struct event *event,
 			void *data0, size_t size0, void *data1, size_t size1)
 {
@@ -340,7 +349,7 @@ static void queue_event(struct client *client, struct event *event,
 
 	scoped_guard(mutex, &client->mutex) {
 		if (client->in_shutdown) {
-			kfree(event);
+			free_event(event);
 		} else {
 			list_add_tail(&event->link, &client->event_list);
 
@@ -393,7 +402,7 @@ static ssize_t dequeue_event(struct client *client, char __user *buffer, size_t
 		ret += size;
 	}
 
-	kfree(event);
+	free_event(event);
 
 	return ret;
 }
@@ -756,6 +765,14 @@ static void release_request(struct client *client,
 	kfree(r);
 }
 
+static void inbound_transaction_event_release(struct event *event)
+{
+	struct inbound_transaction_event *e =
+			container_of(event, struct inbound_transaction_event, event);
+
+	fw_request_put(e->request);
+}
+
 static void handle_request(struct fw_card *card, struct fw_request *request,
 			   int tcode, int destination, int source,
 			   int generation, unsigned long long offset,
@@ -777,7 +794,7 @@ static void handle_request(struct fw_card *card, struct fw_request *request,
 		fw_request_get(request);
 
 	r = kmalloc_obj(*r);
-	e = kmalloc_obj(*e);
+	e = kzalloc_obj(*e);
 	if (r == NULL || e == NULL)
 		goto failed;
 
@@ -835,6 +852,15 @@ static void handle_request(struct fw_card *card, struct fw_request *request,
 		event_size0	= sizeof(*req);
 	}
 
+	/*
+	 * Hold a reference for the event so that the payload stays valid until
+	 * userspace has copied it, even if the client releases the request
+	 * from another thread in the meantime.
+	 */
+	fw_request_get(request);
+	e->request = request;
+	e->event.release = inbound_transaction_event_release;
+
 	queue_event(handler->client, &e->event,
 		    &e->req, event_size0, r->data, length);
 	return;
@@ -1027,7 +1053,7 @@ static void iso_mc_callback(struct fw_iso_context *context,
 	struct client *client = data;
 	struct iso_interrupt_mc_event *e;
 
-	e = kmalloc_obj(*e);
+	e = kzalloc_obj(*e);
 	if (e == NULL)
 		return;
 
@@ -1441,8 +1467,8 @@ static void release_iso_resource_auto(struct client *client, struct client_resou
 static int ioctl_allocate_iso_resource(struct client *client, union ioctl_arg *arg)
 {
 	struct fw_cdev_allocate_iso_resource *request = &arg->allocate_iso_resource;
-	struct iso_resource_event *e1 __free(kfree) = kmalloc_obj(*e1);
-	struct iso_resource_event *e2 __free(kfree) = kmalloc_obj(*e2);
+	struct iso_resource_event *e1 __free(kfree) = kzalloc_obj(*e1);
+	struct iso_resource_event *e2 __free(kfree) = kzalloc_obj(*e2);
 	struct iso_resource_auto *r  __free(kfree) = kmalloc_obj(*r);
 	int err;
 
@@ -1514,7 +1540,7 @@ static void iso_resource_once_work(struct work_struct *work)
 static int init_iso_resource_once(struct client *client,
 				  struct fw_cdev_allocate_iso_resource *request, int todo)
 {
-	struct iso_resource_event *e __free(kfree) = kmalloc_obj(*e);
+	struct iso_resource_event *e __free(kfree) = kzalloc_obj(*e);
 	struct iso_resource_once *r __free(kfree) = kmalloc_obj(*r);
 	int err;
 
@@ -1949,7 +1975,7 @@ static int fw_device_op_release(struct inode *inode, struct file *file)
 
 	scoped_guard(mutex, &client->mutex) {
 		list_for_each_entry_safe(event, next_event, &client->event_list, link)
-			kfree(event);
+			free_event(event);
 	}
 
 	client_put(client);
-- 
2.34.1

