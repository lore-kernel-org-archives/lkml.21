Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483715;
	b=GxmmixWL41uJtr9FtoE0s6RunZo8tP/JsYWkMWQrJ75pNLQygbRIxPEQ3mfata4AN7YC
	 qSMIJLUTWhMiqpBKJLQhXp+cO4uAfVymT6ebmcJ2XM/h8DoSqjl6vcRhlDEFIPYsVvnZW
	 TImPHjg3NqolXLfjB7zjCNNJV0OxyCFpfI2qfUuDhVtDhQOJLaYjFvo0YXoP/tmpXu1HO
	 zkjxGsyd/IJb2mjy0EVj27HWl5G0Rhw40YNf34GZ4ISc7w3Zrc9809SaeLmQE0/KCRZn8
	 1w0RTnqmGvmaqp00CzmLQsdhgQWNTr7+QSTdQajkETeGUdwp0RT9l8r/aklI68T/MIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vdOLga9Vo4Xp9js0CC/DhzZs7tFM2odH8QHKwA4/WTk=;
	b=5drbVhrDM43zaA36bg3OKMEWaKFzAgb7Opk1n/mRYQI+W3a5dW/kEwgLI1IMpKDDZT3i
	 jmojCv1BoKe9uAW72q5mgMW7YKb1VLTvA9VxM+L6HaINs356Um6I8gDDwTEaF/033X/gl
	 ynA0yPqLUyKzWzH/iyEA6xF23UFW7eWJM1ZsMTa2TgpGbEzTC2G7AbiTsEfb7nfYSpuF5
	 BfH3hQaOHu0BHwJkNC6C2PJcP1W7G4Ol8b0E9BltnDEL7sM6XQ6yVkp9qy/wAJaIEDJ/i
	 iTKmsNQaOCfqBOFEZ3OORc30a1siut4ryDRmHsKdKL+vsrEDSESV4sFD5bq57Xwcd0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lg0Vprb4;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94EF606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94EF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lg0Vprb4
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1834631b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483714; x=1796088514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdOLga9Vo4Xp9js0CC/DhzZs7tFM2odH8QHKwA4/WTk=;
        b=lg0Vprb4kIAFuRBvNSY84P66mAbVUF4MdzhoJEatmAcGWTe6aVLq3UppqjGFNRNnDc
         tuZUASr3B7ypno172TT9ZXiWdrL/+H83Z4TPYoBg+2bgsKXBX8uV74Sntdj0Aq/zsKet
         XsEzDUuul4qEYvPSw8fgbD6qM9XlF8Y7vE8suEmPpcJX1d29uPQFTmrVcRXCrKo+5hp8
         zAT4TfmVT3GI4sIl63vtD+tPTL3Q+mlZsiGvpbpVIlM0mSaV3beH0tmP5IP9ai0gwLma
         7Z1iqB6qu4lUJIJNEEQssKFlWpi6YlBZ3sGC5/FnfsaSroIFgkRmlXXp8MHY1CD46W/P
         ImNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483714; x=1796088514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vdOLga9Vo4Xp9js0CC/DhzZs7tFM2odH8QHKwA4/WTk=;
        b=oapKJN2T6Pqe/lNcwft4AvrIXz/9S7fD2VfI5LoRFWz+G1fBdMyBy93rOOr/KmukhO
         iAEIiCF338CIYIGlbYDH0QJ65oNlNZr6osc6x+KPE1bpdCnIJ94llAzOg2IbrM9AULYH
         sA14jFjF0X7Gn5lnEanJP5wfgAMCPxk7iH2W4brdmZblQ5fz/pmYXaA9JhQk1dNOe56W
         1bzLBSb9UpuzkUwZUU6VxSo+MCJbrPlxRFuNanblDxMdTFHAsoyhqtAmTQJ9bCFLkiMN
         4Pi85b+RIl2k0UTk+rWMRouo25Lb/i1Zb5fBDwSlRxpt4ih7TkOZ5Hx8IiB9phJBuD3E
         34bg==
X-Forwarded-Encrypted: i=1; AL+hErErZ04B69Cn2AYABDArWF2asTdjGtcla35E9Ax6u5AujWE/+BbacUq1SheG/qdcBHe9/C04i7uPm6eZ37A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tFDrnpB0aGcjyIK9+b4F1ZFBJvmAPhdMLurek1XN9Y2wS+qbU
	3KXP3AoEoCCXetk0q1D+nqYclM/heFnr2Pq9zrqfTrf786275vMVjj56
X-Gm-Gg: AZFdTZfSCqOFApSl+t+DRr3UkVs0JKkTQsARM4dIGr49oU5NrXzdbvyQzpfybwRvoQN
	34uGuwbRW/eJoZgzibmQ9BY4cVpzk29SrtJXZsy4zgOPFWiMbg541iCr/TZqQ5LNd5Z8KagNdcN
	Z+0c48GRbkKjEtRVJjPuuoadZf9sOEjfQEGcJdixD+CrS7CFCUv6FA+MJZIsJ6IZqEU7H6srMUn
	S+hSuWPL/vVMp9eptegvN2+WQTSjFWxQN6mogaVyVNeljiUrMZfEuPjvoqnfhwbCwjDib6V2+5v
	gk8587M0Aofju3cHcfDXcLUt3+Bhgxsg5lVUxQkD66NRETJ1C78qPEHKWDJ4kgOEv/Pou+gA8iK
	IbU7MVZvrnmeApqGCf0j3nnvgxodjfXDkAb5XRW/xF4TJSjuuZn8rhVl/cGT/6/zuL91S0R/hEM
	xDbwikUTsKKMcf2Mfg8bRqP2Ex+uAmzRL46HW0P6MR1bVaY3E0T6vHdEYg27n2TxEMn/lrDAhx/
	wSvjSGStQ6PW1IfMA9wakzYZIKR4jrnv9WuAQCL4BF5WYSHmffXezSP1gTgKnNPlnVETkdSFh1i
	yBo5Q7k9Gm/8e8ioA21eKcRPXrEEa3wmsZoyyvHj9tUwOaOUGwRUNvk=
X-Received: by 2002:a05:6a20:1bc6:b0:3f4:79fa:414 with SMTP id adf61e73a8af0-401bb21187fmr9289912637.13.1795483713931;
        Mon, 23 Nov 2026 17:28:33 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e457d1sm6115243b3a.30.2026.11.23.17.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:33 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: watchdog: hisilicon,histb-wdt: Add HiSilicon STB watchdog
Date: Tue, 24 Nov 2026 09:27:35 +0800
Message-ID: <20261124012755.328774-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124012755.328774-1-mmyangfl@gmail.com>
References: <20261124012755.328774-1-mmyangfl@gmail.com>
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

Add Device Tree binding schema for the watchdog controller found on
HiSilicon STB SoCs.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../watchdog/hisilicon,histb-wdt.yaml         | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
new file mode 100644
index 000000000000..427225c9aa46
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/hisilicon,histb-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon STB SoC Watchdog
+
+maintainers:
+  - David Yang <mmyangfl@gmail.com>
+
+description:
+  HiSilicon STB SoCs (Hi3716, Hi3796, Hi3798, etc.) integrate a watchdog device,
+  which triggers an interrupt after a configurable time period. If that
+  interrupt has not been serviced when the next interrupt would be triggered,
+  the reset signal is asserted.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hisilicon,hi3798cv200-wdt
+      - const: hisilicon,histb-wdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description: Frequency of clock in Hz
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/histb-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    watchdog@8a2c000 {
+        compatible = "hisilicon,hi3798cv200-wdt", "hisilicon,histb-wdt";
+        reg = <0x8a2c000 0x1000>;
+        interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&crg HISTB_OSC_CLK>;
+    };
-- 
2.53.0

