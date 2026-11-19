Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104069;
	b=buN3p+IMBa2366KUpB7lVpBJ5RfGuB2Qw+BoYwtOFtY0lm7+XC4s/eGZyxaBVM/XOJuT
	 rwRq/4NBYULrOQ93Pi+g8jJ2/NqtmvcXkQ293E1Cn5dQ7e/zCHLdzRgl5OE90JJQKEO1Y
	 Ppu1B1NGE2mEmeZ53d6UGMubpwA7GkEOYj+7s9kbA7170iwo5ei+7dpiqM/gKXR8U7b61
	 JW8YIyEdiipqxedrskSQynZyvouEroZ5fkAtJ3rV57g/myy14d00rTZ3Zze0RkbUJ2IEw
	 meXOSy//RAoNZUe1nKguBCVZXR8cMrbX/Z77nFra0+xMDl5E6c+dz1md3ziforPBbIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G96VJts1v3/6sj9M5CAvHWlJcDFh4oPkNZ60e98HLbE=;
	b=wpdmW9DqHuOy5B4/YF/q1Pf7U6JaDARXsF4mEfj1jOvPJ75ERIC1j75LjQAhfooZb4NO
	 B0vf5WrybSVBTWl9QB7zb7ccWJniyCJqfHNsJr9ZuaAcqGgEL7lX9/+gjrSo97XsNc11b
	 OHpdSPhfGOQAe4tMKLTRG1BrJUTeCCDz4O2IN7nCsjDR3aOJOVtietkifMl6nKORQvX9e
	 hLm4UK6xnOQViBPtBTCrHl+Vl+FRYZlaodkXVHCzRPqpMYH1RvO/KAbjRBKZ5Ux8rfOxa
	 LrTDCYBhwRr9/Ckme9W+AJPhctVRlg5YMGJ7AAEjYN6+crSs0rw/bKwuA7o1foxgWzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YThfrSju;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EAE60A2601
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3EAE60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YThfrSju
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so23535215e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104067; x=1795708867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G96VJts1v3/6sj9M5CAvHWlJcDFh4oPkNZ60e98HLbE=;
        b=YThfrSjuF4Oqzwz429Vo7nEBdNy5jkNcZasRgRo2lLdRG32SZXGYkjZFeUTaudiiOi
         6wTUvDI4IrrfG/wqA+1dOy3CAe3cnmLuSAwxwN/9zpFn/O/ttCXlNL6iaXatz/abv8Nd
         JXaxc63I67G4CdqVrdIx2G+ao9HKPuMK+tR2fsxOO8oyRlRy75T5/x4eZ61ULDx50QEZ
         LEdZpalllJ42pPbfQq463QbpX/37C9fDcZpHDFa5v1xp52m5WYcdE2X61cWClZIhGVKv
         nbEc9VhwijBaR1SoTXAW9TIEI8Za7WhEcBOphG8h+nLTM4n4u9EspT+YqT553kF9Cmqq
         Yyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104067; x=1795708867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G96VJts1v3/6sj9M5CAvHWlJcDFh4oPkNZ60e98HLbE=;
        b=sPNA+xRuGDLd4JfIrouDGxP8TcthnE36BqXgoY2+j1pRkEslC13clS7SjfdxHUq2qR
         hHSU1lFvtyLWdcnlFQzLYKghoAq6gtJexpKF6ObrYgrSS8JUUInlgvytOnvzq7KPPub2
         lxNIA8Fskh+ugZqCo5a3ptU9aj7ULmz0i3Qfd+MO84wi34/ZzeW9MftjYYoa0qjKb/L8
         6r3mElwp4AVSrE7obcV3CVYXipbZCkacleaLHR4ejsOOvGiyq89W7f75Qux6VfxwOOVZ
         xDpeXQH98ksIAqKwUVRtKrL7IEUJ8lXFJ0h8CoTP0rm/ecWrbIg84+/XFnnEuzShiHaQ
         Quug==
X-Forwarded-Encrypted: i=1; AL+hErHkUqTEDN9ZwVOkeeB1Viy1gRr34khvUSli8r9gHAPnOrUg3OGHHyNwtkExIelUzS9wKKgUGp4Eb7OF5RU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wjcA6tI+A1u4TcOelrCMif3nCByF47LwX2jjcw/TN0Mixe4Io
	EulCE1mfZyaAmggSnZhphhkY3w27p3CFTOtlFHil6D9AN/v37nY91A6r
X-Gm-Gg: AYBFou2wSZHpsmEJpXNE9yl6X51Ldm3vvLrWwjKsVyHz0JlZLLO/60EpPKk6yWhxnsU
	UZMnass1yYOkSxAEuOFVFRwIZ4HbfnUbytzjIB6XgroSEbFDyfdUIAGrJZQ3kKKjp2OtQlBqf2m
	6L5vIWmq3wghUs5IPfdNBwj2owIrb+s6Pcr6cJiilkn3YIrBTRpQIkOjEuvpbwV9X0z8OKI7O8D
	xPQBuF5tzaBTvzD80JrVBYS4ujcS9Zb7bl11TvkIJPPjFwd1bQRFPk5QPk1itUddknBBPzclAtL
	HSB1OTJr5ndcZQSSCQ78Ix8etQ5LJxiOT+nEyI6sP8EYLV9zEDg7PLeNV9HU/RrAhcbqjnGBnYB
	CtK6y9Eqp8iEWPLzQQuKEvrhxzRK/YXpfdkORPlSuf49l0mcvAIA6KcEG/It1513F8zUXfH2sNB
	/yBXDkM41WC12ARARwUnvdnEfOsMLxMNSiOkd/c8B/SRAygwbUzECNgo+Oky8r1+bFnEBmzxjAQ
	9VvJhmxBmA0Thz7tYSy/CWmzo25QtF/m42qbqBY/UxEROuJYJ7193Tqdawq0fVPqWm6G4i3katG
	tRqfkwqgvnDzZywteqniQbTwIooysh8hyTkCe4KjvSAxOutE8LAj4yjD4UTxAqOAVhMQ3OaEOIK
	R+8wIqb4oUepdDZu5Lw6w69ACFcDUIqbFevc9IWRg29HwjkHAmCRbMNw=
X-Received: by 2002:a05:600c:4f0d:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb7da2ba1bmr145169935e9.24.1795104066898;
        Thu, 19 Nov 2026 08:01:06 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm323784f8f.44.2026.11.19.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:06 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 0/2] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Thu, 19 Nov 2026 17:00:52 +0100
Message-ID: <cover.1795103362.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
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

This series adds Cortex-M33 overlays and combined DTBs for DART-MX93 on
Sonata and VAR-SOM-MX93 on Symphony.

The first patch extracts the existing DART-MX93 remoteproc configuration
into a common include without changing the resulting DTB. The second adds
the M33 variants, reserving the peripherals used by the firmware and
keeping dependent devices disabled. Remoteproc and MU1 are then enabled
only through the M33 overlays.

Changes in v3:
- Split the common configuration extraction and the M33 overlays into two
  patches
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

Patch 2 uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

Validation used the remoteproc binding update and cebd1c0961d8
("dt-bindings: gpio: vf610: fix clock requirements per SoC"), which fixes
pre-existing GPIO schema errors. The base and M33 DTBs build and pass
schema validation.
No hardware testing was performed.

Stefano Radaelli (2):
  arm64: dts: freescale: imx93-var: Extract common Cortex-M33
    configuration
  arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   | 24 ++++++++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 14 -----
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 6 files changed, 139 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso


base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
-- 
2.47.3

