Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630723;
	b=gV9DQywhTBrCCI/mzlPoR0vUjHZmeiObDQMuUcEu/nA/2/Jk0vSsd7wWPlMRJsdBJshv
	 KWXkeQqSumjKzvYAMel5xpb2i5ohouHIz2Pm4k+FXrcM1RWZ2Y8yO5Gl5b4izPr4ogY8G
	 pjidR68Dv1IGd8i5tBdeKVFSJSDKLP9OtzQXFp5BcvpSPyVGFMMEe7xnUL5A1eRUMlsxG
	 yf8r5k+TBMmXfwRL3eNDaVaeGmlLmlbCxlksOcpg5UPk6v0diEsECmHvoqu3F2tt2pdvf
	 8sNLT3dH7vMgKU8xWImO4PtaSm8b+fVU6in/LMN0RM7akGTBSVLEiuHi5Oc1SzimpNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630723;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=Z5wtZ29HF4d0zvVmY1csWlWBKpEEPHlXc/14ccRPwFU=;
	b=IEu2h/HyQpyXmh/brR3LmULLmflNy4RLYX9cgLK/X1Aw2RqAPPRHvQV5ov1plg89RxW7
	 ErF/IoBQ+d4yJBFxYiQq1/oTDBHjSn815e0sAiPvPvpXnoLsLg18KzSnAkoryHdZhBTrh
	 UFaghvTLu7AFfZZsBrK40da7BQ7NwQH7LGCMVjv2wgTEt1qvXBQJeBsMSlmg+L7/Yy9b2
	 X22resADbxyLppNoQt403QSs66jJQUytPgP9RKqARejqERkLqwmXgyeH8yLO9SjpsEPum
	 BccaupSuRJ/sQsFddLqRdzLLMCZ0aKTiyPJ34tMJiGWhD7mzmqTXHSdWBSaPqAZ6XIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JX7uRhPn;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=61pwknIF;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FFF606A6A9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48FFF606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JX7uRhPn;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=61pwknIF
Date: Wed, 25 Nov 2026 18:18:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795630721;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z5wtZ29HF4d0zvVmY1csWlWBKpEEPHlXc/14ccRPwFU=;
	b=JX7uRhPnCYMNQAM34gVMVPaUnQ3O9hZdYT6+6XIUm7ToC4J2r3GWOjNYqX8vMPjpjeWt8O
	ApA4/z/jaJQ0j8Q1tVi+FYCnGSXaWXY3OnE7Fp6ejXV6ZqKQsfTgWzNvv8rxkakoq549X9
	WBILg4+IL0rJdqSk0Na2seTPzkVyhB4Us4+13hLrdnEARRQbxhQZd3+BafClPX3CL4sxoU
	q5Y6agGAXiDl2JZLYcorq7W1rg1VPgfX52xLNjIlxWdkc2eJfuGliVSdAOteF/EyPevAIi
	F7BHgXFL2/oZ6YFgGNZwzwy7SJuf7esedAlk34FLrTz1VuHyXrtcLnNWieAt4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795630721;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z5wtZ29HF4d0zvVmY1csWlWBKpEEPHlXc/14ccRPwFU=;
	b=61pwknIFy8c/a1D8Fw9IU8Auso5O7i+gRNHB9JxSK/CAItv3nHG1kOTJOLqp3LtLMrOo94
	DOTFdWZhXFm9/XDg==
From: "clocksource-bot for Chen-Yu Tsai" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next]
 clocksource/drivers/timer-mediatek: Don't override the arch timer sched_clock
Cc: "Chen-Yu Tsai" <wenst@chromium.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261109120757.847266-1-wenst@chromium.org>
References: <20261109120757.847266-1-wenst@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179563071941.92412.4668860632050102523.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     410ad3660b8998058f4e474212a91fb899300f9d
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//410ad3660b8998058f4e474212a91fb899300f9d
Author:        Chen-Yu Tsai <wenst@chromium.org>
AuthorDate:    Mon, 09 Nov 2026 20:07:56 +08:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Wed, 25 Nov 2026 17:48:47 +01:00

clocksource/drivers/timer-mediatek: Don't override the arch timer sched_clock

Since the driver was converted to a platform driver, the GPT probes
late, after the architected timer has registered itself as sched_clock.
sched_clock_register() only refuses counters with a lower rate, and
sched_clock has no notion of priority, so the 32-bit GPT counter, which
runs at the same 13 MHz as the arch timer on MT8173, replaces the 56-bit
arch timer counter as sched_clock:

  sched_clock: 56 bits at 13MHz, resolution 76ns, wraps every 4398046511101ns
  ...
  sched_clock: 32 bits at 13MHz, resolution 76ns, wraps every 165191050201ns

Before the conversion, both drivers used TIMER_OF_DECLARE and
timer-mediatek.o is linked before arm_arch_timer.o, so the arch timer
registered last and won.

The narrower GPT counter wraps more often and is slower to read over
MMIO than the arch timer system register. Doing the switch at runtime
also runs enable_sched_clock_irqtime(), which may sleep, with interrupts
disabled, causing a splat.

Other drivers worked around the same problem in the same way, see

  commit 37b8b003c483 ("clocksource/drivers/sun4i-timer: Only register a sche=
d_clock on sun4i and sun5i")
  commit 10720e120e2b ("clocksource/drivers/imx-tpm: Exclude sched clock for =
ARM64")

Only register the GPT as sched_clock if the ARM architected timer is not
present. This currently includes MT6572, MT6580, MT6582, and MT6592, as
seen in their respective .dtsi files. This follows the example of
sun4i-timer.

The analysis of the boot log and git history, and drafting of this
change, were done with an AI agent. The agent originally proposed using
arch_timer_get_rate(), which was replaced by the author.

Manually tested on a MT8173 Hana (Telesu).

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probi=
ng")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # on Amazon Fire HD 10
Link: https://patch.msgid.link/20261109120757.847266-1-wenst@chromium.org
---
 drivers/clocksource/timer-mediatek.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer=
-mediatek.c
index 842d6ee..558bc75 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -15,6 +15,7 @@
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/sched_clock.h>
@@ -334,8 +335,20 @@ static int mtk_gpt_init(struct platform_device *pdev)
 	clocksource_mmio_init(timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC),
 			      node->name, timer_of_rate(&to), 300, 32,
 			      clocksource_mmio_readl_up);
-	gpt_sched_reg =3D timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC);
-	sched_clock_register(mtk_gpt_read_sched_clock, 32, timer_of_rate(&to));
+
+	/*
+	 * sched_clock has no priorities; a counter with the same rate
+	 * replaces the current one. Only these SoCs lack the ARM architected
+	 * timer, which is otherwise the better sched_clock.
+	 */
+	if (of_machine_is_compatible("mediatek,mt6572") ||
+	    of_machine_is_compatible("mediatek,mt6580") ||
+	    of_machine_is_compatible("mediatek,mt6582") ||
+	    of_machine_is_compatible("mediatek,mt6592")) {
+		gpt_sched_reg =3D timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC);
+		sched_clock_register(mtk_gpt_read_sched_clock, 32,
+				     timer_of_rate(&to));
+	}
=20
 	/* Configure clock event */
 	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
