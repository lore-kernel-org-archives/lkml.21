Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853922;
	b=Wt5nqzNgBk1ECACtaOnbqWDw6ORGj0Uizqh6jowAxUjYQvE2A/EJu6A6WUIIv11446+Y
	 mMulA/kEUk0Yw48maLKbqvKnigBaOp/kp3xyjrlBYyV5oUyf2mDIV2ysbgtFEdrHm/mqZ
	 5Tobw/9QsXRz2hQp6n3VeCS3zqPMPKoWXJHK8myDi319JP79QJJ07TH5aH2FgxTJASszB
	 zEiV9NRfVVhQbbNu2clAzkrcnMDsKATg3tfD63M+FRNmKVnh+RGwxTwv/HWf3PtN7QxOj
	 USZjX6y7dNC6B8TdK9F/c5AoUcuhYiNmVOTe3gSd8pKAqKLf978Tqzmzlz8fWyz3YhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5e4yoQg/j5YEK37mURWiQZOmG6BYjI+8fHMt09fqOkc=;
	b=G7R29T6RV7O5LvS5pzZzpewRfI7r8GKtZjD98vOQV5HwLJUil6s5P+6j50yY+1vEc0R1
	 4ESluO2QDiGF2Bdk8wJ2RXhI0Gk8CCm9XM5LnTFj9nD7IWnm5I7UlZRx/Yrk5g9Dj/PP2
	 B9Zr4Hhesc9JqytYVkIy3IslyiDWp2K5Wuj/tE31zTH6VjvFrqOGJ3m+VXYYSrKVnzQZ0
	 30I0Rqh3IUdY1v6GLEZ0/zT1FqlQk7HSMrcUfbjxU2VSMPSnEqlZRCLfQjDLAGxgJlv1A
	 SeQKc4Gtm9MaeXqrvuVxcq8jMKdpPyv0FRmFWangAHG46VWwJSpQoAWpD5ctVKtdREg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fFhTpdvx;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC9E606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECC9E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fFhTpdvx
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b501791bb5so1602293a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853921; x=1796458721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5e4yoQg/j5YEK37mURWiQZOmG6BYjI+8fHMt09fqOkc=;
        b=fFhTpdvx69cx1gGTuyGtkSu1a0AWHqAQ1SkmO2HlmsRBSUo1gogSl7HkruAQ11EwXe
         Am+MxBhey9wa7Ji7Z84J5S3W0RCrYkVulKMoMeLoRu68IwL3HF23ZUHKYzasTn6ycx9f
         uu53FPDcff0arDYFVBW+1AWhILAkOxGdzUYK/iTF5EEDwkk8U5wtdfu9cvuuOLp6NGf5
         vQ44W/a7lxD8ECJJ+2c7i8tGR5up/L96ZL2+6Ck+6+jws+/fdMVNLtDI7wpxQQozmlSA
         /QB0/QLK90nMTEvlZuJMiCerb1qhvXmy+wKXmpngHrH061SGJRvmX61Tt9aI8kLMBN+8
         ZA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853921; x=1796458721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5e4yoQg/j5YEK37mURWiQZOmG6BYjI+8fHMt09fqOkc=;
        b=kZ6HefjYrH0kd5dNChYBKnUbDnGJBl9syPtPuQIxi6We6eEgU8+o1b56PJt9jnsSMB
         EmIKNBBuJC8pMv5bjr6AfwC50O+ABRKo4EXK71iriYi5JmLNMhWPpnJ8mFBDLmstIxyr
         AdkFV/qI4IsW5I4JJNn/LPh4AVXWIeMZkJrFKk7g20uplGzw/1dcI3ZJcXtsA23LogyU
         w68v60zI4Fg1RnfuAoUVQYvYs2oSKeu/OcJkUJTyIUxYfBlkmxFi/e+IG6ZYU9Uqc+ZH
         xDaqL/NCtszjZ4BPthrDtPEvO3q/3CvE1moXeXHk1o5iIiqleTX6LGBQ+sbJlcZh+Hzz
         GWGA==
X-Forwarded-Encrypted: i=1; AL+hErFDE6ToEp4xBhCCTZMNRKk2Z0ZYKPoA+HlnimIUIDVqQXPCP5ruzpb06nwOHIrHnLXx4D1f9wVcyIVruS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zeU1WoDNeECDTp27OaZufKC4jGHz7uVpDeCuPqBDakNH9cXXo
	R115//FA/vhojYjAgntZHYEPVQs8ZK6YEyvgmnE0I1BivwUVaUDoAW05
X-Gm-Gg: AZFdTZe4qsZKZXt9jKalJC+HzmvQEFZHfHf2XFyopIwmyxiVSAJMKk134UMQS5oC5Wq
	Ba+HYrHAEg8iwVKNPYpBykSt0k3XFFF+E6b9bL6m0jQGyYQM8nxxQc0qbducoAePyYChCKfc9KD
	hTVbZI86UtEeUaG8ZGFjrayIj6OdOd7N/TSQOgZaoi8CgBtsWWT7EI8gO0ebi57LTMhzqhomAhG
	P5qO1Aa3FK3ovfPMOpM90eKEtx7jGlHVIwDVlWCMDGPWb09gfIyKB9uCgfTI+8tIAhyY43r8KnK
	CcEFqcxKAOp4VoNR/Gx5by7xwxLACL7rXrnkyEc0BEgbwBcFR7B4hi+DiYBiJ4F89YcmOEQZo5e
	8M8kfTBVieWFeKwsDS75sIjhqQ5iK9buxUjIXgQrs4Fj1GjDFVvRo+HeCo3FoEdN4ebWCwzecvt
	XTzZgzuNniYDMRe1HybGnnqspQeDu9/0Wjil46Ocy/9pCohLSpZG14FY/heJBQJe8lcd7KcUPV6
	q3qvu5bdEwEPosCHNpiNCd+Oa5v08eZ992r/WNs6iO+l9SU82goBwRG77mx2yBBifK3OXHPM1UW
	A4rbxQ==
X-Received: by 2002:a17:90b:224e:b0:3a0:d265:3647 with SMTP id 98e67ed59e1d1-3b41c7d6084mr24828076a91.8.1795853921157;
        Sat, 28 Nov 2026 00:18:41 -0800 (PST)
Received: from wyb-ms7e59 ([2001:df1:7880:4::50a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm11550749a12.27.2026.11.28.00.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:18:40 -0800 (PST)
From: wyibo6109@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH v7 0/2] Input: add support for OnePlus/OPPO Pad pogo-pin keyboards
Date: Sat, 28 Nov 2026 02:18:33 -0600
Message-ID: <20261128081835.366128-1-wyibo6109@gmail.com>
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

From: Yibo Wang <wyibo6109@gmail.com>

This series adds support for the magnetic pogo-pin smart keyboards of
the OnePlus Pad 3 Pro / Pad 4 and the OPPO Pad 5 Pro.  The keyboard is
built around a Tinno MCU attached to a tablet UART.  Both sides share a
single data wire, so the host gates its transmission onto the bus with a
PMIC GPIO for the duration of a frame, and every host frame is echoed
back on RX.

The MCU speaks a framed "one wire bus" protocol over the half-duplex
921600 8N1 UART: 8x 0x55 preamble, 0xF1, src/dst addresses, command,
length, payload, CRC16-IBM (poly 0x8005, init 0xC596), 0xFE and 4x 0xAA.
The protocol was reverse engineered from the vendor kernel driver; this
is a clean-room serdev reimplementation that replaces the downstream
platform driver, which depends on a private msm_geni_serial callback and
a user-space held tty fd.

The core protocol (framing, keys, touchpad, sync/heartbeat) has been
carried unchanged across four SoC generations of these keyboards, from
the sm8550 era to the sm8850 ones covered here; only the 0x3A general
sub-commands grew over time.  Patch 1 adds the DT binding, patch 2 the
driver.

Changes in v7, addressing Krzysztof Kozlowski's comments:

- dropped the touchscreen size/mm properties from the binding as
  agreed: the touchpad geometry is per-project driver data and neither
  the binding documents it nor the driver parses it from DT;

- moved the MAINTAINERS entry to its alphabetical place, after
  ONENAND;

- the disclosure prose now says LLM.

Changes in v6:

- disclose the AI assistance in preparing the binding documentation
  with an Assisted-by trailer; no functional change.

Changes in v5, addressing Rob Herring's comments on the binding:

- dropped the block scalar from the top-level description;

- rewrapped the descriptions to stay within 75 columns;

- restored the serial parent node in the example.

Changes in v4, after Krzysztof Kozlowski's comment that the binding
describes the keyboard rather than the MCU (wording only, no functional
change):

- the binding description and the commit messages now describe the
  keyboard (built around the Tinno MCU) instead of the MCU itself, and
  spell out that a keyboard is a fixed physical device, so the touchpad
  geometry and the product names are per-compatible constants in the
  driver.

Changes in v3:

- the compatible names the tablet project the pogo port belongs to
  (oneplus,caihong- / erhai- / iceland-pogo-keyboard, the codenames
  used by the vendor trees), and the driver carries a per-project
  description in the OF match data: feature flags gate each 0x3A
  general sub-command (caihong, sm8650 era, has no wake notification
  and no backlight; erhai, sm8750 era, adds the wake notification;
  iceland, sm8850 era, adds the keyboard backlight), while the touchpad
  geometry and the per-brand product names are per-project constants -
  the wake notification is skipped and the backlight LED only
  registered where supported;

- the touchpad geometry and product names are no longer DT properties:
  they are fixed per project and live in the driver; the common
  touchscreen properties (touchscreen-size-x/y, touchscreen-x-mm/y-mm)
  remain as an optional override, parsed with
  touchscreen_parse_properties(), for the unlikely case of a variant.

Changes in v2:

- dropped the redundant "binding" from the dt-bindings subject;

- replaced the custom oneplus,touchpad-xy-max/-resolution properties
  with the common touchscreen properties;

- dropped the serial wrapper node from the binding example;

- the MAINTAINERS entry added with the binding references only the
  binding file; the driver F: line is added together with the driver
  patch.

Tested on the OnePlus Pad 4 (iceland) running Linux 7.2.0-sm8850
(v7.2-based iceland tree).

The binding documentation was prepared with the assistance of an LLM;
the technical content was reviewed, adjusted and validated by the
author.

Assisted-by: Z.ai:GLM-5.3

Yibo Wang (2):
  dt-bindings: input: add OnePlus pogo-pin keyboard
  Input: add OnePlus/OPPO Pad pogo-pin keyboard serdev driver

 .../bindings/input/oneplus,pogo-keyboard.yaml |   70 ++
 MAINTAINERS                                   |    7 +
 drivers/input/keyboard/Kconfig                |   13 +
 drivers/input/keyboard/Makefile               |    1 +
 drivers/input/keyboard/oneplus-pogo-kbd.c     | 1251 ++++++++++++++++++++
 5 files changed, 1342 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
 create mode 100644 drivers/input/keyboard/oneplus-pogo-kbd.c

-- 
2.53.0

