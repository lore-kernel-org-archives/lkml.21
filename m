Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542333;
	b=1PjGJLM8DV49/wqcmDgXKfnBKMhQ8AnNN8oxZWG+Lme6hF1vKDCstHPxu6nEw+kHXhMe
	 EbcUKm4tv31U+KENz5tQhJVU+oDsZj/bJHIZUN/bn4S5bB0cxzhRD7JQKsw+Lsiekue8Z
	 B7DJVDQqkrZv3VNUCL75Zr+XJO1xct75g1SuRtqictxXlmnnlr+ppbhe6Lju2QsX7yzfd
	 XDokvGcfQAoexHQLAJsKr5fhvMASxvEkwfzjwwowZ+uCVIdiUxxBazmw9rXEmIkaby2lb
	 wMDGGzS1oEbYkHmreoS+XWuz790mdW8Y/rqDAQEmgIDTT5F5OrdCYCAyEXwVqeoT1qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:Received:From:In-Reply-To:
	 References:MIME-Version:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=7sFNtdXtUVrhtQGHwvVnwDY+EIdv3UfxXRXkR9SVa5w=;
	b=FLNo/fCC5vsx1IM1DZPe4calidOJABJtNSCjDwAIjtl0A/oSz80F6Mq5oQLV+YbUDPxv
	 bE5hNpSwyGDNUqp09AR2nQqNr/2aVweX+IWWHw87KGAheX9kLkPByxfxqaSbaCTUGDbZs
	 mtBmBKhvFfiQI5fpLmEuGF/+ijPR3XyfK0FOmLzxhMB06OtRpU1UuzeQGTqZyD8N96rtF
	 yaqO6AHGBGOPNhJAjUkVIKSqMTeeWt9ow8bTUI52UaYOEw8guo7Hpb8xCyQG+p++JFD89
	 O+V+NAvb2rjiQ6IB1suOgCNrdzUhq5FbNOILOnXX9FPGsj49MvnJkX51CFzHBS3o09g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=IhfsLKPy;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1C8606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A1C8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=IhfsLKPy
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c51a02ad3acso73808166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795542330; x=1796147130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7sFNtdXtUVrhtQGHwvVnwDY+EIdv3UfxXRXkR9SVa5w=;
        b=IhfsLKPyLfWFSpe1MZWNzuAcFb8ep2OZ6MYTNZnitSMBzM80Pk53GLhonK12/JZai0
         z3/rcVzZ1ybVKdRnjE+dDg4zSLbmavwCGTLLLyCwbn5xWUtRMIVvTG2MmsO73mAivb1L
         sGa16hogFOyNybrilpzWo5uHOetciX9hGQ4ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542330; x=1796147130;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7sFNtdXtUVrhtQGHwvVnwDY+EIdv3UfxXRXkR9SVa5w=;
        b=ibkAqN3FxDhWbJ4A0apL4tFdOWz7Lg7Ic1pxzVGcNvmgpc5WD3mAo8BGbnE4CUKHzg
         lUP/T9uoM6AVPiPypUz6220J2a1ZOYyp2gGr7w/20yAtP5jfqO+eczHBCH9vLvYXEXOB
         dPUYU11ATiWItPYntIGDxmv3lBDtKbd0dYhvFMThtV6MGkSpceCzpdOVZ2fCUKYlU3Uh
         jQfbKgPI0BV4bzDHvQIF6Q828uZUo8QBjB1tds/0fS3Z05QbinsVr07R0yg8K1vwKU20
         lU6/gJE5FnWBBfrg/GWBwVhNu6QWBAEWVDrD2yI+AhgDUA0Qj4B6v0PinHroCuMCNByS
         4HGQ==
X-Forwarded-Encrypted: i=1; AL+hErHryJP6HmeJwH1s0iPuRpGwJv/F/3vbTecHfFI6INKv8zqjuDCidfsWXHIa9uGKdNFOiVvDxkiSmZjaEz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k2URLLFYc5+dBIIQp+NbuT/U6DoZ9zM2gNAO22YBaQYwg2LpN
	OBIG4CqV1CoMelf0VvvhfGy4Eh84Nf6+lEQ2Y5gcWNdtVe5pdVkAXIoijUwlJWXON7R1kPrnngG
	/qBquokbprA==
X-Gm-Gg: AZFdTZdmjKkkCfT53lEggjoUvJR7Xv8Ag+u6mEFQufFnmLxjJqyRBZiGDuYxzPL0zRt
	c3g/Ob7048KfkhdMiSGoGeIV/PZ2bG0t+GRTKeV7vAZkqX018o1GNUYTaRPJH2k4995bRmkSpc8
	tVZip8pv/kRtMUoQMV2v2t66MT+l1Ib7NWwWvCRGBYqymTF6q1kneKzQ99yPe2rWQ5trV8Pk8Fx
	Gu/h6dRjW1FiM0XGbMx1vFeAe8kMWbsS8rcOAaVmz0Hd3JXTo9zKae4OMCUvuCvm1D/huGFaC9I
	FXhmj3pNPe1Uqj9AADePSOlIALWsUD5tyqZ9bH/gJSffy3qlOf5cI7n8dwG9XVLoYVOnCHsgZf2
	WSyxuhy9VPNXs0cqrLfnDBpLtDU2vl+5bPHKhbQ9pGrGiKOgyfDqhDp5oXRwn5fg1X+5O8DrDLt
	KI8xztdkyYBt9e3rEsDQySoD4sKpXwE6XseAVUuhjG22XZwin0d4O3cLOjFMEtHoa2lnAOy58qQ
	E2jKRPUCPVC4b8zwMtKFrmU3JJdWMVU3IdktCWqqHQuoMVt2uhUNENnAOra/ukusBwSWfhJwuJl
	66Gtc5OGXiGBlSeF53SU3HkL65kL4b0TzO7u0pvtasdqabFeB8eJiaYlLx9hBa5+b20bmo8i2+j
	4ETc=
X-Received: by 2002:a17:906:1e04:b0:c3f:d912:ff8e with SMTP id a640c23a62f3a-c513a5ec26dmr1055510066b.16.1795542330435;
        Tue, 24 Nov 2026 09:45:30 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea8063sm542507366b.45.2026.11.24.09.45.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:45:30 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c51a02ad3acso73803866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:45:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEd1kUjfyQn0w4NpoD/QWpuxdG4WxCwsPaYXwp6tp4KMMZOrOFO9G+eVKpfPwbajtN8a2P0VZNj28iUGsA=@vger.kernel.org
X-Received: by 2002:a17:906:9c84:b0:c44:16ad:c31d with SMTP id
 a640c23a62f3a-c513a3a720fmr1358605566b.4.1795542329456; Tue, 24 Nov 2026
 09:45:29 -0800 (PST)
Received: from 425495914135 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 09:45:28 -0800
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
Date: Tue, 24 Nov 2026 09:45:28 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjjX0gjwbjbaRcyBciMoBW+EcfR+WVFDcc8GohhoCEhsg@mail.gmail.com>
X-Gm-Features: Aa3M54onNu843dCz-7VgQMSf3tc5HuV22MlsVxwl3bnIWp1HcMu2BRrmba8qoGU
Message-ID: <CAHk-=wjjX0gjwbjbaRcyBciMoBW+EcfR+WVFDcc8GohhoCEhsg@mail.gmail.com>
Subject: [PATCH 4/7] io_uring/poll: don't claim real exclusivity for EPOLLEXCLUSIVE
To: Oleg Nesterov <oleg@redhat.com>
Cc: mt4022@columbia.edu, Jens Axboe <axboe@kernel.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Michal Nazarewicz <mina86@mina86.com>, Wen Yang <wen.yang@linux.dev>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 23 Nov 2026 16:47:49 -0800
Subject: [PATCH 4/7] io_uring/poll: don't claim real exclusivity for
 EPOLLEXCLUSIVE

Same problem as epoll: an EPOLLEXCLUSIVE poll request returns 1 from
io_poll_wake() (even when it lost the ownership race and does nothing),
which stops the wakeup walk, but posting a CQE doesn't consume the
event.

Waiters queued behind it can sleep with the event pending.

Use WQ_FLAG_POLL_EXCLUSIVE, so only one io_uring entry is woken but real
waiters are not skipped.

Reported-by: Mani Tofigh <mt4022@columbia.edu>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
---
 io_uring/poll.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/io_uring/poll.c b/io_uring/poll.c
index fc1800c7097b..67bf39575238 100644
--- a/io_uring/poll.c
+++ b/io_uring/poll.c
@@ -533,11 +533,9 @@ static void __io_queue_proc(struct io_poll *poll,
struct io_poll_table *pt,
 	poll->head = head;
 	poll->wait.private = (void *) wqe_private;

-	if (poll->events & EPOLLEXCLUSIVE) {
-		add_wait_queue_exclusive(head, &poll->wait);
-	} else {
-		add_wait_queue(head, &poll->wait);
-	}
+	if (poll->events & EPOLLEXCLUSIVE)
+		poll->wait.flags |= WQ_FLAG_POLL_EXCLUSIVE;
+	add_wait_queue(head, &poll->wait);
 }

 static void io_poll_queue_proc(struct file *file, struct wait_queue_head *head,
-- 
2.56.0.313.g975a75ca90
