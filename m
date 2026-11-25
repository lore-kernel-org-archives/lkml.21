Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645425;
	b=3RJgNjFp9WPBnc6PtIeRabwSpH4MkX5GHJoFZbAJQ3609v2larivpxAd8U1Vns8Hof+3
	 jKSLdtaXi0LvA9oYknhLJxUXAEDb/1PeXnArbp0B8xaI67Ul29CrIQAKavwHu5yWFmcYr
	 NZbzC3LHqGzg2jVoYPfutBkwWgkkrCeEjsyY83gGU0nMQESuwd0rtNNCOjGstLrj3dRYG
	 pkGjhF1tRWCRxElMxE4FHhzU3TdJsHNxLGANuWlYo5S1BWE5TqaHPn61rbEILgGd0DO8a
	 xuRwe4VzwwxVs+KN7gO8Z71swi44dej/LjC/v+wepaTeq70NyIgJJaN40KfyWwl/Gxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645425;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=c1hyPPH9eqTvlu+0K10o2Lpid4af9BR3SI61oMif7ww=;
	b=v+f5VvgULNCD/qzkfqZOT2HH6SjkDdGZkrU/TwD7JUsKs27LqP7yAa0SBpIyUZGmtTDM
	 bhrohKzIVmxiwnhnNRrSOoCf6iVuNF27UEsrRi8t3TevUtUcgxeYgxQArbX3OJAbst+YS
	 OpDrdJG8f8yZwtl2DtEf6Yyi1ztTJ+UZ9SRXolN63wHoJ5TyjlRSgKCHEnVOjGonevxo4
	 zA8y51pk60Z3DNsGMjE/w3hnJqzPla8mNUNuHFv3Tu04si+aMuxLVdVrTACyFoOxhEdNa
	 JMJ6dG/SR8f1o6AJDnb1awRnY9znIsLpyW+Ri23dvTbxqrruKtCeDPi7l+loDao3uSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsDLaSpR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31393606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsDLaSpR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DBB1F000EE;
	Wed, 25 Nov 2026 22:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645424;
	bh=c1hyPPH9eqTvlu+0K10o2Lpid4af9BR3SI61oMif7ww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IsDLaSpRNCyutldabbb45zlMDYcFYbAnR8gD0xOjrEKKCBeWOJC73SC+F5kgDf0mc
	 RsomeyZ0/Ydhk+xfjExhuJNOWCtdUzwctDaLq1bqB1zuWcmD+VE4v8LhFztkoldhvJ
	 odMXuEbVq42NdI+znZQ6HMlYlTrLmsn9JEsbH50JSQAyWTJ+uHscBH7Gu+s+2KQeRm
	 QGcuZDtV1gofmmv+rk6ljrJ1/KpjsNIP19VsNNfHu+ZNm8QEh25nR/BShTSewAWpGB
	 ossxseoKwK1OII2/CIODT4sv9ED8T0O11hcyVZSTL8iK/GmYK43SkRXkO84ijCKkGZ
	 98iT/FSof3HBg==
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
Subject: [PATCH 18/47] cpu: Move [CPUHP_AP_PERF_ARM_ACPI_STARTING..CPUHP_AP_ARM64_DEBUG_MONITORS_STARTING] range post stop_machine()
Date: Wed, 25 Nov 2026 23:22:01 +0100
Message-ID: <20261125222230.22508-19-frederic@kernel.org>
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

None of the states here have a teardown callback.

Move them to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 4952a53e028b..37cca370794a 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_VFP_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_ARM_ACPI_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_VFP_STARTING);
+	WARN_ON(st->state != CPUHP_AP_PERF_ARM_ACPI_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

