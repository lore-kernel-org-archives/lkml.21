Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.212.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795308559;
	b=4l35720UgY3FQrdxJxXPLZwzDEmKjabO5/yFTkhSoXBSyXUVLOCHWK/zmrYCH4Kn6H6+
	 c4djhvfy01AxhAgiLCl5F8ruV/5k2hPU54THGY7b5FGQ45bCTtp8SAOtbNy8hGQGHnXM4
	 EBclNp2gtSrDBNJLWXY926+c3Da+zGzFECo/owJ0Bx2HJS7TXH0lCxCjD/zJEeCTXV0pG
	 B+RLuty8Ow9MbuX1fBMyVSrvfyBDOewFbJ3ab2dddOeV1T94XVy4Y2lctg9goe8aERtAB
	 kiM4t08oH5+NhY5392nYDJ8vGOp//QDqc9HyVS+/MkMBl/q1dKxgp2b9ECIPaCGU7Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795308559;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MC-Copy:X-MailChannels-SenderId:X-MailChannels-Auth-Id:
	 X-Society-Vacuous:X-MC-Loop-Signature:X-MC-Ingress-Time:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-AuthUser;
	bh=HLUAvWahn95LjdZZTsQI5ms6z6EHmoWOI6LfRrC10CU=;
	b=pwzrrGxG/rfjFcPOX+5PqROwbrjQl35PU6dHR4aIIrq6U24uqGTDT+gbkovPqHejbdan
	 p/HKVNWADFug4NaXzUH8vY61AwEXUXC9DJYHU9JkPeTwPx+mzeY29DAMonFUtN6bU7QjA
	 y0f5d1GuWKCuIs1aWNRRdiIThypgKfcj2lHh5WLKbwEh34HGDUFyxv5ZzeJMwMJvIz8Yb
	 +SR86UzUxL2DX1qYFqrzn2o3jqq1Nc2h+LOTTuXYaA014htSUDOgZnbJwNzyM/Akho4H7
	 5JmAmnN5WrBY57ZaRgGbnHFX9JO7KOt1n7MqzUe9/UpRTvO6qMLRQ346WtVMwedFmWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sim.vu;
	spf=pass smtp.mailfrom=sim.vu;
	arc=none smtp.remote-ip=23.83.212.45
Received: from crocodile.elm.relay.mailchannels.net (crocodile.elm.relay.mailchannels.net [23.83.212.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D3A606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00D3A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sim.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sim.vu
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B4885640E71;
	Sun, 22 Nov 2026 00:40:01 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (100-97-173-43.trex-nlb.outbound.svc.cluster.local [100.97.173.43])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 82CB16411C2;
	Sun, 22 Nov 2026 00:40:00 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Society-Vacuous: 156e5f4846f6bff8_1795308001482_2643813412
X-MC-Loop-Signature: 1795308001482:3339434938
X-MC-Ingress-Time: 1795308001482
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.97.173.43 (trex/8.0.2);
	Sun, 22 Nov 2026 00:40:01 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:44296 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xUvcb-00000005rJa-1iLD;
	Sun, 22 Nov 2026 00:39:57 +0000
From: Brad Hawthorne <brad@sim.vu>
To: Yoshifumi SHU <envzhu@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Brad Hawthorne <brad@sim.vu>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
Date: Sat, 21 Nov 2026 18:37:56 -0600
Message-ID: <20261122003911.1203777-1-brad@sim.vu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
References: <20260914140821.1805449-1-arnd@kernel.org> <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com> <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AuthUser: brad@sim.vu


Hi Arnd, Linus, Yoshifumi,

A second ARMv8-M user, in support of keeping CONFIG_CPU_V7M for v8-M.

I run Linux on the Raspberry Pi RP2350 (dual Cortex-M33, 520 KiB SRAM,
8 MiB PSRAM, XIP from QSPI flash) on an Adafruit Fruit Jam board. It
boots v7.4-rc3 to a userspace shell over the SoC's own USB device
controller, with the kernel executing in place from flash. Like
Yoshifumi I need the v7-M core, PMSAv8 and the NVIC far more than any
one platform, and I don't object to the MCU platform removals. The
Fruit Jam is a small self-contained computer (HDMI, USB host, SD card,
Wi-Fi), and I am preparing a public developer preview of this Linux for
it, so the core has users beyond me. On the RP2350 I use PMSAv8 to give
each process its own MPU windows, so a user program cannot write another
program's memory or the kernel's; that work is out of tree for now.

I tested the generic IRQ entry work on the board, v7.4-rc3 plus the
RP2350 platform patches, each case in its own process: a register-heavy
loop under a 1 ms SIGALRM, 1 ms sleeps, a pipe ping-pong between two
processes under timers, and rseq critical sections interrupted by a
signal and by preemption from a busy competitor (9000 sections):

                          rseq aborts on preemption   other cases
  v7.4-rc3                  820                         pass
  + Linus's v3                0 (all 9000 commit)       pass
  + v3 + Yoshifumi's RFC    802                         pass

So on hardware, as under QEMU (mps2-an385 and -an505) and as Yoshifumi
described, v3 alone lets a preempted rseq critical section commit on
v7-M instead of aborting, and the RFC fixes it. Signal-delivered aborts
work in all three. For the RFC on top of v3:

Tested-by: Brad Hawthorne <brad@sim.vu> # RP2350 (Cortex-M33)

Under QEMU, Yoshifumi's one-line arm_rseq_user_enter() call in
__pendsv_entry also closes the gap on v3 alone, if v3 should go first.

While bringing the board up I found a few things in the shared code:

 - mm/nommu: mremap() resizing in place updates vm_end but not the
   maple tree, so a shrunk VMA leaves a stale range that points at the
   VMA after it is freed. With Hajime Tazaki's agreement I've sent a
   minimal fix to linux-mm:
   https://lore.kernel.org/linux-mm/20261121083139.803682-1-brad@sim.vu/

 - irq-nvic: the priority registers are written at the wrong offset.
   Yoshifumi already found this, so I'll leave it to his series and
   test it on the RP2350, where the board does not take interrupts
   without it. For his changelog: the offset was right (0x300 from the
   node's base, ISER0 at 0xe000e100) until c5e0cbe2858d ("irqchip:
   nvic: Fix offset for Interrupt Priority Offsets") made it 0x400,
   taking 0xe000e400 as an offset from 0xe000e000; that commit went to
   stable as far back as 4.19, so the fix wants Fixes: c5e0cbe2858d
   and Cc stable.

 - v7-M itself: five patches, ready as an RFC series, each run on the
   board with and without it on v7.4-rc3:
     * an XIP kernel with HARDENED_USERCOPY BUGs on its first readdir
       (_etext ends after .rodata), a stable fix that stands alone;
     * a user program's fault stops the machine; with the patch it is
       a signal (SIGFPE, SIGTRAP, SIGILL, SIGBUS, SIGSEGV);
     * CPACR and CONTROL are inherited from the loader, so user space
       gets the FPU with no FP state switched;
     * on v8-M Mainline, MSPLIM catches a kernel stack overflow, which
       today runs past the stack unnoticed;
     * the Cortex-M33's ACTLR.EXTEXCLALL, set by pico-sdk loaders,
       makes every STREX to the RP2350's PSRAM fail, so the kernel
       never reaches its console.
   Two of them change __irq_entry and __pendsv_entry, which
   Yoshifumi's RFC rewrites, and they don't apply together. I'd rather
   rebase onto the generic entry work than collide: would you prefer
   them on top of it, and is linux-arm-kernel the right home?

Arnd, one question about the plan for the CPUs. After the 7.5
removals, nothing in-tree selects ARM_SINGLE_ARMV7M but !MMU itself,
and no board's device tree uses the v7-M core; Yoshifumi's boards and
mine are out of tree. Would a small RP2350 platform (DT, timer, clocks,
resets, watchdog), run on hardware for each -rc, be a welcome in-tree
user of CPU_V7M, or would you rather keep the core with no platform
and boards out of tree? I'd hold the platform series until the core
question is settled either way.

A note on method: I use an AI coding assistant for parts of this work.
Everything I send is reviewed, tested on hardware and signed off by me,
and each changelog says what the assistant did, per
Documentation/process/coding-assistants.rst.

Thanks,
Brad Hawthorne

