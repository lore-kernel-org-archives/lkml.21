Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107268;
	b=wAXBCfRtTDX7g/Dsnvu/+h1rwQunr7TBfgF75h84SwyDF5WhvltpqfU0Fc50hfd9yGYS
	 /+wMKFUUA+mqVxx91fhihSykUTPOGJ0uV8fRkYDWQ0alB+snVHvGq1SZSSIxCO6e2qsKC
	 vwgBdbj1dYViAvP/iOcTLO7s53ulcN/ZysZtQpOkdjKBxEzjJSSjjGDXowKgfGO5+9218
	 KtxLffdWh3b9yMjDhvv3tAF8nsDnwuYf+/LuOaNjqFiupGxMWHa1izlBTmTZF7M9wWFBZ
	 8GjpsA1ejxsfFZ5eOOS0aNjNRKN4J9Q62WPG3248huO3ZtFpf1OwrPTxSAMqrwGnZxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
	b=yvmvH8sTnO7kp083iBQfzhP8szIuluSkVJEVmNHLRh0U/1gpubNiHHl+xuuy/Qv2/8Fi
	 1+o/14Ai/uLswRhb3yK2TvRpwrDQXsZp2KzROvhUhqrr8eVHJ9qB/nR9cD1bKfVnoXI6D
	 KrU5IMDQ/t6VM9b+N1MPSqP3/MvWKukIe+JvP/v4bnhluKSk55LDq+AaWpl0dN7rhmaQD
	 lKZqIZvrOkwgj64cBERYoFL5JjnAWSMLjFQGZKoBKbGWQiFuV5E0jcbyhk0AiYljLOv8H
	 3k39FtlMWKXEgo4P6ahld6/bJ/gWPSuplM00tqbNyJG2iyShXtO3SPs+Ao+oKWG5Xwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dz+ZDg7C;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B81D60A262B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B81D60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dz+ZDg7C
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso22889865e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107266; x=1795712066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=dz+ZDg7CRoUAxyICkSfyyt6wC/1KPGEqzo6Ii0+kewGp5nMjcEcYBTNjCXpxudpTjY
         R4Qf56JeUTKBjp3XPtzj6l2GLqtNky/bHv7lF4XyrVUfn2EDEw4PkRz1Wtz+WWAfXIGd
         phBHsiu1U4d31BS9e+pAE7DvsO3BPO99HGwRYogLtlgIXsrtq4bH0obS6t1dfhAshXtA
         Wn63K/4tBHKKWFrLr16DbwIK8iWjU5FTus85uzB71BynMtTtDDjV5H6lnuNIo7erzuNc
         /IaAJGbfIsArR69wiB+2BSjF6AiYqNd/gUBzgfhOR5HATERekqG90JczQSH9Oh/nn60/
         fbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107266; x=1795712066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=ZnPaocioqwbBSqgAdN2eG+ePVYScPFon/y6c3BiclgiZGHx9VSPnvpHl21UdwgHZdF
         jQ+hnkCG0nRjH/QjjObNaay6PnL8Eq5qj1mHf8n30i3Z6Fvg0nt/7j3aqPx6Q135JCjp
         OHFeWaBUy+byAt41YC6A0mEULuhjyLdqUJ7TNdxgKn+6qDoHqmMDDs9BTc78hzQn64Mk
         zjDKO2ghBrmwVNPjn0eZIwx50eHpsvKBZ/FLqU534mUtZ0FyoSRCnBEKFSLAOAa5rAL4
         eBXzlFDe2bXy6gST/dUL66wbvyr8JGWKRHf8TvSxMOqjCJJQcQtj4hvrERO+2yD+UIwg
         xmJg==
X-Forwarded-Encrypted: i=1; AL+hErEFl6+LXYxd2JSM/AlPS8/0QZqdV7bVOrZ8ThAe73kuM3RD/ulsDUPRAiVcw1drbL9wdZCqScuLTg6opqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z92wC1r4+KKQ4kTY9DWvAgSw3M2n+MI8zr72q5e2F6qG8XfCper
	wyjpRGElplpXWRv7MEYNGM7UnxtxYpNx8SJBRXvnj9uwYstxuq6gT11n/JyrwXxzweQ=
X-Gm-Gg: AYBFou1gcgIs8xxluXqAuaMYXO2USbEuZHuA9STDj27nTtxJv/lnfJnfQSADpwFBm/6
	ST2qhqD5JQ5mMccd8o1FkkD705lWoXFlyOeeklnqY2bNusmS4elfKD2fVAZ9Biywp3fbHQjI9KG
	y6dYZ9WxLF+0PgUNMKTYNzbVSbQJx0sIPZBuar/pY5b4iBwr9D+HtXsQRR988yjGdEU/vo2Ovkb
	v+5XSHNhvayL2/4AAAozujdlzhTrndrjB96erH3NFP8K9wqyo4Y/0ArPHpmmBF/o3kDWjmdz8U/
	kcuG3TQ4wAy6ATOx3o3fUKK6XWgg1ECj9htF1mwH9mcytFapQPDIfaIiXHoFiWIH3d8aGUNPgV2
	7zpKQAF+DMzFER0jEEQliRqvtdxkGQgCNYhAsk37f+q490wZd40MmQKQL945wd2LTDJRldGRAJ5
	aJWT9wl0AVY5PEVn6FV8m6O60Xkgr8g8tfNsfd2JOS00xOY/0pDRVfxqjNcW4xYjfiba0jchsN6
	qDmGYuaOf0qkIU9rvwiz9Oexq7lbjW1/0NjBqUs1sitGjlVdfxXm8Xs3UAut4UEn1COmgN5ceJ6
	hBZQ4Gqu0WNE4c5QyuOdX+fI6wHDHyJU86SaV0kWjLeggwxbw/ddsJ6WfIDirxGmYDTeVWYba2c
	=
X-Received: by 2002:a05:600c:310f:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb8881f9b7mr1875815e9.34.1795107266548;
        Thu, 19 Nov 2026 08:54:26 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:26 -0800 (PST)
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
Subject: [PATCH v3 03/10] dt-bindings: display: panel: add LG SW43103
Date: Thu, 19 Nov 2026 17:54:13 +0100
Message-Id: <20261119165420.24466-4-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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

