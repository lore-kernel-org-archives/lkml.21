Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536003;
	b=j3F+97L9Cif76DXQ8FqUMhvYxb9o5xqH532ZPhL2R85dnvWQvAwsvVxtZf2YDFU2/1nE
	 yrAN0VLjHZ/5tJepzDOUYz/jUPv8AHXFACjTkG5PEIg/2fIg5fV9DCL+CfI5nAVhSqwPi
	 9xYqcVX/KsqxRYByiQpB6oxbx8rMtJyXnVogwWmzo/rbgCBNAYyOh8CuHYirO9pWUr29j
	 VYvbek6t90luzQEHsCZb8ozQvxgQpAOf/eMGaY71UtVn2ki5VBzl9rH1Hk7FdSqLOvVIP
	 Emc6frkPSE+1wyYPqvkJGOlgNfBkMUxIvu839lcgewU4ckMR7z3LSEd6Vq7hoGsrYGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536003;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rL3yauhJSOYPMRDtwW6VqcZRfGD+hMiB8U0Y5a+546s=;
	b=G2LO3xJkpnwF2KZDPwgbiXiSryGZc5XoasWYzHdGQ6u1czFuP1UsHds2rxluRGp7pTzW
	 hiZL77DqDkvAJjf7D/i84OG0smRB2XcKCp2oeYd33w2J8AchJbBCFLLhqQ4A6+1eomESJ
	 PMQ0Gc97BQ+4X4v8IdF1aaNzdjNiHOmY6jcJNAlly0dwSalhbGOAYcLRIeb4KMCKeC0TV
	 Q6F7u3iz6koidWG1kLZsR6GxXZxQ2FU8QNfBZKbndMRGA5iotgWLQhudJZiAeIMJ3o7Kt
	 TQzNK+qCtEMoxiV4mYv2/gTClxgsOJcVBtSrbfYeeRkSn1wIh3dnGeC4c4vXPMNoxUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b="AJ/xrwr/";
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED71606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED71606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=AJ/xrwr/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rL3yauhJSOYPMRDtwW6VqcZRfGD+hMiB8U0Y5a+546s=;
  b=AJ/xrwr/ON7D+gAxRFgeMchuq4Xqiig50kJxryxCxXwRpI3NUkpka7wj
   uHsrXC9W6BGuld1+ZVOgLBSNKE3nUjJVFJ9zhCSw/FpFKNWwmdt69dVeA
   wgRKBvBZKVko856WPZdfVsNBNgjxcuG5pNiD5YIdZQS7DBE5cgDocIsih
   8=;
X-CSE-ConnectionGUID: Q6x/h2TaTi6q0l76VutpdA==
X-CSE-MsgGUID: PUVI08BJQjSy21/i26Ie2A==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,231,1787004000"; 
   d="scan'208";a="307136874"
Received: from nr-lil-536.grid5000.fr (HELO gros-29.nancy.grid5000.fr) ([194.254.60.35])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 16:59:52 +0100
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr,
	jean-pierre.lozi@inria.fr,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>
Subject: [PATCH] sched/fair: Don't pick recent_used_cpu if target has no LLC domain
Date: Tue, 24 Nov 2026 16:51:06 +0100
Message-Id: <20261124155107.358643-1-keisuke.nishimura@inria.fr>
X-Mailer: git-send-email 2.34.1
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

select_idle_sibling() can return prev or recent_used_cpu if they are idle
and share the LLC with target. However, cpus_share_cache() returns true
for any two isolated CPUs because their sd_llc_id is never set and keeps
the initial value.

As a result, the original implementation can move a task between
isolated CPUs.  Consider the following situation:
* isolcpus=1,2
* recent_used_cpu=1
* target=prev=2
* affinity=1,2

When CPU 1 is idle but CPU 2 is busy, select_idle_sibling() returns
recent_used_cpu (CPU 1).

To prevent the scheduler from moving the task among isolated CPUs, add a
check whether target has an LLC domain.

The path for prev is not impacted, because target == prev if target is
isolated. Add the same check there for consistency.

This bug was found with the help of verification using Frama-C.

Fixes: 32e839dda3ba ("sched/fair: Use a recently used CPU as an idle candidate and the basis for SIS")
Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
---
 kernel/sched/fair.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index da0d9e19c457..6314ff4c2f99 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9151,7 +9151,7 @@ static inline bool asym_fits_cpu(unsigned long util,
 static int select_idle_sibling(struct task_struct *p, int prev, int target)
 {
 	bool has_idle_core = false;
-	struct sched_domain *sd;
+	struct sched_domain *sd, *sd_asym;
 	unsigned long task_util, util_min, util_max;
 	int i, recent_used_cpu, prev_aff = -1;
 
@@ -9175,10 +9175,13 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	    asym_fits_cpu(task_util, util_min, util_max, target))
 		goto select_smt_priority;
 
+	/* NULL if target has no LLC domain, e.g. isolcpus */
+	sd = rcu_dereference_all(per_cpu(sd_llc, target));
+
 	/*
 	 * If the previous CPU is cache affine and idle, don't be stupid:
 	 */
-	if (prev != target && cpus_share_cache(prev, target) &&
+	if (prev != target && sd && cpus_share_cache(prev, target) &&
 	    choose_idle_cpu(prev, p) &&
 	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
 
@@ -9213,7 +9216,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	p->recent_used_cpu = prev;
 	if (recent_used_cpu != prev &&
 	    recent_used_cpu != target &&
-	    cpus_share_cache(recent_used_cpu, target) &&
+	    sd && cpus_share_cache(recent_used_cpu, target) &&
 	    choose_idle_cpu(recent_used_cpu, p) &&
 	    cpumask_test_cpu(recent_used_cpu, p->cpus_ptr) &&
 	    asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
@@ -9233,7 +9236,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	 * sd_asym_cpucapacity rather than sd_llc.
 	 */
 	if (sched_asym_cpucap_active()) {
-		sd = rcu_dereference_all(per_cpu(sd_asym_cpucapacity, target));
+		sd_asym = rcu_dereference_all(per_cpu(sd_asym_cpucapacity, target));
 		/*
 		 * On an asymmetric CPU capacity system where an exclusive
 		 * cpuset defines a symmetric island (i.e. one unique
@@ -9242,8 +9245,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 		 * SD_ASYM_CPUCAPACITY. These should follow the usual symmetric
 		 * capacity path.
 		 */
-		if (sd) {
-			i = select_idle_capacity(p, sd, target);
+		if (sd_asym) {
+			i = select_idle_capacity(p, sd_asym, target);
 			if ((unsigned int)i < nr_cpumask_bits) {
 				target = i;
 				goto select_smt_priority;
@@ -9252,7 +9255,6 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 		}
 	}
 
-	sd = rcu_dereference_all(per_cpu(sd_llc, target));
 	if (!sd)
 		return target;
 
-- 
2.34.1

