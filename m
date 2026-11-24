Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559105;
	b=eaBFs5U4EmOomvbCkIWuHeeFCy6xCse+LfIPypb0QBXdbhwS4jb22kN0YRD7BJi7iUGO
	 +y/Y/ZZlw32u/COQrHo4jmKazUf/MSNsNsJKDtOngKvIbbV7C6p/pc6T4ClZfalN3P52V
	 EbaUbOSXSI3Ui77O8LSZAlwSfPklvKqkpqhW8mXq+kHfptYs0NsDbaaXAeL+8YA83uZZR
	 MP0s7EIc1NCl9c/+3axGfmtcTGrko/09kSpdJJA8kBuv2fupeGqb5tvnq3MeuCLLbNz7q
	 zdb7YZD8dmftYzx1E55I0j3ipMi2BvXs7rMTWoSR/0Y1QceHHLwIvOpd5iti45vNE9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hbE4Q7q4TrDtAfvA5QvxISTriMkp04Un/AU1m5jHodE=;
	b=AYIuY6kYEgvbrED87FA/qXRLHv96HEFPXuC/WhZCy2GUlN2H3kFGlrRfQ6EMjs9CrgN6
	 UcT/+lzD5mWXc7D661XPUF90TxVshpvRkobB5Gjs2XJgAt31JvrvElUOQqIuEMBraYNFr
	 fUT3Xd3RF8KuOJ052Ph6SSQHpHiUbOArNuWdiUaMm/51NJoA0kp5KzW3VFNjGebw7/oHF
	 lwMuvPuU8XNPXCextpRA7JEY4MNREYGZyT4Wqk0ZT2EtzJcPdbdZtRAfoAwycs/IuWEYL
	 FGbBmGHXLQqSccpzIHkOmDbBPtpKGi7Hs9aI7/aajGqSxgxzO04Cjv7ywFCk5JaLZCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OqrkBlvL;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DE9606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35DE9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OqrkBlvL
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a9be758734so3187940f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795559103; x=1796163903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hbE4Q7q4TrDtAfvA5QvxISTriMkp04Un/AU1m5jHodE=;
        b=OqrkBlvLFFiXmfHtN5DPs4LEfBjKqUZSDzwTE1EffqbRTK/nzjN6gUpvWlCh1tjdEu
         bnfJklffsjdbWMjVkAB5MPsxUJW+UM/i1rsEcCuwFBxwGBg9RHwDYiJCaoVeJeghCdlD
         nE3VNAPWJd7EOewwKUgO7ZxduxTuVFOtoZbSFheAGpoRZbXwTNz5f350ouLn3dZV1WHV
         rnVHPm6OmGwGRPSkSdhOenzO+Z5aEebfnbMCviJfmgZWC0of40BI1PHu2FklTvCachRd
         iQUiUK6p9P+aFFvfbiz7lRCrOSYFobFv8g85MzhMACgrjDZ2CzIHhmY/oflRvvhsvYlo
         pPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559103; x=1796163903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hbE4Q7q4TrDtAfvA5QvxISTriMkp04Un/AU1m5jHodE=;
        b=G/Jg0VdD5WNBWM2VMzUrnnmJfo4EVO2gqvJA/0ZEC1+z0uPZ5r6VXQ/xbMLkpB1ebK
         Qmt2D6ZXEUBNceTYV6XsHz+VzHhdqlz0cENVK1hSsi5MyT7wbz/S7y08tZE5D0gGTe/r
         nKcjxnr2AWwaxlc5KgOyC9K19sl8cYrrrvhEEWrTrRnHNI7RB41VqMOpybteqrnNyw5y
         kQIICctXQJutxuvpO0Pa6wmycyVq/uwz+GGQuN85VMAxEl4+u98q22zoqZaQo8125Kdq
         O80EsquSJyFfC/5q5rMhXHX8iWob37BYaES7S/NJrDgiGuYS9I1xnka6pqmbTnzfuFg+
         jecw==
X-Forwarded-Encrypted: i=1; AL+hErFb/3dIK75dpL02UqgEhH/PnEr4DoXhSH7iXUURLs60NgAL3XlrMWc2TT1M5hqsi9lkNAiZBn6YdJ/C9u4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G51D8GSgWlRiP/r0COm1d6UvQH1uBI8oWLLrOkScaArBrpngk
	iXIRurf2PHXbVFDBEjh3NG8xpPBVMM/TU1YPgKqsxKkpvcklw4jlFZJ9
X-Gm-Gg: AZFdTZc4wT9LsFM1n46E+a+A/u2b+ONCQwEUMZxxmpvDCLG8vK5qvZgFVMAFETgM9Lp
	wS08pR84be9NFzL0x+L4+ac9xBMCpS/3O3f1LQRomQ8u5+UXhRWkuhwzkDHwoMxKiHkwrlAtSeR
	zDEVuKTg4o4AqHwgYnHPnk9XDrbh51IyH0+ne8nRzmQHA2bbdLYdM8mQgL47U0P87s+fZfBmje2
	TXZ4m2f6lWUuaKj0vre/0azFoGz4K+e1F3F/2mfr5qnk36sBnL1BQaR2i4KbREb0Xf8z9wKA7LA
	SlfzBMDkPNdVPE/PZerqCoBpiV0ItKukEOVePScEg9Aku7iB5X2HywrtVctrLs7fK2NjNqFN9qd
	y39fkSZPRSDpRZGTCOzWWz2m6BEKyu3z0pPYKv1s7e/tqUtIrgORHHu2FPTGNo2alXHzcF6beFF
	ZRKPOvcZb6r+5hwYkGk4oUnymnpw9zmSpCtvMieAJuAbA9EqthpJG/6/2Rq3epzP25lrhnEBgfK
	d+AqVQEv0XBU5pKBujEL0ri95E7tpiR4q+jALCP7NaOHyV3G5hd7e6iyC3wdKpzIYhsQhYYNcK2
	m6+mBqKY7t6r0jS8R519jRgljWYMZecSU4fgIvVaNapdqHlj9wKHTKEA5ogTtoEs8Us9DjY2Ajg
	TBCY=
X-Received: by 2002:a05:6000:2f87:b0:4a3:7954:ac75 with SMTP id ffacd0b85a97d-4abb2910fb2mr29043091f8f.37.1795559103518;
        Tue, 24 Nov 2026 14:25:03 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm31125711f8f.16.2026.11.24.14.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:25:03 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Crispin <john@phrozen.org>
Subject: [PATCH v5 1/3] dt-bindings: phy: airoha: Document support for AN7583 USB PHY
Date: Tue, 24 Nov 2026 23:24:31 +0100
Message-ID: <20261124222452.219832-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124222452.219832-1-ansuelsmth@gmail.com>
References: <20261124222452.219832-1-ansuelsmth@gmail.com>
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

Add documentation for Airoha AN7583 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
property is required with the phandle pointing to the correct Serdes port
provided by the SCU node. Providing the phys property is optional if USB
3.0 is not used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7583-usb-phy.yaml   | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
new file mode 100644
index 000000000000..f1a5d83e8968
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7583 SoC USB PHY describes the USB PHY for the USB controller..
+
+  Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+  On Airoha AN7583 there is an unified PHY implementation where a single
+  PHY provide support for both the 2 USB 2.0 port and
+  optionally one 3.0 USB.
+
+properties:
+  compatible:
+    const: airoha,an7583-usb-phy
+
+  reg:
+    items:
+      - description: phy register
+      - description: ana register
+      - description: pma register
+      - description: dig register
+
+  reg-names:
+    items:
+      - const: phy
+      - const: ana
+      - const: pma
+      - const: dig
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  usb3-phy:
+    type: object
+
+    properties:
+      phys:
+        items:
+          - description: phandle to Serdes PHY
+
+      '#phy-cells':
+        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+          as defined in dt-bindings/phy/phy.h.
+        const: 1
+
+    required:
+      - phys
+      - '#phy-cells'
+
+    additionalProperties: false
+
+patternProperties:
+  '^usb2-phy@[0-9a-f]+$':
+    type: object
+
+    properties:
+      reg:
+        enum: [0x0, 0x1000]
+
+      airoha,usb2-monitor-clk-sel:
+        description: Describe what oscillator across the available 4
+          should be selected for USB 2.0 Slew Rate calibration.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+
+      '#phy-cells':
+        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+          as defined in dt-bindings/phy/phy.h.
+        const: 1
+
+    required:
+      - reg
+      - airoha,usb2-monitor-clk-sel
+      - '#phy-cells'
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    phy@1fac0000 {
+        compatible = "airoha,an7583-usb-phy";
+        reg = <0x1fac0000 0x1200>,
+              <0x1fa6f000 0x100>,
+              <0x1fa6e000 0x400>,
+              <0x1fa6a000 0x900>;
+        reg-names = "phy", "ana", "pma", "dig";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        usb2-phy@0 {
+            reg = <0x0>;
+            airoha,usb2-monitor-clk-sel = <0>;
+
+            #phy-cells = <1>;
+        };
+
+        usb2-phy@1000 {
+            reg = <0x1000>;
+            airoha,usb2-monitor-clk-sel = <1>;
+
+            #phy-cells = <1>;
+        };
+
+        usb3-phy {
+            phys = <&serdes_phy>;
+
+            #phy-cells = <1>;
+        };
+    };
-- 
2.55.0

