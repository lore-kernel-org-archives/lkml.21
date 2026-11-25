Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.223.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575559;
	b=F4/1aCqTcESeF2WLVCMFEyRhn1Ii9Y7XHLgq7UyY9Qa35GpnyLilEYCxMWajd+1yJMvM
	 e21k7oZzs/PndUdulazg78VTQKghnHvUW7YNg/bkgAiuCNkQCe0BRiDZs5Y3Ry7+H078W
	 B7LJ8koWnog2AEoMqZhcVbwpaLZXUNAwbVm652Ubb6Ad7hecueQEEvKxu5VSRRicToUpg
	 /UIPJnF0B7ap0Bx+9S3nhlTbTI3ZCk8Kz2H2HQ6VmygQkrcxpJ+5+3ZW8fRW/M3FIC1KK
	 X8t+rbnDId6qV33pla6UjfUADkKg0Cq96xQm9enCJYBENz+uL3G5VRzeNlVkGiT3kIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575559;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MC-Copy:X-MailChannels-SenderId:X-MailChannels-Auth-Id:
	 X-Decisive-Lonely:X-MC-Loop-Signature:X-MC-Ingress-Time:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AuthUser;
	bh=5ibFZ+i+ymLK1m6DwZvihMaR247fHo0RA4dE4rRYq+M=;
	b=EdRK8dkhdT7gGb5EldsOLgpXCydAJaAzXfYPAeHF4A8LgJBeVbg1mbz7uUulz927wtE5
	 FBMlR6BuVniL2Y+KUPV3hu+ekyKrUlkEFx6jfdWob8LoC+zgtoXh4ZN/QkYLg5GcbM/iw
	 FwMFFHUVSPIPnWglaqngMUa+c/YboAZV9hsnlPe9xmEY3Yv9TOTVaDsSceIILh3v5xUP9
	 PmLUlsICnuonB2f6LZJwdwGt5Glo7dLSlpTQ/JgQI9XKjfl2WnXQKMQExyMUJ0XgLRQln
	 xbW38m0FYj+axEgDigVwA9gJlrImyfwclxrodYy6jcOFswalVnS/HV1l8YoMoFZ30Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sim.vu;
	spf=pass smtp.mailfrom=sim.vu;
	arc=none smtp.remote-ip=23.83.223.167
Received: from skyblue.cherry.relay.mailchannels.net (skyblue.cherry.relay.mailchannels.net [23.83.223.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8350D606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8350D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sim.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sim.vu
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0B4E442336;
	Wed, 25 Nov 2026 02:59:13 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (trex-green-6.trex.outbound.svc.cluster.local [100.103.201.208])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id C692340D72;
	Wed, 25 Nov 2026 02:59:11 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Decisive-Lonely: 4b1ed81d566136a0_1795575552955_4153679430
X-MC-Loop-Signature: 1795575552955:3972808987
X-MC-Ingress-Time: 1795575552955
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.201.208 (trex/8.0.2);
	Wed, 25 Nov 2026 02:59:12 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:59026 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3Dw-0000000BJlE-0VWx;
	Wed, 25 Nov 2026 02:59:09 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linusw@kernel.org,
	arnd@arndb.de,
	envzhu@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: v7m: clear CONTROL.FPCA before the boot SVC
Date: Tue, 24 Nov 2026 20:58:51 -0600
Message-ID: <20261125025852.1160075-2-brad@sim.vu>
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

__v7m_setup writes CONTROL only after the SVC it uses to enter Handler
mode. If the boot loader ran FP code, CONTROL.FPCA can still be set,
so the SVC stacks an extended frame, and its EXC_RETURN has FType
clear. Since commit 72cd4064fcca ("ARM: 8830/1: NOMMU: Toggle only
bits in EXC_RETURN we are really care of"), that EXC_RETURN is saved in
exc_ret, which every return to user space uses, so each return expects
an extended frame that ret_to_user never builds. init then starts with
a corrupted stack.

Write CONTROL to its reset value, 0, before the SVC. That clears FPCA,
and also selects the main stack, which the code after the SVC reads.

Tested under QEMU (mps2-an505) with a boot shim that runs a VMOV
before jumping to the kernel: without this patch init loses its
arguments; with it init starts with them. It also boots on an RP2350
board.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it wrote the change, the boot shim and this changelog, and
ran the QEMU and board tests; I reviewed the reasoning and the test
results.

Fixes: 72cd4064fcca ("ARM: 8830/1: NOMMU: Toggle only bits in EXC_RETURN we are really care of")
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: stable@vger.kernel.org
Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/mm/proc-v7m.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mm/proc-v7m.S b/arch/arm/mm/proc-v7m.S
index d4675603593b..6d0532abc086 100644
--- a/arch/arm/mm/proc-v7m.S
+++ b/arch/arm/mm/proc-v7m.S
@@ -124,6 +124,11 @@ __v7m_setup_cont:
 	mov	r5, #0x00800000
 	str	r5, [r0, V7M_SCB_SHPR3]	@ set PendSV priority
 
+	@ Clear CONTROL: a boot loader may leave FPCA or SPSEL set
+	mov	r5, #0
+	msr	control, r5
+	isb
+
 	@ SVC to switch to handler mode. Notice that this requires sp to
 	@ point to writeable memory because the processor saves
 	@ some registers to the stack.
-- 
2.43.0

