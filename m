Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190099;
	b=WcfRY6Ygg2P7vrfnr60adQnkFkDhzA20memuM/ei2NEpHb7ZUcYR1cEAKzUASLfbxlGP
	 /kjR1mdjcI5ipnqyGu+BbGHYAEundO908/K/yGwFHXIL9uIZOxgdAk9YA8EulyH3irp2W
	 nrkDLqMLOIPSOHsOBDdSKBWPo2TyfJlxgz7O3n9Q7JPiUl8QijK3m8JyZVyJNO8yYVmnr
	 3DU7cdkOaBUpEPG/Gki3jaHgZxMl4SOZUDlRUk3jPArmhkEsx+cVXUvHGbiYqm65oFynS
	 l5JnlF9NmWj1FFtU9tLdApgExaVR4cf5o3ViCvbpNNhau69AcrAWq9o8h6ZVoYSVQqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t5vfznkr0ETpK/dRsbewXSnBOXbKtjjAozkIrt96x4M=;
	b=OWyBBZcnmuI6GXSL1u6OKAsxxxRXok0xenb8frUQkhpUWlxX5CzcuPqDqizrq0AyYI+h
	 3GpIP5Cve6lbameeP4fRghWvqcNbURea9Kye0WL8a+aDLS4F6cJYlc4zhCAYcEoJfbnNF
	 Y9YWzW9c9lh+X1S4owmGTb1BY+2lZ4Mrso9LiPuu9NcrZBYYm3mQ0QblnYqIYHCOD03PQ
	 b+b8aJ9oXWqEOuqJiJse474cLib61OEfiwevFCR6KIN+I/GUNx4nTPB1EA5/HvXyqgs6W
	 a3gsdvdjxPwgaiND6NJNM4KgsTidmrOddlhV9ybU3RFypCCBNJ0/a2I5e656rs47mOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwF0frtf;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8886B60A263F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8886B60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwF0frtf
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6140645e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190098; x=1795794898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5vfznkr0ETpK/dRsbewXSnBOXbKtjjAozkIrt96x4M=;
        b=xwF0frtfkMY1/qxSag910+kpSRw/8ZVubpuHSxXAaNIq9SXBxwLe1oM92PaVz6Wyzj
         vxastdnUrSKlzDSgoIAQAcBH7hbsaPd5hq4pfvE0pJoJglVlIC1KVSOcER2nPgBLgG28
         F1eGt8MeHrxFOLnEU4gf0ZlgffcQwpKbgRUBTLzAin0a0I8t8gBOGm3zMez/zPaorjUU
         pfTYKnbXgR1nsXluRpvk5bdFa+5BxzTg9G83t3RyJJqJk9au6RC+zYZDpKgQfKg/4PQL
         FebUt9XOCiKmA0U9r0ueLv7OfuEBSZ6M4CLvZBWdSjN8DsD2jfRkjSxr/QLJCDnuwNIf
         HhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190098; x=1795794898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t5vfznkr0ETpK/dRsbewXSnBOXbKtjjAozkIrt96x4M=;
        b=NSopf2WzzRJfC/pst+T30nOl+A9cLyPaMIPFqomhRqRwqch0nW1g31PSr22v/gKUJy
         ne4HUiBuGImbrLfEIehI4pClyUSrPX+Q53k22RNqbNCTRFilzvspDFa0A6E0PkRdfUZY
         Z73ZMznHwLWt3FGuEgq73IGKeurrLc3EWv3ACfSqQnLjcADmdHyTJcrLgifPmRtl0T9u
         eUb5ocDD44TpoEIndUDmH5cRykZ4x0ndPhCehGVW9htbxPgmJHfoIt88JQsbxXzysB1F
         Sr6rMe+RuFrxPHUxYtxwZaEoTkhn0zy9cf/B+YH8pTv13+y36fBDuk1rgLNBk79ke7MC
         Ehkw==
X-Forwarded-Encrypted: i=1; AL+hErGed65eIHDIfPzWGtRW/UEvGgXoSt8Kh1krEnkSB6DdnmlGFPSRYJYl1Vo1bani5Bte98mAHRkqdHa7UXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sE2P41awYJlTDS6VX1FBm9r2Z1W3PRao87Jy6kK5a6yLXf/co
	YCp4wkrxVgv4rGWSgC4Pqskd3PseRmrnm6Q4MGOimV0MGK5GrcStCMh3
X-Gm-Gg: AYBFou3Zg3bP3Btoqcb7ImtjMkHSrobj+hVTJSqWYVd3Ntc4Rodup8WuyNikqL5ITwS
	//cYw1RGeJ+/khzs1JMeMb6b9Jvg4OCRBSBEB+JfMGW4RB9iuTlRlefzQLaHPDIzDIP9TmBBs/i
	XyvFkHwnMvC9NtDXy720nD42meGVDtyE1sQSUeDITtn8pW3rb2iA/qeQSGbkF4Cts/0/Nl0fcTp
	oG0W5UVAZiqScNfjRzZL5QZi8peccHoClKb1jXW9HTxj8EzAonLR8w/f7CHDrDBQ1r0eyYO3Iew
	qEmagXJYv3gYVgY2czO6CQMTIGuW4SMMZqDce3uGxwwbBEJjlnZ168AARCjaDMET4KaqxSsTQ9k
	tZjuhhHgqrgGk4UbibqaOe/IIr2poXwal5q2unKFoKGx+aN0j9pYVTwSGVsMucb6BzCSRJMT8M0
	aCKkt4ymulKv4Ea5aW0x7GwK1RLJdwctJjRfc7tqlf6DMTVA1/+kTGEHRF8CL5trWEKF6iGtqst
	2LaHB1rqbBkJ4v8zeO74sihRCIfRXmMtP419UgP0rfwnESR0obg0zhN6rnipaoBzk/sq5j4XyBr
	G31ObIFDqsnDDHOUd0IewijBtfYD0hgxts2hAZqRvdU/RlBdhtL4z0RUOXDIK2KqtX3Xhmr+y/8
	=
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb88819940mr86535245e9.30.1795190097249;
        Fri, 20 Nov 2026 07:54:57 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:56 -0800 (PST)
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
Subject: [PATCH v5 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Fri, 20 Nov 2026 16:54:44 +0100
Message-Id: <20261120155450.7719-6-rofikcoga@gmail.com>
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

Document the Silicon Works SW42902 I2C touchscreen controller, including
its interrupt, reset GPIO, power supplies, and panel touch properties.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../input/touchscreen/lg,sw42902.yaml         | 72 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..2d6d9b1500faf
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/lg,sw42902.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Works SW42902 Touchscreen Controller
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description: |
+  The SW42902 is an I2C capacitive touchscreen controller used on the
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
index 28e4aac18d44a..a29019d984393 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25835,6 +25835,12 @@ S:	Maintained
 F:	Documentation/fb/sm712fb.rst
 F:	drivers/video/fbdev/sm712*
 
+SILICON WORKS SW42902 TOUCHSCREEN DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+
 SILVACO I3C DUAL-ROLE MASTER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Frank Li <Frank.Li@nxp.com>
-- 
2.39.5

