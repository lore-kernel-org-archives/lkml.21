Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645449;
	b=iyWkQw4YW5pH8MKAObunpdlKRN1ZxEor2xO4ITd9waHeKkBbPqTbDXBA80Trca2J4TAP
	 gR4ekPpvB3vTkW2U59eDJpjRQy5jmM/3n/IU4Ej3hwa6NyrIdTtL9EE4OkENIbT+KxASD
	 XgoNKKM4qQG/HR7eqFJQ04+IENVwuN+BoFlzOJ3xb1t4KXYkitsHxpEKS11nY6EUCRTlk
	 WDHIAhRZ6ljbnC9KuB7QrTWSdT51VBofu+Ft1obyJoxo5MeQ7eDGvWMlYmsBFX3YnTRuD
	 Z8V8q/aqMR013CknHXeMQhKxpmk9PTMdpK0AkAbGyIiYz8qifD93IfPZdTvh9+fdCdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645449;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=m+xyA/YAPfZKLB3t/OQKpDGAdIcBthxhhZ6cpFMFCVQ=;
	b=tn8fkAkOHjOhqZQ7WjCUuP3qaRMvI5KMBh+iAOC+msDc7QvCQLm/wMcazi/bavW7T+fL
	 L4Pu3Zba2+nkFcnl7pMsOepchtSb1miniOW9Ek9aHAopIJOYYJr4npScbB2Nmog3fbkr3
	 S8zYdtnPPsKvEFI5FboQ/hfzlX2BwobLrt0toxQST73ugK2LijPczMJL5KCNefpTUO9m4
	 gwxu3wguYpOhe9eML+D9p24jJmIyd22JcG7BF7zRlfpwrStT4FriEo1MGHivdI5KLapeS
	 XXwmThJtTyGDOakG75Owekg3ffYzJ8A4Bdk6vavK2HBasMOnsW7A4nMpF/SgMu9d8dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Om0m70wA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A692606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Om0m70wA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BFE1F000D2;
	Wed, 25 Nov 2026 22:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645448;
	bh=m+xyA/YAPfZKLB3t/OQKpDGAdIcBthxhhZ6cpFMFCVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Om0m70wAqLqaCfBUR96KJgX7tPsqxvw9bWDPwYUSct7f9/l1bAyre5US8oManeff2
	 ThPDmqiQHpr59GqOdzpT8e5iKy++8YjklUTxqzfwSZt+WIiMovG7b+VEqYGRP2FVIJ
	 codg79/aTAVHOfn4gsLopvxbTmiDGvH4pr4uD2jEplxaSmNSeRV/S7NzLdDr1crg7b
	 RJmDMi7vddOebLx6yFbv4CQvUMYHGZvZEq7KhKDWg0KEwZ9mjQ5Y8QqgYOsD+wJXA9
	 gvXBhXMqX4URyMoNLLO4JX243kelG61hhKge/rjcMyJHUq75oNWGbNeNys7p1Jrjxq
	 F9t5UGDsrdhUw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 24/47] clocksource/drivers/arm_arch_timer: Move CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:07 +0100
Message-ID: <20261125222230.22508-25-frederic@kernel.org>
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

The teardown callback here only clears the CPU from the
evtstrm_available cpumask, which is only ever checked locally for the
current CPU. And set/clear from other CPUs are atomic.

Therefore this callback is safe to run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 3c561a630962..6f4c609163e5 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

