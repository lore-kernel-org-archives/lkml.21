Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725331;
	b=EjCPsynCVUiuhNW17srohhnn5to3/7eCeZtf4SwT4anT1/0Fnt3QwSiNJeIsNeXOmXHx
	 t5gt02LXLkR1QAmH0+H6Yke1tox2pawtypyUDAxy4qSDGwG00x9Epv6+CgoVyPJdfzplA
	 i2zHTedt7HgcC4x3SlejI4BsquUCPewzc3h5KIuHqT6Z0fCVPbJ/u0ivtI/IqBx7awkAX
	 7L1GBsOwVVwTtpYVLSGb6UYwCPGXxTC4NkDcsxoxqliJa8/z1pfblbZa/No+YazI7vv1u
	 M9hXhaOFzGDD8jmnL+xiCEYquPSi2DcsbtvciNxrbAfqencukD/y3jG4mP77Sro3B+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zqO3yiYGog30zyUcuMfbgRi3wkNhqWosSS3VtCYqruE=;
	b=ahkwitb9V9VQeURKMQb/F8f4Vs9WuBvfPphvQGZ1X5OdQgfvfpBPSlri4GtE5uQ/cvM0
	 GF7W9yO27IAHF9oJVp7apmFAVY6gjnWTzLLX2J26iCCypUsPC2hTKSdHAp+6wXFjEGqRh
	 sypRt23v/2CcpMgPGB/7hAJq/IdW3Vpckozyzl/0W7REpp81pCyXdy2vGGuBz9QSJ1yF2
	 qqC7YM5e7WB+9DR05maV3dpUgS2ZEITcmY1IIHcP5gQGQE9tCTVMNkRGkO0R6u602J2WB
	 lH+Lo3yiOM0X1AvZDjZXZqLDCEf2rCS/vVurzZOr8gkQ7EiJUhoF/Do4378/U9wdwqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZ6Lo+XT;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D7B606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9D7B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZ6Lo+XT
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6ddef424972so5929867eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725329; x=1796330129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqO3yiYGog30zyUcuMfbgRi3wkNhqWosSS3VtCYqruE=;
        b=nZ6Lo+XT2UOlucZG/6eYQiYzPIi0YoUWKLJaNoYSzJv58Yr34+x9p5r3H+n1Sl9sDI
         RDZR8jKc1YTjs3HH37K0lC2rSZGCMIYBO5qO8bAPIQ/JOxiK1FDaDayw6dpUCihMX3Li
         yZZYjGpPotrSxUKbREmLQF8sNvEiYMhae4Q4qkS/gUOJogGPpCEi86mGaDsPChTgJCXx
         IBymGfXLFSWIDb1nU/4vkRI6ouJttK3nxJJYA9wHz7+Dr3uoNuw7Jehf9WNp89Z8kptB
         ez21va4mi4ueieKcajNHuihi73GF6yGGp9U3QZeaGGzw6jFTNCsk21NoKvkmV4xEsyfu
         OCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725329; x=1796330129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqO3yiYGog30zyUcuMfbgRi3wkNhqWosSS3VtCYqruE=;
        b=KoTMLqe+113q7qGT/DXa5jlQyNyGuH/6Y8YnLtjD4P5+PfECaHIvl5Isj6Ei02HATB
         FjkbaBLmEkdObCAMX8fBj3EPlDoAckGOiictKDzsa9pFlzYHqlbWOcGd4Y5n7YPGwqTP
         7FBKm9dfl0yO4HROtq2izuxfqbhBkQ7GFP1Jj1Ern7W/Bwu+xqWeTdLWD4WcLZXLcGXp
         DxZgbBG8XFn/x7Q+l0hP9Pkqd37Fhg45tapYbIdH4HEgNTiHFWduCbITxx9cQ+oZj1bi
         DrrZgE1SeMyytNWqNJpRJeD4xsdMhhZVdp5bDzfzc0QSQci1xlSqY4x8qVV8LbMx/zQF
         W+5Q==
X-Forwarded-Encrypted: i=1; AL+hErFjjYLXxBLI7dd/d7QtmbLZpRRZq21gWe7ZZkXmwftCXvUE28c/zDhGeN0Tr4+Ya8/PP6HtwM0Q1F1Oxls=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UyclLWzu7Vh6EjCGnjDRAtJfoz1gr5pJgXSIm//nW4MHdiD7a
	Tz0KQkDtQqJScvJq5dJXIj5IghU0Incvd2VyJrkvEWQQfyzGUtppTPiY
X-Gm-Gg: AZFdTZffPPVxU1P9hVW5JTMpMG04iiUQjh6gQ195te7RI1WO4ROClNFWaPXwJX+46rq
	J8J1gv9Znw+Z8yS4/YU9gHh2E3kxmC/s9/sBke62ShpM6IJ3qDqvgmNMU0f0rkJL7Z9sJWGB246
	1qVBRys3gqzszwFjQFaJ9y7kseisboT4TQmH9CjoN4huFuKjTLYVrvr1gYGWfW8mzuVYQWLLP2T
	4EvtvA8TJR0MyRuImGdiIb7cXDK9QhkwTXK7EBnuuUA27OSDrW48g1vwQRNXPNso+kNK4xi8s+C
	i+fr2mplTUekNZKla8kpc5rMDbfjkoRnVfmmHabR/vYCBRtRHlKFlDuxIcacY5SMrj5tyd+fzTe
	T1/ucRpNiS6aE2hK9rAFMTW7a/idkOTGcy0peCry4HbX22yBimTl7Ze3zcJINvqp+39DkxWCOyl
	9s20Lfd8iYdqSjief+ssrlkfhv5Sy1+46ZN9Ap6HpYQQlz2GmRd/qMziLWZhpq+kEMaqIcSwDNV
	h514IHoHqr5skoX43NcyXdZJM7Uwi8S4hf5R9V7hcQmRTh6me7hxQsYhvgDdhJRfi92AZKXiJQD
	LgQWGl3N+QTb5L+dYqUmm0Id0OeJL84c7rJBA5Dr8FYBnTQ8c1TjvxdwMr4eP5x+8+sZBe79nTx
	j1pxjPw==
X-Received: by 2002:a05:6820:1c86:b0:71b:790a:9ee7 with SMTP id 006d021491bc7-71b790aa590mr6624976eaf.67.1795725329526;
        Thu, 26 Nov 2026 12:35:29 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm18946578fac.8.2026.11.26.12.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:35:28 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: [PATCH v6 0/5] arm64: dts: allwinner: add A733 and Radxa Cubie A7 support
Date: Thu, 26 Nov 2026 15:35:26 -0500
Message-ID: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add the common Allwinner A733 device tree and initial Radxa Cubie A7A,
A7S and A7Z support. V6 adds the tested A7A and A7Z board descriptions
and their shared pin and binding updates. The A7S ELDO1 voltage range
remains open pending Chen-Yu's answer on LPDDR5 VDD2L.

Base: sunxi/for-next (abcb290978fbfddb56fc77171918dd8b8ef3e81b).
V5: https://lore.kernel.org/r/20261121-a733-cubie-a7s-dt-v5-0@gmail.com

Schema check: arm/sunxi.yaml and all three DTBs with arm64 defconfig
and W=2 CHECK_DTBS=y. The three schema prerequisites, in apply order:

  AXP318W PMIC v8, 3/5
  https://lore.kernel.org/r/20260910-axp318-regulator-v8-3-e906a61a7f3d@baylibre.com
  Pinctrl IRQ-bank RESEND v3, 2/3
  https://lore.kernel.org/r/20261124215048.42074-3-pmazzini@gmail.com
  A733 UART binding v2, 3/4
  https://lore.kernel.org/r/09f3a181436e6f19317224e583c2fdaa787797d7.1792439398.git.vinicius.eduardo.pedrosa@gmail.com

The A733 CCU support is in the base. The remaining runtime dependencies
are the full PMIC, IRQ-bank and UART series, firmware clocks for warm
reboot with vendor firmware, and automatic pinctrl voltage detection:

  https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
  https://lore.kernel.org/r/20261124215048.42074-1-pmazzini@gmail.com
  https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
  https://lore.kernel.org/r/20261112-a733-fwclk-v2@gmail.com
  https://lore.kernel.org/r/20261125-a733-pinctrl-v4@gmail.com

The card-detect EINT-mux fix is in pinctrl fixes as a256b8c8083e.
It is outside the stated sunxi base.
https://lore.kernel.org/r/20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com

Boot: the v6 DTBs have yet to run on hardware.

- A7S v5 booted with vendor firmware and the runtime dependencies.
  Console, PMIC readback, MMC enumeration, LED and EEPROM probe,
  and warm reboot worked. A follow-up with the EINT-mux fix read
  a matching 16 MiB MMC prefix at 50 MHz and 3.3 V. An earlier read
  from a different offset returned an unexplained digest mismatch.
- Norman tested A7S v5 with his own firmware and a 2 MiB RAM
  reservation. He verified PMIC readback, PMU counting and overflow
  on all CPUs, MMC reads and write/readback, EEPROM reads, visible
  LEDs, warm reboot and power-off.
  https://lore.kernel.org/r/CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me
- Vinicius tested A7Z v1.11 with a local 16 MiB RAM reservation
  and a subset of the dependencies. Eight CPUs, PMU counting
  and overflow, PMIC probe, MMC readback and the LED worked. He
  tested card hotplug on the preceding DTS with the EINT-mux fix.
  https://lore.kernel.org/r/20261125131435.33190-1-vinicius.eduardo.pedrosa@gmail.com
- Andre tested A7A with pinctrl and PMIC patches. MMC and its
  card-detect IRQ, LEDs and EEPROM reads worked. The external RTC
  probed and reported an invalid calendar format.
  https://lore.kernel.org/r/20261126172253.1097838-1-andre.przywara@arm.com

Still untested: physical rail voltages and CPU/cache topology, EL2
interrupts, ITS/MSI, stimulated PMIC/NMI interrupts, suspend, 1.8 V
SD signalling, A7S card hotplug, EEPROM writes and write protection,
A7Z v1.10 pull-up behaviour and A7Z v2.00.

Andre Przywara (1):
  arm64: dts: allwinner: add Radxa Cubie A7A board

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7A, A7S and A7Z
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

Vinicius Pedrosa (1):
  arm64: dts: allwinner: add Radxa Cubie A7Z board

 .../devicetree/bindings/arm/sunxi.yaml        |  15 +
 arch/arm64/boot/dts/allwinner/Makefile        |   3 +
 .../dts/allwinner/sun60i-a733-cubie-a7a.dts   | 385 ++++++++++
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 333 +++++++++
 .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 349 +++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 671 ++++++++++++++++++
 6 files changed, 1756 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi


base-commit: abcb290978fbfddb56fc77171918dd8b8ef3e81b

