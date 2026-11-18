Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044812;
	b=vmm921CaVHUMO1OOX32/u8r2KPqMUBU9j6OMwaqeuysTNR4jUZgb+6zjqiqzRO+TtaLK
	 i0m9zakJOtu+rQJ8FXlbsTnSsIOYwm6HYTIy+1UqUUPl7VaQiD9layu6kJ58ApqBivzz8
	 Nd+wzOTkBzYFiIDXpjSkyHerODr9vAQAX2WnP+6OK7ouXvqC6PNw5ujoVzb0boAgv/zel
	 wJkDjLCtGcDhD3sz7gX93tRS2J2iAax/Omwjo6/Oh/G+sFQM3QAEPOOCdxbMgPohwQxR9
	 fZ77Ev8sYtg04EcjVzjP61gEb6YXW74nP+88Ut8/Cd2gnvzbG9vr6ZiZy1Hza8FjE0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PNUicm6w6p3F05spqUThapxYplTksbIeS4ZiNmAJwHM=;
	b=w4gfqXG3sHhiiVWQDUQOnIX6gLOU1WInHx7uGC7rIHSlTay7Y61tXehfkgqFmjPfQ/KW
	 LoZjnf/qmkLSxUfbcMGeRJU7ROiM/+20SBPKEBLVz+ob4YKQ3tMC/BAvVtf7KMEPSUHED
	 6tPjFQiK7niyYw/wo5Peow/MpWnmlie3uIT91cqAXPpECiGfAIOHA2FqnZwbPONoMzfJ+
	 96OmwEPhbMWPsncJlJGGsBwjtTibHhkFjOmXTtjIzYJ+nA3sG7YtsI7kOvt39LyqN4DUl
	 GMGV5O+3aC0wwHE/O0dwpgPTRPQhS5M8iLczrX7C+WVF/GdU9OogFFj/6OwOvgRnvNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=edera.io;
	spf=pass smtp.mailfrom=edera.dev;
	dkim=pass header.d=edera.io header.i=@edera.io header.a=rsa-sha256 header.s=google header.b=Fa77AbV5;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F7160A382C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22F7160A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edera.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=edera.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edera.io header.i=@edera.io header.a=rsa-sha256 header.s=google header.b=Fa77AbV5
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b502b9b702so16785677b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.io; s=google; t=1795044810; x=1795649610; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PNUicm6w6p3F05spqUThapxYplTksbIeS4ZiNmAJwHM=;
        b=Fa77AbV5Wz7hzzOU0fzCo9suZaYBeh40z4Tjp4SiV6DO9XX4y6E5RPqRuQFoI0bxsL
         p3RzJY+ASh3AGmK1B3TiIcaCmOgi6bpK7VNmP/HMDCIrg5NtqIrVM+/BmvXc/RvD9jmZ
         vYWWhJTSs3th4Z6NtNFrkWx5Fq9qzuQIIQoQFPYzhhvB5KbeQgRzpWlW9xEiGNN6KwN1
         v6tBoqIUebiQIys9KETnhSnMoyFDBzzNqNMg/mbuWJ4BnKXjFg8rH7uGU73fxnMiGPqp
         ZjllM5vkUxcR3zWULTcnbKSbiwFX2ZMiy69IdedjjV1x0cRqwimcukDe63aGY6z7Cuq3
         Qxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044810; x=1795649610;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PNUicm6w6p3F05spqUThapxYplTksbIeS4ZiNmAJwHM=;
        b=jyHLhpsdjCEPwBrVTE/2f/xS5QfLYHZs0k8fQlQou1hBZMmg881Svbqt5qzuu17YSI
         9a3nONNQuEn0lfDJZJB3b+ktQRiNqqhNvD96NcFOzpivgBmrgbnhdro6nLk2BMMLdTkz
         fr70/6P8wnpnttAoMrs8G7KU4LtOTJfRQQc/vyM3bEJsUSfli54kjDZyN9hetvJ2NeaZ
         z97TJR2BU0a1yiyHza7lBtLThpgmUI0iaFPzJA+uN0zEX3I/VRMrCiVhwRbYLQFUFU0y
         h4CMKXXh1u7cOLtuPsvSqnZljqp0EN2IL/3ngK/7VnoNAwq8EN+/9JHiF7zugBmkglQM
         1nHg==
X-Forwarded-Encrypted: i=1; AL+hErEcji8kd4CptrHZkYA3rETmpOEBOjJqOdM4CHCdSMJcRg5yhnshgBvfhwHVkxYv/WtRWzHS+OMmnJldzhc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NW5RQ/jvecU2NPDoeyHHhDhLk6rM40EgZDsCbqysdC8t71v9j
	W2TnEcmntOz3rNTrnPDhCP8x664RDli4kce9iAqPok8Gt8zBQp39XAV5RHlkYR/mV20=
X-Gm-Gg: AZFdTZcqCD04e2c0r34oAKRMNEfh2JBEL4K0w5aEXljlQsXKrr9XxIkS/e1wXEriP0q
	aDHStuoN2RdQdgNGFju4UdonnCnpThe0pbA2tQ10s/PpLLWj6HsfJSttYT43t4WHna4c+8YdFz5
	vDEUVzD2pijhtp/AL9h5TPeL/zkue5aa/v9mGnb2FCpHdbX/HcS7oa/nsE5GtVLQQFL/4Ogd+1F
	CbdXtH41A+MV0vpZmx4O0v4TY9ZcF0zD37ldNaMHXGlSRzze2vdfuINA9/kLtCvBhFs+aVHAvb4
	d1sNcctj63g5QKASJ+ZUNKtlCHGbBKyUbyUhnnl2VxFPjwIrsVEkkQiVq22IFCceEXnfwjgngD1
	3U020kEAzL7M0e+eh5t2Y5snGU+9XpK52fl0dw9RXRqDET0+8PrDcQG21jS9u78uhJavD2KkfKW
	h2tEXFCU+r3+OKm7ogoXrOdLHbzQ/9sSpbZKKDSy1oIgS8ikUxVonDlS0ulmW5H3wXfr7L4D75S
	lxt94aFUm98etPqNbVpq0yFBYWda3V7eGBWDeDDpInKUMrm6TOjm+MHOy8j19Ci9hNDiCwrbbzF
	V8ecQn5ThHfvsA5P5guVushlxrbHh83/
X-Received: by 2002:a05:690c:6990:b0:8a9:e801:231c with SMTP id 00721157ae682-8b4fecfa8f1mr13807737b3.20.1795044809832;
        Wed, 18 Nov 2026 15:33:29 -0800 (PST)
Received: from [192.168.1.113] ([174.80.170.224])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe07408esm25655797b3.22.2026.11.18.15.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:33:29 -0800 (PST)
From: Benjamin Leggett <benjamin@edera.io>
Date: Wed, 18 Nov 2026 18:33:20 -0500
Subject: [PATCH] xen/xenbus: don't deliver user replies under
 msgbuffer_mutex
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-bleggett-xenbus-transactions-mutex-v1-1-6669e3f54955@edera.io>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQrDIAwA0KtIvhtWhZXhVcY+1KY20KXDaBFK7
 z62C7x3glJhUvDmhEIHK+8C3tjBQFqDZEKewRtwo5ustQ+MG+VMtWIniU2xliAaUuVdFN+tUsc
 U3OzGyd0XO8Jg4FNo4f5Pnq/BQAxKGEuQtP7oTnLbWFpHoV7hur6c6XP6lQAAAA==
X-Change-ID: 20261118-bleggett-xenbus-transactions-mutex-ca2d20625f10
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Benjamin Leggett <benjamin@edera.io>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044808; l=6966;
 i=benjamin@edera.io; s=20260806; h=from:subject:message-id;
 bh=ikAauzb6a0/TX+AaZ3i5klnB/Enh22StcWv0nCHLJ5c=;
 b=RLLXy9iwdkw+0NAICJ6pY0UIbDJdVn2v9NrZpZkeQU7PkoPiDhV/PNyblSYbIINtz6MdRSlDM
 0Xgqwz+KA+EARPVQkN4W8z0ZLukGG01j+JOACoSonNQgjxlcKjV4Z/6
X-Developer-Key: i=benjamin@edera.io; a=ed25519;
 pk=prj3m3DtYeYw1akLHnM/sXm8eau0Ar/IO93YoYnOr+I=

Found this while testing, and wrote a little reproducer. Seems like the
guest kernel's xenbus thread is stuck waiting for a lock, so no xenstore
replies reach the guest once this happens.

The lock involved, from what I can tell, is u->msgbuffer_mutex in
drivers/xen/xenbus/xenbus_dev_frontend.c:

- xenbus_file_write() takes the lock. For XS_WATCH/XS_UNWATCH it keeps
  the lock while it waits for the xenstored reply
  (unregister_xenbus_watch() -> xs_talkv).

- xenbus_dev_queue_reply() takes the same lock. The xenbus thread
  calls it to deliver the reply of an earlier request on the same fd.

So if a fd still has a request waiting for its reply when it gets an
(UN)WATCH, the (UN)WATCH holds the lock and waits for the xenbus thread.
The xenbus thread waits for the lock, and at this point the whole guest
xenstore connection stops.

  sysrq: Show Blocked State
  task:xenbus          state:D stack:14672 pid:42
   __mutex_lock.constprop.0+0x3a2/0x9e0
   xenbus_dev_queue_reply+0x49/0x330
   xenbus_thread+0x221/0xa40
   kthread+0xff/0x250
  task:xenbus-unwatch- state:D stack:12760 pid:1353
   xs_talkv+0x27d/0x3a0
   unregister_xenbus_watch+0x171/0x320
   xenbus_file_write+0x491/0x670
   vfs_write+0x109/0x460
   ksys_write+0xc8/0xf0

This is reproducible by opening /dev/xen/xenbus, writing an XS_WATCH for
any path, then on the same fd write an XS_READ for that path followed by
an XS_UNWATCH, without reading the READ reply first.

Fix is the following:
 - xenbus_dev_queue_reply() needed the lock only for the transactions
   list.
 - That list now has its own mutex, taken in xenbus_write_transaction()
   and xenbus_dev_queue_reply().
 - xenbus_worker() keeps walking the list without a lock, because it
   runs after the last reference is gone.

On an unpatched guest kernel the first XS_UNWATCH never returns, and the
guest's watches stop firing. With this patch, a guest kernel built with
CONFIG_PROVE_LOCKING=y completes 100000 such rounds without a stall, and
lockdep stays enabled with the new lock ordered between the existing two:

  /proc/lockdep_stats:
   debug_locks:                             1
  /proc/lockdep:
   &u->msgbuffer_mutex
    -> &u->reply_mutex
    -> &u->transactions_mutex
   &u->transactions_mutex
    -> &u->reply_mutex

Fixes: fd8aa9095a95 ("xen: optimize xenbus driver for multiple concurrent xenstore accesses")
Cc: stable@vger.kernel.org
Signed-off-by: Benjamin Leggett <benjamin@edera.io>
---
 drivers/xen/xenbus/xenbus_dev_frontend.c | 46 ++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_dev_frontend.c b/drivers/xen/xenbus/xenbus_dev_frontend.c
index 61db6932a9d2..92ddc37311cf 100644
--- a/drivers/xen/xenbus/xenbus_dev_frontend.c
+++ b/drivers/xen/xenbus/xenbus_dev_frontend.c
@@ -89,8 +89,12 @@ struct xenbus_file_priv {
 	/*
 	 * msgbuffer_mutex is held while partial requests are built up
 	 * and complete requests are acted on.  It therefore protects
-	 * the "transactions" and "watches" lists, and the partial
-	 * request length and buffer.
+	 * the "watches" list, and the partial request length and buffer.
+	 *
+	 * transactions_mutex protects the "transactions" list.  It nests
+	 * inside msgbuffer_mutex, and xenbus_thread takes it alone to
+	 * deliver a reply, so a (UN)WATCH that holds msgbuffer_mutex
+	 * while it waits on xenbus_thread cannot stall that delivery.
 	 *
 	 * reply_mutex protects the reply being built up to return to
 	 * usermode.  It nests inside msgbuffer_mutex but may be held
@@ -99,6 +103,7 @@ struct xenbus_file_priv {
 	struct mutex msgbuffer_mutex;
 
 	/* In-progress transactions */
+	struct mutex transactions_mutex;
 	struct list_head transactions;
 
 	/* Active watches. */
@@ -369,7 +374,7 @@ void xenbus_dev_queue_reply(struct xb_req_data *req)
 
 	xs_request_exit(req);
 
-	mutex_lock(&u->msgbuffer_mutex);
+	mutex_lock(&u->transactions_mutex);
 
 	if (req->type == XS_TRANSACTION_START) {
 		trans = xenbus_get_transaction(u, 0);
@@ -391,7 +396,7 @@ void xenbus_dev_queue_reply(struct xb_req_data *req)
 		kfree(trans);
 	}
 
-	mutex_unlock(&u->msgbuffer_mutex);
+	mutex_unlock(&u->transactions_mutex);
 
 	mutex_lock(&u->reply_mutex);
 	rc = queue_reply(&staging_q, &req->msg, sizeof(req->msg));
@@ -413,7 +418,7 @@ void xenbus_dev_queue_reply(struct xb_req_data *req)
 	return;
 
  out:
-	mutex_unlock(&u->msgbuffer_mutex);
+	mutex_unlock(&u->transactions_mutex);
 }
 
 static int xenbus_command_reply(struct xenbus_file_priv *u,
@@ -453,6 +458,8 @@ static int xenbus_write_transaction(unsigned msg_type,
 		char body[];
 	} *msg = (void *)u->u.buffer;
 
+	mutex_lock(&u->transactions_mutex);
+
 	if (msg_type == XS_TRANSACTION_START) {
 		trans = kzalloc_obj(*trans);
 		if (!trans) {
@@ -462,24 +469,27 @@ static int xenbus_write_transaction(unsigned msg_type,
 		trans->generation_id = xb_dev_generation_id;
 		list_add(&trans->list, &u->transactions);
 	} else if (msg->hdr.tx_id != 0 &&
-		   !xenbus_get_transaction(u, msg->hdr.tx_id))
-		return xenbus_command_reply(u, XS_ERROR, "ENOENT");
-	else if (msg_type == XS_TRANSACTION_END &&
-		 !(msg->hdr.len == 2 &&
-		   (!strcmp(msg->body, "T") || !strcmp(msg->body, "F"))))
-		return xenbus_command_reply(u, XS_ERROR, "EINVAL");
-	else if (msg_type == XS_TRANSACTION_END) {
+		   !xenbus_get_transaction(u, msg->hdr.tx_id)) {
+		rc = xenbus_command_reply(u, XS_ERROR, "ENOENT");
+		goto out;
+	} else if (msg_type == XS_TRANSACTION_END &&
+		   !(msg->hdr.len == 2 &&
+		     (!strcmp(msg->body, "T") || !strcmp(msg->body, "F")))) {
+		rc = xenbus_command_reply(u, XS_ERROR, "EINVAL");
+		goto out;
+	} else if (msg_type == XS_TRANSACTION_END) {
 		trans = xenbus_get_transaction(u, msg->hdr.tx_id);
 		if (trans && trans->generation_id != xb_dev_generation_id) {
 			list_del(&trans->list);
 			kfree(trans);
 			if (!strcmp(msg->body, "T"))
-				return xenbus_command_reply(u, XS_ERROR,
-							    "EAGAIN");
+				rc = xenbus_command_reply(u, XS_ERROR,
+							  "EAGAIN");
 			else
-				return xenbus_command_reply(u,
-							    XS_TRANSACTION_END,
-							    "OK");
+				rc = xenbus_command_reply(u,
+							  XS_TRANSACTION_END,
+							  "OK");
+			goto out;
 		}
 	}
 
@@ -490,6 +500,7 @@ static int xenbus_write_transaction(unsigned msg_type,
 	}
 
 out:
+	mutex_unlock(&u->transactions_mutex);
 	return rc;
 }
 
@@ -669,6 +680,7 @@ static int xenbus_file_open(struct inode *inode, struct file *filp)
 
 	mutex_init(&u->reply_mutex);
 	mutex_init(&u->msgbuffer_mutex);
+	mutex_init(&u->transactions_mutex);
 
 	filp->private_data = u;
 

---
base-commit: 2b66f2cc753243a6adb3e9a5c038b0fc59ba7ec9
change-id: 20261118-bleggett-xenbus-transactions-mutex-ca2d20625f10

Best regards,
-- 
Benjamin Leggett <benjamin@edera.io>

