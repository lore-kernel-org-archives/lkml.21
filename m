Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542474;
	b=CzSF+Gks9As2gFjWkbKC7f39QKNNsJJIk3gReZd37SEULvblWYsctpxvDj3Qq14B0Itb
	 P7K5fB14IZR7nF9VLUqxaT/ySKkudjpWC2jc7xTU/Kq3TUvt8bzoTTW7Z4emtz0NJtSIN
	 WOGQCIgKL0pKNVkku/LPvyktF93xcQ9sj3F27BFyTUGVLubOeXhmouCwLhlAkVH9sFfMa
	 lzjB82sZDAl1j+qsubQa+ZtJKjCox7N2b39I5XVqMXz6sQ/KpjLol2d+r5rQiKSmenqBR
	 UBMYpZXkxhAztWHR9VPHyFLgxwW14+znoMNvw7+fBtLPSKNEkUhHMav8+8OfUC1/sFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:Received:From:In-Reply-To:
	 References:MIME-Version:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=H7ztE50hZokGuEnZu7uhKJFIAPGf1iIgqAITsfIe0uA=;
	b=0i6LjYUOxTZpY1zqH+swcwuZ5X4mSF8BxsJW5VQkzceW1cU/kaVTtU43X6yynXBgn4Fa
	 RXtA58/W6DaXWsvEcboX0Vr47yYqX1Ec1qUQ8zIErhS6aSndYbpT344JCMzGfhOMuB7g5
	 Bz8cZiVF8XsQ+ljqnHQ5v5BVNZqs6ZugE5Flhjz6LbxkotJeY7FYmj+hOD1AGN1+zQLTB
	 sea4lJMoTiuTRqsTNdFAU8WwmWmiE6WDl+9gOl7FQwYL0DbyXKES+8mzDtJPJPp35RCk5
	 eboWFpJswUS9GwU32m7dTKwgYbvCe0zzNcTlEM3u60DxMSSYmXo4cB89gfpPVToYlGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BItKy6yl;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1F0606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E1F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BItKy6yl
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50cc7540b7so672344966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795542472; x=1796147272; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7ztE50hZokGuEnZu7uhKJFIAPGf1iIgqAITsfIe0uA=;
        b=BItKy6ylqxo/WGtHCOnn+vsM/6jVBxwZRbHtjPi8BCdVu0Adc1SaGbQoZSTwCEu07l
         U4ujjG6s/0/fuseoaS3Ko4ZeHlRy9A3sfQrYyj1YQx+8IcFQHy+if5ETXoHgM1qv4B/2
         A0qtYbZ8J8VR+nxAHDhwPiiwEuhToGrWe2t7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542472; x=1796147272;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7ztE50hZokGuEnZu7uhKJFIAPGf1iIgqAITsfIe0uA=;
        b=KSdH0ATkwvrRSOecc7EpaoBwlGtjUUYVu1FYaa44417m7f9ByRrtHQ36PzXclLNmYn
         mo6Gqq5oU2x5b9FmRg/AbW6U1IGkhi8j2Pt5mpsDWlkrKzS56bqgXPzeHjKNvnBr2uJm
         LXWZ2pXK05+RCeKvJM+oNnLowjH3p2WOYXldjiBkxyaq26XEFQYR9DqiXdGHPSK4wsSW
         XsrPdFwXeWno79KNPxHg4VBnyote89//l+SoCC06DvE2tVQz5OSoC05mS2qIiW/JIK+8
         9WpSIjTvGxn8r+C6VbohwAFrOWVEQ40Yzqp0z3yymIxnmkNtF3ueuMke+U8En18DY5gi
         zsXQ==
X-Forwarded-Encrypted: i=1; AL+hErFve1m2P40WCcqNtILWGHmD7A6yD63K+HCGqoNa7XB73Cs+Mn9xKTz6Bp6TK7K4aIivZVR/IvdXraFQhrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8piAAXAmnz1NMYqeOY288d0BqfxF7qZLpJ2QxcNIq9zQiqhZ5
	uU9CJQntGlwiZexpLOOvr+x1Td4mCszGxrPpDMKSMAGWwdBJy6X/0W+1e3rmhXU5ZQ+9JsCvN5l
	kfK76Lo7IDA==
X-Gm-Gg: AZFdTZfbChzwIH+RxUzrkIzg29llRv4s1FJ6/DjqETSNNtO/Ih8Bg9ms5AopH4+lKpg
	FE4xXM8VFeziM85EPvYnhwIdNrOvm/Ujwd0J1ts43IEcrLrEOzX+F48eM0/QoFVXeRZ1yboybmq
	Vdx21yT3qNujl8QYcuyiAsw4kbuQp+54qQLWgxw50HQo2YidYfVt981Js7GUrURn5J9jDDWsr0S
	Uy6mZNCwe+ShEaGMqcSkv269CQcgckYR2tV1/7kyCq++lTzy4d0ekGZncKVINy8lalFjE6Pv9XE
	3UvAmHqVATc2LJJvVtMVAWSvUjxWFkXi5UFCD+oSMy1P9l9tODm173eaPOv+goZuExT+NrAJdAN
	qZiARl7BcDydqfuNcUNxV4hQL9lACzxOICFvUD6gwNOkHb67lYFADO/nXQphROJNHjJWoJRLzKG
	xxUqOSFsAEg9u4dl5AHPOONPQYbhdopjq5vpuNmzX4baLb7x8R2o4Zoa3hiW3dbg7wzRhz9nC68
	1P3xARqoOMwvRANfOI7kpdfV987nB4Gkp4v00ldHk10nUsvDuEND1qzxzD72twQLKeLxkWoISvB
	he5jZ6wsBQW8cw55iLJ/3IY3488fgllNiL0OlVrc48ioEkrFa6q2SYJCbC/XtKorbtSJmc8TlMw
	wmVg=
X-Received: by 2002:a17:906:1b15:b0:c51:1e51:6e5a with SMTP id a640c23a62f3a-c513a5e2100mr1027788066b.15.1795542472028;
        Tue, 24 Nov 2026 09:47:52 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeabdcbsm538876066b.46.2026.11.24.09.47.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:47:51 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50cc7540b7so672339866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:47:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG8lyX4vqaQWkc4kiGgqWyKsvcNqGSc/QkCLh3RU1F04iGSyns0irrUdTBUI1qZprFU9zAFjPXOSIyBn44=@vger.kernel.org
X-Received: by 2002:a17:907:940a:b0:c50:94be:22ab with SMTP id
 a640c23a62f3a-c513a805245mr1446646966b.18.1795542470849; Tue, 24 Nov 2026
 09:47:50 -0800 (PST)
Received: from 425495914135 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 09:47:48 -0800
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
Date: Tue, 24 Nov 2026 09:47:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgvd5odMS8560FgZUnVLKmSwfBZRbX074S1a3xr02RBGQ@mail.gmail.com>
X-Gm-Features: Aa3M54qOt4-7HBDAcgu5xUlq8oQzhcFZHk2EabxzMar5L5v32hBVGAZZneRFhHM
Message-ID: <CAHk-=wgvd5odMS8560FgZUnVLKmSwfBZRbX074S1a3xr02RBGQ@mail.gmail.com>
Subject: [PATCH 7/7] sched/wait: remove the __add_wait_queue_*exclusive() helpers
To: Oleg Nesterov <oleg@redhat.com>
Cc: mt4022@columbia.edu, Jens Axboe <axboe@kernel.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Michal Nazarewicz <mina86@mina86.com>, Wen Yang <wen.yang@linux.dev>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 23 Nov 2026 17:04:33 -0800
Subject: [PATCH 7/7] sched/wait: remove the __add_wait_queue_*exclusive()
 helpers

Each has one or two special-case users.  Open-code them there: set
WQ_FLAG_EXCLUSIVE and queue the entry directly, with a note on why the
caller doesn't use add_wait_queue_exclusive().

I think all cases (eventpoll, orangefs and ubifs) are unnecessary and
could just use the regular ordering, but I'll leave that to those
maintainers to sort out.

Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>	# eventpoll
Cc: Christian Brauner <brauner@kernel.org>	# eventpoll
Cc: Jan Kara <jack@suse.cz>			# eventpoll
Cc: Mike Marshall <hubcap@omnibond.com>		# orangefs
Cc: Richard Weinberger <richard@nod.at>		# ubifs
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
---
 fs/eventpoll.c                |  7 +++++--
 fs/orangefs/orangefs-bufmap.c |  7 +++++--
 fs/ubifs/journal.c            |  4 +++-
 include/linux/wait.h          | 17 -----------------
 4 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 58c0cb845dc7..14095cd5f7cf 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -2351,8 +2351,11 @@ static int ep_poll(struct eventpoll *ep, struct
epoll_event __user *events,
 		 * important.
 		 */
 		eavail = ep_events_available(ep);
-		if (!eavail)
-			__add_wait_queue_exclusive(&ep->wq, &wait);
+		if (!eavail) {
+			/* Head, for LIFO wakeups; ep->lock serializes ep->wq */
+			wait.flags |= WQ_FLAG_EXCLUSIVE;
+			list_add(&wait.entry, &ep->wq.head);
+		}

 		spin_unlock_irq(&ep->lock);

diff --git a/fs/orangefs/orangefs-bufmap.c b/fs/orangefs/orangefs-bufmap.c
index 34195f2cd845..bc0abc050934 100644
--- a/fs/orangefs/orangefs-bufmap.c
+++ b/fs/orangefs/orangefs-bufmap.c
@@ -85,8 +85,11 @@ static int wait_for_free(struct slot_map *m)

 	do {
 		long n = left, t;
-		if (likely(list_empty(&wait.entry)))
-			__add_wait_queue_entry_tail_exclusive(&m->q, &wait);
+		if (likely(list_empty(&wait.entry))) {
+			/* m->q.lock is held */
+			wait.flags |= WQ_FLAG_EXCLUSIVE;
+			__add_wait_queue(&m->q, &wait);
+		}
 		set_current_state(TASK_INTERRUPTIBLE);

 		if (m->c > 0)
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 40a95a2fad50..a8a6c9b01b9b 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -303,7 +303,9 @@ static void __queue_and_wait(struct ubifs_info *c)
 {
 	DEFINE_WAIT(wait);

-	__add_wait_queue_entry_tail_exclusive(&c->reserve_space_wq, &wait);
+	/* c->reserve_space_wq.lock is held */
+	wait.flags |= WQ_FLAG_EXCLUSIVE;
+	__add_wait_queue(&c->reserve_space_wq, &wait);
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	spin_unlock(&c->reserve_space_wq.lock);

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 4f87ad870f51..bc2ad10a00b2 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -174,23 +174,6 @@ static inline void __add_wait_queue(struct
wait_queue_head *wq_head, struct wait
 	list_add_tail(&wq_entry->entry, &wq_head->head);
 }

-/*
- * Adds at the head, for epoll's LIFO wakeup of its epoll_wait()ers.
- */
-static inline void
-__add_wait_queue_exclusive(struct wait_queue_head *wq_head, struct
wait_queue_entry *wq_entry)
-{
-	wq_entry->flags |= WQ_FLAG_EXCLUSIVE;
-	list_add(&wq_entry->entry, &wq_head->head);
-}
-
-static inline void
-__add_wait_queue_entry_tail_exclusive(struct wait_queue_head
*wq_head, struct wait_queue_entry *wq_entry)
-{
-	wq_entry->flags |= WQ_FLAG_EXCLUSIVE;
-	__add_wait_queue(wq_head, wq_entry);
-}
-
 static inline void
 __remove_wait_queue(struct wait_queue_head *wq_head, struct
wait_queue_entry *wq_entry)
 {
-- 
2.56.0.313.g975a75ca90
