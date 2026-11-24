Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495357;
	b=ff5f5psyUanBRBJ2luMphLag2joQJFICxUcRlgpkIpnGjldPklvpP5HRdq7K8YStSlYj
	 UG7oNCE7UeWNrVCtd2ptk6nICmTD7Ix7jgFEQNm+GKD+mVTJhNqH4Qwae7B0iywj/itUq
	 mRZxp4ttiP1n99kh0N/dJm2b+TLeIJHcS66yPTY7eXsWkvvoP2Hq25HcLqYgqNO8Z6H6M
	 303qaL1W+HuicXh5Q+KF5kN3VBvESaa5xCkKC90s8KmdvmOE0SuueapVZS7hQT7YSfOTK
	 9LMMC8Ca3zZhfeq+ODiSeFlAT4ciJ35m1jGrycBVBWOAx2P9yaO/9mEpZApNAaCwB1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IgI0m4pAxHEcjSpExF12okiRR9Quf+zHia2X8idMp2Q=;
	b=MZwnOvhELNd9uNoV2QaWm3FJL7mw4ndTe45Ani+AMYJCQivZdEwNl132ogWYYwoJ4nH+
	 Kj/p8nBEquXkjK0wN15PRm7FdaXVI8cZVXVtUym8/ALqA+QVj0SMDKJ9X1FDmLQoLTomw
	 ji7DjNrp8+JsxrYBEdzXWyUuNm6XyLeuXbSaRzyklw+MGzSKm1pSWvzu8rPLZf+/CIqli
	 Vx9LDNvQNpvih7WQRb6mm+4kpIfzQGqq60Byjh0QMfq2ue3ynMq+kjoqEXNu3O1+8GUsm
	 oW0rdouTth/J9Utsy+YK5+FG2GjgJNZ4QS6w1YCQgQ/hwle5HoeyTCGRqgPmMtkAn7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C5jhZZ7R;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A7B606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A7B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C5jhZZ7R
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2af4c8d00so861238c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495356; x=1796100156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IgI0m4pAxHEcjSpExF12okiRR9Quf+zHia2X8idMp2Q=;
        b=C5jhZZ7RORotJuBdPyW8ypLkIqh6ota24QYMFEFFsWhWNjO5w9jCxRqwhWUfJEEo2h
         GwRLuAAP2P7w4L1bPTWCXQSoJBoNxGtlXJ4nn5TQYMshckH53ZyvSdE5GZmKk0MOClp+
         fOzThMGkog0ECS3rgjhN2iXxZ0HjiJZC32sE5hWOZpo737hKxrLkEtsi2CMFUyI1MaHT
         /jwv5RAZ9v0QX4tKfHOectCVWJXgFrNz0dgdpFErPE5sLZctGbrbX2ysFBdnT95+uhJ/
         ZAkWfrWm4IVfbON6lwepCctBGR2uh1k8yTzgrPGZZwNUaWswlQu49uY0/9TUQAwYsn9r
         Ih8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495356; x=1796100156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgI0m4pAxHEcjSpExF12okiRR9Quf+zHia2X8idMp2Q=;
        b=cE89/tfZy9GDdY6SnuI8LaW5oJ7YF3TnVUWmcI3+N0u7P6W/Mt+rIEQDNrLonf6BTi
         AUBcdSxlT2RyxcV91bFcVJ6YBab/LIkJjLD2fIbz7HdDuoAi0yfulBHujiWO4i1SuzXv
         4fj6ibQohnczl8Y3S90H/i5GxSsrzH5TiHFvF/4572ebXbTYXBbEgWPpiXvlvViHwiBT
         ausckhQQnOd4M+QTiZ6o8wd0Ff+w28Amkh+7bTeCprN2k/Ylc+r3ed5osLABNfNnK1Yb
         zKRwTB8rFf+NSskoNm6rjfNPYkRc8jHYELNzAzpqwjESpkgjseq/afm94mHU/AyJjuKd
         Z2wg==
X-Forwarded-Encrypted: i=1; AL+hErGnn49fK6tI2dPI5z0JnKrH5M1quZ5S+0qPSaoUeB7g1DCnqVcJ7Po9F7TL8muLWKf+hrqoOgEq2t6x8UU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GGXmgwhLTwAAZfTG6wC7NTpNaYoKnlYNlqyAd82EaSjr2dtIZ
	z4w6ngOGfBIylMCsh0kt0aX3MyQxde1ogWRX4pmq7JTqLIebqcmCJhPD
X-Gm-Gg: AZFdTZc68y3vK2k/NVKbLasx8IN7efV0Cw2CxBLkQ5GrPYcIm7lGJwSd6hXsGHMv+QO
	aA3GSGsZOe+1XG6Jb3gVeI4c7D56CIOsYaA0l+0RqTcw/iC9Xj1C6OrT3NwGoBmhxQPq2ay1tdX
	z27ZACmvTLiG/itdhIrq5IduEUZBb4mS1jlCmsQMZSMlmlpp4fKzxxEN+QrXfvOne1TaYgKomva
	2D7XGS0Zr900HzEl+aSUPifJvLnNELsqZ82W/Qe6xIPjnaejz9USwWN8a/VlX7T+n+Pnltbw62M
	F7SjGDj1DFxOLGTxQY9iQaAwtWIomfX3uvoNaijocHqN3Z+Vc6qRhjGLR35+ByVdClGC/vIg+Lg
	fYZzss0osrarbjFnF5BzTRZijk1dRfuluV0paWE0zdpMFx81nvT59o6Pw1J3VYWiE3p1ebhnzBy
	ZJWRvK8BP01Q9xR4TIBtLvQO+IOrBKyn+/PfHMj+2ukbC275CVNibtT++k+UUEWIG6l1OBgU37Y
	oHiZn/lPOlokunPqfYeHavN24ltNq228rNAtlm/KRqzVNuBx/K+G//BIkfKtWHD6NgRZ02YMXcV
	oHh0wcjMcWxR4XbHVNynHXNgs+xEoO0BEmseucZ03Xz6V4pzRnifZEe4IRE3t2WE6yTRLdCxGXu
	TO9fiLEyPjLCLJuWpuqh087gXFT9YqYm3qT3NjoQooFO6Zu+OUcb44ipM+IKye0UAHY0WJMY2
X-Received: by 2002:a05:701b:260e:b0:1a9:c52f:655c with SMTP id a92af1059eb24-1b556900476mr15545901c88.36.1795495356004;
        Mon, 23 Nov 2026 20:42:36 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm52424647c88.9.2026.11.23.20.42.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:35 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	arnd@arndb.de,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	john.stultz@linaro.org,
	jonathan.lemon@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v5 0/8] ptp: fix request serialization, teardown and SMA reporting
Date: Mon, 23 Nov 2026 20:42:33 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
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

This series fixes PTP request serialization and timestamp shutdown, and
corrects OCP SMA/DPLL reporting. It is based on net at 4392bb809812.
It contains no WiWi board support or LED driver changes.

The first two patches address prerequisites identified in v4 review:
serialize all three sysfs enable callbacks with the ioctl paths, and
prevent SJA1105 EXTTS disable from switching its shared pin to input.
Patch 3 preserves Vadim's requested teardown design: after removing the
user interfaces, send direct disable requests for each advertised EXTTS
channel, followed by PPS. Do not use a pin-function helper for channel
indices, alter pin assignments, or add a driver stopping flag or spinlock.

The remaining patches handle hardware selector values and combined input
routes, recover disabled SMA state on bind, report disabled inputs as
zero Hz, and correct the DCF77 and ART 10 MHz frequencies. Rebind recovery
is now separate from DPLL reporting, with the earlier b2c4f0ac53f3 Fixes
tag, so kernels without DPLL support can receive that correction.

Changes since v4:
- New patch 1 takes pincfg_mux in extts_enable, pps_enable and period.
  All callback errors and existing permission checks are preserved.
- New patch 2 changes the SJA1105 pin function only on EXTTS enable.
- Patch 3 has unchanged code. Its message no longer presents the runtime
  sysfs/ioctl race as remaining after patch 1. It explains why an empty
  software subscription map is not proof of initially idle hardware.
- Old patch 3 becomes patches 5 and 6, with separate Fixes tags. Correct
  the incremental ADVA X1 description: patch 4 already makes its zero
  input selector return zero Hz rather than -EINVAL.
- Patches 4, 7 and 8 retain their v4 code and messages. Preserve Vadim's
  Reviewed-by on the unchanged DCF correction only.

Validation of this revision:
- Reproduced v4's shared-PPS runtime race and SJA1105 pin side effect with
  actual extracted functions, controlled scheduling and stubbed hardware.
- 100 removal/shared-PPS model runs; 100 runtime serialization runs, each
  with four controlled interleavings; 100 SJA1105 runs, each with 14
  chip/direction cases. All passed under ASan/UBSan.
- Eight local KUnit cases passed in x86_64 QEMU with KASAN, lockdep and
  DEBUG_ATOMIC_SLEEP. These exercise real PTP register/unregister and
  real sysfs stores with a test clock, not physical OCP/SJA1105 hardware.
- x86_64 and i386 allmodconfig and allyesconfig builds passed for the PTP
  subtree and SJA1105 PTP object with W=1 and KCFLAGS=-Werror.
- SMA/DPLL tests cover 4,669 input combinations, 243 retained-mux rebind
  states, ART accessors, disabled-input re-enable and X1 direction change.
- Twenty deliberately broken variants were rejected by runtime assertions.

The review fixtures are local validation material, not new upstream test
interfaces. No physical card or switch was tested for this revision.

The reports came from the public review thread. Codex assisted with the
code, regression tests and submission text; the commit messages identify
the reports and distinguish modeled tests from hardware observations.

Previous revision:
https://lore.kernel.org/r/20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com

Latest review reports:
https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org
https://lore.kernel.org/r/179548551472.3135.11972018356692852897@kernel.org

Ahmad Byagowi (8):
  ptp: serialize sysfs requests with the ioctl paths
  net: dsa: sja1105: leave the pin function unchanged on EXTTS disable
  ptp: disable all timestamp channels after removing the user interfaces
  ptp: ocp: handle hardware selectors and combined DPLL input routes
  ptp: ocp: recover disabled SMA inputs when binding the driver
  ptp: ocp: report zero frequency for disabled SMA inputs
  ptp: ocp: correct the DCF output frequency
  ptp: ocp: correct the ART 10 MHz input frequency

 drivers/net/dsa/sja1105/sja1105_ptp.c |  8 ++--
 drivers/ptp/ptp_chardev.c             | 14 ++++---
 drivers/ptp/ptp_ocp.c                 | 58 ++++++++++++++++++---------
 drivers/ptp/ptp_sysfs.c               |  9 +++++
 4 files changed, 62 insertions(+), 27 deletions(-)


base-commit: 4392bb809812ac79449cd0cf1f5e00469ee102d1
