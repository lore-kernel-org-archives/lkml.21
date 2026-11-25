Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645515;
	b=B4/4TxbQ8ehfWNWA4WtEQuQhogL95ofI1WPwLdax9ufP9St5NJj6Nz+z2kufyITbaXuH
	 g/kL3f0dw84bxzJzXpm/7heNlJJxYdX6YDUm5+JpKv2XhWW6yrgqLLTYuWbK26VbcNtlZ
	 ur0TbwmY+cwU594UDOntR9Qrdq6lDwjuhnu/V/YfcWy+x/unGdYP1kFWWTW4yD0bHnAgL
	 N+9VKIAUGD+ZGDSJWGnZUdjQMg3vVXphzh9DxOZoJKrsgupLQM6YO0IiNHEhzUETKrD2X
	 YzRQZfR2KxNJS/MbBg3wWA4ofiqNLSbLCfxtbY9z01gmefRLebTPrsvWtxZRH2z902A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645515;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gm+eRm9QjBa1//yoCiHmaxGxCF7ikZKDxpsL7Ys+E9s=;
	b=W9SUdfWzSajMZoK7MIuasgAGpdP+3jYXfU2R6GdS2P0ldeY/pFhh7ZaztwgN50amALxR
	 7gkhtOMOJ4wprrQxP5EnGZZ6NSq1n3Th6cRwMIov2X4YKuAp/EWujDJ3SRrrdUOMJK0Bn
	 LAlcXhmNN/1iGM07OF5rT9S4t0rrhb1JhNP/Lw8WFJ+4+Asom9JJtu1Cmyl0qqrypfdtI
	 SIHn7HStciUvBYfZfaa4cydXQW4dr+V8kVyeDUD4dZCt9HIsC/zwOpdFgMTBG4eeFmqz2
	 oZuqky82GSpFRbMGDPfyT0r7Nof//GmDJR01mu02KIV/Ij1Pxw3p8dhK+yel57Gik1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZzSMRud;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D55F60A2617
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZzSMRud
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D9D1F000CF;
	Wed, 25 Nov 2026 22:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645515;
	bh=gm+eRm9QjBa1//yoCiHmaxGxCF7ikZKDxpsL7Ys+E9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FZzSMRudE0P8v+rWYGAUYXl95CP4wnnMuP6Ktt9GyJHsVG/PrEpcAZrm1cxBubqc6
	 A9zEclMF3sG4r0V9eJeRC+l4YM1d5k75wmzWABqxMP70/4azVOZxJmWnexWDj9F3yK
	 Jyh9ryMzHxpSF2933g+1hgWVXvFkZ93Vfw/zJZhi9i1Vj8F9hUrCeXd/g7672CVXtG
	 2vH7g6Ae0Sy3Zz4GZLodC1HF8Y/8nieKTE9t/Evh4BVr9hbA+Fy6qbFMt1qfhGfJdC
	 9ZX/q56nl/iCmbBxmayFkDMBne29P1vOsJFA8bnm/w/Mgxm6ncFRhf6qVj4ddAeMb1
	 vakZBNjiVMhXQ==
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
Subject: [PATCH 43/47] smp: Move CPUHP_AP_SMPCFD_DYING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:26 +0100
Message-ID: <20261125222230.22508-44-frederic@kernel.org>
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

The outgoing CPU is observed as offline by other CPUs so no new IPI
are supposed to be queued at this stage and the remaining callbacks can
be executed while other CPUs are running, just like any online IPI
handling.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index f1672902dd2e..304a88fc7a62 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM64_ISNDEP_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_SMPCFD_DYING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM64_ISNDEP_STARTING);
+	WARN_ON(st->state != CPUHP_AP_SMPCFD_DYING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

