Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190097;
	b=G1yCkarEpb6KyrzHRve0lx0dnzmeC7X9DJglSk32NeefSBHOdh5qm8kTjechPJt4CAHZ
	 9iaLtp7c/Fjq4mccLpbuNNsU//iG3DZNEO13lBedFKJtZFGdwkJ/TfWg4OJhXGjYCzTAs
	 3WWmAFJpWOYPuVdRRuEOV8ylq2SHa+Q/gxX3tcTHi+St522pA0ROsQNbH8SSRBUo8fhZu
	 hPP6Ae1LF+bm60q0TDTWe1e+FclZhLmxH9Bdbn4szu3E79Bd7vTgDg32+T5zfpdYljPrf
	 JB0YFSpIqV8EtK69QNcZlLLCh5DVitLeLwcY9IaHs93XtNW9FLRKOR1czbrfdTMmsDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
	b=xArsCqwCW1QVEMwuQW6YC2dMzzPkjZi5DstSmphnUjlNUEkrm0w5wUF5GafXZu+gUqWO
	 u2Z6YYGgAubg4/DjpnkC3ZIsrmlYzvfjjfu0/69mAGNXb9CXcYNvG8CJHNRYd2bygYzmU
	 UAGQ1UZPd8DeuaxhNMph8A5Uj1Ka44V+9P+VECPwte3VnRLkbJQJkuLMOSRYCZIiy5CrD
	 GNAhcZ6AGVuZMYZF5tqJ/xPhplp2Ff6tdRkVaVioM/uECKin0RJTWDlrk8hvAhsV8RlL2
	 IrqBI80kPoYb7PORftt2VSkTIRv/WzfLfS6Xdp8DUcSOmV6oF+OIrZUdbZBENSF/j7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpaivp5c;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE0F60A262A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCE0F60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpaivp5c
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so9381615e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190095; x=1795794895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=dpaivp5ck36xhT0mSf3cEhG83JMNpndV/TDWJHrvmuFpnac9HUTpZp3vuYPaad/kOo
         RGhn4lKUpnnVcpFC/yaxfCyQXeRrK979BXupamV4LBS+vKLvlrb2gh8SWEdAy0rpHwKL
         HhorfYU3lt7r4/teZcJ6M9g0lzuHVgrF4jtW73dzFzeHF2tAerfB+OG1PlLOYWMKRgu0
         7Km1MLWMao/4k8glK8Puv0YOdJpzpv4mYxmhlkhmLPyJqN5QDMkPtPizb13BlzsnWgzO
         MPC/kwklGeqDxJnmDreueLfzrZwysMXydWVAwE18acn2eOJSoHSeh0N4i4U/aAwvZJ4O
         Hpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190095; x=1795794895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=rdW6L6SkDLAEzsLASXs1ojevui8b/WlR4GAWWIKu6Kw2RGVETztl/neYOoAaatF5hq
         /WzshfZc2ugBiVnF2B/zBb/94pHrEiupud0rb3UXTX2gz7SsIzZ1dmNH3eAVO34GE1ob
         nciAA56v30fs7ZA2ZMWO3if+ivCH2M3VVfOxorYTNG16plvjMfbZP0fpW/4WDPnAc8/w
         G6zI5xj/nKCJUFmTHm6VgBroNxpY9k8MKZxyoR2r9YenjaI0X6SMJTgQgA5cC0KOpRvL
         e8jc5/1DNN2UWHxhDS0Jiui8EnjHXBvz2xO2qEEMVBVGa3OcAiD1jV9BZshYWkTBe3RM
         1efw==
X-Forwarded-Encrypted: i=1; AL+hErGNTP+2w7Qxni7kZ3kBoeSp5QEs5L54SOKG+m5xWiNdLKBPHzHFqtwEWiFLPhVWbq9xydXWXMpDagsp7Co=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b7O/xH7JzLR90HQaGO2kC6EbBXQa7ghImessdeFlb++9iJHYO
	dBTYMGwFCH50Tu9QbBRI2q3noNcerWqJv1xUaGtv2OhW+aEnkpc3RGH8
X-Gm-Gg: AYBFou08WQAOzmFdP4WPqji2NeqLlE1o4HbjC1bMYT+Rud5w0ZmQPuC5tbLJ4a5ZinI
	Lmh5Lxdiw77ysE8qPaQaDgdJ54e0AwjyaKxvSm89K3MaiiQv+UzUnKFNE7Y37v22Ew003v9/+WN
	w9qjqjojCdHHOEqwFhdujquNusEAYqWo14/pKVict5XStoJpFfz8Ii0Oi0egPpUs87ff9JnSUtc
	tdEvuZ4Yt5I2ywdPnzSF8nX/h6Y1nrAkcyxmS9i6jnCBqWCifIozPWaa6djEmZSrV8Kek3wYDuv
	p5XNzWInlHGMY2uRKuaRrrwYwsYoKq6gl0KuFIakyvdeHGSph+z2loKT+3HmNsu8bLURGRkbzoZ
	iOSXx9P3d8lVghTGAt8iHBlb4NG0wdGpReQddGllByGsIecexsBnSoqcyp75httN+fhqrDtBBfl
	pBd04nV87qqkYcaYhtRfD2sClFqBy3l5DaB35shEegtpPqXGOv/apkGGZrrSd2n5Upmli5SzuKc
	J5E11uSvqgAPrJ5foVB18QulExlP7v+OQQWfIByS5TN4G0OxjwCXoAx7Vr31l0gwniNtUhjGS+/
	/GZok4Xo+oscZ2dp1pRRr5crq14LOIuCbbfCb+VeEsArc1YtBRBQ6PUuOdfYEQ49TUmyAPwTMaA
	=
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr89360365e9.23.1795190095071;
        Fri, 20 Nov 2026 07:54:55 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:54 -0800 (PST)
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
Subject: [PATCH v5 03/10] dt-bindings: display: panel: add LG SW43103
Date: Fri, 20 Nov 2026 16:54:42 +0100
Message-Id: <20261120155450.7719-4-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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

