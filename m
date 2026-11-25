Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645378;
	b=Lj9BfLHOVnGF7Vt1GomkKDzaz69aocsW+1XVFnEG7LsfYn6FjG2l9XETHwPD43/soKhn
	 x0336AakEJ2RfWqmyTOa0CnMZxGCgfmqXzLsGYjvbxMkpoz0mJPm3UQo5vzuEu9YGIMFN
	 sNrr4wL1+VoNOGyxS7yCOLuI5cJHQ7xK2/l45+gV+vJRHvS4wLF3CPVeWu7LtE10yfQos
	 ik4ArxVdmt05REzwiwsB1+dLwmaUc33vPuafq4CcAk9SCKw5ITgnQQf9vxznJpWqXCxtA
	 CeON9GZ5xczij24KmyXDsmeu29P5dZZ4wm/neipSoJREh0LhlkO7glHKZBbhvQ+fl4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645378;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=PIzgWL2tMhRLWUV8GxvTn2feEQLzOui3Tbm+u8n2EbQ=;
	b=i7y7fruzYHBo5rX8hcIqcoN6QU4g+pygJtB37liN5BVTcBA4YXNClZ1Ds50in6FXh4sI
	 hixHRlzZgh8+7CDTGuuRcGzaQRt3OCO1gWB+7spAIbZI8pb8p226DuBxUP6tbp+QO4DvN
	 UMlfLnVVMmbAOUtUhdqZHed3i5kQaYdFh1SK42BWN2iY1v8Y6qaL58gM70Gfx4MQY6EC/
	 v7tCN8vYw+AJBZt80bVLZKW1fSpNrroJepfd/H2gCxYbOTspTYsyiCiT7tNufs0em7Hhx
	 hmFKbPmL620izd3PggNSiRCGCH+GQXudSgxUkzhRV0TBdu55bCb53sjExLkFFkXAUuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CqcwUGuf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CF9606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CqcwUGuf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4001F000CA;
	Wed, 25 Nov 2026 22:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645377;
	bh=PIzgWL2tMhRLWUV8GxvTn2feEQLzOui3Tbm+u8n2EbQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CqcwUGufsKX+EeW/VvPqLd/Da31p85Dqmo667dPBNfwdJFttnuied2hutFtO2l2Yb
	 f9JHC2NT9FqMpY0YaraLLow3hIUGTEH8iqTAc3VfkOJ0+aVIjbTKL26QnsY8p6TBea
	 N0fRXiT/tQ8GPJA6ynzyC2eYl+By03643pAt/UqvkXUM7VqA1GckApKBEll6teMmXN
	 uuk5O48kaDApG/6u4i8+QUUBj2Kr9LLiSO9T3WRbCTsGdaFowDrWDQ5R9+rew+n9R/
	 tyBV5DOD65dB95kkZ5qjNmKxymFWTKEgNxUd+7pNMcpZ54BdHiME4dM8HJsq61fkMO
	 KTfQYVjSgGYDA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 06/47] cpu: Move CPUHP_AP_IRQ_ARMADA_XP_STARTING..CPUHP_AP_IRQ_GIC_STARTING range post stop_machine()
Date: Wed, 25 Nov 2026 23:21:49 +0100
Message-ID: <20261125222230.22508-7-frederic@kernel.org>
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

Here none of these states have teardown callbacks.

Move these teardown callbacks to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index acc6a0e6446c..cb0eb71c27c9 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CPU_PM_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ARMADA_XP_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_CPU_PM_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_ARMADA_XP_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

