Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135467;
	b=sSTe6Utr5Pr703gCbav8Zab4nI/VmOBZlAGDM/WWa76GyFNTCOe7uYxXdWrcCNWdklQt
	 JDrpPlnelWvb2qHTSI5wTpknrdHzEDdU5bcrbzvjJ8pu102TdE0KC+rdofMs0Pdta4E20
	 T2zqpkCgJTC5tWBe5qrPfmmC9inhZu9cWrgtzVQsLaJgy2DhDWzS7ye5FEIEg4nPmA/oU
	 j5Rfq6jcaE+Q15bHTY1EldGZZjq1ARsNGUbIPSdxepFSf1oGAsLjSf3nwhuQvzVCjhOfK
	 5x6Yyp5fhzQaiSm9EmPwc1kdJuVTNZSee4mg0TQBZdEJC2ezE4JtSUagqwf2cjAsnzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HAT1U9wNy0EKa5OwUErsAyJuiK065rYrDAt2SMRpc5U=;
	b=FZYGV+vbM0pzLTuudak1uqf9jaTjzw2VOhhOf++tiFvdznjrGAI2jFgIzdADCaoq6Eab
	 uuwUha1mGwFjh1krQDBdeVWpwbTrHpoCrzaZfrurYqRLxFsr/Ukbgh8VqSiX5HzdItMkI
	 DyOn5Bg4qW0vlUQibEKGgih+OSU7WLHL6Ej9blFynpDTw8ZLAqcSfMd9xscZkxyO9YOoU
	 QWz8yQ/q/Ul5NwxLwi6L/gCiZ8OO3eRz4CZQd64i2+IwVpeXk2JREKCTrXw86Ll0qSDNS
	 tkrEcqWO84z7T84/YqvlNm2Q0cgKQzdl5Ef0M9limauLPNY364HO1ZPfgP+kLJ9VkIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cqnxk9wz;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65993606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65993606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cqnxk9wz
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49412eb1474so160785f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135465; x=1795740265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAT1U9wNy0EKa5OwUErsAyJuiK065rYrDAt2SMRpc5U=;
        b=Cqnxk9wz0Xf8p62QPRh6wqWUaj6v9mXQsriLuN8UnEMEfuadKYAqGLmj2PlPcQQgMw
         1F9YfjUJxiJIwBYb8pbaXU9k5zEnDIATH2HproQtfLWzbPfvlmJevYLApPJd0nFmAFvb
         eCL3LX5N5r0CXCaN153CD3JIDOrqlPNExUtHaZSc6f0MKrh+1F1+SAsYm3d0srADQgj9
         eBVmVczMSBocwB87o4u9yN8jVGEZEsR8A49kyeuk+ZfV0H/NkbXekdXmGc0YsUue0UKq
         q+N6TkbS/z9ta2AYlybHRpNyQ/TiugRwMNXTWP/GUhXi3Pelpl7zkoXZLcPGlVK0fQAA
         5VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135465; x=1795740265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HAT1U9wNy0EKa5OwUErsAyJuiK065rYrDAt2SMRpc5U=;
        b=MniZA3onw8TD8/2yDQMHq9y4akwGOFMufbxK5It2eKgeMniBqLAA0M0Hb4aZb/rY8s
         NL8leqwsp+izS2JC4YvnOOMIPia6B2diFcPM3UZWeVB6+1zFDYacvRx7Lw6aLrKk3L74
         K1j7iIE2TPXJCELhEcwxUo3nNOP3guc7ky3TmNB9Y2yrJA44TutYb8h722dMQgVquEJw
         ppH0sfhFLmoWzTYo07FennpyANEFE76UMf+nDPLqt/9IPr8xzbhQsGedjmugw+I1pwYC
         m4CMRtAwMyZr1UwFh52wJVsU7aykcbgbG2zRM0bxnvllJ0xC9mYwnLrFeXIzwEdM2usy
         HxoA==
X-Forwarded-Encrypted: i=1; AL+hErHmjDAhJIlJHdFVdwqYCoShOHy4mx8Yq4Uo8qJijHZuG3EfhAzFhNtoNza/lXn5dq2hoVKTwVWtOBymbK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XFj8I2cQl90AXUMFbPXYUNIANZ+/FmyaKuaqPnS06XcKcBa5w
	C186vvi4vclSuRIRyY44fR6kUKY5Oa9KQy34JPXpomYMsElCWNgoQb49
X-Gm-Gg: AYBFou0xITAuAlWPeJL16CUeNaZ5UZ/pN/K9U4BP/jJoy34onF68Q6+DybuNzmysdR9
	VXy8/Ehxal5GUl76hqMsVujemdYfDiLaj08NS450XD2DxZTvrc+dfQ6TXhL7Bt+2/CAFyqoBl2c
	mvNL8weghPay6LrN6qAncnj5ok1p8JSzD5CUhQ/24SkSp95oGXb2cFm0YQi1ENEd62e8s3G1E75
	XA/Buv9rJH+TEO9xqyWQ+toNx2ins/Y0gcobadkCYgUYWXwdv4FVNHJegT5d2UVGBnv6k73+yCB
	I8CbhT96MzGX/olF9jY7MY0SHMbb/gWdOgV5QWq+fNSpX91W7YiTaCSILfJu+3rX+E/QFeLOcaq
	ZwU+vIc/dp0NN6Xb1mY7bmOSYPex8z6WjnIOJ9RPdAIaY2L3TT5uQp/T/b0xtXHgF2CAfCw3Rxh
	qaSd3DIgWEf3ebfvWY8ga2uVjSkTZts50/sO4d7wl4xh14QSkU5A4Mehq9/7yXnI3bzYqddqO7n
	aFN3JqPyTMYVPnG23d0deBYnJncHRW1A7Mirb0EZLAZwNKgsQXkyPe/hQpJALAfGsp97geVXp1r
	gW7ntMQMZeEdfXvywcVhnd9dObhIdP1F1bR2/g==
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr26497435e9.12.1795135464741;
        Thu, 19 Nov 2026 16:44:24 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:10:5673:5f22:93eb:1bb8:839c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm2686669f8f.21.2026.11.19.16.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:44:24 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	"Wang, Sen" <sen@ti.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] ASoC: dt-bindings: add Texas Instruments TAS2557
Date: Fri, 20 Nov 2026 01:43:23 +0100
Message-ID: <20261120004414.1686884-2-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120004414.1686884-1-morf3089@gmail.com>
References: <20261120004414.1686884-1-morf3089@gmail.com>
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

Document the TAS2557 mono Class-D smart amplifier with an integrated
DSP for speaker protection. The device is controlled over I2C and
receives audio over I2S/TDM (ASI).

One node describes either a single device or, with a two-entry reg, a
stereo pair sharing one bus. The device at each reg index applies one
half of a stereo-tuned firmware image: index 0 is DEV_A and index 1 is
DEV_B. No channel selection property is needed, as for ti,tas2781.yaml.
reg is limited to two entries because the firmware format only defines
mono or DEV_A/DEV_B devices.

reset-gpios and interrupts are per device: the item at array index N
configures the device at the Nth reg entry, and a single entry is
shared by every device in the group. A pair wired to independent RESET
and INT pins uses two entries each.

ti,asi-port selects which of the two audio serial interfaces, ASI1 or
ASI2, is wired to the host.

The DSP boots from a firmware image generated per speaker design with
the TI PurePath Console tuning tools. The optional firmware-name
property selects a board specific image shared by the whole group. The
default names are the mono images, so a pair must set it.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---

Notes:
    Changes in v4:
    - use the ASoC subject prefix (Mark Brown)
    - reset-gpios and interrupts take one entry per reg index, a single
      entry is shared by the group (boards with independent RESET/INT
      lines per chip)
    - add ti,asi-port to name the wired ASI (Mark Brown)
    - drop ti,imon-slot-nos and ti,vmon-slot-nos: the chip has no slot
      field for I/V sense, SNS_CTRL only holds the I-sense scale, which
      the firmware programs
    - require firmware-name for two chips, the default names are mono
      images
    - move the review history out of the commit message (Krzysztof
      Kozlowski); Reviewed-by not carried over because of the property
      changes
    
    Changes in v3:
    - single-node reg-array model (up to two devices), matching
      ti,tas2781.yaml; drop ti,channel, derive DEV_A/DEV_B from reg order
    - rename ti,imon-slot-no/ti,vmon-slot-no to the plural
      ti,imon-slot-nos/ti,vmon-slot-nos arrays; firmware-name maxItems: 1
    
    Changes in v2:
    - add the four mandatory supplies to "required" (Wang Sen)

 .../devicetree/bindings/sound/ti,tas2557.yaml | 158 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2557.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2557.yaml b/Documentation/devicetree/bindings/sound/ti,tas2557.yaml
new file mode 100644
index 000000000..4a7f90659
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tas2557.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Gianluca Boiano <morf3089@gmail.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tas2557.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TAS2557 Mono Smart Amplifier
+
+maintainers:
+  - Gianluca Boiano <morf3089@gmail.com>
+
+description: |
+  The TAS2557 is a mono, digital-input Class-D amplifier with an
+  integrated DSP for speaker protection, controlled over I2C, with
+  audio over I2S/TDM (ASI). The DSP runs a firmware image generated for
+  the speaker with the TI PurePath Console tuning tools.
+
+  One node describes one device or a pair sharing one ASI bus, using
+  the reg-array convention of ti,tas2781.yaml. The device at reg index 0
+  is DEV_A and the one at index 1 is DEV_B; they select the two halves
+  of a stereo-tuned firmware image. The firmware format defines no
+  other device types, so a node has at most two devices.
+
+  Datasheet: https://www.ti.com/lit/gpn/tas2557
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: ti,tas2557
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    description:
+      I2C address of each physical device sharing this node. One
+      entry configures a single mono TAS2557. Two entries configure a
+      device pair; the device at index 0 is DEV_A and the device at
+      index 1 is DEV_B.
+
+  '#sound-dai-cells':
+    const: 0
+
+  reset-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      GPIO connected to the active-low RESET pin of each physical
+      device sharing this node, one entry per reg entry. A single
+      entry is shared by every device in the group.
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+    description:
+      Fault interrupt output (INT) of each physical device sharing
+      this node, one entry per reg entry. A single entry is shared
+      by every device in the group.
+
+  vbat-supply:
+    description: Battery/boost input supply (VBAT), 2.9 V to 5.5 V.
+
+  iovdd-supply:
+    description: Digital I/O supply, 1.62 V to 3.6 V.
+
+  avdd-supply:
+    description: Analog supply, 1.65 V to 1.95 V.
+
+  dvdd-supply:
+    description: Digital core supply, 1.65 V to 1.95 V.
+
+  firmware-name:
+    maxItems: 1
+    description:
+      Name of the DSP firmware image to load. Defaults to a name
+      derived from the silicon revision, which is the mono image, so a
+      device pair must set this property. A device pair shares one
+      image; each device's half of it is selected by its reg index,
+      not by this property.
+
+  ti,asi-port:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2]
+    default: 2
+    description:
+      Which audio serial interface (ASI1 or ASI2) of the chip is
+      wired to the host. Only the selected interface is configured.
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+  - vbat-supply
+  - iovdd-supply
+  - avdd-supply
+  - dvdd-supply
+
+if:
+  properties:
+    reg:
+      minItems: 2
+then:
+  required:
+    - firmware-name
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@4c {
+            compatible = "ti,tas2557";
+            reg = <0x4c>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
+
+            vbat-supply = <&vph_pwr>;
+            iovdd-supply = <&vreg_l6b_1p8>;
+            avdd-supply = <&vreg_l6b_1p8>;
+            dvdd-supply = <&vreg_l6b_1p8>;
+        };
+    };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@4c {
+            compatible = "ti,tas2557";
+            reg = <0x4c>, <0x4e>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>,
+                          <&tlmm 78 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <73 IRQ_TYPE_LEVEL_HIGH>, <74 IRQ_TYPE_LEVEL_HIGH>;
+
+            vbat-supply = <&vph_pwr>;
+            iovdd-supply = <&vreg_l6b_1p8>;
+            avdd-supply = <&vreg_l6b_1p8>;
+            dvdd-supply = <&vreg_l6b_1p8>;
+
+            firmware-name = "tas2557-stereo.bin";
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index d37ed235d..8e024bcfb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27724,6 +27724,7 @@ M:	Sen Wang <sen@ti.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/ti,tas2552.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas2557.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2562.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2770.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
-- 
2.56.1

