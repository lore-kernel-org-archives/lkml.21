Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547911;
	b=Uxd8RkuYUsbm5fIBC6MuMqAB8LRO+7ZBw3av3mtZ5oLnKCvMog2S4qrXd+DFGqn9FsTm
	 Vhtj0L5/Lv8AYUiRAwVwyi9SdeJVQ+M9mopXU5q1A7Vm4SnUjX+jj0fHbF1EMJJEAq7/z
	 4r6vmWZUxLtMOhzilMpLpq2JHaBh+hKJI3ti1DrfUQtu4ukIlHTNfx0C8qNF3ol8zsjIt
	 dyenUUr4bUJTXrPcFfJaFmJTKh8AdHUwu9Ys25dV4oDMAeX4a9yL6Q1MB4+PfD3Z7bfaJ
	 +Nb+wxGG3mdwtrQ2t3yI3UkLCMc85wqeiLWbZWCOnPjj9SVkA6bhrpc4k5kYrPcJ6ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5SuSwraB3A2rJ+eef524bz9/G9zBRh88zfM0uLgHn3k=;
	b=4PJToDC/eLw3jRZ52tdXZQIi3AroCl3TsWmDQMN8nF+Ihw8bKGIYFndQEj2dfUMu//O8
	 JtetZ4wkU9XTuOY98TtTV4iQc6CWDqYSwStW1Qov9ViODlVTDnLO/TpBHSs3CGGOQx56X
	 9RaG6s037XR+sbQdGsDrqZ52x52z01Oi0JMQulz0jT0S09+O2ZNvvtijD/w5LD57JTPYO
	 YOEAYWlQpwt+gHdDGbIGsRhsYMHFsEZzFp5faIT47KOdngvQGd9wJnWV093qghK7c8uC7
	 d/7NVTVIMXFnDq2lRy2S7kjoAFZjxJv7aaet4TIWu0707l4XN+rUUeMOtd6QhQe9Veg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I2HQqWAf;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53487606A331
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53487606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I2HQqWAf
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so32137945e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795547910; x=1796152710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SuSwraB3A2rJ+eef524bz9/G9zBRh88zfM0uLgHn3k=;
        b=I2HQqWAfx7S9GTpnCcxlu/WUilsFiXklQpKhZJZmJvaQZuty4xFWI8aLxuVUu75O6d
         BWkcZv2O/4vlTpEKy36Pnufnp0v41bUTvmYXZ3mkgnNiBuQZ7tLa/lbVpeu6oBO0qfEU
         iMc6rMXzy9+3mRX3oxu9di7hIrdjIDDVlFxPXClxIDMZ/fmfh0/o26RT6R0CjgpVRT5x
         +Tf+fk1Py53TsQs1GhbIp85PwXzYQ28ntA8iEELbzXNF3n7YbjowP7yuhl8dxPHWzDD6
         sSCbvuO6SBpnngmIkyB3f4NfBOgyY4rhlB0bZwdlMQzbaXx3ruOGmwodUdZUZ34gHqCK
         UBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795547910; x=1796152710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5SuSwraB3A2rJ+eef524bz9/G9zBRh88zfM0uLgHn3k=;
        b=vIl7buQey9caQQq6B34sSmrIJ0+IbiQQo/FXqVly5wHqPt2LMx/x4g1TFEklua/fYe
         C5F9AWvfedpefvN6E58qP8HggHWF1A7z+2nxBOYVZkgbh2EVndny7tFJCO95jO3/pVS2
         bxF9gdnhpXJb7vver5FsqAhCiVvQnNchF+VD6jY/l1dkXQ7WEBHISrg4A2zrMP7nwq3L
         elCAkyH1lgX/to9X/nJNv3HhwIq3b9LtHCrU1eHN0acAa2NBbFlz9jTKxljrqyslZJut
         cCAI40dvED99sxiy7/JbHC/NAIqH9ElAMr4RSFpUcuVYfGiFbnL43V7tNJd6MBK+r7eu
         MKGg==
X-Forwarded-Encrypted: i=1; AL+hErHkaWdVNle9Oqe4SLk1VE0f10o8EkAlgzVheJenDOMidnTK2zEVsbd1G7WjgqzM8Y0abXjawRTfbhrhwEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cGFf1o55t4cjgseUcQzXtfqfg+5XKGTDVzCEf197+dj0qIWhe
	xBcuKBInI3TFrVGSbo78UhLRmMrNXIO4cUV7FtzQ8h3lkPWkgbIMTHU=
X-Gm-Gg: AZFdTZdztEbLCGX9o77bg6mssXst+W7llxwz8Hg1znNKFXaXg/FYQXeP7s43c3Z4Kf0
	Hw2UjkwEKFEIv4I99ZfbTXHVmRaVZmxr5qe4fpxAkSTFxucL5dMjW27KegEkQYedI2N/lrS5nH6
	DpI+CiA+RiPVuKSSFPRph6ZGHk2qVrUown3iALf2FfePgwSwX4HeMQImQmma8IjSpjzU+PTtbWX
	/8L7i7HGxj6x4nByoQXi92CeN8Ie9khEdJ4bnC2q3qnc1LUmmIFiI6Os80Ap7WRId1E22Z+SZby
	a9ap+ge0CRFCpv11kb1l0eM94ePzoeJv0tFarUcVOaVbLuUPiqS/U0ZX3DBETZagtFgrQWea6zi
	eOE9tmnOkDL+WBo5lEY/yXSo2+FRdIlntBXZnQ/Psgz2/4JB0GxoS0PSIanj00SvNZv5pZ9GmMD
	PSfFVxiYsy2I7kReqJkJsJoykfZ/LyBYCfJ9D44bEBg92sPNw6kIMIz1KujjLDtLpscZX7jipEm
	h+mQ9avYr4AQUCyMlwA85PXUG+aTeT3qkfLns8PL5/b7LctazUyZKNGnu+jNr3+csK+G0pCfpZF
	OraRIUydkSPi+FmxbBGlJLktuw8WFuXvoNrgDxgrLj1V1BH0MVtaVq/DWMMWeWm69YFcEMGuSd8
	=
X-Received: by 2002:a05:600c:1d09:b0:4bb:6fd3:5ac0 with SMTP id 5b1f17b1804b1-4bb88816c7emr344773725e9.28.1795547909651;
        Tue, 24 Nov 2026 11:18:29 -0800 (PST)
Received: from localhost.localdomain ([93.145.31.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm463320985e9.15.2026.11.24.11.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:18:29 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: bridge: Add Lontium LT9721 HDMI to eDP bridge
Date: Tue, 24 Nov 2026 20:18:02 +0100
Message-Id: <20261124191803.283266-2-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261124191803.283266-1-gianfranco.mariotti94@gmail.com>
References: <20261124191803.283266-1-gianfranco.mariotti94@gmail.com>
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

Document the Lontium LT9721 HDMI 1.4 to 1/2/4-lane eDP 1.4 bridge
device tree binding, including power supplies, reset GPIO, OF graph
input/output endpoints with lane/polarity remapping, and the DP AUX bus.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 .../display/bridge/lontium,lt9721.yaml        | 169 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9721.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9721.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9721.yaml
new file mode 100644
index 0000000000000..88c5c75c0d49c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9721.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lontium,lt9721.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lontium LT9721 HDMI 1.4 to eDP 1.4 Bridge
+
+maintainers:
+  - Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
+
+description:
+  The Lontium LT9721 is a bridge device that converts an HDMI 1.4 input
+  (up to 3.4 Gbps/lane) to a 1-, 2-, or 4-lane eDP 1.4 output (1.62 Gbps
+  RBR or 2.7 Gbps HBR per lane), controlled over I2C.
+
+properties:
+  compatible:
+    const: lontium,lt9721
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: Active-low GPIO connected to the RST_N pin.
+
+  vcc-supply:
+    description: Regulator for 3.3V analog and I/O power (VCC33_RX, VCC33_TX).
+
+  vdd-supply:
+    description: Regulator for 1.8V analog and core power (VCC18_RX, VCC18_TX, VDD).
+
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: HDMI 1.4 input port.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              lane-polarities:
+                minItems: 4
+                maxItems: 4
+                items:
+                  enum: [0, 1]
+                description:
+                  TMDS pair P/N polarity inversion for clock and data lanes.
+                  The LT9721 applies P/N inversion globally across all four
+                  TMDS pairs, so all entries must match.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: eDP 1.4 output port.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                oneOf:
+                  - minItems: 1
+                    maxItems: 1
+                    items:
+                      enum: [0, 1, 2, 3]
+                  - minItems: 2
+                    maxItems: 2
+                    uniqueItems: true
+                    items:
+                      enum: [0, 1, 2, 3]
+                  - minItems: 4
+                    maxItems: 4
+                    uniqueItems: true
+                    items:
+                      enum: [0, 1, 2, 3]
+
+              lane-polarities:
+                minItems: 1
+                maxItems: 4
+                items:
+                  enum: [0, 1]
+
+            dependencies:
+              lane-polarities: [data-lanes]
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - vcc-supply
+  - vdd-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bridge@33 {
+            compatible = "lontium,lt9721";
+            reg = <0x33>;
+            reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+            vcc-supply = <&reg_3v3>;
+            vdd-supply = <&reg_1v8>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    lt9721_in: endpoint {
+                        remote-endpoint = <&hdmi_out>;
+                        lane-polarities = <1 1 1 1>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    lt9721_out: endpoint {
+                        remote-endpoint = <&edp_panel_in>;
+                        data-lanes = <0 1>;
+                    };
+                };
+            };
+
+            aux-bus {
+                panel {
+                    compatible = "edp-panel";
+                    power-supply = <&reg_panel_3v3>;
+                    backlight = <&backlight>;
+                    no-hpd;
+
+                    port {
+                        edp_panel_in: endpoint {
+                            remote-endpoint = <&lt9721_out>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c00d3612c9acf..707cd862d4fc4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15790,6 +15790,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
 F:	drivers/gpu/drm/bridge/lontium-lt8912b.c
 
+LONTIUM LT9721 HDMI TO EDP BRIDGE
+M:	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/bridge/lontium,lt9721.yaml
+
 LOONGARCH
 M:	Huacai Chen <chenhuacai@kernel.org>
 R:	WANG Xuerui <kernel@xen0n.name>
-- 
2.25.1

