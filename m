Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645402;
	b=pHYWrEEEdou0gz2wB3GMUCGpom0ackH8t2zHFvGkluwt5JmmeWM+dPmFF0GkFiTfg/z4
	 2bBJoQzuR6IfVYXITeAj3Tn5TA4XSrM4dD7+WwP3GBZI0UrRVSwq6lEMXfPiBg3kuP5da
	 da7NWgZmnlCH7w6lZbugGU1VhGae0fXAVIGCk4FxFkD9Tse9noOm68pdl3H4ZIeOEYrkW
	 /hmxfuRboe0Y2J+9yxibRtx3WqHEfmLG9fGH7HGLaoFPY/ytqc8YqiFGDLy0VXB7TbA64
	 x0E2miZt3tdX3oyEjiKps/RO93axmBRhQcmhk+8+AJhR53bYqS9Eq3s79K3aUsNIPLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645402;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tqq87PjAWergOujK9BgShpu69W26+6hCxhZ/7t5N0kc=;
	b=b7Gpzc5Eh0Sj5v+8rZ0fe+l3y7q9yEaICxQ9D4J2vgz1zSgR2Kt2CT+KKEbImY5V8VL4
	 k1mnJsMPVmrZ7ziJhXPCO5mTZ5Rf0enOs98iF+ISC4ES5C9h/KDwovKCXSeoJ8XnoEFhv
	 Y5hjn1KK3lOh4dfGLc+d6FD6S5+fF0twVAEsRnG7drfqd2fleFpMuYuNlTemoUC+uth54
	 +TYVSYyA9LA4+deaecVaM5rEfhYpMuwbCqnySe5H3CcYx9xWs1QovreMmi+foNY6yxBp2
	 Fk9kV+5Zvc0fLltsdpEl0/ZQxvuLCjIZL0DKgvqcVKpFX6YvXS77zqzNZPP0Xt+TLRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUAXBuq2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF96606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUAXBuq2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA15D1F000C0;
	Wed, 25 Nov 2026 22:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645402;
	bh=tqq87PjAWergOujK9BgShpu69W26+6hCxhZ/7t5N0kc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fUAXBuq2NFnLdlQzCbDvxRNOEAhIc4jqO/fcGeUB2uWdLrLKXzkVp9BuiMll4Slwe
	 KblTKgOqhwMtYbXD3c4dIcwNUpSEvAyYvDgq/YBzwWBrVWMU3LBZrcC1nU4y0xB/Pp
	 tn+UdSaiIJgy/6KVt1DkOI4vLZqDgmEHsm8rpGrhPuoU2q1MEzeTyqYOrXKo0Tb1/d
	 1aqysfwfwij3TwprYNluyjbPO4m++P196VcOqcLikz8NHU9XA7vHXaBZYKNwOPtFUL
	 Segd8TGrB5bGecqYue2VUpnCPvqcMiMe4gFXPbCF4PBWTTUquBL3F3WjEBy6vdMUbo
	 DZMo4JbhXiQ2A==
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
Subject: [PATCH 13/47] cpu: Move [CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING..CPUHP_AP_IRQ_RISCV_SBI_IPI_STARTING] range post stop_machine()
Date: Wed, 25 Nov 2026 23:21:56 +0100
Message-ID: <20261125222230.22508-14-frederic@kernel.org>
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

None of the states here have teardown callback.

Move them to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 151e4d9673b9..2dd34a38f878 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_RISCV_IMSIC_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_RISCV_IMSIC_STARTING);
+	WARN_ON(st->state != CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

