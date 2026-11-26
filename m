Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.248
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729685;
	b=q+ddoTmPhpLUbtZCeltY6VgA1QsXcxoOy9TCHy4SISHpMr8+RNBLLtFFuJg4dZeQHK/G
	 fJRTuH/3VoMFrwpWgG+GihfOAf2uwOyjJOuHqBZm7eKGROHEoRqLOns0RTAzIPvLycrk3
	 9AZiAgureTolZJdQ99Q8b5695nKKeaMH5l6tVaeobj8G0vWOquCLqgZdC1lPgQJZxfWqV
	 9GH5ki4jWm2fTn7+XxkdrskuT9ceFbU04Lv4gc0Z+s7QIDZ4d5ld50zRDXppunLp6k5Di
	 3Ew0+Abr6zc6UrX73uA88mEkei0XxzwMHJoC+keR+a+UeslvZYH6soc52bDmRmJfZSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729685;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8TCtjYf94V6A+Taa5tORkpbncVgWcQpj6xlYuMM054w=;
	b=4xcdL+iI5KkQ/4NxWfD/9kRmVRQQBJURE/gmnwdsCjnp9JTXc5mB/2t4bS7rCRzLanOt
	 NZO+srYfbxI426Oc5V2lrj+pPynUqQ8aWwWHCBQwclObIfFM5jbb2pvBksDK/XsRrrKYp
	 X6GBGzyOg0Q1UPKnlRma6iKpYbykIaEB9wwDtQ9Hrv9MCtWJPJTUiy1jGRKsw6pHdhPAg
	 9E9HGvK9kAC6say2m925M/FupMwOi1tmWWW1S+qPD+6t/Ig0N4nxVBSKOOHay4N6hrPZg
	 F73WrHmyiqJIe61O0PCxwJpAFZPxWdzFO3kUyWLDjqobrFAU45FL4S7gw6yaTaPUOuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XrxdAIjk;
	arc=none smtp.remote-ip=95.215.58.248
Received: from mta1.migadu.com (out-248.mta1.migadu.com [95.215.58.248])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D22606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D22606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XrxdAIjk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HjMf7aSMF0Z5YwITFaAnZhlHTthr5urPa7MOSrAw0vY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795729682; v=1; x=1796334482;
 b=XrxdAIjkfzczf3oARz0HoVcE+3YDUPHzWChdhByXXX5nKW4mQtFiaC1NswMGflibBSRysqpZ
 xSvmRVL4boIVUWsMkTasJd+AaCK0HAjM4wtobHOYjabjS3j5bs3dZQYARYDuN0Ht9zywi55zvxT
 ROygOV/i1MkFWlOXgEpOl/3g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id b2ea8dc85a962c17;
	Thu, 26 Nov 2026 21:48:02 +0000
X-Mizu-Trace-ID: b2ea8dc85a962c17
X-Migadu-Flow: FLOW_OUT
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Chris Zankel <chris@zankel.net>,
	Andrew Davis <afd@ti.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Petr Mladek <pmladek@suse.com>,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <bradley.morgan@linux.dev>
Subject: [PATCH 1/2] reboot: fix platform sys_off handler reuse with NULL cb_data
Date: Thu, 26 Nov 2026 21:47:53 +0000
Message-ID: <20261126214754.3630965-2-bradley.morgan@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126214754.3630965-1-bradley.morgan@linux.dev>
References: <20261126214754.3630965-1-bradley.morgan@linux.dev>
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

In alloc_sys_off_handler(), the check for whether the static
platform_sys_off_handler is already in use checks handler->cb_data,
which is a weird assumption since cb_data is optional and callers can
just pass NULL. If a caller registers at SYS_OFF_PRIO_PLATFORM with
NULL cb_data, a second SYS_OFF_PRIO_PLATFORM registration gets the same
struct back, overwrites its fields, and links the same notifier_block
into another chain while it is still on the first one. For example, on
xtensa ISS platform_setup() registers iss_restart and iss_power_off
this way, so restarting calls iss_power_off() instead and splices the
two lists together if any lower priority poweroff handler is around.

To fix this, resolve the mode and list first, keep one static handler
per mode in platform_sys_off_handlers[], and check handler->list instead
of handler->cb_data so a NULL cb_data cannot slip past -EBUSY.

Fixes: 587b9bfe0668 ("kernel/reboot: Use static handler for register_platform_power_off()")
Signed-off-by: Bradley Morgan <bradley.morgan@linux.dev>
---
 kernel/reboot.c | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 9a84401adde5a..87f307ab46faa 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -363,9 +363,11 @@ static int sys_off_notify(struct notifier_block *nb,
 	return handler->sys_off_cb(&data);
 }
 
-static struct sys_off_handler platform_sys_off_handler;
+static struct sys_off_handler
+	platform_sys_off_handlers[SYS_OFF_MODE_RESTART + 1];
 
-static struct sys_off_handler *alloc_sys_off_handler(int priority)
+static struct sys_off_handler *alloc_sys_off_handler(enum sys_off_mode mode,
+						     int priority)
 {
 	struct sys_off_handler *handler;
 	gfp_t flags;
@@ -375,8 +377,8 @@ static struct sys_off_handler *alloc_sys_off_handler(int priority)
 	 * at the early boot time because memory allocator isn't available yet.
 	 */
 	if (priority == SYS_OFF_PRIO_PLATFORM) {
-		handler = &platform_sys_off_handler;
-		if (handler->cb_data)
+		handler = &platform_sys_off_handlers[mode];
+		if (handler->list)
 			return ERR_PTR(-EBUSY);
 	} else {
 		if (system_state > SYSTEM_RUNNING)
@@ -394,7 +396,9 @@ static struct sys_off_handler *alloc_sys_off_handler(int priority)
 
 static void free_sys_off_handler(struct sys_off_handler *handler)
 {
-	if (handler == &platform_sys_off_handler)
+	if (handler >= platform_sys_off_handlers &&
+	    handler < platform_sys_off_handlers +
+		      ARRAY_SIZE(platform_sys_off_handlers))
 		memset(handler, 0, sizeof(*handler));
 	else
 		kfree(handler);
@@ -428,36 +432,40 @@ register_sys_off_handler(enum sys_off_mode mode,
 			 void *cb_data)
 {
 	struct sys_off_handler *handler;
+	bool blocking = false;
+	void *list;
 	int err;
 
-	handler = alloc_sys_off_handler(priority);
-	if (IS_ERR(handler))
-		return handler;
-
 	switch (mode) {
 	case SYS_OFF_MODE_POWER_OFF_PREPARE:
-		handler->list = &power_off_prep_handler_list;
-		handler->blocking = true;
+		list = &power_off_prep_handler_list;
+		blocking = true;
 		break;
 
 	case SYS_OFF_MODE_POWER_OFF:
-		handler->list = &power_off_handler_list;
+		list = &power_off_handler_list;
 		break;
 
 	case SYS_OFF_MODE_RESTART_PREPARE:
-		handler->list = &restart_prep_handler_list;
-		handler->blocking = true;
+		list = &restart_prep_handler_list;
+		blocking = true;
 		break;
 
 	case SYS_OFF_MODE_RESTART:
-		handler->list = &restart_handler_list;
+		list = &restart_handler_list;
 		break;
 
 	default:
-		free_sys_off_handler(handler);
 		return ERR_PTR(-EINVAL);
 	}
 
+	handler = alloc_sys_off_handler(mode, priority);
+	if (IS_ERR(handler))
+		return handler;
+
+	handler->list = list;
+	handler->blocking = blocking;
+
 	handler->nb.notifier_call = sys_off_notify;
 	handler->nb.priority = priority;
 	handler->sys_off_cb = callback;
-- 
2.53.0

