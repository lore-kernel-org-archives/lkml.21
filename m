Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022863;
	b=qE92bxyXaEAUdPFQvL9hAY6fIAyaT+8jSQ2bNUAWiqP2oLh5umUgaq8DkEHzdmVkh4mA
	 ouPjptXlzNMOUrBnQvVhD26aoiH2URZU0snzGm6nRCgV4c+xg4k4FMjyklFZzIiY6II7e
	 AVRAy36lBPZ1qeJ5a6R66/EvLw3CfhEOkE9lbvaA+O7YOHSf9ihVWC1RoLTaiFar3EH39
	 aEMKKPEkCEyBquOaI8AY9RbSywYn+8Fu6ImFYfYRsWdbvocYhKxk2gvB2GG4hL8rpfhaN
	 GxHu7DAY6TyhsQvQdKeAsPLxCzLz4qakEz4gEwp0v7aQA/+UVRbRNvgwIf6/Y8RgX4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:Received:From:In-Reply-To:
	 References:MIME-Version:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=rRrf3KcQFrCLRq5t5mKhDUjcnT08CBiE+i3+0nrJuh0=;
	b=TuBTb4JMPLwKLxI5FWseehRjBf31lQ5LboytRDN95gJdPXjRVV1vx0ss0Pt4RPCFE8+Y
	 qzTQT3+/b6FLbumOjQEbqxC0gaw2v3zR1QUrh6cwvHsZAMEQ73cz+uEphM/QSqKGq55U9
	 J8i/NLqq8oVfNALANe2GAAIF1zEZ4YZbrbJMjffyK258M4Ottg98E9DL+iKF9RFcmGW8u
	 qkuhxr2+EHpykUPF86IharbgEDibw3IsU8x3dB/0nEW+2yJV1OVCjVzVCiyUoIpxx3mSA
	 QTglncrYV5ZbtCOVEEv1CccHA9IpOWwXlQshr5h0t87BrN1teP6oS5lTXVLFDqoKP8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hcQBcxfx;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEDB606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DEDB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hcQBcxfx
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c445c95d553so180785866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795022861; x=1795627661; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRrf3KcQFrCLRq5t5mKhDUjcnT08CBiE+i3+0nrJuh0=;
        b=hcQBcxfx1OKjBqbFnxWCQKmDdylZYHC5MoIB4dd1RUV0ucGyi7jX0oM94AOL3JkAa1
         0IEAkjUSFHkwvTS2IxV0/6NYrFfiThuLnPM8NXVZAW6ehh3xOX9MUVPylSAPtIiXode/
         gaTAt8W0wP8B034pwy2WysNvMn2VVucQMZApk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022861; x=1795627661;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRrf3KcQFrCLRq5t5mKhDUjcnT08CBiE+i3+0nrJuh0=;
        b=25RwNFSKwQ0xvg9Y82HFOHSQcCtsAwqjLZDZ5rcgg+tucu8jIVetXtob/BXXD8s9Dd
         xNdKcRRDBQMdUrqiKJNW2rGlKIGu/x/cTD8HsevrP977L8usadYqmSbCmLzUNON4IRte
         Uy97YWunSqjGl36KLyL2S0c5taRbT0bMAxMvE/A8rV8nQr9vPRqQ0VyEXDEz6Ozefsy5
         0HaVU69oBrI/fQXzYoTQ2c/xqarf0cAk1Poj9ivEM/FJCSqhlG8QAw9X6T7N4xjyafNm
         aYdez3RQTjW14VAJxhyz7nwhx79qrYEmjlDmLAk3cGD6zQ8VZd229IOb4xJwk/jeQKpO
         W+wA==
X-Forwarded-Encrypted: i=1; AL+hErEbZnLWyzRTZPUTBJpqLk4PV9kQAOWnYl6t8rSee9brnSX9hRTDGfDRfiTDqSQfLEJV6NJrF2zDdViUpms=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FWNmDnsAji+2c4qKXnnngj7Awz7sjmmc4eQ39tXkbGFebTEC9
	qHkTQiC5JjATWL+GMc4D7GsGAAhCPVKtCAkBkJlDRu1fnpZQ/F5EQ3iKxSOMykfEl4T4q0uLmce
	Xn98QKLjlyA==
X-Gm-Gg: AYBFou0I4wGrXu6WJFiYyLlxIz93qY9iUjdv8GpJbuHsOQCiUonLK51PAnL9upGOExS
	gIRelmA6386DoDklqvvw9Gjdt2HdeP9136hJPxOjbNAf7WoX03KsfO4seYIUW62jpdJ+ltOtNSp
	+QgtgaT65yYj5ixGtvfBGo9TNX2r8KTBubdFlZ2zCtZ7vjsmLkg3HFXzUFxjONwLvgEBSma6P9K
	nmqxH9dK9KI7yC13YPVHc8zVzb10pGz+afPdAf0Oad7nTBP/ddC+EMY47crO5tSC07SK9NcdnE2
	Tqiw3fMdbyYw+WXTvJyeY4UanPGoaaP/bX8rpuF+VVNWGMgkM+9Dd0bXntj9ftehRkjr4ml2jPc
	nv082CcXrcQIesZ49kBNvgtnmKZ099V//ixhci4FoWEbDrR1c9M1jbE8X2ZrBp4S6aLJ72Z4h0Y
	tCeRxi7jdg5+43MO9aqdMJbZb+W1LdcOc3YhHJEjh33Xozr+QozxdgvLej57wvckf66i6r1XpoQ
	dhETzPfh7/MGvCnQxTjrHDGaIlz9mAMcQVXole5yTXn8VpIYEi/kkL72F6fz53CFHidsVY9ZbGp
	cLIzaDHEZ2Y5Ltw5B+U//GUvbcNyRP8JXGv9cI1YtmCIWU6MH1bPFI1A+ZMXftX7p+OXxkOXfSH
	gA3grGuJrDDTvaVjObz1dZ2Ng
X-Received: by 2002:a17:907:9488:b0:c2e:40a0:7978 with SMTP id a640c23a62f3a-c510e22a329mr308578166b.9.1795022860852;
        Wed, 18 Nov 2026 09:27:40 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a22f098sm1376081a12.35.2026.11.18.09.27.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 09:27:40 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d28f75d62so213323266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:27:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHqyy/xLk74gLC7SE80BISzmqvoDMWHyAdVywW9ALd8oOKvpl8idDmzSEzEJvzy995PeOYwXnI2yvDskLc=@vger.kernel.org
X-Received: by 2002:a17:907:6d1f:b0:c46:8b87:c1f4 with SMTP id
 a640c23a62f3a-c510e2d4ee1mr308959066b.20.1795022860207; Wed, 18 Nov 2026
 09:27:40 -0800 (PST)
Received: from 425495914135 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Nov 2026 11:27:38 -0600
From: Linus Torvalds <torvalds@linux-foundation.org>
In-Reply-To: <CAHk-=wg+MO19H7KVgA+SaZvvt5O+3Tp8AxHVhpN23JtaSq=G4g@mail.gmail.com>
References: <fb224bad9baf5f44cf17e1d664776a4e@kernel.org> <CAHk-=wg4jAWZvxWo0OZ+fFTU=SBtQ7dnsUCV7hx+UAifkwPUwQ@mail.gmail.com>
 <avs4uWg9ch-Bqobj@slm.duckdns.org> <CAHk-=wg+MO19H7KVgA+SaZvvt5O+3Tp8AxHVhpN23JtaSq=G4g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 11:27:38 -0600
X-Gmail-Original-Message-ID: <CAHk-=wjm3vbiNYsR+aHxmM3KCEgsSWb379ZQbCuZEsN1dhvbKg@mail.gmail.com>
X-Gm-Features: AclHuK9l1x40DSLpNq-I7HaYL6AQJrAYmZ1Ozr1ZbK6LtbeABCuMZDcK7IhnVs0
Message-ID: <CAHk-=wjm3vbiNYsR+aHxmM3KCEgsSWb379ZQbCuZEsN1dhvbKg@mail.gmail.com>
Subject: Re: [GIT PULL] workqueue: Fixes for v7.4-rc2
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 09:29, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But I'll freely admit that I really only looked at the "shape" of the
> code, and it all felt wrong to me. This was not some deep-dive
> understanding, it was a "this doesn't feel right".

I think your original patch worked, and the memory barriers were what I
really ended up hating.  But that's solvable by just doing the counter
inside the pool lock instead.

And that means that my suggestion of using the generic seqcount code was
barking up the wrong tree too: I reacted to the ad-hoc memory barriers
and the fact that you used a sequence counter, not to the actual code
and problem.

And then the drain_workqueue() logic can just be changed a bit: after
draining, go back and do kind of what you used to do, except don't look
at just whether the pwq is empty, but also at whether new work was
started?

A *UNTESTED* patch like this, in other words...

              Linus

---

 kernel/workqueue.c | 47 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index af845214e78b..31d376656504 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -281,6 +281,7 @@ struct pool_workqueue {
 	int			total_in_flight; /* L: sum of nr_in_flight[] */
 	int			nr_in_flight[WORK_NR_COLORS];
 						/* L: nr of in_flight works */
+	unsigned long		nr_started;	/* L: see drain_workqueue() */
 	struct list_head	flush_node;	/* FN: node on wq_flush_pnode->pwqs */
 	bool			plugged;	/* L: execution suspended */

@@ -3455,6 +3456,7 @@ __acquires(&pool->lock)
 	 */
 	set_work_pool_and_clear_pending(work, pool->id, pool_offq_flags(pool));

+	pwq->nr_started++;
 	pwq->stats[PWQ_STAT_STARTED]++;

 	rcu_read_lock();
@@ -4449,6 +4451,29 @@ void __flush_workqueue(struct workqueue_struct *wq)
 }
 EXPORT_SYMBOL(__flush_workqueue);

+/* 0 if any pwq is busy, otherwise 2 * sum of nr_started + 1 */
+static unsigned long pwqs_nr_started(struct workqueue_struct *wq)
+{
+	struct pool_workqueue *pwq;
+	unsigned long sum = 0;
+
+	lockdep_assert_held(&wq->mutex);
+
+	for_each_pwq(pwq, wq) {
+		bool empty;
+
+		raw_spin_lock_irq(&pwq->pool->lock);
+		empty = pwq_is_empty(pwq);
+		sum += pwq->nr_started;
+		raw_spin_unlock_irq(&pwq->pool->lock);
+
+		if (!empty)
+			return 0;
+	}
+
+	return 2 * sum + 1;
+}
+
 /**
  * drain_workqueue - drain a workqueue
  * @wq: workqueue to drain
@@ -4462,8 +4487,8 @@ EXPORT_SYMBOL(__flush_workqueue);
  */
 void drain_workqueue(struct workqueue_struct *wq)
 {
+	unsigned long started;
 	unsigned int flush_cnt = 0;
-	struct pool_workqueue *pwq;

 	/*
 	 * __queue_work() needs to test whether there are drainers, is much
@@ -4479,16 +4504,16 @@ void drain_workqueue(struct workqueue_struct *wq)

 	mutex_lock(&wq->mutex);

-	for_each_pwq(pwq, wq) {
-		bool drained;
-
-		raw_spin_lock_irq(&pwq->pool->lock);
-		drained = pwq_is_empty(pwq);
-		raw_spin_unlock_irq(&pwq->pool->lock);
-
-		if (drained)
-			continue;
-
+	/*
+	 * A pass isn't atomic across pwqs, so a chained work item can land on
+	 * a pwq it already found empty. Anything slipping past the second pass
+	 * needs a work item that was in flight at its pwq's first check, or
+	 * that started between its pwq's two checks. The first makes the first
+	 * pass fail, the second changes nr_started. wq->mutex keeps the set of
+	 * pwqs stable across both passes.
+	 */
+	started = pwqs_nr_started(wq);
+	if (!started || pwqs_nr_started(wq) != started) {
 		if (++flush_cnt == 10 ||
 		    (flush_cnt % 100 == 0 && flush_cnt <= 1000))
 			pr_warn("workqueue %s: %s() isn't complete after %u tries\n",
