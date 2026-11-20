Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218410;
	b=oCq2pG34+rR29ttGOrX4plyWRHv4Qw9IKP4Rjy1rQC5ZG7cw87wKMOn+jqLWn8tNG2DZ
	 q+lESYM9AgeQEpF+ItVjOavDNvQ0QWyjj87wc7rSx6p7xHCeUDJSBLpAOD9/tIheka4RI
	 fBPQ1aAeFa+mwlLypwIzDFcPfi03f7J2ZhcDaOT+PpvRQ0EUU9Sss6jP5EDJLKCsqU3Oc
	 3Jg1tgpl4LU/KZZYc54b2nZhA2z7MvVXZYWSc+8eF3oKljWh4bHnLTYlBDsOLj6WbZgBa
	 LDzVRCU2/VcRyZOj7KRWWSPXswYRaQqcQj55xhXUYpzQxk5hcaPFVPFFo5QnH+R+vhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
	b=hCiiXvZJGEYaiRHzLYhWFftL1R82Kp4BQhVgOxoVoIpG+wf1OjxHueU6I57ADCwXj1Ts
	 Ad/iojHeEuzrSGG88tzOIENz1LTKcTjERQAdllNv/4lFIZImz+vOhst1EDByASOtuiiiR
	 xsf88ZFeqy1dadpFNvVlkmi/A20mzfvf9pp5rjTuYNjqKempZEJOnpXqXcx1a3GcpnCjd
	 DNnYFyj6CHRbEf2Lvgd6KKlFRzN2l+b/+fXsr/Bixs784GG6TMB4qNFZXgQPWWtRqb8cC
	 gtehRZ3g2uMsgfSYl7PZ1jV6UBOIxy0TSoFvxAtNCdgzHWdafvKT6Iz+KTLx8P8Dgng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RN5S5ecA;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB63606A6A9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AB63606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RN5S5ecA
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1268264f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218407; x=1795823207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=RN5S5ecAP6fgoHNRTGtbgcKstEbdj0ZpOtWHtVFDE1jtFCG/UafmMRolKfWxtWyu+3
         ez5I2ju3UlLagFqrQPoZR0Gtj6dYJec4c2NPi++cCtx4fMgNNvlWtZ62CoQ+Ca+CKO0M
         CfL7sNLW/LIQQ11JSb7IhugpRFZz5sDQo/TQkLKJc6hmITxxht9hYWZD8QXmBSjOxon/
         +Oa99VNOa1yRRqeENqHaMkW6+rhzjui/ndqpfQZ6HqBT/XO6MBkLgJXIDi68mLWK3axb
         JCeKh/9jyOFFp8i1GVBch0JtducqIQJDaWKJaEqjaW+NmXEvH6fE7w6BHhka/Vi0TBFb
         zVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218407; x=1795823207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=0exHdJMZr7LscE2NpATjGsH0c2a6kLUivbxuEj6qqMENsjGmiV+mVil9GBuEEeTQhh
         ca0hSq9g4kBCBDCN0XWDDz/LMBL96Lo1jy8lws0Dl34CbgwMMHOuxMQ3Um17Twn0E4+8
         pfZvlDgzlGebCkB2nmh2pXucdd/INqI3Vn74jwxkV0EH1AB4AJN5DSLCcqdzoRmllikl
         dj3XbRguP+kXgocV2qntFg5DsctLxyLqaZa47TWVhTrNYuBtI4NhsBlLWHU+wyqLo3Qw
         HIww/vOLywBgKXWb1+dZ7rvFDLKMNxTi/wMEr2nrQU+quC0S0vanXv744h8rzB7iXknN
         Iicg==
X-Forwarded-Encrypted: i=1; AL+hErGMAFgFYFYiof+lO3lOMD3UFN+u8NbQqOK/vc48t265ju4CCggXQDk9UQaQpWyQmPHa5TsHP8PQ0M6X6ag=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bL6sHFLvrxuWBIIZsY0e1/uzSVDGSF8V0+2Ldn0zgWLRve7on
	zXWFocPU2Dy+BCTqHymDnq+gjNfBAn7vQo8VytLUmIyaa0o2iQG1ey+b
X-Gm-Gg: AZFdTZdp42BdQh2UgXdFK4L8zdDQBWHawBZY5TbonB8lbty67blNqKzex+w/N3qzg+/
	9KgP9wvavQ2gxLFDvpJNSCTJxbI6vk1H8ARB8j0XzOU55M0/aqM+LWkRo0PjB/5PXugq4eX02wR
	XDoRwLaXu8AT4EQb4IBip6Y+nJKqziSXL8LkG9JvGuG7SNG3p0v6UIMFVi77w0MfzVBUdj3wyxE
	t4/GMShF5EfWKYEQpEx3/ddCeTzLTDMzvgHosV7Xbryz8x+JMYkN8T2eL+lrG0K6C+DY266ifFZ
	WREYmGAipZUGXq1ZXyIDgXZ5Yj+JIOVkyim0eHNrzfoY/z8TmcoCZEtukVkGprRpFWrWjdE0v8q
	4kLBe0KnoYOzR/2tshwX9v0PwmW5xLMquuFHYYnQpeU9XlXzoQ+1huGB0lQSXN8gRcOCg8ttwPt
	5N2mHaU7SxAFopk2KuFoT2Xk2VeudvbHckmpxK3GEe7fH3+8NSST94JUvdQuJIRLDQEua9DQHHu
	cEKCgwVbPfDUp+hTvmjFuhdIIg3IURC/eirBEWWExduM650K1wU0cH/01exRCFgzdCQ2K1jQIpY
	tBJB3NjFdVhGJ7Wit0zHjGHicTZOw41mO4EGkE1h1fwWM6o6zsykvnqQoS0udJ50/o7yS9OpxVA
	GTYVZ+TbNzrX2Wd8WKWM8DXPBBGa8pFzh5Mc47tLk4x9EOaDoRAJwtA==
X-Received: by 2002:a05:6000:4a14:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4abb71cbc15mr9359436f8f.32.1795218406845;
        Fri, 20 Nov 2026 15:46:46 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm7605156f8f.34.2026.11.20.15.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:46:45 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM controller
Date: Sat, 21 Nov 2026 00:46:38 +0100
Message-ID: <20261120234640.169279-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120234640.169279-1-ansuelsmth@gmail.com>
References: <20261120234640.169279-1-ansuelsmth@gmail.com>
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

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Document the related compatible and required interrupt/reset and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/airoha,an7581-pcm.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
new file mode 100644
index 000000000000..e73236453b88
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha PCM controller for AN7581 SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: pcm1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcm@1fbd0000 {
+        compatible = "airoha,an7581-pcm";
+        reg = <0x1fbd0000 0x10000>;
+
+        interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&scuclk EN7581_PCM1_RST>;
+        reset-names = "pcm1";
+    };
+
+...
-- 
2.55.0

