Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111756;
	b=ZOqOsJpojMfgB14ai+zuudR0Lk+fn0L0E2t11BIvFSe4RUFXhPivpjS7dYnwpLCsdzJX
	 Il8E8Feq9lX17LfpUV9vTxkw+RknirrJ1VOYi0cM5+bIEuvzwr+zgLCNQxa9CHikgbLR4
	 wAiKVYsJK4nT4fkYeBUQ9ct3csVhX1Ad4ZGfhGsaLGvUPSypD5GcDaeE41twFTq9R6p8s
	 F2kOU+GICZQEEtx2OfUzG6DMd9Db91c2Jiu0/2yZ6GvYe8FsIG2DHCQXHKasihZTdMkJE
	 09WeRhNMhcippkw9nIUijiEC8TEv+nnufHxF8ORadijvW6jQkFMr53dmlLxhvcLvR/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eqGeXaKgskH76AWGvxlQS6K/15vXQQ9IhK4LOBED4PI=;
	b=vuKu0dyDeS3u2jITG+0cQZbN1ZB8QQqhmb98LIYe89znkmF8azhafKwJxmtsGQVCc5cH
	 Gjeu2zrONI04S468qKYDwu/QUvzmVBYWwFBc3rZlqpYWCgE3BbDBh45Ta1ovzeUT+a/tr
	 7UauM5Yvsx3pb8q3qJ+me1P7pcljO9fGUgvytoCFy0OtHYwrQ3gwBck4CE01KWJT5JBnu
	 /LmI9Toj2pEwPe40TQeGV3T1pbTa4S37t+S4x2aYwJ+lXv57vt8g5KcHej9u5uj0uKAu4
	 b/5Y8I+mMwFt+BAMgfp5OcnVmPz7YYXAGFq9DgYBGS17/A9XAEVmf1fOcwQTYtclBdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hv6TyWgg;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B61606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18B61606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hv6TyWgg
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-48ed0b68895so89796fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111755; x=1795716555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqGeXaKgskH76AWGvxlQS6K/15vXQQ9IhK4LOBED4PI=;
        b=hv6TyWggD0il6OvPOSZjruj4SbRvPRlqpZjDRcNFCT5JmoYcUt6tARO3G0IJ+yfiQJ
         GV9yMQ9fS+/EVJZM3W9HVCMhh24hiXiPqi0SRoP4xql2QBTC433xdffk+npG/NW8mxv3
         skrOWHFc1XNrFkYzN2dlAFlauEf+U5qdeDEVH/EK1spvBIkh62yDxO+axxEIWZzgk2qH
         xvCtB9OXLnU3rUaXNOK091AK8dZBpLuQ7tN6sCash7hUMD0wXJtSfZaYCEz/QbsyXVzq
         nNonHL0k/yiyxyZVWMbAN6FJyno1I+1aSlKxb48aKAsI1aOc63gIQgBbToOeuGqKA3a8
         ++mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111755; x=1795716555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqGeXaKgskH76AWGvxlQS6K/15vXQQ9IhK4LOBED4PI=;
        b=tfgLE2/k6BOBCN234XMWZUASLSUgBvLBUw6TokIkOiXdv6VPQ7AjTd+Dzzc9+8ATwo
         q6I2xoFSO71dDrdW9f7PsbIbZ9BiFaXs5V2HvwhvRFTTXHwoqbwWf0iiVZfJYWMBsk/T
         ciyrjf4hGLezCpBLgOLrGfJiKu0L7Rf2L6f3RFvMg+71bSEAqOC1EtW7JwjuFmYPcnS1
         KJMUS2dn91VFYYZU6U/h13x+zXrzWmrybqLgf/vN1zb3rzxLQG9CNhGRpHjI9R2ZWIY1
         7qR4aCDiYhyRMvZ8nlf0eGr+6Hm0htfm/CwY5wszGk9Do+lR3QoR9/WhL70MryXhKxdT
         kZBg==
X-Forwarded-Encrypted: i=1; AL+hErEKZMVmZ6ICAw4lJbsKya2fyRhndq6sfVltHwQpMZgfzkxzgoo8IwNH1/jvPKsg0qvsxpxARWnOpCUrx+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N93w+Md5NKueHzCnwBMu8bCRLmTL3/mDzj9/nWHm5ICtFt/MD
	u0+ofvghWjJYzDWRHoFmZbKmthxukO6tPdQyNxQeYR86K8vCRdYjwi4uPuUxY3Rf
X-Gm-Gg: AYBFou1i8mrjzl5oL9Dp3zM9WqLVcoRlwpdKrMXrs4xhS2r8fWDY9CldnRuWmZ71Of7
	TswpO+VGCNgajkQoj+7geyx1JmBlPzoZldv1zKRU4U++mnzCfPu+uM3PE6nRTw5wMLaJNuagc7m
	7fONDqwcYEdh/E+qwQAsgCNe+Hmgn5U6tx2EfbYOyiFOiPx44OKZPT3uGtirPe7WkK+gC+ltNSe
	pJukv03bFE1smkWGTsrCYayeAv13bH2OTrg7NIzDvyFFRd/KThkcwmowfcZVPQgsEfQC9/QuvG6
	2jGkwGOForPBXwR69R6kqhc3ML0Y3DZ+ZRbMTUduYIQEKSyTDsZdabzq2u/SFpbaVgPmHPN5s0x
	Y2hgkqQ7nYxCVS+cf+bn2FumvhK6WPcvKbSjO8/rKrXa7AHibo+Dhsh5u+0D1JPmc2pyws/C7ww
	g96tHVYHZ8l/nuPGywuJbEe9Bkd26gfm2Da6X0VgRnO+2xIGw+4VZFfLAVqiDyKlDJ9Kg9Md5zW
	XiMXOHQCw4iHXbcKupAoO5QHSLRG7iRqNxOxlettxdrb9NkWtWkCCrKAVlS2DbB1ucB8y41PXlV
	wDFzeADVNo4O/V8hYB+RaFGLwdnripsAEytAgeMCvWlcAHdelxPcjExrbKgczpNnyKgcedteP0M
	m
X-Received: by 2002:a05:6870:51ce:b0:47b:cd37:f931 with SMTP id 586e51a60fabf-4bc81aa2294mr384102fac.13.1795111754944;
        Thu, 19 Nov 2026 10:09:14 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60491337sm446604fac.12.2026.11.19.10.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:09:14 -0800 (PST)
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
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: [PATCH v4 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Thu, 19 Nov 2026 13:09:12 -0500
Message-ID: <cover.1795034153.git.enzo.adriano.code@gmail.com>
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

This series adds the initial Allwinner A733 and Radxa Cubie A7S device
trees for UART0, the AXP318W PMIC and 3.3 V microSD.

Base: sunxi/for-next (03b3355ed7a39b4416f0d0a39061479b1aa13196).
Previous posting (v3):
https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com

Changes in v4:
- 1/3: Carry Alexander Sverdlin's Reviewed-by.
- 2/3: Add a one-cluster CPU map and A55/A76 PMUs on PPI 7, using
  GIC ppi-partitions. Change #interrupt-cells from 3 to 4 and add a
  fourth cell to every GIC interrupt specifier. Drop Vinicius Pedrosa's
  Tested-by because of the interrupt encoding change.
- 3/3: Sort root nodes and put status last. Move boot history below ---.

Runtime dependencies in application order:
[1] AXP318W PMIC v8
https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[2] Pinctrl IRQ-bank v3
https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[3] A733 8250_dw v2, patches 1-4
https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[4] Firmware-clock v2 for vendor-firmware warm reboot
https://lore.kernel.org/r/20261112-a733-fwclk-v2@gmail.com
[5] Pinctrl voltage-mode v3
https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com

A7S DTB/schema checks need [1] 3/5, [2] 2/3 and [3] 3/4 before v4.

Validation: clean git am, arm64 defconfig Image, arm/sunxi.yaml binding
check and warning-free A7S W=2 CHECK_DTBS=y. The compiled DTB has one
eight-core cluster and two disjoint PMU partitions.

A November 18 RAM boot on Cubie A7S with vendor firmware used the base
and runtime dependencies above. Two context-only adaptations were needed:
PMIC v8 regulator allocation context and pinctrl voltage-mode v3 IRQ-bank
map context. CPUs 0-7 came online in one cluster. The A55 PMU covered
CPUs 0-5 and the A76 PMU CPUs 6-7; cycles and instructions counted and
PPI 7 overflow samples were observed on each CPU. The timer, console,
AXP318W probe and MMC0 read-only transfers worked; warm reboot returned
to vendor Linux unaided.

Untested: PMIC/NMI interrupt delivery, card writes, hotplug, suspend,
power-off, CPU capacity, 1.8 V switching, other UART/I2C and storage
instances, RTC alarms, EL2/ITS/MSI, and physical BLDO2 voltage.

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7S
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 287 ++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 657 ++++++++++++++++++
 4 files changed, 950 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi

base-commit: 03b3355ed7a39b4416f0d0a39061479b1aa13196
