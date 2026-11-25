Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645459;
	b=AS1ytfkJdpmo2pJJOjketIKovz/VT+UrUTuJqGCe4YRtKUBdebsX1js2UPrByYRd6cGV
	 tk4Lr0ZthfyAmQ05xJ08hQeourArOM/m5AtRvDdvWR6ehxgeXrQ0qpanUlNR2QBymV+5k
	 LEUFkNIXqjlnMqXWVNEiF3o1QaZq05I8oGlByxZiN3swbt8KW5byGXLJmZsOqYH5PrO+e
	 MPdIZEf/VakaMoVF0zn3a98xpcF608dCrdAROGf+3KUkIHNyO4608OMO5ztyOYdXjvdwc
	 DXa5wZCAcugD+oSDZK83EXxZRrI+xqRbi4hRhXkyep4qMYOvPw+WjUvY5ih2abCMdLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645459;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wfXbfc4k4ypHO4LdeHU1urp28vlTb3ci6JjbT548bls=;
	b=GENsj9EbrIkN7Yj+J+q6IsBy9d4D+X3ORy5M49cAlhlGPa6Kh4kC8lsWTrCZjrS/1roi
	 zKek1YnthgENgEhNyLDTfV0UG1FAm5+5P8pauCJ7/0iOaxcxl38ADfi7/S05msPUaC4Qw
	 x7dyP1erX0OW6fsWbqZJuembOzuAft2W+6eQeP7l3isipkpMyOBYBSYQWxXRu+v1+gedJ
	 geuM2xl34GolDVTqTgIiy9HQ6JzcBc8nsaz8g3+oQgMeqLQuPtI2fQze0RjJhKkNNdAxw
	 mC8zpKzGcs4O4t9z/We+EAUg9oCxEkP9FCNkmzRPmift4iniQAWGqKSWrM9D8JODNVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LgbsHr9o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CA7606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LgbsHr9o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D7A1F000D0;
	Wed, 25 Nov 2026 22:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645458;
	bh=wfXbfc4k4ypHO4LdeHU1urp28vlTb3ci6JjbT548bls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LgbsHr9od0YnTHDWIhXEzrHaTGeJ8FmYl98rIE5kdVdXaJ2rmdZpu8/DXvjW3uLIT
	 aeYyK4HyE9ZluOMuyOF0o8527PVoMa0Gg2/fxNRsmVs8wEVAyK2KL6Y4fIK+KCAfgp
	 OYghj99Ui9VwE032sCEdkQCOCcLDufCZgxIKy5PqpK9CaJzfjdLTEhoywz1OBaYP0v
	 suyLR2QT4ctdhJMJFe7PPMw5ZOCTQqNHoZ2Hafw76eXvfVbtnRGlvjJsM7iACn5oxF
	 JgZUd2CJzh/WQHJabQUiLV/7WEFZbBIF2NEUYoJDUR+7n3XggEK/wsr6QSp4DiJYtt
	 mNPMppuRFSzig==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 27/47] ARM: smp_twd: Move CPUHP_AP_ARM_TWD_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:10 +0100
Message-ID: <20261125222230.22508-28-frederic@kernel.org>
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
index 38d60ddc166a..d7a6dcb14885 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_JCORE_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_TWD_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_JCORE_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_TWD_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

