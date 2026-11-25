Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645421;
	b=GIG1LRB4Bc8cGBECha8O1P7YnhLORk1UtkeyvWegqqMwLAqYILnJ2GIGXXhrDYpNSGM7
	 Ce9I9bfEyOK7pY7mveWpDPAygBLS5pSj1oB8HQCmsyMHh0aoE8GvP+VYoF11Qp8gt2SwP
	 n2Kw2dmb9aVdADSM3PtMdzkluAfk7HK1knqF4ontBeriY80ypkmWMYbPwcFfax2qhbajv
	 j3XlfA4HUw/NWqAhwGfkpin/MLr1tU/T80cXhmzt/h5MtmgqcP3ChRBCjv29b7BURqYjA
	 BexgvHEgDIFk3+TJOqOifrsBJUeJm/br30MIUISpnKs5NMCPdj1MLE1eW8ZXS3QGJrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645421;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=D0+LNd4GrFdRUAhJzq5jkTUAnLeP9KN9bNzbjyGlhpg=;
	b=24WecXpUai8eC5ThIqWPJxnxHSbY856e2oxJffsch9cr6L5Qgl/X0J/C3mi3l4yYzMeS
	 wyIPkDut08x/F9YDA/XDWp4RZ/dnbIvEj9rc0u2MYeoRhTmSVfh4brPWK2z14kICm7BIE
	 hOFIll19Gm0csLc1OnL/lCOk51BOkrq05EqGyXN56s1CP5PHMp+2HaBbf7FpUeqQI5ieY
	 HhldOni9MIbHLUkhWuMMVLj9oezNBmvpjJGA9ybYAfRbBNoZi0Vx0zK1SL0HBFJVWpJIm
	 gCtGKUqjlG87i4zbovUQNG6PzU2R6hxAN1RvXlgL/WVSFWuVBRC87PzONhhbKJ5Rdvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YQ5hdd0j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98C2606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YQ5hdd0j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D621F000E0;
	Wed, 25 Nov 2026 22:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645421;
	bh=D0+LNd4GrFdRUAhJzq5jkTUAnLeP9KN9bNzbjyGlhpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YQ5hdd0jLQg5GdhqOxIbtNATPd+YiIzqjujOUmoBZFyq5jorux+9RNTl4M42PtF+7
	 X8rF0oct2sk2LkTilVuMwTKFVajhmwB30ROc0cvdTkmnduDnPU3/OsOwLFXvXHnv5M
	 AYjBniUGPYxAhz8EP5NZXu1/zyhc96dTXXGhNPsehOzk0thFbCuglqi5epxA50aIxL
	 TlHk9suYqLMQyZb9Ud4/0KcZGySf09IF+I/FlDH3rk9GF+16VYsg/JY9MhCQzOwC8k
	 Bp+t1UFv8bPxcO3xxFt2hxVrKhdCjfCItQtDm8rwksUJ+CfH98Ce9K3sOX5DN+mcrk
	 vCV++KIoIK5/A==
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
Subject: [PATCH 17/47] ARM: vfp: Move CPUHP_AP_ARM_VFP_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:00 +0100
Message-ID: <20261125222230.22508-18-frederic@kernel.org>
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

The teardown callback here only removes the local VFP state which is
never accessed remotely. As such it can run concurrently with other
CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index a9c5b0c1974b..4952a53e028b 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_XTENSA_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_VFP_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_PERF_XTENSA_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_VFP_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

