Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787334;
	b=5KjtubCFV33ySBsMKmH9Uqybvs9I+bAvAluyVmQg1f/Zy6xYjZNu4ayfMFzeIxCS5vAJ
	 QTPap4i6mqoK0s7/36H/AZVjOgD//Tqx5hnjii1uZ+Dys1t42ThQzf2kGbjEtcplYFSTr
	 8cdwzqUpAseL7aWCWoJjUyCq9/g2DowOntYz5SVSFopbpbO0x3O37eYGiNyFHDQGk0EFw
	 XGBD3opwUQsqeXzJ5BtfX6fXlqqiCeVTEFfxHybXZQSlt1wKWnjcf9DiZZmx/ruOZeua6
	 wtg7xVbJEIiRUwQ2nbPh55oEMQ7N/6cipZ3Qb8HUcwSBVxgwVgsSaBP8IH6pylOThxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787334;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=chWFFd+vD0y9/nhQZ34fFbbmxFzOzG9ZqIiZq4Y9r7s=;
	b=VGh8vB+IOGJ/OzShBqT28lHeQy5oRGMnIaESo78JNl6Vxy5I/7GGKyMhM0aNNsJrjTo5
	 b4NcviUEAmm/U+VjXQ6hL9zGspiUIc8Pw2i6s9gZLSjL4Ayp0SX+ncbuHGS3HGcQZDj38
	 e+WpsmLfKIYfm6uFnhlM6N6Q8zJjAldKykgOO/2c/MjtZf9SKl0EAxpLPB7g1iQi4J1Qs
	 oPBDsWY4fj/Tz7JrVJgcWvhZFc6zb0ytgvISCZ/KOX5h142nCe3DkNQacyl0ZC7K7oRvF
	 rs4srszmy5uTyu26st2h+oCKqGZdq+xw2RvtM9K9m1ST82TI2TpCSBmhRpgddOt12Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=ga7hLuHl;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E37606A692
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75E37606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=ga7hLuHl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1795787327;
	bh=chWFFd+vD0y9/nhQZ34fFbbmxFzOzG9ZqIiZq4Y9r7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ga7hLuHl9hsckytxeCy/RcQeH7IXkB28Qvk7B3aAjfcpMrcF0qNmr8rYu8tJJwhQH
	 d3hkgyNrIcL+2/Os7QxaX6h2gHh1gEfnhWjchObysyu8yIdjgJaS0ou305cLoeG/AP
	 gkKGQt/ZAoZpsJ24XIcLbkFCcopaPyJEWJagIQYfunQztgaMoMjb38bQDznWASooiN
	 VXUqPMeKzwEjsssTwrq8bw+i544v5iZNZFBCvKy/GYX1kpG/dfi2zI1cVjENKam8H8
	 AZ3R9OJdB4J+b6pJ02y8HjCHKvUnnrpXVRfURbIR7/LIKS4cD44amS2P4E6rVXii6a
	 a5wmEMG0PoVEQ==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jbZWg45R0zXPC;
	Fri, 27 Nov 2026 08:48:47 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 37/43] sched/deadline: Keep the debt of a task across a change of parameters
Date: Fri, 27 Nov 2026 08:48:40 -0500
Message-ID: <20261127134846.114774-12-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-234632@kernel.org>
References: <33e066447added164bbf6c39e0e4de022d7ecc7e.1795646914.git.mathieu.desnoyers@efficios.com> <sashiko-outbox-234632@kernel.org>
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

> Should dl_in_constrained_gap() check that dl_se->deadline is non-zero
> first, as dl_proxy_block() does?

Yes, in the first dl_period after boot. v12 will test for a deadline of
0 in dl_in_constrained_gap().

> Does dl_drop_boost_out() fit the period with different rules from the
> ones switched_from_dl() just used to arm inactive_timer?

Yes. In v12, dl_drop_boost_out() will call dl_setattr_place() with run
= false, as dl_zerolag_period() does. Out of the class, the task does
not go on in its job, and is not throttled. The inactive timer and the
period then agree.

> When a throttled constrained-deadline task leaves SCHED_DEADLINE, can
> replenishing it here in dl_task_timer() cause inactive_task_timer() to
> hold its bandwidth for an extra period?

Yes, and it errs on the safe side: see my reply on patch 26.

> Does testing (flags & ENQUEUE_CLASS) here run update_dl_entity() on a
> period that dl_setattr_period() has already fitted?

It can, but the debt lost is below about 2us. dl_entity_overflow()
truncates each factor to a multiple of 1024ns. A false overflow needs
a debt smaller than that error. v12 will leave it as it is.

> What happens if a sleeping task with a new constrained deadline wakes up
> before *deadline?

It is enqueued unthrottled with no runtime, and runs until the next
tick. The comment above dl_setattr_place() says that its wakeup
throttles it: that is wrong in v11. In v12, the enqueue will throttle
such a task until its next period (see my reply on patch 31). The
comment is then right.

> When a boosted task's bandwidth is reduced before any donor refill, does
> deferring the fit until deboost or refill repay the debt at the old
> bandwidth instead of the new one?

Yes for the first part. Until the deboost or the first refill, the
time since the change counts at the old bandwidth. The cover lists
this with the known limits. Its entry says: "a change of a boosted task
applies at its deboost, or at the refill that holds the boost".

The second part is not a problem. After a change back to the old
parameters, the fit goes from the old parameters to the same ones, so
it changes nothing.

> If a sleeping task has dl_non_contending set and sched_setattr() changes
> its period without changing dl_bw, can the old inactive_timer fire too
> early if the task then leaves SCHED_DEADLINE?

Yes. v12 will re-arm the inactive timer in __setparam_dl() after such
a change.

> Does zeroing or clamping dl_se->own_runtime before calling
> dl_setattr_place() corrupt the debt calculation?

Yes. In v12, the fit will get the runtime left even past the deadline.
Only an overrun is still saved as 0, since it comes from the boost.
Without a fit, the runtime left past the deadline is still dropped, as
before.

Thanks,

Mathieu
