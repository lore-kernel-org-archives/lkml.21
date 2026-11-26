Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670052;
	b=YVuhlIEZc/lNFbNK1Yfyqywtripe79+GD/vcszGV75NxKY4sOHsBtt1msQNP1VNWfIQn
	 S88s09r3h4JhHc34deaFDHvv4qua7PMU+Qe2Ak1fgxOT+4I+2s2xE2BEZlYxqLss9ShLX
	 YDaqa31nAR3p8Rl7gJ3vRIuUheJGcuCeosPqYRqOv3+J9c1GB7Tbb5wstezDCR8gDF4+C
	 fmZnKbLRGKaCp2LBRIyv598wRpfvwDLK3sQ+edefSL0wQXKEqGTQ2+Bpv75KwV5PYJVOK
	 YkuTh3ZOIMYP4gVeSg4eDedMk/MJowfjCy84h6SyONQ4gColkjKS85dVLpkkf9/Ipxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IQC0rmb60+7fGUy4+e3ojRybTycBzBk8+WNROPwteGo=;
	b=aAHFMfuu7EAQG2EntNp6d8/HCRbX2aX27NmDW82zeojbDLfFj3C8CLDm6ZX20bmOnlos
	 /UqMzyVRPaHipUMF85sy0rexNFOrxMS+F3Yx9dB5pXEatFp0a9EwdZVOOL5FJkmMXwMrd
	 Eh/VMuYkbTB4uV+BmszJGdtv+3SwjveTHpNg/6QexrsD7sNmXBRRN0xKmkltURDQ9lO7O
	 ja3EmTpgZaad7JFzBRw9WKekKB9HNIdApzALfZpiP1scJ3r/PxMa16JifD5Zpyhl8/nle
	 MpcW0MFsMO0pMnKhomqfBH/7GIx4KynI9fMojTCjKDiMFWy8XMRRpRmsZFvsUrqcqFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Y4oV/WTq";
	arc=none smtp.remote-ip=74.125.231.134
Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C03C606A335
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C03C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y4oV/WTq
Received: by mail-oo2-f6.google.com with SMTP id 006d021491bc7-6ddeba3e85dso1523236eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670050; x=1796274850; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IQC0rmb60+7fGUy4+e3ojRybTycBzBk8+WNROPwteGo=;
        b=Y4oV/WTqQf60XDmdlbzlvAs9plP+oYr5Omh1x6HZG1tGER6gmpff1C5qaJAnLT59H5
         4uaHS6i/smhjk2wxdX4SvGvOUkMdiSV8PLdbgeEE7pIjnD6SFWaS8a/8W8gbOCRFf3P+
         pLVVParmBydTqKAhx3ghUgcHbQ2oWHk80GcTGllM9053jdzBXLHEbPOn/oCFQpA5L9hj
         0wVpjR3OqP38IpfQl2B74V3CMT2NruDNomxoEc/CuvrRcz7+8Y1BaD5yzCO2VZ2UNslD
         +iD/rI3MTEQ+1JL8Ja2Pxo/HA+a53k6jVH3D6T17hb1Q4FigJK6Vj7YCGSxpKcy2g+ge
         ZsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670050; x=1796274850;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IQC0rmb60+7fGUy4+e3ojRybTycBzBk8+WNROPwteGo=;
        b=ygEygVAydmljgl/HX7uAuPYJBLeHhtdzeegYrk/KAhJxTDsziLI/dCdw6DZQWG2+ec
         Kzj3+2CEBy5ZIyFp1bEpM3r+wg0lX7Qx29FL8iqGHA/TbshUBZSjrQjJlhIfO4qj5cV9
         ZMhJbUAl3MFSOF0y0ylngegs4NbcKWWRTGsO83hYAmd0+pFbmjM1BY39IwNuWiGwYcJJ
         2g4FMXPpN7um2KdmGsuAOGkJ802sSsZqZQchRD7E0N3NUaFGYQJC+nXiATIWXwUeMoz9
         YSA33t4Zwts918yzSS3OzcHQzDQISgbHCTXgDU8G7n3z/wDaCuMeHwy605JXCSi/zXmd
         v8uA==
X-Forwarded-Encrypted: i=1; AL+hErFMjjOfTluvZeOa40HFezu8NF5KVL1CN21wFjkQt/5HijmqfkJHnoolI1HvPFpNfRKzv7ymOlCpHFVOqyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S2hT6Pd3nbwVWbp9RSS6R2SfXFP6BEmJWcDk9azUoPHSxZ0a6
	ECimAInEbM1r9auSa+uRn/TxI6CDAL183HT3ZsoClBMCMEzuoRkDyICj
X-Gm-Gg: AZFdTZeqouoP1F4KM+HCC19aJpGViTG7/m02MKwsIZDV7pHTMquxmQUgCI5LasCA7Qf
	Nbj2/W34LNyD1hFZ6f8Jn3RLr5D+NDnDg2KoSs3sVy3melPRd4KJhJuv7gI8+HdI8KWkhiWnwV/
	mmOeS2RZXlkr8nzDzwEBw4Ls4sSwkz0fXCfq28zRHwnc4g2Rr49okKoGc1uCHmaT1wA5GYM6RrA
	LrsyIxvc3IHz4GageYsBANHoA407otxqTpII2C7llcecHrWo8u7tQ/5OQSJEyqcmqLKfcvMCows
	IfxuehN4hWjQYZh4gYHlKFLvdLZL2C/I7QyKCl/mTVcu9xIVXhvr2X0YdfZjMaAAdMVIksk4y3t
	aPgCcDBJ+swn1lkoAHxI+ho6pBbI27dbk7g4lgdLcKBJ/1OPt7C+r8lYWFQJ+eUTYu7QJVUQpmA
	6BaqQ1e8r9qFyBiyB3/Mx6h+ffn2afkY3n1NzQfNWO9tmI96uOTFJ6jCLWHnvjRRRoIqPBj7WJW
	C3Y1XONExmXIYNyFt8TzVd0Y20KRftUDfayTzoz9bq+5DMraokz4wTJIeFbbNSFkMvWtgrwjkiT
	6fzcCEjRxDmbokdhtQTRB/KlsYAchtNg63M=
X-Received: by 2002:a05:6820:83c2:20b0:716:c772:c70f with SMTP id 006d021491bc7-71b39623cd7mr12571634eaf.86.1795670050407;
        Wed, 25 Nov 2026 21:14:10 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm13907873eaf.13.2026.11.25.21.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:14:09 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 23:13:50 -0600
Subject: [PATCH v2] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
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
Message-Id: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43NsQ6CMBCA4VdpbuYMrUgrk+9hGAg94KKleBCiI
 by7ARdH1n/4/gVGEqYRCrWA0Mwjxx4KZRIFdVf1LSF7KBSY1ORap2ecOJBgIM/VRA9shwlZXhj
 Fk2DlrCPv8mvjMkgUDEINv3f+XiYKOh6nKJ/9NuutHoRnjRpzr71vrtYak93aUPHzVMewfX6Iu
 RxALJksz1Jyxv8j5bquXwydN+QNAQAA
X-Change-ID: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795670047; l=4132;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=sn1/LETHb9l5ZV1gGwt2OIOVEadtpiYZmU8VXT/KLM4=;
 b=Fspx+wv2picpFbsKN9ogP399KLyj59R3MswLn7ymZsrv0ULnFVlAH1GfHX93CuEIG85Yc6w2A
 iZtsCrtCZ4pD4u29I631RHiV9upWNfX/oTc7T/+NexXnKxgAnX0Wje1
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

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

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
MT8173 with PSCI CPU idle the boot then hangs about half the time: the
broadcast device is armed at once to wake CPUs that are already idle,
and that event is lost because the GPT's interrupt is enabled only after
registration. Traced on the board with prints in
tick_install_broadcast_device() and mtk_gpt_init().

v2 answers Sashiko's review of the resend: enabling the interrupt early
also enabled it while the clock event timer was still running from
mtk_gpt_setup(), so it could latch an interrupt that registration does
not acknowledge. v2 stops the timer before enabling the interrupt.
On the MT8173 tablet, with CPU_SLEEP_0 in use and prints around
registration, v2 booted 16 times out of 16. The status register read 0
before registration in every boot, with v1 (3 boots) as well, so the
stale interrupt never showed up on this board. In 3 of the 16 v2 boots
it read 1 just before enable_irq(): the event registration armed, then
delivered once the line was enabled. The tags from v1 are dropped,
since the code changed.

This patch was developed with the help of an LLM.
---
Changes in v2:
- Stop the clock event timer before enabling its interrupt, so nothing is
  pending when the IRQ line is enabled (Sashiko, via Daniel).
- Dropped the Reviewed-by and Tested-by tags. The code changed in a way
  that I think merits that, but let me know if not.
- Link to v1: https://lore.kernel.org/r/20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com
- Link to the resend: https://lore.kernel.org/r/20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4@gmail.com
---
 drivers/clocksource/timer-mediatek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 842d6ee4259e..14723c6f5f5e 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -339,10 +339,12 @@ static int mtk_gpt_init(struct platform_device *pdev)
 
 	/* Configure clock event */
 	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
+	/* Stop it so that nothing is pending when its irq is enabled */
+	mtk_gpt_clkevt_time_stop(&to, TIMER_CLK_EVT);
+	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
 					TIMER_SYNC_TICKS, 0xffffffff);
 
-	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
 	enable_irq(timer_of_irq(&to));
 
 	return 0;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

