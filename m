Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645385;
	b=u+TR1liCF63lGkKXfvXFLIrhy9ZawItGwpK8b8KJt80FyJ5rBjqZeypgT4YalPThOwiZ
	 Rc+2iRbMzTtyq3xymXRFzJcSZFRjngPpFTvQRg0q1P9er5r/uuivXBXpEiLizdzt/BOe6
	 GhFYYXOte2+efEOW28G/yTZZZrAwF9scM/gMBri3KXm7k0D2dd7c+85gnkHC2SjQqudte
	 ZdPMRrlMJX20ONZddrREEvDTdpGXgxf6l9/NCVK1ppl1jmZ/C2BFw7pTlZ3oqbMA2ltAs
	 cD/oXb0orSqUulpEX1GtjaTKv/+B+WHQITPcVEC+ZLa+jUmdaNz4ZkkC9zkLSUI3gaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645385;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xaE2fIKTR375bkEqpj94I2cEG/xBj8rfEDb2yP33MPw=;
	b=BV6CCUiL+McWfMHHEoOIuLnZLX5deoCmo7om2OkO4FBunDaii6QyhZRnI/VsjYrg60va
	 SjzWMoQzzJo2aF8nR4sB/kEMC9d8Rdiy8tIWLOPrqUYOcXgvgEfVW4L+0fTsQeO+WBwu+
	 L3mNi/I8FREuW8aDsre+9WsC6XZBaufritPuV0zdom0P2XYEgb6R1qS2w93bxhCGmrkln
	 WzCdCBYFyPAoqTxyaxrzubZUGLyDYjjk51EA8k1oln/snT4SGxvV1GaKx3mxHrBXY8ron
	 4pF09IPXfRFeevEXZpbC7TQhID64qAlGX6gbGCUXwrF2MQbbFpPscPKO48NDrei0kLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fkk8wbJ7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E03E606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fkk8wbJ7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB1D1F000D4;
	Wed, 25 Nov 2026 22:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645384;
	bh=xaE2fIKTR375bkEqpj94I2cEG/xBj8rfEDb2yP33MPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fkk8wbJ7CLxqxVg+/DKtTArINhfu/ROarHMKUNBk8YyK0E3OsgpJKeWYcQa3F9sU5
	 QHEOEJLCScUcgZlbz99uqErAEHWyTSze98M+pSbUDkgOdOzyfLS6kgbMmxIT+XbBS+
	 yvrGsfoBf2qFEXvda96g9ZXYxL84CcZ7dNhplwyeFVLdW/pOZHgUfp59LysXGikDwg
	 qByZu/4Npw96YJP8PVUczvtDpewoElwNu6RhtKyD+hGHPH/qNbApp8iIIJYjoTB4UJ
	 r7fqznwh+SwXpWeM3QVk+qHJrzArol6fd2gYQ26fyr3Y1EN3MJX9dkxpucomHxLGhc
	 hnpKuvAI0xmrQ==
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
Subject: [PATCH 08/47] cpu: Move [CPUHP_AP_IRQ_EIOINTC_STARTING..CPUHP_AP_IRQ_MIPS_GIC_STARTING] range post stop_machine()
Date: Wed, 25 Nov 2026 23:21:51 +0100
Message-ID: <20261125222230.22508-9-frederic@kernel.org>
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

None of these states have teardown callback.

Move them to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 2e162425bfc7..ac87ce01d77a 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_BCM2836_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_EIOINTC_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_BCM2836_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_EIOINTC_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

