Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645519;
	b=VGEX6B+FvhvQYTOq0wlr0yV65MsrkCjkvJXuUR0zpqd2wnmnq4vdeXKb0yewgCk/Gsc9
	 TlSKa4BobhjR/yFGf2XPMM6DFXZSa94TvEDLlKVleL71oF9QgrskkOUdzzyJPbh13mcRA
	 zjD0xgZwRBPg1vtSsUd0+x6vjHdrQRxgKa5CGj4ulYEU3SfKXQY7yohcpboueJCteFLle
	 B9nr6q4aM+HdQ8lGQerBG7WP2YewV16UtTbVI5j5x+IbQ+/hbKGlYzXnUzbkPzb38RCx0
	 MbUAH++rmGmEbQj0HAQpl1jXQrxaQTKoiw4Hfe4hijCCPNbzzTMdGFqAil1TDqAjo1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645519;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uAPmsHmV2Wow2yrozHq7wWkPhtR84zAM1cirHjJv5i4=;
	b=wz/tM2tDj6SErPNChzqPJ4hhkSTIr37DmnnCFcbXUCD+ARQnTKrFn7rTDj6OBfv/L//C
	 zxrprNFndpEH7CK3zrHkuxBk64gDOxB0uuhp8enCCTNGHxVukU4LcV9nNANyQqL0S+Wzm
	 xjwh0JNvRnnIc9xGMpLIcBgGkbMf+U4pYgUF/Lr5WTr2kVwWvQ6qGPG1WGARriExMwb0B
	 RJBUe/nDHXr3JDyXfu1O5yvsKsDW/WaB7E46oml+XEmtTphjqIt40fIeGblt3DbfeDdO6
	 Oc9VMlwt1SZdf1qUy0OMpJl8oyi6Gp4s8C7wWnoGjAskUhPH4x4u+eoLo37bAYE50LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UgQLnMLS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BDB606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UgQLnMLS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719B01F000CA;
	Wed, 25 Nov 2026 22:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645518;
	bh=uAPmsHmV2Wow2yrozHq7wWkPhtR84zAM1cirHjJv5i4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UgQLnMLSteruUtUw57675SKn+25wPCrbBWBzOK2imcCdLroOjieT6GThrbIPPUKsa
	 IojZyKXuKpnCOcCIwU1gMwya6wnGc8Nv6W0FfVHNdpgS31qS+yURHeeTYHM4LWOxEX
	 rgx4dcBsgUMxLveJgFF8tzgUTMkCyB3Yb7nj2EVusseSOZnQE7oF9SQL/0iz60HMZm
	 QgPu9dM0WzRtkSt07kXM92MRGdQxIZtGQFlLsnsIVJE528VxDLncEprpT6lY6nfGtT
	 NN9sVb7G7qPY6S8+xHWVc5GaSHSLpsJR/ZG3WR9Wzm/cmtWffqek3RtRFOA5yN9dwu
	 i65UADslAMwgg==
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
Subject: [PATCH 44/47] hrtimer: Move CPUHP_AP_HRTIMERS_DYING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:27 +0100
Message-ID: <20261125222230.22508-45-frederic@kernel.org>
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

The migration of timers can happen while other CPUs are running because
everything is serialized with the base locks. Also those locks only
nest on the outgoing CPU during hotplug so no locking inversion should
happen.

However deadlocks of the following kind can trigger between the base
locks and the IPI's csd, as reported by LKP:

foo() / CPU0                         hrtimer_cpu_dying() / CPU1                              hrtimer_interrupt() / CPU 2
----                                 -------------------                                     ------------------

                                     raw_spin_lock_nested(&new_base(CPU2)->lock)
                                                                                             raw_spin_lock_irqsave(&cpu_base->lock, flags);
smp_call_function_single(CPU2, whatever, 0);
    csd_lock(CPU2)
        csd_data(CPU2) |= CSD_FLAG_LOCK
                                     smp_call_function_single(CPU2, retrigger_next_event, 0);
                                     csd_lock(CPU2)
                                        csd_lock_wait(CPU2)
                                           // DEADLOCK

While it can only happen while CSD debugging is on, reusing the base
csd makes more sense anyway as it is well synchronized against the base
lock and should avoid that kind of deadlock.

And then the teardown callback can be moved to post stop_machine()
safely.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c          | 4 ++--
 kernel/time/hrtimer.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 304a88fc7a62..4d34c4ed9836 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_SMPCFD_DYING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_HRTIMERS_DYING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_SMPCFD_DYING);
+	WARN_ON(st->state != CPUHP_AP_HRTIMERS_DYING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index a9dc2d53aa92..c638225379f4 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -2632,7 +2632,7 @@ int hrtimers_cpu_dying(unsigned int dying_cpu)
 		migrate_hrtimer_list(&old_base->clock_base[i], &new_base->clock_base[i]);
 
 	/* Tell the other CPU to retrigger the next event */
-	smp_call_function_single(ncpu, retrigger_next_event, NULL, 0);
+	smp_call_function_single_async(ncpu, &new_base->csd);
 
 	raw_spin_unlock(&new_base->lock);
 	old_base->online = false;
-- 
2.56.1

