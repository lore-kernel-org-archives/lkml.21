Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645392;
	b=cShuYksM5ofBZRG4lytfioKbM0LNZsrknnessrHm/VF2lK2W75vxOHe5a2jPWNeA2qhJ
	 s7XNNxoFP37OBzeNJbc7DmJvOmtUBoxDZv7kGWuqDykgKS/hEczOF2Q/hM28lWRmaV9BU
	 muJG7dKCGpyCUFov3jWkDDuiYLfLrAjFtjr7nCpu5q/26nOYvok2KkXGgYuAoB2uY5ua/
	 Euafan6HCClTtJ5bT60oD8iXF6HQ/ml9XH/Y/Ou3ihvhEfHuAtWYPasxBbLAoKcs7tCdz
	 xBm56zlph85vg6MPDl4ajRJWhkSlWPw65I2U8uidsIbJsa59aUXgGdbWsnOHA6auIOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645392;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=r+yku0q496XunaZnTUPYz/QmShp5m4bAN5X9cIEAz8Q=;
	b=itYOzZuY9R1YeyUobwkzcbw9p4rb5rokrGI5ADhRY0p7KuTFgzrq/Xek0YwE2B5HfjzR
	 6rgE/C12f5C4Vy7s7q84dX6AbQlDLtMHpDsVVz9EjnyMy0kZqMD9KourXDrq712QGIsdR
	 9RClShPeGst3rtSIitHfD9LboV8Pd0d8pVdxWUblBS5Pl2FxMGcf+4d22LMYadrRSwtQd
	 QEVAO38XLJC7+Hi2Mh73pmgM9+K8M0i7HwhUYDCEaiQdIOdbHP/kdxaFUiS0MDyddf9ni
	 MWJTnANDEClBTYMJp+r90MPcL+qQRnifMvzdKfEQz7OUs8W3DqNGMiHzSsAzdAXSc+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gnbuh7Cd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661A0606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gnbuh7Cd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460C41F000E0;
	Wed, 25 Nov 2026 22:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645392;
	bh=r+yku0q496XunaZnTUPYz/QmShp5m4bAN5X9cIEAz8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gnbuh7Cd2sA0thcjD6Rwzvav5NE6OZHviJxpMAXa20yD/5o53RAPRueiqdM2gDMy5
	 bo8P8fOtyqjsFNAyfr0RpMH69wkvt4/n2B9hUH6GvcEAczlXbs0OoO8jeUlAddtHkS
	 AWQw0JUY/A9ZW9kIo4bwHiczk5NNR/RoPOHWXlJaHQINwaGZgJhvWd3qqpmaOsIRQA
	 Pz/ZE3oF6z5SUUEDGZuaFW3WSLrGz7DTkluv81/ED/APUufOiB7K7niX8LouNM7COr
	 BUa5SDUIhZLGmkEA+6B4XFkIV/3ttbI6jkMyf15hEcAtxxxCy5Kof+YhtCM0zGKsYd
	 z7p5Gqzn/ScYQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-riscv@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 10/47] irqchip/sifive-plic: Move CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:21:53 +0100
Message-ID: <20261125222230.22508-11-frederic@kernel.org>
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

The callback here simply disables a per-cpu IRQ, which internally locks
the irq desc. Therefore it can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 2200c6691ac1..c7794716bca6 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_AVECINTC_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_AVECINTC_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

