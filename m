Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541584;
	b=YM8XwROZjtc/mV61mw8jj5eT4XX2HZMkITirF5sIbbgFf8Dg1NCdh1x4Q9Y3+WOYbLzc
	 BVoT2iswC0LbuD1mRpcK5XQFP5spc81l6N74RIoOJJO08vGFTOsef9Xzn7EGtnC4KDNjs
	 o8S1DbzBiRyITesoUSO+Pgnj5UOBvIzYDyYdTLRRiccEP37pEdtGYtk7+AfhF1VTa37wg
	 SboHuMBrQhg4glSMYHZAj/6rbw0DrxlRSGqOGtmEZ15GHz2hOAEJ9ncaXKg6MqXyz6jVq
	 B746Ta/voM2lcigq4LTqA89CFEi6swPDpkWWU9wEz/8nXKLWDG792IPhbPpw1QSfUlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
	b=XokHdq19r6WUEPT8FUj3XQYKMqbxDehKHcXoYCbCTQspjmALKNOw0OCRofaiHB50V4RU
	 r9J2daOKohvdEP3N9rG1cbJ/BYga7a5jNLAklaNhlnEL9YDcwvIa+3sOcgGo0PdT9OJHD
	 eh9EZCDkszSnvtbK0u/GlTauXy0N2d8vdE8rTDl6SBe487gdErX78OUp4YXC6lXLI2YHx
	 RPxbMpTOXjE53jDB4B6UXNQWz8/Jw0Sn022hnjPkyQorpKtEqBl6NRTvvZvJW25lzrQ2x
	 jKIZjxqZhAqQHjiCo6yQHvg6wbPLiF37V2eTReFthnpVQhDNKNKsGQ88USbd+RuYz3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YBeE8QUO;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A354260A2636
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A354260A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YBeE8QUO
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so32776985e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795541582; x=1796146382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=YBeE8QUOOp51AgJ3SsRNyTURxzAxaIkVckh1C02xLsmCc5ezSk3lgZBSqW1dJ635jV
         EonCr68RcWbdREMNRZhlFzjZ92CDDH+sWWLhhDxs3Rvrfy2xtO4TY8827SYovhpAv4ai
         zfHU2mTEcOK48CP1YZVDzt+2gvjjHnPIED0Mpgu/kl1a5y24Kmf/+LulxSTtfsBUTgPC
         fdSmdHmMuFMEhTSbA3ymlevkPfvIQylu33tqvIY2GIw4W5p/0wmv4C4mRoBT8qinY5h7
         jW5hZHDl+h27oOREs94urwC5xSNzEh8OxlwSwZ1brBoFZooBUG4gfxpCZZBxvrWeEtxV
         8TbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541582; x=1796146382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=L/GVDtVHBFIAIEPvbs4kXvicudpsGctYo1XVBWtFHpv0jeFExFEU5hW8qF9OI0iEBQ
         /XkRaXQbVH0K+/+T+K6fZzFOeP9s8vFlPqhL2FFujkezUL9epnutfe4a5IrK7X+MGsLa
         6gMmDSmQpABhEjySnMbXJi7CYPa8ciKbfHcDCY2fG+EJpxNPKOGa9g/05JbOsGPQGZwW
         QlkVopC+ERNeLd/dF4hdBKhsI/XGJBrYUVLusbm8i3YfhSTdDHawAt2HUN9+3pB58o93
         O+q6hUrANE85MrJKi6Rire0IPqryTDphZ+4zdwZXAp/MzaH+VLoq0ZaYf1uX6HIMhRnv
         /Euw==
X-Forwarded-Encrypted: i=1; AL+hErEut4SBfhQ+wiWcZgJ+0cYyY2mD7VtGSd5IaCYf4Wq9zm2ldvIUkSPNRnbhLRTMKJmgnWQn40NSG7P7yb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F7V0Aocyu9dqujhrpgM6Qd1sz49J3dkGn3w2MC8lq1FVjwEp7
	5CLUU0fYO1fgYhPiLZ9jZSZ1mJ12yF1DoRp6EvFG4GklDtVuFYY9rlVi6+t099HvU8s=
X-Gm-Gg: AZFdTZcUotDAkFqyYvvmp8w0Hr5IrcWKvdXvrkFBDKSJpG7/Xngh8cPPfDllOJIuY4c
	1UEQzSMwfvY/toU/JREoAVFRAFE8RQEYql3XIdj19GKa6bOFJqQWzUxFQgPcEkkq5YIS3F/zDXB
	8Ue84OzvZZV11dnb82jaByzyN47KsN/7QrFPFz34RwV0er3LJgdEsGgZwiKPdS+XkxNgaVUScW3
	gyfcpZogJYeM6fmrWoKxbiiwe6Wox8H6nKke7GYSaLzWxkUTz2o0bgKORB+FhaKYqt/GF35gUxV
	rm8FEXHYOWGu8TsRpTca4Nr2Y4A0nXohdH0zL83KY2A3EaNVPiZYWYntuKiLEnzrbdOE3Ex/303
	WG082HJc7muGu2yi1T/lJ+WW/wFY6YuECXr+p34Rqzm+vIDpKiiXkCuZHER8qUzCsrGseGoJaZL
	DK8ueCfw6gXp/5OzgQ7jQpR5NxB09Mp7+E1mdyOLGsVwaDkp/Ocgg1denQKVXH/9xG5tQZjKWZo
	oQZBYGqkN9CYmMQHPunBUS7wuYyGCooL3pDN3gg/zLguuB+nTVXTN31Krjxo/XIKyVq+Vc83E0d
	JDuuMuPmviz0NYkffdQrQ/jIuwY=
X-Received: by 2002:a05:600c:34d0:b0:4bb:6a5a:7839 with SMTP id 5b1f17b1804b1-4bb889428eamr309983845e9.34.1795541582068;
        Tue, 24 Nov 2026 09:33:02 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm439552155e9.6.2026.11.24.09.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:01 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: naush@raspberrypi.com,
	svarbanov@suse.de,
	gary@garyguo.net,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v13 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Tue, 24 Nov 2026 18:36:55 +0100
Message-ID: <20261124173658.31030-2-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261124173658.31030-1-andrea.porta@suse.com>
References: <20261124173658.31030-1-andrea.porta@suse.com>
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

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
The DT binding has been applied by Rob (see [1]) for consistency tov7.4
and is part of v7.4-rc2: as a consequence, this patch is included only to
make this series apply 'logically' on top of v7.4-rc1 and can be dropped
when rebasing.

[1] - https://lore.kernel.org/all/20261102192302.GA882027-robh@kernel.org/
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 000000000000..be020583fd0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 PWM controller
+
+maintainers:
+  - Naushir Patuck <naush@raspberrypi.com>
+  - Andrea della Porta <andrea.porta@suse.com>
+  - Stanimir Varbanov <svarbanov@suse.de>
+
+allOf:
+  - $ref: pwm.yaml#
+
+description: |
+  The PWM peripheral is a flexible waveform generator with a
+  variety of operational modes. It has the following features:
+   - four independent output channels
+   - 32-bit counter widths
+   - Seven output generation modes
+   - Optional per-channel output inversion
+   - Optional duty-cycle data FIFO with DMA support
+   - Optional sigma-delta noise shaping engine
+  Serves as a fan speed provider to other nodes for a PWM-connected
+  fan.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  dmas:
+    maxItems: 1
+    description: |
+      Phandle to the DMA controller and the channel specifier for
+      the duty-cycle FIFO.
+
+  dma-names:
+    items:
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@98000 {
+      compatible = "raspberrypi,rp1-pwm";
+      reg = <0x98000 0x100>;
+      clocks = <&rp1_clocks 17>;
+      #pwm-cells = <3>;
+    };
-- 
2.51.0

