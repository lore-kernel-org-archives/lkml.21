Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447693;
	b=vfPDTCsFQmkWQUBtYUKZCbNpPp7Rz1Odjg505UsK0wX9AHjHKxV+bMc5GPsjxfmUWcFE
	 Dr0OlSn2g6PiPrZxj+LEIZgXqX4DuNEZv3iFTC7NUGbuS+QcHU3NMpBW8xnXk29TsNzZJ
	 kWOQHpf14P4Tfeze6c17lgXo+KTFto6aKCJsBRFpF0bkvvIrjYhFBf3BdFiuU6vw6Vvd3
	 Z5eN9hraNdkI5enW22AvViC7cZj8zMXEfLctx63zrxjfR4F4TCrqF7UMzGlRBjS9vMSO5
	 OyPP8qUrmqjWqhRmy/wzbpoXznndPyp6yNT4un/DC5z/0ymDzFZaWLSxLQ5CO3eZWKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
	b=f7phRyNEo3spnnAwBDWB3gSttMitRM4ncBeV3zOVLDucjMFaQcW+Pf19+BGPQ9G51EYv
	 zFLmODBoxCMVGEwz1qkS00dy9F+vAUA672EcQdZ/Xa97TieZ1vr9J2xEsH+DY/GzXIgho
	 UsBzKDifXimy8HpScK9bGGwYESLIfr4wsYsrMh/RUwDPNM40FUPTH/4rAPfs5+r3p9aHa
	 QuBkfyASGP/0/6gvk+GJGj8yXR4FKtu3IdimEQNDMuTLSKCBuDH1h3d6+NdsrJ4Neo6fl
	 rc2XpD14puO/fd4R+C37LkZXzhgGoCPs/OfLwbObqPmadQ6f/U3RNeo98xrwrsjx8hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fuKkteo1;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15DE606A337
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C15DE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fuKkteo1
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a315ed211so4367724eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447692; x=1796052492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
        b=fuKkteo1U3dppxRP2dfHZJlaJGXVfzk7FUDnXt8LXhm8fvRhvljLUCN7f18PvukRPU
         WWDpbqYrzmrS5+PO9OZTwcY/Y+zcoZbDol2fisOndc8AkOhk4n63tiyyp8khhsZbSFYz
         Uk20qp+Ms6uRkWeEuv1pAZOzSg8x3zA0PNd6YMcfxGvwxLCQar58MFTeiqu5hvr94TaH
         P0p1/W7tMLT7DLuBxYK6tVAoIIeP2XxRCOXdyHU6uJwrTVyiDpqMLFS7Y+hAnrJO2pKR
         LOU3lWmb0cQJnm9tz32aC3NKKysBMksBDm66doIzP+z2/Ai9KT/lYg6QBoD3jW11k27I
         uE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447692; x=1796052492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
        b=cDYHwCdgDcW255YKynBDeDlJUyDhRusbxSyRvu2hjA5H2XPbOsEJ/+HfcVa/59w9N1
         dUCMvO12elpOA2fdvKxsnnE+6VRFz7+Ol3KwrKhtJwk2HGz/GDHjBlhZmnPBekvvfoBe
         iBDFmHH+4CIrxEiYcI5ZbPBdPmEboT/Zf9o+u5KJX1KRj60V5Jfwhcj/2vshIwLNtQSa
         xYxiXNCHAiHFUdNzmmSLenLsNNvSFdaG41A3h0TmR5DpZI2Y8O4jdb0gV9HZk6QVJtqb
         3PZLSb6oBl9TL9yW3suZb1u8R8pGAiub2JoRIDOfoZ71KeqCdD3uB0mrUy4ux0ob6LW1
         jVJg==
X-Forwarded-Encrypted: i=1; AL+hErGS1YEwbI6IYFC19Kp2YamzuCfGr6xwqc0ZPG1h3l2Wm6TlGFhcgXAKpWRlOAaZgZYmG6sWuz17ng/+UEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fnRmHb6PPYqiNnPukM9gK5rt76PBjW6Dj+rrbVwgNVDu9s8Bp
	Ns00jvjZCgmywIG3vziv3Ss5u4fsqPB5mT4/hyQ2QKW9M5yepeZUxLte
X-Gm-Gg: AZFdTZeC+KHP98tNCL4JuKRnYcbzO0j9wLajSORCqT957UZlrMleQBgjH3i4GKtQMXH
	utE7lsD7VNJ0A2VeBd6k/fQdDvqZLD5UH/IDTb4nuckR84/xCoCMQTbgEN4iHUlbBTQWo47XXln
	VfzdHhaxJiCXg9qBRgAC0Uqz2dn2a+NojCtBkpUzHc09zKE4kArS+R7VxRhBwGY8/4LTobZ4NST
	BOu4s/rSloe+1EYVc0gcNgo8M/LV6waG+CYHPFw7brC5HUGk8PsfSbKrzYvjjiR0SC+Aw08Xjvt
	TbxZ2Q2hg1kAtdRSSXUW2tU/4z8Kqjsh+OUq6WzjWH182rFlhM4rM0BdIXn4gU4mG9OLj76wacM
	sMMe/wR2WQp/zs8wivlSm9IlLHtVOHe23kYI0MBWj0AeKMIptrXUuOxoQuQj93A7FD7LN4M04mM
	mO3xNxdhWhb8Z+8fFwu6GIaZrnxP2ZMz5dKfzbnmvpjGWFodze3n2pkXfP8cC+ZARxVdGpd5exx
	7uR4DhpkS/lqMk8H77Br5gOz34eadh19z0izTVdC66KfsbWkyLtYidQa9dz5gKpow9R3wBAY6Cn
	VzEZlSdAKUQ9d+5Pe3bduia45u9s9ehpJcoaGJdRvWLrJg==
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr10401298eec.18.1795447691706;
        Mon, 23 Nov 2026 07:28:11 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:11 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 22:27:17 +0700
Message-ID: <20261123152722.168879-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000000..7c538e48ca25
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k5e8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K5E8 1/5-inch 5Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  Samsung S5K5E8 is a 1/5-inch 5-megapixel CMOS active-pixel digital image
+  sensor with a 2-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k5e8
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  reset-gpios:
+    description: Active-low reset GPIO.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (2.8V).
+
+  dvdd-supply:
+    description: Digital core power supply (1.2V).
+
+  dovdd-supply:
+    description: Digital I/O power supply (1.8V).
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@2d {
+            compatible = "samsung,s5k5e8";
+            reg = <0x2d>;
+            clocks = <&camss_mclk1>;
+            reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&pm8953_l22>;
+            dvdd-supply = <&pm8953_l23>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <1 2>;
+                    remote-endpoint = <&csiphy2_ep>;
+                    link-frequencies = /bits/ 64 <418000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

