Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623659;
	b=4Pv+mhhqaG7I7uLXZE0atRQdLbyi0lFQRALpxwu7HCV4uFJmkP6R0/Db8cwGweUMVi3k
	 bTN1FW3GI6lGfpkXet0R6n7ror0T6Biimug1pw3BHHZxMfrLUVwBJEj8ukcjyx4Yp0qnP
	 RE8Mff4u9YYJCHMlW4Nm7fTh5RZO70O7PHtmQRaVIuVufYCu/YZpaq32jcBCUis73zTGb
	 qKqhOhi2SxwKZJ3mKx/5IctOApAr4M1xC0VnlSVo5T2pp6A/zevKNo+l20agXLU8p6fWC
	 qNMqIVPrvVNlgfPbaTp0AvPJrwk77AsyzwsaR4JpBeA7X0u5hXoB2hQBCkVyW5cVqaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
	b=kRe/NsUnPjBQ0umisDbIngzMz6i+xPFI5zsEA5pNA4r5KTP/zWbUikSZk1sJqDAptbNt
	 9eEcQb0IGxHuSZYmh9jntXP4rS6p9igoUeDrPLw9bRNqgKOo74sOtcMmbQxIr7tz37Avd
	 52GlcEsf2RpsHzOuvp6a8AWn3MSb18SrcX+IB8Bap+F3twIrrKIJcvc6dZc8vHgPQdR81
	 6lRGbDrHWkElSzhGVJij82CYKbaa6bfQvwD+BCTq8RVrCmqk4vJIsiRY6IpxZLl093yFn
	 Os6q/MvNGqaQ3ZTgOc+QwM/3huI0a10ALQBw/zZseSsizoXqVAhMsMnAFA5i1ySX8Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OBXIaj7E;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06893606A6A9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06893606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OBXIaj7E
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4891800f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795623656; x=1796228456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=OBXIaj7E1HmGWo9JqM9tqua3DNXDb8TFTkplpSggBDuhUhjA3PjuQqAh3VS9LOr/V7
         6soddrf7dewKxXTzQGhzqshKPUfy0pCHiYnR9hQRMNFFXJA+WQtkId771Bj8BT7vmh7L
         CdMqnmCJ/KTXoCYC4v0nGDUUeVRLyW/a9jIRAcLwHKJjS0uHVeg21VOqrbQ+RnkJvNiy
         U7o6ebtUYeNot2iP143VpKd9aFrme9o+rpvSqeuk1DnoEr/fQum299YO//4YxxLlvgFl
         IfFgz5WArV2/xWf/P+mGycorCWHhayDZCEK9AfEw3doma3Xoh8RAFTE+ttKGc9To5Wrf
         7xxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623656; x=1796228456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=UCYTmzsw/YHKZ335hLxAdu5uAWG0h6f2oV85OjqUJQbx/jZ3WxmR55EjbZt/lMBB68
         fHdKabObAY8dfOzebaPVqMx6KQNz5thR4HmoH4NjC39wvbfIZG+Dq2KacG3XRPi3KTQU
         FUGNxhtrCjSgY0c32LZxZG1ABMaxCRdCx1po3IE4wOp9UzBTXmAbIXlInS1YH8LsXeSL
         Stirbt3wGjtHsANqMX/RAA4XsdpTB2hIkbRRuMTeHwRaiOZH5Awd9UPZGTpKRxUZoMk6
         /OJfR4qIgKIKygCEWKmSgkBUNPw2izx3CigmHObq228/A3LzIvo5Du+AhcNj9cEweyiX
         IZOw==
X-Forwarded-Encrypted: i=1; AL+hErG6Ah7kBf5xgIuJ3YFoK1rcab/SPDq4TB38l0Ff2WRUDx3ccboRDKGD+MWY8J8crspF3hedKmJUKClaHYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QQy0NcDuGza1JxFlfRyGWLHN8ZWNSHLqJ/E35xGDLBM/BtDiT
	2UTKaCCGNcVZaUhkwfGP4mJQr7lFY9LxdRwpsDRtxBX9fVXtYz7xJOQea7l8L+oniZc=
X-Gm-Gg: AZFdTZdSLPuI3Jjc64hoVV87b6rPHfHfvaYNzuLZTHEBwgNPTugbGVCD3xOrWawXwJR
	aANdOTgF9yzyGF3otdh5LvUP57JSP3KPdgiX0F3KMplPFjzdMNKCkSfufteFT2l/M4Lh90gWUwM
	zEMrB38iv1XfGu5AkxS/iSq4KMRwAWGRUxP3Vy5FhxXePFVQa5YTeP2YpW/yoXaHGzpp0ad5gTF
	pyG6gNey4/r1VjkHMHS9TbOd7589rJ636h/iKcL9xfP4UbOVrV1BvCSabH8j4hSJNKi+R/PSGYk
	uES4+aYD+uZPpiF4uMKGOK9O6NiGqTdrKpZAhjhY5Ifxu7yxGxMC8aKigCtONPJjnREc3yB2TW5
	HBMAARmHxxKqs5RRhitKZczqfAgE5tWTQ91N1UYllRzhyTtWn9gaXqtXwiPszJeNbbHclhY6eZn
	366DBSecTldamIAqaoXh/JidCFSQtSIYexXoQ6ZiJLoQbr1Xxxwm7/yCtwbFUcQ1nClddwCMv8+
	+WqTSVpTfP/e1aA4bWrL2A5JbzlAJ+x68l6X7NtBQXIS4gN1tloRbKIg7N3L0P/kaxo3CHRbKMO
	In0UoYkTA1QRU6dkWztwFSyS8CQskuW18ZKXz6nHAHEOcozXjg==
X-Received: by 2002:a05:6000:2b8e:b0:491:45bc:d69a with SMTP id ffacd0b85a97d-4abb3f158c5mr24317570f8f.44.1795623656351;
        Wed, 25 Nov 2026 08:20:56 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm40286290f8f.24.2026.11.25.08.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:20:56 -0800 (PST)
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
Subject: [PATCH v14 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Wed, 25 Nov 2026 17:24:50 +0100
Message-ID: <20261125162453.23573-2-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261125162453.23573-1-andrea.porta@suse.com>
References: <20261125162453.23573-1-andrea.porta@suse.com>
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

