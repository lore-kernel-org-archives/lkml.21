Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605981;
	b=Yijpf7v+xDWHWt/duVcfFWkjY8vtBwQpDcsRZAu3vXvZU5CI8qtkSbb6D3xA58AnNpaw
	 hOn12Pj4eWD0wsFX6//HhH51an7eSVkYrXK+KYw0wADmCLBtDwBHzf6t6vEpZVH/VMim+
	 jcvAbt43QFRi8o91wEXJglo1XmS4TVDoejYC0Wty6vLJMecJj87zEaeXU1BKsTL24CmYX
	 O9/IL+cgvJ2AweUp8jsxvZomtPH1praQ1BSzKqprX2esi1gz6M4ZIm7/mksQA9b90AULz
	 g4Es+AF+ZP2/gw9+PrRVilmmGPrse/1Isah8d9TiKXN/QGsi2LDfe+Nr3xuRhurk+2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rDl21FEwKc8w1wUvpoWP8YurzYoH5QDYcY6p8dT/kgw=;
	b=jUkqwbnOSFgma2UMu1VPlC2bXHmu81xPfk0jPLqaiE3gMJfsQWdRBcv2G3PFIjnBk5zO
	 KMY55FnQqE7yTe2g82kqddGvJmEubo9yQ0U51G0wJh/GJa7ddseQT8RoR2+20zxIshUUY
	 AO9LZartf5ICh449icrgpg/C9U99eODp+8kRvoi7SNN6OtC72aCFDbkqaByZDmgtkf59+
	 RfzO96OD6u+QtEgzOYAeXpy6Z9wQ8NW4i5lvZ2RRLWAx3f9+pDxADOLDhOAWNzG5W+yxN
	 hpCzPSBEGN8MLpZMXrjhaJb8d32o4c29Lp84jfuv4kGfLLmmMxj0V10t1hUNXxOAH2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cj7xzYJ3;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D61606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68D61606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cj7xzYJ3
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38644aedba1so8591571eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605980; x=1796210780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDl21FEwKc8w1wUvpoWP8YurzYoH5QDYcY6p8dT/kgw=;
        b=Cj7xzYJ3gSDH4Ay+OSuf4iWtR5EpdJhYyvSBnTTMDfcAz9wRgjAfbxobJ/yykFaD2a
         76e/gEJ4btLlcI9nudSZIFK1V5uKGEQHVE1mEjoo4o1xKDJ+BN2JCvobKHFHj3wvK1CT
         VBzpMQmBueBO4n34fkRE5vEEQJaS0lJCvyR95BVzTzdZBh0n5dHmrAS3p/bFUFewkEoC
         pHtLfsVULmuz18EmYG2lA5SZQlDHlouVUlKW1hjHzzPa+bYtKAv4SLYRLeyglGi7or0I
         U6Lq1b6tDicMgT7tbVAOZndRD5GdyOs246jvdDhgTFNSMUaV7tsQMDX1+C2i0E4uy5vq
         Pf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605980; x=1796210780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rDl21FEwKc8w1wUvpoWP8YurzYoH5QDYcY6p8dT/kgw=;
        b=o4BgFeIVfrQpTgHxrqxnHTI086W7qPD5HulYdfJ/jQJVQDoBNgxYIlgisPKzbqt/Pw
         kVC7If0oO27QHVbuzKvd4I9ZPn6E3r4tAc5N+XV52UY+W6egKBuuEdCVoc2wSjLgnPd7
         FnYmhvuOseVQBzc2hQK/bmltd3lwBRdgJdfkE1uxz7Kg3s2kKe3+Xwdt1G4/Xv4hm8PI
         d8bFGpuVjdzrXo3WLUeB3jAX+A9BiZdMi7/G8Dnb+O3LtxFsoL1/aHTOXjIr44eWgr5U
         gzOsXHOQUxfc9VfnEcZuAfWlutvvtpjoefy/kpeVPozqkZxTHYgkozMk6kJMUu1W7JSx
         L4GQ==
X-Forwarded-Encrypted: i=1; AL+hErF2NSBcnXcpyVCDVh4Rk8vRjuuZXT0B5nmWUyUbrAThfOnV8/AO5y9HwBkzZ2yN8iecfG/cy+EnNmdM2nU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9GgfGqbnteOewW8VVD7MkVtxiGJQ5cs6z+C4PMsPUJevGQx67
	I75ecESpiCMLqX2Aap3OdFyO8CpBjmf84l5iuDJTUwkrrmvcMbRfAew2+LjnQA==
X-Gm-Gg: AZFdTZeEMyGqJb7+FtbC/qySGV61mLb8/+/RtCkHbNSXqZTJghRDaQqDKEd0SaM8Ytz
	wd82kYAdxwMBmOvDLnxhaHjWh7ZOzR1XmQunfR+V+kkWHgsyHEnQdP9lfALzJQYZal0YSne68Dj
	7fMDNgDuxqQai1keTj39t65PEt3EGLCnd5wLNkaSY9XbOslH+BZGCszwBiZwlibWZbEueo1S7xd
	EfitJn5KR/q/GdqsIavJmHYaAab8h0pOS8N5RL/Br/2+rp6EoksrkYtRiNl2QgvbQb1dovl/mdd
	VP3/Cr0YZV1yL28dj5qQUyn/yW2T4Am84ZEw+4Icq85J9VSvxcZgZTaeJRaimTM/NhCawlV8NiG
	K6tddHKi9cvBXL5mtlA5OFgWfXbDCwOLXtwQrjPeukdfG09mczJO6+IT5dA37TpF3KoVDw+5ZSK
	pHhLSMS+zQF9K38acnRLLGm01QHYB+vsG58AyBm+5iOlvWd4ueWvmOyK5eS1e5YSj3hNfCLAHzA
	pIt4GFRsXqNOADYWLHRPJRYQD7vF48jrhDI4QwZw291dbnBbkXHSpAstao7EUO1/UWb003uQr7F
	XE8G+Cb4p4bE+ZGynrn77Y7u5hoSR/DjVbJIYgxop78sHH2aAJKI++7G
X-Received: by 2002:a05:7300:7316:b0:386:c5d3:7300 with SMTP id 5a478bee46e88-386c5d37603mr5633447eec.12.1795605980290;
        Wed, 25 Nov 2026 03:26:20 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm11778380eec.17.2026.11.25.03.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:19 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	stable@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCHv4 1/4] powerpc/64: Leave lockdep hardirq context around replayed interrupts
Date: Wed, 25 Nov 2026 16:56:03 +0530
Message-Id: <6a02babe73f316616cf829af3ddbbfc61fb4066a.1795603946.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795603946.git.ritesh.list@gmail.com>
References: <cover.1795603946.git.ritesh.list@gmail.com>
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

With PROVE_LOCKING, boot warns once and lockdep turns itself off:
  DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context())
  WARNING: kernel/locking/lockdep.c:4448 at lockdep_hardirqs_on_prepare+0x22c/0x2d4, CPU#0: swapper/0/0
  CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.4.0-rc2-00027-g074831f06e18-dirty #123 PREEMPT
  NIP:  c0000000002b2f2c LR: c0000000002b2f28 CTR: c000000002426f90
  REGS: c000000004f075c0 TRAP: 0700   Not tainted  (7.4.0-rc2-00027-g074831f06e18-dirty)
  MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 48022221  XER: 20040000
  NIP [c0000000002b2f2c] lockdep_hardirqs_on_prepare+0x22c/0x2d4
  LR [c0000000002b2f28] lockdep_hardirqs_on_prepare+0x228/0x2d4
  Call Trace:
    lockdep_hardirqs_on_prepare+0x228/0x2d4 (unreliable)
    trace_hardirqs_on+0x98/0x11c
    irqentry_exit+0x64c/0x1064
    timer_interrupt+0x274/0x6bc
    __replay_soft_interrupts+0x158/0x380
    arch_local_irq_restore+0x1cc/0x244
    console_flush_one_record+0x438/0x654
    console_unlock+0xb8/0x1e0
    vprintk_emit+0x300/0x56c
    vprintk+0x20/0x34
    _printk+0x40/0x54
    lockdep_init+0xdc/0x104

The warning is triggered because trace_hardirqs_on() gets called while
lockdep's hardirq_context still says we are handling an interrupt. To
fix that, we need to ensure lockdep's hardirq_context and
hardirqs_enabled state stays consistent with powerpc's soft-masked
interrupt replay code and the generic entry/exit code.

With the current change, this is how the new state machine looks like:
                                       hardirq_context  hardirqs_enabled
  arch_local_irq_restore()
    trace_hardirqs_off()                     0             1 -> 0
    irq_enter()                           0 -> 1           0          (softirqs held off)
    __replay_soft_interrupts()
      lockdep_hardirq_exit()              1 -> 0           0          patch: the loop is not a handler
      timer_interrupt(&regs)
        irq_enter_rcu()                   0 -> 1           0          handler starts
        irq_exit_rcu()                    1 -> 0           0          handler done
        irqentry_exit()
          trace_hardirqs_on()                0             0 -> 1     legal: context is 0
      next_interrupt()
        trace_hardirqs_off()                 0             1 -> 0     still replaying: back to off
      ...                                 same for each pending interrupt
      lockdep_hardirq_enter()             0 -> 1           0          patch: restore for the caller
    irq_exit()                            1 -> 0           0          softirqs may run now
    trace_hardirqs_on()                      0             0 -> 1     IRQs really enabled

Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
Cc: stable@vger.kernel.org
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Closes: https://lore.kernel.org/linuxppc-dev/b44aefc5-e066-478b-8d34-50d2d0deab6b@linux.ibm.com/
Closes: https://lore.kernel.org/linuxppc-dev/20260922150619.lwWqj1AO@linutronix.de/
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kernel/irq_64.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/irq_64.c b/arch/powerpc/kernel/irq_64.c
index d5c48d1b0a31..e2f1e5b7a3a7 100644
--- a/arch/powerpc/kernel/irq_64.c
+++ b/arch/powerpc/kernel/irq_64.c
@@ -76,13 +76,11 @@ static inline void next_interrupt(struct pt_regs *regs)
 	}

 	/*
-	 * We are responding to the next interrupt, so interrupt-off
-	 * latencies should be reset here.
+	 * We are responding to the next interrupt. The irqentry_exit() of the
+	 * replayed handler has traced hardirqs on, which also reset the
+	 * interrupt-off latencies. Trace them off again.
 	 */
-	lockdep_hardirq_exit();
-	trace_hardirqs_on();
 	trace_hardirqs_off();
-	lockdep_hardirq_enter();
 }

 static inline bool irq_happened_test_and_clear(u8 irq)
@@ -116,6 +114,15 @@ static __no_kcsan void __replay_soft_interrupts(void)
 	 */
 	local_paca->irq_happened |= PACA_IRQ_REPLAYING;

+	/*
+	 * The irq_enter() of our callers is there to hold off softirqs. Each
+	 * replayed handler enters and leaves the hardirq context itself and
+	 * returns through irqentry_exit(), which again traces hardirqs on.
+	 * Since lockdep only allows that outside of hardirq context, so leave
+	 * it for the duration of the replay.
+	 */
+	lockdep_hardirq_exit();
+
 	ppc_save_regs(&regs);
 	regs.softe = IRQS_ENABLED;
 	regs.msr |= MSR_EE;
@@ -168,6 +175,8 @@ static __no_kcsan void __replay_soft_interrupts(void)
 		next_interrupt(&regs);
 	}

+	lockdep_hardirq_enter();
+
 	local_paca->irq_happened &= ~PACA_IRQ_REPLAYING;
 }

--
2.39.5

