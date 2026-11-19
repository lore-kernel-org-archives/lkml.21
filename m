Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107271;
	b=tXEMSqEleJokNT3MANzN0JmLWHwBq2ALNY4yngvlgNtBk0dggnQjPo2gyjWHwkdg09HC
	 aYV/h6duXIna+e3oigQ8k3qbS0sxZVYcvL6qt3WBF2Ewjv+AOMm6/5OytbaFxEzHNMhkW
	 8O4aRdQ2i+k1gWnqzYAhaU2gUDSUiYc2HF1k/YCtXd96h0UpS3LBPpz+tSKo/2rnhnfbp
	 vshn/ouFz0WJtklcKmG0+OSKWTbvLCN4l8/fXZl8ODDtup6ba1BoonX557hg38iWH0Bo7
	 puZX3Z7muIHjZliB47qyNT3qUaOIP2yrIvNH5CKFJo8z8CrCOZZ78e+2U/3Qy7sn3SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
	b=AqYXJekC9inBnZNmwGbG9lcC0iQvJ/zSpSEkLkVWiqq0UYZEKJsJP9xfmAd4B+kutTiF
	 dvHF0pBbowyOHjZ2Pck2UtJncYky18LednYufW6UVH4qEoRSAqJ9UcVNlaO60svU2eSVk
	 sGabmiViSnUZmpC4bKJ8XpcrfmiE8cRLGneg66Vfxg/DMqf6SF0WOvxHV11HYgiI2MIW7
	 LnH94nyaeYfJLVphoJghd6ULwZp4rwWVfRp09W/JgL69aaOYs23l9Z5fSBmijz95nLdfv
	 0hvT+0f0GQ1L4i2ZXm6HJqp+fU1mWwCs+Y93k4h7igSSEl/Jni+3oN07ccrOqmIrjzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R+5DdiOM;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648F760A3820
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 648F760A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R+5DdiOM
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so30224415e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107269; x=1795712069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=R+5DdiOMtL80c9mcJ5/KFHY0ZO+dJukfZdTMC2UzdCESjd8f1Ba/Hc3GxX3xNxmVsL
         ZVbM7daQY/whHTYRSQ44gXKI/K8p7wFjj5fzydgXq9FHdiDNMf7UHIaSB1XvXWGhnv/m
         Yc4iPjIVuZr6a8fd6I3YnVVNGO2oJBhwb6XMEX0OO5H8Bw0x0bNj6qmEmnoPXB14KLag
         DUP+9XNzj+038+vk+FXla4L5LSkEkaMl22I0svP6z6myJoGAFCVFnkZmhZGFacxMxRUO
         cucQKdZtIa4k1xngqIh6GWtKQcDtwwoxmzOtybDXsTvU/2S1bsaJNw20j4Wh0K7gRLSn
         zFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107269; x=1795712069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=S0cHMvYe9Ffc5t6evOO3TUfTsKl0A5OyQhpYsNAHycUAk3is2c9Wu4+swQuS9Skael
         tn4gkbFnz5/aNc6Oo1vCpbi/ZqHkTp++MPA7pQnLAqC5aTEGxDNP283SkFIlMYEB3JX2
         4iV9XozPba7XlYXe0GsIGgs35rNQiMaCX3SW4F9rffnrrbNvmYGjqypiQUQgfsE1PjLS
         JlqVIGeexBpg3fKKL3r7XwtvPGPlsVWLZO9yIpAPBpqnUa1N/BB4wpa+bUb4ZGm3za71
         jnFwQINuO7n5ZpPSmKpbElc0IjYdEKQPVO+GbOOoqQj+EfGJXS0Mb4bBZaNvkFlE+Wm1
         qsLg==
X-Forwarded-Encrypted: i=1; AL+hErFVagZ7zb/dCRxKgXeICM7BZ5UnWygUDuuQ11FOAuSzAW2ENCNCU+cWRhzv+7SDbXPB0z0yjcvItSG/CuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8igge5YrNtPEIxtLokSaP6lQnk9xM0e6KVoWCsCy/m8BsVfCp
	gnqyDSWOF+B4hYpESLIzgTnyZdqLb1FRAW2fMwIp4369GN3mEM30t82+zb9IPwANs+A=
X-Gm-Gg: AYBFou0GXJbKBNH9vvBKc7di2IJWLBa/jwiWvYO3CdFfmO9A38UlY6/bl6c07ayNW4V
	yQjqQdVeNFXeewXY4EXmbA40Sear+p81cHzQA286dSVgqNjUvlR/iomDlytx2jQMigAYRSNv5rg
	ltjTAvzSn8ie5uEgDUo06C19EwaCakIOJniNlq688K4jGKnuD2oGYHFLY+2v4QtBIYWL9AJCcMj
	xCdg07YEvY3G8ZYA3BA9qlNWOekLASK/Na4r8PwHnCIKSnLclwDWnwtIq8/bwboytu0+qf6bsGg
	Y4gCXl7dbajyLldDWeezRrQ/xOFSg8g73ZTdpdLNREQzcsuOY4DYeh884N9ufn16pO9tdPrUF0s
	mmoCuSN56c016BuKfOT//L8EGuu/bHjpLQ4o+IE60e2yfx4YLBa4eRoCq02BJ/mBALn9g7grFHS
	mGd4WrVKsqT79ME0BkhUYgdYLCB31Vs31RX0MKXo0o1NCsAmU+Gqp0xRwvjBsSBtGulp0EdacQH
	h6KgFDJBdcSgwG5mCwYmavSha2OftB0y2O8EoCKnt4J/ReOzjJ06lJ5pTK1EDPn4ae+CRXxVR8P
	KqdI4knAowbDuCbZAW2rVv5v0u6tHIZ3E64RJJv/+dB5f4RFx01camJyEtsmuzWFuDa1mDlA9so
	=
X-Received: by 2002:a05:600c:3b98:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb88826810mr1542285e9.11.1795107268658;
        Thu, 19 Nov 2026 08:54:28 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:28 -0800 (PST)
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
Subject: [PATCH v3 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Thu, 19 Nov 2026 17:54:15 +0100
Message-Id: <20261119165420.24466-6-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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

