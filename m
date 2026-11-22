Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795390039;
	b=g3891T5gkU+eSlpxR8DyQcoPPn1EfkESqBiW5d3ncaDy843/NXF5eBbKpj6YaW7O4nKw
	 +SZIzavyKt7o10rlJdN+hN5xg6v3nmE3i3zQGWkSK3xiqvo68X4YF3niGJ+4pg6o71LO8
	 0qkp+Su+MR/8tgjib7a0CfFagVOy4quxti3r3tQpMAOV0KJvv+A+h+H2vxQKLlpU+4dFw
	 9yr1RIQsu1VO0KCj+a4xxoiTpxsPrAecL08E1mY4zSdSiFEOJscBEl9DhrJ+q7tmCebNh
	 mgInrxvKntcSGz2aKEg4xQKtIXoGukH5ZGG7+a61ArPJKQB8c//iRpe2I75VyGobXcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795390039;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=E+Fp6cNttPvM4VxDuimKQ4XRCvflJSmhvQUQ+Qb+x84=;
	b=vC0wJwn08DLaS092PCqd2LON4uPAvpF7HQnPMid7VkahNLuOOBDzbyiSu8AUF3i9vLQ5
	 eQnbAwb4uoiA6sVkN2U6LAIJAr5w66igaI3KyItPRobvC7We7JENYZq50yr1uy8rYleA4
	 JIOVcGq1VFF/6exFvSaXsqTNOP9bZb8xZv7B6KpTzn2REX67+MaVw+Kw5g+kC4jkedaCz
	 j7Ll4AnF9/Z+/H2m6lsPlwsjZ51uFLJeTmZoeNpaSXd9spER5oljHPQMbR0beOz/G6p4i
	 2SIoFJu4duekespoQ4fuIW6BLgdK/HeLYjIQdZbgzuJrFsxpz6Voy2mONa+DMpTf1dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TdRCwCpt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDE4606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TdRCwCpt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6EC1F000C4;
	Sun, 22 Nov 2026 23:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795390038;
	bh=E+Fp6cNttPvM4VxDuimKQ4XRCvflJSmhvQUQ+Qb+x84=;
	h=From:Subject:Date:To:Cc;
	b=TdRCwCptNZQnG6kODSgzOJdBKdvTTu70ohFjU+G1uUK8bFxfvzMa8s7RvGEyPXV7S
	 8PNdH54gLdB9msuyOuJ4rEEYrcmTaljczy9L5ST8ebWqQ5HwQlUQ63EXDGQpB7T5C+
	 mMlJ5UfRdPiHp3LK8lZ70XXENnIjNxtsXrJkfgCJjDaAqzm3VrdYLsiYwaP9ykzCgi
	 FlVD1wDJAaO8Y9qO/HeTWasUp7V+4CHDprDonvMMamjlxIfyhXchiFWKQUbLG/Jmk6
	 L4hUYpf89/7WYidVRwWg26xNxYOSyn7JULZJxNVG1VQoIJM58B8Y+uMZdm6Ybx70ZL
	 dvqdnFraENgjg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 0/2] ARM and ARM V7M generic entry
Date: Mon, 23 Nov 2026 00:27:14 +0100
Message-Id: <20261123-arm-generic-irq-entry-v7-1-v4-0-49d245498f72@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/33Ny2rDMBCF4VcRWmeKLrZke9X3KFnY0shR28jty
 BENwe9elFJCKXh54PD9N56RImY+sBsnLDHHJfGBNQfG3WlMM0L0fGBcCWWEUQpGOsOMCSk6iPQ
 JmFa6QrEgIQTjpDeud03HD4x/EIb4dcdfjj87X6ZXdGsV6+MU87rQ9V4vsv5+Q3ovVGStqdaNV
 tge9fT8hpTw/WmhmddSUQ+rE2bXUiBBe29tYyfVGvvP0g+rl2LX0iChDb4XwXRtj/KPtW3bNzY
 u08JvAQAA
X-Change-ID: 20260622-arm-generic-irq-entry-v7-1-ff6c1d6c9c48
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Russell King <linux@armlinux.org.uk>, Oleg Nesterov <oleg@redhat.com>, 
 Yoshifumi SHU <envzhu@gmail.com>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

An earlier attempt at generic entry for everything (like syscalls)
was too invasive. Let's begin with just IRQ entry.

On QEMU Cortex-A15, perf bench syscall basic and perf bench sched
messaging (sockets and pipes) showed no statistically significant
slowdown in 12 paired runs against v7.4-rc1.

V7M is now handled by way of Yoshifumi SHU:s patch.

An LLM assisted with this patch series.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v4:
- Rebased on v7.4-rc1.
- Fix rseq aborts on V7M preemption.
- Add Yoshifumi SHU's V7M generic IRQ entry patch.
- Link to v3: https://patch.msgid.link/20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org

Changes in v3:
- Rebased on v7.3-rc1.
- Fix rseq abort handling for synchronous userspace exceptions.
- Link to v2: https://patch.msgid.link/20260806-arm-generic-irq-entry-v7-1-v2-1-3dd7747b2567@kernel.org

Changes in v2:
- Rebase on v7.2-rc1
- Select GENERIC_IRQ_ENTRY also for V7M even if this platform is not
  using it, in order to properly link the image.
- Link to v1: https://patch.msgid.link/20260623-arm-generic-irq-entry-v7-1-v1-1-f25ca7079e3b@kernel.org

---
Linus Walleij (1):
      ARM: entry: Convert IRQ handling to generic IRQ entry

Yoshifumi SHU (1):
      ARM: v7m: entry: Convert IRQ handling to generic IRQ entry

 arch/arm/Kconfig                    |   1 +
 arch/arm/include/asm/entry-common.h |  16 +++++
 arch/arm/include/asm/entry.h        |  16 +++++
 arch/arm/include/asm/ptrace.h       |   7 +-
 arch/arm/kernel/Makefile            |   2 +-
 arch/arm/kernel/entry-armv.S        |  78 ++++++---------------
 arch/arm/kernel/entry-common.S      |   8 ++-
 arch/arm/kernel/entry-header.S      |   7 +-
 arch/arm/kernel/entry-v7m.S         |  49 +++----------
 arch/arm/kernel/entry.c             | 133 ++++++++++++++++++++++++++++++++++++
 arch/arm/kernel/irq.c               |   6 ++
 arch/arm/kernel/irq.h               |   2 +
 arch/arm/kernel/signal.c            |   6 ++
 13 files changed, 227 insertions(+), 104 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260622-arm-generic-irq-entry-v7-1-ff6c1d6c9c48

Best regards,
--  
Linus Walleij <linusw@kernel.org>

