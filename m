Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645396;
	b=xtaNpYtfHRcvHRgI/9jqtMV5PBxCSDWtuCKeAPfsnpJCTqMzNOq9lozIfsycEx7lwj8j
	 dNxTFZ/EvsR8k+DxfP4m3IPoejK7gYra9kAl/H8vQqPLiKJZQkQoIR73jepZDTTIEMSjS
	 YY/HBr8LUksGy3U9Y7zHZpUFW45emuE9WnaFuNSHF8UCscbYc4qyeeEa3ZJg6nApuPAN6
	 PQCmdJyTD8IfWE0OVcguqdeFuFBRrOYFmuHtj1/v2Uf9M/H76/Cew1lrwNStmw2EofRkP
	 qXHSDXweyNapgvmsc/lfNuwWXrbwJkWDZqEPsp6V6s5vkE8zPwHuSTkHQYUCc68vyoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645396;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=KlJaKckki3QZiwIzDyN0YK9IWpWp5opbJbdmlEHZ+pA=;
	b=IXjREHuXoTw/mH1bTDWfYGZYS+z12SwiMW+rreUDm609bC4G5iJIZT9rU60iawzFfq2T
	 De3C14LkUrCfxrPL3N48WNRaSM7b2P/r/CMYIpDqlpdzyHx+oxyhcLNZLwJwWn3QbISUs
	 Xk+zWCmlpn7L6hbkC33zZTS7lGYpu/tFzFAMy/Xmt3fhRjdlT7xHPv7YN6I7OItKSQ56y
	 uK4UJ4/u2wahq7I0Xb9jvJZP/e4egyqnhi8YpFCzAYqW52hscVTAzL2x0jn+UqXCNvvJ5
	 hOqUooKeJFV51KqhvlXFdz/RBiALXmAgWOwYxX6xco7CvKm8z5p/SouDrz+qnNhmHGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AECm3eS8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CE1606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AECm3eS8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31441F000D3;
	Wed, 25 Nov 2026 22:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645395;
	bh=KlJaKckki3QZiwIzDyN0YK9IWpWp5opbJbdmlEHZ+pA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AECm3eS8H+ajOxy40XIwbFQhI1lPJbXZVFbsjTUGUP+fCkoSNr3CSR6X/3JIvrzg6
	 F3K3VD6lsP0ah9O/oatBWXWvvEDHGBkGB5PLpc3JWir9SKc9/UlheHKmApzQPeUOJY
	 +Ls4AVd5imJ9+BdCxEJ812uUOx5XAniipZP8NGmbX7Et19I0ORbkpT8wy/V/lnCN6/
	 6jNN5MO8n4Hups88cld6u9fFy40LctQJvzsSGu8o7J/gA3D4PuJ50CSuqpFlZnGdB0
	 36zmerZ/q9A/3TBhOeEViGeJl9gTLdJ4KeqyA06sHz2RvpRsttJqo43K6rhJV5pP/Y
	 38377IKQ/pcWQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 11/47] irqchip/aslint-sswi: Move CPUHP_AP_IRQ_ACLINT_SSWI_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:21:54 +0100
Message-ID: <20261125222230.22508-12-frederic@kernel.org>
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

The callback here simply disables the IPI in the per-CPU region, which
nobody should touch concurrently because all other CPUs see the current
one as offline at this stage. It also disables the per-CPU IRQ, which is
internally protected by the IRQ desc lock. Therefore it can safely run
concurrently with other CPUs.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index c7794716bca6..c86570b13fed 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ACLINT_SSWI_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_ACLINT_SSWI_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

