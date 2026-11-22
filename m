Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340056;
	b=e164c5xoM5buG1uhnViyYCfA41YitTSXDS448AmeBWH9bHwCHbNBipwWosVx4f1QyLxs
	 KVYbbpPmIQiQMBqTf/EbI3HnvK+C60r65z9Ai2U2yPqKy2sSyHeIPuqn6kZJO9f/+fHEB
	 ggjRhy8nwPEQhMx8f/Ze7FJ9GG6Ae7HGnzttL8kC9k6zAw6LPVY2TSyqikIeYppsDsOO9
	 tSfzOs359IaCSnveThaUupeAn5S7XF4NEj3mzHYZrJGpSzRow7FTlYQCxiL3GewgGNQnm
	 LVqVVEn+K65+XKnvaEORrfo0M+2Oj0S/6xFuDsnQ3vWWb4SXxkbKBM8nEeswvCOJqsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+2xrspYuu+FL47jccjzdtxpgEf6qiE/xXRLpMfETdrM=;
	b=noAlHjah6WY4b8c66FxB5iIAYc4F+e65/8VrDsjeesNkrjycrpcnY+JbmaEq1mem4SB+
	 r2U3oYj55DoVvIl5MamnL4jH4NiXdCyjgzYnuPA1tSNxz7XRambK2olDYOG/+Dah4pWSf
	 lhB8xLhyN55NyBTD2nIkI9c1FJLJxkS9c+GdIQ39OJ+6ml7/pURzx4cAFnvH0QGE+COLy
	 XYLftvUAes30BiRZF8AqVFQkflaqWrIGobgGh+bi9gvLL8057OnvYqFFTS51aYhvwL/cV
	 gaXf65Yx65VR0zJ8Psd6P8v+xxdptq7TuU5JuzIpzg3GKicBndG3OD955chPbq5N9sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bmjpe7XS;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C2C606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C2C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bmjpe7XS
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso17340275e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795340054; x=1795944854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2xrspYuu+FL47jccjzdtxpgEf6qiE/xXRLpMfETdrM=;
        b=bmjpe7XSigsNo/RmiY/EbMiiQNhopFLdUm/1jAJvD+kMQAWiRIwUHz+tmo3w/+zYHr
         fMQDJYRSqoj1mI8kaASKDRaoyWIZboEO/enrNzaavHO4BbahVNAYjcWCsi0W3WCSDfcX
         XYFmLk9tITHWlRWyb8N9hQ7IklRjgIn9NdQLI6Oykom4Z4uPKXNpvk1PQCDIheMkbO6k
         3u8YwMJyYsZxnoR1h5HB+DeGrSW2cHlLfueuH+kWJ1VlbF59wMtBehHTL3tS8SUL9rPo
         gylPAHC/ETCivXluHRfK6894vm6BwUy+sfxydJT6fGfoLnye3Ze42R6+UfXwtRJZ5zNf
         beVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340054; x=1795944854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2xrspYuu+FL47jccjzdtxpgEf6qiE/xXRLpMfETdrM=;
        b=2jou6aO74yeInW0UIacNNOScfWCqHEUkUiw2Lq0uw9LqrBt7FxooE7A2OfWx6eWyuz
         rg+OPCVbFK3PqISZ4nf9sCh5fn25wqmG2pwizlrLAmq6SzU3DIolfg8xX5c5HAdu+dzI
         EyW3qX2ruGnEfaHj5lY8rdl9xexpBNzfYNm9+IDenrmhlYN05rHb+zMfztWF1tzEi4AA
         iwxhHT1nOcc5rLJzjkQuvZkT0uNFEqdzlShN98bzTAkB1mftikrb0KOLdrYWmb+vTMo8
         mD5S/ZQsah/jR82MWaw8/Awawdql1mBxP+dlvf1uVMlfY/DUihRVptRXJ8dVRlb9YwWG
         zT5g==
X-Forwarded-Encrypted: i=1; AL+hErEzu0cxkWisdm4txfX37LJllsrM80thRReGyO4fanlnD0g6hme4ZYDcR0F1q6KxL7uKeKLkv0ttZaZs/DQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GLvrpUSLQAqGE1tnz+DgXRHA/BP4RfVL5fEJLK8tTmPzpjAgA
	mbpG3UDHrhtlrx7DDs6G87yOObYpANdOtluXJPzWNcsdKeCR8jyg0SwWn+JeJjdjmiM=
X-Gm-Gg: AZFdTZeqoa/fWAKBYlH7LM+JVWKukT5PaoucfrbXNRvCL/tqokxtfKn8rTfny8fhPWf
	HffFmYn3NvCM9plQCliwrlK9Q4S/DhAyJp50drQ1764CjXTOwrdPqTkuwZo6K1zQG7pEptjdagH
	D370d/R7seEjEi9r03+mmgb7KQa4mDXhxz0q4cXOR08erDWMNN73bMhzbcF62yxFZw2H3cX6Ev6
	0sr43yX/sO0zWdVPWTIStXjAnmjuiFCGY1Y4sgzeWRlTPPwmPU8CZX0MKHDXWXmdvSn6ne0GQsJ
	iCNPjywwY1FaPMazJVTMtaNa9uQkqEt2Lg+EkVGnFounWWKjb/528nMnxg0bi9UpIqkeKLd2AfS
	oj5STOxQSTxEoqfak6DNGYTpkWqpoCqzbwsRbNtAcAG5X+YLniWKJZxQUZ84p/lwf5kOp/wJgzK
	O2gOa1Msif2kAmJ46M2n7GpPCjkBKaYirzUi40B0pTE2R52z5RrI8qBgVrC2/Fx6mfql0Po9/9H
	zqBVNDjt+ArF2YcraS5WUXbfRQJVY/WD+LI56wxBQGu+Cr5O07nrQhpm7VYIzOeQl21xRM1HTCt
	2MB2yBPQlLKfMHusIRToG70MULqqRlFIPRE0TKqMWu9FuUNlkHXTSA1NB/ieVFKdc65aX1BvnGt
	aME31U3mBz/g=
X-Received: by 2002:a05:600c:530f:b0:4bb:68b9:f615 with SMTP id 5b1f17b1804b1-4bb88810b22mr173144325e9.17.1795340054581;
        Sun, 22 Nov 2026 01:34:14 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm291475195e9.6.2026.11.22.01.34.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 01:34:14 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: iio: magnetometer: Add MEMSIC MMC5603
Date: Sun, 22 Nov 2026 10:34:12 +0100
Message-ID: <20261122093412.71604-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The MMC5603NJ is listed in trivial-devices.yaml, which allows no
properties besides the register address and interrupts. Boards need to
describe how the sensor is oriented, and the supply it runs from, which
is often switched on wearables.

Give it a binding of its own with a mount-matrix and its single VDD
supply, the package having no separate I/O supply pin.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---

Notes:
    Checked with dtschema 2026.9: the steps of dt_binding_check run by hand (host make too old), yamllint and dt-check-style --mode=strict.

 .../iio/magnetometer/memsic,mmc5603.yaml      | 45 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5603.yaml

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5603.yaml b/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5603.yaml
new file mode 100644
index 000000000000..039f53a5f912
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5603.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/magnetometer/memsic,mmc5603.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MEMSIC MMC5603NJ 3-axis magnetic sensor
+
+maintainers:
+  - Gerard Marull-Paretas <gerard@teslabs.com>
+
+properties:
+  compatible:
+    const: memsic,mmc5603
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator that provides power to the sensor
+
+  mount-matrix:
+    description: an optional 3x3 mounting rotation matrix.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        magnetometer@30 {
+            compatible = "memsic,mmc5603";
+            reg = <0x30>;
+            vdd-supply = <&vdd_1v8_reg>;
+            mount-matrix = "-1", "0", "0",
+                           "0", "1", "0",
+                           "0", "0", "-1";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a8b2b9deade4..17a32dd8772e 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -261,8 +261,6 @@ properties:
           - meas,tsys01
             # MEMSIC magnetometer
           - memsic,mmc35240
-            # MEMSIC 3-axis magnetometer
-          - memsic,mmc5603
             # MEMSIC 3-axis magnetometer (Support I3C HDR)
           - memsic,mmc5633
             # MEMSIC 3-axis accelerometer

base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

