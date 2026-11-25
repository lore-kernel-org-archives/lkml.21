Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645469;
	b=W67wyN28xv/vqoWbC+zERF8g9n8eX0IjbbhITuthK98vxpO6t3HnBrDpWPv0jpX0h+cv
	 iH2YpDKkvW7NOYaBsn2zcoLVtX5Ix1yBEZn9PrYALRFDH3LG60ZKUWUFeMs+dIWWN7cQI
	 ktCMOslUSNsVYVoM53rb0JfO4NGPCvW+vbgPKdZrjh+9zrkj5pyTrt94YNUQwQCKL6hgf
	 YikajIODgOw/yHaU1/NxZvAVhg3gi8GVWWYSCQYPQfjK4cTTECfQgMaV1p7AGb/j37mxv
	 etB4H6Ia+vWji8oYRQ6JIuqehsAM+NWxdjjGDaobNO5MN5PyxYfW+bj8UBRiMMaNOuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645469;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=iaW2C/6a9gEmQUzjSFQuquRQsPl0OSOXZWSXZTmJfwY=;
	b=wMf7KWWfWWhcRpB5HEy+2ELCKTgfjBn9f0GFZGHp8Xa5ghD7rg6vVeflqPWDmOoxm60F
	 d32L2ckembtNq0IkIbaS+dgCDDlBAczDVpzsktG15FfoYr06Yad7eSionQRU5n4dWWuVh
	 2hh9GWpLZqySuMJEy/09TLtuupnT4odh0lpiKmR0Av4zr8U4iXMa9JTHnnn+xaT6KHvkT
	 fmn9pkkLN+0OZ1gEpKvykiVcUy7oHVZgSzpLzcWMzdGy/fi+PRvisrX4WNUhJZEp2oyxq
	 L+2O7zukcyMTrCIk7Ck62ZJOjXq4xFWNR4mRfjOH0ZLCX4kqbEctVnQBtOLJYX3PvqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CH6ybdO7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AAD606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CH6ybdO7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA401F0089F;
	Wed, 25 Nov 2026 22:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645468;
	bh=iaW2C/6a9gEmQUzjSFQuquRQsPl0OSOXZWSXZTmJfwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CH6ybdO7ZFoOtrb2ySQzP5I3XQfDJpeZhsMe7aUZCArsGCEf4N6fmKa3bmfslh6Y4
	 /SVnm8lUSEN/GJu8oc17Ndkqs0xEu0xnDTaYge39/tk6LtvcTYUN/JQIjwXzWmeD/k
	 odtVaYi9rn/LGfjlZ8UsfPhbgCyxV1kziXfzdPkbqnIGUvrWWEdVAy5bXZqFt7AMKD
	 V2dN7jJLWcbiJZ86C4z0nmRb1gFsn5/pBjgvJuHaeWbKmw/EAxzWX+R+Swu1/ZobwZ
	 AX0R/qcr9TU+t8YrGsmHobEuj6mkFq6LOddYmBd739QL93LYQaBZzgQf6HkA+J483P
	 hEd/22GwtychQ==
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
Subject: [PATCH 30/47] clocksource/drivers/armada: Move CPUHP_AP_ARMADA_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:13 +0100
Message-ID: <20261125222230.22508-31-frederic@kernel.org>
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
index 27acdd9800cf..8a563de99dc1 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_TEGRA_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARMADA_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_TEGRA_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARMADA_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

