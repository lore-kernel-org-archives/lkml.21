Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577290;
	b=RcyeVm4WiG0KH8dtzfFpI+qapIta7aBL2FQHURbwxWzexh9m0wiLCRySQsFaRH5FHcgD
	 pNerQEFcnFftylEPWZDk2Lm/Eaj+AjZzK1dIaZZOIvbW/DGFJkAOmeMDyUqvebx0fDKPw
	 5ZsIMxq4SSTJvXgEtvOwmlLbYQoQj/8GdqF88ksMb0djBgp3HDkHkaIQq63joxLTDP78i
	 8SekIIh4kA8+Ptd2GWjgTh0M1L42sYCFg1iIAbV/67KbMR9oCjrwbl09gYIUxg/Hmss+e
	 MaxFyfgQFNz202oJSsbSrFSm6xXG2V7reqvhtpNbLB2255phPrtEMRM1GJr63wpLL6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SOkOs4X+aYTNF/FE843B5YIM2qcfhLHQtKB0HpI+vVI=;
	b=3AeeuKZcivD8ZspCyrY6rH/DFxx0/y2uZXcxjrrOoQuHfDfBAF6mEwRqBzXXjIciYRGJ
	 MzSCS4ohAmiMObXIGGMSyL4vV3KwZhCYjRaoszvf9Gv1YAZUdhiOldQxmIdUB31WDmAJR
	 Vf+SheAr/CQRYVgKVgtj9fAUvAMf6M2bTRYXekD3J7ltpPwEIRzCdklBW3jywQpNe193i
	 DE400PWXbHLhFwmtAnm8rTF5xVeNqf8O60yGJ7yNA9rAcVgKDymhwTl8b5fH+rcUoChIW
	 4wwcWjb1vdHiU+XD/n/M89n4bOLp8rBmPTeFLi2bqq39OtAoiFFxyKhIyjotJ+Z+XHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpixMif4;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A47606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12A47606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpixMif4
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so4904884f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577288; x=1796182088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOkOs4X+aYTNF/FE843B5YIM2qcfhLHQtKB0HpI+vVI=;
        b=RpixMif4Byh/aV3xfOnH6SHw4AKFvidBBjZpuYgB4fwy5TNRO40GwWG0BFFM07jT5w
         bYWsepGfPXvuthLdC9uWBn5YrDcQ+iC56WlyAfSnJP0alv38jE4vCDhVrsWFN6w0di6g
         /mS6l9NTGiuzLyYepRo2qF2ZRzYTP1cQfkHmVTuwUNc/a8RA1XJf13fpxBAZULGT5pmK
         sd54elbf9/FlRGAqyzNODLlXoOwUyvNdaFLI0uSb7zBDJe6vKmS2y8Bk+16k2QDQw+pi
         fQSQZaWvqlZhJvGYid2Yktf6VmeglBzrW3oIAU+Z6tlmsK5AD01z3VXSMe8XQXDrGtGT
         sBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577288; x=1796182088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SOkOs4X+aYTNF/FE843B5YIM2qcfhLHQtKB0HpI+vVI=;
        b=JtVcMOuMjgLCoSR5Uw2DVfT6VqONMrwTMg4H85VOTaGP0PYFc5b2syXXcPou9aY6x2
         fTax5kV+KPwapZJrICGFRJZBq8MhMzSkYLsqP1nICrTeEKQToURTNJYV97xpp5l4Y72k
         C1EtSzzqwkty/z7LUgDMlP8bGxiOfmR5SKV8TCk/7LhNjHOxIzKU4Q8absE6TPhjuI2e
         IC7LfYZADxIi2MzEBx5sxEde4wPanNEKP/gJdzRZfYc0k3RxWZWVPLxoozEh8rd++M7+
         7/LwOmZ9SNqblfH6ehJ7yj8QIbeN/hQhQXCpReiRCUbMlAd4CjdDUAgnWZ/mJI9CpHtd
         2BSg==
X-Forwarded-Encrypted: i=1; AL+hErEPR8Rj4xmn5RuYLzCsX5rUI8eNWQsikYI6Mc+Whushvr4QpZ2YjsxLD9Z2w6djrktUZoP+WzW7AWgJqBI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2+AvymdPfvKbGaRdCAT2z7jncrlA7XQ8EDfbF+cT6bEy/ySU+
	JjauhsfxioaHJQlzv65V7SwVmgpaJdcMfCOH+sFaIpIN7VN7cCZSprDz
X-Gm-Gg: AZFdTZdOjRGzkthrCCPKrEO5k9RS5LQHI3kvAauPTY4U0TrOF9nuJzyfn4psWZkWtj/
	VFKc5Bn2t2EaSK02PFkXeuPesPG/Rb07/Qn/m1sHzkJ7emEZHUNqAf6VzNB55XgiLU3Fq1t7aN9
	j3n5BRxpVd+fJBzqS42tjfWhjZUfi0pcMUCZVsSGiQvSvDQG5eYXQcVgOrH9iQbgoBGCVYlJbVl
	d2dJBz9+cik8+0sqD5CfKeqBfk8J+8udYXyKu3whD4npdF+aVl6eFFaxdd04ASS/KKxVcNG310Q
	Wy7w16wn6tO9OR1wxoYB3gMMe9FJifv7Z5FgN4j71lzucNnD9bGmlErgk6sht86cJJyziLZauGd
	tyK/p8iCkjXHI41epW2n03DhvxdwbDQmZ5k4jQv0W8t58LiEHR0QDxo9Ti6Y67fWhk7n+5Ts3YS
	uMxApLnXFywIoOY5YG0kaPeWWi7eM2NA7sT2WI+5e3DYK6A7korIdYTBJ3a137zNG6L3AB8Fbcz
	4CK9CobWkzIGjk9zJideHXyRteJNIVZPujhI2QsorMCACJ2W18Qz51VQlRCmlmMuthaMYIwrW0R
	02R/tOMASY+r2BoHpx3bd3IaiRNa3L6RxU+J1nCIHy9MqgS5VfdK89HOL/+KDYthSGDrsOC5x1n
	a9EJtwTwFNLeS/c7tTf2WrMsu1fnlThU=
X-Received: by 2002:a05:6000:60e:b0:49c:fde4:1af5 with SMTP id ffacd0b85a97d-4abb9de7e8bmr30366806f8f.54.1795577288400;
        Tue, 24 Nov 2026 19:28:08 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm28918822f8f.23.2026.11.24.19.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:28:08 -0800 (PST)
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
Subject: [PATCH v6 2/6] dt-bindings: display: panel: add LG SW43103
Date: Wed, 25 Nov 2026 04:27:58 +0100
Message-Id: <20261125032802.8460-3-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261125032802.8460-1-rofikcoga@gmail.com>
References: <20261125032802.8460-1-rofikcoga@gmail.com>
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
 .../bindings/display/panel/lg,sw43103.yaml    | 67 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
new file mode 100644
index 0000000000000..971547c48bd6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43103.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG SW43103 1080x2460 DSI cmd mode panel
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description:
+  The SW43103 is a 1080x2460 command-mode AMOLED panel used by LG V60 (timelm).
+  It uses Display Stream Compression (DSC) over a 4-lane MIPI DSI interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lg,sw43103
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
index ccbcdc0799b9f..3386c7dfb9493 100644
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
 LG2160 MEDIA DRIVER
 M:	Michael Krufky <mkrufky@linuxtv.org>
 L:	linux-media@vger.kernel.org
-- 
2.39.5

