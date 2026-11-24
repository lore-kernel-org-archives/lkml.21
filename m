Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542247;
	b=tUCeaU0r5fyaqX+QQ64k5H7+d+deRbN+b8pIoc3kb219qKqprqjtc48l7hTtr8RijSCU
	 SYnP1Ws73f0OYECUHLgPSySau04UI/UGsvZ82G5tEPOLIMNhkFkyNUikB0sAgw3i5WSTX
	 4n+B4j9tfhqv/qapDx929rvr+MkRTFdtOf8kajDFjfh5ksuMCoLdpyTUBnKDvXAceUucV
	 MWw93P0qI5N2lahXNNvraCEoQWO7AmyMCV+K/BiZ+VI9K14S/HR87/21o3SzgTMB7Rn+o
	 y/M2VDgHVTIcHYB3VrInqaxkpRpb0drHwG9Zuy5t35SS2MEASzs3Jr2FqJCv84ZyWbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:Received:From:In-Reply-To:
	 References:MIME-Version:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=fii55Qp0r/wSrNaQI8sgZ2kAvYmw+Mf1Zswb+CP9NWA=;
	b=K33P7IFo7AkBzPdTnTrSrL22tD/avSTin6VhxfQmAD2VFnkeGBNpRVQh5/HQwHTKIbKg
	 /8PZ+Fx2ffAhHYlQxAMXtu7kEUQ9eNq0Z0jakM4QtCBmnACC6J2bOFcMR0NiyipNwSPfY
	 HBrCThVEWQh66DJGbMLkICE5NeQ9iYiKM7Orr+MVAKN29C2WEBvmiaz4bMFB4YMehvcLE
	 sGDHXpksU+YNv4/b+LNCgZwA63QuTtrQ64G4aQlGHajlt/UROebPWZX/p3ASs1diDBh/t
	 fXEquD/qCYYmD++ohVWcXxXO/gKTogAvzxt4asv9T8S9bb2/ai8DWHKWENetSIE0Wtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=QoGdHIe4;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2754606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2754606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=QoGdHIe4
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so7410612a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795542245; x=1796147045; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fii55Qp0r/wSrNaQI8sgZ2kAvYmw+Mf1Zswb+CP9NWA=;
        b=QoGdHIe4UatBmZtKdLpfzjwjX805G81mQQR+f1JhiElE72366HnWHbBL3FOt4k2L7F
         V3WujGxe231Z2NoHjkZu04BdfLH6nqNst6QF/4956LE1FVxMa0uHIbgXBB9z3EWHr1zS
         yqjbpY9uvFHxJNXKHtspPNUSz7tghaorFS7Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542245; x=1796147045;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fii55Qp0r/wSrNaQI8sgZ2kAvYmw+Mf1Zswb+CP9NWA=;
        b=DJGfukISy6Oj8a0bS8Lccz8OuC9+qf9Tv1UajyQQgkV33mXUhgeza+l5iNgSaB9l23
         pEBd+vVY79UR7RkONH/CBvBBRnJAxxddc7MR6h4XS31iN1KaxPxc9WKCOQCVZkdMHVXU
         drNqYB9ia6sIvhqQJ+NSHEOheUocDLYANR9H63p+BF/u5PVhSxYA5K4pirzfmeFJu1Jt
         KkMpz68XgVyfPvkZzfoqHXEJ7t1P2wYcEk2r643wwXIKbncXpkzq9Eo9n0Fs/NbZ+L4R
         uP6cInRjFK+aQqCNNrjy2XpKp9q4HJ4QRSa3E9PAdfwfQcjQ+sd6ktXUTNaN+DO6d11e
         CU5g==
X-Forwarded-Encrypted: i=1; AL+hErHs0EwS0FT5Crzqd+B738ZsxvPb4yD/2WeXPkqS6+fZ9cAfag3E3tPgycWmB43ObN9caEQPtcvq4pH1Ols=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lIKU80dDIBclmpECEOb1UA3bRMpk7/JaFLn5T2dUMnKpLZfnT
	AcHFeJTkbnRc121ahg7+N92tSWknST9V9NT0MDLqiqHLomezs4RIz0zPNBoYhFDwJ7q8XyXcY1j
	gKpwqz/FpOQ==
X-Gm-Gg: AZFdTZftuPCUDODVmTuSMbV4gHYR/juYIlzbJM7ys7hKLdUudFeREwS+jUF/aRaQoj6
	tand68se/ZhlX5G7xSp6FxX5sgs8Fn7PDYD6xJJeIMqfyrhiYNEzPwogeU1hOsnsw0NyUI2gFUe
	gdPvUEukPoJ9gWKskoeqEXAOiO+zxqQFRoIPgbQL566/Ee01FiE3Dn6LL9k1y/bvnuqzJQN2lqN
	oifZbehTNe58lBOFo9xObfgo2J7WpqrLV0SWWIxkBHkIPojn55w/Ii4h0+S5jc6SqrPvpgRtFG0
	sPoAlhECmfDsEHGR2+gF9q+zcdkwE+PIhmag6zc5Crf3xaiFTqwvF4mS2OAoH+1VZCKWRHdXxUg
	zcMf+2qkIRHAai/M4Bl298qnvNRZH5mc9i2S9uR9UtQW599Mzu8oy6Djekaze/HtXw02s4/feeR
	RD59c7OzizfYf4fDHcbJmtGTkZ66r5t/CnApvPp1FscoYdzj+9omUf3vuqOUbJBdlhyZTz7SBcA
	I1VddE8YzsWrRB9ZRVQFQAYgmlM5h0MJVdLDfH4HLg5m934Gw/dzje1pMxyo8naRF1wybaWApN5
	1Hqzvm13IDGjiQeHl32EyVcANmYHL0828yZSItSnDstht1RgHhcTeddyY3I61kx7OzPcnK+weLa
	zwXE=
X-Received: by 2002:a17:906:1689:b0:c33:ae8b:817d with SMTP id a640c23a62f3a-c513ab2a087mr1058836666b.46.1795542245231;
        Tue, 24 Nov 2026 09:44:05 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm540010366b.57.2026.11.24.09.44.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:44:05 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c513a854320so791032666b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:44:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE6hsN2gnQMODl3DjajyMqx7K6lls0zpx2sh7fnLIx+f1LoseUZ1yzbXdGKR2LwxJ++NCnXI2pksvwr5qk=@vger.kernel.org
X-Received: by 2002:a17:906:9542:b0:c46:a607:6922 with SMTP id
 a640c23a62f3a-c513a99e9e0mr1021358666b.25.1795542244185; Tue, 24 Nov 2026
 09:44:04 -0800 (PST)
Received: from 425495914135 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 09:44:03 -0800
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
Date: Tue, 24 Nov 2026 09:44:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjbK0xyhwvWP1uNiYR6i-X9MpCn8bnm_akxq0MsrYOL+w@mail.gmail.com>
X-Gm-Features: Aa3M54odmpZClWB-dkdI0tw2OKY7MtCfPchrg_x_N52YZyjOYf8rYgnJ38U7qkc
Message-ID: <CAHk-=wjbK0xyhwvWP1uNiYR6i-X9MpCn8bnm_akxq0MsrYOL+w@mail.gmail.com>
Subject: [PATCH 2/7] sched/wait: add WQ_FLAG_POLL_EXCLUSIVE for user space waiters
To: Oleg Nesterov <oleg@redhat.com>
Cc: mt4022@columbia.edu, Jens Axboe <axboe@kernel.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Michal Nazarewicz <mina86@mina86.com>, Wen Yang <wen.yang@linux.dev>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 23 Nov 2026 16:47:33 -0800
Subject: [PATCH 2/7] sched/wait: add WQ_FLAG_POLL_EXCLUSIVE for user space
 waiters

An exclusive waiter whose wake function returns a positive return value
to indicate that it has successfully been woken up stops the wakeup
walk, on the understanding that it will handle the event.

However, user space consumers - like eventpoll or io_uring - want to be
woken up, and want to avoid the thundering herd issue.  So they used an
exclusive wait - but without any actual guarantee that they will then
meaningfully handle the event.

So the wakeup could be lost, and real waiters would be left pending.

Add a separate flag for these kind of "exclusive poll" cases, which is
effectively what these user space waiters are.  Only the first such
entry that accepts a wakeup is woken, as now, but they don't count
against nr_exclusive and it doesn't stop the walk.

Wake-all (nr_exclusive == 0, including POLLFREE) still calls every entry.

Reported-by: Mani Tofigh <mt4022@columbia.edu>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
---
 include/linux/wait.h |  1 +
 kernel/sched/wait.c  | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index b3e94c71cd3e..09518f8ff10c 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -21,6 +21,7 @@ int default_wake_function(struct wait_queue_entry
*wq_entry, unsigned mode, int
 #define WQ_FLAG_CUSTOM		0x04
 #define WQ_FLAG_DONE		0x08
 #define WQ_FLAG_PRIORITY	0x10
+#define WQ_FLAG_POLL_EXCLUSIVE	0x20

 /*
  * A single wait-queue entry structure:
diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index f8d6d8b9d03e..9f126cc5c338 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -85,6 +85,11 @@ EXPORT_SYMBOL(remove_wait_queue);
  * may be at the head of the list, and can consume the event without any other
  * tasks being woken if it's also an exclusive task.
  *
+ * An exclusive waiter that returns >0 promises to handle the event. Pollers
+ * (EPOLLEXCLUSIVE) can't promise that, since userspace may never consume it.
+ * They use WQ_FLAG_POLL_EXCLUSIVE instead: only one of them is woken, but they
+ * never count against nr_exclusive or stop the walk.
+ *
  * There are circumstances in which we can try to wake a task which has already
  * started to run but is not in state TASK_RUNNING. try_to_wake_up() returns
  * zero in this (rare) case, and we handle it by continuing to scan the queue.
@@ -93,6 +98,7 @@ static int __wake_up_common(struct wait_queue_head
*wq_head, unsigned int mode,
 			int nr_exclusive, int wake_flags, void *key)
 {
 	wait_queue_entry_t *curr, *next;
+	bool poll_woken = false;

 	lockdep_assert_held(&wq_head->lock);

@@ -105,10 +111,16 @@ static int __wake_up_common(struct
wait_queue_head *wq_head, unsigned int mode,
 		unsigned flags = curr->flags;
 		int ret;

+		if ((flags & WQ_FLAG_POLL_EXCLUSIVE) && poll_woken)
+			continue;
 		ret = curr->func(curr, mode, wake_flags, key);
 		if (ret < 0)
 			break;
-		if (ret && (flags & WQ_FLAG_EXCLUSIVE) && !--nr_exclusive)
+		if (!ret)
+			continue;
+		if (flags & WQ_FLAG_POLL_EXCLUSIVE)
+			poll_woken = nr_exclusive > 0;
+		else if ((flags & WQ_FLAG_EXCLUSIVE) && !--nr_exclusive)
 			break;
 	}

-- 
2.56.0.313.g975a75ca90
