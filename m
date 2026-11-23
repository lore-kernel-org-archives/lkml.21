Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446457;
	b=x/q50pRwqIseTen7z/nYAuajFXDQOGA/0Xjccxtoh5XrCjSJjp8ISbBmf5b31plrbmDo
	 VhVIDZGckCTBxRQG4x+lRw01ouowJsijXPkaXXH4wzKsmo6nzVWl40gdnepyZ96PZbOQl
	 ikD5LqO1R1xImyBu2AFkqiuxYr7YQfhEK5x4Gcoa+b3SCuixmjzCoV+E2q2MiivSG6FFM
	 tolvAzE3sxZnDpxhk7xtVBZhCgXbfpHCe7BKtN2ApBZ+5Yb4hzWtmnQvJONzQqGAyZtIg
	 m0XkDeJ+9pxGCFWjYRIrsaX1eJW+Cys3K/iJw3CNL/P6jxgMiGOUpbV9iK6qhwMV44Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LrQqNvxu/j1cHnx9Lcyw23sony0Jj3XqLz3lYlPUdFQ=;
	b=eiI7HHudtVAtdWVQG9lWFEArIN1JBrUp7aE/0C2RJK5Py1f6zyamu3IabA1PoZnxGg/R
	 1z2MBz50aj179vd4FqNnr1vBkJDTuLQ6c8HCsR21ViWeJrXmPWT4x3lSqqSrQgJk82XFP
	 2T56M/3ZeIn2w/LBEngsJBAttYqr9+WRl8+UkA+KG/59ikoWEmW4xqjzPBKVs7IE5bUVP
	 L4t3E5KSrJZQLF0bjSUdPxWSECkUcIUttjybn/HWqls5kZso984X+a+vyv/uIccv67vyB
	 dmP3RfoSiKuzArzpp+T6nlcCjxEZUqZOrPRHl3TI0oCXimLuUmWS0Qh5lwAVb+yUecQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPqUHYLo;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA69606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA69606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPqUHYLo
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so3752248a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446456; x=1796051256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrQqNvxu/j1cHnx9Lcyw23sony0Jj3XqLz3lYlPUdFQ=;
        b=EPqUHYLo+3zB60AG4ZmvSvS4PSvmm+KHS9uXrJd0s6uPr9B2Hpk1VdCgVuvcXvxzAd
         DoXVOKzvYRXVHugk7MDe2ZoWCKuV+M3+rahOrLMtDuOmYKebrCh9UReTGHxXdTWdRDUz
         828iB4GDtT2Krpgh+0D8R/N7wpVooHNmXDgX6ujKscBDiYqa6vbywVj12qLWIHGOjXSP
         R3elBqY2PN+Hk78FRgH4g1Irmra90YL+CdzF5OOb9Zi1Myn5msN2gcghX8Ls4mPZL+XM
         RsiQpFUFnEliQhpw+CI8x0exFeoMT+OZU27N07TgIBkQbtzbSqgPLK8AGX0zCt6U+JCR
         JUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446456; x=1796051256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrQqNvxu/j1cHnx9Lcyw23sony0Jj3XqLz3lYlPUdFQ=;
        b=X+DiVwN92e7b6DAMQ0y3F7C+JwYV3eQXExO8J2qXpsoxmxXoEJxsTnBscIxbl1Q2VB
         TFt52vVtarg1fY+qfqg7DhnBiM6rRt1ZYHFr37m5Wl0taUqShsO4hinC8G6HfbvTJVBZ
         eLKkXOPEI5QODXQlkpfZCR0xrETqmb6r/2ZlY7LLNXRm7lYanJH/Y5LGNYT9kbN6ABix
         eC6zbdoj1yUhBzYH3lHF+fWgDYjywt9hlogT5U44WGENpLxl6uHVLxQx0fd8kVnaATMJ
         k7c98LkDJD/5HkqeFWqN8G3remlH1HgQeP4i+MNGG/9fe+wx94B4jlJL646tR1KzTaXG
         xLmQ==
X-Gm-Message-State: APuU4Z9Jm9kdtzKC3v1pTa1Exv374COiJDkq3PMfw0aNCDt/qWn3FA1t
	el/ae8l3H7sBdDGVoVhFDEzd2Ra3WQpF6+mFDQfgN1EEXMLIlvigi26w
X-Gm-Gg: AZFdTZdFwdfEhD6USSas4e7oCL1pRKuN3KnzVQb7jRJ2khROroalIrftumL238CMlxX
	DPUhJQSsfRjiGNz4rmmwaS2u8uTeJtDLoHISIFh+L4RQ+mtPk0vW7/44KYx065znsDdaIyBsARE
	okVGE7/tlvnitRxkm3RJgYnflNj8/j+8Ww/FuIi/bT1UnE/hn824SRXwWC1SHyMw4fFsNKWnD3/
	8U0MyX+EPhhhNO8LCKiW3X3z5MiC6CsjmbWPbR+wRJr3Y94gKIZMA2KV7geSkUmtv2MM6i3OsTV
	eb7zknuOXMwhKwE35xn/ImnrHx5AYaRDvfl9HCDWK2fYQDFbxNPlW8gyrDZ4wZ9YWbjZbR5c5Bm
	Bz19ivqb64vMnqRTmrmhDTFBxspAp6Yj+Cuyt+elsrRxxRJxzYNE75+hOGn+9qQF8Wpuh+h1rFX
	E5uMUseKyHD2DqljQ3qApVO8qbPiyPlEWTRqOy8nVOC5j26IdterNdZ0CIGSoxrujDSovXYysuT
	DoUK+6+QjfifFlDDvvo/ggOLIyGqgDLutPiZ4ejxH986Xt5CuoeMUrRlb+PZ+pO4gt9MZ+lPiRY
	TcnzB0YjY0RkA4oNfdCLlGlN9U4CSKWIY1RAx8LeM70jRFpfrQ56Y2WrAWxDCx43PuAo5FEnfMB
	tCGkMrpSyLA==
X-Received: by 2002:a05:6402:4416:b0:6ba:b24b:a25 with SMTP id 4fb4d7f45d1cf-6bab24b0fc3mr2248751a12.7.1795446455855;
        Mon, 23 Nov 2026 07:07:35 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc020sm5446279a12.25.2026.11.23.07.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:07:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v3 0/4] iio: adc: Add support for MAX8907 ADC cell
Date: Mon, 23 Nov 2026 17:07:21 +0200
Message-ID: <20261123150725.212836-1-clamor95@gmail.com>
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

The MAX8907 PMIC has a dedicated ADC cell, which provides 8 ADC channels
with information about different parts of the power system, including the
battery, charger/plug, jack and thermal readings.

This patchset has 2 dependencies:

- patch 1 of the series requires this patch
  ("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
  https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/

- patch 4 of the series requires this patch
  ("leds: Add driver for MAX8907 LED cell")
  https://lore.kernel.org/lkml/20261027115006.86032-1-clamor95@gmail.com/
  Or to be sspecific, part that adds max8907-leds to max8907_cells

---
Changes in v2:
- remove unused register fields
- add prefixes to used register bits and macros
- default reference values indexed off the enum
- swap data array to __be16
- set bulk read size with sizeof
- return directly last regmap_update_bits in the max8907_adc_init()
- added comment for iio_device_set_parent()
- MAX8907_MASK_RST_CFG_INT_REF_EN > MAX8907_MASK_INT_REF_EN
- dropped kernel.h

Changes in v3:
- explicitly assign values to channel naming enum
- add missing headers
- loosen regmap_read_poll_timeout() loop
- rename module description
---

Svyatoslav Ryhel (4):
  regulator: dt-bindings: maxim,max8907: Document io-channel-cells
    property
  mfd: max8907: Add ADC client support
  iio: adc: Add support for MAX8907 ADC cell
  mfd: max8907: Add ADC cell

 .../bindings/regulator/maxim,max8907.yaml     |   3 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/max8907-adc.c                 | 181 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  75 ++++++++
 include/linux/mfd/max8907.h                   |  53 +++++
 6 files changed, 323 insertions(+)
 create mode 100644 drivers/iio/adc/max8907-adc.c

-- 
2.53.0

