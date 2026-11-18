Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009164;
	b=X6Luzghwf0kZFR616b8xbYI5z4b3gxX6bmsY+salDIb3gX7/HmI4pSkLerOigFxINtwB
	 VXx+qgVr+XUqELL7zGL2be5GHyMf9BcTDMKcLvs+hIfwUj6JpgUpq/G2AzRcUFkd9nFqW
	 KAkFKCOe1kycZBHbrGVyexYe1qaStIWPJVwWOqcmJRo68QjDame0bfVmbnt7R+RWUA3Jo
	 orIDACDQF0GwOGXGCLg3TlGSM9AqdxjLYiUf4irEvGsXF/mda06RQpX0aFa2efeV0vawO
	 iFnuQKsnu100UKdolwIFH0bwE2+PhCOsUrsGxYn/PTYB6a9LgkZ0qIRmf6wUxjQ2+/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009164;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=vH3GgIvw9mlTBIE+4RDAlbgd/UBiEZA4Zz1BsDaz4fo=;
	b=z7hkZ6UKAQHjT00NYDHQlVzB/gocrEy0FVOg/AxMkpSvtIJtGGHfYSI02CNMkJIOM4jv
	 ASCn2dmmxxyQFDXbc5EVwxgbnzOUaU3gnd4LrUKyhhYA0zkzg4gu8I2sLIyT3B5dGiOX0
	 O+prnJIbmE/I5yGdYoYPneWm8pFEtIZLSCGxq1l0JJpmUdm7SVryFP6VIZm5nR7/sCD56
	 6rOzadrRVNtrf9hhOViFEH+RpzAl65cSp9j4lTV7E4GgnpCsD6jroGJ216QzUr3x/S5sr
	 N4pfqRN1xbV9t+yhgBn3spWhy/YwjChN5P1vnpI9W8QPOCwF4+blRPxjmSPL67kl0vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="WIu/HxhK";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=mG9mMRE3;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F268606A332;
	Wed, 18 Nov 2026 13:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F268606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WIu/HxhK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=mG9mMRE3
Date: Wed, 18 Nov 2026 13:39:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795009161;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vH3GgIvw9mlTBIE+4RDAlbgd/UBiEZA4Zz1BsDaz4fo=;
	b=WIu/HxhK7KAvcDv6TZagEsyep/881N8lsbM3Np5H1oBsSS/DKta/l6Weoqbrbp53ciKx5N
	WcdfX05iPtgCTx7j/emKIQKc8u/enyc0NrisMt7GiIYxoLPB/Hrnd1gz7/LXiTS4bhsUCY
	ZpVLdZhKqhOFBNdcPA0fR3vJpCRI9RrzsWZqYC7xCaR0CyaHZJrpDh9WbMvmjAlxjCkcvZ
	9fmNM+vwOnEpbaxLxPV+FiJxRJBuE1VXVMhtxuWWofuhunIG0urv5QrKqkiD4nbWG2F3w6
	5PvOOFOw9+gcRxUtibrCM39PqoFk8/bugUIgHMw36/di2FjDqJWDG3QJxHtkRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795009161;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vH3GgIvw9mlTBIE+4RDAlbgd/UBiEZA4Zz1BsDaz4fo=;
	b=mG9mMRE3czaaM740jhV6AMQ0r3rmUQinc8xAr/cMjhu471K1m8dhHrYdjzCWm2OmoferrH
	UhWN8GAzTzoOREAw==
From: "tip-bot2 for K Prateek Nayak" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/fair: Avoid transient double accounting for
 delayed tasks
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261112083447.25603-1-kprateek.nayak@amd.com>
References: <20261112083447.25603-1-kprateek.nayak@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179500916013.3191731.3149125419718630663.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     486c3d06b90240860e99686d29ed9f15637dc314
Gitweb:        https://git.kernel.org/tip/486c3d06b90240860e99686d29ed9f15637=
dc314
Author:        K Prateek Nayak <kprateek.nayak@amd.com>
AuthorDate:    Thu, 12 Nov 2026 08:34:47=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 18 Nov 2026 14:32:17 +01:00

sched/fair: Avoid transient double accounting for delayed tasks

When a task is delayed, h_nr_runnable is adjusted via set_delayed().

A dequeue of delayed task with DEQUEUE_DELAYED would decrement
cfs_rq->h_nr_runnable again in dequeue_hierarchy() and then correct it
immediately in __dequeue_task() via clear_delayed().

Adding:

   WARN_ON_ONCE(((int)cfs_rq->h_nr_runnable) < 0);

in dequeue_hierarchy() after h_nr_runnable accounting is tripped
reliably during early boot.

Although the cfs_rq->h_nr_runnable accounting is transient, this
incorrect value gets cached in se->runnable_weight and can affect PELT
calculation until the next enqueue / dequeue adjusts the runnable
weight.

Similarly, a task enqueue should never reach enqueue_hierarchy()
for just ENQUEUE_WAKEUP && se->sched_delayed. Wakeup of delayed tasks
must couple ENQUEUE_DELAYED which gets correctly handled in
enqueue_task_fair().

Avoid incorrect accounting in __dequeue_task() and warn for
incorrect wakeup flags if delayed tasks reaches enqueue with just
ENQUEUE_WAKEUP.

Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Link: https://patch.msgid.link/20261112083447.25603-1-kprateek.nayak@amd.com
---
 kernel/sched/fair.c | 57 +++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 32 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 4e21cda..3b0b0eb 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6549,19 +6549,8 @@ static __always_inline void return_cfs_rq_runtime(stru=
ct cfs_rq *cfs_rq);
=20
 static void set_delayed(struct sched_entity *se)
 {
-	/*
-	 * Delayed se of cfs_rq have no tasks queued on them.
-	 * Do not adjust h_nr_runnable since __dequeue_task()
-	 * will account it for blocked tasks.
-	 *
-	 * This check can be removed because when flat pick
-	 * patches get merged as only task can get delayed,
-	 * same for clear_delayed().
-	 */
-	if (!entity_is_task(se)) {
-		se->sched_delayed =3D 1;
-		return;
-	}
+	/* Only tasks can be delayed. */
+	WARN_ON_ONCE(!entity_is_task(se));
=20
 	/*
 	 * Drop a task leaving the runnable set.
@@ -6578,18 +6567,16 @@ static void set_delayed(struct sched_entity *se)
 	}
 }
=20
-static void clear_delayed(struct sched_entity *se)
+static void __clear_delayed(struct sched_entity *se)
 {
+	/* Only tasks can be delayed. */
+	WARN_ON_ONCE(!entity_is_task(se));
 	se->sched_delayed =3D 0;
+}
=20
-	/*
-	 * Delayed se of cfs_rq have no tasks queued on them.
-	 * Do not adjust h_nr_runnable since a dequeue has
-	 * already accounted for it or an enqueue of a task
-	 * below it will account for it in enqueue_task_fair().
-	 */
-	if (!entity_is_task(se))
-		return;
+static void clear_delayed(struct sched_entity *se)
+{
+	__clear_delayed(se);
=20
 	/*
 	 * Re-add on wake, after sched_delayed is cleared. On a final delayed
@@ -8113,12 +8100,15 @@ requeue_delayed_entity(struct cfs_rq *cfs_rq, struct =
sched_entity *se)
 static unsigned long enqueue_hierarchy(struct task_struct *p, int flags)
 {
 	unsigned long weight =3D NICE_0_LOAD;
-	int task_new =3D !(flags & ENQUEUE_WAKEUP);
 	struct sched_entity *se =3D &p->se;
 	int h_nr_idle =3D task_has_idle_policy(p);
 	int h_nr_runnable =3D 1;
=20
-	if (task_new && se->sched_delayed)
+	/*
+	 * Accounted via requeue_delayed_entity() calling
+	 * clear_delayed() when delayed task wakes up.
+	 */
+	if (se->sched_delayed)
 		h_nr_runnable =3D 0;
=20
 	for_each_sched_entity(se) {
@@ -8192,6 +8182,9 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p,=
 int flags)
 		return;
 	}
=20
+	/* Wakeup of delayed tasks must be handled above. */
+	WARN_ON_ONCE(!task_new && se->sched_delayed);
+
 	/*
 	 * If in_iowait is set, the code below may not trigger any cpufreq
 	 * utilization updates, so do it here explicitly with the IOWAIT flag
@@ -8209,9 +8202,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p,=
 int flags)
 	if (curr)
 		place_entity(cfs_rq, se, flags);
=20
-	if (se->on_rq && se->sched_delayed)
-		requeue_delayed_entity(cfs_rq, se);
-
 	weight =3D enqueue_hierarchy(p, flags);
=20
 	if (!curr) {
@@ -8251,15 +8241,14 @@ enqueue_task_fair(struct rq *rq, struct task_struct *=
p, int flags)
 static void dequeue_hierarchy(struct task_struct *p, int flags)
 {
 	struct sched_entity *se =3D &p->se;
-	bool task_sleep =3D flags & DEQUEUE_SLEEP;
-	bool task_delayed =3D flags & DEQUEUE_DELAYED;
 	bool task_throttled =3D flags & DEQUEUE_THROTTLE;
 	int h_nr_runnable =3D 0;
 	int h_nr_idle =3D task_has_idle_policy(p);
 	bool dequeue =3D true;
=20
-	if (task_sleep || task_delayed || !se->sched_delayed)
-		h_nr_runnable =3D 1;
+	/* Already accounted via set_delayed(). */
+	if (se->sched_delayed)
+		h_nr_runnable =3D 0;
=20
 	for_each_sched_entity(se) {
 		struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
@@ -8349,7 +8338,11 @@ static bool __dequeue_task(struct rq *rq, struct task_=
struct *p, int flags)
 		rq->next_balance =3D jiffies;
=20
 	if (task_delayed) {
-		clear_delayed(se);
+		/*
+		 * Skip accounting since set_delayed() has already
+		 * adjusted it. Just clear se->sched_delayed.
+		 */
+		__clear_delayed(se);
=20
 		WARN_ON_ONCE(!task_sleep);
 		WARN_ON_ONCE(p->on_rq !=3D 1);
