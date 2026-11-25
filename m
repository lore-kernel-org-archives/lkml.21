Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645489;
	b=jTf+rSq0uxV01jY4hdaBYAj55gS26+5LXcgxi2lmEtlUgqnWUrk0+7ojfjtsVrZituNf
	 7N5va8DC0SqNT1BAU7/TvX4dI+T5b1TyR1vlSyCvQ0B9DQNmV82/mn0DXvcCWPXllDLPn
	 qU8oRcG1ayZNc7igg1+u3lwfIwQf0flS+MpgzgEgPhPWObrrdjuLi7oLQ2leYQcu8+8ZG
	 j8+U6EP4I8q6BHOHSO6wyWM6leekD+7aWjfxDZJxrH7LlOdh76+qrpztJpAJGL8Q8fLXj
	 ZvMePDjpBUphh006xXsBIzwJqZCc0+nPDaBX/bkqolhCCHkQyxCIEWOTghi/5ey4jbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645489;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Hc43azH6Tb1WdzlvfHjt4N56DJv/rfL6uT4GbRUEI9k=;
	b=Yv1hrb6nncqWbUQd/g2AXeW0y2C7enWBSYtnNQmlLLA8GWjXoSvPKPD3H22mDBtz44tn
	 gHM9vPytpW0O7Durw6vFKd2ADjZws/C/dBSqAZ07bbHvKtXqixXBX5KmWgtFjHefrpVGw
	 1BnZYwbKn0HWQmzzgNCOZtkJq7ljzQjDWInor610/T7/QKYA72xaLafLUk4LUk4AgOiai
	 i7FvvCTTWeUQp0lYEcjmGbtNm1kBOAmoOwfR096zdlqQb3oVjvw6zhbcc32qKRpSLUgFo
	 t6hKTRVqXLNey/l6i5xHl4mgp8IK5w7i2xpWIk1R60s0AIH9zY2y68zJUJN1O9fjvjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IrMtKc78;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FD4606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IrMtKc78
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05DD91F00A03;
	Wed, 25 Nov 2026 22:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645488;
	bh=Hc43azH6Tb1WdzlvfHjt4N56DJv/rfL6uT4GbRUEI9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IrMtKc78Y5XVO5MYskty8tMk13KmuVLC991d0tMFoGRUHi8wRmGxAeZkTfLuk7lLx
	 pWReiq8CLLiZi3aLCj3o/+d6or93agZQ/CcvKawZCLTggjDFZZoJ9KCX/G+RTw9sXw
	 EnXkYO4y1NZMZ0ce9275dK7ynm//FHDI4JLuSGd2r6psaipxN1vCPIpSehlARlAZNB
	 iSdipKAZiAhbeBLhr6KPMCTTy7EwhTEYeVCY54HQlUOcNz7PU1Mi7Wqnv51pd2bTvK
	 cXrfIrRyPoMmICs7gaLrY7jtMuHF+nkZFxN6+2UpDEC23cPVth4brggvlkKJhemsWl
	 k3luuIaA7d8Bw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-riscv@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 35/47] clocksource/drivers/timer-riscv: Move CPUHP_AP_RISCV_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:18 +0100
Message-ID: <20261125222230.22508-36-frederic@kernel.org>
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

The teardown callback here simply performs timer and IRQ disablement,
both of which can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 9b2e5862252e..04692ae09199 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_REALTEK_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_RISCV_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_REALTEK_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_RISCV_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

