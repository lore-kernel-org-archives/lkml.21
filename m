Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697085;
	b=ep8Lvk+7YxOf8WxdG76Mnj5R9lzqJXrbCJehB2V2aBBPgr8BW1yuzXqODZUZsFN7349O
	 RXKlUZoiGhjc2DBpW+vpSkQEIk9poATVBbDJRhgF6jo6Q9zwRWN/yXDQqFINhxwQMvYj+
	 VX1SMGz7E/4utvgL5ZJaMUPrJdcokn+5nod8+VjCg06EdYiJd6xGHNBLHDZ+5I1rKpk3a
	 WmEGQFX0AeB4TaZv4/gbU8BtSXe97nDFoj7kv00AC4iy0gOwe9cP2ei1yfQjBSzBGi+mA
	 NppPxsFuoJfdEdHoXIor3rMqJ9auZEyvsVD3LF5ZJNIXNHf2nr2QqswGFFYs5hCKEow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697085;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=K3EE7OdRlXqV5XNTHYxNaTfkpb5wONS7aT+/3FdRIw0=;
	b=Ho/jR7Czsei8PUCK1CYarSqENYa05NVhwFJs8c/I3Tj2h0JNWC38ugdH7KikEn738RG9
	 jvQQNKjUR8XO0yCgKM9fR6YdQa/1m7KmGopzZK9nvfaOBOcQiVCEkp9mToJEKMkd8qH2J
	 Mx8U49WWRZQJogibAsGTAPKfwBP58SvCRjdvMEfTDsHzC90ioqWDAOHdaLbek/tzRPezl
	 wjz2+pq/84s+MeF/um4zKK4zm4kPT0qH2GSsZAwwGLpITM0+3f438AGikJYYBp0JFPn1a
	 lAMPotP+TFOaMziBHbzoQpAWWrvMUrYmcu6VXBxhaVPp3O/bknfCkz4N0BAf4tyxz/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Jnfum1UW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=J9eX5KO+;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40DE606A326;
	Thu, 26 Nov 2026 12:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A40DE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Jnfum1UW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=J9eX5KO+
Date: Thu, 26 Nov 2026 12:44:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795697082;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3EE7OdRlXqV5XNTHYxNaTfkpb5wONS7aT+/3FdRIw0=;
	b=Jnfum1UWQ5mVmhz8l+91Lbe4hqEY7lHpz7zZW0GIB1cKgKilyTPHbn99lXbTtC+nD6EcbB
	ntiy/LqvEJVWReUkmbSnogGaMzvwrRSIIo1dPVUhUsD2ANMw1UEXvbgTg16KHfhGVyB5aR
	EFs25dw/FDYu2N7zQheIqH/ydItfJAyoTcG1yTzgMVTxdRog0LjDddU3XDi1/uMLlsj9jR
	TkmRHTeU8uIBo89ZgxvA/QJGpOaEVOYqRqBRdvg0G8INhOBNtIbA4rOOOOSNllxqrhqIB7
	FzSc4bhMrXc4jUZd3KJWTmBC1yv96NgyxUGb5To0AbjsyGVP3qqrprKpoGeE4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795697082;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3EE7OdRlXqV5XNTHYxNaTfkpb5wONS7aT+/3FdRIw0=;
	b=J9eX5KO+jO4jzUwjc/TdUiF4fjTKhg6zncwBQsk8h7le6ZsDJO2ACtfvJ8uBkvxFvHsCAb
	VQ2hlgV5DOolCbCQ==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf: Fix sigtrap vs fast-switch
Cc: Tengda Wu <wutengda@huaweicloud.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261125161342.GP2669272@noisy.programming.kicks-ass.net>
References: <20261125161342.GP2669272@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179569708042.92412.17777095770950546772.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     34dc983cc1628dea5054baa8687477cbb8683e28
Gitweb:        https://git.kernel.org/tip/34dc983cc1628dea5054baa8687477cbb86=
83e28
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Thu, 19 Nov 2026 09:51:01=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 26 Nov 2026 13:41:02 +01:00

perf: Fix sigtrap vs fast-switch

perf_sigtrap() contains:

	WARN_ON_ONCE(event->ctx->task !=3D current)

The warning assumes that an event's ctx->task always matches the task
that ends up running the pending task_work. That assumption can be
broken by the context fast-swap path.

The failure sequence is:

  1. A -> B switch, perf_event_context_sched_out() takes the fast path
     and does WRITE_ONCE(ctx->task, next) / WRITE_ONCE(next_ctx->task, task).
     An NMI then hits while the context is swapped, and
     __perf_event_overflow() queues pending task_work on the *current*
     task (A), even though the event now belongs to B's swapped-in
     context view.

  2. B -> A switch. Because A now has pending task_work,
     nr_no_switch_fast is non-zero, so the slow path is taken and
     ctx->task is *not* swapped back.

  3. A returns to user mode, task_work runs perf_pending_task() ->
     perf_sigtrap(), and event->ctx->task no longer equals current,
     tripping the WARN_ON_ONCE().

Therefore; the task_work_add() should in fact use event->ctx->task, rather th=
an
current. They are always the same, except in this narrow window between
perf_event_task_sched_out() and switch_to().

Fixes: c5d93d23a260 ("perf: Enqueue SIGTRAP always via task_work.")
Reported-by: Tengda Wu <wutengda@huaweicloud.com>
Tested-by: Tengda Wu <wutengda@huaweicloud.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20261125161342.GP2669272%40noisy.programming.k=
icks-ass.net
---
 kernel/events/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 10dc3d0..08f0e0f 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -10970,7 +10970,7 @@ static int __perf_event_overflow(struct perf_event *e=
vent,
 		 * claim the pending_work before task_work_add() recurses.
 		 */
 		if (cmpxchg_local(&event->pending_work, 0, 1) =3D=3D 0) {
-			if (!task_work_add(current, &event->pending_task, notify_mode)) {
+			if (!task_work_add(event->ctx->task, &event->pending_task, notify_mode)) {
 				event->pending_work =3D pending_id;
 				local_inc(&event->ctx->nr_no_switch_fast);
 				WARN_ON_ONCE(!atomic_long_inc_not_zero(&event->refcount));
