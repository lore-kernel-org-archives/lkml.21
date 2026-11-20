Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174869;
	b=uEagA7deypGN5aUWzPl0wmjSU0RC1yBXiab8bviZ9Gl8ct0h8P+C6QEToFTQOx2zJtcl
	 YbfTZ00ADEy+Ju/UAvxHJVdoKsXdf4W5C+oAoMpamttS7+f1fgty030OymPdTG/VyO3oD
	 p4V5PHpT6eoo86Olv68ks5hpoxs8BPABCOXBSQltr1XmXt73UF9l9nglIRyvUf864YfQM
	 +vmbnOn+A0fT3co6d78gvsq4j6VZMMUjg6/YkGFzPhJPI/0P3gX5sGUGAjHXlTfQaUpmv
	 hrhDPjPjLWCQsnqlV4AV5gvVfXuw4uIc9Z6nO7gqdEsdQd0s8IgorgC0+UyC3xNivYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=N+qZJp3IOLR8W+jXWOKTm3fVJRlvPeQHbpUSJTeUQL8=;
	b=dUwuaxxB8Jjm8+atSJf+5EVsPAA0jTbkTeG0Uyo3DQL47MAMYhuis+45rRndo+H/qHZF
	 qzXVjTKjVvTIAgkFaukKKyur0N1IScC5Z/J5XtEU/V0fedwq3/FwxbyJZ4T5L3qQ/oItz
	 Ndot4KiPiT9EDvmQRT62Y3H2es2aFva2nhC8IUx6cJE6BXVvykWyqSRYLYFC3M9wWQmTu
	 PTaroFw4TdUVVq3h4ypSF5bEp4paUtqiXS+jUsCtG6y77rXTEYG9FfmyOzplwdLgav3WI
	 oeMrkVVasc19xwL0eGejhZMej4MkL99txkQ1yJlm7RREu0OfAkahXh8QD5ESFuOGsPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isPgHmkH;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BDA606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42BDA606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isPgHmkH
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso7956705e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174866; x=1795779666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N+qZJp3IOLR8W+jXWOKTm3fVJRlvPeQHbpUSJTeUQL8=;
        b=isPgHmkHV9iIYt+n7ShKmBawSwEeRIaHOEnivt4vsy8h1bDt1sj4FlWf3hTPlSsP05
         vdaul1NIZAYpm1OXH1yBtHJx6n+2R5iNAa+VgFgqspJcCGIYeY9dNg78FCUBMUgen6xi
         oAK5f0EnOVnuEZ08WHKLwBFf8X2+nry8/3Hg53LsjgKV8ZXoMidErWSS5AY9torwZdCF
         DUkn4mTHKRKTBwpmAFqLusqW4m0GNIqft/7jzBdlYRln8O+d6ze/dqOcwpypU/O7oKBT
         LZnBRAimH5ChiPKK7BLnIe0heEKK8Og0SoWRcKroAGjFYva1y7as1weBDcCfOBK0XBhi
         6sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174866; x=1795779666;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+qZJp3IOLR8W+jXWOKTm3fVJRlvPeQHbpUSJTeUQL8=;
        b=UuzPbqGgcQ9LfuXLuCuu2/j6XipA6xgraOis5CU+39bDYYghC/aVgTFLg3w2fwxMqP
         cBaI/d3n5FzK8mbDKsQonWrom/BaixWqD4NRj7CDEolRJB2ln4YFxoIZOlPX+o0/0khy
         +E/aONGEjxx7+9IJPXnmS/oMHkgF+hjFOWOh0/6brE2RuzT2LMVe33Rti9TmtoaUvWCV
         S/bq+5QIPIzlDh3JZNH205YWeqSiyAiBZIvkbrM22wxR+PG5VzoNmD1hg7I7WIvVlzFE
         rxwt7VDgXAy1+v6PIBdjmj74/xmjbZWmAKzAOUEGa5TAKYCcC51iofduMkq7thWYxipL
         W5Kw==
X-Forwarded-Encrypted: i=1; AL+hErGcyRkca7JBaZuwF399E7aJysn8gkyYRUY+Zw0GJWCuvOQTMRNDHIB9yAqLi323UIIGaDtR11MH/GQQtkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fLIoORXG6sUc7KPKFh2A74OklOWpCtxgrvKFlnS7U06+b3NQo
	WJc53RkBF6+pLa5ym4I64LU0wxDa0a8U2XcOaS8DBMAoFXMqz1k0QQmH
X-Gm-Gg: AYBFou0mrPfyJ+KMKsDafRIopB6adAj75fIrxJKTpgQIBFxS6YHZsYS8zE6rzFUyVk6
	+BVMyJkac+xUJJMrDXRQ/hQ3SeaxeuA38ZoS2MXGhFJfFIS7Fwn1h5JdF2IcL1WQ24D7X3qJ81o
	FOhbk79vNnOXeW1YiFZBolkJg//U2tDTsxlAqzhE5Wulf7VWDdU3d5jlaIMBKfwToRWycUg9UiQ
	zYVu3+KGCQTZH1Z1Buso4sN2NGWz0+jA0MkRGhoUgELBWaUGrdMrPdOQk2CVuZVsSVa3H12yxGK
	RnM/C/TLVV/Q/kyoIEH1dJHCafm+oM/P25F5BcskyvLvNsxe/KaY0SZji60fe9XStW2giMN07dZ
	0QUzzT7xqf6F4dQ9nv0jAN4wAzW1bJFwD9hoBTIJxCk1Et7VqJPdLscBZEUTpyCmm8f3wXMK3GK
	/jF/fr9w1+nkK5tDZL1iW2S/1VMEYOntETY+Y01eAbooQJe/7MD0y4Bj5INdtnD5eQXEct3/2nz
	q7TDFJabD0TCRgzcnpwKtbHaOy2oPP9+WtqJa+7/h1oKTqws1uVyApaEKAF/6OLVY95e8ieFZU1
	g35K+ZVrf461H7NeQIPQj+AemQ==
X-Received: by 2002:a05:600c:848a:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb88813462mr53820315e9.20.1795174866206;
        Fri, 20 Nov 2026 03:41:06 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm27419345e9.4.2026.11.20.03.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:41:05 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: display: panel: add Novatek NT36525
Date: Fri, 20 Nov 2026 14:40:59 +0300
Message-ID: <20261120114100.978148-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120114100.978148-1-tadilhusrev@gmail.com>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
 <20261120114100.978148-1-tadilhusrev@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a DT binding for MIPI-DSI video-mode panels based on the Novatek
NT36525 controller, as fitted on the Samsung Galaxy XCover5 (SM-G525F,
Exynos850). The panel reset (RESX) is active-low, and the panel needs
three separate supplies (vdd/vpos/vneg) plus an optional backlight.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
v3 -> v4: no changes to this binding.

v2 -> v3: no content change. Resent as a fresh, standalone patch
(previously v2 1/2 was a diff on top of v1's own patch instead of a
complete patch against mainline, which Krzysztof Kozlowski correctly
flagged as a git-management mistake on my part; see the cover letter).

v1 -> v2 (addressing Sashiko AI's review of v1,
https://sashiko.dev/#/patchset/20261116070212.314228-1-tadilhusrev@gmail.com?part=1):
- reset-gpios is the physical RESX pin, which is active-low (asserted
  low, released high); describe it as such (GPIO_ACTIVE_LOW in the
  example) instead of GPIO_ACTIVE_HIGH. The matching driver fix is in
  "drm/panel: add Novatek NT36525 panel driver".
- Add vpos-supply and vneg-supply: the driver requests three separate
  regulators ("vdd", "vpos", "vneg"), but the binding only declared
  "vdd-supply".
- Add backlight: true so dtbs_check accepts the backlight property the
  driver already parses via drm_panel_of_backlight(), instead of
  switching additionalProperties to unevaluatedProperties (which would
  also pull in every other panel-common.yaml property, not just this
  one).
- Fold the compatible string into a single, driver-matching value
  (novatek,nt36525-xcover5) instead of samsung,xcover5-nt36525, which
  never matched the driver's of_match_table at all.
---
 .../display/panel/novatek,nt36525.yaml        | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
new file mode 100644
index 000000000..9158125c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt36525.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36525 MIPI-DSI panel
+
+maintainers:
+  - Adil Hüsrev Tepe <tadilhusrev@gmail.com>
+
+description:
+  A MIPI-DSI video-mode panel driven by a Novatek NT36525 controller,
+  720x1480. The first compatible string names the specific panel as fitted
+  in a device; the second is the NT36525 controller it is based on. The
+  panel reset (RESX) is active low.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - novatek,nt36525-xcover5
+      - const: novatek,nt36525
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description: panel logic power supply (vdd_ldo28, 1.8V)
+
+  vpos-supply:
+    description: LCD positive bias supply
+
+  vneg-supply:
+    description: LCD negative bias supply
+
+  backlight: true
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+  - vpos-supply
+  - vneg-supply
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
+            compatible = "novatek,nt36525-xcover5", "novatek,nt36525";
+            reg = <0>;
+            reset-gpios = <&gpa0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&panel_vdd>;
+            vpos-supply = <&panel_vpos>;
+            vneg-supply = <&panel_vneg>;
+            backlight = <&panel_backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+...
--
2.53.0
