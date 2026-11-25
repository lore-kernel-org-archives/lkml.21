Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604849;
	b=a/cv6zSPrNf8eAJYCc1tgH+6F5YyuK1QQc8IBL/UgF2IgH+j/rO+V5cvt2XmAuXbYfhc
	 Iyo+Igoc3Y3hC+AHr+mImAIS6OyeAa1/pSrcUGAYEnDGxpVLV8tM5X+2wat1Uy9riBxN3
	 0rkc0DvwMzY5kI2T+6kcZ1tgg/oQNLkgXL0prsfvby6j6DZqLb2OmCEOihktqsSL2pCww
	 o+mfiMzW52mkTaPkBF2SjcfQIHeTA8s1tL00mfVOKq4ggTAPoxn41NqXzyo0xcbWcvWXl
	 A/6qWzd8voz/GWk+UiOTGY2XZXThFc1e9YUcWDmgmcyobDaf3iMm+F63orpkDZEc7zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Dhj/6IC/S9UakA2XJuOoikLp4Ldc+YWWX4fLcWh8PR0=;
	b=UHrOxetbrsOZB5UKzZcTBxmZBPQnM7YlEayk5jIGf15NdivkfTsNoc6U7vvV6HXdDQ+m
	 XiegaW3w5mQBAtQ1xoPF973n1cc+IqfqgnSpAPNCynVLc2c7iHVW/Gx7Qx7PgOBTsGGpH
	 gRVQ84ddiescXMW2JuEHsEhXfFKlzibY8lkqzM1utY+J0+N4vZpFBlVauIk9+YLhc8yiw
	 zCavwpfJCYv3LfGyWnqhmc7u0XW4toBoUZ7yYJXD0tJbg4g3+PiNGV9SetK2UD5hp9FE7
	 SlNzLEANv2WABJsghQ1dpoARvFm3DMuzSDvGDT4pKFRTISjU2cOUsHukbCS5JV8STbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yoy71sll;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03E0606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F03E0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yoy71sll
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b9fde3044dso40105055e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795604847; x=1796209647; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dhj/6IC/S9UakA2XJuOoikLp4Ldc+YWWX4fLcWh8PR0=;
        b=Yoy71sllDNZaNwqzFQ6Ypu5ALpZDwCi6jKJGx88WNxbpmB1csaYPTY0pEMRpX2T6Ep
         ToPsEp35AVbf9Q11s9RFrfNqN87CJTFvIAefnuoilZwevvgAMCzV1IOk1yScQo5cuQ5O
         MpCNhrM3u1PDAk/mlgJb3XSn1BU1Eq7vEgohy5Lnn1ZIJJvFRMVc9yeLC2ojbyqsj6Bb
         MhKH+B4g+dv9Pvb1ympH6+UUaZnE6lYhR59FMc0M9hASp45AskEMcwM/icYyizRj0kRU
         HXu0fdWhBJsXrnYIlU3ArCebgr+kbP9BIoD5IhAUl0aUhbkj10q8y1ghMjdY/iadenhp
         AgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604847; x=1796209647;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dhj/6IC/S9UakA2XJuOoikLp4Ldc+YWWX4fLcWh8PR0=;
        b=foHxkb/szFLYaxUQNjnI84DuIkQNk+ZgXZ4+WRiBmcPMNeRyJDt1xBsBFpgGPUS2so
         FgJK1ypyUnW8hXAiAsd7e9LhRVATDOYBQtR1SDqPTf2gBzObKkoqSp/d8riibCnJmjX4
         4tcwpUvH0DIpJ1MCPo1aMVxzUPt79LM/E3kQaakn4kc1YseqDqllrTL+4tbSK56ejLcn
         MIaTuFwFacNWcNYXmhqwyr14mnm3JiYmBqN6dAE5wK+8KLmUe+7mUG3SJg23GpdGtHRl
         d0jNrD6gcv3BzYrVKFdYM8v5PzaywiqGrmFDtjZX5pZXcTqlvitl4++EbrGe5aV9IWTP
         XLCg==
X-Forwarded-Encrypted: i=1; AL+hErE3R78uPXW+MnqVUYge/jpkOd9s6nr8zXMo41hJvV7HtL3TqyMdYGYCLDTxY7B29OyAqFYt5nKg1gj5Tes=@vger.kernel.org
X-Gm-Message-State: APuU4Z9p9gdum0pR5AgtDLADPEkIhZwC9ETcX9LPxlZNkdyVHjwaRa+e
	l0Wc4IszhcgWCMJ5oG2YzVQmsuBYwXBiSWEmv0sI1keXAcOFFYoJ+Wf2GNMoFc7jtLBZRm0Akz0
	rQSmFzVPUWRkhvQ==
X-Received: from wmjy5.prod.google.com ([2002:a7b:cd85:0:b0:4bb:6476:9406])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e8e:b0:4ba:59fa:510e with SMTP id 5b1f17b1804b1-4bb8893014dmr358786765e9.23.1795604846985;
 Wed, 25 Nov 2026 03:07:26 -0800 (PST)
Date: Wed, 25 Nov 2026 11:07:26 +0000
In-Reply-To: <d0843faaef949300df9b51a09e36a696@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123170846.3165648-1-jpiecuch@google.com> <20261123170846.3165648-2-jpiecuch@google.com>
 <d0843faaef949300df9b51a09e36a696@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125110637.211132-1-jpiecuch@google.com>
Subject: Re: [PATCH 1/3] sched_ext: Fix ops_state and ops.dequeue() locking
 races in dispatch
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, fangqiurong <fangqiurong@kylinos.cn>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tejun,

On Wed, 25 Nov 2026 00:18, Tejun Heo wrote:
> On Mon, Nov 23, 2026 at 05:10:32PM +0000, Kuba Piecuch wrote:
>> @@ -1871,8 +1884,10 @@ static void scx_dispatch_enqueue(struct scx_sched *sch, struct rq *rq,
>>
>>  		if (unlikely(dsq->id == SCX_DSQ_INVALID)) {
>>  			scx_error(sch, "attempting to dispatch to a destroyed dsq");
>> -			/* fall back to the global dsq */
>>  			raw_spin_unlock(&dsq->lock);
>> +			if (rq != task_rq(p))
>> +				return false;
>> +			/* fall back to the global dsq */
>>  			dsq = find_global_dsq(sch, task_cpu(p));
>>  			raw_spin_lock(&dsq->lock);
>
> I don't think the task needs to go to the global DSQ here. The scheduler
> is being ejected at this point and bypass is going to cycle all its
> runnable tasks. Maybe we can just let go of the task and return, for both
> the local and remote cases, and let the abort path recover it? What the
> BPF scheduler sees after scx_error() doesn't matter as long as the
> scheduler can be ejected and all the tasks are recovered. That'd get rid
> of the bool return and the retry in finish_dispatch().

Good point. Every caller that can pass a user DSQ here (direct_dispatch(),
finish_dispatch(), and move_task_between_dsqs()) has @p on its rq's
runnable_list and can't run on an rq that scx_bypass() has already walked,
so clearing ops_state (when SCX_ENQ_CLEAR_OPSS is set) and returning after
scx_error() leaves @p to be recovered by bypass just like
SCX_EXIT_ERROR_REENQ. Will change this in v2.

> Also, can you please factor out release_dispatching_and_lock_task_rq()
> from dispatch_to_local_dsq() in a separate prep patch?

Sure, will split that out into a prep patch in v2.

Thanks!
