Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645445;
	b=A92UPzDTqkhsaghngSwxv6JSrMStQLRPtYtb5uvbjmblVgiTDo7U8CXoNaUtOpma4Izq
	 wiHwfSeNuGJl8oGmakj7zPNwJL1m0QGfGT7BBkfqlCfj5/dGIKGO1aijxmhrt1kwOvPts
	 BVOkORcrqCCNDitONWM7CJrzc9ZCPgQ8PgxVWHvYeONVf0coq6XDLSR8QgYV0UpGlVQ7n
	 MVmzc3lfyILktzPd37aQ+TvvDCWa5O+ZYC11x1QvMycmRYR+9RPw7mmJ3WcaxN1IbdyO8
	 XTfcTpmvp33DJYalyruB8KzKCWWa5g4GxJnBnxqEWc2b9tRxdeKXkWpHNXJ+q0FSNsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645445;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cVYMUnsVmf+wMbK1t95JHPCYwvIKMaMD6MuKL2jnH+I=;
	b=hhsU75E3CDegSSQK5tUxpoErtqn7th97qoIZQ/k8jAkssUkgz4NbqT93pBzcWg2wiagb
	 VPswoEO7JO+1HaXUCVSpRvZDK1RyYsHydb51Ai6/ErP+iTzbvCO6FwpXStIdTkMdnSQZb
	 PxjoIhIC/Z2cu1bdyAdqis4cZxl/NxPn1bHOIeRhw+V9t8rDngm4uDJWUuS9FVzVd/pYf
	 KuEaFy5iKML1s6hKlZf6Oe/hAhqDIE6XEcM6eNbFzdWKXT2z1uJAfBJ/gonCuY6Vo+be5
	 jMQEk6ab7R7mLez/U45lvJPZoYe1keOrbxGYoCe5mQqGLwd+/HSUZTu72V5koqK+K/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jswzLziz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F807606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jswzLziz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F83C1F000C6;
	Wed, 25 Nov 2026 22:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645445;
	bh=cVYMUnsVmf+wMbK1t95JHPCYwvIKMaMD6MuKL2jnH+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jswzLzizKtwuXhK8wdco9Z4FYCvE2BqXZfZU9XdJRlycJiRucWiLC+LB14C68pJM6
	 1XKCC1PcgpUshy/hITiRy/Af+clH2FwDFpg2fQsyliq4xcOaFnHfst7YCC7d49tOJT
	 rLJoBtAzYhR7liX8ilVN4FqcGicWaq1wkNq1WmOIEOQv6qgFA1rzKXmPEVnhhbzXfX
	 QkoR15AkCP0isqRFUdrKD15KwmlzNbK3pr62EKznH8mM+fGjQyj2aK6i6FsPK5R7sL
	 6O+cQaaZPsuND3/BLAtGOVS+VgR7v00DJSmFeKy4PUZ2UmrAeTB+EA25DulbG66oU6
	 JHruF0hEMZClQ==
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
Subject: [PATCH 23/47] clocksource/drivers/arm_arch_timer: Move CPUHP_AP_ARM_ARCH_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:06 +0100
Message-ID: <20261125222230.22508-24-frederic@kernel.org>
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

The teardown callback here simply performs IRQs disablement, which can run
concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index a4db04807aa7..3c561a630962 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

