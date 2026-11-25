Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.222.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575567;
	b=3vM2WcZaD8a8F9ILD2u1aEeS7/PnXeigKPiv24hetyaDBOUHV+6xFLCHowZQBbSQcvWT
	 gN5IzVuuBsZtXE0cT/ttzSubZRqMBbBqwpd1pYVsPMROM1V7L8mJMVDhU3bVj1bt+webB
	 hGvjR6+scdmIs+lJjdCx4JvMjpi0RkTLb/IIX+hA3lZspvZhWwK2jDeBq52GRvpBOZcs+
	 4rGLqQOi35iNAZViw2uU2axUg2d/Ddl/Dx1UKYqj/bY7YHRep4lxOS7e8H9WxTg2Wqj6m
	 /P7Q/U4AvmXcwv52UGCI038ugfr7oxoYcnmdRNZ3NcWt+A5bNGUbZRX1dHooyu8xxQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575567;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MC-Copy:X-MailChannels-SenderId:X-MailChannels-Auth-Id:
	 X-Well-Made-Bitter:X-MC-Loop-Signature:X-MC-Ingress-Time:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AuthUser;
	bh=6WqlIESBGi2Mj5SLPTUypPXaBNmLKW1S4LixEPXMrUg=;
	b=YO8pbsNaDaC2u2cyUgWoMC3Y5/3NAxl9I9akKLCRzHgcOVFQQFVsSxjemnCAlP1akvgU
	 4c41YMcgzou4/YPbckNTL1360sLtqAD6eS6/lTeyUSoBJ9s+TJmmKvA4vkjdyBaWGQgpr
	 nOa7/5/Vs3X3MEE8jMtuEKveuQ/SgZ9UF9YJiz0ZeBeND/FHAD4gnBeNklYwkeT7UnLpI
	 BiYGCLTgWrt7maaeE9hRsa+TZjT44Vj1XeAOwh5XLBx2UEngZuqBk6yunUxgRr7GPNHG+
	 mrBL3Yi5gkYCGT/O1z29zEJ3lT7s0uVvBRd3AiJBjLdQxZyqA4pIuFTmfc9uB8ByXDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sim.vu;
	spf=pass smtp.mailfrom=sim.vu;
	arc=none smtp.remote-ip=23.83.222.36
Received: from cichlid.ash.relay.mailchannels.net (cichlid.ash.relay.mailchannels.net [23.83.222.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283DB606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 283DB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sim.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sim.vu
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6FEF39414F1;
	Wed, 25 Nov 2026 02:59:20 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (100-96-5-164.trex-nlb.outbound.svc.cluster.local [100.96.5.164])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1F21A942231;
	Wed, 25 Nov 2026 02:59:14 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Well-Made-Bitter: 1bbf9a0f3e03fd0b_1795575560368_3404297731
X-MC-Loop-Signature: 1795575560368:658793710
X-MC-Ingress-Time: 1795575560368
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.5.164 (trex/8.0.2);
	Wed, 25 Nov 2026 02:59:20 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:59026 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3Dz-0000000BJlE-1of8;
	Wed, 25 Nov 2026 02:59:12 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linusw@kernel.org,
	arnd@arndb.de,
	envzhu@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: v7m: clear the Cortex-M33's ACTLR.EXTEXCLALL at boot
Date: Tue, 24 Nov 2026 20:58:52 -0600
Message-ID: <20261125025852.1160075-3-brad@sim.vu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125025852.1160075-1-brad@sim.vu>
References: <20261125025852.1160075-1-brad@sim.vu>
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
X-AuthUser: brad@sim.vu

With ACTLR.EXTEXCLALL set and the MPU off, a Cortex-M33 sends every
exclusive access to the system's global monitor. The bit resets to 0,
but the Raspberry Pi pico-sdk sets it for its multicore spin locks
(spinlock_set_extexclall() in hardware_sync_spin_lock/sync_spin_lock.c),
so a kernel started by a pico-sdk loader inherits it. On the RP2350,
the PSRAM where the kernel runs is not covered by the global monitor,
so every STREX there fails, and the kernel's atomics, which loop until
STREX succeeds, never finish. The kernel never reaches its console.

The bit only has an effect while the MPU is off (RP2350 datasheet,
ACTLR: "External Exclusives Allowed with no MPU"), so this affects
kernels built without CONFIG_ARM_MPU. With the bit clear, the core
handles exclusives in its local monitor, which is all a uniprocessor
kernel needs. Clear it in a Cortex-M33 setup function before
__v7m_setup, which already sets other state a loader may have changed
(VTOR, the fault enables, the exception priorities).

Tested on an RP2350 board booted by such a loader: without this patch
the kernel hangs before its console; with it, it boots. QEMU does not
model ACTLR, so there it only shows the boot is unaffected.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it wrote the change, the board probe and this changelog,
and ran the QEMU and board tests; I reviewed the reasoning and the test
results.

Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/include/asm/v7m.h |  3 +++
 arch/arm/mm/proc-v7m.S     | 12 +++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/v7m.h b/arch/arm/include/asm/v7m.h
index 4512f7e1918f..505f75deeea9 100644
--- a/arch/arm/include/asm/v7m.h
+++ b/arch/arm/include/asm/v7m.h
@@ -5,6 +5,9 @@
 #define V7M_SCS_ICTR			IOMEM(0xe000e004)
 #define V7M_SCS_ICTR_INTLINESNUM_MASK		0x0000000f
 
+#define V7M_SCS_ACTLR			IOMEM(0xe000e008)
+#define V7M_SCS_ACTLR_CM33_EXTEXCLALL		(1 << 29)
+
 #define BASEADDR_V7M_SCB		IOMEM(0xe000ed00)
 
 #define V7M_SCB_CPUID			0x00
diff --git a/arch/arm/mm/proc-v7m.S b/arch/arm/mm/proc-v7m.S
index 6d0532abc086..7d830fa5bf86 100644
--- a/arch/arm/mm/proc-v7m.S
+++ b/arch/arm/mm/proc-v7m.S
@@ -96,6 +96,16 @@ SYM_FUNC_END(cpu_cm7_proc_fin)
 
 	.section ".init.text", "ax"
 
+/* Cortex-M33: clear ACTLR.EXTEXCLALL so that exclusives use the local monitor */
+__v7m_cm33_setup:
+	ldr	r0, =V7M_SCS_ACTLR
+	ldr	r1, [r0]
+	bic	r1, r1, #V7M_SCS_ACTLR_CM33_EXTEXCLALL
+	str	r1, [r0]
+	dsb
+	isb
+	b	__v7m_setup
+
 __v7m_cm7_setup:
 	mov	r8, #(V7M_SCB_CCR_DC | V7M_SCB_CCR_IC| V7M_SCB_CCR_BP)
 	b	__v7m_setup_cont
@@ -216,7 +226,7 @@ __v7m_cm55_proc_info:
 __v7m_cm33_proc_info:
 	.long	0x410fd210		/* ARM Cortex-M33 0xD21 */
 	.long	0xff0ffff0		/* Mask off revision, patch release */
-	__v7m_proc __v7m_cm33_proc_info, __v7m_setup, hwcaps = HWCAP_EDSP
+	__v7m_proc __v7m_cm33_proc_info, __v7m_cm33_setup, hwcaps = HWCAP_EDSP
 	.size	__v7m_cm33_proc_info, . - __v7m_cm33_proc_info
 
 	/*
-- 
2.43.0

