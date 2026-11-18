Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003641;
	b=fF3bJVdXs8HusJ7eeHW1ZiHtcMj3S4h6clBLUQ6iAENmjPEp48NHiW1pxmkWjVEsWis0
	 RDvbZb0idBYErukyKM7sndUxmUCnvHv/zqZyjzIZ3qOZCk5XRb8oJDqNeVTRhoHaGPjAm
	 2LvAYNvjN/X8IgdZS0joZ9ikQNIel4FA//0AEyyMZFlyU5JpX1fBXnTcK1+ALDEUSPLyv
	 w2TQUyaf3VkENidYU9NyhYhHVnE6LE48IKB2Ufzl6MqP70x3rCVJNb9c1p+NHpJGF+zMq
	 V1ffpD1ZxU2dn9QL1tUGU3/lP03ud4rXzQ0V5iv4fghSc9c07xekotENz5J/IGUiPLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
	b=lwPFLL7kK/R18AdGcnE8ZFmwivSN0wPvi1ti9ajdwCPEjWhRkJgW/EERQ16YEwOdXQp/
	 SCXMgnPRvCfWcKNxnqG8lJGjkoOv/iP1A2xjZ7SOqnk0dRc6BV8m39zTVcyoST0ZzSwA/
	 FcNVjSdiEam7xnodDY1+gpV+ZDP3v0w8vdRXGadNBGY0ytk3BXsHNhL8q5deqAXk98R5h
	 dZcKnPOdeJt9t89QCGw+WhtIUt3IAMF0or/G0EWtvpqyhkgE5Bz8z83WzhRI53OHwiomh
	 tFP0EwhadTcneXBllNZRFfK/838sKx8KkYOjCTLoOpT6EYlFJS4+RdG2Zz0NgoGghUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JtmHmyg1;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5674860A2630
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5674860A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JtmHmyg1
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso6515935e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003640; x=1795608440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=JtmHmyg14Boyp9v535ErgQNT94x0DC7zP8DBwjHhodcFpFL40uBudkYtO7GookjHB5
         fgnu6n4vz9ahUXfO+yd6vWaZOCGSUscbc3nUv9FdtZUwyuYxWdKLRCQdnu4ckUGOFqVt
         lXY+L5N/SBAixdwwbzCxXUKFZ29ZTul7rCZmAsSNkvLD4jnvZFigWaGrObwsqmFQ6BgS
         RgJg62kfIcR4INg4bpKLb91vrF2OWFVyxwS4MkSRBtd/Lgp7XOZGGdTXEAvvONXmfRED
         AZgL6Jf4oBFJVq/DbYWVHrZ0uwqZ4UQqgO59l7J+925SACoeOnJNZUn7oSxlIstPoG+O
         jiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003640; x=1795608440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=v2wtIZ9aGABfB3SFxDLRyNni6BI9fxezZhzJN39PWcBrUhQgJY5Zq5JYB2Vj0UKiDf
         eXmhl6Ep3VFiNriOthtW/TGy80jY4Xc6sEjzI2JbItjsAgMxsiuWbD1Q5s/I1OQHvTK9
         IQWetyh0ja8VHNTRrQ2DFBNNomGA/6x2Kt+dZsQvhXMoDWIg2Yi3KWuT0cMUsVar7wc4
         6JoPxgFaZ/uIWleIhU2f/gYGV8uTYUv+wqKjlWxOVgopjV0uPt/96iCCgig95nLwH35f
         yIWz0zFc4i6nkXcyTPEFZsM+H5EySFOL1GGA93n+ZXH+fVjicDXnepoWAxebbPV4eh+T
         QCWQ==
X-Forwarded-Encrypted: i=1; AL+hErFD6/inSNS9Rzer8+Dk0rym0zaoESW547MXDgnypJxs4bG4tpslLOWXQ2W3VJiZ2f35ivhhTs/beijEer8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gtBC3w2SX1tqEs8u2SRwvzPeQ2yjfxagujYzTf6t/emzFkF4+
	8Bm6hmgj+vmzXBHNVdEI1cUN0L31ZqNGQg8zbw6lVL6J+fzDEFhGb3/f
X-Gm-Gg: AYBFou1KcpSkqzTAuHQEA46dB/nMidAKfFGxQsD3muQNI893bJDpVsrxiSav64lK8Se
	49PdvZkys6nzmI5bkRBp3NTuUrb5zZAbpe3y3GfRABU7xPFhHGP5bkJoojbrd8BYZ8Fg5Kg6i5P
	U3BwIC2sxfIdUxi7FCkb+Wrn3ifxSvTpQ8YNBsJ+29HkHRIwhDswxY/oUqs84lpmqSSDDAlfvgL
	gJHvCGoGXWcTi2bXab832tm6mbZxXwhKvHOYvQ61svt/ncBqSW8bLVv8LG9OnuWY8poh89T0nSi
	axknTujKiSGwRH2mkCJBxNerg+vs6+KDWQPrkOdAuEfLdVjWnarj/0c0WRGz6lo/tjpcl/yc6j5
	sc6vKcJR5IZH88xTtEiWkoJOhg0ZXDlBPDDFyFcpflXZuSBwq122rCR9sBt8pAKTkzH1t48mIrQ
	gI3uUF/E0V3kr8Kwik2A2LAHcLz5Wb3aktdTVNrVd/a9RnNaFqBNBtEE3BMMAhjycOujC0GTSQc
	Y22ezllWz5kGA1/a4HufcCzYsHsutVe2v6W9KaZRhyevPrerJkJJLL3L79PdwJiFmvsYI5nVwh1
	1lVi6cCnqbKyEuTeCKPIJSQAHM71UhvAjPCxELnWwpEI4Tk74Zmjt8H1y0wEwtAmbb2X7x9IIet
	pEPFYp3V0o2iy69eoZMv9gQ==
X-Received: by 2002:a05:600c:354b:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb7da4805fmr42799545e9.31.1795003639681;
        Wed, 18 Nov 2026 04:07:19 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:19 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 03/10] dt-bindings: display: panel: add LG SW43103
Date: Wed, 18 Nov 2026 13:07:07 +0100
Message-Id: <20261118120714.31505-4-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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

Document the SW43103 FHD+ AMOLED panel used by the LG V60. The panel
uses DSI command mode with DSC and DCS backlight control.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../bindings/display/panel/lg,sw43103.yaml    | 69 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
new file mode 100644
index 0000000000000..7f44ac6672bda
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43103.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG / BOE SW43103 1080x2460 DSI cmd mode panel
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description: |
+  The SW43103 is a 1080x2460 command-mode AMOLED panel used by LG V60 (timelm).
+  It uses Display Stream Compression (DSC) over a 4-lane MIPI DSI interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - lg,sw43103
+      - boe,sw43103
+
+  reg:
+    maxItems: 1
+
+  port: true
+  vddi-supply: true
+  vpnl-supply: true
+  reset-gpios: true
+  enable-gpios: true
+
+required:
+  - compatible
+  - reg
+  - vddi-supply
+  - vpnl-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "lg,sw43103";
+            reg = <0>;
+
+            vddi-supply = <&vreg_l14a_1p8>;
+            vpnl-supply = <&vreg_l11c_3p0>;
+
+            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+            enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 80c1bfb66f8cc..594863936fb5c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15211,6 +15211,11 @@ F:	Documentation/ABI/testing/sysfs-platform-lg-laptop
 F:	Documentation/admin-guide/laptops/lg-laptop.rst
 F:	drivers/platform/x86/lg-laptop.c
 
+LG SW43103 PANEL DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
+
 LG V60 THINQ 5G (TIMELM) SUPPORT
 M:	Abdur Rofik <rofikcoga@gmail.com>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.39.5

