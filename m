Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110612;
	b=dpkiR+qerJG+XJO64EVBHkNwj/A06xjmOpFZ4iYH35TTO3KZAQ3EEQEm6oL1GRBJ6pST
	 dUvjx1fAQvcA1bJEJau56rgAbQu14TH/+ciS3QFT/r/DDs/eF6Mkwn4dGfSij20hBQBeY
	 j1eddcU6YjMc61qaqpHS9FTsyDcpJwbqsLDMMijJi7LmUjNa1EOoxMIL8cBGl6+XkC8qx
	 BE7L4qe5XxPAJrj3+CJeSVC0iWbkhjxdyawH4Bv3pbdwTFelOtPKTOk/PfpUYoNPP3doa
	 44hD+IGMNZwHozj/lNAGqSrDkP2jUsR1kj9IRV1QFEcki3hnFAaw5mhPU9VcmuAqNKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mnejhq/H/SZQPdPa/LlelAnqIjEaiLVH9BdFcNoAYWY=;
	b=biNqpNdfvZPZ6lDeWPc/F0y1cj2hHjowTnh1bSkQcyn+mxUypKqjd13bQ1OiYI3bZEVd
	 PFVQzKTHdrtZUcMRK4a5A6t9pBV/MVgyVEKzaySqH3Z7Wm7v1PcWTFrinvNdXjPHKb5s8
	 RndZUlWSHYo+pUDI9cMQccLe2iv2XJwcDzZyZ9NhY26MhjUvHTY9hfQrGxqqywgVMH8tf
	 lKzzDP3DwYo9Kygkly/tW52Rjc+owRTtjnZof/XTfMMBHOTJ9lMrRM3To9oCgeAyt2Zsq
	 OD8koTEBxT1tWJjyjvTZ2sr/v3QKN8HNlycpX4qpcumIItIdt1wI1RPkNFPwHYzM5GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=huRUedH5;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD669606A334
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD669606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=huRUedH5
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2356623f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110609; x=1795715409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnejhq/H/SZQPdPa/LlelAnqIjEaiLVH9BdFcNoAYWY=;
        b=huRUedH5MibOxkehNlG9X86upNwlh2yY054K0zSCkbHorUAG1/sTdpr0DFiqI2bMeA
         GB85882arLtlgYsCzGXGg+K7fCb8FQdr8p+4VNWkQc7RvCTdcbIzYp4+YipQ9DKf4efs
         i3HefOUdJe5i+wbBv/dQzxFY8Hdq/q+6fbRIyiKgckOsdV6slVrrSlSTdUkTILjCkjgr
         BCfZm4ULxdHCewa70HX2FyQRANBvX8+lJqCy/o3X5pJqHQQ71Ede7f92O9B/q2M0hall
         e0TmmXuJwtKezdFTLl73iAaGv1canePJ1JW0TNpYKCGkexisWiqehwaqD8qyAxOwrM2L
         nr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110609; x=1795715409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mnejhq/H/SZQPdPa/LlelAnqIjEaiLVH9BdFcNoAYWY=;
        b=n2oIWCUD6eocJbaMYcEgVa3O4VVTl942/DEcXL9H+V5RW8rRS+Ax/oHKhG3T9saMAr
         k1t5wL562V3uSXEp8ireXtuo7D9tqtIMo77Q3zGXmoePX3nhGEgOCwv5sRmldhb5JZ9H
         nLFf/MQJKVVgFTaJpVPFCKEOqgXwcdLEush/lEUIhCIiy4CEOkLg+Lag/TKmg0JfeXbi
         z8AbDVjrJNwFBs5wR9KtqC1OfD5n1yC3EOAdtj4nRCa/+fjgAKjJyN5X5OOnn4rTJrNq
         GJgvhFE6JPRPAxhT6yD+/5GYYxyW38YCHrTxd6zl+ArBRGo8hBFKn9iT17T2GSWkV5/u
         H/3A==
X-Forwarded-Encrypted: i=1; AL+hErHrXId2DXCwQknYn2AvHoZfC3mbGNMdnVCzcQ4OoV0Owm9LQQtzSUfh9iJ+hqgSVzfptHsaLMQ23/ZXi8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YvH4TQ/VLL+o0uKth18u400ah1EcUgcsPoRFuhneFpoo+338I
	80cgRscDWpKIXyeUFCF/QoUtC5lFr2Oss3b2JWtTBMsehaaRoNAScwjBZotST/+SeTw=
X-Gm-Gg: AYBFou2H/sL3dtszSVnyQSaEF2XStJVi1f46lK634hWBECa83Ca50c8jWgyEhQPwuWb
	RHRGnXxZmUuWQOatvKZF1+55IBmBnvH3M/lRxQ6usTtBWj+GCJFi7nOSU9VBoWcQdaBLu8u2gur
	nkJleNbvNItzOl4hkXqlzfJwYSp0nlZlXXG5lOyKUXKep07FFt6HHLtpqIMtRYTLI2POZhsKFqf
	+JmDT1ca3ABMucq2csDoF1MN/O3PtFrROAXVV1VQrd2pN2XKnS9wtLbcgPctsUfp7rNONA7RL82
	XdJtfFytRHBlHbEafZFzpiZ7u8w5DvXUswaaN1Rfzkd0fnGpiUWgZGHhZ/u5+0xqK4seMJ1Qqzy
	ZQBnbJvFR6B3H6/c8OSbIAi1b80QsDy847WAQbqnzrf2Tq7TJQc5inPzay+tVYc7aoN4q8i5psb
	JQ0mNL4eILlh2dxWIa49Z2mvGbUdafh9cmnwcYksCH45Nq/nYh2tgtFKY7ony2NqGxvZsRFQaqq
	BEVszzZA3TOxiW4C7lwCbSHDuWP+e/+sG2nbIXIcKmAxX84mx9LRti2ORm4BmWZ20sK4bf9VPAL
	h2UsxmJZynEZuCKIv8iJJXalt+ou7rrJPercqjFekwtcXLu2DxtyVzzP9ttm0dXpsKDIX6yPvIk
	vxYusRIN53S3esMRto4Ak/uraX6sNlHAGtMTrack2TS2GxTqM8Vjdf2SvWvqSfxOHiNDM+s5+lC
	JbzJQHvURJqYvn9F6wbJsfmRM=
X-Received: by 2002:a05:600c:5246:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4bb887fe892mr6623085e9.7.1795110608655;
        Thu, 19 Nov 2026 09:50:08 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm19205815e9.11.2026.11.19.09.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:08 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 00/10] wifi: cw1200: add XRadio XR819 support
Date: Thu, 19 Nov 2026 18:49:52 +0100
Message-ID: <20261119175002.458988-1-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
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

The XRadio XR819 is a 2.4 GHz 802.11b/g/n SDIO chip found on Allwinner
boards such as the Orange Pi Zero. XRadio likely bought the IP from
ST-Ericsson: the XR819's host interface is based on the WSM interface
of the CW1x60, and it reports the CW1x60 hardware revision. This series
therefore adds it to cw1200 rather than adding a new driver.

Patches 1-5 fix existing cw1200 bugs. They do not depend on the XR819
changes and carry Fixes: tags:

  1  a double debugfs removal on unbind
  2  SDD elements read without length checks or unaligned access
  3  SDIO transfers from stack buffers
  4  GPIO interrupt setup not unwound on error
  5  mac80211 unregistered after the interrupt is freed, so every
     unbind of an associated device ends with "stuck in firmware,
     killing BH"

Patches 6-7 add the vendor prefix and a binding for the SDIO function,
with an optional GPIO interrupt and MAC address. Patches 8-9 add the
XR819: a first-stage loader written to SRAM before the usual firmware
download, the SDIO ID 0020:2281, and a card reset on probe so that the
device can be bound again after an unbind. Patch 10 takes over the
orphaned driver as Odd Fixes, as I presume someone needs to do it?

Firmware
--------
The vendor firmware is not redistributable, and it speaks a dialect of
WSM that cw1200 does not: it reads bits 6-7 of the message ID as an
interface number where cw1200 puts a link ID, and its TX confirmations
carry per-rate retry counts in place of the media and queue delays.
The firmware these patches are tested with therefore comes from a
reverse-engineering project and speaks the WSM that cw1200 expects.
The firmware is written in rust and runs on a ARM966E-S core. It
is licensed MIT OR Apache-2.0 and builds the three files the driver
requests, xr819/boot_xr819.bin, xr819/fw_xr819.bin and
xr819/sdd_xr819.bin (this one is pure calibration data).
Code repo:

  https://github.com/ArthurHeymans/xradio-open-firmware

Documentation on the hardware obtained through reverse engineering and
black box testing.

  https://arthurheymans.github.io/xradio-open-firmware/

I plan to submit them to linux-firmware once the driver side is
settled.

Testing
-------
Tested on an Orange Pi Zero against an Intel peer with WPA2: station,
access point, a 10-minute traffic soak, and repeated unbind and bind
with both the SDIO and a GPIO interrupt. SPI is build-tested only, and
without CW1200 hardware, patches 1-5 are tested on the XR819 only.
Details:
https://arthurheymans.github.io/xradio-open-firmware/orange-pi-zero-smoke.html

Tools
-----
The patches were written with AI coding assistants from my instructions:
OpenAI Codex for patches 1-4 and 6-9, Anthropic Claude for patches 5
and 10. The assistants also ran the board tests above on my hardware.
I have reviewed every patch and take responsibility for them.

Arthur Heymans (10):
  wifi: cw1200: avoid removing the debugfs directory twice
  wifi: cw1200: check SDD element lengths before reading them
  wifi: cw1200: bounce SDIO transfers that use stack buffers
  wifi: cw1200: unwind GPIO interrupt setup on error
  wifi: cw1200: unregister from mac80211 before freeing the interrupt
  dt-bindings: vendor-prefixes: add XRadio
  dt-bindings: net: wireless: add XRadio XR819
  wifi: cw1200: load the XR819 bootloader into SRAM
  wifi: cw1200: add XR819 SDIO support
  MAINTAINERS: add myself for the cw1200 driver

 .../bindings/net/wireless/xradio,xr819.yaml   |  49 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   4 +-
 drivers/net/wireless/st/cw1200/Kconfig        |   6 +-
 drivers/net/wireless/st/cw1200/cw1200.h       |   9 +
 drivers/net/wireless/st/cw1200/cw1200_sdio.c  | 200 ++++++++++++++----
 drivers/net/wireless/st/cw1200/cw1200_spi.c   |   2 +
 drivers/net/wireless/st/cw1200/debug.c        |  19 +-
 drivers/net/wireless/st/cw1200/debug.h        |   1 -
 drivers/net/wireless/st/cw1200/fwio.c         |  67 +++++-
 drivers/net/wireless/st/cw1200/fwio.h         |   3 +
 drivers/net/wireless/st/cw1200/hwio.h         |   1 +
 drivers/net/wireless/st/cw1200/main.c         |  50 ++++-
 drivers/net/wireless/st/cw1200/sta.c          |  26 ++-
 include/linux/mmc/sdio_ids.h                  |   1 +
 15 files changed, 361 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml


base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
-- 
2.56.0

