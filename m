Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697086;
	b=aEnW2KGhCyC18cO559RGXmeFDI4N6EW+BIOmYsM4wYZ263zBBS0YJ+wmukwX1N3e4FLA
	 lDfLgZumS7O+ZV/zoyFoCfDTtOLpiyPKv/UjiKhcMn8tr1kKzMBXeMmg7Zp8j59a5jMW5
	 rn4qGSRIttcT97v52cfRRTI/wiyB1PODuhzJ+vQwGknYj1Nt4bJQu8OXFcx9+XjBEwp3G
	 +1hxTFeEhg5wjWM+4SM/V71eDAOnh7+ySWdkwL1ghzey56Bis6ELJKNfSs47/WdOXjKVM
	 keNA9kpN9BwYWpB3JZOOKqNj/aUN36yTB6Z5Zu1NECENBfG2Cl6bAf+g1HyJ4mT51eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697086;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=8mO51TsfI2U0Bh4v2XWnBguBuwkKmowbwJmYoBmR6ww=;
	b=weMiATxDV16dqz8vhE6k44cliW6/7XbSQWK9pMz1ajMdlFZUwFW8EKkZnDl947oRxgWL
	 /vvE4WqoYkdlOPzGo9UIF9nhD18D/SP80LwGBhZWbhVnzR3SY5TcuSTS2wXlAkN0ti1eZ
	 mup5/xxlYGDQQoJiy4ZgKLJ9V0RRC8dNqu/ksITUk06KACQwTSKehm+hzLZLKccrpsAgd
	 Nk2rLYLzMAIX4rZX6BJhcac46+kjQgp8K4iN8KdrKsyWGHvDCO1V4LTzSS52A3liohbA4
	 TOsmiKlHomK8T434L58USI+Td+23Q7PmtITkuj8oujEH208VWp8GYYL7F9aZU1vTbKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BI0TRirI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=HZPxQ18O;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0E6606A333;
	Thu, 26 Nov 2026 12:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D0E6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BI0TRirI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=HZPxQ18O
Date: Thu, 26 Nov 2026 12:44:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795697084;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mO51TsfI2U0Bh4v2XWnBguBuwkKmowbwJmYoBmR6ww=;
	b=BI0TRirIQtS15bC3IB1w00eiw3OqKyLEf3Zi1bBShVZUgnKesPr2uyPcOXZK2NikG+IDt7
	ESxw99rNYqdK0emb/Ynido+UeuLfsgT61F/Pt8kh6clRAEOKxn1orAcRCWpOVuILphZqoD
	cYum3ci9dqR//y1OuXyc6qAAfUhkkV4hfoJL+DjzS4HVdGKI3b+HeSs4MIkEqY6D3RVJ/c
	VJbkdOQAJiGpPIOn16Yo/usXwQ6jQh1kMlZ62QeuH1vu3f5kElFk1i9gyFGUKyECXshSXr
	LIprnpIoAsiUybD4pnbNv/gZLqLLu/C7q7IjMYnTCB55x5/fBs9LCudR9CFsUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795697084;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mO51TsfI2U0Bh4v2XWnBguBuwkKmowbwJmYoBmR6ww=;
	b=HZPxQ18OeBS/2MTSuK2prv1k/Too5uOm4FiMKoxDnlGO2/t17JdEQYnlvON//VxgZVKnyH
	8SPHbzElKrFsVeAQ==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf: Fix sigtrap for software events
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
Message-ID: <179569708222.92412.6120983029734387085.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     38606d2911f7f2fe80388315da0c4a7fc98af0f8
Gitweb:        https://git.kernel.org/tip/38606d2911f7f2fe80388315da0c4a7fc98=
af0f8
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Thu, 19 Nov 2026 09:51:01=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 26 Nov 2026 13:41:02 +01:00

perf: Fix sigtrap for software events

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

The nr_no_switch_fast bits hard rely on perf_pmu_disable() actually working. =
It
turns out the software events do not implement the pmu::pmu_{dis,en}able()
methods and generally ignore the state, making the above scenario worse in th=
at
an overflow can happen in the middle of swapping task contexts, making it
impossible to reconstruct state.

Ensure software and tracepoint events respect the disable state.

Fixes: ca6c21327c6a ("perf: Fix missing SIGTRAPs")
Fixes: c5d93d23a260 ("perf: Enqueue SIGTRAP always via task_work.")
Reported-by: Tengda Wu <wutengda@huaweicloud.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Tengda Wu <wutengda@huaweicloud.com>
Link: https://patch.msgid.link/20261125161342.GP2669272%40noisy.programming.k=
icks-ass.net
---
 include/linux/perf_event.h |  1 +
 kernel/events/core.c       | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index e1e1150..b52348e 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1236,6 +1236,7 @@ extern const struct perf_event_attr *perf_event_attrs(s=
truct perf_event *event);
 extern void perf_event_print_debug(void);
 extern void perf_pmu_disable(struct pmu *pmu);
 extern void perf_pmu_enable(struct pmu *pmu);
+extern bool perf_pmu_enabled(struct pmu *pmu);
 extern void perf_sched_cb_dec(struct pmu *pmu);
 extern void perf_sched_cb_inc(struct pmu *pmu);
 extern int perf_event_task_disable(void);
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 5925752..10dc3d0 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1366,6 +1366,12 @@ void perf_pmu_enable(struct pmu *pmu)
 		pmu->pmu_enable(pmu);
 }
=20
+bool perf_pmu_enabled(struct pmu *pmu)
+{
+	int *count =3D &this_cpc(pmu)->pmu_disable_count;
+	return *count =3D=3D 0;
+}
+
 static void perf_assert_pmu_disabled(struct pmu *pmu)
 {
 	int *count =3D &this_cpc(pmu)->pmu_disable_count;
@@ -11159,6 +11165,9 @@ static int perf_swevent_match(struct perf_event *even=
t,
 				u32 event_id,
 				struct pt_regs *regs)
 {
+	if (!perf_pmu_enabled(event->pmu))
+		return 0;
+
 	if (event->attr.type !=3D type)
 		return 0;
=20
@@ -11537,6 +11546,9 @@ static int perf_tp_event_match(struct perf_event *eve=
nt,
 				struct perf_raw_record *raw,
 				struct pt_regs *regs)
 {
+	if (!perf_pmu_enabled(event->pmu))
+		return 0;
+
 	if (event->hw.state & PERF_HES_STOPPED)
 		return 0;
 	/*
