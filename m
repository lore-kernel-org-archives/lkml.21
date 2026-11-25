Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645484;
	b=N0xqijCPfEhqmzfouwj+DYg/7FN74B74vHdsX4EBLpFPCUwK0QrXNqCVGp+iz8XS7RMe
	 ez8Vsi4ZU0oA8YA8TLKZHaT+ldQ7mUudNCE/uppLM6Gq7osTGx52jRmIOB4vrt3gr/vcs
	 INOmU6ZLz+2MCaVkQ9rqydkR3uPvWQcx+dAgtEr2kzQaHZ9pd2a36dM7O12UlbGGa5kZt
	 bm+EmfS1Q5wwxkVVlp/45J69JDezgO0Cm1Oj/kPISQerLr8qQJhXCS3VpN1S228qWwyNK
	 eu9R4jL63hSxeaZa9KDtyV2KD5wYqMjBWrKy92SE50AmljGfu2hu7NmRhbbW45Dv8vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645484;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=i5vazvcfnV0Wy8Vw3tP41qxYi23zcjf6+MdorM4o35U=;
	b=4f/xtkf7rZ9/J8wefe+EWO+/Pi+oD3gC3qF5xyakSzsaxEv2eYwd/nOuQMJw63Im0GsG
	 GT8iCfZcvdpNVnXsy4GE55udIs34NQq27Q2GDKi5AUZejjHRqP+VLOgdypLeCKaF6MQzg
	 EsMBatwRWJ4VYCzptOhKOZ5U1T58qWs0HjZ94gnXgW5UBOPRalzaAjZkGMGB0AW1BhP8h
	 f5KvUR+o0u61CEmt7UMHFeYovM3Figs4++mYTxdrYs0LkGmImickEVP4dQPwF7PWQ8jfZ
	 l8IF6jvYi5lVVGcQtZPQwqLvSWEM1Yk/G1gkivMVMuCg4MfoWs5BmVsmy4eMgOD4HtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IiACLAZq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0EC606A69E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IiACLAZq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CBDF1F000D0;
	Wed, 25 Nov 2026 22:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645484;
	bh=i5vazvcfnV0Wy8Vw3tP41qxYi23zcjf6+MdorM4o35U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IiACLAZqvzWfwq0AuwdBZi6fJ6DSPcMtAPf7LG4KeWoAaqlyUmKgnaoha/LHnBTfI
	 Eldah/7bwK/N+eVI/SLWrYQC15hR9/L2ZagVFoG0u3NRs+tIuqDHUk6eOspgxTU2cM
	 ZZWtk2yuy1G3P9kX2p2d8kVHxaeE0LvmVIqxyg9Z0ieVoQuxb5iofcXUWggj0s6ykr
	 8ek28QKZKF0ApXL+2UXqkHFC/WPOX3CdUG+McyQUEeygkqVyVs06KlqumM+EdS7/q9
	 cnDP/hUi0553q027sHYP1z7pebtYCYx8pP0FvO789VOiSXfyfvs9zjKukw14dmlEl6
	 vR3WgkJ7kWNuw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 34/47] clocksource/drivers/rtl-otto: Move CPUHP_AP_REALTEK_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:17 +0100
Message-ID: <20261125222230.22508-35-frederic@kernel.org>
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

The state here has no teardown callback.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 3fb757c6bc7f..9b2e5862252e 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARC_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_REALTEK_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARC_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_REALTEK_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

