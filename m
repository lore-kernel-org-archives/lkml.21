Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645455;
	b=XIciqGTZiaWMOstzyt+bu1Xw+4M1trlufveMXCwKfqOMXC4O729OYysBqrujkXD/cy9u
	 JNtdCmJinrOA/1J7QZsL9gte/n30OdDZwZWk2C2pn2oSvxlXeozDdbqqob6b0M4Z0Q9Pu
	 1JJG3S/tGEhkZcMA++O4nI0JOeLR0zIjetb6LLvOLyZHY0kjrEBI55fUkwIofSPoYPnic
	 QnVm6H2U3sxBZ3AD6b5Uw95zrI5MMr7Q4I/MV2rLHzfQVycDzuOyvL4VUr5z6qjUUvmb1
	 fXQlYngflN7E05e5EH/2InO7meakCCTQLMQfrSVPnmK0znyeU6XdHlDZSn0i5OssdXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645455;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=WupZe1PS287HTo9VcnQ7okfR/v6F0Y/vGf/Cogxi8JM=;
	b=i5+444l4x+K2RMNnnWifgqsRssaDvnQCs316dYAH6B9kcUgCwEgIbUTDaqNMG+OoPsAh
	 xXuFNButiSzMNJr9jhZS6G1BsJjqtyXI5qVwJcVn68wHzAUdFfXwRu/cMC48Iv3EWSnO9
	 PGcENXqd/8yp3UPz1v9Ekue/SoCYbI9bXlxnuQVBuAKPPFDcFRHKSeJyI7L9PKdyJ1YMM
	 PIuPqvHvUaEgBV1NJWJFu4VtJg6R3ih9xMAHtJ71V2gaYxWenM7WN8CSBm7/A99R7uYLz
	 Iw8WM89mIN9wh5s0q6ScNcb/JZ0L3AKNkrgU3LPCMZkC8ZwMmDOypoIgfgu6srtz/3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="baYF/4iN";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80BE606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=baYF/4iN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1409C1F000C4;
	Wed, 25 Nov 2026 22:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645455;
	bh=WupZe1PS287HTo9VcnQ7okfR/v6F0Y/vGf/Cogxi8JM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=baYF/4iNizxcju+SycEEm+uTqWwWqL9YPIc3DlCQUYdo6Io9qNd0mqPrKVBN20saM
	 oubCDGorr3JoJDZVe2y3VYOg8hIoxH9bwF/GhpmFRQINmp5iqNJFIiAJ9ZovsHhPmc
	 +Aa5vedp8i6nq256wLLY9geP6OQN85xcPJlx0e2kvfiR/DbhyOfTeqDdomczn3cWyj
	 yFWo58L6HMJBr5tOKnQXJ6CoL+UmDeYqLRzHyw9IsHkK+7BS01ncdl52JM6QIisrK8
	 xWQBoxlfx7N+5tt8+X8FmINsx1PfjCS8iouMTIrP4JQv9/BNGDVtzPn+eOK2LUPkEO
	 t85Q8avU/v1TA==
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
Subject: [PATCH 26/47] clocksource/drivers/jcore: Move CPUHP_AP_JCORE_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:09 +0100
Message-ID: <20261125222230.22508-27-frederic@kernel.org>
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
index d980d11abf27..38d60ddc166a 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_GLOBAL_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_JCORE_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_GLOBAL_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_JCORE_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

