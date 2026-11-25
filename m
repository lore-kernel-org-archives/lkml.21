Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645452;
	b=wijVKVbbYF4gG2OFEh88XIgU8w5QFqQNHjX6tQ5/8+xZD1Vv0i3Z/dKnAqPcEiwrojvJ
	 DvbLNXUfw62Umw0FDpGE5xejYDONiT9MRhNyNHFtJTi0RJPJ9HQdQ7RmYMJQFqIUiMiHY
	 2IFeBUQMYxHl3yT7BFkasBGget9dlJVEYSeNGcwTEPZpIO37uILOx5TU0/IOTeiIqCUR2
	 h7bABMjNJQ9jz8uxy0teYXy+me1FqmW17CVD0BR8L0CrTwOAlRAyzFXAFBU7GSaJxq0Eg
	 cIozUZlUtwIeB+ZjyFP9xstswuQL1uwqR8laLQG9jgZUkxCcSq0LKNV9M8qF7+D2sFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645452;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=PbIk7FqCu+mhxjnGUs//020DfJ9BE53M6kBHtJjRVhs=;
	b=PMB1znbuKnmLW/LjD3fjQJIMI8HGM7KnSRx8I9aJ/SfDURjzAOm7tZO0dmx/P7MgSDFr
	 8DXeveaElwvNidNxaAq+z5U4jdm2diUm1/1K4FWMK+RjpEFPwaYyrmOLJkjzzNAYM0lFH
	 nbuX8EhG8brUitJYSux8qUTYzBAxCPejqR58ZeEZQnaRITh7jfTZxMc3ofud3N1+xY3mT
	 cwIDy9Q0gZawJJBht5XV3z5sMXPjS3nCY9w9Y0jA79pkIYZoQHNj3SOm5JClKdCpueJzH
	 bTYUuoX8f6ukKsJbShAgflyRGwSR5hVSnd/OsSQfU5RGpgY+Bfuf93RrHmn4lfnH1Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjACtZT2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A594F606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjACtZT2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929AD1F000D3;
	Wed, 25 Nov 2026 22:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645452;
	bh=PbIk7FqCu+mhxjnGUs//020DfJ9BE53M6kBHtJjRVhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gjACtZT24L1p10ms1a/XFt0AHB498Re69FaOfjIYdW9YswWs+NBVSybd/40yZ9RMX
	 MkQhpT0192LLYaxc3JKx/k3zcQzZRH9JDSPjsahJe+jJWaEnIKxnzfrmavYYUNXT4O
	 Dc4egSOI8zQbX/pFzVQXVXUogao2DHofccEQ3OiVC1VfSMmrZvDPA2aMxYqgP+iaIm
	 nmEpBVT9hqqBJoUhwbmeI9PkHoo9mn8pacvh9QVWEyKSNquV1NDEU0QHUFursev7qq
	 ZgmcZu3dy50+JoeT2RxukhEzS8CkdR3c8divmEmeL5OXCFOvcV04YQo3dmEhZb0YSi
	 hQGt2HL4YZPYw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 25/47] clocksource/drivers/arm_global_timer: Move CPUHP_AP_ARM_GLOBAL_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:08 +0100
Message-ID: <20261125222230.22508-26-frederic@kernel.org>
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
index 6f4c609163e5..d980d11abf27 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_GLOBAL_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_GLOBAL_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

