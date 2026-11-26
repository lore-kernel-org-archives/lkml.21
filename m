Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706711;
	b=G8Xr+QYK1IjOXHTLTwvx63kaTgElXNGAqqLcxPNjCH8OCFP/WLs8AhiDRB9jmImOFCGr
	 BjgEPyUb4MSb0m6JQFXI1ZEc5IQ+4cmcTPjHNkjH/EUYJaRnJk0QZzIp1k5/2+ptcFSG0
	 LhdagST6u/YlNifTLTQaM/aWw9Bcfwv5IhE+51xERT8Df8BIcVqv4NpxWeK+nTUlvodha
	 9Rd9zuWrJ2h0/k5/U+HJcaLcQSHUYCTOFoQ4xzsRrqWLzkPkr/uoZ3/wrHqOiG78Fimd8
	 +aBIsu8p+2feeQlKAr2BL1nhlJcd26hq87MBeZJd84GLwNW6mVCr6L6Rb7LVbtOxdvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fAfk24ayLM2PEwDgowvoACqBgx/C4ytsADdaBvWLtmg=;
	b=ejimPdsjC4y86oqrbFj210KtwOEiMHxvmSlcYCWphU10z4N2OzJMDnLVLJqeqQd0QsUR
	 NsoTFbR1ZR0sSZy5slPlH7smggfkTu7NwMGvrj3qFfv/4HDojJoET0dI3Ugyhd7ZTk1Ff
	 3bjJ8/7Wdguc0iBmMKbmylTzmV7wnXu/J9oZzHXRHgs1s/jNK5Gtj6b7kFIUnilRoKcAW
	 WjXU4PryQTb+YnIAAaZk/PCnU7fWMB41qqEWK/Na5CpGREYXrYfsCmNOTf2C1M0rsdpTu
	 7810cIsigkLeDvX66PXpnjcAxksn5QYeR2I35AeV7jZMuNZCuAv8nZJl5JR7Fvz41rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HR3aZVYx;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285CC606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 285CC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HR3aZVYx
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a358881793so3767755f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795706709; x=1796311509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAfk24ayLM2PEwDgowvoACqBgx/C4ytsADdaBvWLtmg=;
        b=HR3aZVYxei5vnRIZG+1JQO903XwnSvfjrYDmZEui4Vmykpgb6EpRQXNRxBiRd432Dz
         bsU5ygTovR2N8hyPjoTg0BnU61uXfGjzKj4qPMvQJs/P4zJGQfTePIOEvrtBCXbz/QBu
         MGFAY9RiY6lx80AmZfQU+w4/2V3ThpM5o6OCBRswEfbXwlN1bTg2akMjnvuTz2YUsGQz
         wX6wgvoma/loE938Dc+2w7yvdkH3NOqOUcGvfYj7eFTW6T33tbv7VlPSm7oLRPw0ipQ7
         nH0OXKRYcXuNrc21ISx6QnCMeAfQsi/1nraFPMUAxNb0DBHXAOK16Q0aGhEHxoRUkgjy
         F4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706709; x=1796311509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fAfk24ayLM2PEwDgowvoACqBgx/C4ytsADdaBvWLtmg=;
        b=T5TDbrKPHhXW6FKa2utYKJF6rBpIPGXJoCnLdI/GCmtdROF9oViAyBSnSPvc2XFu6g
         75Hsqf4MeScWhKG6h7QmkkJ9kxj7naAyQBvToNInJpoXomw/w6L4trMLLL2wRW9eZg6m
         khsq0wW1r+WQXYM7ixtozbGxyAB0x2cNahqGocE1O6Ojq1UVl6kZAIud6JsoV8GMFNdp
         PKzQmydZsWMZC4DTBIPMqJmpoaEAOm8/J8T/t0BTXrWQ9SUdQcwtlh/kB2Sh3zwbNmU6
         L1Smp2O3tqMqoXBM8Y1OXbSC9toqTrrwY5kn8xKCiSA7nhXYgxNzUaoCuVPf+rqrfHDa
         UDPg==
X-Gm-Message-State: APuU4Z+BVhXhNDOXy3EtmwWDF5lPoOVJqSGyRrthidQLtZ89GrVNNg5Q
	XCcF3CDAhzNt+zHTz0tFWIrhR8DlHgZuJ3DgNKyMExKmaUepXrbBSLA4d0x/tg9gnLygxkDzHZX
	bfUkKiOw=
X-Gm-Gg: AZFdTZfOvS/3KACCYcGSI/bqJhOzQMPplXk2vlgsAE+sRYQadYBAqSrcTVdnki6Gyec
	ogLnd5vGMJBVsJk7BOEWKp03QNJaO6D9NvDoKSizaDrpE8/V80A+4PN7w9lLZgLHlW6kR0YOl74
	OnUE8TULTnrn6acMsirLGt4/B3F4Sqk0Yq8nTUFEkQde99McMqRHo4T/NtrM0qEwdCFJNqRHzaJ
	xmy08Nr91b9SxnTE61c/CALZM0H4PVE/S/KHb821m7nOylcg2l31JaERp3SmvoBdwah/N8REs1g
	d2bdzac7lNYOuMfHutoLMATIIhdQZMAWLg6NUf/WFYWHffU0EkvGtsX5ivdPzqGQqW2kC7HDPam
	nuS5OLQDEBwD24HUdS5Efgx1tl043PJQ2bl9WI1qGt5iR+H85zxr88gukM7GnAeer5tfzdhn2E2
	ICMHKeVPJP47by10OIvQLkLl16WIMAfCYBMFmEKiNktvFgx8NX+dvwwpkudd/qUkSjw4xumwV2F
	j2PQxnwvmRNdxyrtAhZRzPmHxxjxrMcyUx0YTfRwXudwUidPVqu9aU+ctY+bavqBZ7KFvN8BE0Q
	nQf4uEvmPO3+MtA8XV0HMGpjT2BzHgsBCWw49VEJiWFbO24py/lP
X-Received: by 2002:a05:600c:6290:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb8882a21amr415610375e9.27.1795706709424;
        Thu, 26 Nov 2026 07:25:09 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm569944295e9.2.2026.11.26.07.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:25:09 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH RFC 2/3] workqueue: Offload WQ_PREFER_PERCPU work from isolated CPUs
Date: Thu, 26 Nov 2026 16:24:57 +0100
Message-ID: <20261126152458.742942-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126152458.742942-1-marco.crivellari@suse.com>
References: <20261126152458.742942-1-marco.crivellari@suse.com>
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

CPUs can be isolated at boot with isolcpus=domain, or at runtime through
cgroup v2 cpuset isolated partitions. Unbound workqueues already follow
this, as their cpumask is restricted to the housekeeping CPUs. Per-cpu
workqueues don't, so work queued on an isolated CPU keeps running there.

Many WQ_PERCPU users don't need per-cpu execution for correctness, they
only want cache locality. For them, running on an isolated CPU is just
noise for the isolated workload.

WQ_PREFER_PERCPU covers this case. It implies WQ_PERCPU, so by default
the workqueue is a regular concurrency-managed per-cpu workqueue. When a
CPU is isolated, its pwq is backed by an unbound pool running on the
housekeeping CPUs instead. When the CPU stops being isolated, the per-cpu
pool is used again.

The switch happens in workqueue_unbound_housekeeping_update(). For each
WQ_PREFER_PERCPU workqueue, the pwq of a CPU that becomes isolated, or
stops being isolated, is replaced. CPUs that stay isolated get a new pwq
only if their unbound pool must change, e.g. because it can run on a CPU
that is now isolated. The same happens when the workqueue cpumask is
changed through sysfs. As the workqueue is not WQ_UNBOUND, the fallback
pwqs keep using the per-cpu nr_active accounting.

Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 kernel/workqueue.c | 143 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 126 insertions(+), 17 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 73c61a55d4ce..0665ffaf87c5 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -1858,10 +1858,12 @@ static bool pwq_tryinc_nr_active(struct pool_workqueue *pwq, bool fill)
 	lockdep_assert_held(&pool->lock);
 
 	/*
-	 * A concurrency-managed per-cpu pool accounts nr_active per pwq, so
-	 * pwq->nr_active against wq->percpu_max_active is sufficient.
+	 * A concurrency-managed per-cpu workqueue accounts nr_active per pwq,
+	 * so pwq->nr_active against wq->percpu_max_active is sufficient. This
+	 * includes WQ_PREFER_PERCPU pwqs backed by an unbound pool on isolated
+	 * CPUs: the workqueue isn't WQ_UNBOUND and has no node_nr_active.
 	 */
-	if (is_percpu_pool(pool)) {
+	if (wq->flags & WQ_PERCPU) {
 		obtained = pwq->nr_active < READ_ONCE(wq->percpu_max_active);
 		goto out;
 	}
@@ -2099,10 +2101,11 @@ static void pwq_dec_nr_active(struct pool_workqueue *pwq)
 	pwq->nr_active--;
 
 	/*
-	 * A concurrency-managed per-cpu pool only needs to kick the first
-	 * inactive work item on @pwq itself.
+	 * A concurrency-managed WQ_PERCPU pwq only needs to kick the first
+	 * inactive work item on @pwq itself; see the matching comment in
+	 * pwq_tryinc_nr_active().
 	 */
-	if (is_percpu_pool(pool)) {
+	if (pwq->wq->flags & WQ_PERCPU) {
 		pwq_activate_first_inactive(pwq, false);
 		return;
 	}
@@ -2497,14 +2500,15 @@ static void __queue_work(int cpu, struct workqueue_struct *wq,
 	}
 
 	/*
-	 * pwq is determined and locked. For unbound pools, we could have raced
+	 * pwq is determined and locked. For unbound and WQ_PREFER_PERCPU
+	 * workqueues, whose pwqs get replaced at runtime, we could have raced
 	 * with pwq release and it could already be dead. If its refcnt is zero,
-	 * repeat pwq selection. Note that unbound pwqs never die without
-	 * another pwq replacing it in cpu_pwq or while work items are executing
-	 * on it, so the retrying is guaranteed to make forward-progress.
+	 * repeat pwq selection. Note that such pwqs never die without another
+	 * pwq replacing it in cpu_pwq or while work items are executing on it,
+	 * so the retrying is guaranteed to make forward-progress.
 	 */
 	if (unlikely(!pwq->refcnt)) {
-		if (wq->flags & WQ_UNBOUND) {
+		if (wq->flags & (WQ_UNBOUND | WQ_PREFER_PERCPU)) {
 			raw_spin_unlock(&pool->lock);
 			cpu_relax();
 			goto retry;
@@ -5602,10 +5606,28 @@ static struct worker_pool *get_percpu_pool(struct workqueue_struct *wq, int cpu)
 	return &per_cpu_ptr(pools, cpu)[highpri];
 }
 
+/*
+ * Whether @wq's pwq on @cpu must be backed by the per-cpu pool of @cpu: true
+ * for WQ_PERCPU workqueues, except for WQ_PREFER_PERCPU ones while @cpu is
+ * isolated, which are backed by an unbound pool on the housekeeping CPUs.
+ */
+static bool wq_cpu_wants_percpu_pool(struct workqueue_struct *wq, int cpu)
+{
+	if (!(wq->flags & WQ_PERCPU))
+		return false;
+	if (!(wq->flags & WQ_PREFER_PERCPU))
+		return true;
+
+	/* the HK_TYPE_DOMAIN cpumask is freed under RCU when isolation changes */
+	guard(rcu)();
+	return !cpu_is_isolated(cpu);
+}
+
 /*
  * Obtain the pool backing @wq on @cpu and create a pwq associating the two.
- * A WQ_PERCPU workqueue is backed by the static per-cpu pool of @cpu,
- * everything else by a pool matching @attrs. @cpu < 0 is always unbound.
+ * A WQ_PERCPU workqueue is backed by the static per-cpu pool of @cpu, unless
+ * it is WQ_PREFER_PERCPU and @cpu is isolated; everything else by a pool
+ * matching @attrs. @cpu < 0 is always unbound.
  */
 static struct pool_workqueue *alloc_pwq(struct workqueue_struct *wq,
 					const struct workqueue_attrs *attrs,
@@ -5618,7 +5640,7 @@ static struct pool_workqueue *alloc_pwq(struct workqueue_struct *wq,
 
 	WARN_ON_ONCE((wq->flags & WQ_PERCPU) && cpu < 0);
 
-	if (cpu >= 0 && (wq->flags & WQ_PERCPU)) {
+	if (cpu >= 0 && wq_cpu_wants_percpu_pool(wq, cpu)) {
 		pool = get_percpu_pool(wq, cpu);
 	} else {
 		pool = get_unbound_pool(attrs);
@@ -6136,6 +6158,15 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 		flags |= WQ_PERCPU;
 	}
 
+	/*
+	 * WQ_PREFER_PERCPU behaves like WQ_PERCPU unless the target CPU is
+	 * isolated; see its definition. Force WQ_PERCPU here, before the
+	 * WQ_UNBOUND defaulting below, so that a bare WQ_PREFER_PERCPU caller
+	 * ends up percpu by default.
+	 */
+	if (flags & WQ_PREFER_PERCPU)
+		flags |= WQ_PERCPU;
+
 	/*
 	 * Default to WQ_UNBOUND if neither WQ_PERCPU nor WQ_UNBOUND is set,
 	 * and drop WQ_PERCPU if both are. This must happen before the WQ_RT
@@ -6160,6 +6191,10 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 	if ((flags & WQ_POWER_EFFICIENT) && wq_power_efficient)
 		flags = (flags & ~WQ_PERCPU) | WQ_UNBOUND;
 
+	/* WQ_PREFER_PERCPU is meaningless on an unbound workqueue */
+	if (flags & WQ_UNBOUND)
+		flags &= ~WQ_PREFER_PERCPU;
+
 	/* allocate wq and format name */
 	if (flags & WQ_UNBOUND)
 		wq_size = struct_size(wq, node_nr_active, nr_node_ids + 1);
@@ -7487,6 +7522,63 @@ static int workqueue_apply_unbound_cpumask(const cpumask_var_t unbound_cpumask)
 	return ret;
 }
 
+/*
+ * Back @cpu's pwq of the WQ_PREFER_PERCPU @wq with the pool matching @cpu's
+ * isolation state: the per-cpu pool, or an unbound pool if @cpu is isolated.
+ * Nothing is done if the installed pwq already uses the right pool.
+ */
+static void prefer_percpu_wq_update_pwq(struct workqueue_struct *wq, int cpu)
+{
+	struct workqueue_attrs *attrs = unbound_wq_update_pwq_attrs_buf;
+	struct worker_pool *pool = installed_pwq(wq, cpu)->pool;
+	struct pool_workqueue *old_pwq, *pwq;
+
+	lockdep_assert_held(&wq_pool_mutex);
+
+	if (wq_cpu_wants_percpu_pool(wq, cpu)) {
+		if (is_percpu_pool(pool))
+			return;
+	} else {
+		copy_workqueue_attrs(attrs, wq->attrs);
+		wqattrs_actualize_cpumask(attrs, wq_unbound_cpumask);
+		wq_calc_pod_cpumask(attrs, cpu);
+		if (!is_percpu_pool(pool) && wqattrs_equal(attrs, pool->attrs))
+			return;
+	}
+
+	pwq = alloc_pwq(wq, attrs, cpu);
+	if (!pwq) {
+		pr_warn("workqueue: allocation failed while updating \"%s\" on CPU %d\n",
+			wq->name, cpu);
+		return;
+	}
+
+	mutex_lock(&wq->mutex);
+	old_pwq = install_pwq(wq, cpu, pwq);
+	mutex_unlock(&wq->mutex);
+	put_pwq_unlocked(old_pwq);
+}
+
+/*
+ * Update the pwqs of every WQ_PREFER_PERCPU workqueue on @cpus. These
+ * workqueues are WQ_PERCPU, so workqueue_apply_unbound_cpumask() never
+ * iterates them.
+ */
+static void wq_update_prefer_percpu_pwqs(const struct cpumask *cpus)
+{
+	struct workqueue_struct *wq;
+	int cpu;
+
+	lockdep_assert_held(&wq_pool_mutex);
+
+	list_for_each_entry(wq, &workqueues, list) {
+		if (!(wq->flags & WQ_PREFER_PERCPU) || (wq->flags & __WQ_DESTROYING))
+			continue;
+		for_each_cpu(cpu, cpus)
+			prefer_percpu_wq_update_pwq(wq, cpu);
+	}
+}
+
 /**
  * workqueue_unbound_housekeeping_update - Propagate housekeeping cpumask update
  * @hk: the new housekeeping cpumask
@@ -7495,6 +7587,10 @@ static int workqueue_apply_unbound_cpumask(const cpumask_var_t unbound_cpumask)
  * that the effective unbound affinity is the intersection of the new housekeeping
  * with the requested affinity set via nohz_full=/isolcpus= or sysfs.
  *
+ * The pwqs of WQ_PREFER_PERCPU workqueues on newly isolated CPUs are moved to
+ * unbound pools, and back to their per-cpu pools once the CPUs stop being
+ * isolated.
+ *
  * Return: 0 on success and -errno on failure.
  */
 int workqueue_unbound_housekeeping_update(const struct cpumask *hk)
@@ -7519,8 +7615,18 @@ int workqueue_unbound_housekeeping_update(const struct cpumask *hk)
 		ret = workqueue_apply_unbound_cpumask(cpumask);
 
 	/* Save the current isolated cpumask & export it via sysfs */
-	if (!ret)
-		cpumask_andnot(wq_isolated_cpumask, cpu_possible_mask, hk);
+	if (!ret) {
+		cpumask_andnot(cpumask, cpu_possible_mask, hk);
+		if (!cpumask_equal(cpumask, wq_isolated_cpumask)) {
+			/*
+			 * CPUs that stay isolated are included too: their
+			 * unbound pool may run on a CPU that is now isolated.
+			 */
+			cpumask_or(cpumask, cpumask, wq_isolated_cpumask);
+			cpumask_andnot(wq_isolated_cpumask, cpu_possible_mask, hk);
+			wq_update_prefer_percpu_pwqs(cpumask);
+		}
+	}
 
 	mutex_unlock(&wq_pool_mutex);
 	free_cpumask_var(cpumask);
@@ -7891,8 +7997,11 @@ static int workqueue_set_unbound_cpumask(cpumask_var_t cpumask)
 	if (!cpumask_empty(cpumask)) {
 		ret = 0;
 		mutex_lock(&wq_pool_mutex);
-		if (!cpumask_equal(cpumask, wq_unbound_cpumask))
+		if (!cpumask_equal(cpumask, wq_unbound_cpumask)) {
 			ret = workqueue_apply_unbound_cpumask(cpumask);
+			if (!ret)
+				wq_update_prefer_percpu_pwqs(wq_isolated_cpumask);
+		}
 		if (!ret)
 			cpumask_copy(wq_requested_unbound_cpumask, cpumask);
 		mutex_unlock(&wq_pool_mutex);
-- 
2.56.0

