Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009162;
	b=DWCCD9Vt/1iYXG2HIRLCgmRo3hMl4tVkvL+Qrv/Sdy71W6RrdzUvt3BumSmPArZrsoQj
	 Si7ZqzHRHONF+jWe/3i0SN/q7qRSZLbz53fWv7E3Kx2fBAlVBj9HQSXCusQ0vrLbwgdn1
	 uvfOtj9RtEN/yVkQhz59VPh/pOETGr/itNWFY/aKg3WHgMPneBKR4vn0LC5pOqGNFTu4c
	 G4Cp91guBlY7bWieTnso7MqH3Vncu7dNdbcEIywclXw8br85mTswJnbkl+HWxARQQQTFj
	 YIH9yHBrdPReRYg6bFmcWRsNvv/V/4cG9ugmL01U8YQ8ddfBYTa0n8u7cJ5RADw9Ojg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009162;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=yA10u3FYCxFuwbRyLBA5LQ+MCTRlEZ7qDazhRZvOPgk=;
	b=bDiLVj5NV0AmUKOwiHRX87JBByiVuAArSK+uaC2DipO2nEqYa+H8fomFS5Vu8Oa0Yl4s
	 YCHTxRIc2Ww0L+D+d9ZEzkX1wIV4wH1qwYMPrjwtRo5Y2sTEBOIrWjevkelJdhKmna3N+
	 wcqQST/7SVr3GvNQfJZSKRDqIr2ee9eRC3AHh4rFBd95jMSD+HeTGGWCzpRM9duZOwnQq
	 lgxYsQlUEpWXXnlXenQhrCS/3mpwZBd0Ob+pwQWrRMrISu1LoEIopOjjcHdjgrV8WdCOc
	 OwRSkI8Z2yF4tThQDNH+YmicABsp6+gcJvbcz5hwFaluDughHYRpMKlQM+88YB5iTxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="3/PisEFZ";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=pW2dCpF7;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4666F606A320;
	Wed, 18 Nov 2026 13:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4666F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3/PisEFZ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=pW2dCpF7
Date: Wed, 18 Nov 2026 13:39:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795009160;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yA10u3FYCxFuwbRyLBA5LQ+MCTRlEZ7qDazhRZvOPgk=;
	b=3/PisEFZWPT3LuqdkwSVlxLhkVmFJyuobvoXtAP0jrtnGFZurVe4eEHL3a8PeGpQ+tgH7P
	05o16NCpSxWTBi71MPBWBxheno17dcehnwYA2nciaU/KAmzbgCrEU4OH067zVT9C6gZI/M
	z4uTHoiy1/6BZtPces8uuhznRIrva+ZvN8DHJfEHBKsJtiHeEOsYo8/3pEqlZzr1rVIr3a
	7+dPYIB4SBdPSmPHsP+SnvSeatjH//N3MIWOnEAwENbW6MMRFGIgsHcL9//kqtrJieYoLo
	b6NhaiGqmUl8afBoieRA8FtNYBSEctOXuJhCd2Hfs0/GagYaT6ajELFJY0MtSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795009160;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yA10u3FYCxFuwbRyLBA5LQ+MCTRlEZ7qDazhRZvOPgk=;
	b=pW2dCpF75B1vTyuC6ojSeI5GPvtFmTW7ew6H99uQPp1a/UCllyzWMpFV3ToYKQbTSu+Pdv
	3RAsSwWCC5qij/Ag==
From: "tip-bot2 for Michal Blaszczyk" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched: Lift cgroup update locking to core to
 prevent CFS/SCX divergence
Cc: Michal Blaszczyk <michalblk@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Andrea Righi <arighi@nvidia.com>, Tejun Heo <tj@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261110151857.1864222-1-michalblk@google.com>
References: <20261110151857.1864222-1-michalblk@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179500915858.3191731.4377750348123892955.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     342fe98c34311969950fa58a840fd0b95a16c9dd
Gitweb:        https://git.kernel.org/tip/342fe98c34311969950fa58a840fd0b95a1=
6c9dd
Author:        Michal Blaszczyk <michalblk@google.com>
AuthorDate:    Tue, 10 Nov 2026 15:18:57=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 18 Nov 2026 14:32:17 +01:00

sched: Lift cgroup update locking to core to prevent CFS/SCX divergence

Concurrent writes to cgroup control files (such as cpu.shares or
cpu.weight) can lead to state divergence between CFS and SCX.

For instance, in cpu_shares_write_u64(), the CFS update is serialized
by shares_mutex (internal to fair.c), but this lock is dropped before
scx_group_set_weight() is called. The latter only acquires a read
semaphore (scx_cgroup_ops_rwsem), allowing multiple threads to evaluate
and act on the sched_ext update concurrently.

This serialization gap allows concurrent writes to interleave.
As a result, the recorded state in CFS, the SCX internal bookkeeping
(e.g., tg->scx.weight), and the BPF scheduler itself can end up operating
on completely distinct parameters (pairwise distinct values).

Similar races are present in tg_set_bandwidth(), cpu_idle_write_s64(),
cpu_weight_write_u64(), and cpu_weight_nice_write_s64().

Fix this by moving the CFS locking up into the core layer in
`kernel/sched/core.c`. By acquiring these locks directly in the core
write handlers, both the CFS and SCX callbacks are executed atomically
under the same lock.

Fixes: 819513666966 ("sched_ext: Add cgroup support")
Signed-off-by: Michal Blaszczyk <michalblk@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Andrea Righi <arighi@nvidia.com>
Acked-by: Tejun Heo <tj@kernel.org>
Link: https://patch.msgid.link/20261110151857.1864222-1-michalblk@google.com
---
 kernel/sched/core.c  | 35 +++++++++++++++++++++++------------
 kernel/sched/fair.c  | 19 ++++++++++++-------
 kernel/sched/sched.h |  7 +++++++
 3 files changed, 42 insertions(+), 19 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5ed660f..515b9d0 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -9776,6 +9776,8 @@ static int cpu_uclamp_max_show(struct seq_file *sf, voi=
d *v)
 }
 #endif /* CONFIG_UCLAMP_TASK_GROUP */
=20
+DEFINE_MUTEX(cpu_weight_mutex);
+
 #ifdef CONFIG_GROUP_SCHED_WEIGHT
 static unsigned long tg_weight(struct task_group *tg)
 {
@@ -9793,7 +9795,10 @@ static int cpu_shares_write_u64(struct cgroup_subsys_s=
tate *css,
=20
 	if (shareval > scale_load_down(ULONG_MAX))
 		shareval =3D MAX_SHARES;
-	ret =3D sched_group_set_shares(css_tg(css), scale_load(shareval));
+
+	guard(mutex)(&cpu_weight_mutex);
+
+	ret =3D sched_group_set_shares_locked(css_tg(css), scale_load(shareval));
 	if (!ret)
 		scx_group_set_weight(css_tg(css),
 				     sched_weight_to_cgroup(shareval));
@@ -9808,8 +9813,6 @@ static u64 cpu_shares_read_u64(struct cgroup_subsys_sta=
te *css,
 #endif /* CONFIG_GROUP_SCHED_WEIGHT */
=20
 #ifdef CONFIG_CFS_BANDWIDTH
-static DEFINE_MUTEX(cfs_constraints_mutex);
-
 static int __cfs_schedulable(struct task_group *tg, u64 period, u64 runtime);
=20
 static int tg_set_cfs_bandwidth(struct task_group *tg,
@@ -9828,13 +9831,6 @@ static int tg_set_cfs_bandwidth(struct task_group *tg,
=20
 	burst =3D (u64)burst_us * NSEC_PER_USEC;
=20
-	/*
-	 * Prevent race between setting of cfs_rq->runtime_enabled and
-	 * unthrottle_offline_cfs_rqs().
-	 */
-	guard(cpus_read_lock)();
-	guard(mutex)(&cfs_constraints_mutex);
-
 	ret =3D __cfs_schedulable(tg, period, quota);
 	if (ret)
 		return ret;
@@ -10086,6 +10082,8 @@ static u64 cpu_period_read_u64(struct cgroup_subsys_s=
tate *css,
 	return period_us;
 }
=20
+static DEFINE_MUTEX(cpu_max_mutex);
+
 static int tg_set_bandwidth(struct task_group *tg,
 			    u64 period_us, u64 quota_us, u64 burst_us)
 {
@@ -10128,6 +10126,13 @@ static int tg_set_bandwidth(struct task_group *tg,
 					burst_us + quota_us > max_bw_runtime_us))
 		return -EINVAL;
=20
+	/*
+	 * Prevent race between setting of cfs_rq->runtime_enabled and
+	 * unthrottle_offline_cfs_rqs().
+	 */
+	guard(cpus_read_lock)();
+	guard(mutex)(&cpu_max_mutex);
+
 #ifdef CONFIG_CFS_BANDWIDTH
 	ret =3D tg_set_cfs_bandwidth(tg, period_us, quota_us, burst_us);
 #endif /* CONFIG_CFS_BANDWIDTH */
@@ -10226,6 +10231,8 @@ static int cpu_idle_write_s64(struct cgroup_subsys_st=
ate *css,
 {
 	int ret;
=20
+	guard(mutex)(&cpu_weight_mutex);
+
 	ret =3D sched_group_set_idle(css_tg(css), idle);
 	if (!ret)
 		scx_group_set_idle(css_tg(css), idle);
@@ -10402,7 +10409,9 @@ static int cpu_weight_write_u64(struct cgroup_subsys_=
state *css,
=20
 	weight =3D sched_weight_from_cgroup(cgrp_weight);
=20
-	ret =3D sched_group_set_shares(css_tg(css), scale_load(weight));
+	guard(mutex)(&cpu_weight_mutex);
+
+	ret =3D sched_group_set_shares_locked(css_tg(css), scale_load(weight));
 	if (!ret)
 		scx_group_set_weight(css_tg(css), cgrp_weight);
 	return ret;
@@ -10439,7 +10448,9 @@ static int cpu_weight_nice_write_s64(struct cgroup_su=
bsys_state *css,
 	idx =3D array_index_nospec(idx, 40);
 	weight =3D sched_prio_to_weight[idx];
=20
-	ret =3D sched_group_set_shares(css_tg(css), scale_load(weight));
+	guard(mutex)(&cpu_weight_mutex);
+
+	ret =3D sched_group_set_shares_locked(css_tg(css), scale_load(weight));
 	if (!ret)
 		scx_group_set_weight(css_tg(css),
 				     sched_weight_to_cgroup(weight));
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 3b0b0eb..da0d9e1 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15737,13 +15737,11 @@ void init_tg_cfs_entry(struct task_group *tg, struc=
t cfs_rq *cfs_rq,
 	se->parent =3D parent;
 }
=20
-static DEFINE_MUTEX(shares_mutex);
-
 static int __sched_group_set_shares(struct task_group *tg, unsigned long sha=
res)
 {
 	int i;
=20
-	lockdep_assert_held(&shares_mutex);
+	lockdep_assert_held(&cpu_weight_mutex);
=20
 	/*
 	 * We can't change the weight of the root cgroup.
@@ -15775,16 +15773,16 @@ static int __sched_group_set_shares(struct task_gro=
up *tg, unsigned long shares)
 	return 0;
 }
=20
-int sched_group_set_shares(struct task_group *tg, unsigned long shares)
+int sched_group_set_shares_locked(struct task_group *tg, unsigned long share=
s)
 {
 	int ret;
=20
-	mutex_lock(&shares_mutex);
+	lockdep_assert_held(&cpu_weight_mutex);
+
 	if (tg_is_idle(tg))
 		ret =3D -EINVAL;
 	else
 		ret =3D __sched_group_set_shares(tg, shares);
-	mutex_unlock(&shares_mutex);
=20
 	return ret;
 }
@@ -15826,17 +15824,24 @@ static int tg_set_idle_up(struct task_group *tg, vo=
id *data)
 	return 0;
 }
=20
+int sched_group_set_shares(struct task_group *tg, unsigned long shares)
+{
+	guard(mutex)(&cpu_weight_mutex);
+	return sched_group_set_shares_locked(tg, shares);
+}
+
 int sched_group_set_idle(struct task_group *tg, long idle)
 {
 	int i;
=20
+	lockdep_assert_held(&cpu_weight_mutex);
+
 	if (tg =3D=3D &root_task_group)
 		return -EINVAL;
=20
 	if (idle < 0 || idle > 1)
 		return -EINVAL;
=20
-	guard(mutex)(&shares_mutex);
 	if (tg->idle =3D=3D idle)
 		return 0;
=20
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 36a9492..a4e6696 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -599,7 +599,10 @@ extern void sched_release_group(struct task_group *tg);
 extern void sched_move_task(struct task_struct *tsk, bool for_autogroup);
=20
 #ifdef CONFIG_FAIR_GROUP_SCHED
+extern struct mutex cpu_weight_mutex;
+
 extern int sched_group_set_shares(struct task_group *tg, unsigned long share=
s);
+extern int sched_group_set_shares_locked(struct task_group *tg, unsigned lon=
g shares);
=20
 extern int sched_group_set_idle(struct task_group *tg, long idle);
=20
@@ -607,6 +610,10 @@ extern void set_task_rq_fair(struct sched_entity *se,
 			     struct cfs_rq *prev, struct cfs_rq *next);
 #else /* !CONFIG_FAIR_GROUP_SCHED: */
 static inline int sched_group_set_shares(struct task_group *tg, unsigned lon=
g shares) { return 0; }
+static inline int sched_group_set_shares_locked(struct task_group *tg, unsig=
ned long shares)
+{
+	return 0;
+}
 static inline int sched_group_set_idle(struct task_group *tg, long idle) { r=
eturn 0; }
 #endif /* !CONFIG_FAIR_GROUP_SCHED */
=20
