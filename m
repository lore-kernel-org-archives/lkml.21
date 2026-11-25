Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645399;
	b=LvkAdiREItOLx5oSOm0EIY+EE+NO8B3ZgBuwTs9DwP5M/1PisLYCfN9DMP1uVz/gh/cs
	 AJ12oSlyY6k2IlnzftpYHKArtPiHfBmrH9Yuezg4X3+iNwbAwsMFART3dhQsFi2unPa5b
	 QW+VIal68XnuTYg6xWiz/UM8fNKuGsnAWt1dsRRuEdbLzv7L+76XCPNZhAe+zESbPOlBZ
	 QEzZCS0/q5LxM+GvDyOInjNSMwDsv7d2MQej/JYiKUMmbvQy1qxEW1uV5QUG1+7wb5mhg
	 aWhPXom/rlf0kM965CkKaRLIsHdsWzieYYtlwZ69o6gdLtN9WWF0iJTNJ4Qwmgo1/IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645399;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xlrHs1u0xgwmdUaOqayYWtHmLy/yRrVcwjuoyJTzS9s=;
	b=JFAgUc+fJ4QWtxEVKuRu8TEHVAAEDsECqMDtd9GXmqWWfg+B9r960Hjvyd/ZfCgmieUe
	 9y4s6It4tlVO8mENEGoiISrbG1Po27ezdL2GnuVCnqQ4EXwfWqGHEGjLWuH8udcNV+CZ6
	 jLw2RvZoHY4QKSDkVQ+aaqRKM7xD1wr9a9C/kIU748tG2k7Mg98fFNoW39ZgFmONrBCC6
	 NJWfUb0fL3bBkifEMLlu4o7Aj9b5a/YivPRYmUgxvndiEOYhweOEyDTGkpQJPqqSp+sla
	 962SmRMxOu39uKYpbyPiAD+PpqE8Us+QV4yhz1j4P5bni896Q9Lo0N1yFlvPhWbAfPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SusJhJ4Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D735B606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SusJhJ4Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9781F000D0;
	Wed, 25 Nov 2026 22:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645399;
	bh=xlrHs1u0xgwmdUaOqayYWtHmLy/yRrVcwjuoyJTzS9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SusJhJ4QshLmipAmQqRnTo7JnjL/ywAqneEszrCWz9cPzMbhZVTxv4s3KkoPNw6Jr
	 T5GKnUprMkiegxIOmzfrhOlpy8mICVxCzn2pB5Mn0xm1DhjVb/T6mo8+7jim2WKhLR
	 Y7X3sKfnZVrh34NO0nlAnLBte1StQRco9Ep7RYnsiAOntlPjU46hBOnq1T7uKc1j0h
	 IxRloQHEaJgkzOhn8fNEbaP4gXBxgL24UXseOktkiz5HQFBuE0iROEnJdK/s4TggbK
	 ldEQADieg3qc+1zis6Ro0g6EYiAExyEUF5eahdmRr4wSbwHGv5Kl+AVJIgS+fVkkPx
	 07Vb7oEOGvrRw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-riscv@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 12/47] irqchip/irq-riscv-imsic-early: Move CPUHP_AP_IRQ_RISCV_IMSIC_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:21:55 +0100
Message-ID: <20261125222230.22508-13-frederic@kernel.org>
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

The callback here disables the current CPU IPI, which nobody should
touch concurrently since it is seen offline by other CPUs.

The sync protects internal datas with &lpriv->lock and the IRQ matrix
offline is protected by &imsic->matrix_lock. Therfore it can run
concurrently with other CPUs.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index c86570b13fed..151e4d9673b9 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ACLINT_SSWI_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_RISCV_IMSIC_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_ACLINT_SSWI_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_RISCV_IMSIC_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

