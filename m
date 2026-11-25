Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649202;
	b=ecVsUFdRR7R+PtK2CtGAihXs8AKxIxIUbk2t2paGi4+86V08jfArrRciBN+hlb+BwMaR
	 u/GHDkYGObfUCq0Uxyyc0K28rZn3zgphNz+e7vMfSOVFzTBInUQdHPjazv0qKsse599y6
	 gQavxcK6/zq8YeIPtQGht25zBBT+LtYawFK6cmkgr32SF2NM/ODYOTn3eEQw9xpiv4FFe
	 ClslxjBdpyhh7v4rNfMVGsPpDGIGCLBaOYtyQgZP25/H1se4eD527IhoiYnUR2WeWDUsA
	 pfYZA1xc6bF9r7AoFHcJIW0D2LyJdyHsHW3chA1PdB+U6JHbaN7x/9aBYeEcvqlxgEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=z0QB7Z5jkpv7pdrIgKYxDo+vWMbTwUMEbHjEmTz2knQ=;
	b=OiEM3GMmya5f4/1fQXFx2JwDO5pKlHFK4sd9IrTWDDFxJUP4xPi8E9SbnY584IRjsWPn
	 tCLmi6hQuBvzWnjZxkRKUGUQOJkTcVY42l7hE2oYFpSeVDrfxYnH+g/ISm7ZvUA0Ar55B
	 XvrvYBl3LZsWJZBaFnmWnIlL1zyC13QVaD434ImRXfOuSFomTVHGoV4q71MbEtsMOVqk6
	 g08XVsAQG7SbM696BDyhKCOx2K+2esfWQNqi9FudNUP09+86C6844LJ87QUHAWpkyUsBM
	 TXXPNBDjKiWjw5nFHyCJbj+YJJ9sLKLOlDStxMAnVOaZyFmxIVG3kh7GzaLN6k2mP8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hdz6knWk;
	arc=none smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDB7606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CDB7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hdz6knWk
Received: by mail-oo2-f10.google.com with SMTP id 006d021491bc7-6f9b24c99b6so1972177eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649201; x=1796254001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z0QB7Z5jkpv7pdrIgKYxDo+vWMbTwUMEbHjEmTz2knQ=;
        b=Hdz6knWk21icsjnTVVv8cpoc4iCPqDDJCxes/iAMadgb8z3vzojcgRuHDHZ9LHE6au
         YnXbZYmXeLnrGyMugNwNickS75nDbdOjXcQZ3KONM9GPZg34kaadOw68kWXgcYLR554D
         VALnp4+DrhKJVqjZgsSL2qPvuaPsPUijgkKtCHaiBxuS5HTimbD9ug0rmhl+xOxJpDnN
         wC5nzaTqZqhcRBydDubOLStogoEiNqRbc4dY2Y7pNOTgRhILXpM6QpTwBk5Y6mwXopaE
         5eKCWZm9KOZtgc/uZd6oDhKvQAdjys7bFG4m85NpTRms5oGP2qBPgwVMPlGqUSt5twUI
         obsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649201; x=1796254001;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z0QB7Z5jkpv7pdrIgKYxDo+vWMbTwUMEbHjEmTz2knQ=;
        b=JRbU/lqXv01ObhYo0w76OpTsm40m3goHta04u9wpD8NqB2t+wfe8tqp8bjyexOPzCZ
         RvP2AbfyTbqWimZyUGvW3Z/UghZI0jKBfv06XA9aAWgfdVwTHjq8k52OsG0WLesVkK3w
         BGpOjrMkabtHo1Dnc2doIvhChlgU4h8Z5CiEmnf+TB+YXyCdNmamA6B4eIdrP5M4oYsh
         pviLlhslzOKlvubdbfJWi5iuIYMcgtayZMFVorGTbhKnCmEYcw0ULo929lIQJsV0ql4e
         tHJTKqwi/YjBX30O7Mk4Y0vUv2VphqD1rtXpEoe8S7HbywGArDr+wHFWZuS9r9MKcWeZ
         aLIw==
X-Forwarded-Encrypted: i=1; AL+hErH+snLjVSkrhorDzeCbNaWdxosGWs2tCZBmTUduD8vZjeD/J/vnRN90F3lkCAyZ2Tu5Rd8YiWaWtJHByE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vVuyyFwLEaSiYlaz3SbiAu8ay3EMawTqkxK1ppon7QzC+09D/
	efNQzSB2q5xfL9iN2YYw0kjv1ifT1je+Q7aKJvcUZ+pDdWtbXHjeENm+
X-Gm-Gg: AZFdTZcq/g0zS3LBg3a/CVo11S/K7iHKHCX1sxRnPJi6JHOlMsnJRHqU8kSECiUYSxw
	7EDNYnxvcWgcEtNHVDWtPJ/kqTtbReI3rIE3FDfusTQ31/fCtWzsVqSxa2DvRKFRO4uIL/kKC6x
	uX75NtejEssGPkKjCv0+FPnuyYZK8tVMLRA0kxDZ4l03UhM1CfG7TvhJdcrKx1akmpmwy2wWUWa
	o6CbS8TwstgNyYHo0KJ4Q71dIlG8E5C19/j3NFmWfNFrfPhvjWAN7zRPTehjW5plvHEcJIlkRtR
	uenuY+GRKwyJfo0Rd47pJyE3dhX2KsKoUjSK4o8rYZU6z6adeXPBtlJ1zqy2vi5xsB7iPAPpYGi
	ryKZD2b/49/8YJWbZvM3DaEcJM8l0VhQ8wdwAoGl6zXhs2JasIV082qlEs8DnQqpG/9P5+a9toM
	JT3CT7HKIRuIObsDLWkAn2yH/Sxjg4z+YWGPRqtIVxuVyje70xLwASRQEycwofsRivFugXEE6Cg
	1w/Qiu1fSaE8Z2Zx308ziWqS1dRVPIoLvwtDPpOIFh2tTiX8V7Y6sfLMxVhIggPm6vjFoaX+xtp
	7/S5AZ2xQm5wMNble9FNrcWNryDPyWvJUlmA4b9U/4NETxyTqKV1YHEv
X-Received: by 2002:a05:6820:4a19:b0:71a:ea6a:4f64 with SMTP id 006d021491bc7-71b394eff5cmr13989163eaf.50.1795649201237;
        Wed, 25 Nov 2026 15:26:41 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692f049sm14304892a34.25.2026.11.25.15.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:26:39 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] drm/imagination: Hard reset fixes for META firmware
 cores
Date: Wed, 25 Nov 2026 17:26:05 -0600
Message-Id: <20261125-rbrue-suez-pvr-reset-recovery-v1-0-2cea8b163e7e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQrCQAwF0KuErBtwCtYwVxEXnfFXs2lLYge19
 O6C7wBv54AbgjPt7GgWtsycKXXE9TnOD4jdORP3p35IKal48Q0SG76yNhdH4CWOujT4R8o46KW
 qlknP3BGvjsne//96O44foHpfG28AAAA=
X-Change-ID: 20261118-rbrue-suez-pvr-reset-recovery-ba687c88bf85
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795649198; l=2234;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=lkEeogA18QR5ZUQab4hqwxSvIcO221SDwijc6qoyQnk=;
 b=JDtsFvDvlwWCk6Tsxcp50PSYzaNzHOuoyL9IpilsW3rOapT46GqCpUu7ptjf4eUxNexFo9Pa6
 Kykh/ogXyvTA6WrZar1k+v6Lmlnj5ckxeMJwqEdaCaBericGI8U/cBp
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Two fixes found while chasing GPU freezes on an MT8173 tablet (GX6250,
BVNC 4.40.2.51, META firmware processor).

The firmware reports page faults of its own with FWCCB command 112,
which the driver logs as unknown and drops; patch 1 logs the address.

Patch 2: every hard reset on this core ended with "GPU device lost".
pvr_fw_stop() waits for the Garten wrapper to go idle, and a META that
was not asked to idle first keeps it busy; all the other idle polls
pass. Skipping that one wait on a hard reset, as the driver already does
when a debugger has halted META, lets the soft reset that follows stop
the core. Other firmware processors, and the other polls, are
unchanged.

On the board, with lockdep and a local debug hook that forces a hard
reset from the watchdog under glmark2, every hard reset recovered
without losing the device: 13 forced and 8 that the watchdog started on
its own, on this series over drm-misc-next. New GPU work ran correctly
afterwards. Contexts that had jobs in flight at the reset are flagged
guilty as before, and the clients using them (here KWin, through zink)
stop rendering.

I do not have Imagination's documentation for the META stop sequence. If
halting the META threads through the slave port first is the right
shape, I am happy to test that instead.

This series was developed with the help of an LLM.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (2):
      drm/imagination: Report firmware page faults
      drm/imagination: Don't wait for a running META to idle on a hard reset

 drivers/gpu/drm/imagination/pvr_ccb.c          |  5 +++++
 drivers/gpu/drm/imagination/pvr_fw.c           |  2 +-
 drivers/gpu/drm/imagination/pvr_fw.h           |  3 ++-
 drivers/gpu/drm/imagination/pvr_fw_meta.c      |  6 ++++--
 drivers/gpu/drm/imagination/pvr_fw_startstop.c | 10 ++++++----
 drivers/gpu/drm/imagination/pvr_fw_startstop.h |  4 +++-
 drivers/gpu/drm/imagination/pvr_power.c        |  4 ++--
 7 files changed, 23 insertions(+), 11 deletions(-)
---
base-commit: 479e381e77dcde0dfcc9d51e89ff3273da199804
change-id: 20261118-rbrue-suez-pvr-reset-recovery-ba687c88bf85

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

