Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716201;
	b=induK5ZMHamQqyYKhjToZcOHMziM5PMQk50OQ84BeZPXCaWpitONyOI5Da3YS3hxYxfU
	 j0iCkEu6J6kOQ9d/u3gj9OnvFJcAXnHzSrYKMq2558/TUtcPuEIXIKqg60mfKPXvo+FWE
	 qWCHZXif+U4xiq9AIwtFMeRnA8tqmEPNZrPeJPEHcI/Bvn/+/Q4YeYR4PB8XiUR4GkogR
	 adcEXrvrS3YQCpol9uN04pQxGkpkyCKHkWaSDWk9xIV5rH58vw2Z8jpTpXxvA8PTjvpqm
	 67xxYh3+HDRHWqNwonecF43tpfimf9rB+pK9MIlgPr8maD/uxSyDYkCqyZIfzKagPIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v7cRvxwD+0hh0qmm9vXifZdvwaUkz3iKlLP8yUjjZ/0=;
	b=F7kvsunpYzvgNAyQ/zPMr6UVu6tKMP6wjLHN6x3QoCUmsuzB9KLXqXwu0buw2pJdiGuS
	 OLBED1EjpYMpiyfHSdKkfd27bYMtML/i3O07lpk9yYhXBIzAMFrkvvvl1gL61pFwg8J6Q
	 4GMbNnieZurNBS+aSTPcKpRP6aGJZ12Ew+szVnUWCaOcNvv0lYmc60m3ph/EBVuXDJI3o
	 hP0u/F63fGD7RrfSn9BuJFzh5/yPyJRGnl0+S4E4BwOk8/aF1LmPDC7Ifj412jIa5+Cr3
	 tERBLBycxYg8KuxHd0LQk+TWgd19WvoTW1OaPAguS8Q9WZWx6Kq5Cbl5WkF6xB+gKtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7ZDkX2d;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C6D606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C6D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7ZDkX2d
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so74831735e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716199; x=1796320999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7cRvxwD+0hh0qmm9vXifZdvwaUkz3iKlLP8yUjjZ/0=;
        b=G7ZDkX2dgIa6d3/OEv3BL66Iq6KGr09CxO85zG3wKRu0Ei7JjggIyTfuFk8Xej1EQc
         FHmZi/MDKupnvpHwf97HmNlGYX3rmBcGr7l7HeggVa092vuKvJgjbvNr+QM/1MCSRxHM
         08JE1aziOC0VSuoiT1aeUoxt0L2U2HFPAVdD/AGqllkEN8EtgnZRT0OE+1Css4llDRpd
         wdjNCVWbFy8++Q0XNeU2avrKuGWix9gOvn0MV405gki3UIcfEHLarrwjeCuGP3ABSs82
         dMyWnV05vOQ39lUAjpNhJrNnBiJIKKlqwsbRU5naRZHyUhCY0zoA44MR5CTKvLxUYaTm
         m+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716199; x=1796320999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7cRvxwD+0hh0qmm9vXifZdvwaUkz3iKlLP8yUjjZ/0=;
        b=itlOIiYqg7WE/0hp1GbG4N8HdXbwW5W8cJg3DE9qhoqlhhbGCRO9nXwfHKIruQlYtS
         R8dhK6Nvyw5Y3ksfGEwrkF4Ry9UjaX/mvW12GVtxAXDWm5rxUHAuY68KyvExpcXnEWH5
         /2LNXFIb7kJm/JeY8E3m2yrC8H53QasOahyA1FhTTav7ZLiAOHtPjDNnNx6QSNvCPYKu
         C4zsr0shYEpscgfC2rrVe6bO5ID4GcvrYeogR/Jj2i2HrqDitCR+DMSbjNOyFz9IXhb+
         5/1MbmDRfG9vdxF96tC0nEyETUxSmOrqUK1X4qZCx4cD9+8KVZaGzf4ODlGTTbslV/+U
         I+Bg==
X-Forwarded-Encrypted: i=1; AL+hErFMzU/CVqa6Z+a2LQNArbSZ/dv4ia68Ge3sAkhdz6b18ZliJKe9ojvKYwFl7cJhYM6yijMzOvZAnVLsGiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HBwSTWSwYPwbOQCAVVyv8YyVpKDMLhqrHdHUZpOYyRM94AiDI
	xlzpVCyps8Wf5J3PE9yHY2CsodvjdsuWKJrYs/o+M95uoM5JRbLOjaM=
X-Gm-Gg: AZFdTZdMKr599Aab+IgerfT11dvn8AVxMsP/tpurfWsjiHRT9FuYaS62QrRhv3lSr4t
	W9VDq6SRb0QWe8pAMs1Pbc3rNvwH5vnEBT0mR8xrixh5wsVGSOKafH4BvJeVDSZXviIHu7TybVP
	he9AYWj1eAH5hIl8X5L26Fv5JAircykyV04hakXrwvEYefY4wE4t+ISMwQsbmzY9ewv/qj/RK90
	oaodHIkrrlb3BFo07VYUjL/blG99AXv5SiC3d1PUSK3sbyA+0nIwnAdSvNohnj3aBa4u3ZOU2rQ
	cYWdcsJV6UPPAwPoMasYOXUE+1fiPc7/YPYWvKzXRm1LkJOp2E15iH9zG94rmWxsY3Ysk4juNr1
	EnHUMDnQO0IfyJxnOl+SZlyiomSMfxC0l+DKxmJD1PhlpKohoHzLMmj2Z5pLvxJtuGOsPm+w0AK
	xcRbiONtI7xuG810rNW2ksXxyFBkv6YIwG7OcZDUmDt/N9KWrSRffIT0a6OLf1eskAHpp49R/4/
	gtVbOLw3aG+Kg0DLxx6wnyy1a56n2iHsGUGaTajhsZjs4/8OZpch/6ZiSeSPReMwxT3CPZNjZbr
	OMlys3MHBuAWotx5irsbar24HXnRakUK5ZrOLLRagA2cpq8kSDlDFuV1nBbfVogWz9nc4aHxZSa
	bry0KMIMzKWdAZ+puYqMTTkwV7huciQcu45PYQeMnZ7HsPU3LrYbDRTyS1kg=
X-Received: by 2002:a05:600c:1115:b0:4bb:a602:6c8b with SMTP id 5b1f17b1804b1-4bba60271damr88655835e9.14.1795716199310;
        Thu, 26 Nov 2026 10:03:19 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:18 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 0/5] gpio: fxl6408: Fix regmap ranges/bursts and add PI4IOE5V6408, reset, bias, and IRQ support
Date: Thu, 26 Nov 2026 19:03:10 +0100
Message-Id: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This series fixes a regmap range / burst-transfer issue in gpio-fxl6408
and extends the binding and driver to cover its pin- and
register-compatible second source (Diodes Incorporated PI4IOE5V6408) as
well as the hardware features omitted from the initial minimal driver:

- Patch 1 fixes rd_range/wr_range exposing reserved even register 0x04
  (and omitting readable 0x07), and disables unsupported I2C burst
  transfers via use_single_read/use_single_write.
- Patch 2 splits fcs,fxl6408 out of trivial-gpio.yaml into a dedicated
  schema documenting reset-gpios, vcc/vddio supplies, and interrupt
  controller properties, and adds the diodes,pi4ioe5v6408 compatible
  with fallback to fcs,fxl6408.
- Patch 3 adds optional vcc/vddio regulator enablement and reset-gpios
  handling during probe.
- Patch 4 implements pull-up, pull-down, and bias-disable pin
  configuration via gpio-regmap's .set_config hook.
- Patch 5 adds rising/falling edge interrupt controller support using
  regmap-irq and gpio-regmap.

Hardware-tested on a Diodes Incorporated PI4IOE5V6408 (I2C register
access, reset-gpios, pull-up/pull-down/bias-disable configuration,
push-pull output, input status, and rising/falling edge interrupts).

Gianfranco Mariotti (5):
  gpio: fxl6408: Fix reserved register access and disable burst
    transfers
  dt-bindings: gpio: Split fcs,fxl6408 from trivial-gpio and add
    diodes,pi4ioe5v6408
  gpio: fxl6408: Support optional power supplies and reset GPIO
  gpio: fxl6408: Add pull-up and pull-down bias configuration
  gpio: fxl6408: Add interrupt controller support

 .../devicetree/bindings/gpio/fcs,fxl6408.yaml |  97 ++++++++++
 .../bindings/gpio/trivial-gpio.yaml           |   1 -
 drivers/gpio/Kconfig                          |   2 +
 drivers/gpio/gpio-fxl6408.c                   | 181 +++++++++++++++++-
 4 files changed, 278 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml


base-commit: c6d8ebd7324cefda867a701b4341605b681aa3f5
-- 
2.25.1

