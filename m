Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645505;
	b=g8DfggnHdLPfaQX00DLoAXjtoIZDTfxHD5VUub31s2N9lEkvylQMDnlvlx2aoUkLwDRa
	 4tSUSrapbjq+wtQ+nRCpnE/PwSeJQHOyHnzArwFLFbSz2SAEtsFM1MhohMAIa6t/qGgwv
	 4HG+fDViDBxChW46FrGzlf2EMdEarNk3Td85pRuf4IT/4gKvKfEcci6iUbrIGhiAaHYaE
	 Alidz3DFfHL6d392WT87H2+70toKJ19RxqdUD6bp20/jPVfPT6CwkyrXtHgHpr7Ug4JVM
	 mNypl2dUvHtdow5ErQ75FUmB8ZNuJUKI/1NUyddBGAirLrnuBtXb8SSc75T3J5G7QUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645505;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=s3LdWSHr1IYZOAeaXcbBzjzQGLkaErBL51W7WoqUiaY=;
	b=kQEzHki/ce1zu6sziTCNfjLQiohJ93koQC42ZroQW0m/TDPbGzKqri3gnYiti3Tm1z0L
	 xVL4BSVBIUrpw6uiZJHJZkn+JdJAJ/1ASK8qHTpGBAtzt6X1ZWqeLTVqDkzpf4uJuFMH3
	 f4d6cnVHiKbxo5s3gSVolVlHFxG5kLq9N0YW+TKhUBL6jXjUa3rYNONp/x6mSUQyMlXOb
	 I6oGwC1ax7UWh6WS8lUHOgnBqSibajgCagr53jzrKc5NqPgsvU4pbwqtupKY+QUyFTXBN
	 CgjArE5xgdV58C2FzNenjlC+H8IERFXQjHDLFyjzBdHgmMGwps/gamFHDHyiVK+pDJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OvCM6HxM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF10606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OvCM6HxM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6FB1F00A00;
	Wed, 25 Nov 2026 22:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645505;
	bh=s3LdWSHr1IYZOAeaXcbBzjzQGLkaErBL51W7WoqUiaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OvCM6HxMrKI6Nk4KLatIL0ppUCJuMJG4OB16ynGHIJ7PmuFXfB+Q9YEEP0ttM5CP3
	 YnOnQKFC0Dj8ZQV2lDYxEpQPYBSjQrHlerXvYbvXua8IbhM6R4b1up7lfGd2+yRrMB
	 2VJ6u1OCrNztXEcFxktgJHAFR3HRxeKgPueysO2gurgVLcjTU8YvwxjfoOTfpZTvTk
	 jexnyQI3yTHgz363JZc9hpLaM/CIWRNr6DPKaYXl95Ol1E1z/Tcvg4ANj6Py5xdeg0
	 dXxAb0aWPYMg11gOZtC4+C980H7ZfxhpUkmetEZVjIljFzaHSU2mQIa2cdXV5xjaLd
	 c+TQu/J2xCZ1A==
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
Subject: [PATCH 40/47] clocksource/dummy_timer: Move CPUHP_AP_DUMMY_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:23 +0100
Message-ID: <20261125222230.22508-41-frederic@kernel.org>
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

The state here doesn't have a teardown callback.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b49b67ef5ecb..47b33c6759aa 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_HYPERV_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_DUMMY_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_HYPERV_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_DUMMY_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

