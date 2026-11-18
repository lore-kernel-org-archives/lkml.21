Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989798;
	b=BQFbrUm+/j7p0yekAZXiGrXbLd01Q3tXTnEeNB2gmc+EYS1HYCeRnzFBLmVZodgeqrRC
	 n5SAbquiXvs9TmqOhx9Z+ccoDlqJNJezEjMlrqSBKd2ikpAVAryQyuzGEX3hAUH1F0HXy
	 3FDXcSeg3Cki4Z53j6l7f4pzqLMUu+dQnkVfvDsYdATrr+XwGeK4u+57lMl7I5IPF1/hL
	 pF62A5ezTvE2X6viJLbPvM1syKvm90FlrysKBeQj+6EqhvkO+A4x8UDVxSEDYgLMN+hj8
	 wh+suoWvun3gDvqYO2J33Rv17q6ZsxVsQeMfvH4x3EahcHvYiF1I3jAoNPbRXxaClYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CeDMAcjDB9WAmr0fDvRJgPtr+AGr2g0pSVCxt48VvaM=;
	b=4lH3j3S2xvCpA2HP6rqHjJi4UkmKbS3W41zUAzNOQ4G11itaS+mFwToWUM+LvjOLDgu4
	 w4Yi1AKC2EEzM0xuks5dLBdPkhCBA5ttBEsnX9XtykNpNSJb9gnkR2U2F1NAPK89d7OJs
	 NLECkTk8UtFUrK2e1nV/RympHria6ZH1+ZFLxFQE1XeFiDu/KYJ6G2cD7lMDrgJ0K0QrP
	 PpOyT40RslOMM9dFci93F3iCsP5PTan7drxEguzUZfwg8+kQzdl2pb68h8xv7y4/OIA6r
	 zKspAfbs/eZr87C68+uDmw4Olcq08JIibHPZeb4LIunL8PgptHiR04/Q+N3/LhWxUQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BojE9csF;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D68606A337
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1D68606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BojE9csF
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so542215b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989797; x=1795594597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeDMAcjDB9WAmr0fDvRJgPtr+AGr2g0pSVCxt48VvaM=;
        b=BojE9csFIZ617Cc18/BIhTw2G59PpMZCDDt8hzBktF9G5iZsUCXDtj7+1gymp18WDJ
         pUlVxNzeun2nbNv0/P1TmSy/wcD2+tkGgHVEYBuWj26NYjvRlU92th1GLLB6D8hn3rBq
         asYRRXhTG3VOCQKtusFIBlwVeCBmlbVYvgBowAdW9NOOqI5lnJQQtOfYY+Rt82w8FQAU
         2Sro9moRVHzI3hLS1QN/afb6TL1JC82KPTgXA4ygKtYEbZGSrs8XQBjZOepidpUXsvqd
         p1PCCu2cCjDW4rdPq3gIg97OYeLiU0XTbnFlbvyPket+eYeNiajD8xxnpXV8oZIsdr5U
         ug6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989797; x=1795594597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeDMAcjDB9WAmr0fDvRJgPtr+AGr2g0pSVCxt48VvaM=;
        b=DC1qOiSeOVVHbmU8WWPtFImJqMte7Pj9Uf3q3BBv1FE/SAWpvvD6N5pQLP2McYpAoG
         DxoG/kDZ7i6+5ZvI/oXlxRWjRzuAEYlmXyPWHTfkmXsvpk2kBtTjfOhgGIZL2297by2B
         1I6/Xla9MFf2I3NsmHLfdah8/0OgFLu5SVEbcQbWm8B1+fmhsfMefynn3RViHS9sNbB9
         ladhpyAZYTrIYYJNQITkjanUQWoeIK/XSpqjGAjo+9x+ObYhw7mnFdXoJvI1TvTeCvi5
         Dz7No2mbkYJKtL1AWZs2stmWtHKCm1AP+bRjUnv6Rfvhgba450ItgxEyXLmWah7akd0u
         4RlA==
X-Gm-Message-State: APuU4Z9J54+psccbSvHjdVFODAtzcdkODuZFBo6Ovb7Af4TOGng1AaO3
	oW5lMYB1X8yrMvnVZ+kXWx1H4Y+19hgiD31oMaVJSOwxM5Ftecl0rsbzxhMRnw==
X-Gm-Gg: AYBFou2cxacsfsj8PENzyQrWUmnVJBos41fss8sigQ3NmjNp1Mahg1VnAD6CFlRmXcC
	bfdGiJoBlcNCtjGTTYighvHrJyJx6yVUcYVBp3AC8EHNAtiZRNmFGJUbI2PKYCDVRdi8cCHL6+T
	iX4fRY1hPumB04iz0sV5mxgoKM5cWJQDqGj6q5+u0J/KbUh9a/wYd0UTqAE0ppEW0O6rhTEI+KJ
	Utcucn4UJb/eLKv6jXeu5b9N020UVakKgTF7EotyX+WFCaGNn0gy97DSvOOwVvYImZCRHRx8XYW
	OxemWnOX1GIYZ2mvorRJQrxWCC8+ANvPmn57tTer1H4J030i7Tv3HP+wfsxoJYh7swP1Yi9PXCt
	6jXoTMaN7b8GcjZTlqS+WKeeNg9BeygFid477MnSzlrVqAKFr+9+XzCGE6GC4idIUUOQzkpGZ4q
	u8cJHi0CpRiNi2wXfewCprrxtCvStkdNbuq9UOd1lmCU/lrAjUVUnfdMjjf6O+7xAzcnrJM1YKB
	R6pNU6zNp601QfZww42Rr58HhADqJPmxIz+YUpmOf0irXUtgUQaOFNnIFLqNXsY86MiOA4wKIvL
	jf1EwTtsih5Yy7jkjucma11WOvBNc8uZhm34cuRx0BXws2geKoejW6v7LZS/Pqom5kAsUkI=
X-Received: by 2002:a05:6a00:14c2:b0:89d:faf6:c69d with SMTP id d2e1a72fcca58-8c5d53a057fmr1521981b3a.58.1794989797258;
        Wed, 18 Nov 2026 00:16:37 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:36 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v10 00/13] mfd: nct6694: Refactor transport layer and add HIF (eSPI) support
Date: Wed, 18 Nov 2026 16:16:11 +0800
Message-Id: <20261118081625.2399247-1-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Ming Yu <a0282524688@gmail.com>

The Nuvoton NCT6694 is a peripheral expander that provides GPIO, I2C,
CAN-FD, Watchdog, HWMON, PWM, and RTC sub-devices. Currently, the
driver only supports USB as the host transport interface.

This series refactors the NCT6694 MFD driver to support multiple
transport backends and adds a Host Interface (HIF) transport driver
that communicates over eSPI using Super-I/O shared memory.

Patches 1-5 fix pre-existing bugs in the current driver. They carry a
Fixes tag and can be picked up independently of the rest of the series.

Patches 6-12 isolate the USB transport, extract the transport-agnostic
core into nct6694-core.c and wrap the firmware command interface behind
regmap, so that the sub-device drivers no longer depend on the
transport. Patch 13 adds the HIF transport on top.

Changes since version 9:
- Added "mfd: nct6694: Drop the unused IRQ enable mask", which removes
  the .irq_enable/.irq_disable callbacks that took a spinlock_t under
  the raw desc->lock (reported by Sashiko on v9 06/12 and 09/12), and
  rebased "Refactor USB-specific data into nct6694_usb_data" and
  "Extract core device management into a separate module" on top of it.
- HIF: commented that a read of a SET register passes val_buf as the
  write-then-read request.
- Used devm_kzalloc_obj() for the new allocations.
- Rebased on 20eef29b7c84 (after v7.4-rc3), which converts the driver
  to devm_kzalloc_obj().

Changes since version 8:
- Dropped "gpio: nct6694: Mark the GPIO controller as sleeping", which
  has been applied by Bartosz to the GPIO tree:
  https://git.kernel.org/brgl/c/fcbc48dc650d2f58bfe19c4486830de0e9cad62e
- Rejected transfers larger than NCT6694_MAX_DATA_LEN in the regmap bus
  callbacks of both transports.
- Reworded the commit message of "Rename USB transport functions with
  _usb_ prefix".
- Collected tags from Andi.
- Rebased on v7.3-rc7.

Changes since version 7:
- Marked the GPIO controller as sleeping.
- Validated the USB endpoints with usb_check_{bulk,int}_endpoints().
- Checked the length of received USB packets.
- Ignored interrupts without a mapping.
- Moved all fixes to the start of the series.
- Embedded struct nct6694 in the transport data and dropped the priv
  pointer.
- Renamed variables and buffers consistently.
- Retrieved struct nct6694 from the driver data in the core, and let the
  transports register their own MFD cells.
- Returned -ENOMEM when the IRQ domain cannot be created.
- Kept MFD_NCT6694 as the core symbol and added MFD_NCT6694_USB.
- Folded the interrupt URB submission fix into the core extraction.
- HIF: requested the interrupt after the core is set up, so that it is
  freed before the IRQ domain is removed.

Changes since version 6:
- Transfer command payloads through a buffer owned by the transport.
- Locate the interrupt IN endpoint with usb_find_int_in_endpoint().
- Submit the interrupt URB after the core has created the IRQ domain.
- HIF: several robustness fixes in the interrupt and shared memory
  setup.

Changes since version 5:
- Replaced the read_msg/write_msg function pointers with a regmap-based
  transport abstraction, and added nct6694_write_read_msg().

Changes since version 4:
- Split the monolithic patch into a series of logical commits.

Changes since version 3:
- Removed redundant module type macro definitions from the sub-device
  drivers.

Changes since version 2:
- Restored per-device IDA and PLATFORM_DEVID_AUTO.
- Validated the irq_find_mapping() return value.
- Checked the superio_enter() return value.

Changes since version 1:
- Reworked the Super-I/O access helpers.

Ming Yu (13):
  mfd: nct6694: Validate the USB endpoints
  mfd: nct6694: Check the length of received USB packets
  mfd: nct6694: Ignore interrupts without a mapping
  mfd: nct6694: Transfer data packets via a dedicated buffer
  mfd: nct6694: Drop the unused IRQ enable mask
  mfd: nct6694: Move module type macros to shared header
  mfd: nct6694: Refactor USB-specific data into nct6694_usb_data
  mfd: nct6694: Rename USB transport functions with _usb_ prefix
  mfd: nct6694: Rename driver to nct6694-usb
  mfd: nct6694: Extract core device management into a separate module
  mfd: nct6694: Introduce regmap-based transport abstraction
  mfd: nct6694: Add a Kconfig symbol for the USB transport
  mfd: nct6694: Add Host Interface (HIF) eSPI transport driver

 MAINTAINERS                         |   2 +-
 drivers/gpio/gpio-nct6694.c         |   7 -
 drivers/hwmon/nct6694-hwmon.c       |  21 -
 drivers/i2c/busses/i2c-nct6694.c    |   9 +-
 drivers/mfd/Kconfig                 |  34 +-
 drivers/mfd/Makefile                |   4 +-
 drivers/mfd/nct6694-core.c          |  85 ++++
 drivers/mfd/nct6694-hif.c           | 579 ++++++++++++++++++++++++++++
 drivers/mfd/nct6694-usb.c           | 420 ++++++++++++++++++++
 drivers/mfd/nct6694.c               | 388 -------------------
 drivers/net/can/usb/nct6694_canfd.c |   6 -
 drivers/rtc/rtc-nct6694.c           |   7 -
 drivers/watchdog/nct6694_wdt.c      |   7 -
 include/linux/mfd/nct6694.h         |  93 ++++-
 14 files changed, 1191 insertions(+), 471 deletions(-)
 create mode 100644 drivers/mfd/nct6694-core.c
 create mode 100644 drivers/mfd/nct6694-hif.c
 create mode 100644 drivers/mfd/nct6694-usb.c
 delete mode 100644 drivers/mfd/nct6694.c


base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.34.1

