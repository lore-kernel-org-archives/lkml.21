Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645363;
	b=dHEFLuDDVyxtWNTnvDHRIoidDdiyBAdgD2pI6s4ayqEIzSaQ54+kzdRaMPLrPgYEB070
	 d+WKIjHgNbPgqbKpR2PbnPmKPm6i/lBAIc520lJLvMDu1IkWaFYNUccn7Kvz/avc342Nc
	 CUKHw04TgAxN9/IjcWryE9wJaWeGIT6gIoz6upftgRZGcNYbKvwkrzC8ZU8H6Hm3R/zFs
	 ZjZRZo1EmRRSAAXbp8rsYwSpDcaP30TVuw+1SfgqV+hWWDxClcUPubbN97+UzuS7uUErK
	 O3k2SDILgXuNNbQtrtDytNnVWbGkp7z51AhFyJV4zyFDj42iCN0hXfaPUi41E8C805Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645363;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=86bLXK8s8U4s1Jvbr0U1aUy1Zgm24FLaumqfEWd2HAI=;
	b=eZCH4kiDj/GuS1IJvKT0nmWybl74GRxUS9kOCtcqF6VH/4U2Ebbgm5Z5RUs2Q8oqfDmg
	 GBGboW8QGk9lsTxgcndRKn6HLyIt/5M13GUcCoqoeN4B8zIj6qqBTUvKhrkk1EKMjYhk3
	 nkm9+IWT/bkarzBGRvtNJqlI/fzKYtA/KvEBu9SK8ISrinkx5YhJd45TEMMxgQzCFAlyj
	 YHWBY02dZ8rYDKP9tMtHOCS0JeCg2Eu+593NS19WERUQ3n4kQI7gOiwSPZYKnHJmnKpSB
	 TIreNn8wpvomTKuQ1o7Cdb6dFDhmmCwupsuclWxWURtu8rPQFQrmFIRd/FXWyHdQaZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlpmcQQF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFB2606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlpmcQQF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F70F1F000C0;
	Wed, 25 Nov 2026 22:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645363;
	bh=86bLXK8s8U4s1Jvbr0U1aUy1Zgm24FLaumqfEWd2HAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SlpmcQQFEfmhzOGYamyEt73w7ZNzLR7WsXesx9v0G/dB20VZpPwjKVffjozBf5PyK
	 Q0bwNwbkD/3w7poAaQxzzKN1RCZMIcYjJ876hJpEWr+CmM3zRl7iByHrirg09gYNZQ
	 vclD4Qy+eg+QQEU8YRGKMPGT4K7hqFrpwhH0QuI4QMYgz/gBWzyc8JV5SJOuDRoN2j
	 DdOz+KlZOWgkYpmhlUKW0YT6o3bDGQEw8c8MeuwGAIzb7xJvl5SyKyXDAb13c5edsf
	 g73eaO2oywu7ECXmJkQNSpH/HbWvlvpAp7Zw8dFbklRzbIeRxPqd7OVn9lsWRoTXIE
	 zrJbjvd+SUGRQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 02/47] x86/cpu/cacheinfo: Move CPUHP_AP_CACHECTRL_STARTING to post stop machine
Date: Wed, 25 Nov 2026 23:21:45 +0100
Message-ID: <20261125222230.22508-3-frederic@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125222230.22508-1-frederic@kernel.org>
References: <20261125222230.22508-1-frederic@kernel.org>
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

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while temporarily stopping/pausing all CPUs
in the system. This doesn't mix well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The cpu_cacheinfo_mask is only accessed by hotplug operations and
therefore the current CPU can be cleared from it while other CPUs
have exited hotplug stop machine.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c        | 21 +++++++++++++++++++--
 kernel/sched/core.c |  1 -
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 1ae03f1e8f84..c48cdff149f6 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CACHECTRL_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1294,9 +1294,26 @@ static int take_cpu_down(void *_param)
 	 */
 	cpuhp_invoke_callback_range_nofail(false, cpu, st, target);
 
+	return 0;
+}
+
+static int take_cpu_down_post(void *_param)
+{
+	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
+	int cpu = smp_processor_id();
+
+	WARN_ON(st->state != CPUHP_AP_CACHECTRL_STARTING);
+
+	/*
+	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
+	 */
+	cpuhp_invoke_callback_range_nofail(false, cpu, st, target);
+
 	/* Park the stopper thread */
 	stop_machine_park(cpu);
 	return 0;
+
 }
 
 static int takedown_cpu(unsigned int cpu)
@@ -1313,7 +1330,7 @@ static int takedown_cpu(unsigned int cpu)
 	 */
 	irq_lock_sparse();
 
-	err = stop_machine_cpuslocked(take_cpu_down, NULL, NULL,
+	err = stop_machine_cpuslocked(take_cpu_down, take_cpu_down_post, NULL,
 				      cpumask_of(cpu));
 	if (err) {
 		/* CPU refused to die */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 515b9d0353ce..74e94fe8dcb4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6004,7 +6004,6 @@ static void sched_tick_stop(int cpu)
 	WARN_ON_ONCE(!tick_work_cpu);
 
 	twork = per_cpu_ptr(tick_work_cpu, cpu);
-	/* There cannot be competing actions, but don't rely on stop-machine. */
 	os = atomic_xchg(&twork->state, TICK_SCHED_REMOTE_OFFLINING);
 	WARN_ON_ONCE(os != TICK_SCHED_REMOTE_RUNNING);
 	/* Don't cancel, as this would mess up the state machine. */
-- 
2.56.1

