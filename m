Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160047;
	b=VE5dWdQVrYSDrdOJveBobXbo6qcd84ItBKDHkqJigzK+j1S96/l27iqb+RKVuWsn1ow3
	 HLJEMWS1VbSMaueixiFwksh/dBsL5D2zaAFPX8yF/fKLN0aQheqpAKnyhJXidTZdwZiVD
	 kJlfvvwekXgex1/sEYlxeQsunpxUkaj/AZZL7sXFV8zk/gH+YqQmIiPt9FidX+Q+ZsjWq
	 zglZIwS4wpg6mq7w+/w8AAEjDPhxHAn6WNUeujKnFvC9GIBdqSP/lnvAE+jBAWNmQpIXZ
	 LS4HmgHNhK8n0yneUz+a6LIKIk75sDMqFCOVIVqx3a7vBWa9ENCPIGihuJngNaHAWcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
	b=pLxUQ8aMu6hhIkcHewVBxWg48YSdwBVbmOfSwu8iQY68E1h3CSo3OhLittDOOHlo4NfB
	 b87UysAQ65QXeLvCjYu55ffzGXAGwb1NnvYzOd1rYOk9gJxltT+vwronCpPv5gbQ2R9HP
	 JWW62UEeRIK2V0nhl9r/QBbcl5oNYQEMAuqq+gJNgKgCZ0sgfGJRpwKiKPVwLs9kOzKRc
	 OiXgjQAawiWitYZgdatn2M0cr2ariH6MxCgeGHPa+iI5smloFFi2wXEy4F9m8TXgKmFnm
	 jxbUaR1dk3npnAjuD/HDKjrHtAyghOlmPkZuSRasGojXeoZvGfzpJTMS2bEGhgNYexg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QomUB9wk;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFED60A381D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AFED60A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QomUB9wk
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso15639185e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160045; x=1795764845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=QomUB9wk5UINFnNmRIvHm/ArMbX6n/cgwMpT4/4Nyjr1QDC9P82L5pLn7KFoBaJ2S5
         MRNX+Q93EVcI6f7taqmmyDBlHekO8S7XYnZHlzpW1YjWWrUpQ68XElhy2WriGo0TvS2Q
         eAgH6Mhv2D/Zb+QnbtMnkIwaumlMpk4WiY4xbvX6bd0u/Gzq+Ps+Ntd2CANoqmt+k3UE
         Xl+qpKBEwHT65+WEXab9TmclpX+XkvTgg7i+al4ZPxzRqTlhqsmXHqAPh967SXNpmCo7
         6DfDg4dDd6a5690opLuGnSaxGtRaokNqbSVP093PUcQCdXJrl3k54pKCgW4v+blQZQd6
         vhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160045; x=1795764845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=LB7mMhEwrKDoujv9KsiuAaKRcl8B5RsEK3CsLTD9maIrgp6OZwhXB0RRhqO3a+Vnzz
         RYyb/zmhQbcabTm3+Uxm2mCAGwzl0wOhMRKR1OJomo6qTZ/f3N/RTk1N3nZpZ2OvcBqL
         +OTjQOHsvKLnZZBxmsFz+62ERQDStLnVFCeRD+ZwlmI/UUvOcb5x4a7bAqrZj5ENSeYh
         VDPFPvsY13R42Me5yiYEfJFB8kfbWGLEsbqOGwpQwnE3TO26Lr0XXPwarKJm9MDBpIcp
         QFV34wwFWpSXU+UlyAK0T1HcFaAi/auhtBj2TiJkkVtJYXXVXTrg/GD+kBfdtrJq8grM
         MANw==
X-Forwarded-Encrypted: i=1; AL+hErGtN7c5PlvEhrNeNxUCUNLhfiTiiOpaEgG3JGQaFXSHoTKb3fNFXXvzfRahgsc20WN5IbM61RVTEW3SJR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8KkzHW3tBm2WBAOC5JCrUveL8TGZJXCIqVGJGNZdD97Stn+zM
	/Idr4zCT74/t5NQvScQ6SztlPd/A6ePyrt31B6c47+ABVSdQl36Omz7j
X-Gm-Gg: AYBFou09dpI1nnKFqrSvGemX+ULhyFN+FeC7xX3Kki2YwTe/uSGv37wfxQXTcZlbA9U
	QwYR5/XEt3+DSDOgdLqPzCekg3uGy12Ype6qXG4/9lRTDt5K1FX4FwM5F3Dq2nVo7daJtV2QJoU
	07lg8PcILqe1lA+dl6hWKTtkORLhpnDR7OIK7AyYEKvP+0qf/Q8+hwiOH9Sl4jcC9iifJYg+r5D
	CvkBD+DR0yi2wh/yqCgWQcqKXwnOECgxbrFdgiwablJk1VB11vKKg45YL3o9O0GIdwcNkP9rY72
	e4Igjgxy3vsKZya4iKgy4o367mYeKosgLBLQR7J54T0f3zJxoV1eP1H8TMsVxaAu1wJAk0Gvdea
	1Z/K3lINWLdoGZoio3ro/UiOvA5oJ8AUAlDw11ewycmCD+D8YPNs9C5VvXE7rYpXUyYaU3HTa+b
	hoEX07vwPakVmo2JigVf6B2vJBjN8HndvkU4bG6SgX9vXKig3aHuZ1gCcqSnRQh5zphFJnn6lJz
	j9gllOF26YV79LfHUhkJj82EhoxpiAE/4ncrY1lVdWdNfpqjbRLX1TMCwgnf8SLehmcLvZrz/hd
	ufbtjeite2HRcWMlGLWD+Rbl8OuPvx60i5ewIfyKLYG8ALGH6xlhCLYIr/rlwBN1M9zY9Zi/eSW
	Sac6wlf3UtP/J1agUsm2S
X-Received: by 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr44675865e9.12.1795160045388;
        Thu, 19 Nov 2026 23:34:05 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:05 -0800 (PST)
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
Subject: [PATCH v4 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Fri, 20 Nov 2026 08:33:53 +0100
Message-Id: <20261120073358.10267-6-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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

