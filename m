Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202476;
	b=EBmUyCSAiaa8gwELF9LRTFSKw/ysJedH9EK8K4YtqkapW1jY0axl/O1YnhyKKT1PH+ck
	 RzVQL6Yp4Be0Nchm+P2O3AQSwi+tKSTNyy03s7v13cj+NTCuGxpyaSR1xu73h6PLc7If2
	 660hnLFegxIBj+Y99CXkXkgJdxfWrpYdUl6AgF7JNgMmTTJEbx19gT3167JSx77nV/AWz
	 8zCrsjhjlxNGA6OiezH0rJqKW2F10QBwh9gZiMjndEA7KUu2kXXZua+Lv/VZQUBIjV+3U
	 MiyxqlZvMqXBg/kWIE+w369r8CAamjJjvfeBE6Oy5vojDm7LQVX0BtnizHyaHgVFPow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7WdPVPrqEAVCZ0oTAu8C9RoFpPGs1RbxvC68iYCtVl8=;
	b=NSpwpPIkNrGe0CoTXzAcCMeBvI2BnIWS80+sk50dr/STk8sLSUlqEW1YxC8xC8nWRkjz
	 UiDNNeupKl4HRgskUdQb3GpKZ3lf7iLV0JNheH3xDoOKLFVANDiZfz8EVpNsaqRBPLr0t
	 MvnqDMEu2NJIHE6IJnwVYi1wECzJDIu/FksvnMvmgd7e8B3YWv0uVqR3ImabuxPhGG95x
	 CUykQ5PpD0/CC2N09o//6mj48ZGX35zPdhgU72Ffs4IV1nBskjYEHVwZufmXwcg2IluMC
	 I35+3qxT5MYWRIP602+x7G+0Kk17FNESyb+ps5CpXWKcxZGWGrvYmHVOQaLxzKRa4DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V8ekLW+s;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C3D60A2606
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C3D60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V8ekLW+s
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso9887025e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202471; x=1795807271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7WdPVPrqEAVCZ0oTAu8C9RoFpPGs1RbxvC68iYCtVl8=;
        b=V8ekLW+sQq4tPZ3ynI7cvdrRVFl5DMgBTBdJtUZtvvVjISp9cSK5pi9wtfBwU2IwD0
         8IGK1TVb0reqfmIgA3I+aqptYIz1dcSI561LTfsLvvuGEYGTTqGAb7lKWAQ5Cx4nMS+y
         9G+NJmtMsRwDz2M+l8O4tiGiXXzO4ZZ8U9/KgWJHYkrx0g1NDcwxh70ZWKoVEAmb9r8c
         jLF9I3uQjeEMDo0v/9foJyPxhcRHFAvVfYciLEyV6WtZ4kEIbb1gOK3itA1Eu25cIjCv
         TPbXpBDsiJUO+a5Ze8JSlHG/dYrpndx6hl1kJ/rx2md+Lnm3+YakQ+SoCJwT79U2HEDA
         BE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202471; x=1795807271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WdPVPrqEAVCZ0oTAu8C9RoFpPGs1RbxvC68iYCtVl8=;
        b=eqKZlgW09XWr5drOFjR7f4leOwWafpvtuhMXjdObK3nEgXdWCbUtVHMTiPoZ0YHNSl
         O/rEbYShOjmjMaz05b77mI5RQ6CdHsR1UrshI9x5D4Mu0AzaWxgBemD2Q4MK5qPy90Pg
         CNoO9xYxS8xW5PvnRkmr5BYaSvqcTF0pFXlm+9YHDeM+eyc50VcuSq9e/++VK4sWEYKV
         xhCFAQPKtr1vI0Wb7Jhk9D6YqopwywZoQxm4Q56w2SmgiemwYlavmdeoaktW5ORF5uei
         zf1P4y1W77C55N9UI31/bfau8OQr05wk+NeymdgkoQPvadLT+sgouwbaNo5N1zZ4rcok
         ESMQ==
X-Forwarded-Encrypted: i=1; AL+hErEHE9+BtS3YwO9WOQyLXgdM1di4LvH19qSt0X1Yv7gsC+U+QYJoaLs7y6cTyceZzAwx1bizFKM16CBKxM4=@vger.kernel.org
X-Gm-Message-State: APuU4Z91Ar0xLil3K3rIUmx19hPoSsg7F7Z69lq+j9ku5aiDEdpOkzId
	3SeTPYMQmV9J0pbVPrHQMf0SfgLpOsNgoZw+3uWTsUm7SgGLrjQnRj4P
X-Gm-Gg: AYBFou2L8F2Rs+ZsuwNISvlcrNgc3VQj+QYyfQMcZs0IjfYu7S/guhBhoHRh3H0CwYm
	ZHwGerl5FF1rzo2sMfcdm9HjXrfgzxd8be5AmbayoWCKwkBV58Vw7O6C2Anr5ZvvVqlPtIHgBDQ
	WqdpItFvDcWq8tvDtoYNRTBQTjH1Yl5s0fN9IIeflkSCDmB7YcogyYj/4aL+5jUk3q7/J2Iq1jK
	VQwMam7tx2IapmyiKxafow07vjrkSeo0A/j3/ZJYCPBE8WPRxmiEpCwElCywEFW2nR/VloOonCO
	oTGracDn4SGs0FcmWN7a9Jupg9tE7ZrG7jy0Lw3g9U4Q7t7gAxhTCtU0RwsWwIBjC+USfcc4jdt
	qdqa6PV9idQquxLbkT4wo0V76bDkfZ9d7i9lW4invSI+KhVqlI+LG/rY7By9fZb7GxTGaVCAewb
	2yqXMvXrrQAcz6vS3gm7+0Y+RoO/8TlO1ZJa5PUpRfyb13IZhjpxDMD1vwENMTPW96XPXGKmz02
	Iw+7Mdzm8NuC1anmFTlFmnBvsUk1eLMnav4qGfkr0ZXL3L7O55mmFd6TOlBtYxM2/yqW/trc8R1
	q8it/yiaNzowGSHpkt/WC8ZmNeFhMqUjPTvB5d8VlHgzKnUrieUyLmpaPOaaqQ==
X-Received: by 2002:a05:600c:19d4:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4bb8880ac6amr96586425e9.10.1795202471009;
        Fri, 20 Nov 2026 11:21:11 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:10 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 20 Nov 2026 22:20:50 +0300
Subject: [PATCH 1/6] dt-bindings: soc: zte: Document zx297520v3 socsys
 controller
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-zx29usb-v1-1-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7623;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=NdfxG+rjqtXpuMXB6FHKcGgU0zKZ4pW041ggmfB9o7E=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2WVW5e1KPkQL1gQ9ewMRyMEsKrrUGaOVV+J
 E4z6Uz/UYqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKVqg//Uy+x4EEaYrDpooZbWoCBB9I052DMyfA
 RTFbDzHKeZGrNXnYhcdCJs0VTL8EriH9BfRET0/SkxeqQ5Q13T1QGDXKNUWrYdhYjCHELjNeatj
 OTFmFwSGcDU4R9PA5hE31PSckAXrDzzJ5HJP7n+BALE0RZYmQiNmIOs6XLs4P5cMdKZ9skDmb6j
 U5RrAWXt6MMRaWndbLC2e4twXHhCVoaNshzHwyxR/rqfqz/+1tC1xiQa18vO7HyGvL4tD+xS9HU
 8o9HXruAjlHF2TgnOSFyh7KL2cwFv8Dh94MJnf0S+4coGZ0cbJx4BE3TbyvtGiFgMJEOFjqFq/m
 ysCz5R346kum1NQMYBNu1JRWNAM9FKWG3pLfgPpTS2pFSxCBLVNgtEhUJ+/Shoy2ndZDniNEQ/a
 ddlR2tvnj39IGnnlEooP3GD0Stsbz6mnHVa2RXCRpTYLS/Rqr9zoiPrSE9X9F1M0BhCcSYwb1Hj
 M/wLT1lSEZ/oc+0jPXqoGFDYK8oUjjj3vXgfZhKz/8IPcTvdyNtm3bgy+uaM/DYIDkMUC5Lnwip
 5e5rnXm1A8RU0Ijmc/2MZt4SzscvNE85ggrV6Nbrx4x2G1ilD3/3vbdwRbtPLQ46JTl0khwWfn1
 ZsWy/8B+CLoVnYIvWyqLAWgMXQnhOKJ3SYnzmllKjrnoTwMsOLVI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The best way to sum up this controller is probably "misc". ZTE probably
put everything they didn't bother to put in its own mmio area here.
Documentation in ZTE's sources is very sparse and even the blobs only
touch a handful of registers.

The controller contains power controls, resets, DMA multiplexing,
auxiliary USB phy controls, i2s controls, the proprietary DSP boot
address and many others.

For power controls I could confirm that the USB/HSIC and a GSM-related
controls work. There are 5 bits mentioned in ZTE's kernel though and
there is a second register that is used in a very similar fashion by the
LTE blob.

For the Ethernet PHY reset register there are 5 settable bits,
but only one of them produces an understood effect. I am using
reset-cells=1 because it is likely some of the other bits have an actual
meaning.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

ZTE uses the name "SOC_SYS" in their downstream kernel. I am not
particularly thrilled by that name, but couldn't come up with a better
one yet. I am open to suggestions

I do not want to commit to exposing the GSM related bits as power
domains just yet, so no handle for them is defined in this binding. They
are inside the RST/ISO/PWR registers just like their USB counterpart,
but the PWR bit does nothing and the client driver will have to assert
and deassert the reset to wake up the hardware. This is easier to do
with a reset controller than a power domain. The ISO bit kinda works
though, so I can't just pretend they are standalone resets.

The hardware behind the GSM bits has a self-arming watchdog. After
2.5ms it puts itself into a broken state and can only be recovered by
asserting and deasserting the reset in socsys. Like almost everything on
this board it is enabled on boot, so the client driver needs to assert
and deassert the reset before touching it.

How much documentation is appropriate in the binding .yaml? I want to
document the identified registers *somewhere*, and since the yaml lives
in Documentation/ I put it there. I do understand though if the Linux
kernel doesn't want to be a backup SoC datasheet.
---
 .../bindings/soc/zte/zte,zx297520v3-socsys.yaml    | 100 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 include/dt-bindings/power/zte,zx297520v3-socsys.h  |  11 +++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   2 +
 4 files changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-socsys.yaml b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-socsys.yaml
new file mode 100644
index 000000000000..094409c72333
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-socsys.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/zte/zte,zx297520v3-socsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC miscellaneous system controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This controller contains registers controlling numerous components of the
+  zx297520v3 board. It is poorly documented by sources available from ZTE.
+  Information about it has mostly been deduced by experimental testing.
+
+  The device contains power controls for USB and at least parts of the GSM/LTE
+  stack, a reset control for the Ethernet PHY, DMA multiplexing, I2S controls
+  and additional (beyond power) USB PHY and controller flags. To round it out it
+  also contains a flag to bring up the SoC's Cortex A53 CPU in arm64 instead of
+  arm32 mode.
+
+  The "include/dt-bindings/reset/zte,zx297520v3-reset.h" header contains reset
+  defines for this device. "dt-bindings/power/zte,zx297520v3-socsys.h" contains
+  the power domain defines.
+
+  The following registers are mentioned in ZTE's kernel and U-Boot code dumps:
+  0x0:
+    Bit 23: Boot ROM and sram2 remap
+  0x20:
+    Bit 13: A USB control "USB PHY COMMONONN", but without noticeable effect
+  0x40:
+    A mailbox system to read DDR mode registers
+  0x60:
+    I2S configuration
+  0x10c, 0x110, 0x114:
+    Power domain controls: RST (Reset), ISO (Bus isolation) and POWERON. ZTE
+    names devices "RAM", "DSP", "EDCP", "USB" and "HSIC".
+  0x120:
+    DMA channel multiplexing
+  0x150:
+    Ethernet PHY reset
+
+  The following registers are used in ZTE's power management and LTE blobs:
+  0x14:
+    Likely the ZSP rproc entrypoint
+  0x180, 0x184, 0x188:
+    Likely more power domain controls for LTE hardware
+
+  The following have been deduced by testing:
+  0x20:
+    USB PHY and DWC2 controller controls:
+      Bit 0: Force PHY into USB 1 mode
+      Bit 1: Unknown
+      Bit 2: DWC2 controller endianness
+      Bit 3: DWC2 DMA endianness
+      Bits 7:4: PHY clock adjustments
+      Bits 9:8: PHY electrical configuration. Setting them both to 1 allows
+                operating in host mode.
+  0x24:
+    More USB controls of unknown nature
+  0x2c:
+    HSIC controls mirroring the USB controls in 0x20
+  0xbc:
+    A53 mode controls. Setting bit 0 enables arm64 mode, others have no observable effect
+
+properties:
+  compatible:
+    items:
+      - const: zte,zx297520v3-socsys
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#power-domain-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#power-domain-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/zte,zx297520v3-socsys.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+    syscon@140000 {
+        compatible = "zte,zx297520v3-socsys", "syscon";
+        reg = <0x00140000 0x400>;
+        #power-domain-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9b6a2da28aa5..ab8797b8d0a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4033,6 +4033,7 @@ F:	Documentation/devicetree/bindings/arm/zte.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
+F:	Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-socsys.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 F:	drivers/clk/zte/
diff --git a/include/dt-bindings/power/zte,zx297520v3-socsys.h b/include/dt-bindings/power/zte,zx297520v3-socsys.h
new file mode 100644
index 000000000000..fb54e5deea2a
--- /dev/null
+++ b/include/dt-bindings/power/zte,zx297520v3-socsys.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger
+ */
+
+#ifndef __DT_BINDINGS_POWER_ZTE_ZX297520V3_SOCSYS_H
+#define __DT_BINDINGS_POWER_ZTE_ZX297520V3_SOCSYS_H
+
+#define ZX297520V3_PD_USB	0
+
+#endif /* __DT_BINDINGS_POWER_ZTE_ZX297520V3_SOCSYS_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index b21d5901a7b9..7146e479695a 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -59,4 +59,6 @@
 #define ZX297520V3_TIMER_L11_RESET		16
 #define ZX297520V3_TDM_RESET			17
 
+#define ZX297520V3_ETH_PHY_RESET		0
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.56.1

