Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944342;
	b=VVssXA/4J9XdFBLrE97WkpgbWGImj6FfqUtOzMFDJbmxNL31JOW09CeA1kLo8mk2l6nE
	 UZw5tN+vOtwSBn9Be7hATRZW37eghU6ydaH7qXNBQq1jSRNzTDo4VlOA4w+oBQd/2IVvi
	 TA27LE/GdJjeY8ZVl71rIQVQINDiSOHE2hmjVARQD5IXhUlgPZxoH8lDMkNA313LHSXYz
	 gwqjLgPik2+bu6r2JmEdBlHcgLct2stSIpqvncQCTuL7hIAhyyszOXtHfZ5ZHsrTrc+mJ
	 Yj6AW62/8MzYMigvmcihpZ/jxhAkNDEjb7J/8hJxi7dsthMacsJHN6n99eZsZQvO5hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
	b=j+Njwy7EKIz4hPskPul/hU88+XA7eTi4abWirA/VmoRShAzo8jx0spNiapgUR4XdoWiu
	 Gx93j5+zO7B2xJhJBXWZPAJPqJ9IgSbN135aE7MjiKE2M9HDb4Zba1gEA4Vp5w8Hjguwc
	 WQjPduGBv9HnFGUqC1hCMTJWy0KeUvBTtwtsWCJ6EnMXgS2o4BPFPq1ndTlzp0ijbJdr4
	 WDnxBhcM9VI6UXu6FHYOfKblmIzQYMVi/EmUj/vEsbvR5fngUq9jvu/YyD1pCgJ3gVDRZ
	 bWImHk0FPVfYoaLHAs+FIDqkIjr++TdcjuKO/Rud/Q2VoIlL+0dDDYbTt5bNnV6p9EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz2r2Ala;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E541E606A8B6
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E541E606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz2r2Ala
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so558075e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944340; x=1795549140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=hz2r2AlaEEMk6elF5K4RjTgSi0OthE+5VYoTEKoWW5La63Cfp6JA+0mePiiVroEdvz
         9w319qm8hnJQkrEHrH3PViesYyv/J2zy+d41MkduU/TKOxRMR2Bj7TDT/Vh5a/x38QZK
         4hFdljsWK0QgYbZFM1L3oq5p3ZlHsii1w4vHA0+KeJ03Emt9JktFKdx5bOsTBUOAgQ4+
         E0DJlAiL6ysSHOo7CnGbvmrTK7eqeNr5A4A2t9Dbt3DY2MqkWWPVtxXwlLDxTAN6DX50
         xiPaVn/Hmv0IwqSToKW9HZoI5WUfWaIwzUXEmdI8w6QUHJHJz5WLffYBlU9vAtVV+aBW
         409g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944340; x=1795549140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=Rbw1ao48jh9pOwul6NQksWm99vGxeKpc+zviSxVdz0w5v3EWJhmIxvJdhRvLpRqDJa
         SRvtH8noBxZkHem8xVG7xHsFX9bZoy9CFSkfqGU+lFkV8VrJ0WMOqZJmbxOmcNq/9c2E
         Xk2RrjeNRce6pNsuM/kPeN51C6i9fixATwBvZOWaBYblzb8JOeREioDvh5cUPdQvSRv7
         sy8za73VAkFQUuIqxhzKaZQl7EaN/JtgCJVQFtaB0tuTn2dPLNa+YIH4Pxpk0h6rkDMJ
         HKAgqVbO6wSiInna6HUe5lRGOEKS/MdbFZFpJiqOd+rXJe+6G6Ypeu6mf8MUDXLWNUPW
         mcYA==
X-Forwarded-Encrypted: i=1; AL+hErFvrsa9nOgX6Z+R+ZAX1E+ydX/vRosywUQdQ+YGKXyQia0OA49J/8oyWuSyvtjifO75OdC27MnIW3Vip10=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KORNjJZkFrC2A2junIXDhbbcaqAI0iBgxi4z/S7meE6eBcM2o
	OJMj3rapn4SuSMoqGlp+wpRiAbQJ2JYodqYmNINT5/lbSFMAxnbly6TA
X-Gm-Gg: AYBFou06QS+v7pNcic1y5anPzWUQ9Q3gu8ARErelNc7xofqpGl+w//wTGbhAocvmSTy
	msTqx5aja++33kXdyG1V/vuqZJxZ5d93sovAlnYyK8cd2F30AObiACB0AeGimusEg5JF+RhPGLC
	UC+SlycmhHxBPI8Hf69GNr9vAwcIrXqxplKhiFdmgdy7Xhi3Ms2qxYtuIyF+Z11eoXOqqVrXFwq
	bUiqQP2ZT4DMxOkJXMmgcXXFNdk/3+qYNrRsqJFimxdhsE+L32eXAoN0i6g/DejFeByF/Jl9z+D
	UeTbkqiiKi6g0fr4BdYutfAxmToLjVUORQF8lmKSkb/IXERY4SaA8i2Toc25iY0kmmk+M57va5Y
	jQwPbTT0HyQfoaxmGLK77tvRpfFq1XnRgi3xQl+efD+7AnDHa3UsVmyqQFe7qQOCvQ3cGQIsIiC
	fg40pqOVLBsMzdMURWgK78fUPNY97k0afoifsJEvSS/g2ttqACQ3clbfni8BBZ7/k+eVM0GFpMn
	cBjgfMPqHFHIQgmy9kiv5hLE6s0uKVedlPoFhzQkpNWODqcsO7QKZHwyyF6AE8NfuYMTcsWzdPH
	dkE8KM5Jj64Nkt5wGvAlA15YyZnl6vHWLTf7u2H7q4/tXuUtuuSGrrPG4bpe3B1j2tt8otAJCT1
	akcqiefEIO1vstK2wHJLnioeHYyhk22ZKQw==
X-Received: by 2002:a05:600d:82e8:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb7da18d83mr3966105e9.9.1794944340157;
        Tue, 17 Nov 2026 11:39:00 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm509521f8f.0.2026.11.17.11.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:59 -0800 (PST)
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
Subject: [PATCH v6 1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM controller
Date: Tue, 17 Nov 2026 20:38:47 +0100
Message-ID: <20261117193851.235272-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117193851.235272-1-ansuelsmth@gmail.com>
References: <20261117193851.235272-1-ansuelsmth@gmail.com>
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

