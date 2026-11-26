Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697088;
	b=yB18gsSIPPj313wsvT2F+k8bV7ySYO2Daqo5rREcY6Xceez5OV0qbUpB+oRTAVro59ED
	 1L2WE3poiq7XgW4U1X3QETDm+53RqHHu1Yu2GkPzSNmwVRZ7mImeOzFvXSJRmUsw0X6sE
	 nqlvyVyXJ+FeH/dDTgsNHlHfYGjwMC3GrhBquZjCJD3VMw/9NWRKmV6RdEMbGLhTpGfwI
	 hL62yQY1tP5kO4zWxkdcNEDlXa+rYk7woYAxFEWWPTKTA3L8LjRynkxO8FbQEdcJz6NSf
	 qi7USKDfMpErYmyQXAB5jFMwNMCNL2qgjs8VC4yiYQtJK9h2ezcfcD4lp3KOUa25k9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697088;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=zGFVQnHOQzvc+hzruuCjHNAnpfckKwhZI0qrz6gEZ/o=;
	b=FWVl/GGaQxaNrRqAslGR6YiNH1A6dqyUfS8Ae3y/g1NIOtxPd5ZoxpqaBh5HONiOtd32
	 JKmOKQOTev9S6s5VfuqO054CzvRmH4CiKvRsIoZKmOz3z3icBoJVPhkuTE8z3pY0u7b0U
	 srgHrkjib1p3DP/gqP3CkADyJ8CsqgrqOSvtdaJ5eTSrI56jQ28ib+cdDwAufjZ9ZJErF
	 o1ztoJPr5K9OXAJ87keD/lLyG/Su820dJRdHkPOJdMop8Y58sB62RATs38Q1oY8yEtazW
	 ODOvfvuzmGfocBJxof2SUCqgaaQi9d3IBiMaACEy8Bc0WlvX5odLx9uNyCYjJKxJSBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=X617KScC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=b6ECwmh9;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FE5606A688;
	Thu, 26 Nov 2026 12:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99FE5606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=X617KScC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=b6ECwmh9
Date: Thu, 26 Nov 2026 12:44:44 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795697085;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zGFVQnHOQzvc+hzruuCjHNAnpfckKwhZI0qrz6gEZ/o=;
	b=X617KScC1kx1i5KdKqHmG6JA/M0Ludz8qJGDemSoC9XHrbPmBQKW53mnx/x2SN6GOtHdxa
	USJenSReRzfe7i9heHQwxwzSCEIlu6Pu8w6wtFT2aah7Gb1wN4r1QiZn5xmRK8cN4G5CNr
	pd2GdZn9je0Llor+v86YHY+s254nednHiw0D7NeiBjt984gFGDSYOjotJ+ov5U7MBtT9+m
	1HsvRof8q1b0A6qbn+dggWhlpDz291roeRrOa3Aob5eKBJrwu2c8T0aE0PqWlPzTUdTtHW
	emwelRPRBrEMtDWEsgTXQGOGFV8cPzISiIRbrHIiQ9Zx5cnoUSXipRZSlf61Kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795697085;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zGFVQnHOQzvc+hzruuCjHNAnpfckKwhZI0qrz6gEZ/o=;
	b=b6ECwmh9lc0Mh+b071o3Yx8kFzU1KWfQEWqjswJdIpqVI1ywzDK1CeHttuAW+WytfdkxuH
	pf2T+D3Uqs+7Q7Aw==
From: "tip-bot2 for Tengda Wu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf: Prevent duplicate sigtrap task work enqueue
Cc: Tengda Wu <wutengda@huaweicloud.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C45bd71c976aea1a0e8bf5762dd6b6552e6009439=2E1795053?=
 =?utf-8?q?619=2Egit=2Ewutengda=40huaweicloud=2Ecom=3E?=
References: =?utf-8?q?=3C45bd71c976aea1a0e8bf5762dd6b6552e6009439=2E17950536?=
 =?utf-8?q?19=2Egit=2Ewutengda=40huaweicloud=2Ecom=3E?=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179569708404.92412.12602035824384208346.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     e4c5112f01816b0ac6d74724545eca1195788c38
Gitweb:        https://git.kernel.org/tip/e4c5112f01816b0ac6d74724545eca11957=
88c38
Author:        Tengda Wu <wutengda@huaweicloud.com>
AuthorDate:    Thu, 19 Nov 2026 09:51:00=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 26 Nov 2026 13:41:02 +01:00

perf: Prevent duplicate sigtrap task work enqueue

The sigtrap handling in __perf_event_overflow() checks
event->pending_work before calling task_work_add(), but only sets
pending_work after the task work has been queued.

This leaves a window where an NMI can interrupt task_work_add() and
re-enter __perf_event_overflow() for the same (software/tracepoint)
event. Since pending_work is still zero, the nested invocation can
enqueue the same pending_task again.

The re-entrant call path looks like this:

  __perf_event_overflow()
    task_work_add()
      <NMI>
        __perf_event_overflow()
          task_work_add()

The nested invocation may enqueue pending_task before the outer
invocation does. When the outer invocation resumes, it inserts the
same task work entry again, potentially creating a cycle in the task
work list.

As a result, perf_pending_task() may be executed repeatedly, leading
to unbalanced event reference counting.

Fix this by atomically claiming pending_work with cmpxchg_local()
before calling task_work_add(). This ensures that only one invocation
can enqueue the task work, even when another overflow occurs
re-entrantly from an NMI.

Notably: sigtrap events must be per-task, meaning that the there is no
concurrency, only re-entrancy.

[peterz: clarify and rewrite]
Fixes: c5d93d23a260 ("perf: Enqueue SIGTRAP always via task_work.")
Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/45bd71c976aea1a0e8bf5762dd6b6552e6009439.17950=
53619.git.wutengda@huaweicloud.com
---
 kernel/events/core.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index ee51134..5925752 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7776,9 +7776,15 @@ static void perf_pending_task(struct callback_head *he=
ad)
 	rctx =3D perf_swevent_get_recursion_context();
=20
 	if (event->pending_work) {
-		event->pending_work =3D 0;
 		perf_sigtrap(event);
 		local_dec(&event->ctx->nr_no_switch_fast);
+		/*
+		 * event->pending_work also acts as a 'lock' for
+		 * event->{pending_addr, orig_type, attr.sig_data}. As such we
+		 * must clear after perf_sigtrap is complete.
+		 */
+		barrier();
+		event->pending_work =3D 0;
 	}
 	put_event(event);
=20
@@ -10953,16 +10959,22 @@ static int __perf_event_overflow(struct perf_event =
*event,
=20
 		notify_mode =3D in_nmi() ? TWA_NMI_CURRENT : TWA_RESUME;
=20
-		if (!event->pending_work &&
-		    !task_work_add(current, &event->pending_task, notify_mode)) {
-			event->pending_work =3D pending_id;
-			local_inc(&event->ctx->nr_no_switch_fast);
-			WARN_ON_ONCE(!atomic_long_inc_not_zero(&event->refcount));
-
-			event->pending_addr =3D 0;
-			if (valid_sample && (data->sample_flags & PERF_SAMPLE_ADDR))
-				event->pending_addr =3D data->addr;
-
+		/*
+		 * Software events can nest and attempt this recursively;
+		 * claim the pending_work before task_work_add() recurses.
+		 */
+		if (cmpxchg_local(&event->pending_work, 0, 1) =3D=3D 0) {
+			if (!task_work_add(current, &event->pending_task, notify_mode)) {
+				event->pending_work =3D pending_id;
+				local_inc(&event->ctx->nr_no_switch_fast);
+				WARN_ON_ONCE(!atomic_long_inc_not_zero(&event->refcount));
+
+				event->pending_addr =3D 0;
+				if (valid_sample && (data->sample_flags & PERF_SAMPLE_ADDR))
+					event->pending_addr =3D data->addr;
+			} else {
+				event->pending_work =3D 0;
+			}
 		} else if (event->attr.exclude_kernel && valid_sample) {
 			/*
 			 * Should not be able to return to user space without
