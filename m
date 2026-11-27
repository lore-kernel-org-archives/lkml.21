Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771680;
	b=ZHSh9KJ6xGEJBcsSWSYU2AqfaBy9pooZsUvFUtRLgPhtFuJ/AvKKAXUNaj1TjE2sqwYx
	 t1K/wgYCilrgiqLwPXex9t4bHSAI6YkrC8Oehj5sIhqPsuxrr/tK/iJ4+9BwAo+75uPdW
	 n5fagIfuseJRclmKpRShJpJbGRjVXrJburMlODwXcARoThTnNV3uPqHCDwzYtx+7u/fgs
	 2tCgLy53vHetWaQsnpiqimvxBODYpmiCvF9itBmrSZECwp4TVmOPeW9NcRkCqaQuRynaF
	 IHMgcd3R8Mx4mnUIsH7xk0ECmCha8SffKCcCKwcCIg3AgCut03RFkDk5CW2m4TtXzOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771680;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=WxrFT4Y6ROLLrJIxlZbs/UKZoIxJCgrWVSI6EmrHZzE=;
	b=ZBJC9KcRl/udcE0P/6ocQaP7rBqvyNdCPIBSbRr+VGPZEJolt0Ka0Xp2F7csXviirBP2
	 l+AqkyMjt7BcH3J8XdK6P63mfXqgP2kM2Cuz/hE1dRpNC8+ZbQNzJJWaLU1SRxhu0/aCS
	 cBIFAizF93kYE3MIOyfSRcGi8QNsuwy92uNVRJAjUlQa6qrdq9nx92jmDMUXdRhNI4Oox
	 gYraiOxYAzO/FD0YDIkgVGAVWFEmxeZ+uuR1Dlhj9O8zmQu2jmpHTu6D5kaz1ttAaOnXQ
	 mTksR9cRFUB9OgSubC4bRCsjodtrICkLjnbx2TC+4JJozc2L90Bf00c7A0DHO5RTzvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jQnjGVJQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YvbCe1xx;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5098606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5098606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jQnjGVJQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YvbCe1xx
Date: Fri, 27 Nov 2026 09:27:48 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795771670;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WxrFT4Y6ROLLrJIxlZbs/UKZoIxJCgrWVSI6EmrHZzE=;
	b=jQnjGVJQBoanpzn1jvc2w3JUGp1SUZXUIiRc09dgbPhob6NX1IHergBfAQF1glg+GlpcnW
	2FJtZuy+k6NLWlbfuHHaZPcUIijEE860EeEF3mb1BpzEahZYth7xq80oH+QGaSJC66w5oi
	YPY53gvk6c5vayKVsebWdRNGc8hOUJ0UHzRJTLslvc3e57Q/4OmROvQDyzID/CLkOhROtx
	mI1iRpN9eVXLZRPAkJpmgLNj2Y3NH/5hrm9MoheZXjW7NjF3m6LBM6SwgH8qJC4qkI1TRO
	bevVGHia3JVufZYxkDpIp4zSieD3xQw6SQ3O1QLF2Om1Pd0IZXAmr623ityS/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795771670;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WxrFT4Y6ROLLrJIxlZbs/UKZoIxJCgrWVSI6EmrHZzE=;
	b=YvbCe1xxlGeFLkPkxv1DSTR8ajqTba4YL9SH6g6laoqk3LDFk+H8/MorYJJYkaAEaJOg5k
	m4mhPJHsFZwjXVDA==
From: "clocksource-bot for Ryan Brue" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next]
 clocksource/drivers/timer-mediatek: Enable the GPT irq before registering
Cc: Ryan Brue <ryanbrue.dev@gmail.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
In-Reply-To:
 <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
References:
 <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179577166858.92412.11043565365102336770.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     a3c327ed541199b2ab2bec6d6f130b56cba767ee
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//a3c327ed541199b2ab2bec6d6f130b56cba767ee
Author:        Ryan Brue <ryanbrue.dev@gmail.com>
AuthorDate:    Wed, 25 Nov 2026 23:13:50 -06:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Thu, 26 Nov 2026 10:47:12 +01:00

clocksource/drivers/timer-mediatek: Enable the GPT irq before registering

Since the driver probes as a platform device, the GPT clock event is
registered late in boot, when PSCI CPU idle may already have put CPUs
into a state that stops their local timer. Those CPUs wait in the
oneshot broadcast mask on the hrtimer broadcast, and
tick_install_broadcast_device() arms the new broadcast device to expire
at once so that it wakes them.

mtk_gpt_init() sets the timer's bit in GPT_IRQ_EN only after
clockevents_config_and_register(). The forced event fires while the bit
is clear, the status register stays clear, and the waiting CPUs are
never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle state in
use, this hung the boot in 20 of 40 boots; with this change it booted
16 of 16.

Enable the interrupt before registering the clock event. The IRQ line
stays disabled until enable_irq(), so the handler still can't run before
the clock event is set up. With the bit set, the timer that
mtk_gpt_setup() leaves running could latch an interrupt that
registration doesn't acknowledge, the kind of pending interrupt that
commit fc686d0037d7 ("clockevents/drivers/mtk: Fix spurious interrupt
leading to crash") acknowledges in mtk_gpt_enable_irq(). So stop the
timer before enabling the interrupt, until the core programs an event.

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probi=
ng")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com> # MT8167 Sony PSC Mini
Tested-by: Chen-Yu Tsai <wenst@chromium.org> # MT8173 Hana (Telesu)
Link: https://patch.msgid.link/20261125-timer-mediatek-gpt-irq-order-v2-1-e9e=
793bd87d4@gmail.com
---
 drivers/clocksource/timer-mediatek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer=
-mediatek.c
index 764c30c..48a9ebf 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -352,10 +352,12 @@ static int mtk_gpt_init(struct platform_device *pdev)
=20
 	/* Configure clock event */
 	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
+	/* Stop it so that nothing is pending when its irq is enabled */
+	mtk_gpt_clkevt_time_stop(&to, TIMER_CLK_EVT);
+	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
 					TIMER_SYNC_TICKS, 0xffffffff);
=20
-	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
 	enable_irq(timer_of_irq(&to));
=20
 	return 0;
