Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003643;
	b=5gHMFsPcAi2ND+Gcp4yVNl/lX+dpC8e75aDWcWt/zmGOHy3khxlZ/arQ1frPY3oI5QJx
	 CLoL5sqPKA4zh58TGXF1T6Qd5yGSDC2iPz1+qwXQYTZ8T83GoSY2Fb3QnHQ4irXV46wdk
	 l6DNeppF4g8VYmpGZYfGQv22uMtsKhEw6Gs2ZE3ff87Isk+AvOtOgqci4oca2Wk7kU379
	 AZFGEHc6l6/wy7VfDaVp+c6NcS6YzpbVEzrsTAwyEujt5a++f+2UFkihLDHQcEK+2opML
	 x7JeQ3tQxu/Z828LrHy5qyzN2MenEn/IKr/EtMRlmQG4AaAIHU6mTVAGLmSs9A9ThXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
	b=lDAgz2KozkcddrtNiOroon2HuimVKgLZkTLVUQVttg1M7fMVWv3c6hswD7XjIfuW2CBO
	 rapsSdZhts/9W+gYq+z28m8FU7gWV58peSbatoNJT/aB1P7EWgqb0oa/d+EcjjOU00Oo6
	 DO5kLPSdij4pt0xXw9euEmfn9PNTsEQWPpXXgZ3xOxF3Gj3D0I1AqEdvn5p2gO+5tKRI1
	 LZZToHQ1F3GePDk/57D/y9wvF7+dco9w1XzJ2AtP5mWpG+3lOQwM6PN4gKTs+94ehO0e5
	 agW3bNEijxxkNq4tUsj7PX7u20mRim93SyaJ8xHd6v4hpLsrdjBxfpzClvwSzxwg70Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3BerShj;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AAB60A3817
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90AAB60A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3BerShj
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49465892f7bso638559f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003642; x=1795608442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=V3BerShjEcnO6pe46yCvBfsF74qmcI5GXv6i5t2GXlYnum36x79Gj44I4wU+QwRo98
         G31Ub/yYW3mQOO7WABbSJOLZszoXUT+NI7FoVgT0Qdt3ukQWC9WbBYmhcmNjnLnHkTyG
         3kV3336CjyZZdZ+S/1EUWo7anKHT4hqcaxtwJTnrYToIb/suWExTnoaPjWOQ1tQqzILm
         o0NLa767nkp1DqgMu102X4ZZ+YyfcLEZ4QAAvT0TndB3jh02IY4IOtFhPGcHtf/Xj2+q
         dsQXY+OeOTuT+Mz9xF0Hbnko+PpTAr/UeetYn4Vt3fjLBSZ132sCBsWIRST0vkJioAW2
         R7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003642; x=1795608442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=T5+alkcPIlzcNH2d6wP3XD94wqxmATGGGxJFpWH6byH7YLd82aSdmdzqAp9twWyMbh
         BLhpRPEMJ4QCzg5TMSROeE/5qmV+ZW0XNg7H1fvYrc1F9RA3k8AlAs1UkYQKyNkr3fLo
         8DdSprPniUnhghkONYa+eJb3Grix5o3rnfSZ+abrp0dCvAmvlXqInhlvSWfK+lwU95fM
         U7ILOacUTLTXKs7L3v4XnwFOe3bntedAM8RQ60XgDtnwg/hYHOEwNCvHnrpbqY6mDNLf
         sE+RuaEAGMl0Ge//SQnR3MtmYX7TSQczVhA51kijoafZXbqpKeoKkgdVvzMs/ybNPbNT
         MFIg==
X-Forwarded-Encrypted: i=1; AL+hErGGUJjlyOwGx7RhmUdfEMH2McT3a0Cj3FQEiCA/N07zpDWe42JbhBTfN2uZrJGkwtBy4J4w6PcqrricnFk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9arFiB0my2ZmRxUVxe0L089dDwPIXEhCx2iv9ynhWGYaDLDsKi
	jS3ckIgWzaM3K3ZjHTnmcUB04/Juo+5exbNzbu7f7Sl/cYzhpYNd73UY
X-Gm-Gg: AZFdTZc3JInUQ3zoJaFjd4CmIYFRHDlvALbWSCHVCtZY//tRK/8mqUB4q9dMn/haVNv
	2MKby/SJS208YyZkl7gfpOOp7tMjSq1LsmiETy57q/6dr25ez4V4cWmRq4acnSlLgvxQ/XeWg2a
	v4jYyQ5O1ETmUF9UElT91x6YSgO52F/HHLbVkR4HcbwMdE0tNLzp00We011Bz5IVs9CRXUwMsOB
	NUeJA7iE9TR8x2W5zn9pgvxDdY0HRAeONJoCx0qJPERbUlsZc84w02XkIDU39Oyh0WryMpLKmuy
	M1wubqBZCEEhs/rp4s7GaBtVFiRmhEYoJyHmhZ3VlPkEB9ETuHZQIxTIEpPqbmn/VGTOF0eGtem
	3vMN7ZY1MCfs4e8TvTe/stp/+cEAJuasOA/MpYcHsjY9SKtTaQBnL/0aUfGzZpby5E3wq0oydh+
	nhwQThqjOfeFvv0hX0lpRsEQVAFRxuQZDCQrxuO1z00QVLO/ywt8a9nvA+T0vN0aHki2dC8YSJP
	9RlHvIh9KH1pvjb7RSL2MkOoghnslppk7gXPXyek5etc81kgv/MQAh6anmdBss6+ME8s89qUS1K
	Denmu8/0qnDO4krgeabwcU9ES+2pbFu25HTTm3uzNI8agK0uRtHKcRxHJ5dBgUQXLGw5fK3K4Aw
	=
X-Received: by 2002:a05:6000:46c7:b0:49c:192f:cf1e with SMTP id ffacd0b85a97d-4a63b13855amr3763095f8f.32.1795003641960;
        Wed, 18 Nov 2026 04:07:21 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:21 -0800 (PST)
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
Subject: [PATCH v2 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Wed, 18 Nov 2026 13:07:09 +0100
Message-Id: <20261118120714.31505-6-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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
 .../input/touchscreen/lg,sw42902.yaml         | 73 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..c5ec3bf4e545b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,73 @@
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
+            interrupt-parent = <&tlmm>;
+            interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
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

