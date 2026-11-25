Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645491;
	b=B48IFYRg8w3ksxW54hbMKdrtRvt54CKQsveHJ9aSkfkoTdYKgoZjdI5Y2Z8mrUjcAjQh
	 C3Iihq40ZTMVAsBNMSDCcZuRIfhAObrdue8n3Tjd6t2eKXIm/oUt8DX+4BlbSiSDavk1o
	 PPUFiKjnOU5jpX4xZwDeWZQxbb2Cx6dB2Zw+dWbB3bjrZo7VbgUxlYv02eBEQ1Fp8hQ+5
	 zO0e1Lm1AXmJ8kmScePhZh+xApLCLbqY8QWXEyuOXTI0bone0KqUYeXUaaKFGA4+zfL/w
	 zSwRLvt66+LeUVnQ8JOzMzSsYQwbuZyfPHgIfYhgm3cqzPTBs/XROxDpvdGn7XGikNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645491;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UcZ7mOgFh685TzxnG1Oj29VOs8V8EYpoXgr8Hfl4oKI=;
	b=Q73TUEauFiPkVdzMZvDDFTgCvu6vDpnt/Oq8shjmvHNztcjR6nm+Pw/sSEa9dJOuqS6J
	 0T1vvJqMz4d07nUgoxYD5cq1x8bl6iYuKtWVCNfvvg3R3DcJl+Vg7IVJyYPNoOX0/Nt2D
	 VKhRfELjb+40vw96jroc1pC1XlxTUZI89/FDOeAu/kOWfOpKIrLQS2/+0cumXQFIAaiFe
	 YDeUj0YVIf5X55kRPdSp+/FHp/SNZo47488DCBTn2VRIBaI1Scohib3HwtmeOweevU0mX
	 wzzsS1DkfiG3VhTF3wUEOvh5XLRFStXQwVlGwz+QC4JxHnAYbINH/Q8aR0/1aM2HIZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWnbJPE8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7D4606A6B7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWnbJPE8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046E61F00ACF;
	Wed, 25 Nov 2026 22:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645491;
	bh=UcZ7mOgFh685TzxnG1Oj29VOs8V8EYpoXgr8Hfl4oKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WWnbJPE8XFVcANHe9fbbx1P6UgKgoeJiEF+dmy1DFCK63HNLFmIEgmgCllVUK1BRV
	 x8ENUTkO1xCeiPjaaZ15a43ASb9lLjzEQ1VHGSGBuWFZ2dCofQ0FT+M8QjnAJALxBq
	 jImVRKyBpGoyBJ3+s7DtqZlP8mvrLzELp1fg/GPrVdXril98k4PXUPKm5pfVKs+/jt
	 pz6vMXwGGHCxfRCQ8TtmQnOCnobi7EGYKpqDMYsxJm9VWpZoEuZ3ngouJASPf0xIrt
	 nZrrO5/XMfjN1VdacE9v4kF4pbHF53HaNnFogI3kjT0Z4Xlq+VMRl/syjynEiRDa0w
	 uJl9PZI6LacAQ==
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
Subject: [PATCH 36/47] clocksource: clint: Move CPUHP_AP_CLINT_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:19 +0100
Message-ID: <20261125222230.22508-37-frederic@kernel.org>
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

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 04692ae09199..01c343b4daea 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_RISCV_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CLINT_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_RISCV_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_CLINT_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

