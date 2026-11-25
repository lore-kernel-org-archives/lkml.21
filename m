Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645498;
	b=O9hyaIt46WSk67VtMDWfItLgEH4dQtR4s7hjoXdhIZ0anIniBtOde3Pq3GrjmCID9Ndk
	 He0TlbiyykVzR071t9aMFqrs/4K6M/LiMxRJGN4e19bQwmhkuNdAdnOo8Igs3MbMflDYC
	 6mtJqRcAdc4Hz5jfpQn4TojIAP6ym0k/mUvTu+EgXjbaiFwooq63BJ2hN2CDooPfNMhvQ
	 RTm7dnSmrYEU39vvMs24cCznOLSU6mMlw5GUwNgyGlm8aMvf/99U0T/FJ5vFkY2h6Hhq6
	 Tlvqp/X5qUlWXiyOF/Jwj2ZOBsctTEnAwC05mRP/fLNjsUnF7bY2CLKATgUzPMe7wfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645498;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=j0FjBMfl8wayHfVJXjo7ht/8WDFTgZnFUWocxKFeOKU=;
	b=f2Kd85pdf8RLknBSvULwEw30MROv2ncw2vHp5OiXOHG1zTuUKq5vX0RBl5++t5wvVhOu
	 3eZvtetdYKSqikRlKJm3Wsq2/I5eobCL+RriOD9Vde/BPSUB2lRWM8CZ4i6FLxSbRFkKH
	 BwKJFYhRmJf1Bt9zfqWdwH9Zu8cAUFLjOJ8ixQ9G3RSZ/wO26z850Xxm0wp2BMrOESxm+
	 qzz1WIWNcQ6No8y3nFLRdkBEDy/RMTTxK6c4lJYQDoEh0PHxW/Q7ZNB6k3iQ3u6IWk953
	 8c0gmqQvqwZZVVMWw28mq2wN1LHzxjNZtGJF0KuJmfRMEERGlyXdMDHacyVT3urTNAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iEQ1Z7SQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEAF60A2623
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iEQ1Z7SQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB581F000E6;
	Wed, 25 Nov 2026 22:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645498;
	bh=j0FjBMfl8wayHfVJXjo7ht/8WDFTgZnFUWocxKFeOKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iEQ1Z7SQRqe2SSYFAS4lCaKH8ik1Wblb2GnL5WrWR9ZqO4iAoS/IMgFG1rNiFaXAZ
	 6o8qoUTgzpjNNeqGxsLJ2UbjWbpcDpy33braXVdI82h8/qra2/MG33XbbMJPz17ZlB
	 T2sYA+SJUjtJpGrF7WBtWKUgZF4rL/bptYlgadKad6ztT2JkXLqWzhGZwScLdHhDby
	 gcEh1zXp2+K5UWcdhY1rxgRnrucWmHNUtWCNzpYLQTjtBq3szDRhbFN4B1QUks7bvG
	 Xji3Ea2stUD5JIa/xsr6hxi1H5aMOoWe/uSi7uHdkvIxHcIk1JsgdDZHUzP/y+IQUn
	 i1MUo0k0AkPHg==
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
Subject: [PATCH 38/47] clocksource/drivers/timer-ti-dm: Move CPUHP_AP_TI_GP_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:21 +0100
Message-ID: <20261125222230.22508-39-frederic@kernel.org>
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

This state doesn't have a teardown callback.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 44f425cc48d9..93b8498e26c4 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CSKY_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_TI_GP_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_CSKY_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_TI_GP_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

