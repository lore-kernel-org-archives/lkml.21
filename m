Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577295;
	b=5d9brIGUz6gEMvK0SCTpVR1y1f0rlxuu0zpWVbPl+ky4RN3jpRAiuXPaaw5ToDnfO1nG
	 Dr8gUZz5tdwxpaolrQXG/vqWWTlAGHwjOTqtzXb6NCmOKKT9roqyHENR9K2kFtzSF2XeR
	 jOVhbl4nOld8TWQYIYOB1BW5qm0Vw29a7jx6bTV3xgMiStL9HLEyX2SsnTHvS2mpzKz8P
	 64aQmH+BZVdv1/rkRn+0st6jc+URV29DZirKAW1uSgeUbu4jb8OeeSvkaX/7TX4nuNdBa
	 vpLvdP+pZA+6feXp7JNOW23WG3yzchhv+wY5kxZET/vLDauY2QdRAHUcmrZFZahbh5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sG4IjzQzTOsq8+1nteR/Dqn0VR6TUjyjIc18rbJBV9s=;
	b=Iv7TRmuoYJ/5fUe8ZEvg7aIlILIIT5BAwrJ1yJwbz4YqfVUzYcOjpxzBSBkuMjyWw6Cv
	 jU/YpMuGTPyFBsVl2jopk8PCimQF9NYJo4kBPfeFgtqBJQVtRknwmjkgxqly/27UbdCLs
	 dfPfnsFqam/qIlSyCcfplh3JrI27N1NVs5skrMZBErePZzLWX0VrTa8k54fLb/ORkQVIV
	 gUlcdxN10xetXotTrHLAqZwSg5AuiM8Cj7mo6hapyQEoM2GXZpJE6DBv6/RM9ACVLvL4S
	 BqB7vOdF9YTc78R7icTO/zLxUvP4cT5V36c6ZVaZfmhfp6AhjGgcDPdx7B2KaIEkkhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pva+qH5L;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14BB606A6BF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D14BB606A6BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pva+qH5L
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2986607f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577293; x=1796182093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sG4IjzQzTOsq8+1nteR/Dqn0VR6TUjyjIc18rbJBV9s=;
        b=Pva+qH5LwkfRhY/HwbuWQ54KdZoI9qwiM2ANNoQjop+Al1lt+Gs2GjJHLVhyECm8Z1
         2CChIklgFlF83RjXCGNzKTVjFdbIyeakGRqfM7vpIyAAloWFT6JAbfBg9/toCxKyOlJd
         xe0Y9nRMliTY7LRnF7+Xl+8iFb1uRZCZFwR3KGlkBm34l64abBXecw4P5+rjfmTV2VXH
         S8WeMlhR7JMXkJYiJrNVOx6dvwMRwMhrxKlkUGvXrWB8DEsZczOtWRAzorpvWKnS3P0v
         aEtnkYsRgeclvDywKMKzvJBSAM0phfesoeu8/WVlmJsi2EO9R+BLhgV4C0eCkJJdYtuJ
         YWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577293; x=1796182093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sG4IjzQzTOsq8+1nteR/Dqn0VR6TUjyjIc18rbJBV9s=;
        b=PLR8M+a1KQCFTy542wNhQPnnKczEngcYPIgM4ieCu2zYjLoBWpFFTsZkuZlgOGrbBm
         O5wifH6XH2IpXHqwPPUObUPnA/K2qqcMKVQFbTJz8zjLWLMu/uC6+/vD4t22yXjpOU2l
         1rcrAXyiVq+fO4sFl8OMUl21rGUN9cFfzlAFRIugEoIidU4xrUAx0sH/kFPp92BmFoJT
         a34qHeHCzSBFA53aheU10czfPLQ5sqMx7qye744oaJ6zvKGq4dsy6x9xBrowfRR+ltIa
         v8nxQcbFx2awbFRXGeUK2KF2sC6o+nMPffM3xdP6Vg7zoGZ5lXEBVDgzNAFMHhKRPjgi
         anLg==
X-Forwarded-Encrypted: i=1; AL+hErFxVoEVawBL0sjl7iPRXRhXiTO8gnmQb83fsQsWUik+DDl0bBCfXitQ07LafGyO6KY1acXAn1aXq40LCaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g8gF+ZJBjTyR2LkkQHPSgjf7kn3+7CDbvuuI+I4G5WILV5Vky
	Grf7o7sPoC1OuHyirLkvtEm3bXJUlceV1CsDToTJcB909tUMd4Bw9e4L
X-Gm-Gg: AZFdTZcKYC0QwI91hC3nxvEPz/ISIvMM4suFVigtEz7QlJaCxxP4xe/xnYTR76trAtc
	/7bvBEJQM0MakFdbhNga5oVP5qDufwqFVi9oSkv0208O+MjLNo5IjLJTrMBmvYI+5JQFMrrv+9r
	msh2F5jdenGHVtvZ4ocfOT8sTifhHt0MQilDVTAg7v9MFVqgePYSoSaHIdpZN6e127oy+oLWmY0
	RAkP2Lt2s3hNboPL0qWFxkToFcyZY9GHbR+Oal7y591+76EsidbndM7ukr/JKxHm6b5bUCuNRZa
	NqXI+++q1lfPXwIlIBe3nenyj4yuu0qgwoSLP5JZxBeEZbnkXyoRez+ooKzWoYwFEL2UAFAI1WM
	3rcsbXs9GtOpIODdSa5OZDpyIeNlGTDQUgumt5xhuLvTPlH2m0RWV7HbynEH0Wjkw2mjNOA3TVg
	Q9wi1j3PiuIT0jBkgRSHnqrKAXggUI3UC5hRKyGV6YdWxty8cyhuK8xp09TG6cKaQ7iu3SMRGdf
	dHAGxNpXV/ym3aL4wiP+1Ih9Dy6Gf1r6EU0mC+dzpqPaE4JE5MhY5417A8+C+Nz5FzF4NLi2rbS
	nOSupZx6BWTZKeLICFUwwHyBjD43veoIgZqUN9RdRTDIjq/xIWZLDq1e0nMoPiEgclkAx3HvbSH
	0eybTtVX5UU5l5hLaKrPAAtzToiOVj2Q=
X-Received: by 2002:a05:6000:2913:b0:4a8:7115:fa08 with SMTP id ffacd0b85a97d-4abb0f3c202mr33671845f8f.13.1795577293140;
        Tue, 24 Nov 2026 19:28:13 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm28918822f8f.23.2026.11.24.19.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:28:12 -0800 (PST)
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
Subject: [PATCH v6 4/6] dt-bindings: input: touchscreen: add LG SW42902
Date: Wed, 25 Nov 2026 04:28:00 +0100
Message-Id: <20261125032802.8460-5-rofikcoga@gmail.com>
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

Document the LG SW42902 I2C touchscreen controller, including
its interrupt, reset GPIO, power supplies, and panel touch properties.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../input/touchscreen/lg,sw42902.yaml         | 72 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..e8ef2d325635d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/lg,sw42902.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG SW42902 Touchscreen Controller
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description:
+  The LG SW42902 is an I2C capacitive touchscreen controller used on the
+  LG V60 (timelm).
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: lg,sw42902
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: Active-low hardware reset
+
+  vcl-supply:
+    description: 3.3 V power supply
+
+  vdd-supply:
+    description: 1.8 V power supply
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vcl-supply
+  - vdd-supply
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
+        touchscreen@48 {
+            compatible = "lg,sw42902";
+            reg = <0x48>;
+
+            interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
+
+            reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+            vcl-supply = <&reg_ts_vcl>;
+            vdd-supply = <&reg_ts_vdd>;
+
+            touchscreen-size-x = <1080>;
+            touchscreen-size-y = <2460>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6a41a0690d9f0..8c88429e647ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15211,6 +15211,12 @@ F:	Documentation/ABI/testing/sysfs-platform-lg-laptop
 F:	Documentation/admin-guide/laptops/lg-laptop.rst
 F:	drivers/platform/x86/lg-laptop.c
 
+LG SW42902 TOUCHSCREEN DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+
 LG SW43103 PANEL DRIVER
 M:	Abdur Rofik <rofikcoga@gmail.com>
 S:	Maintained
-- 
2.39.5

