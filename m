Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542292;
	b=pdOQOK5Jdvw/+7gnjIEE/jP5ykQQxUC8D4CA9NMIiz9TVuvVtJTWSrpEh2PWhPHsKgBv
	 TwB0Gi24dzXy8wB5Z/3aJq5Kwajt2QVf8TJXlZHrM2iqey9W26XWFJm8FmPjLlenrKrKv
	 FmazK/x+GvD7vqHM/55Sl1pApLR9K56rbZf9dQXHB1MI7Ukjk1/LLznIoqpBv/sZgZmkY
	 R2Q0oIc4BlddL7yU82n+lRA+Adi6tQ1lKXqLmmii4c6Woce4h5Nt/fdSzv/2nsM0cUOmv
	 4mYjsp63BxcPEgVZ++X0vbExeZ+boaK7aRq0TisAuL1g0NCqGb46AwxxL1qSurVnJpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:Received:From:In-Reply-To:
	 References:MIME-Version:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=2HCzERZkMAa0F+phOseLjeAuQPdJvhT7TUINZgfRKgs=;
	b=slZkM3YzEwBaNyLGYGxvGeycLYVc0i++GZevHQ1N3DqrTmxbiWcjGItB16n3+txN9A1p
	 tnDSLLwF6zczySkmOnO7D0tPb0MQso89jKWvzYrn5MoA0SLiogSrTPMaUJrgzHXF5CRqJ
	 45ivUJEEnGGLBeBIH5zFwgETECbeB0PKX4jnO+O7oUXv4WxF7DzaAXJ/g/M/2e9q7Fptl
	 VpyHis1SgDPIMCtO9pTFPayfm+ImIPfyHfzhq80xgYGz7evlzMlPRRqSTSQ8gv2A/usWo
	 n8+SvceR+8e7jrlp/KAVfdrTeA3+RXrpEHha6ly5O/C6CZ6hPvtpnW0SiNbQ4mRqVzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b="IZhM/TMb";
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C753606A689
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C753606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=IZhM/TMb
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4322d310e7so247680366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795542291; x=1796147091; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HCzERZkMAa0F+phOseLjeAuQPdJvhT7TUINZgfRKgs=;
        b=IZhM/TMbBrx04M70LV3izrgp8hVCC+ZMLBw1F0bKoOlQImyVB4ZPCJxoDbb309Mmpl
         reVstEocjWIoXbLpV654gk52zCtlvC5GLmQM4g6A40OmtS6K8XMZi5UybTaCPDy4JCpM
         GshK6couuCBQnPNg/rpXGJ2jL38XcjCem7We8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542291; x=1796147091;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HCzERZkMAa0F+phOseLjeAuQPdJvhT7TUINZgfRKgs=;
        b=F56e34AezU+mFPtviwlPN3ZTudkG5PHkCRQRnTnapddxloAoaCQfdODTvy9eoNnoOH
         vXkUf7aFWoO+zQEKY2rVPBF6psy2xmaWBXLwAyy9F92xN9hZd+wmSJAVBwKCA6I4FOlv
         lbCLPia+T0Bb1fjHbUij1keVZwvXe90A+FRwPtZSSnvy5ym/ZztfsYKMXlZ2yaHakOAS
         GN+wwt6is++tAW8DCuL3SCq+xLQYzic2IVhPWfRdudugw7YkJRDJc1Vx+M1nq6BOPa9v
         D4GW6mIYUlOozTs9QVAuLCBMJgiHsk/7VeaVVh2nl8DJye5+Ojg4Tv1IRK5fiJehqPA2
         xHSw==
X-Forwarded-Encrypted: i=1; AL+hErGVrGGA6oAkEv2WdCxD133ZRNGxAAWavG48vIyK8W5w0fBSPl/Y4lTRg+flzLGBfSyhocTcLS3GYvXBB6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ckj5msWEyT2UbgvVX+KsqwKyfFbKaD2f7zsYJW1q2SrFDefg8
	k5tRs2Xym+tykb9rWwmZmIAnJDRNF1SjfEwZqr1CvTIGptd7YY7dL4H5AmfooZ3rxU+EnoPxVNQ
	Ubi9/c1PH/Q==
X-Gm-Gg: AZFdTZfKCZUaidi5WO83wsueiwvFwaunDuKaRoIdSK0azSiFLzHg4cbaZo/uku9paQg
	n5hI0Pr2xdVUlEez5DjWZi99riPJDOnQWb27M4a9K2mhV6kRXkKxw53oydTUDb26MX2mcAB8UzS
	s0O7+ihzY4/B+E4uRMhsnipSaDFGStC9+VKQ0KA3pwhRuP9r4J6h6Fd+9w4x4n1prpaL7htMKD/
	ihBI5s2krMK8BvP/h3/lnj20Akx/FJkPsy0j0FA8AteVbY6wZeWqu/AxTp46RX0Lhaen6kMycz1
	XsH47lRxaaiK/u6DX4kaZkXl4Pc7bgIscWo/gyG77lw1OHemjaI1kfot/1rC/pDQ3fp/zEMluPS
	w1sNX3JjAEQ9NkXQ2aXzHJsTK8ZEqpWJaxBB3OL1gwEWFfkDmfwGa5AOKS8seQ01JWGHomDl4Tw
	dpQibFZH8vvUh4hCwcPLE4xiiWsT8SVUzPLfVu/yNOI2xg55RjcbVrCjjct24YSy9AqJAZXJy8r
	kHV72su3WN1uVGMx5LFSBzTf0ROqAU9VOxkqEcaJLicyHqnAbzLIIcDvE/1u6FxHBf+nil9IazZ
	LBjG0ObneoUaV1hj88JZ+Ia8hwawuHCVAr0tl7G0cP2teHa2UoSIfChCIQub2o7dxMbqFcMABHI
	ERdU=
X-Received: by 2002:a17:907:70c3:b0:c33:923b:ad51 with SMTP id a640c23a62f3a-c513acafa78mr899248766b.45.1795542290792;
        Tue, 24 Nov 2026 09:44:50 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8dc60sm536061166b.34.2026.11.24.09.44.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:44:49 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c516a574bffso438397766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:44:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEGS1wTCAZkL2Vm/Z8fdT4e36NUTXwZxOymcttiQnT6pMvCyYeDUDzD7oqn2n/Zj8rGLzfWjFG+qesJfF8=@vger.kernel.org
X-Received: by 2002:a17:907:1b1a:b0:c50:52b4:eb04 with SMTP id
 a640c23a62f3a-c513a99a675mr1260566266b.16.1795542289327; Tue, 24 Nov 2026
 09:44:49 -0800 (PST)
Received: from 425495914135 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 09:44:47 -0800
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
Date: Tue, 24 Nov 2026 09:44:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgFnKO_O0fR_-O+i5yUGaDcz8_HwpM5QiLM4jPFYZb41Q@mail.gmail.com>
X-Gm-Features: Aa3M54rd4YHKjjCXWO7x8sJ23KYai1r8AxY-MCEz3hLxMYxQyxvdzJ6olX7Oaf4
Message-ID: <CAHk-=wgFnKO_O0fR_-O+i5yUGaDcz8_HwpM5QiLM4jPFYZb41Q@mail.gmail.com>
Subject: [PATCH 3/7] eventpoll: don't claim real exclusivity for EPOLLEXCLUSIVE
To: Oleg Nesterov <oleg@redhat.com>
Cc: mt4022@columbia.edu, Jens Axboe <axboe@kernel.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Michal Nazarewicz <mina86@mina86.com>, Wen Yang <wen.yang@linux.dev>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 23 Nov 2026 16:47:42 -0800
Subject: [PATCH 3/7] eventpoll: don't claim real exclusivity for
 EPOLLEXCLUSIVE

An EPOLLEXCLUSIVE entry that wakes an epoll_wait()er returns 1, and
because it was queued as an exclusive waiter that stops the wakeup walk.

But nothing makes the epoll user consume the event: it may be killed,
time out, pick another ready fd, or just not read.  Anything queued
behind the entry - a blocked pipe reader, an accept()er, a recv()er -
then sleeps with the event pending.

Queue it with WQ_FLAG_POLL_EXCLUSIVE instead: still only one epoll
instance is woken per wakeup, but real waiters are not skipped.

Reported-by: Mani Tofigh <mt4022@columbia.edu>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
---
 fs/eventpoll.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index b959af04772c..58c0cb845dc7 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -1626,9 +1626,8 @@ static void ep_ptable_queue_proc(struct file
*file, wait_queue_head_t *whead,
 	pwq->whead = whead;
 	pwq->base = epi;
 	if (epi->event.events & EPOLLEXCLUSIVE)
-		add_wait_queue_exclusive(whead, &pwq->wait);
-	else
-		add_wait_queue(whead, &pwq->wait);
+		pwq->wait.flags |= WQ_FLAG_POLL_EXCLUSIVE;
+	add_wait_queue(whead, &pwq->wait);
 	pwq->next = epi->pwqlist;
 	epi->pwqlist = pwq;
 }
-- 
2.56.0.313.g975a75ca90
