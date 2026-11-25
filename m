Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645509;
	b=cLvgQte9lZYcNmIqkX9l9G405kbuv1Ou55BEmAupjhwddgw7YvWgSzP6X5vZSG+Ep7la
	 IsA50wq3zxBp0lscQ5MMcxwrpo7iew8//W6BcUHhOaDGXE+x58YKEURGMyRkTMT3K6K8G
	 nPqpJFxUqIlxerXk6QWAZ2hJO8xCeIGviMI1z50pkuGP/zTsjlZ6yT+Msg7lJlGaeIFR6
	 uQZCJyUUqUI+0Fu6mIb41wapAEoCuArkM5g/fJhAnqNJb9sCeAdo6syfAi9lJTTBIP4YN
	 hZTMTxn4H3Kmin8x6lV5AtkQBQWQy/1dlTOVuxGJa9nLwKnD57iV9/lL+W4CoWfymbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645509;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Hv7SBVML9XzIUft1jnff7+5QLjc3MtQ8AT9Ecf5l9sk=;
	b=verlMBa6mMhCZ3RQVZTiS99i4OfCa1vZTytqUdoOGgNavAIhgZdCGSFP8TBkTRlmc6lI
	 DOMjYEeSfAlMV13g7vLQp4jYZ75wzQF/aLDi518sjGJ3QkAmxy+5qnkh+wwfMa2aMXj3N
	 C+kjvQ5a8rhYQ1/89+KYkTgqs910hnVI9dQa3SyAn15Pkuc6PKe8wRqUm1RF55UX2DSg1
	 mfg7tfh5VGteewIhP1a+ZWqYAXZ7yYrWgLCQ7JtN5Zm4+BRqWPLnKNsEd3psmtYgEADMS
	 50looN4uMJLQOVXxCHqfOvgVJ5uEd8HkC+5HgBixecP5vq/35GZkOiVpXOiOOcpzmYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmP5law5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9F5606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmP5law5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD3F1F0089F;
	Wed, 25 Nov 2026 22:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645509;
	bh=Hv7SBVML9XzIUft1jnff7+5QLjc3MtQ8AT9Ecf5l9sk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NmP5law51IXeoUZCzLDT0cKiztrkQhG0aJwxHOSUCBtfAfcECYZX81p+3rT9SZAbA
	 MgnQIF6cci99zm/LFMNk1n2TiHvQS2w8iWyWwMRFpbaS8nxmErolyLQZRwFgYG+cup
	 ybLqEAnYQ9Yv0av5lAoI4B00e36nwnnVS4kxVZ8Kr1rEMFCEqaScGvZSymsqPoVt6j
	 NcJbodrSSIsgILfHAW1jOb+T5CFNLaTTZliNI2QQpOd0D7aHrUlI5K7V1zHpVaZzkx
	 lJKOSO8bNAN2Xv0+WUWdwZlWP/QiAvinHgatcrgaA3OtI8vltvkUq2jGITwrkWjXp2
	 Ghs7gA1lJqJ+w==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 41/47] ARM: xen: Move CPUHP_AP_ARM_XEN_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:24 +0100
Message-ID: <20261125222230.22508-42-frederic@kernel.org>
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
index 47b33c6759aa..5c84a39f6f06 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_DUMMY_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_XEN_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_DUMMY_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_XEN_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

