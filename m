Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648940;
	b=vPBgCPrGpuov+z8WspPX4aHpDPKi6Nr27vqxs4FvjCE6mA4IZkIOr4Jt1I6sk285Q1ff
	 AfI/5xDYjcT1JKCEXTsqRBDTspjSJfvNvN+nsAGQkuXseVOFLmPeg1Jy5Bg/QRsgITE8W
	 eMkr2jr2YCaaUAI5I5+myokpe3KWqlGgzMELj7gW6EJNN/g3JKF1BV+Dd4Ymbj+ZggYaZ
	 zZydB9dRYM6Dm392nxu2KovNRnME4RswVrzJYNLYsS+atJthbWAtdwgCH2rRudqj3HP0Y
	 u1lBpy7aJ2gdHqhRG6t0+3Gf78JGvqgbUEoDz8wtnh3FGDs2q+ZDct3JyvT+xECAV4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XYTc/DcHZroRC4kTjFqOBmNj9WcBY99HUsdGTOAweDw=;
	b=ax8VGKVF2nFrA9xHriPK6GD0PQQW5yJdw5h83bJm4snDyPqqhtgy7plVi714TDsJOatt
	 1+sJyV5nKs+Lx9jnV9a4hX4N16wEgVs7yqSti8GdGvd1I0PWi4Mr4YyM2QKM2LnF0L1vG
	 Ttja6yuf05+qpy5XXjB8raU68Ga7G3U6nDWTgIx5S/7SSrIi4EW1MpPUz9Cf3dMKuxzAk
	 B/OwLVovPPEdPUldNM04X68qOgR0sUr2SuKaLhwLwppawEV/K38YDDSTH3LNF8FHTPrcj
	 77tf/iAnRi9zcI0fDF00zErE+CZnkxJ4hJDkoTTYw0NT18k9AtcfH8RadN34V4l1FRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBguUIoS;
	arc=none smtp.remote-ip=74.125.231.131
Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3DB606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A3DB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBguUIoS
Received: by mail-oo2-f3.google.com with SMTP id 46e09a7af769-8459f7bc7c0so2353145a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648934; x=1796253734; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XYTc/DcHZroRC4kTjFqOBmNj9WcBY99HUsdGTOAweDw=;
        b=pBguUIoSOmYtV5+isK87dUacUghDlZPy5IPukpqbfIKOf/NWEaWJnuFiTBmkW+fQSN
         VWGuxMkX2tYCUr1PvpHa0SWIMe3/k73/MTZ4BzCZphHIOdEM6qXCjsjFEs9t+5JvmP3M
         9V/gF4VJQdwbpSX0+45omWyAlf1f0ZwvAg2ACDBNJbYbbg/c1+n/1KDpP70ePnnaKf6Y
         5gAIr7Nq/1s5g51cikwcZdhwdcaQK1PJ+0UkMt0deF0rfO+TPbr6ocKmCLaubpvJSDWe
         Gpv7awlkfMmfY9Y2/Bo2h5N93jJnswxIn9Vb2NR9FZYXgK+6t2qY6fkzakPffFGYMloV
         E0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648934; x=1796253734;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XYTc/DcHZroRC4kTjFqOBmNj9WcBY99HUsdGTOAweDw=;
        b=HZ3lbls/1zoElhlJp5bcZG/ldzSs32AWcQmhl9MgXrD5UbFYQFam9GIDkYUl8OXiJD
         UG34lESL8DKNa3J/VLZDqduUX+xrruTh4roByhjO10k4LvDIxz00Pwg54QB24DlKZDSw
         OgKbrAeUobUR4PMFOVV8cfk+HwjQmxEyZ5HqisFbT55tmGqrvR64m5og8EYIozgpaSgh
         RTsslD2DTUIieRwzhk584pOiCp+ikDbOBM0jjPzVWoNsl8X23jVOPX1wefqNCEuOxvVz
         xHsN5PQf6L9/pW5GKqGhR53mEnPTqG8XVsgRNWkBU2cxsV1hhg2LIDVnEQ4O/RR4+tMp
         S9mQ==
X-Forwarded-Encrypted: i=1; AL+hErHx1GsUHlNfNaTFd/W5btiTAgsJwUrcvlBAZbqH8KtjB9qs49JGDEt28tbcK2eE7V00nJb+ZXAXMudIuwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x4DKETr5K2htrAGSaOAm9yYH8iXRazLxCq8drXhD+4SMOBN61
	hZenB5HavBlUtmwGVfu1lDS2KbRjRhBswOjgQBPjPogFyMrYHyyIXtRa
X-Gm-Gg: AZFdTZcw1qcz2mHjuosiUN62kR2iRdx4uhSGEY09KAFn7OeAeZXGcGmLC8fQ2Gd/SPW
	YH7cXYwT5W2RufQz/+IipX2kYghfqig8Tj1EUGsQlpMc/aLiRBw3KTokAha3plGJjHKdtkgrAIY
	PFNm/iamf69rkUu74W60wZKVDyAryISCFNPLdioJnOegzmNfWbRFGFeQV3CaMsywhiTKlA6oYbk
	ggFd3Ok3JOueVP4sWDRwEwEkPt0/6dYcwCMZnjPZqGciJ9/axBlmpyhzCKYBbwCfMbCOFY1IkB5
	d9LwaFGWLfjoG2UYriMC2GPjEAEt6b05+O4aYKmIXWw1hI7eCFE16HQw97qSZLES55KwcNmhKPT
	zMiiTS1w0TXEBu0xMgXvzMjAoTNmxGL8PpMVV43BaGwZyeEDIlo+Ikt5WJNcI1uabnzzFZcXtu3
	2fYOijHLC1yTpQ0wvFxWXsQKfQ8rlsKL+MgXkt1fdRN6wIYaGJfOdPbROzijgYnoae8v7EFX5y2
	vnw3gNVlKAHyYH3cpF8BMsfbJ038ejHX/pG2EEBA5kbN0gt9+aSqdoC0taZIgZZ0ileWnF7ci0q
	NnipQvP19Zpji//sv8/J2LWQ1+KJobwL2hY=
X-Received: by 2002:a05:6830:4490:b0:862:88c6:1843 with SMTP id 46e09a7af769-8631598542amr20958825a34.19.1795648934144;
        Wed, 25 Nov 2026 15:22:14 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692d9f7sm14895213a34.24.2026.11.25.15.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:22:12 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 17:22:11 -0600
Subject: [PATCH RESEND] clocksource/drivers/timer-mediatek: Enable the GPT
 irq before registering
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
Message-Id: <20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43NsQ6CMBCA4VdpbuYMrQQKk4OsDjoahoYeeNFSb
 BuiIby7CU/g/Cf/t0KkwBShESsEWjiyn6ARMhPQP8w0ErKFRoDKVSllfsTEjgI6smwSPXGcE3J
 4ow+WAhpdabK6rAddQCZgDjTwZ9/f4dre2ssZukzAg2Py4buri9zrf8AiUWJppbVDXVVKFafRG
 X4deu+g27btB+wAC3rQAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795648931; l=3241;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Z6bwbYGmDlV4q9VQg3ShvOBo1zqZq9E6xE6bSf63Eo8=;
 b=ze5Kfc37HiJ33uhw5RVqcNwV0MgJgYbChCd5ePQU/CqzWvUHCPjZZNCW+BG7LC0ljYNZu0xr3
 nezA6dNSplsCElHWsNlsqiUEtzGQAQD9zIp8FrdgrcMs3stihwbx7bd
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
is clear, nothing is latched in the status register, and the waiting
CPUs are never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle
state in use, this hung the boot in 20 of 40 boots, and in none of 16
with this change.

Enable the interrupt before registering the clock event. The IRQ line
stays disabled until enable_irq(), so the handler still can't run before
the clock event is set up.

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
Reviewed-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com> # on mt8167
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org> # on Hana (Telesu)
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
MT8173 with PSCI CPU idle the boot then hangs about half the time: the
broadcast device is armed at once to wake CPUs that are already idle,
and that event is lost because the GPT's interrupt is enabled only after
registration. Traced on the board with prints in
tick_install_broadcast_device() and mtk_gpt_init().

This is a resend of the 11-03 patch with the review and test tags from
its thread folded in. The code is unchanged, and it still applies to
v7.4-rc4 and tip timers/urgent. As a 7.4-rc1 regression, it would be
good to have it in 7.4.

This patch was developed with the help of an LLM coding assistant.
---
Changes in RESEND:
- Collected Reviewed-by and Tested-by tags from v1; no code change.
- Cc Daniel's oss.qualcomm.com address and Chen-Yu.
- Link to v1: https://lore.kernel.org/r/20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com
---
 drivers/clocksource/timer-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 842d6ee4259e..1b2cbcc2795a 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -339,10 +339,10 @@ static int mtk_gpt_init(struct platform_device *pdev)
 
 	/* Configure clock event */
 	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
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

