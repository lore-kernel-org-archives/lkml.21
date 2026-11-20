Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160045;
	b=FpsIoXlDouwpdZowbUwFn+QzJWsIiEECLD62cYJG/Z2XMBuUUCOmO0y3xmM00zSg92qL
	 YoREKnDdQISiXDu4ujGFfYfRLH6oPz4oth9UrWps6CkQViWBSHIffqPali3sdhd5nTOv4
	 5gntwqkFe05nWxOdROHvDSkYJa46L4Rn7xwQ7daUS/i/khFvnba7Esf/O05HBUBma/jtw
	 kFACs62OdTrDQHaeSaNtADADomcssMkgJP/zpAm1xG4C47dm+42kmhvUFTiWHzATWGBGB
	 hVopEupdyliDKex3lEVDzJD8EPHfcdHnu1ccpAIb1KEE5UvrsyGPxqzmag39E/tcq+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
	b=nDl/FiNUtTW/cIDbldfFVtMD0tdklpbUTZtRp8ZbOs8Te5Th9ewV6y8ZYQsJEgeXRuMT
	 MP5VFNIiNrmvPQu+9XMu2pELkC/lSrQEmkARue1e8up4wOGtIio+65WyD/aNWB871NOs2
	 AohvWIWGFfmVI5xrrdJiFscZGTKACk+99uVTMgQf9ofl4jkjanMGpxgXJY7xkRGzCbXy0
	 kImCrHIAQORwnWITC+OSexq8gb8Jp5NztWcUAIvi7V87UiylFLsKa7DzE3jwxNJBxTGxk
	 1ATr58Xq/2Zi9oLvjgO2KyE3kaeloQni0jQUVZbtZf/VSfl/l+0IXj9+CjVe/knBuiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGKPN5sg;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAA860A261B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DAA860A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGKPN5sg
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so4945635e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160043; x=1795764843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=UGKPN5sgnx/JqyrT4bunkDQklLznRnCu7ogj28UGxAtEc6KwzYIx1NZItncO3oCsy2
         WQwOTT4lqZnhEGkFTU2b0VsycWz3M8JsTUfgictNO4H7nhfo8Xa8SB5nE/4hoihOR+HV
         Iz93718IqHJWyQt97zdXQoV9pzVcMYIhwQCzOi/Q6u4n0TpTFiyCGzRrt53wHObDgLxF
         Xi3kUPiCfr4xbBx74tg/LQCT3qU9C9Tw0Ab5AOU4Xtu69qLTbTC3wJPvAMxWuXfC8r4o
         pAz8JNmmJFL1alSsFqn0U8j113YfwK3WZqXD7BRmX4YDkKQTGUWqTicnH/hJfPsct1Jw
         DWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160043; x=1795764843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=tVK2Z3SqfY86wbeyLO2ycgm7QNfQrIXO/iohJnhZDLsOCRSzR0aKRX6OJiPP212JpO
         U6g4oEzLQLZgD1HuatjjBA9xJmiNpEKjNesISYbE2N4bw3zEFzKwKncaSChsb63UCfhq
         nQv5ud07c1vq9sjEbJSS4n9PLwbo4iwumSTU8Ns3evldv3K0Nn3j3OQRIBOhG+ldxnIF
         wUhmdB9H9iNAojCqGlJIgLs5s/VwMO2QM5phcD5VytzQvzhviWQhl3i+cMW+LoCjDrDu
         QuYbVCJIZNbhH65DOWsUFDDSw18OJF086B00ELZySRc7BCwXFkkO+B4IBnfXAdzo2qNz
         I6OQ==
X-Forwarded-Encrypted: i=1; AL+hErFow0UFNw+AGRoOA2MMiwKzs9Dwqj8//EFmJDu68OYiE+1EAWoKfV4kTwgbpEcLIrF/UaGC/elJ0nx7Q/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OXnJk8zdBB5ThzM77wwQBTgzAibsWB749wKbZz2C6JL9eqzO7
	RLdYl65yiJFtZLf5qj4iISxl7l2Rf7ZrNPEb0rVm+sXgf29kld7PHu7D
X-Gm-Gg: AYBFou3OHDq7kc8slT0g07pUzr2aWSjHDlQ2sryDGK3DRotl2IR/3qRXlN4t9IvzEdw
	9zpM2FJYTu3LFQckKr/JXwxtZAs62nZWs/lVfKUjdwvOOhUtRxLjCbPj9RmwEbpgR3dYCu9TkAV
	fryZLIlbl757kMNpVwePSxFJxdA4BeHSPwaWWqud5lYgeGs6d9mIfA0bIe/XBK+7XsOEnGvVPcy
	ghZOobOVvJ+s69kjkoenAvZYhxhpaNqJpPYk6Qer7WgFL8l0Fko9ANixjwd9YXXkgCvnXQFFFiY
	GDZis3CCTo9SN621W4rCRepY/j70qjMg7TVm+wOUOMqBCzqIBH5IcDuIOdCGYbTHYVnw8BwDOyh
	BOoasqV8GUAzXG2oFKURFcXj7o4iMfhx4pLWh++HE2onM2T0oR+CmsywXPrp4SuHuXsGGQGbXTC
	C/pU25ldpHqPTACAFd1b288bGrGhmSAQ5nLRxi+Sh1W14R2hR/zR9JS4S88qMmcNkYpmotVCo9g
	zQFlLwRz7ydYHf958En9P16rHl/0IZkM3dLseaxRhGEn8AJ3YUggY0DDUZ5kJWdrqlQFiYOgjGO
	5ndA2pyJgp2ojK/FGQ3+LpRrKHLjOmlu280NnP2iMvrOq5SY3Bxg0q6i64wOMDXiaSGdw+rxJFw
	=
X-Received: by 2002:a05:600c:5487:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb88813157mr44144925e9.26.1795160043279;
        Thu, 19 Nov 2026 23:34:03 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:02 -0800 (PST)
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
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 03/10] dt-bindings: display: panel: add LG SW43103
Date: Fri, 20 Nov 2026 08:33:51 +0100
Message-Id: <20261120073358.10267-4-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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

