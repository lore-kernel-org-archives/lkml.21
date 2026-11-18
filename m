Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028384;
	b=OMdxeX3bETZKr60VKIlnNRegdPD34M4opSWvCNCLPnYJQffmcRLCBa9HcxP2RVQfIrTg
	 9v5bDH6cEBNggQieJZ0mQL2CKOmoZrm0KRjh2rgsAehgzb6AyWmpuAPpEoSPbCYS2O6vO
	 Gt4NnEgeOierAY/ndsshw5/fj9pJV/NnxoboDlONGjAcSx27luVrV0FDvDBY1s3fyaiu8
	 P0ULT5m2+olafT5WRvh76UHOWGHyGttOSx44909F/XbF9DWaO9aMTPM3SFVyQxZHDRGQJ
	 eio7+UujaAdyV48mQt5Br0WJAmbnV2rwPR1ODzPuUCIE2UN8pIkiOuzIV1m1RhNuuqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=BZqKXVZqiOGdZEu0WGQ7on18pEUQ1o2hqL4+MiKX9BY=;
	b=jPySTN9Oc/KdTiOCvgeyPfyGc3oh+Qmu5YHC98dzIgkETVRevxauBolU8PKpid7uxq8u
	 2CHz92gs1kfb67qeYLBfTwTHy/0x+d7mIw3LY63uvZOcWxio6t44eopHdVVFhLVxxHr9j
	 WCWlkCGVW5XTuoUM8cTDDmnhHC/PH3ccW3He+8rkcM95vUW68O8KfvmDZArsD6Ox5fTwk
	 HnMrXxkFVOBc39m47W4Calbmt0YRipyneNEzgbHUuMzlZXZ/O7AjtLRzT9PT/tbLgQUBp
	 0CbEwujrn89I2Dws6vGjuKgQmDOkqW4jAMdQ20r0LLstlte8srvDGd38eeySrSoX0+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxSjKTO8;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEEE606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEEEE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxSjKTO8
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso20960625e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795028382; x=1795633182; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BZqKXVZqiOGdZEu0WGQ7on18pEUQ1o2hqL4+MiKX9BY=;
        b=cxSjKTO8m8YacboRtwHDDZ2kk5Pymo90ixZPv8IxdXiPCdTtvYbd73qKU0sElrEcxG
         rEl8W6Jeu86MdEqm/63+2aVHR8cUBipadrwAcm8D4RRGQKagu1wkryE64MDlpL3zjIPs
         xMU7SnyvUGJCjvP3znCbHXg2f4JRGMel4aQ+Rs+RGZyqQ3eQ09dsMt26LRpOoSSp+KpB
         QL0uAZIB46UlSulE8JYXqNexbBgNITRxYFc6Akvktd4OCyklLYKYJwBAuUN1LMNpjC+Q
         Oatbw3tDllQ/YPlKHA9PCJJwD3iIE3D845vHaswq6eKOayc7j0F5IXUAVkb5jaE9hjll
         t4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028382; x=1795633182;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BZqKXVZqiOGdZEu0WGQ7on18pEUQ1o2hqL4+MiKX9BY=;
        b=stLEiA83WJBUMp5mnkEsc/B5LBJStndRL4CjmMLDPR7wVqbKgVSi96CjfHdVhfdofW
         8fvpeoIv4tHYjrNiQ76WJbZYJlyMmFVsd0ckjkF1NSY2t9Yv6TItkONXR7AUKC7zLFyX
         CbdL6gO1tWnHFEGKo9HIq7fEarGp4BkNfMtOsGWQDjwJLkoEyJNpjw13MQkZqL6aD+Sz
         YEOMHGcOllVnzNcwkwj1Wj8aVcz1anbqWHdxPPLu+WLs1aOWrVma3hJm/kh0k6Dm35sY
         Ux94bacm+B/fwvx7hgfvV9RTsZIBcqERorARCGUWxPrDRTQBzyR9GwiyNGt+cjViPIUM
         whhg==
X-Forwarded-Encrypted: i=1; AL+hErEdJY8dF/QIzhVKVuNsfjOWSTBQH5wUnPHswNRN7WWFLGWl27i97NNuDWr4JNxazYz8CP8BQ8tku5y1KsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XNfEJIKnvklDa9w89N9jQS0enu7qCscEZj/FakUiCWmmd94IM
	n5YiZToWqcBGUBdAfp+pnJEuEEydY09nbBxrPSuti5NwJ7MiLb91nA9U
X-Gm-Gg: AYBFou3bR5r0ZFx3UmFppJx30lCx/iUdlNKBNTrzqtqmgBnnr/CPIABv6tu/evZ0BAS
	pa6TnUryS4M2fanlzZCw/2lIvchD5iOlt4XHkqGwdzP9hFeU3cdEjb481TjqgnCoaSCxzlmLfMQ
	PAFcig2VIN3SXb8lyfJxGEH+n4h1ttG5MdSJ64MSNfmZo9Ss8e25m+JDIxi8B6+S+Nyyvvmuizd
	75UVXO0FJ5gBfaZD07tjwb8mnMfJsB3/9wjrUV19BNxBE5hRmhfvW/ntAE3aEaQaaumwuTyy9DJ
	+Z6PPJIeAOiGkY5BJje01yYiZs/7jUmD6xIALA21gtAGzMQr99y2Nc54PgVXg4oeKPJYDAd1DYN
	JUZXzPO9MGmw/dTD5IX+t5W5rddmPxHQ50VNKMeyLg8idsHkV3wMMlxr5lxIb0kpNIDaIGxpd5/
	WY3pAqn7ExWM7RDDMZ8Utwfpc6WuIFGNPDIsgKuUGWi6nxJr8xoGRB5Wyr17/1+i093C3RX2ChU
	zd5VKlQMzcUJGPP36s2fVfFJ5Xonrt+mFEJeuxYHnrXJhpl4ImU8YlGUXLhO2WCXhoBuI/FoMgR
	ZkaaX+qm7bwcOm7SM7TDVFUhhwe2+fg8Sv9jumZM3Ht+EejFXyxrf7IamjR/Kf9hPhVJ1qA=
X-Received: by 2002:a05:600c:46c7:b0:4bb:76f6:d23a with SMTP id 5b1f17b1804b1-4bb7da45409mr75914615e9.21.1795028381836;
        Wed, 18 Nov 2026 10:59:41 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4e670dsm95966965e9.1.2026.11.18.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:59:41 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 18 Nov 2026 19:59:01 +0100
Subject: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device node
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
Message-Id: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WMwQrDIBAFfyXsuZZVq7Q95T9KDhKNWWhi0FZag
 v9e462XBzPwZofkIrkE926H6DIlCmsFcepgnM3qHSNbGQQKjRcuWYiH3Yj57c1Q2Ku8Wa1QT1A
 vW3QTfVruMVSeKb1C/LZ65odtIY5c/YcyZ8hQKq2N5nWx94uh53kMCwyllB/fEJ7+qAAAAA==
X-Change-ID: 20260413-orangepi-gpu-02d839d6506f
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3

Add PowerVR Rogue GPU device node for SpacemiT K1 SoC.

The GPU is integrated within the SoC and enabled by default.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
Add PowerVR Rogue GPU (BXE-2-32) device tree node for SpacemiT K1 SoC.

This series depends on:
- Yixun Lan's power domain series [1], which provides the genpd-based
  GPU power domain driver required for proper power sequencing.
- Baihui Liang's dt-bindings patch [2], which adds the spacemit,k1-gpu
  compatible string to the img,powervr-rogue binding.

The GPU firmware is not yet available upstream. A copy can be found
at [3].

With this series applied on top of [1] and [2], the full GPU bring-up
path works end-to-end on hardware:
- Power domain: GPU power island on/off via APMU
- Clock: GPU clock enabled/gated through CCU
- Reset: GPU reset line deasserted
- Firmware: PowerVR RISC-V firmware loads and signals ready
- DMA: dma-ranges correctly maps CPU-to-GPU physical addresses
- DRM: kernel exposes /dev/dri/card0 and /dev/dri/renderD128
- IRQ: GPU interrupt registered, firmware watchdog running

Userspace rendering requires Mesa's PowerVR Vulkan driver
(imagination-experimental).

[1] https://lore.kernel.org/linux-riscv/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org/
[2] https://lore.kernel.org/linux-riscv/20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com/
[3] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blob/powervr/powervr/rogue_36.29.52.182_v1.fw
---
Changes in v2:
- Removed board-specific enablement (GPU now enabled by default in SoC)
- Simplified commit message as per maintainer feedback
- Dropped redundant status = "disabled" from GPU node
- Link to v1: https://lore.kernel.org/r/20261015-orangepi-gpu-v1-0-03566a615660@gmail.com
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..7f2573d869ca 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/power/spacemit,k1-power.h>
 
 #include "k1-pdma.h"
 
@@ -1119,6 +1120,16 @@ multimedia-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x0 0x80000000 0x1 0x00000000 0x3 0x80000000>;
+
+			gpu: gpu@cac00000 {
+				compatible = "spacemit,k1-gpu", "img,img-bxe-2-32", "img,img-rogue";
+				reg = <0x0 0xcac00000 0x0 0x80000>;
+				interrupts = <75>;
+				clocks = <&syscon_apmu CLK_GPU>;
+				clock-names = "core";
+				resets = <&syscon_apmu RESET_GPU>;
+				power-domains = <&syscon_apmu K1_PMDOMAIN_GPU>;
+			};
 		};
 
 		network-bus {

---
base-commit: be95fa81c04dd67616faaa2872babb9ac39d4251
change-id: 20260413-orangepi-gpu-02d839d6506f

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

