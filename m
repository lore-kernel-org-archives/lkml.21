Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542395;
	b=OWWwuknZzBFe5Vx6LwwOAeDUP/Zih3USG1Tu23r3HeSKqSQXQqmzebP/mQzky4zgQCRW
	 ITPWdbdvgso/+KKNOWzy8YEWXfTKrhUkutzH47POoRXsH7JzS3EjEjlGGJA6hsiO31zey
	 X/s7Zimb3d7+p74+tiKJ5AMnsw3XQCv4wZojZpjjW5XejeywnKzwCGL6Ll7dE0WKrzJ2P
	 q6aRGDJECb1DFy+mvBxFOP/hUpjxubZwfIcOkReApCI/kp6nPHE7Iioppo5AY375ojbW5
	 TERkbxmzOy9xOBWpGfnz9aL2PyKIZ+2CagH//yeJ3K4AOfN/HI0wdUIxG+ri7xMsl1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:Received:From:In-Reply-To:
	 References:MIME-Version:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=SQpKUtDlj4AZ1qDo3gcLs5ROWZFh7sOWq4cTgDCqyUA=;
	b=ktCfiCenOJGB1oZZdG+MHCqMBZOOF2Qp0Xy+WuQhF/My8YFLIUpUaKuybuxyQx5ltr9+
	 C1gIdldrJUMw6G0vnFOT4KruKPJFXkeGLfRVQTK4M/wRj0H6wl1lzzuwCL241dxZR07MG
	 gVWPddeACAQicQ2QmcRIDeMfC4hnaQm9uqIInDlVbUnhj7DBH5nvXvADgy37aADSG3hov
	 +rM/ZadCnECn52GWyZ+5i53pnC5seJjrXZuNAMUR8WJOASFrmnvjr4bb8ipmlpx+n5j0G
	 +loGh0YhXfDsG2DDbR9E9BDIOb3xTZ8YgWbVeU/Pn1J46IURZGQgtScBgun1LyY5Y0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=VY3j1U8n;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C48F606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C48F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=VY3j1U8n
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so8192773a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795542394; x=1796147194; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SQpKUtDlj4AZ1qDo3gcLs5ROWZFh7sOWq4cTgDCqyUA=;
        b=VY3j1U8n+qZEJ87j+i85Rht+OSsMOZCPHE9Pj3thiSEgnqgNUScHIdxC3bq2tJeOQR
         T8G0YvCm87zEJfjvDRfrHeRudiRbMghYS9gmBGDKG7Bhd+E4L2wPYE5Kcx35WQY6/tlS
         +KAUs7P0RmT4AvmtMlTSDsjFr1A6Jro2sanXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542394; x=1796147194;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQpKUtDlj4AZ1qDo3gcLs5ROWZFh7sOWq4cTgDCqyUA=;
        b=HRrBDXp9VpJxvs55HV9w0M04dTyyHfb6F+hL4xGXiCm/yUFYhzZQbiCmdZVTjisR57
         KfyRdWaBqW3dyMGrMlw/CL8k/ZVcOAHPbpEDGdf77/7CIWA3k3BueQsuEHQib05hPr9J
         gGnYMG9agJqTuzZWAom7MzGDxnewm1/EklRK1aImdXwt6vTB936m7c5VTHZ5jVOl4u75
         AwkaA+ht3qShSidw8OHCeGxoiDcptFNJCvwwxx2zCIgxEucT1+tFac01YxdAonitawq+
         8zQloNCnCT+WGY2XPFoOm1Ys9yesVrlrgDdRS2fSbj6s5YHnMDXDen7TISjucmAsD7sP
         fPeQ==
X-Forwarded-Encrypted: i=1; AL+hErF6VaiT/HvjMxLpihbmZE74hHt58vaExSv3hV+j2m7ND+UIi5qjr+kMWoYwVryklaDxCcXNXuyPLeH2xBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QjP30Qi7R/2q0xk+L9EgQgXn0NrincVkMcP5NUxnZK08xUyS2
	C0jngN9urfoLCqowYJUT2D5tm7MVe8U3QhdRTcrLDD6oHn7OBxWTYfEIdChfKiUXXgFAQrIOFVm
	w5fUWOGOlSQ==
X-Gm-Gg: AZFdTZexJOJLOw920Lc/ItIgDQsYc8hX4N765mQOsyGZ1dNC1nwhhwatkE5FtmXkQM4
	X36aV84wIbf+iMVcG9ecOg8eTrcnRoWsvBK31Yao/dXEI2jhB9aaTrVp5EWmLjRmnWtVZ9gZISF
	1dc+NkjJ6vboX25tJ3QpznlBKcMM9gEjdUQPnRwag/tvA6orszUbtMByZztrx2ZeBnIGgSrUGvh
	5RHUgGS0kUZ7SNcL4o5IAyx7mLztg0VNGdAT283VgmcGStOwLuEDUvADjn0CbuZvhMsUmcFNFLB
	0K6aTvOi5jsgc0B3lUlRY8Awb72d3nLnSyXZnH+YQBszUEesQbfzUMBKar9QfHc1+5s94XN/mr7
	G9YSUUOx+gGNaHkhxSSuLZl5vVGitPaXv72mf/7nZEM01qQT67AIRaZV8krNEUF1pdrOqmNqjav
	vVj6ymPwF68ZEWiQpvFyXH0n4UQ6IRKHEgL6//RjUmuIUcTDlVIhYyYRRI+BQXFZaE2zdlH1bHA
	aZwFwLXaLzncHLdVsX8kwyn+7o5yxga2Z7brpUn63Bwq8/Pt2bV6oKVJOG/GIL9UeETolYf32YX
	5M35b4boMCkmZwuqKNpZusxP6yA1mehjK4U8YkMiy/54eaOOlDbIoEfTp4Z9D5YcgmVMVhpB2z+
	Q5Ps=
X-Received: by 2002:a05:6402:c88e:20b0:6ac:73f8:2e4f with SMTP id 4fb4d7f45d1cf-6baeabf0025mr2249803a12.29.1795542393714;
        Tue, 24 Nov 2026 09:46:33 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1ca4ff7bsm202616a12.8.2026.11.24.09.46.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:46:32 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso800416566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:46:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGdyrMpAhFC0VEoO5mVDxPN+9TP2jpk40yUldPllOjGrJBIY0alclBdR2Y0hzxXB3nWp/SwrCwQe9cxcsE=@vger.kernel.org
X-Received: by 2002:a17:907:3ccb:b0:c3f:84aa:af0d with SMTP id
 a640c23a62f3a-c513a811d6amr1255078566b.18.1795542391340; Tue, 24 Nov 2026
 09:46:31 -0800 (PST)
Received: from 425495914135 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 12:46:30 -0500
From: Linus Torvalds <torvalds@linux-foundation.org>
In-Reply-To: <CAHk-=wgYc9vFEmyV0Ch_e49j6GOhUCMQMnMV4f1FLLvumZOmRw@mail.gmail.com>
References: <20261122-b4-sched-wait-intr-head-v2-0-4a764b64e8ce@columbia.edu>
 <20261122-b4-sched-wait-intr-head-v2-1-4a764b64e8ce@columbia.edu>
 <CAHk-=wj_eqNh+gNhCQh3exrL5Pmo5hbZBcL0W-4Ah_Nw0Kegzw@mail.gmail.com>
 <awWSwmvaTwBxfU-r@redhat.com> <CAHk-=wj3GCXZohdFWWPAOkC_LHno4X0oQW+0sQFJzRMvjpODUg@mail.gmail.com>
 <CAHk-=wgYc9vFEmyV0Ch_e49j6GOhUCMQMnMV4f1FLLvumZOmRw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 12:46:30 -0500
X-Gmail-Original-Message-ID: <CAHk-=wgNZfCN5qW-0pOK_TFBscqTu6an7fK5pEkxewg-Aif1Fg@mail.gmail.com>
X-Gm-Features: Aa3M54p8plLWbVY6iSjVP3DnYsEIL6S32qEa4KRav48BblCo7RxKY_YSzzQDIJA
Message-ID: <CAHk-=wgNZfCN5qW-0pOK_TFBscqTu6an7fK5pEkxewg-Aif1Fg@mail.gmail.com>
Subject: [PATCH 5/7] sched/wait: always queue new waiters at the tail
To: Oleg Nesterov <oleg@redhat.com>
Cc: mt4022@columbia.edu, Jens Axboe <axboe@kernel.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Michal Nazarewicz <mina86@mina86.com>, Wen Yang <wen.yang@linux.dev>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 23 Nov 2026 16:48:44 -0800
Subject: [PATCH 5/7] sched/wait: always queue new waiters at the tail

Non-exclusive waiters have been added at the head and exclusive ones at
the tail, so that an exclusive wakeup stopping early still woke every
non-exclusive waiter.

That only matters for waiters that mix both kinds on one queue like
read() and poll() on a pipe - and even then it doesn't actually buy
anything but complexity and fragility of the code.

An exclusive reader consumes the event, the poller had nothing to see,
so there's no real point in keeping the two ordered.

The pointless ordering results in a special rule for everybody adding
themselves to the wait queue, and that rule has not been consistently
followed anyway (see for example do_wait_intr() and do_wait_intr_irq())

So just queue everyone in FIFO order.  LIFO might be better for
throughput, but every time we've ever tried that optimization in real
life, it has caused fairness issues, so let's just do the obvious thing
and add new waiters at the end of the list.

Priority entries (used by the hypervisor code - questionable special
case) are still placed at the head by add_wait_queue_priority*().

And because epoll is a pile of stinking manure that I am afraid to touch
this leaves __add_wait_queue_exclusive() alone and it adds its entry at
the head for epoll's ep->wq so its own wakeup order doesn't change.

Now that it isn't a "real" exclusive wake event, its ordering thankfully
doesn't actually matter for anybody else.  It should be fixed, but it's
now basically just an internal epoll thing (and that will be made more
obvious in following patches).

Cc: Christian Brauner <brauner@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
---
 include/linux/wait.h | 14 +++-----------
 kernel/sched/wait.c  | 29 ++++++++++++++++-------------
 2 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 09518f8ff10c..bf0a3713ed0f 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -171,25 +171,17 @@ extern void remove_wait_queue(struct
wait_queue_head *wq_head, struct wait_queue

 static inline void __add_wait_queue(struct wait_queue_head *wq_head,
struct wait_queue_entry *wq_entry)
 {
-	struct list_head *head = &wq_head->head;
-	struct wait_queue_entry *wq;
-
-	list_for_each_entry(wq, &wq_head->head, entry) {
-		if (!(wq->flags & WQ_FLAG_PRIORITY))
-			break;
-		head = &wq->entry;
-	}
-	list_add(&wq_entry->entry, head);
+	list_add_tail(&wq_entry->entry, &wq_head->head);
 }

 /*
- * Used for wake-one threads:
+ * Adds at the head, for epoll's LIFO wakeup of its epoll_wait()ers.
  */
 static inline void
 __add_wait_queue_exclusive(struct wait_queue_head *wq_head, struct
wait_queue_entry *wq_entry)
 {
 	wq_entry->flags |= WQ_FLAG_EXCLUSIVE;
-	__add_wait_queue(wq_head, wq_entry);
+	list_add(&wq_entry->entry, &wq_head->head);
 }

 static inline void __add_wait_queue_entry_tail(struct wait_queue_head
*wq_head, struct wait_queue_entry *wq_entry)
diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index 9f126cc5c338..a14e14202279 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -40,11 +40,18 @@ EXPORT_SYMBOL(add_wait_queue_exclusive);

 void add_wait_queue_priority(struct wait_queue_head *wq_head, struct
wait_queue_entry *wq_entry)
 {
+	struct list_head *head = &wq_head->head;
+	struct wait_queue_entry *wq;
 	unsigned long flags;

 	wq_entry->flags |= WQ_FLAG_PRIORITY;
 	spin_lock_irqsave(&wq_head->lock, flags);
-	__add_wait_queue(wq_head, wq_entry);
+	list_for_each_entry(wq, &wq_head->head, entry) {
+		if (!(wq->flags & WQ_FLAG_PRIORITY))
+			break;
+		head = &wq->entry;
+	}
+	list_add(&wq_entry->entry, head);
 	spin_unlock_irqrestore(&wq_head->lock, flags);
 }
 EXPORT_SYMBOL_GPL(add_wait_queue_priority);
@@ -78,12 +85,12 @@ EXPORT_SYMBOL(remove_wait_queue);

 /*
  * The core wakeup function. Non-exclusive wakeups (nr_exclusive == 0) just
- * wake everything up. If it's an exclusive wakeup (nr_exclusive == small +ve
- * number) then we wake that number of exclusive tasks, and potentially all
- * the non-exclusive tasks. Normally, exclusive tasks will be at the end of
- * the list and any non-exclusive tasks will be woken first. A priority task
- * may be at the head of the list, and can consume the event without any other
- * tasks being woken if it's also an exclusive task.
+ * wake everything up. Otherwise the walk stops once nr_exclusive exclusive
+ * tasks have been woken. Waiters are queued in FIFO order, so non-exclusive
+ * waiters queued behind that point are not woken: the exclusive waiters will
+ * consume the event. A priority task may be at the head of the list, and can
+ * consume the event without any other tasks being woken if it's also an
+ * exclusive task.
  *
  * An exclusive waiter that returns >0 promises to handle the event. Pollers
  * (EPOLLEXCLUSIVE) can't promise that, since userspace may never consume it.
@@ -308,12 +315,8 @@ long prepare_to_wait_event(struct wait_queue_head
*wq_head, struct wait_queue_en
 		list_del_init(&wq_entry->entry);
 		ret = -ERESTARTSYS;
 	} else {
-		if (list_empty(&wq_entry->entry)) {
-			if (wq_entry->flags & WQ_FLAG_EXCLUSIVE)
-				__add_wait_queue_entry_tail(wq_head, wq_entry);
-			else
-				__add_wait_queue(wq_head, wq_entry);
-		}
+		if (list_empty(&wq_entry->entry))
+			__add_wait_queue(wq_head, wq_entry);
 		set_current_state(state);
 	}
 	spin_unlock_irqrestore(&wq_head->lock, flags);
-- 
2.56.0.313.g975a75ca90
