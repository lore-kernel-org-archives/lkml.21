Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009165;
	b=OWNV6DAENswvaW0D88Vv4HdIQkt5KU7cCMpw//9Xa063Qix9Upz0L5otkC2JAVHoTLMQ
	 DaPP4hw+9II54mWRnkZckzAFYWIBCLB7nBCxDMPXNT9gsRcT1983YA1F7BN6eTI2q2xwn
	 dOXNMswqk/z/BktW0qyFuqjbsGgsFk0FXRQrUr+VHjIeV4u4rTkMxhJZM4j3WmSlgF++T
	 EUavr82ZCfSpyCURmubEHLypV1+n/PSZyjPu26lnq5rQEOARPGORLQW0xtgTmlo1itHCT
	 xeFIJvgBN+Q1JUlnmvFAWRgWkda5bff/HEuHFXwickwWK7aCTTHDYZMOecvbSenVYbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009165;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=vHHwmmycSnRVfFixwaJ/X1JbYIwigFO1swAIPRNFfCs=;
	b=xGZnZthYA5tiFrMzlxj70w3ANddcWShoCKoHS6g2qI1YxLhYkbKbATY8NWzsJ1mm49Pa
	 jGAux+Tn0nlw+Q3NPYFHhVvRpA7lb7HD6A0ZN9sEcRSiPbp+2nQCta0ukfJwOP0T++HK0
	 BINtCqPrNqd3rRP8CotTwrNVZ1ilI9wfeeyg2jPawKrHQW2G1IKVCubcd9l/Gw9GauBBx
	 dY2Jm9hKbBRix7kBKAipL5Hthk+KgBFscMEk+66q5RJ5aKcKWyoqTAPthwZUfAgnetLo3
	 twuluzZDRxGj2hnu4Bqb6iAEPIJPXjd6h9uKMYeV9qKeVZcwCf7/+Q39pxqK39IkN4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nDYa2S82;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0910FQnd;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16BD60A2606;
	Wed, 18 Nov 2026 13:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E16BD60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nDYa2S82;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0910FQnd
Date: Wed, 18 Nov 2026 13:39:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795009163;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vHHwmmycSnRVfFixwaJ/X1JbYIwigFO1swAIPRNFfCs=;
	b=nDYa2S82+3xdn7mOHzEtLOt8lNamGwx+f52E/7ZMJp/Qv2V8XoXASojT+VQVtgPQFMCpVc
	fDBEZ2nMpQ1J7oTedn2NZoaQ7RJKbUaJ9Ms2/e9AVFC1wovEThvVl+iFBNKcah790XqmE5
	ifableY19Nf1hNzf5LfJC6AcdtsdBgw+TN5JBIO5gYKnxsM4diSQn6q+kYbuyzaVYS0n5y
	GHSzOY44QP3hg2SLD3/69DHbEamimbrMQMhs6ifaNvcTniQBZtzGJzSym58Z/2rAgyHk7s
	l0e0FhI2EUgAfLLK1vTN9vm65lYOU7RRemDZlS835VcEBJ0LuTcnlInsmA1lYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795009163;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vHHwmmycSnRVfFixwaJ/X1JbYIwigFO1swAIPRNFfCs=;
	b=0910FQndj5RMYB4wb8l3ApzdUUaYN08tLvo1L3DkzfF0TOaVExIxEWnKKr6+SZjjn/FJjo
	ix6faEbFOVdaX0Cg==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/fair: Make cfs_rq::idle the sum of ancestor
 tg::idle
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Kayra Cizmeci <kayracizmeci@gmail.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Josh Don <joshdon@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261107113639.GK2668200@noisy.programming.kicks-ass.net>
References: <20261107113639.GK2668200@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179500916173.3191731.16130486209592165688.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     75545668ae0fd80c08fe8fd0c6799b2ba9284557
Gitweb:        https://git.kernel.org/tip/75545668ae0fd80c08fe8fd0c6799b2ba92=
84557
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Sat, 07 Nov 2026 12:36:39 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 18 Nov 2026 14:32:16 +01:00

sched/fair: Make cfs_rq::idle the sum of ancestor tg::idle

Rather than keeping cfs_rq::idle as a copy of tg::idle, make it the sum of
all ancestor tg::idle. This makes it trivial to tell if the current cgroup
is marked idle somewhere along its ancestral path.

This makes se_is_idle() behave differently. Notably is will now be true when
there is a idle cgroup anywhere in the ancestor path. This addresses an issue
where preemption of cgroup::idle was overlooked when flattening the runqueue.

Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Josh Don <joshdon@google.com>
Link: https://patch.msgid.link/20261107113639.GK2668200@noisy.programming.kic=
ks-ass.net
---
 kernel/sched/debug.c |  1 +-
 kernel/sched/fair.c  | 88 ++++++++++++++++++++++++++-----------------
 kernel/sched/sched.h |  2 +-
 3 files changed, 56 insertions(+), 35 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index e6a3b51..dcf9b1d 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1112,6 +1112,7 @@ void print_cfs_rq(struct seq_file *m, int cpu, struct c=
fs_rq *cfs_rq)
 			atomic_long_read(&cfs_rq->tg->load_avg));
 	SEQ_printf(m, "  .%-30s: %lu\n", "h_load",
 			cfs_rq->h_load);
+	SEQ_printf(m, "  .%-30s: %d\n", "idle", cfs_rq->idle);
 #endif /* CONFIG_FAIR_GROUP_SCHED */
 #ifdef CONFIG_CFS_BANDWIDTH
 	SEQ_printf(m, "  .%-30s: %d\n", "throttled",
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 95fd756..4e21cda 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -445,8 +445,10 @@ static int cfs_rq_is_idle(struct cfs_rq *cfs_rq)
=20
 static int se_is_idle(struct sched_entity *se)
 {
-	if (entity_is_task(se))
-		return task_has_idle_policy(task_of(se));
+	if (entity_is_task(se)) {
+		return task_has_idle_policy(task_of(se)) ||
+			cfs_rq_is_idle(cfs_rq_of(se));
+	}
 	return cfs_rq_is_idle(group_cfs_rq(se));
 }
=20
@@ -15672,19 +15674,20 @@ err:
=20
 void online_fair_sched_group(struct task_group *tg)
 {
-	struct sched_entity *se;
-	struct rq_flags rf;
-	struct rq *rq;
 	int i;
=20
 	for_each_possible_cpu(i) {
-		rq =3D cpu_rq(i);
-		se =3D tg_se(tg, i);
-		rq_lock_irq(rq, &rf);
+		struct cfs_rq *cfs_rq =3D tg_cfs_rq(tg, i);
+		struct sched_entity *se =3D tg_se(tg, i);
+		struct rq *rq =3D cpu_rq(i);
+
+		guard(rq_lock_irq)(rq);
+
 		update_rq_clock(rq);
 		attach_entity_cfs_rq(se);
 		sync_throttle(tg, i);
-		rq_unlock_irq(rq, &rf);
+
+		cfs_rq->idle =3D tg_cfs_rq(tg->parent, i)->idle;
 	}
 }
=20
@@ -15793,6 +15796,43 @@ int sched_group_set_shares(struct task_group *tg, un=
signed long shares)
 	return ret;
 }
=20
+struct tg_set_idle_struct {
+	long idle;
+	int cpu;
+};
+
+static int tg_set_idle_up(struct task_group *tg, void *data)
+{
+	struct tg_set_idle_struct *tsi =3D data;
+	struct cfs_rq *grp_cfs_rq =3D tg_cfs_rq(tg, tsi->cpu);
+	struct sched_entity *se =3D tg_se(tg, tsi->cpu);
+	int old_idle =3D grp_cfs_rq->idle;
+	int task_delta;
+
+	grp_cfs_rq->idle +=3D tsi->idle;
+
+	if (!!old_idle =3D=3D !!grp_cfs_rq->idle)
+		return 0;
+
+	task_delta =3D grp_cfs_rq->h_nr_queued - grp_cfs_rq->h_nr_idle;
+	if (!task_delta)
+		return 0;
+
+	task_delta *=3D tsi->idle;
+	for_each_sched_entity(se) {
+		struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
+
+		if (!se->on_rq)
+			break;
+
+		cfs_rq->h_nr_idle +=3D task_delta;
+
+		if (cfs_rq_is_idle(cfs_rq))
+			break;
+	}
+	return 0;
+}
+
 int sched_group_set_idle(struct task_group *tg, long idle)
 {
 	int i;
@@ -15811,34 +15851,14 @@ int sched_group_set_idle(struct task_group *tg, lon=
g idle)
=20
 	for_each_possible_cpu(i) {
 		struct rq *rq =3D cpu_rq(i);
-		struct sched_entity *se =3D tg_se(tg, i);
-		struct cfs_rq *grp_cfs_rq =3D tg_cfs_rq(tg, i);
-		bool was_idle =3D cfs_rq_is_idle(grp_cfs_rq);
-		long idle_task_delta;
=20
 		guard(rq_lock_irqsave)(rq);
=20
-		grp_cfs_rq->idle =3D idle;
-		if (WARN_ON_ONCE(was_idle =3D=3D cfs_rq_is_idle(grp_cfs_rq)))
-			continue;
-
-		idle_task_delta =3D grp_cfs_rq->h_nr_queued -
-				  grp_cfs_rq->h_nr_idle;
-		if (!cfs_rq_is_idle(grp_cfs_rq))
-			idle_task_delta *=3D -1;
-
-		for_each_sched_entity(se) {
-			struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
-
-			if (!se->on_rq)
-				break;
-
-			cfs_rq->h_nr_idle +=3D idle_task_delta;
-
-			/* Already accounted at parent level and above. */
-			if (cfs_rq_is_idle(cfs_rq))
-				break;
-		}
+		struct tg_set_idle_struct tsi =3D {
+			.idle =3D idle ? 1 : -1,
+			.cpu =3D i,
+		};
+		walk_tg_tree_from(tg, tg_nop, tg_set_idle_up, &tsi);
 	}
=20
 	/* Idle groups have minimum weight. */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 2209274..36a9492 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -751,7 +751,7 @@ struct cfs_rq {
 	struct list_head	leaf_cfs_rq_list;
 	struct task_group	*tg;	/* Group that "owns" this runqueue */
=20
-	/* Locally cached copy of our task_group's idle value */
+	/* Sum of all ancestor tg->idle. */
 	int			idle;
=20
 # ifdef CONFIG_CFS_BANDWIDTH
