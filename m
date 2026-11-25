Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645521;
	b=ssSaz+Nw/UVodv0xwliI24Cp290UnP26GphNqwHb3VTG93U1Mev2Odi/KrnIkrOrJfAn
	 Q2xsC+K2jfxQsfd4CE38Q/RncnRhUJ6UHlmpJrqAxalQJISjlNvA2BRc0DTf/LC9GPkoM
	 rwQ8sET0nqZF99EteIy0x2FY5xq1/2IHXoQqqbt3aff3oejuYrNUo/eGbNUqYLE1radXY
	 5UaMk9Ow1pKVRb0VfpvsjIoZ6XzzwCqfXoXfBA/9UovK4ZMSoDtMGN/X0q76maVyZe/bL
	 x6yPcVq0iPU0QLjtz+WBciQLwYqfLskicCxGuFgWh3W5oUduMtJrELuQn2Ok+uW9f2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645521;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FHG4JsoVuSoXHF5vV/t0nkGngcF2J0LeP1cVtYmJ/M8=;
	b=K2Y3Ilvr9dLYByIVvBqjy+5awgGKW9i2af0mc7HD+XpNef8uI/kyTTTqtz7krv6aCYVX
	 CON583K2Ww1yVWcT89ckL07tz1dPsqqdGLrMtnNo+8L34yu4s+Q59rhVoHYdZU+V55/9P
	 r1up4/JUppICtqec2XayWpU2EeCir95OgEO6OhreYgpgU3kQz7FZBNItzWtqG0pP30WUc
	 47CKkNDZ5OL3EGwcld8SDBCWhXzTedfGbZS/wFCtVE0JvQXJLtutG5sIPdJrC6yKdlfw8
	 NfLds0rHXQluZfbM9RAMG7J37Vl8kO/fTZQSRos4BHmHgl1AAI7lpyU1Yg/v8vH5Xgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ao73/iEj";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C57160A261B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ao73/iEj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4466E1F000EF;
	Wed, 25 Nov 2026 22:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645521;
	bh=FHG4JsoVuSoXHF5vV/t0nkGngcF2J0LeP1cVtYmJ/M8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ao73/iEj2JNn4KYflJntWmAzNz+29+bsB99x/+x/AE3PGz1pDzV9v3Nn49WOQv+tb
	 1U6OsnfYfxOJKTQDvRNDoI2EBOvIj/MNSFXz7nFPURbWSAmlsigWLK0dUOK4dI2mTs
	 d7+nFUwkIlzcqjGC6xM6Wmft6PyXbzPVSNgWVQTWmR0ftU/Zx7mkMm+girBdFnZULq
	 1mm+yMtKZ8zzNDMWchnZHWASUjHSCZ+oubvQPJeeqLnEHdRV9BVoo+aaqPk9K04XIF
	 N1nvAiOhYxy/03yGjhyKavdgpaJwnSq8PDBka7F8Qadyjl13QaLJMehhJgjzWe0Pcr
	 hhg8FVIbaVR5g==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 45/47] tick: Move CPUHP_AP_TICK_DYING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:28 +0100
Message-ID: <20261125222230.22508-46-frederic@kernel.org>
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

The teardown callback here can run concurrently with other CPUs:

* The cancelled local tick doesn't interact with other CPUs.
* The local clockevents are removed under the clockevents_lock
* The CPU is removed from broadcasting under the tick_broadcast_lock

The only needed change is to send an IPI to the new timekeeper because
outside stop machine, other CPUs may be in dynticks mode.

Then the teardown callback can be moved to post stop_machine()
accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c              |  4 ++--
 kernel/time/tick-common.c | 15 +++++++++------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 4d34c4ed9836..82943ec3ba28 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_HRTIMERS_DYING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_TICK_DYING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_HRTIMERS_DYING);
+	WARN_ON(st->state != CPUHP_AP_TICK_DYING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
index 6a9198a4279b..16e29f38dcb8 100644
--- a/kernel/time/tick-common.c
+++ b/kernel/time/tick-common.c
@@ -16,6 +16,8 @@
 #include <linux/percpu.h>
 #include <linux/profile.h>
 #include <linux/sched.h>
+#include <linux/sched/isolation.h>
+#include <linux/sched/nohz.h>
 #include <linux/module.h>
 #include <trace/events/power.h>
 
@@ -394,13 +396,14 @@ void tick_assert_timekeeping_handover(void)
 int tick_cpu_dying(unsigned int dying_cpu)
 {
 	/*
-	 * If the current CPU is the timekeeper, it's the only one that can
-	 * safely hand over its duty. Also all online CPUs are in stop
-	 * machine, guaranteed not to be idle, therefore there is no
-	 * concurrency and it's safe to pick any online successor.
+	 * If the current CPU is the timekeeper, hand over to any online
+	 * CPU and kick it out of nohz if needed
 	 */
-	if (tick_do_timer_cpu == dying_cpu)
-		tick_do_timer_cpu = cpumask_first(cpu_online_mask);
+	if (tick_do_timer_cpu == dying_cpu) {
+		int timekeeper = cpumask_any_and(housekeeping_cpumask(HK_TYPE_KERNEL_NOISE), cpu_online_mask);
+		WRITE_ONCE(tick_do_timer_cpu, timekeeper);
+		wake_up_nohz_cpu(timekeeper);
+	}
 
 	/* Make sure the CPU won't try to retake the timekeeping duty */
 	tick_sched_timer_dying(dying_cpu);
-- 
2.56.1

