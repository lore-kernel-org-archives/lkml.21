Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795330677;
	b=OQQEgXtWucdHzNt4SloiCIXKBcBiuGiPmLayzItPNMcWNIK612bSY+6KP0U7tdaeIs89
	 gfoPSibPQH31eroheEcV4CxHRFpdbaAn/gdGYSpn7KDWIRJjzOh1e1ZHtiIeQyenPjZwn
	 CxG+x+qzYHdYXkO8nfjKbnlcPj0Q6gN++mg7+T+drgDyXfPgkLNx8jcx/tYedCxK2Cuqr
	 hDXMhbjldP1sXCkYhKf0oB5lDg5nFzftTtBPfyQ6aa+1InqWbX5bXenVOyu/k909RZnzH
	 EvTyB1pWwTWIOMO7pWlanp9lgbmPepuj6qWNnng/S/cZwjX7gaYlqYCZjWc0Vangp/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795330677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G76uwmlV29WfUfEk6u6C04FgzxDoxsMbvwdZwFS9cwM=;
	b=XGlTIGXZf+wxSUQzRx77txv0SZydUJIbR/OrHzTOJY6PAhMuCaEytu4Iazo2cPDLfdza
	 ofBLR+T8rohSSQfZTOzxeBcbtppvYsjRclAuynH0hAI7M2ZAAJN9LVe59OVM7fs2lln/g
	 RdMYX7U776XyB6d5dFAkmHmxB/iIY1BhMeuKx/rv02ZIvU6E77CZrnDSjRAEj2fkgeSWP
	 QvihATAGCq/DHJ4vT+kUP9YpFyC9PtDmxvx9Igy7xz+nhnIO7ZdXjFkstkx4SKljv7n+X
	 uLzUwDSARloz2G6fYkCtYsch/3iNrw5aHmBVALv6k9OetojrCKqXGFiWOGVysFEx1Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dey65QKu;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34A9606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C34A9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dey65QKu
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f0481b35c9so11222635ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795330676; x=1795935476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G76uwmlV29WfUfEk6u6C04FgzxDoxsMbvwdZwFS9cwM=;
        b=Dey65QKuy1kNbc1nxtFjPImZEDLywOi7eDGPTZGQnoWTb8RdOm0thZ/x8vFm06CiAg
         QCNQE/eW2fdgDzs6TtZUk2xjpEHcWpDraKU9/V9CUgVs8fI45CeFFbBkqo4qfhpEhB9a
         1OZ0/QCfQ6D6SExkJQ3btg0bYDVBpTSOvYvAv6MMFjYM6Q1V1V+RuIUJseVa0ib3yA/j
         Dk+q8wD+2y2P5P6jQ24SUIGIBCG55L4DC92HrWeXIxTZ5On2RlhIPjwBnKCy7nGx0XOk
         BS6BU9JBhsaovZl3V9AsxilSw+sRKk/fdvbRt1sOZtMvnhHobGGYK6aByPSgtDWGergS
         dhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795330676; x=1795935476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G76uwmlV29WfUfEk6u6C04FgzxDoxsMbvwdZwFS9cwM=;
        b=wkNdb/MusUjxJ5RHoQrLdm0M0+3c0umC9scdcwyevypvktqkr8azTNIoOvYWu1D5Hf
         tMDrdrBjKZNVh64s7lllmnUGzmt9yrbE0Fw3Kmqs+qmQVeM2+O8DJEri24AuYwm6XlkS
         Bn+yd6V9GKktkJTbQaeox7wynTtUFU2e6hF0zYggZA+pKHDKyOMIQfegk7UkOWWaqkRo
         tyxRqKVZylI1teU2nKd88KCkgYNVBPR5EoKtUWrIxOlIt/GGZyjNYgHDpQgw3EmsTaTb
         JY70pT/DTJPb4Q7yFc40j17scs6l6JiKp8qyaHyiMLmWAC3g0OAClSrJuooEKZqgY6by
         mmOw==
X-Forwarded-Encrypted: i=1; AL+hErEQinQnMgf1yBFV1CaE7oEQMmVI164lqEr0WD6FDkALaPgNXZDDikSoUIg5lNe1Ql2xOs20IMLVedCq2NE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rni1ziDEgNCv2LVgag8HmgJdoDFbdYeLO+jIPn4jl0xMRIuPO
	/2MMpoHwAXMX2EI6Dgw8Hl4dm6Iz9A+MuEcN9mROngQQ4AKWVoDgZyCy
X-Gm-Gg: AZFdTZe4ziQ6Z7jerEgk8qNdK6Aw1N1Fn2hQr10qxdspNMCHrabJsml4P1LqdwBDbyv
	gAWJULZyi9FYjpGh3wuTSts2di1b0KK3IPzTezyVdSyTIkGWXiDApc0C3j5DwLZOkp8KTYJNRnA
	U9ALLcUvi8O+inIQuLt73Mf+wq6bWd5QRMJO5PFKENtfAHZj0/j0FTygSdK658Q9WmYdGTZzndf
	pZroAjYd78CDjvS0Fj6X6vrobpRt5iirKn7p9yj3c4+6bPn97zxUgMTExBckQnuwWU6c88Cb9kY
	16j/nwCiUPTIQZy4Ek+34VDpgZKtQ4eK9TLHQR5FT3sDsCk0ZeH6no2FXgIYUa6mc5COEi45gm7
	/szqSCSqVLyDkSYX364EBK2TnQFTqRakGVxvU6fXsKyl4gloAK60qiDhMMPi6LaISeDS+soyGfV
	vfNKeVv5cuEWP4PudgwrfNEKDjSuO1dvTDxuhk6jSrSdf88i/lUM8grEf9GsqSpRnMTuY/XlKEL
	F2vAylcFAv4bzMhK3hvbMi2+M+5YLJSN7xEe9kgWS+V9rV0Y7t8PD57Ng0xfcrHmfhUQg8F3qqV
	1ha3RD4BDaNVvponPqnyT5GrIpydkN9W+t+Ymhi8lmLFCAcLrN0q
X-Received: by 2002:a17:902:dacb:b0:2e9:95c0:7c50 with SMTP id d9443c01a7336-2f03f271e00mr75498935ad.71.1795330676087;
        Sat, 21 Nov 2026 22:57:56 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm34287345ad.58.2026.11.21.22.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:57:55 -0800 (PST)
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
Subject: [PATCH 1/4] dt-bindings: watchdog: Add HiSilicon STB watchdog binding
Date: Sun, 22 Nov 2026 14:55:20 +0800
Message-ID: <20261122065549.3265519-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122065549.3265519-1-mmyangfl@gmail.com>
References: <20261122065549.3265519-1-mmyangfl@gmail.com>
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

While sharing the register layout of ARM PrimeCell SP805, this block
does not implement PrimeCell ID registers and has non-standard reload
and lock semantics, requiring a dedicated platform driver binding.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../watchdog/hisilicon,histb-wdt.yaml         | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
new file mode 100644
index 000000000000..c0a8ccdb482a
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
@@ -0,0 +1,54 @@
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
+  HiSilicon STB SoCs (Hi3716, Hi3798, Hi3798, etc) integrate a watchdog device,
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
+  clocks:
+    maxItems: 1
+
+  clock-frequency: true
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    watchdog@8a2c000 {
+        compatible = "hisilicon,hi3798cv200-wdt", "hisilicon,histb-wdt";
+        reg = <0x8a2c000 0x1000>;
+        interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&crg 0>;
+    };
-- 
2.53.0

