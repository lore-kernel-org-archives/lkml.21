Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645480;
	b=M1J9gRMNVjmOwKlynO0EopeDfGDdlURRK0huN0ELwUb8nyoT0P2y22KYQEv6l5U8M7oQ
	 bV6wLOZYqcKyVS5yIYZZF2+gDQCRQU/DAoYK82YhHmZnItwvZc5OkK12ufqaya85neB7H
	 SBC27VIBnLfWe2q100cG0jvqmaxZ2nqQS1c9CYduiJLLpWkrQKQmB8L7wXLYdB7lVmjLf
	 jDkcIXN9QT7qdMeF28UfLlhXMtuY2tcyMU7Su24p7xU6yQml46XnJB1rz1e//WeJ7RCIp
	 TaaJfciHxhW+f9wYptsq+VjifHXEVp0SAs1MfXC/zN8uVUAXqh21QIEFStwdYA8JS2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645480;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GypxCgrSGuakcSYm30KvvekU+/B96aMez0HNLTb7bn0=;
	b=lZKcOH68++LawBzQXWzBNMJkctaPWrXFeWVXAqwsvkLRDGPJ7YA0iuLkPXpzm7lrnoK5
	 1MrZRgj4Ao5YVmDrcAtIWt08H8xdo/hQTsbyga5+dWoUUmfmwRE+H2aiRl34qd65W6Xg4
	 ikqz5wrSxP0kB/7DMH8yFo1QwFuYHB7SOV/sd6gIUgwo/qPdwcVy0OXsOJFUJK1RMMFqt
	 AaixQwOoV7RcJXGtxJlCsbdMfQhwXR5jCJhnq4iqeegeXql+j9BKSxvKQWLS0UZK+z4Pc
	 fUAZTiVlgBq7AMsfAA2rs24nAKMly4prUH8CullH9nKSXZIKCorftZgIw93TBA51Jfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LdwJb1xN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF6B606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LdwJb1xN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D9A1F000D8;
	Wed, 25 Nov 2026 22:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645480;
	bh=GypxCgrSGuakcSYm30KvvekU+/B96aMez0HNLTb7bn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LdwJb1xNj9tse3B3xT+FbXVT4u7a8JC3MkMPG+1YYTu6AY1R9PmXmknhfACiNmsbm
	 FqFyPYT5ff0Ro9BQ47u1SnpQrS35w0RIFh5SAmv8wAKHld9hKDKQs4aGhCTEw2D4VF
	 v7jygZquPf0N3hzPDv9Owc1vUBaxu+dNQnsIyDYs28hn34vmlrWRD/Ag1unXBu8laF
	 8kX1InEEDLUW6/NwppBmRDIPe1ltK5nDDOc4Kue44jknJYtF76AHTZEx7i0fWAxZdi
	 gAYN1QlK//wL1/5uGP2/e8AZZ6ARYv40gwXh4Lu+Hn4rlGrpN2bWd0UwZ+NArpK2/0
	 x4lrMus/wYW+g==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-snps-arc@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 33/47] clocksource/drivers/arc_timer: Move CPUHP_AP_ARC_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:16 +0100
Message-ID: <20261125222230.22508-34-frederic@kernel.org>
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
index 4451c5997cc6..3fb757c6bc7f 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_MIPS_GIC_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARC_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_MIPS_GIC_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARC_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

