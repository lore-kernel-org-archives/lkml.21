Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645438;
	b=c6xbQ93lkLgSdG1cJ7t/VVSsZwpNszZVsEwySvzwtjq2eTVYFmLCDm8+XG0m+IWKNesS
	 5pApzwmdSJhXYNq0AReLdGzB9k3H9K1lPfnAekAd2jj4QkcDmea+2dpCxWldd/UckkV0r
	 LQ2zNg5iQbGn9nk5pM0R837NctgrGgAyWL57Lqaus8uCzAL2gFlpfi/q7I/rERzEedaK/
	 QfE8SJOCNT6n1VGyDrzn4uTIrkN6Es1qJe2+JaETSn4SImd90JY7TNlfu18mUyBGTHir/
	 9ofgj2SQe5DDIQnaGjvSAeavILHWlX/p0aKt2SSiwlx+L2vRI54zbHI0A3pQk0VyM5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645438;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wXVhNpPhMZerP0BjB/K+dlonu1sylB9X1MKZXQ/YNw4=;
	b=dbMGCB2pMXR2a3SrkQbgZl0CusaTj/CKvGTz73I9WYauA57O9vM0nlmiiGdkEd+0kdBp
	 C1b1NwDUl7j72HaV1c3WKyUtmur0gY5CvmuGm3R08PvBo1eWcVER9/VBY26J7PNgAJWJg
	 Z9fl//QQu2Ui8joovWfJ/4WoRNVM7v5TJDKhuimms6Sl0lxI75C6jNdbNJwmRmjhPgPbr
	 efEO5VhcIISoFgWYNzwX8fgUsZdWLjX2kN5rbW+GkrTIkCfRbzNUlSrhTcOLhrJ8Wg6oD
	 w8PxfCQsJ+xkCDAAkzA8vBKms1rc9dKPlh4tLToPUv6UCAAmFY1TqznqijHDLwc+cxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HYQ7THR/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDED7606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HYQ7THR/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06331F000CF;
	Wed, 25 Nov 2026 22:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645437;
	bh=wXVhNpPhMZerP0BjB/K+dlonu1sylB9X1MKZXQ/YNw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HYQ7THR/r0LUPBIs2azTMg9aXQjjT0xwkWSoxHRTMEsRCTehfc6uJ9JgON/FhjVB1
	 fsSrbz7Ag67YFDjwWzjOL8Q4RnDPF6q9QJb9f8ZPFS2z88D/IjzvP/toRtbr2MQvTz
	 RJto1B4FuW8XIhXjVFipGNQDEwvc5YwGHNXRw8g2b9uVDt6h/b8ri1Q5kQFKNkEnhw
	 52MaDmrdZxtyeT9wSZZxhzit2C7YhBZrOPdYzo9vo8wO65L7yzo/FA7UrxbNsaQj3N
	 o0gv5e4x4kBrfT9Uh0Nq5KZjCvA7nIljUH/eSu6EuUBDUGa4aR84wA3lS5bG1THWjD
	 TfmmDYAYReCwg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 21/47] ARM: l2c: Move CPUHP_AP_ARM_L2X0_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:04 +0100
Message-ID: <20261125222230.22508-22-frederic@kernel.org>
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

The teardown callback here disables the L1/L2 cache prefetch and the
write full line of zeros mode. These operations should only impact the
outgoing CPU and can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 2ad19f3f2563..498ff31b24cf 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_RISCV_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_L2X0_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_PERF_RISCV_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_L2X0_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

