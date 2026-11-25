Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645368;
	b=FIvX2ytyHP7DbX2KOTiBxNa+apVNZGI+mvgovW8Q2+PkvmhIqMB9b52PjmlperkZEnVv
	 DSQJsPELxZUgFCA5w3cbnrh6nLoYGiiIlC3Oy2LqhXQ1vTVjL5D9B60n+Q+dKnL0NBZKu
	 Iz0G7h/obxmhi+mN33OLG62d1bRRK1EP2KcA4EnX8KFUeb+8wCUlCnWQHXbjh58P7+e9m
	 bHJ0fRbmuVbHhERmsuJGspoLJvMxHaBcikBC6i9mrvSUeDswUbJX/CPYXuRShwQF0irNj
	 ApLptBT8axg6PjoaPknxjdGfmjYfFhR9nRJTvnT/n+WKtK8Amd7CDDZSXH45tClH13A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645368;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UXNiQTka2tjnPNXkEqNEzVeeNsSU81Pic2jc9aZOjUU=;
	b=RJVC1p8YbhIPjJkDjjONe6SSg+UwIzjGHfaQK2NH/0ir2/RSce+lOwJj6IljQOIp6L9S
	 z9DWy///v3xg8HIwo1xA8aO6KN/ppPn8NBctMQ53MAyYhsDa2mOKWF933a5B5SUyxOlso
	 qnl1ZgqJi/WtKdhDmh99FoJyq+mIjzHQiwkWdPG2zjXkMOHLjGEIdfipnZy5VX+3TscJm
	 ynYC0e31w4lX0pOvqWiVqe+baMxWSRn7llcqujryquvLDFoiTWL2TYBwu7qt1ELnArfFD
	 XNZ0DvjuoyBbpGpAdEbIPEzkXUz6d0CyPBTixiwQhmqEdabD1kqZ8P00L1etlgdVfmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfnaQ3Sh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55003606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfnaQ3Sh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630B01F000D0;
	Wed, 25 Nov 2026 22:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645367;
	bh=UXNiQTka2tjnPNXkEqNEzVeeNsSU81Pic2jc9aZOjUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XfnaQ3ShWWKAA4gbAD6jS7lUmAQb+IeSguREvn73iWEZez6gT2C0KKL4rD5OIuC3D
	 W9D+dW13n5RYujiJGBXPUcVw00D/grRIkqmEIKRdxzkiC1lV3CRbu/URLj8AoZmMKG
	 6sDkWcttSOuW5jkzqtGMgwtOiA7iOAa3yXtkaC6foQtO8Q48gga6uLuWhQewe6jUgH
	 Pw0L2r0JU2/Mowcd5IvyMSRJRcTFTbJ/+PvNN+zYRQhiAZkKFDz+iYhZ3RKRCLhLsV
	 sVzLOH6aDeIlQSOyxXTjZ3065Id4KMGKXW0BGuAPK52lbvpVVm1yuJpZaSOLx0SlSp
	 xYwiranna/BRA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Mel Gorman <mgorman@suse.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Waiman Long <longman@redhat.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 03/47] sched: Move CPUHP_AP_SCHED_STARTING to post stop_machine()
Date: Wed, 25 Nov 2026 23:21:46 +0100
Message-ID: <20261125222230.22508-4-frederic@kernel.org>
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

- The nohz_full remote tick can be shutdown safely while it runs
  concurrently.

- Updating the RQ clock shouldn't be a problem while offline with other
  CPUs around.

- Since it is seen offline, no task can be queued to it remotely.

- dl server stop is sychronized with rq lock. hrtimer_try_to_cancel()
  can become racy but then if it fires, it will just early return.

- calc_load_migrate() just folds local load to the global accumulation

- update_max_interval() only depends on the number of online CPUs, which
  is stable at this stage.

- hrtick_clear() deals with a strictly local timer

- sched_core_cpu_dying() doesn't race with anything

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index c48cdff149f6..6e6d3a3016a5 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CACHECTRL_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_SCHED_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,8 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_CACHECTRL_STARTING);
-
+	WARN_ON(st->state != CPUHP_AP_SCHED_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

