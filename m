Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437982;
	b=EEr4/rnY5qoMyRtDs6snaeMT5Us2bXGwKVXIUq8/nI74cAo5IlFMGAH4g9JDuhusenHz
	 6LmKMZ16rc7TT9NKA3XRh8nfIUTDvlxDhvIVr8Go9o9CZmyQCv4cgVHBeomLpPByikIvR
	 xqwcEkGihmF/dLTCdNofQyK+uk5m7VEk2hcetHU/9sqdptT/4v5Rwj/uyB2ArfZhoarji
	 X3cXiTxA0Gdyx96oQurxVE0P/c7jPH1Df7/wQpLNVSR7iFpVQGfCQPPGdlZf8wBG7iD4y
	 IhUmSF7hgMSXgfKtM3Wt+iOr6YKsrS1zecZavtCIPcy1uNR0YvhKWLi7nJnPqseK6lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437982;
	h=DMARC-Filter:DKIM-Signature:X-Mailer:X-Original-From:References:
	 Content-Transfer-Encoding:In-Reply-To:Message-Id:Mime-Version:
	 X-Lms-Return-Path:From:Date:Subject:Content-Type:To:Cc;
	bh=Rr7XQvYoMvmSXTMNSdIBzWY4I0Wo9TMUxMvepaQt/WM=;
	b=wYjNmENabNZ8PvR+WXcbKnbjDRR3MWO0hAdGcC2EmoG4DiihVM4r+rngqqZx0b3uOQDU
	 uZu8o2je/gMaq2i2kmZoIjIbY/p1uqwml2X0lUstGGt40KRfl+v33o1Cp/iMMk9huhIp1
	 oByueKDTn+ESSlBZUiq+VkG+c9QJSe9sK66oCSl9ezVbryD1GliUyDoVWd/YB6qEZKuW9
	 RfDCfKrOa1vmwt08hx7TJ+4aQJSHhEj5Pr19v2z2Oejd5obgPb1oeAVGo717nEYzK0/EB
	 Ae2F2Uvo4kt5AOtXJaIFErtPcRO7bllvknAqLOj3SMZwxkTFfpvyVNoW8vmgaONsG5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=GrzQQSW3;
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F83606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F83606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=GrzQQSW3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1795437973; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Rr7XQvYoMvmSXTMNSdIBzWY4I0Wo9TMUxMvepaQt/WM=;
 b=GrzQQSW34vqkCQhpLh5rY2S8Ew6UiUcPgwNqriOeuaXtqK7rIyOsNdJKpSlUe0qtAKN8rV
 eC6BOOic9NP9sl7prB0NuL0YItMR0giw0g+RQ3caSQ+4ob0/i3Lkth1WBBTiAcQQa8UFec
 cN1xcqDuBw3c/GpruYiFmAie4AZ/C2VH2dtTgg9OCgPSo5BcL370EomynWuGoPiu92959F
 ZkN6t+Ml+mMO6SndbU7EfTPemv04Qb6kZEl7/qw7iCnFpIxzhYOKa4x5oyeStokassSt1F
 8qtPjVfuQ111K+l07TXTjq0BkxnaXLbdbaC8SE366sZVRYe/A8tBbCGG+pERBw==
X-Mailer: git-send-email 2.20.1
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
References: <cover.1795436486.git.zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <cover.1795436486.git.zhouchuyi@bytedance.com>
Message-Id: <95bc3ba0a481b2ef09ce8e3258c78b58b6a42a02.1795436486.git.zhouchuyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26b043593+01bfb4+vger.kernel.org+zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Date: Mon, 23 Nov 2026 20:45:23 +0800
Subject: [PATCH 2/3] cgroup/cpuset: Check v2 partition overlap in a single pass
Content-Type: text/plain; charset=UTF-8
To: <longman@redhat.com>, <tj@kernel.org>, <hannes@cmpxchg.org>, 
	<mkoutny@suse.com>, <ridong.chen@linux.dev>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>

generate_sched_domains() checks that the effective CPU masks of cgroup
v2 root partitions with load balancing enabled are disjoint. It compares
every pair of nonempty masks and warns on overlap. For P masks, this
takes P * (P - 1) / 2 intersection tests.

Copy the first mask into a scratch mask. Check each remaining mask for
overlap with the scratch mask before adding its CPUs. This takes one
intersection test and one union per remaining partition.

Reuse the scratch mask allocated at boot for task attachment. Both
users hold cpuset_mutex and overwrite the mask before reading it, so
the check needs no additional allocation.

On a dual-socket Xeon Platinum 8582C with 240 online CPUs, changing a
child partition's cpuset.cpus triggered a domain rebuild. The table
shows median time in generate_sched_domains() in microseconds. The
partition count includes the top partition.

    Partitions      Before         After
             2       0.524         0.520
             8       0.775         0.657
            32       3.734         1.222
            64      11.875         1.797
           128      42.936         3.138
           192      93.781         4.700
           238     142.305         5.424

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
---
 kernel/cgroup/cpuset-internal.h |  1 -
 kernel/cgroup/cpuset.c          | 41 +++++++++++++++++----------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/kernel/cgroup/cpuset-internal.h b/kernel/cgroup/cpuset-internal.h
index 1ba94ffaff9d..42abe241a251 100644
--- a/kernel/cgroup/cpuset-internal.h
+++ b/kernel/cgroup/cpuset-internal.h
@@ -257,7 +257,6 @@ static inline int is_spread_slab(const struct cpuset *cs)
 }
 
 /*
- * Helper routine for generate_sched_domains().
  * Do cpusets a, b have overlapping effective cpus_allowed masks?
  */
 static inline int cpusets_overlap(struct cpuset *a, struct cpuset *b)
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 633fd05f513e..2e09abb9e864 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -119,6 +119,12 @@ static const char * const perr_strings[] = {
 static DEFINE_MUTEX(cpuset_top_mutex);
 static DEFINE_MUTEX(cpuset_mutex);
 
+/*
+ * Scratch mask for task attachment and sched domain generation. Each user
+ * must initialize the mask and hold cpuset_mutex for its entire use.
+ */
+static cpumask_var_t cpuset_scratch_mask;
+
 /*
  * File level internal variables below follow one of the following exclusion
  * rules.
@@ -865,10 +871,10 @@ static int generate_sched_domains(cpumask_var_t **domains,
 {
 	struct cpuset *cp;	/* top-down scan of cpusets */
 	struct cpuset **csa;	/* array of all cpuset ptrs */
-	int i, j;		/* indices for partition finding loops */
 	cpumask_var_t *doms;	/* resulting partition; i.e. sched domains */
 	int ndoms = 0;		/* number of sched domains in result */
 	struct cgroup_subsys_state *pos_css;
+	int i;
 
 	if (!cpuset_v2())
 		return cpuset1_generate_sched_domains(domains, attributes);
@@ -907,14 +913,16 @@ static int generate_sched_domains(cpumask_var_t **domains,
 	}
 	rcu_read_unlock();
 
-	for (i = 0; i < ndoms; i++) {
-		for (j = i + 1; j < ndoms; j++) {
-			if (cpusets_overlap(csa[i], csa[j]))
-				/*
-				 * Cgroup v2 shouldn't pass down overlapping
-				 * partition root cpusets.
-				 */
-				WARN_ON_ONCE(1);
+	/* Each CPU can belong to only one load-balancing partition. */
+	if (ndoms > 1) {
+		struct cpumask *seen = cpuset_scratch_mask;
+
+		cpumask_copy(seen, csa[0]->effective_cpus);
+		for (i = 1; i < ndoms; i++) {
+			const struct cpumask *cpus = csa[i]->effective_cpus;
+
+			WARN_ON_ONCE(cpumask_intersects(seen, cpus));
+			cpumask_or(seen, seen, cpus);
 		}
 	}
 
@@ -3307,13 +3315,6 @@ static void cpuset_cancel_attach(struct cgroup_taskset *tset)
 	mutex_unlock(&cpuset_mutex);
 }
 
-/*
- * Protected by cpuset_mutex. cpus_attach is used only by cpuset_attach_task()
- * but we can't allocate it dynamically there.  Define it global and
- * allocate from cpuset_init().
- */
-static cpumask_var_t cpus_attach;
-
 static void cpuset_attach_task(struct cpuset *cs, struct task_struct *task)
 {
 	struct mm_struct *mm;
@@ -3321,15 +3322,15 @@ static void cpuset_attach_task(struct cpuset *cs, struct task_struct *task)
 	lockdep_assert_cpuset_lock_held();
 
 	if (cs != &top_cpuset)
-		guarantee_active_cpus(task, cpus_attach);
+		guarantee_active_cpus(task, cpuset_scratch_mask);
 	else
-		cpumask_andnot(cpus_attach, task_cpu_possible_mask(task),
+		cpumask_andnot(cpuset_scratch_mask, task_cpu_possible_mask(task),
 			       subpartitions_cpus);
 	/*
 	 * can_attach beforehand should guarantee that this doesn't
 	 * fail.  TODO: have a better way to handle failure here
 	 */
-	WARN_ON_ONCE(set_cpus_allowed_ptr(task, cpus_attach));
+	WARN_ON_ONCE(set_cpus_allowed_ptr(task, cpuset_scratch_mask));
 
 	if (cpuset_v2() && !attach_ctx.mems_updated)
 		return;
@@ -3915,7 +3916,7 @@ int __init cpuset_init(void)
 
 	cpuset1_init(&top_cpuset);
 
-	BUG_ON(!alloc_cpumask_var(&cpus_attach, GFP_KERNEL));
+	BUG_ON(!alloc_cpumask_var(&cpuset_scratch_mask, GFP_KERNEL));
 
 	if (housekeeping_enabled(HK_TYPE_DOMAIN_BOOT))
 		cpumask_andnot(isolated_cpus, cpu_possible_mask,
-- 
2.20.1
