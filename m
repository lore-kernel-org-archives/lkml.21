Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645370;
	b=R2y3YL30wQsSZpJ37PGQQKsYtDD85vMv4bgZVLw0p88Go/ARxoVSEDumRKLs9GPPuRcB
	 t2HQiPA3PYVQh4WnlstG5UBAFVX/RPz1PnXjuy7c1z+b5vGLmtO6VZwgFNQuloWiAorPA
	 A9WKBF64Jrz+1i3fL2cdX36W+HTVKvDUJdb37ud1s5qaH0LX5hM8yYcLsyYP4E8A/EnjB
	 BK9sevXWr3MNr/hE8KfhO0AEYs9oNOZj0pKXP5TA2i4VfrdIyoUbwVQRW1ovrvuw2rc/j
	 /alAlPSSgp3yO0vF5TO8+cJv/r9OzbApBq+FaYggoMzOecWg8ieHv6yjUl5eQvGzA7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645370;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Qc6SuA2uhHqLJoYzn3JK76lcrpwKJC4YrCHB5d2RPcY=;
	b=ahAbPIOm1hjYj78HVBTL9fPXsM05nmtkKXcmSzXuZHMjrLNCvJhZ7svsMLwVJWLFZ9FF
	 4Ax3g+2DhYwwH2CuYtg/YHFRZQAUBmiukqGK+kWcOUSRnG4nJSo9ywuAAYnEJ+l9/7A9h
	 jrgDKnIOrFZBo4OyNnfKFXiJGct768dqNoU0FfRahxw5ZTtOFqXDUs+0rsSylBaEpuqK1
	 ozO9bygFn9o5dMR6qoDEJD+0WJ3Cr06rZpHF/kNv+0wL8i0C810VPdOLpgC73bXpKA0GQ
	 nw2AFIjbQX1pAyYShJhWK74xTUifwHAhk/de16RIfSsVzJH+rzMI/7HYH+/m1jbjizA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e7MmwqQG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAF2606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e7MmwqQG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624AB1F000C4;
	Wed, 25 Nov 2026 22:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645370;
	bh=Qc6SuA2uhHqLJoYzn3JK76lcrpwKJC4YrCHB5d2RPcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e7MmwqQGMRCu2lqaxouCNoyIuAfVPL5NizsToos2Lk7XVRZQnL6XD/gyhNGkYZ74C
	 uUFedBgwtQIYzj+8RHZZk+07tSimJiYpliI5Rc9JOK5uFVSunx1LgS7zYSXbWT9fqB
	 XXaSC9jLx0skUo3yZvJZce510qh0rAWwLYc/9qMq4iBAkygigduUEoc7zfvMJ2ipsN
	 ZcKK9RbvPPO9S3pcbMSOefBSr7HqPErUNIA7qkxA8P9Lywa6dKwm2ZlIOPJjBDNDqf
	 q+Hl+r9bUinzaXkHHnRpdoExfCdfinDRXaUjNVZpnM8De0KBwSBj73Dfs2mLgMY0pX
	 E3bM/9DX44tGg==
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
Subject: [PATCH 04/47] rcu: Move CPUHP_AP_RCUTREE_DYING to post stop_machine()
Date: Wed, 25 Nov 2026 23:21:47 +0100
Message-ID: <20261125222230.22508-5-frederic@kernel.org>
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

Here RCU just does tracing with already proper handling of racy
accesses.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 6e6d3a3016a5..58bb74f0fcb0 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_SCHED_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_RCUTREE_DYING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_SCHED_STARTING);
+	WARN_ON(st->state != CPUHP_AP_RCUTREE_DYING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

