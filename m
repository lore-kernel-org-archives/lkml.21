Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432740;
	b=aljcavnbNj/TXhd61Y19mweCSa2EA+vNO6YP6LIGe3qcpVAb1wuvYdo9eX4qHF7BAS1s
	 P6sgP4GmxP3L12YnwOgXUB3aXfpPBvIxyT0JF/d7ImdIVrBZdOLaiQHdEEttwtv2ImQG2
	 1S14wT4Nk/PGLhzituE4OEN3UZZ4rr5oOZOCvbfhIPuSuFMp4pkd0Bj1Qrrm6q1fwpD/D
	 xpeuYb40qMpX05hEWUBW+fKEj4IBxb0rINWkFZxFRSVEmJ2iKM+VX/DxaaH23AlAo24AI
	 ZumMV6hVYPBLhrup5ivNHCj64e03NSZx2joJq4U6QQPoPC8C7BOJVRTXqHoQmJ9Z3Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=n+j7JQq7bAOQ9NxHtgY5eV6al7EOgUbRC6r9lYqsMuA=;
	b=yaWZGiwuoT9wwlCTJgUDtR3Cvm+RnJ6ufHOD0CYoUgoRshLF6/3ghjeEGs7MhTyW2q6H
	 G4RMLWMfmkmju3lmOJh4ABjEdNXvcnlQFbrjEEyXBIX03QVozKRFusurs5F4/53eBLrC7
	 iOQJYV16xdG2iwq461eErmLL0sg3xvhK/YtHVmpJKVIWkb9zshzL8mIEkxzY0jUSYQLMm
	 lt2grsFcx1Dt5oLelYL719Eb/G8fCnjAo38/FsTmR8ZIvVMEixq5G40KBXd6nL0ZJSHdc
	 zP4/bn6JCzYnFVGZCXHccuXlUiiCx41kWR4C8MvZu3ka9FEJyrvTFqho9WcunZut1sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hikikHO0;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8B6606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8B6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hikikHO0
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so514285466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432738; x=1796037538; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n+j7JQq7bAOQ9NxHtgY5eV6al7EOgUbRC6r9lYqsMuA=;
        b=hikikHO0/Qr+DQGH/tjQXUySPDxBfZpQVvuAeh3OyXSfn7uTLmXeK/Pady0kV6wT+W
         3elifHvG8BNve0KnHpgcorUmFjqiRfa5GM9Lp2UiAAmT/x+MfffpB9PNaizGf/Ir2wMM
         lMzzx8fARAo26MLmpnFldleUZeZ81xxqVe2IJGiZPtc5WRNRH51gK9rQIO+i9HJGoR9k
         Kpp0kvZxERAJq98BbpdhMCSBMJK++Lt/OUvKs3++A6Vc5Rz2JzcnCAuAmE4JspZcosYs
         xBN8mH7DK8Iakgu4ArmYv2K6Qy2tbyh9ZyuH3hqdlB6/x8SL5OnALjt2bGEhsqZPSfXy
         dFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432738; x=1796037538;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+j7JQq7bAOQ9NxHtgY5eV6al7EOgUbRC6r9lYqsMuA=;
        b=Hv0FiNHWPw/BBFGkFHkqiAMOgvojAxY6JHO6AwDjdeffTpoO/npQlswrFqnXRioKR9
         Fg2hFdDXyno/GQWH886DzDTmlaeda6UgLYtE4p16sKoBgQvuY4kY9O2lOoREwypjTeWC
         45gmgacmvBX8ltD6pPC3rlfvIhNhlSSMG9UDAjqHxeibmcEb1VpKuykYpXKlJoprXP1j
         FRDxzw+GrXoQuXGn5X0vbU2YXYyX6CmWuAAHuMwrNuddyWCdbpI6txivSw+4vP2kXJaH
         Sstr7qEkcFzrX8aiq1EGvhnlx8G+bwVE4kp9O88b+04DWYCR2mAtjfLEhb5jEntsLg+Z
         KSdg==
X-Forwarded-Encrypted: i=1; AL+hErFaR8wpc+ZosisrxmMYlljgiWj/xwNHdd/A5EZpZ6vNNcOwGnlkd1Q0x/tx7kmHrmnlboqxHXQxNREcE4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qxUyk4RNrvSjAJRuKpb1hYZzFljlO2PjfFyb40Iu2TIJzKO2h
	j+beh8gT4YkviVpwrjEtYoCReNlgZPHzu1iG+SNFZgL3WSq1m+tTOvrL
X-Gm-Gg: AZFdTZczWLCDKzepxsKXyNhocy3sQvQy+ZOChqtJZpoVHIQ4p+2NVTM0zPmlHI38erN
	lzqVidBlkg4zrLu4WqY7jT5k85R/qc/OMCXQD7jDLc3qzWlk6h0l/s+c+YDWKPDHFXosNN7gg9P
	gDxtaWdnK90v3PV6QCYUG2qwMtlvVxvtB3iGGrtLifkJpO+bLygRtnJE+QT+pvalP5J5e9GuW0C
	OjHYyIh+7GVCAiz9ttVjKqV09VtRgNil6gxkxv3tuh27RjV5tHAlAjEQY+F/n/je7IVWzWsGZDK
	RnzmR8QlPNx2w2TY+I/isjI/9Ukrjr7mfI5Rcd74ZoCkz+LagumbsGvqSlci/2SzFlWLenndiK6
	42qSC+5O4/nFi5WKAPTWH8e1SSuMRRZtH70o2IxvEpZtHLv4D0BoHdOo9Y0qdVt8CUoUp0ooqeh
	C4sg0j05iO+ptbfcbMQlu8t/4ldr1QU6k0G3zCfJCkdhF76ls5hIKBDF2fz2hrwhU/H4wFYY1Mf
	3522qNZK16DAK7D49e6ydzXXEF9a2oOz6lKyhlnBU0g7Rz2STybo9/IbayUWbGrsC9AvzebC+aq
	Lm1aw5Z0mU/aX4PdPXirwHXVL+x4eREE+ShwdnKdbzLcnJCQqwdbG9V1UDhq+ulUfw==
X-Received: by 2002:a17:906:6690:b0:c4d:167d:dcee with SMTP id a640c23a62f3a-c513aabb216mr686937766b.40.1795432737778;
        Mon, 23 Nov 2026 03:18:57 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:18:57 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Subject: [PATCH v3 0/7] arm64: mediatek: Add initial MT6895 and Xiaomi Poco
 X4 GT support
Date: Mon, 23 Nov 2026 14:18:33 +0300
Message-Id: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Py2rDMBBFf8VoXRk9LMkypfQ/ShdjeZSo+JFKi
 mkJ+ffKTqBNlxfmnjn3QhLGgIl01YVEXEMKy1yCfKqIO8J8QBqGkolgQnPOGQ1zyAFGOmXdWkW
 5Rs97DuiVIqV0iujD1w58e7/ldO4/0OWNsl0cQ8pL/N4/rny7u8OZEpxpIWolpGkM5RQSjAPWI
 /LXwwRhrN0ykY26ij89Lv9LrYIy2kDPAKwHaR/q15tVxM9zWZtvqmTClGBf21XPd25LT2F2OT5
 ymRGta3AYHLhf7ss2rYeEtIQp5K6yzKI3YEEyD1xa1BaVUig107plXjkHxghdjK4/QrqXzIcBA
 AA=
X-Change-ID: 20261110-initial-mt6895-16ef1b1aef55
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

This series adds initial support for the MediaTek MT6895 (Dimensity
8000/8100) SoC and the Xiaomi xaga board, sold as Xiaomi Poco X4 GT, Redmi
Note 11T Pro/Pro+ and Redmi K50i. It is enough to boot to an initramfs
with a serial console, CPU idle, the CPU and DSU PMUs and the volume down
key.

Dependencies
------------
The SoC DT describes the pin controller and the board DT uses its pinmux
macros, so this series depends on the MT6895 pinctrl series:
https://patch.msgid.link/20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com

Bootloader dependency
---------------------
This was tested with a modified LK bootloader that is not public.
The stock LK cannot boot this DT, as its Android fixups expect nodes
that are not present here.

The DT relies on the bootloader to:

 - update the /memory node
 - add all firmware carveouts to /reserved-memory
 - pass the command line from the boot image

The carveout addresses are therefore not listed in the DT, as the
bootloader allocates some of them dynamically. I can describe the
fixed ones in the DT if that is preferred.

Firmware behaviour
------------------
Two things in the stock TF-A affect what the DT describes, but not the
DT itself:

 - TF-A rejects CPU_SUSPEND for about the first 40 seconds after boot.
   The vendor kernel lifts this earlier with a SiP call, so with this
   series the idle states only start to be used after that time.
 - The DSU PMU registers are lost when the cluster powers down. TF-A
   can preserve them (PRESERVE_DSU_PMU_REGS), but the MediaTek firmware
   does not, so DSU PMU counts are only reliable while the cluster stays
   powered up.

Testing
-------
Tested on a Poco X4 GT with 8 GiB of RAM, using a minimal config and a
script in the initramfs. The results were:

 - All 8 CPUs come up and match the DT (A55 on 0-3, A78 on 4-7), and
   CPUs 1-7 can be taken offline and brought back through PSCI.
 - The cache sizes and geometry in sysfs match the CCSIDR registers on
   every CPU.
 - The redistributor is found for each CPU, and timer interrupts reach
   every CPU.
 - Once TF-A accepts CPU_SUSPEND, every CPU enters the CPU and cluster
   power down states, and the system timer wakes them up as the
   broadcast timer.
 - Each core PMU counts only on its own CPUs, and its overflow interrupt
   arrives on the right CPU through its PPI partition.
 - The DSU PMU counts, and its overflow interrupt arrives on SPI 18.
 - The pin configuration of the UART0 and keypad pins matches the DT.
 - The volume down key reports presses and releases, with no bounce
   through the 32 ms debounce.
 - UART0 output works at 921600 baud, and its TX interrupt fires on the
   expected line.
 - About 7 GiB of RAM was written and verified with no errors, with the
   carveouts added by the bootloader.
 - The watchdog resets the board once it is no longer pinged, and the
   ramoops console log survives that reset.

UART1 is disabled and was not tested. Only a minimal config was tested
on the device, not defconfig.

Tool use
--------
The commit messages, this cover letter and the test script were
drafted with Claude Code (Claude Opus 5.5). I reviewed them
and tested the result on the device.

Based on next-20261120.

---
Changes in v3:
- Drop the watchdog binding and driver patches, they are now in
  linux-next (next-20261119).
- Board DT: use a zero-size placeholder for the memory node,
  instead of hardcoding the size.
- Board DT: order properties alphabetically.
- Board DT: drop Angelo's Reviewed-by, as the memory node was changed
  beyond the requested property reordering.
- Rebase onto next-20261120.
- Link to v2: https://patch.msgid.link/20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com

Changes in v2:
- Describe MT6895 as Dimensity 8000/8100 in the commit messages.
- watchdog binding: drop the mediatek,mt6589-wdt fallback, as the
  MT6895 reset layout is not known, and drop Conor's Acked-by.
- New patch: add the MT6895 compatible to the mtk_wdt driver.
- New patches: system timer and keypad bindings, pinmux header.
- SoC DT: add the cache nodes, CPU capacities and idle states, the CPU
  PMUs with PPI partitions, the DSU PMU, the system timer with a 13 MHz
  clock, the pin controller and the keypad.
- SoC DT: use IRQ_TYPE_LEVEL_HIGH for the architected timer PPIs.
- SoC DT: order the nodes as required by dt-check-style.
- Board DT: add the UART0 pins and the volume down key.
- The series now depends on the MT6895 pinctrl series.
- Link to v1: https://patch.msgid.link/20261105210622.523747-1-asalde.le1@gmail.com

---
Alexander Letuchiy (7):
      dt-bindings: arm: mediatek: Add MT6895 and Xiaomi Poco X4 GT
      dt-bindings: serial: mediatek,uart: Add compatible for MT6895
      dt-bindings: timer: mediatek,timer: Add compatible for MT6895
      dt-bindings: input: mediatek,mt6779-keypad: Add compatible for MT6895
      arm64: dts: mediatek: Add MT6895 pinmux macro header file
      arm64: dts: mediatek: Add MT6895 SoC
      arm64: dts: mediatek: Add Xiaomi Poco X4 GT

 .../devicetree/bindings/arm/mediatek.yaml          |    4 +
 .../bindings/input/mediatek,mt6779-keypad.yaml     |    1 +
 .../devicetree/bindings/serial/mediatek,uart.yaml  |    1 +
 .../devicetree/bindings/timer/mediatek,timer.yaml  |    1 +
 arch/arm64/boot/dts/mediatek/Makefile              |    1 +
 arch/arm64/boot/dts/mediatek/mt6895-pinfunc.h      | 1524 ++++++++++++++++++++
 .../arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts |   87 ++
 arch/arm64/boot/dts/mediatek/mt6895.dtsi           |  461 ++++++
 8 files changed, 2080 insertions(+)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261110-initial-mt6895-16ef1b1aef55
prerequisite-message-id: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
prerequisite-patch-id: 68c077b6ff907e42d02115ed9b95bb5349eae7ef
prerequisite-patch-id: b404409a8981e9d462b7fdb6eeb092c69bba50bd

Best regards,
--  
Alexander Letuchiy <asalde.le1@gmail.com>

