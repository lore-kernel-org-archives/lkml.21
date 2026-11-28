Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853925;
	b=4G498KVOEwQlCF1GyTroxNw5SrvzLcSFnbrxB6ZuZnBUB7she4MBdpCFqJ1rpQ2iyRaC
	 sUpboA8QJOSVX1C9j11N44p5l+3Cnr7uHgrwAqygY9O4IWAriZj9pmvkUU2PApfs7S5t/
	 5dXiIrASyUpR4cH97hZBie/976Vf8oA+u4tspVWCJVx20rJbeZmu+ZkNScM47ydPXQA5U
	 a+NDiF6TWiI8hMv9ubaiEolBfNHzuu02NkWpTshbpuDeiPHEysZWjhSgY57CsdVq/WzHy
	 ZLD3kQMI0wN03j0408rHQWs2gshu+rqhrs9cwuTzdUxyx6ROdO32RkASVmlR6eAjFVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OYxs5uDpKgH0xFuFCpWuT5JmihYHR57LmroU0k+TYNg=;
	b=toifcTHYHABX8hvYDvhRlKWGNWEz//je/5+Cb5HmYZZ7WsikctdZ//UL3Ke3iXMm8UQU
	 +y3eiGDajA3CceBlMyZSoJHT7zoYbDQBVizhdh61aJbwfhe5IgdCJ4yOH6mzhz13HX4t3
	 3gt2L2o5Breth4A3Uq8ltxpePnrzzXcc1O/rWjFeUBoj1718eT320dRpcVNNPCbbWoOUF
	 oPqDPP8b8U/teUSnoEybEBwDd7BQ2M7uTh6zkCQLDquIrGAmlRkdyTpQK70JFtga0bIZ/
	 qHC0bSmsMzV6I0YURyMfOB4FbEgurzwj0f5KcEKt8dVfLytLURUCVuacJdn2FPROjgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o17SAo8d;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3663606A33B
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3663606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o17SAo8d
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so4325248b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853924; x=1796458724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYxs5uDpKgH0xFuFCpWuT5JmihYHR57LmroU0k+TYNg=;
        b=o17SAo8dtN6T/w6l4wPJRVwYOckpuXlc4NWF+jipEFUA8twjOrREZ0hhehFcC8+zJU
         9emERwxwuz1heHG3LMZOhvvQy8Uw3qrxO22p6mmvlZCI/69QyE3WJH9sdDj7csZ011w0
         H/+QPjZaXnomEG0UXFe2N3agZ+PrKVOgUhjTRFNnbA1clCjyXfOxjhpBkvsV4Cf7BiCq
         7ETfqS6aDMD+EFTRq70RCivbk25SKzQk75ikfhC+vQujmG9Xkqpr8qGyS71hh0s1jyZu
         55+bZ4cpVRK6hV0Mag5d9iSWUT1yNRQtr59o0GpRLDtWSu0ZX4TGaVEX8M16P4CfUE0Q
         Um6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853924; x=1796458724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYxs5uDpKgH0xFuFCpWuT5JmihYHR57LmroU0k+TYNg=;
        b=UmNjlAk0D+p8xwnG/XyncrgLX5kS4aPZemiNq8dV7Dv1LvpgJhYuBuIorFsK+n65H+
         32VK0HMLPD2gj/opbw2ocs5uPMSzBZ8Lc3dStKYtYZ+Jn0mXLyXEoUfPCu7kh0ODfAIs
         1LB1QvgKsyWYIN9qqI40sb0njNClRvyMrW2JaTatrDyGMnOAGeywZclpRTYUGxwLC/Zn
         6NO80cYjNIqQLw6pXd3CXIQgOn0u3hihUBePnVPc+XBf8VGIgrjuW9tIZ11ULH8EQIm5
         R3AJ8pVBmHQdn2U3LfWFyqExvqevzWjI6oOEJSZ7J9kUAxyB0QNiLFluuRMnmB4gajzr
         RAfg==
X-Forwarded-Encrypted: i=1; AL+hErHM/BZklZXdJZzIwZCJLagDCw9dQGnk3wjAq+glXOPjs2TwXRzPFOfZHq5+wVYQIhyxThneb4+xqXq7igo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4ggm2ojrTWRkBr4rTLsfigBldxrI+MKCcnrRBIH7s9kJ8jqce
	ZYPHLMhD/AxGoOqXCQkUe0w2BcHsfhC7et7pRYv1vBTaTavlusPWI5ky
X-Gm-Gg: AZFdTZfsX2oWqzCZorwbVDNsM6ynvM2J5bXl9qzvZ8jYVKBnJHq17/uNX61+ontuAJN
	gxvV3I9vVlrOgDI5GhlTTZAHtS/cL8wryFAO2NM2KTvpKU40wb3hombwGVwvw8N9tL0s+M9Q1Vy
	gUCagDsmefYwgT3OEs96I2iSaNy/GfH3WpFpyheKKORTEN3in+LTNHA7nbQfczXv4fTTT0V6REs
	cuVthVbdBOWPnRS20azs8ls+L++rJk1h1WHyDaTeJu+Ob3vORVdVM9aBfyDKruDXnR8bCwPYS4C
	XekUb/SoyfyMFakST22N4lPv7wzEo9P1dcs+p+LUz8BcZ4ZmT6a5kWqmIGhuED+a8HkR4DBNiVA
	/thiuPl5uWOIWt8BjxaqmVLdDkiaNGq3p3eV3E/poUzI+7AKZrE7P0kEqShEADnNOv8/5+yGkD5
	G/Z8nTlPtKKrAeodayX9GMWcXu27TePhb51eV1i06Sa9/ObnguUocJ8h0xVSiFakGFR+8B8z3H+
	yOhWS2TPemsFlMEpLTuC/xmjHVIiHRazrfOzZVqBvv0LvIyPacnAnssYT5GMEVVEzDyRZnKnN8b
	nHlpbA==
X-Received: by 2002:a05:6a20:7489:b0:3dd:d729:c62c with SMTP id adf61e73a8af0-4014df5e9b9mr30546154637.54.1795853924162;
        Sat, 28 Nov 2026 00:18:44 -0800 (PST)
Received: from wyb-ms7e59 ([2001:df1:7880:4::50a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm11550749a12.27.2026.11.28.00.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:18:43 -0800 (PST)
From: wyibo6109@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH v7 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard
Date: Sat, 28 Nov 2026 02:18:34 -0600
Message-ID: <20261128081835.366128-2-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128081835.366128-1-wyibo6109@gmail.com>
References: <20261128081835.366128-1-wyibo6109@gmail.com>
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

From: Yibo Wang <wyibo6109@gmail.com>

Binding for the OnePlus Pad 3 Pro / Pad 4 and OPPO Pad 5 Pro pogo-pin
smart keyboards, built around a Tinno keyboard MCU and attached to a
tablet UART.  Describes the supply, TX-gate and wake GPIOs, with a
MAINTAINERS entry.

The compatible names the tablet project the pogo port belongs to
(caihong, erhai or iceland), which pins the keyboard generation and
with it the protocol extensions the host may use: the 0x3A general
sub-commands grew over time, from the caihong (sm8650 era) keyboards
with neither wake notification nor backlight, through erhai (sm8750
era, wake notification) to iceland (sm8850 era, keyboard backlight).

The keyboard is a fixed physical device, so the touchpad geometry and
the product names are per-project constants and live in the driver.

The binding documentation was prepared with the assistance of an LLM;
the technical content was reviewed, adjusted and validated by the
author.

Assisted-by: Z.ai:GLM-5.3
Signed-off-by: Yibo Wang <wyibo6109@gmail.com>
---
 .../bindings/input/oneplus,pogo-keyboard.yaml | 70 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml

diff --git a/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml b/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
new file mode 100644
index 0000000000..e76e82ea6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 Yibo Wang <wyibo6109@gmail.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/oneplus,pogo-keyboard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OnePlus / OPPO Pad pogo-pin smart keyboard
+
+maintainers:
+  - Yibo Wang <wyibo6109@gmail.com>
+
+description:
+  The OnePlus Pad 3 Pro / Pad 4 and OPPO Pad 5 Pro pogo-pin smart
+  keyboards, built around a Tinno keyboard MCU.  The keyboard is
+  attached to a tablet UART and speaks a framed half-duplex protocol
+  over a shared single wire; host transmission is gated onto the wire
+  by a PMIC GPIO for the duration of a frame.  It provides a keyboard
+  matrix, a touchpad and a keyboard backlight.
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+properties:
+  compatible:
+    description: |
+      Names the tablet project the pogo port belongs to, which pins the
+      keyboard generation and the protocol extensions the host may
+      use: caihong (sm8650 era) supports neither the wake notification
+      nor a backlight, erhai (sm8750 era) adds the wake notification,
+      iceland (sm8850 era) adds the keyboard backlight.
+    enum:
+      - oneplus,caihong-pogo-keyboard
+      - oneplus,erhai-pogo-keyboard
+      - oneplus,iceland-pogo-keyboard
+
+  power-gpios:
+    description:
+      GPIO enabling the keyboard supply, held high while attached.
+    maxItems: 1
+
+  tx-enable-gpios:
+    description: GPIO gating host TX onto the shared one-wire bus.
+    maxItems: 1
+
+  wake-gpios:
+    description: GPIO signalling attach/detach, also used as the wake line.
+    maxItems: 1
+
+required:
+  - compatible
+  - power-gpios
+  - tx-enable-gpios
+  - wake-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    serial {
+        keyboard {
+            compatible = "oneplus,iceland-pogo-keyboard";
+            power-gpios = <&pmic_gpios 12 GPIO_ACTIVE_HIGH>;
+            tx-enable-gpios = <&pmic2_gpios 6 GPIO_ACTIVE_HIGH>;
+            wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f825..7730128d6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20163,6 +20163,12 @@ S:	Maintained
 F:	drivers/mtd/nand/onenand/
 F:	include/linux/mtd/onenand*.h
 
+ONEPLUS POGO-PIN KEYBOARD DRIVER
+M:	Yibo Wang <wyibo6109@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
+
 ONEXPLAYER HID DRIVER
 M:	Derek J. Clark <derekjohn.clark@gmail.com>
 L:	linux-input@vger.kernel.org
-- 
2.53.0

