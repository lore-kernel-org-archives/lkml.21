Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427740;
	b=MqTrWNihTR/LTW9/GpyQTiSieytCAveNiihsqDjgcO3Mjt4Ylflx3ZFmQ+hbdnOL0S+u
	 1eZvoEflJs287Ci1N2HGKbVGCTeNHuDAHp6CDyhkGiwRQBbKDLDLCCjGE9GMtbDmuubOC
	 YfmUPGG0J6QCUC48hj2AGlYZrQd9e36SHjVJBgyQhUoNfIuRr7qbMyEKCqCRZnTk6Kxo4
	 vTYXoO20xVxdyCT4dn1NjIKjh2vMNdV6Ngnhjv87XY6FaANTfuk5Xq8AUTG5xKVoq3VdD
	 RgVAMXAl3SlFT43kSL99UWQSd8N+7Wh5T2o5e8rlJdi1c4uwPCafqTWRxm6BVL+wg5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427740;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=8iR8eZjq+ITJI+3ZgUVvAbOsPm/AOq+IfCArO9x+3ZM=;
	b=UAqrH3JbTiIVFDjwmrR9Xn7m99EyAHky4GaWx65a5TiZAMSH1fUt8TQz9EiuanF/+oY3
	 6PuhQIdis9v7sAIe/SF9d0pKgxxNsxIVO6EIa3bAhnKVwGienjDPxr99/VbBPH0inekop
	 eaLg152ImphPprYdzN7ffEPc9oBYNQ3xCRIdAvXgUWdR1M2kyxUnmA/gMYgGrI5qLdT85
	 DACg4MH7LGLIOsHRAzp4vEa6GCHjnLJmKJlOHcAuJry+l6AXImigyGKg+gqaPIlUDvkzm
	 IxBdO6tE0u3ZgBSz57qx1ePqXdFai3cNgv5mNEe9U/1cV2Bk++MDFcjDF3WC5jvEkIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="LHQrf/9c";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OYwTCfQy;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FDD606A327;
	Mon, 23 Nov 2026 09:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63FDD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LHQrf/9c;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OYwTCfQy
Date: Mon, 23 Nov 2026 09:55:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795427738;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8iR8eZjq+ITJI+3ZgUVvAbOsPm/AOq+IfCArO9x+3ZM=;
	b=LHQrf/9cLk3LiICngxMfl8yqpA0hEWq5ltC2c4BTVJ0Jl8m8qnaNp1yLhaCsXG3/ruQ/nJ
	f49cZzDJRj1HrIqpPKrbVj5CEbaVKMOzYNHhzTPQc/fDvJizsVC23LtvV/E0se/SXsDNQw
	RG+0aQu66nzG3n1Gh/yX4orgkuA4gGS94huW4SZU4fALzg27InMMSeXvKD/GAdVmIOeA8u
	jNiJoTJwylomk1jiK73Gs0iH7HPo4FZJCf+SFIY6xMclmIt5fV3rJZxHn4k/dANziNJ4+K
	PcjHvv7rcBfgYup6LCoiNECsnekqISIaIdvp6D5QiAKCD2V8lZDSwz8fXUm25w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795427738;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8iR8eZjq+ITJI+3ZgUVvAbOsPm/AOq+IfCArO9x+3ZM=;
	b=OYwTCfQyfwDvQXWCsSgoe2IhG1Ph52wlV4EXiBgrqYaEhGi6Mm+uxqjXBFBxD8b6QVAubT
	txh8mKMZUKYSrRBg==
From: "tip-bot2 for Fernand Sieber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/core: Rank DL server picks as deadline in the
 core-wide pick
Cc: Fernand Sieber <sieberf@amazon.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261112161548.78189-4-sieberf@amazon.com>
References: <20261112161548.78189-4-sieberf@amazon.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179542773720.92412.4774760214632371644.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     87a825f3c680474eeb5c2a28398ad625bb69319e
Gitweb:        https://git.kernel.org/tip/87a825f3c680474eeb5c2a28398ad625bb6=
9319e
Author:        Fernand Sieber <sieberf@amazon.com>
AuthorDate:    Thu, 12 Nov 2026 18:15:46 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 23 Nov 2026 10:45:41 +01:00

sched/core: Rank DL server picks as deadline in the core-wide pick

Commit 4b26cfdd3956 ("sched/core: Fix priority checking for DL server
picks") made the core-wide selection rank a task picked through a DL
server as deadline, so that a fair task competing with RT tasks under
core scheduling still gets its server's bandwidth. It keys on
p->dl_server, which pick_task() used to set.

Since commit bd9bbc96e835 ("sched: Rework dl_server"), pick_task()
records the server in rq->dl_server and p->dl_server is only set once
the task is switched in. The core-wide selection still ranks each
sibling's pick with prio_less(), so a task the sibling's server has
just picked ranks as a plain fair or ext task and loses to an RT task
on another sibling. The server's CPU then runs a task with the RT
task's cookie or is forced idle, and the fair task gets none of the
server's bandwidth for as long as the RT task runs.

Rank each sibling's pick by the server it came through, rq_i->dl_server.
prio_less() keeps using p->dl_server for the core tree, whose tasks are
not being picked.

Fixes: bd9bbc96e835 ("sched: Rework dl_server")
Signed-off-by: Fernand Sieber <sieberf@amazon.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261112161548.78189-4-sieberf@amazon.com
---
 kernel/sched/core.c | 51 ++++++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 46ccaa8..ea89471 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -196,12 +196,13 @@ __read_mostly int scheduler_running;
 DEFINE_STATIC_KEY_FALSE(__sched_core_enabled);
=20
 /* kernel prio, less is more */
-static inline int __task_prio(const struct task_struct *p)
+static inline int __task_prio(const struct task_struct *p,
+			      const struct sched_dl_entity *dl_server)
 {
 	if (p->sched_class =3D=3D &stop_sched_class) /* trumps deadline */
 		return -2;
=20
-	if (p->dl_server)
+	if (dl_server)
 		return -1; /* deadline */
=20
 	if (rt_or_dl_prio(p->prio))
@@ -223,12 +224,19 @@ static inline int __task_prio(const struct task_struct =
*p)
  * ge(a,b) :=3D !l(a,b)
  */
=20
-/* real prio, less is less */
-static inline bool prio_less(const struct task_struct *a,
-			     const struct task_struct *b, bool in_fi)
+/*
+ * real prio, less is less
+ *
+ * @a_dl_server and @b_dl_server are the DL servers @a and @b run on
+ * behalf of, if any.
+ */
+static inline bool __prio_less(const struct task_struct *a,
+			       const struct sched_dl_entity *a_dl_server,
+			       const struct task_struct *b,
+			       const struct sched_dl_entity *b_dl_server,
+			       bool in_fi)
 {
-
-	int pa =3D __task_prio(a), pb =3D __task_prio(b);
+	int pa =3D __task_prio(a, a_dl_server), pb =3D __task_prio(b, b_dl_server);
=20
 	if (-pa < -pb)
 		return true;
@@ -239,18 +247,13 @@ static inline bool prio_less(const struct task_struct *=
a,
 	if (pa =3D=3D -1) { /* dl_prio() doesn't work because of stop_class above */
 		const struct sched_dl_entity *a_dl, *b_dl;
=20
-		a_dl =3D &a->dl;
 		/*
-		 * Since,'a' and 'b' can be CFS tasks served by DL server,
+		 * Since 'a' and 'b' can be tasks served by a DL server,
 		 * __task_prio() can return -1 (for DL) even for those. In that
 		 * case, get to the dl_server's DL entity.
 		 */
-		if (a->dl_server)
-			a_dl =3D a->dl_server;
-
-		b_dl =3D &b->dl;
-		if (b->dl_server)
-			b_dl =3D b->dl_server;
+		a_dl =3D a_dl_server ?: &a->dl;
+		b_dl =3D b_dl_server ?: &b->dl;
=20
 		return !dl_time_before(a_dl->deadline, b_dl->deadline);
 	}
@@ -266,6 +269,12 @@ static inline bool prio_less(const struct task_struct *a,
 	return false;
 }
=20
+static inline bool prio_less(const struct task_struct *a,
+			     const struct task_struct *b, bool in_fi)
+{
+	return __prio_less(a, a->dl_server, b, b->dl_server, in_fi);
+}
+
 static inline bool __sched_core_less(const struct task_struct *a,
 				     const struct task_struct *b)
 {
@@ -6316,6 +6325,7 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	__must_hold(__rq_lockp(rq))
 {
 	struct task_struct *next, *p, *max;
+	struct sched_dl_entity *max_dl_server;
 	bool fi_before =3D false;
 	bool core_clock_updated =3D (rq =3D=3D rq->core);
 	unsigned long cookie;
@@ -6429,6 +6439,7 @@ restart:
 	 * Tie-break prio towards the current CPU
 	 */
 	max =3D NULL;
+	max_dl_server =3D NULL;
 	for_each_core_cpu_wrap(i, rq) {
 		rq_i =3D cpu_rq(i);
=20
@@ -6452,8 +6463,16 @@ restart:
 		rq_i->core_pick =3D p;
 		rq_i->core_dl_server =3D rq_i->dl_server;
=20
-		if (!max || prio_less(max, p, fi_before))
+		/*
+		 * p->dl_server is only set once @p runs; rank a pick that
+		 * came through a DL server by that server.
+		 */
+		if (!max || __prio_less(max, max_dl_server,
+					p, rq_i->dl_server,
+					fi_before)) {
 			max =3D p;
+			max_dl_server =3D rq_i->dl_server;
+		}
 	}
=20
 	cookie =3D rq->core->core_cookie =3D max->core_cookie;
